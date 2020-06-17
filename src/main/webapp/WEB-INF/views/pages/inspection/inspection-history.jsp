<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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
                           <label class="label_100" for="SEL_CONTROL_NUM">관리번호</label>
                           <input type="text" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                           <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                           <input type="text" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                         </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                              <option value=""><spring:message code="com.form.top.all.option" /></option>
                              <c:forEach var="vlocale" items="${HighCode.H_1027}">
                                  <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                              </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
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
                            <input type="text" class="wd_200" name="SEL_INSPECT_GRADE_SELECT" id="SEL_INSPECT_GRADE_SELECT" placeholder="ALL(복수선택가능)" title="검사결과등급">
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
                    <li>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_INSPECT_USER_ID">검사자</label>
                            <select class="wd_200" id="SEL_INSPECT_USER_ID" name="SEL_INSPECT_USER_ID" data-required="true">
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            </select>
                       </span>
                        <span class="gubun"></span>
                       <%-- <span class="slt_wrap mg-right10">
                                                    <label class="label_100" for="SEL_OUTGOING_DATE_TYPE">구분</label>
                                                    <select class="wd_200" name="SEL_OUTGOING_DATE_TYPE" id="SEL_OUTGOING_DATE_TYPE">
                                                       <option value=""><spring:message code="com.form.top.all.option" /></option>
                                                       <option value="1">출고일</option>
                                                    </select>
                                                </span>--%>
                        <%--<span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_1" value="0" ><label for="SEL_OUTGOING_TERM_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_2" value="3"><label for="SEL_OUTGOING_TERM_2">3일전</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_3" value="31"><label for="SEL_OUTGOING_TERM_3">이번달</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_ST_DT" placeholder="" value="" title="시작날짜" readonly>
&lt;%&ndash;                                <button type="button">달력선택</button>&ndash;%&gt;
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_END_DT" placeholder="" value="" title="종료날짜" readonly>
&lt;%&ndash;                                <button type="button">달력선택</button>&ndash;%&gt;
                            </span>
                        </div>--%>
                        <span class="gubun"></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="inspection_history_search_btn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <div class="rightSpan">
                    <button type="button" class="defaultBtn" id="inspection_history_detail_btn">상세정보 조회</button>
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="inspection_history_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="inspection_history_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>





