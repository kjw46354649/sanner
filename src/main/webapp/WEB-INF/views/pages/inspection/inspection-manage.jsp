<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="inspection_manage_form" name="inspection_manage_form" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionList">
            <div class="none_gubunWrap row2_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주업체</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주업체">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">작업지시번호</label>
                            <input type="search" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="작업지시번호">
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
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_WORK_TYPE">작업형태</label>
                            <select class="wd_200" name="SEL_WORK_TYPE" id="SEL_WORK_TYPE" title="작업형태">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="SEL_OUTSIDE_COMP_CD" id="SEL_OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="txt_span"><label class="label_100" for="INSPECTION_MANAGE_SEL_INSPECT_GRADE">Option</label></span>
                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_INSPECT_GRADE" name="SEL_INSPECT_PASS" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_INSPECT_GRADE">검사합격품 제외</label></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="INSPECTION_MANAGE_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="inspection_manage_search_btn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="inspectionManageFilterKeyword" placeholder="Enter your keyword">
                <label for="inspectionManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="inspectionManageFrozen" name="inspectionManageFrozen">
                </select>
                <select id="inspectionManageFilterColumn" style="display: none;"></select>
                <select id="inspectionManageFilterCondition" style="display: none;">
                    <option value="contain">Contains</option>
                </select>
                <span style="font-size: 15px;vertical-align: middle;margin-left: 30px;color: black;">검사결과 등록</span>
                <span class="barCode" id="inspectionBarcodeSpan" style="margin-left: 10px;"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="inspectionBarcodeImg"></span>
                <span class="barCodeTxt" style="opacity: 0;">&nbsp;<input type="text" style="width: 0px;cursor: default;" name="INSPECTION_BARCODE_NUM" id="INSPECTION_BARCODE_NUM"></span>
                <span style="font-size: 15px;vertical-align: middle;margin-left: 5px;color: black;">성적서 입력</span>
                <span class="barCode" id="inspectionResultBarcodeSpan" style="margin-left: 10px;"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="inspectionResultBarcodeImg"></span>
                <span class="barCodeTxt" style="opacity: 0;">&nbsp;<input type="text" style="width: 0px;cursor: default;" name="INSPECTION_RESULT_BARCODE_NUM" id="INSPECTION_RESULT_BARCODE_NUM"></span>
            </div>
            <div style="float: right">
                <button type="button" id="exportInspectResultBtn" class="defaultBtn mr-15">검사 성적서 EXPORT</button>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="inspection_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="inspection_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 검사 성적서  layer popup : S -->
<div class="popup_container inspection" id="inspection_result_value_popup" style="display: none;">
    <form class="form-inline" id="inspection_result_value_form" name="inspection_result_value_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionResultValueList">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="ORDER_QTY" id="ORDER_QTY" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" name="IMG_GFILE_SEQ" id="IMG_GFILE_SEQ" value="">
        <input type="hidden" name="LIMIT_PRODUCT_NUM" id="LIMIT_PRODUCT_NUM" value="">

        <div class="layerPopup" style="width: 1150px;">
            <h3>검사 성적서 Value 관리</h3>
            <div class="barcodeDiv">
                  <span class="barCode ml-5" id="inspectionResultValueSpan">
                  <img src="/resource/asset/images/common/Code128code.png" alt="바코드" id="inspectionResultValueBarcodeImg" style="width: 92%;height: 30px;">
                  </span>
                <input type="text" id="input_inspection_result_value" style="width: 0;opacity: 0;height: 0;padding: 0;">
            </div>
            <div class="qualityWrap">
                <div class="h_area">
                    <div class="buttonWrap">
                        <table class="rowStyle">
                            <colgroup>
                                <col style="width: 52%">
                                <col style="width: 8%">
                                <col style="width: 20%">
                                <col style="width: 20%">
                            </colgroup>
                            <tr>
                                <th scope="col">작업번호</th>
                                <th scope="col"></th>
                                <th scope="col">작업형태</th>
                                <th scope="col">수량</th>
                            </tr>
                            <tbody>
                                <tr>
                                    <td id="CONTROL_PART_INFO" class="table-bg-gray"></td>
                                    <td id="IMG_GFILE" class="table-bg-gray">
                                        <span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>
                                    </td>
                                    <td id="WORK_TYPE_NM" class="table-bg-gray"></td>
                                    <td id="ORDER_QTY_DIV" class="table-bg-gray"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="m_area">
                    <div class="listWrap">
                        <button type="button" id="selectAllBtn" class="defaultBtn btn-100w radius">SELECT ALL</button>
                        <button type="button" id="autoCopyBtn" class="defaultBtn btn-100w radius">Auto Copy</button>
                        <select class="wd_60 mr-10 ml-5" name="SEL_REF_COLUMN" id="SEL_REF_COLUMN">
                            <option value="">Ref.</option>
                        </select>
                        <select class="wd_85 mr-5 ml-5" name="SEL_RAND_RANGE" id="SEL_RAND_RANGE">
                            <option value="">Rand 범위</option>
                        </select>
                        <input class="wd_50" type="number" name="COLUMN_FROM" id="COLUMN_FROM" placeholder="From" disabled>
                        <span class="nbsp">~</span>
                        <input class="wd_50 mr-5" type="number" name="COLUMN_TO" id="COLUMN_TO" placeholder="To" disabled>
                        <input name="CHECK_COPY" id="CHECK_COPY" type="checkbox" style="width: 18px;height: 18px;margin: 0;">
                        <button type="button" id="rendSettingBtn" class="defaultBtn btn-80w radius ml-15 darkBlue">Rand 설정</button>
                        <div style="float: right;">
                            <label class="label_100" for="SEL_PRODUCT_NUM" style="font-size: 12px;">제품 No. 표시</label>
                            <select id="SEL_PRODUCT_NUM" name="SEL_PRODUCT_NUM" class="wd_60 mr-8">
                                  <option value="10" selected>10</option>
                                  <option value="20">20</option>
                                  <option value="50">50</option>
                                  <option value="100">100</option>
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                            <button type="button" id="openResultPopBtn" class="defaultBtn btn-100w radius">도면성적서 열기</button>
                            <button type="button" id="deleteColPopBtn" class="defaultBtn btn-70w red radius">열삭제</button>
                        </div>
                    </div>
                </div>
                <div class="list3">
                    <div id="inspection_result_value_grid"></div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="inspection_result_value_save" disabled>저장</button>
                <button type="button" class="defaultBtn grayPopGra black" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 검사 성적서  layer popup : E -->
