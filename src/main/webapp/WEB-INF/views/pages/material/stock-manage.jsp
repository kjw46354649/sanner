<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="stock_manage_form" name="stock_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockList">
            <input type="hidden" name="popType" id="popType" value="">
            <input type="hidden" name="V_INSIDE_STOCK_SEQ" id="V_INSIDE_STOCK_SEQ" value="">
            <div class="none_gubunWrap row3_topWrap" >
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
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">재고번호</label>
                            <input type="search" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="재고번호">
                        </span>
                        <span class="gubun"></span>
                        <%--                        <span class="ipu_wrap">--%>
                        <%--                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재종류</label>--%>
                        <%--                            <input type="text" class="wd_200" name="SEL_MATERIAL_DETAIL" id="SEL_MATERIAL_DETAIL" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>--%>
                        <%--                        </span>--%>
                        <span class="slt_wrap">
                            <label class="label_100" for="material_type">재질</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="material_type" title="재질">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1035}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
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
                        <span class="slt_wrap">
                            <label for="SEL_LOC_SEQ" class="label_100">재고위치</label>
                            <select id="SEL_LOC_SEQ" name="SEL_LOC_SEQ" title="재고위치" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <div class="slt_wrap">
                            <label class="label_100" for="SIZE_TYPE">규격</label>
                            <select class="wd_100" class="two" name="SIZE_TYPE" id="SIZE_TYPE">
                                <%--                            <select class="wd_100" class="two" name="SEL_SIZE_TYPE" id="SEL_SIZE_TYPE">--%>
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <span class="slt_wrap" id="SIZE_W">
                                <label class="label_8">W</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_H">
                                <label class="label_8">H</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_T">
                                <label class="label_8">T</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_D" style="display: none;">
                                <label class="label_8">D</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_L" style="display: none;">
                                <label class="label_8">L</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_F" id="SIZE_L_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_T" id="SIZE_L_T" placeholder="To" disabled>
                            </span>
                            <span class="gubun"></span>
                            <%--                            <select class="wd_100" class="two" name="SEL_SIZE_SEARCH_TYPE" id="SEL_SIZE_SEARCH_TYPE" style="display: none">--%>
                            <%--                                <option value=""><spring:message code="com.form.top.all.option" /></option>--%>
                            <%--                                <c:forEach var="vlocale" items="${HighCode.H_1056}">--%>
                            <%--                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>--%>
                            <%--                                </c:forEach>--%>
                            <%--                            </select>--%>
                        </div>
                        <span class="ipu_wrap right_float">
                            <span class="mr-10" id="locationBarcodeSpan">
                                <img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="locationBarcodeImg">
                            </span>
                            <span class="mr-10">
                                <input type="text" class="wd_150" name="LOCATION_BARCODE_NUM" id="LOCATION_BARCODE_NUM" placeholder="위치바코드">
                            </span>
                            <button type="button" id="STOCK_MANAGE_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="stock_manage_search_btn">검색</button>
                        </span>
                        <%--<span class="txt_span pd-right20">조회 Option</span>
                        <span class="chk_box"><input type="checkbox" name="DEADLINE" id="DEADLINE"><label for="DEADLINE">마감</label></span>
                        <span class="chk_box"><input type="checkbox" name="END" id="END"><label for="END">종료</label></span>
                        <span class="gubun"></span>
                        <span class="txt_span pd-right20">항목 Option</span>
                        <span class="chk_box"><input type="checkbox" name="PART_NUM" id="PART_NUM"><label for="PART_NUM">Part</label></span>
                        <span class="chk_box"><input type="checkbox" name="ORDER_NUM" id="ORDER_NUM"><label for="ORDER_NUM">발주번호</label></span>--%>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="stockManageFilterKeyword" placeholder="Enter your keyword">
                <select id="stockManageFilterColumn"></select>
                <select id="stockManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="stockManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="stockManageFrozen" name="stockManageFrozen">
                </select>
<%--                <button type="button" class="defaultBtn" id="stock_manage_new_btn">재고 입고</button>--%>
                <button type="button" class="defaultBtn" id="stock_manage_area_info_btn">위치정보관리</button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn blue radius" id="stock_manage_new_btn">신규생성/입고</button>
                    <button type="button" class="defaultBtn brown radius" id="stock_manage_out_btn">불출</button>
                    <button type="button" class="defaultBtn lightGray radius" id="stock_manage_drawing_print_btn" style="background-color: #d9d9d9;">재고도면 출력</button>
<%--                    <button type="button" class="defaultBtn radius" id="stock_manage_drawing_new_btn">도면 등록</button>--%>
                    <button type="button" class="defaultBtn radius" id="stock_manage_add_btn">추가</button>
                    <button type="button" class="defaultBtn radius red" id="stock_manage_delete_btn">삭제</button>
                    <button type="button" class="defaultBtn radius green" id="stock_manage_save_btn">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conMainWrap">
                <div id="stock_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="stock_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <div>
                <span style="font-size: 1.6rem;">불출 요청 현황</span>
            </div>
            <br/>
            <div class="conWrap">
                <div id="stock_manage_grid02"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="stock_manage_grid02_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<form id="stock_manage_hidden_form" name="stock_manage_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectStockRequestList"/>
    <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>
<input type="button" id="stockFileUpload" style="display: none;">

<!-- 재고입고 mini popup : S -->
<%--<div class="popup_container" id="stock_manage_pop_old" style="display: none;">
    <form class="form-inline" id="stock_manage_pop_old_form" name="stock_manage_pop_old_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="material.selectInsideStockPopInfo">
        <input type="hidden" id="IN_OUT_QTY" name="IN_OUT_QTY" value="0">
        <input type="hidden" id="ORIGINAL_ORDER_QTY" name="ORIGINAL_ORDER_QTY" value="0">
        <input type="hidden" id="ORIGINAL_POP_STOCK_QTY_AFTER" name="ORIGINAL_POP_STOCK_QTY_AFTER" value="0">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="">
        <input type="hidden" name="POP_TYPE" id="POP_TYPE" value="">
        <input type="hidden" name="USE_BARCODE" id="USE_BARCODE" value="">
        <input type="hidden" name="MATERIAL_TYPE" id="MATERIAL_TYPE" value="">

        <input type="hidden" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" value="">
        <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD" value="">
        <input type="hidden" name="ITEM_NM" id="ITEM_NM" value="">
        <input type="hidden" name="COMP_CD" id="COMP_CD" value="">

        <div class="miniPopup">
            &lt;%&ndash;<div class="headWrap">
                <h4 id="pop_title">재고 입고</h4>
                <button class="closeBtn">닫기</button>
            </div>&ndash;%&gt;
            <div class="contentWrap">
                <h3 id="pop_title">재고 입고</h3>
                <button type="button" class="pop_close" id="inside_stock_pop_close_btn2">닫기</button>
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
                        <th>도면번호</th>
                        <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250" readonly></td>
                        &lt;%&ndash;                    <th class="bg_green">Part</th>&ndash;%&gt;
                        &lt;%&ndash;                    <td>23</td>&ndash;%&gt;
                    </tr>
                    <tr>
                        <th>재고번호</th>
                        <td colspan="4"><input type="text" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM"  value="" title="재고번호" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>규격</th>
                        <td colspan="4"><input type="text" name="SIZE_TXT" id="SIZE_TXT"  value="" title="규격" class="wd_250" readonly></td>
                    </tr>
                    <tr>
                        <th>창고</th>
                        <td class="nopadding bg_green">
                            <span>
                                <select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" data-required="true">
                                    <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                        </td>
                        <th>위치</th>
                        <td colspan="2" class="nopadding bg_green">
                            <span>
                                 <select id="LOC_SEQ" name="LOC_SEQ" title="위치" data-required="true" >
                                    <option value=""><spring:message code="com.form.top.all.option" /></option>
                                </select>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>현재수량</th>
                        <td><input type="text" name="POP_STOCK_QTY" id="POP_STOCK_QTY"  value="" title="현재수량" class="wd_50" readonly></td>
                        <th>변경후수량</th>
                        <td colspan="2"><input type="text" name="POP_STOCK_QTY_AFTER" id="POP_STOCK_QTY_AFTER"  value="" title="변경후수량" class="wd_50" readonly></td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td colspan="4" class="bg_green">
                            <button type="button" class="btn_plus" id="inside_stock_qty_plus_btn">더하기</button>
                            <span class="text">
                            <input type="text" id="ORDER_QTY" name="ORDER_QTY" value="0" style="border: none; outline: none; background: #e8f9ea; width: 70px; height: 33px; font-size: 19px; text-align: center;">
                        </span>
                            <button type="button" class="btn_minus" id="inside_stock_qty_minus_btn">빼기</button>
                            <button type="button" class="btn_allPlus" id="inside_stock_qty_all_btn">전량</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footerWrap">
                <div class="barcode" id="footer_barcode">
                    <span class="barCodeTxt"><input type="text" class="wd_240_barcode hg_35" name="BARCODE_NUM" id="BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요" ></span>
                    <span class="barCode" style="margin: 13px 15px 0 0;"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="stock_manage_pop_form_barcode_img" ></span>
                </div>
                <div class="process">
                    <span class="pr_txt" id="footer_msg"></span>
                    &lt;%&ndash;                <span class="pr_txt">재고를 <b>신규 생성</b>하시겠습니까?</span>&ndash;%&gt;
                    &lt;%&ndash;                <span class="pr_txt"><b class="block">입고가 완료되었습니다.</b>추가 진행하려면 바코드를 스캔해주세요</span>&ndash;%&gt;
                    <div class="btnWrap">
                        <button type="button" class="defaultBtn greenPopGra" id="inside_stock_pop_save_btn">저장</button>
                        <button type="button" class="defaultBtn grayPopGra" id="inside_stock_pop_close_btn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>--%>
