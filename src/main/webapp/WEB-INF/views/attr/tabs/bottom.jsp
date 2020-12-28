<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<audio id='fail_play' src='/resource/sound/fail.wav'></audio>
<audio id='success_play' src='/resource/sound/success.wav'></audio>
<form id="common_formdata_multi_upload_form" method="post">
    <input type="file" id="click_singfile_chose_btn" name="click_singfile_chose_btn" style="display: none;">
    <input type="file" id="click_multifile_chose_btn" name="click_multifile_chose_btn" multiple  style="display: none;">
</form>
<form id="estimate_version_up_sequence_form">
    <input type="hidden" id="hidden_est_seq" name="hidden_est_seq">
    <input type="hidden" id="hidden_control_seq" name="hidden_control_seq">
</form>
<!-- CAD 도면 업로드 공통 Start -->
<div class="modal" id="common_cad_file_attach_pop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg cadDrawing">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="headerTitle_01" id="common_cad_file_attach_pop_title">도면 등록</h2>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="common_cad_file_attach_form" name="common_cad_file_attach_form">
                    <input type="hidden" id="queryId" name="queryId" value="">
                    <input type="hidden" id="actionType" name="actionType" value="">
                    <input type="hidden" id="fileGrid" name="fileGrid" value="">
                    <div class="buttonWrap">
                        <button type="button" class="defaultBtn radius blue right_float" id="cadFileConvertUploadCompletedBtn" disabled>Save</button>
                    </div>
                    <div id="common_cad_file_attach_grid" style="margin:auto;"></div>
                    <div class="right_sort fileTableInfoWrap">
                        <h4>전체 조회 건수 (Total : <span id="cadFileUploadTotalCount" style="color: #00b3ee">0</span>)</h4>
                    </div>
                    <div class="fileTableWrap">
                    <div id="attachDragAndDrop">
                        <div id="common_cad_upload_file_grid" style="margin:auto;"></div>
                    </div>
<%--                        <table class="colStyle" id="attachDragAndDrop" >--%>
<%--                            <caption></caption>--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th scope="col" class="fileName txt">파일명</th>--%>
<%--                                <th scope="col" class="etcInfo">확장자</th>--%>
<%--                                <th scope="col" class="etcInfo">파일 사이즈</th>--%>
<%--                                <th scope="col" class="etcInfo">매칭도면번호</th>--%>
<%--                                <th scope="col" class="etcInfo">메시지</th>--%>
<%--                                <th scope="col" class="etcInfo"></th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody class="files"></tbody>--%>
<%--                        </table>--%>
                    </div>
                    <div class="fileTableInfoWrap right_float">
                        <h4>첨부파일 개수 : <span id="successCntHtml">0</span><span class="errorInfo">에러파일 : <span id="errorCntHtml">0</span></span></h4>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- CAD 도면 업로드 공통 End -->
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
        <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>
        <div class="qualityWrap">
            <div class="h_area">
                    <span class="buttonWrap" id="inspect_method_btn">
                        <span style="height: 30px;float: left;">&nbsp;</span>
<%--                        <span class="work_info_area">--%>
<%--                            <label for="CAM_WORK_USER_ID" class="wd_100 worker">CAM 작업자: </label>--%>
<%--                            <select id="CAM_WORK_USER_ID" name="CAM_WORK_USER_ID" title="견적 담당자" class="wd_200"></select>--%>
<%--                        </span>--%>
                    </span>
                <ul class="listWrap right_float">
                    <span class="barCode" id="g_item_detail_pop_barcode_span"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>
                    <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode hg_30" name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>
                </ul>
            </div>
            <form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form" onsubmit="return false;">
                <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInfo"/>
                <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
                <div class="d-flex align-items-center">
                    <h4>기본정보</h4>
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
<!-- CAM 상세정보 layer popup : S -->
<div class="popup_container g_item_detail_pop_cam_pop" id="g_item_detail_pop_cam_pop" style="display: none;">
    <form class="form-inline" id="g_item_detail_pop_cam_pop_form" name="g_item_detail_pop_cam_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailGridCamPop"/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>

        <input type="hidden" id="ORDER_COMP_CD" name="ORDER_COMP_CD" value=""/>
        <input type="hidden" id="SIZE_TXT" name="SIZE_TXT" value=""/>
        <input type="hidden" id="DRAWING_NUM" name="DRAWING_NUM" value=""/>
        <input type="hidden" id="MATERIAL_TYPE" name="MATERIAL_TYPE" value=""/>
        <input type="hidden" id="CAD_FILE_SIZE" name="CAD_FILE_SIZE" value=""/>

        <div class="layerPopup">
            <h3>CAM 작업 상세 조회</h3>
            <button type="button" class="pop_close mt-10 mr-8" id="g_item_detail_pop_cam_pop_grid_pop_close2">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">

                 </div>
                <h4>&nbsp;</h4>
                <div class="list4">
                    <div id="g_item_detail_pop_camp_pop_grid_01" class="jqx-refresh"></div>
                </div>
            </div>
            <div class="btnWrap">
