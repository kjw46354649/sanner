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
<div class="custom_loading_bar" style="z-index:99999;display: none;position: absolute;width: 100%;height: 100%;top: 0%;">
    <span style="position: absolute;left: 50%;top: 50%;">
        <img src="/resource/asset/images/loading_5.gif">
    </span>
    <div style="width: 100%;height: 100%;background: white;opacity: 0.1;"></div>
</div>
<form id="common_formdata_multi_upload_form" method="post">
    <input type="file" id="click_singfile_chose_btn" name="click_singfile_chose_btn" style="display: none;">
    <input type="file" id="click_multifile_chose_btn" name="click_multifile_chose_btn" multiple  style="display: none;">
</form>
<form id="estimate_version_up_sequence_form">
    <input type="hidden" id="hidden_est_seq" name="hidden_est_seq">
<%--    <input type="hidden" id="hidden_control_seq" name="hidden_control_seq">--%>
    <input type="hidden" id="hidden_order_seq" name="hidden_order_seq">
</form>
<form id="drawing_file_upload_form" name="drawing_file_upload_form" method="post">
    <input type="hidden" id="actionType" name="actionType">
    <input type="hidden" id="queryId" name="queryId">
    <input type="hidden" id="WORK_KEY" name="WORK_KEY">
    <input type="hidden" id="INSIDE_STOCK_SEQ_STR" name="INSIDE_STOCK_SEQ_STR">
</form>
<form id="drawing_revision_pop_form" name="drawing_revision_pop_form" method="post">
    <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ">
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ">
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ">
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
                    <input type="hidden" id="TYPE" name="TYPE" value="">
                    <input type="hidden" id="INSIDE_STOCK_SEQ" name="INSIDE_STOCK_SEQ" value="">
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
        <h3>작업상세정보</h3>
        <span class="right_float" style="margin-right: 100px;">
            <span class="barCodeTxt" style="margin-right: 5px;opacity: 0;">&nbsp;<input type="text" class="wd_270_barcode hg_30" name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>
            <span class="barCode" id="g_item_detail_pop_barcode_span"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>
        </span>
        <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close" style="float: right;right: 12px;position: absolute;">닫기</button>
<%--        <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>--%>
        <div class="h_area"></div>
        <div class="qualityWrap" style="display: flex;">
            <div style="width: 51%;">
                <form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form" onsubmit="return false;" onkeypress="return event.keyCode != 13;">
                    <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInfo"/>
                    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
                    <input type="hidden" id="ASSEMBLY_CONTROL_DETAIL_SEQ" name="ASSEMBLY_CONTROL_DETAIL_SEQ"/>
                    <input type="hidden" id="FIRST_PART_CONTROL_DETAIL_SEQ" name="FIRST_PART_CONTROL_DETAIL_SEQ"/>
                    <input type="hidden" id="PREV_PART_CONTROL_DETAIL_SEQ" name="PREV_PART_CONTROL_DETAIL_SEQ" value=""/>
                    <input type="hidden" id="NEXT_PART_CONTROL_DETAIL_SEQ" name="NEXT_PART_CONTROL_DETAIL_SEQ" value=""/>
                    <input type="hidden" id="IMG_GFILE_SEQ" name="IMG_GFILE_SEQ" value=""/>
                    <div class="d-flex align-items-center" style="width:100%;height: 50px;">
                        <h4>기본정보</h4>
                        <div id="view_part_wrap" style="margin-left: 95px;">
                            <button class="defaultBtn" name="view_assembly_or_part" id="WTP020" value="WTP020">조립</button>
                            <button class="defaultBtn" name="view_assembly_or_part" id="WTP050" value="WTP050">파트</button>
                            <span name="view_part" id="view_part_prev" style="cursor: pointer;">
                                <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표" style="width: 15px;">
                            </span>
                            <span name="view_part" id="view_part_next" style="cursor: pointer;">
                                <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표" style="width: 15px;">
                            </span>
                        </div>
                        <div style="margin-left: auto;">
                            <input id="item_detail_pop_input" name="item_detail_pop_input" type="text" class="hg_30" placeholder="작업번호를 입력해주세요" value="">
                        </div>
                    </div>
                    <div class="list1">
                        <table class="rowStyle" style="table-layout: fixed;">
                            <colgroup>
                                <col width="13%">
                                <col width="20%">
                                <col width="10%">
                                <col width="20%">
                            </colgroup>
                            <tr>
                                <th>
                                <span name="control_num_arrow" id="left_arrow" data-value="-1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표" style="width: 15px;">
                                </span>
                                    <span>작업지시번호</span>
                                    <span name="control_num_arrow" id="right_arrow" data-value="1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표" style="width: 15px;">
                                </span>
                                </th>
                                <td id="CONTROL_NUM" class="red"></td>
                                <th class="lightGreen">도면번호</th>
                                <td id="DRAWING_NUM" class="red"></td>
                            </tr>
                            <tr>
                                <th>가공납기</th>
                                <td id="INNER_DUE_DT"></td>
                                <th class="lightGreen">품명</th>
                                <td id="ITEM_NM"></td>
                            </tr>
                            <tr>
                                <th>작업형태</th>
                                <td id="WORK_TYPE_NM"></td>
                                <th class="lightGreen">모듈</th>
                                <td id="MODULE_NM" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
                            </tr>
                            <tr>
                                <th>수량(원,대)</th>
                                <td id="ORDER_QTY_INFO"></td>
                                <th class="lightGreen">프로젝트</th>
                                <td id="PROJECT_NM"></td>
                                <%--<th>소재주문상태</th>--%>
                                <%--<td id="MATERIAL_ORDER_STATUS_NM"></td>--%>
                            </tr>
                            <tr>
                                <th>규격</th>
                                <td id="SIZE_TXT"></td>
                                <th class="lightGreen">발주처</th>
                                <td id="ORDER_COMP_NM"></td>
                                <%--<th>도면수정Rev.</th>--%>
                                <%--<td id="DRAWING_VER"></td>--%>
                                <%--<th>도면파일</th>--%>
                                <%--<td id="DXF_GFILE_SEQ"></td>--%>
                            </tr>
                            <tr>
                                <th>소재</th>
                                <td id="MATERIAL_DETAIL_NM"></td>
                                <th class="lightGreen">구매담당/설계자</th>
                                <td id="ORDER_STAFF_NM_DESIGNER_NM"></td>
                            </tr>
                            <tr>
                                <th>표면처리</th>
                                <td id="SURFACE_TREAT_NM"></td>
                                <th class="lightGreen">주요검사</th>
                                <td id="MAIN_INSPECTION_NM"></td>
                            </tr>
                            <tr>
                                <th>작업확정 일시</th>
                                <td id="CONTROL_CONFIRM_DT"></td>
                                <th class="palegoldenrod">외주확정 일시</th>
                                <td id="OUTSIDE_CONFIRM_DT"></td>
                                <%--<th>유사주문수행기록</th>--%>
                                <%--<td id="WORK_HISTORY_INFO"></td>--%>
                            </tr>
                            <tr>
                                <th class="redText">가공확정 일시</th>
                                <td id="PROCESS_CONFIRM_DT"></td>
                                <th class="palegoldenrod">외주업체명</th>
                                <td id="OUTSIDE_COMP_NM"></td>
                            </tr>
                            <tr>
                                <th>소재주문 일시</th>
                                <td id="MATERIAL_ORDER_DT"></td>
                                <th class="palegoldenrod">외주요청 일시</th>
                                <td id="OUTSIDE_PROCESS_CONFIRM_DT"></td>
                            </tr>
                            <tr>
                                <th>소재입고 일시</th>
                                <td id="MATERIAL_IN_DT"></td>
                                <th class="palegoldenrod">외주입고 일시</th>
                                <td id="OUTSIDE_IN_DT"></td>
                            </tr>
                            <tr>
                                <th class="blueviolet">가공완료 일시</th>
                                <td id="PROCESS_FINISH_DT" class="blueviolet"></td>
                                <th>재고번호</th>
                                <td id="INSIDE_STOCK"></td>
                            </tr>
                            <tr>
                                <th class="blueviolet">출고완료 일시</th>
                                <td id="OUT_FINISH_DT"></td>
                                <th>진행상태</th>
                                <td id="PART_STATUS_NM"></td>
                            </tr>

                        </table>
                    </div>
                    <div class="listdiv">
                        <div class="tableWrap">
                            <ul class="conWrapPopLeft">
                                <h4>주문접수번호</h4>
                                <div id="g_item_detail_pop_grid_06" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPopRight">
                                <h4>위치변동이력</h4>
                                <div id="g_item_detail_pop_grid_02" class="jqx-refresh"></div>
                            </ul>
                        </div>
                    </div>
                    <div class="listdiv">
                        <div class="tableWrap">
                            <ul class="conWrapPopLeft">
                                <h4>공유사항</h4>
                                <div id="g_item_detail_pop_grid_03" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPopRight">
                                <h4>품질검사 이력</h4>
                                <span class="slt_wrap namePlusSlt rightName">
                                    <label id="search_inspection_detail" style="width: 50px;text-align: center;border-radius: 3px;background-color: #595757;color: white;">검색</label>
                                </span>
                                <div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>
                            </ul>
                        </div>
                    </div>
<%--                    <h4>품질사항</h4>--%>
<%--                    <div class="list4">--%>
<%--                        <div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>--%>
<%--                    </div>--%>
                </form>
            </div>
            <div style="width: 50%;margin-left: 2%;">
                <div class="d-flex align-items-center">
                    <h4></h4>
                    <div class="btnWrap ml-auto mb-10">
                        <button id="ITEM_CAD_DOWNLOAD" class="d-none defaultBtn">캐드파일</button>
                        <button id="ITEM_DRAWING_VIEW" class="defaultBtn" style="background-color: #ecf6de;">도면상세보기</button>
                        <button id="ITEM_WORK_HISTORY_INFO" class="defaultBtn">가공상세수행 기록</button>
                    </div>
                </div>
                <div class="list1" style="border: 1px solid #AAA;background: white;overflow: hidden;height: 469px;">
                    <img id="item_detail_pop_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
                </div>
                <div class="listdiv">
                    <div class="tableWrap">
                        <ul class="conWrapPop60" style="width: 100%;">
                            <h4>가공이력</h4>
                            <div id="g_item_detail_pop_grid_01" class="jqx-refresh"></div>
                        </ul>
                    </div>
                </div>
                <div class="listdiv">
                    <div class="tableWrap">
                        <ul class="conWrapPop60" style="width: 100%;">
                            <h4>CAM작업이력 <span style="color:#7d1919" id="g_item_detail_pop_grid_04_info1"></span></h4>
                            <span class="slt_wrap namePlusSlt rightName">
                                <label id="g_item_detail_pop_grid_04_info2">Update </label>
                            </span>
                            <div id="g_item_detail_pop_grid_04" class="jqx-refresh"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
<%--        <div class="btnWrap">--%>
<%--            &lt;%&ndash;                <button type="button" class="defaultBtn purple work_info_area" id="g_item_cam_work_start_btn" style="display: none;">CAM 작업시작</button>&ndash;%&gt;--%>
<%--            <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close">닫기</button>--%>
<%--        </div>--%>
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
            <div class="h_area">
                <input type="search" id="locationPopFilterKeyword" placeholder="Enter your keyword">
                <select id="locationPopFilterColumn"></select>
                <select id="locationPopFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <div class="d-inline right_float">
                    <button type="button" class="defaultBtn btn-120w" id="btnLocationLabelPrint">라벨 출력</button>
                </div>
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
                <img id="drawingImage" style='width: 785px;height: 555.084px;' src="/resource/main/blank.jpg" onload="OnLoadImage();">
                <img id="drawingLoadingImage" style='margin-left: 380px;margin-top: 268px;margin-bottom:255px;display: none;' src="/resource/asset/images/loading_4.gif">
            </div>
            <div style="padding: 3px 2px 5px 0px; float: left;">
                <table class="quick_drawing_table">
                    <tbody>
                        <tr>
                            <th>접수 번호</th>
                            <td id="QUICK_DRAWING_REGIST_NUM" style="width: 30%;"></td>
                            <th>도면번호</th>
                            <td id="QUICK_DRAWING_NUM" colspan="3"></td>
                            <th>Rev.</th>
                            <td id="QUICK_DRAWING_REV" style="width: 7%;"></td>
                        </tr>
                        <tr class="trHeight">
                            <th>작업 번호</th>
                            <td id="QUICK_DRAWING_CONTROL_NUM"></td>
                            <th>규격</th>
                            <td id="QUICK_DRAWING_SIZE_TXT" colspan="2"></td>
                            <th>소재</th>
                            <td id="QUICK_DRAWING_MATERIAL_DETAIL" colspan="2"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="padding: 3px 0px 5px 0px; float: right;">
                <button type="button" class="defaultBtn greenPopGra" id="common_quick_drawing_detail_view" style="height: 60px;font-size: 1.5rem;font-weight: bold;">상세보기</button>
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
        <input type="hidden" name="MAIN_IMG_SEQ" id="MAIN_IMG_SEQ">
        <div class="layerPopup" style="height: 930px;">
            <h3>도면보기</h3>
            <button type="button" class="pop_close mt-10 mr-8" name="common_multi_download_pop_close">닫기
            </button>
            <div class="qualityWrap">
                <div class="h_area">
                    <img id="floor_plan_img" src="" alt="" class="viewer-move" style="height: 610px;margin-top: 23px;position: absolute;width: 810px;max-width: none !important;transform: none;left: 10%;">
                </div>
                <h4></h4>
                <div class="list4" style="margin-top: 640px;">
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
    <div role="document">
<%--        <div class="modal-content" style="width: 450px">--%>
        <div id="processingPopBody" class="modal-content" style="width: 650px;left: 35%;margin-top: 7%;">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">가공요건 입력 / 가공비 계산</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="d-flex">
                    <div id="processingRequireImgDiv" style="display:none;width: 63%;margin-right: 1%;">
                        <img id="processing_pop_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
                    </div>
                    <div id="processingRequireInfoDiv" style="width: 100%;">
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
                                    <col width="10">
                                    <col width="40">
                                    <col width="10">
                                    <col width="40">
                                </colgroup>
                                <tbody>
                                <tr style="display: none;">
                                    <td id="seq1"></td>
                                    <td id="seq2"></td>
                                    <td id="seq3"></td>
                                    <td id="seq4"></td>
                                </tr>
                                <tr>
                                    <td scope="row">작업번호</td>
                                    <td></td>
                                    <td scope="row">도면번호</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td scope="row">접수번호</td>
                                    <td></td>
                                    <td scope="row">소재/작업형태</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td scope="row">규격</td>
                                    <td></td>
                                    <td scope="row">표면처리</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td scope="row">규격 Level</td>
                                    <td></td>
                                    <td scope="row">기본가공비</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td scope="row" colspan="2" class="darkBrown">가공비 Total</td>
                                    <td colspan="2"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <br>
                        <div class="d-flex">
                            <div style="width: 50%;">
                                <div>
                                    <span style="font-size: 1.5rem;font-family: 'NotoKrB';color: #535759;">일반가공 요건</span>
                                </div>
                                <form id="processing_requirements_form" role="form" onsubmit="return false;">
                                    <input type="hidden" name="TYPE" id="TYPE">
                                    <input type="hidden" name="WORK_TYPE" id="WORK_TYPE">
                                    <input type="hidden" name="SEQ1" id="SEQ1">
                                    <input type="hidden" name="SEQ2" id="SEQ2">
                                    <input type="hidden" name="refreshGridId" id="refreshGridId">
                                    <div id="processing_requirements_grid"></div>
                                </form>
                            </div>
                            <div style="width: 45%; margin-left: 5%;">
                                <div class="d-flex">
                                    <form id="processing_requirements_special_form" role="form" onsubmit="return false;">
                                        <input type="hidden" name="ETC_FACTOR_CD" id="ETC_FACTOR_CD">
                                        <input type="hidden" name="SEQ1" id="SEQ1">
                                        <input type="hidden" name="SEQ2" id="SEQ2">
                                    </form>
                                    <span style="font-size: 1.5rem;font-family: 'NotoKrB';color: #535759;">특수가공 요건</span>
                                    <div class="ml-auto">
                                        <button class="defaultBtn radius btn-60w blue" id="save_special_process" style="padding: 0;margin: 0;">Apply</button>
                                    </div>
                                </div>
                                <div style="height: 26%;">
                                    <table class="rightTopTable">
                                        <colgroup>
                                            <col width="15">
                                            <col width="85">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <td>Level1</td>
                                            <td>Level2</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td >연마</td>
                                            <td>
                                                <div style="display: flex;flex-wrap: wrap;">
                                                    <c:forEach var="code" items="${HighCode.H_1096}">
                                                        <c:if test="${code.REF_CD eq 'MFN020'}">
                                                        <span class="chk_box" style="margin-left: 8px; margin-right: 0px;">
                                                            <input name="GRIND_CHECK" id="${code.CODE_CD}" type="checkbox" value="${code.CODE_CD}">
                                                            <label for="${code.CODE_CD}"> ${code.CODE_NM_KR}</label>
                                                        </span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>열처리</td>
                                            <td>
                                                <div style="display: flex;flex-wrap: wrap;">
                                                    <c:forEach var="code" items="${HighCode.H_1096}">
                                                        <c:if test="${code.REF_CD eq 'MFN030'}">
                                                        <span class="chk_box" style="margin-left: 8px; margin-right: 0px;">
                                                            <input name="HEAT_CHECK" id="${code.CODE_CD}" type="checkbox" value="${code.CODE_CD}">
                                                            <label for="${code.CODE_CD}"> ${code.CODE_NM_KR}</label>
                                                        </span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>각비</td>
                                            <td>
                                                <div style="display: flex;flex-wrap: wrap;">
                                                    <c:forEach var="code" items="${HighCode.H_1096}">
                                                        <c:if test="${code.REF_CD eq 'MFN010'}">
                                                        <span class="chk_box" style="margin-left: 8px; margin-right: 0px;">
                                                            <input name="ANGLE_CHECK" id="${code.CODE_CD}" type="checkbox" value="${code.CODE_CD}">
                                                            <label for="${code.CODE_CD}"> ${code.CODE_NM_KR}</label>
                                                        </span>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="height: 67%; margin-top: 4.5%;">
                                    <div id="processing_requirements_special_sub_grid"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn greenPopGra wd_130 mr-10" id="processing_drawing_detail">도면상세보기</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>


