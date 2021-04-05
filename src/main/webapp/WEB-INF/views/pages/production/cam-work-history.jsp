<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-12-07
  Time: 오전 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page estimate mct_execute_history">
    <div class="topWrap">
        <form class="form-inline" id="CAM_WORK_HISTORY_GRID_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectCamWorkHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_FACTORY">수행공장</label>
                            <select class="wd_200" name="WORK_FACTORY" id="WORK_FACTORY">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1014}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <input type="text" class="wd_200" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_USER_ID">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
<%--                            <label class="label_100" for="WORK_USER_ID">소재형태/Size</label>--%>
                            <label class="label_100" for="MATERIAL_KIND">소재형태/Size</label>
                            <select class="wd_100" name="MATERIAL_KIND" id="MATERIAL_KIND"></select>
                            <select class="wd_100" name="SEARCH_SEQ" id="SEARCH_SEQ" disabled>
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="material_size ellipsis" id="MATERIAL_SEARCH_TEXT">&nbsp;</span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mr-10">
                            <select name="CAM_WORK_HISTORY_CONDITION" id="CAM_WORK_HISTORY_CONDITION">
                                <%--<option value=""><spring:message code="com.form.top.sel.option"/></option>--%>
                                <option value="1">업데이트일시</option>
                                <option value="2">가공확정일시</option>
                            </select>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" name="CAM_WORK_HISTORY_START_DT" id="CAM_WORK_HISTORY_START_DT"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="CAM_WORK_HISTORY_END_DT" id="CAM_WORK_HISTORY_END_DT" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="radio_box" style="margin-left:10px;">
                                <input reqcd="R" type="radio" name="CAM_WORK_HISTORY_TERM" id="CAM_WORK_HISTORY_TERM_DAY" value="today" ><label for="CAM_WORK_HISTORY_TERM_DAY">오늘</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="CAM_WORK_HISTORY_TERM" id="CAM_WORK_HISTORY_TERM_WEEK" value="week" checked><label for="CAM_WORK_HISTORY_TERM_WEEK">-1주</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="CAM_WORK_HISTORY_TERM" id="CAM_WORK_HISTORY_TERM_MONTH" value="month"><label for="CAM_WORK_HISTORY_TERM_MONTH">-1개월</label>
                            </span>
                        </div>
                        <span class="gubun" style="margin-left: 16px;"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SIZE_TYPE">규격</label>
                            <select class="wd_100" name="SIZE_TYPE" id="SIZE_TYPE" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
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
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CAM_WORK_HISTORY_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="CAM_WORK_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="camWorkHistoryFilterKeyword" placeholder="Enter your keyword">
                <select id="camWorkHistoryFilterColumn"></select>
                <select id="camWorkHistoryFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="camWorkHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="camWorkHistoryFrozen" name="camWorkHistoryFrozen">
                </select>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="CAM_WORK_HISTORY_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CAM_WORK_HISTORY_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- cam 작업관리 popup -->
