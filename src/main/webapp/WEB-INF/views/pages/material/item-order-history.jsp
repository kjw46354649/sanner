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
            <div class="gubunWrap">
                <ul>
                    <div class="dateWrap">
                        <button type="button" class="search_btn" id="btnItemOrderRegisterSearch">검색</button>
                    </div>
                    <li>
                        <span class="slt_wrap">
                            <label for="COMP_CD">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자">
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사">
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="MODULE_NM">견적번호</label><input type="text" name="MODULE_NM" id="MODULE_NM" placeholder="" value="" title="견적번호"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" placeholder="" value="" title="품명"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="MANAGE_NUM">관리번호</label><input type="text" name="MANAGE_NUM" id="MANAGE_NUM" placeholder="" value="" title="관리번호"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="DRAWING_NUM">소재주문번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" placeholder="" value="" title="소재주문번호"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" placeholder="" value="" title="소재주문업체"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" placeholder="" value="" title="소재주문업체"></span>
                    </li>

                </ul>
                <div class="dateWrap">
                    <div class="leftSpan">
                            <span class="slt_wrap">
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
                            <span class="chk_box no_txt"><input id="pr_ex" type="checkbox"><label for="pr_ex">선택</label></span>
                        </div>

                    </div>
                    <div class="rightSpan">
                        <span class="txt">Option</span>
                        <span class="chk_box"><input id="pr_ex1" type="checkbox"><label for="pr_ex1"> 발송완료</label></span>
                        <span class="chk_box"><input id="pr_ex2" type="checkbox"><label for="pr_ex2"> 최신차수</label></span>
                    </div>
                </div>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="page main">
        <div class="leftWrap">
            <div class="chartWrap">
                <div class="hWrap">
                    <span class="buttonWrap">
                        <button type="button" class="defaultBtn" id="btnItemOrderHistoryCancel">주문취소</button>
                    </span>
                </div>
                <div class="conWrap">
                    <div id="item_order_history_left_grid" class="jqx-refresh"></div>
                </div>
            </div>
        </div>
        <div class="rightWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <span class="buttonWrap">
                		<button type="button" class="defaultBtn blueGra" id="btnItemOrderHistoryExcel">주문서 출력</button>
                        <button type="button" class="defaultBtn blueGra" id="btnItemOrderHistorySave">Save</button>
                    </span>
                </div>
                <div class="conWrap">
                    <div id="item_order_history_right_grid" class="jqx-refresh"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_history_hidden_form" name="item_order_history_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderHistoryListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
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
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', width: 80 } ,
            {title: '총수량', dataType: 'string', dataIndx: 'ORDER_QTY' } ,
            {title: '주문일시', dataType: 'date', dataIndx: 'ORDER_DT', width: 120 },
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD' , hidden: true}
        ];

        let itemOrderHistoryRightColModel= [
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 , editable: false} ,
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD', width: 80 , editable: false} ,
            {title: '소재종류', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '형태', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '상세종류', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: '소재Size', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120, editable: false},
            {title: '주문', dataType: 'string', dataIndx: 'ORDER_QTY' , editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'ORDER_NOTE', editable: false},
            {title: '금액.', dataType: 'string', dataIndx: 'ORDER_AMT '},
            {title: '수입검사', dataType: 'string', align: "center", colModel: [
                    {title: '소재', dataType: 'string', dataIndx: 'INSPECT_MATERIAL_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="item_order_history_inspection_check">' +
                                '   <span data-col="INSPECT_MATERIAL_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                    {title: '외관', dataType: 'string', dataIndx: 'INSPECT_SURFACE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="item_order_history_inspection_check">' +
                                '   <span data-col="INSPECT_SURFACE_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                    {title: '치수', dataType: 'string', dataIndx: 'INSPECT_SIZE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="item_order_history_inspection_check">' +
                                '   <span data-col="INSPECT_SIZE_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                ]},
            {title: '검사 비고', dataType: 'string', dataIndx: 'INSPECT_NOTE'},
            {title: '입고', dataType: 'string', dataIndx: '', width: 80, editable: false,
                render: function(ui){
                    return '<a href="#"><span class="ui-icon ui-icon-closethick"></span></a>';
                }
            },
            {title: '입고 일시', dataType: 'string', dataIndx: 'IN_DT', editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: '', editable: false}
        ];

        let itemOrderHistoryLeftToolbar = {
            items: [
                {
                    type: 'button', label: '주문취소', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                }
            ]
        };
        let itemOrderHistoryRightToolbar = {
            items: [
                {
                    type: 'button', label: 'Save', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'button', label: '주문서출력', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                }
            ]
        };

        function autoMerge(grid, refresh) {
            var mc = [],
                CM = grid.option("colModel"),
                i = CM.length,
                data = grid.option("dataModel.data");

            while (i--) {
                var dataIndx = CM[i].dataIndx,
                    rc = 1,
                    j = data.length;

                while (j--) {
                    var cd = data[j][dataIndx],
                        cd_prev = data[j - 1] ? data[j - 1][dataIndx] : undefined;
                    if (cd_prev !== undefined && cd == cd_prev) {
                        rc++;
                    }
                    else if (rc > 1) {
                        mc.push({ r1: j, c1: i, rc: rc, cc: 1 });
                        rc = 1;
                    }
                }
            }
            grid.option("mergeCells", mc);
            if (refresh) {
                grid.refreshView();
            }
        };

        itemOrderHistoryLeftGrid.pqGrid({
            height: 680,
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
            trackModel: {on: true},
            colModel: itemOrderHistoryLeftColModel,
            toolbar: itemOrderHistoryLeftToolbar,
            sort: function () {
                autoMerge(this);
            },
            complete: function(event, ui) {
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
                $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                $("#item_order_history_hidden_form #MATERIAL_COMP_CD").val(MATERIAL_COMP_CD);
                selectItemOrderHistoryRightList();
                //}
            }
        });

        selectItemOrderHistoryRightList();

        function selectItemOrderHistoryRightList() {
            itemOrderHistoryRightGrid.pqGrid({
                height: 680,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_history_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                //resizable: true,
                colModel: itemOrderHistoryRightColModel,
                toolbar: itemOrderHistoryRightToolbar
            });

            itemOrderHistoryRightGrid.pqGrid("refreshDataAndView");
        };

        $("#btnItemOrderRegisterSearch").on('click', function(){
            itemOrderHistoryLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_search_form'));
            });
            itemOrderHistoryLeftGrid.pqGrid('refreshDataAndView');
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_history_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_history_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

    });

    $(document).on('click', '#item_order_history_inspection_check', function(event){
        let seq = event.target.dataset.seq;
        let col = event.target.dataset.col;
        let val = event.target.dataset.val;

        let valueElement = document.createElement("input");
        let queryElement = document.createElement("input");
        let seqElement = document.createElement("input");

        valueElement.type = "hidden";
        valueElement.id = col;
        valueElement.name = col;
        valueElement.setAttribute("value", val);

        queryElement.type = "hidden";
        queryElement.id = "queryId";
        queryElement.name = "queryId";
        queryElement.setAttribute("value", "updateItemOrderHistoryInspection");

        seqElement.type = "hidden";
        seqElement.id = "MATERIAL_ORDER_SEQ";
        seqElement.name = "MATERIAL_ORDER_SEQ";
        seqElement.setAttribute("value", seq);

        $("#item_order_history_inspection_hidden_form").empty();
        $("#item_order_history_inspection_hidden_form").append(valueElement);
        $("#item_order_history_inspection_hidden_form").append(queryElement);
        $("#item_order_history_inspection_hidden_form").append(seqElement);

        let parameters = {'url': '/json-update', 'data': $("#item_order_history_inspection_hidden_form").serialize()};
        fnPostAjax(function (data, callFunctionParam) {
            itemOrderHistoryRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
            });
            itemOrderHistoryRightGrid.pqGrid('refreshDataAndView');
        }, parameters, '');
    });
</script>