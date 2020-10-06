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
                            <button type="button" class="defaultBtn radius blue ml-15" id="MONTHLY_DETAIL_STATUS_SEARCH">검색</button>
                        </div>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="d-flex align-items-center hWrap mb-10">
            <div>
                <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#statusByClientModal">발주처별 현황</button>
                <button type="button" class="defaultBtn btn-100w" id="PROCESS_TARGET_LIST">가공대상 List</button>
            </div>
            <div class="ml-auto">
                <button type="button" class="defaultBtn btn-100w green" id="MONTHLY_DETAIL_STATUS_SAVE">저장</button>
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
                <form class="form-inline" id="STATUS_BY_CLIENT_FORM" role="form" onsubmit="return false;">
                    <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectStatusByClientTableList">
                    <input type="hidden" name="START_DT" id="START_DT">
                    <input type="hidden" name="END_DT" id="END_DT">
                    <div>
                        <span class="slt_wrap">
                            <label class="label_50" for="ORDER_COMP_CD">발주처</label>
                            <input type="text" class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="발주처" readonly>
                        </span>
                        <span class="slt_wrap ml-10"><input type="checkbox" name="ONLY_DATA_CHK" id="ONLY_DATA_CHK" checked><label class="ml-5" for="ONLY_DATA_CHK">only data</label></span>
                    </div>
                </form>
                <div>
                    <div class="d-flex align-items-center mt-10">
                        <div>
                            <button class="triangle left mr-10" id="previous"></button>
                            <span style="font-size: small">조회 주차 변경</span>
                            <button class="triangle right ml-10" id="next"></button>
                        </div>
                        <div class="ml-auto"></div>
                    </div>
                    <div class="mt-10" id="STATUS_BY_CLIENT_GRID"></div>
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
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    comboData.push({title: obj.text, id: obj.value, value: obj.value});
                }

                $('#statusByClientModal').find('#ORDER_COMP_CD').comboTree({
                    source: comboData,
                    isMultiple: true,
                    cascadeSelect: false
                });
            }, parameters, '');
        })();

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

        const statusByClientId = 'STATUS_BY_CLIENT_GRID';
        let statusByClientPostData = fnFormToJsonArrayData('#STATUS_BY_CLIENT_FORM');
        const statusByClientColModel = [
            {title: '발주처', width: 90, dataIndx: 'COMP_NM'},
            {title: '집계항목', width: 60, dataIndx: 'SUB_TYPE_NM'},
            {
                title: '09/14(월)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_1',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_1',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_1',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/15(화)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_2',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_2',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_2',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/16(수)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_3',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_3',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_3',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/17(목)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_4',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_4',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_4',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/18(금)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_5',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_5',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_5',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/19(토)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_6',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_6',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_6',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/20(일)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_7',
                        style: {'background': '#FCE4D6'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_7',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#FCE4D6', 'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_7',
                        styleHead: {'color': 'red'},
                        style: {'background': '#FCE4D6', 'color': 'red'},
                    },
                ]
            },
            {
                title: '09/21(월)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_8',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_8',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_8',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/22(화)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_9',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_9',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_9',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/23(수)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_10',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_10',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_10',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/24(목)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_11',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_11',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_11',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/25(금)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_12',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_12',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_12',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/26(토)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_13',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_13',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_13',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/27(일)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_14',
                        style: {'background': '#FCE4D6'}
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_14',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#FCE4D6', 'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_14',
                        styleHead: {'color': 'red'},
                        style: {'background': '#FCE4D6', 'color': 'red'},
                    },
                ]
            },
            {
                title: '09/28(월)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_15',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_15',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_15',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '09/29(화)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_16',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_16',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_16',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '09/30(수)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_17',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_17',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_17',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '10/01(목)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_18',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_18',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_18',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '10/02(금)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_19',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_19',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_19',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '10/03(토)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_20',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_20',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_20',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '10/04(일)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_21',
                        style: {'background': '#FCE4D6'}
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_21',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#FCE4D6', 'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_21',
                        styleHead: {'color': 'red'},
                        style: {'background': '#FCE4D6', 'color': 'red'},
                    },
                ]
            },
            {
                title: '10/05(월)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_22',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_22',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_22',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '10/06(화)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_23',
                        // style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_23',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_23',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '10/07(수)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_24',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_24',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_24',
                        styleHead: {'color': 'red'},
                        style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '10/08(목)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_25',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_25',
                        style: {'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_25',
                        style: {'color': 'red'}
                    },
                ]
            },
            {
                title: '10/09(금)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_26',
                        style: {'background': '#EAEAEA'},
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_26',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#EAEAEA', 'color': 'blue'}
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_26',
                        styleHead: {'color': 'red'},
            style: {'background': '#EAEAEA', 'color': 'red'}
                    },
                ]
            },
            {
                title: '10/10(토)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_27',
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_27',
                        styleHead: {'color': 'blue'},
                        style: {'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_27',
                        styleHead: {'color': 'red'},
                        style: {'color': 'red'},
                    },
                ]
            },
            {
                title: '10/11(일)', align: 'center',
                colModel: [
                    {
                        title: '납기<br>대상', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ORDER_28',
                        style: {'background': '#FCE4D6'}
                    },
                    {
                        title: '가공<br>완료', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'FINISH_28',
                        styleHead: {'color': 'blue'},
                        style: {'background': '#FCE4D6', 'color': 'blue'},
                    },
                    {
                        title: '남은<br>품수', minWidth: 40, width: 40, maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'REMAIN_28',
                        styleHead: {'color': 'red'},
                        style: {'background': '#FCE4D6', 'color': 'red'},
                    },
                ]
            }
        ];
        const statusByClientObj = {
            height: 650,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            // scrollModel: {autoFit: true},
            // trackModel: {on: true},
            // selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: statusByClientColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: statusByClientPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function () {
                const autoMerge = function (grid, refresh) {
                    let mc = [],
                        CM = grid.option('colModel'),
                        i = CM.length,
                        data = grid.option('dataModel.data');

                    while (i--) {
                        let dataIndx = CM[i].dataIndx,
                            rc = 1,
                            j = data.length;

                        while (j--) {
                            let cd = data[j][dataIndx],
                                cd_prev = data[j - 1] ? data[j - 1][dataIndx] : undefined;
                            if (cd_prev !== undefined && cd == cd_prev) {
                                rc++;
                            } else if (rc > 1) {
                                mc.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }
                    }
                    grid.option('mergeCells', mc);
                    if (refresh) {
                        grid.refreshView();
                    }
                };
                autoMerge(this, true);
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 2);
            },
            rowInit: function (ui) {
                switch (ui.rowData.COMP_NM) {
                    case '합계':
                        return {style: {'background': 'yellow'}};
                    case '총계':
                        return {style: {'background': '#FFE699'}};
                }
            }
        };
        let $statusByClientGrid;
        /* init */

        /* function */
        const changeThead = function () {
            let parameter = {'url': '/json-list', 'data': {'queryId': 'reportMapper.selectStatusByClientTableHeader', START_DT: startDt, END_DT: endDt}};

            fnPostAjaxAsync(function (data) {
                let colModel = $statusByClientGrid.pqGrid('getInstance').grid.option('colModel');

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    const rowData = data.list[i];
                    colModel[i + 2].title = rowData.F_DT + rowData.DAY;
                    colModel[i + 2].styleHead = {};
                    colModel[i + 2].colModel[0].styleHead = {};
                    colModel[i + 2].colModel[1].styleHead = {'color': 'blue'};
                    colModel[i + 2].colModel[2].styleHead = {'color': 'red'};

                    if (rowData.TODAY_YN === 'Y') {
                        colModel[i + 2].styleHead = {'background': '#FCE4D6'};
                        colModel[i + 2].colModel[0].styleHead = {'background': '#FCE4D6'};
                        colModel[i + 2].colModel[1].styleHead = {'background': '#FCE4D6', 'color': 'blue'};
                        colModel[i + 2].colModel[2].styleHead = {'background': '#FCE4D6', 'color': 'red'};
                    }
                }
            }, parameter);
        };

        const changeTbody = function () {
            $statusByClientGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#STATUS_BY_CLIENT_FORM');
            });
            $statusByClientGrid.pqGrid('refreshDataAndView');
        };

        const changeOrderStateTable = function () {
            changeThead();
            changeTbody();
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

        const setDate = function (data) {
            if (!fnIsEmpty(data.info)) {
                startDt = data.info.START_DT;
                endDt = data.info.END_DT;
                $('#STATUS_BY_CLIENT_FORM > #START_DT').val(startDt);
                $('#STATUS_BY_CLIENT_FORM > #END_DT').val(endDt);
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
                setDate(data);
            }, parameter, '');

            $statusByClientGrid = $('#' + statusByClientId).pqGrid(statusByClientObj);
            changeOrderStateTable();
            },
            'hide.bs.modal': function () {
                $statusByClientGrid.pqGrid('destroy');
            }
        });

        $('#statusByClientModal').find('#previous').on('click', function () {
            let parameter = {'url': '/json-info', 'data': {'queryId': 'reportMapper.selectGetPreviousDate', 'START_DT': startDt}};

            fnPostAjaxAsync(function (data) {
                setDate(data);
            }, parameter, '');

            changeOrderStateTable();
        });

        $('#statusByClientModal').find('#next').on('click', function () {
            let parameter = {'url': '/json-info', 'data': {'queryId': 'reportMapper.selectGetNextDate', 'START_DT': startDt}};

            fnPostAjaxAsync(function (data) {
                setDate(data);
            }, parameter, '');

            changeOrderStateTable();
        });

        $('#STATUS_BY_CLIENT_FORM').on('change', function () {
            try {
                changeOrderStateTable();
            } catch (e) {
                console.log(e);
            }
        });

        $('#PROCESS_TARGET_LIST').on('click', function () {
           isProcessTargetListButtonClick = true;

           openNewWindowMonthReportDetail();
        });
        /* evnet */
    });
</script>