<div class="popup_container cam_work_history_detail_pop" id="cam_work_history_detail_pop" style="display: none;">
    <form class="form-inline" id="cam_work_history_pop_form" name="cam_work_history_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectCamDetailInfo"/>
        <input type="hidden" id="actionType" name="actionType" value=""/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
        <input type="hidden" id="DXF_GFILE_SEQ" name="DXF_GFILE_SEQ" value=""/>
        <input type="hidden" id="CAM_SEQ" name="CAM_SEQ" value=""/>
        <div class="layerPopup">
            <div class="h_area">
                <h3>CAM 작업 관리</h3>
                <button type="button" class="pop_close cam_work_history_detail_pop_close mt-10 mr-8">닫기</button>
            </div>
            <div class="qualityWrap">
                <h4>관리번호</h4>
                <span class="rightSpan" style="float: right;padding-top: 7px;">
                    <button type="button" class="defaultBtn btn-120w" id="mctWorkHistoryPopMctResultDetailViewBtn" >상세정보 조회</button>
                    <button type="button" class="defaultBtn btn-120w" id="mctWorkHistoryPopMctResultDrawingViewBtn" >도면보기</button>
                </span>
                <div class="list1">
                    <table class="rowStyle">
                        <colgroup>
                            <col width="10%">
                            <col width="30%">
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="20%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td id="CONTROL_NUM"></td>
                            <th>수량 (원, 대)</th>
                            <td id="CONTROL_PART_QTY"></td>
                            <th>가공납기</th>
                            <td id="DUE_OUT_DT"></td>
                        </tr>
                        <tr>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM"></td>
                            <th>작업형태</th>
                            <td id="WORK_TYPE"></td>
                            <th >도면파일</th>
                            <td id="DXF_DOWNLOAD"></td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td id="ITEM_NM"></td>
                            <th>소재종류</th>
                            <td id="MATERIAL_DETAIL_NM"></td>
                            <th >최근 시작/종료</th>
                            <td id="LAST_WORK_DT"></td>
                        </tr>
                        <tr>
                            <th>규격</th>
                            <td id="SIZE_TXT"></td>
                            <th>표면처리</th>
                            <td id="SURFACE_TREAT_NM"></td>
                            <th>유사주문수행기록</th>
                            <td id="WORK_HISTORY_INFO"></td>
                        </tr>
                        <tr>
                            <th>가공계획 비고</th>
                            <td id="MCT_NOTE"></td>
                            <th>배정 NC</th>
                            <td id="MCT_PLAN_EQUIP_NM"></td>
                            <th>최근수행공정</th>
                            <td id="LAST_WORK_EQUIP_NM"></td>
                        </tr>
                    </table>
                </div>
                <h4>가공실적 및 기록사항</h4>
                <div class="">
                    <ul >
                        <li style="list-style-type: none; float: left;">
                            <table class="mctWorkStyle" idx="01">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_01" name="CAM_WORK_CHK_01" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 1</th>
                                </tr>
                                <tr><th>위치</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_DIRECTION_01" id="CAM_WORK_DIRECTION_01" class="wd_150 statusConfig" >
                                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                            <c:forEach var="code" items="${HighCode.H_1080}">
                                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr><th>작업내용</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESC_01" name="CAM_WORK_DESC_01" value="" class="wd_150 statusConfig" />
                                    </td>
                                </tr>
                                <tr><th>단위수량</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESIGN_QTY_01" name="CAM_WORK_DESIGN_QTY_01" value="" class="wd_150 statusConfig" style="text-align: right;" />
                                    </td>
                                </tr>
                                <tr><th>작성자</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_USER_ID_01" id="CAM_WORK_USER_ID_01" class="wd_150 statusConfig" ></select>
                                    </td>
                                </tr>
                                <tr><th colspan="3">CAM/NC 파일</th></tr>
                                <tr><td colspan="3"><div id="CAM_WORK_FILE_01" style="width: 100%; max-width: 215px; height: 30px; max-height: 30px; overflow-x: hidden; overflow-y: auto;"></div></td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_01" name="CAM_WORK_SEQ_01" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_01" name="CAM_WORK_GFILE_SEQ_01" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 5px;">
                            <table class="mctWorkStyle" idx="02">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_02" name="CAM_WORK_CHK_02" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 2</th>
                                </tr>
                                <tr><th>위치</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_DIRECTION_02" id="CAM_WORK_DIRECTION_02" class="wd_150 statusConfig" >
                                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                            <c:forEach var="code" items="${HighCode.H_1080}">
                                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr><th>작업내용</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESC_02" name="CAM_WORK_DESC_02" value="" class="wd_150 statusConfig" />
                                    </td>
                                </tr>
                                <tr><th>단위수량</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESIGN_QTY_02" name="CAM_WORK_DESIGN_QTY_02" value="" class="wd_150 statusConfig" style="text-align: right;"/>
                                    </td>
                                </tr>
                                <tr><th>작성자</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_USER_ID_02" id="CAM_WORK_USER_ID_02" class="wd_150 statusConfig" ></select>
                                    </td>
                                </tr>
                                <tr><th colspan="3">CAM/NC 파일</th></tr>
                                <tr><td colspan="3"><div id="CAM_WORK_FILE_02" style="width: 100%; max-width: 215px; height: 30px; max-height: 30px; overflow-x: hidden; overflow-y: auto;"></div></td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_02" name="CAM_WORK_SEQ_02" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_02" name="CAM_WORK_GFILE_SEQ_02" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 5px;">
                            <table class="mctWorkStyle" idx="03">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_03" name="CAM_WORK_CHK_03" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 3</th>
                                </tr>
                                <tr><th>위치</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_DIRECTION_03" id="CAM_WORK_DIRECTION_03" class="wd_150 statusConfig" >
                                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                            <c:forEach var="code" items="${HighCode.H_1080}">
                                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr><th>작업내용</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESC_03" name="CAM_WORK_DESC_03" value="" class="wd_150 statusConfig" />
                                    </td>
                                </tr>
                                <tr><th>단위수량</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESIGN_QTY_03" name="CAM_WORK_DESIGN_QTY_03" value="" class="wd_150 statusConfig" style="text-align: right;"/>
                                    </td>
                                </tr>
                                <tr><th>작성자</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_USER_ID_03" id="CAM_WORK_USER_ID_03" class="wd_150 statusConfig" ></select>
                                    </td>
                                </tr>
                                <tr><th colspan="3">CAM/NC 파일</th></tr>
                                <tr><td colspan="3"><div id="CAM_WORK_FILE_03" style="width: 100%; max-width: 215px; height: 30px; max-height: 30px; overflow-x: hidden; overflow-y: auto;"></div></td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_03" name="CAM_WORK_SEQ_03" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_03" name="CAM_WORK_GFILE_SEQ_03" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-right: 5px;">
                            <table class="mctWorkStyle" idx="04">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_04" name="CAM_WORK_CHK_04" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 4</th>
                                </tr>
                                <tr><th>위치</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_DIRECTION_04" id="CAM_WORK_DIRECTION_04" class="wd_150 statusConfig" >
                                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                            <c:forEach var="code" items="${HighCode.H_1080}">
                                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr><th>작업내용</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESC_04" name="CAM_WORK_DESC_04" value="" class="wd_150 statusConfig" />
                                    </td>
                                </tr>
                                <tr><th>단위수량</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESIGN_QTY_04" name="CAM_WORK_DESIGN_QTY_04" value="" class="wd_150 statusConfig" style="text-align: right;"/>
                                    </td>
                                </tr>
                                <tr><th>작성자</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_USER_ID_04" id="CAM_WORK_USER_ID_04" class="wd_150 statusConfig workUser" ></select>
                                    </td>
                                </tr>
                                <tr><th colspan="3">CAM/NC 파일</th></tr>
                                <tr><td colspan="3"><div id="CAM_WORK_FILE_04" style="width: 100%; max-width: 215px; height: 30px; max-height: 30px; overflow-x: hidden; overflow-y: auto;"></div></td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_04" name="CAM_WORK_SEQ_04" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_04" name="CAM_WORK_GFILE_SEQ_04" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-right: 5px;">
                            <table class="mctWorkStyle" idx="05">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_05" name="CAM_WORK_CHK_05" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 5</th>
                                </tr>
                                <tr><th>위치</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_DIRECTION_05" id="CAM_WORK_DIRECTION_05" class="wd_150 statusConfig" >
                                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                            <c:forEach var="code" items="${HighCode.H_1080}">
                                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr><th>작업내용</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESC_05" name="CAM_WORK_DESC_05" value="" class="wd_150 statusConfig" />
                                    </td>
                                </tr>
                                <tr><th>단위수량</th>
                                    <td colspan="2">
                                        <input type="text" id="CAM_WORK_DESIGN_QTY_05" name="CAM_WORK_DESIGN_QTY_05" value="" class="wd_150 statusConfig" style="text-align: right;" />
                                    </td>
                                </tr>
                                <tr><th>작성자</th>
                                    <td colspan="2">
                                        <select name="CAM_WORK_USER_ID_05" id="CAM_WORK_USER_ID_05" class="wd_150 statusConfig workUser" ></select>
                                    </td>
                                </tr>
                                <tr><th colspan="3">CAM/NC 파일</th></tr>
                                <tr><td colspan="3"><div id="CAM_WORK_FILE_05" style="width: 100%; max-width: 215px; height: 30px; max-height: 30px; overflow-x: hidden; overflow-y: auto;"></div></td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_05" name="CAM_WORK_SEQ_05" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_05" name="CAM_WORK_GFILE_SEQ_05" value="">
                        </li>
                    </ul>
                </div>
                <div class="listdiv" style="display: table; padding-top: 10px;">
                    <div class="conWrapLeftPop50">
                        <table class="rowStyle">
                            <colgroup><col width="100%"></colgroup>
                            <tr><th style="color:#162f2f; text-align: center;">경험 기록사항(Lessons Learned)</th></tr>
                            <tr><td><textarea id="HISTORY_NOTE" name="HISTORY_NOTE" rows="3" cols="65" class="statusConfig" style="resize: none;"></textarea></td></tr>
                        </table>
                    </div>
                    <div class="conWrapRightPop50">
                        <table class="rowStyle">
                            <colgroup><col width="100%"></colgroup>
                            <tr><th style="color:#162f2f; text-align: center;">비고 및 공유사항</th></tr>
                            <tr><td><textarea id="NOTE" name="NOTE" rows="3" cols="65" class="statusConfig" style="resize: none;"></textarea></td></tr>
                        </table>
                    </div>
                </div>
                <div class="btnWrap" style="float: none; padding-bottom: 20px;">
                    <button type="button" class="defaultBtn grayPopGra cam_work_history_detail_pop_close">닫기</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- cam 작업 관리 popup -->

