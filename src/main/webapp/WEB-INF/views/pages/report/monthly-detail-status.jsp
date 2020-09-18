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
                            <button type="button" class="defaultBtn radius blue ml-15" id="PROCESS_TARGET_LIST-1">발주처별 현황</button>
                            <button type="button" class="defaultBtn radius blue ml-15" id="PROCESS_TARGET_LIST">가공대상 List</button>
                            <button type="button" class="defaultBtn radius green ml-15" id="MONTHLY_DETAIL_STATUS_SAVE">저장</button>
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
                    전체 조회 건수 (Total : <span id="CONTROL_MANAGE_RECORDS" style="color: #00b3ee">0</span>)
                </div>
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
        //TODO: change element id
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
        
        const gridId = 'MONTHLY_DETAIL_STATUS_GRID';
        let postData = fnFormToJsonArrayData('#MONTHLY_DETAIL_STATUS_SEARCH_FORM');
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'COMP_CD', dataIndx: 'COMP_CD', hidden: true},
            {title: 'ORDER_COMP_CD', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: 'DT', dataIndx: 'DT', hidden: true},
            {title: '날짜', dataIndx: 'CAL_DT_NM'},
            {title: '요일', dataIndx: 'WEEK_DAY_NM'},
            {
                title: '납품대상', align: 'center', colModel: [
                    {
                        title: '품', dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind("click", function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT);
                                openNewWindowMonthReportDetail();
                            });
                        }
                    },
                    {
                        title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'PART_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind('click', function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT);
                                openNewWindowMonthReportDetail();
                            });
                        }
                    }
                ]
            },
            {
                title: '외주지정', align: 'center', colModel: [
                    {
                        title: '품', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind("click", function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    },
                    {
                        title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind('click', function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    }
                ]
            },
            {
                title: '가공완료', align: 'center', colModel: [
                    {
                        title: '품', dataType: 'integer', format: '#,###', dataIndx: 'INNER_WORK_FINISH_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind("click", function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    },
                    {
                        title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'INNER_WORK_FINISH_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind('click', function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    }
                ]
            },
           {
                title: '출고완료', align: 'center', colModel: [
                    {
                        title: '품', dataType: 'integer', format: '#,###', dataIndx: 'OUT_FINISH_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind("click", function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    },
                    {
                        title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'OUT_FINISH_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind('click', function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    }
                ]
            },
            {
                title: '지연현황', align: 'center', colModel: [
                    {
                        title: '품', dataType: 'integer', format: '#,###', dataIndx: 'LATE_CNT',
                        style: {'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind("click", function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', '', '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    },
                    {
                        title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'LATE_QTY',
                        style: {'background': '#D6DCE4', 'text-decoration': 'underline', 'cursor': 'pointer'},
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.bind('click', function () {
                                isProcessTargetListButtonClick = false;

                                changeProcessTargetBeforeForm(rowData.DT, '', '', '', 'Y');
                                openNewWindowMonthReportDetail();
                            });
                        }
                    }
                ]
            },
            {title: '지연율', dataIndx: 'LATE_RATIO', style: {'background': '#FFD966'}},
            {title: '외주율<br>(수량)', dataIndx: 'OUTSIDE_RATIO', style: {'background': '#FFD966'}},
            {title: '매출<br>예상금액', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT'},
            {title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'DT_GOAL_AMT'},
            {title: '달성율', dataIndx: 'GOAL_RATIO', style: {'background': '#D9E1F2'}},
            {
                title: '부적합', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'ERROR_CNT', style: {'background': '#FFF2CC'}},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'ERROR_QTY', style: {'background': '#D6DCE4'}}
                ]
            },
            {
                title: '반품건수', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'RETURN_CNT', style: {'background': '#FFF2CC'}},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'RETURN_QTY', style: {'background': '#D6DCE4'}}
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
        /* init */

        /* function */
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

            $monthlyDetailStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#MONTHLY_DETAIL_STATUS_SEARCH_FORM');
            });
            $monthlyDetailStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#MONTHLY_DETAIL_STATUS_SAVE').on('click', function () {
          const updateQueryList = ['reportMapper.insertUpdateWorkingDayNote'];

            fnModifyPQGrid($monthlyDetailStatusGrid, [], updateQueryList);
       });

        $('#PROCESS_TARGET_LIST-1').on('click', function () {
            fnAlert(null, '개발중');
        });

        $('#PROCESS_TARGET_LIST').on('click', function () {
           isProcessTargetListButtonClick = true;

           openNewWindowMonthReportDetail();
        });
        /* evnet */
    });
</script>