<div id="drawingPrintDiv" style="display: none">
    <div id="drawingPrintDivHtml">
        <div>
            <span>동일 작업지시번호에 도면번호가 다른 대상이 있습니다. 포함하여 출력할까요?</span>
            <span class="text-blue">대상작업지시번호</span><br>
            <span class="drawingPrintControlHtml"></span>
        </div>
    </div>
</div>


<div id="mct_plan_detail_pop" class="popup_container mct_plan_detail_pop" style="display: none;z-index: 1042;">
    <form class="form-inline" id="mct_plan_detail_pop_form" name="mct_plan_detail_pop_form" role="form" onsubmit="return false;">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectPlanListForDetailPop">
        <input type="hidden" id="EQUIP_SEQ" name="EQUIP_SEQ" value="">
        <input type="hidden" id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" value="">
        <input type="hidden" id="MCT_PLAN_SEQ" name="MCT_PLAN_SEQ" value="">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
        <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
        <!--팝업위치기준-->
        <div class="layerPopup">
            <!--팝업내용-->
                <h3><i class="xi-library-bookmark"></i>장비 가동 현황</h3>
                <div style="display: flex;padding: 10px;height: 92%;">
                    <div style="width: 41%;margin-right: 2%;height: 100%;">
                        <h4>
                            <i class="xi-tags mr-10"></i>가동장비 정보
                        </h4>
                        <table class="popTable mt-10">
                            <colgroup>
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="10%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="th_color">장비번호</td>
                                <td class="th_color">가동상태</td>
                                <td class="th_color">장비종류</td>
                                <td class="th_color">설치위치</td>
                                <td class="th_color">I/F</td>
                            </tr>
                            <tr>
                                <td class="EQUIP_NM val_text"></td>
                                <td class="EQUIP_STATUS val_text"></td>
                                <td class="EQUIP_TYPE_NM val_text"></td>
                                <td class="FACTORY_AREA_NM val_text"></td>
                                <td class="IF_USE_YN val_text"></td>
                            </tr>
                            </tbody>
                        </table>
                        <h4 class="mt-20">
                            <i class="xi-tags mr-10"></i>작업수행 현황
                        </h4>
                        <table id="popHeadMid2" class="popHeadMid popTable mt-10">
                            <colgroup>
                                <col width="17%">
                                <col width="10%">
                                <col width="10%">
                                <col width="33%">
                                <col width="33%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="workStaffImg" rowspan="7">
                                    <div class="staffImgWrap">
                                        <img id="table2_worker_img" src="/resource/main/blank.jpg">
                                    </div>
                                    <p class="WORK_USER_NM mt-10"></p>
                                </td>
                                <td class="th_color" colspan="2">작업번호</td>
                                <td class="text-red CONTROL_NUM val_text machine_current_draw" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="th_color" colspan="2">도면번호</td>
                                <td class="DRAWING_NUM val_text" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="th_color">규격</td>
                                <td class="th_color">형태</td>
                                <td class="SIZE_TXT val_text"></td>
                                <td class="WORK_TYPE_NM val_text"></td>
                            </tr>
                            <tr>
                                <td class="th_color">소재종류</td>
                                <td class="th_color">수량</td>
                                <td class="MATERIAL_DETAIL_NM val_text"></td>
                                <td>
                                    <span class="text-red SAME_SIDE_TXT val_text"></span>
                                    <span class="QTY_FORMAT val_text"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="th_color" colspan="2">작업수량</td>
                                <td colspan="2">
                                    <span class="purple d-inline-block radius" style="width: 10%;">목표</span>
                                    <span class="GOAL_QTY d-inline-block radius val_text" style="width: 20%;"></span>
                                    <span class="blue d-inline-block radius" style="width: 10%;">완료</span>
                                    <span class="FINISH_QTY d-inline-block radius val_text" style="width: 20%;"></span>
                                    <span class="red d-inline-block radius" style="width: 10%;">불량</span>
                                    <span class="ERROR_QTY d-inline-block radius val_text" style="width: 20%;"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="th_color" colspan="2">가공수행시간</td>
                                <td colspan="2">
                                    <span class="green d-inline-block radius" style="width: 12%;">가동</span>
                                    <span class="WORK_ACTIVE_TIME_FORMAT d-inline-block val_text" style="width: 34%;"></span>
                                    <span class="yellow d-inline-block radius" style="width: 12%;">비가동</span>
                                    <span class="WORK_STOP_TIME_FORMAT d-inline-block val_text" style="width: 34%;"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="th_color" colspan="2">남은예상시간</td>
                                <td class="LEFT_TIME_FORMAT val_text" colspan="2"></td>
                            </tr>
                            </tbody>
                        </table>
                        <h4 class="mt-30">
                            <i class="xi-tags mr-10"></i>NC 수행 정보
                        </h4>
                        <table id="popHeadMid" class="popHeadMid popTable mt-20">
                            <colgroup>
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                                <col width="25%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="th_color_green">Program No.</td>
                                <td class="text-blue" colspan="3">
                                    <div class="PROGRAM ml-10 val_text" style="overflow-x: hidden;height: 30px;width: 440px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="th_color_green">Running Time</td>
                                <td class="text-blue CURRENT_STATUS_TIME_FORMAT val_text"></td>
                                <td class="th_color_green">Execution</td>
                                <td class="EXECUTION val_text"></td>
                            </tr>
                            <tr>
                                <td class="th_color_green">1 Cycle Time</td>
                                <td class="LATEST_CYCLE_TIME_FORMAT val_text"></td>
                                <td class="th_color_green">Cycle 완료수</td>
                                <td class="COMPLETE_CYCLE_COUNT val_text"></td>
                            </tr>
                            <tr>
                                <td class="th_color_green">Message</td>
                                <td colspan="3">
                                    <div class="MESSAGE ml-10 val_text" style="overflow-x: hidden;height: 75%;width: 98%;">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 57%;height: 100%;">
                        <h4>
                            <i class="xi-tags mr-10"></i>도면정보
                        </h4>
                        <div class="d-flex" style="margin-top: 11px;height: 63.5%;border: 1px solid gray;">
                            <div class="mapImgWrap" style="width: 83%;">
                                <img id="mct_plan_pop_img" src="/resource/main/blank.jpg" style="margin-right: 1%;">
                            </div>
                            <div style="width: 17%;overflow: hidden;">
                                <table id="popHeadMid4" class="popHeadMid popTable" style="height: 100%;">
                                    <colgroup>
                                        <col width="100%">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td class="th_color">작업번호</td>
                                        </tr>
                                        <tr>
                                            <td id="span_item_detail" class="bg-lightgray CONTROL_NUM val_text" style="text-decoration: underline;cursor:pointer;"></td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">규격/소재</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray SIZE_MATERIAL val_text"></td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">수량/형태</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray">
                                                <span class="text-red SAME_SIDE_TXT val_text"></span>
                                                <span class="QTY_WORK_TYPE val_text"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">가공납기</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray INNER_DUE_DT val_text"></td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">진행상태</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray PART_STATUS_NM val_text"></td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">현재위치</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray CURR_POSITION val_text"></td>
                                        </tr>
                                        <tr>
                                            <td class="th_color">비고</td>
                                        </tr>
                                        <tr>
                                            <td class="bg-lightgray" style="padding: 0;">
                                                <div class="CONTROL_NOTE val_text" style="height: 30px;overflow-x: hidden;line-height: 30px;"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="blue">예상가공시간(수동입력)</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input id="ongoing_work_input" type="text" style="width: 100%;height: 90%;border: none;text-align: center;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <h4 class="mt-30">
                            <i class="xi-tags mr-10"></i>가공계획
                            <span class="barCode ml-20">
                                <input type="text" name="BARCODE_NUM" id="BARCODE_NUM" style="width: 0;height: 0;opacity: 0;">
                                <img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="mct_plan_detail_pop_form_barcode_img">
                            </span>
                            <div class="right_float">
                                <span id="total_cnt_qty" class="mr-10">0 품 0 EA</span>
                                <span id="total_plan_time" class="mr-20">(0h 0m)</span>
                                <button id="planDetailBtn" type="button" class="popMapDetailBtn green" style="margin: 0;">도면상세보기</button>
                            </div>
                        </h4>
                        <div class="planImgDiv">
                        </div>
                    </div>
                </div>
                <button type="button" class="defaultBtn grayPopGra close_mct_plan_detail wd_120" style="position: absolute;left: 44%;">닫기</button>
            <!--팝업내용끝-->
        </div>
    </form>
    <!--팝업위치기준-->
</div>

<div class="popup_container" id="cam_work_detail_popup" style="display: none;">
    <div class="layerPopup" style="width: 1150px;height: 700px;">
        <h3>유사형태 수행기록</h3>
        <div class="right_float" style="margin-right:50px;">
            <span class="chk_box">
                <input type="checkbox" name="ORDER_COMP_CHECK" id="ORDER_COMP_CHECK" checked>
                <label for="ORDER_COMP_CHECK">발주처 매칭 여부</label>
            </span>
        </div>
        <button type="button" class="pop_close mt-10 mr-8 close_cam_work_detail">닫기</button>
        <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
        <div class="qualityWrap">
            <div class="h_area"></div>
            <form class="form-inline" id="cam_work_detail_form" name="cam_work_detail_form" role="form">
                <input type="hidden" id="queryId" name="queryId" value="inspection.selectCamWorkDetail"/>
                <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                <input type="hidden" id="ORDER_COMP_YN" name="ORDER_COMP_YN" value=""/>
                <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>

                <input type="hidden" id="ORDER_COMP_CD" name="ORDER_COMP_CD" value=""/>
                <input type="hidden" id="SIZE_TXT" name="SIZE_TXT" value=""/>
                <input type="hidden" id="DRAWING_NUM" name="DRAWING_NUM" value=""/>
                <input type="hidden" id="MATERIAL_TYPE" name="MATERIAL_TYPE" value=""/>
                <input type="hidden" id="CAD_FILE_SIZE" name="CAD_FILE_SIZE" value=""/>
            </form>
            <div id="cam_work_detail_grid"></div>
        </div>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra close_cam_work_detail">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="inspection_detail_popup" style="display: none;">
    <div class="layerPopup" style="width: 800px;height: 400px;">
        <h3>품질검사이력</h3>
        <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
        <div class="qualityWrap">
            <form class="form-inline" id="inspection_detail_form" name="inspection_detail_form" role="form">
                <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInspectionList"/>
                <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
            </form>
            <div id="inspection_detail_grid"></div>
        </div>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra close_inspection_detail">닫기</button>
        </div>
    </div>
</div>


<!-- 품질실적 layer popup : S -->
<div class="popup_container inspection" id="inspection_manage_pop" style="display: none;">
    <form class="form-inline" id="inspection_manage_pop_form" name="inspection_manage_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionPopInfoBasic">
        <input type="hidden" name="INSPECT_GRADE" id="INSPECT_GRADE" value="GRD010">
        <input type="hidden" name="INSPECT_METHOD" id="INSPECT_METHOD" value="1">
        <input type="hidden" name="ERROR_QTY" id="ERROR_QTY" value="">
        <input type="hidden" name="ORDER_QTY" id="ORDER_QTY" value="">
        <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ" value="">
        <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ" value="">


        <div class="layerPopup">
            <h3>품질 실적 등록</h3>
            <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
					<span class="buttonWrap" id="inspect_method_btn">
						<button type="button" class="onoff left on" id="inspect_method_1">Sampling</button>
						<button type="button" class="onoff right" id="inspect_method_2">전수검사</button>
					</span>
                    <ul class="listWrap">
                        <li class="tit blue">Seq.</li>
                        <li id="Q_SEQ">01</li>
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
                        <span><b>&#9900; 수량 :</b><i id="ORDER_QTY_VIEW" style="padding-left: 0px;width: 100px;" class="center_sort">0</i></span>
                        <span style="width: 270px">
                            <b>&#9900; 불량수량 :</b><i id="ERROR_QTY_VIEW" style="padding-left: 0px;width: 100px;margin-right: 10px;" class="center_sort">0</i>
                            <button type="button" id="inspection_manage_pop_plus_btn" class="btn_plus" style="display: none;margin-right: 10px;">더하기</button>
                            <button type="button" id="inspection_manage_pop_plus_minus" class="btn_minus" style="display: none">빼기</button>
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
                        <span class="list_t" id="inspection_manage_inspection_code_style">검사코드</span>
                        <span>
							<select id="INSPECT_RESULT" name="INSPECT_RESULT" title="검사코드">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
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
                        <tr id="inspection_manage_grade_style">
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
                            <col width="30%">
                            <col width="10%">
                            <col width="20%">
                            <col width="10%">
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
                            <th>가공납기</th>
                            <td id="INNER_DUE_DT_VIEW_T" ></td>
                            <th>발주수량</th>
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
                            <th>진행상태</th>
                            <td id="PART_STATUS_NM_VIEW_T"></td>
                        </tr>
                    </table>
                </div>
                <h4>공유사항</h4>
                <div class="list4">
                    <div id="inspection_manage_grid_pop_01"></div>
                </div>
                <h4>검사/반품이력</h4>
                <div class="list3">
                    <div id="inspection_manage_grid_pop_02"></div>
                </div>
            </div>

            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="inspection_manage_pop_save">저장</button>
                <button type="button" class="defaultBtn grayPopGra" id="popClose">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->

