<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="inspection_manage_form" name="inspection_manage_form" role="form">
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
<%--                        <span class="ipu_wrap">--%>
<%--                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>--%>
<%--                            <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">--%>
<%--                        </span>--%>
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
<%--                        <span class="ipu_wrap">--%>
<%--                            <label class="label_100" for="SEL_POP_POSITION">현재위치</label>--%>
<%--                             <select id="SEL_POP_POSITION" name="SEL_POP_POSITION" title="현재위치" data-required="true" class="wd_200">--%>
<%--                                <option value=""><spring:message code="com.form.top.all.option" /></option>--%>
<%--                                <c:forEach var="vlocale" items="${HighCode.H_1009}">--%>
<%--                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                        </span>--%>
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
<%--                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_INSPECT_GRADE" name="SEL_INSPECT_GRADE" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_INSPECT_GRADE">검사완료제외</label></span>--%>
<%--                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_OUTSIDE_YN">외주제외</label></span>--%>
<%--                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_INNER_WORK_FINISH_YN" name="SEL_INNER_WORK_FINISH_YN" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_INNER_WORK_FINISH_YN">가공완료</label></span>--%>
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
                <button type="button" id="exportInspectResultBtn" class="defaultBtn btn-100w">검사 성적서 EXPORT</button>
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

<!-- 품질실적 layer popup : S -->
<div class="popup_container inspection" id="inspection_result_value_popup" style="display: none;">
    <form class="form-inline" id="inspection_result_value_form" name="inspection_result_value_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionResultValueList">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="ORDER_QTY" id="ORDER_QTY" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" name="IMG_GFILE_SEQ" id="IMG_GFILE_SEQ" value="">

        <div class="layerPopup" style="width: 1150px;">
            <h3>검사 성적서 Value 관리</h3>
            <div class="barcodeDiv">
                  <span class="barCode ml-5" id="inspectionResultValueSpan">
                  <img src="/resource/asset/images/common/Code128code.png" alt="바코드" id="inspectionResultValueBarcodeImg" style="width: 92%;height: 30px;">
                  </span>
                <input type="text" id="input_main_layer_barcode" style="width: 0;opacity: 0;height: 0;padding: 0;">
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
                        <button type="button" class="defaultBtn btn-100w radius">SELECT ALL</button>
                        <button type="button" class="defaultBtn btn-100w radius">Auto Copy</button>
                        <select class="wd_60 mr-5 ml-10" name="SEL_REF_COLUMN" id="SEL_REF_COLUMN">
                            <option value="">Ref.</option>
                        </select>
                        <input class="wd_50" type="number" name="COLUMN_FROM" id="COLUMN_FROM" placeholder="From" disabled>
                        <span class="nbsp">~</span>
                        <input class="wd_50 mr-5" type="number" name="COLUMN_TO" id="COLUMN_TO" placeholder="To" disabled>
                        <input name="CHECK_COPY" id="CHECK_COPY" type="checkbox" style="width: 18px;height: 18px;margin: 0;">

                        <div style="float: right;">
                            <button type="button" class="defaultBtn btn-100w radius">도면성적서 열기</button>
                            <button type="button" class="defaultBtn btn-70w red radius">열삭제</button>
                        </div>
                    </div>
                </div>
                <div class="list3">
                    <div id="inspection_result_value_grid"></div>
                </div>
            </div>

            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="inspection_manage_pop_save">저장</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->

<form id="inspection_result_data_form" name="inspection_result_data_form" method="post">
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ">
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ">
</form>





