<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<audio id='fail_play' src='/resource/sound/fail.wav'></audio>
<audio id='success_play' src='/resource/sound/success.wav'></audio>
<form id="hidden_action_frm" name="hidden_action_frm" action="" target="_self" method="post">
</form>
<form id="common_formdata_multi_upload_form" method="post">
    <input type="file" id="click_singfile_chose_btn" name="click_singfile_chose_btn" style="display: none;">
    <input type="file" id="click_multifile_chose_btn" name="click_multifile_chose_btn" multiple  style="display: none;">
</form>
<form id="estimate_version_up_sequence_form">
    <input type="hidden" id="hidden_est_seq" name="hidden_est_seq">
    <input type="hidden" id="hidden_control_seq" name="hidden_control_seq">
</form>
<form id="drawing_file_upload_form" name="drawing_file_upload_form" method="post">
    <input type="hidden" id="actionType" name="actionType">
    <input type="hidden" id="queryId" name="queryId">
</form>
<!-- 파일 다운로드 공통 Start -->
<div class="modal" id="common_file_download_upload_pop" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg cadDrawing">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="headerTitle_01">다운로드</h2>
            </div>
            <div class="modal-body" id="commonFileUpdatePop">
                <form class="" role="form" id="common_file_download_form" name="common_file_download_form" method="POST">
                    <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
                    <input type="hidden" id="callElement" name="callElement" value="">
                    <input type="hidden" id="deleteYn" name="deleteYn" value="">
                    <div id="common_file_download_upload_grid" style="margin:auto;"></div>
                    <div class="right_sort fileTableInfoWrap">
                        <h4>전체 조회 건수 (Total : <span id="filedownloadTotalCount" style="color: #00b3ee">0</span>)</h4>
                    </div>
                </form>
                <div class="btnWrap" style="text-align: center;">
                    <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 파일 다운로드 공통 End -->
<!-- 인쇄 도면 div start -->
<div class="modal" id="common_confirm_popup" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 10000;">
    <div class="modal-dialog cadDrawing" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close commonConfirmCloseBtn" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="commonConfirmHeadHtml">출력 정보</h2>
            </div>
            <div class="modal-body">
                <div id="commonConfirmBodyHtml">
                    <h4>
                        <img style='width: 32px; height: 32px;' src='/resource/main/images/print.png'>&nbsp;&nbsp;
                        <span>32 건의 바코드 도면이 출력 됩니다.</span> 진행하시겠습니까?
                    </h4>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="commonConfirmYesBtn" class="defaultBtn radius blue">출력</button>
                <button type="button" id="commonConfirmCloseBtn" class="defaultBtn radius commonConfirmCloseBtn" data-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>
<%--<div class="cadDrawingPrint page" style="display: none; height: 1px;"></div>--%>
<!-- 인쇄 div end -->
<form id="barcode_form">
    <input type="hidden" id="queryId" name="queryId" value="popMapper.selectBarcodeInfo">
    <input type="hidden" id="popBarcode" name="popBarcode">
</form>
<!-- Excel Hidden Form -->
<form id="common_excel_form" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectEstimateDetailListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="EST_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="estimate_list_template"/>
</form>
<!-- 주문상세정보 layer popup : S -->
<div class="popup_container g_item_detail_pop" id="g_item_detail_pop" style="display: none;">
    <div class="layerPopup">
        <h3>주문상세정보</h3>
        <span class="right_float mr-30">
            <span class="barCode" id="g_item_detail_pop_barcode_span"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>
            <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode hg_30" name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>
        </span>
        <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>
        <div class="qualityWrap">
            <div class="h_area"></div>
            <form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form" onsubmit="return false;">
                <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInfo"/>
                <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
                <input type="hidden" id="ASSEMBLY_CONTROL_DETAIL_SEQ" name="ASSEMBLY_CONTROL_DETAIL_SEQ"/>
                <input type="hidden" id="FIRST_PART_CONTROL_DETAIL_SEQ" name="FIRST_PART_CONTROL_DETAIL_SEQ"/>
                <input type="hidden" id="PREV_PART_CONTROL_DETAIL_SEQ" name="PREV_PART_CONTROL_DETAIL_SEQ" value=""/>
                <input type="hidden" id="NEXT_PART_CONTROL_DETAIL_SEQ" name="NEXT_PART_CONTROL_DETAIL_SEQ" value=""/>
                <div class="d-flex align-items-center">
                    <h4>기본정보</h4>
                    <div id="view_part_wrap" style="margin-left: 75px;">
                        <button class="defaultBtn" name="view_assembly_or_part" id="WTP020" value="WTP020">조립</button>
                        <button class="defaultBtn" name="view_assembly_or_part" id="WTP050" value="WTP050">파트</button>
                        <span name="view_part" id="view_part_prev" style="cursor: pointer;">
                            <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표" style="width: 15px;">
                        </span>
                        <span name="view_part" id="view_part_next" style="cursor: pointer;">
                            <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표" style="width: 15px;">
                        </span>
                    </div>
                    <div class="btnWrap ml-auto mb-10">
                        <button id="CAD_DOWNLOAD" class="d-none defaultBtn">캐드파일</button>
                        <button id="DRAWING_VIEW" class="defaultBtn">도면보기</button>
                        <button id="WORK_HISTORY_INFO" class="defaultBtn">유사주문 수행기록</button>
                    </div>
                </div>
                <div class="list1">
                    <table class="rowStyle" style="table-layout: fixed;">
                        <colgroup>
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
                            <col width="15%">
                            <col width="10%">
                            <col width="15%">
                        </colgroup>
                        <tr>
                            <th>
                                <span name="control_num_arrow" id="left_arrow" data-value="-1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표" style="width: 15px;">
                                </span>
                                <span>관리번호</span>
                                <span name="control_num_arrow" id="right_arrow" data-value="1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표" style="width: 15px;">
                                </span>
                            </th>
                            <td id="CONTROL_NUM" class="red"></td>
                            <th>형태/수량(원,대)</th>
                            <td id="WORK_TYPE_NM_ORDER_QTY_INFO"></td>
                            <th>가공납기</th>
                            <td id="INNER_DUE_DT"></td>
                        </tr>
                        <tr>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM" class="red"></td>
                            <th>규격</th>
                            <td id="SIZE_TXT"></td>
                            <th class="antiquewhite">진행상태</th>
                            <td id="PART_STATUS_NM"></td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td id="ITEM_NM"></td>
                            <th>소재종류</th>
                            <td id="MATERIAL_DETAIL_NM"></td>
                            <th class="antiquewhite">현재위치</th>
                            <td id="POP_POSITION_NM"></td>
                            <%--<th>소재Size</th>--%>
                            <%--<td id="MATERIAL_SIZE_TXT" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>--%>
                        </tr>
                        <tr>
                            <th>모듈</th>
                            <td id="MODULE_NM" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
                            <th>표면처리</th>
                            <td id="SURFACE_TREAT_NM"></td>
                            <th class="antiquewhite">가공확정 일시</th>
                            <td id="PROCESS_CONFIRM_DT"></td>
                            <%--<th>소재주문상태</th>--%>
                            <%--<td id="MATERIAL_ORDER_STATUS_NM"></td>--%>
                        </tr>
                        <tr>
                            <th>프로젝트</th>
                            <td id="PROJECT_NM"></td>
                            <th>외주확정 일시</th>
                            <td id="OUTSIDE_CONFIRM_DT"></td>
                            <th class="antiquewhite">소재주문 일시</th>
                            <td id="MATERIAL_ORDER_DT"></td>
                            <%--<th>도면수정Rev.</th>--%>
                            <%--<td id="DRAWING_VER"></td>--%>
                            <%--<th>도면파일</th>--%>
                            <%--<td id="DXF_GFILE_SEQ"></td>--%>
                        </tr>
                        <tr>
                            <th class="palegoldenrod">발주처/설계자</th>
                            <td id="ORDER_COMP_NM_DESIGNER_NM"></td>
                            <th>외주업체명</th>
                            <td id="OUTSIDE_COMP_NM"></td>
                            <th class="antiquewhite">소재입고 일시</th>
                            <td id="MATERIAL_IN_DT"></td>
                        </tr>
                        <tr>
                            <th class="palegoldenrod">주문 확정</th>
                            <td id="CONTROL_CONFIRM_DT"></td>
                            <th>외주요청 일시</th>
                            <td id="OUTSIDE_PROCESS_CONFIRM_DT"></td>
                            <th class="antiquewhite blueviolet">가공완료 일시</th>
                            <td id="PROCESS_FINISH_DT" class="blueviolet"></td>
                            <%--<th>최근유사가공</th>--%>
                            <%--<td id="WORK_HISTORY_INFO"></td>--%>
                        </tr>
                        <tr>
                            <th class="palegoldenrod">주요 검사</th>
                            <td id="MAIN_INSPECTION_NM"></td>
                            <th>외주입고 일시</th>
                            <td id="OUTSIDE_IN_DT"></td>
                            <th class="antiquewhite blueviolet">출고완료 일시</th>
                            <td id="OUT_FINISH_DT" class="blueviolet"></td>
                        </tr>

                    </table>
                </div>

                <div class="listdiv">
                    <div class="tableWrap">
                        <ul class="conWrapPop60">
                            <h4>가공이력</h4>
                            <span class="slt_wrap namePlusSlt rightName">
                                <label for="g_item_detail_pop_grid_01_info_1">총시간</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_1" class="wd_60" style="text-align: right; padding: 0 5px;" title="총시간">
                                <label for="g_item_detail_pop_grid_01_info_2">선반</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_2" class="wd_60" style="text-align: right; padding: 0 5px;" title="선반">
                                <label for="g_item_detail_pop_grid_01_info_3">NC</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_3" class="wd_60" style="text-align: right; padding: 0 5px;" title="NC">
                                <label for="g_item_detail_pop_grid_01_info_4">밀링</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_4" class="wd_60" style="text-align: right; padding: 0 5px;" title="밀링">
                                <label for="g_item_detail_pop_grid_01_info_5">연마</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_5" class="wd_60" style="text-align: right; padding: 0 5px;" title="연마">
                            </span>
                            <div id="g_item_detail_pop_grid_01" class="jqx-refresh"></div>
                        </ul>
                        <ul class="conWrapPop40">
                            <h4>위치변동이력</h4>
                            <div id="g_item_detail_pop_grid_02" class="jqx-refresh"></div>
                        </ul>
                    </div>
                </div>
                <div class="listdiv">
                    <div class="tableWrap">
                        <ul class="conWrapPop60">
                            <h4>CAM작업이력 <span style="color:#7d1919" id="g_item_detail_pop_grid_04_info1"></span></h4>
                            <span class="slt_wrap namePlusSlt rightName">
                                <label id="g_item_detail_pop_grid_04_info2">Update </label>
                            </span>
                            <div id="g_item_detail_pop_grid_04" class="jqx-refresh"></div>
                        </ul>
                        <ul class="conWrapPop40">
                            <h4>공유사항</h4>
                            <div id="g_item_detail_pop_grid_03" class="jqx-refresh"></div>
                        </ul>
                    </div>
                </div>
                <h4>품질사항</h4>
                <div class="list4">
                    <div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>
                </div>
            </form>
        </div>
        <div class="btnWrap">
            <%--                <button type="button" class="defaultBtn purple work_info_area" id="g_item_cam_work_start_btn" style="display: none;">CAM 작업시작</button>--%>
            <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close">닫기</button>
        </div>
    </div>