<script>
    $(function () {
        'use strict';
        $('#CAM_WORK_HISTORY_START_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#CAM_WORK_HISTORY_END_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#CAM_WORK_HISTORY_START_DT').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 6));
        $('#CAM_WORK_HISTORY_END_DT').datepicker('setDate', 'today');

        /** function **/
        // 소재종류
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1027}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#MATERIAL_DETAIL').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_history_pop_form').find('#CAM_WORK_USER_ID_01'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_history_pop_form').find('#CAM_WORK_USER_ID_02'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_history_pop_form').find('#CAM_WORK_USER_ID_03'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_history_pop_form').find('#CAM_WORK_USER_ID_04'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_history_pop_form').find('#CAM_WORK_USER_ID_05'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#MATERIAL_KIND'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMaterialTypeForSelectBox'}
        });

        let parameters = {'url': '/json-list', 'data': {'queryId': 'systemMapper.selectMaterialSizeSearchList'}};
        fnPostAjaxAsync(function(data){
            let optText = "<option value=''><spring:message code='com.form.top.all.option'/></option>";
            $.each(data.list,function (idx,Item) {
                optText += "<option class='dep2 "+Item.MATERIAL_KIND +"' value='" + Item.SEARCH_SEQ + "' value2='"+ Item.SEARCH_TEXT + "'>" + Item.SEARCH_NM +"</option>"
            });
            $("#SEARCH_SEQ").html(optText);
        }, parameters, '');
        /* variable */
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $camWorkHistoryGrid;
        const tab1GridId = 'CAM_WORK_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = MONTH;

        const tab1ColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'No.', align: 'right', minWidth: 30, dataType: 'integer', dataIndx: 'NO'},
            {
                title: '최근등록일시', width: 90, dataIndx: 'CAM_RECENTLY_REGISTRATION_DT',
                render: function (ui) {
                    const cellData = ui.cellData;

                    if (cellData) {
                        return '<span name="CAM_WORK_HISTORY_ACTION" style="text-decoration: underline; cursor: pointer;">' + cellData + '</span>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('[name=CAM_WORK_HISTORY_ACTION]').bind('click', function (e) {
                        e.preventDefault();
                        camWorkHistoryCallPop(rowData);
                    });
                }
            },
            {title: '가공완료', width: 60, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '외<br>주', minWidth: 30, dataIndx: 'OUTSIDE_YN'},
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '관리번호', align: 'left', width: 160, dataIndx: 'CONTROL_NUM', hidden: true},
            {title: '관리번호', align: 'left', width: 160, dataIndx: 'CONTROL_PART_NUM'},
            {
                title: '', width: 25, minWidth: 25, dataIndx: 'CONTROL_NUM_BUTTON', editable: false,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
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
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT'},
            {title: '재질', width: 50, dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '도면번호', halign: 'center', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
            {
                title: '', minWidth: 25, dataIndx: 'IMG_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData)
                        return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '주문<br>수량', width: 50, dataIndx: 'CONTROL_PART_QTY'},
            {
                title: 'CAD 파일', align: 'center',
                colModel: [
                    {title: 'Size', width: 95, dataIndx: 'CAD_FILE_SIZE'},
                    {
                        title: '', minWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                        render: function (ui) {
                            if (ui.cellData)
                                return '<span class="blueFileImageICon" name="downloadView" style="cursor: pointer"></span>';
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find('[name=downloadView]').bind('click', function () {
                                let rowData = ui.rowData;
                                fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                            });
                        }
                    },
                ]
            },
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '소재<br>형태',  width: 60, dataIndx: 'MATERIAL_KIND_NM'},
            {title: '주문 소재<br>Size', width: 110, dataIndx: 'MATERAIL_ORDER_SIZE'},
            {
                title: '1EA 가공시간', align: 'center',
                colModel: [
                    {title: '전공정', dataIndx: 'TOTAL_WORK_TIME'},
                    {title: 'NC', dataIndx: 'NC_WORK_TIME'}
                ]
            },
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'Steps', width: 50, datatype: 'integer', dataIndx: 'CAM_STEP'},
                    {title: '위치', dataIndx: 'WORK_DIRECTION'},
                    {title: '작업내용', width: 70, dataIndx: 'WORK_DESC'},
                    {title: '단위수량', width: 50, datatype: 'integer', dataIndx: 'DESIGN_QTY'},
                    {
                        title: 'File', width: 70, dataIndx: '',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let camVisibility = fnIsEmpty(rowData.CAM_FILE_SEQ) ? 'hidden' : 'visible';
                            let ncVisibility = fnIsEmpty(rowData.NC_FILE_SEQ) ? 'hidden' : 'visible';
                            let iconFiles = '';
                            iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="visibility: ' + camVisibility + '; cursor: pointer;"></span>&nbsp;&nbsp;';
                            iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="visibility: ' + ncVisibility + '; cursor: pointer; margin-left: 10px;"></span>';

                            return iconFiles;
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('#downloadCAMFIle').bind('click', function(e) {
                                // console.log(rowData.CAM_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                // console.log(rowData.NC_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },
                    {title: '작업자', width: 80, dataIndx: 'WORK_USER_NM'},
                    {title: '실적등록일시', width: 90, dataIndx: 'CAM_INSERT_DT'},
                    {title: '경험 기록사항',  width: 150, dataIndx: 'CAM_EXPERIENCE_NOTE'},
                    {title: '비고 및 공유사항',  width: 150, dataIndx: 'CAM_WORK_NOTE'},
                ]
            }
        ];
        const tab1Obj = {
            minHeight: '100%', height: 700, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.', show: false},
            trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false, render: camWorkHistoryFilterRender}, filterModel: { mode: 'OR' },
            editModel: {clicksToEdit: 1},
            colModel: tab1ColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function() {
                autoMerge(this, true);

                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#camWorkHistoryFilterColumn").empty();
                $("#camWorkHistoryFilterColumn").html(filterOpts);
                $("#camWorkHistoryFrozen").empty();
                $("#camWorkHistoryFrozen").html(frozenOts);
            },
            complete: function (event, ui) {
                let data = this.option('dataModel.data');

                $('#CAM_WORK_HISTORY_RECORDS').html(data.length);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };
        /* variable */

        /* function */
        function camWorkHistoryFilterRender(ui) {
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
                var condition = $("#camWorkHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#camWorkHistoryFilterKeyword").val(),
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

         const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');

            const controlList = [
                'NO', 'CONTROL_PART_NUM', 'ORDER_COMP_NM',
            ];
             const partList = [
                 'CONTROL_NUM_BUTTON', 'CAM_RECENTLY_REGISTRATION_DT', 'INNER_WORK_FINISH_DT', 'OUTSIDE_YN', 'WORK_FACTORY_NM',  'WORK_TYPE_NM', 'SIZE_TXT',
                 'MATERIAL_TYPE_NM', 'DRAWING_NUM', 'IMG_GFILE_SEQ', 'CONTROL_PART_QTY', 'CAD_FILE_SIZE', 'DXF_GFILE_SEQ',
                 'MATERIAL_DETAIL_NM', 'MATERIAL_KIND_NM', 'MATERAIL_ORDER_SIZE', 'NC_WORK_TIME', 'TOTAL_WORK_TIME',
                 // 'CAM_STEP', 'WORK_DIRECTION', 'WORK_DESC', 'DESIGN_QTY', '', 'WORK_USER_NM',
                 'CAM_EXPERIENCE_NOTE', 'CAM_WORK_NOTE'
             ];
            const includeList = controlList.concat(partList);

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['CONTROL_PART_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_PART_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (controlList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        } else if (partList.includes(dataIndx)) {
                            let controlDetailSeq = data[j]['CONTROL_DETAIL_SEQ'],
                                controlDetailSeqPrev = data[j - 1] ? data[j - 1]['CONTROL_DETAIL_SEQ'] : undefined;

                            if (controlNum === controlNumPrev && controlDetailSeq === controlDetailSeqPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
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
        /* function */

        /* event */
        $('#CAM_WORK_HISTORY_SEARCH').on('click', function () {
            $camWorkHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
            });
            $camWorkHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#CAM_WORK_HISTORY_EXCEL_EXPORT').on('click', function () {
            const blob = $camWorkHistoryGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, 'CAM 작업이력.xlsx');
        });

        $("#CAM_WORK_HISTORY_GRID_SEARCH_FORM").find('[name=CAM_WORK_HISTORY_TERM]').change(function () {
            let value = $(this).val();
            let today = TODAY;
            let newDate = new Date();

            switch (value) {
                case 'today':
                    break;
                case 'week':
                    newDate.setDate(newDate.getDate() - 6);
                    break;
                case 'month':
                    newDate.setMonth(newDate.getMonth() - 1);
                    break;
            }
            $("#CAM_WORK_HISTORY_GRID_SEARCH_FORM").find('#CAM_WORK_HISTORY_START_DT').val(newDate.yyyymmdd());
            $("#CAM_WORK_HISTORY_GRID_SEARCH_FORM").find('#CAM_WORK_HISTORY_END_DT').val(today.yyyymmdd());
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#SIZE_TYPE').on('change', function () {
            const $camWorkHistoryGridSearchForm = $('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
            $camWorkHistoryGridSearchForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($camWorkHistoryGridSearchForm,resetArr)
                    $camWorkHistoryGridSearchForm.find('#SIZE_W').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_H').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_T').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_D').hide();
                    $camWorkHistoryGridSearchForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($camWorkHistoryGridSearchForm,resetArr)
                    $camWorkHistoryGridSearchForm.find('#SIZE_W').hide();
                    $camWorkHistoryGridSearchForm.find('#SIZE_H').hide();
                    $camWorkHistoryGridSearchForm.find('#SIZE_T').hide();
                    $camWorkHistoryGridSearchForm.find('#SIZE_D').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_L').show();
                    break;
                default:
                    $camWorkHistoryGridSearchForm.find('#SIZE_W').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_H').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_T').show();
                    $camWorkHistoryGridSearchForm.find('#SIZE_D').hide();
                    $camWorkHistoryGridSearchForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($camWorkHistoryGridSearchForm,resetArr)
                    $camWorkHistoryGridSearchForm.find('.for_diabled').attr('disabled',true);
            }
        });
        /* event */

        /* init */
        $camWorkHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);

        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('YEAR', 10);

        $('#CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_LEFT', this.value);
        });
        $('#CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT', this.value);
        });
        $('#RANGE_SEARCH').on('change', function (event) {
            if ($(this).prop('checked')) {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });

        $('#camWorkHistoryFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($camWorkHistoryGrid, 'camWorkHistoryFilterKeyword', 'camWorkHistoryFilterCondition', 'camWorkHistoryFilterColumn');

                let data = $camWorkHistoryGrid.pqGrid('option', 'dataModel.data');
                $('#CAM_WORK_HISTORY_RECORDS').html(data.length);
            },
            'search': function () {
                fnFilterHandler($camWorkHistoryGrid, 'camWorkHistoryFilterKeyword', 'camWorkHistoryFilterCondition', 'camWorkHistoryFilterColumn');

                let data = $camWorkHistoryGrid.pqGrid('option', 'dataModel.data');
                $('#CAM_WORK_HISTORY_RECORDS').html(data.length);
            }
        });

        $("#camWorkHistoryFrozen").on('change', function(e){
            fnFrozenHandler($camWorkHistoryGrid, $(this).val());
        });

        $('#MCT_EXECUTE_HISTORY_TAB').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $(".mct_execute_history").find('.topWrap').toggle(); // show -> hide , hide -> show
                $("#CAM_WORK_HISTORY_BOX").toggle();
                $("#NC_PERFORMANCE_HISTORY_BOX").toggle();

                // $('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
                // $('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
            }
        });

        /** 제품 시작 상세 표시 **/
        $("#cam_work_history_detail_pop").find('.cam_work_history_detail_pop_close').on('click', function () {
            $('#cam_work_history_detail_pop').modal('hide');
        });

        /** 팝업 제품 상세 보기 **/
        $("#cam_work_history_pop_form").find("#mctWorkHistoryPopMctResultDetailViewBtn").click(function(event) {
            g_item_detail_pop_view($("#cam_work_history_pop_form").find("#CONTROL_SEQ").val(), $("#cam_work_history_pop_form").find("#CONTROL_DETAIL_SEQ").val());
        });
        /** 팝업 제품 도면 보기 **/
        $("#cam_work_history_pop_form").find("#mctWorkHistoryPopMctResultDrawingViewBtn").click(function(event) {
            callWindowImageViewer($("#cam_work_history_pop_form").find("#DXF_GFILE_SEQ").val());
        });

        let camWorkHistoryCallPop = function(rowData) {
            let infoParameters = {
                'url': '/json-info',
                'data': {
                    'queryId': 'machine.selectResultManagePopInfo',
                    'CONTROL_NUM': rowData.CONTROL_NUM, 'CONTROL_DETAIL_SEQ': rowData.CONTROL_DETAIL_SEQ
                }
            };
            fnPostAjax(function (infoData, infoCallFunctionParam) {
                if (infoData.info) {
                    camWorkHistoryPop(infoData.info);
                } else {
                    fnAlert(null, "관리번호를 확인 해 주십시오. 실적 등록 대상이 아닙니다.");
                    return;
                }
            }, infoParameters, '');
        }

        let camWorkHistoryPop = function (rowData) {
            fnResetFrom('cam_work_history_pop_form');
            for (let i = 1; i <= 5; i++) {
                $("#cam_work_history_detail_pop").find("#CAM_WORK_FILE_0" + i).html("");
            }
            $("#cam_work_history_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
            $("#cam_work_history_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
            $("#cam_work_history_pop_form").find("#DXF_GFILE_SEQ").val(rowData.DXF_GFILE_SEQ);
            $("#cam_work_history_pop_form").find("#CAM_SEQ").val(rowData.CAM_SEQ);
            let controlNum = rowData.CONTROL_NUM;
            if (rowData.PART_NUM) controlNum += " # " + rowData.PART_NUM;
            $("#cam_work_history_pop_form").find("#CONTROL_NUM").html("<p style='color:blue;'>" + controlNum + "<p/>");
            let controlPartQty = numberWithCommas(rowData.CONTROL_PART_QTY);
            if (rowData.ORIGINAL_SIDE_QTY) controlPartQty += " <span style='color: red'> ( " + rowData.ORIGINAL_SIDE_QTY + ", " + rowData.OTHER_SIDE_QTY + ") </span>";
            $("#cam_work_history_pop_form").find("#CONTROL_PART_QTY").html(controlPartQty || '');
            let dueOutDt = rowData.INNER_DUE_DT;
            switch (rowData.EMERGENCY_HOLD) {
                case '보류':
                    dueOutDt = '<span class="text-red">보류</span>';
                    break;
                case '긴급':
                    dueOutDt += " <input type='button' class='smallBtn red' value='긴급'>";
                    break;
            }
            $("#cam_work_history_pop_form").find("#DUE_OUT_DT").html(dueOutDt || '');
            $("#cam_work_history_pop_form").find("#DRAWING_NUM").html(rowData.CONCAT_DRAWING_NUM || '');
            $("#cam_work_history_pop_form").find("#WORK_TYPE").html(rowData.WORK_TYPE_NM || '');
            let drawingFile = "";
            if (rowData.CAM_STATUS === "CWS020" || rowData.CAM_STATUS === "CWS030") {
                let str = rowData.CONCAT_DRAWING_NUM;
                let arr = str.split(',');

                if (arr.length === 1) {
                    drawingFile = "<a href='/downloadGfile/" + rowData.DXF_GFILE_SEQ + "' download><input type='button' class='smallBtn blue' value='다운로드'/></a>";
                } else if (arr.length > 1) {
                    $('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(rowData.IMG_GFILE_SEQ);
                    drawingFile = '<button type="button" class="smallBtn blue" onclick="commonMultiDownloadPop(' + rowData.CONTROL_SEQ + ')">다운로드</button>';
                }
            }
            $("#cam_work_history_pop_form").find("#DXF_DOWNLOAD").html(drawingFile || '');
            $("#cam_work_history_pop_form").find("#ITEM_NM").html(rowData.ITEM_NM || '');
            $("#cam_work_history_pop_form").find("#MATERIAL_DETAIL_NM").html(rowData.MATERIAL_DETAIL_NM || '');
            let camWorkDate = rowData.CAM_START_DT;
            if (rowData.CAM_STATUS === "CWS030") camWorkDate = rowData.CAM_FINISH_DT;
            $("#cam_work_history_pop_form").find("#LAST_WORK_DT").html(camWorkDate || '');
            $("#cam_work_history_pop_form").find("#SIZE_TXT").html(rowData.SIZE_TXT || '');
            $("#cam_work_history_pop_form").find("#SURFACE_TREAT_NM").html(rowData.SURFACE_TREAT_NM || '');
            $("#cam_work_history_pop_form").find("#MCT_NOTE").html(rowData.MCT_NOTE || '');
            $("#cam_work_history_pop_form").find("#MCT_PLAN_EQUIP_NM").html(rowData.MCT_PLAN_EQUIP_NM || '');
            $("#cam_work_history_pop_form").find("#LAST_WORK_EQUIP_NM").html(rowData.LAST_WORK_EQUIP_NM || '');
            let camPopHtml = "";
            if (rowData.WORK_HISTORY_INFO) {
                camPopHtml = rowData.WORK_HISTORY_INFO + "  ";
                camPopHtml += "<button type='button' class='smallBtn yellow' onclick=\"javascript:g_item_detail_pop_cam_pop('" + rowData.CONTROL_SEQ + "','" + rowData.CONTROL_DETAIL_SEQ + "');\"><i class='fa fa-trash'></i><span >조회</span></button>";
            }
            $("#cam_work_history_pop_form").find("#WORK_HISTORY_INFO").html(camPopHtml || '');
            $("#cam_work_history_pop_form").find("#HISTORY_NOTE").val(rowData.HISTORY_NOTE);
            $("#cam_work_history_pop_form").find("#NOTE").val(rowData.NOTE);
            camWorkHistoryStatusConfig(rowData);
            let parameters = {
                'url': '/json-list',
                'data': $('#cam_work_history_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                for (let i = 0; i < data.list.length; i++) {
                    let fileHtml = '';
                    $('#cam_work_history_detail_pop').find("input:checkbox[id='CAM_WORK_CHK_" + data.list[i].ROWNUM + "']").prop('checked', true);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_SEQ_" + data.list[i].ROWNUM).val(data.list[i].SEQ);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_GFILE_SEQ_" + data.list[i].ROWNUM).val(data.list[i].CAM_GFILE_SEQ);
                    $('#cam_work_history_detail_pop').find("select[id='CAM_WORK_DIRECTION_" + data.list[i].ROWNUM + "']").val(data.list[i].WORK_DIRECTION);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_DESC_" + data.list[i].ROWNUM).val(data.list[i].WORK_DESC);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_DESIGN_QTY_" + data.list[i].ROWNUM).val(data.list[i].DESIGN_QTY);
                    $('#cam_work_history_detail_pop').find("select[id='CAM_WORK_USER_ID_" + data.list[i].ROWNUM + "']").val(data.list[i].WORK_USER_ID);
                    fileHtml += data.list[i].CAM_FILE_SEQ ? '<a href="/downloadfile/' + data.list[i].CAM_FILE_SEQ + '" download style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].CAM_FILE_NM + '</a>' : '';
                    fileHtml += data.list[i].NC_FILE_SEQ ? '<a href="/downloadfile/' + data.list[i].NC_FILE_SEQ + '" download style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].NC_FILE_NM : '';
                    $("#cam_work_history_detail_pop").find("#CAM_WORK_FILE_" + data.list[i].ROWNUM).html(fileHtml);
                }
                $('#cam_work_history_detail_pop').modal('show');
            }, parameters, '');
        };

        /** 시작 전 Disable 처리 **/
        let camWorkHistoryStatusConfig = function(rowData){
            let disableFlag = true;
            $("#cam_work_history_pop_form").find(".statusConfig").attr('readonly', disableFlag);
            $("#cam_work_history_pop_form").find(".statusConfig").attr('disabled', disableFlag);
            $("#cam_work_history_pop_form").find(".camworkChekbox").attr('disabled', disableFlag);
            $("#cam_work_history_pop_form").find("#HISTORY_NOTE").attr('readonly', disableFlag);
            $("#cam_work_history_pop_form").find("#HISTORY_NOTE").attr('disabled', disableFlag);
            $("#cam_work_history_pop_form").find("#NOTE").attr('readonly', disableFlag);
            $("#cam_work_history_pop_form").find("#NOTE").attr('disabled', disableFlag);
        };

        $(".datepicker-input").each(function () {
            $(this).datepicker({
                dateFormat: 'yy/mm/dd',
            });
            $(this).datepicker('setDate', 'today');
        });

        $("#MATERIAL_KIND").on('change', function () {
            $('.dep2').hide();
            $('#SEARCH_SEQ').prop('selectedIndex', 0);
            $('#MATERIAL_SEARCH_TEXT').html('&nbsp;');
            if($(this).val() != '') {
                $('#SEARCH_SEQ').attr('disabled',false);
                $('#SEARCH_SEQ > .' + $(this).val()).show();
            }else {
                $("#SEARCH_SEQ").attr('disabled',true);
            }
        })
        $("#SEARCH_SEQ").on('change', function () {
            let searchText = $("#SEARCH_SEQ > option:selected").attr("value2");
            if(typeof searchText != 'undefined') {
                $("#MATERIAL_SEARCH_TEXT").html(searchText);
            }else {
                $("#MATERIAL_SEARCH_TEXT").html('&nbsp;');
            }
        })

        /* init */
    });
</script>
