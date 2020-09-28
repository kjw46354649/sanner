<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-14
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page">
    <div class="topWrap">
        <form class="form-inline" id="MONTHLY_DETAIL_STATUS_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectMonthlyDetailStatusList">
            <div class="none_gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100">조회년월</label>
                            <select class="wd_100" class="two" name="YEAR" id="MONTHLY_DETAIL_STATUS_YEAR"></select>
                            <select class="wd_100" class="two" name="MONTH" id="MONTHLY_DETAIL_STATUS_MONTH"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <div class="d-inline-block right_float">
                            <button type="button" class="defaultBtn radius blue ml-15" data-toggle="modal" data-target="#statusByClientModal">발주처별 현황</button>
                            <button type="button" class="defaultBtn radius blue ml-15" id="PROCESS_TARGET_LIST">가공대상 List</button>
                            <button type="button" class="defaultBtn radius green ml-15" id="MONTHLY_DETAIL_STATUS_SAVE">저장</button>
                            <button type="button" class="defaultBtn radius blue ml-15" id="MONTHLY_DETAIL_STATUS_SEARCH">조회</button>
                        </div>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="<%--hWrap --%>mb-10">
            <div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="MONTHLY_DETAIL_STATUS_GRID"></div>
                <div class="right_sort">
<%--                    전체 조회 건수 (Total : <span id="CONTROL_MANAGE_RECORDS" style="color: #00b3ee">0</span>)--%>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="statusByClientModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 1536px; height: 864px">
        <div class="modal-content" style="height: inherit;">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">상세 List 조회</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" <%--style="height: px"--%>>
                <div>
                    <span class="slt_wrap">
                    <label class="label_50" for="ORDER_COMP_CD">발주처</label>
                    <select class="wd_100" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                    </select>
                    </span>
                </div>
                <div>
                    <div class="d-flex align-items-center mt-10">
                        <div>
                            <button class="triangle left mr-10" id="previous"></button>
                            <span style="font-size: small">조회 주차 변경</span>
                            <button class="triangle right ml-10" id="next"></button>
                        </div>
                        <div class="ml-auto"></div>
                    </div>
                    <div class="mt-10" style="height: 650px; overflow: auto;">
                        <table class="tg">
                            <thead>
                              <tr>
                                <th rowspan="2">발주처</th>
                                <th colspan="3">8/3(월)</th>
                              </tr>
                              <tr>
                                <th class="tg-ul38 tg-ul38">납기<br>대상</th>
                                <th class="tg-ul38 tg-ul38 blue">가공<br>완료</th>
                                <th class="tg-ul38 red">남은<br>품수</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div></div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<form id="PROCESS_TARGET_BEFORE_FORM">
    <input type="hidden" name="DT" id="DT">
    <input type="hidden" name="COMP_CD" id="COMP_CD">
    <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
    <input type="hidden" name="FACTORY_CLASSIFY_YN" id="FACTORY_CLASSIFY_YN">
    <input type="hidden" name="OUTSIDE_YN" id="OUTSIDE_YN">
    <input type="hidden" name="OUT_FINISH_YN" id="OUT_FINISH_YN">
    <input type="hidden" name="DELAY_YN" id="DELAY_YN">
</form>

