<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_history_search_form" name="item_order_history_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectItemOrderHistoryList">
            <input type="hidden" name="MATERIAL_ORDER_SEQ" id="MATERIAL_ORDER_SEQ" value="">
            <input type="hidden" name="CONCAT_SEQ" id="CONCAT_SEQ" value="">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="COMP_CD" class="label_100">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_100">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MODULE_NM">견적번호</label><input type="text" name="MODULE_NM" id="MODULE_NM" class="wd_200" value="" title="견적번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" class="wd_200" value="" title="품명"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnItemOrderHistorySearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="MANAGE_NUM">관리번호</label><input type="text" name="MANAGE_NUM" id="MANAGE_NUM" class="wd_200" value="" title="관리번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">소재주문번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200" value="" title="소재주문업체"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200" value="" title="소재주문업체"></span>
                        <span class="gubun"></span>
                    </li>

                </ul>
                <li class="">
                    <span class="txt_span pd-right20">Option</span>
                    <span class="chk_box"><input id="pr_ex1" type="checkbox"><label for="pr_ex1"> 발송완료</label></span>
                    <span class="chk_box"><input id="pr_ex2" type="checkbox"><label for="pr_ex2"> 최신차수</label></span>
                    <span class="gubun"></span>
                    <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>
                        </span>
                    <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_1" name=""><label for="fr_1001_1">오늘</label>
                        </span>
                    <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_2" name=""><label for="fr_1001_2">현재월</label>
                        </span>
                    <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_3" name=""><label for="fr_1001_3">3개월</label>
                        </span>
                    <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" name="dateOneIp" id="dateOneIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
                            </span>
                        <span class="nbsp">~</span>
                        <span class="calendar_span">
                                <input type="text" name="dateTwoIp" id="dateTwoIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
                            </span>
                    </div>
                    <span class="chk_box"><input id="pr_ex" type="checkbox"><label for="pr_ex">선택</label></span>
                </li>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_30Wrap">
                    <div class="buttonWrap right_sort">
                        <span class="d-inline">
                            <button type="button" class="defaultBtn radius" id="btnItemOrderHistoryExcel">주문서 출력</button>
                            <button type="button" class="defaultBtn radius red" id="btnItemOrderHistoryCancel">주문취소</button>
                        </span>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_history_left_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_history_left_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
                <div class="right_60Wrap">
                    <div class="buttonWrap">
                        <div class="right_sort">
                            <button type="button" class="defaultBtn radius green" id="btnItemOrderHistorySave">검사 입고</button>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_history_right_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_history_right_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_history_hidden_form" name="item_order_history_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderHistoryListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
    <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
    <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
</form>

<form id="item_order_history_inspection_hidden_form" name="item_order_history_inspection_hidden_form">
</form>

