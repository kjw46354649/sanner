<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-10-08
  Time: 오전 9:41
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
    <title>부적합 / 반품건수 List 조회</title>
</head>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">부적합 / 반품건수 List 조회</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div class="d-flex align-items-center">
        <div>
            <form class="form-inline" id="MONTH_REPORT_DETAIL_LIST_VIEW_FORM" name="MONTH_REPORT_DETAIL_LIST_VIEW_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectMonthlyReportInspectionDetailList">
                <input type="hidden" name="DT" id="DT">
            </form>
        </div>
        <div class="ml-auto">
        </div>
    </div>
    <div>
        <div id="DETAIL_LIST_VIEW_GRID"></div>
    </div>
    <div class="right_sort">
        전체 조회 건수 (Total : <span id="MONTH_REPORT_INSPECTION_DETAIL_LIST_VIEW_RECORDS" style="color: #00b3ee">0</span>)
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="MONTH_REPORT_INSPECTION_DETAIL_CLOSE_BUTTON">닫기</button>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        $('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM #DT').val($(opener.document).find('#PROCESS_TARGET_BEFORE_FORM > #DT').val());

        const detailListViewGridId = 'DETAIL_LIST_VIEW_GRID';
        const monthReportInspectionDetailListViewPostData = fnFormToJsonArrayData('#MONTH_REPORT_DETAIL_LIST_VIEW_FORM');
        const monthReportInspectionDetailListViewColModel = [
            {title: '발주업체', width:75, dataIndx: 'ORDER_COMP_NM'},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '', minWidth: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
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
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
            {
                title: '', minWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '발주<br>량', dataIndx: 'PART_QTY'},
            {title: '가공완료<br>(입고)일시', width: 80, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '소요<br>시간(분)', maxWidth: 55, dataIndx: 'WORK_TIME'},
             {
                title: '검사결과 (Seq.1)', align: 'center', colModel: [
                    {title: '작성자', minWidth: 65, dataIndx: 'INSPECT_USER_NM'},
                    {title: '등급', minWidth: 40, dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '합/불', minWidth: 50, dataIndx: 'INSPECT_GRADE_NOTE'},
                    {title: '불량수량', dataIndx: 'ERROR_QTY'},
                    {title: '반품일시', minWidth: 80, dataIndx: 'RETURN_SETTLEMENT_DT'},
                    {title: '검사코드', minWidth: 95, dataIndx: 'INSPECT_RESULT_NM'},
                    {title: '상세 내용', minWidth: 100, dataIndx: 'INSPECT_DESC'},
                    {title: '발생공정', minWidth: 60, dataIndx: 'ERROR_PROCESS_NM'},
                    {title: '원인', minWidth: 110, dataIndx: 'ERROR_REASON_NM'},
                    {title: '조치', minWidth: 75, dataIndx: 'ERROR_ACTION_NM'},
                    {title: '작성일시', minWidth: 80, dataIndx: 'INSERT_DT'},
                ]
            },
        ];
        const monthReportInspectionDetailListViewObj = {
            height: 835,
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
            colModel: monthReportInspectionDetailListViewColModel,
            strNoRows: g_noData,
            // dataModel: {data: qwe}
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: monthReportInspectionDetailListViewPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function () {
                let data = $monthReportInspectionDetailListViewGrid.pqGrid('option', 'dataModel.data');
                $('#MONTH_REPORT_INSPECTION_DETAIL_LIST_VIEW_RECORDS').html(data.length);
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 9);
            },
        };
       const $monthReportInspectionDetailListViewGrid = $('#' + detailListViewGridId).pqGrid(monthReportInspectionDetailListViewObj);
        /* init */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>

