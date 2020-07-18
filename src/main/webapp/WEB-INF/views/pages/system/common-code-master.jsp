<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-12
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="page onegrid">
    <div class="topWrap">
        <form class="form-inline" id="common_group_code_search_form" name="common_group_code_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectCommonGroupCodeList">
            <div class="hWrap">
                <span class="ipu_wrap">
                    <label for="sel_group_code_nm">그룹 코드 이름</label>
                    <input type="text" name="sel_group_code_nm" id="sel_group_code_nm" placeholder="그룹 코드 이름" value="" class="pd-left5 wd_200">
                </span>
                <div class="rightSpan">
                    <span class="buttonWrap">
                        <button type="button" id="commonGroupCodeSearchBtn" class="defaultBtn radius blue">검색</button>
                    </span>
                </div>
            </div>
        </form>
        <form class="form-inline" id="common_code_search_form" name="common_code_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectCommonCodeList">
            <input type="hidden" name="HIGH_CD" id="HIGH_CD" value="">
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableTopWrap">
            <div class="buttonWrap right_sort">
                <button type="button" id="commonGroupCodeAddBtn" class="defaultBtn radius">추가</button>
                <button type="button" id="commonGroupCodeSaveBtn" class="defaultBtn radius green">저장</button>
            </div>
            <div class="conWrap">
                <div id="common_group_code_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="common_group_code_total_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
        <div class="tableOneSearchBottomWrap">
            <div class="buttonWrap right_sort">
                <button type="button" id="commonCodeAddBtn" class="defaultBtn radius">추가</button>
                <button type="button" id="commonCodeSaveBtn" class="defaultBtn radius green">저장</button>
            </div>
            <div class="conWrap">
                <div id="common_code_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="common_code_total_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    let $commonCodeTopGrid;
    let commonCodeTopGridId = 'common_group_code_grid';

    let $commonCodeBotGrid;
    let commonCodeBotGridId = 'common_code_grid';

    // let commonCodeSearchTextId = 'common-group-code-search';

    let $commonGroupCodeSearchBtn = $("#commonGroupCodeSearchBtn");

    let $commonGroupCodeAddBtn = $("#commonGroupCodeAddBtn");
    let $commonGroupCodeSaveBtn = $("#commonGroupCodeSaveBtn");

    let $commonCodeAddBtn = $("#commonCodeAddBtn");
    let $commonCodeSaveBtn = $("#commonCodeSaveBtn");

    $(function () {
        'use strict';

        let commonCodeTopColModel = [
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
        let commonCodeTopPostData = fnFormToJsonArrayData('common_group_code_search_form');
        // let commonCodeTopToolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '그룹명', attr: "id='common-group-code-search'",  listener: {
        //                 'keyup': function (evt, ui) {
        //                     if (evt.keyCode === 13 && evt.key === 'Enter') {
        //                         reloadCommonCodeTopGrid();
        //                     }
        //                 }
        //             }
        //
        //         },
        //         {
        //             type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
        //                 'click': function (evt, ui) {
        //                     reloadCommonCodeTopGrid();
        //                 }
        //             }
        //         },
        //         {
        //             type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     let totalRecords = $commonCodeTopGrid.pqGrid('option', 'dataModel.data').length;
        //                     $commonCodeTopGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        //                 }
        //             }
        //         },
        //         {
        //             type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     const commonCodeTopInsertQueryList = ['insertCommonGroupCode'];
        //                     const commonCodeTopUpdateQueryList = ['updateCommonGroupCode'];
        //                     fnModifyPQGrid($commonCodeTopGrid, commonCodeTopInsertQueryList, commonCodeTopUpdateQueryList);
        //                 }
        //             }
        //         }
        //     ]
        // };

        let commonCodeTopObj = {
            minHeight: "auto",
            height: 480,
            width: "auto",
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            toolbar: false,
            colModel: commonCodeTopColModel,
            dataModel: {
                recIndx: 'HIGH_CD', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: commonCodeTopPostData,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $commonCodeTopGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#common_group_code_total_records').html(totalRecords);
            },
            complete: function (event, ui) {
                $commonCodeTopGrid.pqGrid('setSelection', {rowIndx: 0});
            },
            rowSelect: function( event, ui ) {
                let highCd = ui.addList[0].rowData.HIGH_CD;
                $("#common_code_search_form").find("#HIGH_CD").val(highCd);
                $commonCodeBotGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('common_code_search_form');
                } );
                $commonCodeBotGrid.pqGrid("refreshDataAndView");
            }
        };
        $commonCodeTopGrid = $('#' + commonCodeTopGridId).pqGrid(commonCodeTopObj);

        $commonGroupCodeSearchBtn.click(function(e){
            $commonCodeTopGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('common_group_code_search_form');
            } );
            $commonCodeTopGrid.pqGrid("refreshDataAndView");
        });

        $commonGroupCodeAddBtn.click(function(e){
            let totalRecords = $commonCodeTopGrid.pqGrid('option', 'dataModel.data').length;
            $commonCodeTopGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $commonGroupCodeSaveBtn.click(function(e){
            let commonCodeTopInsertQueryList = ['insertCommonGroupCode'];
            let commonCodeTopUpdateQueryList = ['updateCommonGroupCode'];
            fnModifyPQGrid($commonCodeTopGrid, commonCodeTopInsertQueryList, commonCodeTopUpdateQueryList);
        });

        let commonCodeBotColModel = [
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
        let commonCodeBotPostData = fnFormToJsonArrayData('common_code_search_form');
        // let commonCodeBotToolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     $commonCodeBotGrid.pqGrid('addNodes', [{'HIGH_CD': commonCodeBotPostData.HIGH_CD}], 0);
        //                 }
        //             }
        //         },
        //         {
        //             type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     let gridInstance = $commonCodeBotGrid.pqGrid('getInstance').grid;
        //                     //추가 또는 수정된 값이 있으면 true
        //                     if (gridInstance.isDirty()) {
        //                         let changes = gridInstance.getChanges({format: 'byVal'});
        //                         let parameters = {
        //                             'url': '/commonCodeModifyGrid',
        //                             'data': {data: JSON.stringify(changes)}
        //                         };
        //                         fnPostAjax(function (data, callFunctionParam) {
        //                             reloadCommonCodeBotGrid();
        //                         }, parameters, '');
        //                     }
        //                 }
        //             }
        //         }
        //     ]
        // };

        let commonCodeBotObj = {
            minHeight: "auto",
            height: 230,
            width: "auto",
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            toolbar: false,
            strNoRows: g_noData,
            colModel: commonCodeBotColModel,
            dataModel: {
                recIndx: 'CODE_CD', location: "remote", dataType: "json", method: "POST", url: "/getCommonCodeList",
                postData: commonCodeBotPostData,
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $commonCodeBotGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#common_code_total_records').html(totalRecords);
            }
        };
        $commonCodeBotGrid = $('#' + commonCodeBotGridId).pqGrid(commonCodeBotObj);

        $commonCodeAddBtn.click(function(e){
            $commonCodeBotGrid.pqGrid('addNodes', [{'HIGH_CD': $("#common_code_search_form").find("#HIGH_CD").val()}], 0);
        });

        $commonCodeSaveBtn.click(function(e){

            let gridInstance = $commonCodeBotGrid.pqGrid('getInstance').grid;
            //추가 또는 수정된 값이 있으면 true
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let parameters = {
                    'url': '/commonCodeModifyGrid',
                    'data': {data: JSON.stringify(changes)}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    $commonCodeBotGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('common_code_search_form');
                    } );
                    $commonCodeBotGrid.pqGrid("refreshDataAndView");
                }, parameters, '');
            }

            // let commonCodeTopInsertQueryList = ['insertCommonGroupCode'];
            // let commonCodeTopUpdateQueryList = ['updateCommonGroupCode'];
            // fnModifyPQGrid($commonCodeBotGrid, commonCodeTopInsertQueryList, commonCodeTopUpdateQueryList);
            // $commonCodeBotGrid.pqGrid("option", "dataModel.postData", function(ui){
            //     return fnFormToJsonArrayData('common_code_search_form');
            // } );
            // $commonCodeBotGrid.pqGrid("refreshDataAndView");
        });

        // const reloadCommonCodeTopGrid = function () {
        //     commonCodeTopPostData.HIGH_NM = $('#' + commonCodeSearchTextId).val();
        //     $commonCodeTopGrid.pqGrid('option', 'dataModel.postData', function (ui) {
        //         return commonCodeTopPostData;
        //     });
        //     $commonCodeTopGrid.pqGrid('refreshDataAndView');
        // };

        // let reloadCommonCodeBotGrid = function () {
        //     $commonCodeBotGrid.pqGrid("option", "dataModel.postData", function(ui){
        //         return fnFormToJsonArrayData('common_code_search_form');
        //     } );
        //     $commonCodeBotGrid.pqGrid("refreshDataAndView");
        // };

    });
</script>