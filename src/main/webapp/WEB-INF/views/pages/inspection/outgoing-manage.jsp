<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="outgoing_manage_form" name="outgoing_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectOutgoingList">
            <div class="none_gubunWrap row2_topWrap" >
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
                            <label class="label_100" for="SEL_ORDER_NUM">발주번호</label>
                            <input type="text" class="wd_200" name="SEL_ORDER_NUM" id="SEL_ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>

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
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_ST_DT" placeholder="" value="" title="시작날짜" readonly>
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_END_DT" placeholder="" value="" title="종료날짜" readonly>
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="txt_span"><label class="label_100" for="SEL_PART_NUM_VIEW_YN">Option</label></span>
<%--                        <span class="chk_box"><input id="SEL_DELAY_TOP" name="SEL_DELAY_TOP" type="checkbox"><label for="SEL_DELAY_TOP">지연대상 항시 상단표시</label></span>--%>
                        <span class="chk_box"><input id="SEL_PART_NUM_VIEW_YN" name="SEL_PART_NUM_VIEW_YN" type="checkbox"><label for="SEL_PART_NUM_VIEW_YN">Part 단위 표시</label></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="outgoing_manage_search_btn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="text" id="outgoingManageFilterKeyword" placeholder="Enter your keyword">
                <select id="outgoingManageFilterColumn"></select>
                <select id="outgoingManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="outgoingManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="outgoingManageFrozen" name="outgoingManageFrozen">
                </select>
                <span class="barCode"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="outgoingBarcodeImg"></span>
                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="OUTGOING_BARCODE_NUM" id="OUTGOING_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
                <span class="radio_box">
                    <input reqcd="R" type="radio" name="OUTGOING_BARCODE_PRINT_TYPE" id="OUTGOING_BARCODE_PRINT_TYPE_1" value="1" checked><label for="OUTGOING_BARCODE_PRINT_TYPE_1">출고</label>
                </span>
                <span class="radio_box">
                    <input reqcd="R" type="radio" name="OUTGOING_BARCODE_PRINT_TYPE" id="OUTGOING_BARCODE_PRINT_TYPE_2" value="2"><label for="OUTGOING_BARCODE_PRINT_TYPE_2">라벨출력</label>
                </span>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn" id="outgoing_manage_detail_btn">상세정보 조회</button>
                    <button type="button" class="defaultBtn" id="outgoing_manage_return_complete_btn">반품현황 조회</button>
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

<!-- 반품 현황 layer popup : S -->
<div class="popup_container inspection " id="outgoing_manage_return_complete_pop" style="display: none;">
        <div class="layerPopup" style="height: 545px">
            <h3>반품 현황 조회</h3>
            <button type="button" class="pop_close mg-top10 mg-right8" id="outgoing_manage_return_complete_pop_close2">닫기</button>
            <%--<button type="button" class="pop_close">닫기</button>--%>
<%--                <h4>기본정보</h4>--%>
            <div class="h_area mg-bottom10">

            </div>
            <div class="list1">
                <div class="tableWrap" >
                    <div class="conWrap">
                        <div id="outgoing_manage_return_complete_pop_grid"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="outgoing_manage_return_complete_pop_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_return_complete_pop_close">닫기</button>
            </div>
        </div>
</div>
<!-- 반품 현황 layer popup : E -->

<!-- 반품 품질실적 layer popup : S -->
<div class="popup_container inspection outgoing" id="outgoing_manage_return_pop" style="display: none;">
    <form class="form-inline" id="outgoing_manage_return_form" name="outgoing_manage_return_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectOutgoingReturnInfo1">
        <input type="hidden" name="ORG_REAL_OUT_QTY" id="ORG_REAL_OUT_QTY" value="">
        <input type="hidden" name="ERROR_QTY" id="ERROR_QTY" value="">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" name="ORDER_SEQ" id="ORDER_SEQ" value="">
        <%--.grayPopGra { background: #999; border: 1px solid #999; color: #fff; -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color=#2B89FA)";/*IE 8*/  width: 100px; height: 30px; font-size: 15px;}
        .greenPopGra { background: #4d8d1a; border: 1px solid #4d8d1a; color: #fff; -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color=#2B89FA)";/*IE 8*/ width: 100px; height: 30px; font-size: 15px;}--%>
    <div class="layerPopup" style="height: 530px">
        <h3>반품실적등록</h3>
        <button type="button" class="pop_close mg-top10 mg-right8" id="outgoing_manage_return_pop_close2">닫기</button>
        <%--<button type="button" class="pop_close">닫기</button>--%>
        <div class="qualityWrap">
            <div class="h_area mg-bottom10">

            </div>
            <div class="t_area">
                <div class="t_h">
                    <span class="list_t" style="width: 192px;">반품종류</span>
                    <span style="width: 193px;">
							<select id="INSPECT_GRADE" name="INSPECT_GRADE" title="반품종류">
                                <c:forEach var="vlocale" items="${HighCode.H_1040}">
                                    <c:if test="${vlocale.CODE_CD == 'GRD050' or vlocale.CODE_CD == 'GRD060'}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.NOTE}</option>
                                    </c:if>
                                </c:forEach>
							</select>
						</span>
<%--                    <span class="wide">&nbsp;</span>--%>
                </div>

                <table class="colStyle">
                    <%--<caption></caption>--%>
                    <colgroup>
                        <col width="50px">
                        <col width="50px">
                        <col width="50px">
                        <col width="170px">
                        <col width="100px">
                    </colgroup>
                    <tr>
                        <th scope="col">주문수량</th>
                        <th scope="col">출고수량</th>
                        <th scope="col">출고일</th>
                        <th scope="col">반품수량</th>
                        <th scope="col">작성자</th>

                    </tr>
                    <tr>
                        <td id="ORDER_QTY_RETURN_VIEW"></td>
                        <td id="REAL_OUT_QTY_RETURN_VIEW"></td>
                        <td id="OUT_FINISH_DT_RETURN_VIEW"></td>
                        <td>
                            <button type="button" class="btn_plus" id="outgoing_manage_return_pop_plus_btn">더하기</button>
                            <span class="text" id="ERROR_QTY_VIEW">0</span>
                            <button type="button" class="btn_minus" id="outgoing_manage_return_pop_minus_btn">빼기</button>
                            <button type="button" class="btn_allPlus" id="outgoing_manage_return_pop_all_btn">전량</button>
                        </td>
                        <td>
                            <select id="INSPECT_USER_ID" name="INSPECT_USER_ID" data-required="true">
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <h2>&nbsp;</h2>
            <div class="t_area">
                <div class="t_h">
                    <span class="list_t" style="width: 193px;">불량코드</span>
                    <span style="width: 194px;">
							<select id="INSPECT_RESULT" name="INSPECT_RESULT" title="불량코드">
                                 <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1021}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
							</select>
						</span>
                    <span class="list_t" style="width: 193px;">상세내용</span>
                    <span class="wide"><input type="text" class="wd_370_left_10" name="INSPECT_DESC" id="INSPECT_DESC" title="상세내용"></span>
                </div>

                <table class="colStyle">
                    <%--<caption></caption>--%>
                    <colgroup>
                        <col width="20%">
                        <col width="60%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th scope="col" >원인</th>
                        <th scope="col">조치방안 및 비고</th>
                        <th scope="col">조치</th>

                    </tr>
                    <tr>
                        <td >
                            <select id="ERROR_REASON" name="ERROR_REASON" title="원인" >
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1032}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><input type="text" class="wd_555_left_10" name="ERROR_NOTE" id="ERROR_NOTE" title="조치방안비고" ></td>
                        <td>
                            <select id="ERROR_ACTION" name="ERROR_ACTION" title="조치" >
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
                         <td id="CONTROL_NUM_VIEW_T" class="red"></td>
                         <th>도면번호</th>
                         <td id="DRAWING_NUM_VIEW_T" class="red"></td>
                         <th>납기</th>
                         <td id="INNER_DUE_DT_VIEW_T" ></td>
                     </tr>
                     <tr>
                         <th>품명</th>
                         <td id="ITEM_NM_VIEW_T"></td>
                         <th>소재종류</th>
                         <td id="MATERIAL_DETAIL_NM_VIEW_T"></td>
                         <th>수량(원칭,대칭)</th>
                         <td id="ORDER_QTY_INFO_VIEW_T"></td>
                     </tr>
                     <tr>
                         <th>규격</th>
                         <td id="SIZE_TXT_VIEW_T"></td>
                         <th>후처리</th>
                         <td id="SURFACE_TREAT_NM_VIEW_T"></td>
                         <th>가공형태</th>
                         <td id="WORK_TYPE_NM_VIEW_T"></td>
                     </tr>
                     <tr>
                         <th>진행상태</th>
                         <td id="PART_STATUS_NM_VIEW_T"></td>
                         <th>발주업체</th>
                         <td id="ORDER_COMP_NM_VIEW_T"></td>
                         <th>외주업체</th>
                         <td id="OUTSIDE_COMP_NM_VIEW_T"></td>
                     </tr>
                </table>
            </div>
        </div>
        <div class="btnWrap">
            <button type="button" class="defaultBtn greenPopGra" id="outgoing_manage_return_pop_save">저장</button>
            <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_return_pop_close">닫기</button>
        </div>
    </div>
    </form>
