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
            <div class="gubunWrap row2_topWrap">
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
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_SALES_CLOSING_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span>
                            <select name="CLOSE_YEAR_LEFT" id="CLOSE_YEAR_LEFT"></select>
                            <select name="CLOSE_MONTH_LEFT" id="CLOSE_MONTH_LEFT"></select><span style="margin: 10px 0; vertical-align: middle; font-size: 1.4rem;">~</span>
                            <select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled></select>
                            <select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled></select>
                            <span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH"><label for="RANGE_SEARCH"> Range 검색</label></span>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="topWrap" style="display: none">
        <form class="form-inline" id="MONTH_SALE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectMonthSaleStatusList">
            <div class="gubunWrap row2_topWrap">
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
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_MONTH_SALE_STATUS_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="MONTH_SALE_YEAR">조회년도</label>
                            <select class="wd_200" name="MONTH_SALE_YEAR" id="MONTH_SALE_YEAR">
                                <option></option>
                            </select>
                        </span>
                        <span class="txt_span pd-right20">Option</span>
                        <span class="chk_box"><input type="checkbox" name="DEPOSIT_STATUS_DISPLAY" id="DEPOSIT_STATUS_DISPLAY"><label for="DEPOSIT_STATUS_DISPLAY">입금현황 표시</label></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="hWrap">
            <div>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w green" id="CLOSING_HISTORY_SAVE">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap jmestabs" id="CONTROL_SALES_STATUS_TABS" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CLOSING_HISTORY" data-toggle="tab" aria-expanded="true">마감이력</a>
                </li>
                <li>
                    <a href="#MONTHLY_SALES_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                </li>
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

<div class="modal" id="DETAIL_LIST_VIEW_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">신규 주문 등록</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" id="DETAIL_LIST_VIEW_FORM" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="selectControlCloseLeftList">
                    <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                    <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                    <div id="DETAIL_LIST_VIEW_GRID"></div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        let $closingHistoryGrid;
        const tab1GridId = 'CLOSING_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
        let tab1ColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '년도', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '분기', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '마감월', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '품수', dataType: 'string', dataIndx: 'ITEM_NUMBER',
                render: function (ui) {
                    return ("<a href='#DETAIL_LIST_VIEW_POPUP' class='' id='' data-target='' data-toggle='modal' " +
                        "data-refform='DETAIL_LIST_VIEW_POPUP'><u>" + ui.cellData + "</u></a>");
                }
            },
            {title: '최종 공급가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '부가세액', dataType: 'string', dataIndx: 'VAT_AMOUNT'},
            {title: '합계금액', dataType: 'string', dataIndx: 'TOTAL_AMOUNT'},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];
        let tab1Obj = {
            height: 700,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: tab1ColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData,
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            cellClick: function (event, ui) {
                console.log(ui);
                let rowData = ui.rowData;
                if (ui.dataIndx === 'ITEM_NUMBER') {
                    console.log('clcickckdlalgldlsxlzlxlxkzkzks');
                }
            },
        };
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
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM', colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', colModel: []},
            {title: '품명', minWidth: 110, dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '작업<br>형태', minWidth: 110, dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '소재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: 'Part<br>단위<br>수량', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', colModel: []},
            {title: '발주번호', minWidth: 90, datatype: 'string', dataIndx: 'ORDER_NUM', colModel: []},
            // {title: '주문<br>수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '견적단가', minWidth: 90, dataType: 'integer', dataIndx: 'UNIT_FINAL_EST_AMT', colModel: []},
            {title: '공급단가', minWidth: 90, dataType: 'integer', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {title: '합계금액', dataType: 'integer', dataIndx: 'FINAL_AMOUNT', colModel: []}
        ];
        const detailListViewObj = {
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
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
        let tab2ColModel = [
            {title: 'Group', tpHide: true, menuInHide: true, dataIndx: 'grp'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: 'CONTROL_TYPE', dataType: 'string', dataIndx: 'CONTROL_TYPE', hidden: true},
            {title: 'CONTROL_NM', dataType: 'string', dataIndx: 'CONTROL_NM'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true/*, filter:{groupIndx: 'COMP_CD'}*/},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'/*, filter:{groupIndx: 'COMP_NM'}*/},
            {title: '년도', dataType: 'string', dataIndx: 'YYYY', hidden: true},
            {title: '월', dataType: 'string', dataIndx: 'MM'},
            {title: '분기', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '금액', dataType: 'string', dataIndx: 'AMT', summary: {type: 'sum'}}
            // {title: '매출', dataType: 'string', dataIndx: 'OUTPUT_AMT'/*, summary: {type: 'sum'}*/},
            // {title: '입금', dataType: 'string', dataIndx: 'DEPOSIT_AMT'/*, summary: {type: 'sum'}*/}
        ];
        let tab2GroupModel = {
            on: true, //grouping mode.
            titleIndx: 'grp',
            indent: 20,
            fixCols: false,
            pivot: true, //pivotMode
            groupCols: ['YYYY', 'QUARTER', 'MM'],
            // agg:{AMT: 'sum'},
            header: false, //hide grouping toolbar.
            grandSummary: true, //show grand summary row.
            dataIndx: ['COMP_NM', 'ORDER_COMP_NM', 'CONTROL_NM'],
            collapsed: [false, false, false],
            summaryEdit: false
        };
        let tab2Obj = {
            height: 750,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: tab2ColModel,
            groupModel: tab2GroupModel,
            toolPanel: {
                show: false  //show toolPanel initially.
            },
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData,
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        const loadDetailListViewData = function () {

        };

        $('#DETAIL_LIST_VIEW_POPUP').on('show.bs.modal', function (event) {
            console.group('DETAIL_LIST_VIEW_POPUP ON');
            console.log(event);
            console.groupEnd();
            $detailListViewGrid = $('#' + detailListViewGridId).pqGrid(detailListViewObj);
        });

        /* init */
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
        $closingHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlySalesStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('MONTH_SALE_YEAR', 10);

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
                $('.topWrap').toggle();
                $('.hWrap').toggle();
            }
        });
        /* init */
    });
</script>
