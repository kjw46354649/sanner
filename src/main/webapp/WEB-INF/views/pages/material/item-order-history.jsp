<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_history_search_form" name="item_order_history_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectItemOrderHistoryList">
            <input type="hidden" name="MATERIAL_ORDER_SEQ" id="MATERIAL_ORDER_SEQ" value="">
            <input type="hidden" name="CONCAT_SEQ" id="CONCAT_SEQ" value="">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="CONTROL_NUM">관리번호</label><input type="search" name="CONTROL_NUM" id="CONTROL_NUM" class="wd_200" value="" title="관리번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MATERIAL_ORDER_NUM">소재주문번호</label><input type="search" name="MATERIAL_ORDER_NUM" id="MATERIAL_ORDER_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_COMP_CD">소재주문업체</label>
                            <select name="MATERIAL_COMP_CD" id="MATERIAL_COMP_CD" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnItemOrderHistorySearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100">주문일시</label></span>
                        <div class="calendar_wrap" style="width:542px; padding-left: 0">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_HISTORY_START_DATE" id="ITEM_ORDER_HISTORY_START_DATE"><button type="button" id="ITEM_ORDER_HISTORY_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_HISTORY_END_DATE" id="ITEM_ORDER_HISTORY_END_DATE" readonly><button type="button" id="ITEM_ORDER_HISTORY_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_30Wrap">
                    <div class="buttonWrap right_sort">
                        <span class="d-inline">
                            <button type="button" id="item_order_history_left_excel_export"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
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
                            <span class="chk_box"><input name="VIEW_AMOUNT_INFORMATION" id="VIEW_AMOUNT_INFORMATION" type="checkbox"><label for="VIEW_AMOUNT_INFORMATION"> 금액정보</label></span>
                            <button type="button" id="item_order_history_right_excel_export"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius green" id="btnItemOrderHistorySave">검사 입고</button>
                            <button type="button" class="defaultBtn radius green" id="btnSave" disabled>SAVE</button>
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
    <input type="hidden" id="queryId" name="queryId" value="material.selectItemOrderHistoryListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
    <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
    <input type="hidden" id="MATERIAL_DETAIL" name="MATERIAL_DETAIL"/>
</form>

<form id="item_order_history_inspection_hidden_form" name="item_order_history_inspection_hidden_form">
</form>