</div>
<!-- 주문상세정보 layer popup : E -->

<!-- -->
<div class="modal" id="common_alert_popup" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 10000;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" name="commonAlertYesBtn" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="commonAlertHeadHtml">정보</h2>
            </div>
            <div class="modal-body">
                <div id="commonAlertBodyHtml">
                    <h4>
                        <img style='width: 32px; height: 32px;' src="/resource/asset/images/work/alert.png">
                        <span></span>
                    </h4>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="defaultBtn radius blue" name="commonAlertYesBtn" id="commonAlertYesBtn">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- -->

<!-- 창고 공통 팝업 : S -->
<div class="popup_container" id="common_warehouse_manage_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content; width: 700px;">
        <h3>위치정보관리</h3>
        <button type="button" class="pop_close mt-10 mr-8" data-dismiss="modal">닫기</button>
        <form class="form-inline" role="form" id="common_warehouse_manage_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="material.selectCommonWarehouseManageList">
            <input type="hidden" id="LOC_SEQ" name="LOC_SEQ" value="">
            <div class="t_area mt-10">
                <div class="t_h">
                    <span class="list_t" style="width: 110px;">창고명</span>
                    <span style="width: 190px;">
                        <select name="WAREHOUSE_CD" id="WAREHOUSE_CD">
                            <%--<option value=""><spring:message code="com.form.top.sel.option" /></option>--%>
                            <c:forEach var="code" items="${HighCode.H_1049}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <div style="width: 140px; line-height: 45px;" class="d-inline right_float">
                        <button type="button" class="defaultBtn radius" id="btnCommonWarehouseManageAdd">추가</button>
                        <button type="button" class="defaultBtn radius green" id="btnCommonWarehouseManageRemove">삭제</button>
                    </div>
                </div>
            </div>
            <div class="h_area mb-10">

            </div>
            <h2>&nbsp;</h2>
            <div class="tableWrap">
                <div id="common_warehouse_manage_grid" class="jqx-refresh"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="common_warehouse_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="btnCommonWarehouseManageSave">저장</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>
<!-- 창고 공통 팝업 : E -->
<!-- 사용자 정보 팝업 : S -->
<div class="popup_container" id="user_info_pop" style="display: none;">
    <form class="form-inline" id="user_info_pop_form" name="user_info_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="systemMapper.insertMasterUser">
        <input type="hidden" id="selUserId" name="selUserId" value="">
        <div class="userLayerPopup">
            <h3>사용자 정보</h3>
            <button type="button" class="pop_close mt-10 mr-8" id="user_info_pop_close2">닫기</button>
            <div class="qualityWrap">
                <div class="userResultWrap99 userInfoList99">
                    <div class="leftWrap" style="margin-top: 16px;">
                        <input type="hidden" id="PHOTO_GFILE_SEQ" name="PHOTO_GFILE_SEQ" value="">
                        <img src="/image/999" id="PHOTO_GFILE_SRC" width="180px" alt="사용자사진" style="border:1px solid #707070">
                        <div class="btnWrap">
                            <button type="button" id="user_info_upload" class="defaultBtn">사진변경하기</button>
                        </div>
                    </div>
                    <div class="rightWrap">
                        <table class="rowStyle">
                            <caption></caption>
                            <colgroup>
                                <col width="130px">
                                <col width="151px">
                                <col width="130px">
                                <col width="151px">
                            </colgroup>
                            <tr>
                                <th scope="row">아이디</th>
                                <td><input type="text" name="USER_ID" id="USER_ID" placeholder="아이디" value="" title="아이디" class="wd_130"></td>
                                <th scope="row">이름</th>
                                <td><input type="text" name="USER_NM" id="USER_NM" placeholder="이름" value="" title="이름" class="wd_130"></td>
                            </tr>
                            <tr>
                                <th scope="row">패스워드</th>
                                <td ><input type="text" name="USER_PWD" id="USER_PWD" placeholder="패스워드" value="" title="패스워드" class="wd_130"></td>
                                <th scope="row">패스워드(Re.)</th>
                                <td><input type="text" name="R_USER_PWD" id="R_USER_PWD" placeholder="패스워드체크" value="" title="패스워드체크" class="wd_130"></td>
                            </tr>
                            <tr>
                                <th scope="row">연락처</th>
                                <td><input type="text" name="USER_TEL" id="USER_TEL" placeholder="연락처" value="" title="연락처" class="wd_130"></td>
                                <th scope="row">이메일</th>
                                <td><input type="text" name="USER_EMAIL" id="USER_EMAIL" placeholder="이메일" value="" title="이메일" class="wd_130"></td>
                            </tr>
                            <tr>
                                <th scope="row">직급</th>
                                <td><input type="text" name="POSITION_NM" id="POSITION_NM" placeholder="직급" value="" title="직급" class="wd_130"></td>
                                <th scope="row">직책</th>
                                <td><input type="text" name="JOB_TITLE" id="JOB_TITLE" placeholder="직책" value="" title="직책" class="wd_130"></td>
                            </tr>
                            <tr>
                                <th scope="row">부서</th>
                                <td>
                                    <select id="DEPARTMENT" name="DEPARTMENT" data-required="true" class="wd_130">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1061}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">권한그룹</th>
                                <td>
                                    <select id="ROLE_SEQ" name="ROLE_SEQ" data-required="true" class="wd_130"></select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">사용프린터</th>
                                <td><input type="text" name="USER_PRINTER" id="USER_PRINTER" placeholder="사용프린터" value="" title="사용프린터" class="wd_130"></td>
                                <th scope="row">삭제여부</th>
                                <td>
                                    <select id="DEL_YN" name="DEL_YN" data-required="true" class="wd_130">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1042}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn grayPopGra" id="user_info_pop_close">닫기</button>
                <button type="button" class="defaultBtn btn-120w red" id="saveUserMasterBtn">저장</button>
             </div>
        </div>
    </form>
</div>
<!-- 창고 공통 팝업 : E -->
<!-- 이미지 미리보기 : S -->
<div id="common_quick_drawing_popup" title="Drawing Information" style="display: none;">
    <form class="form-inline" id="common_quick_drawing_form" name="common_quick_drawing_form" role="form" >
        <input type="hidden" id="gFileSeq" name="gFileSeq" value="">
        <div>
            <div>
                <img id="drawingImage" style='width: 785px;height: 610px;' src="/resource/main/blank.jpg">
            </div>
            <div style="padding: 10px 2px 5px 0px; float: right;">
                <button type="button" class="defaultBtn greenPopGra" id="common_quick_drawing_detail_view">상세보기</button>
            </div>
        </div>
    </form>
</div>
<!-- 도면파일 multi 다운로드 공통 팝업 : S -->
<div class="popup_container" id="common_multi_download_pop" style="display: none;">
    <form class="form-inline" name="common_multi_download_pop_form" id="common_multi_download_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="common.selectMultiDownloadList">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
        <div class="layerPopup" style="height: 490px;">
            <h3>도면파일 다운로드</h3>
            <button type="button" class="pop_close mt-10 mr-8" name="common_multi_download_pop_close">닫기
            </button>
            <div class="qualityWrap">
                <div class="h_area"></div>
                <h4></h4>
                <div class="list4">
                    <div id="common_multi_download_pop_grid"></div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn grayPopGra" name="common_multi_download_pop_close">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 도면파일 multi 다운로드 공통 팝업 : E -->

