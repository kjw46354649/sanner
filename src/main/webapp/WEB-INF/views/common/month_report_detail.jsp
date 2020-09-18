<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-15
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>상세 List 조회</title>
</head>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">상세 List 조회</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div class="d-flex align-items-center">
        <div>
            <form class="form-inline" id="MONTH_REPORT_DETAIL_LIST_VIEW_FORM" name="MONTH_REPORT_DETAIL_LIST_VIEW_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectMonthlyReportDetailList1">
                <span class="slt_wrap">
                    <label>조회 대상 납기</label>
                </span>
                <span class="calendar_span">
                    <input type="text" title="달력정보" name="MONTH_REPORT_DETAIL_START_DATE" id="MONTH_REPORT_DETAIL_START_DATE" readonly><button type="button" id="MONTH_REPORT_DETAIL_START_DATE_BUTTON">달력선택</button>
                </span>
                <span class="nbsp">~</span>
                <span class="calendar_span">
                    <input type="text" title="달력정보" name="MONTH_REPORT_DETAIL_END_DATE" id="MONTH_REPORT_DETAIL_END_DATE" readonly><button type="button" id="MONTH_REPORT_DETAIL_END_DATE_BUTTON">달력선택</button>
                </span>
                <span class="slt_wrap">
                    <label class="label_50" for="COMP_CD">사업자</label>
                    <select class="wd_100" name="COMP_CD" id="COMP_CD" title="사업자">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="ORDER_COMP_CD">발주처</label>
                    <select class="wd_100" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap ml-20">
                    <label class="label_50" for="FACTORY_CLASSIFY_YN">가공완료</label>
                    <select class="wd_70" name="FACTORY_CLASSIFY_YN" id="FACTORY_CLASSIFY_YN" title="가공완료">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1042}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap ml-20">
                    <label class="label_50" for="OUTSIDE_YN">외주대상</label>
                    <select class="wd_70" name="OUTSIDE_YN" id="OUTSIDE_YN" title="외주대상">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1042}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap ml-20">
                    <label class="label_50" for="OUT_FINISH_YN">출고완료</label>
                    <select class="wd_70" name="OUT_FINISH_YN" id="OUT_FINISH_YN" title="출고완료">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1042}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap ml-20">
                    <label class="label_50" for="DELAY_YN">지연여부</label>
                    <select class="wd_70" name="DELAY_YN" id="DELAY_YN" title="지연여부">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1042}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
            </form>
        </div>
        <div class="ml-auto">
            <button type="button" class="defaultBtn btn-100w green" id="MONTH_REPORT_DETAIL_LIST_VIEW_SAVE">저장</button>
        </div>
    </div>

    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div>
        <div id="DETAIL_LIST_VIEW_GRID"></div>
    </div>
    <div class="right_sort">
        전체 조회 건수 (Total : <span id="MONTH_REPORT_DETAIL_LIST_VIEW_RECORDS" style="color: #00b3ee">0</span>)
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="MONTH_REPORT_DETAIL_CLOSE_BUTTON">닫기</button>
    </div>
</div>

