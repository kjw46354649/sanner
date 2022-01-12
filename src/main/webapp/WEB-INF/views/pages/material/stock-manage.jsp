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
                        <span class="ipu_wrap">
                            <label class="label_100" for="INSIDE_STOCK_NUM">재고번호</label>
                            <input type="search" class="wd_200" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM" title="재고번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
<%--                        <span class="ipu_wrap">--%>
<%--                            <label class="label_100" for="SEL_CONTROL_NUM">작업번호</label>--%>
<%--                            <input type="search" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="작업번호">--%>
<%--                        </span>--%>
<%--                        <span class="gubun"></span>--%>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
<%--                        <span class="ipu_wrap">--%>
<%--                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재종류</label>--%>
<%--                            <input type="text" class="wd_200" name="SEL_MATERIAL_DETAIL" id="SEL_MATERIAL_DETAIL" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>--%>
<%--                        </span>--%>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP" class="label_100">장비</label>
                            <select id="SEL_EQUIP" name="SEL_EQUIP" title="장비" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
<%--                        <span class="slt_wrap">--%>
<%--                            <label class="label_100" for="material_type">재질</label>--%>
<%--                            <select class="wd_200" name="MATERIAL_TYPE" id="material_type" title="재질">--%>
<%--                                <option value=""><spring:message code="com.form.top.all.option"/></option>--%>
<%--                                <c:forEach var="code" items="${HighCode.H_1035}">--%>
<%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                        </span>--%>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="LOC_SEQ" class="label_100">위치</label>
                            <select id="LOC_SEQ" name="LOC_SEQ" title="재고위치" class="wd_200">
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
                            <span class="slt_wrap defaultSize" id="SIZE_W">
                                <label class="label_8">W</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap defaultSize" id="SIZE_H">
                                <label class="label_8">H</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap defaultSize" id="SIZE_T">
                                <label class="label_8">T</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap dlSize" id="SIZE_D" style="display: none;">
                                <label class="label_8">D</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap dlSize" id="SIZE_L" style="display: none;">
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
        <form class="form-inline" id="stock_in_out_form" name="stock_in_out_form" role="form" style="display: none;">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockInoutHistory">
            <input type="hidden" name="popType" id="popType" value="">
            <input type="hidden" name="V_INSIDE_STOCK_SEQ" id="V_INSIDE_STOCK_SEQ" value="">
            <div class="none_gubunWrap row3_topWrap" >
                <ul>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="INSIDE_STOCK_NUM">재고번호</label>
                            <input type="search" class="wd_200" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM" title="재고번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
<%--                        <span class="ipu_wrap">--%>
<%--                            <label class="label_100" for="SEL_NOTE">비고</label>--%>
<%--                            <input type="search" class="wd_200" name="SEL_NOTE" id="SEL_NOTE" title="비고">--%>
<%--                        </span>--%>
                    </li>
                    <li>
                        <%--                        <span class="ipu_wrap">--%>
                        <%--                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재종류</label>--%>
                        <%--                            <input type="text" class="wd_200" name="SEL_MATERIAL_DETAIL" id="SEL_MATERIAL_DETAIL" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>--%>
                        <%--                        </span>--%>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP" class="label_100">장비</label>
                            <select id="SEL_EQUIP" name="SEL_EQUIP" title="장비" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="LOC_SEQ" class="label_100">위치</label>
                            <select id="LOC_SEQ" name="LOC_SEQ" title="재고위치" class="wd_200">
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
                            <span class="slt_wrap defaultSize" id="SIZE_W">
                                <label class="label_8">W</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap defaultSize" id="SIZE_H">
                                <label class="label_8">H</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap defaultSize" id="SIZE_T">
                                <label class="label_8">T</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap dlSize" id="SIZE_D" style="display: none;">
                                <label class="label_8">D</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap dlSize" id="SIZE_L" style="display: none;">
                                <label class="label_8">L</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_F" id="SIZE_L_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_T" id="SIZE_L_T" placeholder="To" disabled>
                            </span>
                            <span class="gubun"></span>
                            <span class="slt_wrap">
                                <label class="label_100">수행일자</label>
                            </span>
                            <div class="calendar_wrap" style="padding-left: 0px;">
                                <span class="calendar_span">
                                    <input type="text" name="SEL_STOCK_ST_DT" id="SEL_STOCK_ST_DT" placeholder="" value="" title="시작날짜" readonly=""><button type="button">달력선택</button>
                                </span>
                                <span class="nbsp">~</span>
                                <span class="calendar_span">
                                    <input type="text" name="SEL_STOCK_END_DT" id="SEL_STOCK_END_DT" placeholder="" value="" title="종료날짜" readonly=""><button type="button">달력선택</button>
                                </span>
                            </div>
                        </div>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="STOCK_INOUT_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="stock_in_out_search_btn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap jmestabs" id="stock_manage_tabs">
            <ul class="smallTabMenuTabs">
                <li class="active"><a href="#STOCK_MANGE_TAB1" data-toggle="tab" aria-expanded="true">재고관리</a></li>
                <li><a href="#STOCK_MANGE_TAB2" data-toggle="tab" aria-expanded="false">재고 수불이력</a></li>
                <div class="d-inline right_float stock_manage_div" style="margin-top: 2px;">
                    <input type="search" id="stockManageFilterKeyword" placeholder="Enter your keyword">
                    <select id="stockManageFilterColumn" style="display: none;"></select>
                    <select id="stockManageFilterCondition" style="display: none;">
                        <option value="contain">Contains</option>
                    </select>
                    <label for="stockManageFrozen" class="label_30" style="font-size: 12px;">Fix</label>
                    <select id="stockManageFrozen" class="mr-30" name="stockManageFrozen">
                    </select>
                    <%--                <button type="button" class="defaultBtn" id="stock_manage_new_btn">재고 입고</button>--%>
                    <button type="button" class="defaultBtn radius" style="width: 90px;padding: 0 4px;background-color: #336fca;color: white;border-color: #1a5a91;" id="stock_manage_create_control">작업지시생성</button>
                    <button type="button" class="defaultBtn radius" style="width: 60px;padding: 0 4px;" id="regist_stock_equip">장비등록</button>
                    <button type="button" class="defaultBtn radius" style="width: 80px;padding: 0 4px;" id="manage_stock_equip">장비정보관리</button>
                    <button type="button" class="defaultBtn radius" style="width: 100px;padding: 0 4px;" id="stock_manage_regist_drawing">도면등록/교체</button>
                    <button type="button" class="defaultBtn radius mr-20" style="width: 80px;padding: 0 4px;" id="stock_manage_area_info_btn">위치정보관리</button>
                    <button type="button" class="defaultBtn blue radius" style="width: 100px;padding: 0 4px;" id="stock_manage_new_btn">신규생성/입고</button>
                    <button type="button" class="defaultBtn brown radius" id="stock_manage_out_btn">불출</button>
                    <button type="button" class="defaultBtn lightGray radius" id="stock_manage_drawing_print_btn" style="width: 100px;padding: 0 4px;">재고도면 출력</button>
                    <button type="button" class="defaultBtn radius" id="stock_manage_add_btn">추가</button>
                    <button type="button" class="defaultBtn radius red" id="stock_manage_delete_btn">삭제</button>
                    <button type="button" class="defaultBtn radius green" id="stock_manage_save_btn">저장</button>
                </div>
                <div class="d-inline right_float stock_inout_div" style="display: none;margin-top: 2px;">
                    <input type="search" id="stockInoutFilterKeyword" placeholder="Enter your keyword">
                    <select id="stockInoutFilterColumn" style="display: none;"></select>
                    <select id="stockInoutFilterCondition" style="display: none;">
                        <option value="contain">Contains</option>
                    </select>
                    <label for="stockInoutFrozen" class="label_30" style="font-size: 12px;">Fix</label>
                    <select id="stockInoutFrozen" name="stockInoutFrozen">
                    </select>
                </div>
            </ul>
            <div class="tab-content" style="margin-top: 4px;">
                <ul class="active" id="STOCK_MANGE_TAB1">
                    <div class="conMainWrap">
                        <div id="stock_manage_grid"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="stock_manage_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                    <div>
                        <span style="font-size: 1.6rem;font-family: 'NotoKrB';color: #535759">불출 요청 현황</span>
                    </div>
                    <br/>
                    <div class="conWrap">
                        <div id="stock_manage_grid02"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="stock_manage_grid02_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
                <ul class="" id="STOCK_MANGE_TAB2">
                    <div class="conWrap">
                        <div id="stock_in_out_grid"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="stock_in_out_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
            </div>
        </div>
<%--        <div class="hWrap">--%>
<%--        </div>--%>
<%--        <div class="tableWrap" style="padding: 10px 0;">--%>
<%--            <div class="conMainWrap">--%>
<%--                <div id="stock_manage_grid"></div>--%>
<%--                <div class="right_sort">--%>
<%--                    전체 조회 건수 (Total : <span id="stock_manage_grid_records" style="color: #00b3ee">0</span>)--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <span style="font-size: 1.6rem;">불출 요청 현황</span>--%>
<%--            </div>--%>
<%--            <br/>--%>
<%--            <div class="conWrap">--%>
<%--                <div id="stock_manage_grid02"></div>--%>
<%--                <div class="right_sort">--%>
<%--                    전체 조회 건수 (Total : <span id="stock_manage_grid02_records" style="color: #00b3ee">0</span>)--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>

<form id="stock_manage_hidden_form" name="stock_manage_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectStockRequestList"/>
    <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
    <input type="hidden" id="SEL_COMP_CD" name="SEL_COMP_CD"/>
    <input type="hidden" id="INSIDE_STOCK_NUM" name="INSIDE_STOCK_NUM"/>
    <input type="hidden" id="ORDER_COMP_CD" name="ORDER_COMP_CD"/>
    <input type="hidden" id="SEL_ITEM_NM" name="SEL_ITEM_NM"/>
    <input type="hidden" id="WAREHOUSE_CD" name="WAREHOUSE_CD"/>
    <input type="hidden" id="SEL_EQUIP" name="SEL_EQUIP"/>
    <input type="hidden" id="LOC_SEQ" name="LOC_SEQ"/>
    <input type="hidden" id="MATERIAL_DETAIL" name="MATERIAL_DETAIL"/>
    <input type="hidden" id="SIZE_TYPE" name="SIZE_TYPE"/>
    <input type="hidden" id="SIZE_W_F" name="SIZE_W_F"/>
    <input type="hidden" id="SIZE_W_T" name="SIZE_W_T"/>
    <input type="hidden" id="SIZE_H_F" name="SIZE_H_F"/>
    <input type="hidden" id="SIZE_H_T" name="SIZE_H_T"/>
    <input type="hidden" id="SIZE_H_T" name="SIZE_H_T"/>
    <input type="hidden" id="SIZE_T_F" name="SIZE_T_F"/>
    <input type="hidden" id="SIZE_T_T" name="SIZE_T_T"/>
    <input type="hidden" id="SIZE_D_F" name="SIZE_D_F"/>
    <input type="hidden" id="SIZE_D_T" name="SIZE_D_T"/>
    <input type="hidden" id="SIZE_L_F" name="SIZE_L_F"/>
    <input type="hidden" id="SIZE_L_T" name="SIZE_L_T"/>