<!-- 재고입고 mini popup : E -->

<!--재고생성/입고 팝업-->
<div id="stock_manage_pop" class="popup_container" style="display: none;">
    <form class="form-inline" id="stock_manage_pop_form" name="stock_manage_pop_form" role="form" onsubmit="return false;">
        <input type="hidden" id="queryId" name="queryId" value="material.selectInsideStockPopInfo">
        <input type="hidden" id="IN_OUT_QTY" name="IN_OUT_QTY" value="0">
        <input type="hidden" id="POP_STOCK_QTY_AFTER" name="POP_STOCK_QTY_AFTER" value="0">
        <input type="hidden" id="POP_STOCK_QTY" name="POP_STOCK_QTY" value="0">
        <input type="hidden" id="ORG_ORDER_QTY" name="ORG_ORDER_QTY" value="0">
        <input type="hidden" id="IMG_GFILE_SEQ" name="IMG_GFILE_SEQ" value="">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="INSIDE_STOCK_SEQ" name="INSIDE_STOCK_SEQ" value="">
        <input type="hidden" id="INSIDE_STOCK_NUM" name="INSIDE_STOCK_NUM" value="">
        <input type="hidden" name="POP_TYPE" id="POP_TYPE" value="">
        <input type="hidden" name="USE_BARCODE" id="USE_BARCODE" value="">
<%--        <input type="hidden" name="MATERIAL_TYPE" id="MATERIAL_TYPE" value="">--%>
        <input type="hidden" name="WAREHOUSE_CD" id="WAREHOUSE_CD" value="">
        <input type="hidden" name="LOC_SEQ" id="LOC_SEQ" value="">
        <input type="hidden" name="ITEM_NM" id="ITEM_NM" value="">
        <input type="hidden" name="SIZE_TXT" id="SIZE_TXT" value="">
        <input type="hidden" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" value="">
        <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD" value="">
        <input type="hidden" name="COMP_CD" id="COMP_CD" value="">

        <div class="stockPopupWrap">
            <div class="stockPopupInfo">
                <h3 id="stockPopup_title"><i class="xi-library-bookmark"></i> 재고생성 / 입고</h3>
                <div class="barcode barcode_div" id="footer_barcode">
                    <span class="barcode_label">Please Scan Barcode </span>
                    <span class="barCode">
                        <img src="resource/asset/images/common/img_barcode_long.png" alt="바코드" id="stock_manage_pop_form_barcode_img">
                    </span>
                    <span class="barCodeTxt">
                        <input type="text" class="wd_200 hg_35" name="STOCK_BARCODE_NUM" id="STOCK_BARCODE_NUM" placeholder=""/>
                    </span>
                </div>
                <div id="POP_DRAWING_IMG" class="stockMap">
                    <!--도면-->
                </div>
                <div class="stockPopupBtm">
                    <div class="stockPopupBtmLeft">
                        <div class="stockPopupBtmLeftInfo">
                            <span>작업/재고번호</span>&nbsp;&nbsp;&nbsp;
                            <input type="text" class="stockNum" id="POP_CONTROL_NUM" readonly>
                        </div>
                        <div id="stock_manage_grid03" class="stockPopupBtmLeftTable">
                            <!--grid-->
                        </div>
                    </div>
                    <div class="stockPopupBtmRight">
                        <table>
                            <tr>
                                <th>재고번호</th>
                                <td class="tdBackColor tdWeight" id="POP_INSIDE_STOCK_NUM"></td>
                                <th>구분</th>
                                <td class="tdWeight tdCss" id="POP_GUBUN"></td>
                            </tr>
                            <tr>
                                <th>발주처</th>
                                <td class="edit_td">
                                    <select id="POP_SEL_ORDER_COMP_CD" class="edit_sel">
                                    </select>
                                </td>
                                <th>사업자</th>
                                <td class="edit_td">
                                    <select id="POP_SEL_COMP_CD" class="edit_sel">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>소재</th>
                                <td class="edit_td">
                                    <select id="POP_MATERIAL_DETAIL" class="edit_sel">
                                        <option value="">선택</option>
                                        <c:forEach var="code" items="${HighCode.H_1027}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th>규격</th>
                                <td id="POP_SIZE_TXT" class="edit_td"></td>
                            </tr>
                            <tr>
                                <th>품명</th>
                                <td colspan="3" id="POP_ITEM_NM" class="edit_td"></td>
                            </tr>
                            <tr>
                                <th>입고수량</th>
                                <td colspan="3" class="enterNum">
                                    <i class="xi-minus-circle xi-2x minusBtn" id="inside_stock_qty_minus_btn"></i>
                                    <input type="number" value="0" id="ORDER_QTY">
                                    <i class="xi-plus-circle xi-2x plusBtn" id="inside_stock_qty_plus_btn"></i>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="stockPopupBtnWrap">
                    <button id="stockBtnClose" class="stockBtnClose">닫기</button>
                    <button id="stockPopBtnSave1" class="stockBtnSave">저장</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!--두번째 단계 팝업-->
<div id="stock_pop_location" class="stockPopup2" style="display: none;">
    <div class="stockPopupWrap">
        <div class="stockPopupInfo2">
            <p>입고 위치를 지정해주세요.</p>
            <p>Pleas select the location</p>
            <span class="barCode">
                <img src="resource/asset/images/common/img_barcode_long.png" id="stock_pop_location_barcode_img" alt="바코드">
            </span>
            <span class="barCodeTxt">
                <input type="text" class="wd_200 hg_35" name="POP_LOC_BARCODE_NUM" id="POP_LOC_BARCODE_NUM" placeholder=""/>
            </span>
            <div class="inputWrap">
                <label for="POP_WAREHOUSE">창고</label>
                <select id="POP_WAREHOUSE" class="warehouse">
                    <c:forEach var="vlocale" items="${HighCode.H_1049}">
                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="POP_LOC_SEQ">위치</label>
                <select id="POP_LOC_SEQ" class="where">
                </select>
            </div>
            <div class="stockPopupBtnWrap">
                <button id="stockPopBtnCancel2" class="stockBtnCancel">취소</button>
                <button id="stockPopBtnSave2" class="stockBtnSave2">저장</button>
            </div>
        </div>
    </div>
</div>

<div id="stock_pop_in" class="stockPopup3" style="display: none;">
    <div class="stockPopupWrap">
        <div class="stockPopupInfo3">
            <h3><i class="xi-library-bookmark"></i> 재고생성 / 입고</h3>
            <table>
                <tr>
                    <th>재고번호</th>
                    <td colspan="3" class="tdWeight" id="POP_IN_INSIDE_STOCK_NUM"></td>
                </tr>
                <tr>
                    <th>소재</th>
                    <td id="POP_IN_MATERIAL_DETAIL"></td>
                    <th>규격</th>
                    <td id="POP_IN_SIZE_TXT"></td>
                </tr>
                <tr>
                    <th>구분</th>
                    <td colspan="3" class="tdColor" id="POP_IN_GUBUN"></td>
                </tr>
                <tr>
                    <th>입고수량</th>
                    <td colspan="3" class="tdColor" id="POP_IN_ORDER_QTY"></td>
                </tr>
                <tr>
                    <th>창고/위치</th>
                    <td colspan="3" class="tdColor" id="POP_IN_LOC"></td>
                </tr>
                <tr>
                    <th>남는재고수량</th>
                    <td colspan="3" id="POP_IN_REMAIN_QTY"></td>
                </tr>
            </table>
            <p id="pop_in_txt">입고를 진행하시겠습니까?</p>
            <div class="stockPopupBtnWrap">
                <button id="stockBtnCancel2" class="stockBtnCancel2">취소</button>
                <button id="stockCompleteBtn" class="stockBtnOk">확인(<span id="complete_time">5</span>)</button>
            </div>
        </div>
    </div>
</div>