<script>
    $('#MONTH_REPORT_DETAIL_START_DATE').datepicker({dateFormat: 'yy/mm/dd'});
    $('#MONTH_REPORT_DETAIL_END_DATE').datepicker({dateFormat: 'yy/mm/dd'});

    $(function () {
        'use strict';
        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        if (opener.isProcessTargetListButtonClick) {
            $('#MONTH_REPORT_DETAIL_START_DATE').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH - 1, TODAY.getDate()));
            $('#MONTH_REPORT_DETAIL_END_DATE').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH + 2, TODAY.getDate()));
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #COMP_CD').val('').prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #ORDER_COMP_CD').val('').prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #FACTORY_CLASSIFY_YN').val('N').prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #OUTSIDE_YN').val('').prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #OUT_FINISH_YN').val('').prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #DELAY_YN').val('').prop('selected', true);
        } else {
            let date = $(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #DT').val();
            let k = new Date(date.substring(0, 4), date.substring(4, 6) - 1, date.substring(6))
            $('#MONTH_REPORT_DETAIL_START_DATE').datepicker('setDate', k);
            $('#MONTH_REPORT_DETAIL_END_DATE').datepicker('setDate', k);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #COMP_CD').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #COMP_CD').val()).prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #ORDER_COMP_CD').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #ORDER_COMP_CD').val()).prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #FACTORY_CLASSIFY_YN').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #FACTORY_CLASSIFY_YN').val()).prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #OUTSIDE_YN').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #OUTSIDE_YN').val()).prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #OUT_FINISH_YN').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #OUT_FINISH_YN').val()).prop('selected', true);
            $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #DELAY_YN').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #DELAY_YN').val()).prop('selected', true);
        }

        const detailListViewGridId = 'DETAIL_LIST_VIEW_GRID';
        const monthReportDetailListViewPostData = fnFormToJsonArrayData('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM');
        const monthReportDetailListViewColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width:75, dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', minWidth: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind('click', function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 25, dataType: 'integer', format: '#,###', dataIndx: 'PART_NUM'},
            {title: '???', dataIndx: ''},
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
            {title: '발주<br>납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '발주<br>량', dataIndx: 'PART_QTY'},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM'},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {title: '가공완료<br>일시', width: 70, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '가공시간', dataIndx: 'WORK_TIME'},
            {title: '외주<br>업체', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '외주<br>입고일시', dataIndx: 'OUTSIDE_IN_DT'},
            {title: '출고일시', dataIndx: 'ORDER_OUT_FINISH_DT'},
            {
                title: '예상단가', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {title: '합계금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: 'P/H', dataType: 'integer', format: '#,###', dataIndx: 'PRICE_PER_HOUR'},
            // {
            //     title: '단가정보', align: 'center', colModel: [
            //         {title: '종전가', dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT', hidden: true},
            //         {title: '견적가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', hidden: true},
            //         {title: '공급가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', hidden: true}
            //     ]
            // },
            {
                title: '검사결과', align: 'center', colModel: [
                    {title: '등급', dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '검사코드', dataIndx: 'INSPECT_RESULT_NM'}
                ]
            },
            {title: '부적합<br>수량', dataIndx: 'ERROR_QTY'},
            {title: '반품<br>수량', dataIndx: 'RETURN_QTY'},
            {
                title: '비고', dataIndx: 'NOTE', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const monthReportDetailListViewObj = {
            height: 600,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: monthReportDetailListViewColModel,
            strNoRows: g_noData,
            // dataModel: {data: qwe}
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: monthReportDetailListViewPostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 9);
            },
            load: function () {
                let data = $monthReportDetailListViewGrid.pqGrid('option', 'dataModel.data');
                $('#MONTH_REPORT_DETAIL_LIST_VIEW_RECORDS').html(data.length);
            }
        };
       const $monthReportDetailListViewGrid = $('#' + detailListViewGridId).pqGrid(monthReportDetailListViewObj);
       /* init */

        /* event */
        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', _.debounce(function () {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $monthReportDetailListViewGrid.pqGrid('option', 'height', size);
        }, 500));

        $('#MONTH_REPORT_DETAIL_CLOSE_BUTTON').on('click', function () {
            window.close();
        });

        $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM').on('change', function () {
            $monthReportDetailListViewGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM');
            });
            $monthReportDetailListViewGrid.pqGrid('refreshDataAndView');
        });

        $('#MONTH_REPORT_DETAIL_LIST_VIEW_SAVE').on('click', function () {
           const updateQueryList = ['reportMapper.updateControlPartSizeTxt', 'reportMapper.updateControlPartForecastUnitAmt', 'reportMapper.updateControlNote'];

            fnModifyPQGrid($monthReportDetailListViewGrid, [], updateQueryList);
        });
       /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
