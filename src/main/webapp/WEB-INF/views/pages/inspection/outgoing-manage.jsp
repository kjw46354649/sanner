<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="outgoing_manage_form" name="outgoing_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionList">
            <div class="gubunWrap row2_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주업체</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주업체">
                                <option value="" selected="selected">ALL</option>
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
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_발주번호">발주번호</label>
                            <input type="text" class="wd_200" name="SEL_발주번호" id="SEL_발주번호" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="outgoing_manage_search_btn">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap mg-right10">
                            <label class="label_100" for="SEL_OUTGOING_DATE_TYPE">구분</label>
                            <select class="wd_200" name="SEL_OUTGOING_DATE_TYPE" id="SEL_OUTGOING_DATE_TYPE">
                               <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1066}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_1" value="0" ><label for="SEL_OUTGOING_TERM_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_2" value="3"><label for="SEL_OUTGOING_TERM_2">~3일</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_3" value="7"><label for="SEL_OUTGOING_TERM_3">~1주일</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_ST_DT" placeholder="" value="" title="시작날짜">
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_END_DT" placeholder="" value="" title="종료날짜">
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="txt_span"><label class="label_100" for="SEL_INSPECT_GRADE">Option</label></span>
                        <span class="chk_box"><input id="SEL_INSPECT_GRADE" name="SEL_INSPECT_GRADE" type="checkbox"><label for="SEL_INSPECT_GRADE">지연대상 항시 상단표시</label></span>
                        <span class="chk_box"><input id="SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox"><label for="SEL_OUTSIDE_YN">Part 단위 표시</label></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <span class="barCode"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="outgoingBarcodeImg"></span>
                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="OUTGOING_BARCODE_NUM" id="OUTGOING_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn" id="outgoing_manage_detail_btn">상세정보 조회</button>
                    <button type="button" class="defaultBtn" id="outgoing_manage_out_btn">출고등록</button>
                    <button type="button" class="defaultBtn" id="outgoing_manage_label_print_btn">라벨출력</button>
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="outgoing_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="outgoing_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 품질실적 layer popup : S -->
<div class="popup_container inspection" id="outgoing_manage_pop" style="display: none;">
    <form class="form-inline" id="outgoing_manage_pop_form" name="outgoing_manage_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectOutgoingPopInfoBasic">
        <input type="hidden" name="ERROR_QTY" id="ERROR_QTY" value="">
        <input type="hidden" name="ORDER_QTY" id="ORDER_QTY" value="">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">

    <div class="layerPopup">
        <h3>품질 실적 등록</h3>
        <%--<button type="button" class="pop_close">닫기</button>--%>
        <div class="qualityWrap">
            <div class="h_area">
					<span class="buttonWrap" id="inspect_method_btn">
						<button type="button" class="onoff left on" id="inspect_method_1">Sampling</button>
						<button type="button" class="onoff right" id="inspect_method_2">전수검사</button>
					</span>
                <ul class="listWrap">
<%--                    <li class="tit blue">Seq.</li>--%>
<%--                    <li>04</li>--%>
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
                    <span><b>&#9900; 수량 :</b><i id="ORDER_QTY_VIEW">0</i></span>
                    <span><b>&#9900; 불량수량 :</b><i id="ERROR_QTY_VIEW">0</i>
                        <button type="button" id="outgoing_manage_pop_plus_btn" class="btn_plus" style="display: none">더하기</button>
                        <button type="button" id="outgoing_manage_pop_plus_minus" class="btn_minus" style="display: none">빼기</button>
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
                    <span class="list_t">검사코드</span>
                    <span>
							<select id="INSPECT_RESULT" name="INSPECT_RESULT" title="검사코드">
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
                    <tr>
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
                        <col width="*">
                        <col width="10%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td class="red">신진철강</td>
                        <th>도면번호</th>
                        <td class="red">하나알루</td>
                        <th>납기</th>
                        <td>10/21 (긴급)</td>
                    </tr>
                    <tr>
                        <th>품명</th>
                        <td>신진철강</td>
                        <th>소재종류</th>
                        <td>하나알루</td>
                        <th>수량(원칭,대칭)</th>
                        <td>12</td>
                    </tr>
                    <tr>
                        <th>규격</th>
                        <td>신진철강</td>
                        <th>후처리</th>
                        <td>하나알루</td>
                        <th>가공형태</th>
                        <td>수정가공</td>
                    </tr>
                    <tr>
                        <th>진행상태</th>
                        <td>검사대기</td>
                        <th>발주업체</th>
                        <td>삼성전자</td>
                        <th>외주업체</th>
                        <td>SJ테크</td>
                    </tr>
                </table>
            </div>
            <h4>공유사항</h4>
            <div class="list4">
                <div id="outgoing_manage_grid_pop_01"></div>
            </div>
            <h4>공유사항</h4>
            <div class="list3">
                <div id="outgoing_manage_grid_pop_02"></div>
            </div>
        </div>
        <div class="btnWrap">
            <button type="button" id="outgoing_manage_pop_save" class="submit">submit</button>
            <button type="button" id="popClose" class="cancel">cancel</button>
        </div>
    </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->


