<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="inspection_history_form" name="inspection_history_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionList">
            <div class="gubunWrap row3_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주사">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="inspection_history_search_btn">검색</button>
                        </span>
                    </li>


                    <script>
                        var comboData = [{id: 'A', title:'A'},{id: 'B', title:'B'},{id: 'C', title:'C'}];
                        function init(){
                            $("#testcombo").comboTree({
                                source : comboData,
                                isMultiple: true,
                                cascadeSelect: false
                            })
                        }
                        $(document).ready(function() {
                            init();
                        });

                    </script>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="testcombo">소재 Type</label>
                            <input type="text" class="wd_200" name="XXXX" id="testcombo" placeholder="ALL(복수선택가능)" title="관리번호">
                        </span>

                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="SEL_WAREHOUSE_CD" name="SEL_WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap">
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
        $("#inspection_history_form").find("#queryId").val("inspection.selectInspectionList");
        inspectionManagePostData01 = fnFormToJsonArrayData('#inspection_history_form');
        inspectionManageColModel01 = [
            {title: '납기', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 95, width: 95, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '외주가공', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '카드', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[카]";
                    return '';
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 200, width: 200, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 40, width: 40, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 200, width: 200, editable: false},
            {title: '눈', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[눈]";
                    return '';
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '작업형태', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '소재분류', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '수량', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 40, width: 40, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {
                title: '최근 MCT 실적', datatype: 'string', align: 'center', colModel: [
                    {title: '날짜', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '작업자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 100, width: 100, editable: false},
                    {title: 'NC No.', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '비고', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 300, width: 300, editable: false}
                ]
            },
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'seq', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '담당관', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 100, width: 100, editable: false},
                    {title: '측정방법', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '발주량', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '등급', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '합/불', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '수량', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '반품일시', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '검사코드', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '상세내용 및 비고', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 300, width: 300, editable: false},
                    {title: '발생공정', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '원인', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '조치', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '조치방안', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '작성일자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                        render: function (ui) {
                            let rowIndx = ui.rowIndx, grid = this;
                            if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[결과등록]";
                            return '';
                        }
                    },
                    {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ2', width: 40, minWidth: 40, editable: false,
                        render: function (ui) {
                            let rowIndx = ui.rowIndx, grid = this;
                            if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[실적삭제]";
                            return '';
                        }
                    }
                ]
            }


        ];
        inspectionManageGridId01.pqGrid({
            width: "100%", height: 700,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
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
            rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;
                //if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                    if (ui.dataIndx == 'INSIDE_STOCK_QTY_IN') {//입고
                        fnResetFrom("inspection_history_pop_form");
                        $("#inspection_history_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                        $('#inspection_history_pop').modal('show');
                    }
                    if (ui.dataIndx == 'INSIDE_STOCK_QTY_OUT') {//출고

                        if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
                            alert("출고할 재고수량이 없습니다.");
                        }else{
                            fnResetFrom("inspection_history_pop_form");
                            $("#inspection_history_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                            $('#inspection_history_pop').modal('show');
                        }
                    }
                //}
            }
        });
        /**  리스트 그리드 선언 끝 **/

    });



        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            // let WAREHOUSE_CD = this.value;
            // let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'inspection.selectWarehouseLocationList'}};
            // fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });
        $("#inspection_history_search_btn").click(function(){
            alert($("#inspection_history_form").find("#testcombo").val());
        });

        // fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        // });
        // fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getOrderCompanyList'}
        // });






</script>
