<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    .d-inline.inspection_history_div, .inspection_result_history_div {
        font-weight: 400;
        font-family: 'NotoKrM', Arial,sans-serif;
    }
</style>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="inspection_history_form" name="inspection_history_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionHistoryList">
            <div class="none_gubunWrap row3_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_ORDER_COMP_CD">발주업체</label>
                           <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주업체">
                               <option value=""><spring:message code="com.form.top.all.option" /></option>
                           </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                           <label class="label_100" for="SEL_CONTROL_NUM">작업지시번호</label>
                           <input type="search" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                           <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                           <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                         </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재종류</label>
                            <select id="SEL_MATERIAL_DETAIL" name="SEL_MATERIAL_DETAIL" title="소재종류" class="wd_200">
                              <option value=""><spring:message code="com.form.top.all.option" /></option>
                              <c:forEach var="vlocale" items="${HighCode.H_1027}">
                                  <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                              </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li class="inspection_history_div">
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_INSPECT_METHOD">측정방식</label>
                           <select id="SEL_INSPECT_METHOD" name="SEL_INSPECT_METHOD" title="측정방식" class="wd_200">
                             <option value=""><spring:message code="com.form.top.all.option" /></option>
                             <c:forEach var="vlocale" items="${HighCode.H_1060}">
                                 <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                             </c:forEach>
                           </select>
                       </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">1040
                            <label class="label_100" for="SEL_INSPECT_GRADE_SELECT">검사결과등급</label>
                            <input type="text" class="wd_200" name="SEL_INSPECT_GRADE_SELECT" id="SEL_INSPECT_GRADE_SELECT" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="검사결과등급">
                            <input type="hidden" name="SEL_INSPECT_GRADE" id="SEL_INSPECT_GRADE">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_INSPECT_RESULT">불량코드</label>
                           <select id="SEL_INSPECT_RESULT" name="SEL_INSPECT_RESULT" title="불량코드" class="wd_200">
                             <option value=""><spring:message code="com.form.top.all.option" /></option>
                             <c:forEach var="vlocale" items="${HighCode.H_1020}">
                                 <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                             </c:forEach>
                           </select>
                       </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_ERROR_ACTION">조치</label>
                           <select id="SEL_ERROR_ACTION" name="SEL_ERROR_ACTION" title="조치" class="wd_200">
                             <option value=""><spring:message code="com.form.top.all.option" /></option>
                             <c:forEach var="vlocale" items="${HighCode.H_1025}">
                                 <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                             </c:forEach>
                           </select>
                       </span>
                        <span class="gubun"></span>
                    </li>
                    <li class="inspection_result_history_div" style="display: none;">
                        <span class="ipu_wrap">
                           <label class="label_100" for="SEL_NOTE">비고</label>
                           <input type="search" class="wd_200" name="SEL_NOTE" id="SEL_NOTE" title="비고">
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_INSPECT_USER_ID">검사자</label>
                            <select class="wd_200" id="SEL_INSPECT_USER_ID" name="SEL_INSPECT_USER_ID" data-required="true">
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            </select>
                       </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100">검사일시</label>
                        </span>
                        <div class="calendar_wrap" style="padding-left: 0px;">
                            <span class="calendar_span">
                                <input type="text" name="SEL_INSPECTION_ST_DT" id="SEL_INSPECTION_ST_DT" placeholder="" value="" title="시작날짜" readonly=""><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="SEL_INSPECTION_END_DT" id="SEL_INSPECTION_END_DT" placeholder="" value="" title="종료날짜" readonly=""><button type="button">달력선택</button>
                            </span>
                            <span class="radio_box" style="margin-left:10px;">
                                <input reqcd="R" type="radio" name="SEL_INSPECTION_RETURN_TERM" id="SEL_INSPECTION_RETURN_TERM_1" value="today"><label for="SEL_INSPECTION_RETURN_TERM_1">오늘</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="SEL_INSPECTION_RETURN_TERM" id="SEL_INSPECTION_RETURN_TERM_2" value="week"><label for="SEL_INSPECTION_RETURN_TERM_2">-1주</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="SEL_INSPECTION_RETURN_TERM" id="SEL_INSPECTION_RETURN_TERM_3" value="month"><label for="SEL_INSPECTION_RETURN_TERM_3">-1개월</label>
                            </span>
                        </div>
                         <span class="ipu_wrap right_float">
                            <button type="button" id="inspection_history_export_btn"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue ml-10" id="inspection_history_search_btn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap jmestabs" id="inspection_history_tabs">
            <ul class="smallTabMenuTabs">
                <li class="active"><a href="#INSPECTION_HISTORY_TAB" data-toggle="tab" aria-expanded="true">검사결과이력</a></li>
                <li><a href="#INSPECTION_RESULT_TAB" data-toggle="tab" aria-expanded="false">성적서이력</a></li>
                <div class="d-inline right_float inspection_history_div" style="margin-top: 2px;">
                    <input type="search" id="inspectionHistoryFilterKeyword" placeholder="Enter your keyword">
                    <label for="inspectionHistoryFrozen" class="label_30" style="font-size: 15px;">Fix</label>
                    <select id="inspectionHistoryFrozen" name="inspectionHistoryFrozen">
                    </select>
                    <select id="inspectionHistoryFilterColumn" style="display: none;"></select>
                    <select id="inspectionHistoryFilterCondition" style="display: none;">
                        <option value="contain">Contains</option>
                    </select>
                    <button type="button" class="defaultBtn btn-100w ml-25" id="inspection_history_barcode_drawing_print">바코드도면 출력</button>
                </div>
                <div class="d-inline right_float inspection_result_history_div" style="margin-top: 2px;display: none;">
                    <input type="search" id="inspectionResultHistoryFilterKeyword" placeholder="Enter your keyword">
                    <label for="inspectionResultHistoryFrozen" class="label_30" style="font-size: 15px;">Fix</label>
                    <select id="inspectionResultHistoryFrozen" name="inspectionResultHistoryFrozen">
                    </select>
                    <select id="inspectionResultHistoryFilterColumn" style="display: none;"></select>
                    <select id="inspectionResultHistoryFilterCondition" style="display: none;">
                        <option value="contain">Contains</option>
                    </select>
                </div>
            </ul>
            <div class="tab-content" style="margin-top: 4px;">
                <ul class="active" id="INSPECTION_HISTORY_TAB">
                    <div class="conMainWrap">
                        <div id="inspection_history_grid"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="inspection_history_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
                <ul class="" id="INSPECTION_RESULT_TAB">
                    <div class="conWrap">
                        <div id="inspection_result_history_grid"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="inspection_result_history_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>


