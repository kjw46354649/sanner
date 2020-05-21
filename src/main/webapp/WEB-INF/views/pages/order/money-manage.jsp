<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-10
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page moneygrid estimate">
    <div class="topWrap">
        <form class="form-inline" id="money_manage_status_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.moneyReceiveStatusList">
            <div class="none_gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MONEY_MANAGE_STATUS_YEAR">조회 년도</label>
                            <select class="wd_200" name="MONEY_MANAGE_STATUS_YEAR" id="MONEY_MANAGE_STATUS_YEAR"></select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="moneyManageStatusSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="money_receive_manage_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.moneyManageSalesList">
            <div class="none_gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span class="chk_box"><select name="MONEY_RECEIVE_CLOSE_YEAR_ST" id="MONEY_RECEIVE_CLOSE_YEAR_ST"></select>
                        <select name="MONEY_RECEIVE_CLOSE_MONTH_ST" id="MONEY_RECEIVE_CLOSE_MONTH_ST"></select></span>
                        <span style="margin: 10px 0; vertical-align: middle; font-size: 1.4rem;"> &nbsp;&nbsp;~</span>
                        <span class="chk_box"><select name="MONEY_RECEIVE_CLOSE_YEAR_ED" id="MONEY_RECEIVE_CLOSE_YEAR_ED"></select>
                        <select name="MONEY_RECEIVE_CLOSE_MONTH_ED" id="MONEY_RECEIVE_CLOSE_MONTH_ED"></select></span>
                        <%--<span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH">
                        <label for="RANGE_SEARCH"> Range 검색</label></span>--%>
                        <button type="button" class="right_float defaultBtn radius blue" id="moneyReceiveStatusSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="moneyManageTabs" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#money_manage_status_tab" data-toggle="tab" aria-expanded="true">전체현황</a>
                </li>
                <li>
                    <a href="#money_receive_manage_tab" data-toggle="tab" aria-expanded="false">상세 수금현황</a>
                </li>
                <div class="right_float money_receive_save_id" style="display: none;">
                    <button type="button" id="moneyReceiveAddBtn" style="font-weight:normal;" class="defaultBtn">추가</button>
                    <button type="button" id="moneyReceiveDelBtn" style="font-weight:normal;" class="defaultBtn red">삭제</button>
                    <button type="button" id="moneyReceiveSaveBtn" style="font-weight:normal;" class="defaultBtn green" >저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="money_manage_status_tab">
                    <div id="moneyManageStatusGrid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="money_manage_status_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </ul>
                <ul class="conWrap" id="money_receive_manage_tab">
                    <div class="tableNotSearchOneGridWrap">
                        <div class="conWrap">
                            <div class="left-30Warp">
                                <div id="moneySalesMonthGrid"></div>
                                <div class="right_sort">
                                    전체 조회 건수 (Total : <span id="money_sales_month_total_records" style="color: #00b3ee">0</span>)
                                </div>
                            </div>
                            <div class="right-70Warp">
                                <div id="moneyReceiveStatusGrid"></div>
                                <div class="right_sort">
                                    전체 조회 건수 (Total : <span id="money_receive_status_total_records" style="color: #00b3ee">0</span>)
                                </div>
                            </div>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>

    let moneyManageStatusGridID = "moneyManageStatusGrid";
    let moneySalesMonthGridID = "moneySalesMonthGrid";
    let moneyReceiveStatusGridID = "moneyReceiveStatusGrid";

    let $moneyManageStatusGrid;
    let $moneySalesMonthGrid;
    let $moneyReceiveStatusGrid;

    let $moneyManageStatusSearchBtn = $("#moneyManageStatusSearchBtn");
    let $moneyReceiveStatusSearchBtn = $("#moneyReceiveStatusSearchBtn");

    let $moneyReceiveAddBtn = $("#moneyReceiveAddBtn");
    let $moneyReceiveDelBtn = $("#moneyReceiveDelBtn");
    let $moneyReceiveSaveBtn = $("#moneyReceiveSaveBtn");

    let moneyReceiveSelectedRowIndex = [];
    let money_today = new Date();

    $(function () {
        'use strict';
        const MONEY_BUSINESS_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        const MONEY_ORDER_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#money_manage_status_search_form').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#money_manage_status_search_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#money_receive_manage_search_form ').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#money_receive_manage_search_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        /** Condition init **/
        fnAppendSelectboxYear('MONEY_MANAGE_STATUS_YEAR', 10);
        fnAppendSelectboxYear('MONEY_RECEIVE_CLOSE_YEAR_ST', 10);
        fnAppendSelectboxMonth('MONEY_RECEIVE_CLOSE_MONTH_ST');
        fnAppendSelectboxYear('MONEY_RECEIVE_CLOSE_YEAR_ED', 10);
        fnAppendSelectboxMonth('MONEY_RECEIVE_CLOSE_MONTH_ED');

        let dateEditor = function (ui) {
            let $inp = ui.$cell.find("input"), $grid = $(this);
            $inp.datepicker({
                changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yy-mm-dd',
                onSelect: function () { this.firstOpen = true; },
                beforeShow: function (input, inst) {return !this.firstOpen; },
                onClose: function () { this.focus(); }
            });
        };

        money_today.setMonth(money_today.getMonth() - 1);   // before 1 month
        $('#MONEY_RECEIVE_CLOSE_MONTH_ST').val(((money_today.getMonth() + 1) < 10 ? '0' : '') + (money_today.getMonth() + 1)).prop('selected', true);
        $('#MONEY_RECEIVE_CLOSE_MONTH_ED').val(((money_today.getMonth() + 1) < 10 ? '0' : '') + (money_today.getMonth() + 1)).prop('selected', true);

        let moneyManageStatusModel = [
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '매출현황', dataType: 'string', dataIndx: 'ORDER_COMP_CD'},
            {title: '만기전 어음', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '미수금(어음제외)', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '현금', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '어음', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD'},
            {title: '합계', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '총만기전 어음', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
            {title: '총미수금 현황(어음제외)', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];

        let moneySalesMonthModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '매출년월', dataType: 'string', dataIndx: 'CLOSE_MONTH_NM'},
            {title: '매출금액', dataType: 'string', dataIndx: 'ORDER_AMT'},
            {title: '비고', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#fffffF'}, dataIndx: 'NOTE', editable: true}
        ];

        let moneyReceiveStatusModel = [
            {title: 'DEPOSIT_SEQ', dataType: 'integer', dataIndx: 'DEPOSIT_SEQ', hidden: true},
            {title: '사업자<br>구분', clsHead: 'display_none', width: 70, dataType: 'string', dataIndx: 'COMP_CD', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: MONEY_BUSINESS_COMPANY},
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
                        return '';
                    } else {
                        let index = MONEY_BUSINESS_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });
                        if (index < 0) {
                            index = MONEY_BUSINESS_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        return (index < 0) ? cellData : MONEY_BUSINESS_COMPANY[index].text;
                    }
                }
            },
            {title: '발주업체', clsHead: 'display_none', dataType: 'string', dataIndx: 'ORDER_COMP_CD', editable: true,
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: MONEY_ORDER_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
                        return '';
                    } else {
                        let index = MONEY_ORDER_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });
                        if (index < 0) {
                            index = MONEY_ORDER_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        return (index < 0) ? cellData : MONEY_ORDER_COMPANY[index].text;
                    }
                }
            },
            {title: '입금월일', dataType: "string", styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataIndx: 'DEPOSIT_DATE',
                editable: true, editor: { type: 'textbox', init: dateEditor }
            },
            {title: '입금액', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#fffffF'}, dataIndx: 'DEPOSIT_AMT'},
            {title: '종류', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataIndx: 'DEPOSIT_TYPE', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1074')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
                        return '';
                    } else {
                        let materialKind = fnGetCommCodeGridSelectBox('1074');
                        let index = materialKind.findIndex(function (element) {
                            return element.text === cellData;
                        });
                        if (index < 0) {
                            index = materialKind.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        return (index < 0) ? cellData : materialKind[index].text;
                    }
                }
            },
            {title: '만기', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#fffffF'}, dataIndx: 'DUE_DATE', dataType: 'string', editable: true,
                editor: { type: 'textbox', init: dateEditor }
            },
            {title: '만기어음/지급여부', dataType: 'checkbox', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataIndx: 'DUE_PAY_YN',
                align: 'center', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '어음지급액', dataType: 'string', dataIndx: 'DUE_PAY_AMT', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#fffffF'}},
            {title: '비고', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#fffffF'}, dataIndx: 'NOTE', editable: true}
        ];

        let moneyManageStatusObj = {
            height: 770, collapsible: false, resizable: true, selectionModel: { type: 'row', mode: 'single'} , showTitle: false, strNoRows: g_noData, numberCell: {title: 'No.'}, scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center',  editable: false},
            colModel: moneyManageStatusModel, toolbar: false,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('money_manage_status_search_form'), recIndx: 'DEPOSIT_SEQ',
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $moneyManageStatusGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#money_manage_status_total_records').html(totalRecords);
            }
        };
        $moneyManageStatusGrid = $('#' + moneyManageStatusGridID).pqGrid(moneyManageStatusObj);

        $moneyManageStatusSearchBtn.click(function(){
            $moneyManageStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('money_manage_status_search_form');
            });
            $moneyManageStatusGrid.pqGrid('refreshDataAndView');
        });

        /** 상세 수금 현환 **/
        let moneySalesMonthObj = {
            height: 770, width: 472, selectionModel: { type: 'row', mode: 'single'} , swipeModel: {on: false}, collapsible: false,
            trackModel: {on: true}, resizable: false, flexWidth: false, scrollModel: { autoFit: true }, showTitle: false, numberCell: {title: 'No.'},
            toolbar: false, columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: moneySalesMonthModel,
            dataModel: {
                recIndx: 'ROWNUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('money_receive_manage_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $moneySalesMonthGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#money_sales_month_total_records').html(moneySalesMonthObj);
            }
        };
        $moneySalesMonthGrid = $('#' + moneySalesMonthGridID).pqGrid(moneySalesMonthObj);

        let fnQueryIdFormToJsonArrayDataOverload = function(formId, queryId) {
            let formArrayList = fnFormToJsonArrayData('money_receive_manage_search_form');
            formArrayList['queryId'] = queryId;
            return formArrayList;
        };

        let moneyReceiveStatusObj = {
            height: 770, width: "100%", selectionModel: { type: 'row', mode: 'single'} , swipeModel: {on: false}, collapsible: false,
            trackModel: {on: true}, resizable: false, flexWidth: false, scrollModel: { autoFit: true }, showTitle: false, numberCell: {title: 'No.'},
            toolbar: false, columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: moneyReceiveStatusModel,
            dataModel: {
                recIndx: "DEPOSIT_SEQ", location: "remote", dataType: "json", method: "POST", url: "/paramQueryGridSelect",
                postData: fnQueryIdFormToJsonArrayDataOverload('money_receive_manage_search_form', 'orderMapper.moneyManageReceiveList'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $moneyReceiveStatusGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#money_receive_status_total_records').html(totalRecords);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    moneyReceiveSelectedRowIndex = [];
                    let moneyReceiveGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let moneyReceiveGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (moneyReceiveGridFirstRow === moneyReceiveGridLastRow) {
                        moneyReceiveSelectedRowIndex[0] = moneyReceiveGridFirstRow;
                    } else {
                        for (let i = moneyReceiveGridFirstRow; i <= moneyReceiveGridLastRow; i++) {
                            moneyReceiveSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        $moneyReceiveStatusGrid = $('#' + moneyReceiveStatusGridID).pqGrid(moneyReceiveStatusObj);

        $moneyReceiveAddBtn.click(function(){
            $moneyReceiveStatusGrid.pqGrid('addNodes', [{}], 0);
        });

        $moneyReceiveDelBtn.click(function(){
            let receiveDeleteQuery = 'orderMapper.deleteMoneyManageReceive';
            fnDeletePQGrid($moneyReceiveStatusGrid, moneyReceiveSelectedRowIndex, receiveDeleteQuery);
        });

        $moneyReceiveSaveBtn.click(function(){
            let moneyReceiveStatusInsertQueryList = ['insertMoneyManageReceive'];
            let moneyReceiveStatusUpdateQueryList = ['updateMoneyManageReceive'];
            fnModifyPQGrid($moneyReceiveStatusGrid, moneyReceiveStatusInsertQueryList, moneyReceiveStatusUpdateQueryList);
        });

        $moneyReceiveStatusSearchBtn.click(function(){
            $moneySalesMonthGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('money_receive_manage_search_form');
            });
            $moneySalesMonthGrid.pqGrid('refreshDataAndView');

            $moneyReceiveStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnQueryIdFormToJsonArrayDataOverload('money_receive_manage_search_form', 'orderMapper.moneyManageReceiveList');
            });
            $moneyReceiveStatusGrid.pqGrid('refreshDataAndView');

        });

        $('#moneyManageTabs').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('.topWrap').toggle();
                $('.money_receive_save_id').toggle();
            }
        });

    });
</script>
