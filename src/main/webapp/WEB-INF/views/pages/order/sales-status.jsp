<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-01
  Time: 오후 4:34
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
        <form class="form-inline" id="SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectSalesClosingHistoryList">
            <div class="none_gubunWrap row2_topWrap">
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
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">차수</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="NOTE">비고</label>
                            <input type="text" class="wd_200" name="NOTE" id="NOTE">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span class="chk_box"><select name="CLOSE_YEAR_LEFT" id="CLOSE_YEAR_LEFT"></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_LEFT" id="CLOSE_MONTH_LEFT"></select><span style="margin: 10px 0; vertical-align: middle; font-size: 1.4rem;"> &nbsp;&nbsp;~</span></span>
                        <span class="chk_box"><select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled></select></span>
                        <span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH">
                        <label for="RANGE_SEARCH"> Range 검색</label></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="CONTROL_SALES_CLOSING_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="topWrap" style="display: none">
        <form class="form-inline" id="MONTH_SALE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectMonthSaleStatusList">
            <div class="none_gubunWrap row2_topWrap">
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
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">차수</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="NOTE">비고</label>
                            <input type="text" class="wd_200" name="NOTE" id="NOTE">
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="MONTH_SALE_YEAR">조회년도</label>
                            <select class="wd_200" name="MONTH_SALE_YEAR" id="MONTH_SALE_YEAR">
                                <option></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100">Option</label></span>
                        <span class="wd_200" style="display: inline-block;">
                            <span class="chk_box"><input type="checkbox" name="DEPOSIT_STATUS_DISPLAY" id="DEPOSIT_STATUS_DISPLAY"><label for="DEPOSIT_STATUS_DISPLAY">입금현황 표시</label></span>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="CONTROL_MONTH_SALE_STATUS_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="tableWrap jmestabs" id="CONTROL_SALES_STATUS_TABS" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CLOSING_HISTORY" data-toggle="tab" aria-expanded="true">마감이력</a>
                </li>
                <li>
                    <a href="#MONTHLY_SALES_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                </li>
                <div class="right_float" id="sales_status_save_id">
                    <button type="button" class="defaultBtn btn-100w green" style="font-weight:normal;" id="CLOSING_HISTORY_SAVE">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="CLOSING_HISTORY">
                    <div id="CLOSING_HISTORY_GRID"></div>
                </ul>
                <ul class="conWrap" id="MONTHLY_SALES_STATUS">
                    <div id="MONTHLY_SALES_STATUS_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="popup_container" id="SALES_STATUS_DETAIL_LIST_VIEW_POPUP" style="display: none;">
    <div class="layerPopup">
        <h3>상세 List 조회</h3>
        <hr>
        <button type="button" class="pop_close" name="SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE">닫기</button>
        <div>
            <form class="form-inline" id="DETAIL_LIST_VIEW_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="selectControlCloseLeftList">
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                <div id="DETAIL_LIST_VIEW_GRID"></div>
            </form>
        </div>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" name="SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE">닫기</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        fnCommCodeDatasourceSelectBoxCreate($('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_SALE_STATUS_SEARCH_FORM ').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_SALE_STATUS_SEARCH_FORM ').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        $('#CLOSE_MONTH_LEFT').val('01').prop('selected', true);
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('MONTH_SALE_YEAR', 10);

        /* variable */
        let $closingHistoryGrid;
        const tab1GridId = 'CLOSING_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
        const tab1ColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, align: 'right', dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '년도', dataType: 'string', dataIndx: 'YYYY'},
            {title: '분기', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '마감월', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '품수', dataType: 'string', dataIndx: 'ITEM_NUMBER', summary: {type: 'sum', edit: true},
                render: function (ui) {
                    if(ui.rowData.pq_grandsummary) {
                        return ui.cellData;
                    } else {
                        return ("<a href='#SALES_STATUS_DETAIL_LIST_VIEW_POPUP' data-target='' data-toggle='modal' " +
                            "data-refform='SALES_STATUS_DETAIL_LIST_VIEW_POPUP'><u>" + ui.cellData + "</u></a>");
                    }
                }
            },
            {title: '공급가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', summary: {type: 'sum'}},
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'sdfsd1', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, summary: {type: 'sum'}, editable: true},
            {title: '부가세액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'VAT_AMOUNT', summary: {type: 'sum'}},
            {title: '합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMOUNT', summary: {type: 'sum'}},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const tab1GroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
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
            rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: tab1ColModel,
            groupModel: tab1GroupModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        $closingHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);

        let $detailListViewGrid;
        const detailListViewGridId = 'DETAIL_LIST_VIEW_GRID';
        let detailListViewPostData = fnFormToJsonArrayData('#MONTH_SALE_STATUS_SEARCH_FORM');
        const detailListViewColModel = [
            {title: '사업자<br>구분', minWidth: 70, dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', colModel: []},
            {title: 'INV No.<br>(거래명세No.)', minWidth: 100, dataType: 'string', dataIndx: 'CHARGE_USER_ID', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', colModel: []},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', colModel: []},
            {title: 'Part', align: 'right', dataType: 'integer', dataIndx: 'PART_NUM', colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', colModel: []},
            {title: '품명', minWidth: 110, dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '작업<br>형태', minWidth: 110, dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '소재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: 'Part<br>단위<br>수량', align: 'right', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', colModel: []},
            {title: '발주번호', minWidth: 90, datatype: 'string', dataIndx: 'ORDER_NUM', colModel: []},
            // {title: '주문<br>수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '견적단가', minWidth: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', colModel: []},
            {title: '공급단가', minWidth: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {title: '합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMOUNT', colModel: []}
        ];
        const detailListViewObj = {
            height: 800,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: detailListViewColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $monthlySalesStatusGrid;
        const tab2GridId = 'MONTHLY_SALES_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTH_SALE_STATUS_SEARCH_FORM');
        tab2PostData.MONTH_SALE_YEAR = CURRENT_YEAR;
        const tab2ColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, align: 'right', dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            // {title: 'CONTROL_TYPE', dataType: 'string', dataIndx: 'CONTROL_TYPE', hidden: true},
            // {title: 'CONTROL_NM', dataType: 'string', dataIndx: 'CONTROL_NM'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '구분', dataType: 'string', dataIndx: 'STATUS_TYPE',},
            {
                title: '1분기', align: 'center', colModel: [
                    {title: '1월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '01_AMT', summary: {type: 'sum'}},
                    {title: '2월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '02_AMT', summary: {type: 'sum'}},
                    {title: '3월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_SUM_AMT', summary: {type: 'sum'}}
                ]
            },
            {
                title: '2분기', align: 'center', colModel: [
                    {title: '4월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '04_AMT', summary: {type: 'sum'}},
                    {title: '5월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '05_AMT', summary: {type: 'sum'}},
                    {title: '6월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_SUM_AMT', summary: {type: 'sum'}}
                ]
            },
            {
                title: '3분기', align: 'center', colModel: [
                    {title: '7월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '07_AMT', summary: {type: 'sum'}},
                    {title: '8월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '08_AMT', summary: {type: 'sum'}},
                    {title: '9월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_SUM_AMT', summary: {type: 'sum'}}
                ]
            },
            {
                title: '4분기', align: 'center', colModel: [
                    {title: '10월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '10_AMT', summary: {type: 'sum'}},
                    {title: '11월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '11_AMT', summary: {type: 'sum'}},
                    {title: '12월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_SUM_AMT', summary: {type: 'sum'}}
                ]
            },
            {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'}
        ];
        const tab2GroupModel = {
            on: true, header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
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
            rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: tab2ColModel,
            groupModel: tab2GroupModel,
            toolPanel: {
                show: false  //show toolPanel initially.
            },
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        const loadDetailListViewData = function () {

        };

        $('#SALES_STATUS_DETAIL_LIST_VIEW_POPUP').on({
            'show.bs.modal': function () {
                $detailListViewGrid = $('#' + detailListViewGridId).pqGrid(detailListViewObj);
            },
            'hide.bs.modal': function () {
                $detailListViewGrid.pqGrid('destroy');
            }
        });

        $('#CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_LEFT', this.value);
        });
        $('#CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT', this.value);
        });
        $('#RANGE_SEARCH').on('change', function (event) {
            if ($(this).prop('checked')) {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });

        $('#CLOSING_HISTORY_SAVE').on('click', function (event) {
            const updateQueryList = ['orderMapper.updateControlMaster', 'orderMapper.updateControlPart'];

            fnModifyPQGrid($closingHistoryGrid, [], updateQueryList);
        });

        $("#CONTROL_SALES_STATUS_TABS").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#view_tab_100025 .topWrap').toggle();
                $('#sales_status_save_id').toggle();
            }
        });

        $('#CONTROL_SALES_CLOSING_HISTORY_SEARCH').on('click', function () {
            $closingHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
            });
            $closingHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#CONTROL_MONTH_SALE_STATUS_SEARCH').on('click', function () {
            $monthlySalesStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#MONTH_SALE_STATUS_SEARCH_FORM');
            });
            $monthlySalesStatusGrid.pqGrid('refreshDataAndView');
        });

        $('[name=SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE]').on('click', function () {
            $('#SALES_STATUS_DETAIL_LIST_VIEW_POPUP').modal('hide');
        });
        /* init */
        // $closingHistoryGrid.pqGrid('option', 'dataModel.postData', function () {
        //     return (fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM'));
        // });
        // $closingHistoryGrid.pqGrid('refreshDataAndView');
        $monthlySalesStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);
        /* init */
    });
</script>