<script type="text/javascript">
    'use strict';
    let itemOrderHistorySelectedRowIndex;
    let itemOrderHistoryLeftGrid = $("#item_order_history_left_grid");
    let itemOrderHistoryRightGrid = $("#item_order_history_right_grid");

    $(function () {
        let itemOrderHistoryLeftColModel = [
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, sortable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', width: 85, sortable: false},
            {title: '총수량', dataType: 'string', dataIndx: 'ORDER_QTY', sortable: false},
            {title: '입고<br>수량', dataType: 'string', dataIndx: 'IN_QTY', sortable: false},
            {title: '주문일시', dataType: 'date', dataIndx: 'ORDER_DT', width: 90, sortable: false},
            {title: '작성자', dataIndx: 'ORDER_USER_NM', width: 65, sortable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD', hidden: true, sortable: false}
        ];

        let itemOrderHistoryRightColModel= [
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 , editable: false, hidden: true} ,
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', minWidth: 35, editable: false},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM', width: 50, editable: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', width: 65, editable: false},
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT', width: 75, editable: false},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 30 , editable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', minWidth: 65 , editable: false},
            {title: '요청 사항', align: "center", colModel: [
                    {title: '요청 사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 130, editable: false},
                    {title: '비고', dataType: 'string', dataIndx: 'ORDER_NOTE', minWidth: 120, editable: false},
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
                    {title: '소재', dataType: 'string', dataIndx: 'INSPECT_MATERIAL_YN', minWidth: 35, editable: false,
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
                                itemOrderHistoryInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                    {title: '외관', dataType: 'string', dataIndx: 'INSPECT_SURFACE_YN', minWidth: 35, editable: false,
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
                                itemOrderHistoryInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                    {title: '치수', dataType: 'string', dataIndx: 'INSPECT_SIZE_YN', minWidth: 35, editable: false,
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
                                itemOrderHistoryInspection(parameter, MATERIAL_ORDER_SEQ);
                            });
                        }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '검사 비고', dataType: 'string', dataIndx: 'INSPECT_NOTE', width: 100,
                editable: function (ui) {
                    return ui.rowData.IN_YN !== 'Y';
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}
            },
            {title: '입고', dataType: 'string', dataIndx: 'IN_YN', minWidth: 35, editable: false,
                render: function(ui){
                    let icon = ui.rowData.IN_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                    return '<span class="ui-icon '+icon+'"></span>';
                }
            },
            {title: '입고 일시', dataType: 'string', dataIndx: 'IN_DT', width: 90, editable: false},
            {
                title: '매입 금액', align: 'center', colModel: [
                    {title: '단가', dataType: 'integer', format: '#,###', dataIndx: 'IN_UNIT_AMT', width: 55, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '금액합계', dataType: 'integer', format: '#,###', dataIndx: 'IN_SUM_AMT', width: 55, editable: false},
                    {title: '비고', dataIndx: 'IN_NOTE', width: 100, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}
            },
            {title: '자동계산<br>소재비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AUTO_AMT', width: 55, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '관리번호', align: 'left', dataType: 'string', dataIndx: 'CONTROL_PART_NUM', width: 150, editable: false},
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, width: 30, editable: false},
        ];

        itemOrderHistoryLeftGrid.pqGrid({
            height: '100%', rowHtHead: 46,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#item_order_history_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: itemOrderHistoryLeftColModel,
            showTitle: false,
            title: false,
            editable: false,
            complete: function(event, ui) {
                //this.flex();
                let data = itemOrderHistoryLeftGrid.pqGrid('option', 'dataModel.data');

                $('#item_order_history_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                itemOrderHistorySelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) itemOrderHistorySelectedRowIndex.push(i);
                }
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let MATERIAL_ORDER_SEQ = ui.addList[0].rowData.MATERIAL_ORDER_SEQ;
                let MATERIAL_ORDER_NUM = ui.addList[0].rowData.MATERIAL_ORDER_NUM;
                let MATERIAL_COMP_CD = ui.addList[0].rowData.MATERIAL_COMP_CD;
                let CONCAT_SEQ = ui.addList[0].rowData.CONCAT_SEQ === undefined ? "0" : ui.addList[0].rowData.CONCAT_SEQ;
                let IN_YN = ui.addList[0].rowData.IN_YN;

                $("#item_order_history_search_form #MATERIAL_ORDER_SEQ").val(MATERIAL_ORDER_SEQ);
                $("#item_order_history_search_form #CONCAT_SEQ").val(CONCAT_SEQ);
                $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                $("#item_order_history_hidden_form #MATERIAL_COMP_CD").val(MATERIAL_COMP_CD);
                $("#item_order_history_hidden_form #MATERIAL_DETAIL").val(MATERIAL_DETAIL);

                $("#item_order_history_search_form").find('#MATERIAL_DETAIL');
                if (IN_YN == 'Y') {
                    $("#btnItemOrderHistoryCancel").attr("disabled", true);
                } else {
                    $("#btnItemOrderHistoryCancel").attr("disabled", false);
                }
                selectItemOrderHistoryRightList();
                //}
            }
        });

        selectItemOrderHistoryRightList();
        function selectItemOrderHistoryRightList() {
            if (itemOrderHistoryRightGrid.hasClass('pq-grid')) {
                itemOrderHistoryRightGrid.pqGrid('destroy');
            }
            itemOrderHistoryRightGrid.pqGrid({
                height: '100%', rowHtHead: 23,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'MATERIAL_ORDER_SEQ',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_history_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {totalRecords: data.length, data: data};
                    }
                },
                postRenderInterval: -1,
                columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                // selectionModel: {type: 'row', mode: 'single'},
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                //resizable: true,
                colModel: itemOrderHistoryRightColModel,
                showTitle: false,
                title: false,
                complete: function(event, ui) {
                    let data = itemOrderHistoryRightGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_history_right_grid_records').html(data.length);

                    changeViewColumn($('#VIEW_AMOUNT_INFORMATION').prop('checked'));
                },
                cellClick: function (event, ui) {
                    let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                    let IN_YN = ui.rowData.IN_YN;

                    $('#item_order_history_hidden_form #MATERIAL_ORDER_SEQ').val(MATERIAL_ORDER_SEQ);

                    if (IN_YN === 'Y') {
                        $('#btnItemOrderHistorySave').attr('disabled', true);
                    } else {
                        $('#btnItemOrderHistorySave').attr('disabled', false);
                    }
                },
                change: function () {
                    $('#btnSave').prop('disabled', false);
                },
                beforeValidate(event, ui) {
                    ui.addList = [];
                },
                beforePaste: function (evt, ui) {
                    let CM = this.getColModel(),
                        rows = ui.rows,
                        area = ui.areas[0],
                        //r1 = area.r1,
                        c1 = area.c1;
                    for (let i = 0; i < rows.length; i++) {
                        let row = rows[i];
                        for (let j = 0; j < row.length; j++) {
                            let column = CM[j + c1],
                                dt = column.dataType;
                            if (dt == "integer" || dt == "float") {
                                row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                            }
                        }
                    }
                }
            });

            itemOrderHistoryRightGrid.pqGrid("refreshDataAndView");
        }

        $("#btnItemOrderHistorySearch").on('click', function(){
            itemOrderHistoryLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_search_form'));
            });
            itemOrderHistoryLeftGrid.pqGrid('refreshDataAndView');
        });

        $("#btnItemOrderHistorySave").on('click', function(){
            itemOrderHistoryInspectionIn();
        });

        $("#btnItemOrderHistoryExcel").on('click', function(){
            let MATERIAL_ORDER_NUM = $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val();

            printJS({printable:'/makeItemOrderSheetPrint?MATERIAL_ORDER_NUM='+encodeURI(MATERIAL_ORDER_NUM), type:'pdf', showModal:true});
        });

        $("#btnItemOrderHistoryCancel").on('click', function(){
            itemOrderHistoryOrderCancel();
        });

        $('#ITEM_ORDER_HISTORY_START_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ITEM_ORDER_HISTORY_END_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ITEM_ORDER_HISTORY_START_DATE').datepicker('setDate', -1);
        $('#ITEM_ORDER_HISTORY_END_DATE').datepicker('setDate', 'today');

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_history_search_form").find("#MATERIAL_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});


        /** Function **/
        /**
         * 수입 검사
         * @param parameter
         * @param MATERIAL_ORDER_SEQ
         */
        function itemOrderHistoryInspection(parameter, MATERIAL_ORDER_SEQ) {
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
                        parameter = {
                            'queryId': 'insertInWareHouseManagePartProgressManual',
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
            }, parameters, '');
        }

        /**
         * 검사 입고
         */
        function itemOrderHistoryInspectionIn() {
            const MATERIAL_ORDER_SEQ = $("#item_order_history_hidden_form #MATERIAL_ORDER_SEQ").val();
            let parameter = {
                'queryId': 'updateItemOrderHistoryOrderInManual',
                'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
            };
            let parameters = {'url': '/json-update', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                parameter = {
                    'queryId': 'updateItemOrderHistoryPartInManual',
                    'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                };
                parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjax(function (data, callFunctionParam) {
                    parameter = {
                        'queryId': 'insertInWareHouseManagePartProgressManual',
                        'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ,
                    };
                    parameters = {'url': '/json-update', 'data': parameter};
                    fnPostAjax(function (data, callFunctionParam) {
                        itemOrderHistoryRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                            return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
                        });
                        itemOrderHistoryRightGrid.pqGrid('refreshDataAndView');
                    }, parameters, '');
                }, parameters, '');
            }, parameters, '');
        }

        /**
         * 주문 취소
         */
        function itemOrderHistoryOrderCancel() {
            let message ="주문을 취소하시겠습니까?";

            fnConfirm(null, message, function () {
                let parameter = {
                    'queryId': 'insertItemOrderRegisterMasterOrderHistory',
                    'MATERIAL_ORDER_SEQ': $("#item_order_history_search_form #MATERIAL_ORDER_SEQ").val(),
                };
                let parameters = {'url': '/json-create', 'data': parameter};
                fnPostAjax(function(data, callFunctionParam){
                    parameter = {
                        'queryId': 'updateItemOrderRegisterMaterialOrderCancel',
                        'MATERIAL_ORDER_SEQ': $("#item_order_history_search_form #MATERIAL_ORDER_SEQ").val(),
                    };
                    parameters = {'url': '/json-remove', 'data': parameter};
                    fnPostAjax(function (data, callFunctionParam) {
                        parameter = {
                            'queryId': 'updateItemOrderRegisterControlPartCancel',
                            'CONCAT_SEQ': $("#item_order_history_search_form #CONCAT_SEQ").val(),
                        };
                        parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjax(function (data, callFunctionParam) {
                            $("#btnItemOrderHistorySearch").trigger('click');
                        }, parameters, '');
                    }, parameters, '');
                }, parameters, '');
            });
        }

        const changeViewColumn = function (checked) {
            const itemOrderHistoryRightGridInstance = itemOrderHistoryRightGrid.pqGrid('getInstance').grid;
            const Cols = itemOrderHistoryRightGridInstance.Columns();
            const array = ['IN_UNIT_AMT', 'IN_SUM_AMT', 'IN_NOTE', 'UNIT_MATERIAL_AUTO_AMT'];
            const parameter = checked ? 'diShow' : 'diHide';
            Cols.hide({[parameter]: array});
        };

        $('#ITEM_ORDER_HISTORY_START_DATE_BUTTON').on('click', function () {
            $('#ITEM_ORDER_HISTORY_START_DATE').focus();
        });

        $('#ITEM_ORDER_HISTORY_END_DATE_BUTTON').on('click', function () {
            $('#ITEM_ORDER_HISTORY_END_DATE').focus();
        });

        $('#item_order_history_left_excel_export').on('click', function () {
            const blob = itemOrderHistoryLeftGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '소재 주문이력_1.xlsx');
        });

        $('#item_order_history_right_excel_export').on('click', function () {
            const blob = itemOrderHistoryRightGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '소재 주문이력_2.xlsx');
        });

        $('#VIEW_AMOUNT_INFORMATION').on('click', function () {
           changeViewColumn(this.checked);
        });

        $('#btnSave').on('click', function () {
            const updateQueryList = ['material.updateItemOrderHistoryRight'];

            fnModifyPQGrid(itemOrderHistoryRightGrid, [], updateQueryList);
            $('#btnSave').prop('disabled', true);
        });

    });

</script>