<script>
    var isProcessTargetListButtonClick = false;
    $(function () {
        'use strict';
        /* init */
        let monthReportDetailPopup;
        let startDt, endDt; // 발주처별 현황
        fnAppendSelectboxYear('MONTHLY_DETAIL_STATUS_YEAR', 10);
        fnAppendSelectboxMonth('MONTHLY_DETAIL_STATUS_MONTH');
        $('#MONTHLY_DETAIL_STATUS_MONTH').val(CURRENT_MONTH < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);

        fnCommCodeDatasourceSelectBoxCreate($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#statusByClientModal').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        const gridId = 'MONTHLY_DETAIL_STATUS_GRID';
        let postData = fnFormToJsonArrayData('#MONTHLY_DETAIL_STATUS_SEARCH_FORM');
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'COMP_CD', dataIndx: 'COMP_CD', hidden: true},
            {title: 'ORDER_COMP_CD', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: 'DT', dataIndx: 'DT', hidden: true},
            {title: '날짜', minWidth: 40, maxWidth: 40, dataIndx: 'CAL_DT_NM'},
            {title: '요일', minWidth: 30, maxWidth: 30, dataIndx: 'WEEK_DAY_NM'},
            {
                title: '납품대상', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind("click", function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT);
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind('click', function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT);
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    }
                ]
            },
            {
                title: '외주지정', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind("click", function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind('click', function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    }
                ]
            },
            {
                title: '가공완료', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'INNER_WORK_FINISH_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind("click", function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'INNER_WORK_FINISH_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind('click', function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    }
                ]
            },
           {
                title: '출고완료', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'OUT_FINISH_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind("click", function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'OUT_FINISH_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind('click', function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    }
                ]
            },
            {
                title: '지연현황', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'LATE_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind("click", function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', '', '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'LATE_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            if (!(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계')) {
                                $cell.bind('click', function () {
                                    isProcessTargetListButtonClick = false;

                                    changeProcessTargetBeforeForm(rowData.DT, '', '', '', 'Y');
                                    openNewWindowMonthReportDetail();
                                });
                            }
                        }
                    }
                ]
            },
            {
                title: '지연율', minWidth: 50, maxWidth: 50, dataIndx: 'LATE_RATIO', style: {'background': '#FFD966'},
                render: function (ui) {
                    const rowData = ui.rowData;

                    switch (rowData.CAL_DT_NM) {
                        case '합계':
                            return {style: {'background': 'yellow'}};
                        case '총계':
                            return {style: {'background': '#FFE699'}};
                    }
                }
            },
            {
                title: '외주율<br>(수량)', minWidth: 50, maxWidth: 50, dataIndx: 'OUTSIDE_RATIO', style: {'background': '#FFD966'},
                render: function (ui) {
                    const rowData = ui.rowData;

                    switch (rowData.CAL_DT_NM) {
                        case '합계':
                            return {style: {'background': 'yellow'}};
                        case '총계':
                            return {style: {'background': '#FFE699'}};
                    }
                }
            },
            {title: '매출<br>예상금액', minWidth: 100, maxWidth: 100,dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT'},
            {title: '목표금액', minWidth: 100, maxWidth: 100, dataType: 'integer', format: '#,###', dataIndx: 'DT_GOAL_AMT'},
            {
                title: '달성율', minWidth: 50, maxWidth: 50, dataIndx: 'GOAL_RATIO', style: {'background': '#D9E1F2'},
                render: function (ui) {
                    const rowData = ui.rowData;

                    switch (rowData.CAL_DT_NM) {
                        case '합계':
                            return {style: {'background': 'yellow'}};
                        case '총계':
                            return {style: {'background': '#FFE699'}};
                    }
                },
            },
            {
                title: '부적합', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_CNT', style: {'background': '#FFF2CC'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_QTY', style: {'background': '#D6DCE4'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        }
                    }
                ]
            },
            {
                title: '반품건수', align: 'center', colModel: [
                    {
                        title: '품', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'RETURN_CNT', style: {'background': '#FFF2CC'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        }
                    },
                    {
                        title: 'EA', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'RETURN_QTY', style: {'background': '#D6DCE4'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            switch (rowData.CAL_DT_NM) {
                                case '합계':
                                    return {style: {'background': 'yellow'}};
                                case '총계':
                                    return {style: {'background': '#FFE699'}};
                            }
                        }
                    }
                ]
            },
            {
                title: '비고', dataIndx: 'NOTE', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const obj = {
            height: 800,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowInit: function (ui) {
                if (ui.rowData.WEEK_DAY_NM === '일') {
                    return {style: {'color': 'red'}};
                }

                switch (ui.rowData.CAL_DT_NM) {
                    case '합계':
                        return {style: {'background': 'yellow'}};
                    case '총계':
                        return {style: {'background': '#FFE699'}};
                }
            }
        };
        const $monthlyDetailStatusGrid = $('#' + gridId).pqGrid(obj);

        const colModel1 = [
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '집계항목', dataIndx: 'DT', hidden: true},
            {
                title: '09/14(월)', align: 'center', colModel: [
                    {
                        title: '납기<br>대상', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {
                            const rowData = ui.rowData;

                            if (rowData.TODAY_YN === 'Y') {
                                return {cls: 'bg-moccasin'};
                            }
                        }
                    },
                    {
                        title: '가공<br>완료', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {

                        }
                    },
                    {
                        title: '남은<br>품수', minWidth: 50, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        render: function (ui) {

                        }
                    },
                ]
            }

        ];

        /* init */

        /* function */
        const createThead = function () {
            let parameter = {'url': '/json-list', 'data': {'queryId': 'reportMapper.selectStatusByClientTableHeader', START_DT: startDt, END_DT: endDt}};
            fnPostAjaxAsync(function (data) {
                let firstRow = '';
                let secondRow = '';
                let dummy = '<th>납기<br>대상</th>\n' +
                            '<th class="text-blue">가공<br>완료</th>\n' +
                            '<th class="text-red">남은<br>품수</th>';
                if (!fnIsEmpty(data.list)) {
                    firstRow += '<th rowspan="2">발주처</th>';
                    firstRow += '<th rowspan="2">집계항목</th>'
                    for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                        const rowData = data.list[i];

                        if (rowData.TODAY_YN === 'Y') {
                            firstRow += '<th colspan="3" style="background-color: #FFE699">' + rowData.F_DT + rowData.DAY + '</th>';
                            secondRow += '<th style="background-color: #FFE699">납기<br>대상</th>\n' +
                                    '<th class="text-blue" style="background-color: #FFE699">가공<br>완료</th>\n' +
                                    '<th class="text-red" style="background-color: #FFE699">남은<br>품수</th>';
                        } else {
                            firstRow += '<th colspan="3">' + rowData.F_DT + rowData.DAY + '</th>';
                            secondRow += dummy;
                        }
                    }
                }
                $('table.tg > thead > tr:first').html(firstRow);
                $('table.tg > thead > tr:last').html(secondRow);
            }, parameter, '');
        };

        const createTbody = function () {
            const orderCompCd = $('#statusByClientModal').find('#ORDER_COMP_CD').val();
            const parameter = {'url': '/json-list', 'data': {'queryId': 'reportMapper.selectStatusByClientTableList', START_DT: startDt, END_DT: endDt, ORDER_COMP_CD: orderCompCd}};

            fnPostAjaxAsync(function (data) {
                let row = '';
                if (!fnIsEmpty(data.list)) {
                    for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                        const rowData = data.list[i];

                        row += '<tr>';
                        if (i % 2 === 0) {
                            row += '<td title="' + rowData.COMP_NM + '" rowspan="2">' + rowData.COMP_NM + '</td>';
                        } else {
                            row += '<td title="' + rowData.COMP_NM + '" style="display: none">' + rowData.COMP_NM + '</td>';
                        }
                        row += '<td>' + rowData.SUB_TYPE_NM + '</td>';
                        for (let j = 1; j <= 28; j++) {
                            row += '<td title="' + rowData['ORDER_' +  j] + '">' + rowData['ORDER_' +  j] + '</td>';
                            row += '<td title="' + rowData['FINISH_' +  j] + '" class="text-blue">' + rowData['FINISH_' +  j] + '</td>';
                            row += '<td title="' + rowData['REMAIN_' +  j] + '" class="text-red">' + rowData['REMAIN_' +  j] + '</td>';
                        }
                        row += '</tr>';
                    }
                    // TODO: 합계·총계 row background-color
                }
                $('table.tg > tbody').html(row);
            }, parameter, '');
        };

        const createOrderStateTable = function () {
            createThead();
            createTbody();
        };

        const changeProcessTargetBeforeForm = function (a, c = '', d = '', e = '', f = '') {
            $('#PROCESS_TARGET_BEFORE_FORM > #DT').val(a);
            $('#PROCESS_TARGET_BEFORE_FORM > #FACTORY_CLASSIFY_YN').val(c);
            $('#PROCESS_TARGET_BEFORE_FORM > #OUTSIDE_YN').val(d);
            $('#PROCESS_TARGET_BEFORE_FORM > #OUT_FINISH_YN').val(e);
            $('#PROCESS_TARGET_BEFORE_FORM > #DELAY_YN').val(f);
        };

        const openNewWindowMonthReportDetail = function (rowData) {
            let url = '/monthReportDetail';
            // 팝업 사이즈
            let nWidth = 1728;
            let nHeight = 770;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (monthReportDetailPopup === undefined || monthReportDetailPopup.closed) {
                monthReportDetailPopup = window.open(url, '', strOption);
            } else {
                monthReportDetailPopup.focus();
                //TODO: research
            }
        };
        /* function */

        /* evnet */
        $('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').on('change', function () {
            $('#PROCESS_TARGET_BEFORE_FORM > #COMP_CD').val($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#COMP_CD').val());
            $('#PROCESS_TARGET_BEFORE_FORM > #ORDER_COMP_CD').val($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#ORDER_COMP_CD').val());
        });

        $('#MONTHLY_DETAIL_STATUS_SEARCH').on('click', function () {
            $monthlyDetailStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#MONTHLY_DETAIL_STATUS_SEARCH_FORM');
            });
            $monthlyDetailStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#MONTHLY_DETAIL_STATUS_SAVE').on('click', function () {
          const updateQueryList = ['reportMapper.insertUpdateWorkingDayNote'];

            fnModifyPQGrid($monthlyDetailStatusGrid, [], updateQueryList);
       });

        $('#statusByClientModal').on({
            'show.bs.modal': function () {
            let parameter = {'url': '/json-info', 'data': {'queryId': 'reportMapper.selectGetDate'}};

            fnPostAjaxAsync(function (data) {
                if (!fnIsEmpty(data.info)) {
                    startDt = data.info.START_DT;
                    endDt = data.info.END_DT;
                }
            }, parameter, '');

            createOrderStateTable();
            },
            'hide.bs.modal': function () {

            }
        });

        $('#statusByClientModal').find('#previous').on('click', function () {
            let parameter = {'url': '/json-info', 'data': {'queryId': 'reportMapper.selectGetPreviousDate', 'START_DT': startDt}};

            fnPostAjaxAsync(function (data) {
                if (!fnIsEmpty(data.info)) {
                    startDt = data.info.START_DT;
                    endDt = data.info.END_DT;
                }
            }, parameter, '');

            createOrderStateTable();
        });

        $('#statusByClientModal').find('#next').on('click', function () {
            let parameter = {'url': '/json-info', 'data': {'queryId': 'reportMapper.selectGetNextDate', 'START_DT': startDt}};

            fnPostAjaxAsync(function (data) {
                if (!fnIsEmpty(data.info)) {
                    startDt = data.info.START_DT;
                    endDt = data.info.END_DT;
                }
            }, parameter, '');

            createOrderStateTable();
        });

        $('#statusByClientModal').find('#ORDER_COMP_CD').on('change', function () {
            createTbody();
        });

        $('#PROCESS_TARGET_LIST').on('click', function () {
           isProcessTargetListButtonClick = true;

           openNewWindowMonthReportDetail();
        });
        /* evnet */
    });
</script>