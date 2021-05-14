<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-05-11
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- cam 작업관리 popup -->
<div class="popup_container cam_work_manage_detail_pop" id="cam_work_manage_detail_pop" style="display: none;">
    <form class="form-inline" id="cam_work_manage_pop_form" name="cam_work_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectCamDetailInfo"/>
        <input type="hidden" id="actionType" name="actionType" value=""/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
        <input type="hidden" id="DXF_GFILE_SEQ" name="DXF_GFILE_SEQ" value=""/>
        <input type="hidden" id="IMG_GFILE_SEQ" name="IMG_GFILE_SEQ" value=""/>
        <input type="hidden" id="CAM_SEQ" name="CAM_SEQ" value=""/>
        <input type="hidden" id="BARCODE_NUM" name="BARCODE_NUM" value=""/>
        <input type="hidden" id="CAM_STATUS" name="CAM_STATUS" value=""/>
        <div class="layerPopup">
            <div class="h_area">
                <h3>CAM 작업 관리</h3>
                <button type="button" class="pop_close cam_work_manage_detail_pop_close mt-10 mr-8">닫기</button>
            </div>
            <div class="qualityWrap">
                <h4>작업지시번호</h4>
                <span class="rightSpan" style="float: right;padding-top: 7px;">
                    <button type="button" class="defaultBtn btn-120w" id="mctWorkPopMctResultDetailViewBtn" >상세정보 조회</button>
                    <button type="button" class="defaultBtn btn-120w" id="mctWorkPopMctResultDrawingViewBtn" >도면보기</button>
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
                            <th>작업지시번호</th>
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
                                    <th colspan="2">Step 1
                                        <span style="float: right"><button type='button' style="padding: 0px 5px !important;" class='smallBtn blue' onclick="javascript:resetMctResult('01');"><i class='fa fa-trash'></i><span >Reset</span></button></span>
                                    </th>
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
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
                            <table class="mctWorkStyle" idx="02">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_02" name="CAM_WORK_CHK_02" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 2
                                        <span style="float: right"><button type='button' style="padding: 0px 5px !important;" class='smallBtn blue' onclick="javascript:resetMctResult('02');"><i class='fa fa-trash'></i><span >Reset</span></button></span>
                                    </th>
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
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
                            <table class="mctWorkStyle" idx="03">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_03" name="CAM_WORK_CHK_03" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 3
                                        <span style="float: right"><button type='button' style="padding: 0px 5px !important;" class='smallBtn blue' onclick="javascript:resetMctResult('03');"><i class='fa fa-trash'></i><span >Reset</span></button></span>
                                    </th>
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
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
                            <table class="mctWorkStyle" idx="04">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_04" name="CAM_WORK_CHK_04" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 4
                                        <span style="float: right"><button type='button' style="padding: 0px 5px !important;" class='smallBtn blue' onclick="javascript:resetMctResult('04');"><i class='fa fa-trash'></i><span >Reset</span></button></span>
                                    </th>
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
                        <li style="list-style-type: none; float: left; padding-left: 4px;">
                            <table class="mctWorkStyle" idx="05">
                                <colgroup>
                                    <col width="20%">
                                    <col width="60%">
                                    <col width="20%">
                                </colgroup>
                                <tr>
                                    <th><input type="checkbox" id="CAM_WORK_CHK_05" name="CAM_WORK_CHK_05" class="statusConfig camworkChekbox" ></th>
                                    <th colspan="2">Step 5
                                        <span style="float: right"><button type='button' style="padding: 0px 5px !important;" class='smallBtn blue' onclick="javascript:resetMctResult('05');"><i class='fa fa-trash'></i><span >Reset</span></button></span>
                                    </th>
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
                    <button type="button" class="defaultBtn orange afterStart" id="camWorkTempSaveBtn">임시저장</button>
                    <button type="button" class="defaultBtn green afterStart" id="camWorkSaveAndCompleteBtn">저장 & 완료</button>
                    <button type="button" class="defaultBtn purple beforeStart" id="camWorkStartBtn" >작업시작</button>
                    <button type="button" class="defaultBtn red afterStart" id="camWorkCancelBtn">작업 취소</button>
                    <button type="button" class="defaultBtn grayPopGra cam_work_manage_detail_pop_close" style="font-size: 12px;">닫기</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- cam 작업 관리 popup -->
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="mct_result_manage_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectResultManageList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">NC NO.</label>
                            <input type="text" class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" for="MATERIAL_TYPE">재질</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="MATERIAL_TYPE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1035}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CONTROL_NUM">작업지시번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_FACTORY">공장 구분</label>
                            <select class="wd_200" name="WORK_FACTORY" id="WORK_FACTORY" title="공장구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1014}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="txt_span"><label class="label_50" for="">Option</label></span>
                        <span class="chk_box"><input id="SEL_ASSEMBLY" name="SEL_ASSEMBLY" type="checkbox"><label for="SEL_ASSEMBLY">조립포함</label></span>
                        <span class="chk_box"><input id="SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox"><label for="SEL_OUTSIDE_YN">외주포함</label></span>
                        <span class="chk_box"><input id="SEL_COMPLETED_YN" name="SEL_COMPLETED_YN" type="checkbox" checked><label for="SEL_COMPLETED_YN">가공완료제외</label></span>
                        <span class="chk_box"><input id="INCLUDE_UNALLOCATED_WAIT" name="INCLUDE_UNALLOCATED_WAIT" type="checkbox"><label for="INCLUDE_UNALLOCATED_WAIT">미할당 대기 포함</label></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="MCT_RESULT_MANAGE_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="mctCamManageSearchBtn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="mctResultManageFilterKeyword" placeholder="Enter your keyword">
                <select id="mctResultManageFilterColumn"></select>
                <select id="mctResultManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="mctResultManageFrozen" class="ml-10 mr-10" style="font-size: 15px;">Fix</label>
                <select id="mctResultManageFrozen" name="mctResultManageFrozen"></select>
                <span class="barCode ml-10 mr-10" id="mctResultBarcodeSpan"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="mctResultBarcodeImg"></span>
                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="MCT_RESULT_BARCODE_NUM" id="MCT_RESULT_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
                <span class="rightSpan">
                    <button type="button" class="defaultBtn btn-100w green" id="MCT_RESULT_MANAGE_SAVE">저장</button>
                </span>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="machine_result_manage_grid" class="jqx-refresh"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="machine_result_manage_grid-total-records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    let $mctResultManageGrid;
    let machineResultManageGridId = 'machine_result_manage_grid';
    let machineResultManagePostData = fnFormToJsonArrayData('#mct_result_manage_search_form');
    let machineResultManagecolModel;

    let $camWorkStartBtn = $("#camWorkStartBtn");
    let $camWorkTempSaveBtn = $("#camWorkTempSaveBtn");
    let $camWorkSaveAndCompleteBtn = $("#camWorkSaveAndCompleteBtn");
    let $camWorkCancelBtn = $("#camWorkCancelBtn");

    let $mctCamManageSearchBtn = $("#mctCamManageSearchBtn");

    $(function () {
        'use strict';
        /** barcode **/
        $("#MCT_RESULT_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode == 13) {
                fnBarcodePrintCheck(function(confirm, callFunctionParam){
                    let barcodeN = callFunctionParam;
                    $("#MCT_RESULT_BARCODE_NUM").val("");
                    if(confirm){
                        //0. 바코드 정보 가져오기
                        let data = {'queryId': "common.selectControlBarcodeInfo",'BARCODE_NUM': barcodeN};
                        let parameters = {'url': '/json-info','data': data};
                        fnPostAjax(function (data, callFunctionParam) {
                            let dataInfo = data.info;
                            if(dataInfo == null ) {
                                fnAlert(null, "해당 바코드가 존재하지 않습니다.");
                                return;
                            }else{
                                let parameters = {
                                    'url': '/json-info',
                                    'data': {'queryId': 'machine.selectResultManagePopInfo', 'BARCODE_NUM': barcodeN}
                                };
                                fnPostAjax(function (data, callFunctionParam) {
                                    if(data.info){
                                        camWorkManagePop(data.info, true);
                                    }else{
                                        fnAlert(null, "바코드를 확인 해 주십시오. 실적 등록 대상이 아닙니다.");
                                        return;
                                    }
                                }, parameters, '');
                            }
                        }, parameters, '');
                    }else{}
                }, fnBarcodeKo2En(this.value), fnBarcodeKo2En(this.value));
            }
        });
        $("#mctResultBarcodeSpan").on('click', function (e) {
            $("#MCT_RESULT_BARCODE_NUM").focus();
        });

        $("#MCT_RESULT_BARCODE_NUM").on({
            focus: function () {
                var grid = $mctResultManageGrid.pqGrid('getInstance').grid;
                grid.setSelection(null);
                $("#mctResultBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#mctResultBarcodeImg").attr("src","/resource/asset/images/common/img_barcode_long.png");
            }
        });

        /** function **/
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    comboData.push({title: obj.CODE_NM, id: obj.CODE_CD});
                }

                $('#mct_result_manage_search_form').find('#EQUIP_SEQ').comboTree({
                    source: comboData,
                    isMultiple: true,
                    cascadeSelect: false
                });
            }, parameters, '');
        })();
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_manage_pop_form').find('#CAM_WORK_USER_ID_01'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_manage_pop_form').find('#CAM_WORK_USER_ID_02'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_manage_pop_form').find('#CAM_WORK_USER_ID_03'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_manage_pop_form').find('#CAM_WORK_USER_ID_04'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#cam_work_manage_pop_form').find('#CAM_WORK_USER_ID_05'), 'sel', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        const NC_MACHINE = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'machine.selectNCMachineList'}
        });
        machineResultManagecolModel = [
            {title: 'ROWNUM', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM<br>진행', dataIndx: 'CAM_STATUS',
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
            {title: 'CAM 작업 수행', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    const startBtn = '<button type="button" class="miniBtn orange " id="CAM_WORK_START_ACTION">시작</button>';
                    const startDisableBtn = '<button type="button" class="miniBtn gray">시작</button>';
                    const finishBtn = '<button type="button" class="miniBtn blue" id="CAM_WORK_COMPLETE_ACTION">완료</button>';
                    const finishDisableBtn = '<button type="button" class="miniBtn gray" >완료</button>';
                    switch (rowData.CAM_STATUS) {
                        case 'CWS030':  // 완료
                            return startBtn + '&nbsp;' + finishDisableBtn;
                            break;
                        case 'CWS020':  // 진행중
                            return startDisableBtn + '&nbsp;' + finishBtn;
                            break;
                        case 'CWS010':     // 대기
                            return startBtn + '&nbsp;' + finishDisableBtn;
                            break;
                    }
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#CAM_WORK_START_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        camWorkManagePreSearchPop(rowData, true);
                    });
                    $cell.find('#CAM_WORK_COMPLETE_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        camWorkManagePreSearchPop(rowData, true);
                    });
                }
            },
            {
                title: '긴급<br>보류', dataIndx: 'EMERGENCY_HOLD', minWidth: 45,
                render: function (ui) {
                    switch (ui.cellData) {
                        case '긴급':
                            return {style: 'background-color: #ff0000; color: #ffffff;'};
                        case '보류':
                            return {style: 'background-color: #ffa500; color: #ff0000;'};
                    }
                }
            },
            {title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION_NM', minWidth: 45},
            {
                title: '불량<br>반품', dataIndx: 'FAIL_STATUS', minWidth: 45,
                render: function (ui) {
                    if (ui.cellData) {
                        return {style: 'background-color: #ff0000; color: #ffffff;'};
                    }
                }
            },
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {
                title: '가공납기', dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT', minWidth: 15, width: 60,
                render: function (ui) {
                    const innerDueDt = new Date(ui.cellData);
                    const innerWorkFinishDt = ui.rowData.INNER_WORK_FINISH_DT;

                    if (!innerWorkFinishDt && innerDueDt.getTime() < TODAY.getTime()) {
                        return {style: 'background-color: #ffe699; color: #ff0000;'};
                    }
                }
            },
            {title: '가공완료일시', dataIndx: 'INNER_WORK_FINISH_DT', hidden: true},
            {title: '현재위치', dataIndx: 'POP_POSITION', minWidth: 20, width: 80},
            {title: '작업지시번호', align: 'left', dataIndx: 'CONTROL_PART_NUM', width: 180},
            {title: '작업지시번호', align: 'left', dataIndx: 'CONTROL_NUM', hidden: true},
            {title: '파<br>트', dataIndx: 'PART_NUM', hidden: true},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', width: 50},
            {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 40, width: 80},
            {title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'CONCAT_DRAWING_NUM', hidden: true},
            {title: '규격', dataIndx: 'STANDARD_SIZE', minWidth: 40, width: 80},
            {title: '소재 Size', dataIndx: 'MATERAIL_ORDER_SIZE', minWidth: 40, width: 80},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50, editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (!(cellData === '' || cellData === undefined)) {
                        return ui.rowData.SAME_SIDE_YN === 'Y' ? cellData + '&nbsp;<span style="background-color: #C00000; color: white; font-size: 1.2rem; text-align: center; vertical-align: middle;">대</span>' : cellData;
                    }
                }
            },
            {
                title: '진행상태', dataIndx: 'PART_STATUS', minWidth: 20, width: 80,
                render: function (ui) {
                    const cellData = ui.cellData;

                    return cellData === '가공중' ? '<div class="blink">' + cellData + '</div>' : cellData;
                }
            },
            {title: 'NC Plan', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                colModel: [
                    {title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
                    {title: 'NC No.', minWidth: 40, width: 60, dataIndx: 'EQUIP_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: NC_MACHINE},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let index = NC_MACHINE.findIndex(function (element) {
                                    return element.text === Number(cellData);
                                });
                                if (index < 0) {
                                    index = NC_MACHINE.findIndex(function (element) {
                                        return element.value === Number(cellData);
                                    });
                                }
                                return (index < 0) ? cellData : NC_MACHINE[index].text;
                            }
                        }
                    },
                    {title: 'E/T', minWidth: 50, width: 55, datatype: 'integer', dataIndx: 'WORKING_TIME', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
                ]
            },
            {title: '비고 기록사항', dataIndx: 'CONTROL_NOTE', minWidth: 40, width: 100},
            {title: '최근 가공현황', align: 'center',
                 colModel: [
                     {title: '공정', minWidth: 50, width: 50, datatype: 'string', dataIndx: 'NC_WORK_TYPE'},
                     {title: '기기명', minWidth: 40, width: 60, datatype: 'string', dataIndx: 'EQUIP_NM'},
                     {title: '작업자', minWidth: 40, width: 80, dataType: 'string', dataIndx: 'NC_WORK_USER_NM'},
                     {title: 'R/T', minWidth: 50, width: 55, dataType: 'string', align: 'right', dataIndx: 'RECENT_WORKING_TIME'},
                     {title: 'WORK_STATUS', dataIndx: 'WORK_STATUS', hidden: true},
                     {title: 'WORK_STATUS_NM', dataIndx: 'WORK_STATUS_NM', hidden: true}
                ]
            },
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'step', datatype: 'integer', dataIndx: 'CAM_STEP', minWidth: 30, width: 35,
                        render: function (ui) {
                            if (ui.cellData) {
                                return ('<button name="CAM_STEP"><u>' + ui.cellData + '</u></button>');
                            }
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('[name=CAM_STEP]').bind('click', function (e) {
                                e.preventDefault();
                                camWorkManagePreSearchPop(rowData, true);
                            });
                        }
                    },
                    {title: '가공위치', dataIndx: 'WORK_DIRECTION', minWidth: 30, width: 50},
                    // {title: '작업내용', dataIndx: 'WORK_DESC', minWidth: 30, width: 80},
                    {title: '작업자', dataIndx: 'WORK_USER_NM', minWidth: 30, width: 100},
                    /*{title: '파일', dataIndx: '', minWidth: 30, width: 60,
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
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },*/
                    // {title: '비고 및 공유사항', dataIndx: 'NOTE', minWidth: 100, width: 150},
                    {title: '업데이트', dataIndx: 'CAM_FINISH_DT', minWidth: 75, width: 75}
                ]
            },
            // {title: 'MCT Actual', align: 'center',
            //     colModel: [
            //         {title: '1', minWidth: 15, width: 50, dataIndx: 'WORK_EQUIP_NM_1'},
            //         {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', dataIndx: 'WORK_WORKING_TIME_1'},
            //         {title: 'STATUS_1', dataIndx: 'WORK_STATUS_1', hidden: true},
            //         {title: '2', minWidth: 15, width: 50, dataIndx: 'WORK_EQUIP_NM_2'},
            //         {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', dataIndx: 'WORK_WORKING_TIME_2'},
            //         {title: 'STATUS_2', dataIndx: 'WORK_STATUS_2', hidden: true},
            //         {title: '3', minWidth: 15, width: 50, dataIndx: 'WORK_EQUIP_NM_3'},
            //         {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', dataIndx: 'WORK_WORKING_TIME_3'},
            //         {title: 'STATUS_3', dataIndx: 'WORK_STATUS_3', hidden: true},
            //         {title: '4', minWidth: 15, width: 50, dataIndx: 'WORK_EQUIP_NM_4'},
            //         {title: 'R/T', minWidth: 40, width: 40, datatype: 'integer', dataIndx: 'WORK_WORKING_TIME_4'},
            //         {title: 'STATUS_4', dataIndx: 'WORK_STATUS_4', hidden: true},
            //     ]
            // },
            // {
            //     title: '가공진행 현황', align: 'center', colModel: [
            //         {title: 'NC', datatype: 'integer', dataIndx: 'PROCESS_NC', minWidth: 20, width: 30},
            //         {title: '밀링', datatype: 'integer', dataIndx: 'PROCESS_MILLING', minWidth: 20, width: 30},
            //         {title: '선반', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_RACK', minWidth: 20, width: 30},
            //         {title: '연마', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_GRINDING', minWidth: 20, width: 30},
            //     ]
            // },
            // {title: '예상가공<br>시간(M)', dataType: 'integer', dataIndx: 'MCT_WORK_TIME', minWidth: 15, width: 50},
            {title: '참<br>조', minWidth: 30, dataIndx: 'ETC_GFILE_SEQ', styleHead: {'background':'#a9d3f5'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = cellData ? 'floppyDiskAble' : 'floppyDiskDisable';
                    let text = '<span class="' + cls + '" name="attachment" style="cursor: pointer"></span>';

                    return {text: text};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=attachment]').bind('click', function () {
                        if (fnIsGridEditing($mctResultManageGrid)) {
                            return false;
                        }
                        let GfileKey = ui.rowData.ETC_GFILE_SEQ;
                        $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
                        $('#ATTACHMENT_BUTTON').data('rowIndx', ui.rowIndx);
                        $('#ATTACHMENT_BUTTON').data('GfileKey', GfileKey);
                        commonFileDownUploadPopupCall(GfileKey, 'ATTACHMENT_BUTTON');
                    });
                }
            },
            {title: '작업<br>구분', dataIndx: 'MCT_WORK_TYPE_NM', minWidth: 15, width: 50},
            {title: '가공확정<br>일시', dataIndx: 'PROCESS_CONFIRM_DT', minWidth: 75, width: 100},
            {title: '소재입고<br>일시', dataIndx: 'MATERIAL_RECEIPT_DT', minWidth: 75, width: 100},
            // {title: '이전<br>위치', dataIndx: 'POP_PREV_POSITION', minWidth: 70, width: 70},
            // {title: '1ea L/T', dataIndx: '1ea L/T', minWidth: 60, width: 60},
            /*{
                title: '과거 경험(NC 기준)', align: 'center', colModel: [
                    {title: '1ea L/T', dataIndx: '1ea L/T', minWidth: 60, width: 60},
                    {title: '날짜', dataIndx: '날짜', minWidth: 75, width: 75},
                    {title: '수행자', dataIndx: '수행자', minWidth: 50, width: 50}
                ]
            },*/
            {
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'integer', dataIndx: 'INSPECT_STEP', minWidth: 30, width: 35},
                    {title: '판정', dataIndx: 'INSPECT_GRADE', minWidth: 30, width: 35},
                    {title: '불량코드', dataIndx: 'INSPECT_RESULT', minWidth: 30, width: 70},
                    {title: '불량수량', dataIndx: 'ERROR_QTY', minWidth: 20, width: 55,
                        render: function (ui) {
                            let rowData = ui.rowData;

                            if (rowData.INSPECT_GRADE === 'A') {
                                return '';
                            }
                        }
                    },
                    {title: '불량원인', dataIndx: 'ERROR_REASON', minWidth: 30, width: 70},
                    {title: '조치방안', dataIndx: 'ERROR_NOTE', minWidth: 30, width: 70},
                    {title: '작성일자', dataIndx: 'INSPECT_DT', minWidth: 75, width: 75}
                ]
            },
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
        ];

        let machineResultManageObj = {
            minHeight: '100%', height: 730, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false, render: mctResultManageFilterRender}, filterModel: { mode: 'OR' },
            editModel: {clicksToEdit: 1},
            colModel: machineResultManagecolModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: machineResultManagePostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function( event, ui ) {
                //필터
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#mctResultManageFilterColumn").empty();
                $("#mctResultManageFilterColumn").html(filterOpts);
                $("#mctResultManageFrozen").empty();
                $("#mctResultManageFrozen").html(frozenOts);
                // footer
                $('#machine_result_manage_grid-total-records').html(ui.dataModel.data.length);
            },
            render: function () {
                this.option('freezeCols', 14);
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
        /* function */
        /** 제품 리스트 조회 시간 때문에 별도 상세 쿼리 처리 **/
        let camWorkManagePreSearchPop = function (rowData, popOpenFlag){
            let infoParameters = {
                'url': '/json-info',
                'data': {
                    'queryId': 'machine.selectResultManagePopInfo',
                    'CONTROL_NUM': rowData.CONTROL_NUM,
                    'CONTROL_DETAIL_SEQ': rowData.CONTROL_DETAIL_SEQ
                }
            };
            fnPostAjax(function (infoData, infoCallFunctionParam) {
                if (infoData.info) {
                    camWorkManagePop(infoData.info, popOpenFlag);
                } else {
                    fnAlert(null, "작업지시번호를 확인 해 주십시오.");
                    return;
                }
            }, infoParameters, '');
        };

        /** 제품 시작 상세 표시 **/
        let camWorkManagePop = function(rowData, popOpenFlag) {
            fnResetFrom('cam_work_manage_pop_form');
            for (let i = 1; i <= 5; i++) {
                $("#cam_work_manage_pop_form").find("#CAM_WORK_FILE_0" + i).html("");
            }
            $("#cam_work_manage_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
            $("#cam_work_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
            $("#cam_work_manage_pop_form").find("#DXF_GFILE_SEQ").val(rowData.DXF_GFILE_SEQ);
            $("#cam_work_manage_pop_form").find("#IMG_GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
            $("#cam_work_manage_pop_form").find("#CAM_SEQ").val(rowData.CAM_SEQ);
            let controlNum = rowData.CONTROL_NUM;
            if(rowData.PART_NUM) controlNum += " # " + rowData.PART_NUM;
            $("#cam_work_manage_pop_form").find("#CONTROL_NUM").html("<p style='color:blue;'>" + controlNum + "<p/>");
            let controlPartQty = numberWithCommas(rowData.CONTROL_PART_QTY);
            if (rowData.ORIGINAL_SIDE_QTY) controlPartQty += " <span style='color: red'> ( " + rowData.ORIGINAL_SIDE_QTY + ", " + rowData.OTHER_SIDE_QTY + ") </span>";
            $("#cam_work_manage_pop_form").find("#CONTROL_PART_QTY").html(controlPartQty || '');
            let dueOutDt = rowData.INNER_DUE_DT;
            switch (rowData.EMERGENCY_HOLD) {
                case '보류':
                    dueOutDt = '<span class="text-red">보류</span>';
                    break;
                case '긴급':
                    dueOutDt += " <input type='button' class='smallBtn red' value='긴급'>";
                    break;
            }
            $("#cam_work_manage_pop_form").find("#DUE_OUT_DT").html(dueOutDt || '');
            $("#cam_work_manage_pop_form").find("#DRAWING_NUM").html(rowData.CONCAT_DRAWING_NUM || '');
            $("#cam_work_manage_pop_form").find("#WORK_TYPE").html(rowData.WORK_TYPE_NM || '');
            let drawingFile = "";

            /** 21.04.02 중복도면 팝업 처리 - 이수빈 **/
            let str = rowData.CONCAT_DRAWING_NUM;
            let arr = str.split(',');
            if (arr.length === 1) {
                $("#mctWorkPopMctResultDrawingViewBtn").attr('onClick', 'callWindowImageViewer(' + rowData.IMG_GFILE_SEQ + ');');
            } else if (arr.length > 1) {
                $('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(rowData.IMG_GFILE_SEQ);
                $("#mctWorkPopMctResultDrawingViewBtn").attr('onClick', 'commonMultiDownloadPop(' + rowData.CONTROL_SEQ + ',' + rowData.CONTROL_DETAIL_SEQ + ');');
            }

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
            $("#cam_work_manage_pop_form").find("#DXF_DOWNLOAD").html(drawingFile || '');
            $("#cam_work_manage_pop_form").find("#ITEM_NM").html(rowData.ITEM_NM || '');
            $("#cam_work_manage_pop_form").find("#MATERIAL_DETAIL_NM").html(rowData.MATERIAL_DETAIL_NM || '');
            let camWorkDate = rowData.CAM_START_DT;
            if (rowData.CAM_STATUS === "CWS030") camWorkDate = rowData.CAM_FINISH_DT;
            $("#cam_work_manage_pop_form").find("#LAST_WORK_DT").html(camWorkDate || '');
            $("#cam_work_manage_pop_form").find("#SIZE_TXT").html(rowData.SIZE_TXT || '');
            $("#cam_work_manage_pop_form").find("#SURFACE_TREAT_NM").html(rowData.SURFACE_TREAT_NM || '');
            $("#cam_work_manage_pop_form").find("#MCT_NOTE").html(rowData.MCT_NOTE || '');
            $("#cam_work_manage_pop_form").find("#MCT_PLAN_EQUIP_NM").html(rowData.MCT_PLAN_EQUIP_NM || '');
            $("#cam_work_manage_pop_form").find("#LAST_WORK_EQUIP_NM").html(rowData.LAST_WORK_EQUIP_NM || '');
            let camPopHtml = "";
            if(rowData.WORK_HISTORY_INFO){
                camPopHtml = rowData.WORK_HISTORY_INFO + "  ";
                camPopHtml += "<button type='button' class='smallBtn yellow' onclick=\"javascript:g_item_detail_pop_cam_pop('" + rowData.CONTROL_SEQ + "','" + rowData.CONTROL_DETAIL_SEQ + "');\"><i class='fa fa-trash'></i><span >조회</span></button>";
            }
            $("#cam_work_manage_pop_form").find("#WORK_HISTORY_INFO").html(camPopHtml || '');
            $("#cam_work_manage_pop_form").find("#HISTORY_NOTE").val(rowData.HISTORY_NOTE);
            $("#cam_work_manage_pop_form").find("#NOTE").val(rowData.NOTE);
            let parameters = {
                'url': '/json-list',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                var icount = 1;
                if(data.list.length > 0) {
                    for (let i = 0; i < data.list.length; i++) {
                        let fileHtml = "";
                        if (rowData.CAM_STATUS === "CWS020") {
                            fileHtml += data.list[i].CAM_FILE_SEQ ? '<a href="/downloadfile/' + data.list[i].CAM_FILE_SEQ + '" download style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].CAM_FILE_NM + '</a>' : '';
                            fileHtml += data.list[i].NC_FILE_SEQ ? '<a href="/downloadfile/' + data.list[i].NC_FILE_SEQ + '" download style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].NC_FILE_NM : '';
                        } else {
                            fileHtml += data.list[i].CAM_FILE_SEQ ? '<p style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].CAM_FILE_NM + '</p>' : '';
                            fileHtml += data.list[i].NC_FILE_SEQ ? '<p style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + data.list[i].NC_FILE_NM + '</p>' : '';
                        }
                        camWorkStepStatusConfig("0" + icount, true);
                        $('#cam_work_manage_detail_pop').find("#CAM_WORK_SEQ_0" + icount).val(data.list[i].SEQ);
                        $('#cam_work_manage_detail_pop').find("#CAM_WORK_GFILE_SEQ_0" + icount).val(data.list[i].CAM_GFILE_SEQ);
                        $('#cam_work_manage_detail_pop').find("select[id='CAM_WORK_DIRECTION_0" + icount + "']").val(data.list[i].WORK_DIRECTION);
                        $('#cam_work_manage_detail_pop').find("#CAM_WORK_DESC_0" + icount).val(data.list[i].WORK_DESC);
                        $('#cam_work_manage_detail_pop').find("#CAM_WORK_DESIGN_QTY_0" + icount).val(data.list[i].DESIGN_QTY);
                        $('#cam_work_manage_detail_pop').find("select[id='CAM_WORK_USER_ID_0" + icount + "']").val(data.list[i].WORK_USER_ID);
                        $("#cam_work_manage_detail_pop").find("#CAM_WORK_FILE_0" + icount).html(fileHtml);
                        icount++;
                    }
                }
                for (let i = icount; i <= 5; i++) {
                    // if(i == 1 && rowData.CAM_STATUS === "CWS020"){
                    //     camWorkStepStatusConfig("0" + i, true);
                    // }else {
                    //     camWorkStepStatusConfig("0" + i, false);
                    // }
                    camWorkStepStatusConfig("0" + i, false);
                    $("#cam_work_manage_detail_pop").find("#CAM_WORK_FILE_0" + i).html('');
                }
                $("#cam_work_manage_detail_pop").find("#CAM_STATUS").val(rowData.CAM_STATUS);
                // 상태에 따른 Check box 처리
                camWorkStatusConfig(rowData);
                if (popOpenFlag) $('#cam_work_manage_detail_pop').modal('show');

            }, parameters, '');
        };

        $("#cam_work_manage_detail_pop").find('.cam_work_manage_detail_pop_close').on('click', function () {
            $('#cam_work_manage_detail_pop').modal('hide');
            // $mctCamManageSearchBtn.trigger("click");
        });

        /* event */
        $camWorkStartBtn.click(function (event) {
            let title = "CAM 작업 정보";
            let message = "CAM 작업을 시작 하시겠습니까?";

            fnConfirm(title, message, function () {
                $(this).startWaitMe();

                $("#cam_work_manage_pop_form").find("#actionType").val("start");
                let parameters = {
                    'url': '/managerCamWork',
                    'data': $('#cam_work_manage_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    let infoParameters = {
                        'url': '/json-info',
                        'data': {
                            'queryId': 'machine.selectResultManagePopInfo',
                            'CONTROL_NUM': $('#cam_work_manage_pop_form').find('#CONTROL_NUM').val(),
                            'CONTROL_DETAIL_SEQ': $('#cam_work_manage_pop_form').find('#CONTROL_DETAIL_SEQ').val()
                        }
                    };
                    fnPostAjax(function (infoData, infoCallFunctionParam) {
                        $(this).stopWaitMe();
                        if (infoData.info) {
                            camWorkManagePop(infoData.info, false);
                            $mctCamManageSearchBtn.trigger("click");
                        } else {
                            fnAlert(null, "작업지시번호를 확인 해 주십시오. 실적 등록 대상이 아닙니다.");
                            return;
                        }
                    }, infoParameters, '');
                    // $('#cam_work_manage_detail_pop').modal('hide');
                    // $mctCamManageSearchBtn.trigger("click");
                }, parameters, '');
            });
        });

        $camWorkTempSaveBtn.click(function(event) {
            let failMessage = camWorkStepSaveValidation();
            if(failMessage){
                fnAlert(null, failMessage);
                return false;
            }
            $("#cam_work_manage_pop_form").find("#actionType").val("temp");
            let parameters = {
                'url': '/managerCamWork',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            $camWorkTempSaveBtn.focus();
            fnPostAjax(function (data, callFunctionParam) {
                fnAlert(null, "임시저장을 완료 하였습니다.");
                $mctCamManageSearchBtn.trigger("click");
            }, parameters, '');
        });

        $camWorkSaveAndCompleteBtn.click(function(event) {
            let failMessage = camWorkStepSaveValidation();
            if(failMessage){
                fnAlert(null, failMessage);
                return false;
            }
            $("#cam_work_manage_pop_form").find("#actionType").val("complete");
            let parameters = {
                'url': '/managerCamWork',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            $camWorkSaveAndCompleteBtn.focus();
            fnPostAjax(function (data, callFunctionParam) {
                let controlNum = $('#cam_work_manage_pop_form').find('#CONTROL_NUM').val();
                let controlDetailSeq = $('#cam_work_manage_pop_form').find('#CONTROL_DETAIL_SEQ').val();
                fnPopLoadControlPartInfo(controlNum, controlDetailSeq);
                $mctCamManageSearchBtn.trigger("click");
            }, parameters, '');
        });

        $camWorkCancelBtn.click(function(event) {
            let title = "CAM 작업 정보";
            let message = "CAM 작업을 취소 하시겠습니까?";

            fnConfirm(title, message, function () {
                $("#cam_work_manage_pop_form").find("#actionType").val("cancel");
                let parameters = {
                    'url': '/managerCamWork',
                    'data': $('#cam_work_manage_pop_form').serialize()
                };
                $camWorkCancelBtn.focus();
                fnPostAjax(function (data, callFunctionParam) {
                    let controlNum = $('#cam_work_manage_pop_form').find('#CONTROL_NUM').val();
                    let controlDetailSeq = $('#cam_work_manage_pop_form').find('#CONTROL_DETAIL_SEQ').val();
                    fnPopLoadControlPartInfo(controlNum, controlDetailSeq);
                    $mctCamManageSearchBtn.trigger("click");
                }, parameters, '');
            });
        });

        /**
         * @description Ajax Post
         * @param {function} callFunction - 리텅 Function 처리
         * @param {object} params - 호출 URL에 Parameter 정보
         * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
         */
        let fnPopLoadControlPartInfo = function (controlNum, controlDetailSeq) {
            'use strict';

            $(this).startWaitMe();
            let infoParameters = {
                'url': '/json-info',
                'data': {
                    'queryId': 'machine.selectResultManagePopInfo',
                    'CONTROL_NUM': controlNum,
                    'CONTROL_DETAIL_SEQ': controlDetailSeq
                }
            };
            fnPostAjax(function (infoData, infoCallFunctionParam) {
                $(this).stopWaitMe();
                if (infoData.info) {
                    camWorkManagePop(infoData.info, false);
                } else {
                    fnAlert(null, "작업지시번호를 확인 해 주십시오. 실적 등록 대상이 아닙니다.");
                    return;
                }
            }, infoParameters, '');
        };

        $mctCamManageSearchBtn.click(function(event) {
            $mctResultManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#mct_result_manage_search_form'));
            });
            $mctResultManageGrid.pqGrid('refreshDataAndView');
        });

        /** 파일 업로드 스크립트 **/
        $(".mctWorkStyle").on("dragenter", function (e) {  //드래그 요소가 들어왔을떄
            $(this).addClass('drag-over');
        }).on("dragleave", function (e) {  //드래그 요소가 나갔을때
            $(this).removeClass('drag-over');
        }).on("dragover", function (e) {
            e.stopPropagation();
            e.preventDefault();
        }).on('drop', function (e) {  //드래그한 항목을 떨어뜨렸을때
            e.preventDefault();

            const camStatus = $("#cam_work_manage_detail_pop").find("#CAM_STATUS").val();

            if (camStatus === 'CWS020') {
                $(this).removeClass('drag-over');
                let idxNum = $(this).attr("idx");
                let isCheckYn = $("#cam_work_manage_pop_form").find("#CAM_WORK_CHK_" + idxNum).prop('checked');
                if (!isCheckYn) {
                    $('#cam_work_manage_pop_form').find("input:checkbox[id='CAM_WORK_CHK_" + idxNum + "']").trigger("click");
                }
                let mctCamWorkUploadFiles = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
                if (mctCamWorkUploadFiles.length > 0) { // file upload
                    let formData = new FormData();
                    for (let i = 0; i < mctCamWorkUploadFiles.length; i++) {
                        let file = mctCamWorkUploadFiles[i];
                        formData.append('file', file, file.name);
                    }
                    fnFormDataFileUploadAjax(function (data) {
                        let fileUploadList = data.fileUploadList;
                        let GFILE_SEQ = fileUploadList[0].GFILE_SEQ;
                        let fileHtml = "";
                        for (let j = 0; j < fileUploadList.length; j++) {
                            if (j > 0) fileHtml += "<br>";
                            fileHtml += '<a href="/downloadfile/' + fileUploadList[j].FILE_SEQ + '" download style="overflow: hidden;text-overflow:ellipsis;white-space:nowrap;display:inline-block;max-width:100%;vertical-align:top;">' + fileUploadList[j].ORGINAL_FILE_NM + '</a>';
                        }
                        if (fileUploadList.length === 1) fileHtml += "<br>";
                        $("#cam_work_manage_pop_form").find("#CAM_WORK_FILE_" + idxNum).html(fileHtml);
                        $("#cam_work_manage_pop_form").find("#CAM_WORK_GFILE_SEQ_" + idxNum).val(GFILE_SEQ);
                    }, formData, '');
                }
            } else {
                fnAlert('', '작업 시작후 저장 가능합니다');
            }
        });
        /** 파일 업로드 스크립트 종료 **/


        $('#mctResultManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($mctResultManageGrid, 'mctResultManageFilterKeyword', 'mctResultManageFilterCondition', 'mctResultManageFilterColumn');

                let data = $mctResultManageGrid.pqGrid('option', 'dataModel.data');
                $('#machine_result_manage_grid-total-records').html(data.length);
            },
            'search': function () {
                fnFilterHandler($mctResultManageGrid, 'mctResultManageFilterKeyword', 'mctResultManageFilterCondition', 'mctResultManageFilterColumn');

                let data = $mctResultManageGrid.pqGrid('option', 'dataModel.data');
                $('#machine_result_manage_grid-total-records').html(data.length);
            }
        });

        $("#mctResultManageFrozen").on('change', function(e){
            fnFrozenHandler($mctResultManageGrid, $(this).val());
        });

        /** 팝업 제품 상세 보기 **/
        $("#cam_work_manage_pop_form").find("#mctWorkPopMctResultDetailViewBtn").click(function(event) {
            g_item_detail_pop_view($("#cam_work_manage_pop_form").find("#CONTROL_SEQ").val(), $("#cam_work_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val());
        });
        /** 팝업 제품 도면 보기 **/
        /** 21.04.02 중복도면 팝업 처리를 위한 주석 - 이수빈 **/
        // $("#cam_work_manage_pop_form").find("#mctWorkPopMctResultDrawingViewBtn").click(function(event) {
        //     callWindowImageViewer($("#cam_work_manage_pop_form").find("#IMG_GFILE_SEQ").val());
        // });

        $("#cam_work_manage_pop_form").find(".camworkChekbox").click(function(){
            let attrName = $(this).attr('name');
            let indexNum = attrName.split('_').reverse()[0];
            camWorkStepStatusConfig(indexNum, $(this).prop('checked'));
        });

        /** 저장 & 완료 & 임시 저장시 Validation 처리 **/
        let camWorkStepSaveValidation = function(){
            let beforeCheckOrder = true;
            let returnMessage = "";
            let checkCount = 0;
            $("#cam_work_manage_pop_form").find("input:checkbox[id^='CAM_WORK_CHK_']").each(function() {
                if($(this).prop('checked')) {
                    let indexNum = $(this).attr('name').split('_').reverse()[0];
                    if (!beforeCheckOrder) {
                        returnMessage = "순차적으로 CAM 작업 등록을 하여야 합니다. 확인 후 진행해 주십시오.";
                        return;
                    }
                    if ($("#cam_work_manage_pop_form").find("#CAM_WORK_DIRECTION_" + indexNum).val() == "") {
                        returnMessage = "Step " + parseInt(indexNum) + " 항목의 위치를 확인 해 주십시오.";
                        return;
                    }
                    if ($("#cam_work_manage_pop_form").find("#CAM_WORK_DESIGN_QTY_" + indexNum).val() == "") {
                        returnMessage = "Step " + parseInt(indexNum) + " 항목의 작업 수량을 확인 해 주십시오.";
                        return;
                    }
                    if ($("#cam_work_manage_pop_form").find("#CAM_WORK_USER_ID_" + indexNum).val() == "") {
                        returnMessage = "Step " + parseInt(indexNum) + " 항목의 작업자를 확인 해 주십시오.";
                        return;
                    }
                    if ($("#cam_work_manage_pop_form").find("#CAM_WORK_GFILE_SEQ_" + indexNum).val() == "") {
                        returnMessage = "Step " + parseInt(indexNum) + " 항목의 설계파일을 확인 해 주십시오.";
                        return;
                    }
                    beforeCheckOrder = true;
                    checkCount++;
                }else{
                    beforeCheckOrder = false;
                }
            });
            if(checkCount == 0){
                returnMessage = "하나 이상의 Step 정보를 등록하여야 합니다.";
            }
            return returnMessage;
        }

        /** 선택 setp 에 따른 활성화 비활성화 처리 **/
        let camWorkStepStatusConfig = function(index, disableFlag){
            if(disableFlag){    // 체크 처리
                disableFlag = false;
                $('#cam_work_manage_pop_form').find("input:checkbox[id='CAM_WORK_CHK_" + index + "']").prop("checked", true);
                if($("#cam_work_manage_pop_form").find("select[name='CAM_WORK_USER_ID_" + index + "']").val() === ""){
                    $("#cam_work_manage_pop_form").find("select[name='CAM_WORK_USER_ID_" + index + "']").each(function() {
                        $(this).val('${authUserInfo.USER_ID}');
                    });
                }
                <%--$("#cam_work_manage_pop_form").find("select[name='CAM_WORK_USER_ID_" + index + "']").each(function() {--%>
                <%--    $(this).val('${authUserInfo.USER_ID}');--%>
                <%--});--%>
            } else {            // 체크 안됨
                disableFlag = true;
                $('#cam_work_manage_pop_form').find("input:checkbox[id='CAM_WORK_CHK_" + index + "']").prop("checked", false);
                // $("#cam_work_manage_pop_form").find("select[name*='" + index + "']").each(function() {
                //     if($(this).find('option:first').val() == ''){
                //         $(this).val('');
                //     } else {
                //         $(this).val($(this).find('option:first').val());
                //     }
                // });
                // $("#cam_work_manage_pop_form").find("input[name*='" + index + "']").val("");
            }
            // console.log(index);
            // console.log(disableFlag);
            $("#cam_work_manage_pop_form").find("input[name*='" + index + "']").attr('readonly', disableFlag);
            $("#cam_work_manage_pop_form").find("input[name*='" + index + "']").attr('disabled', disableFlag);
            $("#cam_work_manage_pop_form").find("select[name*='" + index + "']").attr('readonly', disableFlag);
            $("#cam_work_manage_pop_form").find("select[name*='" + index + "']").attr('disabled', disableFlag);

            $('#cam_work_manage_pop_form').find("input:checkbox[id='CAM_WORK_CHK_" + index + "']").attr('readonly', false);
            $('#cam_work_manage_pop_form').find("input:checkbox[id='CAM_WORK_CHK_" + index + "']").attr('disabled', false);

            // $("#cam_work_manage_pop_form").find("#CAM_WORK_CHK_" + index).attr('readonly', false);
            // $("#cam_work_manage_pop_form").find("#CAM_WORK_CHK_" + index).attr('disabled', false);

        }

        /** 시작 전 Disable 처리 **/
        let camWorkStatusConfig = function(rowData){
            let disableFlag = true;
            let disableCheck = true;
            switch (rowData.CAM_STATUS) {
                case 'CWS010':     // 대기
                case 'CWS030':     // 완료
                    disableFlag = true;
                    $('#cam_work_manage_detail_pop').find(".beforeStart").show();
                    $('#cam_work_manage_detail_pop').find(".afterStart").hide();
                    break;
                default:
                    disableCheck = false;
                    $('#cam_work_manage_detail_pop').find(".beforeStart").hide();
                    $('#cam_work_manage_detail_pop').find(".afterStart").show();
                    break;
            }
            // $("#cam_work_manage_pop_form").find(".statusConfig").attr('readonly', disableFlag);
            // $("#cam_work_manage_pop_form").find(".statusConfig").attr('disabled', disableFlag);
            // $("#cam_work_manage_pop_form").find(".camworkChekbox").attr('checkec', false);
            $("#cam_work_manage_pop_form").find(".camworkChekbox").attr('disabled', disableCheck);
            $("#cam_work_manage_pop_form").find("#HISTORY_NOTE").attr('readonly', disableCheck);
            $("#cam_work_manage_pop_form").find("#HISTORY_NOTE").attr('disabled', disableCheck);
            $("#cam_work_manage_pop_form").find("#NOTE").attr('readonly', disableCheck);
            $("#cam_work_manage_pop_form").find("#NOTE").attr('disabled', disableCheck);
        }

        function mctResultManageFilterRender(ui) {
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
                var condition = $("#mctResultManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#mctResultManageFilterKeyword").val(),
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

        $mctResultManageGrid = $('#' + machineResultManageGridId).pqGrid(machineResultManageObj);
    });

    $('#MCT_RESULT_MANAGE_EXCEL_EXPORT').on('click', function () {
        const blob = $mctResultManageGrid.pqGrid('getInstance').grid.exportData({
            format: 'xlsx',
            render: true,
            type: 'blob'
        });

        saveAs(blob, 'MCT 실적관리.xlsx');
    });
    
    $('#MCT_RESULT_MANAGE_SAVE').on('click', function () {
        const insertQueryList = ['machine.insertMctPlan'];
        const updateQueryList = ['machine.deleteMctPlanAll', 'machine.insertMctPlan'];
        // const updateQueryList = ['machine.updateMctPlanFromTarget'];

        fnModifyPQGrid($mctResultManageGrid, insertQueryList, updateQueryList);
    });

    $('#mct_result_manage_search_form').find('#EQUIP_SEQ').on('change', function () {
        if (fnIsEmpty(this.value)) {
            $('#mct_result_manage_search_form').find('#INCLUDE_UNALLOCATED_WAIT').parent().hide();
        } else {
            $('#mct_result_manage_search_form').find('#INCLUDE_UNALLOCATED_WAIT').parent().show();
        }
    });

    $('#INCLUDE_UNALLOCATED_WAIT').on('click', function () {
        $('#mctCamManageSearchBtn').click();
    });
    /* event */
    function resetMctResult(index){
        $("#cam_work_manage_pop_form").find("#CAM_WORK_DIRECTION_" + index).val($("#cam_work_manage_pop_form").find("#CAM_WORK_DIRECTION_" + index).find('option:first').val());
        $("#cam_work_manage_pop_form").find("#CAM_WORK_DESC_" + index).val('');
        $("#cam_work_manage_pop_form").find("#CAM_WORK_DESIGN_QTY_" + index).val('');
        $("#cam_work_manage_pop_form").find("#CAM_WORK_USER_ID_" + index).val($("#cam_work_manage_pop_form").find("#CAM_WORK_USER_ID_" + index).find('option:first').val());
        $("#cam_work_manage_pop_form").find("#CAM_WORK_FILE_" + index).html('');
    }


</script>
