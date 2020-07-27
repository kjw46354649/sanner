<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-05-08
  Time: 오전 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                <button type="button" class="pop_close cam_work_history_detail_pop_close mg-top10 mg-right8">닫기</button>
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
                            <col width="*">
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="20%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td id="CONTROL_NUM"></td>
                            <th>수량 (원, 대)</th>
                            <td id="ORDER_QTY"></td>
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
                            <th>과거수행경험</th>
                            <td id="WORK_HISTORY_INFO"></td>
                        </tr>
                        <tr>
                            <th>가공계획 비고</th>
                            <td id="MCT_PLAN_NOTE"></td>
                            <th>배정 NC</th>
                            <td id="MCT_PLAN_NC"></td>
                            <th>최근공정</th>
                            <td id="LAST_WORK_NC"></td>
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
                                            <option value="">선택</option>
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
                                <tr><td colspan="3" id="CAM_WORK_FILE_01">&nbsp;<br>&nbsp;</td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_01" name="CAM_WORK_SEQ_01" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_01" name="CAM_WORK_GFILE_SEQ_01" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
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
                                            <option value="">선택</option>
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
                                <tr><td colspan="3" id="CAM_WORK_FILE_02" name="CAM_WORK_FILE_02" >&nbsp;<br>&nbsp;</td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_02" name="CAM_WORK_SEQ_02" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_02" name="CAM_WORK_GFILE_SEQ_02" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
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
                                            <option value="">선택</option>
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
                                <tr><td colspan="3" id="CAM_WORK_FILE_03" name="CAM_WORK_FILE_03" >&nbsp;<br>&nbsp;</td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_03" name="CAM_WORK_SEQ_03" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_03" name="CAM_WORK_GFILE_SEQ_03" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
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
                                            <option value="">선택</option>
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
                                <tr><td colspan="3" id="CAM_WORK_FILE_04" name="CAM_WORK_FILE_04" >&nbsp;<br>&nbsp;</td></tr>
                            </table>
                            <input type="hidden" id="CAM_WORK_SEQ_04" name="CAM_WORK_SEQ_04" value="">
                            <input type="hidden" id="CAM_WORK_GFILE_SEQ_04" name="CAM_WORK_GFILE_SEQ_04" value="">
                        </li>
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
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
                                            <option value="">선택</option>
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
                                <tr><td colspan="3" id="CAM_WORK_FILE_05" name="CAM_WORK_FILE_05" >&nbsp;<br>&nbsp;</td></tr>
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
                            <tr><td><textarea id="HISTORY_NOTE" name="HISTORY_NOTE" rows="3" cols="73" class="statusConfig" style="resize: none;"></textarea></td></tr>
                        </table>
                    </div>
                    <div class="conWrapRightPop50">
                        <table class="rowStyle">
                            <colgroup><col width="100%"></colgroup>
                            <tr><th style="color:#162f2f; text-align: center;">비고 및 공유사항</th></tr>
                            <tr><td><textarea id="NOTE" name="NOTE" rows="3" cols="73" class="statusConfig" style="resize: none;"></textarea></td></tr>
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
<div class="page estimate mct_execute_history">
    <div class="topWrap">
        <form class="form-inline" id="CAM_WORK_HISTORY_GRID_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectCamWorkHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">MCT 공장 구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1005}">
                                    <c:if test="${code.ETC2 == 'W'}">
                                       <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">NC NO.</label>
                            <select class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">소재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CLOSE_NOTE">후처리</label>
                            <input type="text" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200"name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
<%--                        <span class="slt_wrap">--%>
<%--                            <label class="label_100" for="CLOSE_VER">규격</label>--%>
<%--                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">--%>
<%--                                <option value=""><spring:message code="com.form.top.all.option"/></option>--%>
<%--                            </select>--%>
<%--                        </span>--%>
<%--                        <span class="gubun"></span>--%>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">형태</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
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
                        <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="1" selected="selected">수정일시</option>
                                <option value="2">가공확정일시</option>
                            </select>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_nc_execute_history_start_dt" id="mct_nc_execute_history_start_dt"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_nc_execute_history_end_dt" id="mct_nc_execute_history_end_dt" readonly><button type="button">달력선택</button>
                            </span>
                            <%--<span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>--%>
                        </div>
                        <button type="button" class="right_float defaultBtn radius blue" id="CAM_WORK_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="NC_PERFORMANCE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectNcPerformanceHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">MCT 공장 구분</label>
                            <select class="wd_200" name="FACTORY_AREA" id="FACTORY_AREA" title="공장구분">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1005}">
                                    <c:if test="${code.ETC2 == 'W'}">
                                       <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">NC NO.</label>
                            <select class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ">
                                <option value="">전체</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">소재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">형태</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200"name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
                                <option value="">전체</option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mg-right10">
                            <label class="label_100" for="CLOSE_VER">작업일시</label>
                            <%--<select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>--%>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_dw_execute_history_start_dt" id="mct_dw_execute_history_start_dt"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_dw_execute_history_end_dt" id="mct_dw_execute_history_end_dt" readonly><button type="button">달력선택</button>
                            </span>