</div>
<!-- 반품 품질실적 layer popup : E -->


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
<%--            <div class="headWrap2">--%>
<%--                <h4 id="pop_title">출고실적 등록</h4>--%>
<%--                <button class="pop_close">닫기</button>--%>
<%--            </div>--%>

            <div class="contentWrap">
                <h3>출고실적 등록</h3>
                <button type="button" class="pop_close" id="popClose2">닫기</button>
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
                        <th>대상수량</th>
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
                        <button type="button" class="defaultBtn greenPopGra" id="outgoing_manage_mini_pop_save_btn">저장</button>
                        <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_mini_pop_close_btn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 화면 버튼 mini popup : E -->

<!-- 라벨 mini popup : S -->
<div class="popup_container" id="outgoing_manage_pop_type_label" style="display: none;">
    <form class="form-inline" id="outgoing_manage_pop_type_label_form" name="outgoing_manage_pop_type_label_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectOutgoingOutType4">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" id="PACKING_NUM" name="PACKING_NUM" value="">
        <input type="hidden" id="BARCODE_NUM" name="BARCODE_NUM" value="">
        <div class="miniPopup">
<%--            <div class="headWrap">--%>
<%--                <h4 id="pop_title">출고실적 등록</h4>--%>
<%--                &lt;%&ndash;<button class="closeBtn">닫기</button>&ndash;%&gt;--%>
<%--            </div>--%>
            <div class="contentWrap">
                <h3>출고실적 등록</h3>
                <table>
                    <caption></caption>
                    <colgroup>
                        <col width="90px">
                        <col width="120px">
                        <col width="90px">
                        <col width="40px">
                        <col width="40px">
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
                        <th>출고대상<BR/>포장수량</th>
                        <td id="outgoing_manage_pop_type_label_form_view_1"></td>
                        <th>잔여<BR/>포장수량</th>
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
                        <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_pop_type_label_close_btn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 라벨 mini popup : E -->

<!-- 도면 mini popup : S -->
<div class="popup_container" id="outgoing_manage_pop_type_control" style="display: none;">
    <form class="form-inline" id="outgoing_manage_pop_type_control_form" name="outgoing_manage_pop_type_control_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectOutgoingOutType3">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">

        <div class="miniPopup">
<%--            <div class="headWrap">--%>
<%--                <h4 id="pop_title">출고실적 등록</h4>--%>
<%--                &lt;%&ndash;<button class="closeBtn">닫기</button>&ndash;%&gt;--%>
<%--            </div>--%>
            <div class="contentWrap">
                <h3>출고실적 등록</h3>
                <table>
                    <caption></caption>
                    <colgroup>
                        <col width="90px">
                        <col width="120px">
                        <col width="90px">
                        <col width="40px">
                        <col width="40px">
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
                        <th>출고대상<BR/>수량</th>
                        <td id="outgoing_manage_pop_type_control_form_view_1"></td>
                        <th>잔여수량</th>
                        <td colspan="2" id="outgoing_manage_pop_type_control_form_view_2"></td>
                    </tr>
                    <tr>
                        <th>출고</th>
                        <td colspan="4" class="bg_green" id="outgoing_manage_pop_type_control_form_view_3">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="process">
                    <span class="pr_txt"><b>출고</b>처리되었습니다.</span>
                    <div class="btnWrap">
                        <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_pop_type_control_close_btn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 도면 mini popup : E -->

<!-- 라벨 출력 그리드 버튼 mini popup : E -->
<div class="popup_container" id="outgoing_manage_pop_label_type_1" style="display: none;">
    <form class="form-inline" id="outgoing_manage_pop_label_type_1_form" name="outgoing_manage_pop_label_type_1_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectOutgoingLabelType1">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">


        <div class="miniPopup">
            <%--<div class="headWrap">