<script>



    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionManageGridId01 = $("#inspection_manage_grid");
        let inspectionManageColModel01;
        let inspectionManagePostData01;


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
            {title: '결과<br>등록', align: 'center', dataType: 'string', dataIndx: 'CONTROL_SEQ_INSERT', width: 60, minWidth: 60, editable: false,
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
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 90, width: 90, editable: false},
            {title: '긴<br>급', minWidth: 25, width: 25, dataType: 'string', dataIndx: 'EMERGENCY_YN_NM', editable: false},
            {title: '불량<br>반품', minWidth: 30, width: 30, dataType: 'string', dataIndx: 'INSPECT_GRADE_SHORT_NM', editable: false},
            {title: '주요<br>검사', width: 65, dataType: 'string', dataIndx: 'MAIN_INSPECTION_NM', editable: false},
            // {title: '카ㄴㅇㄹ드', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData.DXF_GFILE_SEQ > 0) return "[카]";
            //         return '';
            //     }
            // },
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
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_PART_INFO', minWidth: 135, width: 135, editable: false},
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 40, width: 40, editable: false},
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
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 75, width: 75, editable: false},
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
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 100, width: 100, editable: false},
            {title: '기타 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', minWidth: 100, width: 100, editable: false},
            // {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 210, width: 210, editable: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', minWidth: 80, width: 80, editable: false},
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
            // {
            //     title: '최근 MCT 실적', datatype: 'string', align: 'center', colModel: [
            //         {title: '날짜', datatype: 'string', dataIndx: 'MCT_WORK_DT', minWidth: 100, width: 100, editable: false},
            //         {title: '작업자', datatype: 'string', dataIndx: 'WORK_USER_NM', minWidth: 100, width: 100, editable: false},
            //         {title: 'NC No.', datatype: 'string', dataIndx: 'EQUIP_NM', minWidth: 70, width: 70, editable: false},
            //         {title: '비고', datatype: 'string', dataIndx: 'CAM_NOTE', minWidth: 300, width: 300, editable: false}
            //     ]
            // },
            // {
            //     title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
            //         {title: 'seq', datatype: 'string', dataIndx: 'Q_SEQ', minWidth: 40, width: 40, editable: false},
            //         {title: '담당관', datatype: 'string', dataIndx: 'Q_INSPECT_USER_NM', minWidth: 80, width: 80, editable: false},
            //         {title: '측정방법', datatype: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', minWidth: 100, width: 100, editable: false},
            //         {title: '등급', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NM', minWidth: 60, width: 60, editable: false,
            //             render: function (ui) {
            //                 let cellData = ui.cellData;
            //
            //                 if (cellData === '' || cellData === undefined) {
            //                     return '';
            //                 } else {
            //                     let text = cellData, style = '';
            //                     let rowData = ui.rowData;
            //
            //                     if (rowData.INSPECT_GRADE === 'GRD040' || rowData.INSPECT_GRADE === 'GRD050') {
            //                         style = 'color: #FF0000;font-weight: bold;';
            //                     }
            //
            //                     return {text: text, style: style};
            //                 }
            //             }
            //         },
            //         {title: '합/불', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', minWidth: 70, width: 70, editable: false},
            //         {title: '불량수량', datatype: 'string', dataIndx: 'Q_ERROR_QTY', minWidth: 50, width: 50, editable: false},
            //         {title: '반품일시', datatype: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 80, width: 80, editable: false},
            //         {title: '검사코드', datatype: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', minWidth: 100, width: 100, editable: false},
            //         {title: '상세 내용', datatype: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 200, width: 200, editable: false},
            //         {title: '발생공정', datatype: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', minWidth: 120, width: 120, editable: false},
            //         {title: '원인', datatype: 'string', dataIndx: 'Q_ERROR_REASON_NM', minWidth: 100, width: 100, editable: false},
            //         {title: '조치', datatype: 'string', dataIndx: 'Q_ERROR_ACTION_NM', minWidth: 80, width: 80, editable: false},
            //         {title: '조치방안 및 비고', datatype: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 120, width: 120, editable: false},
            //         {title: '작성일시', datatype: 'string', dataIndx: 'Q_DT', minWidth: 80, width: 80, editable: false},
            //         {title: '최근 실적<br>삭제', align: 'center', dataType: 'string', dataIndx: 'CONTROL_SEQ_DELETE', width: 80, minWidth: 80, editable: false,
            //             render: function (ui) {
            //                 if (ui.rowData.INSPECT_SEQ > 0) return "<button type=\"button\" class=\"miniBtn black\">삭제</button>";
            //                 return '';
            //             }
            //         }
            //     ]
            // }
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
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
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
                    // console.log(selectList[i].rowIndx);
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

        $("#inspection_manage_search_btn").on('click', function () {
            inspectionManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_form');
            } );
            inspectionManageGridId01.pqGrid("refreshDataAndView");
        });

        let $inspectionResultValueGrid  = $("#inspection_result_value_grid");
        let inspectionResultValueColModel = [
            {title: 'INSPECT_RESULT_SEQ', dataIndx: 'INSPECT_RESULT_SEQ', hidden: true},
            {title: 'POINT_SEQ', dataIndx: 'POINT_SEQ', hidden: true},
            {title: 'INSPECT_RESULT_VALUE_SEQ', dataIndx: 'INSPECT_RESULT_VALUE_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PRODUCT_NUM', dataIndx: 'PRODUCT_NUM', hidden: true},
            {title: 'No.', minWidth: 60, dataIndx: 'POINT_NUM', sortable:false, editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            {title: 'POS', minWidth: 60, dataIndx: 'POINT_POSITION', sortable:false, editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            },
            {title: '', minWidth: 60, dataIndx: 'RESULT_VALUE', sortable:false, editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
            }
        ]
        let inspectionResultValueObj = {
            height: 500,
            width: "auto",
            // selectionModel: { type: 'row', mode: 'single'},
            rowHtHead: 30,
            numberCell: {title: 'No.',show:false},
            sortModel: {on: false},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: '',
            editable: false,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: inspectionResultValueColModel,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'POINT_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_result_value_form'),
                // postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 20}, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                let data = this.option('dataModel.data');
                console.log('complete',data);
            }
        }
        $inspectionResultValueGrid.pqGrid(inspectionResultValueObj);

        $("#inspection_result_value_popup").on({
            'show.bs.modal': function () {
                $inspectionResultValueGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('inspection_result_value_form');
                } );
                $inspectionResultValueGrid.pqGrid("refreshDataAndView");
                let qty = $("#inspection_result_value_form").find("#ORDER_QTY").val();
                let arr = [];
                if(!fnIsEmpty(qty)) {
                    for(var i=1;i<=qty;i++) {
                        arr.push(i);
                    }
                }
                let changes = {
                    'TEST_DATA':arr,
                    'CONTROL_SEQ':$("#inspection_result_value_form").find("#CONTROL_SEQ").val(),
                    'CONTROL_DETAIL_SEQ':$("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val()
                };
                let parameters = {'url': '/selectInspectResult', 'data': {data: JSON.stringify(changes)}};
                fnPostAjaxAsync(function(data, callFunctionParam){
                    console.log(data)
                }, parameters, '');

            }, 'hide.bs.modal': function () {

            }
        })

        function openResultValuePop(data) {

            $("#inspection_result_value_form").find("#CONTROL_SEQ").val(data.CONTROL_SEQ);
            $("#inspection_result_value_form").find("#CONTROL_DETAIL_SEQ").val(data.CONTROL_DETAIL_SEQ);
            $("#inspection_result_value_form").find("#IMG_GFILE_SEQ").val(data.IMG_GFILE_SEQ);
            $("#inspection_result_value_form").find("#ORDER_QTY").val(data.ORDER_QTY);

            $("#inspection_result_value_popup").find("#CONTROL_PART_INFO").text(data.CONTROL_PART_INFO);
            $("#inspection_result_value_popup").find("#WORK_TYPE_NM").text(data.WORK_TYPE_NM);
            $("#inspection_result_value_popup").find("#ORDER_QTY_DIV").text(data.ORDER_QTY);


            $('#inspection_result_value_popup').modal('show');
        }



        $('#exportInspectResultBtn').on('click', function () {
            $("#inspection_result_value_popup").modal('show');
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

                    let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                    let parameters = {'url': '/json-info', 'data': data};
                    fnPostAjax(function (data) {
                        let dataInfo = data.info;
                        if(dataInfo != null) {
                            inspectionResultPopupWindow(dataInfo.CONTROL_SEQ,dataInfo.CONTROL_DETAIL_SEQ);
                        }
                    }, parameters, '');
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
            // const url = '/drawingUploadPopup?actionType=' + actionType + '&queryId=' + queryId;
            // 팝업 사이즈
            const nWidth = 1550;
            const nHeight = 950;
            const winWidth = document.body.clientWidth;
            const winHeight = document.body.clientHeight;
            const winX = window.screenX || window.screenLeft || 0;
            const winY = window.screenY || window.screenTop || 0;
            const nLeft = winX + (winWidth - nWidth) / 2;
            const nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (inspectionResultPopup === undefined || inspectionResultPopup.closed) {

                inspectionResultPopup = window.open('', 'popForm', strOption);

                $('#inspection_result_data_form').find("#CONTROL_SEQ").val(controlSeq);
                $('#inspection_result_data_form').find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);

                inspectFrom.action = "/inspectionResult";
                inspectFrom.target = "popForm";
                inspectFrom.submit();

            } else {
                inspectionResultPopup.focus();
                setTimeout(function() {

                    $(inspectionResultPopup.window.document).find("#CONTROL_SEQ").val(controlSeq);
                    $(inspectionResultPopup.window.document).find("#CONTROL_SEQ").val(controlDetailSeq);

                    // drawingUploadPopup.initDrawingLoad();
                }, 500);
            }
        }
    });

    $("#INSPECTION_BARCODE_NUM").focus();

    window.addEventListener('focus', function() {
        if($("#tab_10000601").parent().hasClass('on')) {
            setTimeout(function () {
                $("#INSPECTION_BARCODE_NUM").focus();
            },50)
        }
    }, false);
</script>