<script type="text/javascript">
    'use strict';
    let itemOrderHistorySelectedRowIndex;
    let itemOrderHistoryLeftGrid = $("#item_order_history_left_grid");
    let itemOrderHistoryRightGrid = $("#item_order_history_right_grid");

    $(function () {
        let itemOrderHistoryLeftColModel= [
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 } ,
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', width: 100 } ,
            {title: '총수량', dataType: 'string', dataIndx: 'ORDER_QTY' } ,
            {title: '주문일시', dataType: 'date', dataIndx: 'ORDER_DT', width: 120 },
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD' , hidden: true}
        ];

        let itemOrderHistoryRightColModel= [
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 , editable: false, hidden: true} ,
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', width: 35, editable: false},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM', width: 60, editable: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', width: 60, editable: false},
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT', width: 70, editable: false},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 30 , editable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', minWidth: 60 , editable: false},
            {title: '요청 사항', align: "center", colModel: [
                    {title: '요청 사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 130},
                    {title: '비고', dataType: 'string', dataIndx: 'ORDER_NOTE', minWidth: 120},
                ]
            },
            /*{title: '금액.', dataType: 'string', dataIndx: 'ORDER_AMT', width: 50, format: '#,###',
                editable: function(ui){
                    if(ui.rowData.IN_YN == 'Y'){
                        return false;
                    }
                    return true;
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}
            },*/
            {title: '수입검사', dataType: 'string', align: "center", colModel: [
                    {title: '소재', dataType: 'string', dataIndx: 'INSPECT_MATERIAL_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let html = ui.rowData.IN_YN == 'N' ?
                                '<a href="#" id="itemOrderHistoryMaterialInspection"><span class="ui-icon '+icon+'"></span></a>' :
                                '<span class="ui-icon '+icon+'"></span>';

                            return html;
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#itemOrderHistoryMaterialInspection").bind("click", function () {
                                if(ui.rowData.IN_YN == 'Y') return false;

                                let returnVal = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'N' : 'Y';
                                let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                                let ORDER_AMT = ui.rowData.ORDER_AMT;
                                let INSPECT_NOTE = ui.rowData.INSPECT_NOTE;

                                let parameter = {
                                    'queryId': 'updateItemOrderHistoryInspection',
                                    'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                                    'INSPECT_MATERIAL_YN': returnVal,
                                    'ORDER_AMT': ORDER_AMT,
                                    'INSPECT_NOTE': INSPECT_NOTE
                                };
                                fnInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                    {title: '외관', dataType: 'string', dataIndx: 'INSPECT_SURFACE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let html = ui.rowData.IN_YN == 'N' ?
                                '<a href="#" id="itemOrderHistorySurfaceInspection"><span class="ui-icon '+icon+'"></span></a>' :
                                '<span class="ui-icon '+icon+'"></span>';

                            return html;
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#itemOrderHistorySurfaceInspection").bind("click", function () {
                                if(ui.rowData.IN_YN == 'Y') return false;

                                let returnVal = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'N' : 'Y';
                                let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                                let ORDER_AMT = ui.rowData.ORDER_AMT;
                                let INSPECT_NOTE = ui.rowData.INSPECT_NOTE;

                                let parameter = {
                                    'queryId': 'updateItemOrderHistoryInspection',
                                    'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                                    'INSPECT_SURFACE_YN': returnVal,
                                    'ORDER_AMT': ORDER_AMT,
                                    'INSPECT_NOTE': INSPECT_NOTE
                                };
                                fnInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                    {title: '치수', dataType: 'string', dataIndx: 'INSPECT_SIZE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let html = ui.rowData.IN_YN == 'N' ?
                                '<a href="#" id="itemOrderHistorySizeInspection"><span class="ui-icon '+icon+'"></span></a>' :
                                '<span class="ui-icon '+icon+'"></span>';

                            return html;
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#itemOrderHistorySizeInspection").bind("click", function () {
                                if(ui.rowData.IN_YN == 'Y') return false;

                                let returnVal = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'N' : 'Y';
                                let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                                let ORDER_AMT = ui.rowData.ORDER_AMT;
                                let INSPECT_NOTE = ui.rowData.INSPECT_NOTE;

                                let parameter = {
                                    'queryId': 'updateItemOrderHistoryInspection',
                                    'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                                    'INSPECT_SIZE_YN': returnVal,
                                    'ORDER_AMT': ORDER_AMT,
                                    'INSPECT_NOTE': INSPECT_NOTE
                                };
                                fnInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '검사 비고', dataType: 'string', dataIndx: 'INSPECT_NOTE',
                editable: function (ui) {
                    if (ui.rowData.IN_YN == 'Y') {
                        return false;
                    }
                    return true;
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}
            },
            {title: '입고', dataType: 'string', dataIndx: 'IN_YN', width: 40, editable: false,
                render: function(ui){
                    let icon = ui.rowData.IN_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                    return '<span class="ui-icon '+icon+'"></span>';
                }
            },
            {title: '입고 일시', dataType: 'string', dataIndx: 'IN_DT', width: 120, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 140, editable: false},
            {title: '파트', dataType: 'string', dataIndx: 'PART_NUM', width: 30, editable: false},
        ];

        itemOrderHistoryLeftGrid.pqGrid({
            height: '100%',
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#item_order_history_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            sortable: false,
            trackModel: {on: true},
            colModel: itemOrderHistoryLeftColModel,
            showTitle: false,
            title: false,
            complete: function(event, ui) {
                //this.flex();
                let data = itemOrderHistoryLeftGrid.pqGrid('option', 'dataModel.data');

                $('#item_order_history_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    itemOrderHistorySelectedRowIndex = [];
                    let itemOrderHistoryGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let itemOrderHistoryGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (itemOrderHistoryGridFirstRow === itemOrderHistoryGridLastRow) {
                        itemOrderHistorySelectedRowIndex[0] = itemOrderHistoryGridFirstRow;
                    } else {
                        for (let i = itemOrderHistoryGridFirstRow; i <= itemOrderHistoryGridLastRow; i++) {
                            itemOrderHistorySelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let MATERIAL_ORDER_NUM = ui.addList[0].rowData.MATERIAL_ORDER_NUM;
                let MATERIAL_COMP_CD = ui.addList[0].rowData.MATERIAL_COMP_CD;

                let MATERIAL_ORDER_SEQ = ui.addList[0].rowData.MATERIAL_ORDER_SEQ;
                let CONCAT_SEQ = ui.addList[0].rowData.CONCAT_SEQ === undefined ? "0" : ui.addList[0].rowData.CONCAT_SEQ;

                let IN_YN = ui.addList[0].rowData.IN_YN;

                $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                $("#item_order_history_hidden_form #MATERIAL_COMP_CD").val(MATERIAL_COMP_CD);

                $("#item_order_history_search_form #MATERIAL_ORDER_SEQ").val(MATERIAL_ORDER_SEQ);
                $("#item_order_history_search_form #CONCAT_SEQ").val(CONCAT_SEQ);


                if(IN_YN == 'Y'){
                    $("#btnItemOrderHistoryCancel").attr("disabled", true);
                }else {
                    $("#btnItemOrderHistoryCancel").attr("disabled", false);
                }
                selectItemOrderHistoryRightList();
                //}
            }
        });

        selectItemOrderHistoryRightList();
        function selectItemOrderHistoryRightList() {
            itemOrderHistoryRightGrid.pqGrid({
                height: '100%',
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_history_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                postRenderInterval: -1,
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                //resizable: true,
                colModel: itemOrderHistoryRightColModel,
                showTitle: false,
                title: false,
                complete: function(event, ui) {
                    //this.flex();
                    let data = itemOrderHistoryRightGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_history_right_grid_records').html(data.length);
                },
                rowSelect: function( event, ui ) {
                    //if(ui.addList.length > 0 ) {
                    let MATERIAL_ORDER_SEQ = ui.addList[0].rowData.MATERIAL_ORDER_SEQ;
                    let IN_YN = ui.addList[0].rowData.IN_YN;

                    $("#item_order_history_hidden_form #MATERIAL_ORDER_SEQ").val(MATERIAL_ORDER_SEQ);

                    if(IN_YN == 'Y'){
                        $("#btnItemOrderHistorySave").attr("disabled", true);
                    }else {
                        $("#btnItemOrderHistorySave").attr("disabled", false);
                    }
                }
            });

            itemOrderHistoryRightGrid.pqGrid("refreshDataAndView");
        };

        $("#btnItemOrderHistorySearch").on('click', function(){
            itemOrderHistoryLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_search_form'));
            });
            itemOrderHistoryLeftGrid.pqGrid('refreshDataAndView');
        });

        $("#btnItemOrderHistorySave").on('click', function(){
            let parameter = {
                'queryId': 'updateItemOrderHistoryOrderInManual',
                'MATERIAL_ORDER_SEQ': $("#item_order_history_hidden_form #MATERIAL_ORDER_SEQ").val(),
            };
            let parameters = {'url': '/json-update', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                parameter = {
                    'queryId': 'updateItemOrderHistoryPartInManual',
                    'MATERIAL_ORDER_SEQ': $("#item_order_history_hidden_form #MATERIAL_ORDER_SEQ").val(),
                };
                parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjax(function(data, callFunctionParam){
                    itemOrderHistoryRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                        return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
                    });
                    itemOrderHistoryRightGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }, parameters, '');
        });

        $("#btnItemOrderHistoryExcel").on('click', function(){
            let MATERIAL_ORDER_NUM = $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val();
            $("#common_excel_form #sqlId").val('selectItemOrderRegisterPopTable:selectItemOrderRegisterOrderSheetListExcel');
            $("#common_excel_form #mapInputId").val('data');
            $("#common_excel_form #paramName").val('MATERIAL_ORDER_NUM');
            $("#common_excel_form #paramData").val(MATERIAL_ORDER_NUM);
            $("#common_excel_form #template").val('item_order_sheet_template');
            fnReportFormToHiddenFormPageAction("common_excel_form", "/itemOrderRegisterOrderSheetPrint");
        });

        $("#btnItemOrderHistoryCancel").on('click', function(){
            let headHtml = "Information", bodyHtml ="", yseBtn="예", noBtn="아니오";
            bodyHtml =
                '<h4>\n' +
                '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                '<span>주문을 취소하시겠습니까?</span>' +
                '</h4>';

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let itemOrderRegisterPopSubmitConfirm = function(callback) {
                commonConfirmPopup.show();
                commonConfirmPopup.css("z-index", 99999999);
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm) {
                if (confirm) {
                    let parameter = {
                        'queryId': 'updateItemOrderRegisterMaterialOrderCancel',
                        'MATERIAL_ORDER_SEQ': $("#item_order_history_search_form #MATERIAL_ORDER_SEQ").val(),
                    };
                    let parameters = {'url': '/json-remove', 'data': parameter};
                    fnPostAjax(function (data, callFunctionParam) {
                        parameter = {
                            'queryId': 'updateItemOrderRegisterControlPartCancel',
                            'CONCAT_SEQ': $("#item_order_history_search_form #CONCAT_SEQ").val(),
                        };
                        parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjax(function (data, callFunctionParam) {
                            parameters = {'url': '/json-remove', 'data': {'queryId': 'deleteItemOrderRegisterCancelOrder'}};
                            fnPostAjax(function(data, callFunctionParam){
                                $("#btnItemOrderHistorySearch").trigger('click');
                            }, parameters, '');
                        }, parameters, '');
                    }, parameters, '');
                }
            });
        });


        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_history_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_history_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

        function fnInspection(parameter, MATERIAL_ORDER_SEQ) {
            let parameters = {'url': '/json-update', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                parameter = {
                    'queryId': 'updateItemOrderHistoryOrderIn',
                    'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                };

                parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjax(function(data, callFunctionParam){
                    parameter = {
                        'queryId': 'updateItemOrderHistoryPartIn',
                        'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                    };

                    parameters = {'url': '/json-update', 'data': parameter};
                    fnPostAjax(function(data, callFunctionParam){
                        itemOrderHistoryRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                            return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
                        });
                        itemOrderHistoryRightGrid.pqGrid('refreshDataAndView');
                    }, parameters, '');
                }, parameters, '');
            }, parameters, '');
        }
    });

</script>