<script>
    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionManageGridId01 = $("#inspection_history_grid");
        let inspectionManageColModel01;
        let inspectionManagePostData01;


        /**  리스트 그리드 선언 시작 **/
        $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionHistoryList");
        inspectionManagePostData01 = fnFormToJsonArrayData('#inspection_history_form');
        inspectionManageColModel01 = [
            {title: 'INSPECT_SEQ', dataType: 'string', dataIndx: 'INSPECT_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: 'MCT_WORK_SEQ', dataType: 'string', dataIndx: 'MCT_WORK_SEQ', hidden:true},
            {title: 'INSPECT_TYPE', dataType: 'string', dataIndx: 'INSPECT_TYPE', hidden:true},
            {title: 'INSPECT_GRADE', dataType: 'string', dataIndx: 'INSPECT_GRADE', hidden:true},
            {title: '가공완료 일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 150, width: 150, editable: false},
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 95, width: 95, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_NM', minWidth: 150, width: 150, editable: false},
            {title: '외주가공', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 150, width: 150, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 150, width: 150, editable: false},
            // {title: '카드', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[카]";
            //         return '';
            //     }
            // },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 200, width: 200, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 40, width: 40, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 200, width: 200, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'DETAIL_INFO', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['CONTROL_SEQ'] > 0) return "<span class=\"ui-icon ui-icon-circle-zoomin\"></span>";
                    return '';
                }
            },
            // {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 120, width: 120, editable: false},
            // {title: 'WORK_TYPE', dataType: 'string', dataIndx: 'WORK_TYPE', hidden:true},
            {title: '작업형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 120, width: 120, editable: false},
            // {title: 'MATERIAL_TYPE', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden:true},
            {title: '소재분류', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', minWidth: 120, width: 120, editable: false},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120, editable: false},
            // {
            //     title: '최근 MCT 실적', datatype: 'string', align: 'center', colModel: [
            //         {title: '날짜', datatype: 'string', dataIndx: 'MCT_WORK_DT', minWidth: 120, width: 120, editable: false},
            //         {title: '작업자', datatype: 'string', dataIndx: 'WORK_USER_NM', minWidth: 100, width: 100, editable: false},
            //         {title: 'NC No.', datatype: 'string', dataIndx: 'EQUIP_NM', minWidth: 120, width: 120, editable: false},
            //         {title: '비고', datatype: 'string', dataIndx: 'CAM_NOTE', minWidth: 300, width: 300, editable: false}
            //     ]
            // },
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120, editable: false},
            {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'seq', datatype: 'string', dataIndx: 'Q_SEQ', minWidth: 40, width: 40, editable: false},
                    {title: '담당관', datatype: 'string', dataIndx: 'Q_INSPECT_USER_NM', minWidth: 100, width: 100, editable: false},
                    {title: '측정방법', datatype: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', minWidth: 120, width: 120, editable: false},
                    {title: '등급', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NM', minWidth: 80, width: 80, editable: false},
                    {title: '합/불', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', minWidth: 80, width: 80, editable: false},
                    {title: '수량', datatype: 'string', dataIndx: 'Q_ERROR_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '반품일시', datatype: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 120, width: 120, editable: false},
                    {title: '검사코드', datatype: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', minWidth: 120, width: 120, editable: false},
                    {title: '상세내용 및 비고', datatype: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 300, width: 300, editable: false},
                    {title: '발생공정', datatype: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', minWidth: 120, width: 120, editable: false},
                    {title: '원인', datatype: 'string', dataIndx: 'Q_ERROR_REASON_NM', minWidth: 120, width: 120, editable: false},
                    {title: '조치', datatype: 'string', dataIndx: 'Q_ERROR_ACTION_NM', minWidth: 80, width: 80, editable: false},
                    {title: '조치방안', datatype: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 120, width: 120, editable: false},
                    {title: '작성일자', datatype: 'string', dataIndx: 'Q_DT', minWidth: 120, width: 120, editable: false},
                ]
            }


        ];
        inspectionManageGridId01.pqGrid({
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
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModel01,
            complete: function () {
                let data = inspectionManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_history_grid_records').html(totalRecords);
            },
            cellClick: function (event, ui) {
                        let rowIndx = ui.rowIndx, $grid = this;
                        if (ui.rowData['CONTROL_SEQ'] != undefined && ui.rowData['CONTROL_SEQ'] >0) {
                            if (ui.dataIndx == 'DETAIL_INFO') {
                                g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                            }
                        }

            }//cellclick
        });
        /**  리스트 그리드 선언 끝 **/
        $("#inspection_history_search_btn").on('click', function(){
            let SEL_INSPECT_GRADE_SELECT = $("#inspection_history_form").find("#SEL_INSPECT_GRADE_SELECT").val();
            let arr = SEL_INSPECT_GRADE_SELECT.trim().split(",");
            let rtn = "";
            if(SEL_INSPECT_GRADE_SELECT != ""){
                $.each(arr, function(row, key) {
                    let id = $(".ComboTreeItemChlid").find("#check" + key.trim()).parent()[0].dataset.id
                    rtn += " '" + id + "',";
                });
                rtn = rtn.substring(0,rtn.length-1);
            }
            $("#inspection_history_form").find("#SEL_INSPECT_GRADE").val(rtn);

            inspectionManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_history_form');
            } );
            inspectionManageGridId01.pqGrid("refreshDataAndView");

        });
        $("#inspection_history_detail_btn").on('click', function(e){
               g_item_detail_pop_view('','');
        });
    });



        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            // let WAREHOUSE_CD = this.value;
            // let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'inspection.selectWarehouseLocationList'}};
            // fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });


    fnCommCodeDatasourceSelectBoxCreate($('#inspection_history_form').find('#SEL_ORDER_COMP_CD'), 'all', {
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getOrderCompanyList'}
    });
    fnCommCodeDatasourceSelectBoxCreate($('#inspection_history_form').find('#SEL_INSPECT_USER_ID'), 'all', {
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getUserList'}
    });
    // $('[name=SEL_OUTGOING_TERM]').change(function () {
    //     let value = $(this).val(), today = new Date(), newDate = new Date();
    //     if(value == "0"){
    //         $('#SEL_ST_DT').val(today.yyyymmdd());
    //         $('#SEL_END_DT').val(today.yyyymmdd());
    //     }else  if(value == "3"){
    //         newDate.setDate(newDate.getDate() - 3);
    //         $('#SEL_ST_DT').val(newDate.yyyymmdd());
    //         $('#SEL_END_DT').val(today.yyyymmdd());
    //     }else{
    //         let first   = new Date( today.getFullYear(), today.getMonth() , 1 );
    //         let last   = new Date( today.getFullYear(), today.getMonth() + 1 );
    //             last   = new Date( last - 1 );
    //
    //         $('#SEL_ST_DT').val(first.yyyymmdd());
    //         $('#SEL_END_DT').val(last.yyyymmdd());
    //     }
    // });
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
