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

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="OUTSIDE_CLOSE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseStatusList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">차수</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <option value="1">1차</option>
                                <option value="2">2차</option>
                                <option value="3">3차</option>
                                <option value="4">4차</option>
                                <option value="5">5차</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CLOSE_NOTE">비고</label>
                            <input type="text" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span class="chk_box">
                            <label for="OUTSIDE_CLOSE_YEAR_LEFT"></label><select name="CLOSE_YEAR_LEFT" id="OUTSIDE_CLOSE_YEAR_LEFT" style="width: 100px; margin-right: 5px;"></select>
                            <label for="OUTSIDE_CLOSE_MONTH_LEFT"></label><select name="CLOSE_MONTH_LEFT" id="OUTSIDE_CLOSE_MONTH_LEFT" style="width: 80px; margin-right: 10px;"></select>
                        </span>
                        <span style="vertical-align: middle; font-size: 1.4rem;">~</span>
                        <span class="chk_box">
                            <label for="CLOSE_YEAR_RIGHT"></label><select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled style="width:100px; margin-right: 5px;" ></select>
                            <label for="CLOSE_MONTH_RIGHT"></label><select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled style="width:80px;"></select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="TAB1_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="MONTH_OUTSIDE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideYearCloseStatusList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="YEAR">조회년도</label>
                            <select class="wd_200" name="YEAR" id="YEAR">
                                <option></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">Option</label>
                        </span>
                        <span class="chk_box"><input type="checkbox" name="ORIGINAL_ORDER_AMOUNT" id="ORIGINAL_ORDER_AMOUNT"><label for="ORIGINAL_ORDER_AMOUNT">원 발주 금액</label></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="TAB2_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="OUTSOURCING_STATUS_TABS" style="padding: 10px 0;">
        <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#OUTSIDE_CLOSE_STATUS" data-toggle="tab" aria-expanded="true">마감현황</a>
                </li>
                <li>
                    <a href="#MONTHLY_OUTSIDE_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                </li>
                <div class="right_float out_status_save_id">
                    <button type="button" class="defaultBtn green" style="font-weight:normal;" id="OUTSIDE_CLOSE_STATUS_SAVE">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="OUTSIDE_CLOSE_STATUS">
                    <div id="OUTSIDE_CLOSE_STATUS_GRID"></div>
                </ul>
                <ul class="conWrap" id="MONTHLY_OUTSIDE_STATUS">
                    <div id="MONTHLY_OUTSIDE_STATUS_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        const TODAY = new Date();
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $outsideCloseStatusGrid;
        const tab1GridId = 'OUTSIDE_CLOSE_STATUS_GRID';
        let tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = MONTH;
        const tab1ColModel = [
            {title: 'ROW_NUM', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ROW_NUM', hidden: true},
            {title: '사업자 구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자 구분', dataIndx: 'COMP_NM'},
            {title: '년도', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '분기', dataIndx: 'QUARTER'},
            {title: '마감월', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataIndx: 'CLOSE_VER'},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '품수', dataIndx: 'ITEM_NUMBER', summary: {type: 'sum', edit: true},
                render: function (ui) {
                    if(ui.rowData.pq_grandsummary) {
                        return ui.cellData;
                    } else {
                        return ("<a data-toggle='modal' data-refform='DETAIL_LIST_VIEW_POPUP'><u>" + ui.cellData + "</u></a>");
                    }
                }
            },
            {title: '외주 발주 금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', summary: {type: 'sum', edit: true}},
            {title: '원 발주<br>금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', summary: {type: 'sum', edit: true}}, // 2020-06-07 add
            {title: '외주<br>공급가액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', summary: {type: 'sum', edit: true}}, // 2020-06-07 add
            {title: '외주<br>마감 금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', summary: {type: 'sum', edit: true}}, // 2020-06-07 add
            {title: '부가세', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'VAT_AMOUNT', summary: {type: 'sum', edit: true}},
            {title: '부가세<br>합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'VAT_AMOUNT', summary: {type: 'sum', edit: true}}, // 2020-06-07 add
            {title: '업데이트<br>일시', dataIndx: 'VAT_AMOUNT'}, // 2020-06-07 add
            // {title: '합계금액', dataIndx: 'TOTAL_AMOUNT'},
            {title: '비고', dataIndx: 'CLOSE_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const tab1GroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['COMP_CD'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const tab1Obj = {
            height: 745,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center',  editable: false},
            colModel: tab1ColModel,
            groupModel: tab1GroupModel,
            toolbar: false,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $monthlyOutsideStatusGrid;
        const tab2GridId = 'MONTHLY_OUTSIDE_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '대상외주업체', dataIndx: 'OUTSIDE_COMP_CD_NM'},
            {title: '구분', dataIndx: 'STATUS_TYPE',},
            {
                title: '1분기', align: 'center', colModel: [
                    {title: '1월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_01_AMT', summary: {type: 'sum'}},
                    {title: '2월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_02_AMT', summary: {type: 'sum'}},
                    {title: '3월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_03_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_03_SUM_AMT', summary: {type: 'sum'}},
                ]
            },
            {
                title: '2분기', align: 'center', colModel: [
                    {title: '4월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_04_AMT', summary: {type: 'sum'}},
                    {title: '5월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_05_AMT', summary: {type: 'sum'}},
                    {title: '6월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_06_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_06_SUM_AMT', summary: {type: 'sum'}},
                ]
            },
            {
                title: '3분기', align: 'center', colModel: [
                    {title: '7월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_07_AMT', summary: {type: 'sum'}},
                    {title: '8월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_08_AMT', summary: {type: 'sum'}},
                    {title: '9월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_09_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_09_SUM_AMT', summary: {type: 'sum'}},
                ]
            },
            {
                title: '4분기', align: 'center', colModel: [
                    {title: '10월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_10_AMT', summary: {type: 'sum'}},
                    {title: '11월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_11_AMT', summary: {type: 'sum'}},
                    {title: '12월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_12_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_12_SUM_AMT', summary: {type: 'sum'}},
                ]
            },
            {title: '합계', dataIndx: 'TOTAL_AMT'}
        ];
        const tab2GroupModel = {
            on: true, header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['COMP_CD'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const tab2Obj = {
            height: 745,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: tab2ColModel,
            groupModel: tab2GroupModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        $('#TAB1_SEARCH').on('click', function () {
            tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM');
            $outsideCloseStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return tab1PostData;
            });
            $outsideCloseStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#TAB2_SEARCH').on('click', function () {
            tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
            $monthlyOutsideStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return tab2PostData;
            });
            $monthlyOutsideStatusGrid.pqGrid('refreshDataAndView');
        });

        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').find('#OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').find('#OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        $outsideCloseStatusGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlyOutsideStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

        fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_LEFT');
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('YEAR', 10);

        $('#OUTSIDE_CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_LEFT', this.value);
        });
        $('#CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT', this.value);
        });
        $('#RANGE_SEARCH').on('change', function () {
            if ($(this).prop('checked')) {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });

        $('#OUTSIDE_CLOSE_STATUS_SAVE').on('click', function () {
            const updateQueryList = ['orderMapper.updateControlMaster', 'outMapper.updateOutsideCloseNote'];
            fnModifyPQGrid($outsideCloseStatusGrid, [], updateQueryList);
        });

        $('#OUTSOURCING_STATUS_TABS').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#tab_100033 .topWrap').toggle();
                $('.out_status_save_id').toggle();
            }
        });
        /* init */
    });
</script>