<script type="text/javascript">

    let commonAlertPopup = $("#common_alert_popup");

    let commonFileDownUploadPopup = $("#common_file_download_upload_pop");
    let commonFileDownUploadGridId = "common_file_download_upload_grid";
    let commonFileDownUploadGrid = $("#common_file_download_upload_grid");

    let g_ItemDetailPopGrid04;

    let $processingRequirementsGrid;
    let $processingRequirementsEtcGrid;
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

    function makeTimeStr(time) {
        let hours = 0;
        let minutes = 0;

        if(time > 0) {
            hours = Math.floor(time / 3600);
            minutes = Math.floor((time % 3600)/60);
        }
        return hours + "h " + minutes +"m ";
    }

    $(function() {
        'use strict';

        $("#common_quick_drawing_popup").dialog({
            autoOpen:false, //자동으로 열리지않게
            position:[100,200], //x,y  값을 지정
            //"center", "left", "right", "top", "bottom"
            width : "806",            // dialog 넓이 지정
            height : "670",        // dialog 높이 지정
            modal:false, //모달대화상자
            resizable:false, //크기 조절 못하게
            open: function( event, ui ) {
                $("#common_quick_drawing_popup").show();
            },
            close: function( event, ui ) {
                $("#common_quick_drawing_popup").parents(".ui-dialog").css('z-index','');
                $("#common_quick_drawing_popup").hide();
            }
        });

        $('#common_quick_drawing_form').find('#common_quick_drawing_detail_view').on('click', function (e) {
            e.stopPropagation();
            e.preventDefault();
            callWindowImageViewer($('#common_quick_drawing_form').find('#gFileSeq').val());
        });

        $("#user_info_pop").on('hide.bs.modal', function(){
            fnResetForm("user_info_pop_form");
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

                        fnAlert(null, "삭제되었습니다.");
                        //fnRequestGridData(commonFileDownUploadGrid, postData);
                    }, parameters, '');
                });
            }
        }
    ];

    let orgFileSize = 0;
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
            let fileSize = 0;
            $.each(data,function (idx,Item) {
                fileSize += Item.FILE_SIZE;
            })
            orgFileSize = fileSize;
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
        let callElement = $("#common_file_download_form").find("#callElement").val();
        let data = commonFileDownUploadGrid.pqGrid('option', 'dataModel.data');
        if((callElement == 'ATTACHMENT_BUTTON' || callElement == 'estimateListFileUpload') && data.length == 0) {
            $('#common_file_download_form').find('#GFILE_SEQ').val('');
        }

        $("#common_file_download_form #deleteYn").val(false);
        $("#" + callElement ).trigger('click');

        commonFileDownUploadGrid.pqGrid('destroy');
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
        let uploadFileSize = 0;

        for (const item of e.originalEvent.dataTransfer.items) {
            // kind will be 'file' for file/directory entries.
            if (item.kind === 'file') {
                const entry = item.webkitGetAsEntry();
                if(entry.isDirectory) {   // file인지 dir인지 구분
                    fnAlert(null,"파일 형식을 확인해주세요.");
                    uploadControlFiles = [];
                    return false;
                }
            }
        }
        for(let i = 0; i < cadFiles.length; i++) {
            let file = cadFiles[i];
            uploadControlFiles.push(file); //업로드 목록에 추가
            if(file.size > (50 * 1024 * 1024)) { // 파일당 50mb 사이즈 제한
                fnAlert(null, "파일 첨부는 1개당 최대 50MB까지 가능합니다.");
                uploadControlFiles = [];
                return false;
            }
        }
        if (uploadControlFiles.length > 0) { // file upload
            let formData = new FormData();
            let gridData = commonFileDownUploadGrid.pqGrid('option', 'dataModel.data');
            var processFlag = true;
            $.each(uploadControlFiles, function(i, file) {
                if(file.upload != 'disable') {//삭제하지 않은 이미지만 업로드 항목으로 추가
                    formData.append('file', file, file.name);
                    uploadFileSize += file.size;
                }
                $.each(gridData, function (idx,Item) {
                    if(Item.ORGINAL_FILE_NM == file.name) {
                        fnAlert(null, "이미 등록된 파일입니다.");
                        processFlag = false;
                    }
                })
            });
            if($("#common_file_download_form").find("#callElement").val() == 'REQUEST_OUTSIDE_FILE_UPLOAD' || $("#common_file_download_form").find("#callElement").val() == 'CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD') {
                if(orgFileSize + uploadFileSize > (50 * 1024 * 1024)) { // 파일사이즈가 50mb를 넘을경우
                    fnAlert(null, "파일 첨부는 최대 50MB까지 가능합니다.");
                    processFlag = false;
                }
            }
            if($("#common_file_download_form").find("#callElement").val() == 'MCT_RESULT_MANAGE') {
                processFlag = false;
            }
            formData.append('GFILE_SEQ', GfileSeq);
            var actionUrl = '';
            var queryId = $('#common_cad_file_attach_form').find("#queryId").val() + "_select";
            var type = $('#common_file_download_form').find("#TYPE").val();
            if(type == 'STOCK_UPLOAD') {
                actionUrl = '/uploadInsideStockCadFiles';
                queryId = 'material.manageStockCadFiles_select';
                formData.append('INSIDE_STOCK_SEQ', $("#common_file_download_form").find("#INSIDE_STOCK_SEQ").val());
            }
            formData.append('queryId', queryId);

            uploadControlFiles = [];    // 파일 업로드 정보 초기화
            if(processFlag) {
                fnFormDataFileUploadAjax(function (data) {
                    let fileUploadList = data.fileUploadList;
                    let GFILE_SEQ = fileUploadList[0].GFILE_SEQ;
                    if (fileUploadList.length <= 0) {
                        fnAlert(null, "주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                        return false;
                    }

                    // console.log('fnFormDataFileUploadAjax',fnFormToJsonArrayDatadata);

                    if(type == 'STOCK_UPLOAD' && data.fileUploadDataList.length > 0) {
                        $.each(data.fileUploadDataList, function(idx,Item) {
                            let parameter = {
                                'queryId': 'material.manageStockCadFiles',
                                'INSIDE_STOCK_SEQ': $("#common_file_download_form #INSIDE_STOCK_SEQ").val(),
                                'PDF_GFILE_SEQ' : Item.PDF_GFILE_SEQ,
                                'IMG_GFILE_SEQ' : Item.IMG_GFILE_SEQ,
                                'DXF_GFILE_SEQ' : Item.DXF_GFILE_SEQ
                            };
                            let parameters = {'url': '/json-update', 'data': parameter};
                            fnPostAjaxAsync('', parameters, '');
                        })
                    }
                    let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GFILE_SEQ };
                    fnRequestGridData(commonFileDownUploadGrid, postData);
                    $("#common_file_download_form").find("#GFILE_SEQ").val(GFILE_SEQ);
                    fnAlert(null,"파일 업로드가 완료 되었습니다.");
                }, formData, actionUrl);

            }
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
        {title: '가동', dataType: 'string', dataIndx: 'WORKING_TIME', width: 95,
            render: function (ui) {
                return {style: {'color': 'blue'}};
            }
        },
        {title: '비가동', dataType: 'string', dataIndx: 'STOP_TIME', width: 95,
            render: function (ui) {
                return {style: {'color': 'red'}};
            }
        },
        {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 95},
        {title: '수량', dataType: 'string', dataIndx: 'FINISH_QTY', width: 95},
        {title: '불량', dataType: 'string', dataIndx: 'ERROR_QTY', width: 95}
    ];
    //g_ItemDetailPopGridId01.pqGrid({
    let g_ItemDetailPopObj01 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
            url: "/tv/paramQueryGridSelect",
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
        colModel: g_ItemDetailPopColModel01,
        complete: function() {
            const data = this.option('dataModel.data');
            if(data.length > 0) {
                g_ItemDetailPopGridId01.pqGrid('scrollRow', {rowIndxPage:data[data.length-1].pq_ri});
            }
        }
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
            url: "/tv/paramQueryGridSelect",
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
        colModel: g_ItemDetailPopColModel02,
        complete: function() {
            const data = this.option('dataModel.data');
            if(data.length > 0) {
                g_ItemDetailPopGridId02.pqGrid('scrollRow', {rowIndxPage:data[data.length-1].pq_ri});
            }
        }
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
            url: "/tv/paramQueryGridSelect",
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
            url: "/tv/paramQueryGridSelect",
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
            if(data[0]){
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html(data[0].STATUS_INFO);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("Update : " + data[0].UPDATE_TIME_INFO);
            }else{
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html("");
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("");
            }
        }
    };

    let g_ItemDetailPopGridId05 =  $("#g_item_detail_pop_grid_05");
    let g_ItemDetailPopColModel05 = [
        {title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
        {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 95},
        {title: '불량코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95},
        {title: '작성일시', dataType: 'string', dataIndx: 'Q_DT', minWidth: 90, width: 95}
    ];
    let g_ItemDetailPopObj05 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
            url: "/tv/paramQueryGridSelect",
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
        colModel: g_ItemDetailPopColModel05,
        complete: function() {
            const data = this.option('dataModel.data');
            if(data.length > 0) {
                g_ItemDetailPopGridId05.pqGrid('scrollRow', {rowIndxPage:data[data.length-1].pq_ri});
            }
        }
    };

    let g_ItemDetailPopGridId06 =  $("#g_item_detail_pop_grid_06");
    let g_ItemDetailPopColModel06 = [
        {title: 'ORDER_SEQ', dataType: 'string', dataIndx: 'ORDER_SEQ', hidden:true},
        {title: '주문접수번호', dataType: 'string', dataIndx: 'REGIST_NUM', width: 180},
        {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 65},
        {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 65}
    ];
    let g_ItemDetailPopObj06 = {
        width: "100%", height: 120,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
            url: "/tv/paramQueryGridSelect",
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
        colModel: g_ItemDetailPopColModel06
    };

    let orderDetailGrid;
    let orderDetailRowIndx;
    const g_item_detail_pop_view = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ, grid, rowIndx) {
        orderDetailGrid = grid;
        orderDetailRowIndx = rowIndx;
        const $itemDetailPop = $('#g_item_detail_pop');
        const $itemDetailPopForm = $("#g_item_detail_pop_form");
        (function () {
            let grid;
            let rowDataPrev;
            let rowDataNext;

            if (!(fnIsEmpty(orderDetailGrid) && fnIsEmpty(orderDetailRowIndx))) {
                grid = orderDetailGrid.getInstance().grid;
                rowDataPrev = grid.getRowData({rowIndx: orderDetailRowIndx + -1});
                rowDataNext = grid.getRowData({rowIndx: orderDetailRowIndx + 1});
            }

            rowDataPrev === undefined ? $itemDetailPopForm.find('#left_arrow').css('visibility', 'hidden') : $itemDetailPopForm.find('#left_arrow').css('visibility', 'visible');
            rowDataNext === undefined ? $itemDetailPopForm.find('#right_arrow').css('visibility', 'hidden') : $itemDetailPopForm.find('#right_arrow').css('visibility', 'visible');
        })();



        $itemDetailPopForm.find("#CONTROL_SEQ").val(CONTROL_SEQ);
        $itemDetailPopForm.find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);

        let workZindex = ($("#cam_work_detail_popup").css('display') !== 'none')?Number($("#cam_work_detail_popup").css('z-index')):0;

        if($("#cam_work_detail_popup").css('display') !== 'none') {
            $('#cam_work_detail_popup').css('z-index','1050');
            $('#g_item_detail_pop').css('z-index','1055');
        }else {
            $('#g_item_detail_pop').css('z-index','1050');
        }
        if ($itemDetailPop.css('display') === 'none') {
            $itemDetailPop.modal('show');
        }

        //기본정보
        $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfo');
        let parameters = {
            'url': '/tv/json-info',
            'data': fnFormToJsonArrayData('g_item_detail_pop_form')
        };
        fnPostAjaxAsync(function (data, callFunctionParam) {
            const dataInfo = data.info;
            let dxfFileDownloadYn = '${authUserInfo.DXF_FILE_DOWNLOAD_YN}';
            fnJsonDataToForm('g_item_detail_pop_form', dataInfo);

            $("#ITEM_CAD_DOWNLOAD").addClass('d-none');
            $("#ITEM_CAD_DOWNLOAD").removeAttr('onClick');
            $("#ITEM_DRAWING_VIEW").removeAttr('onClick');
            $("#ITEM_WORK_HISTORY_INFO").removeAttr('onClick');
            $itemDetailPopForm.find(".list1").find(".rowStyle").find("td").html('');
            $itemDetailPopForm.find("[name=view_assembly_or_part]").siblings().removeClass('bg-moccasin');

            if (dataInfo) {
                if (dataInfo.WORK_TYPE === 'WTP020' || dataInfo.WORK_TYPE === 'WTP050') {
                    $itemDetailPopForm.find("#" + dataInfo.WORK_TYPE).addClass('bg-moccasin');
                }
                dataInfo.ASSEMBLY_YN === 'Y' ? $('#view_part_wrap').show() : $('#view_part_wrap').hide();
                fnIsEmpty(dataInfo.PREV_PART_CONTROL_DETAIL_SEQ) ? $itemDetailPopForm.find('#view_part_prev').css('visibility', 'hidden') : $itemDetailPopForm.find('#view_part_prev').css('visibility', 'visible');
                fnIsEmpty(dataInfo.NEXT_PART_CONTROL_DETAIL_SEQ) ? $itemDetailPopForm.find('#view_part_next').css('visibility', 'hidden') : $itemDetailPopForm.find('#view_part_next').css('visibility', 'visible');
                const emergencySpanElement = dataInfo.EMERGENCY_YN === 'Y' ? '<span class="mark">긴급</span>' : '';
                const materialFinishHeatSpanElement = dataInfo.MATERIAL_FINISH_HEAT === '열처리' ? '<span class="mark">열처리</span>' : '';
                const controlStatusHoldSpanElement = dataInfo.CONTROL_STATUS === 'ORD005' ? '<span class="mark" style="background-color: #ff0000; color: #ffffff">보류</span>' : '';

                $("#item_detail_pop_img").attr("src", '/qimage/' + dataInfo.IMG_GFILE_SEQ);
                $itemDetailPopForm.find("#IMG_GFILE_SEQ").html(dataInfo.IMG_GFILE_SEQ);
                $itemDetailPopForm.find("#CONTROL_NUM").html(dataInfo.CONTROL_NUM);
                $itemDetailPopForm.find("#ORDER_QTY_INFO").html(dataInfo.ORDER_QTY_INFO);
                $itemDetailPopForm.find("#SIZE_TXT").html(dataInfo.SIZE_TXT);
                $itemDetailPopForm.find("#WORK_TYPE_NM").html(dataInfo.WORK_TYPE_NM);
                $itemDetailPopForm.find("#ORDER_COMP_NM").html(dataInfo.ORDER_COMP_NM);
                $itemDetailPopForm.find("#INNER_DUE_DT").html(dataInfo.INNER_DUE_DT + emergencySpanElement);

                $itemDetailPopForm.find("#DRAWING_NUM").attr('title', dataInfo.DRAWING_NUM);
                $itemDetailPopForm.find("#DRAWING_NUM").html(dataInfo.DRAWING_NUM);
                let stockText = "";
                if(!fnIsEmpty(dataInfo.OUT_REQUEST_SEQ)) {
                    stockText = dataInfo.INSIDE_STOCK_NUM + " (요:" + dataInfo.REQUEST_QTY + ", 충:" + dataInfo.OUT_QTY + ")";
                }
                $itemDetailPopForm.find("#INSIDE_STOCK").html(stockText);
                $itemDetailPopForm.find("#PART_STATUS_NM").html(dataInfo.PART_STATUS_NM);

                $itemDetailPopForm.find("#ITEM_NM").attr('title', dataInfo.ITEM_NM);
                $itemDetailPopForm.find("#ITEM_NM").html(dataInfo.ITEM_NM);
                $itemDetailPopForm.find("#MATERIAL_DETAIL_NM").html((dataInfo.MATERIAL_DETAIL_NM || '' + materialFinishHeatSpanElement)  + ((dataInfo.MATERIAL_DETAIL_NM == null && materialFinishHeatSpanElement == '')? '':''));
                $itemDetailPopForm.find("#POP_POSITION_NM").html(dataInfo.POP_POSITION_NM);

                $itemDetailPopForm.find("#MODULE_NM").attr('title', dataInfo.MODULE_NM);
                $itemDetailPopForm.find("#MODULE_NM").html(dataInfo.MODULE_NM);
                $itemDetailPopForm.find("#SURFACE_TREAT_NM").html(dataInfo.SURFACE_TREAT_NM);
                $itemDetailPopForm.find("#PROCESS_CONFIRM_DT").html(dataInfo.PROCESS_CONFIRM_DT);

                $itemDetailPopForm.find("#PROJECT_NM").attr('title', dataInfo.PROJECT_NM);
                $itemDetailPopForm.find("#PROJECT_NM").html(dataInfo.PROJECT_NM);

                $itemDetailPopForm.find("#OUTSIDE_CONFIRM_DT").html(dataInfo.OUTSIDE_CONFIRM_DT);
                $itemDetailPopForm.find("#MATERIAL_ORDER_DT").html(dataInfo.MATERIAL_ORDER_DT);

                $itemDetailPopForm.find("#ORDER_STAFF_NM_DESIGNER_NM").html(dataInfo.ORDER_STAFF_NM_DESIGNER_NM);
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
                        $("#ITEM_CAD_DOWNLOAD").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
                        $("#ITEM_CAD_DOWNLOAD").removeClass('d-none');
                    } else {
                        let str = dataInfo.DRAWING_NUM;
                        let arr = str.split(',');

                        if (arr.length === 1) {
                            $("#ITEM_CAD_DOWNLOAD").attr('onClick', 'fnFileDownloadFormPageAction(' + dataInfo.DXF_GFILE_SEQ + ');');
                        } else if (arr.length > 1) {
                            $('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(dataInfo.IMG_GFILE_SEQ);
                            $("#ITEM_CAD_DOWNLOAD").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
                        }

                        $("#ITEM_CAD_DOWNLOAD").removeClass('d-none');
                    }
                }

                if (fnIsEmpty(dataInfo.IMG_GFILE_SEQ)) {
                    $("#ITEM_DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
                } else {
                    if(dataInfo.REGIST_CNT >= 2) {
                        $('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(dataInfo.IMG_GFILE_SEQ);
                        $("#ITEM_DRAWING_VIEW").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
                    }else {
                        $("#ITEM_DRAWING_VIEW").attr('onClick', 'callWindowImageViewer(' + dataInfo.IMG_GFILE_SEQ + ');');
                    }
                }

                if (fnIsEmpty(dataInfo.WORK_HISTORY_INFO)) {
                    $("#ITEM_WORK_HISTORY_INFO").attr('disabled', true);
                    $("#ITEM_WORK_HISTORY_INFO").removeClass('bg-lightyellow');
                    $("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사X)");
                } else {
                    $("#ITEM_WORK_HISTORY_INFO").attr('disabled', false);
                    $("#ITEM_WORK_HISTORY_INFO").addClass('bg-lightyellow');
                    $("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사O)");
                    $("#ITEM_WORK_HISTORY_INFO").attr('onClick', "g_item_detail_pop_cam_pop('" + dataInfo.CONTROL_SEQ + "','" + dataInfo.CONTROL_DETAIL_SEQ + "');");
                }

                /** CAM 작업 여부에 따른 버튼 표시 **/
                // if(dataInfo.CAM_STATUS == "CWS010" || dataInfo.CAM_STATUS == "CWS030"){ <!-- 대기 중일때 처리 -->
                //     $('.work_info_area').show();
                // }else{
                //     $('.work_info_area').hide();
                // }
            }else {
                $("#item_detail_pop_img").attr("src", "/resource/main/blank.jpg");
                $("#ITEM_WORK_HISTORY_INFO").attr('disabled', true);
                $("#ITEM_WORK_HISTORY_INFO").removeClass('bg-lightyellow');
                $("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사X)");
                $("#ITEM_DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
            }
        }, parameters, '');

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

        if ($("#g_item_detail_pop_grid_06").hasClass('pq-grid')) {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid6');
            g_ItemDetailPopGridId06.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
            });
            g_ItemDetailPopGridId06.pqGrid('refreshDataAndView');
        } else {
            $itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid6');
            g_ItemDetailPopObj06.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            g_ItemDetailPopGridId06.pqGrid(g_ItemDetailPopObj06);
        }
        $itemDetailPop.find("#g_item_detail_pop_barcode_num").focus();
    };

    $("#g_item_detail_pop").on('hide.bs.modal', function () {
        fnResetForm("g_item_detail_pop_form");
        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfo');
        if (g_ItemDetailPopGridId01.hasClass('pq-grid')) g_ItemDetailPopGridId01.pqGrid('destroy');
        if (g_ItemDetailPopGridId02.hasClass('pq-grid')) g_ItemDetailPopGridId02.pqGrid('destroy');
        if (g_ItemDetailPopGridId03.hasClass('pq-grid')) g_ItemDetailPopGridId03.pqGrid('destroy');
        if (g_ItemDetailPopGridId04.hasClass('pq-grid')) g_ItemDetailPopGridId04.pqGrid('destroy');
        if (g_ItemDetailPopGridId05.hasClass('pq-grid')) g_ItemDetailPopGridId05.pqGrid('destroy');
        if (g_ItemDetailPopGridId06.hasClass('pq-grid')) g_ItemDetailPopGridId06.pqGrid('destroy');
    });

    $("#item_detail_pop_img").on('dblclick', function() {
        let imgSeq = $("#g_item_detail_pop_form").find("#IMG_GFILE_SEQ").val();
        if(imgSeq != null && imgSeq != "" && imgSeq !== undefined) {
            callWindowImageViewer(imgSeq);
        }
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
    $("#search_inspection_detail").on('click',function() {
        const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
        let controlDetailSeq = $('#g_item_detail_pop_form > #CONTROL_DETAIL_SEQ').val();
        g_item_detail_pop_inspection_pop(controlSeq, controlDetailSeq)
    });



    $("#g_item_detail_pop").find('#g_item_detail_pop_grid_05_pop_close, #popClose2').on('click', function () {
        $('#g_item_detail_pop').modal('hide');
    });

    $("#g_item_detail_pop_barcode_span").on('click', function (e) {
        $("#g_item_detail_pop_barcode_num").focus();
    });

    $("#item_detail_pop_input").on({
        keyup: function (e) {
            if (e.keyCode == 13) {
                let controlNum = this.value;
                let data = {'queryId': "inspection.selectCommItemDetailInfo", 'CONTROL_NUM': controlNum};
                let parameters = {'url': '/tv/json-info', 'data': data};

                fnPostAjax(function (data) {
                    let dataInfo = data.info;
                    if (dataInfo == null) {
                        fnAlert(null, "작업번호 정보가 존재하지 않습니다.");
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
        }
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
                        let parameters = {'url': '/tv/json-info', 'data': data};
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
        $('#ORDER_COMP_CHECK').prop("checked", true);
        $('#cam_work_detail_form').find('#queryId').val('inspection.selectCommItemDetailGridCamPopBefore');
        $('#cam_work_detail_form').find('#CONTROL_SEQ').val(CONTROL_SEQ);
        $('#cam_work_detail_form').find('#CONTROL_DETAIL_SEQ').val(CONTROL_DETAIL_SEQ);


        let parameters = {
            'url': '/tv/json-info',
            'data': fnFormToJsonArrayData('cam_work_detail_form')
        };

        fnPostAjaxAsync(function (data) {
            let dataInfo = data.info;
            if (fnIsEmpty(dataInfo)) {
                fnResetForm('cam_work_detail_form');
            } else {
                fnJsonDataToForm('cam_work_detail_form', dataInfo);
            }

            if($("#g_item_detail_pop").css('display') !== 'none') {
                $('#g_item_detail_pop').css('z-index','1050');
                $('#cam_work_detail_popup').css('z-index','1055');
            }else {
                $('#cam_work_detail_popup').css('z-index','1050');
            }
            if($("#cam_work_detail_popup").css('display') === 'none') {
                $("#cam_work_detail_popup").modal('show');
            }
        }, parameters, '');
    }
    /** cam popup */
    const g_item_detail_pop_inspection_pop = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ) {

        $('#inspection_detail_form').find('#CONTROL_SEQ').val(CONTROL_SEQ);
        $('#inspection_detail_form').find('#CONTROL_DETAIL_SEQ').val(CONTROL_DETAIL_SEQ);
        $('#inspection_detail_popup').modal('show');
    }

    /**  공통 제품상세 정보  끝 **/

    /** 공통 창고 팝업 Start **/
    let commonWarehouseSelectedRowIndex;
    // let warehouseList = fnGetCommCodeGridSelectBox('1049');
    let warehouseList = "${HighCode.H_1049}";
    let commonWarehouseManageGrid = $("#common_warehouse_manage_grid");
    let commonWarehouseManageModel= [
        {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', minWidth: 80 ,editable: false},
        {title: '위치명', dataType: 'string', dataIndx: 'LOC_NM', minWidth: 90, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
        {title: '위치 설명', dataType: 'string', dataIndx: 'LOC_DESC', minWidth: 120, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
        {title: '용도', dataType: 'string', dataIndx: 'LOC_USE', minWidth: 150, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}} ,
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
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: commonWarehouseManageFilterRender},
        filterModel: { mode: 'OR' },
        scrollModel: {autoFit: false},
        numberCell: {width: 30, title: "No", show: true },
        // selectionModel: { type: 'row', mode: 'multiple'} ,
        swipeModel: {on: false},
        collapsible: false,
        strNoRows: g_noData,
        resizable: false,
        trackModel: {on: true},
        colModel: commonWarehouseManageModel,
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
            $("#locationPopFilterColumn").empty();
            $("#locationPopFilterColumn").html(filterOpts);
            $("#stockManageFrozen").empty();
            $("#stockManageFrozen").html(frozenOts);
        },
        selectChange: function (event, ui) {
            commonWarehouseSelectedRowIndex = [];
            for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                let firstRow = ui.selection._areas[i].r1;
                let lastRow = ui.selection._areas[i].r2;

                for (let i = firstRow; i <= lastRow; i++) commonWarehouseSelectedRowIndex.push(i);
            }
        },
        complete: function(event, ui) {
            this.flex();
            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');

            $('#common_warehouse_manage_grid_records').html(data.length);
        },
        change: function (evt, ui) {
            if (ui.source === 'paste') {
                let rowListConvert = [];

                for (let i = 0, addListLength = ui.addList.length; i < addListLength; i++) {
                    const newRowData = ui.addList[i].newRow;
                    let wareHouseCd = null;

                    // 단가확인
                    if (newRowData.WAREHOUSE_NM !== undefined) {
                        let index = warehouseList.findIndex(function (element) {
                            return element.text === newRowData.WAREHOUSE_NM;
                        });
                        if (index >= 0) wareHouseCd = warehouseList[index].value;
                    }

                    ui.addList[i].newRow.WAREHOUSE_NM = wareHouseCd;
                }

                for (let i = 0, updateLength = ui.updateList.length; i < updateLength; i++) {
                    const newRowData = ui.updateList[i].newRow;
                    const rowIndx = ui.updateList[i].rowIndx;
                    let tempNewRow = {};
                    let wareHouseCd = null;

                    // 단가확인
                    if (newRowData.WAREHOUSE_NM !== undefined) {
                        let index = warehouseList.findIndex(function (element) {
                            return element.text === newRowData.WAREHOUSE_NM;
                        });
                        if (index >= 0) {
                            wareHouseCd = warehouseList[index].value;
                            tempNewRow.WAREHOUSE_NM = wareHouseCd;
                        }
                    }

                    let tempObject = {
                        rowIndx: rowIndx,
                        newRow: tempNewRow
                    };
                    rowListConvert.push(tempObject);
                }

                commonWarehouseManageGrid.pqGrid('updateRow', {rowList: rowListConvert});
            }
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
                    if (dt == 'integer' || dt == 'float') {
                        row[j] = row[j].replace(/[^(\d|\.)]/g, '');
                    }
                }
            }
        }
    }

    function commonWarehouseManageFilterRender(ui) {
        let val = ui.cellData === undefined ? '' : ui.cellData,
            options = ui.column.editor === undefined ? '' : ui.column.editor.options;
        let index = -1;
        if (options) {
            index = options.findIndex(function (element) {
                return element.value === val;
            });
            if (index > -1) val = options[index].text;
        }
        if (val) {
            if (ui.column.dataType === 'integer') {
                val = numberWithCommas(val);
            } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                let o = new Date(val);
                val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
            }

            let condition = $('#locationPopFilterCondition :selected').val(),
                valUpper = val.toString().toUpperCase(),
                txt = $('#locationPopFilterKeyword').val(),
                txtUpper = (txt == null) ? '' : txt.toString().toUpperCase(),
                indx = -1;

            if (condition === 'end') {
                indx = valUpper.lastIndexOf(txtUpper);
                if (indx + txtUpper.length !== valUpper.length) {
                    indx = -1;
                }
            } else if (condition === 'contain') {
                indx = valUpper.indexOf(txtUpper);
            } else if (condition === 'begin') {
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
                // return val;
            } else {
                return val;
            }
        } else {
            return val;
        }
    }

    function fnCommonWarehouse() {
        $('#common_warehouse_manage_popup').modal('show');
        if (!commonWarehouseManageGrid.hasClass('pq-grid')) {
            $("#common_warehouse_manage_popup_form").find("#queryId").val('material.selectCommonWarehouseManageList');
            commonWarehouseManageObj.dataModel.postData = fnFormToJsonArrayData('common_warehouse_manage_popup_form');
            commonWarehouseManageGrid.pqGrid(commonWarehouseManageObj);
        } else {
            commonWarehouseManageGrid.pqGrid('refreshDataAndView');
        }
    }

    $('#common_warehouse_manage_popup_form').on('submit', function() {
        event.preventDefault();
    })

    $('#locationPopFilterKeyword').on({
        'keyup': function () {
            fnFilterHandler(commonWarehouseManageGrid, 'locationPopFilterKeyword', 'locationPopFilterCondition', 'locationPopFilterColumn');

            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');
            $('#common_warehouse_manage_grid_records').html(data.length);
        },
        'search': function () {
            fnFilterHandler(commonWarehouseManageGrid, 'locationPopFilterKeyword', 'locationPopFilterCondition', 'locationPopFilterColumn');

            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');
            $('#common_warehouse_manage_grid_records').html(data.length);
        }
    });

    $('#locationPopFilterCondition').on('change', function () {
            fnFilterHandler(commonWarehouseManageGrid, 'locationPopFilterKeyword', 'locationPopFilterCondition', 'locationPopFilterColumn');

            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');
            $('#common_warehouse_manage_grid_records').html(data.length);
    });

    $('#locationPopFilterColumn').on('change', function () {
            fnFilterHandler(commonWarehouseManageGrid, 'locationPopFilterKeyword', 'locationPopFilterCondition', 'locationPopFilterColumn');

            let data = commonWarehouseManageGrid.pqGrid('option', 'dataModel.data');
            $('#common_warehouse_manage_grid_records').html(data.length);
    });

    $("#common_warehouse_manage_popup_form #WAREHOUSE_CD").on('change', function(){
        commonWarehouseManageGrid.pqGrid('option', "dataModel.postData", function (ui) {
            return (fnFormToJsonArrayData('#common_warehouse_manage_popup_form'));
        });
        commonWarehouseManageGrid.pqGrid('refreshDataAndView');
    });
    $("#btnLocationLabelPrint").on('click', function () {
        var locList = [];
        if(typeof commonWarehouseSelectedRowIndex != 'undefined' && commonWarehouseSelectedRowIndex.length > 0) {
            for (let i = 0, selectedRowCount = commonWarehouseSelectedRowIndex.length; i < selectedRowCount; i++) {
                console.log(commonWarehouseManageGrid.pqGrid('getRowData', {rowIndx: commonWarehouseSelectedRowIndex[i]}).LOC_SEQ)
                var locSeq = commonWarehouseManageGrid.pqGrid('getRowData', {rowIndx: commonWarehouseSelectedRowIndex[i]}).LOC_SEQ;
                if(typeof locSeq != 'undefined') {
                    locList.push("W"+locSeq);
                }
            }
        }
        if (locList.length) {
            let message =
                '<h4>\n' +
                '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                '    <span>선택하신 ' + locList.length + '건을 처리합니다. \n진행하시겠습니까?</span>\n' +
                '</h4>';
            fnConfirm(null, message, function () {
                fnBarcodePrint(function (data) {
                    fnAlert(null, data.message);
                }, locList, '');
            });
        } else {
            fnAlert(null, '출력할 바코드가 존재 하지 않습니다.');
        }
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
        if(typeof commonWarehouseSelectedRowIndex != 'undefined' && commonWarehouseSelectedRowIndex.length > 0) {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'material.deleteCommonWarehouseManage'

                fnDeletePQGrid(commonWarehouseManageGrid, commonWarehouseSelectedRowIndex, deleteQuery);
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
            let mainImgSeq = $('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val();
            // $('#floor_plan_img').attr('src','/resource/asset/images/common/'+mainImgSeq+ '.png');
            $('#floor_plan_img').attr('src','/qimage/'+mainImgSeq);
            $('#floor_plan_img').attr('alt',mainImgSeq);
            const gridId = 'common_multi_download_pop_grid';
            const postData = fnFormToJsonArrayData('common_multi_download_pop_form');
            const colModel = [
                {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
                {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
                {title: '작업지시번호', width: 180, dataIndx: 'CONTROL_PART_INFO'},
                {title: '접수번호', width: 140, dataIndx: 'REGIST_NUM'},
                {title: '발주번호', width: 100, dataIndx: 'ORDER_NUM'},
                {title: '작업형태', dataIndx: 'WORK_TYPE_NM', width: 60, maxWidth:60},
                {title: '도면번호', width: 150, dataIndx: 'DRAWING_NUM'},
                {
                    title: 'CAD파일', align: 'center', dataIndx: 'DXF_GFILE_SEQ', width: 90, minWidth: 90, editable: false,
                    render: function (ui) {
                        cellData = ui.cellData;
                        if (cellData) {
                            return "<a href='/downloadGfile/" + cellData + "' download><input type='button' class='smallBtn blue' value='다운로드'/></a>";
                        }
                    },
                },
                {
                    title: '상세보기', align: 'center', dataIndx: 'IMG_GFILE_SEQ', width: 25, minWidth: 25, editable: false,
                    render: function (ui) {
                        if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                    },
                    postRender: function (ui) {
                        let grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find("#imageView").bind("click", function () {
                            let rowData = ui.rowData;
                            callWindowImageViewerDupl(rowData.IMG_GFILE_SEQ);
                        });
                    }
                }
            ];
            const obj = {
                height: 160,
                collapsible: false,
                selectionModel: { type: 'row', mode: 'single'} ,
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
                rowSelect: function (evt, ui) {
                    $.each(ui.addList, function (idx,Item) {
                        if(idx === 0) {
                            // let imgUrl = '/resource/asset/images/common/'+Item.rowData.IMG_GFILE_SEQ + '.png';
                            let imgUrl = '/qimage/'+Item.rowData.IMG_GFILE_SEQ;
                            $("#floor_plan_img").attr('src',imgUrl);
                            $("#floor_plan_img").attr('alt',Item.rowData.IMG_GFILE_SEQ);
                        }
                    })
                },
                cellKeyDown: function (event, ui) {
                    const rowIndx = ui.rowIndx;
                    const sr = this.SelectRow();
                    const selRowData = this.getRowData({rowIndx: rowIndx});
                    let nextRowData = "";
                    if (event.keyCode == $.ui.keyCode.DOWN) {
                        sr.removeAll();
                        sr.add({rowIndx: rowIndx + 1});
                        nextRowData = this.getRowData({rowIndx: rowIndx +1});
                    } else if (event.keyCode == $.ui.keyCode.UP) {
                        sr.removeAll();
                        sr.add({rowIndx: rowIndx - 1});
                        nextRowData = this.getRowData({rowIndx: rowIndx -1});
                    }
                    let imgUrl = '/qimage/';
                    imgUrl += (typeof nextRowData != 'undefined' && nextRowData != "")?nextRowData.IMG_GFILE_SEQ:selRowData.IMG_GFILE_SEQ;
                    $("#floor_plan_img").attr('src',imgUrl);
                    $("#floor_plan_img").attr('alt',selRowData.IMG_GFILE_SEQ);
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

    const processingRequirementsPop = function (actionType, refreshGridId) {
        $('#processing_requirements_form').find('#TYPE').val(actionType);
        $('#processing_requirements_form').find('#refreshGridId').val(refreshGridId);

        $('#processingRequirementsModal').modal('show');
    };

    $('#processingRequirementsModal').on({
        'show.bs.modal': function () {
            let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();

            if ($processingRequirementsType === 'ESTIMATE') {
                processingRequirementsTargetGrid = estimateRegisterTopGrid;
                processingRequirementsTargetRowIndex = Number(estimateRegisterSelectedRowIndex);
            } else if ($processingRequirementsType === 'CONTROL') {
                processingRequirementsTargetGrid = $controlManagementGrid;
                processingRequirementsTargetRowIndex = Number(selectedControlManagementRowIndex[0]);
            }

            const processingRequirementsSpecialSubGrid = 'processing_requirements_special_sub_grid';
            const processingRequirementsSpecialSubColModel = [
                {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
                {title: 'ETC_FACTOR_CD', dataIndx: 'ETC_FACTOR_CD', hidden: true},
                {title: 'COLUMN_TYPE', dataIndx: 'COLUMN_TYPE', hidden: true},
                {title: 'EDIT_YN', dataIndx: 'EDIT_YN', hidden: true},
                {title: 'T', dataIndx: 'T', hidden: true},
                {title: 'CALC_METHOD_1_EDIT_YN', dataIndx: 'CALC_METHOD_1_EDIT_YN', hidden: true},
                {title: 'CALC_METHOD_2_EDIT_YN', dataIndx: 'CALC_METHOD_2_EDIT_YN', hidden: true},
                {title: 'CALC_UNIT_AMT_EDIT_YN', dataIndx: 'CALC_UNIT_AMT_EDIT_YN', hidden: true},
                {title: 'CALC_UNIT_AMT_EDIT_YN', dataIndx: 'CALC_UNIT_AMT_EDIT_YN', hidden: true},
                {title: 'CALC_AMT_EDIT_YN', dataIndx: 'CALC_AMT_EDIT_YN', hidden: true},
                {title: 'NAME', dataIndx: 'NAME',
                    render: function (ui) {
                        if(ui.cellData == 'Sub Total') {
                            return {cls : 'darkBrown', style: 'font-weight:bold;'};
                        }
                        if(ui.rowData.T == 1) {
                            return {style: 'background-color:#ffd966;font-weight:bold;font-size:12px;'};
                        }else if(ui.rowData.T == 2) {
                            return {cls : 'bg-lightgray', style: 'font-weight:bold;'};
                        }else {
                            return {style : 'background:#fff2cc;font-weight:bold;'};
                        }
                    }
                },
                {title: 'VALUE', dataIndx: 'VALUE', editable: function (ui) {
                        let rowData = ui.rowData;
                        if(rowData.T == 2) {
                            return false;
                        }else {
                            return true;
                        }
                    },
                    render: function (ui) {
                        let rowData = ui.rowData;
                        let cls = "";
                        let style = "";
                        if(rowData.T == 2) {
                            cls = 'bg-lightgray';
                        }
                        if(rowData.EDIT_YN == 'Y') {
                            style = "color:blue;";
                        }
                        if(rowData.T == 3) {
                            let text = ui.cellData + " " + rowData.CALC_UNIT_NM;
                            return {cls :cls, style:style, text: text};
                        }else if(rowData.T == 5 || rowData.NAME == 'Sub Total') {
                            let text = numberWithCommas(ui.cellData);
                            return {cls :cls, style:style, text: text};
                        }
                        return {cls :cls, style:style};
                    }
                }
            ]
            const processingRequirementsSpecialSubObj = {
                height: 348,
                collapsible: false,
                showTitle: false,
                strNoRows: g_noData,
                rowHtHead: 0,
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
                colModel: processingRequirementsSpecialSubColModel,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                    postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                summaryTitle: {sum: '{0}'},
                load: function () {
                    const data = this.option('dataModel.data');
                    const summary = function (data) {
                        let costTotal = 0;
                        $.each(data, function(idx,Item) {
                            if(Item.T == 5) {
                                costTotal += Number(Item.VALUE);
                            }
                        });
                        if(costTotal == 0) {
                            costTotal = "";
                        }
                        let array = [
                            {NAME: 'Sub Total', VALUE: costTotal}
                        ];
                        return array;
                    };
                    const merge = function (grid, refresh, data) {
                        let mc = [],
                            rc = 1,
                            j = data.length;

                        while (j--) {
                            let cd = data[j]['T']
                            if(cd == 1) {
                                mc.push({r1: j, c1: 10, rc: 1, cc: 2});
                            }
                        }

                        grid.option('mergeCells', mc);
                        if (refresh) {
                            grid.refreshView();
                        }
                    };

                    this.option('summaryData', summary(data));
                    merge(this, true, data);
                },
                complete : function () {
                    let headerT = $("#processing_requirements_special_sub_grid .pq-header-outer").height();
                    let bodyT = $("#processing_requirements_special_sub_grid .pq-body-outer").height();
                    let afterT = bodyT + headerT - 2;
                    $("#processing_requirements_special_sub_grid .pq-body-outer").height( afterT + "px");
                },
                editorKeyDown: function (evt, ui) {
                    if (evt.keyCode === 9 || evt.keyCode === 13) {
                        evt.originalEvent.keyCode = 40; //disguise down key.
                    }
                },
                cellSave: function () {
                    processingRequirementsEtcSave();
                },
                editorBegin: function (evt, ui) {
                    if($("#processing_requirements_special_sub_grid .pq-header-outer").css('display') !== 'none') {
                        let headerT = $("#processing_requirements_special_sub_grid .pq-header-outer").height();
                        let bodyT = $("#processing_requirements_special_sub_grid .pq-body-outer").height();
                        let afterT = bodyT + headerT - 2;
                        $("#processing_requirements_special_sub_grid .pq-body-outer").height( afterT + "px");
                    }
                }
            }


            const processingRequirementsGridId = 'processing_requirements_grid';
            const processingRequirementsColModel = [
                {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
                {title: 'CALC_SEQ', dataType: 'integer', dataIndx: 'CALC_SEQ', hidden: true},
                {title: 'GROUP_CD', dataIndx: 'GROUP_CD', hidden: true},
                {title: 'FACTOR_CD', dataIndx: 'FACTOR_CD', hidden: true},
                {title: '항목1', dataIndx: 'LEVEL_1', style: {'background': '#fff2cc', 'font-weight': 'bold'},
                    render: function (ui) {
                        if(ui.cellData == 'Sub Total') {
                            return {cls : 'darkBrown'};
                        }
                    }
                },
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
                }
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
                    styleHead: {'background':'#5e3d11', 'color':'white'}
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
                            {LEVEL_1: 'Sub Total', PROCESS_CNT: processCntTotal, UNIT_AMT: costTotal}
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
            $processingRequirementsEtcGrid = $('#' + processingRequirementsSpecialSubGrid).pqGrid(processingRequirementsSpecialSubObj);
            changeData();
        },
        'hide.bs.modal': function () {
            $processingRequirementsGrid.pqGrid('destroy');
            $processingRequirementsEtcGrid.pqGrid('destroy');
            let refreshId = $("#processing_requirements_form").find("#refreshGridId").val();
            if($("#"+refreshId).hasClass('pq-grid')) {
                $("#"+refreshId).pqGrid('refreshDataAndView');
            }
            $("input[name=GRIND_CHECK]").prop("checked",false);
            $("input[name=HEAT_CHECK]").prop("checked",false);
            $("input[name=ANGLE_CHECK]").prop("checked",false);
        }
    });

    $("#save_special_process").on("click", function () {
        const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
        let factorCdStr = "";
        let factorCdArr = [];
        $("input[name=GRIND_CHECK]:checked").each(function() {
            var val = $(this).val();
            factorCdStr += "'" + val + "',";
            factorCdArr.push(val);
        });
        $("input[name=HEAT_CHECK]:checked").each(function() {
            var val = $(this).val();
            factorCdStr += "'" + val + "',";
            factorCdArr.push(val);
        });
        $("input[name=ANGLE_CHECK]:checked").each(function() {
            var val = $(this).val();
            factorCdStr += "'" + val + "',";
            factorCdArr.push(val);
        });
        factorCdArr = [...new Set(factorCdArr)];

        if(factorCdStr != "") {
            factorCdStr = factorCdStr.substring(0,factorCdStr.length - 1);
        }

        let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let $basicInformation = $('.basic_information');
        let parameter1 = {'url': '/json-list',
            'data': {
                'queryId': '',
                'SEQ1': $basicInformation.find('#seq1').html(),
                'SEQ2': $basicInformation.find('#seq2').html()
            }
        };

        if ($processingRequirementsType === 'ESTIMATE') {
            parameter1.data.queryId = 'estimate.selectEstimateEtcProcess_chkBox';
        }else if ($processingRequirementsType === 'CONTROL') {
            parameter1.data.queryId = 'orderMapper.selectControlPartEtcProcess_chkBox';
        }

        fnPostAjax(function (data) {
            let parameter2 = {
                'queryId': '',
                'ETC_FACTOR_CD': "",
                'SEQ1': $basicInformation.find('#seq1').html(),
                'SEQ2': $basicInformation.find('#seq2').html()
            };
            let delFactorStr = "";
            let insertFactorStr = "";
            if(data.list.length > 0) {
                $.each(data.list, function(idx,Item) {
                    if(factorCdArr.indexOf(Item.ETC_FACTOR_CD) < 0) {
                        delFactorStr += "'" + Item.ETC_FACTOR_CD + "',";
                    }else {
                        factorCdArr.splice(factorCdArr.indexOf(Item.ETC_FACTOR_CD),1);
                    }
                })
            }
            if(factorCdArr.length > 0) {
                if ($processingRequirementsType === 'ESTIMATE') {
                    parameter2.queryId = 'estimate.insertEstiateEtcProcess,estimate.updateEstimateEtcAutomaticQuote,estimate.updateEstimateDetailEtcAutomaticQuote';
                }else if ($processingRequirementsType === 'CONTROL') {
                    parameter2.queryId = 'orderMapper.insertControlPartEtcProcess,orderMapper.updateControlPartEtcProcessAutomaticQuote,orderMapper.updateControlPartEtcAutomaticQuote';
                }
                $.each(factorCdArr,function (idx,Item) {
                    insertFactorStr += "'" + Item + "',";
                })
                insertFactorStr = insertFactorStr.substring(0,insertFactorStr.length - 1);
                parameter2.ETC_FACTOR_CD = insertFactorStr;
            }
            if(delFactorStr != "") {
                delFactorStr = delFactorStr.substring(0,delFactorStr.length - 1);
                if ($processingRequirementsType === 'ESTIMATE') {
                    parameter2.queryId = 'estimate.deleteEstimateEtcProcess,' + parameter2.queryId;
                    if(factorCdArr.length <= 0) {
                        parameter2.queryId += 'estimate.updateEstimateDetailEtcAutomaticQuote';
                    }
                }else if ($processingRequirementsType === 'CONTROL') {
                    parameter2.queryId = 'orderMapper.deleteControlPartEtcProcess,' + parameter2.queryId;
                    if(factorCdArr.length <= 0) {
                        parameter2.queryId += 'orderMapper.updateControlPartEtcAutomaticQuote';
                    }
                }
                parameter2.DEL_ETC_FACTOR_CD = delFactorStr;
            }
            if(parameter2.queryId != "") {
                let parameters = {'url': '/json-manager', 'data': parameter2};
                fnPostAjax(function (data) {
                    changeData();
                }, parameters, '');
            }
        }, parameter1, '');

    });

    const settingProcessingEtcDiv = function (rowData) {
        let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let queryId = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            queryId = 'estimate.selectEstimateEtcProcess_chkBox';
        } else if ($processingRequirementsType === 'CONTROL') {
            queryId = 'orderMapper.selectControlPartEtcProcess_chkBox';
        }
        let parameter = {'url': '/json-list', 'data': {
                'queryId': queryId,
                'SEQ1': rowData.SEQ1,
                'SEQ2': rowData.SEQ2
            }
        };

        fnPostAjax(function (data) {
            $.each(data.list, function (idx,Item) {
                $("#"+Item.ETC_FACTOR_CD).prop('checked', true);
            });
        }, parameter, '');


    }
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
        postData.SEQ1 = rowData.SEQ1;
        postData.SEQ2 = rowData.SEQ2;
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
        postData.SEQ1 = rowData.SEQ1;
        postData.SEQ2 = rowData.SEQ2;

        $processingRequirementsGrid.pqGrid('option', 'dataModel.postData', function () {
            return postData;
        });
        $processingRequirementsGrid.pqGrid('refreshDataAndView');
    };

    const changeProcessingRequirementsEtcInformation = function (rowData) {
        const $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
        let queryId = '';

        if ($processingRequirementsType === 'ESTIMATE') {
            queryId = 'estimate.selectEstimateEtcProcess';
        } else if ($processingRequirementsType === 'CONTROL') {
            queryId = 'orderMapper.selectControlPartEtcProcess';
        }
        const postData = $.extend({queryId: queryId}, rowData);
        postData.TYPE = $processingRequirementsType;
        postData.SEQ1 = rowData.SEQ1;
        postData.SEQ2 = rowData.SEQ2;

        $processingRequirementsEtcGrid.pqGrid('option', 'dataModel.postData', function () {
            return postData;
        });
        $processingRequirementsEtcGrid.pqGrid('refreshDataAndView');
    }

    const createTopTable = function (data) {
        let seq1 = '';
        let seq2 = '';
        let controlNum = '';
        let registNum = '';
        let drawingNum = '';
        let materialTypeNm = '';
        let material_work = '';
        let sizeTxt = '';
        let surface = ''
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
            registNum = info.REGIST_NUM || '';
            drawingNum = info.DRAWING_NUM || '';
            materialTypeNm = info.MATERIAL_TYPE_NM || '';
            sizeTxt = info.SIZE_TXT || '';
            material_work = info.MATERIAL_WORK || '';
            level = info.SIZE_LEVEL || '';
            unitBasicAmt = info.UNIT_BASIC_AMT || '';
            totalProcessingCost = info.TOTAL_PROCESSING_COST || '';
            surface = info.SURFACE_TREAT_NM || '';
            img = info.IMG_GFILE_SEQ ? '<span class="fileSearchIcon" id="imageView" data-value="' + info.IMG_GFILE_SEQ + '" style="margin-left: 10px; vertical-align: middle; cursor: pointer"></span>' : '';
            if(!fnIsEmpty(info.IMG_GFILE_SEQ)) {
                $("#processing_pop_img").attr("src", '/qimage/' + info.IMG_GFILE_SEQ);
            }
        }

        htmlString += '<tr style="display: none;">';
        htmlString += '    <td id="seq1">' + seq1 + '</td>';
        htmlString += '    <td id="seq2">' + seq2 + '</td>';
        htmlString += '    <td id="seq3">' + '' + '</td>';
        htmlString += '    <td id="seq4">' + '' + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">작업번호</td>';
        htmlString += '    <td>' + controlNum + '</td>';
        htmlString += '    <td scope="row">도면번호</td>';
        htmlString += '    <td>' + drawingNum + img + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">접수번호</td>';
        htmlString += '    <td>' + registNum + '</td>';
        htmlString += '    <td scope="row">소재/작업형태</td>';
        htmlString += '    <td>' + material_work + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">규격</td>';
        htmlString += '    <td>' + sizeTxt + '</td>';
        htmlString += '    <td scope="row">표면처리</td>';
        htmlString += '    <td>' + surface + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row">규격 Level</td>';
        htmlString += '    <td>' + level + '</td>';
        htmlString += '    <td scope="row">기본가공비</td>';
        htmlString += '    <td>' + unitBasicAmt + '</td>';
        htmlString += '</tr>';
        htmlString += '<tr>';
        htmlString += '    <td scope="row" colspan="2" style="background-color: #5e3d11;color: white;font-weight: 500;">가공비 Total</td>';
        htmlString += '    <td colspan="2">' + totalProcessingCost + '</td>'; //FIXME:
        htmlString += '</tr>';

        $('.basic_information > tbody').html(htmlString);
    };

    const visibilityButton = function () {
        let gridInstance;
        let rowDataPrev;
        let rowDataNext;

        if (!(fnIsEmpty(processingRequirementsTargetGrid) && fnIsEmpty(processingRequirementsTargetRowIndex))) {
            gridInstance = processingRequirementsTargetGrid.pqGrid('getInstance').grid;

            if ($('#processing_requirements_form').find('#TYPE').val() === 'CONTROL' || $('#processing_requirements_form').find('#TYPE').val() === 'ORDER') {
                //TODO: 첫 번째 행 또는 마지막 행이 복수 주문일 경우 버튼 안 보이게
                rowDataPrev = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + -1});
                rowDataNext = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + 1});
            } else {
                rowDataPrev = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + -1});
                rowDataNext = gridInstance.getRowData({rowIndx: processingRequirementsTargetRowIndex + 1});
            }
        }

        rowDataPrev === undefined ? $('#prev').css('visibility', 'hidden') : $('#prev').css('visibility', 'visible');
        rowDataNext === undefined ? $('#next').css('visibility', 'hidden') : $('#next').css('visibility', 'visible');
    };

    const changeImageView = function (rowData) {
        const imgGfileSeq = rowData.ORDER_IMG_GFILE_SEQ || rowData.IMG_GFILE_SEQ || '';

        if (!(windowImageViewer === undefined || windowImageViewer.closed) && imgGfileSeq) {
            callWindowImageViewer(imgGfileSeq);
        }
    };

    //TODO: 함수명 변경
    const changeData = function () {
        $("input[name=GRIND_CHECK]").prop("checked",false);
        $("input[name=HEAT_CHECK]").prop("checked",false);
        $("input[name=ANGLE_CHECK]").prop("checked",false);
        $("#processing_pop_img").attr("src", '/resource/main/blank.jpg');

        const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
        $('#processing_requirements_form').find('#WORK_TYPE').val(rowData.WORK_TYPE);

        if(rowData.WORK_TYPE == 'WTP020') {
            $("#save_special_process").prop('disabled',true);
        }else {
            $("#save_special_process").prop('disabled',false);
        }

        const $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();

        if ($processingRequirementsType === 'ESTIMATE') {
            rowData.SEQ1 = rowData.EST_SEQ;
            rowData.SEQ2 = rowData.SEQ;
        } else if ($processingRequirementsType === 'CONTROL') {
            rowData.SEQ1 = rowData.CONTROL_SEQ;
            rowData.SEQ2 = rowData.CONTROL_DETAIL_SEQ;
        }

        visibilityButton();
        changeProcessingRequirementsBasicInformation(rowData);
        changeProcessingRequirementsInformation(rowData);
        changeProcessingRequirementsEtcInformation(rowData);
        settingProcessingEtcDiv(rowData);
        changeImageView(rowData);
    };
    /* function */

    /* event */
    $('#processingRequirementsModal #prev').on('click', function () {
        if ($('#processing_requirements_form').find('#TYPE').val() === 'CONTROL') {
            const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
            const controlDetailSeq = rowData.CONTROL_DETAIL_SEQ;
            let prevControlDetailSeq;

            do {
                processingRequirementsTargetRowIndex--;
                const prevRowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
                prevControlDetailSeq = prevRowData.CONTROL_DETAIL_SEQ;
            } while (controlDetailSeq === prevControlDetailSeq)
        } else {
            processingRequirementsTargetRowIndex--;
        }

        changeData();
    });
    $("#processing_drawing_detail").on('click', function() {
        if($("#processingRequireImgDiv").css('display') === 'none') {
            $("#processingPopBody").css(
                {
                    'width':'1480px',
                    'left':'10%'
                }
            );
            $("#processingRequireInfoDiv").css('width','36%')
            $("#processingRequireImgDiv").show();
        }else {
            $("#processingPopBody").css(
                {
                    'width':'650px',
                    'left':'35%'
                }
            );
            $("#processingRequireImgDiv").hide();
            $("#processingRequireInfoDiv").css('width','100%')

        }
        $("#processing_requirements_grid").pqGrid('refreshView');
        $("#processing_requirements_special_sub_grid").pqGrid('refreshView');

        if($("#processing_requirements_special_sub_grid .pq-header-outer").css('display') !== 'none') {
            let headerT = $("#processing_requirements_special_sub_grid .pq-header-outer").height();
            let bodyT = $("#processing_requirements_special_sub_grid .pq-body-outer").height();
            let afterT = bodyT + headerT - 2;
            $("#processing_requirements_special_sub_grid .pq-body-outer").height( afterT + "px");
        }
    })
    $('#processingRequirementsModal #next').on('click', function () {
        if ($('#processing_requirements_form').find('#TYPE').val() === 'CONTROL') {
            const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
            const controlDetailSeq = rowData.CONTROL_DETAIL_SEQ;
            let nextControlDetailSeq;

            do {
                processingRequirementsTargetRowIndex++;
                const nextRowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
                nextControlDetailSeq = nextRowData.CONTROL_DETAIL_SEQ;
            } while (controlDetailSeq === nextControlDetailSeq)
        } else {
            processingRequirementsTargetRowIndex++;
        }

        changeData();
    });

    const processingRequirementsEtcSave = function () {
        const rowData = processingRequirementsTargetGrid.pqGrid('getRowData', {rowIndx: processingRequirementsTargetRowIndex});
        const gridInstance = $processingRequirementsEtcGrid.pqGrid('getInstance').grid;
        if (gridInstance.isDirty()) {
            let $processingRequirementsType = $('#processing_requirements_form').find('#TYPE').val();
            let $basicInformation = $('.basic_information');
            let gridInstance = $processingRequirementsEtcGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            changes.TYPE = $processingRequirementsType;
            changes.SEQ1 = $basicInformation.find('#seq1').html();
            changes.SEQ2 = $basicInformation.find('#seq2').html();
            let url = '';

            if ($processingRequirementsType === 'ESTIMATE') {
                url = 'processingRequirementsEstimateEtcSave';
            } else if ($processingRequirementsType === 'CONTROL') {
                url = 'processingRequirementsEtcControlSave';
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

    }
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
    const drawingUploadPopupWindow = function (actionType, queryId, workKey, insideSeqStr) {
        let drawingForm = document.drawing_file_upload_form;
        // const url = '/drawingUploadPopup?actionType=' + actionType + '&queryId=' + queryId;
        // 팝업 사이즈
        const nWidth = 1100;
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

            drawingUploadPopup = window.open('', 'popForm', strOption);

            $('#drawing_file_upload_form').find("#actionType").val(actionType);
            $('#drawing_file_upload_form').find("#queryId").val(queryId);
            $('#drawing_file_upload_form').find("#WORK_KEY").val(workKey);
            $('#common_cad_reversion_control_list_form').find("#WORK_KEY").val(workKey);
            if(actionType == 'inside') {
                $('#drawing_file_upload_form').find("#INSIDE_STOCK_SEQ_STR").val(insideSeqStr);
            }

            drawingForm.action = "/drawingUploadPopup";
            drawingForm.target = "popForm";
            drawingForm.submit();

        } else {
            drawingUploadPopup.focus();
            setTimeout(function() {

                $(drawingUploadPopup.window.document).find("#actionType").val(actionType);
                $(drawingUploadPopup.window.document).find("#queryId").val(queryId);
                $(drawingUploadPopup.window.document).find("#WORK_KEY").val(workKey);
                $(drawingUploadPopup.window.document).find("#common_cad_reversion_control_list_form").find("#WORK_KEY").val(workKey);

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
        }else if(actionType == 'controlPart' || actionType == 'controlRev') {
            $("#CONTROL_MANAGE_SEARCH").trigger("click");
        }else if(actionType == 'order') {
            $("#ORDER_MANAGE_SEARCH").trigger("click");
        }else if(actionType == 'inside') {      // 자재 도면 등록
            $("#stock_manage_search_btn").trigger("click");
        }
    }

    function callInspectionManageSearch(callElement){
        $("#" + callElement).trigger("click");
    }

    let drawingRevPopup;
    const drawingRevPopupWindow = function (orderSeq, controlSeq, controlDetailSeq) {
        let drawingForm = document.drawing_revision_pop_form;
        // const url = '/drawingUploadPopup?actionType=' + actionType + '&queryId=' + queryId;
        // 팝업 사이즈
        const nWidth = 1280;
        const nHeight = 685;
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
        if (drawingRevPopup === undefined || drawingRevPopup.closed) {

            drawingRevPopup = window.open('', 'popForm', strOption);

            $('#drawing_revision_pop_form').find("#ORDER_SEQ").val(orderSeq);
            $('#drawing_revision_pop_form').find("#CONTROL_SEQ").val(controlSeq);
            $('#drawing_revision_pop_form').find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);

            drawingForm.action = "/drawingRevPop";
            drawingForm.target = "popForm";
            drawingForm.submit();

        } else {
            drawingRevPopup.focus();
            setTimeout(function() {

                $(drawingRevPopup.window.document).find("#ORDER_SEQ").val(orderSeq);
                $(drawingRevPopup.window.document).find("#CONTROL_SEQ").val(controlSeq);
                $(drawingRevPopup.window.document).find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);

                drawingRevPopup.initDrawingLoad();
            }, 500);
        }
    }


    $(document).on('click', '.basic_information #imageView', function () {
        const imgGfileSeq = $(this).data('value');
        callWindowImageViewer(imgGfileSeq);
    });
    /* event */

    function timeFormat(time) {
        var text = "";
        if(typeof time != 'undefined' && time != "" && time != null) {
            if(time >= 60) {
                if(time % 60 == 0) {
                    text = parseInt(time / 60) + 'h';
                }else {
                    text = Math.floor(time / 60) + 'h  ' + parseInt(time % 60) + 'm';
                }
            }else {
                text = time + 'm';
            }
        }
        return text;
    }
    function settingOngoingInfo() {
        const parameter2 = {'url': '/json-info', 'data': {
                'queryId':'tvMapper.selectMctOngoingInfoForDetailPop',
                'EQUIP_SEQ':$("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val()
            }
        };
        fnPostAjax(function (data) {
            var tempHtml = '';
            $("#mct_plan_detail_pop").find("#popHeadMid").removeClass("non_if");

            if(data.info != null) {
                $("#mct_plan_detail_pop_form").find("#MCT_WORK_SEQ").val(data.info.MCT_WORK_SEQ);
                $("#mct_plan_detail_pop_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
                $("#mct_plan_detail_pop_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
                for(let key in data.info){
                    let val = data.info[key];
                    if(key == "PHOTO_GFILE_SEQ") {
                        $("#mct_plan_detail_pop").find("#table2_worker_img").attr('src', '/image/' + val);
                    }else if(key == 'EQUIP_STATUS') {
                        $("#mct_plan_detail_pop").find("."+key).removeClass("green");
                        $("#mct_plan_detail_pop").find("."+key).removeClass("yellow");
                        if(val == 'Active') {
                            $("#mct_plan_detail_pop").find("."+key).addClass("green");
                        }else if(val == 'Stop') {
                            $("#mct_plan_detail_pop").find("."+key).addClass("yellow");
                        }
                    }else if(key == 'PLAN_WORKING_TIME') {
                        $("#ongoing_work_input").val(val);
                    }else if(key == 'IF_USE_YN' && val != 'Y') {
                        $("#mct_plan_detail_pop").find("#popHeadMid").addClass("non_if");
                    }
                    $("#mct_plan_detail_pop").find("."+key).text(val);
                }
                if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
                    $("#mct_plan_pop_img").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
                    $("#mct_plan_pop_img").attr('alt', data.info.IMG_GFILE_SEQ);
                    $("#mct_plan_pop_img").attr('data-value', data.info.IMG_GFILE_SEQ);
                    $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
                }else {
                    $("#mct_plan_pop_img").attr('src', '/resource/main/blank.jpg');
                    $("#mct_plan_pop_img").attr('alt','');
                    $("#mct_plan_pop_img").attr('data-value', '');
                    $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val('');
                }
            }else {
                $("#mct_plan_pop_img").attr('src', '/resource/main/blank.jpg');
                $("#mct_plan_pop_img").attr('alt','');
                $("#mct_plan_pop_img").attr('data-value', '');
                $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val('');
            }

        }, parameter2, '');

    }

    $("#span_item_detail").on('click',function() {
        let controlSeq = $("#mct_plan_detail_pop_form").find("#CONTROL_SEQ").val();
        let controlDetailSeq = $("#mct_plan_detail_pop_form").find("#CONTROL_DETAIL_SEQ").val();
        g_item_detail_pop_view(controlSeq, controlDetailSeq);
    });

    const g_mct_plan_detail_pop_view = function (EQUIP_SEQ) {

        $("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val(EQUIP_SEQ);

        settingOngoingInfo();

        $("#mct_plan_detail_pop").modal('show');
    }

    $(".close_mct_plan_detail").on('click',function () {
        $("#mct_plan_detail_pop").modal('hide');
    })

    $("#mct_plan_pop_img").on('click',function () {
        setTimeout(function() {
            $("#mct_plan_detail_pop_form").find("#BARCODE_NUM").focus();
        }, 100);
    });

    $("#planDetailBtn").on("click",function(){
        let gFileSeq = $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val();
        if(gFileSeq != '') {
            callWindowImageViewer(gFileSeq);
        }
    });

    const $camWorkDetailGrid =  $('#cam_work_detail_grid');
    const camWorkDetailColModel = [
        {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
        {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
        {title: 'CAM_SEQ', dataType: 'integer', dataIndx: 'CAM_SEQ', hidden: true},
        {title: '주문확정<br>일자', dataIndx: 'ORDER_CONFIRM_DT'},
        {title: '외<br>주', minWidth: 30, maxWidth: 30, dataIndx: 'OUTSIDE_YN'},
        {title: '작업지시번호', width: 180, halign: 'center', align: 'left', dataIndx: 'CONTROL_NUM'},
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
                    g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                });
            }
        },
        {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
        {
            title: '발주처', dataIndx: 'ORDER_COMP_NM',
            styleHead: {'background': '#ffe699'},
            render: function (ui) {
                const firstRowData = this.getRowData({rowIndx: 0});

                if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                    return {style: 'color: #0000ff'};
                }
            }
        },
        {
            title: '규격', dataIndx: 'SIZE_TXT',
            styleHead: {'background': '#ffe699'},
            render: function (ui) {
                const firstRowData = this.getRowData({rowIndx: 0});

                if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                    return {style: 'color: #0000ff'};
                }
            }
        },
        {
            title: '재질', dataIndx: 'MATERIAL_TYPE_NM',
            styleHead: {'background': '#ffe699'},
            render: function (ui) {
                const firstRowData = this.getRowData({rowIndx: 0});

                if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                    return {style: 'color: #0000ff'};
                }
            }
        },
        {
            title: '도면번호', width: 150, halign: 'center', align: 'left', dataIndx: 'DRAWING_NUM',
            styleHead: {'background': '#ffe699'},
            render: function (ui) {
                const firstRowData = this.getRowData({rowIndx: 0});

                if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                    return {style: 'color: #0000ff'};
                }
            }
        },
        {
            title: '', minWidth: 25, maxWidth: 25, dataIndx: 'IMG_GFILE_SEQ',
            styleHead: {'background': '#ffe699'},
            render: function (ui) {
                if (ui.cellData)
                    return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>';
            },
            postRender: function (ui) {
                let grid = this,
                    $cell = grid.getCell(ui);
                $cell.find('[name=imageView]').bind('click', function () {
                    let rowData = ui.rowData;
                    callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                });
            }
        },
        {
            title: 'CAD 파일', align: 'center',
            styleHead: {'background': '#ffe699'},
            colModel: [
                {
                    title: 'Size', dataIndx: 'CAD_FILE_SIZE',
                    styleHead: {'background': '#ffe699'},
                    render: function (ui) {
                        const firstRowData = this.getRowData({rowIndx: 0});

                        if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                            return {style: 'color: #0000ff'};
                        }
                    }
                },
                {
                    title: '', minWidth: 35, maxWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                    styleHead: {'background': '#ffe699'},
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
        {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM'},
        {title: '수량', dataIndx: 'CONTROL_PART_QTY'},
        {
            title: '1EA 가공시간', align: 'center',
            colModel: [
                {title: '전공정', dataIndx: 'UNIT_TOTAL_WORK_TIME'},
                {title: 'NC', dataIndx: 'UNIT_NC_WORK_TIME'}
            ]
        },
        {
            title: '가공시간', align: 'center',
            colModel: [
                {title: 'Total', dataIndx: 'TOTAL_WORK_TIME'},
                {title: '선반', dataIndx: 'LATHE_WORK_TIME'},
                {title: 'NC', dataIndx: 'NC_WORK_TIME'},
                {title: '밀링', dataIndx: 'MILLING_WORK_TIME'},
                {title: '연마', dataIndx: 'GRINDING_WORK_TIME'}
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

    $(".close_cam_work_detail").on('click',function () {
        $("#cam_work_detail_popup").modal('hide');
    })

    /* function */
    const camCellMerge = function (grid, refresh) {
        let mergeCellList = [],
            colModelList = grid.getColModel(),
            i = colModelList.length,
            data = grid.option('dataModel.data');

        const controlList = [
            'ORDER_COMP_NM'
        ];
        const partList = [
            'ORDER_CONFIRM_DT', 'OUTSIDE_YN', 'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'WORK_TYPE_NM', 'SIZE_TXT',
            'MATERIAL_TYPE_NM', 'DRAWING_NUM', 'IMG_GFILE_SEQ', 'CAD_FILE_SIZE', 'DXF_GFILE_SEQ',
            'MATERIAL_DETAIL_NM', 'CONTROL_PART_QTY', 'UNIT_TOTAL_WORK_TIME', 'UNIT_NC_WORK_TIME',
            'TOTAL_WORK_TIME', 'NC_WORK_TIME', 'MILLING_WORK_TIME', 'GRINDING_WORK_TIME', 'LATHE_WORK_TIME'
        ];
        const includeList = controlList.concat(partList);

        while (i--) {
            let dataIndx = colModelList[i].dataIndx,
                rc = 1,
                j = data.length;

            if (includeList.includes(dataIndx)) {
                while (j--) {
                    let controlNum = data[j]['CONTROL_NUM'],
                        controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_NUM'] : undefined,
                        cellData = data[j][dataIndx],
                        cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                    if (controlList.includes(dataIndx)) {
                        if (controlNum === controlNumPrev) {
                            // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                            if (cellData == cellDataPrev) {
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
                        let cellData = data[j][dataIndx],
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                        if (controlNum === controlNumPrev) {
                            // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                            if (cellData == cellDataPrev) {
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
    $('[name=ORDER_COMP_CHECK]').on('change', function () {
        if($('#ORDER_COMP_CHECK').is(":checked")) {
            $("#cam_work_detail_form #ORDER_COMP_YN").val("");
        }else {
            $("#cam_work_detail_form #ORDER_COMP_YN").val("N");
        }

        $('#cam_work_detail_form').find('#queryId').val('inspection.selectCamWorkDetail');

        $('#cam_work_detail_grid').pqGrid('option', 'dataModel.postData', function () {
            return (fnFormToJsonArrayData('#cam_work_detail_form'));
        });
        $('#cam_work_detail_grid').pqGrid('refreshDataAndView');
    });
    $("#cam_work_detail_popup").on({
        'show.bs.modal': function () {
            const camWorkDetailObj = {
                height: 528,
                dataModel: {
                    location: 'remote', dataType: 'json', method: 'POST', recIndx: 'RNUM',
                    url: '/tv/paramQueryGridSelect',
                    postData: fnFormToJsonArrayData('cam_work_detail_form'),
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                strNoRows: g_noData,
                editable: false,
                postRenderInterval: -1,
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                // scrollModel: {autoFit: true},
                numberCell: {title: 'No'},
                selectionModel: {type: 'row', mode: 'single'},
                swipeModel: {on: false},
                showTitle: false,
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                colModel: camWorkDetailColModel,
                rowInit: function (ui) {
                    // console.log(ui);
                    if (ui.rowIndx === 0) {
                        return {style: {'background': '#FFFF00'}};
                    }
                },
                rowSelect: function (event, ui) {
                    if(ui.addList.length > 0) {
                        const rowData = ui.addList[0].rowData;
                        callQuickRowChangeDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    }
                },
                cellKeyDown: function (event, ui) {
                    const rowIndx = ui.rowIndx;
                    let nextIdx = ui.rowIndx;
                    const sr = this.SelectRow();
                    const selRowData = this.getRowData({rowIndx: rowIndx});
                    const data = this.option('dataModel.data');
                    let groupNo = fnGroupBy(data,'CONTROL_NUM');
                    if (event.keyCode == $.ui.keyCode.DOWN  && rowIndx < (data.length - 1)) {
                        nextIdx++;
                    } else if (event.keyCode == $.ui.keyCode.UP && rowIndx > 0) {
                        nextIdx--;
                    }

                    const nextData = this.getRowData({rowIndx: nextIdx});
                    if(typeof groupNo[nextData.CONTROL_NUM] != 'undefined' && groupNo[nextData.CONTROL_NUM].length > 1) {
                        let nextRow = groupNo[nextData.CONTROL_NUM][0];
                        nextIdx = nextRow.pq_ri;
                        if(nextIdx == rowIndx) {
                            nextIdx = nextIdx + groupNo[nextData.CONTROL_NUM].length;
                            if(event.keyCode == $.ui.keyCode.UP) {
                                nextIdx = nextIdx - groupNo[nextData.CONTROL_NUM].length;
                            }
                        }
                    }

                    sr.removeAll();
                    sr.add({rowIndx: nextIdx});
                },
                complete: function () {
                    this.flex();
                    console.log('complete');
                },
                load: function () {
                    camCellMerge(this, true);
                    const data = this.option('dataModel.data');
                    console.log(data)
                    console.log('load');
                }
            };
            $('#cam_work_detail_form').find('#queryId').val('inspection.selectCamWorkDetail');
            camWorkDetailObj.dataModel.postData = fnFormToJsonArrayData('cam_work_detail_form');
            $camWorkDetailGrid.pqGrid(camWorkDetailObj);
        },
        'hide.bs.modal': function () {
            $camWorkDetailGrid.pqGrid('destroy');
        }
    })

    $('#mct_plan_detail_pop').on({
        'show.bs.modal': function () {
            planDetailPopImgDiv();

            setTimeout(function() {
                $("#mct_plan_detail_pop_form").find("#BARCODE_NUM").focus();
            }, 500);
        },
        'hide.bs.modal': function () {
            fnResetForm('mct_plan_detail_pop_form');
            $("#mct_plan_detail_pop").find(".val_text").text("");
            $("#mct_plan_detail_pop").find(".val_text").text("");
            $("#mct_plan_detail_pop").find(".EQUIP_STATUS").removeClass("green");
            $("#mct_plan_detail_pop").find(".EQUIP_STATUS").removeClass("yellow");
            $("#ongoing_work_input").val("");
        }
    });
    $("#mct_plan_detail_pop_form").find("#mct_plan_detail_pop_form_barcode_img").on('click',function (){
        setTimeout(function() {
            $("#mct_plan_detail_pop_form").find("#BARCODE_NUM").focus();
        }, 100);
    })
    $("#mct_plan_detail_pop_form").find("#BARCODE_NUM").on({
        focus: function () {
            $("#mct_plan_detail_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
        },
        blur: function () {
            $("#mct_plan_detail_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
        },
        keyup: function (e) {
            if (e.keyCode == 13) {
                let BARCODE_NUM = fnBarcodeKo2En(this.value);
                let parameters = {
                    'url': '/json-info',
                    'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"machine.selectBarcodePlanInfo"}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    let dataInfo = data.info;

                    $("#mct_plan_detail_pop_form").find("#BARCODE_NUM").val("");
                    if(dataInfo != null) {
                        let parameters2 = {
                            'url': '/json-info',
                            'data': {
                                "queryId":"machine.selectAlreadyExistPlan",
                                "CONTROL_SEQ":dataInfo.CONTROL_SEQ,
                                "EQUIP_SEQ":$("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val(),
                                "CONTROL_DETAIL_SEQ":dataInfo.CONTROL_DETAIL_SEQ
                            }
                        };
                        fnPostAjax(function (data) {
                            if(data.info != null && data.info.COUNT > 0) {
                                return;
                            }else {
                                var json = dataInfo;
                                json.EQUIP_SEQ = $("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val();

                                let parameters = {
                                    'url': '/modifyMctPlan',
                                    'data': {actionType: 'add', data: JSON.stringify(json)}
                                };
                                fnPostAjax(function (data) {
                                    const flag = data.flag;
                                    if (flag) {
                                        fnAlert(null, '<spring:message code="error.common"/>');
                                        return false;
                                    }
                                    if(typeof dataInfo.IMG_GFILE_SEQ != 'undefined' && dataInfo.IMG_GFILE_SEQ != '') {
                                        $("#mct_plan_pop_img").attr('src','/qimage/'+dataInfo.IMG_GFILE_SEQ);
                                        $("#mct_plan_pop_img").attr('alt',dataInfo.IMG_GFILE_SEQ);
                                        $("#mct_plan_pop_img").attr('data-value', dataInfo.IMG_GFILE_SEQ);
                                        $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val(dataInfo.IMG_GFILE_SEQ);
                                    }else {
                                        $("#mct_plan_pop_img").attr('src', '/resource/main/blank.jpg');
                                        $("#mct_plan_pop_img").attr('alt','');
                                        $("#mct_plan_pop_img").attr('data-value', '');
                                        $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val('');
                                    }
                                    planDetailPopImgDiv();

                                }, parameters, '');
                            }
                        }, parameters2, '');
                    }else {
                        fnAlert("","가공계획에 추가 할 수 없습니다.");
                    }
                },parameters,'');
            }
        }
    });


    let inspectionDetailGrid =  $("#inspection_detail_grid");
    let inspectionDetailColModel = [
        {title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
        {title: 'Seq.', datatype: 'string', dataIndx: 'Q_INSPECT_NUM', minWidth: 30, width: 30},
        {title: '작성자', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 80},
        {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', width: 85},
        // {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 90, width: 95},
        {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 60},
        {title: '수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY', maxWidth: 40, width: 40},
        {title: '검사코드', align: 'center', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95, colModel: [
                {title: '', dataType: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 95, styleHead: {'border-right-width': '0'}}
            ]
        },
        {title: '원인', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM', width: 95, colModel: [
                {title: '상세내용', dataType: 'string', dataIndx: 'Q_INSPECT_DESC1', minWidth: 95, styleHead: {'border-right-width': '0'}}
            ]
        },
        {title: '발생공정', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', width: 95, colModel: [
                {title: '', dataType: 'string', dataIndx: 'Q_INSPECT_DESC2', minWidth: 95}
            ]
        },
        {title: '조치', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM', width: 95,  colModel: [
                {title: '비고', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 95}
            ]
        },
        // {title: '조치방안', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', width: 95},
        {title: '작성일시', dataType: 'string', dataIndx: 'Q_DT', minWidth: 90, width: 95}
    ];
    let inspectionDetailObj = {
        width: "100%", height: 280,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
            url: "/tv/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('inspection_detail_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        strNoRows: g_noData,
        editable: false,
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
        scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: false},
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: inspectionDetailColModel,
        complete: function () {
            inspectionAutoMerge(this, true);
            const groupData = fnGroupBy(this.option('dataModel.data'),'Q_SEQ');
            $.each(groupData, function(idx,Item) {
                if (Item.length >= 2) {
                    var cellId1 = '-' + Item[0].pq_ri + '-6-right'
                    var cellId2 = '-' + Item[0].pq_ri + '-7-right'
                    var cellId3 = '-' + Item[0].pq_ri + '-8-right'
                    var cellId4 = '-' + Item[0].pq_ri + '-9-right'

                    $("#"+cellId1 + " > div").text(Item[0].Q_INSPECT_RESULT_NM);
                    $("#"+cellId2 + " > div").text(Item[0].Q_ERROR_REASON_NM);
                    $("#"+cellId3 + " > div").text(Item[0].Q_ERROR_PROCESS_NM);
                    $("#"+cellId4 + " > div").text(Item[0].Q_ERROR_ACTION_NM);
                    $("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId1 + "']").each(function() {
                        $(this).find("div").text(Item[0].Q_INSPECT_RESULT_NM)
                    });
                    $("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId2 + "']").each(function() {
                        $(this).find("div").text(Item[0].Q_ERROR_REASON_NM)
                    });
                    $("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId3 + "']").each(function() {
                        $(this).find("div").text(Item[0].Q_ERROR_PROCESS_NM)
                    });
                    $("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId4 + "']").each(function() {
                        $(this).find("div").text(Item[0].Q_ERROR_ACTION_NM)
                    });
                }
            })
        }
    };
    const inspectionAutoMerge = function (grid, refresh) {
        let mergeCellList = [],
            colModelList = grid.getColModel(),
            i = colModelList.length,
            data = grid.option('dataModel.data');
        const orderList = [
            'Q_INSPECT_NUM', 'Q_INSPECT_USER_NM', 'Q_INSPECT_METHOD_NM', 'Q_INSPECT_GRADE', 'Q_INSPECT_GRADE_NOTE',
            'Q_ERROR_QTY', 'Q_DT'
        ];
        const includeList = orderList;

        while (i--) {
            let dataIndx = colModelList[i].dataIndx,
                rc = 1,
                j = data.length;

            if (includeList.includes(dataIndx)) {
                while (j--) {
                    let controlNum = data[j]['Q_SEQ'],
                        controlNumPrev = data[j - 1] ? data[j - 1]['Q_SEQ'] : undefined,
                        cellData = data[j][dataIndx] || '',
                        cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;
                    if (orderList.includes(dataIndx)) {
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
                    }
                }
            }
        }
        const groupData = fnGroupBy(data,'Q_SEQ');
        $.each(groupData, function(idx,Item) {
            if(Item.length >= 2) {
                mergeCellList.push({r1: Item[1].pq_ri, c1: 6, rc: 1, cc: 3});
            }
        });

        grid.option('mergeCells', mergeCellList);
        if (refresh) {
            grid.refreshView();
        }
    }
    $("#inspection_detail_popup").on({
        'show.bs.modal': function () {
            inspectionDetailObj.dataModel.postData = fnFormToJsonArrayData('inspection_detail_form');
            inspectionDetailGrid.pqGrid(inspectionDetailObj);
        },'hide.bs.modal':function() {
            if ($("#inspection_detail_grid").hasClass('pq-grid')) {
                $("#inspection_detail_grid").pqGrid('destroy');
            }
        }
    })
    $(".close_inspection_detail").on("click", function() {
        $("#inspection_detail_popup").modal("hide");
    });



    let inspectionManageGridIdPop01 = $("#inspection_manage_grid_pop_01");
    let inspectionManageColModelPop01;
    let inspectionManagePostDataPop01;

    let inspectionManageGridIdPop02 = $("#inspection_manage_grid_pop_02");
    let inspectionManageColModelPop02;
    let inspectionManagePostDataPop02;

    /**  팝업 그리드 1 선언 끝 **/
    $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList1");
    inspectionManagePostDataPop01 = fnFormToJsonArrayData('#inspection_manage_pop_form');
    inspectionManageColModelPop01 = [
        {title: '입력구분', dataType: 'string', dataIndx: 'NOTE_TYPE_NM', maxWidth: 150, width: 150, editable: false},
        {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 95, width: 95, editable: false}
    ];
    inspectionManageGridIdPop01.pqGrid({
        width: "100%", height: 90,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
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
        colModel: inspectionManageColModelPop01
    });
    /**  팝업 그리드 1 선언 끝 **/

    /**  팝업 그리드 2 선언 끝 **/
    $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList2");
    inspectionManagePostDataPop02 = fnFormToJsonArrayData('#inspection_manage_pop_form');
    inspectionManageColModelPop02 = [
        {title: 'Seq.', dataType: 'string', dataIndx: 'Q_SEQ', width: 40},
        {title: '담당관', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 120},
        // {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM',  width: 95},
        // {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT',  width: 95},
        {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NM',  width: 95},
        {title: '합/불', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE',  width: 95},
        // {title: '양품', dataType: 'string', dataIndx: 'Q_OK_QTY',  width: 95},
        {title: '불량수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY',  width: 95},
        {title: '검사코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM',  width: 95},
        {title: '상세 내용', dataType: 'string', dataIndx: 'Q_INSPECT_DESC',  width: 95},
        // {title: '원인', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM',  width: 95},
        {title: '발생공정', dataType: 'string', dataIndx: 'Q_ERROR_PROCESS_NM',  width: 95},
        {title: '조치', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM',  width: 95},
        {title: '조치방안 및 비고', dataType: 'string', dataIndx: 'Q_ERROR_NOTE',  width: 95},
        {title: '작성일시', dataType: 'string', dataIndx: 'Q_DT',  width: 100}
    ];
    inspectionManageGridIdPop02.pqGrid({
        width: "100%", height: 115,
        dataModel: {
            location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
            url: "/paramQueryGridSelect",
            postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        strNoRows: g_noData,
        columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', editable: false},
        scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: false , styleHead: {'vertical-align':'middle'}},
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: inspectionManageColModelPop02
    });
    /**  팝업 그리드 2 선언 끝 **/


    $("#inspection_manage_pop").on('show.bs.modal', function () {

        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoBasic");
        let parameters = {
            'url': '/json-info',
            'data': $('#inspection_manage_pop_form').serialize()
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;
            if (dataInfo == null) {
                fnAlert(null, "해당 데이터가 존재하지 않습니다.");
                $('#inspection_manage_pop').modal('hide');
            } else {
                let emergencySpan = '';
                fnJsonDataToForm("inspection_manage_pop_form", dataInfo);
                $("#inspection_manage_pop_form").find("#Q_SEQ").html(dataInfo.Q_SEQ);
                $("#inspection_manage_pop_form").find("#CONTROL_NUM" + "_VIEW_T").html(dataInfo.CONTROL_NUM);
                $("#inspection_manage_pop_form").find("#DRAWING_NUM" + "_VIEW_T").html(dataInfo.DRAWING_NUM);
                $("#inspection_manage_pop_form").find("#MAIN_INSPECTION_NM" + "_VIEW_T").html(dataInfo.MAIN_INSPECTION_NM);
                if (dataInfo.EMERGENCY_YN === 'Y') {
                    emergencySpan = '<span style="display: inline-block; margin: 0 5px; padding: 0px 7px; border: solid red; border-radius: 5px; color: #FF0000; text-align: center; font-size: 1rem;">긴급</span>';
                }
                $("#inspection_manage_pop_form").find("#INNER_DUE_DT" + "_VIEW_T").html(dataInfo.INNER_DUE_DT + emergencySpan);
                $("#inspection_manage_pop_form").find("#ITEM_NM" + "_VIEW_T").html(dataInfo.ITEM_NM);
                $("#inspection_manage_pop_form").find("#MATERIAL_DETAIL_NM" + "_VIEW_T").html(dataInfo.MATERIAL_DETAIL_NM);
                $("#inspection_manage_pop_form").find("#ORDER_QTY_INFO" + "_VIEW_T").html(dataInfo.ORDER_QTY_INFO);
                $("#inspection_manage_pop_form").find("#SIZE_TXT_WORK_TYPE_NM" + "_VIEW_T").html(dataInfo.SIZE_TXT_WORK_TYPE_NM);
                $("#inspection_manage_pop_form").find("#SURFACE_TREAT_NM" + "_VIEW_T").html(dataInfo.SURFACE_TREAT_NM);
                $("#inspection_manage_pop_form").find("#PART_STATUS_NM" + "_VIEW_T").html(dataInfo.PART_STATUS_NM);
                $("#inspection_manage_pop_form").find("#ORDER_COMP_NM" + "_VIEW_T").html(dataInfo.ORDER_COMP_NM);
                $("#inspection_manage_pop_form").find("#OUTSIDE_COMP_NM" + "_VIEW_T").html(dataInfo.OUTSIDE_COMP_NM);

                $("#inspection_manage_pop_form").find("#ORDER_QTY_VIEW").html(dataInfo.ORDER_QTY);
                $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html("0");
                $("#inspection_manage_pop_form").find("#INSPECT_METHOD").val("1");
                $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val("GRD010");
                $("#inspect_grade_GRD010").trigger("click");

            }

            // 작성자 선택
            $('#INSPECT_USER_ID').val('${authUserInfo.USER_ID}').prop('selected', true);
        }, parameters, '');

        //그리드 1
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList1");
        inspectionManageGridIdPop01.pqGrid("option", "dataModel.postData", function (ui) {
            return fnFormToJsonArrayData('#inspection_manage_pop_form');
        });
        inspectionManageGridIdPop01.pqGrid("refreshDataAndView");


        //그리드 2
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoList2");
        inspectionManageGridIdPop02.pqGrid("option", "dataModel.postData", function (ui) {
            return fnFormToJsonArrayData('#inspection_manage_pop_form');
        });
        inspectionManageGridIdPop02.pqGrid("refreshDataAndView");

    });

    fnCommCodeDatasourceSelectBoxCreate($('#inspection_manage_pop_form').find('#INSPECT_USER_ID'), '', {
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getUserList'}
    });

    $("#inspection_manage_pop").on('hide.bs.modal', function () {
        fnResetForm("inspection_manage_pop_form");
        $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionList");
        $("#inspection_manage_search_btn").trigger("click");
        $("#INSPECTION_BARCODE_NUM").focus();
    });

    $('#inspection_manage_pop_save').on('click', function () {
        // validation

        $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", false);
        $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", false);
        $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", false);
        $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", false);
        $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", false);
        let selINSPECT_RESULT = $("#inspection_manage_pop_form").find("#INSPECT_RESULT option:selected").val();
        let selINSPECT_GRADE = $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val();

        if(selINSPECT_GRADE == "GRD030" || selINSPECT_GRADE == "GRD040"){
            if(selINSPECT_RESULT == ""){
                fnAlert(null, "검사코드는 필수 입력 값입니다.");
                return;
            }
        }

        $("#inspection_manage_pop_form").find("#queryId").val("inspection.insertInspectionMaster");

        let parameters = {'url': '/inspectionCreate', 'data': $("#inspection_manage_pop_form").serialize() };
        $(this).startWaitMe();
        fnPostAjax(function (data, callFunctionParam) {
            $(this).stopWaitMe();
            fnAlert(null, "등록이 완료되었습니다.", function () {
                $("#INSPECTION_BARCODE_NUM").focus()
            });

            setTimeout(function() {
                alertify.alert().close();
                $("#INSPECTION_BARCODE_NUM").focus()
            },1000);
            $('#inspection_manage_pop').modal('hide');
        }, parameters, '');

    });

    $('#inspection_manage_pop_form').find('#popClose, #popClose2').on('click', function () {
        $('#inspection_manage_pop').modal('hide');
    });

    $("#inspection_manage_pop_form").find("#inspect_method_btn > button").on('click', function (e) {
        $(this).siblings().removeClass("on");
        $(this).addClass("on");
        let targetId = this.id.replace("inspect_method_","");
        $("#inspection_manage_pop_form").find("#INSPECT_METHOD").val(targetId);
    });

    $("#inspection_manage_pop_form").find("#inspect_grade_btn > button").on('click', function (e) {

        let targetId = this.id.replace("inspect_grade_","");
        $("#inspection_manage_pop_form").find("#INSPECT_GRADE").val(targetId);

        $("#inspection_manage_pop_form").find("#ERROR_PROCESS").val("");
        $("#inspection_manage_pop_form").find("#ERROR_REASON").val("");
        $("#inspection_manage_pop_form").find("#ERROR_ACTION").val("");
        $("#inspection_manage_pop_form").find("#ERROR_NOTE").val("");

        let $comboId = $('#inspection_manage_pop_form').find('#INSPECT_RESULT');
        $comboId[0].options.length = 0;

        $comboId[0].add(new Option("<spring:message code="com.form.top.sel.option" />", ""));
        <c:forEach var="vlocale" items="${HighCode.H_1019}">
        $comboId[0].add(new Option("${vlocale.CODE_NM_KR}", "${vlocale.CODE_CD}"));
        </c:forEach>

        if(targetId == "GRD040" || targetId == "GRD030"){

            $("#inspection_manage_pop_plus_btn").show();
            $("#inspection_manage_pop_plus_minus").show();

            let errQty = $("#inspection_manage_pop_form").find("#ORDER_QTY").val();
            if (errQty == null || errQty == "" || errQty== "undefined") {
                errQty = 0;
            }
            $("#inspection_manage_pop_form").find("#ERROR_QTY").val(errQty);
            $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html(errQty);

            $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", false);
            $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", false);


            if(targetId == 'GRD040') {
                $comboId.empty();

                $comboId[0].add(new Option("<spring:message code="com.form.top.sel.option" />", ""));
                <c:forEach var="vlocale" items="${HighCode.H_1020}">
                $comboId[0].add(new Option("${vlocale.CODE_NM_KR}", "${vlocale.CODE_CD}"));
                </c:forEach>
            }
        }else{

            $("#inspection_manage_pop_plus_btn").hide();
            $("#inspection_manage_pop_plus_minus").hide();

            $("#inspection_manage_pop_form").find("#ERROR_QTY").val("0");
            $("#inspection_manage_pop_form").find("#ERROR_QTY_VIEW").html("0");


            $("#inspection_manage_pop_form").find("#ERROR_PROCESS").attr("disabled", true);
            $("#inspection_manage_pop_form").find("#ERROR_REASON").attr("disabled", true);
            $("#inspection_manage_pop_form").find("#ERROR_ACTION").attr("disabled", true);
            $("#inspection_manage_pop_form").find("#ERROR_NOTE").attr("readonly", true);

        }
        //display
        $(this).siblings().removeClass();
        $(this).siblings().addClass("gradeBtn");
        if(targetId == "GRD010"){
            $(this).addClass("green");
            $("#inspection_manage_grade_style").find("th").removeAttr("style","background: #e7eef7;color: #444;");
            $("#inspection_manage_inspection_code_style").attr("style","background: #e6e6e6;");
            $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", true);
        }else if(targetId == "GRD020"){
            $(this).addClass("blue");
            $("#inspection_manage_grade_style").find("th").removeAttr("style","background: #e7eef7;color: #444;");
            $("#inspection_manage_inspection_code_style").attr("style","background: #e6e6e6;");
            $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", true);
        }else if(targetId == "GRD040" || targetId == "GRD030"){
            let clsName = "red";
            if(targetId == "GRD030") {
                clsName = "yellow";
                $("#inspection_manage_pop_form").find("#ERROR_ACTION").val("SLV02").prop("selected",true);
            }else {
                $("#inspection_manage_pop_form").find("#ERROR_ACTION").val("SLV01").prop("selected",true);
            }
            $(this).addClass(clsName);
            $("#inspection_manage_grade_style").find("th").attr("style","background: #e7eef7;color: #444;");
            $("#inspection_manage_inspection_code_style").removeAttr("style","background: #e6e6e6;");
            $("#inspection_manage_pop_form").find("#INSPECT_RESULT").attr("disabled", false);
        }
    });
    $('#inspection_manage_pop_plus_btn').on('click', function(e) {
        inspectionManagePopCalcQty("PLUS");
    });
    $('#inspection_manage_pop_plus_minus').on('click', function(e) {
        inspectionManagePopCalcQty("MINUS");
    });

    let inspectionManagePopCalcQty = function(type){

        let POP_ORDER_QTY = $('#inspection_manage_pop_form').find('#ORDER_QTY').val();//입고수량
        let POP_ERROR_QTY = $('#inspection_manage_pop_form').find('#ERROR_QTY').val();//입고수량

        if(type == "PLUS"){
            if(parseInt(POP_ORDER_QTY) >  parseInt(POP_ERROR_QTY)) {
                POP_ERROR_QTY = parseInt(POP_ERROR_QTY) + 1;
            }
        }else if(type == "MINUS"){
            if(parseInt(POP_ERROR_QTY) >  0){
                POP_ERROR_QTY = parseInt(POP_ERROR_QTY)-1;
            }
        }
        $('#inspection_manage_pop_form').find('#ERROR_QTY').val(POP_ERROR_QTY);
        $('#inspection_manage_pop_form').find('#ERROR_QTY_VIEW').html(POP_ERROR_QTY);
    }

    function planDetailPopImgDiv() {
        const parameter2 = {'url': '/tv/json-list', 'data': {
                'queryId':'tvMapper.selectMctPlanListForDetailPop',
                'EQUIP_SEQ':$("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val()
            }
        };
        fnPostAjax(function (data) {
            $(".planImgDiv").empty();
            let totalQty = 0;
            let totalTime = 0;
            if(data.list.length > 0) {
                $.each(data.list, function (idx, Item) {
                    totalQty += Number(Item.SUM_QTY);
                    totalTime += Number(Item.PLAN_WORKING_TIME);
                    let html = '<div class="mctInfoWrap machine_plan_draw" data-value="'+Item.MCT_PLAN_SEQ+'">';
                    html += '		<div class="mctMapImg">';
                    html += '			<img src="/qsimage/'+ Item.IMG_GFILE_SEQ+'">';
                    html += '			<div class="mctMapTime">';
                    html += '				<span class="text-red left_float">'+Item.INNER_DUE_DT +'</span>'
                    html += '				<span class="text-blue right_float">'+ Item.PLAN_WORKING_TIME_FORMAT +'</span>'
                    html += '			</div>'
                    html += '			<p>'+ Item.WORK_TYPE_MATERIAL + '</p>'
                    html += '			<p>'+ Item.QTY + '</p>'
                    html += '		</div>'
                    html += '</div>'

                    $(".planImgDiv").append(html);
                });
            }else {
                $(".planImgDiv").append('<div style="text-align: center;margin-top: 8%;font-size: 1.8rem;">No Data</div>');
            }
            $("#total_cnt_qty").text(data.list.length + " 품 " + totalQty + " EA");
            $("#total_plan_time").text("( "+ timeFormat(totalTime) + " )");
        }, parameter2, '');
    }

    function settingRightTable(data) {
        $("#popHeadMid4").find(".val_text").text("");
        $("#popHeadMid4").find("#ongoing_work_input").val("");
        if(data.info != null) {
            $("#mct_plan_detail_pop_form").find("#MCT_WORK_SEQ").val(data.info.MCT_WORK_SEQ);
            $("#mct_plan_detail_pop_form").find("#MCT_PLAN_SEQ").val(data.info.MCT_PLAN_SEQ);
            $("#mct_plan_detail_pop_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
            $("#mct_plan_detail_pop_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
            for(let key in data.info){
                let val = data.info[key];
                if(key == 'PLAN_WORKING_TIME') {
                    $("#ongoing_work_input").val(val);
                }
                $("#popHeadMid4").find("."+key).text(val);
            }
            if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
                $("#mct_plan_pop_img").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
                $("#mct_plan_pop_img").attr('alt', data.info.IMG_GFILE_SEQ);
                $("#mct_plan_pop_img").attr('data-value', data.info.IMG_GFILE_SEQ);
                $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
            }else {
                $("#mct_plan_pop_img").attr('src', '/resource/main/blank.jpg');
                $("#mct_plan_detail_pop_form").find("#GFILE_SEQ").val('');
            }
        }
    }

    $(document).ready(function(){
        $(document).on("blur","#ongoing_work_input",function(event){
            let planWorkT = $("#mct_plan_detail_pop_form").find("#ongoing_work_input").val();
            let equipSeq = $("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val();
            let mctWorkSeq = $("#mct_plan_detail_pop_form").find("#MCT_WORK_SEQ").val();
            let mctPlanSeq = $("#mct_plan_detail_pop_form").find("#MCT_PLAN_SEQ").val()
            let parameter;
            if(!fnIsEmpty(mctPlanSeq)) {
                parameter = {
                    'queryId': 'machine.updatePlanListForDetailPop',
                    'EQUIP_SEQ': equipSeq,
                    'MCT_PLAN_SEQ':  mctPlanSeq,
                    'WORKING_TIME': planWorkT
                };
            }else if(!fnIsEmpty(mctWorkSeq)) {
                parameter = {
                    'queryId': 'machine.updateOngoingWorkingTime',
                    'EQUIP_SEQ': equipSeq,
                    'MCT_WORK_SEQ':  mctWorkSeq,
                    'PLAN_WORKING_TIME': planWorkT
                };
            }
            var onlyNum = /[^0-9]/g;
            if(!onlyNum.test(planWorkT) && !fnIsEmpty(parameter)) {
                let parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    let planWorkingTime = $("#mct_plan_detail_pop_form").find("#ongoing_work_input").val();
                    $("#mct_plan_detail_pop_form").find("#ongoing_work_input").val(planWorkingTime);
                    planDetailPopImgDiv();
                }, parameters, '');
            }else {
                fnAlert("","숫자만 입력가능합니다.")
            }
        })

        $(document).on("click",".machine_plan_draw",function(e){
            $(".machine_plan_draw").removeClass("bg_mct_green");
            $(this).addClass("bg_mct_green");

            const parameter2 = {'url': '/tv/json-info', 'data': {
                    'queryId':'tvMapper.selectMctPlanListForDetailPop',
                    'EQUIP_SEQ':$("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val(),
                    'MCT_PLAN_SEQ':$(this).data('value')
                }
            };
            fnPostAjax(function (data) {
                settingRightTable(data);
            }, parameter2, '');
        })

        $(document).on("click",".machine_current_draw",function(e){
            $(".machine_plan_draw").removeClass("bg_mct_green");
            const parameter2 = {'url': '/tv/json-info', 'data': {
                    'queryId':'tvMapper.selectMctOngoingInfoForDetailPop',
                    'EQUIP_SEQ':$("#mct_plan_detail_pop_form").find("#EQUIP_SEQ").val()
                }
            };
            fnPostAjax(function (data) {
                settingRightTable(data);
            }, parameter2, '');
        });
    });


</script>