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
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_POP_POSITION">현재위치</label>
                             <select id="SEL_POP_POSITION" name="SEL_POP_POSITION" title="현재위치" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1009}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
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
                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_INSPECT_GRADE" name="SEL_INSPECT_GRADE" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_INSPECT_GRADE">검사완료제외</label></span>
                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_OUTSIDE_YN">외주제외</label></span>
                        <span class="chk_box"><input id="INSPECTION_MANAGE_SEL_INNER_WORK_FINISH_YN" name="SEL_INNER_WORK_FINISH_YN" type="checkbox" checked><label for="INSPECTION_MANAGE_SEL_INNER_WORK_FINISH_YN">가공완료</label></span>
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
                <select id="inspectionManageFilterColumn"></select>
                <select id="inspectionManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="inspectionManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="inspectionManageFrozen" name="inspectionManageFrozen">
                </select>
                <span class="barCode" id="inspectionBarcodeSpan"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="inspectionBarcodeImg"></span>
                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="INSPECTION_BARCODE_NUM" id="INSPECTION_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
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
<div class="popup_container inspection" id="inspection_manage_pop" style="display: none;">
    <form class="form-inline" id="inspection_manage_pop_form" name="inspection_manage_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionPopInfoBasic">
        <input type="hidden" name="INSPECT_GRADE" id="INSPECT_GRADE" value="GRD010">
        <input type="hidden" name="INSPECT_METHOD" id="INSPECT_METHOD" value="1">
        <input type="hidden" name="ERROR_QTY" id="ERROR_QTY" value="">
        <input type="hidden" name="ORDER_QTY" id="ORDER_QTY" value="">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">


        <div class="layerPopup">
            <h3>품질 실적 등록</h3>
            <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
					<span class="buttonWrap" id="inspect_method_btn">
						<button type="button" class="onoff left on" id="inspect_method_1">Sampling</button>
						<button type="button" class="onoff right" id="inspect_method_2">전수검사</button>
					</span>
                    <ul class="listWrap">
                        <li class="tit blue">Seq.</li>
                        <li id="Q_SEQ">01</li>
                        <li class="tit bagic">작성자</li>
                        <li class="slt">
                            <select id="INSPECT_USER_ID" name="INSPECT_USER_ID" data-required="true">
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div class="m_area">
                    <div class="numWrap">
                        <span><b>&#9900; 수량 :</b><i id="ORDER_QTY_VIEW" style="padding-left: 0px;width: 100px;" class="center_sort">0</i></span>
                        <span style="width: 270px">
                            <b>&#9900; 불량수량 :</b><i id="ERROR_QTY_VIEW" style="padding-left: 0px;width: 100px;margin-right: 10px;" class="center_sort">0</i>
                            <button type="button" id="inspection_manage_pop_plus_btn" class="btn_plus" style="display: none;margin-right: 10px;">더하기</button>
                            <button type="button" id="inspection_manage_pop_plus_minus" class="btn_minus" style="display: none">빼기</button>
                        </span>
                    </div>
                    <div class="buttonWrap" id="inspect_grade_btn">
                        <button type="button" class="gradeBtn green" id="inspect_grade_GRD010"><span>A</span></button>
                        <button type="button" class="gradeBtn " id="inspect_grade_GRD020"><span>B</span></button>
                        <button type="button" class="gradeBtn " id="inspect_grade_GRD030"><span>C</span></button>
                        <button type="button" class="gradeBtn " id="inspect_grade_GRD040"><span>D</span></button>
                    </div>
                </div>
                <div class="t_area">
                    <div class="t_h">
                        <span class="list_t" id="inspection_manage_inspection_code_style">검사코드</span>
                        <span>
							<select id="INSPECT_RESULT" name="INSPECT_RESULT" title="검사코드">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1019}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
							</select>
						</span>
                        <span class="list_t">상세내용</span>
                        <span class="wide"><input type="text" class="wd_405_left_10" name="INSPECT_DESC" id="INSPECT_DESC" title="상세내용"></span>
                    </div>

                    <table class="colStyle">
                        <%--<caption></caption>--%>
                        <colgroup>
                            <col width="5%">
                            <col width="5%">
                            <col width="50%">
                            <col width="5%">
                        </colgroup>
                        <tr id="inspection_manage_grade_style">
                            <th scope="col">발생공정</th>
                            <th scope="col">원인</th>
                            <th scope="col">조치방안 및 비고</th>
                            <th scope="col">조치</th>

                        </tr>
                        <tr>
                            <td>
                                <select id="ERROR_PROCESS" name="ERROR_PROCESS" title="발생공정" disabled>
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1010}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select id="ERROR_REASON" name="ERROR_REASON" title="원인" disabled>
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1032}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" class="wd_405_left_10" name="ERROR_NOTE" id="ERROR_NOTE" title="조치방안비고" readonly></td>
                            <td>
                                <select id="ERROR_ACTION" name="ERROR_ACTION" title="조치" disabled>
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1025}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <h4>기본정보</h4>
                <div class="list1">
                    <table class="rowStyle">
                        <%--   <caption></caption>--%>
                        <colgroup>
                            <col width="10%">
                            <col width="30%">
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="15%">
                        </colgroup>
                        <tr>
                            <th>작업지시번호</th>
                            <td id="CONTROL_NUM_VIEW_T" class="red"></td>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM_VIEW_T" class="red"></td>
                            <th>주요검사</th>
                            <td id="MAIN_INSPECTION_NM_VIEW_T" style="color: #FF0000;"></td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td id="ITEM_NM_VIEW_T"></td>
                            <th>가공납기</th>
                            <td id="INNER_DUE_DT_VIEW_T" ></td>
                            <th>발주수량</th>
                            <td id="ORDER_QTY_INFO_VIEW_T"></td>
                        </tr>
                        <tr>
                            <th>규격 / 형태</th>
                            <td id="SIZE_TXT_WORK_TYPE_NM_VIEW_T"></td>
                            <th>소재종류</th>
                            <td id="MATERIAL_DETAIL_NM_VIEW_T"></td>
                            <th>표면처리</th>
                            <td id="SURFACE_TREAT_NM_VIEW_T"></td>
                        </tr>
                        <tr>
                            <th>발주업체</th>
                            <td id="ORDER_COMP_NM_VIEW_T"></td>
                            <th>외주업체</th>
                            <td id="OUTSIDE_COMP_NM_VIEW_T"></td>
                            <th>진행상태</th>
                            <td id="PART_STATUS_NM_VIEW_T"></td>
                        </tr>
                    </table>
                </div>
                <h4>공유사항</h4>
                <div class="list4">
                    <div id="inspection_manage_grid_pop_01"></div>
                </div>
                <h4>검사/반품이력</h4>
                <div class="list3">
                    <div id="inspection_manage_grid_pop_02"></div>
                </div>
            </div>

            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="inspection_manage_pop_save">저장</button>
                <button type="button" class="defaultBtn grayPopGra" id="popClose">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->