<form id="inspection_history_result_data_form" name="inspection_history_result_data_form" method="post">
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ">
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ">
</form>



<script>
    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionHistoryGridId01 = $("#inspection_history_grid");
        let inspectionResultHistoryGrid = $("#inspection_result_history_grid");
        let inspectionHistoryColModel01;
        let inspectionResultHistoryColModel01;
        let inspectionHistoryPostData01;

        let today = new Date();
        $('#SEL_INSPECTION_ST_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_INSPECTION_END_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_INSPECTION_ST_DT').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY));
        $('#SEL_INSPECTION_END_DT').datepicker('setDate', 'today');
        $("#inspection_history_form").find("#SEL_INSPECTION_RETURN_TERM_1").trigger("click");

        $("#inspection_history_form").find('[name=SEL_INSPECTION_RETURN_TERM]').change(function () {
            let value = $(this).val();
            let today = TODAY;
            let newDate = new Date();

            switch (value) {
                case 'today':
                    break;
                case 'week':
                    newDate.setDate(newDate.getDate() - 7);
                    break;
                case 'month':
                    newDate.setMonth(newDate.getMonth() - 1);
                    break;
            }

            $("#inspection_history_form").find('#SEL_INSPECTION_ST_DT').val(newDate.yyyymmdd());
            $("#inspection_history_form").find('#SEL_INSPECTION_END_DT').val(today.yyyymmdd());
            // outgoingChangeDate(newDate, today);

        });

        /**  리스트 그리드 선언 시작 **/
        $("#inspection_history_form").find("#queryId").val("inspection.selectInspectionHistoryList");
        inspectionHistoryPostData01 = fnFormToJsonArrayData('#inspection_history_form');
        inspectionHistoryColModel01 = [
            {title: 'INSPECT_SEQ', dataType: 'string', dataIndx: 'INSPECT_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: 'MCT_WORK_SEQ', dataType: 'string', dataIndx: 'MCT_WORK_SEQ', hidden:true},
            {title: 'INSPECT_TYPE', dataType: 'string', dataIndx: 'INSPECT_TYPE', hidden:true},
            {title: 'INSPECT_GRADE', dataType: 'string', dataIndx: 'INSPECT_GRADE', hidden:true},
            // {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 80, width: 80},
            {title: '등록일시', dataType: 'string', dataIndx: 'INSEPCT_INSERT_DT', minWidth: 80, width: 80},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 90, width: 90},
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_PART_INFO', minWidth: 140, width: 140},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 150, width: 150},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 50, width: 50},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 60, width: 60},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY_NM', minWidth: 70, width: 70},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 100, width: 100},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 90, width: 90},
            // {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 80, width: 80},
            // {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN', minWidth: 35, width: 35},
            // {title: '주요 검사', dataType: 'string', dataIndx: 'MAIN_INSPECTION_NM', minWidth: 80, width: 80},
            // {title: '카드', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[카]";
            //         return '';
            //     }
            // },
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 35, width: 35},
            // {title: 'WORK_TYPE', dataType: 'string', dataIndx: 'WORK_TYPE', hidden:true},
            // {title: 'MATERIAL_TYPE', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden:true},
            // {title: '소재분류', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', minWidth: 120, width: 120},
            // {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            // {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 110, width: 110},
            // {title: '주문 비고사항', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120},
            // {title: '현재위치', dataType: 'string', dataIndx: 'POP_NM', minWidth: 100, width: 100},
            {
                title: '품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'seq', datatype: 'string', dataIndx: 'Q_SEQ', minWidth: 40, width: 40},
                    {title: '작성자', datatype: 'string', dataIndx: 'Q_INSPECT_USER_NM', minWidth: 90, width: 90},
                    {title: '측정방법', datatype: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', minWidth: 80, width: 80},
                    {title: '등급', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NM', minWidth: 50, width: 50},
                    {title: '합/불', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', minWidth: 60, width: 60},
                    {title: '부적합 수량', datatype: 'string', dataIndx: 'Q_ERROR_QTY', minWidth: 65, width: 65},
                    // {title: '반품일시', datatype: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 120, width: 120},
                    {title: '검사코드', datatype: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', minWidth: 100, width: 100},
                    {title: '상세 내용', datatype: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 250, width: 250},
                    {title: '발생공정', datatype: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', minWidth: 80, width: 80},
                    {title: '원인', datatype: 'string', dataIndx: 'Q_ERROR_REASON_NM', minWidth: 130, width: 130},
                    {title: '조치', datatype: 'string', dataIndx: 'Q_ERROR_ACTION_NM', minWidth: 85, width: 85},
                    {title: '비고', datatype: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 120, width: 120}
                ]
            }
        ];

        inspectionHistoryGridId01.pqGrid({
            width: "100%", height: 710,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSPECT_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_history_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', editable: false, render: inspectionHistoryFilterRender},
            filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            // selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionHistoryColModel01,
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#inspectionHistoryFilterColumn").html(filterOpts);
                $("#inspectionHistoryFrozen").empty();
                $("#inspectionHistoryFrozen").html(frozenOts);
            },
            complete: function () {
                let data = inspectionHistoryGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_history_grid_records').html(totalRecords);
            },
            selectChange: function (event, ui) {
                SelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) SelectedRowIndex.push(i);
                }
            }
        });


        inspectionResultHistoryColModel01 = [
            {title: 'INSPECT_RESULT_SEQ', dataType: 'string', dataIndx: 'INSPECT_RESULT_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            // {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 80, width: 80},
            {title: '등록일시', dataType: 'string', dataIndx: 'INSEPCT_RESULT_INSERT_DT', minWidth: 80, width: 80},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 90, width: 90},
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_PART_INFO', minWidth: 140, width: 140},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 150, width: 150},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 50, width: 50},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 60, width: 60},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY_NM', minWidth: 70, width: 70},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 80, width: 80},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 90, width: 90},
            {title: '기타 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', minWidth: 120, width: 120},
            {
                title: '성적서', datatype: 'string', align: 'center', colModel: [
                    {title: '제품No', datatype: 'string', dataIndx: 'PRODUCT_NUM', minWidth: 60, width: 60},
                    {title: '작성자', datatype: 'string', dataIndx: 'INSPECT_RESULT_USER_NM', minWidth: 90, width: 90},
                    {title: 'Area', datatype: 'string', dataIndx: 'LAYER_AREA_NAME', minWidth: 60, width: 60},
                    {title: 'Value', datatype: 'string', dataIndx: 'VALUE_CNT', minWidth: 50, width: 50}
                ]
            },
            {title: '상세보기', align: 'center', dataType: 'string', dataIndx: '', minWidth: 100, width: 100,
                render: function (ui) {
                    if (ui.rowData['INSPECT_RESULT_SEQ'] > 0) return '<button type="button" class="miniBtn black inspectR">검사 성적서</button>';
                    return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find(".inspectR").bind("click", function () {
                        let rowData = ui.rowData;
                        inspectionResultPopupWindow(rowData.CONTROL_SEQ,rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            }
        ];

        inspectionResultHistoryGrid.pqGrid({
            width: "100%", height: 710,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSPECT_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_history_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', editable: false, render: inspectionHistoryFilterRender},
            filterModel: { mode: 'OR' },
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            // selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionResultHistoryColModel01,
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#inspectionResultHistoryFilterColumn").html(filterOpts);
                $("#inspectionResultHistoryFrozen").empty();
                $("#inspectionResultHistoryFrozen").html(frozenOts);
            },
            complete: function () {
                let data = inspectionResultHistoryGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_result_history_grid_records').html(totalRecords);
            }
        });
        /**  리스트 그리드 선언 끝 **/

        $('#inspection_history_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchInspectionHistory();
            }
        });
        $("#inspection_history_search_btn").on('click', function(){
            searchInspectionHistory()
        });

        function searchInspectionHistory() {
            if($("#INSPECTION_HISTORY_TAB").css('display') != 'none') {
                inspectionHistoryGridId01.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#inspection_history_form');
                } );
                inspectionHistoryGridId01.pqGrid("refreshDataAndView");
            }else {
                $("#inspection_history_form").find("#queryId").val('inspection.selectInspectionResultHistoryList');
                inspectionResultHistoryGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#inspection_history_form');
                } );
                inspectionResultHistoryGrid.pqGrid("refreshDataAndView");
            }
        }

        $('#inspectionHistoryFilterKeyword').on({
            'keyup': function () {
                historyKeywordFilter();
            },
            'search': function () {
                historyKeywordFilter();
            }
        });

        function historyKeywordFilter() {
            fnFilterHandler(inspectionHistoryGridId01, 'inspectionHistoryFilterKeyword', 'inspectionHistoryFilterCondition', 'inspectionHistoryFilterColumn');

            let data = inspectionHistoryGridId01.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            $('#inspection_history_grid_records').html(totalRecords);
        }

        function resultKeywordFilter() {
            fnFilterHandler(inspectionResultHistoryGrid, 'inspectionResultHistoryFilterKeyword', 'inspectionResultHistoryFilterCondition', 'inspectionResultHistoryFilterColumn');

            let data = inspectionResultHistoryGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            $('#inspection_result_history_grid_records').html(totalRecords);
        }

        $('#inspectionResultHistoryFilterKeyword').on({
            'keyup': function () {
                resultKeywordFilter();
            },
            'search': function () {
                resultKeywordFilter();
            }
        });

        $("#inspectionHistoryFrozen").on('change', function(e){
            fnFrozenHandler(inspectionHistoryGridId01, $(this).val());
        });

        $("#inspectionResultHistoryFrozen").on('change', function(e){
            fnFrozenHandler(inspectionResultHistoryGrid, $(this).val());
        });

        function inspectionHistoryFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if(options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if(index > -1) val = options[index].text;
            }
            if (val) {
                var condition = $("#inspectionResultHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#inspectionResultHistoryFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if($("#INSPECTION_HISTORY_TAB").css('display') != 'none') {
                    condition = $("#inspectionHistoryFilterCondition :selected").val();
                    txt = $("#inspectionHistoryFilterKeyword").val();
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase();
                }

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                }
                else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                }
                else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                }
                else {
                    return val;
                }
            }
            else {
                return val;
            }
        }

        let inspectionResultPopup;
        const inspectionResultPopupWindow = function (controlSeq, controlDetailSeq) {
            let inspectFrom = document.inspection_history_result_data_form;

            let strOption = '';
            strOption += 'width=' + screen.width + ',';
            strOption += 'height=' + screen.height + ',';
            strOption += 'fullscreen=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (inspectionResultPopup === undefined || inspectionResultPopup.closed) {

                inspectionResultPopup = window.open('', 'popForm', strOption);

                $('#inspection_history_result_data_form').find("#CONTROL_SEQ").val(controlSeq);
                $('#inspection_history_result_data_form').find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);

                inspectFrom.action = "/inspectionResult";
                inspectFrom.target = "popForm";
                inspectFrom.submit();

            } else {
                inspectionResultPopup.focus();
                setTimeout(function() {

                    $(inspectionResultPopup.window.document).find("#CONTROL_SEQ").val(controlSeq);
                    $(inspectionResultPopup.window.document).find("#CONTROL_SEQ").val(controlDetailSeq);

                }, 500);
            }
        }

        $('#inspection_history_export_btn').on('click', function () {
            var blob = inspectionHistoryGridId01.pqGrid('getInstance').grid.exportData({
                    format: 'xlsx',
                    render: true,
                    type: 'blob'
                });
            saveAs(blob, "검사이력 관리.xlsx" );
        });

        const noSelectedRowAlert = function () {
            if (SelectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };
        
        // 바코드도면출력
        $('#inspection_history_barcode_drawing_print').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let selectedRowCount = SelectedRowIndex.length;
            let selectControlPartCount = 0;
            let selectControlPartInfo = '';
            let selectControlList = '';
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = inspectionHistoryGridId01.pqGrid('getRowData', {rowIndx: SelectedRowIndex[i]});
                let curControlPartInfo = rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ;

                if (!rowData.IMG_GFILE_SEQ) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                    // } else if(rowData.WORK_TYPE != 'WTP020' && selectControlPartInfo != curControlPartInfo){
                } else if (selectControlPartInfo !== curControlPartInfo) {
                    selectControlList += String(rowData.CONTROL_SEQ) + String(rowData.CONTROL_DETAIL_SEQ) + '|';
                    selectControlPartCount++;
                    selectControlPartInfo = curControlPartInfo;
                }
            }

                let message = '<h4>' +
                    '           <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '               <span>' + selectControlPartCount + ' 건의 바코드 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '       </h4>';

            fnConfirm(null, message, function () {
                var printParam = {
                    printable:'/makeCadBarcodePrint', properties: {selectControl: selectControlList, flag:'N'}, type:'pdf', showModal:true
                };
                if(selectControlPartCount > 1) {
                    printParam.properties.flag = 'Y';
                }
                // printJS({printable:'/makeCadBarcodePrint', properties: {selectControl: selectControlList}, type:'pdf', showModal:true});
                printJS(printParam);
            });
        });

        $("#inspection_history_tabs").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                if(ui.newPanel.selector == "#INSPECTION_HISTORY_TAB") {
                    $(".inspection_history_div").show();
                    $(".inspection_result_history_div").hide();
                    $("#inspection_history_form").find("#queryId").val('inspection.selectInspectionHistoryList');
                    searchInspectionHistory()
                }else {
                    $(".inspection_history_div").hide();
                    $(".inspection_result_history_div").show();
                    $("#inspection_history_form").find("#queryId").val('inspection.selectInspectionResultHistoryList');
                    searchInspectionHistory();
                }
            }
        });
    });

    fnCommCodeDatasourceSelectBoxCreate($('#inspection_history_form').find('#SEL_ORDER_COMP_CD'), 'all', {
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getOrderCompanyList'}
    });
    fnCommCodeDatasourceSelectBoxCreate($('#inspection_history_form').find('#SEL_INSPECT_USER_ID'), 'all', {
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getUserList'}
    });
</script>
<script>

    function init(){
        let comboData = new Array() ;
        <c:forEach var="vlocale" items="${HighCode.H_1040}">
            var data1 = new Object() ;
            data1.id = '${vlocale.CODE_CD}' ;
            data1.title = '${vlocale.CODE_NM_KR}' ;
            comboData.push(data1) ;
        </c:forEach>
        $("#SEL_INSPECT_GRADE_SELECT").comboTree({
            source : comboData,
            isMultiple: true,
            cascadeSelect: false
        })
    }
    $(document).ready(function() {
        init();
        $("#inspection_history_form").find("#SEL_OUTGOING_TERM_1").trigger("click");
    });

</script>