<%--                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>--%>
                        </div>
                        <button type="button" class="right_float defaultBtn radius blue" id="NC_PERFORMANCE_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="MCT_EXECUTE_HISTORY_TAB" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CAM_WORK_HISTORY" data-toggle="tab" aria-expanded="true">CAM 작업이력</a>
                </li>
                <li>
                    <a href="#NC_PERFORMANCE_HISTORY" data-toggle="tab" aria-expanded="false">NC수행 이력</a>
                </li>
                <div class="d-inline right_float" id="CAM_WORK_HISTORY_BOX" style="font-weight: normal;">
                    <input type="text" id="camWorkHistoryFilterKeyword" placeholder="Enter your keyword">
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
                <div class="d-inline right_float" id="NC_PERFORMANCE_HISTORY_BOX" style="display: none; font-weight: normal;">
                    <input type="text" id="ncPerformanceHistoryFilterKeyword" placeholder="Enter your keyword">
                    <select id="ncPerformanceHistoryFilterColumn"></select>
                    <select id="ncPerformanceHistoryFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="ncPerformanceHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="ncPerformanceHistoryFrozen" name="ncPerformanceHistoryFrozen">
                    </select>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="CAM_WORK_HISTORY">
                    <div id="CAM_WORK_HISTORY_GRID"></div>
                </ul>
                <ul class="conWrap" id="NC_PERFORMANCE_HISTORY">
                    <div id="NC_PERFORMANCE_HISTORY_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /** function **/
        fnCommCodeDatasourceSelectBoxCreate($('#NC_PERFORMANCE_HISTORY_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#NC_PERFORMANCE_HISTORY_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}
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

        /* variable */
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $camWorkHistoryGrid;
        const tab1GridId = 'CAM_WORK_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = MONTH;

        const tab1ColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM<br>진행', dataType: 'string', dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls, text;
                    switch (rowData.CAM_STATUS) {
                        case 'CWS030':  // 완료
                            cls = 'bg-skyblue';
                            text = '완료';
                            break;
                        case 'CWS020':  // 진행중
                            cls = 'bg-green blink';
                            text = '진행중';
                            break;
                        case 'CWS010':  // 대기
                            cls = '';
                            text = '대기';
                            break;
                    }
                    return { cls: cls, text: text };
                }
            },
            {title: '가공<br>납기', minWidth: 15, width: 40, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '가공<br>완료', dataType: 'string', dataIndx: 'CNFRH'},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN', minWidth: 15, width: 20},
            {title: '주<br>요', dataType: 'string', dataIndx: 'MAIN_INSPECTION', minWidth: 15, width: 20},
            {title: '형<br>태', dataType: 'string', dataIndx: 'WORK_NM', minWidth: 15, width: 20},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_NUM_BUTTON', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 50, width: 160},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 10, width: 30},
            {title: '', minWidth: 25, width: 25, dataType: 'string', dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="magnifyingGlassIcon" id="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 40, width: 80},
            {title: '수량', align: 'right', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 50},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE', minWidth: 40, width: 80},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE', minWidth: 40, width: 80},
            {title: 'MCT Actual', align: 'center',
                colModel: [
                    {title: '1', minWidth: 50, width: 50, datatype: 'string', dataIndx: 'WORK_EQUIP_NM_1'},
                    {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORK_WORKING_TIME_1'},
                    {title: 'STATUS_1', dataType: 'string', dataIndx: 'WORK_STATUS_1', hidden: true},
                    {title: '2', minWidth: 50, width: 50, datatype: 'string', dataIndx: 'WORK_EQUIP_NM_2'},
                    {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORK_WORKING_TIME_2'},
                    {title: 'STATUS_2', dataType: 'string', dataIndx: 'WORK_STATUS_2', hidden: true},
                    {title: '3', minWidth: 50, width: 50, datatype: 'string', dataIndx: 'WORK_EQUIP_NM_3'},
                    {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORK_WORKING_TIME_3'},
                    {title: 'STATUS_3', dataType: 'string', dataIndx: 'WORK_STATUS_3', hidden: true},
                    {title: '4', minWidth: 50, width: 50, datatype: 'string', dataIndx: 'WORK_EQUIP_NM_4'},
                    {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORK_WORKING_TIME_4'},
                    {title: 'STATUS_4', dataType: 'string', dataIndx: 'WORK_STATUS_4', hidden: true},
                ]
            },
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'PROCESS_NC', minWidth: 20, width: 30},
                    {title: '밀링', datatype: 'integer', dataIndx: 'PROCESS_MILLING', minWidth: 20, width: 30},
                    {title: '선반', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_RACK', minWidth: 20, width: 30},
                    {title: '연마', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_GRINDING', minWidth: 20, width: 30},
                ]
            },
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'step', minWidth: 30, width: 35, datatype: 'integer', dataIndx: 'CAM_STEP',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            if(rowData.CAM_STEP)
                                return '<span id="CAM_WORK_HISTORY_ACTION" style="text-decoration: underline; cursor: pointer;">' + rowData.CAM_STEP + '</span>';
                            else
                                return ''
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;
                            $cell.find('#CAM_WORK_HISTORY_ACTION').bind('click', function(e) {
                                e.preventDefault();
                                camWorkHistoryPop(rowData);
                            });
                        }
                    },
                    {title: '위치', datatype: 'string', dataIndx: 'WORK_DIRECTION'},
                    {title: '작업내용', minWidth: 80, width: 80, datatype: 'string', dataIndx: 'WORK_DESC'},
                    {title: '작업자', minWidth: 100, width: 100, datatype: 'string', dataIndx: 'WORK_USER_NM'},
                    {title: '파일', minWidth: 60, width: 60, datatype: 'string', dataIndx: '',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let iconFiles = '';
                            if(rowData.CAM_FILE_SEQ) iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="cursor: pointer; margin-left:3px;"></span>&nbsp;&nbsp;';
                            if(rowData.NC_FILE_SEQ) iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="cursor: pointer; margin-left:25px;"></span>';
                            return iconFiles;
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('#downloadCAMFIle').bind('click', function(e) {
                                console.log(rowData.CAM_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                console.log(rowData.NC_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },
                    {title: '비고 및 공유사항',  minWidth: 100, width: 150, datatype: 'string', dataIndx: 'NOTE'},
                    {title: 'Update', minWidth: 75, width: 75, datatype: 'string', dataIndx: 'CAM_FINISH_DT'}
                ]
            }
        ];
        const tab1Obj = {
            minHeight: '100%', height: 720, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false, render: camWorkHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: tab1ColModel,
            // height: 720,
            // minHeight: '100%',
            // collapsible: false,
            // postRenderInterval: -1, //call postRender synchronously.
            // resizable: false,
            // showTitle: false,
            // rowHtHead: 15,
            // numberCell: {title: 'No.'},
            // trackModel: {on: true},
            // columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center',  editable: false, render: camWorkHistoryFilterRender}, filterModel: { mode: 'OR' },
            // colModel: tab1ColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
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
                $("#camWorkHistoryFilterColumn").empty();
                $("#camWorkHistoryFilterColumn").html(filterOpts);
                $("#camWorkHistoryFrozen").empty();
                $("#camWorkHistoryFrozen").html(frozenOts);
            },
            complete: function () {
                this.flex();
            }
        };
        let $ncPerformanceHistoryGrid;
        const tab2GridId = 'NC_PERFORMANCE_HISTORY_GRID';
        let tab2PostData = fnFormToJsonArrayData('#NC_PERFORMANCE_HISTORY_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT<br>공장 구분', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: 'NC명', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', minWidth: 20, width: 180, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 20, width: 20, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', minWidth: 20, width: 170, dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '품명', minWidth: 20, width: 170, dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '형태', minWidth: 20, width: 50, dataType: 'string', dataIndx: 'WORK_TYPE_NM'},
            {title: '소재종류', minWidth: 20, width: 60, dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '수량', minWidth: 20, width: 50, align: 'right', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '규격', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE'},
            {title: '착수일시', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'WORK_START_DT'},
            {title: '완료일시', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'WORK_FINISH_DT'},
            {title: '정지<br>시간', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'WORK_STOP_MINUTE'},
            {title: '소요<br>시간', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'WORK_WORK_MINUTE'},
            {title: '단위<br>소요', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'LEAD_TIME'},
            {title: '작업자', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'WORK_USER_ID'}
        ];
        let tab2Obj = {
            height: 720,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: false},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false, render: ncPerformanceHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: tab2ColModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
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
                $("#ncPerformanceHistoryFilterColumn").empty();
                $("#ncPerformanceHistoryFilterColumn").html(filterOpts);
                $("#ncPerformanceHistoryFrozen").empty();
                $("#ncPerformanceHistoryFrozen").html(frozenOts);
            }
        };
        /* variable */

        /* function */
        const colorClassification = function (status) {
            let backgroundColor = '';
            switch (status) {
                case '가동중':
                    backgroundColor = 'bg-green';
                    break;
                case '완료':
                    backgroundColor = 'bg-light_blue';
                    break;
                case '비가동상태':
                    backgroundColor = 'bg-yellow';
                    break;
                case '일시정지상태':
                    backgroundColor = 'bg-orange';
                    break;
            }
            return backgroundColor;
        };

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

        function ncPerformanceHistoryFilterRender(ui) {
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
                var condition = $("#ncPerformanceHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#ncPerformanceHistoryFilterKeyword").val(),
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
        /* function */


        /* event */
        $('#CAM_WORK_HISTORY_SEARCH').on('click', function () {
            $camWorkHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
            });
            $camWorkHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#NC_PERFORMANCE_HISTORY_SEARCH').on('click', function () {
            $ncPerformanceHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#NC_PERFORMANCE_HISTORY_SEARCH_FORM');
            });
            $ncPerformanceHistoryGrid.pqGrid('refreshDataAndView');
        });
        /* event */

        /* init */
        $camWorkHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $ncPerformanceHistoryGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

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

        $("#camWorkHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($camWorkHistoryGrid, 'camWorkHistoryFilterKeyword', 'camWorkHistoryFilterCondition', 'camWorkHistoryFilterColumn');
        });

        $("#camWorkHistoryFrozen").on('change', function(e){
            fnFrozenHandler($camWorkHistoryGrid, $(this).val());
        });

        $("#ncPerformanceHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($ncPerformanceHistoryGrid, 'ncPerformanceHistoryFilterKeyword', 'ncPerformanceHistoryFilterCondition', 'ncPerformanceHistoryFilterColumn');
        });

        $("#ncPerformanceHistoryFrozen").on('change', function(e){
            fnFrozenHandler($ncPerformanceHistoryGrid, $(this).val());
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

        let camWorkHistoryPop = function(rowData) {
            fnResetFrom('cam_work_history_pop_form');

            $("#cam_work_history_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
            $("#cam_work_history_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
            $("#cam_work_history_pop_form").find("#DXF_GFILE_SEQ").val(rowData.DXF_GFILE_SEQ);
            $("#cam_work_history_pop_form").find("#CAM_SEQ").val(rowData.CAM_SEQ);
            let controlNum = rowData.CONTROL_NUM;
            if(rowData.PART_NUM) controlNum += " # " + rowData.PART_NUM;
            $("#cam_work_history_pop_form").find("#CONTROL_NUM").html("<p style='color:blue;'>" + controlNum + "<p/>");
            let orderQty = numberWithCommas(rowData.ORDER_QTY);
            if(rowData.ORIGINAL_SIDE_QTY) orderQty += " <span style='color: red'> ( " + rowData.ORIGINAL_SIDE_QTY + ", " + rowData.ORIGINAL_SIDE_QTY + ") </span>";
            $("#cam_work_history_pop_form").find("#ORDER_QTY").html(orderQty);
            let dueOutDt = rowData.INNER_DUE_DT;
            if(rowData.EMERGENCY_YN === "Y") dueOutDt += " <input type='button' class='smallBtn red' value='긴급'></input>";
            $("#cam_work_history_pop_form").find("#DUE_OUT_DT").html(dueOutDt);
            let drawingNum = rowData.DRAWING_NUM;
            if(rowData.DRAWING_VER === "Y") drawingNum += " <span> ( " + rowData.DRAWING_VER + ") </span>";
            $("#cam_work_history_pop_form").find("#DRAWING_NUM").html(drawingNum);
            $("#cam_work_history_pop_form").find("#WORK_TYPE").html(rowData.MCT_WORK_TYPE_NM);
            let drawingFile = "";
            if(rowData.CAM_STATUS === "CWS020") drawingFile = "<a href='/downloadGfile/" + rowData.DXF_GFILE_SEQ + "' download><input type='button' class='smallBtn blue' value='다운로드'/></a>";
            $("#cam_work_history_pop_form").find("#DXF_DOWNLOAD").html(drawingFile);
            $("#cam_work_history_pop_form").find("#ITEM_NM").html(rowData.ITEM_NM);
            $("#cam_work_history_pop_form").find("#MATERIAL_DETAIL_NM").html(rowData.MATERIAL_DETAIL_NM);
            let camWorkDate = rowData.CAM_START_DT;
            if(rowData.CAM_STATUS === "CWS030") camWorkDate = rowData.CAM_FINISH_DT;
            $("#cam_work_history_pop_form").find("#LAST_WORK_DT").html(camWorkDate);
            $("#cam_work_history_pop_form").find("#SIZE_TXT").html(rowData.STANDARD_SIZE);
            $("#cam_work_history_pop_form").find("#SURFACE_TREAT_NM").html(rowData.SURFACE_TREAT_NM);
            $("#cam_work_history_pop_form").find("#MCT_PLAN_NOTE").html(rowData.MCT_NOTE);
            $("#cam_work_history_pop_form").find("#MCT_PLAN_NC").html(rowData.EQUIP_ID);
            let lastWorkEquipId = rowData.WORK_EQUIP_ID_1;
            if(rowData.WORK_EQUIP_ID_2) lastWorkEquipId = rowData.WORK_EQUIP_ID_2;
            if(rowData.WORK_EQUIP_ID_3) lastWorkEquipId = rowData.WORK_EQUIP_ID_3;
            if(rowData.WORK_EQUIP_ID_4) lastWorkEquipId = rowData.WORK_EQUIP_ID_4;
            $("#cam_work_history_pop_form").find("#LAST_WORK_NC").html(lastWorkEquipId);
            let camPopHtml = "";
            if(rowData.WORK_HISTORY_INFO){
                camPopHtml = rowData.WORK_HISTORY_INFO + "  ";
                camPopHtml += "<button type='button' class='smallBtn yellow' onclick=\"javascript:g_item_detail_pop_cam_pop('" + rowData.CONTROL_SEQ + "','" + rowData.CONTROL_DETAIL_SEQ + "');\"><i class='fa fa-trash'></i><span >조회</span></button>";
            }
            $("#cam_work_history_pop_form").find("#WORK_HISTORY_INFO").html(camPopHtml);
            $("#cam_work_history_pop_form").find("#HISTORY_NOTE").val(rowData.HISTORY_NOTE);
            $("#cam_work_history_pop_form").find("#NOTE").val(rowData.NOTE);
            camWorkHistoryStatusConfig(rowData);
            let parameters = {
                'url': '/json-list',
                'data': $('#cam_work_history_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                for(let i=0; i < data.list.length; i++){
                    $('#cam_work_history_detail_pop').find("input:checkbox[id='CAM_WORK_CHK_" + data.list[i].ROWNUM + "']").prop('checked', true);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_SEQ_" + data.list[i].ROWNUM).val(data.list[i].SEQ);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_GFILE_SEQ_" + data.list[i].ROWNUM).val(data.list[i].CAM_GFILE_SEQ);
                    $('#cam_work_history_detail_pop').find("select[id='CAM_WORK_DIRECTION_" + data.list[i].ROWNUM + "']").val(data.list[i].WORK_DIRECTION);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_DESC_" + data.list[i].ROWNUM).val(data.list[i].WORK_DESC);
                    $('#cam_work_history_detail_pop').find("#CAM_WORK_DESIGN_QTY_" + data.list[i].ROWNUM).val(data.list[i].DESIGN_QTY);
                    $('#cam_work_history_detail_pop').find("select[id='CAM_WORK_USER_ID_" + data.list[i].ROWNUM + "']").val(data.list[i].WORK_USER_ID);
                    let fileHtml = "<a href='/downloadfile/" + data.list[i].CAM_FILE_SEQ + "' download>" + data.list[i].CAM_FILE_NM + "</a><br>" +
                        "<a href='/downloadfile/" + data.list[i].NC_FILE_SEQ + "' download>" + data.list[i].NC_FILE_NM;
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
        }

        /* init */
    });
</script>