<script>



    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionManageGridId01 = $("#inspection_manage_grid");
        let inspectionManageColModel01;
        let inspectionManagePostData01;

        let inspectionManageGridIdPop01 = $("#inspection_manage_grid_pop_01");
        let inspectionManageColModelPop01;
        let inspectionManagePostDataPop01;

        let inspectionManageGridIdPop02 = $("#inspection_manage_grid_pop_02");
        let inspectionManageColModelPop02;
        let inspectionManagePostDataPop02;


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
            {title: '실적등록', align: 'center', dataType: 'string', dataIndx: 'CONTROL_SEQ_INSERT', width: 70, minWidth: 70, editable: false,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return "<button type=\"button\" class=\"miniBtn black\">등록</button>";
                    return '';
                }
            },
            {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 70, width: 70, editable: false},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 120, width: 120, editable: false},
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 80, width: 80, editable: false},
            {title: '긴<br>급', minWidth: 25, width: 25, dataType: 'string', dataIndx: 'EMERGENCY_YN_NM', editable: false},
            {title: '불<br>량', minWidth: 25, width: 25, dataType: 'string', dataIndx: 'INSPECT_GRADE_SHORT_NM', editable: false},
            {title: '주요검사', width: 70, dataType: 'string', dataIndx: 'MAIN_INSPECTION_NM', editable: false},
            {title: '외주가공', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 120, width: 120, editable: false},

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
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 180, width: 180, editable: false},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 40, width: 40, editable: false},
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
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 210, width: 210, editable: false},
            // {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 110, width: 110, editable: false},
            // {title: 'WORK_TYPE', dataType: 'string', dataIndx: 'WORK_TYPE', hidden:true},
            {title: '작업형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 70, width: 70, editable: false},
            // {title: 'MATERIAL_TYPE', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden:true},
            {title: '소재분류', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', minWidth: 110, width: 110, editable: false},
            {title: '발주<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50, editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        return ui.rowData.SAME_SIDE_YN === 'Y' ? cellData + '&nbsp;<span style="background-color: #C00000; color: white; font-size: 1.2rem; text-align: center; vertical-align: middle;">대</span>' : cellData;
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 140, width: 140, editable: false},
            {
                title: '최근 MCT 실적', datatype: 'string', align: 'center', colModel: [
                    {title: '날짜', datatype: 'string', dataIndx: 'MCT_WORK_DT', minWidth: 100, width: 100, editable: false},
                    {title: '작업자', datatype: 'string', dataIndx: 'WORK_USER_NM', minWidth: 100, width: 100, editable: false},
                    {title: 'NC No.', datatype: 'string', dataIndx: 'EQUIP_NM', minWidth: 70, width: 70, editable: false},
                    {title: '비고', datatype: 'string', dataIndx: 'CAM_NOTE', minWidth: 300, width: 300, editable: false}
                ]
            },
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_NM', minWidth: 100, width: 100, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 90, width: 90, editable: false},
            {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'seq', datatype: 'string', dataIndx: 'Q_SEQ', minWidth: 40, width: 40, editable: false},
                    {title: '담당관', datatype: 'string', dataIndx: 'Q_INSPECT_USER_NM', minWidth: 80, width: 80, editable: false},
                    {title: '측정방법', datatype: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', minWidth: 100, width: 100, editable: false},
                    {title: '등급', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NM', minWidth: 60, width: 60, editable: false,
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let text = cellData, style = '';
                                let rowData = ui.rowData;

                                if (rowData.INSPECT_GRADE === 'GRD040' || rowData.INSPECT_GRADE === 'GRD050') {
                                    style = 'color: #FF0000;font-weight: bold;';
                                }

                                return {text: text, style: style};
                            }
                        }
                    },
                    {title: '합/불', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', minWidth: 70, width: 70, editable: false},
                    {title: '불량수량', datatype: 'string', dataIndx: 'Q_ERROR_QTY', minWidth: 50, width: 50, editable: false},
                    {title: '반품일시', datatype: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 80, width: 80, editable: false},
                    {title: '검사코드', datatype: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', minWidth: 100, width: 100, editable: false},
                    {title: '상세 내용', datatype: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 200, width: 200, editable: false},
                    {title: '발생공정', datatype: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', minWidth: 120, width: 120, editable: false},
                    {title: '원인', datatype: 'string', dataIndx: 'Q_ERROR_REASON_NM', minWidth: 100, width: 100, editable: false},
                    {title: '조치', datatype: 'string', dataIndx: 'Q_ERROR_ACTION_NM', minWidth: 80, width: 80, editable: false},
                    {title: '조치방안 및 비고', datatype: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 120, width: 120, editable: false},
                    {title: '작성일시', datatype: 'string', dataIndx: 'Q_DT', minWidth: 80, width: 80, editable: false},
                    {title: '최근 실적<br>삭제', align: 'center', dataType: 'string', dataIndx: 'CONTROL_SEQ_DELETE', width: 80, minWidth: 80, editable: false,
                        render: function (ui) {
                            if (ui.rowData.INSPECT_SEQ > 0) return "<button type=\"button\" class=\"miniBtn black\">삭제</button>";
                            return '';
                        }
                    }
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
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#inspectionManageFilterColumn").empty();
                $("#inspectionManageFilterColumn").html(filterOpts);
                $("#inspectionManageFrozen").empty();
                $("#inspectionManageFrozen").html(frozenOts);
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

                        fnResetFrom("inspection_manage_pop_form");
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

        /**  팝업 그리드 1 선언 끝 **/
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList1");
        inspectionManagePostDataPop01 = fnFormToJsonArrayData('#inspection_manage_pop_form');
        inspectionManageColModelPop01 = [
            {title: '입력구분', dataType: 'string', dataIndx: 'NOTE_TYPE_NM', maxWidth: 150, width: 150, editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 95, width: 95, editable: false}
        ];
        inspectionManageGridIdPop01.pqGrid({
            width: "100%", height: 90,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModelPop01
        });
        /**  팝업 그리드 1 선언 끝 **/

        /**  팝업 그리드 2 선언 끝 **/
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList2");
        inspectionManagePostDataPop02 = fnFormToJsonArrayData('#inspection_manage_pop_form');
        inspectionManageColModelPop02 = [
            {title: 'Seq.', dataType: 'string', dataIndx: 'Q_SEQ', width: 40},
            {title: '담당관', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 120},
            // {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM',  width: 95},
            // {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT',  width: 95},
            {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NM',  width: 95},
            {title: '합/불', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE',  width: 95},
            // {title: '양품', dataType: 'string', dataIndx: 'Q_OK_QTY',  width: 95},
            {title: '불량수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY',  width: 95},
            {title: '검사코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM',  width: 95},
            {title: '상세 내용', dataType: 'string', dataIndx: 'Q_INSPECT_DESC',  width: 95},
            // {title: '원인', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM',  width: 95},
            {title: '발생공정', dataType: 'string', dataIndx: 'Q_ERROR_PROCESS_NM',  width: 95},
            {title: '조치', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM',  width: 95},
            {title: '조치방안 및 비고', dataType: 'string', dataIndx: 'Q_ERROR_NOTE',  width: 95},
            {title: '작성일시', dataType: 'string', dataIndx: 'Q_DT',  width: 100}
        ];
        inspectionManageGridIdPop02.pqGrid({
            width: "100%", height: 115,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', editable: false},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: false , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModelPop02
        });
        /**  팝업 그리드 2 선언 끝 **/



        $("#inspection_manage_pop").on('hide.bs.modal', function () {
            fnResetFrom("inspection_manage_pop_form");
            $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionList");
            $("#inspection_manage_search_btn").trigger("click");
            $("#INSPECTION_BARCODE_NUM").focus();
        });
        $("#inspection_manage_pop").on('show.bs.modal', function () {
            //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
            //     let popType = $("#inspection_manage_form").find("#popType").val();
            //     let V_INSIDE_inspection_NUM = $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val();
            //
            //     $("#inspection_manage_pop_form").find("#inside_stock_pop_save_btn").show();
            //     $("#inspection_manage_pop_form").find("#footer_msg").hide();
            //     $("#stock_manage_pop_form").find("#footer_msg").html("");
            //     //$("#stock_manage_pop_form").find("#DRAWING_NUM").attr("readonly", true);
            //$("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", true);

            //fnResetFrom("inspection_manage_pop_form");

            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoBasic");
            let parameters = {
                'url': '/json-info',
                'data': $('#inspection_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if (dataInfo == null) {
                    fnAlert(null, "해당 데이터가 존재하지 않습니다.");
                    $('#inspection_manage_pop').modal('hide');
                } else {
                    let emergencySpan = '';
                    fnJsonDataToForm("inspection_manage_pop_form", dataInfo);
                    $("#inspection_manage_pop_form").find("#Q_SEQ").html(dataInfo.Q_SEQ);
                    $("#inspection_manage_pop_form").find("#CONTROL_NUM" + "_VIEW_T").html(dataInfo.CONTROL_NUM);
                    $("#inspection_manage_pop_form").find("#DRAWING_NUM" + "_VIEW_T").html(dataInfo.DRAWING_NUM);
                    $("#inspection_manage_pop_form").find("#MAIN_INSPECTION_NM" + "_VIEW_T").html(dataInfo.MAIN_INSPECTION_NM);
                    if (dataInfo.EMERGENCY_YN === 'Y') {
                        emergencySpan = '<span style="display: inline-block; margin: 0 5px; padding: 0px 7px; border: solid red; border-radius: 5px; color: #FF0000; text-align: center; font-size: 1rem;">긴급</span>';
                    }
                    $("#inspection_manage_pop_form").find("#INNER_DUE_DT" + "_VIEW_T").html(dataInfo.INNER_DUE_DT + emergencySpan);
                    $("#inspection_manage_pop_form").find("#ITEM_NM" + "_VIEW_T").html(dataInfo.ITEM_NM);
                    $("#inspection_manage_pop_form").find("#MATERIAL_DETAIL_NM" + "_VIEW_T").html(dataInfo.MATERIAL_DETAIL_NM);
                    $("#inspection_manage_pop_form").find("#ORDER_QTY_INFO" + "_VIEW_T").html(dataInfo.ORDER_QTY_INFO);
                    $("#inspection_manage_pop_form").find("#SIZE_TXT_WORK_TYPE_NM" + "_VIEW_T").html(dataInfo.SIZE_TXT_WORK_TYPE_NM);
                    $("#inspection_manage_pop_form").find("#SURFACE_TREAT_NM" + "_VIEW_T").html(dataInfo.SURFACE_TREAT_NM);
                    $("#inspection_manage_pop_form").find("#PART_STATUS_NM" + "_VIEW_T").html(dataInfo.PART_STATUS_NM);
                    $("#inspection_manage_pop_form").find("#ORDER_COMP_NM" + "_VIEW_T").html(dataInfo.ORDER_COMP_NM);
                    $("#inspection_manage_pop_form").find("#OUTSIDE_COMP_NM" + "_VIEW_T").html(dataInfo.OUTSIDE_COMP_NM);

                    $("#inspection_manage_pop_form").find("#ORDER_QTY_VIEW").html(dataInfo.ORDER_QTY);
                    $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html("0");
                    $("#inspection_manage_pop_form").find("#INSPECT_METHOD").val("1");
                    $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val("GRD010");
                    $("#inspect_grade_GRD010").trigger("click");

                }

                // 작성자 선택
                $('#INSPECT_USER_ID').val('${authUserInfo.USER_ID}').prop('selected', true);
            }, parameters, '');

            //그리드 1
            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList1");
            inspectionManageGridIdPop01.pqGrid("option", "dataModel.postData", function (ui) {
                return fnFormToJsonArrayData('#inspection_manage_pop_form');
            });
            inspectionManageGridIdPop01.pqGrid("refreshDataAndView");


            //그리드 2
            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList2");
            inspectionManageGridIdPop02.pqGrid("option", "dataModel.postData", function (ui) {
                return fnFormToJsonArrayData('#inspection_manage_pop_form');
            });
            inspectionManageGridIdPop02.pqGrid("refreshDataAndView");

        });
        $("#inspection_manage_search_btn").on('click', function () {
            // console.log(fnFormToJsonArrayData('#inspection_manage_form'));
            inspectionManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_form');
            } );
            inspectionManageGridId01.pqGrid("refreshDataAndView");
        });

        $('#INSPECTION_MANAGE_EXCEL_EXPORT').on('click', function () {
            const blob = inspectionManageGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '검사실적 관리.xlsx');
        });

        $('#inspection_manage_pop_save').on('click', function () {
            // validation

            $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", false);
            let selINSPECT_RESULT = $("#inspection_manage_pop_form").find("#INSPECT_RESULT option:selected").val();
            let selINSPECT_GRADE = $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val();

            if(selINSPECT_GRADE == "GRD030" || selINSPECT_GRADE == "GRD040"){
                if(selINSPECT_RESULT == ""){
                    fnAlert(null, "검사코드는 필수 입력 값입니다.");
                    return;
                }
            }

            // $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            // $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").html());
            //
            // $("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", false);
            // $("#stock_manage_pop_form").find("#LOC_SEQ").attr("disabled", false);
            //
            // let parameters = {
            //     'url': '/managerInsideStockPop',
            //     'data': $('#stock_manage_pop_form').serialize()
            // };
            // fnPostAjax(function (data, callFunctionParam) {
            //     console.log(data);
            //     let footer_msg ="";
            //     let popType = $("#stock_manage_pop_form").find("#POP_TYPE").val();
            //     if(popType == "BARCODE"){
            //         footer_msg = pop_msg_in_done;
            //         $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
            //         $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val(data.INSIDE_STOCK_NUM);
            //         $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
            //     }else if(popType == "GRID_IN"){
            //         footer_msg = pop_msg_in_done;
            //         $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
            //         $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
            //     }else if(popType == "GRID_OUT"){
            //         footer_msg = pop_msg_out_done;
            //         $('#stock_manage_pop').modal('hide');
            //     }
            // }, parameters, '');
            $("#inspection_manage_pop_form").find("#queryId").val("inspection.insertInspectionMaster");

            let parameters = {'url': '/inspectionCreate', 'data': $("#inspection_manage_pop_form").serialize() };
            $(this).startWaitMe();
            fnPostAjax(function (data, callFunctionParam) {
                $(this).stopWaitMe();
                fnAlert(null, "등록이 완료되었습니다.", function () {
                    $("#INSPECTION_BARCODE_NUM").focus()
                });

                setTimeout(function() {
                    alertify.alert().close();
                    $("#INSPECTION_BARCODE_NUM").focus()
                },1000);
                $('#inspection_manage_pop').modal('hide');
            }, parameters, '');

        });

        $('#inspection_manage_pop_form').find('#popClose, #popClose2').on('click', function () {
            $('#inspection_manage_pop').modal('hide');
        });

        $("#INSPECTION_BARCODE_NUM").on('keyup', function(e) {

            if (e.keyCode == 13) {
                fnBarcodePrintCheck(function (confirm, callFunctionParam) {
                    let barcodeN = callFunctionParam;
                    if (confirm) {
                        fnResetFrom("inspection_manage_pop_form");

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

        fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_form').find('#SEL_OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_pop_form').find('#INSPECT_USER_ID'), '', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getUserList'}
        });



        $("#inspection_manage_pop_form").find("#inspect_method_btn > button").on('click', function (e) {
            $(this).siblings().removeClass("on");
            $(this).addClass("on");
            let targetId = this.id.replace("inspect_method_","");
            $("#inspection_manage_pop_form").find("#INSPECT_METHOD").val(targetId);
        });
        $("#inspection_manage_pop_form").find("#inspect_grade_btn > button").on('click', function (e) {

            let targetId = this.id.replace("inspect_grade_","");
            $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val(targetId);

            $("#inspection_manage_pop_form").find("#ERROR_PROCESS").val("");
            $("#inspection_manage_pop_form").find("#ERROR_REASON").val("");
            $("#inspection_manage_pop_form").find("#ERROR_ACTION").val("");
            $("#inspection_manage_pop_form").find("#ERROR_NOTE").val("");

            let $comboId = $('#inspection_manage_pop_form').find('#INSPECT_RESULT');
            $comboId[0].options.length = 0;

            if(targetId == "GRD040"){


                $("#inspection_manage_pop_plus_btn").show();
                $("#inspection_manage_pop_plus_minus").show();

                let errQty = $("#inspection_manage_pop_form").find("#ORDER_QTY").val();
                if (errQty == null || errQty == "" || errQty== "undefined") {
                    errQty = 0;
                }
                $("#inspection_manage_pop_form").find("#ERROR_QTY").val(errQty);
                $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html(errQty);



                $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", false);
                $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", false);
                $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", false);
                $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", false);


                $comboId[0].add(new Option("<spring:message code="com.form.top.sel.option" />", ""));
                <c:forEach var="vlocale" items="${HighCode.H_1020}">
                $comboId[0].add(new Option("${vlocale.CODE_NM_KR}", "${vlocale.CODE_CD}"));
                </c:forEach>

            }else{

                $("#inspection_manage_pop_plus_btn").hide();
                $("#inspection_manage_pop_plus_minus").hide();

                $("#inspection_manage_pop_form").find("#ERROR_QTY").val("0");
                $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html("0");


                $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", true);
                $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", true);
                $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", true);
                $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", true);

                $comboId[0].add(new Option("<spring:message code="com.form.top.sel.option" />", ""));
                <c:forEach var="vlocale" items="${HighCode.H_1019}">
                $comboId[0].add(new Option("${vlocale.CODE_NM_KR}", "${vlocale.CODE_CD}"));
                </c:forEach>

            }
            //display
            $(this).siblings().removeClass();
            $(this).siblings().addClass("gradeBtn");
            if(targetId == "GRD010"){
                $(this).addClass("green");
                $("#inspection_manage_grade_style").find("th").removeAttr("style","background: #e7eef7;color: #444;");
                $("#inspection_manage_inspection_code_style").attr("style","background: #e6e6e6;");
                $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", true);
            }else if(targetId == "GRD020"){
                $(this).addClass("blue");
                $("#inspection_manage_grade_style").find("th").removeAttr("style","background: #e7eef7;color: #444;");
                $("#inspection_manage_inspection_code_style").attr("style","background: #e6e6e6;");
                $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", true);
            }else if(targetId == "GRD030"){
                $(this).addClass("yellow");
                $("#inspection_manage_grade_style").find("th").removeAttr("style","background: #e7eef7;color: #444;");
                $("#inspection_manage_inspection_code_style").removeAttr("style","background: #e6e6e6;");
                $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", false);
            }else if(targetId == "GRD040"){
                $(this).addClass("red");
                $("#inspection_manage_grade_style").find("th").attr("style","background: #e7eef7;color: #444;");
                $("#inspection_manage_inspection_code_style").removeAttr("style","background: #e6e6e6;");
                $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", false);
            }
        });
        $('#inspection_manage_pop_plus_btn').on('click', function(e) {
            inspectionManagePopCalcQty("PLUS");
        });
        $('#inspection_manage_pop_plus_minus').on('click', function(e) {
            inspectionManagePopCalcQty("MINUS");
        });
        $('#inspection_manage_pop_all_btn').on('click', function(e) {
            // let ORIGINAL_POP_STOCK_QTY_AFTER = $('#stock_manage_pop_form').find('#ORIGINAL_POP_STOCK_QTY_AFTER').val();
            // let ORIGINAL_ORDER_QTY =  $('#stock_manage_pop_form').find('#ORIGINAL_ORDER_QTY').val();
            //
            // $('#stock_manage_pop_form').find('#ORDER_QTY').html(ORIGINAL_ORDER_QTY);
            // $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(ORIGINAL_POP_STOCK_QTY_AFTER);

        });
        let inspectionManagePopCalcQty = function(type){

            let POP_ORDER_QTY = $('#inspection_manage_pop_form').find('#ORDER_QTY').val();//입고수량
            let POP_ERROR_QTY = $('#inspection_manage_pop_form').find('#ERROR_QTY').val();//입고수량

            if(type == "PLUS"){
                if(parseInt(POP_ORDER_QTY) >  parseInt(POP_ERROR_QTY)) {
                    POP_ERROR_QTY = parseInt(POP_ERROR_QTY) + 1;
                }
            }else if(type == "MINUS"){
                if(parseInt(POP_ERROR_QTY) >  0){
                    POP_ERROR_QTY = parseInt(POP_ERROR_QTY)-1;
                }
            }
            $('#inspection_manage_pop_form').find('#ERROR_QTY').val(POP_ERROR_QTY);
            $('#inspection_manage_pop_form').find('#ERROR_QTY_VIEW').html(POP_ERROR_QTY);
        }

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
