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
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">접수/작업번호</label>
                            <input type="search" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="접수/작업번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ORDER_NUM">발주번호</label>
                            <input type="search" class="wd_200" name="SEL_ORDER_NUM" id="SEL_ORDER_NUM" title="발주번호">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap mr-10">
                            <label class="label_100" for="SEL_OUTGOING_DATE_TYPE">구분</label>
                            <select class="wd_100" name="SEL_OUTGOING_DATE_TYPE" id="SEL_OUTGOING_DATE_TYPE">
                               <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1066}">
                                    <option value="${vlocale.CODE_CD}" <c:if test="${vlocale.CODE_CD eq '4'}">selected</c:if> >${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_1" value="today" ><label for="SEL_OUTGOING_TERM_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_2" value="week"><label for="SEL_OUTGOING_TERM_2">±1주</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_3" value="month"><label for="SEL_OUTGOING_TERM_3">±1개월</label>
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
                        <span class="txt_span"><label for="SEL_PART_NUM_VIEW_YN" style="margin-right: 5px;">Option</label></span>
<%--                        <span class="chk_box"><input id="SEL_DELAY_TOP" name="SEL_DELAY_TOP" type="checkbox"><label for="SEL_DELAY_TOP">지연대상 항시 상단표시</label></span>--%>
                        <span class="chk_box"><input id="SEL_PART_NUM_VIEW_YN" name="SEL_PART_NUM_VIEW_YN" type="checkbox"><label for="SEL_PART_NUM_VIEW_YN">Part 단위 표시</label></span>
                        <span class="chk_box"><input id="SEL_OUT_FINISH_YN" name="SEL_OUT_FINISH_YN" type="checkbox"><label for="SEL_OUT_FINISH_YN">출고 완료 제외</label></span>
                        <span class="slt_wrap">
                            <label class="label_80" for="SEL_OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="SEL_OUTSIDE_COMP_CD" id="SEL_OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="OUTGOING_MANAGE_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="outgoing_manage_search_btn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="outgoingManageFilterKeyword" placeholder="Enter your keyword">
                <label for="outgoingManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="outgoingManageFrozen" name="outgoingManageFrozen">
                </select>
                <select id="outgoingManageFilterColumn" style="display: none;"></select>
                <select id="outgoingManageFilterCondition" style="display: none;">
                    <option value="contain">Contains</option>
                </select>
                <button type="button" id="outgoing_pop_btn" style="background-color: #dedede;padding-right: 15px;border: 1px solid #dedede;">
                    <span class="barCode" id="outgoingBarcodeSpan"><img src="<c:url value="/resource/asset/images/common/img_barcode_long.png"/>" alt="바코드" id="outgoingBarcodeImg"></span>
                    <span style="font-size: 15px;vertical-align: middle;margin-left: 5px;color: black;">출고등록</span>
                </button>
                <button type="button" id="stock_outgoing_pop_btn" style="background-color: #dedede;padding-right: 15px;border: 1px solid #dedede;">
                    <span class="barCode" id="stockOutgoingBarcodeSpan"><img src="<c:url value="/resource/asset/images/common/img_barcode_long.png"/>" alt="바코드" id="stockOutgoingBarcodeImg"></span>
                    <span style="font-size: 15px;vertical-align: middle;margin-left: 5px;color: black;">제품소진</span>
                </button>
<%--                <span class="barCode" id="outgoingBarcodeSpan"><img src="<c:url value="/resource/asset/images/common/img_barcode_long.png"/>" alt="바코드" id="outgoingBarcodeImg"></span>--%>
<%--                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="OUTGOING_BARCODE_NUM" id="OUTGOING_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>--%>
<%--                <span class="radio_box">--%>
<%--                    <input reqcd="R" type="radio" name="OUTGOING_BARCODE_PRINT_TYPE" id="OUTGOING_BARCODE_PRINT_TYPE_1" value="1" checked><label for="OUTGOING_BARCODE_PRINT_TYPE_1">출고</label>--%>
<%--                </span>--%>
<%--                <span class="radio_box">--%>
<%--                    <input reqcd="R" type="radio" name="OUTGOING_BARCODE_PRINT_TYPE" id="OUTGOING_BARCODE_PRINT_TYPE_2" value="2"><label for="OUTGOING_BARCODE_PRINT_TYPE_2">라벨출력</label>--%>
<%--                </span>--%>
                <div class="rightSpan">
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
            <button type="button" class="pop_close mt-10 mr-8" id="outgoing_manage_return_complete_pop_close2">닫기</button>
            <%--<button type="button" class="pop_close">닫기</button>--%>
<%--                <h4>기본정보</h4>--%>
            <div class="h_area mb-10">

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
        <button type="button" class="pop_close mt-10 mr-8" id="outgoing_manage_return_pop_close2">닫기</button>
        <%--<button type="button" class="pop_close">닫기</button>--%>
        <div class="qualityWrap">
            <div class="h_area mb-10">

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
                    <span class="list_t" style="width: 192px;">작업지시번호</span>
                    <span style="width: 210px;">
                        <select id="SEL_RETURN_POP_CONTROL_NUM" name="SEL_RETURN_POP_CONTROL_NUM" title="작업지시번호">
                        </select>
                    </span>
                </div>

                <table class="colStyle">
                    <%--<caption></caption>--%>
                    <colgroup>
                        <col style="width: 50px">
                        <col style="width: 50px">
                        <col style="width: 50px">
                        <col style="width: 170px">
                        <col style="width: 100px">
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
                            <span class="text" id="ERROR_QTY_VIEW" style="margin: 0 10px;">0</span>
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
                        <col style="width: 20%">
                        <col style="width: 60%">
                        <col style="width: 20%">
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
                        <col width="25%">
                        <col width="10%">
                        <col width="25%">
                        <col width="15%">
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
                        <th>발주납기</th>
                        <td id="ORDER_DUE_DT_VIEW_T" ></td>
                        <th>수량(원칭,대칭)</th>
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
        <input type="hidden" id="TYPE" name="TYPE" value="">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" id="ORDER_QTY" name="ORDER_QTY" value="">
        <input type="hidden" id="OUT_QTY" name="OUT_QTY" value="">
        <input type="hidden" id="NEW_OUT_QTY" name="NEW_OUT_QTY" value="">
        <input type="hidden" id="ORG_NEW_OUT_QTY" name="ORG_NEW_OUT_QTY" value="">

        <div class="miniPopup">
            <div class="contentWrap">
                <div class="d-flex align-items-center">
                    <div>
                        <h3>출고 실적 등록</h3>
                        <h2 id="subtitle" style="display: none">(폐기)</h2>
                    </div>
                    <div class="ml-auto mr-30">
                        <span class="chk_box"><input name="DISPOSAL_YN" id="DISPOSAL_YN" type="checkbox"><label for="DISPOSAL_YN" style="font-size: small"> 폐기처리</label></span>
                    </div>
                </div>
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
                        <th>접수번호</th>
                        <td colspan="4"><input type="text" name="REGIST_NUM" id="REGIST_NUM"  value="" title="작업지시번호" class="wd_250" readonly></td>
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
                        <th id="out">출고</th>
                        <td colspan="4" class="bg_green">
                            <button type="button" class="btn_plus" id="outgoing_manage_mini_pop_plus_btn">더하기</button>
                            <input type="number" class="text" id="NEW_OUT_QTY_VIEW" value="0" min="0" autocomplete="off" pattern="\d*">
                            <button type="button" class="btn_minus" id="outgoing_manage_mini_pop_minus_btn">빼기</button>
                            <button type="button" class="btn_allPlus" id="outgoing_manage_mini_pop_all_btn">전량</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="process">
                    <span class="pr_txt"><span style="display: none;">폐기</span><b>출고</b>를 진행하시겠습니까?</span>
                    <div class="btnWrap">
                        <button type="button" class="defaultBtn greenPopGra" id="outgoing_manage_mini_pop_save_btn" data-target="release">저장</button>
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
                        <col style="width: 90px">
                        <col style="width: 120px">
                        <col style="width: 90px">
                        <col style="width: 40px">
                        <col style="width: 40px">
                    </colgroup>
                    <tr>
                        <th>작업지시번호</th>
                        <td colspan="4"><input type="text" name="CONTROL_NUM" id="CONTROL_NUM"  value="" title="작업지시번호" class="wd_250" readonly></td>
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
                        <th>출고대상<br><b style="color: blue;">포장</b>수량</th>
                        <td id="outgoing_manage_pop_type_label_form_view_1"></td>
                        <th>잔여<br><b style="color: blue;">포장</b>수량</th>
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
                    <span class="pr_txt"><b>출고</b>처리 되었습니다</span>
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
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" id="IN_OUT_QTY" name="IN_OUT_QTY" value="0">

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
                        <col style="width: 90px">
                        <col style="width: 120px">
                        <col style="width: 90px">
                        <col style="width: 40px">
                        <col style="width: 40px">
                    </colgroup>
                    <tr>
                        <th>작업지시번호</th>
                        <td colspan="4"><input type="text" name="CONTROL_NUM" id="CONTROL_NUM"  value="" title="작업지시번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>도면번호</th>
                        <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>출고대상<br>수량</th>
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
                        <th>접수번호</th>
                        <td colspan="4"><input type="text" name="REGIST_NUM" id="REGIST_NUM"  value="" title="접수번호" class="wd_230" readonly></td>
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

<!-- 출하스캔 layer popup : S -->
<div class="popup_container in" id="outgoing_scan_barcode_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content;width: 1050px;">
        <h3>
            <div style="float: left;width: 985px;height: 40px;padding: 10px 0 7px;">
                <span style="margin-left: 15%;width: 40%;vertical-align: middle;font-size: 28px;line-height: 45px;">바코드를 Scan 하세요</span>
                <div style="width: 55%;float: right;">
                    <span class="barCode">
                        <img id="outgoing_scan_barCodeImg" src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" style="width: 110px;">
                    </span>
                    <span class="barCodeTxt" style="margin-left: 13px;">
                        <input type="text" class="wd_270_barcode hg_45" id="outgoingScanBarcode" value="" placeholder="도면의 바코드를 스캔해 주세요" style="border: 1px solid #e6e6e6;">
                    </span>
                </div>
            </div>
        </h3>
        <form class="form-inline" role="form" id="outgoing_scan_barcode_popup_form" name="outgoing_scan_barcode_popup_form" method="POST">
            <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehousePop">
            <input type="hidden" id="TYPE" name="TYPE" value="">
            <input type="hidden" id="MY_MAT_OUT_SEQ" name="MY_MAT_OUT_SEQ" value="">
            <input type="hidden" id="BARCODE_NUM" name="BARCODE_NUM" value="">
            <div style="margin: 20px 0 20px 0;">
                <div id="success_div">
                    <div style="font-size: 35px;text-align: center;color: blue;height: 50px;">
                        <span class="span_controlNum"></span>
                        <span class="span_qty"></span>
                    </div>
                    <div style="font-size: 35px;text-align: center;color: #347fd3;height: 50px;">
                        <span class="span_status"></span>
                    </div>
                </div>
                <div id="fail_div" style="display: none;">
                    <div style="font-size: 35px;text-align: center;color: #db1515;height: 50px;">
                        <span class="span_controlNum"></span>
                        <span class="span_qty"></span>
                    </div>
                    <div style="font-size: 35px;text-align: center;color: #db1515;height: 50px;">
                        <span class="span_status"></span>
                    </div>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="table-box-wrap">
                <div class="table-box" id="outgoing_table_div">
                    <table class="outgoingTable" id="outgoingScanPopDynamicTable">
                        <colgroup>
                            <col width="6%">
                            <col width="8%">
                            <col width="6%">
                            <col width="20%">
                            <col width="20%">
                            <col width="14%">
                            <col width="20%">
                            <col width="6%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th style="width:6%;">No.</th>
                                <th style="width:8%;">처리시간</th>
                                <th style="width:6%;">결과</th>
                                <th style="width:20%;">메시지</th>
                                <th style="width:20%;">작업지시번호</th>
                                <th style="width:14%;">발주번호</th>
                                <th style="width:20%;">도면번호</th>
                                <th style="width:6%;">수량</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>
<!-- 출하스캔 layer popup : E -->
<script>
    $(function () {
        'use strict';

        let outgoingManageSelectedRowIndex = [];

        let outgoingManageGridId01 = $("#outgoing_manage_grid");
        let outgoingManageColModel01;
        // let outgoingManagePostData01;

        /**  리스트 그리드 선언 시작 **/
        $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
        // outgoingManagePostData01 = fnFormToJsonArrayData('#outgoing_manage_form');
        outgoingManageColModel01 = [
            // {title: 'BARCODE_NUM', dataIndx: 'BARCODE_NUM', hidden:true},
            {title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'INSPECT_SEQ', dataIndx: 'INSPECT_SEQ', hidden: true},
            {
                title: '주문<br>상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM',
                render: function (ui) {
                    if (ui.cellData === '보류') {
                        return {style: 'color: #ff0000'};
                    }
                }
            },
            {
                title: '확정<br>일자', dataIndx: 'CONTROL_CONFIRM_DT', width: 60,
                render: function (ui) {
                    let cellData = ui.cellData;

                    if(cellData) {
                        return cellData.substring(5);
                    }
                }
            },
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '', align: 'center', dataIndx: '', minWidth: 30,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '파<br>트', dataIndx: 'PART_NUM', minWidth: 30},
            {
                title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30,
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
            {title: '도면번호', dataIndx: 'DRAWING_NUM', width: 170,
                // postRender: function (ui) {
                //     let grid = this,
                //         $cell = grid.getCell(ui);
                //     $cell.bind("click", function () {
                //         let rowData = ui.rowData;
                //         callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                //     });
                // }
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', minWidth: 40},
            // {title: 'MATERIAL_DETAIL', dataIndx: 'MATERIAL_DETAIL', hidden:true},
            {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM', width: 80},
            {title: '표면처리', dataIndx: 'SURFACE_TREAT_NM', width: 80},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 100},
            {title: '접수번호', dataIndx: 'REGIST_NUM', width: 130},
            {title: '발주번호', dataIndx: 'ORDER_NUM', width: 90},
            {title: '발주<br>납기', dataIndx: 'ORDER_DUE_DT', width: 60},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', minWidth: 40},
                    {title: '대칭', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY', minWidth: 40}
                ]
            },
            {title: '발주<br>수량', dataIndx: 'ORDER_QTY', minWidth: 40},
            {title: '출고<br>수량', dataIndx: 'OUT_QTY', minWidth: 40, format: '#,###'},
            {title: '출고<br>일시', dataIndx: 'OUT_FINISH_DT', width: 60},
            {
                title: '포장<br>묶음', dataType: 'integer', dataIndx: 'PACKING_CNT', minWidth: 40,
                editable: function (ui) {
                    return !(ui.rowData['OUT_FINISH_DT'] !== undefined || ui.rowData['ORDER_PACKING_NUM_CNT'] > 0);
                },
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '수동 입력 버튼', minWidth: 150, width: 150, dataIndx: 'BTN',
                render: function (ui) {
                    // let grid = this;
                    // let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    let outBtn = '';
                    let returnBtn = '';
                    let labelBtn = '';
                    // console.log("ui.rowData['PART_NUM']",ui.rowData['PART_NUM']);
                    if (ui.rowData['PART_NUM'] === undefined && ui.rowData['ORDER_SEQ'] !== undefined) {//part 있음 모든 버튼 안보이게
                        if (ui.rowData['SCRAP_YN'] === 'Y') {
                            outBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">출고</button>' + '&nbsp;';
                            returnBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">반품</button>' + '&nbsp;';
                            labelBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">라벨</button>';
                        } else {
                            if (ui.rowData['OUT_FINISH_DT'] !== undefined || ui.rowData['ORDER_PACKING_NUM_CNT'] > 0) {// 출고완료
                                outBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">출고</button>' + '&nbsp;';
                                returnBtn = '<button type="button" class="miniBtn orange" id="returnBtn"  data-control_seq=\"' + rowData.CONTROL_SEQ + '\" data-control_detail_seq=\"' + rowData.CONTROL_DETAIL_SEQ + '\" data-order_seq=\"' + rowData.ORDER_SEQ + '\">반품</button>' + '&nbsp;';
                            } else {
                                if (ui.rowData['CONTROL_STATUS_NM'] === '보류') {
                                    outBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">출고</button>' + '&nbsp;';
                                } else {
                                    outBtn = '<button type="button" class="miniBtn black" id="outBtn"  data-control_seq=\"' + rowData.CONTROL_SEQ + '\" data-control_detail_seq=\"' + rowData.CONTROL_DETAIL_SEQ + '\" data-order_seq=\"' + rowData.ORDER_SEQ + '\">출고</button>' + '&nbsp;';
                                }
                                returnBtn = '<button type="button" class="miniBtn gray" style="color: #777777 !important;">반품</button>' + '&nbsp;';
                            }

                            labelBtn = '<button type="button" class="miniBtn blue" id="labelBtn"  data-control_seq="' + rowData.CONTROL_SEQ + '" data-control_detail_seq="' + rowData.CONTROL_DETAIL_SEQ + '" data-order_seq="' + rowData.ORDER_SEQ + '">라벨</button>';
                        }
                    }

                    return outBtn + returnBtn + labelBtn;
                }
                /* , postRender: function (ui) {
                                  let grid = this;
                                  let $cell = grid.getCell(ui);
                                  //let rowData = ui.rowData;
                      alert(1);
                                  if (ui.rowData['ORDER_SEQ'] !== undefined && ui.rowData['ORDER_SEQ'] >0) {
                                          $cell.find('#outBtn').bind('click', function(e) {
                                              alert(2);
                                            e.preventDefault();
                                              alert(3);
                                              fnResetForm("outgoing_manage_pop_type_1_form");
                                             $("#outgoing_manage_pop_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                                             $("#outgoing_manage_pop_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                                             $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                                             $('#outgoing_manage_pop_type_1').modal('show');
                                          });
                                          $cell.find('#returnBtn').bind('click', function(e) {
                                            e.preventDefault();
                                              fnResetForm("outgoing_manage_return_form");
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

                                              fnResetForm("outgoing_manage_pop_label_type_1_form");
                                              $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_SEQ").val(ui.rowData['CONTROL_SEQ']);
                                              $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_DETAIL_SEQ").val(ui.rowData['CONTROL_DETAIL_SEQ']);
                                              $("#outgoing_manage_pop_label_type_1_form").find("#ORDER_SEQ").val(ui.rowData['ORDER_SEQ']);
                                              $('#outgoing_manage_pop_label_type_1').modal('show');
                                          });

                                  }
                            }*/
            },
            {title: '가공<br>납기', dataIndx: 'INNER_DUE_DT', width: 60},
            {title: '가공<br>완료', dataIndx: 'WORK_FINISH_DT', width: 60},
            {
                title: '마감<br>일자', dataIndx: 'CONTROL_CLOSE_DT', width: 60,
                 render: function (ui) {
                    let cellData = ui.cellData;

                    if(cellData) {
                        return cellData.substring(5);
                    }
                }
            },
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM', width: 50},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM', width: 80},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM', width: 100},
            {title: '현재위치', dataIndx: 'POP_NM', width: 100},
            {
                title: '반품정보', align: 'center', styleHead: {'color': 'red'}, colModel: [
                    {title: '수량', datatype: 'integer', dataIndx: 'RETURN_QTY', minWidth: 40, format: '#,###', styleHead: {'color': 'red'}},
                    {title: '발생일', dataIndx: 'RETURN_LAST_DT', width: 60, styleHead: {'color': 'red'}},
                    {title: '조치일', dataIndx: 'RETURN_FINISH_DT', width: 60, styleHead: {'color': 'red'}}
                ]
            },
            {title: '소재입고<br>일시', dataIndx: 'MATERIAL_RECEIPT_DT', width: 60},
            {title: '외주입고<br>일시', dataIndx: 'OUTSIDE_IN_DT', width: 60},
            // {title: '반품일시', dataIndx: 'OUT_RETURN_DT', width: 60},

            // {title: '', align: 'center', dataIndx: 'MANUAL_OUT', width: 70, minWidth: 70,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn black\">출고</button>";
            //         return '';
            //     }
            // },
            // {title: '', align: 'center', dataIndx: 'MANUAL_RETURN', width: 70, minWidth: 70,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn blue\">반품</button>";
            //         return '';
            //     }
            // },
            // {title: '', align: 'center', dataIndx: 'MANUAL_LABEL', width: 70, minWidth: 70,
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class="miniBtn orange">라벨</button>";
            //         return '';
            //     }
            // },
            {
                title: '최근 품질 실적', align: 'center', colModel: [
                    {title: 'Seq.', dataIndx: 'Q_SEQ', minWidth: 40},
                    {title: '등급', dataIndx: 'Q_INSPECT_GRADE_NM', minWidth: 40},
                    {title: '부적합 수량', dataIndx: 'Q_ERROR_QTY', minWidth: 40},
                    // {title: '검사결과', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 80},
                    {title: '검사코드', dataIndx: 'Q_INSPECT_RESULT_NM', width: 100},
                    // {title: '비고', dataIndx: 'Q_INSPECT_DESC', width: 100},
                    {title: '조치', dataIndx: 'Q_ERROR_ACTION_NM', width: 100},
                    // {title: '조치방안', dataIndx: 'Q_ERROR_NOTE', width: 100}
                    {title: '작성일시', dataIndx: 'Q_DT', width: 90}
                ]
            }
        ];

        $("#outgoing_manage_form").find('[name=SEL_OUTGOING_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            switch (value) {
                case "today":
                    break;
                case "week":
                    newDate.setDate(newDate.getDate() - 7);
                    today.setDate(today.getDate() + 7);
                    break;
                case "month":
                    newDate.setMonth(newDate.getMonth() - 1);
                    today.setMonth(today.getMonth() + 1);
                    break;
            }

            $("#outgoing_manage_form").find('#SEL_ST_DT').val(newDate.yyyymmdd());
            $("#outgoing_manage_form").find('#SEL_END_DT').val(today.yyyymmdd());
        });

        $('#SEL_OUTGOING_TERM_2').click();


        const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');
            const orderList = ['REGIST_NUM', 'ORDER_NUM', 'ORDER_DUE_DT', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY',
                'ORDER_QTY','OUT_QTY', 'OUT_FINISH_DT', 'PACKING_CNT', 'SIZE_TXT', 'SURFACE_TREAT_NM',
                'MATERIAL_DETAIL_NM', 'WORK_TYPE_NM', 'ORDER_COMP_NM', 'BTN', 'IMG_GFILE_SEQ', 'DRAWING_NUM'
            ];
            const includeList = orderList;

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['REGIST_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['REGIST_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (orderList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };

        outgoingManageGridId01.pqGrid({
            height: 730,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ORDER_SEQ',
                url: "/paramQueryGridSelect",
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            editable: false,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: outgoingManageFilterRender},
            filterModel: {mode: 'OR'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true, styleHead: {'vertical-align': 'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingManageColModel01,
            load: function () {
                let frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === undefined;
                    if (hiddenYn && column.title) {
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $("#outgoingManageFrozen").empty();
                $("#outgoingManageFrozen").html(frozenOts);
                autoMerge(this, true);
            },
            complete: function () {
                let data = outgoingManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_grid_records').html(totalRecords);
            },
            cellKeyDown: function (event, ui) {
                let rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const totalRecords = this.option('dataModel.data').length;
                if (event.keyCode == $.ui.keyCode.DOWN && rowIndx < totalRecords) {
                    rowIndx++;
                } else if (event.keyCode == $.ui.keyCode.UP && rowIndx > 0) {
                    rowIndx--;
                }
                sr.removeAll();
                sr.add({rowIndx: rowIndx});
                const selRowData = this.getRowData({rowIndx: rowIndx});
                if(typeof selRowData != 'undefined' && typeof selRowData.IMG_GFILE_SEQ != 'undefined') {
                    callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                }
            },
            selectChange: function (event, ui) {
                outgoingManageSelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) outgoingManageSelectedRowIndex.push(i);
                    if (firstRow === lastRow) {
                        let selRowData = outgoingManageGridId01.pqGrid("getRowData", {rowIndx: firstRow});
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);
                    }else {
                        let selFirstRowData = outgoingManageGridId01.pqGrid("getRowData", {rowIndx: firstRow});
                        let selLastRowData = outgoingManageGridId01.pqGrid("getRowData", {rowIndx: lastRow});

                        if(selFirstRowData.REGIST_NUM == selLastRowData.REGIST_NUM) {
                            callQuickRowChangeDrawingImageViewer(selFirstRowData.IMG_GFILE_SEQ,selFirstRowData);
                        }
                    }
                }
            },
            change: function (event, ui) {
                if (ui.source === 'edit') {

                    let row = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;

                    let data = {
                        'queryId': 'orderMapper.updatePackingCnt,inspection.updateControlPartOrderPackingCnt1,inspection.updateControlPartOrderPackingCnt2,inspection.insertControlPartOrderPackingCnt3',
                        'CONTROL_SEQ': row.CONTROL_SEQ,
                        'CONTROL_DETAIL_SEQ': row.CONTROL_DETAIL_SEQ,
                        'ORDER_SEQ': row.ORDER_SEQ,
                        'PACKING_CNT': newRow.PACKING_CNT
                    };
                    let parameters = {'url': '/json-manager', 'data': data};
                    fnPostAjax(function () {
                        // alert("등록이 완료되었습니다.");
                        $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                        $("#outgoing_manage_search_btn").trigger("click");
                    }, parameters, '');
                }
            }
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
            {title: 'ORDER_SEQ', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'INSPECT_SEQ', dataIndx: 'INSPECT_SEQ', hidden: true},
            {
                title: '', align: 'center', dataIndx: 'MANUAL_ACTION', width: 80, editable: false,
                render: function (ui) {
                    // let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['ORDER_SEQ'] > 0) return "<button type=\"button\" class=\"miniBtn black\">조치완료</button>";
                    return '';

                }
            },
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', minWidth: 95, width: 95, editable: false},
            {title: '접수번호', dataIndx: 'REGIST_NUM', minWidth: 130, width: 130, editable: false},
            {title: '발주번호', dataIndx: 'ORDER_NUM', minWidth: 95, width: 95, editable: false},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 120, width: 120, editable: false},
            {
                title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', minWidth: 140, width: 140, editable: false},
            {title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, editable: false,
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
            {title: '도면번호', dataIndx: 'DRAWING_NUM', minWidth: 140, width: 140, editable: false},
            {title: '작업형태', dataIndx: 'WORK_TYPE_NM', width: 60, editable: false},
            {title: '소재', dataIndx: 'MATERIAL_DETAIL_NM', width: 60, editable: false},
            {title: '후처리', dataIndx: 'SURFACE_TREAT_NM', width: 60, editable: false},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 100, editable: false},
            {title: '주문<br/>수량', dataIndx: 'ORDER_QTY', minWidth: 40, editable: false},
            {title: '출고', dataIndx: 'OUT_QTY', minWidth: 40, editable: false},
            {title: '출고일시', dataIndx: 'OUT_FINISH_DT', width: 60, editable: false},
            {
                title: '반품정보', align: 'center', colModel: [
                    {title: '수량', dataIndx: 'ERROR_QTY', width: 60, editable: false},
                    {title: '발생일', dataIndx: 'RETURN_DT', width: 60, editable: false},
                    {title: '등급', dataIndx: 'INSPECT_GRADE_NM', width: 80, editable: false},
                    {title: '불량코드', dataIndx: 'INSPECT_RESULT_NM', width: 100, editable: false},
                    {title: '조치방안', dataIndx: 'ERROR_NOTE', width: 100, editable: false}
                ]
            },
            {title: '현재위치', dataIndx: 'POP_NM', width: 80, editable: false}

        ];
        //outgoingManageGridId02.pqGrid({
        outgoingReturnCompleteObj = {
            width: "100%", height: 400,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSPECT_SEQ',
                url: "/paramQueryGridSelect",
                postData: {queryId: 'inspection.selectOutgoingReturnCompleteList'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            //scrollModel: {autoFit: true},
            //numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingReturnCompleteColModel,
            complete: function () {
                let data = $outgoingReturnCompleteGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_return_complete_pop_grid_records').html(totalRecords);
            },
            cellClick: function (event, ui) {
                // let rowIndx = ui.rowIndx, $grid = this;
                if (ui.rowData['INSPECT_SEQ'] !== undefined && ui.rowData['INSPECT_SEQ'] > 0) {
                    if (ui.dataIndx === 'MANUAL_ACTION') {
                        let data = {
                            'queryId': 'inspection.updateOutgoingReturnComplete,inspection.updateOutFinishStatusUseOrderSeq,inspection.updateOrderOutFinishStatus',
                            // 'CONTROL_SEQ': ui.rowData['CONTROL_SEQ'],
                            // 'CONTROL_DETAIL_SEQ': ui.rowData['CONTROL_DETAIL_SEQ'],
                            'ORDER_SEQ': ui.rowData['ORDER_SEQ'],
                            'INSPECT_SEQ': ui.rowData['INSPECT_SEQ']
                        };
                        let parameters = {'url': '/json-manager', 'data': data};
                        fnPostAjax(function () {
                            fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
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

            if($("#outgoing_manage_return_form").find("#ERROR_QTY").val() == 0) {
                fnAlert(null, "반품 수량을 입력해주세요.");
                return false;
            }

            // $("#outgoing_manage_return_form").find("#queryId").val("inspection.insertOutgoingReturn,inspection.updateOutFinishStatus");
            $("#outgoing_manage_return_form").find("#queryId").val("inspection.insertOutgoingReturn,inspection.updateOutFinishStatus,inspection.updateOrderOutFinishStatus");

            let parameters = {'url': '/json-manager', 'data': $("#outgoing_manage_return_form").serialize()};
            fnPostAjax(function () {
                fnAlert(null, "등록이 완료되었습니다.");
                $('#outgoing_manage_return_pop').modal('hide');
            }, parameters, '');

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

        $("#outgoing_manage_return_pop").on({
            'show.bs.modal': function () {
                $("#outgoing_manage_return_form").find("#queryId").val("inspection.selectOutgoingReturnInfoOrderList");
                let parameters = {
                    'url': '/json-list',
                    'data': $('#outgoing_manage_return_form').serialize()
                };
                fnPostAjax(function (data) {
                    let dataList = data.list;
                    let dataInfo = dataList[0];
                    if(dataList.length == 0) {
                        fnAlert(null, "<spring:message code='com.msg.no.data'/>");

                        $('#outgoing_manage_return_pop').modal('hide');
                    }else {
                        $("#SEL_RETURN_POP_CONTROL_NUM").empty();
                        $.each(dataList, function (idx,Item) {
                            let opt = '<option value="'+Item.CONTROL_SEQ+'_'+Item.CONTROL_DETAIL_SEQ +'">'+ Item.CONTROL_NUM + '</option>';
                            $("#SEL_RETURN_POP_CONTROL_NUM").append(opt);
                        });
                        fnJsonDataToForm("outgoing_manage_return_form", dataInfo);
                        $("#outgoing_manage_return_form").find("#ORG_REAL_OUT_QTY").val(dataInfo.REAL_OUT_QTY);
                        $("#outgoing_manage_return_form").find("#ERROR_QTY").val("0");
                        $("#outgoing_manage_return_form").find("#ERROR_QTY_VIEW").html("0");
                        $("#outgoing_manage_return_form").find("#ORDER_QTY_RETURN_VIEW").html(dataInfo.ORDER_QTY);
                        $("#outgoing_manage_return_form").find("#REAL_OUT_QTY_RETURN_VIEW").html(dataInfo.REAL_OUT_QTY);
                        $("#outgoing_manage_return_form").find("#OUT_FINISH_DT_RETURN_VIEW").html(dataInfo.OUT_FINISH_DT);

                        let emergencySpan = '';

                        $("#outgoing_manage_return_form").find("#CONTROL_NUM" + "_VIEW_T").html(dataInfo.CONTROL_NUM);
                        $("#outgoing_manage_return_form").find("#DRAWING_NUM" + "_VIEW_T").html(dataInfo.DRAWING_NUM);
                        $("#outgoing_manage_return_form").find("#MAIN_INSPECTION_NM" + "_VIEW_T").html(dataInfo.MAIN_INSPECTION_NM);
                        if(dataInfo.EMERGENCY_YN === 'Y') {
                            emergencySpan = '<span style="display: inline-block; margin: 0 5px; padding: 0px 7px; border: solid red; border-radius: 5px; color: #FF0000; text-align: center; font-size: 1rem;">긴급</span>';
                        }
                        $("#outgoing_manage_return_form").find("#ORDER_DUE_DT" + "_VIEW_T").html(dataInfo.ORDER_DUE_DT + emergencySpan);
                        $("#outgoing_manage_return_form").find("#ITEM_NM" + "_VIEW_T").html(dataInfo.ITEM_NM);
                        $("#outgoing_manage_return_form").find("#MATERIAL_DETAIL_NM" + "_VIEW_T").html(dataInfo.MATERIAL_DETAIL_NM);
                        $("#outgoing_manage_return_form").find("#ORDER_QTY_INFO" + "_VIEW_T").html(dataInfo.ORDER_QTY_INFO);
                        $("#outgoing_manage_return_form").find("#SIZE_TXT_WORK_TYPE_NM" + "_VIEW_T").html(dataInfo.SIZE_TXT_WORK_TYPE_NM);
                        $("#outgoing_manage_return_form").find("#SURFACE_TREAT_NM" + "_VIEW_T").html(dataInfo.SURFACE_TREAT_NM);
                        $("#outgoing_manage_return_form").find("#ORDER_COMP_NM" + "_VIEW_T").html(dataInfo.ORDER_COMP_NM);
                        $("#outgoing_manage_return_form").find("#OUTSIDE_COMP_NM" + "_VIEW_T").html(dataInfo.OUTSIDE_COMP_NM);
                    }
                }, parameters, '');

            },'hide.bs.modal': function () {
                fnResetForm("outgoing_manage_return_form");
                $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                $("#outgoing_manage_search_btn").trigger("click");
            }
        });

        $("#outgoing_manage_pop_type_1").on('hide.bs.modal', function () {
            if ($("#DISPOSAL_YN").is(":checked")) {
                $("#DISPOSAL_YN").trigger("click");
            }
            fnResetForm("outgoing_manage_pop_type_1_form");
            $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
            $("#outgoing_manage_search_btn").trigger("click");
        });

        $("#outgoing_manage_pop_type_1").on('show.bs.modal', function () {
            $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.selectOutgoingOutType1");
            let parameters = {
                'url': '/json-info',
                'data': $('#outgoing_manage_pop_type_1_form').serialize()
            };
            fnPostAjax(function (data) {
                let dataInfo = data.info;
                if (dataInfo == null) {
                    fnAlert(null, "해당 데이터가 존재하지 않습니다.");
                    $('#outgoing_manage_pop_type_1').modal('hide');
                } else {
                    // fnJsonDataToForm("outgoing_manage_pop_type_1_form", dataInfo);
                    $("#outgoing_manage_pop_type_1_form").find("#REGIST_NUM").val(dataInfo.REGIST_NUM);
                    $("#outgoing_manage_pop_type_1_form").find("#DRAWING_NUM").val(dataInfo.DRAWING_NUM);
                    $("#outgoing_manage_pop_type_1_form").find("#ORDER_NUM").val(dataInfo.ORDER_NUM);
                    $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(dataInfo.ORDER_SEQ);
                    $("#outgoing_manage_pop_type_1_form").find("#ORDER_QTY").val(dataInfo.ORDER_QTY);
                    $("#outgoing_manage_pop_type_1_form").find("#OUT_QTY").val(dataInfo.OUT_QTY);
                    $("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY").val(dataInfo.NEW_OUT_QTY);
                    //ORDER_QTY 총수량, OUT_QTY 나간 수량, NEW_OUT_QTY 나갈 수량량
                    let view = dataInfo.NEW_OUT_QTY + "/" + dataInfo.ORDER_QTY;
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_1").html(view);
                    $("#outgoing_manage_pop_type_1_form").find("#outgoing_manage_pop_type_1_form_view_2").html("0");
                    $("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY_VIEW").val(dataInfo.NEW_OUT_QTY);
                    $("#outgoing_manage_pop_type_1_form").find("#ORG_NEW_OUT_QTY").val(dataInfo.NEW_OUT_QTY);

                }
            }, parameters, '');
        });
        $("#outgoing_manage_pop_label_type_1_form").find("#label_print_close").on('click', function () {
            $('#outgoing_manage_pop_label_type_1').modal('hide');
        });

        $('#outgoing_manage_pop_label_type_1').on({
            'show.bs.modal': function () {
                // $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1");
                $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1OrderVer");
                let parameters = {
                    'url': '/json-info',
                    'data': $('#outgoing_manage_pop_label_type_1_form').serialize()
                };
                fnPostAjax(function (data) {
                    let dataInfo = data.info;
                    if (dataInfo == null) {
                        fnAlert(null, "해당 데이터가 존재하지 않습니다.");
                        $('#outgoing_manage_pop_label_type_1').modal('hide');
                    } else {
                        fnJsonDataToForm("outgoing_manage_pop_label_type_1_form", dataInfo);
                        $("#outgoing_manage_pop_label_type_1_form").find("#outgoing_manage_pop_label_type_1_form_view_1").html(dataInfo.ORDER_QTY);
                        $("#outgoing_manage_pop_label_type_1_form").find("#outgoing_manage_pop_label_type_1_form_view_2").html(dataInfo.PACKING_CNT);

                        // $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1Combo");
                        $("#outgoing_manage_pop_label_type_1_form").find("#queryId").val("inspection.selectOutgoingLabelType1ComboOrderVer");
                        fnCommCodeDatasourceSelectBoxCreate($('#outgoing_manage_pop_label_type_1_form').find('#SEL_BARCODE_NUM'), '', {
                            'url': '/json-list',
                            'data': $('#outgoing_manage_pop_label_type_1_form').serialize()
                        });

                    }
                }, parameters, '');

            },'hide.bs.modal': function () {
                fnResetForm("outgoing_manage_pop_label_type_1_form");
            }
        });

        $("#outgoing_manage_pop_label_type_1_form_print_1").on('click', function () {

            let formData = [];
            formData[0] = $("#outgoing_manage_pop_label_type_1_form").find("#SEL_BARCODE_NUM").val();
            fnBarcodePrint(function (data) {
                fnAlert(null, data.message);
            }, formData, '');
        });
        $("#outgoing_manage_pop_label_type_1_form_print_all").on('click', function () {
            let formData = [];
            $("#outgoing_manage_pop_label_type_1_form").find("#SEL_BARCODE_NUM>option").each(function () {
                formData.push($(this).val());
            });
            fnBarcodePrint(function (data) {
                fnAlert(null, data.message);
            }, formData, '');
        });

        $('#outgoing_manage_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchOutgoingManage();
            }
        });

        $("#outgoing_manage_search_btn").on('click', function () {
            searchOutgoingManage();
        });

        function searchOutgoingManage() {
            outgoingManageGridId01.pqGrid("option", "dataModel.postData", function () {
                return fnFormToJsonArrayData('#outgoing_manage_form');
            });
            outgoingManageGridId01.pqGrid("refreshDataAndView");
        }

        $(".datepicker-input").each(function () {
            $(this).datepicker({dateFormat: 'yy/mm/dd'});
        });

        $('#outgoing_manage_mini_pop_plus_btn').on('click', function () {
            outgoingManageMiniPopCalcQty("PLUS");
        });
        $('#outgoing_manage_mini_pop_minus_btn').on('click', function () {
            outgoingManageMiniPopCalcQty("MINUS");
        });
        $('#outgoing_manage_mini_pop_all_btn').on('click', function () {
            let ORIGINAL_NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#ORG_NEW_OUT_QTY').val();

            $('#outgoing_manage_pop_type_1_form').find('#outgoing_manage_pop_type_1_form_view_2').html("0");
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY_VIEW').val(ORIGINAL_NEW_OUT_QTY);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val(ORIGINAL_NEW_OUT_QTY);

        });
        let outgoingManageMiniPopCalcQty = function (type) {
            //ORDER_QTY 총수량, OUT_QTY 나간 수량, NEW_OUT_QTY 나갈 수량량
            let ORIGINAL_NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#ORG_NEW_OUT_QTY').val();
            let NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val();

            if (type == "PLUS") {
                if (parseInt(ORIGINAL_NEW_OUT_QTY) > parseInt(NEW_OUT_QTY)) {
                    NEW_OUT_QTY = parseInt(NEW_OUT_QTY) + 1;
                }
            } else if (type === "MINUS") {
                if (parseInt(NEW_OUT_QTY) > 0) {
                    NEW_OUT_QTY = parseInt(NEW_OUT_QTY) - 1;
                }
            }
            let restQty = ORIGINAL_NEW_OUT_QTY - NEW_OUT_QTY;
            $('#outgoing_manage_pop_type_1_form').find('#outgoing_manage_pop_type_1_form_view_2').html(restQty);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY_VIEW').val(NEW_OUT_QTY);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val(NEW_OUT_QTY);
        };
        $('#outgoing_manage_return_pop_plus_btn').on('click', function () {
            outgoingManageReturnPopCalcQty("PLUS");
        });
        $('#outgoing_manage_return_pop_minus_btn').on('click', function () {
            outgoingManageReturnPopCalcQty("MINUS");
        });
        $('#outgoing_manage_return_pop_all_btn').on('click', function () {
            let ORG_REAL_OUT_QTY = $('#outgoing_manage_return_form').find('#ORG_REAL_OUT_QTY').val();

            $('#outgoing_manage_return_form').find('#ERROR_QTY_VIEW').html(ORG_REAL_OUT_QTY);
            $('#outgoing_manage_return_form').find('#ERROR_QTY').val(ORG_REAL_OUT_QTY);

        });
        let outgoingManageReturnPopCalcQty = function (type) {
            let ORG_REAL_OUT_QTY = $('#outgoing_manage_return_form').find('#ORG_REAL_OUT_QTY').val();
            let ERROR_QTY = $('#outgoing_manage_return_form').find('#ERROR_QTY').val();

            // console.log("ERROR_QTY", ERROR_QTY);
            if (type === "PLUS") {
                if (parseInt(ORG_REAL_OUT_QTY) > parseInt(ERROR_QTY)) {
                    ERROR_QTY = parseInt(ERROR_QTY) + 1;
                }
            } else if (type === "MINUS") {
                if (parseInt(ERROR_QTY) > 0) {
                    ERROR_QTY = parseInt(ERROR_QTY) - 1;
                }
            }

            $('#outgoing_manage_return_form').find('#ERROR_QTY_VIEW').html(ERROR_QTY);
            $('#outgoing_manage_return_form').find('#ERROR_QTY').val(ERROR_QTY);
        };
        $('#outgoing_manage_mini_pop_save_btn').on('click', function () {
            // validation

            if ($("#outgoing_manage_pop_type_1_form").find("#NEW_OUT_QTY_VIEW").val() === 0) {
                fnAlert(null, "출고수량은 1개 이상이어야 합니다.");
            } else {
                let target = $('#outgoing_manage_mini_pop_save_btn').data('target');
                $("#outgoing_manage_pop_type_1_form").find("#TYPE").val(target);

                switch (target) {
                    case 'disposal':
                        // $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.deleteOutgoingDisposal,inspection.updateOutgoingDisposal,inspection.updateOutgoingOutType1After2,inspection.updateOutFinishStatus,machine.deleteMctPlanAll");
                        break;
                    default:
                        // $("#outgoing_manage_pop_type_1_form").find("#queryId").val("inspection.insertOutgoingOutType1,inspection.updateOutgoingOutType1After1,inspection.updateOutgoingOutType1After2,inspection.updateOutgoingOutType1After3,inspection.updateOutFinishStatus,inspection.updateOrderOutFinishStatus,machine.deleteMctPlanAll");
                }

                let parameters = {'url': '/createOutGoing', 'data': $("#outgoing_manage_pop_type_1_form").serialize()};
                fnPostAjax(function () {
                    fnAlert(null, "등록이 완료되었습니다.");
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
        $("#outgoing_manage_return_complete_pop").on('show.bs.modal', function () {
            //outgoingManageGridId02.pqGrid("refreshDataAndView");
            $outgoingReturnCompleteGrid = $('#' + outgoingReturnCompleteGridId).pqGrid(outgoingReturnCompleteObj);
            $outgoingReturnCompleteGrid.pqGrid("option", "dataModel.data", {queryId: 'inspection.selectOutgoingReturnCompleteList'});
            $outgoingReturnCompleteGrid.pqGrid("refreshDataAndView");
        });
        $('#outgoing_manage_return_complete_pop_close').on('click', function () {
            $('#outgoing_manage_return_complete_pop').modal('hide');
        });
        $('#outgoing_manage_out_btn').on('click', function () {
            if (outgoingManageSelectedRowIndex.length === 0) {
                fnAlert(null, "출고등록할 항목을 선택하여 주십시오.");
            } else {
                let list = [];
                let groupList = [];
                let controlStatusNmObj = new Set();
                let qty = 0;

                for (let i = 0; i < outgoingManageSelectedRowIndex.length; i++) {
                    let rowData = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: outgoingManageSelectedRowIndex[i]});
                    if (rowData.OUT_FINISH_DT !== undefined || rowData.ORDER_PACKING_NUM_CNT > 0) {
                        fnAlert(null, '이미 출하처리 된 대상이 포함되어있습니다.');
                        return false;
                    }

                    controlStatusNmObj.add(rowData.CONTROL_STATUS_NM);
                    list.push(rowData);
                    qty += Number(rowData.ORDER_QTY);
                }
                let grouped = fnGroupBy(list,'REGIST_NUM');
                $.each(grouped, function (idx,Item) {
                    groupList.push(Item[0]);
                })

                if (controlStatusNmObj.has('보류')) {
                    fnAlert(null, '보류상태에서는 출고 불가');
                    return false;
                }

                let confirmMsg = '선택항목을 출고등록 하시겠습니까?<br><br>선택주문수&ensp;:&ensp;' + outgoingManageSelectedRowIndex.length + ' 건&emsp;수량&ensp;:&ensp;'+ qty + ' EA';
                fnConfirm(null, confirmMsg, function () {
                    let changes = {
                        'groupList': groupList
                    };
                    // changes.queryIdList = {
                    //     'insertQueryId': ['inspection.insertOutgoingOutType2'],
                    //     'updateQueryId': ['inspection.updateOutgoingOutSelectGridType1After1', 'inspection.updateOutgoingOutSelectGridType1After2', 'inspection.updateOutgoingOutSelectGridType1After3', 'inspection.updateOutFinishStatusUseOrderSeq', 'inspection.updateOrderOutFinishStatus', 'machine.deleteMctPlanAllUseOrderSeq']
                    // };
                    let parameters = {'url': '/createOutGoingForGrid', 'data': {data: JSON.stringify(changes)}};

                    fnPostAjax(function () {
                        fnAlert(null, "등록이 완료되었습니다.");
                        fnResetForm("outgoing_manage_pop_type_1_form");
                        $("#outgoing_manage_form").find("#queryId").val("inspection.selectOutgoingList");
                        $("#outgoing_manage_search_btn").trigger("click");
                    }, parameters, '');
                });
            }
        });
        $('#outgoing_manage_label_print_btn').on('click', function () {
            let barcodeList = [];

            if (outgoingManageSelectedRowIndex.length > 0) {
                for (let i = 0; i < outgoingManageSelectedRowIndex.length; i++) {
                    let rowData = outgoingManageGridId01.pqGrid('getRowData', {rowIndx: outgoingManageSelectedRowIndex[i]});
                    let postData = {
                        // 'queryId': 'inspection.selectOutgoingLabelType2',
                        'queryId': 'inspection.selectOutgoingLabelType2OrderVer',
                        // 'CONTROL_SEQ': rowData.CONTROL_SEQ,
                        // 'CONTROL_DETAIL_SEQ': rowData.CONTROL_DETAIL_SEQ,
                        'ORDER_SEQ': rowData.ORDER_SEQ
                    };

                    let parameter = {'url': '/json-list', 'data': postData};
                    fnPostAjaxAsync(function (data) {
                        for (let i = 0; i < data.list.length; i++) {
                            barcodeList.push(data.list[i].BARCODE_NUM);
                        }
                    }, parameter, '');
                }
                let bCodePrintLen = barcodeList.length;
                if (bCodePrintLen > 0) {
                    fnConfirm(null, bCodePrintLen + "건에 대해서 라벨을 출력합니다.\n진행하시겠습니까?", function () {
                        fnBarcodePrint(function (data) {
                            fnAlert(null, data.message);
                        }, barcodeList, '');
                    });
                } else {
                    fnAlert(null, "출력할 바코드가 존재 하지 않습니다.");
                }

            } else {
                fnAlert(null, "그리드를 선택해 주십시오.");
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
        $('#outgoing_manage_return_form').find("#SEL_RETURN_POP_CONTROL_NUM").on('change', function () {
            let value = $(this).val();

            $("#outgoing_manage_return_form").find("#CONTROL_SEQ").val(value.split("_")[0]);
            $("#outgoing_manage_return_form").find("#CONTROL_DETAIL_SEQ").val(value.split("_")[1]);
            $("#outgoing_manage_return_form").find("#queryId").val("inspection.selectOutgoingReturnInfoOrderList");
            let parameters = {
                'url': '/json-list',
                'data': $('#outgoing_manage_return_form').serialize()
            };
            fnPostAjax(function (data) {
                let dataList = data.list;
                let dataInfo = dataList[0];
                if(dataList.length == 0) {
                    fnAlert(null, "<spring:message code='com.msg.no.data'/>");

                    $('#outgoing_manage_return_pop').modal('hide');
                }else {
                    fnJsonDataToForm("outgoing_manage_return_form", dataInfo);
                    $("#outgoing_manage_return_form").find("#ORG_REAL_OUT_QTY").val(dataInfo.REAL_OUT_QTY);
                    $("#outgoing_manage_return_form").find("#ERROR_QTY").val("0");
                    $("#outgoing_manage_return_form").find("#ERROR_QTY_VIEW").html("0");
                    $("#outgoing_manage_return_form").find("#ORDER_QTY_RETURN_VIEW").html(dataInfo.ORDER_QTY);
                    $("#outgoing_manage_return_form").find("#REAL_OUT_QTY_RETURN_VIEW").html(dataInfo.REAL_OUT_QTY);
                    $("#outgoing_manage_return_form").find("#OUT_FINISH_DT_RETURN_VIEW").html(dataInfo.OUT_FINISH_DT);

                    let emergencySpan = '';

                    $("#outgoing_manage_return_form").find("#CONTROL_NUM" + "_VIEW_T").html(dataInfo.CONTROL_NUM);
                    $("#outgoing_manage_return_form").find("#DRAWING_NUM" + "_VIEW_T").html(dataInfo.DRAWING_NUM);
                    $("#outgoing_manage_return_form").find("#MAIN_INSPECTION_NM" + "_VIEW_T").html(dataInfo.MAIN_INSPECTION_NM);
                    if(dataInfo.EMERGENCY_YN === 'Y') {
                        emergencySpan = '<span style="display: inline-block; margin: 0 5px; padding: 0px 7px; border: solid red; border-radius: 5px; color: #FF0000; text-align: center; font-size: 1rem;">긴급</span>';
                    }
                    $("#outgoing_manage_return_form").find("#ORDER_DUE_DT" + "_VIEW_T").html(dataInfo.ORDER_DUE_DT + emergencySpan);
                    $("#outgoing_manage_return_form").find("#ITEM_NM" + "_VIEW_T").html(dataInfo.ITEM_NM);
                    $("#outgoing_manage_return_form").find("#MATERIAL_DETAIL_NM" + "_VIEW_T").html(dataInfo.MATERIAL_DETAIL_NM);
                    $("#outgoing_manage_return_form").find("#ORDER_QTY_INFO" + "_VIEW_T").html(dataInfo.ORDER_QTY_INFO);
                    $("#outgoing_manage_return_form").find("#SIZE_TXT_WORK_TYPE_NM" + "_VIEW_T").html(dataInfo.SIZE_TXT_WORK_TYPE_NM);
                    $("#outgoing_manage_return_form").find("#SURFACE_TREAT_NM" + "_VIEW_T").html(dataInfo.SURFACE_TREAT_NM);
                    $("#outgoing_manage_return_form").find("#ORDER_COMP_NM" + "_VIEW_T").html(dataInfo.ORDER_COMP_NM);
                    $("#outgoing_manage_return_form").find("#OUTSIDE_COMP_NM" + "_VIEW_T").html(dataInfo.OUTSIDE_COMP_NM);

                    $('#SEL_RETURN_POP_CONTROL_NUM').val(value).prop("selected",true);
                }
            }, parameters, '');
        });
        $('#outgoing_manage_return_form').find("#INSPECT_GRADE").on('change', function () {

            let value = $(this).val();
            $('#outgoing_manage_return_form').find("#INSPECT_RESULT").val("");
            $('#outgoing_manage_return_form').find("#ERROR_REASON").val("");
            $('#outgoing_manage_return_form').find("#INSPECT_DESC").val("");
            if (value === "GRD050") {

                $('#outgoing_manage_return_form').find("#INSPECT_RESULT").attr("disabled", true);
                $('#outgoing_manage_return_form').find("#ERROR_REASON").attr("disabled", true);
                $('#outgoing_manage_return_form').find("#INSPECT_DESC").attr("readonly", true);


            } else if (value === "GRD060") {
                $('#outgoing_manage_return_form').find("#INSPECT_RESULT").attr("disabled", false);
                $('#outgoing_manage_return_form').find("#ERROR_REASON").attr("disabled", false);
                $('#outgoing_manage_return_form').find("#INSPECT_DESC").attr("readonly", false);
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
        fnCommCodeDatasourceSelectBoxCreate($('#outgoing_manage_form').find('#SEL_OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });

        $(document).on('click', '#outBtn', function (event) {
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
            fnResetForm("outgoing_manage_pop_type_1_form");
            $("#outgoing_manage_pop_type_1_form").find("#CONTROL_SEQ").val(control_seq);
            $("#outgoing_manage_pop_type_1_form").find("#CONTROL_DETAIL_SEQ").val(control_detail_seq);
            $("#outgoing_manage_pop_type_1_form").find("#ORDER_SEQ").val(order_seq);
            $('#outgoing_manage_pop_type_1').modal('show');
        });
        $(document).on('click', '#returnBtn', function (event) {
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
            fnResetForm("outgoing_manage_return_form");
            $("#outgoing_manage_return_form").find("#ORDER_SEQ").val(order_seq);
            $('#outgoing_manage_return_pop').modal('show');
        });
        $(document).on('click', '#labelBtn', function (event) {
            let control_seq = event.target.dataset.control_seq;
            let control_detail_seq = event.target.dataset.control_detail_seq;
            let order_seq = event.target.dataset.order_seq;
            /*그리드에 바코드 하나
              let formData = new Array();
              formData[0] = ui.rowData['BARCODE_NUM'];*/

            fnResetForm("outgoing_manage_pop_label_type_1_form");
            $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_SEQ").val(control_seq);
            $("#outgoing_manage_pop_label_type_1_form").find("#CONTROL_DETAIL_SEQ").val(control_detail_seq);
            $("#outgoing_manage_pop_label_type_1_form").find("#ORDER_SEQ").val(order_seq);
            $('#outgoing_manage_pop_label_type_1').modal('show');
        });

        $('#outgoingManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(outgoingManageGridId01, 'outgoingManageFilterKeyword', 'outgoingManageFilterCondition', 'outgoingManageFilterColumn');

                let data = outgoingManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_grid_records').html(totalRecords);
            },
            'search': function () {
                fnFilterHandler(outgoingManageGridId01, 'outgoingManageFilterKeyword', 'outgoingManageFilterCondition', 'outgoingManageFilterColumn');

                let data = outgoingManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_manage_grid_records').html(totalRecords);
            }
        });

        $("#outgoingManageFrozen").on('change', function () {
            fnFrozenHandler(outgoingManageGridId01, $(this).val());
        });

        function outgoingManageFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                let condition = $("#outgoingManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#outgoingManageFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length !== valUpper.length) {
                        indx = -1;
                    }
                } else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }

        $('#NEW_OUT_QTY_VIEW').on('change keyup paste input', function () {
            //ORDER_QTY 총수량, OUT_QTY 나간 수량, NEW_OUT_QTY 나갈 수량량
            let ORIGINAL_NEW_OUT_QTY = $('#outgoing_manage_pop_type_1_form').find('#ORG_NEW_OUT_QTY').val();
            let NEW_OUT_QTY = this.value || 0;

            if (Number(ORIGINAL_NEW_OUT_QTY) < Number(NEW_OUT_QTY)) {
                this.value = ORIGINAL_NEW_OUT_QTY;
                return false;
            }

            let restQty = ORIGINAL_NEW_OUT_QTY - NEW_OUT_QTY;
            $('#outgoing_manage_pop_type_1_form').find('#outgoing_manage_pop_type_1_form_view_2').html(restQty);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY_VIEW').val(NEW_OUT_QTY);
            $('#outgoing_manage_pop_type_1_form').find('#NEW_OUT_QTY').val(NEW_OUT_QTY);
        });

        // $('#SEL_OUTGOING_DATE_TYPE').val(4); // 확정일자 Default 검색조건
        // $('#SEL_OUTGOING_DATE_TYPE option[value=4]').prop('selected',true);

        $('#SEL_OUTGOING_DATE_TYPE').on('change', function () {
            const $selOutgoingTerm = $('[name=SEL_OUTGOING_TERM]');
            const $selDt = $('[id^=SEL][id$=DT]');

            if(this.value === '') {
                $selOutgoingTerm.prop('disabled', true);
                $selDt.prop('disabled', true);
            } else {
                $selOutgoingTerm.prop('disabled', false);
                $selDt.prop('disabled', false);
            }
        });

        $('#OUTGOING_MANAGE_EXCEL_EXPORT').on('click', function () {
            const blob = outgoingManageGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '출하관리.xlsx');
        });

        $('#DISPOSAL_YN').on('click', function () {
            const $miniPopup = $('#outgoing_manage_pop_type_1').find('.miniPopup');
            const $outgoingManagePopType1Form = $("#outgoing_manage_pop_type_1_form");
            const orderQty = $outgoingManagePopType1Form.find('#ORDER_QTY').val();
            let backgroundColor;
            let outHtmlString;
            let target;
            let readonly;
            let view;
            let qty;

            if (this.checked) {
                backgroundColor = '#ffeed9';
                outHtmlString = '폐기<br>출고';
                target = 'disposal';
                readonly = true;
                view = orderQty + '/' + orderQty;
                qty = orderQty;
            } else {
                const originalNewOutQty = $outgoingManagePopType1Form.find('#ORG_NEW_OUT_QTY').val();
                backgroundColor = '';
                outHtmlString = '출고';
                target = 'release';
                readonly = false;
                view = originalNewOutQty + '/' + orderQty;
                qty = originalNewOutQty;

                $miniPopup.find('#outgoing_manage_mini_pop_all_btn').click();
            }

            $miniPopup.css('background-color', backgroundColor);
            $miniPopup.find('#out').html(outHtmlString);
            $miniPopup.find('#outgoing_manage_mini_pop_save_btn').data('target', target);
            $miniPopup.find('#NEW_OUT_QTY_VIEW').prop('readonly', readonly);
            $miniPopup.find('#subtitle').toggle();
            $miniPopup.find('.process > .pr_txt > span:first').toggle();
            $miniPopup.find('#outgoing_manage_mini_pop_plus_btn').toggle();
            $miniPopup.find('#outgoing_manage_mini_pop_minus_btn').toggle();
            $miniPopup.find('#outgoing_manage_mini_pop_all_btn').toggle();

            $outgoingManagePopType1Form.find("#outgoing_manage_pop_type_1_form_view_1").html(view);
            $outgoingManagePopType1Form.find("#outgoing_manage_pop_type_1_form_view_2").html('0');
            $outgoingManagePopType1Form.find("#NEW_OUT_QTY_VIEW").val(qty);
        });
        $("#outgoing_pop_btn").on('click',function(e) {
            $("#outgoing_scan_barcode_popup_form").find("#TYPE").val("OUTGOING");
            $('#outgoing_scan_barcode_popup').modal('show');
        });
        $("#stock_outgoing_pop_btn").on('click',function(e) {
            $("#outgoing_scan_barcode_popup_form").find("#TYPE").val("STOCK_OUTGOING");
            $('#outgoing_scan_barcode_popup').modal('show');
        });

        function fnMakeScanTableTdOnDataFail(msg, data) {
            let html = '';
            var table = document.getElementById("outgoingScanPopDynamicTable");
            var date = new Date();
            var time = ('00'+date.getHours()).substr(-2)+ ':' + ('00'+date.getMinutes()).substr(-2) + ':' + ('00'+date.getSeconds()).substr(-2);
            html +='<tr>';
            html += '<td>' + table.rows.length + '</td>';
            html += '<td>' + time + '</td>';
            html += '<td style="color: red;">실패</td>';
            html += '<td style="color:red;">' + msg + '</td>';
            html += '<td style="color:red;">'+((typeof data != 'undefined' && data.CONTROL_NUM != '' && data.CONTROL_NUM != null)?data.CONTROL_NUM : '')+'</td>';
            html += '<td style="color:red;">'+((typeof data != 'undefined' && data.ORDER_NUM != '' && data.ORDER_NUM != null)?data.ORDER_NUM : '')+'</td>';
            html += '<td style="color:red;">'+((typeof data != 'undefined' && data.DRAWING_NUM != '' && data.DRAWING_NUM != null)?data.DRAWING_NUM : '')+'</td>';
            html += '<td style="color:red;">'+((typeof data != 'undefined' && data.OUT_QTY != '' && data.OUT_QTY != null)?data.OUT_QTY : '')+'</td>';
            html += '</tr>';

            $("#outgoingScanPopDynamicTable tbody").append(html);
            let height = $("#outgoing_table_div").height();
            $("#outgoing_table_div").scrollTop(height);
        }

        function fnMakeScanTableTdOnDataSuccess(data) {
            var table = document.getElementById("outgoingScanPopDynamicTable");
            let html = '';
            var date = new Date();
            var time = ('00'+date.getHours()).substr(-2)+ ':' + ('00'+date.getMinutes()).substr(-2) + ':' + ('00'+date.getSeconds()).substr(-2);

            html +='<tr>';
            html += '<td>' + table.rows.length + '</td>';
            html += '<td>' + time + '</td>';
            html += '<td style="color: blue;">성공</td>';
            html += '<td></td>';
            html += '<td style="color: blue;">' +((typeof data.CONTROL_NUM != 'undefined' && data.CONTROL_NUM != null && data.CONTROL_NUM != '') ? data.CONTROL_NUM : '') + '</td>';
            html += '<td style="color: blue;">' + ((typeof data.ORDER_NUM != 'undefined' && data.ORDER_NUM != null && data.ORDER_NUM != '') ? data.ORDER_NUM : '') + '</td>';
            html += '<td style="color: blue;">' +data.DRAWING_NUM + '</td>';
            html += '<td style="color: blue;">' +((typeof data.PLAN_QTY != 'undefined' && data.PLAN_QTY != null && data.PLAN_QTY != '') ? data.PLAN_QTY : '') + '</td>';
            html += '</tr>';

            $("#outgoingScanPopDynamicTable tbody").append(html);
            let height = $("#outgoing_table_div").height();
            $("#outgoing_table_div").scrollTop(height);
        }

        function resetScanPop() {
            $(".span_controlNum").text('');
            $(".span_qty").text('');
            $(".span_status").text('');
            $("#outgoingScanPopDynamicTable tbody").empty();
        }
        function setDiv(showId, hideId, msg, controlNum, qty) {
            $("#" + hideId).hide()
            $("#" + showId).show()
            $("#" + showId).find(".span_controlNum").text(controlNum)
            if(qty == 0) {
                qty = ""
            }else if(qty > 0) {
                qty = qty + 'EA';
            }
            $("#" + showId).find(".span_qty").text(qty);
            $("#" + showId).find(".span_status").text(msg);
        }

        $('#outgoing_scan_barcode_popup').on({
            'show.bs.modal': function () {
                setTimeout(function() {
                    $("#outgoingScanBarcode").focus();
                },100);
            },'hide.bs.modal': function () {
                $("#outgoing_manage_search_btn").trigger("click");
                resetScanPop();
            }
        })

        $("#outgoingScanBarcode").on({
            focus: function () {
                $("#outgoing_scan_barCodeImg").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#outgoing_scan_barCodeImg").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            }
        });

        $("#outgoingScanBarcode").on('keydown', function(e){
            if (e.keyCode === 13) {
                const popType = $("#outgoing_scan_barcode_popup_form").find("#TYPE").val();
                const barcodeNum = fnBarcodeKo2En(this.value);
                const barcodeType = barcodeNum.charAt(0).toUpperCase();
                let barcodeSql = "";
                $('#outgoingScanBarcode').val('');

                if (barcodeType === "L") {//라벨
                    barcodeSql = "inspection.selectOutgoingOutType4OrderVer";
                } else if (barcodeType === "C") {//도면
                    barcodeSql = "inspection.selectOutgoingOutType3";
                } else if (barcodeType === "O") {//영업도면
                    barcodeSql = "inspection.selectOutgoingOutType5OrderVer";
                } else {
                    setDiv('fail_div','success_div','알 수 없는 바코드 타입입니다 [' + barcodeNum + ']','','')
                    fnMakeScanTableTdOnDataFail('알 수 없는 바코드 타입입니다.[' + barcodeNum + ']');
                    return false;
                }

                //0. 바코드 정보 가져오기
                let data = {'queryId': barcodeSql, 'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info', 'data': data};
                fnPostAjaxSound(function (data) {
                    let dataInfo = data.info;
                    if (dataInfo == null) {
                        setDiv('fail_div','success_div','해당 바코드가 존재하지 않습니다','','')
                        fnMakeScanTableTdOnDataFail('해당 바코드가 존재하지 않습니다.');
                        return false;
                    } else {
                        if(popType == 'OUTGOING') {
                            if (barcodeType === "L") {
                                // 21.10.13 주문 작업으로 인해, 라벨출력이 접수단으로 이동됨
                                // 따라서 작업정보가 없이도 라벨출력이 가능
                                // 라벨을 찍었을때, 2가지 케이스 존재 (작업연계가된 라벨, 작업없는 라벨)
                                // 라벨출고 = 패킹출고?


                                // 1. 버튼으로 출고 했을 때 메시지
                                // 2. 버튼으로 모두 출고 했을 때 처리방법
                                if (dataInfo.OUT_QTY > 0) {
                                    setDiv('fail_div','success_div','이미 출하처리 되었습니다',dataInfo.REGIST_NUM,dataInfo.OUT_QTY)
                                    fnMakeScanTableTdOnDataFail('이미 출하처리 되었습니다',dataInfo);
                                    return false;
                                }
                                if (dataInfo.CONTROL_STATUS != 'ORD001' && dataInfo.CONTROL_STATUS != 'ORD003') {
                                    setDiv('fail_div','success_div','작업지시 상태를 확인해주세요',dataInfo.CONTROL_NUM,"")
                                    fnMakeScanTableTdOnDataFail('작업지시 상태를 확인해주세요',dataInfo);
                                    return false;
                                }

                                if (dataInfo.MY_OUT_PACKING_CNT > 0) {
                                    setDiv('fail_div','success_div','이미 출하처리 되었습니다',dataInfo.REGIST_NUM,dataInfo.MY_OUT_PACKING_CNT)
                                    fnMakeScanTableTdOnDataFail('이미 출하처리 되었습니다',dataInfo);
                                    return false;
                                }

                                fnJsonDataToForm("outgoing_manage_pop_type_label_form", dataInfo);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_1").html(dataInfo.QTY_INFO);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_2").html(dataInfo.REMAIN_PACKING_CNT);
                                $("#outgoing_manage_pop_type_label_form").find("#outgoing_manage_pop_type_label_form_view_3").html(dataInfo.MY_PACKING_NUM);

                                //. 저장하기
                                // $("#outgoing_manage_pop_type_label_form").find("#queryId").val("inspection.insertOutgoingOutType4,inspection.updateOutgoingOutType4After1,inspection.updateOutgoingOutType4After2,inspection.updateOutgoingOutType4After3,inspection.updateOutFinishStatus,machine.deleteMctPlanAll");
                                $("#outgoing_manage_pop_type_label_form").find("#queryId").val("inspection.insertOutgoingOutType4OrderVer,inspection.updateOutgoingOutType4After1OrderVer,inspection.updateOutgoingOutSelectGridType1After2,inspection.updateOutgoingOutSelectGridType1After3,inspection.updateOutFinishStatusUseOrderSeq,inspection.updateOutFinishDt,inspection.updateOrderOutFinishStatus,machine.deleteMctPlanAllUseOrderSeq");
                                $("#outgoing_manage_pop_type_label_form").find("#BARCODE_NUM").val(barcodeNum);
                                let parameters = {
                                    'url': '/json-manager',
                                    'data': $('#outgoing_manage_pop_type_label_form').serialize()
                                };
                                fnPostAjaxAsync(function () {
                                    // alertify.notify('출고처리되었습니다', 'success');
                                    setDiv('success_div','fail_div','출고완료',dataInfo.REGIST_NUM,'')
                                    fnMakeScanTableTdOnDataSuccess(dataInfo);
                                }, parameters, '');
                            } else if (barcodeType === "C" || barcodeType === "O") {

                                if (dataInfo.CONTROL_STATUS != 'ORD001' && dataInfo.CONTROL_STATUS != 'ORD003') {
                                    setDiv('fail_div','success_div','작업지시 상태를 확인해주세요',dataInfo.CONTROL_NUM,"")
                                    fnMakeScanTableTdOnDataFail('작업지시 상태를 확인해주세요',dataInfo);
                                    return false;
                                }

                                // 파트는 출고대상 X
                                if(dataInfo.WORK_TYPE == 'WTP050') {
                                    setDiv('fail_div','success_div','파트는 출고대상이 아닙니다',dataInfo.CONTROL_NUM,dataInfo.PLAN_QTY)
                                    fnMakeScanTableTdOnDataFail('파트는 출고대상이 아닙니다');
                                    return  false;
                                }
                                if (dataInfo.OUT_QTY > 0) {
                                    setDiv('fail_div','success_div','이미 출하처리 되었습니다',dataInfo.CONTROL_NUM,dataInfo.OUT_QTY)
                                    fnMakeScanTableTdOnDataFail('이미 출하처리 되었습니다',dataInfo);
                                    return false;
                                }
                                // TODO: PACKING 단위로 출고 한 후 출고 된 메세지 어떻게 할지
                                if (dataInfo.MY_OUT_PACKING_CNT > 0) {
                                    setDiv('fail_div','success_div','이미 출하처리 되었습니다',dataInfo.CONTROL_NUM,dataInfo.MY_OUT_PACKING_CNT)
                                    fnMakeScanTableTdOnDataFail('이미 출하처리 되었습니다',dataInfo);
                                    return false;
                                }

                                fnJsonDataToForm("outgoing_manage_pop_type_control_form", dataInfo);

                                $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_1").html(data.info.QTY_INFO);
                                $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_2").html("0");
                                $("#outgoing_manage_pop_type_control_form").find("#outgoing_manage_pop_type_control_form_view_3").html(data.info.PLAN_QTY);

                                //. 저장하기
                                if (barcodeType === "C") {
                                    $("#outgoing_manage_pop_type_control_form").find("#queryId").val("inspection.insertOutgoingOutType3,inspection.updateOutgoingOutType3After1,inspection.updateOutgoingOutType3After2,inspection.updateOutgoingOutType3After3,inspection.updateOutFinishDtForBarcode,inspection.updateOutFinishStatus,inspection.updateOrderOutFinishStatusForBarcode,machine.deleteMctPlanAll");
                                } else if (barcodeType === "O") {
                                    // $("#outgoing_manage_pop_type_control_form").find("#queryId").val("inspection.insertOutgoingOutType5,inspection.updateOutgoingOutType5After1,inspection.updateOutgoingOutType3After2,inspection.updateOutgoingOutType3After3,inspection.updateOutFinishDt,inspection.updateOutFinishStatus,inspection.updateOrderOutFinishStatus,machine.deleteMctPlanAll");
                                    $("#outgoing_manage_pop_type_control_form").find("#queryId").val("inspection.insertOutgoingOutType1UseOrderSeq,inspection.updateOutgoingOutType1After1UseOrderSeq,inspection.updateOutFinishDt,inspection.updateOutFinishStatusUseOrderSeq,inspection.updateOrderOutFinishStatus,machine.deleteMctPlanAllUseOrderSeq");
                                }
                                let parameters = {
                                    'url': '/json-manager',
                                    'data': $('#outgoing_manage_pop_type_control_form').serialize()
                                };
                                fnPostAjaxAsync(function () {
                                    // alertify.notify('출고처리되었습니다', 'success');
                                    setDiv('success_div','fail_div','출고완료',dataInfo.CONTROL_NUM,dataInfo.PLAN_QTY)
                                    fnMakeScanTableTdOnDataSuccess(dataInfo);
                                }, parameters, '');
                            }
                        }else {
                            if(dataInfo.WORK_TYPE != 'WTP040') {
                                fnAlert(null,"제품소진은 재고인 작업건만 가능합니다.");
                                return false;
                            }else {
                                $("#outgoing_manage_pop_type_control_form").find("#queryId").val("material.insertOutgoingInStockManage1,material.updateOutgoingOutInStockManage1,inspection.updateOutgoingOutType1After2,inspection.updateOutgoingOutType1After3,inspection.updateOutFinishStatus,machine.deleteMctPlanAll");
                                dataInfo.IN_OUT_QTY = 0;

                                fnJsonDataToForm("outgoing_manage_pop_type_control_form", dataInfo);

                                let parameters = {
                                    'url': '/json-manager',
                                    'data': $('#outgoing_manage_pop_type_control_form').serialize()
                                };
                                fnPostAjaxAsync(function () {
                                    // alertify.notify('출고처리되었습니다', 'success');

                                    dataInfo.PLAN_QTY = "0";

                                    setDiv('success_div','fail_div','출고완료',dataInfo.CONTROL_NUM,dataInfo.PLAN_QTY)
                                    fnMakeScanTableTdOnDataSuccess(dataInfo);
                                }, parameters, '');
                            }
                        }
                    }
                }, parameters, '');
            }
        });
    });
</script>
