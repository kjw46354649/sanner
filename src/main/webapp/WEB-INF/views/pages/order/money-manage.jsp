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
                            <select class="wd_150" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_150" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MONEY_MANAGE_STATUS_YEAR">조회 년도</label>
                            <select class="wd_150" name="MONEY_MANAGE_STATUS_YEAR" id="MONEY_MANAGE_STATUS_YEAR"></select>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="MONEY_MANAGE_STATUS_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="moneyManageStatusSearchBtn">검색</button>
                        </span>
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
                            <select class="wd_150" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_150" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
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
                <div class="right_float money_year_note_save_id" style="display: block;">
                    <button type="button" id="moneyYearNoteSaveBtn" style="font-weight:normal;" class="defaultBtn btn-100w green" >저장</button>
                </div>
                <div class="right_float money_receive_save_id" style="display: none;">
                    <button type="button" id="moneyReceiveAddBtn" style="font-weight:normal;" class="defaultBtn btn-100w">추가</button>
                    <button type="button" id="moneyReceiveDelBtn" style="font-weight:normal;" class="defaultBtn btn-100w red">삭제</button>
                    <button type="button" id="moneyReceiveSaveBtn" style="font-weight:normal;" class="defaultBtn btn-100w green" >저장</button>
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
                                <div class="moneySalesMonthTable">
                                    <table class="inlineTable">
                                        <tbody>
                                            <tr>
                                                <td style="width:50%; background-color: #bfbfbf; text-align: center; font-weight: bold;">매출금액 합계</td>
                                                <td style="width:50%; padding-right:20px; text-align: right; font-weight: bold;"><span id="slaeAmount">0</span></td>
                                            </tr>
                                            <tr>
                                                <td style="width:50%; background-color: #bfbfbf; text-align: center; font-weight: bold;">VAT 포함합계</td>
                                                <td style="width:50%; padding-right:20px; text-align: right; font-weight: bold;"><span id="slaeTotalAmount">0</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="right_sort">
                                    전체 조회 건수 (Total : <span id="money_sales_month_total_records" style="color: #00b3ee">0</span>)
                                </div>
                            </div>
                            <div class="right-70Warp">
                                <div id="moneyReceiveStatusGrid"></div>
                                <div class="moneySalesMonthTable">
                                    <table class="inlineTable">
                                        <tbody>
                                        <tr>
                                            <td style="width:12%; background-color: #bfbfbf; text-align: center; font-weight: bold;"></td>
                                            <td style="width:18%; background-color: #bfbfbf; text-align: center; font-weight: bold;">입금액(현금+어음)</td>
                                            <td style="width:17%; background-color: #bfbfbf; text-align: center; font-weight: bold;">발행어음</td>
                                            <td style="width:18%; background-color: #bfbfbf; text-align: center; font-weight: bold;">지급완료 어음</td>
                                            <td style="width:18%; background-color: #bfbfbf; text-align: center; font-weight: bold;">실지급액(할인률%)</td>
                                            <td style="width:17%; background-color: #bfbfbf; text-align: center; font-weight: bold;">미지급 어음</td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #bfbfbf; text-align: center; font-weight: bold;">합계</td>
                                            <td style="padding-right:10px; text-align: right; font-weight: bold;"><span id="moneySales01">0</span></td>
                                            <td style="padding-right:10px; text-align: right; font-weight: bold;"><span id="moneySales02">0</span></td>
                                            <td style="padding-right:10px; text-align: right; font-weight: bold;"><span id="moneySales03">0</span></td>
                                            <td style="padding-right:10px; text-align: right; font-weight: bold;"><span id="moneySales04">0</span></td>
                                            <td style="padding-right:10px; text-align: right; font-weight: bold;"><span id="moneySales05">0</span></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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

    let $moneyYearNoteSaveBtn = $("#moneyYearNoteSaveBtn");

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

        $('#MONEY_RECEIVE_CLOSE_MONTH_ED').val(((money_today.getMonth() + 1) < 10 ? '0' : '') + (money_today.getMonth() + 1)).prop('selected', true);
        money_today.setMonth(money_today.getMonth() - 1);   // before 1 month
        $('#MONEY_RECEIVE_CLOSE_MONTH_ST').val(((money_today.getMonth() + 1) < 10 ? '0' : '') + (money_today.getMonth() + 1)).prop('selected', true);

        let moneyManageStatusModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '조회년도', dataIndx: 'CLOSE_YEAR', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, align: 'right', dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '사업자', minWidth: 30, width: 120, dataIndx: 'COMP_CD_NM'},
            {title: '발주처', minWidth: 30, width: 200, dataIndx: 'ORDER_COMP_NM'},
            {title: '2020년<br>매출현황', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'SALE_AMT',
                summary: {
                    type: "sum",
                    edit: true
                },
            },
            {
                title: '2020년 수금현황', clsHead: 'cantChange', align: 'center', colModel: [
                    {title: '현금', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CASH_AMT',
                        summary: {
                            type: "sum",
                            edit: true
                        },
                    },
                    {title: '어음', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'PAPER_AMT',
                        summary: {
                            type: "sum",
                            edit: true
                        },
                    },
                    {title: '합계', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DEPOSIT_TOTAL_AMT',
                        summary: {
                            type: "sum",
                            edit: true
                        },
                    },
                ]
            },
            {title: '전년도 총<br>미수금액', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'NOT_DEPOSIT_AMT',
                summary: {
                    type: "sum",
                    edit: true
                },
            },
            {title: '총미수금 현황<br>2020년', minWidth: 30, width: 150, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'NOT_DEPOSIT_TOTAL_AMT',
                summary: {
                    type: "sum",
                    edit: true
                },
            },
            {title: '비고', align: 'left', minWidth: 30, width: 350, dataIndx: 'NOTE', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
        ];

        //calculate sum of 3rd and 4th column.
        let moneyManageStatusGroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
            summaryInTitleRow: '',
            summaryEdit: false,
            showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };

        let moneyManageStatusObj = {
            height: 770, collapsible: false, resizable: false, selectionModel: { type: 'row', mode: 'single'} ,
            showTitle: false, rowHtHead: 15, strNoRows: g_noData, numberCell: {show: false}, scrollModel: {autoFit: false}, trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center',  editable: false},
            colModel: moneyManageStatusModel, toolbar: false,
            groupModel: moneyManageStatusGroupModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('money_manage_status_search_form'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            summaryTitle: {sum: '{0}'},
            dataReady: function (event, ui) {
                let data = $moneyManageStatusGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#money_manage_status_total_records').html(totalRecords);
                $moneyManageStatusGrid.pqGrid({
                    refresh: function( event, ui ) {
                        let searchYear = $("#money_manage_status_search_form").find("#MONEY_MANAGE_STATUS_YEAR").val();
                        $("#moneyManageStatusGrid .pq-grid-header-table .pq-grid-row").find("div[pq-col-indx=7] span.pq-title-span").html(searchYear + "년<br>매출현황");
                        $("#moneyManageStatusGrid .pq-grid-header-table .pq-grid-row").find("div[pq-row-indx=0][pq-col-indx=8] span.pq-title-span").html(searchYear + "년 수금현황");
                        $("#moneyManageStatusGrid .pq-grid-header-table .pq-grid-row").find("div[pq-col-indx=11] span.pq-title-span").html("전년도(" + (searchYear - 1) + "년)<br>" + "이월 미수금액");
                        $("#moneyManageStatusGrid .pq-grid-header-table .pq-grid-row").find("div[pq-col-indx=12] span.pq-title-span").html("총 미수금 현황<br>" + searchYear + "년");
                        $("span.pq-group-icon").hide();
                        $("span.pq-group-toggle").hide();
                    }
                });
            }
        };
        $moneyManageStatusGrid = $('#' + moneyManageStatusGridID).pqGrid(moneyManageStatusObj);

        $moneyManageStatusSearchBtn.click(function(){
            $moneyManageStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('money_manage_status_search_form');
            });
            $moneyManageStatusGrid.pqGrid('refreshDataAndView');
        });

        $moneyYearNoteSaveBtn.click(function(){
            let moneyYearNoteSaveInsertQueryList = ['insertMoneyYearNote'];
            fnModifyPQGrid($moneyManageStatusGrid, '', moneyYearNoteSaveInsertQueryList);
        });

        let moneySalesMonthModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '매출년월', dataIndx: 'CLOSE_MONTH_NM'},
            {title: '매출금액', dataIndx: 'ORDER_AMT', halign: 'center', align: 'right', dataType: 'integer', format: '#,###'},
            {title: '비고', dataIndx: 'NOTE', editable: true}
        ];

        let moneyReceiveStatusModel = [
            {title: 'DEPOSIT_SEQ', dataType: 'integer', dataIndx: 'DEPOSIT_SEQ', hidden: true},
            {title: '사업자 구분', clsHead: 'display_none', width: 70, dataIndx: 'COMP_CD', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: MONEY_BUSINESS_COMPANY},
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
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
            {title: '발주업체', clsHead: 'display_none', dataIndx: 'ORDER_COMP_CD', editable: true,
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: MONEY_ORDER_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
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
            {title: '입금월일', dataType: "string", styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, dataIndx: 'DEPOSIT_DATE',
                editable: true, editor: { type: 'textbox', init: fnDateEditor }
            },
            {title: '입금액', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataIndx: 'DEPOSIT_AMT',
                halign: 'center', align: 'right', dataType: 'integer', format: '#,###'},
            {title: '종류', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, dataIndx: 'DEPOSIT_TYPE', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1074')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
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
            {title: '만기', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataIndx: 'DUE_DATE',
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData === undefined ? true : rowData.DEPOSIT_TYPE !== '1';
                },
                editor: { type: 'textbox', init: fnDateEditor }
            },
            {title: '만기어음/지급여부', dataType: 'checkbox', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, dataIndx: 'DUE_PAY_YN',
                align: 'center',
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData === undefined ? true : rowData.DEPOSIT_TYPE !== '1';
                },
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '어음지급액', dataIndx: 'DUE_PAY_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                halign: 'center', align: 'right', dataType: 'integer', format: '#,###',
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData === undefined ? true : rowData.DEPOSIT_TYPE !== '1';
                },
            },
            {title: '비고', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataIndx: 'NOTE', editable: true}
        ];

        /** 상세 수금 현환 **/
        let moneySalesMonthObj = {
            height: 700, width: 472, selectionModel: { type: 'row', mode: 'single'} , swipeModel: {on: false}, collapsible: false,
            trackModel: {on: true}, resizable: false, flexWidth: false, scrollModel: { autoFit: true }, showTitle: false,
            rowHtHead: 15,numberCell: {title: 'No.'}, toolbar: false, columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' },
            colModel: moneySalesMonthModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('money_receive_manage_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $moneySalesMonthGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalSalesAmount = 0;
                for (let i = 0; i < totalRecords; i++) {
                    let rowData = data[i];
                    if(rowData.ORDER_AMT)
                        totalSalesAmount += parseInt(rowData.ORDER_AMT);
                    else
                        totalSalesAmount += 0;
                }
                let vatAmount = parseInt((totalSalesAmount * 10) / 100) + totalSalesAmount;
                $('#slaeAmount').html(numberWithCommas(totalSalesAmount));
                $('#slaeTotalAmount').html(numberWithCommas(vatAmount));
                $('#money_sales_month_total_records').html(totalRecords);
            }
        };
        $moneySalesMonthGrid = $('#' + moneySalesMonthGridID).pqGrid(moneySalesMonthObj);

        let fnQueryIdFormToJsonArrayDataOverload = function(formId, queryId) {
            let formArrayList = fnFormToJsonArrayData('money_receive_manage_search_form');
            formArrayList['queryId'] = queryId;
            return formArrayList;
        };

        let moneyReceiveStatusObj = {
            height: 700, width: "100%", selectionModel: { type: 'row', mode: 'single'} , swipeModel: {on: false}, collapsible: false,
            trackModel: {on: true}, resizable: false, flexWidth: false, scrollModel: { autoFit: true }, showTitle: false, rowHtHead: 15,
            numberCell: {title: 'No.'}, toolbar: false, columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' },
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
                let moneySales01=0, moneySales02=0, moneySales03=0, moneySales04=0, moneySales05=0, duePayPer=0;
                for (let i = 0; i < totalRecords; i++) {
                    let rowData = data[i];
                    moneySales01 += parseInt(rowData.DEPOSIT_AMT?rowData.DEPOSIT_AMT:0);
                    if(rowData.DEPOSIT_TYPE == 2 || rowData.DEPOSIT_TYPE == 3) moneySales02 += parseInt(rowData.DEPOSIT_AMT);
                    if(rowData.DUE_PAY_YN == 'Y'){
                        moneySales03 += parseInt(rowData.DEPOSIT_AMT?rowData.DEPOSIT_AMT:0);
                        moneySales04 += parseInt(rowData.DUE_PAY_AMT?rowData.DUE_PAY_AMT:0);
                    }
                    if(rowData.DUE_PAY_YN != 'Y' && (rowData.DEPOSIT_TYPE == 2 || rowData.DEPOSIT_TYPE == 3)){
                        moneySales05 += parseInt(rowData.DEPOSIT_AMT?rowData.DEPOSIT_AMT:0);
                    }
                }
                if(moneySales04 > 0) duePayPer = (((moneySales03 - moneySales04) / moneySales03) * 100).toFixed(1);
                $('#moneySales01').html(numberWithCommas(moneySales01));
                $('#moneySales02').html(numberWithCommas(moneySales02));
                $('#moneySales03').html(numberWithCommas(moneySales03));
                $('#moneySales04').html(numberWithCommas(moneySales04) + "(" + duePayPer + '%)');
                $('#moneySales05').html(numberWithCommas(moneySales05));
                $('#money_receive_status_total_records').html(totalRecords);
            },
            selectChange: function (event, ui) {
                moneyReceiveSelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) moneyReceiveSelectedRowIndex.push(i);
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
                $('.money_year_note_save_id').toggle();
            }
        });

        $('#MONEY_MANAGE_STATUS_EXCEL_EXPORT').on('click', function () {
            const blob = $moneyManageStatusGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '전체현황.xlsx');
        });

    });
</script>
