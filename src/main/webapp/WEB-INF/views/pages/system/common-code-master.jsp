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
        const commonCodeSearchTextId = 'common-group-code-search';
        let $commonCodeTopGrid;
        const commonCodeTopGridId = 'common_group_code_grid';
        const commonCodeTopColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', editable: false},
            {title: '그룹명', dataType: 'string', dataIndx: 'HIGH_NM'},
            {
                title: '삭제여부', dataType: 'select', dataIndx: 'DEL_YN',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                },
                render: function (ui) {
                    let delYn = fnGetCommCodeGridSelectBox('1042');
                    let index = delYn.findIndex(function (element) {
                        return element.value == ui.cellData;
                    });

                    if (index < 0) {
                        return ui.cellData;
                    } else {
                        return delYn[index].text;
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        const commonCodeTopPostData = {queryId: 'selectCommonGroupCodeList'};
        const commonCodeTopToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '그룹명', attr: "id='common-group-code-search'",  listener: {
                        'keyup': function (evt, ui) {
                            if (evt.keyCode === 13 && evt.key === 'Enter') {
                                reloadCommonCodeTopGrid();
                            }
                        }
                    }

                },
                {
                    type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                        'click': function (evt, ui) {
                            reloadCommonCodeTopGrid();
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let totalRecords = $commonCodeTopGrid.pqGrid('option', 'dataModel.data').length;
                            $commonCodeTopGrid.pqGrid('addNodes', [{}], totalRecords + 1);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const commonCodeTopInsertQueryList = ['insertCommonGroupCode'];
                            const commonCodeTopUpdateQueryList = ['updateCommonGroupCode'];

                            fnModifyPQGrid($commonCodeTopGrid, commonCodeTopInsertQueryList, commonCodeTopUpdateQueryList);
                        }
                    }
                }
            ]
        };
        const commonCodeTopObj = {
            collapsible: false,
            resizable: true,
            title: '그룹코드',
            numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'},
            scrollModel: {autoFit: true},
            strNoRows: g_noData,
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
            complete: function (event, ui) {
                $commonCodeTopGrid.pqGrid('setSelection', {rowIndx: 0});
            },
            rowSelect: function( event, ui ) {
                let highCd = ui.addList[0].rowData.HIGH_CD;

                if (highCd) {
                    commonCodeBotPostData.HIGH_CD = highCd;
                    reloadCommonCodeBotGrid();
                } else {
                    $commonCodeBotGrid.pqGrid('option', 'dataModel.data', []);
                    $commonCodeBotGrid.pqGrid('refreshView');
                }
            }
        };
        $commonCodeTopGrid = $('#' + commonCodeTopGridId).pqGrid(commonCodeTopObj);
        let $commonCodeBotGrid;
        const commonCodeBotGridId = 'common_code_grid';
        const commonCodeBotColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', hidden: true},
            {title: '코드', dataType: 'string', dataIndx: 'CODE_CD'},
            {title: '코드명(한글)', dataType: 'string', dataIndx: 'CODE_NM_KR'},
            {title: '코드명(영문)', dataType: 'string', dataIndx: 'CODE_NM_EN'},
            {
                title: '삭제여부', dataType: 'select', dataIndx: 'DEL_YN',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                },
                render: function (ui) {
                    let delYn = fnGetCommCodeGridSelectBox('1042');
                    let index = delYn.findIndex(function (element) {
                        return element.value == ui.cellData;
                    });

                    if (index < 0) {
                        return ui.cellData;
                    } else {
                        return delYn[index].text;
                    }
                }
            },
            {title: 'Sort', dataType: 'int', dataIndx: 'SORT_NUM'},
            {title: 'ABBR_NM', dataType: 'string', dataIndx: 'ABBR_NM'},
            {title: 'ETC Code', dataType: 'string', dataIndx: 'REF_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        const commonCodeBotPostData = {queryId: 'selectCommonCodeList'};
        const commonCodeBotToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $commonCodeBotGrid.pqGrid('addNodes', [{'HIGH_CD': commonCodeBotPostData.HIGH_CD}], 0);
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
                                    reloadCommonCodeBotGrid();
                                }, parameters, '');
                            }
                        }
                    }
                }
            ]
        };
        const commonCodeBotObj = {
            collapsible: false,
            resizable: true,
            title: '공통코드',
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            strNoRows: g_noData,
            colModel: commonCodeBotColModel,
            toolbar: commonCodeBotToolbar,
            dataModel: {
                recIndx: 'CODE_CD'
            }
        };
        $commonCodeBotGrid = $('#' + commonCodeBotGridId).pqGrid(commonCodeBotObj);

        const reloadCommonCodeTopGrid = function () {
            commonCodeTopPostData.HIGH_NM = $('#' + commonCodeSearchTextId).val();

            $commonCodeTopGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return commonCodeTopPostData;
            });
            $commonCodeTopGrid.pqGrid('refreshDataAndView');
        };

        const reloadCommonCodeBotGrid = function () {
            let parameter = {'url': '/getCommonCodeList', 'data': commonCodeBotPostData};

            fnPostAjax(function (data, callFunctionParam) {
                $commonCodeBotGrid.pqGrid('option', 'dataModel.data', data.data);
                $commonCodeBotGrid.pqGrid('refreshView');
            }, parameter, '');
        };

    });
</script>