<div id="completePopup" class="stockSearchPopup" style="display: none">
    <div class="stockPopupWrap">
        <div class="completePopup">
            <table style="height: 100%;">
                <tr>
                    <td width="15%">&nbsp;</td>
                    <td>
                        <h3 style="font-size: 30px;font-weight: bold; text-align: center; color:#4e4b4b;">
                            완료되었습니다.
                        </h3>
                    </td>
                    <td width="15%">&nbsp;</td>
                </tr>
                <tr>
                    <td width="15%">&nbsp;</td>
                    <td style="text-align: center;"><img src="/resource/asset/images/work/icon_4_1.png" width="40px"></td>
                    <td width="15%">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        let testList = '<c:out value="${HighCode.H_1049}"/>';
        let listHigh = [];
        let listJson = {"WARE_HOUSE":[],"MATERIAL_TYPE":[],"LOC_SEQ":[],"ORDER_COMP_CD":[],"COMP_CD":[]};
        <c:forEach var="vlocale" items="${HighCode.H_1049}">
            var tmpJson = {
                "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
                "CODE_CD":"${vlocale.CODE_CD}"
            }
            listJson.WARE_HOUSE.push(tmpJson);
        </c:forEach>

        <c:forEach var="vlocale" items="${HighCode.H_1035}">
        var tmpJson = {
            "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
            "CODE_CD":"${vlocale.CODE_CD}"
        }
        listJson.MATERIAL_TYPE.push(tmpJson);
        </c:forEach>

        let selectedRowIndex = [];

        let stockManageGridId01 = $("#stock_manage_grid"); // 재고관리 메인 그리드
        let stockManageGridId02 = $("#stock_manage_grid02"); //불출요청 현황 그리드
        let stockManageGridId03 = $("#stock_manage_grid03"); // 입고팝업 유사재고 그리드
        let stockManageColModel01;
        let stockManageColModel02;
        let stockManageColModel03;
        let stockManagePostData01;
        let stockManagePostData02;
        let stockManagePostData03;
        let stockManageObj01;
        let stockManageObj02;
        let stockManageObj03;
        var timer;

        let pop_msg_new = "재고를 <b>신규 생성</b>하시겠습니까?";
        let pop_msg_in = "<b>입고</b>를 진행하겠습니까?";
        let pop_msg_out = "<b>불출</b> 진행하겠습니까?";
        let pop_msg_in_done = "<b class=\"block\">입고가 완료되었습니다.</b>추가 진행하려면 바코드를 스캔해주세요";
        let pop_msg_out_done = "<b class=\"block\">불출 완료되었습니다.</b>";

        /**  리스트 그리드 선언 시작 **/
        $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
        stockManagePostData01 = fnFormToJsonArrayData('#stock_manage_form');
        stockManageColModel01 = [
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 130, width: 130, editable: false},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD',  minWidth: 110, width: 110,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({
                        "url" : '/json-list',
                        'data': {'queryId': 'dataSource.getOrderCompanyList'}
                    }),
                },
                editable: function (ui) {return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                postRender:function( ui ){
                    let ordercompcd = ui.rowData.ORDER_COMP_CD;
                    if(typeof ordercompcd != 'undefined' && ordercompcd != null && ordercompcd != '' && ordercompcd.indexOf('CMP') < 0) {
                        $.each(listJson.ORDER_COMP_CD, function (idx,Item) {
                            if(Item.CODE_NM.toUpperCase() == ui.rowData.ORDER_COMP_CD.toUpperCase()) {
                                ui.rowData.ORDER_COMP_CD = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 100, width: 100,
                editable: function (ui) { return gridCellEditable(ui);},
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',editable: function (ui) { return gridCellEditable(ui);},
                minWidth: 100, width: 100,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 170, width: 170,
                editable: function (ui) { return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            },
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '재고수량<br>(EA)', dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', format: '#,###', editable: function (ui) {
                    var isEditable = stockManageGridId01.pqGrid('hasClass',{rowIndx: ui.rowIndx, cls: 'pg-new-row'});
                    if(isEditable) {
                        return true;
                    }else {
                        return false;
                    }
                }
            },

            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1049') },
                postRender:function( ui ){
                    let WHC = ui.rowData.WAREHOUSE_CD;
                    if(typeof WHC != 'undefined' && WHC != null && WHC != '' && WHC.indexOf('WHR') < 0) {
                        $.each(listJson.WARE_HOUSE, function (idx,Item) {
                            if(Item.CODE_NM_KR.toUpperCase() == ui.rowData.WAREHOUSE_CD.toUpperCase()) {
                                ui.rowData.WAREHOUSE_CD = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '재고위치', dataType: 'string', dataIndx: 'LOC_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                        };
                        let ajaxData = "";
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');
                        return ajaxData;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                        };
                        let ajaxData = "";

                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');

                        let index = ajaxData.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ajaxData.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : ajaxData[index].text;
                    }
                },
                postRender:function( ui ){
                    let LS = ui.rowData.LOC_SEQ;
                    let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                    if(typeof LS != 'undefined' && LS != null && LS != '') {
                        $.each(listJson.LOC_SEQ, function (idx,Item) {
                            if(Item.WAREHOUSE_CD == WAREHOUSE_CD && Item.text == ui.rowData.LOC_SEQ) {
                                ui.rowData.LOC_SEQ = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            // {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 150, width: 150,
            //     editable: function (ui) { return gridCellEditable(ui);},
            //     styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            // },
            {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}})
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ],
                postRender:function( ui ){
                    let cmpCd = ui.rowData.COMP_CD;
                    if(typeof cmpCd != 'undefined' && cmpCd != null && cmpCd != '' && cmpCd.indexOf('CMP') < 0) {
                        $.each(listJson.COMP_CD, function (idx,Item) {
                            if(Item.CODE_NM.toUpperCase() == ui.rowData.COMP_CD.toUpperCase()) {
                                ui.rowData.COMP_CD = Item.CODE_CD;
                            }
                        })
                    }
                }

            },
            /*{title: '재질', width: 60, dataIndx: 'MATERIAL_TYPE', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1035')},
                postRender:function( ui ){
                    let mt = ui.rowData.MATERIAL_TYPE;
                    if(typeof mt != 'undefined' && mt != null && mt != '' && mt.indexOf('MTP') < 0) {
                        $.each(listJson.MATERIAL_TYPE, function (idx,Item) {
                            if(Item.CODE_NM_KR.toUpperCase() == ui.rowData.MATERIAL_TYPE.toUpperCase()) {
                                ui.rowData.MATERIAL_TYPE = Item.CODE_CD;
                            }
                        })
                    }
                }
            },*/
            /*{title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },*/
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                    if(typeof ui.cellData == 'undefined' || ui.cellData == '' || ui.cellData == null) {
                        $cell.bind('dblclick', function () {
                            $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $("#common_file_download_form").find("#GFILE_SEQ").val('');
                            $("#common_file_download_form").find("#INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $('#common_cad_file_attach_form').find("#queryId").val('material.manageStockCadFiles')
                            $("#common_file_download_form").find("#TYPE").val('STOCK_UPLOAD');
                            $("#common_file_download_form #deleteYn").val(true);
                            commonFileDownUploadPopupCall('', 'stockFileUpload');
                            // callCadDrawingUploadPopup('inside', 'material.manageStockCadFiles');
                        });
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 100, width: 100, editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '입고/불출', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN_OUT', minWidth: 100, width: 100,
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: false,
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    let inBtn = '';
                    if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                        inBtn = '<button type="button" class="miniBtn blue" id="INSIDE_STOCK_QTY_IN_ACTION">입고</button>' + '&nbsp;';
                    }
                    let outBtn = '';
                    if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                        outBtn = '<button type="button" class="miniBtn brown" id="INSIDE_STOCK_QTY_OUT_ACTION">불출</button>';
                    }
                    return inBtn + outBtn;
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    //let rowData = ui.rowData;
                    $cell.find('#INSIDE_STOCK_QTY_IN_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        $("#stock_manage_form").find("#popType").val("GRID_IN");
                        $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                        $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                        $('#stock_manage_pop').modal('show');
                    });
                    $cell.find('#INSIDE_STOCK_QTY_OUT_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
                            fnAlert(null, "불출할 재고수량이 없습니다.");
                        }else{
                            $("#stock_manage_form").find("#popType").val("GRID_OUT");
                            $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $('#stock_manage_pop').modal('show');
                        }
                    });
                }
            },
            {title: '생성일시', dataType: 'string', dataIndx: 'INSERT_TIME', minWidth: 100, width: 100, editable: false},
            {title: '수정일시', dataType: 'string', dataIndx: 'UPDATE_TIME', minWidth: 100, width: 100, editable: false},
            {
                title: '최근실적', align: 'center', editable: false,
                colModel: [
                    {title: '수/불', dataType: 'String', dataIndx: 'LATEST_STOCK_STATUS', editable: false},
                    {title: '수량', dataType: 'integer', dataIndx: 'LATEST_STOCK_QTY', editable: false},
                    {title: '일시', dataType: 'string', dataIndx: 'LATEST_STOCK_DT', editable: false},
                    {title: '작업번호', dataType: 'string', dataIndx: 'LATEST_STOCK_CONTROL_NUM', minWidth: 140, width: 140, editable: false}
                ]
            }
        ];
        stockManageGridId01.pqGrid({
            height: 438,
            postRenderInterval: -1, //call postRender synchronously.
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: stockManageFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'single'} ,
            selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            copyModel: {render: true},
            colModel: stockManageColModel01,
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
                $("#stockManageFilterColumn").empty();
                $("#stockManageFilterColumn").html(filterOpts);
                $("#stockManageFrozen").empty();
                $("#stockManageFrozen").html(frozenOts);
            },
            cellSave: function (evt, ui) {
                if (ui.dataIndx == "WAREHOUSE_CD_NM" && ui.newVal !== ui.oldVal) {
                    stockManageGridId01.pqGrid("updateRow", { 'rowIndx': ui.rowIndx , row: { 'LOC_SEQ_NM': '' } });
                }
            },
            complete: function () {
                let data = stockManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid_records').html(totalRecords);
            },
            /*rowSelect: function (event, ui) {
                selectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    selectedRowIndex.push(selectList[i].rowIndx);
                }
            },*/
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            },
            change: function (evt, ui) {
                if(ui.source == "edit") {
                    let WAREHOUSE_CD = ui.updateList[0].newRow.WAREHOUSE_CD == undefined ? "" : ui.updateList[0].newRow.WAREHOUSE_CD;
                    if(WAREHOUSE_CD != "") {
                        let rowIndx = ui.updateList[0].rowIndx;
                        stockManageGridId01.pqGrid('updateRow', {rowIndx: rowIndx, row: {"LOC_SEQ": ""}});
                    }
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                /*if (ui.dataIndx == 'DXF_GFILE_SEQ') {
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.DXF_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockManageGridId01, rowIndx, 'DXF_GFILE_SEQ');
                    }

                    return;
                }
                if (ui.dataIndx == 'IMG_GFILE_SEQ') {

                    if (ui.rowData['IMG_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockManageGridId01, rowIndx, 'IMG_GFILE_SEQ');
                    }

                    return;
                }*/
            }
            // ,cellClick: function (event, ui) {
            //     let rowIndx = ui.rowIndx, $grid = this;
            //     if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_IN') {//입고
            //             $("#stock_manage_form").find("#popType").val("GRID_IN");
            //             $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData['INSIDE_STOCK_NUM']);
            //             $('#stock_manage_pop').modal('show');
            //         }
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_OUT') {//출고
            //
            //             if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
            //                 alert("출고할 재고수량이 없습니다.");
            //             }else{
            //                 $("#stock_manage_form").find("#popType").val("GRID_OUT");
            //                 $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData['INSIDE_STOCK_NUM']);
            //                 $('#stock_manage_pop').modal('show');
            //             }
            //         }
            //     }
            // }
        });
        stockManageColModel02 = [
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            // {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: '작업지시번호', align: 'center', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '요청수량', dataType: 'integer', align: 'center', width: 50, dataIndx: 'REQUEST_QTY'},
            {title: '재고번호', minWidth: 120, dataIndx: 'INSIDE_STOCK_NUM'},
            {title: '발주처', minWidth: 110, dataIndx: 'ORDER_COMP_NM'},
            {title: '규격', minWidth: 120, dataIndx: 'SIZE_TXT'},
            {title: '소재종류', minWidth: 100, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '재고수량', width: 50, dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY'},
            {title: '남는수량', width: 50, dataType: 'integer', dataIndx: 'INSIDE_STOCK_REMAIN_QTY'},
            {title: '품명', width: 170, dataIndx: 'ITEM_NM'},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '창고명', align: 'center', width: 100, dataIndx: 'WAREHOUSE_NM'},
            {title: '재고위치', align: 'center', width: 100, dataIndx: 'LOC_NM'},
            {title: '사업자구분', align: 'center', width: 100, dataIndx: 'COMP_CD_NM'},
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false, sortable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: '요청일시', align: 'center', dataType: 'string', width: 100, dataIndx: 'REQUEST_DT'}
        ];


        stockManageObj02 = {
            height: 200, width: "auto", minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15, numberCell: {title: 'No.'},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: g_noData,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            // scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: stockManageColModel02,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_manage_hidden_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dataReady: function (event, ui) {
                let data = stockManageGridId02.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid02_records').html(totalRecords);
            },
            toolbar: false,
        };
        stockManageGridId02.pqGrid(stockManageObj02);


        stockManageColModel03 = [
            {title: 'ITEM_NM', dataType: 'string', dataIndx: 'ITEM_NM', hidden: true},
            {title: 'CONTROL_NUM', dataType: 'string', dataIndx: 'CONTROL_NUM', hidden: true},
            {title: 'SIZE_TXT', dataType: 'string', dataIndx: 'SIZE_TXT', hidden: true},
            {title: 'ORDER_COMP_CD', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {title: 'COLOR', dataType: 'string', dataIndx: 'COLOR', hidden: true},
            {title: 'COMP_CD', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: 'ORG_ORDER_QTY', dataType: 'integer', dataIndx: 'ORG_ORDER_QTY', hidden: true},
            {title: 'ORDER_QTY', dataType: 'integer', dataIndx: 'ORDER_QTY', hidden: true},
            {title: 'POP_STOCK_QTY', dataType: 'integer', dataIndx: 'POP_STOCK_QTY', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'WAREHOUSE_CD', dataType: 'string', dataIndx: 'WAREHOUSE_CD', hidden: true},
            {title: 'LOC_SEQ', dataType: 'integer', dataIndx: 'LOC_SEQ', hidden: true},
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: 'INSIDE_OUT_SEQ', dataType: 'integer', dataIndx: 'INSIDE_OUT_SEQ', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: '구분', minWidth: 80, dataIndx: 'TYPE', editable : false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    let poptype = $("#stock_manage_form").find("#popType").val();
                    var style;

                    if (rowData.COLOR == 'YELLOW') {
                        style = {style: 'background-color: #ffff00; font-weight: bold;'};
                    }else if(rowData.COLOR == 'RED') {
                        style = {style: 'background-color: #660000; font-weight: bold; color:#ffffff;'};
                    }else {
                        style = {style: 'background-color: #9be5ff; color:blue; font-weight: bold;'}
                    }
                    return style;
                }
            },
            {title: '재고번호', minWidth: 90, dataIndx: 'INSIDE_STOCK_NUM', editable : false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(rowData.COLOR == 'RED' && typeof rowData.INSIDE_STOCK_SEQ == 'undefined') {
                        return {style: 'color: red; font-weight: bold;'};
                    }
                }
            },
            {title: '재고수량', width: 70, dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', editable : false},
            // {title: '창고명', align: 'center', width: 100, dataIndx: 'WAREHOUSE_CD_NM'},
            {title: '재고위치', align: 'center', width: 90, dataIndx: 'LOC_NM', editable : false}
        ];
        stockManageObj03 = {
            height: 230, width: "100%", minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15, numberCell: {title: 'No.'},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: g_noData,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            // scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: stockManageColModel03,
            dataModel : {
                data : []
            },
            rowSelect: function (event, ui) {
                var rowData = ui.addList[0].rowData;
                console.log(rowData)
                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoEnter');
                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoOut');
                $("#POP_CONTROL_NUM").removeClass('redText');
                $("#stock_manage_pop_form").find("#ORDER_QTY").attr("disabled", false);
                let popType = $("#stock_manage_form").find("#popType").val();

                $("#POP_INSIDE_STOCK_NUM").html(rowData.INSIDE_STOCK_NUM);
                $("#POP_ITEM_NM").html(rowData.ITEM_NM);
                $("#POP_SIZE_TXT").html(rowData.SIZE_TXT);
                $("#POP_DRAWING_IMG").css({'background':'url(/image/'+ rowData.IMG_GFILE_SEQ+ ')','background-repeat':'no-repeat','background-position':'center','background-size':'866px 424px'});
                $('#POP_SEL_ORDER_COMP_CD option[value='+rowData.ORDER_COMP_CD +']').prop('selected',true);
                $('#POP_SEL_COMP_CD option[value='+rowData.COMP_CD +']').prop('selected',true);
                $('#POP_MATERIAL_DETAIL option[value='+rowData.MATERIAL_DETAIL +']').prop('selected',true);
                if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != '') {
                    $("#stock_manage_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
                }
                if(typeof rowData.CONTROL_DETAIL_SEQ != 'undefined' && rowData.CONTROL_DETAIL_SEQ != '') {
                    $("#stock_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
                }

                if(typeof rowData.INSIDE_STOCK_SEQ != 'undefined') {
                    // $("#stock_manage_pop_form").find("#ORDER_QTY").val(0);
                    if(popType == 'GRID_OUT'|| popType == 'BARCODE_OUT') {
                        $("#POP_GUBUN").html("출고");
                        $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoOut');
                        $("#stock_manage_pop_form").find("#ORDER_QTY").val(rowData.ORDER_QTY);
                    }else {
                        $("#POP_GUBUN").html("입고");
                        $("#stock_manage_pop_form").find("#ORDER_QTY").val(0);
                        $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoEnter');
                    }
                    $(".stockPopupBtmRight .edit_td").addClass('tdBackColor');
                    $(".stockPopupBtmRight .edit_sel").attr("disabled", true);
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val(rowData.INSIDE_STOCK_SEQ);
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val(rowData.INSIDE_STOCK_NUM);
                    $('#POP_WAREHOUSE option[value='+rowData.WAREHOUSE_CD +']').prop('selected',true);
                    $('#POP_LOC_SEQ option[value='+rowData.LOC_SEQ +']').prop('selected',true);
                    $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(rowData.WAREHOUSE_CD);
                    $("#stock_manage_pop_form").find("#LOC_SEQ").val(rowData.LOC_SEQ);
                }else {
                    if(popType == 'GRID_OUT'|| popType == 'BARCODE_OUT') {
                        $("#POP_GUBUN").html('');
                        $("#POP_CONTROL_NUM").addClass('redText');
                        $("#stock_manage_pop_form").find("#ORDER_QTY").attr("disabled", true);
                        $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoOut');
                        $(".stockPopupBtmRight .edit_td").addClass('tdBackColor');
                        $(".stockPopupBtmRight .edit_sel").attr("disabled", true);
                        $("#POP_SEL_ORDER_COMP_CD option:eq(0)").prop("selected", true);
                        $("#POP_SEL_COMP_CD option:eq(0)").prop("selected", true);
                        $("#POP_MATERIAL_DETAIL option:eq(0)").prop("selected", true);
                    }else {
                        $(".stockPopupBtmRight .edit_td").removeClass('tdBackColor');
                        $(".stockPopupBtmRight .edit_sel").attr("disabled", false);
                        $("#POP_GUBUN").html(rowData.TYPE);
                    }
                    $("#stock_manage_pop_form").find("#ORDER_QTY").val(rowData.ORDER_QTY);
                    $("#stock_manage_pop_form").find("#ORG_ORDER_QTY").val(rowData.ORDER_QTY);
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val('');
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val('');
                }
                if($("#stock_manage_pop_form").find("#CONTROL_SEQ").val() != '') {
                    $("#POP_CONTROL_NUM").val(rowData.CONTROL_NUM);
                }else {
                    $("#POP_CONTROL_NUM").val(rowData.INSIDE_STOCK_NUM);
                }
                $("#stock_manage_pop_form").find("#IMG_GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
                $("#stock_manage_pop_form").find("#ITEM_NM").val(rowData.ITEM_NM);
                $("#stock_manage_pop_form").find("#MATERIAL_DETAIL").val(rowData.MATERIAL_DETAIL);
                $("#stock_manage_pop_form").find("#ORDER_COMP_CD").val(rowData.ORDER_COMP_CD);
                $("#stock_manage_pop_form").find("#SIZE_TXT").val(rowData.SIZE_TXT);
                $("#stock_manage_pop_form").find("#COMP_CD").val(rowData.COMP_CD);
                $("#stock_manage_pop_form").find("#POP_STOCK_QTY").val(rowData.POP_STOCK_QTY);
                $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val(rowData.POP_STOCK_QTY_AFTER);

                console.log('CONTROL_SEQ', $("#stock_manage_pop_form").find("#CONTROL_SEQ").val());
            },
            toolbar: false,
        };

        /**  현황관리(GRID01) 그리드 선언 끝 **/

        let gridCellEditable = function(ui){
            let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let INSIDE_STOCK_NUM = rowData["INSIDE_STOCK_NUM"];
            if (INSIDE_STOCK_NUM == null || INSIDE_STOCK_NUM == "" || INSIDE_STOCK_NUM== "undefined" || INSIDE_STOCK_NUM== undefined) {
                return true;
            }else{
                return false;
            }
        }
        let settingPopGrid = function (list) {
            stockManageGridId03.pqGrid('option' , 'dataModel.data',[]);
            stockManageGridId03.pqGrid('refreshView');

            $.each(list, function (idx, Item) {
                // let newRowIndex = stockManageGridId03.pqGrid('option', 'dataModel.data').length + 1;
                stockManageGridId03.pqGrid('addRow', {
                    newRow: Item,
                    rowIndx: idx,
                    checkEditable: false
                })
            });

            stockManageGridId03.pqGrid('refreshView');
            stockManageGridId03.pqGrid('setSelection', {rowIndx: 0});
        }

        $("#stock_pop_in").on({
            'show.bs.modal': function () {
                $("#stock_pop_in").find(".stockPopupInfo3").removeClass('stockPopupEnter');
                $("#stock_pop_in").find(".stockPopupInfo3").removeClass('stockPopupOut');
                document.getElementById('complete_time').innerHTML = 5;
                $("#POP_IN_INSIDE_STOCK_NUM").html($("#POP_INSIDE_STOCK_NUM").text())
                $("#POP_IN_MATERIAL_DETAIL").html($("#POP_MATERIAL_DETAIL option:selected").text())
                $("#POP_IN_SIZE_TXT").html($("#POP_SIZE_TXT").text())
                $("#POP_IN_GUBUN").html($("#POP_GUBUN").text())
                $("#POP_IN_LOC").html($("#POP_WAREHOUSE option:selected").text() +"&emsp;" + $("#POP_LOC_SEQ option:selected").text());
                $("#POP_IN_ORDER_QTY").html($("#stock_manage_pop_form").find("#ORDER_QTY").val());
                $("#POP_IN_REMAIN_QTY").html($("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val());

                let insideSeq = $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val();
                let poptype = $("#stock_manage_form").find("#popType").val();

                if(poptype == 'BARCODE'|| poptype == 'GRID_IN'){
                    if(typeof insideSeq != 'undefined' && insideSeq != '' && insideSeq != null) {
                        $("#stock_pop_in").find(".stockPopupInfo3").addClass('stockPopupEnter');
                    }
                }else if(poptype == 'GRID_OUT'|| poptype == 'BARCODE_OUT') {
                    $("#stock_pop_in").find(".stockPopupInfo3").addClass('stockPopupOut');
                }

                var remainTime = 4;
                timer = setInterval(function (){
                    document.getElementById('complete_time').innerHTML = remainTime;
                    remainTime--;
                    if(remainTime < 0) {
                        clearInterval(timer);
                        document.getElementById('complete_time').innerHTML = 0;
                        $("#stockCompleteBtn").trigger('click');
                    }
                },1000);
            },'hide.bs.modal': function () {

            }
        })
        $("#stock_manage_pop").on({
            'show.bs.modal': function () {
                //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
                stockManageGridId03.pqGrid(stockManageObj03);

                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoEnter');
                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoOut');
                let popType = $("#stock_manage_form").find("#popType").val();

                if(popType == "BARCODE"){
                    $("#stockPopup_title").html("재고생성 / 입고");
                    stockManageGridId03.pqGrid('option' , 'dataModel.data',[]);
                    stockManageGridId03.pqGrid('refreshDataAndView');
                }else if(popType == "GRID_IN"){
                    $("#stockPopup_title").html("재고생성 / 입고");
                    stockManageGridId03.pqGrid('option', 'dataModel.postData', function () {
                        return { 'queryId': 'material.selectInsideStockPopInfo', 'INSIDE_STOCK_SEQ': $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val()};
                    });
                    stockManageGridId03.pqGrid('refreshDataAndView');

                    setTimeout(function () {
                        stockManageGridId03.pqGrid('setSelection', {rowIndx: 0});
                    },150)
                }else if(popType == "GRID_OUT"){
                    $("#stockPopup_title").html("재고 불출");
                    $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoOut');

                    stockManageGridId03.pqGrid('option', 'dataModel.postData', function () {
                        return { 'queryId': 'material.selectInsideStockPopInfo', 'INSIDE_STOCK_SEQ': $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val(), 'TYPE':popType};
                    });
                    stockManageGridId03.pqGrid('refreshDataAndView');

                    setTimeout(function () {
                        stockManageGridId03.pqGrid('setSelection', {rowIndx: 0});
                    },150)
                }else if(popType == "BARCODE_OUT") {
                    $("#stockPopup_title").html("재고 불출");
                    $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoOut');
                    stockManageGridId03.pqGrid('option' , 'dataModel.data',[]);
                    stockManageGridId03.pqGrid('refreshDataAndView');
                }else{
                    fnAlert(null, "error type");
                    return;
                }
            },'hide.bs.modal': function () {
                stockManageGridId03.pqGrid('option' , 'dataModel.data',[]);
                stockManageGridId03.pqGrid('refreshDataAndView');

                $("#POP_SEL_ORDER_COMP_CD option:eq(0)").prop("selected", true);
                $("#POP_SEL_COMP_CD option:eq(0)").prop("selected", true);
                $("#POP_MATERIAL_DETAIL option:eq(0)").prop("selected", true);
                $("#POP_CONTROL_NUM").val('');
                $("#POP_INSIDE_STOCK_NUM").html('');
                $("#POP_GUBUN").html('');
                $("#POP_ITEM_NM").html('');
                $("#POP_SIZE_TXT").html('');
                $("#POP_DRAWING_IMG").css({'background':'url()','background-repeat':'no-repeat','background-position':'center','background-size':'866px 424px'});


                fnResetFrom("stock_manage_pop_form");
                $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
                $("#stock_manage_search_btn").trigger("click");
            }
        })

        $("#stock_manage_search_btn").on('click', function () {
            let SEL_SIZE_SEARCH_TYPE = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE_E_1 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val();
            let SEL_SIZE_SEARCH_TYPE_E_2 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val();
            let SEL_SIZE_SEARCH_TYPE_E_3 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_1 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val();
            let SEL_SIZE_SEARCH_TYPE_R_2 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val();
            let SEL_SIZE_SEARCH_TYPE_R_3 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_4 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val();
            let SEL_SIZE_SEARCH_TYPE_R_5 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val();
            let SEL_SIZE_SEARCH_TYPE_R_6 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val();

            if(SEL_SIZE_SEARCH_TYPE == "1") {//Range
                if (SEL_SIZE_SEARCH_TYPE_R_1 == "" || SEL_SIZE_SEARCH_TYPE_R_2 == "" || SEL_SIZE_SEARCH_TYPE_R_3 == ""
                    || SEL_SIZE_SEARCH_TYPE_R_4 == "" || SEL_SIZE_SEARCH_TYPE_R_5 == "" || SEL_SIZE_SEARCH_TYPE_R_6 == "") {
                    fnAlert(null, "Range 검색을 선택하셨습니다.\n구간 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                if (SEL_SIZE_SEARCH_TYPE_E_1 == "" || SEL_SIZE_SEARCH_TYPE_E_2 == "" || SEL_SIZE_SEARCH_TYPE_E_3 == "") {
                    fnAlert(null, "Equal 검색을 선택하셨습니다.\n각 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }


            stockManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_manage_form');
            } );
            stockManageGridId01.pqGrid("refreshDataAndView");

        });

        $('#stock_manage_add_btn').on('click', function () {

            // stockManageGridId01.pqGrid('addRow', {
            //     newRow: {  },
            //     rowIndx: 0,
            //     checkEditable: true
            // });
            // stockManageGridId01.pqGrid( "addRow",{rowData: {editable: true } });
            stockManageGridId01.pqGrid('addNodes', [{dataIndx: 'INSIDE_STOCK_CURR_QTY', editable:true}], 0);
            stockManageGridId01.pqGrid('addClass', { rowIndx: 0, cls: 'pg-new-row' });

        });
        $("#stock_manage_delete_btn").click(function () {
            if (selectedRowIndex == "" || selectedRowIndex == null) {
                fnAlert(null, "삭제할 데이터를 선택해 주십시오.");
                return;
            }
            let rowCnt = "";
            let INSIDE_STOCK_NUM = "";
            for (let i = 0; i < selectedRowIndex.length; i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                INSIDE_STOCK_NUM += "'" + rowData["INSIDE_STOCK_NUM"] + "',";
            }
            INSIDE_STOCK_NUM = INSIDE_STOCK_NUM.substr(0, INSIDE_STOCK_NUM.length - 1);

            let deleteData = {
                "url": '/json-info',
                'data':
                    {
                        "queryId": 'material.selectInsideStockIn',
                        "INSIDE_STOCK_NUM": INSIDE_STOCK_NUM
                    }
            };
            fnPostAjaxAsync(function (data, callFunctionParam) {
                rowCnt = data.info.CNT;
                // console.log(rowCnt);
            }, deleteData, '');

            if (rowCnt > 0) {
                fnAlert(null, "입고 이력이 존재 합니다.<br>삭제를 위해서 관리자에게 문의 하십시오.");
                return;
            } else {
                fnConfirm(null, "선택한 대상의 모든 정보가 삭제됩니다.<br>진행하시겠습니까?", function () {
                    fnDeletePQGrid(stockManageGridId01, selectedRowIndex, "material.deleteInsideStock_old");
                    $("#stock_manage_search_btn").trigger("click");
                });
            }
        });

        $("#stock_manage_save_btn").click(function (event) {

            if (!fnGridValidation("stock_manage_grid")) {
                fnAlert(null, "그리드의 값이 올바르지 않습니다.");
                return;
            }
            if (false) {
                //to-do 규격 validation
            }
            fnConfirm(null, "저장 하시겠습니까?", function () {

                /*//step 1 java 에서 처리
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex});
                let V_ABBR_NM = "";
                let MATERIAL_DETAIL = rowData["MATERIAL_DETAIL"];
                let selectData1 = {
                    "url" : '/json-info',
                    'data' :
                        {
                            "queryId": 'material.selectInsideStockAbbrNm',
                            "MATERIAL_DETAIL" : MATERIAL_DETAIL
                        }
                };
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    V_ABBR_NM = data.info.ABBR_NM;
                }, selectData1, '');
                if( V_ABBR_NM == null || "" == V_ABBR_NM ){
                    alert("잘못된 접근 입니다.[V_ABBR_NM null]");
                    return;
                }

                //step 2
                let V_INSIDE_STOCK_SEQ = "";
                let ORDER_COMP_CD = rowData["ORDER_COMP_CD"];
                let selectData2 = {
                    "url" : '/json-info',
                    'data' :
                        {
                            "queryId": 'material.selectInsideStockAbbrNm',
                            "ORDER_COMP_CD" : ORDER_COMP_CD,
                            "ABBR_NM" : V_ABBR_NM
                        }
                };
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    V_INSIDE_STOCK_SEQ = data.info.ABBR_NM;
                }, selectData2, '');
                if( V_INSIDE_STOCK_SEQ == null || "" == V_INSIDE_STOCK_SEQ ){
                    alert("잘못된 접근 입니다.[V_INSIDE_STOCK_SEQ null]");
                    return;
                }*/

                //step 3 save
                let gridInstance = stockManageGridId01.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});

                let parameters = {
                    'url': '/managerInsideStock',
                    'data': {"stockGrid": JSON.stringify(changes)}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    console.log(data)
                    if(data.flag) {
                        fnAlert(null, data.message);
                    }else {
                        fnAlert(null, '재고관리 정보가 저장되었습니다.');
                        $("#stock_manage_search_btn").trigger("click");
                    }
                }, parameters, '');

            });
        });
        $('#inside_stock_pop_save_btn').on('click', function () {
            //규격 validation

            $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").val());

            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", false);
            $("#stock_manage_pop_form").find("#LOC_SEQ").attr("disabled", false);

            let parameters = {
                'url': '/managerInsideStockPop',
                'data': $('#stock_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                // console.log(data);
                let footer_msg ="";
                let popType = $("#stock_manage_pop_form").find("#POP_TYPE").val();
                if(popType == "BARCODE"){
                    footer_msg = pop_msg_in_done;
                    $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val(data.INSIDE_STOCK_NUM);
                    $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
                }else if(popType == "GRID_IN"){
                    footer_msg = pop_msg_in_done;
                    $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                    $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
                }else if(popType == "GRID_OUT"){
                    footer_msg = pop_msg_out_done;
                    $('#stock_manage_pop').modal('hide');
                }
            }, parameters, '');


        });
        $('#stock_manage_out_btn').on('click', function () {
            $("#stock_manage_form").find("#popType").val("BARCODE_OUT");
            $('#stock_manage_pop').modal('show');
            $("#stock_manage_pop_form").find("#STOCK_BARCODE_NUM").focus();

        })
        $('#stock_manage_new_btn').on('click', function () {
            $("#stock_manage_form").find("#popType").val("BARCODE");
            $('#stock_manage_pop').modal('show');
            $("#stock_manage_pop_form").find("#STOCK_BARCODE_NUM").focus();
        });

        $('#stock_manage_pop_form').find('.closeBtn').on('click', function () {
            $('#stock_manage_pop').modal('hide');
        });

        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            let WAREHOUSE_CD = this.value;
            let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'material.selectWarehouseLocationList'}};
            fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });

        $("#stock_manage_form").find("#SEL_SIZE_TYPE").change(function(){
            resetSelSizeVal("1");
            displaySelSize();
        });
        $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").change(function(){
            resetSelSizeVal("2");
            displaySelSize();
        });
        let displaySelSize = function(type){
            let SEL_SIZE_TYPE = $("#stock_manage_form").find("#SEL_SIZE_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val();

            if(SEL_SIZE_TYPE == ""){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
            }else if(SEL_SIZE_TYPE =="MSS010"){//일반
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").show();
            }else if(SEL_SIZE_TYPE =="MSS020" || SEL_SIZE_TYPE =="MSS030" || SEL_SIZE_TYPE =="MSS040"){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").hide();
            }


            if(SEL_SIZE_SEARCH_TYPE == ""){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "1"){//Range
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").show();
            }
        }
        let resetSelSizeVal = function(type){
            if(type == "1"){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val("");
            }
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val("");

        }

        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        // fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_LOC_SEQ'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}
        // });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_pop_form').find('#POP_SEL_COMP_CD'), 'sel', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_pop_form').find('#POP_SEL_ORDER_COMP_CD'), 'sel', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        // fnCommCodeDatasourceSelectBoxCreate($('#POP_LOC_SEQ'), 'sel', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}
        // });

        let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}};
        fnPostAjaxAsync(function(data){
            let optText1 = "<option value=''><spring:message code='com.form.top.all.option'/></option>";
            let optText2 = "<option value=''><spring:message code='com.form.top.sel.option'/></option>";

            $.each(data.list,function (idx,Item) {
                optText1 += "<option class='dep2 "+Item.WAREHOUSE_CD +"' value='" + Item.value + "' >" + Item.CODE_NM +"</option>"
                optText2 += "<option class='dep2 "+Item.WAREHOUSE_CD +"' value='" + Item.value + "' >" + Item.CODE_NM +"</option>"
            });
            $("#SEL_LOC_SEQ").html(optText1);
            $("#POP_LOC_SEQ").html(optText2);
            listJson.LOC_SEQ = data.list;
        }, parameters, '');

        let parameters2 = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};
        fnPostAjaxAsync(function(data){
            listJson.ORDER_COMP_CD = data.list;
        }, parameters2, '');

        let parameters3 = {'url': '/json-list', 'data': {'queryId': 'dataSource.getBusinessCompanyList'}};
        fnPostAjaxAsync(function(data){
            listJson.COMP_CD = data.list;
        }, parameters3, '');

        $("#SEL_WAREHOUSE_CD").on('change', function () {
            $("#stock_manage_form").find('.dep2').hide();
            $('#SEL_LOC_SEQ').prop('selectedIndex', 0);
            if($(this).val() != '') {
                $('#SEL_LOC_SEQ').attr('disabled',false);
                $('#SEL_LOC_SEQ > .' + $(this).val()).show();
            }else {
                $("#SEL_LOC_SEQ").attr('disabled',true);
            }
        });

        // 소재종류
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1027}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#stock_manage_form').find('#SEL_MATERIAL_DETAIL').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();

        $("#stock_manage_pop_form #ORDER_QTY").on("keydown", function(e) {
            $(this).val($(this).val().replace(/[^0-9]/g,""));

            let compareQty = $('#stock_manage_pop_form').find('#POP_STOCK_QTY').val();//현재수량
            let outQty = $(this).val();
            let stockQty='';

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN") {//입고
                stockQty = Number(compareQty) + Number(outQty);

            } else {
                if(Number(compareQty) < Number(outQty)){
                    fnAlert(null, "불출 수량을 확인 해 주세요.");
                    $(this).val(outQty.substring(0, outQty.length-1));
                    outQty = $(this).val();
                }
                stockQty = Number(compareQty) - Number(outQty);
            }

            $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val(stockQty);
        });

        $('#inside_stock_qty_plus_btn').on('click', function(e) {
            calcQty("PLUS");
        });
        $('#inside_stock_qty_minus_btn').on('click', function(e) {
            calcQty("MINUS");
        });
        // $('#inside_stock_qty_all_btn').on('click', function(e) {
        //     let ORIGINAL_POP_STOCK_QTY_AFTER = $('#stock_manage_pop_form').find('#ORIGINAL_POP_STOCK_QTY_AFTER').val();
        //     //let ORIGINAL_ORDER_QTY =  $('#stock_manage_pop_form').find('#ORIGINAL_ORDER_QTY').val();
        //
        //     $('#stock_manage_pop_form').find('#ORDER_QTY').val(ORIGINAL_POP_STOCK_QTY_AFTER);
        //     $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(0);
        //
        // });
        let calcQty = function(type){

            let POP_STOCK_QTY = $('#stock_manage_pop_form').find('#POP_STOCK_QTY').val();//현재수량
            let POP_ORDER_QTY = $('#stock_manage_pop_form').find('#ORDER_QTY').val();//입고수량
            let ORG_ORDER_QTY = $('#stock_manage_pop_form').find('#ORG_ORDER_QTY').val();// 원 입고수량
            let CONTROL_SEQ = $('#stock_manage_pop_form').find('#CONTROL_SEQ').val();
            let POP_STOCK_QTY_AFTER = $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val();//변경후수량

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN"){//입고
                if(type == "PLUS"){
                    if(CONTROL_SEQ != '' && parseInt(POP_ORDER_QTY)+1 > ORG_ORDER_QTY) {
                        fnAlert(null,"수량을 확인해 주세요.");
                        return;
                    }else {
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)+1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                    }
                }else if(type == "MINUS"){
                    // console.log("MINUS POP_ORDER_QTY",parseInt(POP_ORDER_QTY));
                    if(parseInt(POP_ORDER_QTY) > 0){
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)-1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                    }
                }
            }else{
                if(CONTROL_SEQ != '') {
                    fnAlert(null,"불출 요청건의 경우 수량을 변경할 수 없습니다.");
                    return;
                }else {
                    if(type == "PLUS"){
                        // if(parseInt(POP_STOCK_QTY_AFTER) > 0){   // 불출
                            POP_ORDER_QTY = parseInt(POP_ORDER_QTY)+1;
                            POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) - POP_ORDER_QTY;
                        // }
                    }else if(type == "MINUS"){
                        //console.log("MINUS POP_ORDER_QTY",parseInt(POP_ORDER_QTY));
                        if(parseInt(POP_ORDER_QTY) > 0 && parseInt(POP_STOCK_QTY) >= parseInt(POP_ORDER_QTY)) {
                            POP_ORDER_QTY = parseInt(POP_ORDER_QTY) - 1;
                            POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) - POP_ORDER_QTY;
                        }
                    }
                }
            }

            $('#stock_manage_pop_form').find('#ORDER_QTY').val(POP_ORDER_QTY);
            $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(POP_STOCK_QTY_AFTER);
        }
        $("#POP_LOC_BARCODE_NUM").on({
            focus: function () {
                $("#stock_pop_location_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#stock_pop_location_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            },
            keydown: function (e) {
                if (e.keyCode == 13) {
                    e.preventDefault();
                    let BARCODE_NUM = fnBarcodeKo2En(this.value);
                    let parameters = {
                        'url': '/json-info',
                        'data': {"LOC_BARCODE":BARCODE_NUM,"queryId":"material.selectWarehouseInfoByLocBarcode"}
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        $('#POP_WAREHOUSE option[value='+data.info.WAREHOUSE_CD +']').prop('selected',true);
                        $('#POP_LOC_SEQ option[value='+data.info.LOC_SEQ +']').prop('selected',true);
                        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(data.info.WAREHOUSE_CD);
                        $("#stock_manage_pop_form").find("#LOC_SEQ").val(data.info.LOC_SEQ);

                        $("#stock_pop_location").find('.dep2').hide();
                        $('#POP_LOC_SEQ').attr('disabled',false);
                        $('#POP_LOC_SEQ > .' + data.info.WAREHOUSE_CD).show();

                        $("#stock_pop_in").modal('show');

                        $("#POP_LOC_BARCODE_NUM").val('');
                    }, parameters, '');
                }
            }
        })
        $("#POP_WAREHOUSE").on('change',function () {
            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val($(this).val());

            $("#stock_pop_location").find('.dep2').hide();
            $('#POP_LOC_SEQ').prop('selectedIndex', 0);
            if($(this).val() != '') {
                $('#POP_LOC_SEQ').attr('disabled',false);
                $('#POP_LOC_SEQ > .' + $(this).val()).show();
            }else {
                $("#POP_LOC_SEQ").attr('disabled',true);
            }
        })

        $("#POP_LOC_SEQ").on('change',function () {
            $("#stock_manage_pop_form").find("#LOC_SEQ").val($(this).val());
        })

        $("#LOCATION_BARCODE_NUM").on({
            focus: function () {
                $("#locationBarcodeImg").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#locationBarcodeImg").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            },
            keydown: function (e) {
                if (e.keyCode == 13) {
                    e.preventDefault();
                    let BARCODE_NUM = fnBarcodeKo2En(this.value);
                    let parameters = {
                        'url': '/json-info',
                        'data': {"LOC_BARCODE":BARCODE_NUM,"queryId":"material.selectWarehouseInfoByLocBarcode"}
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        $('#SEL_WAREHOUSE_CD option[value='+data.info.WAREHOUSE_CD +']').prop('selected',true);
                        $('#SEL_LOC_SEQ option[value='+data.info.LOC_SEQ +']').prop('selected',true);

                        $("#stock_manage_form").find('.dep2').hide();
                        $('#SEL_LOC_SEQ').attr('disabled',false);
                        $('#SEL_LOC_SEQ > .' + data.info.WAREHOUSE_CD).show();

                        $("#stock_manage_search_btn").trigger('click');

                        $("#LOCATION_BARCODE_NUM").val('');
                    }, parameters, '');
                }
            }
        })
        $("#stock_manage_pop_form").find("#STOCK_BARCODE_NUM").on({
            focus: function () {
                $("#stock_manage_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#stock_manage_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            },
            keydown: function (e) {
                if (e.keyCode == 13) {
                    e.preventDefault();
                    // let BARCODE_NUM = $("#stock_manage_pop_form").find("#BARCODE_NUM").val();
                    let BARCODE_NUM = fnBarcodeKo2En(this.value);
                    let barcodeType = BARCODE_NUM.charAt(0).toUpperCase();
                    let poptype = $("#stock_manage_form").find("#popType").val();
                    let tempDataList = [];

                    if(barcodeType == 'C') {
                        if(poptype == 'GRID_OUT'|| poptype == 'BARCODE_OUT') {
                            let parameters = {
                                'url': '/json-info',
                                'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoOutBarcode"}
                            };
                            fnPostAjax(function (data, callFunctionParam) {
                                fnResetFrom("stock_manage_pop_form");
                                tempDataList.push(data.info);

                                if(typeof data.info.INSIDE_OUT_SEQ == 'undefined' || data.info.INSIDE_OUT_SEQ == '') {
                                    let parameters2 = {
                                        'url': '/json-list',
                                        'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcode"}
                                    };
                                    fnPostAjax(function (data2, callFunctionParam) {
                                        if(data2.list.length > 0) {
                                            $.each(data2.list, function (idx, Item) {
                                                tempDataList.push(Item);
                                            })
                                        }
                                        settingPopGrid(tempDataList);
                                    }, parameters2, '');
                                }else {
                                    settingPopGrid(tempDataList);
                                }

                            }, parameters, '');
                        }else {
                            $("#stock_manage_pop_form").find("#USE_BARCODE").val("Y");
                            let parameters = {
                                'url': '/json-list',
                                'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcode"}
                            };

                            fnPostAjax(function (data, callFunctionParam) {
                                fnResetFrom("stock_manage_pop_form");

                                let dataList = data.list;
                                let parameters2 = {
                                    'url': '/json-info',
                                    'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcodeNew"}
                                };
                                fnPostAjax(function (data2, callFunctionParam) {

                                    let dataInfo2 = data2.info;
                                    if(dataInfo2 == null ) {
                                        fnAlert(null, "도면번호가 존재하지 않습니다.");
                                        fnResetFrom("stock_manage_pop_form");
                                        $('#stock_manage_pop').modal('hide');
                                    }else{
                                        if(typeof dataInfo2.ABBR_NM == 'undefined' || dataInfo2.ABBR_NM == '' || dataInfo2.ABBR_NM == null ) {
                                            fnAlert(null,"업체 약어명을 등록해주세요.");
                                            return false;
                                        }else {
                                            tempDataList.push(dataInfo2);
                                        }
                                    }

                                    if(dataList.length > 0) {
                                        $.each(dataList, function (idx, Item) {
                                            tempDataList.push(Item);
                                        })
                                    }
                                    settingPopGrid(tempDataList);
                                }, parameters2, '');
                            }, parameters, '');
                        }
                    }else if(barcodeType == 'S') {
                        fnResetFrom("stock_manage_pop_form");

                        let parameters = {
                            'url': '/json-list',
                            'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfo", 'TYPE':$("#stock_manage_form").find("#popType").val()}
                        };

                        fnPostAjax(function (data, callFunctionParam) {
                            if(data.list.length > 0) {
                                tempDataList = data.list;
                                settingPopGrid(tempDataList);
                            }
                        }, parameters, '');
                    }else {
                        fnAlert(null,"알 수 없는 바코드 타입입니다.");
                        return;
                    }
                    $('#STOCK_BARCODE_NUM').val('');
                }
            }
        });

        $("#stockPopBtnSave1").on('click',function () {
            let controlSeq = $("#stock_manage_pop_form").find("#CONTROL_SEQ").val();
            let insideSeq = $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val();
            let orderQty = $("#stock_manage_pop_form").find("#ORDER_QTY").val();
            let popStockQty = $("#stock_manage_pop_form").find("#POP_STOCK_QTY").val();
            let popType = $("#stock_manage_form").find("#popType").val();
            if(orderQty <= 0) {
                fnAlert("","수량을 입력해주세요");
                return;
            }
            if(popType == 'GRID_OUT' || popType == 'BARCODE_OUT') {
                if(orderQty > popStockQty) {
                    fnConfirm(null,"불출 수량이 재고 수량보다 많습니다. 불출을 진행하시겠습니까?",function () {
                        $("#stock_pop_in").modal('show');
                    })
                }else {
                    $("#stock_pop_in").modal('show');
                }
            }else {
                if(typeof controlSeq != 'undefined' && controlSeq != '' && controlSeq != null) {
                    $("#stock_pop_location").modal('show');
                    setTimeout(function (){
                        $("#POP_LOC_BARCODE_NUM").focus();
                    },50);
                }else if(typeof insideSeq != 'undefined' && insideSeq != '' && insideSeq != null) {
                    $("#stock_pop_in").modal('show');
                }
            }
        })
        $("#stockBtnClose").on('click',function (){
            $("#stock_manage_pop").modal('hide');
        });
        $("#stockBtnCancel2").on('click',function (){
            clearInterval(timer);
            $("#stock_pop_in").modal('hide');
        });
        $("#stockPopBtnCancel2").on('click',function () {
            $("#stock_pop_location").modal('hide');
        })

        $("#stockPopBtnSave2").on('click',function () {
            if($("#POP_LOC_SEQ").val() == '') {
                fnAlert('',"창고 위치를 선택해주세요");
            }else {
                $("#stock_pop_in").modal('show');
            }
        });
        $("#stockCompleteBtn").on('click',function () {
            clearInterval(timer);

            $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").val());

            console.log($('#stock_manage_pop_form').serialize());
            let parameters = {
                'url': '/managerInsideStockPop',
                'data': $('#stock_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                $("#completePopup").modal('show');

                setTimeout(function () {
                    $("#completePopup").modal('hide');
                    $("#stock_pop_in").modal('hide');
                    $("#stock_pop_location").modal('hide');
                    $("#stock_manage_pop").modal('hide');

                    stockManageGridId02.pqGrid('refreshDataAndView');
                },1000);

            }, parameters, '');
        });

        $("#stock_manage_drawing_print_btn").on('click',function () {

            if (selectedRowIndex.length === 0) {
                fnAlert(null, '하나 이상 선택해주세요');
                return false;
            }

            let selectStockList = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                const rowData = stockManageGridId01.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                if(!rowData.IMG_GFILE_SEQ) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                }else {
                    selectStockList += String(rowData.INSIDE_STOCK_SEQ) + '|';
                }
            }

            printJS({printable:'/makeStockDrawingPrint', properties: {selectStockList: selectStockList}, type:'pdf', showModal:true});
        });

        /** 도면 등록 처리 **/
        $('#stock_manage_drawing_new_btn').on('click', function () {
            // callCadDrawingUploadPopup('inside', 'material.manageStockCadFiles');
            drawingUploadPopupWindow('inside', 'material.manageStockCadFiles', '');
        });

        /** 위치정보관리 팝업 호출 */
        $('#stock_manage_area_info_btn').on('click', function () {
            fnCommonWarehouse();
        });
        $('#stockFileUpload').on('click', function () {
            $("#stock_manage_search_btn").trigger('click');
        });

        /** 그리드 필터 **/
        $('#stockManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(stockManageGridId01, 'stockManageFilterKeyword', 'stockManageFilterCondition', 'stockManageFilterColumn');

                let data = stockManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid_records').html(totalRecords);
            },
            'search': function () {
                fnFilterHandler(stockManageGridId01, 'stockManageFilterKeyword', 'stockManageFilterCondition', 'stockManageFilterColumn');

                let data = stockManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid_records').html(totalRecords);
            }
        });

        $("#stockManageFrozen").on('change', function(e){
            fnFrozenHandler(stockManageGridId01, $(this).val());
        });

        function stockManageFilterRender(ui) {
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
                var condition = $("#stockManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#stockManageFilterKeyword").val(),
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

        $('#STOCK_MANAGE_EXCEL_EXPORT').on('click', function () {
            const blob = stockManageGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '재고 관리.xlsx');
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#stock_manage_form').find('#SIZE_TYPE').on('change', function () {
            const $stockManageForm = $('#stock_manage_form');
            $stockManageForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('#SIZE_W').show();
                    $stockManageForm.find('#SIZE_H').show();
                    $stockManageForm.find('#SIZE_T').show();
                    $stockManageForm.find('#SIZE_D').hide();
                    $stockManageForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('#SIZE_W').hide();
                    $stockManageForm.find('#SIZE_H').hide();
                    $stockManageForm.find('#SIZE_T').hide();
                    $stockManageForm.find('#SIZE_D').show();
                    $stockManageForm.find('#SIZE_L').show();
                    break;
                default:
                    $stockManageForm.find('#SIZE_W').show();
                    $stockManageForm.find('#SIZE_H').show();
                    $stockManageForm.find('#SIZE_T').show();
                    $stockManageForm.find('#SIZE_D').hide();
                    $stockManageForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('.for_diabled').attr('disabled',true);
            }
        });
    });
</script>
