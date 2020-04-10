<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-12
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-12">
            <div id="common_group_code_grid"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="common_code_grid"></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let commonCodeSelectedGroupCode = null;
        let commonCodeSearchTextId = 'common-group-code-search';
        let $commonCodeTopGrid;
        let commonCodeTopGridId = 'common_group_code_grid';
        let commonCodeTopColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', editable: true},
            {title: '그룹명', dataType: 'string', dataIndx: 'HIGH_NM'},
            {
                title: '삭제여부', dataType: 'select', dataIndx: 'DEL_YN_NM',
                editor: {
                    type: 'select',
                    mapIndices: {name: 'DEL_YN_NM', id: 'DEL_YN'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function (ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $commonCodeTopGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['DEL_YN'] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        let commonCodeTopPostData = {queryId: 'selectCommonGroupCodeList'};
        let commonCodeTopInsertQueryList = ['insertCommonGroupCode'];
        let commonCodeTopUpdateQueryList = ['updateCommonGroupCode'];
        let commonCodeTopToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '그룹명', attr: "id='common-group-code-search'"
                },
                {
                    type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                        'click': function (evt, ui) {
                            commonCodeTopPostData.HIGH_NM = $('#' + commonCodeSearchTextId).val();

                            fnRequestGidData($commonCodeTopGrid, commonCodeTopPostData);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let postData = { 'queryId': 'selectCommoGroupNextSequence'};
                            let parameter = {'url': '/json-list', 'data': postData};

                            fnPostAjax(function (data, callFunctionParam) {
                                let seq = data.list[0].SEQ;
                                let totalRecords = $commonCodeTopGrid.pqGrid('option', 'dataModel.data').length;

                                $commonCodeTopGrid.pqGrid('addNodes', [{'HIGH_CD': seq}], totalRecords + 1);
                            }, parameter, '');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            fnModifyPQGrid($commonCodeTopGrid, commonCodeTopInsertQueryList, commonCodeTopUpdateQueryList);
                        }
                    }
                }
            ]
        };
        let commonCodeTopObj = {
            collapsible: false,
            resizable: true,
            title: '그룹코드',
            numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            columnTemplate: {
                align: 'center', // haeder + cell
                // halign: 'center', // only header
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: commonCodeTopColModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'POST',
                url: '/paramQueryGridSelect',
                postData: commonCodeTopPostData,
                recIndx: 'HIGH_CD',
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            toolbar: commonCodeTopToolbar,
            cellClick: function (event, ui) {
                commonCodeSelectedGroupCode = commonCodeBotPostData.HIGH_CD = ui.rowData.HIGH_CD;
                let parameter = {'url': '/getCommonCodeList', 'data': commonCodeBotPostData};

                fnPostAjax(function (data, callFunctionParam) {
                    $commonCodeBotGrid.pqGrid('option', 'dataModel.data', data.data);
                    $commonCodeBotGrid.pqGrid('refreshDataAndView');
                }, parameter, '');
            }
        };
        $commonCodeTopGrid = $('#' + commonCodeTopGridId).pqGrid(commonCodeTopObj);
        let $commonCodeBotGrid;
        let commonCodeBotGridId = 'common_code_grid';
        let commonCodeBotColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', hidden: true},
            {title: '코드', dataType: 'string', dataIndx: 'CODE_CD'},
            {title: '코드명(한글)', dataType: 'string', dataIndx: 'CODE_NM_KR'},
            {title: '코드명(영문)', dataType: 'string', dataIndx: 'CODE_NM_EN'},
            {
                title: '삭제여부', dataType: 'select', dataIndx: 'DEL_YN_NM',
                editor: {
                    type: 'select',
                    mapIndices: {name: 'DEL_YN_NM', id: 'DEL_YN'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function (ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $commonCodeBotGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['DEL_YN'] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            },
            {title: 'Sort', dataType: 'int', dataIndx: 'SORT_NUM'},
            {title: 'ETC Code', dataType: 'string', dataIndx: 'REF_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        let commonCodeBotPostData = {queryId: 'selectCommonCodeList'};
        let commonCodeBotToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $commonCodeBotGrid.pqGrid('addNodes', [{'HIGH_CD': commonCodeSelectedGroupCode}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let gridInstance = $commonCodeBotGrid.pqGrid('getInstance').grid;
                            //추가 또는 수정된 값이 있으면 true
                            if (gridInstance.isDirty()) {
                                let changes = gridInstance.getChanges({format: 'byVal'});
                                let parameters = {
                                    'url': '/commonCodeModifyGrid',
                                    'data': {data: JSON.stringify(changes)}
                                };

                                fnPostAjax(function (data, callFunctionParam) {
                                    $commonCodeBotGrid.pqGrid('refreshDataAndView');
                                }, parameters, '');
                            }
                        }
                    }
                }
            ]
        };
        let commonCodeBotObj = {
            collapsible: false,
            resizable: true,
            title: '공통코드',
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: commonCodeBotColModel,
            toolbar: commonCodeBotToolbar,
            dataModel: {
                recIndx: 'CODE_CD'
            }
        };
        $commonCodeBotGrid = $('#' + commonCodeBotGridId).pqGrid(commonCodeBotObj);
    });
</script>