<!-- 화면 버튼 mini popup : S -->
<div class="popup_container" id="outgoing_manage_pop_type_1" style="display: none;">
    <form class="form-inline" id="outgoing_manage_pop_type_1_form" name="outgoing_manage_pop_type_1_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectOutgoingOutType1">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" id="ORDER_QTY" name="ORDER_QTY" value="">
        <input type="hidden" id="OUT_QTY" name="OUT_QTY" value="">
        <input type="hidden" id="NEW_OUT_QTY" name="NEW_OUT_QTY" value="">
        <input type="hidden" id="ORG_NEW_OUT_QTY" name="ORG_NEW_OUT_QTY" value="">



        <div class="miniPopup">
            <div class="headWrap">
                <h4 id="pop_title">출고실적 등록</h4>
                <%--<button class="closeBtn">닫기</button>--%>
            </div>
            <div class="contentWrap">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td colspan="4"><input type="text" name="CONTROL_NUM" id="CONTROL_NUM"  value="" title="관리번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>도면번호</th>
                        <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>발주번호</th>
                        <td colspan="4"><input type="text" name="ORDER_NUM" id="ORDER_NUM"  value="" title="발주번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>출고대상수량</th>
                        <td id="outgoing_manage_pop_type_1_form_view_1"></td>
                        <th>잔여수량</th>
                        <td colspan="2" id="outgoing_manage_pop_type_1_form_view_2"></td>
                    </tr>
                    <tr>
                        <th>출고</th>
                        <td colspan="4" class="bg_green">
                            <button type="button" class="btn_plus" id="outgoing_manage_mini_pop_plus_btn">더하기</button>
                            <span class="text" id="NEW_OUT_QTY_VIEW">0</span>
                            <button type="button" class="btn_minus" id="outgoing_manage_mini_pop_minus_btn">빼기</button>
                            <button type="button" class="btn_allPlus" id="outgoing_manage_mini_pop_all_btn">전량</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="process">
                    <span class="pr_txt"><b>출고</b>를 진행하시겠습니까?</span>
                    <div class="btnWrap">
                        <button type="button" class="submit" id="outgoing_manage_mini_pop_save_btn">submit</button>
                        <button type="button" class="cancel" id="outgoing_manage_mini_pop_close_btn">cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 화면 버튼 mini popup : E -->

<!-- 라벨 mini popup : S -->
<div class="popup_container" id="outgoing_manage_pop_type_label" style="display: ;">
    <form class="form-inline" id="outgoing_manage_pop_type_label_form" name="outgoing_manage_pop_type_1_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectOutgoingOutType2">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" id="PACKING_NUM" name="PACKING_NUM" value="">
        <div class="miniPopup">
            <div class="headWrap">
                <h4 id="pop_title">출고실적 등록</h4>
                <%--<button class="closeBtn">닫기</button>--%>
            </div>
            <div class="contentWrap">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td colspan="4"><input type="text" name="CONTROL_NUM" id="CONTROL_NUM"  value="" title="관리번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>도면번호</th>
                        <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>발주번호</th>
                        <td colspan="4"><input type="text" name="ORDER_NUM" id="ORDER_NUM"  value="" title="발주번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>출고대상포장수량</th>
                        <td id="outgoing_manage_pop_type_label_form_view_1"></td>
                        <th>잔여포장수량</th>
                        <td colspan="2" id="outgoing_manage_pop_type_label_form_view_2"></td>
                    </tr>
                    <tr>
                        <th>출고</th>
                        <td colspan="4" class="bg_green" id="outgoing_manage_pop_type_label_form_view_3">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="process">
                    <span class="pr_txt"><b>출고</b>처리되었습니다.</span>
                    <div class="btnWrap">
                        <button type="button" class="cancel" id="outgoing_manage_pop_type_label_close_btn">cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 라벨 mini popup : E -->