<div class="popup_container in" id="rand_range_popup" style="display: none;">
    <div class="layerPopup" style="width: 420px; height: 380px;">
        <form class="form-inline" id="rand_range_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectRandRange">
            <div class="d-inline-block ml-10 mt-10" style="margin-bottom: 7px;width:100%;">
                <div style="float: right;">
                    <button type="button" class="defaultBtn btn-60w grayPopGra radius" id="addRandBtn">추가</button>
                    <button type="button" class="defaultBtn btn-60w red radius" id="deleteRandBtn">삭제</button>
                </div>
            </div>
            <div style="margin-top: 1%;" id="rand_range_grid">

            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn btn-60w green radius" id="saveRandBtn">저장</button>
                <button type="button" class="defaultBtn btn-60w grayPopGra black radius" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="popup_container in" id="inspection_result_export_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 490px; height: 280px;">
        <h3>검사성적서 출력</h3>
        <hr>
        <form class="form-inline" id="inspection_result_export_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.insertStockEquipMapping">
            <input type="hidden" name="INSIDE_STOCK_SEQ" id="INSIDE_STOCK_SEQ" value="">
            <input type="hidden" name="STOCK_EQUIP_SEQ" id="STOCK_EQUIP_SEQ" value="500000">
            <div class="d-inline-block align-items-center ml-10 mt-10" style="margin-bottom: 7px;height: 60%;width: 100%;">
                <div class="d-inline-block" style="margin-left: 12%;margin-top: 4%;">
                    <span class="slt_wrap">
                        <span class="mr-15" style="margin-bottom: 5%;font-size: 20px;color: black;vertical-align: middle;">템플릿 종류</span>
                        <select class="wd_200 mr-20" name="SEL_TEMPLATE" id="SEL_TEMPLATE" style="font-size: 14px;">
                            <c:forEach var="vlocale" items="${HighCode.H_1102}">
                                <option value="${vlocale.ETC1}">${vlocale.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="text-center" style="margin-top: 7%;font-size: 25px;color: black;font-weight: bold;">
                    <span>검사 성적서 추출을 진행하시겠습니까?</span>
                </div>
            </div>
        </form>
        <div class="text-center">
            <button type="button" id="exportExcelBtn" class="defaultBtn greenPopGra mr-15">저장</button>
            <button type="button" class="defaultBtn grayPopGra black" data-dismiss="modal">닫기</button>
        </div>
    </div>
</div>


<form id="inspection_result_data_form" name="inspection_result_data_form" method="post">
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ">
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ">
    <input type="hidden" id="callElement" name="callElement">
</form>

<script>


    let pointCheckArr = [];
    let prdNumCheckArr = [];


    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionManageGridId01 = $("#inspection_manage_grid");
        let inspectionManageColModel01;
        let inspectionManagePostData01;
        let RAND_RANGE;

        function randRangeSelBox () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'inspection.selectRandRange'}};
            fnPostAjax(function (data) {
                $("#SEL_RAND_RANGE").empty();
                $("#SEL_RAND_RANGE")[0].add(new Option('Rand 범위',''));

                if(data.list.length > 0) {
                    RAND_RANGE = fnGroupBy(data.list,"RAND_NUM");
                    $.each(data.list, function (idx,Item) {
                        $("#SEL_RAND_RANGE")[0].add(new Option(Item.RAND_TITLE,Item.RAND_NUM));
                    });
                }
                console.log('RAND_RANGE',RAND_RANGE);

            },parameters,'');
        }
        randRangeSelBox();

        /**  리스트 그리드 선언 시작 **/
        $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionList");
        inspectionManagePostData01 = fnFormToJsonArrayData('#inspection_manage_form');
        inspectionManageColModel01 = [
            {title: 'INSPECT_SEQ', dataType: 'string', dataIndx: 'INSPECT_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: 'MCT_WORK_SEQ', dataType: 'string', dataIndx: 'MCT_WORK_SEQ', hidden:true},
            {title: 'INSPECT_TYPE', dataType: 'string', dataIndx: 'INSPECT_TYPE', hidden:true},
            {title: 'INSPECT_GRADE', dataType: 'string', dataIndx: 'INSPECT_GRADE', hidden:true},
            {title: '결과<br>등록', align: 'center', dataType: 'string', dataIndx: 'CONTROL_SEQ_INSERT', width: 70, minWidth: 70, editable: false,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return "<button type=\"button\" class=\"miniBtn black\">등록</button>";
                    return '';
                }
            },
            {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 80, width: 80, editable: false},
            {title: '외주가공 현황', datatype: 'string', align: 'center', colModel: [
                    {title: '업체명', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 85, width: 85, editable: false},
                    {title: '입고일시', dataType: 'string', dataIndx: 'OUTSIDE_IN_DT', minWidth: 80, width: 80, editable: false},
                ]
            },
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 90, width: 100, editable: false},
            {title: '긴<br>급', minWidth: 25, width: 25, dataType: 'string', dataIndx: 'EMERGENCY_YN_NM', editable: false},
            {title: '불량<br>반품', minWidth: 30, width: 30, dataType: 'string', dataIndx: 'INSPECT_GRADE_SHORT_NM', editable: false},
            {title: '주요<br>검사', width: 65, dataType: 'string', dataIndx: 'MAIN_INSPECTION_NM', editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'DETAIL_INFO', width: 30, minWidth: 30, editable: false,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return '<span id="detailView" class="shareIcon"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData.CONTROL_SEQ, ui.rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_PART_NUM', minWidth: 135, width: 140, editable: false},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
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
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 50, width: 50, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 110, width: 110, editable: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 85, width: 85, editable: false},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 40, editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        return ui.rowData.SAME_SIDE_YN === 'Y' ? cellData + '&nbsp;<span style="background-color: #C00000; color: white; font-size: 1.2rem; text-align: center; vertical-align: middle;">대</span>' : cellData;
                    }
                }
            },
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 60, width: 60, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 75, width: 75, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_NM', minWidth: 75, width: 75, editable: false},
            {title: '출하<br>일자', dataType: 'string', dataIndx: 'OUT_FINISH_DT', minWidth: 50, width: 50, editable: false},
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 110, width: 150, editable: false},
            {title: '기타 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', minWidth: 100, width: 100, editable: false},
            {title: '검사 성적서', datatype: 'string', align: 'center', colModel: [
                    {title: 'Qty.', datatype: 'string', dataIndx: 'INSPECT_RESULT_QTY', minWidth: 40, width: 40, editable: false,
                        render: function (ui) {
                            if (ui.cellData > 0)  {
                                return '<span class="inspectValue" style="cursor: pointer;text-decoration: underline;">'+ui.cellData + '</span>'
                            }else {
                                return ''
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find(".inspectValue").bind("click", function () {
                                let rowData = ui.rowData;

                                openResultValuePop(rowData);
                            });
                        }
                    },
                    {title: '업데이트 일시', datatype: 'string', dataIndx: 'INSPECT_RESULT_LATEST_DT', minWidth: 100, width: 100, editable: false},
                    // {title: '영상', datatype: 'string', dataIndx: 'MCT_WORK_DT', minWidth: 100, width: 100, editable: false},
                    {title: '', datatype: 'string', dataIndx: 'INSPECT_RESULT_BTN', minWidth: 60, width: 60, editable: false,
                        render: function (ui) {
                            if (ui.rowData.CONTROL_SEQ > 0) return '<button type="button" class="miniBtn black inspectR">입력</button>';
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
                    },
                ]
            }
        ];

        inspectionManageGridId01.pqGrid({
            width: "100%", height: 730,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: inspectionManageFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            selectionModel: {type: 'row', mode: 'single'},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModel01,
            load: function( event, ui ) {
                var frozenOts = '<option value="0">Selected</option>';
                let filterOpts = '<option value=\"\">All Fields</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#inspectionManageFrozen").empty();
                $("#inspectionManageFrozen").html(frozenOts);
                $('#inspectionManageFilterColumn').html(filterOpts);
            },
            complete: function () {
                let data = inspectionManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_manage_grid_records').html(totalRecords);
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
                if (ui.rowData.CONTROL_SEQ != undefined && ui.rowData.CONTROL_SEQ >0) {
                    if (ui.dataIndx == 'CONTROL_SEQ_INSERT') {
                        fnResetForm("inspection_manage_pop_form");

                        $("#inspection_manage_pop_form").find("#CONTROL_SEQ").val(ui.rowData.CONTROL_SEQ);
                        $("#inspection_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData.CONTROL_DETAIL_SEQ);

                        $('#inspection_manage_pop').modal('show');
                    }
                }
                if (ui.rowData.INSPECT_SEQ != undefined && ui.rowData.INSPECT_SEQ > 0) {
                    if (ui.dataIndx == 'CONTROL_SEQ_DELETE') {
                        fnConfirm(null, "검사실적이 바로 삭제됩니다.<br>삭제 하시겠습니까?", function () {
                            fnDeletePQGrid(inspectionManageGridId01, [rowIndx], "inspection.deleteInspectionMaster");
                            setTimeout(function () {
                                $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionList");
                                $("#inspection_manage_search_btn").trigger("click");
                            }, 500);
                        });
                    }
                }
            }
        });
        /**  리스트 그리드 선언 끝 **/

        $('#inspection_manage_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchInspectionManage();
            }
        });

        $("#inspection_manage_search_btn").on('click', function () {
            searchInspectionManage();
        });

        function searchInspectionManage() {
            inspectionManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_form');
            } );
            inspectionManageGridId01.pqGrid("refreshDataAndView");
        }

        let $inspectionResultValueGrid  = $("#inspection_result_value_grid");
        let inspectionResultValueColCommModel = [
            {title: 'INSPECT_RESULT_SEQ', dataIndx: 'INSPECT_RESULT_SEQ', hidden: true},
            {title: 'POINT_SEQ', dataIndx: 'POINT_SEQ', hidden: true},
            {title: 'EDIT_YN', dataIndx: 'EDIT_YN', hidden: true},
            {title: 'INSPECT_RESULT_VALUE_SEQ', dataIndx: 'INSPECT_RESULT_VALUE_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PRODUCT_NUM', dataIndx: 'PRODUCT_NUM', hidden: true},
            {title: 'No.', datatype: 'string', align: 'center', sortable:false, editable:false, colModel: [
                    {
                        title: '<input id="vertical_check" type="checkbox"/>',
                        minWidth: 60,
                        dataIndx: 'POINT_NUM',
                        sortable: false,
                        editable: false,
                        styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'},
                        render: function (ui) {
                            const cellData = ui.cellData;
                            if(cellData){
                                return '<input id="POINT_CHECK_'+cellData + '" name="POINT_CHECK" class="point_check" data-target="'+cellData+'" style="margin-right: 10px;" type="checkbox"/>' + cellData;
                            }
                        }
                    }
                ],
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            // {title: 'POS', minWidth: 60, dataIndx: 'POINT_POSITION', sortable:false, editable:true,
            //     styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            // }
            {title: '<input id="horizon_check"  type="checkbox"/>', datatype: 'string', align: 'center', sortable:false, editable:true, colModel: [
                    {
                        title: 'POS',
                        minWidth: 60,
                        dataIndx: 'POINT_POSITION',
                        sortable: false,
                        editable: true,
                        styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
                    }
                ],
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            }
        ];

        let inspectionResultValueObj = {
            height: 500,
            width: "auto",
            // selectionModel: { type: 'row', mode: 'single'},
            // rowHtHead: 30,
            numberCell: {title: 'No.',show:false},
            sortModel: {on: false},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: '',
            editable: false,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: inspectionResultValueColCommModel,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'POINT_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_result_value_form'),
                getData: function (dataJSON) {
                    dataJSON.data = formattingData(dataJSON.data);
                    return {data: dataJSON.data};
                }
            },
            editorEnd: function( event, ui ) {
                let idx = ui.rowIndx;
                let dataIdx = ui.dataIndx;

                setTimeout(function () {
                    let cell = $inspectionResultValueGrid.pqGrid('getCell', { rowIndx: idx, dataIndx: dataIdx});
                    if( $inspectionResultValueGrid.pqGrid('isDirty',{rowIndx: idx})) {
                        cell.addClass("bg-real-yellow");
                    }else {
                        cell.removeClass("bg-real-yellow");
                    }
                },200);

            },
            change:function( event, ui ) {
                let gridInstance = $inspectionResultValueGrid.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});
                if(changes.updateList.length > 0) {
                    $("#inspection_result_value_save").prop("disabled",false);
                }else {
                    $("#inspection_result_value_save").prop("disabled",true);
                }
            },
            refresh: function( event, ui ) {
                setTimeout(function () {
                    if(prdNumCheckArr.length > 0) {
                        for(var i=0;i<prdNumCheckArr.length;i++) {
                            $("#"+prdNumCheckArr[i]).prop('checked',true);
                        }
                    }
                    if(pointCheckArr.length > 0) {
                        for(var i=0;i<pointCheckArr.length;i++) {
                            $("#"+pointCheckArr[i]).prop('checked',true);
                        }
                    }
                },200);

            }
        }

        $("#inspection_result_value_popup").on({
            'show.bs.modal': function () {
                resultValuePopGridSetting();
            }, 'hide.bs.modal': function () {
                if ($('#inspection_result_value_grid').pqGrid('instance')) {
                    $inspectionResultValueGrid.pqGrid('destroy');
                }
                fnResetForm("inspection_result_value_form");
                prdNumCheckArr = [];
                pointCheckArr = [];
                $("#inspection_manage_search_btn").trigger('click');
            }
        })

        function formattingData(data) {
            let flagPrdNum = "";
            let formattingArr = [];
            let pointNumList = [];
            let pointCnt = 0;
            let qty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
            let limit = $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val();

            if(!fnIsEmpty(limit) && (Number(qty) > Number(limit))) {
                qty = limit;
            }

            if(!fnIsEmpty(qty)) {
                $.each(data,function (idx,Item) {
                    for (var i = 1; i <= qty; i++) {
                        Item['RESULT_VALUE_'+ i] = '';
                    }
                    Item['RESULT_VALUE_'+ Item.PRODUCT_NUM] = Item.RESULT_VALUE;
                    pointCnt = Item.POINT_CNT;

                    let pIdx = pointNumList.indexOf(Item.POINT_NUM);
                    if(pIdx < 0) {
                        formattingArr.push(Item);
                        pointNumList.push(Item.POINT_NUM);
                    }else {
                        formattingArr[pIdx]['RESULT_VALUE_'+ Item.PRODUCT_NUM] = (fnIsEmpty(Item.RESULT_VALUE)?'':Item.RESULT_VALUE);
                    }
                })
            }

            return formattingArr;
        }
        let realPrdNumArr = []
        function resultValuePopGridSetting() {
            $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val($("#SEL_PRODUCT_NUM").val());

            let parameter = {
                'queryId': 'inspection.selectInspectionResultPrdNumList',
                'CONTROL_SEQ': $("#inspection_result_value_form").find("#CONTROL_SEQ").val(),
                'CONTROL_DETAIL_SEQ': $("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val()
            };
            let parameters = {'url': '/json-list', 'data': parameter};
            fnPostAjaxAsync(function(data, callFunctionParam){
                // console.log(data);
                realPrdNumArr = [];
                $("#SEL_REF_COLUMN").empty();
                $("#SEL_REF_COLUMN")[0].add(new Option('Ref.',''));
                $.each(data.list,function (idx,Item) {
                    realPrdNumArr.push(Item.PRODUCT_NUM);
                    $("#SEL_REF_COLUMN")[0].add(new Option('#'+Item.PRODUCT_NUM,Item.PRODUCT_NUM));
                });

                let qty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
                let limit = $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val()
                if(!fnIsEmpty(limit) && (Number(qty) > Number(limit))) {
                    qty = limit;
                }
                let colModel = fnCloneObj(inspectionResultValueColCommModel);
                if(!fnIsEmpty(qty)) {
                    for(var i=1;i<=qty;i++) {
                        let headerColor = '#abc3e9';
                        let fontColor = 'black';
                        if(realPrdNumArr.indexOf(i) < 0) {
                            headerColor = '#d9d9d9';
                            fontColor = '#6e6c6c';
                        }
                        colModel.push(
                            {title: '<input id="PRODUCT_NUM_CHECK_'+ i +'" name="PRODUCT_NUM_CHECK" class="prdNum_check" data-target="'+ i +'" type="checkbox"/>', datatype: 'string', align: 'center', colModel: [
                                    {
                                        title: '#' + i,
                                        minWidth: 60,
                                        dataIndx: 'RESULT_VALUE_' + i,
                                        sortable: false,
                                        editable: true,
                                        styleHead: {'font-weight': 'bold', 'background': headerColor, 'font-size': '12px', 'color':fontColor}
                                    }
                                ],
                                styleHead: {'font-weight': 'bold', 'background': '#abc3e9', 'font-size': '12px'}
                            }
                        );
                    }
                }

                inspectionResultValueObj.colModel = colModel;
                inspectionResultValueObj.dataModel.postData = fnFormToJsonArrayData('inspection_result_value_form');
                $inspectionResultValueGrid.pqGrid(inspectionResultValueObj);
            }, parameters, '');
        }

        function openResultValuePop(data) {
            $("#inspection_result_value_form").find("#CONTROL_SEQ").val(data.CONTROL_SEQ);
            $("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val(data.CONTROL_DETAIL_SEQ);
            $("#inspection_result_value_form").find("#IMG_GFILE_SEQ").val(data.IMG_GFILE_SEQ);
            $("#inspection_result_value_form").find("#ORDER_QTY").val(data.ORDER_QTY);

            $("#inspection_result_value_popup").find("#CONTROL_PART_INFO").text(data.CONTROL_PART_NUM);
            $("#inspection_result_value_popup").find("#WORK_TYPE_NM").text(data.WORK_TYPE_NM);
            $("#inspection_result_value_popup").find("#ORDER_QTY_DIV").text(data.ORDER_QTY);


            $('#inspection_result_value_popup').modal('show');
        }

        $("#SEL_PRODUCT_NUM").on('change',function () {
            console.log($(this).val());
            // $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val($(this).val());
            $inspectionResultValueGrid.pqGrid('destroy');
            resultValuePopGridSetting();
        })

        $('#inspection_result_value_save').on('click', function () {
            let data = $inspectionResultValueGrid.pqGrid('option', 'dataModel.data');
            let gridInstance = $inspectionResultValueGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let orderQty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
            let limit = $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val();
            if(!fnIsEmpty(limit) && (Number(orderQty) > Number(limit))) {
                orderQty = limit;
            }

            changes.ORDER_QTY = orderQty;

            let flag = false;
            $.each(data, function (idx,Item) {
                for(var i=1;i<=orderQty;i++) {
                    if(fnIsEmpty(Item["RESULT_VALUE_"+i])) {
                        let nextVal = Item["RESULT_VALUE_"+(i)];
                        if(i+1 <= orderQty){
                            nextVal = Item["RESULT_VALUE_"+(i+1)];
                        }
                        if(!fnIsEmpty(nextVal)) {
                            flag = true;
                            return;
                        }
                    }
                }
            })
            if(flag) {
                fnAlert(null,"입력 정보를 확인해주세요.");
                return false;
            }

            let parameters = {'url': '/saveInspectResult', 'data': {data: JSON.stringify(changes)}};
            fnPostAjaxAsync(function (data) {
                fnAlert(null,"저장되었습니다.");

                prdNumCheckArr = [];
                pointCheckArr = [];

                $inspectionResultValueGrid.pqGrid('destroy');
                resultValuePopGridSetting();

            },parameters,'');
        });

        $('#CHECK_COPY').on('click', function () {
            let checked = this.checked;
            if(checked) {
                $("#COLUMN_FROM").prop('disabled',false);
                $("#COLUMN_TO").prop('disabled',false);
            }else {
                $("#COLUMN_FROM").prop('disabled',true);
                $("#COLUMN_TO").prop('disabled',true);
            }
        });

        $('#selectAllBtn').on('click', function () {
            let data = $inspectionResultValueGrid.pqGrid('option', 'dataModel.data');
            let qty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
            let limit = $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val();

            if(!fnIsEmpty(limit) && (Number(qty) > Number(limit))) {
                qty = limit;
            }

            for(var i=1;i<=qty;i++) {
                if(!$("#PRODUCT_NUM_CHECK_"+i).prop('disabled')) {
                    prdNumCheckArr.push("PRODUCT_NUM_CHECK_"+i);
                    $("#PRODUCT_NUM_CHECK_"+i).prop('checked',true);
                }
            }

            $.each(data,function (idx,Item) {
                pointCheckArr.push("POINT_CHECK_"+Item.POINT_NUM);
                $("#POINT_CHECK_"+Item.POINT_NUM).prop('checked',true);
            })
        });

        $("#rendSettingBtn").on('click', function () {
            $("#rand_range_popup").modal("show");
        });

        $('#openResultPopBtn').on('click', function () {
            let controlSeq = $("#inspection_result_value_form").find("#CONTROL_SEQ").val();
            let controlDetailSeq = $("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val();
            inspectionResultPopupWindow(controlSeq,controlDetailSeq);
        });

        $('#deleteColPopBtn').on('click', function () {
            let data = $inspectionResultValueGrid.pqGrid('option', 'dataModel.data');
            if($("input[name=PRODUCT_NUM_CHECK]:checked").length == 0) {
                fnAlert(null,"삭제할 대상을 선택해 주세요.");
                return;
            }
            let prdNumStr = "";
            $("input[name=PRODUCT_NUM_CHECK]:checked").each(function (index) {
                let prdNum = $(this).data('target');
                prdNumStr += "'" + prdNum + "',";
            });
            prdNumStr = prdNumStr.substring(0,prdNumStr.length-1);

            let parameter = {
                'queryId': 'inspection.deleteInspectionResultProdNumList',
                'INSPECT_RESULT_SEQ': data[0].INSPECT_RESULT_SEQ,
                'PRODUCT_NUM_LIST': prdNumStr
            };
            let parameters = {'url': '/json-remove', 'data': parameter};
            fnPostAjaxAsync(function(data, callFunctionParam){
                prdNumCheckArr = [];
                fnAlert(null,"삭제되었습니다.");

                $inspectionResultValueGrid.pqGrid('destroy');
                resultValuePopGridSetting();

            }, parameters, '');
        });

        $("#inspectionResultValueBarcodeImg").on('click', function (){
            $("#input_inspection_result_value").focus();
        })

        $('#inspectionResultValueSpan').on('click', function () {
            $("#inspectionResultValueBarcodeImg").attr("src", "/resource/asset/images/common/Code128code_on.png");
            $("#input_inspection_result_value").focus();

        });

        $("#input_inspection_result_value").on({
            'focus': function () {
                $("#inspectionResultValueBarcodeImg").attr("src","/resource/asset/images/common/Code128code_on.png");
            },
            'blur': function () {
                $('#inspectionResultValueBarcodeImg').prop('src','/resource/asset/images/common/Code128code.png');
            },
            'keyup': function (e) {
                if(e.keyCode == 13) {
                    let barcodeNum = fnBarcodeKo2En($(this).val());

                    let data = {'queryId': "inspection.selectInspectionResultControlInfoBarcode", 'BARCODE_NUM': barcodeNum};
                    let parameters = {'url': '/json-info', 'data': data};
                    fnPostAjaxAsync(function(data, callFunctionParam){
                        // console.log(data);
                        if(data.info != null) {
                            $inspectionResultValueGrid.pqGrid('destroy');

                            $("#inspection_result_value_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
                            $("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
                            $("#inspection_result_value_form").find("#IMG_GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
                            $("#inspection_result_value_form").find("#ORDER_QTY").val(data.info.QTY);

                            $("#inspection_result_value_popup").find("#CONTROL_PART_INFO").text(data.info.CONTROL_NUM);
                            $("#inspection_result_value_popup").find("#WORK_TYPE_NM").text(data.info.WORK_TYPE_NM);
                            $("#inspection_result_value_popup").find("#ORDER_QTY_DIV").text(data.info.QTY);

                            resultValuePopGridSetting();
                        }
                    },parameters,'');

                    $(this).val('');
                }
            }
        })
        $("#inspection_result_value_popup #imageView").on('click', function (){
            let imgSeq = $("#inspection_result_value_form").find("#IMG_GFILE_SEQ").val();
            callWindowImageViewer(imgSeq);
        });

        function getRandomArbitrary(min, max) {
            if((min % 1 == 0) && (max % 1 == 0) ) {
                // 둘의 자릿수가 맞아야함
                min = Math.ceil(min);
                max = Math.floor(max);
                return Math.floor(Math.random() * (max - min + 1)) + min;
            }else {
                let decimalIdx = min.indexOf(".");
                let decimalLength = min.substring(decimalIdx + 1,min.length).length;
                let randomNum = Math.random() * Number(max - min) + Number(min);

                return randomNum.toFixed(decimalLength);
            }
        }

        $("#SEL_RAND_RANGE").on('change', function(e){
            let randNum = $(this).val();

            if(randNum == "") {
                $("#COLUMN_FROM").val("");
                $("#COLUMN_TO").val("");
            }else {
                let randData = RAND_RANGE[randNum];
                if(typeof randData != 'undefined' && randData.length > 0) {
                    $("#COLUMN_FROM").val(randData[0].RAND_FROM);
                    $("#COLUMN_TO").val(randData[0].RAND_TO);
                }
            }
        });

        $("#SEL_REF_COLUMN").on('change', function(e){
            $(".prdNum_check").prop("disabled",false);

            let standardCol = $(this).val();

            $("#PRODUCT_NUM_CHECK_"+standardCol).prop("disabled",true);
            $("#PRODUCT_NUM_CHECK_"+standardCol).prop("checked",false);

            let idx = prdNumCheckArr.indexOf("PRODUCT_NUM_CHECK_"+standardCol);
            if(idx >= 0) {
                prdNumCheckArr.splice(idx,1);
            }
        });

        $('#autoCopyBtn').on('click', function () {
            let standardCol = $("#SEL_REF_COLUMN").val();

            if(fnIsEmpty(standardCol)) {
                fnAlert(null,"기준 컬럼을 선택해 주세요.");
                return;
            }

            if($("input[name=POINT_CHECK]:checked").length == 0) {
                fnAlert(null,"copy할 row를 선택해 주세요.");
                return;
            }

            if($("input[name=PRODUCT_NUM_CHECK]:checked").length == 0) {
                fnAlert(null,"copy될 컬럼을 선택해 주세요.");
                return;
            }

            let fromVal = $("#COLUMN_FROM").val();
            let toVal = $("#COLUMN_TO").val();
            if(fromVal > toVal) {
                fnAlert(null,"숫자 범위를 확인해주세요.");
                return;
            }

            let updateList = [];
            $("input[name=POINT_CHECK]:checked").each(function (index) {
                let pointNum = $(this).data('target');
                let rowData = $inspectionResultValueGrid.pqGrid("getRowData", {rowIndx: pointNum -1});
                $("input[name=PRODUCT_NUM_CHECK]:checked").each(function (index) {
                    let prdNum = $(this).data('target');
                    if(!fnIsEmpty(rowData['RESULT_VALUE_'+standardCol])) {
                        let newJson = {}
                        newJson['RESULT_VALUE_'+prdNum] = Number(rowData['RESULT_VALUE_'+standardCol]);
                        if($("#CHECK_COPY").prop('checked')) {
                            newJson['RESULT_VALUE_'+prdNum] += Number(getRandomArbitrary(fromVal,toVal));
                        }
                        updateList.push({
                            rowIndx:rowData.pq_ri,
                            newRow:newJson,
                            checkEditable: false}
                        );
                    }
                });
            });

            if(updateList.length > 0) {
                $inspectionResultValueGrid.pqGrid('updateRow', {rowList: updateList});
            }
        });

        $('#exportInspectResultBtn').on('click', function () {
            if(SelectedRowIndex.length > 0) {
                let selRowData = inspectionManageGridId01.pqGrid('getRowData', {rowIndx: SelectedRowIndex[0]})
                if(selRowData.INSPECT_RESULT_QTY > 0) {
                    $("#exportCount").text(selRowData.INSPECT_RESULT_QTY);
                    $("#inspection_result_export_popup").modal('show');
                }else {
                    fnAlert(null, "검사 성적서 출력은 성적서 입력 이후 가능합니다.");
                    return;
                }
            }else {
                fnAlert(null, "출력 대상을 선택하세요.");
                return;
            }
        });

        $('#exportExcelBtn').on('click', function () {
            if(SelectedRowIndex.length > 0) {
                let selRowData = inspectionManageGridId01.pqGrid('getRowData', {rowIndx: SelectedRowIndex[0]})
                $("#common_excel_form #sqlId").val('selectInspectResultControlInfoExcel:selectInspectResultValueListExcel:selectInspectResultPointListExcel:selectInspectionResultPrdNumListExcel');
                $("#common_excel_form #mapInputId").val('info:data:data2:data3');
                $("#common_excel_form #paramName").val('CONTROL_SEQ_STR');
                $("#common_excel_form #paramData").val(selRowData.CONTROL_SEQ +"" +selRowData.CONTROL_DETAIL_SEQ);
                $("#common_excel_form #template").val($("#SEL_TEMPLATE").val());

                fnReportFormToHiddenFormPageAction("common_excel_form", "/downloadExcel");

                $("#inspection_result_export_popup").modal('hide');
            }
        });


        $('#INSPECTION_MANAGE_EXCEL_EXPORT').on('click', function () {
            const blob = inspectionManageGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '검사실적 관리.xlsx');
        });



        $("#INSPECTION_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode == 13) {
                fnBarcodePrintCheck(function (confirm, callFunctionParam) {
                    let barcodeN = callFunctionParam;
                    if (confirm) {
                        fnResetForm("inspection_manage_pop_form");

                        //0. 바코드 정보 가져오기
                        let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeN};
                        let parameters = {'url': '/json-info', 'data': data};
                        fnPostAjax(function (data, callFunctionParam) {
                            let dataInfo = data.info;
                            if (dataInfo == null) {
                                fnAlert(null, "해당 바코드가 존재하지 않습니다.");
                                return;
                            } else {
                                let CONTROL_SEQ = dataInfo.CONTROL_SEQ;
                                let CONTROL_DETAIL_SEQ = dataInfo.CONTROL_DETAIL_SEQ;
                                $("#inspection_manage_pop_form").find("#CONTROL_SEQ").val(CONTROL_SEQ);
                                $("#inspection_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);
                                $('#inspection_manage_pop').modal('show');
                            }
                        }, parameters, '');
                    }
                }, fnBarcodeKo2En(this.value), fnBarcodeKo2En(this.value));
                $('#INSPECTION_BARCODE_NUM').val('');
            }
        });

        $("#inspectionBarcodeSpan").on('click', function (e) {
            $("#INSPECTION_BARCODE_NUM").focus();
        });

        $("#INSPECTION_BARCODE_NUM").on({
            focus: function () {
                $("#inspectionBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#inspectionBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long.png");
            }
        });

        $("#inspectionResultBarcodeSpan").on('click', function (e) {
            $("#INSPECTION_RESULT_BARCODE_NUM").focus();
        });
        $("#INSPECTION_RESULT_BARCODE_NUM").on({
            focus: function () {
                $("#inspectionResultBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#inspectionResultBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long.png");
            },
            keyup: function (e) {
                if (e.keyCode == 13) {
                    let barcodeNum = fnBarcodeKo2En(this.value);
                    fnBarcodePrintCheck(function (confirm, callFunctionParam) {
                        let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                        let parameters = {'url': '/json-info', 'data': data};
                        fnPostAjax(function (data) {
                            let dataInfo = data.info;
                            if(dataInfo != null) {
                                inspectionResultPopupWindow(dataInfo.CONTROL_SEQ,dataInfo.CONTROL_DETAIL_SEQ);
                            }else {
                                fnAlert(null, "해당 바코드가 존재하지 않습니다.");
                                return;
                            }
                        }, parameters, '');
                    }, barcodeNum, barcodeNum);
                    this.value = '';
                }
            }
        });
        $("#inspectionResultBarcodeImg").on('click',function (){
            $("#INSPECTION_RESULT_BARCODE_NUM").focus();
        })

        fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_form').find('#SEL_OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });


        $('#inspectionManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(inspectionManageGridId01, 'inspectionManageFilterKeyword', 'inspectionManageFilterCondition', 'inspectionManageFilterColumn');

                let data = inspectionManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_manage_grid_records').html(totalRecords);
            },
            'search': function () {
                fnFilterHandler(inspectionManageGridId01, 'inspectionManageFilterKeyword', 'inspectionManageFilterCondition', 'inspectionManageFilterColumn');

                let data = inspectionManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_manage_grid_records').html(totalRecords);
            }
        });

        $("#inspectionManageFrozen").on('change', function(e){
            fnFrozenHandler(inspectionManageGridId01, $(this).val());
        });
        $("#tab_10000601").on('click', function(e){
            setTimeout(function () {
                $("#INSPECTION_BARCODE_NUM").focus();
            },50)
        })

        function inspectionManageFilterRender(ui) {
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
                var condition = $("#inspectionManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#inspectionManageFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

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
            let inspectFrom = document.inspection_result_data_form;

            let strOption = '';
            strOption += 'width=' + screen.width + ',';
            strOption += 'height=' + screen.height + ',';
            strOption += 'fullscreen=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (inspectionResultPopup === undefined || inspectionResultPopup.closed) {

                inspectionResultPopup = window.open('', 'popForm', strOption);

                $('#inspection_result_data_form').find("#CONTROL_SEQ").val(controlSeq);
                $('#inspection_result_data_form').find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);
                $('#inspection_result_data_form').find("#callElement").val('inspection_manage_search_btn');

                inspectFrom.action = "/inspectionResult";
                inspectFrom.target = "popForm";
                inspectFrom.submit();

            } else {
                inspectionResultPopup.focus();
                // setTimeout(function() {
                //
                //     $(inspectionResultPopup.window.document).find("#CONTROL_SEQ").val(controlSeq);
                //     $(inspectionResultPopup.window.document).find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);
                //
                //     // drawingUploadPopup.initDrawingLoad();
                // }, 500);
            }
        }




        let randSelectIndex = [];
        let $randRangeGrid  = $("#rand_range_grid");
        let randRangeColCommModel = [
            {title: 'No.', width: 40 , dataIndx: 'RAND_NUM', editable: false,
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            {title: 'Title', width: 50, dataIndx: 'RAND_TITLE',
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            {title: 'From', width: 70, dataIndx: 'RAND_FROM', dataType:'float',
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            {title: 'To', width: 70, dataIndx: 'RAND_TO', dataType:'float',
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            }
        ];
        let randRangeObj = {
            height: 260,
            width: "auto",
            selectionModel: { type: 'row', mode: 'single'},
            rowHtHead: 30,
            numberCell: {title: 'No.',show:false},
            sortModel: {on: false},
            scrollModel: {autoFit: true},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: '',
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: randRangeColCommModel,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'RAND_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('rand_range_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                randSelectIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    // console.log(selectList[i].rowIndx);
                    randSelectIndex.push(selectList[i].rowIndx);
                }
            },
            toolbar: false
        };

        $("#rand_range_popup").on({
            'show.bs.modal': function () {
                $randRangeGrid.pqGrid(randRangeObj);
            }, 'hide.bs.modal': function () {
                if ($('#rand_range_grid').pqGrid('instance')) {
                    $randRangeGrid.pqGrid('destroy');
                }
                fnResetForm("rand_range_form");
                randRangeSelBox();
            }
        })

        $("#addRandBtn").on('click', function () {
            let data = $randRangeGrid.pqGrid('option', 'dataModel.data');
            let randNum = 1;
            if(data.length > 0) {
                randNum = Number(data[data.length-1].RAND_NUM) + 1;
            }

            $randRangeGrid.pqGrid('addRow', {
                newRow: {
                    'RAND_NUM':randNum,
                    'RAND_TITLE':'',
                    'RAND_FROM':'',
                    'RAND_TO':''
                },
                rowIndx: data.length,
                checkEditable: false
            });
        });

        $("#deleteRandBtn").on('click', function () {
            if(randSelectIndex.length > 0) {
                let rowData = $randRangeGrid.pqGrid("getRowData", {rowIndx: randSelectIndex[0]});

                let parameter = {
                    'queryId': 'inspection.deleteRandRange',
                    'RAND_NUM': rowData.RAND_NUM,
                };
                let parameters = {'url': '/json-remove', 'data': parameter};
                fnPostAjaxAsync(function(data, callFunctionParam){
                    fnAlert(null,"삭제되었습니다.");

                    $randRangeGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        });

        $("#saveRandBtn").on('click', function () {

            let gridInstance = $randRangeGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});

            const insertQueryList = ['inspection.insertRandRange'];
            const updateQueryList = ['inspection.updateRandRange'];

            fnModifyPQGrid($randRangeGrid, insertQueryList, updateQueryList);
        });
    });

    $("#INSPECTION_BARCODE_NUM").focus();

    window.addEventListener('focus', function() {
        if($("#tab_10000601").parent().hasClass('on')) {
            setTimeout(function () {
                $("#INSPECTION_BARCODE_NUM").focus();
            },50)
        }
    }, false);

    $(document).ready(function(){

        $(document).on("click","#horizon_check",function(e){
            let qty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
            let limit = $("#inspection_result_value_form").find("#LIMIT_PRODUCT_NUM").val();

            if(!fnIsEmpty(limit) && (Number(qty) > Number(limit))) {
                qty = limit;
            }

            prdNumCheckArr = [];
            if($(this).prop('checked')) {
                for(var i=1;i<=qty;i++) {
                    if(!$("#PRODUCT_NUM_CHECK_"+i).prop('disabled')) {
                        prdNumCheckArr.push("PRODUCT_NUM_CHECK_"+i);
                        $("#PRODUCT_NUM_CHECK_"+i).prop('checked',true);
                    }
                }
            }else {
                $(".prdNum_check").prop('checked',false);
            }
        });

        $(document).on("click","#vertical_check",function(e){
            let data = $("#inspection_result_value_grid").pqGrid('option', 'dataModel.data');
            pointCheckArr = [];
            if($(this).prop('checked')) {
                $.each(data,function (idx,Item) {
                    pointCheckArr.push("POINT_CHECK_"+Item.POINT_NUM);
                });
                $(".point_check").prop('checked',true);
            }else {
                $(".point_check").prop('checked',false);
            }
        });

        $(document).on("click",".prdNum_check",function(e){
            let idx = prdNumCheckArr.indexOf(e.target.id);
            if(!$(this).prop('checked')) {
                if(idx >= 0) {
                    prdNumCheckArr.splice(idx,1);
                }
            }else {
                if(idx < 0) {
                    prdNumCheckArr.push(e.target.id)
                }
            }
        });
        $(document).on("click",".point_check",function(e){
            let idx = pointCheckArr.indexOf(e.target.id);
            if(!$(this).prop('checked')) {
                if(idx >= 0) {
                    pointCheckArr.splice(idx,1);
                }
            }else {
                if(idx < 0) {
                    pointCheckArr.push(e.target.id)
                }
            }
        });
    });
</script>