</form>

<form id="create_stock_control_pop_form" name="create_stock_control_pop_form" method="post">
    <input type="hidden" id="INSIDE_STOCK_SEQ" name="INSIDE_STOCK_SEQ">
</form>

<input type="button" id="stockFileUpload" style="display: none;">
<input type="button" id="stockInoutFileUpload" style="display: none;">

<!--재고생성/입고 팝업-->
<div id="stock_manage_pop" class="stockSearchPopup" style="display: none;">
    <form class="form-inline" id="stock_manage_pop_form" name="stock_manage_pop_form" role="form" onsubmit="return false;">
        <input type="hidden" id="queryId" name="queryId" value="material.selectInsideStockPopInfo">
        <input type="hidden" id="IN_OUT_QTY" name="IN_OUT_QTY" value="0">
        <input type="hidden" id="POP_STOCK_QTY_AFTER" name="POP_STOCK_QTY_AFTER" value="0">
        <input type="hidden" id="POP_STOCK_QTY" name="POP_STOCK_QTY" value="0">
        <input type="hidden" id="ORG_ORDER_QTY" name="ORG_ORDER_QTY" value="0">
        <input type="hidden" id="IMG_GFILE_SEQ" name="IMG_GFILE_SEQ" value="">
        <input type="hidden" id="PDF_GFILE_SEQ" name="PDF_GFILE_SEQ" value="">
        <input type="hidden" id="DXF_GFILE_SEQ" name="DXF_GFILE_SEQ" value="">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="INSIDE_STOCK_SEQ" name="INSIDE_STOCK_SEQ" value="">
        <input type="hidden" id="INSIDE_OUT_SEQ" name="INSIDE_OUT_SEQ" value="">
        <input type="hidden" id="INSIDE_STOCK_NUM" name="INSIDE_STOCK_NUM" value="">
        <input type="hidden" id="TEMP_INSIDE_STOCK_NUM" name="TEMP_INSIDE_STOCK_NUM" value="">
        <input type="hidden" name="POP_TYPE" id="POP_TYPE" value="">
        <input type="hidden" name="USE_BARCODE" id="USE_BARCODE" value="">
<%--        <input type="hidden" name="MATERIAL_TYPE" id="MATERIAL_TYPE" value="">--%>
        <input type="hidden" name="WAREHOUSE_CD" id="WAREHOUSE_CD" value="">
        <input type="hidden" name="LOC_SEQ" id="LOC_SEQ" value="">
        <input type="hidden" name="ITEM_NM" id="ITEM_NM" value="">
        <input type="hidden" name="SIZE_TXT" id="SIZE_TXT" value="">
        <input type="hidden" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" value="">
        <input type="hidden" name="MATERIAL_KIND" id="MATERIAL_KIND" value="">
        <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD" value="">
        <input type="hidden" name="COMP_CD" id="COMP_CD" value="">
        <input type="hidden" name="NOTE" id="NOTE" value="">
        <input type="hidden" name="INFO_TYPE" id="INFO_TYPE" value="">

        <div class="stockPopupWrap">
            <div class="stockPopupInfo">
                <h3 id="stockPopup_title"><i class="xi-library-bookmark"></i> 재고생성 / 입고</h3>
                <div class="searchPopupWrap">
                    <div class="stockMapLeft">
                        <img id="POP_DRAWING_IMG" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-width: 100%;max-height: 100%;">
                    </div>
                    <div class="searchPopupRight">
                        <div class="searchPopupRightTop">
                            <div class="barcode barcode_div" id="footer_barcode">
                                <span class="barcode_label">Please Scan Barcode </span>
                                <span class="barCode">
                                <img src="resource/asset/images/common/img_barcode_long.png" alt="바코드" id="stock_manage_pop_form_barcode_img">
                            </span>
                                <span class="barCodeTxt">
                                <input type="text" class="wd_200 hg_35" name="STOCK_BARCODE_NUM" id="STOCK_BARCODE_NUM" placeholder=""/>
                            </span>
                            </div>
                        </div>
                        <div class="stockPopupBtm">
                            <div class="stockPopupBtmLeft">
                                <div class="stockPopupBtmLeftInfo">
                                    <span>작업/재고번호</span>&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="stockNum" id="POP_CONTROL_NUM" readonly>
                                </div>
                                <div class="stockPopupBtmLeftTable">
                                    <!--grid-->
                                    <div id="stock_manage_grid03" style="font-size: 1.2rem;"></div>
                                </div>
                            </div>
                            <div class="stockPopupBtmRight">
                                <table>
                                    <tr class="trHeight">
                                        <th>재고번호</th>
                                        <td class="tdBackColor tdWeight" id="POP_INSIDE_STOCK_NUM"></td>
                                        <th>구분</th>
                                        <td class="tdWeight tdCss" id="POP_GUBUN"></td>
                                    </tr>
                                    <tr class="trHeight">
                                        <th>발주처</th>
                                        <td class="edit_td">
                                            <select id="POP_SEL_ORDER_COMP_CD" class="edit_sel" style="width: 80%;">
                                            </select>
                                        </td>
                                        <th>사업자</th>
                                        <td class="edit_td">
                                            <select id="POP_SEL_COMP_CD" class="edit_sel">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class="trHeight">
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
                                    <tr class="trHeight">
                                        <th>대칭</th>
                                        <td class="edit_td">
                                            <select id="POP_SAME_SIDE_YN" class="edit_sel">
                                                <option value="">선택</option>
                                                <c:forEach var="code" items="${HighCode.H_1042}">
                                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <th>장비</th>
                                        <td class="edit_td" style="padding-right: 20px;">
                                            <input type="text" class="wd_150 edit_sel" name="POP_STOCK_EQUIP" id="POP_STOCK_EQUIP" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="장비" readonly>
                                        </td>
                                    </tr>
                                    <tr class="trHeight">
                                        <th>품명</th>
                                        <td colspan="3" id="POP_ITEM_NM" class="edit_td"></td>
                                    </tr>
                                    <tr class="trHeight">
                                        <th>비고</th>
                                        <td class="edit_td">
                                            <input id="pop_note_input" type="text" style="border: 0;">
                                        </td>
                                        <th>재고위치</th>
                                        <td class="tdBackColor" id="POP_LOCATION">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th id="pop_qty_txt">입고수량</th>
                                        <td colspan="3" class="enterNum">
                                            <i class="xi-minus-circle xi-2x minusBtn" id="inside_stock_qty_minus_btn"></i>
                                            <input type="number" value="0" id="ORDER_QTY">
                                            <i class="xi-plus-circle xi-2x plusBtn" id="inside_stock_qty_plus_btn"></i>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="stockPopupBtnWrap">
                                <button id="stockBtnClose" class="stockBtnClose">닫기</button>
                                <button id="stockPopBtnSave1" class="stockBtnSave">저장</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<!--두번째 단계 팝업-->
<div id="stock_pop_location" class="stockPopup2" style="display: none;">
    <div class="stockPopupWrap">
        <div class="stockPopupInfo2">
            <div style="height: 33%;">
                <p style="height: 43%;">입고 위치를 지정해주세요.</p>
                <p>Pleas select the location</p>
            </div>
            <div style="height: 17%;">
                <span class="barCode">
                    <img src="resource/asset/images/common/img_barcode_long.png" id="stock_pop_location_barcode_img" alt="바코드">
                </span>
                <input type="text" style="width: 0;height: 0;opacity: 0;padding: 0;" name="POP_LOC_BARCODE_NUM" id="POP_LOC_BARCODE_NUM" placeholder=""/>
            </div>
            <div class="inputWrap" style="height: 11%;">
                <label for="POP_WAREHOUSE">수동지정</label>
                <select id="POP_WAREHOUSE" class="warehouse">
                    <option value="">창고</option>
                    <c:forEach var="vlocale" items="${HighCode.H_1049}">
                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <select id="POP_LOC_SEQ" class="where ml-10">
                </select>
                <input name="LOC_NON_CHECK" id="LOC_NON_CHECK" type="checkbox" style="margin: 0 5px 0 15px;">
                <label for="LOC_NON_CHECK" style="width: 10%;">미지정</label>
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
            <h3 id="pop_in_title"><i class="xi-library-bookmark"></i> 재고생성 / 입고</h3>
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
                    <th id="pop_in_qty">입고수량</th>
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

<div class="popup_container" id="stock_process_popup" style="display: none;">
    <div class="layerPopup" style="width: 760px; height: 500px;">
        <h3>재고 가공현황</h3>
        <hr>
        <button type="button" class="pop_close stock_process_popup_close">닫기</button>
        <form class="form-inline" id="stock_process_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectStockProcessList">
            <input type="hidden" name="INSIDE_STOCK_SEQ" id="INSIDE_STOCK_SEQ" value="">
        </form>
        <div>
            <div id="stock_process_grid"></div>
        </div>
        <div class="text-center mt-15">
            <button class="defaultBtn grayPopGra stock_process_popup_close">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="stock_equip_mapping_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 370px; height: 170px;">
        <h3>장비 편성</h3>
        <button type="button" class="pop_close mt-10 mr-8" data-dismiss="modal">닫기</button>
        <hr>
        <form class="form-inline" id="stock_equip_mapping_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.insertStockEquipMapping">
            <input type="hidden" name="INSIDE_STOCK_SEQ" id="INSIDE_STOCK_SEQ" value="">
            <input type="hidden" name="STOCK_EQUIP_SEQ" id="STOCK_EQUIP_SEQ" value="">
            <div class="d-inline-block align-items-center ml-10 mt-10" style="margin-bottom: 7px;">
                <div>
                    <span class="slt_wrap">
                        <select class="wd_200 mr-20" name="sel_stock_equip_seq" id="sel_stock_equip_seq" style="font-size: 14px;">
                        </select>
                    </span>
                    <button type="button" class="defaultBtn btn-80w green" style="font-size: 14px;" id="regist_stock_equip_mapping">등록</button>
                </div>
            </div>
        </form>
        <hr>
        <div class="text-center" style="margin-top: 8px;">
            <button class="defaultBtn grayPopGra stock_process_popup_close">닫기</button>
        </div>
    </div>