<%--                <button type="button" class="defaultBtn purple work_info_area" id="g_item_cam_work_start_btn" style="display: none;">CAM 작업시작</button>--%>
                <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_cam_pop_grid_pop_close">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- CAM 상세정보 layer popup : E -->

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
                <img id="drawingImage" style='width: 475px;height: 410px;' src="/resource/main/blank.jpg">
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
                        <button id="prev">이전</button>
                        <button id="next">다음</button>
                    </div>
                    <div class="ml-auto">
                        <button type="button" class="defaultBtn btn-100w green" id="processing_requirements_save">저장
                        </button>
                    </div>
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
                        </tbody>
                    </table>
                </div>
                <br>
                <div>
                    <form id="processing_requirements_form" role="form" onsubmit="return false;">
                        <input type="hidden" name="TYPE" id="TYPE">
                        <input type="hidden" name="SEQ1" id="SEQ1">
                        <input type="hidden" name="SEQ2" id="SEQ2">
                        <table class="processing_requirements_information">
                            <thead>
                            <tr>
                                <th colspan="4">가공요건정보</th>
                            </tr>
                            <tr>
                                <th colspan="2">항목</th>
                                <th>Count</th>
                                <th>Cost</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="e fw-bold" colspan="2">밀링가공 면수</td>
                                <td><input type="number" name="PROCESS_CNT_CST010" id="PROCESS_CNT_CST010"></td>
                                <td><input type="number" name="UNIT_AMT_CST010" id="UNIT_AMT_CST010" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">TAP 면수</td>
                                <td><input type="number" name="PROCESS_CNT_CST020" id="PROCESS_CNT_CST020"></td>
                                <td><input type="number" name="UNIT_AMT_CST020" id="UNIT_AMT_CST020" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" rowspan="2">치수 공차</td>
                                <td class="e ta-l">일반</td>
                                <td><input type="number" name="PROCESS_CNT_CST030" id="PROCESS_CNT_CST030"></td>
                                <td><input type="number" name="UNIT_AMT_CST030" id="UNIT_AMT_CST030" readonly></td>
                            </tr>
                            <tr>
                                <td class="e ta-l">정밀(~0.02)</td>
                                <td><input type="number" name="PROCESS_CNT_CST040" id="PROCESS_CNT_CST040"></td>
                                <td><input type="number" name="UNIT_AMT_CST040" id="UNIT_AMT_CST040" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" rowspan="2">외곽가공</td>
                                <td class="e ta-l">15T 이하</td>
                                <td><input type="number" name="PROCESS_CNT_CST050" id="PROCESS_CNT_CST050"></td>
                                <td><input type="number" name="UNIT_AMT_CST050" id="UNIT_AMT_CST050" readonly></td>
                            </tr>
                            <tr>
                                <td class="e ta-l">15T 초과</td>
                                <td><input type="number" name="PROCESS_CNT_CST060" id="PROCESS_CNT_CST060"></td>
                                <td><input type="number" name="UNIT_AMT_CST060" id="UNIT_AMT_CST060" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" rowspan="2">일반포켓</td>
                                <td class="e ta-l">15T 이하</td>
                                <td><input type="number" name="PROCESS_CNT_CST070" id="PROCESS_CNT_CST070"></td>
                                <td><input type="number" name="UNIT_AMT_CST070" id="UNIT_AMT_CST070" readonly></td>
                            </tr>
                            <tr>
                                <td class="e ta-l">15T 초과</td>
                                <td><input type="number" name="PROCESS_CNT_CST080" id="PROCESS_CNT_CST080"></td>
                                <td><input type="number" name="UNIT_AMT_CST080" id="UNIT_AMT_CST080" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" rowspan="2">관통포켓</td>
                                <td class="e ta-l">15T 이하</td>
                                <td><input type="number" name="PROCESS_CNT_CST090" id="PROCESS_CNT_CST090"></td>
                                <td><input type="number" name="UNIT_AMT_CST090" id="UNIT_AMT_CST090" readonly></td>
                            </tr>
                            <tr>
                                <td class="e ta-l">15T 초과</td>
                                <td><input type="number" name="PROCESS_CNT_CST100" id="PROCESS_CNT_CST100"></td>
                                <td><input type="number" name="UNIT_AMT_CST100" id="UNIT_AMT_CST100" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">Hole</td>
                                <td><input type="number" name="PROCESS_CNT_CST110" id="PROCESS_CNT_CST110"></td>
                                <td><input type="number" name="UNIT_AMT_CST110" id="UNIT_AMT_CST110" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">TAP</td>
                                <td><input type="number" name="PROCESS_CNT_CST120" id="PROCESS_CNT_CST120"></td>
                                <td><input type="number" name="UNIT_AMT_CST120" id="UNIT_AMT_CST120" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">공차 Hole</td>
                                <td><input type="number" name="PROCESS_CNT_CST130" id="PROCESS_CNT_CST130"></td>
                                <td><input type="number" name="UNIT_AMT_CST130" id="UNIT_AMT_CST130" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">특수 Hole</td>
                                <td><input type="number" name="PROCESS_CNT_CST140" id="PROCESS_CNT_CST140"></td>
                                <td><input type="number" name="UNIT_AMT_CST140" id="UNIT_AMT_CST140" readonly></td>
                            </tr>
                            <tr>
                                <td class="e fw-bold" colspan="2">C/B</td>
                                <td><input type="number" name="PROCESS_CNT_CST150" id="PROCESS_CNT_CST150"></td>
                                <td><input type="number" name="UNIT_AMT_CST150" id="UNIT_AMT_CST150" readonly></td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="3">Total</td>
                                <td><input type="number" id="TOTAL"></td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    let $cadFileConvertUploadCompletedBtn = $("#cadFileConvertUploadCompletedBtn");
    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let commonConfirmPopup = $("#common_confirm_popup");
    let commonAlertPopup = $("#common_alert_popup");
    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadUploadFileGridId = "common_cad_upload_file_grid";
    let commonCadFileAttachObj;
    let commonCadUploadFileObj;
    let $commonCadFileAttachGrid;
    let $commonCadUploadFileGrid;
    let empty_data = [];

    let commonFileDownUploadPopup = $("#common_file_download_upload_pop");
    let commonFileDownUploadGridId = "common_file_download_upload_grid";
    let commonFileDownUploadGrid = $("#common_file_download_upload_grid");

    let g_ItemDetailPopGrid04;
    // let $camWorkManagePopGrid;
    let isProcessingRequirementsDirty = Boolean(false);
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
            width : "500",            // dialog 넓이 지정
            height : "500",        // dialog 높이 지정
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
            // $("#user_info_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/999");
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

        /** 캐드 파일 업로드 시작 스크립트 **/
        let estimateCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 1, minWidth: 70},
            {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ', hidden: true, width: 1, minWidth: 70},
            // {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 1, minWidth: 70},
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden: true, width: 1, minWidth: 70},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
            {title: '견적번호', datatype: 'string', dataIndx: 'EST_NUM', width: 205, minWidth: 100},
            {title: '차수', align: 'center', dataType: 'string', dataIndx: 'EST_VER', width: 50, minWidth: 50},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 255, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 200, minWidth: 100},
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            }
        ];

        let controlCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
            // {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 150, minWidth: 100},
            {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '파트', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '발주번호', align: 'center', dataType: 'string', dataIndx: 'ORDER_NUM', width: 155, minWidth: 50},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50},
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            }
        ];

        let controlCadRevFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 1, minWidth: 1},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
            // {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 150, minWidth: 100},
            {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '파트', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '발주번호', align: 'center', dataType: 'string', dataIndx: 'ORDER_NUM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            // {title: '규격', align: 'center', dataType: 'string', dataIndx: 'SIZE_TXT', width: 155, minWidth: 100},
            {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50},
            {title: '최근 변경일자', align: 'center', dataType: 'string', dataIndx: 'DRAWING_UP_DT', width: 100, minWidth: 50},
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            }
        ];

        let insideStockCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 70, minWidth: 70},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
            // {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '재고번호', datatype: 'string', dataIndx: 'INSIDE_STOCK_NUM', width: 155, minWidth: 100},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return 'V'
                }
            }
        ];

        commonCadFileAttachObj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false}, editable : false,
            scrollModel: {autoFit: true}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: controlCadFileColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.emptyGrid'},
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
                }
            },
            dataReady: function (event, ui) {
                let cnt = 0;
                let data = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let i=0;i<totalRecords;i++){
                    if(data[i].DRAWING_NUM) cnt++;
                }
                $('#cadFileUploadTotalCount').html(cnt);
            },
        };

        let commonUploadFileListColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 0, minWidth: 0},
            {title: 'PDF_GFILE_SEQ', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', hidden: true, width: 0, minWidth: 0},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 0, minWidth: 0},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 0, minWidth: 0},
            {title: 'SUCCESS', dataType: 'string', dataIndx: 'SUCCESS', hidden: true, width: 0, minWidth: 0},
            {title: '파일명', dataType: 'string', dataIndx: 'ORGINAL_FILE_NM', width: 200, minWidth: 70},
            {title: '확장자', dataType: 'string', dataIndx: 'FILE_EXT', width: 70, minWidth: 70},
            {title: '파일크기', datatype: 'string', dataIndx: 'FILE_SIZE', width: 80, minWidth: 50,
                render: function (ui) {
                    return fn_getFileSize(ui.rowData.FILE_SIZE);
                },
            },
            {title: '매칭 도면번호', datatype: 'string', dataIndx: 'MAPPING_STR', width: 150, minWidth: 100},
            {title: '메시지', align: 'center', dataType: 'string', dataIndx: 'MESSAGE', width: 250, minWidth: 100},
            {title: '작업', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataType: 'string', dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    return '<button type="button" class="miniBtn red" id="REMOVE_CAD_FILE_UPLOAD_BTN">삭제</button>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#REMOVE_CAD_FILE_UPLOAD_BTN').bind('click', function(e) {
                        var gridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data');
                        var delKdys = [];
                        var selfDelKdys = [];
                        $.each(gridData, function (key, eachRowData) {
                            if (rowData.FILE_EXT == "pdf") {
                                if(rowData.PDF_GFILE_SEQ === eachRowData.PDF_GFILE_SEQ)
                                    eachRowData.PDF_GFILE_SEQ = '';
                            } else {
                                if(rowData.DXF_GFILE_SEQ === eachRowData.DXF_GFILE_SEQ)
                                    eachRowData.DXF_GFILE_SEQ = '';
                            }
                            if (!eachRowData.DXF_GFILE_SEQ && !eachRowData.PDF_GFILE_SEQ) {
                                delKdys.push({'rowIndx': eachRowData});
                            }
                        });
                        $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: delKdys});
                        $commonCadFileAttachGrid.pqGrid('refresh');

                        $commonCadUploadFileGrid.pqGrid("deleteRow", {rowIndx: ui.rowIndx, effect: true });
                        $commonCadUploadFileGrid.pqGrid('refresh');

                    });
                }
            }
        ];

        commonCadUploadFileObj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false}, editable : false,
            strNoRows: '<div style="font-size:14px;margin-top:20px;">마우스로 파일을 Drag & Drop 하세요.</div>',
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: commonUploadFileListColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.emptyGrid', 'COUNT': 0},
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
                }
            },
            dataReady: function (event, ui) {
                let success_cnt = 0;
                let fail_cnt = 0;
                let data = $commonCadUploadFileGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let i=0;i<totalRecords;i++){
                    if(data[i].SUCCESS == "Y") success_cnt++;
                    else fail_cnt++;
                }
                $("#successCntHtml").html(success_cnt);
                $("#errorCntHtml").html(fail_cnt);
                if(totalRecords > 0 && fail_cnt == 0){
                    $('#cadFileConvertUploadCompletedBtn').prop('disabled', false);
                }else{
                    $('#cadFileConvertUploadCompletedBtn').prop('disabled', true);
                }
            },
        };

        /** drag & drop file Attach */
        let uploadControlFiles = [];

        let $attachDragAndDrop = $("#attachDragAndDrop");
        $attachDragAndDrop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
            $(this).addClass('drag-over');
        }).on("dragleave", function(e) {  //드래그 요소가 나갔을때
            $(this).removeClass('drag-over');
        }).on("dragover", function(e) {
            e.stopPropagation();
            e.preventDefault();
        }).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
            e.preventDefault();
            $(this).startWaitMe();
            $(this).removeClass('drag-over');
            let cadFiles = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
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
                formData.append('actionType', $('#common_cad_file_attach_form').find('#actionType').val());
                uploadControlFiles = [];    // 파일 업로드 정보 초기화
                $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                fnFormDataFileUploadAjax(function (data) {
                    let fileUploadDataList = data.fileUploadDataList;
                    if (fileUploadDataList.length <= 0) {
                        fnAlert(null, "주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                        $(this).stopWaitMe();
                        return false;
                    }
                    // 도면 번호 없는 경우 삭제 처리
                    let gridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data')
                    let delKdys = [];
                    $.each(gridData, function (key, rowData) {
                        if (!rowData.CONTROL_NUM) {
                            delKdys.push({'rowIndx': rowData});
                        }
                    });
                    $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: delKdys});
                    $commonCadFileAttachGrid.pqGrid('option', {editable: true});
                    $commonCadFileAttachGrid.pqGrid('addNodes', fileUploadDataList, 0);
                    $commonCadFileAttachGrid.pqGrid('option', {editable: false});   // 수정 여부를 false 처리 한다.
                    $commonCadFileAttachGrid.pqGrid('refresh');

                    if (!(data.fileUploadList == undefined) && !(data.fileUploadList == null)) {
                        // 도면 번호 없는 경우 삭제 처리
                        let gridData = $commonCadUploadFileGrid.pqGrid('option', 'dataModel.data')
                        let delKdys = [];
                        $.each(gridData, function (key, rowData) {
                            if (!rowData.FILE_NM) {
                                delKdys.push({'rowIndx': rowData});
                            }
                        });
                        $commonCadUploadFileGrid.pqGrid('deleteRow', {rowList: delKdys});
                        $commonCadUploadFileGrid.pqGrid('option', {editable: true});
                        $commonCadUploadFileGrid.pqGrid('addNodes', data.fileUploadList, 0);
                        $commonCadUploadFileGrid.pqGrid('option', {editable: false});   // 수정 여부를 false 처리 한다.
                        $commonCadUploadFileGrid.pqGrid('refresh');
                        $(this).stopWaitMe();
                    }
                }, formData, '/uploadControlCadFiles');
            }
        });

        $cadFileConvertUploadCompletedBtn.on('click', function () {
            const actionType = $('#common_cad_file_attach_form').find('#actionType').val();
            // 주문 도면 차수 변경
            if (actionType === 'controlRev') {
                const message = '도면 변경시 바코드가 변경되며,<br>이미 배포된 바코드 출력도면은 교체해야 합니다.<br><br>진행하시겠습니까?';

                fnConfirm(null, message, function () {
                    let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
                    let changes = gridInstance.getChanges({format: 'byVal'});
                    changes.queryIdList = {
                        'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
                    };
                    $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
                    let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
                    fnPostAjax(function (data, callFunctionParam) {
                        fnAlertMessageAutoClose('save');
                        $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                        $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                        commonCadFileAttachPopup.modal('hide');
                    }, parameters, '');
                });
            } else {
                let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});
                changes.queryIdList = {
                    'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
                };
                $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
                let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlertMessageAutoClose('save');
                    $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                    $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                    commonCadFileAttachPopup.modal('hide');
                }, parameters, '');
            }
        })

        commonCadFileAttachPopup.on('show.bs.modal',function(e) {
            var actionType = $('#common_cad_file_attach_form').find('#actionType').val();
            $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면 등록');
            if(actionType == 'estimate') {          // 견적 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            }else if(actionType == 'control') {     // 주문 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadFileColModel);
            }else if(actionType == 'controlRev') {  // 주문 도면 차수 변경
                $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면변경(Revision up)');
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadRevFileColModel);
            }else if(actionType == 'inside') {      // 자재 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', insideStockCadFileColModel);
            }
            $commonCadFileAttachGrid.pqGrid('refresh');

            $commonCadUploadFileGrid = $('#' + commonCadUploadFileGridId).pqGrid(commonCadUploadFileObj);
            $commonCadUploadFileGrid.pqGrid('refresh');
        });

        commonCadFileAttachPopup.on('hide.bs.modal',function(e) {
            var actionType = $('#common_cad_file_attach_form').find('#actionType').val();
            if(actionType == 'estimate') {          // 견적 도면 등록
                $("#estimateRegisterReloadBtn").trigger("click");
            }else if(actionType == 'control' || actionType == 'controlRev') {     // 주문 도면 등록 || 주문 도면 차수 변경
                $("#CONTROL_MANAGE_SEARCH").trigger("click");
            }else if(actionType == 'inside') {      // 자재 도면 등록
                $("#stock_manage_search_btn").trigger("click");
            }
            uploadControlFiles = [];
            $commonCadFileAttachGrid.pqGrid('destroy');
            $commonCadUploadFileGrid.pqGrid('destroy');
        });
    });

    function callCadDrawingUploadPopup(actionType, queryId) {
        $('#common_cad_file_attach_form').find('#actionType').val(actionType);
        $('#common_cad_file_attach_form').find('#queryId').val(queryId);
        // clearCadFileAttachPopup(getCadUploadBlankHtml());
        setTimeout(function() {
            commonCadFileAttachPopup.modal('show');
        }, 200);
    }

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
        fnPostAjax(function (data, callFunctionParam) {
            let dxfFileDownloadYn = '${authUserInfo.DXF_FILE_DOWNLOAD_YN}';
            fnResetFrom("g_item_detail_pop_form");
            $itemDetailPopForm.find("#CAD_DOWNLOAD").addClass('d-none');
            $itemDetailPopForm.find("#CAD_DOWNLOAD").removeAttr('onClick');
            $itemDetailPopForm.find("#DRAWING_VIEW").removeAttr('onClick');
            $itemDetailPopForm.find("#WORK_HISTORY_INFO").removeAttr('onClick');
            let dataInfo = data.info;

            $itemDetailPopForm.find(".list1").find(".rowStyle").find("td").html('');
            if (dataInfo) {
                const emergencySpanElement = dataInfo.EMERGENCY_YN === 'Y' ? '<span class="mark">긴급</span>' : '';
                const materialFinishHeatSpanElement = dataInfo.MATERIAL_FINISH_HEAT === '열처리' ? '<span class="mark">열처리</span>' : '';
                const controlStatusHoldSpanElement = dataInfo.CONTROL_STATUS === 'ORD005' ? '<span class="mark" style="background-color: #ff0000; color: #ffffff">보류</span>' : '';

                //fnJsonDataToForm("stock_manage_pop_form", dataInfo);
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

                // $itemDetailPopForm.find("#MATERIAL_ORDER_STATUS_NM").html(dataInfo.MATERIAL_ORDER_STATUS_NM);
                // $itemDetailPopForm.find("#DRAWING_VER").html(dataInfo.DRAWING_VER);
                // $itemDetailPopForm.find("#MATERIAL_SIZE_TXT").html(dataInfo.MATERIAL_SIZE_TXT);

                // let filedownlod = "";
                // if (dataInfo.DXF_GFILE_SEQ != "" && dataInfo.DXF_GFILE_SEQ != undefined) {
                //     filedownlod = "<button type='button' class='smallBtn red' onclick=\"javascript:fnFileDownloadFormPageAction('" + dataInfo.DXF_GFILE_SEQ + "');\"><i class='fa fa-trash'></i><span >다운로드</span></button>";
                // }
                // $itemDetailPopForm.find("#DXF_GFILE_SEQ").html(filedownlod);

                $itemDetailPopForm.find("#ORDER_COMP_NM_DESIGNER_NM").html(dataInfo.ORDER_COMP_NM_DESIGNER_NM);
                $itemDetailPopForm.find("#OUTSIDE_COMP_NM").html(dataInfo.OUTSIDE_COMP_NM);
                $itemDetailPopForm.find("#MATERIAL_IN_DT").html(dataInfo.MATERIAL_IN_DT);

                $itemDetailPopForm.find("#CONTROL_CONFIRM_DT").html(dataInfo.CONTROL_CONFIRM_DT || '' + controlStatusHoldSpanElement);
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
                    $itemDetailPopForm.find("#DRAWING_VIEW").attr('onClick', 'callWindowImageViewer(' + dataInfo.IMG_GFILE_SEQ + ');');
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
        fnPostAjax(function (data, callFunctionParam) {
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
        g_ItemDetailPopGridId01.pqGrid('destroy');
        g_ItemDetailPopGridId02.pqGrid('destroy');
        g_ItemDetailPopGridId03.pqGrid('destroy');
        g_ItemDetailPopGridId04.pqGrid('destroy');
        g_ItemDetailPopGridId05.pqGrid('destroy');
    });

    $('#g_item_detail_pop_form').find('[name=control_num_arrow]').on('click', function () {
        const value = $(this).data('value');
        const grid = orderDetailGrid.getInstance( ).grid;
        const rowData = grid.getRowData({rowIndx: orderDetailRowIndx + value});

        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, orderDetailGrid, orderDetailRowIndx + value);
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
    let g_ItemDetailPopCamPopGridId01 =  $("#g_item_detail_pop_camp_pop_grid_01");
    let g_ItemDetailPopCamPopColModel01 = [
        {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
        {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
        {title: 'CAM_SEQ', dataType: 'integer', dataIndx: 'CAM_SEQ', hidden: true},
        // {
        //     title: '', align: 'center', dataIndx: 'DETAIL_INFO', width: 40, minWidth: 40,
        //     render: function (ui) {
        //         let rowIndx = ui.rowIndx, grid = this;
        //         if (ui.rowData['CONTROL_SEQ'] > 0) return "<span class=\"ui-icon ui-icon-circle-zoomin\"></span>";
        //         return '';
        //     }
        // },
        {title: '주문확정<br>일자', dataIndx: 'ORDER_CONFIRM_DT', width: 95},
        {title: '외<br>주', minWidth: 30, dataIndx: 'OUTSIDE_YN'},
        {title: '관리번호', halign: 'center', align: 'left', dataIndx: 'CONTROL_NUM', width: 180},
        {
            title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
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
                    $('#g_item_detail_pop').modal('hide');
                    g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    $('#g_item_detail_pop_cam_pop').modal('hide');
                });
            }
        },
        {title: '작업<br>형태', dataIndx: 'WORK_TYPE'},
        {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 95},
        {title: '규격', dataIndx: 'SIZE_TXT', width: 95},
        {title: '재질', dataIndx: 'MATERIAL_TYPE_NM', width: 95},
        {title: '도면번호', halign: 'center', align: 'left', dataIndx: 'DRAWING_NUM', width: 150},
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
                    callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                });
            }
        },
        {
            title: 'CAD 파일', align: 'center',
            colModel: [
                {title: 'Size', dataIndx: 'CAD_FILE_SIZE', width: 95},
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
        {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM', width: 80},
        {title: '수량', dataIndx: 'CONTROL_PART_QTY'},
        {
            title: '1EA 가공시간', align: 'center',
            colModel: [
                {title: 'NC', dataIndx: 'NC_WORK_TIME'},
                {title: 'Total', dataIndx: 'TOTAL_WORK_TIME'}
            ]
        },
        {
            title: 'CAM 작업 실적', align: 'center',
            colModel: [
                {title: 'Steps', dataIndx: 'SEQ'},
                {title: '작업자', dataIndx: 'WORK_USER_NM', width: 95},
                {title: '업데이트', dataIndx: 'CAM_WORK_DT', width: 95},
                {title: '경험 기록사항', halign: 'center', align: 'left', dataIndx: 'HISTORY_NOTE', width: 120}
            ]
        }
    ];
    let g_ItemDetailPopCamPopObj01 = {
        height: 320,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('g_item_detail_pop_cam_pop_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        strNoRows: g_noData,
        editable: false,
        postRenderInterval: -1,
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
        //scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: true, styleHead: {'vertical-align': 'middle'}},
        selectionModel: {type: 'row', mode: 'single'},
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: g_ItemDetailPopCamPopColModel01,
        rowInit: function (ui) {
            if (ui.rowIndx === 0) {
                return {style: {'background': '#FFFF00'}};
            }
        }
    };
    let g_item_detail_pop_cam_pop = function(CONTROL_SEQ,CONTROL_DETAIL_SEQ){
        $("#g_item_detail_pop_cam_pop_form").find("#queryId").val('inspection.selectCommItemDetailGridCamPop');
        $("#g_item_detail_pop_cam_pop_form").find("#CONTROL_SEQ").val(CONTROL_SEQ);
        $("#g_item_detail_pop_cam_pop_form").find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);
        $('#g_item_detail_pop_cam_pop').modal('show');

        $("#g_item_detail_pop_cam_pop_form").find("#queryId").val('inspection.selectCommItemDetailGridCamPopBefore');
        let parameters = {
         'url': '/json-info',
         'data': fnFormToJsonArrayData('g_item_detail_pop_cam_pop_form')
        };
        fnPostAjaxAsync(function (data, callFunctionParam) {
         let dataInfo = data.info;
         if(dataInfo == null ) {
             fnResetFrom("g_item_detail_pop_cam_pop_form");
         }else{
             fnJsonDataToForm("g_item_detail_pop_cam_pop_form", dataInfo);
         }
        }, parameters, '');

        $("#g_item_detail_pop_cam_pop_form").find("#queryId").val('inspection.selectCommItemDetailGridCamPop');
        g_ItemDetailPopCamPopObj01.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_cam_pop_form');
        g_ItemDetailPopCamPopGridId01.pqGrid(g_ItemDetailPopCamPopObj01);

    }

    $("#g_item_detail_pop_cam_pop_grid_pop_close, #g_item_detail_pop_cam_pop_grid_pop_close2").on('click', function () {
         //fnResetFrom("g_item_detail_pop_cam_pop_form");
        //       console.log(g_ItemDetailPopCamPopGridId01);
        $('#g_item_detail_pop_cam_pop').modal('hide');
              // g_ItemDetailPopCamPopGridId01.pqGrid('destroy');

     });
    $("#g_item_detail_pop_cam_pop").on('hide.bs.modal', function(){
          fnResetFrom("g_item_detail_pop_cam_pop_form");
          g_ItemDetailPopCamPopGridId01.pqGrid('destroy');
      });
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

    $("#btnCommonWarehouseManageRemove").on('click', function(){
        $("#common_warehouse_manage_popup_form #queryId").val('material.deleteCommonWarehouseManage');
        let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#common_warehouse_manage_popup_form')};
        fnPostAjaxAsync(function (data, callFunctionParam) {
            commonWarehouseManageGrid.pqGrid('refreshDataAndView');
        }, parameters, '');
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
            ];
            const obj = {
                height: 350,
                collapsible: false,
                // postRenderInterval: -1,
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

            changeData();
        },
        'hide.bs.modal': function () {

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
        let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let queryId = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            queryId = 'estimate.selectProcessingRequirementsInfo';
        } else if ($processingRequirementsType === 'CONTROL') {
            queryId = 'orderMapper.selectProcessingRequirementsInfo';
        }

        let postData = $.extend({queryId: queryId}, rowData);
        postData.TYPE = $processingRequirementsType;
        postData.SEQ1 = $('.basic_information').find('#seq1').html();
        postData.SEQ2 = $('.basic_information').find('#seq2').html();
        let parameter = {'url': '/json-info', 'data': postData};

        fnPostAjax(function (data) {
            createBotTable(data);
        }, parameter, '');
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
            level = info.LEVEL || '';
            unitBasicAmt = info.UNIT_BASIC_AMT || '';
            img = info.IMG_GFILE_SEQ ? '<span class="fileSearchIcon" id="imageView" data-value="' + info.IMG_GFILE_SEQ + '" style="margin-left: 10px; vertical-align: middle; cursor: pointer"></span>' : '';
            info.IMG_GFILE_SEQ
            '<span class="fileSearchIcon" id="imageView" data-value="' + info.IMG_GFILE_SEQ + '" style="margin-left: 10px; vertical-align: middle; cursor: pointer"></span>'
            // TODO: display : none;
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

        $('.basic_information > tbody').html(htmlString);
    };

    const createBotTable = function (data) {
        // TODO: undefined 처리
        if (data) {
            const info = data.info;
            for (let i = 1; i <= 15; i++) {
                let str = String(i).padStart(2, '0') + '0';

                $('#PROCESS_CNT_CST' + str).val(info['PROCESS_CNT_CST' + str] || ''); // TODO: input type number일 떄 undefined 들어가면 ?
                $('#UNIT_AMT_CST' + str).val(info['UNIT_AMT_CST' + str] || '');
            }

            $('#TOTAL').val(info.TOTAL || '');
        } else {
            for (let i = 1; i <= 15; i++) {
                let str = String(i).padStart(2, '0') + '0';

                $('#PROCESS_CNT_CST' + str).val('');
                $('#UNIT_AMT_CST' + str).val('');
            }
        }
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

        if (!(windowImageViewer === undefined || windowImageViewer.closed) && imgGfileSeq) {
            $('.basic_information #imageView').trigger('click');
        }
    };

    //TODO: 함수명 변경
    const changeData = function () {
        const rowData = processingRequirementsTargetGrid.pqGrid("getRowData", {rowIndx: processingRequirementsTargetRowIndex});
        fnResetFrom('monthly_productivity_top_form');
        visibilityButton();
        changeProcessingRequirementsBasicInformation(rowData);
        changeProcessingRequirementsInformation(rowData);
        changeImageView(rowData);
    };
    /* function */

    /* event */
    $('#processingRequirementsModal #prev').on('click', function () {
        if (isProcessingRequirementsDirty) {
            fnAlert(null, '현재 수정중인 작업을 완료 후 다시 실행해 주세요.');
            return
        }

        processingRequirementsTargetRowIndex--;
        changeData();
    });

    $('#processingRequirementsModal #next').on('click', function () {
        if (isProcessingRequirementsDirty) {
            fnAlert(null, '현재 수정중인 작업을 완료 후 다시 실행해 주세요.');
            return
        }

        processingRequirementsTargetRowIndex++;
        changeData();
    });

    $('#processing_requirements_save').on('click', function () {
        let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
        let url = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            url = 'processingRequirementsEstimateSave';
        } else if ($processingRequirementsType === 'CONTROL') {
            url = 'processingRequirementsControlSave';
        }

        postData.TYPE = $processingRequirementsType;
        postData.SEQ1 = $('.basic_information').find('#seq1').html();
        postData.SEQ2 = $('.basic_information').find('#seq2').html();

        let parameter = {'url': '/' + url, 'data': {data: JSON.stringify(postData)}};

        fnPostAjax(function (data) {
            const flag = data.flag;

            if (flag) {
                fnAlert(null, '<srping:message code="error.common"/>');
                return;
            }

            fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
            isProcessingRequirementsDirty = false;
        }, parameter, '');
    });

    $('#monthly_productivity_top_form').on('change', function () {
        isProcessingRequirementsDirty = true;
    });

    $(document).on('click', '.basic_information #imageView', function () {
        const imgGfileSeq = $(this).data('value');

        callWindowImageViewer(imgGfileSeq);
    });
    /* event */
</script>