<div class="modal" id="processingRequirementsModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 500px">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">가공요건 입력 / 가공비 계산</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="d-flex align-items-center">
                    <div>
                        <button class="defaultBtn" id="prev">이전</button>
                        <button class="defaultBtn" id="next">다음</button>
                    </div>
                    <div class="ml-auto"></div>
                </div>
                <hr style="display: block; border: 1px solid #e2e2e2; margin: 7px;">
                <div>
                    <table class="basic_information">
                        <colgroup>
                            <col width="15">
                            <col width="85">
                        </colgroup>
                        <thead>
                        <tr>
                            <td colspan="2">기본정보</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="display: none;">
                            <td id="seq1"></td>
                            <td id="seq2"></td>
                        </tr>
                        <tr>
                            <td scope="row">관리번호</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">도면번호</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">재질</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">규격</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">규격 Level</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">기본가공비</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td scope="row">총가공비</td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <br>
                <div>
                    <form id="processing_requirements_form" role="form" onsubmit="return false;">
                        <input type="hidden" name="TYPE" id="TYPE">
                        <input type="hidden" name="WORK_TYPE" id="WORK_TYPE">
                        <input type="hidden" name="SEQ1" id="SEQ1">
                        <input type="hidden" name="SEQ2" id="SEQ2">
                    </form>
                    <div id="processing_requirements_grid"></div>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<div id="drawingPrintDiv" style="display: none">
    <div id="drawingPrintDivHtml">
        <div>
            <span>동일 관리번호에 도면번호가 다른 대상이 있습니다. 포함하여 출력할까요?</span>
            <span class="text-blue">대상관리번호</span><br>
            <span class="drawingPrintControlHtml"></span>
        </div>
    </div>