</div>




<script>
    $(function () {
        'use strict';
        let testList = '<c:out value="${HighCode.H_1049}"/>';
        let listHigh = [];
        let listJson = {"WARE_HOUSE":[],"MATERIAL_TYPE":[],"LOC_SEQ":[],"ORDER_COMP_CD":[],"COMP_CD":[],"MATERIAL_DETAIL":[]};
        <c:forEach var="vlocale" items="${HighCode.H_1049}">
        var tmpJson = {
            "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
            "value" : "${vlocale.CODE_CD}",
            "text" : "${vlocale.CODE_NM_KR}",
            "CODE_CD":"${vlocale.CODE_CD}"
        }
        listJson.WARE_HOUSE.push(tmpJson);
        </c:forEach>

        <c:forEach var="vlocale" items="${HighCode.H_1035}">
        var tmpJson = {
            "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
            "value" : "${vlocale.CODE_CD}",
            "text" : "${vlocale.CODE_NM_KR}",
            "CODE_CD":"${vlocale.CODE_CD}"
        }
        listJson.MATERIAL_TYPE.push(tmpJson);
        </c:forEach>

        <c:forEach var="vlocale" items="${HighCode.H_1027}">
        var tmpJson = {
            "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
            "value" : "${vlocale.CODE_CD}",
            "text" : "${vlocale.CODE_NM_KR}",
            "CODE_CD":"${vlocale.CODE_CD}"
        }
        listJson.MATERIAL_DETAIL.push(tmpJson);
        </c:forEach>
        let WAREHOUSE_LIST;
        let warehouseData = {
            "url" : '/json-list',
            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse'}
        };
        fnPostAjaxAsync(function (data, callFunctionParam) {
            WAREHOUSE_LIST = data.list;
        }, warehouseData, '');

        let selectedRowIndex = [];

        let stockManageGridId01 = $("#stock_manage_grid"); // 재고관리 메인 그리드
        let stockManageGridId02 = $("#stock_manage_grid02"); //불출요청 현황 그리드
        let stockManageGridId03 = $("#stock_manage_grid03"); // 입고팝업 유사재고 그리드
        let stockInoutGridId01 = $("#stock_in_out_grid"); // 재고관리 메인 그리드

        let stockManageColModel01;
        let stockManageColModel02;
        let stockManageColModel03;
        let stockInoutColModel01;

        let stockManagePostData01;
        let stockManagePostData02;
        let stockManagePostData03;
        let stockInoutPostData01;

        let stockManageObj01;
        let stockManageObj02;
        let stockManageObj03;
        var timer;

        let today = new Date();
        $('#SEL_STOCK_ST_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_STOCK_END_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_STOCK_ST_DT').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 7));
        $('#SEL_STOCK_END_DT').datepicker('setDate', 'today');

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
            {title: 'INFO_TYPE', dataType: 'string', dataIndx: 'INFO_TYPE', hidden: true},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 100, width: 100, editable: false},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD',  minWidth: 100, width: 100,
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
                ], styleHead: {'font-weight': 'bold','background':'#aac8ed'}
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 100, width: 100,
                editable: function (ui) { return gridCellEditable(ui);},
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',editable: function (ui) { return gridCellEditable(ui);},
                minWidth: 80, width: 80,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#aac8ed'}
            },
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND',
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editable: function (ui) { return gridCellEditable(ui);},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
            },
            {
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 170, width: 170,
                editable: function (ui) { return gridCellEditable(ui);}, styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
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
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {
                title: '재고현황', align: 'center', editable: false,
                colModel: [
                    {title: '요청', dataType: 'integer', dataIndx: 'INSIDE_STOCK_REQUEST_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '재고', dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', minWidth: 40, width: 40, editable: function (ui) {
                            var isEditable = stockManageGridId01.pqGrid('hasClass',{rowIndx: ui.rowIndx, cls: 'pg-new-row'});
                            if(isEditable) {
                                return true;
                            }else {
                                return false;
                            }
                        }
                    },
                    {title: '가공중', dataType: 'integer', dataIndx: 'INSIDE_STOCK_PROCESS_QTY', minWidth: 40, width: 40, editable: false,
                        render: function (ui) {
                            if (ui.cellData > 0)  {
                                return '<span id="processStock" style="cursor: pointer;text-decoration: underline;">'+ui.cellData + '</span>'
                            }else {
                                return ''
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#processStock").bind("click", function () {
                                let rowData = ui.rowData;
                                $("#stock_process_form").find("#INSIDE_STOCK_SEQ").val(rowData.INSIDE_STOCK_SEQ);
                                $('#stock_process_popup').modal('show');
                            });
                        }

                    },
                ]
            },
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                minWidth: 90, width: 90,
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
                minWidth: 80, width: 80,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];

                        if(typeof WAREHOUSE_LIST != 'undefined' && WAREHOUSE_LIST != null && WAREHOUSE_LIST != '') {
                            const warehouseGroup = fnGroupBy(WAREHOUSE_LIST, 'WAREHOUSE_CD');
                            return warehouseGroup[WAREHOUSE_CD];
                        }else {
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
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let ajaxData = "";

                        if(typeof WAREHOUSE_LIST != 'undefined' && WAREHOUSE_LIST != null && WAREHOUSE_LIST != '') {
                            const warehouseGroup = fnGroupBy(WAREHOUSE_LIST, 'WAREHOUSE_CD');
                            ajaxData = warehouseGroup[WAREHOUSE_CD];
                        }else {
                            let warehouseData = {
                                "url" : '/json-list',
                                'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                            };

                            fnPostAjaxAsync(function (data, callFunctionParam) {
                                ajaxData = data.list;
                            }, warehouseData, '');
                        }
                        let text = "";
                        $.each(ajaxData,function (idx,Item) {
                            if(Item.text == cellData || Item.value == cellData) {
                                text = Item.text;
                            }
                        });

                        return (text == '') ? cellData : text;
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
            {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD', minWidth: 80, width: 80, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}})
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ],
            },
            {
                title: '공급단가', width: 80, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
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
                    if(typeof ui.rowData.PDF_GFILE_SEQ == 'undefined' || ui.rowData.PDF_GFILE_SEQ == '' || ui.rowData.PDF_GFILE_SEQ == null) {
                        $cell.bind('dblclick', function () {
                            $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $("#common_file_download_form").find("#GFILE_SEQ").val('');
                            $("#common_file_download_form").find("#INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $('#common_cad_file_attach_form').find("#queryId").val('material.manageStockCadFiles')
                            $("#common_file_download_form").find("#TYPE").val('STOCK_UPLOAD');
                            $("#common_file_download_form #deleteYn").val(true);
                            commonFileDownUploadPopupCall('', 'stockFileUpload');
                        });
                    }
                }
            },
            {title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
                    if(typeof ui.rowData.DXF_GFILE_SEQ == 'undefined' || ui.rowData.DXF_GFILE_SEQ == '' || ui.rowData.DXF_GFILE_SEQ == null) {
                        $cell.bind('dblclick', function () {
                            $("#stock_manage_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $("#common_file_download_form").find("#GFILE_SEQ").val('');
                            $("#common_file_download_form").find("#INSIDE_STOCK_SEQ").val(ui.rowData.INSIDE_STOCK_SEQ);
                            $('#common_cad_file_attach_form').find("#queryId").val('material.manageStockCadFiles')
                            $("#common_file_download_form").find("#TYPE").val('STOCK_UPLOAD');
                            $("#common_file_download_form #deleteYn").val(true);
                            commonFileDownUploadPopupCall('', 'stockFileUpload');
                        });
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 100, width: 100, editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed'}},
            {title: '장비그룹', dataType: 'string', dataIndx: 'STOCK_EQUIP_NM', minWidth: 100, width: 100, editable: false, styleHead: {'align':'center', 'text-align':'center'}},
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
            // {title: '수정일시', dataType: 'string', dataIndx: 'UPDATE_TIME', minWidth: 100, width: 100, editable: false},
            {
                title: '최근실적', align: 'center', editable: false,
                colModel: [
                    {title: '수/불', dataType: 'String', dataIndx: 'LATEST_STOCK_TYPE', editable: false},
                    {title: '수량', dataType: 'integer', dataIndx: 'LATEST_STOCK_QTY', editable: false},
                    {title: '작업번호', dataType: 'string', dataIndx: 'LATEST_STOCK_CONTROL_NUM', minWidth: 140, width: 140, editable: false},
                    {title: '일시', dataType: 'string', dataIndx: 'LATEST_STOCK_DT',minWidth: 100, width: 100, editable: false},
                    {title: '정보입력구분', dataType: 'string', dataIndx: 'INFO_TYPE', minWidth: 140, width: 140, editable: false}
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
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                    if (firstRow === lastRow) {
                        let selRowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: firstRow});
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);
                    }
                }
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let updateListLength = ui.updateList.length;

                    for (let i = 0; i < updateListLength; i++) {
                        let newRowData = ui.updateList[i].newRow;
                        let rowIndx = ui.updateList[i].rowIndx;

                        // 사업자 구분
                        if (newRowData.hasOwnProperty('COMP_CD')) {
                            let index = listJson.COMP_CD.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index < 0) {
                                index = listJson.COMP_CD.findIndex(function (element) {
                                    return element.value === newRowData.COMP_CD;
                                });
                            }
                            stockManageGridId01.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'COMP_CD': listJson.COMP_CD[index].value}
                            });
                        }
                        // 발주업체
                        if (newRowData.hasOwnProperty('ORDER_COMP_CD')) {
                            let index = listJson.ORDER_COMP_CD.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index < 0) {
                                index = listJson.ORDER_COMP_CD.findIndex(function (element) {
                                    return element.value === newRowData.ORDER_COMP_CD;
                                });
                            }
                            stockManageGridId01.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'ORDER_COMP_CD': listJson.ORDER_COMP_CD[index].value}
                            });
                        }
                        // 소재종류
                        if (newRowData.hasOwnProperty('MATERIAL_DETAIL')) {
                            let index = listJson.MATERIAL_DETAIL.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index < 0) {
                                index = listJson.MATERIAL_DETAIL.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_DETAIL;
                                });
                            }
                            stockManageGridId01.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_DETAIL': listJson.MATERIAL_DETAIL[index].value}
                            });
                        }
                    }
                }
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
        });
        stockManageColModel02 = [
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            // {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: '재고번호', minWidth: 100, dataIndx: 'INSIDE_STOCK_NUM', editable: false},
            {title: '발주처', minWidth: 100, dataIndx: 'ORDER_COMP_NM', editable: false},
            {title: '규격', minWidth: 120, dataIndx: 'SIZE_TXT', editable: false},
            {title: '소재종류', minWidth: 80, dataIndx: 'MATERIAL_DETAIL_NM', editable: false},
            {title: '불출요청', dataType: 'integer', align: 'center', width: 50, dataIndx: 'REQUEST_QTY', editable: false},
            {
                title: '재고현황', align: 'center', editable: false,
                colModel: [
                    {title: '예약', dataType: 'integer', dataIndx: 'INSIDE_STOCK_REQUEST_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '현)재고', dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', minWidth: 50, width: 50, editable: function (ui) {
                            var isEditable = stockManageGridId01.pqGrid('hasClass',{rowIndx: ui.rowIndx, cls: 'pg-new-row'});
                            if(isEditable) {
                                return true;
                            }else {
                                return false;
                            }
                        }
                    },
                    {title: '가공중', dataType: 'integer', dataIndx: 'INSIDE_STOCK_PROCESS_QTY', minWidth: 40, width: 40, editable: false,
                        render: function (ui) {
                            if (ui.cellData > 0)  {
                                return '<span id="processStock" style="cursor: pointer;text-decoration: underline;">'+ui.cellData + '</span>'
                            }else {
                                return ''
                            }
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#processStock").bind("click", function () {
                                let rowData = ui.rowData;
                                $("#stock_process_form").find("#INSIDE_STOCK_SEQ").val(rowData.INSIDE_STOCK_SEQ);
                                $('#stock_process_popup').modal('show');
                            });
                        }

                    }
                ]
            },
            {title: '품명', width: 150, dataIndx: 'ITEM_NM', editable: false},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        rowData.CONTROL_PART_NUM = "";
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '창고명', align: 'center', width: 90, dataIndx: 'WAREHOUSE_NM', editable: false},
            {title: '재고위치', align: 'center', width: 90, dataIndx: 'LOC_NM', editable: false},
            {title: '사업자구분', align: 'center', width: 80, dataIndx: 'COMP_CD_NM', editable: false},
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
            {title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
            },
            {
                title: '요청정보', align: 'center', editable: false,
                colModel: [
                    {title: '작업지시번호', align: 'center', width: 160, dataIndx: 'CONTROL_NUM', editable: false},
                    {
                        title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
                    {title: '요청일시', align: 'center', dataType: 'string', width: 100, dataIndx: 'REQUEST_DT', editable: false}
                ]
            },
            // {title: '재고수량', width: 50, dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', editable: false},
            // {title: '남는수량', width: 50, dataType: 'integer', dataIndx: 'INSIDE_STOCK_REMAIN_QTY', editable: false}
        ];


        stockManageObj02 = {
            height: 200, width: "auto", minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15, numberCell: {title: 'No.'},
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: g_noData,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            scrollModel: { autoFit: true },
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
                    selRowData.CONTROL_PART_NUM = "";
                    callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
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
            height: "100%", width: "100%", minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'},
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            swipeModel: {on: false},
            trackModel: {on: true},
            strNoRows: g_noData,
            collapsible: false,
            resizable: false,
            flexWidth: false,
            showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: stockManageColModel03,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_SEQ',
                url: "/paramQueryGridSelect",
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                if(ui.addList.length > 0) {
                    var rowData = ui.addList[0].rowData;
                    // console.log(rowData)
                    if(typeof rowData != 'undefined') {
                        $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoEnter');
                        $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoOut');
                        $("#POP_CONTROL_NUM").removeClass('redText');
                        $("#stock_manage_pop_form").find("#ORDER_QTY").attr("disabled", false);
                        var POP_STOCK_QTY_AFTER = rowData.POP_STOCK_QTY_AFTER;
                        let popType = $("#stock_manage_form").find("#popType").val();

                        $("#POP_INSIDE_STOCK_NUM").html(rowData.INSIDE_STOCK_NUM);
                        $("#POP_ITEM_NM").html(rowData.ITEM_NM);
                        $("#POP_SIZE_TXT").html(rowData.SIZE_TXT);
                        if(typeof rowData.IMG_GFILE_SEQ != 'undefined' && rowData.IMG_GFILE_SEQ != ''){
                            // $("#POP_DRAWING_IMG").css({'background':'url(/image/'+ rowData.IMG_GFILE_SEQ+ ')','background-repeat':'no-repeat','background-position':'center','background-size':'100% 100%'});
                            $("#POP_DRAWING_IMG").attr("src", '/image/' + rowData.IMG_GFILE_SEQ);
                        }else {
                            $("#POP_DRAWING_IMG").attr("src", '/resource/main/blank.jpg');
                        }
                        $('#POP_SAME_SIDE_YN option[value='+rowData.SAME_SIDE_YN +']').prop('selected',true);
                        $('#POP_SEL_ORDER_COMP_CD option[value='+rowData.ORDER_COMP_CD +']').prop('selected',true);
                        $('#POP_SEL_COMP_CD option[value='+rowData.COMP_CD +']').prop('selected',true);
                        $('#POP_MATERIAL_DETAIL option[value='+rowData.MATERIAL_DETAIL +']').prop('selected',true);
                        if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != '') {
                            $("#stock_manage_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
                        }
                        if(typeof rowData.CONTROL_DETAIL_SEQ != 'undefined' && rowData.CONTROL_DETAIL_SEQ != '') {
                            $("#stock_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
                        }
                        if(typeof rowData.INSIDE_OUT_SEQ != 'undefined' && rowData.INSIDE_OUT_SEQ != '') {
                            $("#stock_manage_pop_form").find("#INSIDE_OUT_SEQ").val(rowData.INSIDE_OUT_SEQ);
                        }

                        if(typeof rowData.INSIDE_STOCK_SEQ != 'undefined') {
                            // $("#stock_manage_pop_form").find("#ORDER_QTY").val(0);
                            if(popType == 'GRID_OUT'|| popType == 'BARCODE_OUT') {
                                $("#POP_GUBUN").html("불출");
                                $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoOut');
                                // $("#stock_manage_pop_form").find("#ORDER_QTY").val(rowData.ORDER_QTY);
                            }else {
                                $("#POP_GUBUN").html("입고");
                                // $("#stock_manage_pop_form").find("#ORDER_QTY").val(0);
                                $("#stock_manage_pop").find(".stockPopupInfo").addClass('stockPopupInfoEnter');
                            }
                            $(".stockPopupBtmRight .edit_td").addClass('tdBackColor');
                            $("#pop_note_input").attr("disabled",true);
                            $(".stockPopupBtmRight .edit_sel").attr("disabled", true);
                            $(".stockPopupBtmRight .comboTreeArrowBtn").attr("disabled", true);
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
                                $("#pop_note_input").attr("disabled",true);
                                $(".stockPopupBtmRight .edit_sel").attr("disabled", true);
                                $(".stockPopupBtmRight .comboTreeArrowBtn").attr("disabled", true);
                                $("#POP_SEL_ORDER_COMP_CD option:eq(0)").prop("selected", true);
                                $("#POP_SEL_COMP_CD option:eq(0)").prop("selected", true);
                                $("#POP_MATERIAL_DETAIL option:eq(0)").prop("selected", true);
                            }else {
                                $(".stockPopupBtmRight .edit_td").removeClass('tdBackColor');
                                $(".stockPopupBtmRight .edit_sel").attr("disabled", false);
                                $(".stockPopupBtmRight .comboTreeArrowBtn").attr("disabled", false);
                                $("#pop_note_input").attr("disabled",false);
                                $("#POP_GUBUN").html(rowData.TYPE);
                            }
                            // $("#stock_manage_pop_form").find("#ORDER_QTY").val(rowData.ORDER_QTY);
                            // $("#stock_manage_pop_form").find("#ORG_ORDER_QTY").val(rowData.ORDER_QTY);
                            $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val('');
                            $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val('');
                            if(typeof rowData.INSIDE_STOCK_NUM != 'undefined') {
                                $("#stock_manage_pop_form").find("#TEMP_INSIDE_STOCK_NUM").val(rowData.INSIDE_STOCK_NUM);
                            }
                        }
                        if($("#stock_manage_pop_form").find("#CONTROL_SEQ").val() != '') {
                            $("#POP_CONTROL_NUM").val(rowData.CONTROL_NUM);
                            $("#stock_manage_pop_form").find("#ORDER_QTY").val(rowData.ORDER_QTY);
                            $("#stock_manage_pop_form").find("#ORG_ORDER_QTY").val(rowData.ORDER_QTY);
                        }else {
                            $("#POP_CONTROL_NUM").val(rowData.INSIDE_STOCK_NUM);
                            $("#stock_manage_pop_form").find("#ORDER_QTY").val(0);
                        }
                        $("#stock_manage_pop_form").find("#IMG_GFILE_SEQ").val(((typeof rowData.IMG_GFILE_SEQ != 'undefined')?rowData.IMG_GFILE_SEQ:''));
                        $("#stock_manage_pop_form").find("#PDF_GFILE_SEQ").val(((typeof rowData.PDF_GFILE_SEQ != 'undefined')?rowData.PDF_GFILE_SEQ:''));
                        $("#stock_manage_pop_form").find("#DXF_GFILE_SEQ").val(((typeof rowData.DXF_GFILE_SEQ != 'undefined')?rowData.DXF_GFILE_SEQ:''));
                        $("#stock_manage_pop_form").find("#INFO_TYPE").val(((typeof rowData.INFO_TYPE != 'undefined')?rowData.INFO_TYPE:''));
                        $("#stock_manage_pop_form").find("#ITEM_NM").val(rowData.ITEM_NM);
                        $("#stock_manage_pop_form").find("#MATERIAL_DETAIL").val(rowData.MATERIAL_DETAIL);
                        $("#stock_manage_pop_form").find("#MATERIAL_KIND").val(rowData.MATERIAL_KIND);
                        $("#stock_manage_pop_form").find("#ORDER_COMP_CD").val(rowData.ORDER_COMP_CD);
                        $("#stock_manage_pop_form").find("#SIZE_TXT").val(rowData.SIZE_TXT);
                        $("#stock_manage_pop_form").find("#COMP_CD").val(rowData.COMP_CD);
                        $("#stock_manage_pop_form").find("#pop_note_input").val(((typeof rowData.NOTE != 'undefined')?rowData.NOTE:''));
                        $("#stock_manage_pop_form").find("#POP_LOCATION").text(((typeof rowData.LOC_NM != 'undefined')?rowData.LOC_NM:''));
                        $("#stock_manage_pop_form").find("#POP_STOCK_QTY").val(rowData.POP_STOCK_QTY);
                        $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val(POP_STOCK_QTY_AFTER);
                    }
                }
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
                    $("#POP_DRAWING_IMG").attr("src", '/image/' + selRowData.IMG_GFILE_SEQ);
                }
            },
            toolbar: false,
        };

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
        $("#stock_pop_location").on({
            'show.bs.modal': function () {
                $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val($("#POP_WAREHOUSE :selected").val());
                $("#stock_manage_pop_form").find("#LOC_SEQ").val($("#POP_LOC_SEQ :selected").val());
            }
        });

        $("#stock_pop_in").on({
            'show.bs.modal': function () {
                $("#stock_pop_in").find(".stockPopupInfo3").removeClass('stockPopupEnter');
                $("#stock_pop_in").find(".stockPopupInfo3").removeClass('stockPopupOut');
                document.getElementById('complete_time').innerHTML = 5;
                $("#POP_IN_INSIDE_STOCK_NUM").html($("#POP_INSIDE_STOCK_NUM").text())
                $("#POP_IN_MATERIAL_DETAIL").html($("#POP_MATERIAL_DETAIL option:selected").text())
                $("#POP_IN_SIZE_TXT").html($("#POP_SIZE_TXT").text())
                $("#POP_IN_GUBUN").html($("#POP_GUBUN").text())
                let loc_text = $("#POP_WAREHOUSE option:selected").text() +"&emsp;" + $("#POP_LOC_SEQ option:selected").text();
                if($("#LOC_NON_CHECK").prop('checked')) {
                    loc_text = "미지정";
                }
                $("#POP_IN_LOC").html(loc_text);
                $("#POP_IN_ORDER_QTY").html($("#stock_manage_pop_form").find("#ORDER_QTY").val());
                $("#POP_IN_REMAIN_QTY").html($("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val());

                let insideSeq = $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val();
                let poptype = $("#stock_manage_form").find("#popType").val();

                $("#pop_in_title").html("재고생성 / 입고");
                $("#pop_in_qty").html("입고수량");
                $("#pop_in_txt").html("입고를 진행하시겠습니까?");
                if(poptype == 'BARCODE'|| poptype == 'GRID_IN'){
                    if(typeof insideSeq != 'undefined' && insideSeq != '' && insideSeq != null) {
                        $("#stock_pop_in").find(".stockPopupInfo3").addClass('stockPopupEnter');
                    }
                }else if(poptype == 'GRID_OUT'|| poptype == 'BARCODE_OUT') {
                    $("#pop_in_title").html("재고 불출");
                    $("#pop_in_qty").html("불출수량");
                    $("#pop_in_txt").html("재고 불출을 진행하시겠습니까?");
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
        });


        let stockProcessGrid = $("#stock_process_grid"); // 재고 가공중 그리드
        let stockProcessColModel = [
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 80, width: 80, editable: false},
            {title: '작업번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 140, width: 140, editable: false},
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM) {
                        return '<span id="processDetail" class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 50, width: 50, editable: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM',minWidth: 70, width: 70, editable: false},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY',minWidth: 40, width: 40, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', minWidth: 65, width: 65, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION_NM', minWidth: 70, width: 70, editable: false},
            {title: '작업확정', dataType: 'string', dataIndx: 'CONTROL_STATUS_DT', minWidth: 75, width: 75, editable: false},
            {title: '가공확정', dataType: 'string', dataIndx: 'CONTROL_CONFIRM_DT', minWidth: 80, width: 80, editable: false}
        ];
        let stockProcessObj = {
            height: 365,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            postRenderInterval: -1,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: stockProcessColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        stockProcessGrid.pqGrid(stockProcessObj);

        $("#stock_process_popup").on({
            'show.bs.modal': function () {
                stockProcessGrid.pqGrid('option', 'dataModel.postData', function () {
                    return fnFormToJsonArrayData('stock_process_form')
                });
                if($('#stock_process_grid').hasClass('pq-grid')) {
                    $('#stock_process_grid').pqGrid('refreshDataAndView');
                }
            },'hide.bs.modal': function () {
                fnResetForm("stock_process_form");
            }
        });
        $(".stock_process_popup_close").on('click', function () {
            $("#stock_process_popup").modal('hide');
        });
        let stock_equip_comboTree = null;
        $("#stock_manage_pop").on({
            'show.bs.modal': function () {
                //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
                stockManageGridId03.pqGrid(stockManageObj03);

                if(stock_equip_comboTree != null) {
                    stock_equip_comboTree.clearSelection();
                }

                let equipParamData2 = {
                    'url': '/json-list',
                    'data': {'queryId': 'material.selectStockEquipInfo'}
                }
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    let comboData = [];
                    for(let i=0; i < data.list.length; i++){
                        comboData.push({title: data.list[i].CODE_NM, id: data.list[i].CODE_CD});
                    }

                    stock_equip_comboTree = $('#POP_STOCK_EQUIP').comboTree({
                        source : comboData,
                        isMultiple: true,
                        cascadeSelect: false,
                    });
                }, equipParamData2, '');

                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoEnter');
                $("#stock_manage_pop").find(".stockPopupInfo").removeClass('stockPopupInfoOut');
                let popType = $("#stock_manage_form").find("#popType").val();

                if(popType == "BARCODE"){
                    $("#stockPopup_title").html("재고생성 / 입고");
                    $("#pop_qty_txt").html("입고수량");
                    stockManageGridId03.pqGrid('option' , 'dataModel.data',[]);
                    stockManageGridId03.pqGrid('refreshDataAndView');
                }else if(popType == "GRID_IN"){
                    equipParamData2 = {
                        'url': '/json-list',
                        'data': {'queryId': 'material.selectStockMappingEquip', 'INSIDE_STOCK_SEQ':$("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val()}
                    }
                    fnPostAjaxAsync(function (data, callFunctionParam) {
                        // console.log('GRID_IN',data.list)
                        for(var i=0;i<data.list.length;i++) {
                            $('span[data-id="'+data.list[i].CODE_CD+'"]').trigger('click')
                        }
                    }, equipParamData2, '');

                    $("#stockPopup_title").html("재고생성 / 입고");
                    $("#pop_qty_txt").html("입고수량");
                    stockManageGridId03.pqGrid('option', 'dataModel.postData', function () {
                        return { 'queryId': 'material.selectInsideStockPopInfo', 'INSIDE_STOCK_SEQ': $("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val()};
                    });
                    stockManageGridId03.pqGrid('refreshDataAndView');

                    setTimeout(function () {
                        stockManageGridId03.pqGrid('setSelection', {rowIndx: 0});
                    },250)
                }else if(popType == "GRID_OUT"){
                    equipParamData2 = {
                        'url': '/json-list',
                        'data': {'queryId': 'material.selectStockMappingEquip', 'INSIDE_STOCK_SEQ':$("#stock_manage_pop_form").find("#INSIDE_STOCK_SEQ").val()}
                    }
                    fnPostAjaxAsync(function (data, callFunctionParam) {
                        console.log('GRID_OUT',data.list)
                        for(var i=0;i<data.list.length;i++) {
                            $('span[data-id="'+data.list[i].CODE_CD+'"]').trigger('click')
                        }
                    }, equipParamData2, '');

                    $("#stockPopup_title").html("재고 불출");
                    $("#pop_qty_txt").html("불출수량");
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
                    $("#pop_qty_txt").html("불출수량");
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
                $("#stock_manage_pop_form").find("#POP_LOCATION").text("");
                $("#pop_note_input").val("");
                $("#POP_DRAWING_IMG").attr("src", '/resource/main/blank.jpg');

                fnResetForm("stock_manage_pop_form");
                $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
                $("#stock_manage_search_btn").trigger("click");
            }
        })

        $("#stock_manage_search_btn").on('click', function () {
            stockManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_manage_form');
            } );
            if($('#stock_manage_grid').hasClass('pq-grid')) {
                stockManageGridId01.pqGrid("refreshDataAndView");
            }

            settingForm('stock_manage_form','stock_manage_hidden_form');

            stockManageGridId02.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_manage_hidden_form');
            } );
            if($('#stock_manage_grid02').hasClass('pq-grid')) {
                $("#stock_manage_grid02").pqGrid("refreshDataAndView");
            }

        });

        $('#stock_manage_add_btn').on('click', function () {

            // stockManageGridId01.pqGrid('addRow', {
            //     newRow: {  },
            //     rowIndx: 0,
            //     checkEditable: true
            // });
            // stockManageGridId01.pqGrid( "addRow",{rowData: {editable: true } });
            stockManageGridId01.pqGrid('addNodes', [{dataIndx: 'INSIDE_STOCK_CURR_QTY', editable:true, 'INFO_TYPE': 'STO010'}], 0);
            stockManageGridId01.pqGrid('addClass', { rowIndx: 0, cls: 'pg-new-row' });

        });

        $('#stock_manage_regist_drawing').on('click', function () {
            if (selectedRowIndex.length <= 0) {
                fnAlert(null, "대상을 선택해 주십시오.");
                return;
            }

            let INSIDE_STOCK_SEQ_STR = "";
            for(let i=0;i<selectedRowIndex.length;i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                INSIDE_STOCK_SEQ_STR += "'" + rowData.INSIDE_STOCK_SEQ + "',";
            }
            INSIDE_STOCK_SEQ_STR = INSIDE_STOCK_SEQ_STR.substr(0,INSIDE_STOCK_SEQ_STR.length -1);

            drawingUploadPopupWindow('inside', 'material.manageStockCadFiles', '', INSIDE_STOCK_SEQ_STR);
        });

        let stockEquipPopup;
        $('#manage_stock_equip').on('click', function () {
            let url = '/stockEquip';
            let nWidth = 780;
            let nHeight = 600;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,status=yes';

            if (stockEquipPopup === undefined || stockEquipPopup.closed) {
                stockEquipPopup = window.open(url, '', strOption);
            } else {
                stockEquipPopup.focus();
            }
        })

        let equipParamData = {
            'url': '/json-list',
            'data': {'queryId': 'material.selectStockEquipInfo'}
        }
        fnPostAjaxAsync(function (data, callFunctionParam) {
            let comboData = [];
            for(let i=0; i < data.list.length; i++){
                $('#stock_equip_mapping_form').find('#sel_stock_equip_seq')[0].add(new Option(data.list[i].CODE_NM, data.list[i].CODE_CD));
                $('#stock_in_out_form').find('#SEL_EQUIP')[0].add(new Option(data.list[i].CODE_NM, data.list[i].CODE_CD));
                $('#stock_manage_form').find('#SEL_EQUIP')[0].add(new Option(data.list[i].CODE_NM, data.list[i].CODE_CD));
                comboData.push({title: data.list[i].CODE_NM, id: data.list[i].CODE_CD});
            }

            $('#POP_STOCK_EQUIP').comboTree({
                source : comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        }, equipParamData, '');


        $("#stock_equip_mapping_popup").on({
            'show.bs.modal': function () {
                fnCommCodeDatasourceSelectBoxCreate($('#stock_equip_mapping_form').find('#sel_stock_equip_seq'), '', {
                    'url': '/json-list',
                    'data': {'queryId': 'material.selectStockEquipInfo'}
                }, function() {
                    $("#sel_stock_equip_seq option:eq(0)").prop("selected", true);
                    $("#stock_equip_mapping_form").find("#STOCK_EQUIP_SEQ").val($("#sel_stock_equip_seq option:eq(0)").val());
                });
            }
        });
        $("#stock_equip_mapping_form").find("#sel_stock_equip_seq").change(function(){
            let STOCK_EQUIP_SEQ = this.value;

            $("#stock_equip_mapping_form").find("#STOCK_EQUIP_SEQ").val(STOCK_EQUIP_SEQ);
        });

        $("#regist_stock_equip").on('click', function () {
            if (selectedRowIndex.length <= 0) {
                fnAlert(null, "대상을 선택해 주십시오.");
                return;
            }
            $("#stock_equip_mapping_popup").modal('show');
        });

        $("#regist_stock_equip_mapping").on('click', function () {
            if (selectedRowIndex.length <= 0) {
                fnAlert(null, "대상을 선택해 주십시오.");
                return;
            }

            let STOCK_EQUIP_SEQ = $("#stock_equip_mapping_form").find("#STOCK_EQUIP_SEQ").val();
            let INSIDE_STOCK_SEQ_STR = "";
            let rowList = [];

            for(let i=0;i<selectedRowIndex.length;i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                rowData.STOCK_EQUIP_SEQ = STOCK_EQUIP_SEQ
                rowList.push(rowData);
                INSIDE_STOCK_SEQ_STR += "'" + rowData.INSIDE_STOCK_SEQ + "',";
            }
            INSIDE_STOCK_SEQ_STR = INSIDE_STOCK_SEQ_STR.substr(0,INSIDE_STOCK_SEQ_STR.length -1);

            let parameters = {'url': '/json-list',
                'data': {
                    'queryId': 'material.selectStockEquipExists',
                    'STOCK_EQUIP_SEQ': STOCK_EQUIP_SEQ,
                    'INSIDE_STOCK_SEQ_STR': INSIDE_STOCK_SEQ_STR
                }
            };
            fnPostAjax(function (data, callFunctionParam) {
                const insertQueryList = ['material.insertStockEquipMapping'];
                let changes = {
                    'queryIdList': {
                        'insertQueryId': insertQueryList
                    },
                    'addList' : rowList
                }
                parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

                if(data.list.length > 0) {
                    fnConfirm(null, "이미 등록되어있는 대상이 존재합니다.<br>제외하고 진행하시겠습니까?", function () {
                        fnPostAjax(function (data, callFunctionParam) {
                            fnAlert(null, "저장되었습니다.");
                            $("#stock_equip_mapping_popup").modal('hide');
                        }, parameters, '');
                    })
                }else {
                    fnPostAjax(function (data, callFunctionParam) {
                        fnAlert(null, "저장되었습니다.");
                        $("#stock_equip_mapping_popup").modal('hide');
                    }, parameters, '');
                }
            }, parameters, '');


        });

        $("#stock_manage_delete_btn").click(function () {
            if (selectedRowIndex.length <= 0) {
                fnAlert(null, "삭제할 데이터를 선택해 주십시오.");
                return;
            }
            let rowCnt = "";
            let INSIDE_STOCK_SEQ = "";
            for (let i = 0; i < selectedRowIndex.length; i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                INSIDE_STOCK_SEQ += "'" + rowData["INSIDE_STOCK_SEQ"] + "',";
            }
            INSIDE_STOCK_SEQ = INSIDE_STOCK_SEQ.substr(0, INSIDE_STOCK_SEQ.length - 1);

            // let deleteData = {
            //     "url": '/json-info',
            //     'data':
            //         {
            //             "queryId": 'material.selectInsideStockIn',
            //             "INSIDE_STOCK_SEQ": INSIDE_STOCK_SEQ
            //         }
            // };
            // fnPostAjaxAsync(function (data, callFunctionParam) {
            //     rowCnt = data.info.CNT;
            // }, deleteData, '');

            // if (rowCnt > 0) {
            //     fnAlert(null, "입고 이력이 존재 합니다.<br>삭제를 위해서 관리자에게 문의 하십시오.");
            //     return;
            // } else {
            fnConfirm(null, "선택한 대상의 모든 수불 이력까지 삭제됩니다.<br>진행하시겠습니까?", function () {
                fnDeletePQGrid(stockManageGridId01, selectedRowIndex, "material.deleteInsideStockAll", function () {
                    $("#stock_manage_search_btn").trigger("click");
                });
            });
            // }
        });

        let createStockControlPopup;

        $('#stock_manage_create_control').on('click', function () {
            if (selectedRowIndex.length <= 0) {
                fnAlert(null, "대상을 선택해 주십시오.");
                return;
            }
            let INSIDE_STOCK_SEQ = "";
            for (let i = 0; i < selectedRowIndex.length; i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                INSIDE_STOCK_SEQ += "'" + rowData["INSIDE_STOCK_SEQ"] + "',";
            }
            INSIDE_STOCK_SEQ = INSIDE_STOCK_SEQ.substr(0, INSIDE_STOCK_SEQ.length - 1);

            let createStockForm = document.create_stock_control_pop_form;
            // 팝업 사이즈
            let nWidth = 1400;
            let nHeight = 760;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (createStockControlPopup === undefined || createStockControlPopup.closed) {
                createStockControlPopup = window.open('', 'popForm', strOption);

                $('#create_stock_control_pop_form').find("#INSIDE_STOCK_SEQ").val(INSIDE_STOCK_SEQ);

                createStockForm.action = "/createStockControl";
                createStockForm.target = "popForm";
                createStockForm.submit();

            } else {
                createStockControlPopup.focus();
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
                //step 3 save
                let gridInstance = stockManageGridId01.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});

                let parameters = {
                    'url': '/managerInsideStock',
                    'data': {"stockGrid": JSON.stringify(changes)}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    // console.log(data)
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
        $('#locationBarcodeSpan').on('click', function () {
            $("#LOCATION_BARCODE_NUM").focus();
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

        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_pop_form').find('#POP_SEL_COMP_CD'), 'sel', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_pop_form').find('#POP_SEL_ORDER_COMP_CD'), 'sel', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}};
        fnPostAjaxAsync(function(data){
            let optText1 = "<option value=''><spring:message code='com.form.top.all.option'/></option>";
            let optText2 = "<option value=''>위치</option>";

            $.each(data.list,function (idx,Item) {
                optText1 += "<option class='dep2 "+Item.WAREHOUSE_CD +"' value='" + Item.value + "' >" + Item.CODE_NM +"</option>"
                optText2 += "<option class='dep2 "+Item.WAREHOUSE_CD +"' value='" + Item.value + "' >" + Item.CODE_NM +"</option>"
            });
            $("#LOC_SEQ").html(optText1);
            $("#POP_LOC_SEQ").html(optText2);
            $("#SEL_INOUT_LOC_SEQ").html(optText1);
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

        $("#stock_manage_form").find("#WAREHOUSE_CD").on('change', function () {
            $("#stock_manage_form").find('.dep2').hide();
            $("#stock_manage_form").find('#LOC_SEQ').prop('selectedIndex', 0);
            if($(this).val() != '') {
                $("#stock_manage_form").find('#LOC_SEQ').attr('disabled',false);
                $("#stock_manage_form").find('#LOC_SEQ > .' + $(this).val()).show();
            }else {
                $$("#stock_manage_form").find("#LOC_SEQ").attr('disabled',true);
            }
        });

        $("#POP_SEL_ORDER_COMP_CD").on('change', function () {
            if($(this).val() != '') {
                $("#stock_manage_pop_form").find("#ORDER_COMP_CD").val($(this).val())
            }
        });

        $("#POP_SEL_COMP_CD").on('change', function () {
            if($(this).val() != '') {
                $("#stock_manage_pop_form").find("#COMP_CD").val($(this).val())
            }
        });
        $("#POP_MATERIAL_DETAIL").on('change', function () {
            if($(this).val() != '') {
                $("#stock_manage_pop_form").find("#MATERIAL_DETAIL").val($(this).val())
            }
        });

        // 소재종류
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1027}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            // $('#stock_manage_form').find('#SEL_MATERIAL_DETAIL').comboTree({
            //     source: comboData,
            //     isMultiple: true,
            //     cascadeSelect: false
            // });
            // $('#stock_in_out_form').find('#SEL_MATERIAL_DETAIL').comboTree({
            //     source: comboData,
            //     isMultiple: true,
            //     cascadeSelect: false
            // });
        })();

        $("#stock_manage_pop_form #ORDER_QTY").on("keyup", function(e) {
            $(this).val($(this).val().replace(/[^0-9]/g,""));

            let compareQty = $('#stock_manage_pop_form').find('#POP_STOCK_QTY').val();//현재수량
            let CONTROL_SEQ = $('#stock_manage_pop_form').find('#CONTROL_SEQ').val();
            let INSIDE_OUT_SEQ = $('#stock_manage_pop_form').find('#INSIDE_OUT_SEQ').val();
            let ORG_ORDER_QTY = parseInt($('#stock_manage_pop_form').find('#ORG_ORDER_QTY').val());// 원 입고수량
            let outQty = $(this).val();
            let stockQty;

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN") {//입고
                // if(CONTROL_SEQ != '' && parseInt(outQty) > ORG_ORDER_QTY) {
                //     fnAlert(null,"수량을 확인해 주세요.");
                //     $(this).val(ORG_ORDER_QTY);
                //     return;
                // }else {
                    stockQty = Number(compareQty) + Number(outQty); // 21.10.21 입고시 수량제한 X
                // }
            } else {
                if(CONTROL_SEQ != '' && INSIDE_OUT_SEQ != '') {
                    fnAlert(null,"불출 요청건의 경우 수량을 변경할 수 없습니다.");
                    $(this).val(ORG_ORDER_QTY);
                    return false;
                }else {
                    if(Number(compareQty) < Number(outQty)){
                        fnAlert(null, "불출 수량을 확인 해 주세요.");
                        $(this).val(outQty.substring(0, outQty.length-1));
                        outQty = $(this).val();
                    }
                    stockQty = Number(compareQty) - Number(outQty);
                }
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

            let POP_STOCK_QTY = parseInt($('#stock_manage_pop_form').find('#POP_STOCK_QTY').val());//현재수량
            let POP_ORDER_QTY = parseInt($('#stock_manage_pop_form').find('#ORDER_QTY').val());//입고수량
            let ORG_ORDER_QTY = parseInt($('#stock_manage_pop_form').find('#ORG_ORDER_QTY').val());// 원 입고수량
            let CONTROL_SEQ = $('#stock_manage_pop_form').find('#CONTROL_SEQ').val();
            let INSIDE_OUT_SEQ = $('#stock_manage_pop_form').find('#INSIDE_OUT_SEQ').val();
            let POP_STOCK_QTY_AFTER = parseInt($("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val());//변경후수량

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN"){//입고
                if(type == "PLUS"){
                    // if(CONTROL_SEQ != '' && parseInt(POP_ORDER_QTY)+1 > ORG_ORDER_QTY) {
                    //     fnAlert(null,"수량을 확인해 주세요.");
                    //     return;
                    // }else {
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)+1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                    // }
                }else if(type == "MINUS"){
                    // console.log("MINUS POP_ORDER_QTY",parseInt(POP_ORDER_QTY));
                    if(parseInt(POP_ORDER_QTY) > 0){
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)-1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                    }
                }
            }else{
                if(CONTROL_SEQ != '' && INSIDE_OUT_SEQ != '') {
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
                        if(parseInt(POP_ORDER_QTY) > 0) {
                            POP_ORDER_QTY = parseInt(POP_ORDER_QTY) - 1;
                            POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) - POP_ORDER_QTY;
                        }
                    }
                }
            }
            $('#stock_manage_pop_form').find('#ORDER_QTY').val(POP_ORDER_QTY);
            $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(POP_STOCK_QTY_AFTER);
        }
        $("#stock_pop_location_barcode_img").on("click",function () {
            $("#POP_LOC_BARCODE_NUM").focus();
        })
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
                        console.log(data.info)
                        if(data.info != null) {
                            $('#POP_WAREHOUSE option[value='+data.info.WAREHOUSE_CD +']').prop('selected',true);
                            $('#POP_LOC_SEQ option[value='+data.info.LOC_SEQ +']').prop('selected',true);
                            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(data.info.WAREHOUSE_CD);
                            $("#stock_manage_pop_form").find("#LOC_SEQ").val(data.info.LOC_SEQ);

                            $("#stock_pop_location").find('.dep2').hide();
                            $('#POP_LOC_SEQ').attr('disabled',false);
                            $('#POP_LOC_SEQ > .' + data.info.WAREHOUSE_CD).show();

                            $("#stock_pop_in").modal('show');
                        }else {
                            fnAlert(null,"바코드 정보를 확인해주세요.");
                        }

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

        $("#LOC_NON_CHECK").on('click', function () {
            if($(this).prop('checked')) {
                $('#POP_WAREHOUSE').val('').prop('selected', true);
                $('#POP_LOC_SEQ').val('').prop('selected', true);
                $("#stock_manage_pop_form").find("#LOC_SEQ").val('');
                $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val('');
            }

            $("#POP_WAREHOUSE").prop("disabled", $(this).prop('checked'));
            $("#POP_LOC_SEQ").prop("disabled", $(this).prop('checked'));
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
                        $("#stock_manage_form").find('#WAREHOUSE_CD option[value='+data.info.WAREHOUSE_CD +']').prop('selected',true);
                        $("#stock_manage_form").find('#LOC_SEQ option[value='+data.info.LOC_SEQ +']').prop('selected',true);

                        $("#stock_manage_form").find('.dep2').hide();
                        $("#stock_manage_form").find('#LOC_SEQ').attr('disabled',false);
                        $("#stock_manage_form").find('#LOC_SEQ > .' + data.info.WAREHOUSE_CD).show();

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
                                fnResetForm("stock_manage_pop_form");
                                tempDataList.push(data.info);

                                if(typeof data.info.INSIDE_OUT_SEQ == 'undefined' || data.info.INSIDE_OUT_SEQ == '') {
                                    let parameters2 = {
                                        'url': '/json-list',
                                        'data': {"TYPE":poptype,"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcode"}
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
                            let parameters3 = {
                                'url': '/json-info',
                                'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockNumBarcodeIn"}
                            };
                            fnPostAjax(function (data3, callFunctionParam) {
                                if(data3.info != null) {
                                    $("#stockPopup_title").html("재고생성 / 입고");
                                    $("#pop_qty_txt").html("입고수량");
                                    stockManageGridId03.pqGrid('option', 'dataModel.postData', function () {
                                        return { 'queryId': 'material.selectInsideStockPopInfo', 'INSIDE_STOCK_SEQ': data3.info.INSIDE_STOCK_SEQ,
                                            'CONTROL_SEQ':data3.info.CONTROL_SEQ, 'CONTROL_DETAIL_SEQ':data3.info.CONTROL_DETAIL_SEQ,
                                            'ORDER_QTY':data3.info.ORDER_QTY
                                        };
                                    });
                                    stockManageGridId03.pqGrid('refreshDataAndView');

                                    setTimeout(function () {
                                        stockManageGridId03.pqGrid('setSelection', {rowIndx: 0});
                                    },150)
                                    $("#stock_manage_pop_form").find("#USE_BARCODE").val("Y");
                                }else {
                                    let parameters = {
                                        'url': '/json-list',
                                        'data': {"TYPE":poptype,"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcode"}
                                    };

                                    fnPostAjax(function (data, callFunctionParam) {
                                        fnResetForm("stock_manage_pop_form");

                                        let dataList = data.list;
                                        let parameters2 = {
                                            'url': '/json-info',
                                            'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcodeNew"}
                                        };
                                        fnPostAjax(function (data2, callFunctionParam) {
                                            let dataInfo2 = data2.info;
                                            if(dataInfo2 == null ) {
                                                fnAlert(null, "도면번호가 존재하지 않습니다.");
                                                fnResetForm("stock_manage_pop_form");
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
                            }, parameters3, '');

                        }
                    }else if(barcodeType == 'S') {
                        fnResetForm("stock_manage_pop_form");

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
            let orderQty = parseInt($("#stock_manage_pop_form").find("#ORDER_QTY").val());
            let popStockQty = parseInt($("#stock_manage_pop_form").find("#POP_STOCK_QTY").val());
            let popType = $("#stock_manage_form").find("#popType").val();
            if(orderQty <= 0) {
                fnAlert("","수량을 입력해주세요");
                return;
            }
            if(popType == 'GRID_OUT' || popType == 'BARCODE_OUT') {
                if((typeof controlSeq != 'undefined' && controlSeq != '')|| (typeof insideSeq != 'undefined' && insideSeq != '')){
                    if(orderQty > popStockQty) {
                        fnAlert(null,"불출 수량이 재고 수량보다 많습니다. 수량 확인바랍니다.");
                        return;
                    }else {
                        $("#stock_pop_in").modal('show');
                    }
                }else {
                    fnAlert("","불출 정보를 확인해주세요.");
                    return;
                }
            }else {
                if (typeof insideSeq != 'undefined' && insideSeq != '' && insideSeq != null) {
                    $("#stock_pop_in").modal('show');
                } else if (typeof controlSeq != 'undefined' && controlSeq != '' && controlSeq != null) {
                    $("#stock_pop_location").modal('show');
                    setTimeout(function () {
                        $("#POP_LOC_BARCODE_NUM").focus();
                    }, 50);
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
            if(!$("#LOC_NON_CHECK").prop('checked') && $("#POP_LOC_SEQ").val() == '') {
                fnAlert('',"창고 위치를 선택해주세요");
            }else {
                $("#stock_pop_in").modal('show');
            }
        });
        $("#stockCompleteBtn").on('click',function () {
            clearInterval(timer);

            $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").val());
            $("#stock_manage_pop_form").find("#NOTE").val($("#pop_note_input").val());

            let parameters = {
                'url': '/managerInsideStockPop',
                'data': $('#stock_manage_pop_form').serialize()
            };
            // console.log($('#stock_manage_pop_form').serialize());
            fnPostAjax(function (data, callFunctionParam) {
                if(data.flag) {
                    fnAlert(null,data.message);
                }else {
                    $("#completePopup").modal('show');

                    setTimeout(function () {
                        $("#completePopup").modal('hide');
                        $("#stock_pop_in").modal('hide');
                        $("#stock_pop_location").modal('hide');
                        $("#stock_manage_pop").modal('hide');

                        stockManageGridId02.pqGrid('refreshDataAndView');
                    },1000);
                }

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

        $("#stock_manage_tabs").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                if(ui.newPanel.selector == "#STOCK_MANGE_TAB1") {
                    $(".stock_manage_div").show();
                    $(".stock_inout_div").hide();
                    $("#stock_in_out_form").hide();
                    $("#stock_manage_form").show();
                    settingForm('stock_in_out_form','stock_manage_form');
                }else {
                    $(".stock_manage_div").hide();
                    $(".stock_inout_div").show();
                    $("#stock_in_out_form").show();
                    $("#stock_manage_form").hide();
                    settingForm('stock_manage_form','stock_in_out_form')
                    // $("#sales_status_save_id").hide();
                    // $(".month_sale_status_tab").show();
                }
            }
        });
        function settingForm(formId, targetFormId) {
            let arr = [
                'INSIDE_STOCK_NUM', 'ORDER_COMP_CD', 'SEL_COMP_CD', 'SEL_ITEM_NM', 'MATERIAL_DETAIL', 'SEL_EQUIP',
                'WAREHOUSE_CD', 'LOC_SEQ', 'SIZE_TYPE', 'SIZE_W_F', 'SIZE_W_T', 'SIZE_H_F', 'SIZE_H_T', 'SIZE_T_F',
                'SIZE_T_T', 'SIZE_D_F', 'SIZE_D_T', 'SIZE_L_F', 'SIZE_L_T'
            ];

            for(var i=0;i<arr.length;i++) {
                $("#"+targetFormId).find("#"+arr[i]).val($("#"+formId).find("#"+arr[i]).val());
            }
        }

        $('#stock_manage_form').find('#SIZE_TYPE').on('change', function () {
            const $stockManageForm = $('#stock_manage_form');
            $stockManageForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('.defaultSize').show();
                    $stockManageForm.find('.dlSize').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('.defaultSize').hide();
                    $stockManageForm.find('.dlSize').show();
                    break;
                default:
                    $stockManageForm.find('.defaultSize').show();
                    $stockManageForm.find('.dlSize').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockManageForm,resetArr)
                    $stockManageForm.find('.for_diabled').attr('disabled',true);
            }
        });

        // 재고 수불이력 관련 --

        $("#stock_in_out_form").find("#queryId").val("material.selectInsideStockInoutHistory");
        stockInoutPostData01 = fnFormToJsonArrayData('#stock_in_out_form');
        stockInoutColModel01 = [
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: 'TYPE_CODE', dataType: 'string', dataIndx: 'TYPE_CODE', hidden: true},
            {title: 'SEQ', dataType: 'integer', dataIndx: 'SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '수행일시', dataType: 'string', dataIndx: 'INSERT_TIME', minWidth: 100, width: 100, editable: false},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 100, width: 100, editable: false},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        rowData.CONTROL_PART_NUM = "";
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', editable: false,
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
            {title: '재고위치', dataType: 'string', dataIndx: 'LOC_SEQ', editable: false,
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];

                        if(typeof WAREHOUSE_LIST != 'undefined' && WAREHOUSE_LIST != null && WAREHOUSE_LIST != '') {
                            const warehouseGroup = fnGroupBy(WAREHOUSE_LIST, 'WAREHOUSE_CD');
                            return warehouseGroup[WAREHOUSE_CD];
                        }else {
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
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let ajaxData = "";

                        if(typeof WAREHOUSE_LIST != 'undefined' && WAREHOUSE_LIST != null && WAREHOUSE_LIST != '') {
                            const warehouseGroup = fnGroupBy(WAREHOUSE_LIST, 'WAREHOUSE_CD');
                            ajaxData = warehouseGroup[WAREHOUSE_CD];
                        }else {
                            let warehouseData = {
                                "url" : '/json-list',
                                'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                            };

                            fnPostAjaxAsync(function (data, callFunctionParam) {
                                ajaxData = data.list;
                            }, warehouseData, '');
                        }
                        let text = "";
                        $.each(ajaxData,function (idx,Item) {
                            if(Item.text == cellData || Item.value == cellData) {
                                text = Item.text;
                            }
                        });

                        return (text == '') ? cellData : text;
                    }
                },
                postRender:function( ui ){
                    let LS = ui.rowData.LOC_SEQ;
                    let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                editable: false,
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
                editable: false
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',editable: false,
                minWidth: 100, width: 100,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                }
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 150, width: 150,
                editable: false
            },
            // {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD', minWidth: 100, width: 100, editable: false,
            //     editor: {
            //         type: 'select',
            //         valueIndx: "value",
            //         labelIndx: "text",
            //         options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}})
            //     },
            //     postRender:function( ui ){
            //         let cmpCd = ui.rowData.COMP_CD;
            //         if(typeof cmpCd != 'undefined' && cmpCd != null && cmpCd != '' && cmpCd.indexOf('CMP') < 0) {
            //             $.each(listJson.COMP_CD, function (idx,Item) {
            //                 if(Item.CODE_NM.toUpperCase() == ui.rowData.COMP_CD.toUpperCase()) {
            //                     ui.rowData.COMP_CD = Item.CODE_CD;
            //                 }
            //             })
            //         }
            //     }
            // },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 100, width: 100, editable: false},
            {title: '수불<br>구분', dataType: 'string', dataIndx: 'TYPE', minWidth: 40, width: 40, editable: false},
            {title: '수량', dataType: 'integer', dataIndx: 'QTY', format: '#,###', editable: false},
            {
                title: '연계 작업번호', align: 'center', editable: false,
                colModel: [
                    {title: '작업번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 140, width: 140, editable: false},
                    {title: '요청수량', dataType: 'integer', dataIndx: 'REQUEST_QTY', editable: false}
                ]
            },
            {title: '정보입력구분', dataType: 'string', dataIndx: 'INFO_TYPE', minWidth: 100, width: 100, editable: false},
            {title: '', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN_OUT', minWidth: 60, width: 60, editable: false,
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    if(rowData.LATEST_YN == '1') {
                        return '<button type="button" class="miniBtn black" id="INSIDE_STOCK_QTY_CANCEL_ACTION">취소</button>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#INSIDE_STOCK_QTY_CANCEL_ACTION').bind('click', function(e) {
                        e.preventDefault();

                        fnConfirm(null, "해당 이력을 삭제하시겠습니까?", function () {
                            let parameters = {
                                'url': '/json-info',
                                'data': {"SEQ":rowData.SEQ, "INSIDE_STOCK_SEQ":rowData.INSIDE_STOCK_SEQ, "queryId":"material.selectInsideStockCheckIn"}
                            };
                            if(rowData.TYPE_CODE == 'OUT') {
                                parameters.data.queryId = "material.selectInsideStockCheckOut";
                            }
                            fnPostAjax(function (data, callFunctionParam) {
                                // console.log(data);
                                if(data.info != null && data.info.flag == 1) {

                                    let parameters2 = {
                                        'url': '/cancelInsideStock',
                                        'data': rowData
                                    };
                                    fnPostAjax(function (data, callFunctionParam) {
                                        if(data.flag) {
                                            fnAlert(null, "오류가 발생하였습니다.");
                                        }else {
                                            fnAlert(null, "삭제 되었습니다.");
                                            $("#stock_in_out_search_btn").trigger('click');
                                        }
                                    }, parameters2, '');
                                }else {
                                    fnAlert(null, "삭제 불가합니다.");
                                }
                            }, parameters, '');
                        });
                    });
                }
            }
        ];
        stockInoutGridId01.pqGrid({
            height: 700,
            postRenderInterval: -1, //call postRender synchronously.
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_in_out_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: stockInoutFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            // selectionModel: { type: 'cell', mode: 'multiple'} ,
            scrollModel: {autoFit: true},
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            copyModel: {render: true},
            colModel: stockInoutColModel01,
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
                $("#stockInoutFilterColumn").empty();
                $("#stockInoutFilterColumn").html(filterOpts);
                $("#stockInoutFrozen").empty();
                $("#stockInoutFrozen").html(frozenOts);
            },
            cellSave: function (evt, ui) {
                if (ui.dataIndx == "WAREHOUSE_CD_NM" && ui.newVal !== ui.oldVal) {
                    stockInoutGridId01.pqGrid("updateRow", { 'rowIndx': ui.rowIndx , row: { 'LOC_SEQ_NM': '' } });
                }
            },
            complete: function () {
                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            },
            // selectChange: function (event, ui) {
            //     selectedRowIndex = [];
            //     for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
            //         let firstRow = ui.selection._areas[i].r1;
            //         let lastRow = ui.selection._areas[i].r2;
            //
            //         for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
            //     }
            // },
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
                    selRowData.CONTROL_PART_NUM = "";
                    callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                }
            },
            // change: function (evt, ui) {
            //     if(ui.source == "edit") {
            //         let WAREHOUSE_CD = ui.updateList[0].newRow.WAREHOUSE_CD == undefined ? "" : ui.updateList[0].newRow.WAREHOUSE_CD;
            //         if(WAREHOUSE_CD != "") {
            //             let rowIndx = ui.updateList[0].rowIndx;
            //             stockInoutGridId01.pqGrid('updateRow', {rowIndx: rowIndx, row: {"LOC_SEQ": ""}});
            //         }
            //     }
            // },
        });
        /**  현황관리(GRID01) 그리드 선언 끝 **/

        $("#stock_in_out_search_btn").on('click', function () {
            stockInoutGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_in_out_form');
            } );
            stockInoutGridId01.pqGrid("refreshDataAndView");

        });

        fnCommCodeDatasourceSelectBoxCreate($('#stock_in_out_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_in_out_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        $("#SEL_INOUT_WAREHOUSE_CD").on('change', function () {
            $("#stock_in_out_form").find('.dep2').hide();
            $('#SEL_INOUT_LOC_SEQ').prop('selectedIndex', 0);
            if($(this).val() != '') {
                $('#SEL_INOUT_LOC_SEQ').attr('disabled',false);
                $('#SEL_INOUT_LOC_SEQ > .' + $(this).val()).show();
            }else {
                $("#SEL_INOUT_LOC_SEQ").attr('disabled',true);
            }
        });

        $('#stockInoutFileUpload').on('click', function () {
            $("#stock_in_out_search_btn").trigger('click');
        });


        $('#stockInoutFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(stockInoutGridId01, 'stockInoutFilterKeyword', 'stockInoutFilterCondition', 'stockInoutFilterColumn');

                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            },
            'search': function () {
                fnFilterHandler(stockInoutGridId01, 'stockInoutFilterKeyword', 'stockInoutFilterCondition', 'stockInoutFilterColumn');

                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            }
        });

        $("#stockInoutFrozen").on('change', function(e){
            fnFrozenHandler(stockInoutGridId01, $(this).val());
        });


        function stockInoutFilterRender(ui) {
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
                var condition = $("#stockInoutFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#stockInoutFilterKeyword").val(),
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


        $('#STOCK_INOUT_EXCEL_EXPORT').on('click', function () {
            const blob = stockInoutGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '재고 관리.xlsx');
        });
        $('#stock_in_out_form').find('#SIZE_TYPE').on('change', function () {
            const $stockInoutForm = $('#stock_in_out_form');
            $stockInoutForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('.defaultSize').show();
                    $stockInoutForm.find('.dlSize').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('.defaultSize').hide();
                    $stockInoutForm.find('.dlSize').show();
                    break;
                default:
                    $stockInoutForm.find('.defaultSize').show();
                    $stockInoutForm.find('.dlSize').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('.for_diabled').attr('disabled',true);
            }
        });
    });
</script>