&lt;%&ndash;                <h4 id="pop_title">라벨 출력</h4>&ndash;%&gt;
&lt;%&ndash;                <button id="label_print_close" class="closeBtn">닫기</button>&ndash;%&gt;
            </div>--%>
            <div class="contentWrap">
                <h3>라벨 출력</h3>
                <button type="button" class="pop_close" id="outgoing_manage_pop_label_type_1_close_btn2">닫기</button>
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
                        <td colspan="4"><input type="text" name="CONTROL_NUM" id="CONTROL_NUM"  value="" title="관리번호" class="wd_230" readonly></td>
                    </tr>
                    <tr>
                        <th>도면번호</th>
                        <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_230" readonly></td>
                    </tr>
                    <tr>
                        <th>발주번호</th>
                        <td colspan="4"><input type="text" name="ORDER_NUM" id="ORDER_NUM"  value="" title="발주번호" class="wd_230" readonly></td>
                    </tr>
                    <tr>
                        <th>출고대상수량</th>
                        <td id="outgoing_manage_pop_label_type_1_form_view_1"></td>
                        <th>포장수량</th>
                        <td colspan="2" id="outgoing_manage_pop_label_type_1_form_view_2"></td>
                    </tr>
                    <tr>
                        <th>출력대상</th>
                        <td colspan="4" class="bg_green">
                            <select class="wd_100" name="SEL_BARCODE_NUM" id="SEL_BARCODE_NUM" title="BARCODE">
                            </select> &nbsp;
                            <button type="button" class="btn_one" id="outgoing_manage_pop_label_type_1_form_print_1">1장만</button>
                            <button type="button" class="btn_allPlus" id="outgoing_manage_pop_label_type_1_form_print_all">전체</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="process">
                   <div class="btnWrap">
                       <button type="button" class="defaultBtn grayPopGra" id="outgoing_manage_pop_label_type_1_close_btn">닫기</button>
                   </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 라벨 출력 그리드 버튼 mini popup : E -->

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
            // {title: 'BARCODE_NUM', dataType: 'string', dataIndx: 'BARCODE_NUM', hidden:true},
            {title: 'ORDER_SEQ', dataType: 'string', dataIndx: 'ORDER_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: 'INSPECT_SEQ', dataType: 'string', dataIndx: 'INSPECT_SEQ', hidden:true},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 95, width: 95, editable: false},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM', minWidth: 95, width: 95, editable: false},
            {title: '요망납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', minWidth: 100, width: 100, editable: false},
            {title: '가공납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 100, width: 100, editable: false},
            {title: '포장묶음', dataType: 'integer', dataIndx: 'PACKING_CNT', minWidth: 60, width: 60, editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '', minWidth: 150, width: 150, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'fffffF'}, dataType: 'string', dataIndx: 'BTN', editable: false,
                           render: function (ui) {
                                    let grid = this;
                                    let $cell = grid.getCell(ui);
                                    let rowData = ui.rowData;
                                    let outBtn = '';
                                    let returnBtn = '';
                                    let labelBtn = '';
                                    // console.log("ui.rowData['PART_NUM']",ui.rowData['PART_NUM']);
                                    if (ui.rowData['PART_NUM'] == undefined){//part 있음 모든 버튼 안보이게
                                        // console.log("ui.rowData['OUT_FINISH_DT']",ui.rowData['OUT_FINISH_DT']);
                                        // console.log("ui.rowData['ORDER_SEQ']",ui.rowData['ORDER_SEQ']);
                                        // console.log("ui.rowData['ORDER_QTY']",ui.rowData['ORDER_QTY']);
                                        if (ui.rowData['OUT_FINISH_DT'] != undefined){
                                            if (ui.rowData['ORDER_SEQ'] != undefined){
                                                outBtn = '<button type=\"button\" class=\"miniBtn gray\">출고</button>' + '&nbsp;';
                                            }
                                        }else{
                                            if (ui.rowData['ORDER_SEQ'] != undefined){
                                                outBtn = '<button type=\"button\" class=\"miniBtn black\" id=\"outBtn\"  data-control_seq=\"'+ rowData.CONTROL_SEQ +'\" data-control_detail_seq=\"'+ rowData.CONTROL_DETAIL_SEQ +'\" data-order_seq=\"'+ rowData.ORDER_SEQ +'\">출고</button>' + '&nbsp;';
                                            }
                                        }


                                        if (ui.rowData['ORDER_SEQ'] != undefined){
                                            if (ui.rowData['ORDER_QTY'] != undefined){
                                                returnBtn = '<button type=\"button\" class=\"miniBtn blue\" id=\"returnBtn\"  data-control_seq=\"'+ rowData.CONTROL_SEQ +'\" data-control_detail_seq=\"'+ rowData.CONTROL_DETAIL_SEQ +'\" data-order_seq=\"'+ rowData.ORDER_SEQ +'\">반품</button>' + '&nbsp;';
                                            }else{
                                                returnBtn = '<button type=\"button\" class=\"miniBtn gray\">반품</button>' + '&nbsp;';
                                            }
                                        }

                                        if (ui.rowData['ORDER_SEQ'] != undefined){
                                            labelBtn = '<button type=\"button\" class=\"miniBtn orange\" id=\"labelBtn\"  data-control_seq=\"'+ rowData.CONTROL_SEQ +'\" data-control_detail_seq=\"'+ rowData.CONTROL_DETAIL_SEQ +'\" data-order_seq=\"'+ rowData.ORDER_SEQ +'\">라벨</button>';
                                        }
                                    }

                               return outBtn + returnBtn + labelBtn;
                           }
                          /* , postRender: function (ui) {
                                            let grid = this;
                                            let $cell = grid.getCell(ui);
                                            //let rowData = ui.rowData;
                                alert(1);
                                            if (ui.rowData['ORDER_SEQ'] != undefined && ui.rowData['ORDER_SEQ'] >0) {
                                                    $cell.find('#outBtn').bind('click', function(e) {
                                                        alert(2);
                                                      e.preventDefault();
                                                        alert(3);
                                                        fnResetFrom("outgoing_manage_pop_type_1_form");
                                                       $("#outgoing_manage_pop_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                                                       $("#outgoing_manage_pop_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                                                       $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                                                       $('#outgoing_manage_pop_type_1').modal('show');
                                                    });
                                                    $cell.find('#returnBtn').bind('click', function(e) {
                                                      e.preventDefault();
                                                        fnResetFrom("outgoing_manage_return_form");
                                                        $("#outgoing_manage_return_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                                                        $("#outgoing_manage_return_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                                                        $("#outgoing_manage_return_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                                                        $('#outgoing_manage_return_pop').modal('show');
                                                    });
                                                    $cell.find('#labelBtn').bind('click', function(e) {
                                                      e.preventDefault();
                                                        /!*그리드에 바코드 하나
                                                        let formData = new Array();
                                                        formData[0] = ui.rowData['BARCODE_NUM'];*!/

                                                        fnResetFrom("outgoing_manage_pop_label_type_1_form");
                                                        $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                                                        $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                                                        $("#outgoing_manage_pop_label_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                                                        $('#outgoing_manage_pop_label_type_1').modal('show');
                                                    });

                                            }
                                      }*/
                       },
            {title: '외주가공', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 100, width: 100, editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 180, width: 180, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 40, width: 40, editable: false},
            // {title: '', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[눈]";
            //         return '';
            //     }
            // },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 200, width: 200, editable: false},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 120, width: 120, editable: false},
            // {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 120, width: 120, editable: false},
            {title: '후처리', dataType: 'string', dataIndx: 'SURFACE_TREAT_NM', minWidth: 120, width: 120, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120, editable: false},
            {title: '주문수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 60, width: 60, editable: false},
            {title: '출고수량', dataType: 'integer', dataIndx: 'OUT_QTY', minWidth: 60, width: 60, editable: false, format: '#,###'},
            {title: '출고일시', dataType: 'string', dataIndx: 'OUT_FINISH_DT', minWidth: 60, width: 60, editable: false},
            {
                title: '반품정보', datatype: 'string', align: 'center', colModel: [
                    {title: '수량', datatype: 'integer', dataIndx: 'RETURN_QTY', minWidth: 80, width: 80, editable: false, format: '#,###'},
                    {title: '발생일', datatype: 'string', dataIndx: 'RETURN_LAST_DT', minWidth: 60, width: 60, editable: false},
                    {title: '조치일', datatype: 'string', dataIndx: 'RETURN_FINISH_DT', minWidth: 100, width: 100, editable: false}
                ]
            },
            // {title: '반품일시', dataType: 'string', dataIndx: 'OUT_RETURN_DT', minWidth: 60, width: 60, editable: false},

            // {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_OUT', width: 70, minWidth: 70, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn black\">출고</button>";
            //         return '';
            //     }
            // },
            // {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_RETURN', width: 70, minWidth: 70, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn blue\">반품</button>";
            //         return '';
            //     }
            // },
            // {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_LABEL', width: 70, minWidth: 70, editable: false,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn orange\">라벨</button>";
            //         return '';
            //     }
            // },

           {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'string', dataIndx: 'Q_SEQ', minWidth: 40, width: 40, editable: false},
                    {title: '검사결과', datatype: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', minWidth: 80, width: 80, editable: false},
                    {title: '', datatype: 'string', dataIndx: 'Q_ERROR_QTY', minWidth: 20, width: 20, editable: false},
                    {title: '불량코드', datatype: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', minWidth: 100, width: 100, editable: false},
                   {title: '비고', datatype: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 100, width: 100, editable: false},
                   {title: '조치', datatype: 'string', dataIndx: 'Q_ERROR_ACTION_NM', minWidth: 100, width: 100, editable: false},
                   {title: '조치방안', datatype: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 100, width: 100, editable: false}
                ]
            },
            {title: '가공진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 100, width: 100, editable: false},
            {title: '현재위치(POP/DB)', dataType: 'string', dataIndx: 'POP_NM', minWidth: 100, width: 100, editable: false}
        ];
        outgoingManageGridId01.pqGrid({
            width: "100%", height: 740,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ORDER_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('outgoing_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', render: outgoingManageFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingManageColModel01,
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#outgoingManageFilterColumn").empty();
                $("#outgoingManageFilterColumn").html(filterOpts);
                $("#outgoingManageFrozen").empty();
                $("#outgoingManageFrozen").html(frozenOts);
            },
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
                    if (ui.dataIndx == 'PACKING_CNT') {
                        let row = ui.updateList[0].rowData;
                        let newRow = ui.updateList[0].newRow;

                        let data = {
                            'queryId': 'inspection.updateControlPartOrderPackingCnt1,inspection.updateControlPartOrderPackingCnt2,inspection.insertControlPartOrderPackingCnt3',
                            'CONTROL_SEQ': row.CONTROL_SEQ,
                            'CONTROL_DETAIL_SEQ': row.CONTROL_DETAIL_SEQ,
                            'ORDER_SEQ': row.ORDER_SEQ,
                            'PACKING_CNT': newRow.PACKING_CNT
                        };
                        let parameters = {'url': '/json-manager', 'data': data};
                        fnPostAjax(function (data, callFunctionParam) {
                            alert("등록이 완료되었습니다.");
                            $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                            $("#outgoing_manage_search_btn").trigger("click");
                        }, parameters, '');
                    }

                    /*let data = {
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
                    }, parameters, '');*/
                }
            }
           /*, cellClick: function (event, ui) {
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
                        fnResetFrom("outgoing_manage_return_form");
                        $("#outgoing_manage_return_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                        $("#outgoing_manage_return_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                        $("#outgoing_manage_return_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                        $('#outgoing_manage_return_pop').modal('show');
                    }
                    if (ui.dataIndx == 'MANUAL_LABEL') {

                        /!*그리드에 바코드 하나
                        let formData = new Array();
                        formData[0] = ui.rowData['BARCODE_NUM'];*!/

                        fnResetFrom("outgoing_manage_pop_label_type_1_form");
                        $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                        $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                        $("#outgoing_manage_pop_label_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                        $('#outgoing_manage_pop_label_type_1').modal('show');
                    }
                }

            }*/
        });
        /**  리스트 그리드 선언 끝 **/


        /**  반품 현황 조회 그리드 선언 시작 **/
        let outgoingReturnCompleteGridId = 'outgoing_manage_return_complete_pop_grid';
        let outgoingReturnCompleteColModel;
        let outgoingReturnCompleteObj;
        let $outgoingReturnCompleteGrid;


        // let outgoingManageGridId02 = $("#outgoing_manage_return_complete_pop_grid");
        // let outgoingManageColModel02;
        // let outgoingManageObj02;
        // let outgoingManagePostData02;

        outgoingReturnCompleteColModel = [
            {title: 'ORDER_SEQ', dataType: 'string', dataIndx: 'ORDER_SEQ', hidden:true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden:true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden:true},
            {title: 'INSPECT_SEQ', dataType: 'string', dataIndx: 'INSPECT_SEQ', hidden:true},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'MANUAL_ACTION', width: 80, minWidth: 80, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn black\">조치완료</button>";
                    return '';

                }
            },
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 95, width: 95, editable: false},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM', minWidth: 95, width: 95, editable: false},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 120, width: 120, editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 180, width: 180, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 180, width: 180, editable: false},
            {title: '작업형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 80, width: 80, editable: false},
            {title: '소재', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 100, width: 100, editable: false},
            {title: '후처리', dataType: 'string', dataIndx: 'SURFACE_TREAT_NM', minWidth: 80, width: 80, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120, editable: false},
            {title: '주문<br/>수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
            {title: '출고', dataType: 'string', dataIndx: 'OUT_QTY', minWidth: 40, width: 40, editable: false},
            {title: '출고일시', dataType: 'string', dataIndx: 'OUT_FINISH_DT', minWidth: 60, width: 60, editable: false},
            {
                title: '반품정보', datatype: 'string', align: 'center', colModel: [
                    {title: '수량', datatype: 'string', dataIndx: 'ERROR_QTY', minWidth: 60, width: 60, editable: false},
                    {title: '발생일', datatype: 'string', dataIndx: 'RETURN_DT', minWidth: 60, width: 60, editable: false},
                    {title: '등급', datatype: 'string', dataIndx: 'INSPECT_GRADE_NM', minWidth: 80, width: 80, editable: false},
                    {title: '불량코드', datatype: 'string', dataIndx: 'INSPECT_RESULT_NM', minWidth: 100, width: 100, editable: false},
                    {title: '조치방안', datatype: 'string', dataIndx: 'ERROR_NOTE', minWidth: 100, width: 100, editable: false}
                ]
            },
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_NM', minWidth: 80, width: 80, editable: false}

        ];
        //outgoingManageGridId02.pqGrid({
        outgoingReturnCompleteObj ={
            width: "100%", height: 400,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSPECT_SEQ',
                url: "/paramQueryGridSelect",
                postData:  {queryId: 'inspection.selectOutgoingReturnCompleteList'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            //numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingReturnCompleteColModel,
            complete: function () {
                let data = $outgoingReturnCompleteGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_return_complete_pop_grid_records').html(totalRecords);
            },
            cellClick: function (event, ui)
            {
                let rowIndx = ui.rowIndx, $grid = this;
                if (ui.rowData['INSPECT_SEQ'] != undefined && ui.rowData['INSPECT_SEQ'] >0)
                {
                    if (ui.dataIndx == 'MANUAL_ACTION') {
                        let data = {
                            'queryId': 'inspection.updateOutgoingReturnComplete',
                            'INSPECT_SEQ': ui.rowData['INSPECT_SEQ']
                        };
                        let parameters = {'url': '/json-create', 'data': data };
                        fnPostAjax(function (data, callFunctionParam) {
                            alert("등록이 완료되었습니다.");
                            $('#outgoing_manage_return_complete_pop').modal('hide');
                            $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                            $("#outgoing_manage_search_btn").trigger("click");
                        }, parameters, '');

                    }
                }
            }
        //});
        };
        /**  반품 현황 조회 그리드 선언 끝 **/

        $('#outgoing_manage_return_pop_save').on('click', function () {
            // validation
            $('#outgoing_manage_return_form').find("#INSPECT_RESULT").attr("disabled", false);
            $('#outgoing_manage_return_form').find("#ERROR_REASON").attr("disabled", false);
            $('#outgoing_manage_return_form').find("#INSPECT_DESC").attr("readonly", false);


            $("#outgoing_manage_return_form").find("#queryId").val("inspection.insertOutgoingReturn");

            let parameters = {'url': '/json-create', 'data': $("#outgoing_manage_return_form").serialize() };
            fnPostAjax(function (data, callFunctionParam) {
                alert("등록이 완료되었습니다.");
                $('#outgoing_manage_return_pop').modal('hide');
            }, parameters, '');

            // $("#outgoing_manage_return_form").find("#queryId").val("inspection.insertOutgoingReturn,inspection.updateOutgoingReturnAfter1,inspection.updateOutgoingReturnAfter2");
            //
            // let data = $("#outgoing_manage_return_form").serialize();
            // let parameters = {'url': '/json-manager', 'data': data};
            // fnPostAjax(function (data, callFunctionParam) {
            //     alert("등록이 완료되었습니다.");
            //     $('#outgoing_manage_return_pop').modal('hide');
            // }, parameters, '');
        });
        $('#outgoing_manage_return_complete_pop_close, #outgoing_manage_return_complete_pop_close2').on('click', function () {
              $('#outgoing_manage_return_complete_pop').modal('hide');
        });
        $('#outgoing_manage_pop_label_type_1_close_btn, #outgoing_manage_pop_label_type_1_close_btn2').on('click', function () {
                    $('#outgoing_manage_pop_label_type_1').modal('hide');
        });
        $('#outgoing_manage_return_pop_close, #outgoing_manage_return_pop_close2').on('click', function () {
            $('#outgoing_manage_return_pop').modal('hide');
        });
        $("#outgoing_manage_return_pop").on('hide.bs.modal', function(){
            fnResetFrom("outgoing_manage_return_form");
            $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
            $("#outgoing_manage_search_btn").trigger("click");
        });
        $("#outgoing_manage_return_pop").on('show.bs.modal', function(){

            $("#outgoing_manage_return_form").find("#queryId").val("inspection.selectOutgoingReturnInfo1");
            let parameters = {
                'url': '/json-info',
                'data': $('#outgoing_manage_return_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if(dataInfo == null ) {
                    alert("해당 데이터가 존재하지 않습니다.");
                    $('#outgoing_manage_return_pop').modal('hide');
                }else{
                    fnJsonDataToForm("outgoing_manage_return_form", dataInfo);
                    $("#outgoing_manage_return_form").find("#ORG_REAL_OUT_QTY").val(dataInfo.REAL_OUT_QTY);
                    $("#outgoing_manage_return_form").find("#ERROR_QTY").val("0");
                    $("#outgoing_manage_return_form").find("#ERROR_QTY_VIEW").html("0");
                    $("#outgoing_manage_return_form").find("#ORDER_QTY_RETURN_VIEW").html(dataInfo.ORDER_QTY);
                    $("#outgoing_manage_return_form").find("#REAL_OUT_QTY_RETURN_VIEW").html(dataInfo.REAL_OUT_QTY);
                    $("#outgoing_manage_return_form").find("#OUT_FINISH_DT_RETURN_VIEW").html(dataInfo.OUT_FINISH_DT);
                    /*let view = dataInfo.NEW_OUT_QTY + "/" + dataInfo.ORDER_QTY;
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_1").html(view);
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_2").html("0");
                    $("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY_VIEW").html(dataInfo.NEW_OUT_QTY);
                    $("#outgoing_manage_pop_type_1_form").find("#ORG_NEW_OUT_QTY").val(dataInfo.NEW_OUT_QTY);
                    */

                    //기본정보 S **********************
                    $("#outgoing_manage_return_form").find("#queryId").val("inspection.selectOutgoingReturnInfo2");
                    let parameters = {
                        'url': '/json-info',
                        'data': $('#outgoing_manage_return_form').serialize()
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        let dataInfo = data.info;
                        if(dataInfo == null ) {
                        }else{
                            //fnJsonDataToForm("outgoing_manage_return_form", dataInfo);

                            $("#outgoing_manage_return_form").find("#CONTROL_NUM" + "_VIEW_T").html(dataInfo.CONTROL_NUM);
                            $("#outgoing_manage_return_form").find("#DRAWING_NUM" + "_VIEW_T").html(dataInfo.DRAWING_NUM);
                            $("#outgoing_manage_return_form").find("#INNER_DUE_DT" + "_VIEW_T").html(dataInfo.INNER_DUE_DT);
                            $("#outgoing_manage_return_form").find("#ITEM_NM" + "_VIEW_T").html(dataInfo.ITEM_NM);
                            $("#outgoing_manage_return_form").find("#MATERIAL_DETAIL_NM" + "_VIEW_T").html(dataInfo.MATERIAL_DETAIL_NM);
                            $("#outgoing_manage_return_form").find("#ORDER_QTY_INFO" + "_VIEW_T").html(dataInfo.ORDER_QTY_INFO);
                            $("#outgoing_manage_return_form").find("#SIZE_TXT" + "_VIEW_T").html(dataInfo.SIZE_TXT);
                            $("#outgoing_manage_return_form").find("#SURFACE_TREAT_NM" + "_VIEW_T").html(dataInfo.SURFACE_TREAT_NM);
                            $("#outgoing_manage_return_form").find("#WORK_TYPE_NM" + "_VIEW_T").html(dataInfo.WORK_TYPE_NM);
                            $("#outgoing_manage_return_form").find("#PART_STATUS_NM" + "_VIEW_T").html(dataInfo.PART_STATUS_NM);
                            $("#outgoing_manage_return_form").find("#ORDER_COMP_NM" + "_VIEW_T").html(dataInfo.ORDER_COMP_NM);
                            $("#outgoing_manage_return_form").find("#OUTSIDE_COMP_NM" + "_VIEW_T").html(dataInfo.OUTSIDE_COMP_NM);

                        }
                    }, parameters, '');
                    //기본정보 E **********************



                }
            }, parameters, '');



        })

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
         });
        $("#outgoing_manage_pop_label_type_1_form").find("#label_print_close").on('click', function(){
            $('#outgoing_manage_pop_label_type_1').modal('hide');
        });
        $("#outgoing_manage_pop_label_type_1").on('hide.bs.modal', function(){
            fnResetFrom("outgoing_manage_pop_label_type_1_form");
        });
        $("#outgoing_manage_pop_label_type_1").on('show.bs.modal', function(){

            $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1");
            let parameters = {
                'url': '/json-info',
                'data': $('#outgoing_manage_pop_label_type_1_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if(dataInfo == null ) {
                    alert("해당 데이터가 존재하지 않습니다.");
                    $('#outgoing_manage_pop_label_type_1').modal('hide');
                }else{
                    fnJsonDataToForm("outgoing_manage_pop_label_type_1_form", dataInfo);
                    $("#outgoing_manage_pop_label_type_1_form").find("#outgoing_manage_pop_label_type_1_form_view_1").html(dataInfo.ORDER_QTY);
                    $("#outgoing_manage_pop_label_type_1_form").find("#outgoing_manage_pop_label_type_1_form_view_2").html(dataInfo.PACKING_CNT);

                    $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1Combo");
                    fnCommCodeDatasourceSelectBoxCreate($('#outgoing_manage_pop_label_type_1_form').find('#SEL_BARCODE_NUM'), '', {
                        'url': '/json-list',
                        'data':  $('#outgoing_manage_pop_label_type_1_form').serialize()
                    });

                }
            }, parameters, '');
        });
        $("#outgoing_manage_pop_label_type_1_form_print_1").on('click', function () {

            let formData = new Array();
            formData[0] = $("#outgoing_manage_pop_label_type_1_form").find("#SEL_BARCODE_NUM").val();
            fnBarcodePrint(function(data, callFunctionParam){
                alert(data.message);
            }, formData, '');
        });
        $("#outgoing_manage_pop_label_type_1_form_print_all").on('click', function () {
            let formData = new Array();
            $("#outgoing_manage_pop_label_type_1_form").find("#SEL_BARCODE_NUM>option").each(function(){
                formData.push($(this).val());
            });
            fnBarcodePrint(function(data, callFunctionParam){
                alert(data.message);
            }, formData, '');
        });
        $("#outgoing_manage_detail_btn").on('click', function () {
            // if(SelectedRowIndex.length >0){
            //     let rowDataArray = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: SelectedRowIndex[0]});
            //     console.log(rowDataArray);
            //     let CONTROL_DETAIL_SEQ = rowDataArray.CONTROL_DETAIL_SEQ;
            //     let CONTROL_SEQ = rowDataArray.CONTROL_SEQ;
            //
            //     g_item_detail_pop_view(CONTROL_SEQ,CONTROL_DETAIL_SEQ);
            // }else{
            //     alert("그리드를 선택해 주십시오.");
            // }
            g_item_detail_pop_view('','');
        });
         $("#outgoing_manage_search_btn").on('click', function () {
            outgoingManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#outgoing_manage_form');
            } );
            outgoingManageGridId01.pqGrid("refreshDataAndView");
        });
        $("#outgoing_manage_form").find('[name=SEL_OUTGOING_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            newDate.setDate(newDate.getDate() - value);
            $("#outgoing_manage_form").find('#SEL_ST_DT').val(newDate.yyyymmdd());
            $("#outgoing_manage_form").find('#SEL_END_DT').val(today.yyyymmdd());
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
        $('#outgoing_manage_return_pop_plus_btn').on('click', function(e) {
            outgoingManageReturnPopCalcQty("PLUS");
        });
        $('#outgoing_manage_return_pop_minus_btn').on('click', function(e) {
            outgoingManageReturnPopCalcQty("MINUS");
        });
        $('#outgoing_manage_return_pop_all_btn').on('click', function(e) {
            let ORG_REAL_OUT_QTY = $('#outgoing_manage_return_form').find('#ORG_REAL_OUT_QTY').val();

            $('#outgoing_manage_return_form').find('#ERROR_QTY_VIEW').html(ORG_REAL_OUT_QTY);
            $('#outgoing_manage_return_form').find('#ERROR_QTY').val(ORG_REAL_OUT_QTY);

        });
        let outgoingManageReturnPopCalcQty = function(type){
            let ORG_REAL_OUT_QTY = $('#outgoing_manage_return_form').find('#ORG_REAL_OUT_QTY').val();
            let ERROR_QTY = $('#outgoing_manage_return_form').find('#ERROR_QTY').val();

            console.log("ERROR_QTY",ERROR_QTY);
            if(type == "PLUS"){
                if(parseInt(ORG_REAL_OUT_QTY) > parseInt(ERROR_QTY)) {
                    ERROR_QTY = parseInt(ERROR_QTY) + 1;
                }
            }else if(type == "MINUS"){
                if(parseInt(ERROR_QTY) >  0){
                    ERROR_QTY = parseInt(ERROR_QTY)-1;
                }
            }

            $('#outgoing_manage_return_form').find('#ERROR_QTY_VIEW').html(ERROR_QTY);
            $('#outgoing_manage_return_form').find('#ERROR_QTY').val(ERROR_QTY);
        }
        $('#outgoing_manage_mini_pop_save_btn').on('click', function () {
            // validation

            if($("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY_VIEW").val() == 0){
                alert("출고수량은 1개 이상이어야 합니다.");
                return;
            }else{
                $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.insertOutgoingOutType1,inspection.updateOutgoingOutType1After1,inspection.updateOutgoingOutType1After2");

                let parameters = {'url': '/json-manager', 'data': $("#outgoing_manage_pop_type_1_form").serialize() };
                fnPostAjax(function (data, callFunctionParam) {
                    alert("등록이 완료되었습니다.");
                    $('#outgoing_manage_pop_type_1').modal('hide');
                }, parameters, '');
            }

        });
        $('#outgoing_manage_return_complete_btn').on('click', function () {

            // $('#' + logGridId).pqGrid("option", "dataModel.postData", function(ui){
            //     return fnFormToJsonArrayData('#machine_manage_pop_form');
            // } );
            $('#outgoing_manage_return_complete_pop').modal('show');
        });
        $("#outgoing_manage_return_complete_pop").on('show.bs.modal', function(){
            //outgoingManageGridId02.pqGrid("refreshDataAndView");
            $outgoingReturnCompleteGrid = $('#' + outgoingReturnCompleteGridId).pqGrid(outgoingReturnCompleteObj);
            $outgoingReturnCompleteGrid.pqGrid( "option", "dataModel.data",  {queryId: 'inspection.selectOutgoingReturnCompleteList'} );
            $outgoingReturnCompleteGrid.pqGrid("refreshDataAndView");
        });
        $('#outgoing_manage_return_complete_pop_close').on('click', function () {
            $('#outgoing_manage_return_complete_pop').modal('hide');
        });
        $('#outgoing_manage_out_btn').on('click', function () {
            // validation
            /*let dynamicSql = "";
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
            */
            if(outgoingManageSelectedRowIndex.length == 0){
                alert("출고등록할 항목을 선택하여 주십시오.");
            }else{
                if(confirm("선택항목을 출고등록 하시겠습니까?")){
                let list = new Array() ;
                for (let i = 0; i < outgoingManageSelectedRowIndex.length; i++) {
                    let rowData = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: outgoingManageSelectedRowIndex[i]});
                    list.push(rowData);
                }

                let changes = {
                    'addList': list,
                    'updateList': list
                };
                let QUERY_ID_ARRAY = {
                    'insertQueryId': ['inspection.insertOutgoingOutType2'],
                    'updateQueryId': ['inspection.updateOutgoingOutType1After1', 'inspection.updateOutgoingOutType1After2']
                };
                changes.queryIdList = QUERY_ID_ARRAY;
                let parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};


                fnPostAjax(function (data, callFunctionParam) {
                    alert("등록이 완료되었습니다.");
                    fnResetFrom("outgoing_manage_pop_type_1_form");
                    $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                    $("#outgoing_manage_search_btn").trigger("click");
                }, parameters, '');
            }
            }



        });
        $('#outgoing_manage_label_print_btn').on('click', function () {
            let list = new Array() ;

            let barcodeList = new Array() ;
            if(outgoingManageSelectedRowIndex.length >0) {

                for (let i = 0; i < outgoingManageSelectedRowIndex.length; i++) {
                    let rowData = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: outgoingManageSelectedRowIndex[i]});
                    let postData = { 'queryId': 'inspection.selectOutgoingLabelType2', 'CONTROL_SEQ': rowData.CONTROL_SEQ, 'CONTROL_DETAIL_SEQ':rowData.CONTROL_DETAIL_SEQ, 'ORDER_SEQ':rowData.ORDER_SEQ};

                    let parameter = {'url': '/json-list', 'data': postData};
                    fnPostAjaxAsync(function (data, callFunctionParam) {
                        for(let i=0; i < data.list.length; i++){
                            barcodeList.push(data.list[i].BARCODE_NUM);
                        }
                    }, parameter, '');
                }

                if(barcodeList.length >0) {
                    fnBarcodePrint(function(data, callFunctionParam){
                        alert(data.message);
                    }, barcodeList, '');
                }else{
                    alert("출력할 바코드가 존재 하지 않습니다.");
                }

            }else{
                alert("그리드를 선택해 주십시오.");
            }
        });


        $('#outgoing_manage_mini_pop_close_btn, #popClose2').on('click', function () {
            $('#outgoing_manage_pop_type_1').modal('hide');
        });
        $('#outgoing_manage_pop_type_label_close_btn').on('click', function () {
            $('#outgoing_manage_pop_type_label').modal('hide');
        });
        $('#outgoing_manage_pop_type_control_close_btn').on('click', function () {
            $('#outgoing_manage_pop_type_control').modal('hide');
        });
        $('#outgoing_manage_return_form').find("#INSPECT_GRADE").on('change', function () {

            let value = $(this).val();
            $('#outgoing_manage_return_form').find("#INSPECT_RESULT").val("");
            $('#outgoing_manage_return_form').find("#ERROR_REASON").val("");
            $('#outgoing_manage_return_form').find("#INSPECT_DESC").val("");
            if(value == "GRD050"){

                $('#outgoing_manage_return_form').find("#INSPECT_RESULT").attr("disabled", true);
                $('#outgoing_manage_return_form').find("#ERROR_REASON").attr("disabled", true);
                $('#outgoing_manage_return_form').find("#INSPECT_DESC").attr("readonly", true);


            }else if(value == "GRD060"){
                $('#outgoing_manage_return_form').find("#INSPECT_RESULT").attr("disabled", false);
                $('#outgoing_manage_return_form').find("#ERROR_REASON").attr("disabled", false);
                $('#outgoing_manage_return_form').find("#INSPECT_DESC").attr("readonly", false);
            }

        });

        $("#OUTGOING_BARCODE_NUM").on('keyup', function(e) {

            let OUTGOING_BARCODE_PRINT_TYPE = $('input[name="OUTGOING_BARCODE_PRINT_TYPE"]:checked').val();
            if(OUTGOING_BARCODE_PRINT_TYPE == "1"){//출고
                if (e.keyCode == 13) {
                    //fnResetFrom("outgoing_manage_pop_form");
                    //L : LABEL, C:BARCODE
                    let barcodeNum = this.value;
                    let barcodeType = barcodeNum.charAt(0).toUpperCase();
                    let barcodesql = "";

                    if(barcodeType == "L"){//라벨
                        //barcodesql = "common.selectOutBarcodeInfo";//라벨바코드 뒤지 않고 바로 가져오게 수정
                        barcodesql = "inspection.selectOutgoingOutType4";
                    }else if(barcodeType == "C"){//도면
                        barcodesql = "common.selectControlBarcodeInfo";
                    }else{
                        alert("알수 없는 바코드 타입입니다.[" + barcodeNum +"]");
                        $("#OUTGOING_BARCODE_NUM").val("");
                        return;
                    }

                    //0. 바코드 정보 가져오기
                    let data = {'queryId': barcodesql,'BARCODE_NUM': barcodeNum};
                    let parameters = {'url': '/json-info','data': data};
                    fnPostAjax(function (data, callFunctionParam) {
                        let dataInfo = data.info;
                        if(dataInfo == null ) {
                            alert("해당 바코드가 존재하지 않습니다.");
                            $("#OUTGOING_BARCODE_NUM").val("");
                            return;
                        }else{

                            if(barcodeType == "L"){
                                fnJsonDataToForm("outgoing_manage_pop_type_label_form", dataInfo);
                                console.log(dataInfo);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_1").html(dataInfo.QTY_INFO);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_2").html(dataInfo.REMAIN_PACKING_CNT);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_3").html(dataInfo.MY_PACKING_NUM);

                                //. 저장하기
                                $("#outgoing_manage_pop_type_label_form").find("#queryId").val("inspection.insertOutgoingOutType4,inspection.updateOutgoingOutType4After1,inspection.updateOutgoingOutType4After2");
                                $("#outgoing_manage_pop_type_label_form").find("#BARCODE_NUM").val(barcodeNum);
                                let parameters = {'url': '/json-manager', 'data': $('#outgoing_manage_pop_type_label_form').serialize() };
                                //let data = {'queryId': 'inspection.insertOutgoingOutType4','BARCODE_NUM': barcodeNum};
                                //let parameters = {'url': '/json-create', 'data': data };
                                fnPostAjaxAsync(function (data, callFunctionParam) {

                                    //. 모달 띄우기
                                    $('#outgoing_manage_pop_type_label').modal('show');
                                    setTimeout(function() {
                                        $('#outgoing_manage_pop_type_label').modal('hide');
                                        $("#OUTGOING_BARCODE_NUM").val("");
                                    }, 2000);

                                }, parameters, '');


                            }else if(barcodeType == "C"){

                                fnJsonDataToForm("outgoing_manage_pop_type_control_form", dataInfo);
                                $("#outgoing_manage_pop_type_control_form").find("#queryId").val("inspection.selectOutgoingOutType3");
                                let parameters = {
                                    'url': '/json-info',
                                    'data': $('#outgoing_manage_pop_type_control_form').serialize()
                                };
                                fnPostAjaxAsync(function (data, callFunctionParam) {
                                    let dataInfo = data.info;
                                    if(dataInfo == null ) {
                                        alert("정보가 존재하지 않습니다. "+dataInfo);
                                        $("#OUTGOING_BARCODE_NUM").val("");
                                        return;
                                    }else{
                                        fnJsonDataToForm("outgoing_manage_pop_type_control_form", dataInfo);

                                        $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_1").html(data.QTY_INFO);
                                        $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_2").html("0");
                                        $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_3").html(data.PLAN_QTY);

                                        //. 저장하기
                                        $("#outgoing_manage_pop_type_control_form").find("#queryId").val("inspection.insertOutgoingOutType3,inspection.updateOutgoingOutType3After1,inspection.updateOutgoingOutType3After2");
                                        //let parameters = {'url': '/json-create', 'data': $('#outgoing_manage_pop_type_control_form').serialize() };
                                        let parameters = {'url': '/json-manager', 'data': $('#outgoing_manage_pop_type_control_form').serialize()};
                                        fnPostAjax(function (data, callFunctionParam) {

                                            //. 모달 띄우기
                                            $('#outgoing_manage_pop_type_control').modal('show');
                                            setTimeout(function() {
                                                $('#outgoing_manage_pop_type_control').modal('hide');
                                                $("#OUTGOING_BARCODE_NUM").val("");
                                            }, 2000);

                                        }, parameters, '');

                                    }
                                }, parameters, '');


                            }


                        }
                    }, parameters, '');


                    return;
                    // //1. insert
                    // alert("바코드 임의로 키넣어놨음. 삭제 필요");
                    // $("#outgoing_manage_pop_form").find("#CONTROL_SEQ").val("2094");
                    // $("#outgoing_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val("2160");
                    // $('#outgoing_manage_pop').modal('show');
                }
            }else if(OUTGOING_BARCODE_PRINT_TYPE == "2") {//라벨출력

                // let barcodeNum = this.value;
                // let postData = { 'queryId': 'inspection.selectOutgoingLabelType3', 'BARCODE_NUM': barcodeNum};
                // let parameter = {'url': '/json-list', 'data': postData};
                // fnPostAjaxAsync(function (data, callFunctionParam) {
                //     let barcodeList = new Array() ;
                //     for(let i=0; i < data.list.length; i++){
                //         barcodeList.push(data.list[i].BARCODE_NUM);
                //     }
                // }, parameter, '');
                if (e.keyCode == 13) {
                  let formData = new Array();
                  formData[0] = this.value;
                  fnBarcodePrint(function(data, callFunctionParam){
                      alert(data.message);
                     $("#OUTGOING_BARCODE_NUM").val("");
                  }, formData, '');
                }


            }else{
                alert("바코드 종류를 선택해주십시오.");
                // $("#OUTGOING_BARCODE_NUM").val("");
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

        fnCommCodeDatasourceSelectBoxCreate($('#outgoing_manage_return_pop').find('#INSPECT_USER_ID'), '', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#outgoing_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        $("#outBtn").on('click', function(e) {
            alert("outBtn");

        });
        $(document).on('click', '#outBtn', function(event){
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
                fnResetFrom("outgoing_manage_pop_type_1_form");
               $("#outgoing_manage_pop_type_1_form").find("#CONTROL_SEQ").val(control_seq);
               $("#outgoing_manage_pop_type_1_form").find("#CONTROL_DETAIL_SEQ").val(control_detail_seq);
               $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(order_seq);
               $('#outgoing_manage_pop_type_1').modal('show');
        });
        $(document).on('click', '#returnBtn', function(event){
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
            fnResetFrom("outgoing_manage_return_form");
           $("#outgoing_manage_return_form").find("#CONTROL_SEQ").val(control_seq);
           $("#outgoing_manage_return_form").find("#CONTROL_DETAIL_SEQ").val(control_detail_seq);
           $("#outgoing_manage_return_form").find("#ORDER_SEQ").val(order_seq);
           $('#outgoing_manage_return_pop').modal('show');
        });
        $(document).on('click', '#labelBtn', function(event){
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
            /*그리드에 바코드 하나
              let formData = new Array();
              formData[0] = ui.rowData['BARCODE_NUM'];*/

              fnResetFrom("outgoing_manage_pop_label_type_1_form");
              $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_SEQ").val(control_seq);
              $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_DETAIL_SEQ").val(control_detail_seq);
              $("#outgoing_manage_pop_label_type_1_form").find("#ORDER_SEQ").val(order_seq);
              $('#outgoing_manage_pop_label_type_1').modal('show');
        });

        $("#outgoingManageFilterKeyword").on("keyup", function(e){
            fnFilterHandler(outgoingManageGridId01, 'outgoingManageFilterKeyword', 'outgoingManageFilterCondition', 'outgoingManageFilterColumn');
        });

        $("#outgoingManageFrozen").on('change', function(e){
            fnFrozenHandler(outgoingManageGridId01, $(this).val());
        });
        
        function outgoingManageFilterRender(ui) {
            var val = ui.cellData == undefined ? "" : ui.cellData,
                filter = ui.column.filter,
                crules = (filter || {}).crules;

            if (filter && filter.on && crules && crules[0].value) {
                var condition = $("#outgoingManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#outgoingManageFilterKeyword").val(),
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
                if (indx >= 0) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
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




</script>