</div>
<script type="text/javascript">

    let commonAlertPopup = $("#common_alert_popup");

    let commonFileDownUploadPopup = $("#common_file_download_upload_pop");
    let commonFileDownUploadGridId = "common_file_download_upload_grid";
    let commonFileDownUploadGrid = $("#common_file_download_upload_grid");

    let g_ItemDetailPopGrid04;

    let $processingRequirementsGrid;
    let processingRequirementsTargetGrid;
    let processingRequirementsTargetRowIndex = [];

    function failPlay() {
        let audio = document.getElementById('fail_play');
        if (audio.currentTime > 0) {
            audio.currentTime = 0;
        }
        audio.play();
    }

    function successPlay() {
        let audio = document.getElementById('success_play');
        if (audio.currentTime > 0) {
            audio.currentTime = 0;
        }
        audio.play();
    }

    $(function() {
        'use strict';

        $("#common_quick_drawing_popup").dialog({
            autoOpen:false, //자동으로 열리지않게
            position:[100,200], //x,y  값을 지정
            //"center", "left", "right", "top", "bottom"
            width : "800",            // dialog 넓이 지정
            height : "700",        // dialog 높이 지정
            modal:false, //모달대화상자
            resizable:false, //크기 조절 못하게
            open: function( event, ui ) {
                $("#common_quick_drawing_popup").show();
            },
            close: function( event, ui ) {
                $("#common_quick_drawing_popup").hide();
            }
        });

        $('#common_quick_drawing_form').find('#common_quick_drawing_detail_view').on('click', function (e) {
            e.stopPropagation();
            e.preventDefault();
            callWindowImageViewer($('#common_quick_drawing_form').find('#gFileSeq').val());
        });

        $("#user_info_pop").on('hide.bs.modal', function(){
            fnResetFrom("user_info_pop_form");
        });

        // 모달 open
        $("#user_info_pop").on('show.bs.modal', function(){
        });

        $('#user_info_pop_form').find('#user_info_pop_close2, #user_info_pop_close').on('click', function () {
            $('#user_info_pop').modal('hide');
        });

        /** 장비 파일 업로드 */
        $("#user_info_pop_form").find("#user_info_upload").click(function (e) {
           let userPhotoFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
           userPhotoFile.trigger("click");
           userPhotoFile.unbind().change(function () {
               var input = $(this);
               var files = input.get(0).files;

               if (files.length > 0) {
                   let formData = new FormData();
                   for (var i = 0; i < files.length; i++) {
                       formData.append("file" + i, files[i]);
                   }
                   fnFormDataFileUploadAjax(function (data) {
                       input.val('');
                       let fileInfo = data.fileUploadList[0];
                       $("#user_info_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                       $("#user_info_pop_form").find("#PHOTO_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                   }, formData, '');
               }
           });
        });

        $('#user_info_pop_form').find('#saveUserMasterBtn').on('click', function () {
            fnConfirm(null, "저장 하시겠습니까?", function () {
                let parameters = {
                    'url': '/json-update',
                    'data': $('#user_info_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlert(null, '사용자 정보가 저장되었습니다.');
                    $('#user_info_pop').modal('hide');
                    $("#userMasterSearchBtn").trigger("click");
                }, parameters, '');
            });
        });
    });

    function getCadUploadBlankHtml(){
        return'<tr><td colspan="6" class="spanArea" >마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="6"></td></tr><tr><td colspan="6"></td></tr><tr><td colspan="6"></td></tr><tr><td colspan="6"></td></tr>';
    }

    // function clearCadFileAttachPopup(fileHtml){
    //     $('#attachDragAndDrop > tbody').html('');
    //     $('#attachDragAndDrop > tbody').append(fileHtml).trigger('create');
    // }
    /** 캐드 파일 업로드 종료  스크립트 **/

    /** 파일 다운로드 시작 스크립트 **/
    let commonFileDownUploadModel =  [
        {title: 'GFILE_SEQ', dataType: 'string', dataIndx: 'GFILE_SEQ', hidden: true},
        {title: '파일명', dataType: 'string', dataIndx: 'ORGINAL_FILE_NM', width: 400, minWidth: 70},
        {title: '용량', dataType: 'string', dataIndx: 'FILE_SIZE',  width: 1, minWidth: 70,
            render: function(ui) {
                return fn_getFileSize(ui.rowData.FILE_SIZE);
            }

        },
        {title: '업로드 일시', dataType: 'string', dataIndx: 'INSERT_DT',  width: 120, minWidth: 70},
        {title: '', align: 'center', dataType: 'string', dataIndx: 'FILE_SEQ', width: 80, minWidth: 80,
            render: function (ui) {
                let returnVal = "";
                if (ui.cellData) {
                    returnVal = '<button type="button" id="downloadSingleFile" class="miniBtn green">다운로드</button>'
                }
                return returnVal;
            },
            postRender: function (ui) {
                let grid = this,
                    $cell = grid.getCell(ui);
                $cell.find("#downloadSingleFile").bind("click", function () {
                    let rowData = ui.rowData;
                    fnSingleFileDownloadFormPageAction(rowData.FILE_SEQ);
                });
            }
        },
        {title: '', align: 'center', dataType: 'string', dataIndx: 'FILE_SEQ', width: 70, minWidth: 100,
            render: function (ui) {
                let deleteYn = $("#common_file_download_form #deleteYn").val();
                let returnVal = "";
                if (ui.cellData) {
                    if(eval(deleteYn)) returnVal = '<button type="button" id="deleteSingleFile" class="miniBtn red">삭제</button>'
                    return returnVal;
                }
            },
            postRender: function (ui) {
                let grid = this;
                let $cell = grid.getCell(ui);
                $cell.find('#deleteSingleFile').on('click', function (event) {
                    let rowData = ui.rowData;
                    let parameter = {
                        'queryId': 'common.deleteFileKey',
                        'FILE_SEQ': rowData.FILE_SEQ
                    };
                    let parameters = {'url': '/json-remove', 'data': parameter};
                    fnPostAjaxAsync(function(data, callFunctionParam){
                        let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': rowData.GFILE_SEQ };
                        commonFileDownUploadGrid.pqGrid('option', 'dataModel.postData', function () {
                            return postData;
                        });
                        commonFileDownUploadGrid.pqGrid('refreshDataAndView');
                        //fnRequestGridData(commonFileDownUploadGrid, postData);
                    }, parameters, '');
                });
            }
        }
    ];

    let commonFileDownUploadObj = {
        height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
        selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
        editable : false,
        scrollModel: {autoFit: true}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
        columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
        colModel: commonFileDownUploadModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: {queryId: 'common.selectGfileFileListInfo', 'GFILE_SEQ': $("#common_file_download_form").find("#GFILE_SEQ").val()},
            recIndx: 'FILE_SEQ',
            getData: function (dataJSON) {
                return {data: dataJSON.data || []};
            }
        },
        dataReady: function (event, ui) {
            let data = commonFileDownUploadGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            $('#filedownloadTotalCount').html(totalRecords);
        },
    };

    commonFileDownUploadPopup.on('show.bs.modal', function (e) {
        let GfileKey = $("#common_file_download_form").find("#GFILE_SEQ").val();
        commonFileDownUploadGrid.pqGrid(commonFileDownUploadObj);
        let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GfileKey };
        commonFileDownUploadGrid.pqGrid('option', 'dataModel.postData', function () {
            return postData;
        });
        commonFileDownUploadGrid.pqGrid('refreshDataAndView');
    });

    commonFileDownUploadPopup.on('hide.bs.modal', function (e) {
        commonFileDownUploadGrid.pqGrid('destroy');
        let callElement = $("#common_file_download_form").find("#callElement").val();
        $("#common_file_download_form #deleteYn").val(false);
        $("#" + callElement ).trigger('click');
    });

    /** 파일 업로드 다운로드 Call 함수
     * GFileSeq
     * Element ID
     * Click 이벤트로 CallBack
     * **/
    let commonFileDownUploadPopupCall = function(GfileKey, callElement) {
        $("#common_file_download_form").find("#GFILE_SEQ").val(GfileKey);
        $("#common_file_download_form").find("#callElement").val(callElement);
        commonFileDownUploadPopup.modal('show');
    };

    /** 파일 다운로드 종료 스크립트 **/

    /** 파일 업로드 스크립트 **/
    let uploadControlFiles = [];

    let commonFileUpdatePop = $("#commonFileUpdatePop");
    let commonFileUploadGetData = commonFileUpdatePop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
        $(this).addClass('drag-over');
    }).on("dragleave", function(e) {  //드래그 요소가 나갔을때
        $(this).removeClass('drag-over');
    }).on("dragover", function(e) {
        e.stopPropagation();
        e.preventDefault();
    }).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
        e.preventDefault();
        $(this).removeClass('drag-over');
        let cadFiles = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
        let GfileSeq = $("#common_file_download_form").find("#GFILE_SEQ").val();
        for(let i = 0; i < cadFiles.length; i++) {
            let file = cadFiles[i];
            uploadControlFiles.push(file); //업로드 목록에 추가
        }
        if (uploadControlFiles.length > 0) { // file upload
            let formData = new FormData();
            $.each(uploadControlFiles, function(i, file) {
                if(file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
                    formData.append('file', file, file.name);
            });
            formData.append('queryId', $('#common_cad_file_attach_form').find("#queryId").val() + "_select");
            formData.append('GFILE_SEQ', GfileSeq);

            uploadControlFiles = [];    // 파일 업로드 정보 초기화
            fnFormDataFileUploadAjax(function (data) {
                let fileUploadList = data.fileUploadList;
                let GFILE_SEQ = fileUploadList[0].GFILE_SEQ;
                if (fileUploadList.length <= 0) {
                    fnAlert(null, "주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                    return false;
                }
                let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GFILE_SEQ };
                fnRequestGridData(commonFileDownUploadGrid, postData);
                $("#common_file_download_form").find("#GFILE_SEQ").val(GFILE_SEQ);
                fnAlert(null,"파일 업로드가 완료 되었습니다.");
            }, formData, '');
        }
    });
    /** 파일 업로드 스크립트 종료 **/

    function fn_getFileSize(fileSize){
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        if (fileSize == 0) return 'n/a';
        var i = parseInt(Math.floor(Math.log(fileSize) / Math.log(1024)));
        return (fileSize  / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
    }

    /** 공통 제품상세 정보 */

    let g_ItemDetailPopGridId01 =  $("#g_item_detail_pop_grid_01");
    let g_ItemDetailPopColModel01 = [
        {title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
        {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM', width: 60},
        {title: '기기명', dataType: 'string', dataIndx: 'EQUIP_NM', width: 95},
        {title: '상태', dataType: 'string', dataIndx: 'WORK_STATUS', width: 60},
        {title: '시작', dataType: 'string', dataIndx: 'WORK_START_DT', minWidth: 75, width: 100},
        {title: '종료', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 75, width: 100},
        {title: '소요시간', dataType: 'string', dataIndx: 'WORKING_TIME', width: 95},
        {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 95},
        {title: '수량', dataType: 'string', dataIndx: 'FINISH_QTY', width: 95},
        {title: '불량', dataType: 'string', dataIndx: 'ERROR_QTY', width: 95}
    ];
    //g_ItemDetailPopGridId01.pqGrid({
    let g_ItemDetailPopObj01 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
            url: "/paramQueryGridSelect",
            //postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
            postData: {queryId: 'inspection.selectCommItemDetailInfo', 'V_PARAM': ''},
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        strNoRows: g_noData,
        editable: false,
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
        scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: g_ItemDetailPopColModel01
    };


    let g_ItemDetailPopGridId02 =  $("#g_item_detail_pop_grid_02");
    let g_ItemDetailPopColModel02 = [
        {title: 'POP_SEQ', dataType: 'string', dataIndx: 'POP_SEQ', hidden:true},
        {title: '상태/위치', dataType: 'string', dataIndx: 'POP_POSITION_NM', width: 150, editable: false},
        {title: '이벤트일시', dataType: 'string', dataIndx: 'POP_DT', minWidth: 95, width: 150, editable: false}
    ];
    let g_ItemDetailPopObj02 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'POP_SEQ',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
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
        colModel: g_ItemDetailPopColModel02
    };

    let g_ItemDetailPopGridId03 =  $("#g_item_detail_pop_grid_03");
    let g_ItemDetailPopColModel03 = [
        {title: '입력구분', dataType: 'string', dataIndx: 'NOTE_TYPE_NM', width: 150, editable: false},
        {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 95, width: 150, editable: false}
    ];
    let g_ItemDetailPopObj03 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'NOTE_TYPE_NM',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
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
        colModel: g_ItemDetailPopColModel03
    };

    let g_ItemDetailPopGridId04 =  $("#g_item_detail_pop_grid_04");
    let g_ItemDetailPopColModel04 = [
        {title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
        {title: 'STATUS_INFO', dataType: 'string', dataIndx: 'STATUS_INFO', hidden:true},
        {title: 'UPDATE_TIME_INFO', dataType: 'string', dataIndx: 'UPDATE_TIME_INFO', hidden:true},
        {title: 'Step', dataType: 'string', dataIndx: 'CAM_SEQ', width: 10, editable: false},
        {title: '작업위치', dataType: 'string', dataIndx: 'WORK_DIRECTION', width: 95, editable: false},
        {title: '작업내용', dataType: 'string', dataIndx: 'WORK_DESC', width: 200, editable: false},
        {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER_NM', width: 60, editable: false},
        {title: '파일', datatype: 'string', dataIndx: '', minWidth: 30, width: 60,
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
        }
    ];
    let g_ItemDetailPopObj04 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        postRenderInterval: -1,
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
        colModel: g_ItemDetailPopColModel04,
        dataReady: function (event, ui) {
            let data = g_ItemDetailPopGrid04.pqGrid('option', 'dataModel.data');
            // let totalRecords = data.length;
            // let rowDataArray = g_ItemDetailPopGrid04.pqGrid('getRowData', {rowIndx: 0});
            if(data[0]){
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html(data[0].STATUS_INFO);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("Update : " + data[0].UPDATE_TIME_INFO);
            }else{
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html("");
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("");
            }
        }
        // let data4 = g_ItemDetailPopGrid04.pqGrid('option', 'dataModel.data');
        // if(data4 != null){
        //     setTimeout(function() {
        //         let rowDataArray = g_ItemDetailPopGrid04.pqGrid('getRowData', {rowIndx: 0});
        //         if(rowDataArray != null){
        //              $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html(rowDataArray.STATUS_INFO);
        //              $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").val(rowDataArray['UPDATE_TIME_INFO']);
        //         }
        //     }, 2000);
        // }
    };

    let g_ItemDetailPopGridId05 =  $("#g_item_detail_pop_grid_05");
    let g_ItemDetailPopColModel05 = [
        {title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
        {title: '작성자', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 95},
        {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', width: 95},
        {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 90, width: 95},
        {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 95},
        {title: '수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY', width: 95},
        {title: '불량코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95},
        {title: '상세및비고', dataType: 'string', dataIndx: 'Q_INSPECT_DESC', width: 95},
        {title: '원인', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM', width: 95},
        {title: '조치', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM', width: 95},
        {title: '조치방안', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', width: 95},
        {title: '작성일자', dataType: 'string', dataIndx: 'Q_DT', minWidth: 90, width: 95}
    ];
    let g_ItemDetailPopObj05 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        strNoRows: g_noData,
        editable: false,
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
        scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: g_ItemDetailPopColModel05
    };

    // let g_item_detail_cam_work_pop_view = function(CONTROL_SEQ, CONTROL_DETAIL_SEQ){
    //     $("#g_item_detail_pop_form").find("#CAM_INFO_YN").val("Y");
    //     g_item_detail_pop_view(CONTROL_SEQ, CONTROL_DETAIL_SEQ);
    // }

    let orderDetailGrid;
    let orderDetailRowIndx;
    const g_item_detail_pop_view = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ, grid, rowIndx) {
        // 작업 worker 지정은 협의 필요
        // fnCommCodeDatasourceSelectBoxCreate($("#g_item_detail_pop_form").find("#CAM_WORK_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
        orderDetailGrid = grid;
        orderDetailRowIndx = rowIndx;
        (function () {
            let grid;
            let rowDataPrev;
            let rowDataNext;

            if (!(fnIsEmpty(orderDetailGrid) && fnIsEmpty(orderDetailRowIndx))) {
                grid = orderDetailGrid.getInstance().grid;
                rowDataPrev = grid.getRowData({rowIndx: orderDetailRowIndx + -1});
                rowDataNext = grid.getRowData({rowIndx: orderDetailRowIndx + 1});
            }

            rowDataPrev === undefined ? $('#g_item_detail_pop_form').find('#left_arrow').css('visibility', 'hidden') : $('#g_item_detail_pop_form').find('#left_arrow').css('visibility', 'visible');
            rowDataNext === undefined ? $('#g_item_detail_pop_form').find('#right_arrow').css('visibility', 'hidden') : $('#g_item_detail_pop_form').find('#right_arrow').css('visibility', 'visible');
        })();


        const $itemDetailPop = $('#g_item_detail_pop');
        const $itemDetailPopForm = $("#g_item_detail_pop_form");

        $itemDetailPopForm.find("#CONTROL_SEQ").val(CONTROL_SEQ);
        $itemDetailPopForm.find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);

        if ($itemDetailPop.css('display') === 'none') {
            $itemDetailPop.modal('show');
        }
        //기본정보
        $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfo');
        let parameters = {
            'url': '/json-info',
            'data': fnFormToJsonArrayData('g_item_detail_pop_form')
        };
        fnPostAjaxAsync(function (data, callFunctionParam) {
            const dataInfo = data.info;
            let dxfFileDownloadYn = '${authUserInfo.DXF_FILE_DOWNLOAD_YN}';
            fnJsonDataToForm('g_item_detail_pop_form', dataInfo);

            $itemDetailPopForm.find("#CAD_DOWNLOAD").addClass('d-none');
            $itemDetailPopForm.find("#CAD_DOWNLOAD").removeAttr('onClick');
            $itemDetailPopForm.find("#DRAWING_VIEW").removeAttr('onClick');
            $itemDetailPopForm.find("#WORK_HISTORY_INFO").removeAttr('onClick');
            $itemDetailPopForm.find(".list1").find(".rowStyle").find("td").html('');
            $itemDetailPopForm.find("[name=view_assembly_or_part]").siblings().removeClass('bg-moccasin');
            if (dataInfo.WORK_TYPE === 'WTP020' || dataInfo.WORK_TYPE === 'WTP050') {
                $itemDetailPopForm.find("#" + dataInfo.WORK_TYPE).addClass('bg-moccasin');
            }
            if (dataInfo) {
                dataInfo.ASSEMBLY_YN === 'Y' ? $('#view_part_wrap').show() : $('#view_part_wrap').hide();
                fnIsEmpty(dataInfo.PREV_PART_CONTROL_DETAIL_SEQ) ? $('#g_item_detail_pop_form').find('#view_part_prev').css('visibility', 'hidden') : $('#g_item_detail_pop_form').find('#view_part_prev').css('visibility', 'visible');
                fnIsEmpty(dataInfo.NEXT_PART_CONTROL_DETAIL_SEQ) ? $('#g_item_detail_pop_form').find('#view_part_next').css('visibility', 'hidden') : $('#g_item_detail_pop_form').find('#view_part_next').css('visibility', 'visible');
                const emergencySpanElement = dataInfo.EMERGENCY_YN === 'Y' ? '<span class="mark">긴급</span>' : '';
                const materialFinishHeatSpanElement = dataInfo.MATERIAL_FINISH_HEAT === '열처리' ? '<span class="mark">열처리</span>' : '';
                const controlStatusHoldSpanElement = dataInfo.CONTROL_STATUS === 'ORD005' ? '<span class="mark" style="background-color: #ff0000; color: #ffffff">보류</span>' : '';

                $itemDetailPopForm.find("#CONTROL_NUM").html(dataInfo.CONTROL_NUM);
                $itemDetailPopForm.find("#WORK_TYPE_NM_ORDER_QTY_INFO").html(dataInfo.WORK_TYPE_NM_ORDER_QTY_INFO);
                $itemDetailPopForm.find("#INNER_DUE_DT").html(dataInfo.INNER_DUE_DT + emergencySpanElement);

                $itemDetailPopForm.find("#DRAWING_NUM").attr('title', dataInfo.DRAWING_NUM);
                $itemDetailPopForm.find("#DRAWING_NUM").html(dataInfo.DRAWING_NUM);
                $itemDetailPopForm.find("#SIZE_TXT").html(dataInfo.SIZE_TXT);
                $itemDetailPopForm.find("#PART_STATUS_NM").html(dataInfo.PART_STATUS_NM);

                $itemDetailPopForm.find("#ITEM_NM").attr('title', dataInfo.ITEM_NM);
                $itemDetailPopForm.find("#ITEM_NM").html(dataInfo.ITEM_NM);
                $itemDetailPopForm.find("#MATERIAL_DETAIL_NM").html(dataInfo.MATERIAL_DETAIL_NM || '' + materialFinishHeatSpanElement);
                $itemDetailPopForm.find("#POP_POSITION_NM").html(dataInfo.POP_POSITION_NM);

                $itemDetailPopForm.find("#MODULE_NM").attr('title', dataInfo.MODULE_NM);
                $itemDetailPopForm.find("#MODULE_NM").html(dataInfo.MODULE_NM);
                $itemDetailPopForm.find("#SURFACE_TREAT_NM").html(dataInfo.SURFACE_TREAT_NM);
                $itemDetailPopForm.find("#PROCESS_CONFIRM_DT").html(dataInfo.PROCESS_CONFIRM_DT);

                $itemDetailPopForm.find("#PROJECT_NM").attr('title', dataInfo.PROJECT_NM);
                $itemDetailPopForm.find("#PROJECT_NM").html(dataInfo.PROJECT_NM);

                $itemDetailPopForm.find("#OUTSIDE_CONFIRM_DT").html(dataInfo.OUTSIDE_CONFIRM_DT);
                $itemDetailPopForm.find("#MATERIAL_ORDER_DT").html(dataInfo.MATERIAL_ORDER_DT);

                $itemDetailPopForm.find("#ORDER_COMP_NM_DESIGNER_NM").html(dataInfo.ORDER_COMP_NM_DESIGNER_NM);
                $itemDetailPopForm.find("#OUTSIDE_COMP_NM").html(dataInfo.OUTSIDE_COMP_NM);
                $itemDetailPopForm.find("#MATERIAL_IN_DT").html(dataInfo.MATERIAL_IN_DT);

                $itemDetailPopForm.find("#CONTROL_CONFIRM_DT").html(dataInfo.CONTROL_CONFIRM_DT);
                if (!fnIsEmpty(controlStatusHoldSpanElement)) {
                    $itemDetailPopForm.find("#CONTROL_CONFIRM_DT").append(controlStatusHoldSpanElement);
                }
                $itemDetailPopForm.find("#OUTSIDE_PROCESS_CONFIRM_DT").html(dataInfo.OUTSIDE_PROCESS_CONFIRM_DT);
                $itemDetailPopForm.find("#PROCESS_FINISH_DT").html(dataInfo.PROCESS_FINISH_DT);

                $itemDetailPopForm.find("#MAIN_INSPECTION_NM").html(dataInfo.MAIN_INSPECTION_NM);
                $itemDetailPopForm.find("#OUTSIDE_IN_DT").html(dataInfo.OUTSIDE_IN_DT);
                $itemDetailPopForm.find("#OUT_FINISH_DT").html(dataInfo.OUT_FINISH_DT);

                if (dxfFileDownloadYn === 'Y') {
                    if (fnIsEmpty(dataInfo.DXF_GFILE_SEQ)) {
                        $itemDetailPopForm.find("#CAD_DOWNLOAD").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
                        $itemDetailPopForm.find("#CAD_DOWNLOAD").removeClass('d-none');
                    } else {
                        let str = dataInfo.DRAWING_NUM;
                        let arr = str.split(',');

                        if (arr.length === 1) {
                            $itemDetailPopForm.find("#CAD_DOWNLOAD").attr('onClick', 'fnFileDownloadFormPageAction(' + dataInfo.DXF_GFILE_SEQ + ');');
                        } else if (arr.length > 1) {
                            $itemDetailPopForm.find("#CAD_DOWNLOAD").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
                        }

                        $itemDetailPopForm.find("#CAD_DOWNLOAD").removeClass('d-none');
                    }
                }

                if (fnIsEmpty(dataInfo.IMG_GFILE_SEQ)) {
                    $itemDetailPopForm.find("#DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
                } else {
                    const str = dataInfo.DRAWING_NUM;
                    const arr = str.split(',');

                    if (arr.length === 1) {
                        $itemDetailPopForm.find("#DRAWING_VIEW").attr('onClick', 'callWindowImageViewer(' + dataInfo.IMG_GFILE_SEQ + ');');
                    } else if (arr.length > 1) {
                        $itemDetailPopForm.find("#DRAWING_VIEW").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
                    }
                }

                if (fnIsEmpty(dataInfo.WORK_HISTORY_INFO)) {
                    $itemDetailPopForm.find("#WORK_HISTORY_INFO").attr('disabled', true);
                    $itemDetailPopForm.find("#WORK_HISTORY_INFO").removeClass('bg-lightyellow');
                } else {
                    $itemDetailPopForm.find("#WORK_HISTORY_INFO").attr('disabled', false);
                    $itemDetailPopForm.find("#WORK_HISTORY_INFO").addClass('bg-lightyellow');
                    $itemDetailPopForm.find("#WORK_HISTORY_INFO").attr('onClick', "g_item_detail_pop_cam_pop('" + dataInfo.CONTROL_SEQ + "','" + dataInfo.CONTROL_DETAIL_SEQ + "');");
                }

                /** CAM 작업 여부에 따른 버튼 표시 **/
                // if(dataInfo.CAM_STATUS == "CWS010" || dataInfo.CAM_STATUS == "CWS030"){ <!-- 대기 중일때 처리 -->
                //     $('.work_info_area').show();
                // }else{
                //     $('.work_info_area').hide();
                // }
            }
        }, parameters, '');

        //가공이력 정보
        $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfo2');
        let parameters2 = {
            'url': '/json-info',
            'data': fnFormToJsonArrayData('g_item_detail_pop_form')
        };
        fnPostAjaxAsync(function (data, callFunctionParam) {
            let dataInfo = data.info;

            if (dataInfo == null) {
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_1").val('');
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_2").val('');
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_3").val('');
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_4").val('');
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_5").val('');
            } else {
                //fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_1").val(dataInfo.WORK_TIME_TOTAL);
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_2").val(dataInfo.WORK_TIME_MPR040);
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_3").val(dataInfo.WORK_TIME_MPR010);
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_4").val(dataInfo.WORK_TIME_MPR020);
                $itemDetailPopForm.find("#g_item_detail_pop_grid_01_info_5").val(dataInfo.WORK_TIME_MPR030);
            }
        }, parameters2, '');

        if ($("#g_item_detail_pop_grid_01").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
            g_ItemDetailPopGridId01.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId01.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
            g_ItemDetailPopObj01.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGridId01.pqGrid(g_ItemDetailPopObj01);
        }

        if ($("#g_item_detail_pop_grid_02").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid2');
            g_ItemDetailPopGridId02.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId02.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid2');
            g_ItemDetailPopObj02.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGridId02.pqGrid(g_ItemDetailPopObj02);
        }

        if ($("#g_item_detail_pop_grid_03").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid3');
            g_ItemDetailPopGridId03.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId03.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid3');
            g_ItemDetailPopObj03.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGridId03.pqGrid(g_ItemDetailPopObj03);
        }


        if ($("#g_item_detail_pop_grid_04").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid4');
            g_ItemDetailPopGridId04.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId04.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid4');
            g_ItemDetailPopObj04.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGrid04 = g_ItemDetailPopGridId04.pqGrid(g_ItemDetailPopObj04);
        }


        if ($("#g_item_detail_pop_grid_05").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid5');
            g_ItemDetailPopGridId05.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId05.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid5');
            g_ItemDetailPopObj05.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGridId05.pqGrid(g_ItemDetailPopObj05);
        }
        $itemDetailPopForm.find("#g_item_detail_pop_barcode_num").focus();
    };

    $("#g_item_detail_pop").on('hide.bs.modal', function(){
        fnResetFrom("g_item_detail_pop_form");
        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfo');
        if (g_ItemDetailPopGridId01.hasClass('pq-grid')) g_ItemDetailPopGridId01.pqGrid('destroy');
        if (g_ItemDetailPopGridId02.hasClass('pq-grid')) g_ItemDetailPopGridId02.pqGrid('destroy');
        if (g_ItemDetailPopGridId03.hasClass('pq-grid')) g_ItemDetailPopGridId03.pqGrid('destroy');
        if (g_ItemDetailPopGridId04.hasClass('pq-grid')) g_ItemDetailPopGridId04.pqGrid('destroy');
        if (g_ItemDetailPopGridId05.hasClass('pq-grid')) g_ItemDetailPopGridId05.pqGrid('destroy');
    });

    $('#g_item_detail_pop_form').find('[name=control_num_arrow]').on('click', function () {
        const value = $(this).data('value');
        const grid = orderDetailGrid.getInstance( ).grid;
        const rowData = grid.getRowData({rowIndx: orderDetailRowIndx + value});

        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, orderDetailGrid, orderDetailRowIndx + value);
    });

    $('#g_item_detail_pop_form').find('[name=view_assembly_or_part]').on('click', function () {
        $(this).siblings().removeClass('bg-moccasin');
        $(this).addClass("bg-moccasin");

        const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
        let controlDetailSeq;

        switch (this.value) {
            case 'WTP020':
                controlDetailSeq = $('#g_item_detail_pop_form > #ASSEMBLY_CONTROL_DETAIL_SEQ').val();
                break;
            case 'WTP050':
                controlDetailSeq = $('#g_item_detail_pop_form > #FIRST_PART_CONTROL_DETAIL_SEQ').val();
                break;
        }

        g_item_detail_pop_view(controlSeq, controlDetailSeq, orderDetailGrid, orderDetailRowIndx);
    });

    $('#g_item_detail_pop_form').find('[name=view_part]').on('click', function () {
        const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
        let controlDetailSeq;

        switch ($(this).attr('id')) {
            case 'view_part_prev':
                controlDetailSeq = $('#g_item_detail_pop_form > #PREV_PART_CONTROL_DETAIL_SEQ').val();
                break;
            case 'view_part_next':
                controlDetailSeq = $('#g_item_detail_pop_form > #NEXT_PART_CONTROL_DETAIL_SEQ').val();
                break;
        }

        g_item_detail_pop_view(controlSeq, controlDetailSeq, orderDetailGrid, orderDetailRowIndx);
    });



    $("#g_item_detail_pop").find('#g_item_detail_pop_grid_05_pop_close, #popClose2').on('click', function () {
        $('#g_item_detail_pop').modal('hide');
    });

    /** cam start 처리 **/
    <%--$("#g_item_detail_pop_form").find('#g_item_cam_work_start_btn').on('click', function () {--%>
    <%--    $("#g_item_detail_pop_form").find("#queryId").val('machine.insertMctCamWork');--%>
    <%--    let parameters = {'url': '/json-create', 'data': $('#g_item_detail_pop_form').serialize()}--%>
    <%--    fnPostAjax(function (data) {--%>
    <%--        $(".work_info_area").hide();--%>
    <%--        alert("<spring:message code='com.alert.default.job.start' />");--%>
    <%--        g_ItemDetailPopGrid04.pqGrid('refreshDataAndView');--%>
    <%--    }, parameters, '');--%>
    <%--});--%>
    $("#g_item_detail_pop_barcode_span").on('click', function (e) {
        $("#g_item_detail_pop_barcode_num").focus();
    });

    $("#g_item_detail_pop_barcode_num").on({
        focus: function () {
            this.value = '';
            $("#g_item_detail_pop_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
        },
        blur: function () {
            $("#g_item_detail_pop_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
        },
        keyup: function (e) {
            if (e.keyCode == 13) {
                fnBarcodePrintCheck(function (confirm, callFunctionParam) {
                    let barcodeN = callFunctionParam;
                    if (confirm) {
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
                                g_ItemDetailPopGridId01.pqGrid('destroy');
                                g_ItemDetailPopGridId02.pqGrid('destroy');
                                g_ItemDetailPopGridId03.pqGrid('destroy');
                                g_ItemDetailPopGridId04.pqGrid('destroy');
                                g_ItemDetailPopGridId05.pqGrid('destroy');
                                g_item_detail_pop_view(CONTROL_SEQ, CONTROL_DETAIL_SEQ);
                            }
                        }, parameters, '');
                    }
                }, fnBarcodeKo2En(this.value), fnBarcodeKo2En(this.value));
                this.value = '';
            }
        }
    });

    /** cam popup */
    let camWorkDetailPopup;
    const g_item_detail_pop_cam_pop = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ) {
        const url = '/camWorkDetail?controlSeq=' + CONTROL_SEQ + '&controlDetailSeq=' + CONTROL_DETAIL_SEQ;
        // 팝업 사이즈
        const nWidth = 1152;
        const nHeight = 648;
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
        if (camWorkDetailPopup === undefined || camWorkDetailPopup.closed) {
            camWorkDetailPopup = window.open(url, '', strOption);
        } else {
            camWorkDetailPopup.focus();
        }
    }
    /** cam popup */

    /**  공통 제품상세 정보  끝 **/

    /** 공통 창고 팝업 Start **/
    let commonWarehouseManageGrid = $("#common_warehouse_manage_grid");
    let commonWarehouseManageModel= [
        {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', minWidth: 80 ,editable: false},
        {title: '위치명', dataType: 'string', dataIndx: 'LOC_NM', minWidth: 90 },
        {title: '위치 설명', dataType: 'string', dataIndx: 'LOC_DESC', minWidth: 120 },
        {title: '용도', dataType: 'string', dataIndx: 'LOC_USE', minWidth: 150} ,
        {title: '업데이트 일시', dataType: 'date', dataIndx: 'UPDATE_DT', minWidth: 110, editable: false},
        {title: '작성자', dataType: 'string', dataIndx: 'INSERT_ID', minWidth: 100, editable: false},
        {title: '', dataType: 'string', dataIndx: 'WAREHOUSE_CD', hidden: true}
    ];

    let commonWarehouseManageObj = {
        width: "100%", height: 350,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'LOC_SEQ',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('common_warehouse_manage_popup_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
        scrollModel: {autoFit: false},
        numberCell: {width: 30, title: "No", show: true },
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        collapsible: false,
        strNoRows: g_noData,
        resizable: false,
        trackModel: {on: true},
        colModel: commonWarehouseManageModel,
        rowSelect: function (event, ui) {
            let LOC_SEQ = ui.addList[0].rowData.LOC_SEQ;

            $("#common_warehouse_manage_popup_form #LOC_SEQ").val(LOC_SEQ);
        },
        complete: function(event, ui) {
            this.flex();
            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');

            $('#common_warehouse_manage_grid_records').html(data.length);
        }
    }
    function fnCommonWarehouse() {
        $('#common_warehouse_manage_popup').modal('show');
        $("#common_warehouse_manage_popup_form").find("#queryId").val('material.selectCommonWarehouseManageList');
        commonWarehouseManageObj.dataModel.postData = fnFormToJsonArrayData('common_warehouse_manage_popup_form');
        commonWarehouseManageGrid.pqGrid(commonWarehouseManageObj);
        commonWarehouseManageGrid.pqGrid('refreshDataAndView');
    }

    $("#common_warehouse_manage_popup_form #WAREHOUSE_CD").on('change', function(){
        commonWarehouseManageGrid.pqGrid('option', "dataModel.postData", function (ui) {
            return (fnFormToJsonArrayData('#common_warehouse_manage_popup_form'));
        });
        commonWarehouseManageGrid.pqGrid('refreshDataAndView');
    });

    $("#btnCommonWarehouseManageAdd").on('click', function(){
        let WAREHOUSE_CD = $("#common_warehouse_manage_popup_form #WAREHOUSE_CD option:selected").val();
        let WAREHOUSE_NM = $("#common_warehouse_manage_popup_form #WAREHOUSE_CD option:selected").text();
        commonWarehouseManageGrid.pqGrid('addRow', {
            newRow: {WAREHOUSE_CD:WAREHOUSE_CD, WAREHOUSE_NM:WAREHOUSE_NM},
            rowIndx : 0,
            checkEditable: false
        });
    });

    $("#btnCommonWarehouseManageRemove").on('click', function () {
        const data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');
        const value = $("#common_warehouse_manage_popup_form #LOC_SEQ").val();
        let rowIndx;

        for (let i = 0; i < data.length; i++) {
            let rowData = data[i];

            if (rowData['LOC_SEQ'] == value) {
                rowIndx = i;
                break;
            }
        }

        if (rowIndx) {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'material.deleteCommonWarehouseManage'

                fnDeletePQGrid(commonWarehouseManageGrid, [rowIndx], deleteQuery);
            });
        }
    });

    $("#btnCommonWarehouseManageSave").on('click', function(){
        let inWarehouseManageInsertUpdateQueryList = ['material.insertUpdateCommonWarehouseManage'];
        fnModifyPQGrid(commonWarehouseManageGrid, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
    });

    /** 공통 창고 팝업 end **/
    function estimateListFileUploadCallback(GfileSeq) {
        if(!GfileSeq) {
            let parameter = {
                'queryId': 'estimate.updateEstimateMasterGfileSeq',
                'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val()
            };
            let parameters = {'url': '/json-update', 'data': parameter};
            fnPostAjaxAsync('', parameters, '');
        }
        $("#btnEstimateListSearch").trigger('click');
    }

    $('[name=commonAlertYesBtn]').unbind().click(function (e) {
        e.stopPropagation();
        commonAlertPopup.hide();
    });

    let $multiDownloadGrid;

    $('#common_multi_download_pop').on({
        'show.bs.modal': function () {
            const gridId = 'common_multi_download_pop_grid';
            const postData = fnFormToJsonArrayData('common_multi_download_pop_form');
            const colModel = [
                {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
                {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
                {title: '관리번호', align: 'left', width: 180, dataIndx: 'CONTROL_PART_INFO'},
                {title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM'},
                {title: '작업형태', dataIndx: 'WORK_TYPE_NM'},
                {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
                {
                    title: '', align: 'center', dataIndx: 'DXF_GFILE_SEQ', width: 25, minWidth: 25, editable: false,
                    render: function (ui) {
                        cellData = ui.cellData;
                        if (cellData) {
                            return "<a href='/downloadGfile/" + cellData + "' download><input type='button' class='smallBtn blue' value='다운로드'/></a>";
                        }
                    },
                },
                {
                    title: '', align: 'center', dataIndx: 'IMG_GFILE_SEQ', width: 25, minWidth: 25, editable: false,
                    render: function (ui) {
                        if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                    },
                    postRender: function (ui) {
                        let grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find("#imageView").bind("click", function () {
                            let rowData = ui.rowData;
                            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                        });
                    }
                }
            ];
            const obj = {
                height: 350,
                collapsible: false,
                postRenderInterval: -1,
                scrollModel: {autoFit: true},
                showTitle: false,
                numberCell: {show: false},
                editable: false,
                columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
                colModel: colModel,
                dataModel: {
                    location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                    postData: postData,
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
            };
            $multiDownloadGrid = $('#' + gridId).pqGrid(obj);
        },
        'hide.bs.modal': function () {
            $multiDownloadGrid.pqGrid('destroy');
        }
    });

    const commonMultiDownloadPop = function (controlSeq, controlDetailSeq) {
        $('#common_multi_download_pop_form').find('#CONTROL_SEQ').val(controlSeq);
        $('#common_multi_download_pop_form').find('#CONTROL_DETAIL_SEQ').val(controlDetailSeq);
        $('#common_multi_download_pop').modal('show');
    }

    $('[name=common_multi_download_pop_close]').on('click', function () {
        $('#common_multi_download_pop').modal('hide');
    });

    const processingRequirementsPop = function (actionType) {
        $('#processing_requirements_form').find('#TYPE').val(actionType);

        $('#processingRequirementsModal').modal('show');
    };

    $('#processingRequirementsModal').on({
        'show.bs.modal': function () {
            let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();

            if ($processingRequirementsType === 'ESTIMATE') {
                processingRequirementsTargetGrid = estimateRegisterTopGrid;
                processingRequirementsTargetRowIndex = Number(estimateRegisterSelectedRowIndex);
            } else if ($processingRequirementsType === 'CONTROL') {
                processingRequirementsTargetGrid = $orderManagementGrid;
                processingRequirementsTargetRowIndex = Number(selectedOrderManagementRowIndex[0]);
            }

            const processingRequirementsGridId = 'processing_requirements_grid';
            const processingRequirementsColModel = [
                {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
                {title: 'CALC_SEQ', dataType: 'integer', dataIndx: 'CALC_SEQ', hidden: true},
                {title: 'GROUP_CD', dataIndx: 'GROUP_CD', hidden: true},
                {title: 'FACTOR_CD', dataIndx: 'FACTOR_CD', hidden: true},
                {
                    title: '가공요건정보', align: 'center', styleHead: {'background':'#ffd966'}, colModel: [
                        {title: '항목1', dataIndx: 'LEVEL_1', style: {'background': '#fff2cc', 'font-weight': 'bold'}},
                        {title: '항목2', dataIndx: 'LEVEL_2', align: 'left', style: {'background': '#fff2cc', 'font-weight': 'bold'}},
                        {
                            title: 'Count', dataType: 'integer', format: '#,###', dataIndx: 'PROCESS_CNT',
                            editable: function () {
                                return $('#processing_requirements_form').find('#WORK_TYPE').val() !== 'WTP020';
                            },
                            render: function () {
                                if ($('#processing_requirements_form').find('#WORK_TYPE').val() === 'WTP020'){
                                    return {style: 'background: #dbdbdb'};
                                }
                            }
                        },
                        {
                            title: 'Cost', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT',
                            style: {'background': '#dbdbdb'}
                        },
                    ]
                },
            ];
            const processingRequirementsObj = {
                height: 500,
                collapsible: false,
                showTitle: false,
                strNoRows: g_noData,
                // rowHtHead: 15,
                sortModel: {on: false},
                copyModel: {render: true},
                numberCell: {show: false},
                trackModel: {on: true},
                editable: false,
                columnTemplate: {
                    align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                    styleHead: {'background':'#ffd966'}
                },
                editModel: {clicksToEdit: 1},
                colModel: processingRequirementsColModel,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                    postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                load: function () {
                    const data = this.option('dataModel.data');
                    const summary = function (data) {
                        const lastRow = data[data.length - 1];
                        const processCntTotal = lastRow ? lastRow.PROCESS_CNT : '';
                        const costTotal = lastRow ? lastRow.TOTAL : '';
                        const array = [
                            {LEVEL_1: '추가가공비 합계', PROCESS_CNT: processCntTotal, UNIT_AMT: costTotal}
                        ];

                        return array;
                    };
                    const merge = function (grid, refresh, data) {
                        let mc = [],
                            rc = 1,
                            j = data.length;

                        while (j--) {
                            let cd = data[j]['LEVEL_1'],
                                cd_prev = data[j - 1] ? data[j - 1]['LEVEL_1'] : undefined;
                            if (cd_prev !== undefined && cd == cd_prev) {
                                rc++;
                            } else if (rc > 1) {
                                mc.push({r1: j, c1: 4, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }
                        grid.option('mergeCells', mc);
                        if (refresh) {
                            grid.refreshView();
                        }
                    };

                    this.option('summaryData', summary(data));
                    data.pop(); // 총계(마지막 행) 제외
                    merge(this, true, data);
                },
                editorKeyDown: function (evt, ui) {
                    if (evt.keyCode === 9 || evt.keyCode === 13) {
                        evt.originalEvent.keyCode = 40; //disguise down key.
                    }
                },
                cellSave: function () {
                    processingRequirementsSave();
                },
                beforePaste: function (evt, ui) {
                    let CM = this.getColModel(),
                        rows = ui.rows,
                        area = ui.areas[0],
                        //r1 = area.r1,
                        c1 = area.c1;
                    for (let i = 0; i < rows.length; i++) {
                        let row = rows[i];
                        for (let j = 0; j < row.length; j++) {
                            let column = CM[j + c1],
                                dt = column.dataType;
                            if (dt === 'integer' || dt === 'float') {
                                row[j] = row[j].replace(/[^(\d|.)]/g, '');
                            }
                        }
                    }
                }
            };

            $processingRequirementsGrid = $('#' + processingRequirementsGridId).pqGrid(processingRequirementsObj);
            changeData();
        },
        'hide.bs.modal': function () {
            $processingRequirementsGrid.pqGrid('destroy');
        }
    });

    /* function */
    const changeProcessingRequirementsBasicInformation = function (rowData) {
        let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let queryId = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            queryId = 'estimate.selectProcessingRequirementsBasicInfo';
        } else if ($processingRequirementsType === 'CONTROL') {
            queryId = 'orderMapper.selectProcessingRequirementsBasicInfo';
        }

        let postData = $.extend({queryId: queryId}, rowData);
        postData.TYPE = $processingRequirementsType;
        postData.SEQ1 = $('.basic_information').find('#seq1').html();
        postData.SEQ2 = $('.basic_information').find('#seq2').html();
        let parameter = {'url': '/json-info', 'data': postData};

        fnPostAjax(function (data) {
            createTopTable(data);
        }, parameter, '');
    };

    const changeProcessingRequirementsInformation = function (rowData) {
        const $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let queryId = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            queryId = 'estimate.selectProcessingRequirementsInfo';
        } else if ($processingRequirementsType === 'CONTROL') {
            queryId = 'orderMapper.selectProcessingRequirementsInfo';
        }

        const postData = $.extend({queryId: queryId}, rowData);
        postData.TYPE = $processingRequirementsType;
        postData.SEQ1 = $('.basic_information').find('#seq1').html();
        postData.SEQ2 = $('.basic_information').find('#seq2').html();

        $processingRequirementsGrid.pqGrid('option', 'dataModel.postData', function () {
            return postData;
        });
        $processingRequirementsGrid.pqGrid('refreshDataAndView');
    };

    const createTopTable = function (data) {
        let seq1 = '';
        let seq2 = '';
        let controlNum = '';
        let drawingNum = '';
        let materialTypeNm = '';
        let sizeTxt = '';
        let level = '';
        let unitBasicAmt = '';
        let totalProcessingCost = '';
        let img = '';
        let htmlString = '';

        if (data) {
            const info = data.info;
            seq1 = info.SEQ1 || '';
            seq2 = info.SEQ2 || '';
            controlNum = info.EST_NUM || info.CONTROL_NUM || '';
            drawingNum = info.DRAWING_NUM || '';
            materialTypeNm = info.MATERIAL_TYPE_NM || '';
            sizeTxt = info.SIZE_TXT || '';
            level = info.SIZE_LEVEL || '';
            unitBasicAmt = info.UNIT_BASIC_AMT || '';
            totalProcessingCost = info.TOTAL_PROCESSING_COST || '';
            img = info.IMG_GFILE_SEQ ? '<span class="fileSearchIcon" id="imageView" data-value="' + info.IMG_GFILE_SEQ + '" style="margin-left: 10px; vertical-align: middle; cursor: pointer"></span>' : '';
        }

        htmlString += '<tr style="display: none;">';
        htmlString += '    <td id="seq1">' + seq1 + '</td>';
        htmlString += '    <td id="seq2">' + seq2 + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">관리번호</td>';
        htmlString += '    <td>' + controlNum + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">도면번호</td>';
        htmlString += '    <td>' + drawingNum + img + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">재질</td>';
        htmlString += '    <td>' + materialTypeNm + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">규격</td>';
        htmlString += '    <td>' + sizeTxt + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">규격 Level</td>';
        htmlString += '    <td>' + level + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">기본가공비</td>';
        htmlString += '    <td>' + unitBasicAmt + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">총가공비</td>';
        htmlString += '    <td>' + totalProcessingCost + '</td>'; //FIXME:
        htmlString += '</tr>';

        $('.basic_information > tbody').html(htmlString);
    };

    const visibilityButton = function () {
        let gridInstance;
        let rowDataPrev;
        let rowDataNext;

        if (!(fnIsEmpty(processingRequirementsTargetGrid) && fnIsEmpty(processingRequirementsTargetRowIndex))) {
            gridInstance = processingRequirementsTargetGrid.pqGrid('getInstance').grid;
            rowDataPrev = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + -1});
            rowDataNext = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + 1});
        }

        rowDataPrev === undefined ? $('#prev').css('visibility', 'hidden') : $('#prev').css('visibility', 'visible');
        rowDataNext === undefined ? $('#next').css('visibility', 'hidden') : $('#next').css('visibility', 'visible');
    };

    const changeImageView = function (rowData) {
        const imgGfileSeq = rowData.ORDER_IMG_GFILE_SEQ || rowData.IMG_GFILE_SEQ || '';
        callWindowImageViewer(imgGfileSeq);
    };

    //TODO: 함수명 변경
    const changeData = function () {
        const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
        $('#processing_requirements_form').find('#WORK_TYPE').val(rowData.WORK_TYPE);

        visibilityButton();
        changeProcessingRequirementsBasicInformation(rowData);
        changeProcessingRequirementsInformation(rowData);
        changeImageView(rowData);
    };
    /* function */

    /* event */
    $('#processingRequirementsModal #prev').on('click', function () {
        processingRequirementsTargetRowIndex--;

        changeData();
    });

    $('#processingRequirementsModal #next').on('click', function () {
        processingRequirementsTargetRowIndex++;

        changeData();
    });

    const processingRequirementsSave = function () {
        const gridInstance = $processingRequirementsGrid.pqGrid('getInstance').grid;

        if (gridInstance.isDirty()) {
            let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
            let $basicInformation = $('.basic_information');
            let gridInstance = $processingRequirementsGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            changes.TYPE = $processingRequirementsType;
            changes.SEQ1 = $basicInformation.find('#seq1').html();
            changes.SEQ2 = $basicInformation.find('#seq2').html();
            let url = '';

            if ($processingRequirementsType === 'ESTIMATE') {
                url = 'processingRequirementsEstimateSave';
            } else if ($processingRequirementsType === 'CONTROL') {
                url = 'processingRequirementsControlSave';
            }

            let parameter = {'url': '/' + url, 'data': {data: JSON.stringify(changes)}};

            fnPostAjax(function (data) {
                const flag = data.flag;

                if (flag) {
                    fnAlert(null, '<srping:message code="error.common"/>');
                    return;
                }

                changeData();
            }, parameter, '');
        }
    };

    /**
     * Drawing Upload Popup Window
     **/
    let drawingUploadPopup;
    const drawingUploadPopupWindow = function (actionType, queryId) {
        let drawingForm = document.drawing_file_upload_form;
        // const url = '/drawingUploadPopup?actionType=' + actionType + '&queryId=' + queryId;
        // 팝업 사이즈
        const nWidth = 1000;
        const nHeight = 550;
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
        if (drawingUploadPopup === undefined || drawingUploadPopup.closed) {

            $('#drawing_file_upload_form').find("#actionType").val(actionType);
            $('#drawing_file_upload_form').find("#queryId").val(queryId);

            drawingUploadPopup = window.open('', 'popForm', strOption);

            drawingForm.action = "/drawingUploadPopup";
            drawingForm.target = "popForm";
            drawingForm.submit();

        } else {
            drawingUploadPopup.focus();
            setTimeout(function() {
                $(drawingUploadPopup.window.document).find("#actionType").val(actionType);
                $(drawingUploadPopup.window.document).find("#queryId").val(queryId);

                drawingUploadPopup.initDrawingLoad();
            }, 500);
        }
    }

    /**
     * Drawing Upload Popup Close then call function
     **/
    function callDrawingUploadPopupWindow(actionType){
        if(actionType == 'estimate') {          // 견적 도면 등록
            $("#estimateRegisterReloadBtn").trigger("click");
        }else if(actionType == 'control' || actionType == 'controlRev') {
            $("#CONTROL_MANAGE_SEARCH").trigger("click");
        }else if(actionType == 'inside') {      // 자재 도면 등록
            $("#stock_manage_search_btn").trigger("click");
        }
    }

    $(document).on('click', '.basic_information #imageView', function () {
        const imgGfileSeq = $(this).data('value');
        callWindowImageViewer(imgGfileSeq);
    });
    /* event */
</script>