<script>
    $(function () {
        'use strict';

        let outgoingManageSelectedRowIndex = [];

        let outgoingManageGridId01 = $("#outgoing_manage_grid");
        let outgoingManageColModel01;
        let outgoingManagePostData01;

        /**  리스트 그리드 선언 시작 **/
        $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
        outgoingManagePostData01 = fnFormToJsonArrayData('#outgoing_manage_form');
        outgoingManageColModel01 = [
            {title: 'ORDER_SEQ', dataType: 'string', dataIndx: 'ORDER_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: '발주처', dataType: 'string', dataIndx: 'xxxx', minWidth: 95, width: 95, editable: false},
            {title: '발주번호', dataType: 'string', dataIndx: 'xxxx', minWidth: 95, width: 95, editable: false},
            {title: '요망납기', dataType: 'string', dataIndx: 'xxxx', minWidth: 150, width: 150, editable: false},
            {title: '가공납기', dataType: 'string', dataIndx: 'xxxx', minWidth: 150, width: 150, editable: false},
            {title: '외주가공', dataType: 'string', dataIndx: 'xxxx', minWidth: 150, width: 150, editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: 'xxxx', minWidth: 200, width: 200, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'xxxx', minWidth: 40, width: 40, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[눈]";
                    return '';
                }
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'xxxx', minWidth: 200, width: 200, editable: false},
            {title: '형태', dataType: 'string', dataIndx: 'xxxx', minWidth: 200, width: 200, editable: false},
            {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 120, width: 120, editable: false},
            {title: '후처리', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 120, width: 120, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120, editable: false},
            {title: '주문수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 60, width: 60, editable: false},
            {title: '출고수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 60, width: 60, editable: false},
            {title: '출고일시', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 60, width: 60, editable: false},
            {title: '반품일시', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 60, width: 60, editable: false},
            {title: '포장묶음', dataType: 'integer', dataIndx: 'PACKING_CNT', minWidth: 60, width: 60, editable: true},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_OUT', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['ORDER_SEQ'] > 0) return "[출고]";
                    return '';
                }
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_RETURN', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['ORDER_SEQ'] > 0) return "[반품]";
                    return '';
                }
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_LABEL', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['ORDER_SEQ'] > 0) return "[라벨]";
                    return '';
                }
            },
           {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 120, width: 120, editable: false},
                    {title: '검사결과', datatype: 'string', dataIndx: 'WORK_USER_NM', minWidth: 100, width: 100, editable: false},
                    {title: '', datatype: 'string', dataIndx: 'EQUIP_NM', minWidth: 120, width: 120, editable: false},
                    {title: '불량코드', datatype: 'string', dataIndx: 'MCT_NOTE', minWidth: 300, width: 300, editable: false},
                   {title: '비고', datatype: 'string', dataIndx: 'MCT_NOTE', minWidth: 300, width: 300, editable: false},
                   {title: '조치', datatype: 'string', dataIndx: 'MCT_NOTE', minWidth: 300, width: 300, editable: false},
                   {title: '조치방안', datatype: 'string', dataIndx: 'MCT_NOTE', minWidth: 300, width: 300, editable: false}
                ]
            },
            {title: '가공진행상태', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120, editable: false},
            {title: '현재위치(POP/DB)', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120, editable: false}
        ];
        outgoingManageGridId01.pqGrid({
            width: "100%", height: 700,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ORDER_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('outgoing_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingManageColModel01,
            complete: function () {
                let data = outgoingManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_grid_records').html(totalRecords);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    outgoingManageSelectedRowIndex = [];
                    let outgoingManageGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let outgoingManageGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (outgoingManageGridFirstRow === outgoingManageGridLastRow) {
                        outgoingManageSelectedRowIndex[0] = outgoingManageGridFirstRow;
                    } else {
                        for (let i = outgoingManageGridFirstRow; i <= outgoingManageGridLastRow; i++) {
                            outgoingManageSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            change: function (event, ui) {
                console.log(ui);
                if(ui.source == 'edit') {
                    let row = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;
                    let data = {
                        'queryId': 'inspection.updateControlPartOrderPackingCnt',
                        'CONTROL_SEQ': row.CONTROL_SEQ,
                        'CONTROL_DETAIL_SEQ': row.CONTROL_DETAIL_SEQ,
                        'ORDER_SEQ': row.ORDER_SEQ,
                        'PACKING_CNT': newRow.PACKING_CNT
                    };
                    let parameters = {'url': '/json-create', 'data': data };
                    fnPostAjax(function (data, callFunctionParam) {
                        $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                        $("#outgoing_manage_search_btn").trigger("click");
                    }, parameters, '');
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;
                if (ui.rowData['ORDER_SEQ'] != undefined && ui.rowData['ORDER_SEQ'] >0) {
                    if (ui.dataIndx == 'MANUAL_OUT') {
                        fnResetFrom("outgoing_manage_pop_type_1_form");
                        $("#outgoing_manage_pop_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                        $("#outgoing_manage_pop_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                        $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                        $('#outgoing_manage_pop_type_1').modal('show');

                    }
                    if (ui.dataIndx == 'MANUAL_RETURN') {
                        alert('MANUAL_RETURN');
                    }
                    if (ui.dataIndx == 'MANUAL_LABEL') {
                        alert('MANUAL_LABEL');
                    }
                }

            }
        });
        /**  리스트 그리드 선언 끝 **/




        $("#outgoing_manage_pop_type_1").on('hide.bs.modal', function(){
           fnResetFrom("outgoing_manage_pop_type_1_form");
           $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
           $("#outgoing_manage_search_btn").trigger("click");
        });

        $("#outgoing_manage_pop_type_1").on('show.bs.modal', function(){

            $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.selectOutgoingOutType1");
            let parameters = {
                'url': '/json-info',
                'data': $('#outgoing_manage_pop_type_1_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if(dataInfo == null ) {
                    alert("해당 데이터가 존재하지 않습니다.");
                    $('#outgoing_manage_pop_type_1').modal('hide');
                }else{
                    fnJsonDataToForm("outgoing_manage_pop_type_1_form", dataInfo);
                    //ORDER_QTY 총수량, OUT_QTY 나간 수량, NEW_OUT_QTY 나갈 수량량
                    let view = dataInfo.NEW_OUT_QTY + "/" + dataInfo.ORDER_QTY;
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_1").html(view);
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_2").html("0");
                    $("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY_VIEW").html(dataInfo.NEW_OUT_QTY);
                    $("#outgoing_manage_pop_type_1_form").find("#ORG_NEW_OUT_QTY").val(dataInfo.NEW_OUT_QTY);

                }
            }, parameters, '');



         })

        $("#outgoing_manage_detail_btn").on('click', function () {
            alert("상세정보조회 팝업 연계 개발중.");
        });
         $("#outgoing_manage_search_btn").on('click', function () {
            outgoingManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#outgoing_manage_form');
            } );
            outgoingManageGridId01.pqGrid("refreshDataAndView");
        });

        $('[name=SEL_OUTGOING_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            newDate.setDate(newDate.getDate() - value);
            $('#SEL_ST_DT').val(newDate.yyyymmdd());
            $('#SEL_END_DT').val(today.yyyymmdd());
            // outgoingChangeDate(newDate, today);

        });

        $(".datepicker-input").each(function(){ $(this).datepicker();});

        $('#outgoing_manage_mini_pop_plus_btn').on('click', function(e) {
            outgoingManageMiniPopCalcQty("PLUS");
        });
        $('#outgoing_manage_mini_pop_minus_btn').on('click', function(e) {
            outgoingManageMiniPopCalcQty("MINUS");
        });
        $('#outgoing_manage_mini_pop_all_btn').on('click', function(e) {
            let ORIGINAL_NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#ORG_NEW_OUT_QTY').val();

            $('#outgoing_manage_pop_type_1_form').find('#outgoing_manage_pop_type_1_form_view_2').html("0");
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY_VIEW').html(ORIGINAL_NEW_OUT_QTY);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val(ORIGINAL_NEW_OUT_QTY);

        });
        let outgoingManageMiniPopCalcQty = function(type){
            //ORDER_QTY 총수량, OUT_QTY 나간 수량, NEW_OUT_QTY 나갈 수량량
            let ORIGINAL_NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#ORG_NEW_OUT_QTY').val();
            let NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val();

            if(type == "PLUS"){
                if(parseInt(ORIGINAL_NEW_OUT_QTY) > parseInt(NEW_OUT_QTY)) {
                    NEW_OUT_QTY = parseInt(NEW_OUT_QTY) + 1;
                }
            }else if(type == "MINUS"){
                if(parseInt(NEW_OUT_QTY) >  0){
                    NEW_OUT_QTY = parseInt(NEW_OUT_QTY)-1;
                }
            }
            let restQty = ORIGINAL_NEW_OUT_QTY - NEW_OUT_QTY;
            $('#outgoing_manage_pop_type_1_form').find('#outgoing_manage_pop_type_1_form_view_2').html(restQty);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY_VIEW').html(NEW_OUT_QTY);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val(NEW_OUT_QTY);
        }

        $('#outgoing_manage_mini_pop_save_btn').on('click', function () {
            // validation
            $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.insertOutgoingOutType1");

            let parameters = {'url': '/json-create', 'data': $("#outgoing_manage_pop_type_1_form").serialize() };
            fnPostAjax(function (data, callFunctionParam) {
                alert("등록이 완료되었습니다.");
                $('#outgoing_manage_pop_type_1').modal('hide');
            }, parameters, '');

        });
        $('#outgoing_manage_out_btn').on('click', function () {
            // validation
            let dynamicSql = "";
            let rowData = "";

            let selectedRowCount = outgoingManageSelectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                rowData = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: outgoingManageSelectedRowIndex[i]});

                if(i >0) dynamicSql += " UNION ALL ";

                dynamicSql += "SELECT " + rowData.CONTROL_SEQ + ","  + rowData.CONTROL_DETAIL_SEQ + "," + rowData.ORDER_SEQ + " FROM DUAL ";
            }
            let data = {
                'queryId': 'inspection.insertOutgoingOutType2',
                'DYNAMIC_PARAM': dynamicSql
            };
            let parameters = {'url': '/json-create', 'data': data };
            fnPostAjax(function (data, callFunctionParam) {
                alert("등록이 완료되었습니다.");
                fnResetFrom("outgoing_manage_pop_type_1_form");
                $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                $("#outgoing_manage_search_btn").trigger("click");
            }, parameters, '');

        });

        $('#outgoing_manage_mini_pop_close_btn').on('click', function () {
            $('#outgoing_manage_pop_type_1').modal('hide');
        });

        $("#OUTGOING_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode == 13) {
                //fnResetFrom("outgoing_manage_pop_form");
                //L : LABEL, C:BARCODE
                let barcodeNum = this.value;
                let barcodeType = barcodeNum.charAt(0).toUpperCase();
                let barcodesql = "";

                if(barcodeType == "L"){
                    barcodesql = "common.selectOutBarcodeInfo";
                }else if(barcodeType == "C"){
                    barcodesql = "common.selectControlBarcodeInfo";
                }else{
                    alert("알수 없는 바코드 타입입니다.[" + barcodeNum +"]");
                    return;
                }

                //0. 바코드 정보 가져오기
                let data = {'queryId': barcodesql,'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info','data': data};
                fnPostAjax(function (data, callFunctionParam) {
                    let dataInfo = data.info;
                    if(dataInfo == null ) {
                        alert("해당 바코드가 존재하지 않습니다.");
                        return;
                    }else{

                    //. 나중에 보여줄 정보가져오기
                        if(barcodeType == "L"){
                            fnJsonDataToForm("outgoing_manage_pop_type_label_form", dataInfo);
                            $("#outgoing_manage_pop_type_label_form").find("#queryId").val("inspection.xxx");
                            let parameters = {
                                'url': '/json-info',
                                'data': $('#outgoing_manage_pop_type_label_form').serialize()
                            };
                            fnPostAjax(function (data, callFunctionParam) {
                                let dataInfo = data.info;
                                if(dataInfo == null ) {
                                    //
                                }else{
                                    fnJsonDataToForm("outgoing_manage_pop_type_label_form", dataInfo);
                                    //. 저장하기
                                    $("#outgoing_manage_pop_type_label_form").find("#queryId").val("inspection.xxx");
                                    let parameters = {'url': '/json-create', 'data': $('#outgoing_manage_pop_type_label_form').serialize() };
                                    fnPostAjax(function (data, callFunctionParam) {
                                    }, parameters, '');
                                    //. 모달 띄우기
                                    $('#outgoing_manage_pop_type_label').modal('show');
                                }
                            }, parameters, '');
                        }else if(barcodeType == "C"){
                            let CONTROL_SEQ =  dataInfo.CONTROL_SEQ;
                            let CONTROL_DETAIL_SEQ =  dataInfo.CONTROL_DETAIL_SEQ;
                        }


                    }
                }, parameters, '');


                return;
                //1. insert
                alert("바코드 임의로 키넣어놨음. 삭제 필요");
                $("#outgoing_manage_pop_form").find("#CONTROL_SEQ").val("2094");
                $("#outgoing_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val("2160");
                $('#outgoing_manage_pop').modal('show');
            }
        });

        $("#OUTGOING_BARCODE_NUM").on({
            focus: function () {
                $("#outgoingBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#outgoingBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long.png");
            }
        });









    });




</script>
