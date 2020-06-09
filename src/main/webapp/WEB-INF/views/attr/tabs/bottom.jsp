<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                        <button type="button" class="defaultBtn radius blue right_float" id="cadFileConvertUploadCompletedBtn">Save</button>
                    </div>
                    <div id="common_cad_file_attach_grid" style="margin:auto;"></div>
                    <div class="right_sort fileTableInfoWrap">
                        <h4>전체 조회 건수 (Total : <span id="cadFileUploadTotalCount" style="color: #00b3ee">0</span>)</h4>
                    </div>
                    <div class="fileTableWrap">
                        <table class="colStyle" id="attachDragAndDrop" >
                            <caption></caption>
                            <thead>
                            <tr>
                                <th scope="col" class="fileName txt">파일명</th>
                                <th scope="col" class="etcInfo">용량</th>
                                <th scope="col" class="etcInfo"></th>
                            </tr>
                            </thead>
                            <tbody class="files"></tbody>
                        </table>
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
<div class="modal" id="common_file_download_upload_pop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg cadDrawing">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="headerTitle_01">다운로드</h2>
            </div>
            <div class="modal-body" id="commonFileUpdatePop">
                <form class="" role="form" id="common_file_download_form" name="common_file_download_form">
                    <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
                    <input type="hidden" id="callElement" name="callElement" value="">
                    <input type="hidden" id="deleteYn" name="deleteYn" value="">
                    <div id="common_file_download_upload_grid" style="margin:auto;"></div>
                    <div class="right_sort fileTableInfoWrap">
                        <h4>전체 조회 건수 (Total : <span id="filedownloadTotalCount" style="color: #00b3ee">0</span>)</h4>
                    </div>
                </form>
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
<div class="cadDrawingPrint" style="display: none; height: 1px;"></div>
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
<!-- 제품상세정보 layer popup : S -->
<div class="popup_container g_item_detail_pop" id="g_item_detail_pop" style="display: none;">
    <form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInfo"/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
<%--        <input type="hidden" id="CAM_INFO_YN" name="CAM_INFO_YN" value=""/>--%>
        <div class="layerPopup">
            <h3>제품상세정보</h3>
            <button type="button" class="pop_close mg-top10 mg-right8" id="popClose2">닫기</button>
<%--            <span class="right">--%>
<%--                <span class="barCode" ><img src="/resource/asset/images/common/img_barcode.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>--%>
<%--                <span class="barCodeTxt" >&nbsp;<input type="text" class="wd_270_barcode" style="height: 39px;" name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>--%>
<%--            </span>--%>
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
                       <span class="barCode" ><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>
                      <span class="barCodeTxt" >&nbsp;<input type="text" class="wd_270_barcode hg_30"  name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>
                    </ul>
                 </div>
                <h4>기본정보</h4>
                <div class="list1">
                    <table class="rowStyle" style="table-layout: fixed;">
                        <colgroup>
                            <col width="10%">
                            <col width="16%">
                            <col width="10%">
                            <col width="16%">
                            <col width="10%">
                            <col width="16%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td id="CONTROL_NUM" class="red"></td>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM" class="red"></td>
                            <th>납기</th>
                            <td id="INNER_DUE_DT"></td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td id="ITEM_NM"></td>
                            <th >모듈</th>
                            <td id="MODULE_NM" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
                            <th>수량(원칭,대칭)</th>
                            <td id="ORDER_QTY_INFO"></td>
                        </tr>
                        <tr>
                            <th>규격</th>
                            <td id="SIZE_TXT"></td>
                            <th>소재Size</th>
                            <td id="MATERIAL_SIZE_TXT" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
                            <th>가공형태</th>
                            <td id="WORK_TYPE_NM"></td>
                        </tr>
                        <tr>
                            <th>소재종류</th>
                            <td id="MATERIAL_DETAIL_NM"></td>
                            <th>후처리</th>
                            <td id="SURFACE_TREAT_NM"></td>
                            <th>소재주문상태</th>
                            <td id="MATERIAL_ORDER_STATUS_NM"></td>
                        </tr>
                        <tr>
                            <th>진행상태</th>
                            <td id="PART_STATUS_NM"></td>
                            <th>도면수정Rev.</th>
                            <td id="DRAWING_VER"></td>
                            <th>도면파일</th>
                            <td id="DXF_GFILE_SEQ"></td>
                        </tr>
                        <tr>
                            <th>발주업체</th>
                            <td id="ORDER_COMP_NM"></td>
                            <th>설계자</th>
                            <td id="DESIGNER_NM"></td>
                            <th>외주여부/업체</th>
                            <td id="OUTSIDE_INFO_OUTSIDE_COMP_NM"></td>
                        </tr>
                        <tr>
                            <th>확정일자</th>
                            <td id="CONTROL_CONFIRM_DT"></td>
                            <th>출고일자</th>
                            <td id="OUT_FINISH_DT"></td>
                            <th>과거수행경험</th>
                            <td id="WORK_HISTORY_INFO"></td>
                        </tr>

                    </table>
                </div>

                <div class="listdiv">
                    <div class="tableWrap" >
                        <ul class="conWrapPop60">
                            <h4>가공이력</h4>
                            <span class="slt_wrap namePlusSlt rightName" >
                                <label for="g_item_detail_pop_grid_01_info_1">총시간</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_1" class="wd_50" title="총시간">
                                <label for="g_item_detail_pop_grid_01_info_2">선반</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_2" class="wd_50" title="선반">
                                <label for="g_item_detail_pop_grid_01_info_3">NC</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_3" class="wd_50" title="NC">
                                <label for="g_item_detail_pop_grid_01_info_4">밀링</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_4" class="wd_50" title="밀링">
                                <label for="g_item_detail_pop_grid_01_info_5">연마</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_5" class="wd_50" title="연마">
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
                    <div class="tableWrap" >
                        <ul class="conWrapPop60">
                            <h4>공유사항</h4>
                            <div id="g_item_detail_pop_grid_03" class="jqx-refresh"></div>
                        </ul>
                        <ul class="conWrapPop40">
                            <h4>CAM작업이력 <span style="color:#7d1919" id="g_item_detail_pop_grid_04_info1"></span></h4>
                            <span class="slt_wrap namePlusSlt rightName" >
                                <label for="g_item_detail_pop_grid_04_info2">Update</label>
                                <input type="text" id="g_item_detail_pop_grid_04_info2" class="wd_150" title="">
                            </span>
                            <div id="g_item_detail_pop_grid_04" class="jqx-refresh"></div>
                        </ul>
                    </div>
                </div>
                <h4>품질사항</h4>
                <div class="list4">
                    <div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>
                </div>
            </div>
            <div class="btnWrap">
<%--                <button type="button" class="defaultBtn purple work_info_area" id="g_item_cam_work_start_btn" style="display: none;">CAM 작업시작</button>--%>
                <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close">닫기</button>
            </div>
        </div>
    </form>
</div>
<!-- 제품상세정보 layer popup : E -->
<script type="text/javascript">

    let $cadFileConvertUploadCompletedBtn = $("#cadFileConvertUploadCompletedBtn");
    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let commonConfirmPopup = $("#common_confirm_popup");
    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadFileAttachObj;
    let $commonCadFileAttachGrid;
    let empty_data = [];

    let commonFileDownUploadPopup = $("#common_file_download_upload_pop");
    let commonFileDownUploadGridId = "common_file_download_upload_grid";
    let commonFileDownUploadGrid = $("#common_file_download_upload_grid");

    let g_ItemDetailPopGrid04;
    // let $camWorkManagePopGrid;

    $(function() {
        'use strict';

        /** 캐드 파일 업로드 시작 스크립트 **/
        let estimateCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 1, minWidth: 70},
            {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ', hidden: true, width: 1, minWidth: 70},
            {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 1, minWidth: 70},
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden: true, width: 1, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '견적번호', datatype: 'string', dataIndx: 'EST_NUM', width: 155, minWidth: 100},
            {title: '차수', align: 'center', dataType: 'string', dataIndx: 'EST_VER', width: 50, minWidth: 50},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100}
        ];

        let controlCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            {title: 'Part', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50}
        ];

        let controlCadRevFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 200, minWidth: 100},
            {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 125, minWidth: 100},
            {title: 'Part', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            {title: '규격', align: 'center', dataType: 'string', dataIndx: 'SIZE_TXT', width: 155, minWidth: 100},
            {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50},
            {title: '변경일자', align: 'center', dataType: 'string', dataIndx: 'DRAWING_UP_DT', width: 100, minWidth: 50}
        ];

        let insideStockCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: 'NEW_DRAWING_NUM', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '재고번호', datatype: 'string', dataIndx: 'INSIDE_STOCK_NUM', width: 155, minWidth: 100},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100}
        ];

        commonCadFileAttachObj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            editable : false,
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: controlCadFileColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 5},
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
                uploadControlFiles = [];    // 파일 업로드 정보 초기화
                $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                fnFormDataFileUploadAjax(function (data) {
                    let fileUploadDataList = data.fileUploadDataList;
                    if (fileUploadDataList.length <= 0) {
                        alert("주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
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

                    $("#successCntHtml").html(data.successCount);
                    $("#errorCntHtml").html(data.errorCount);

                    if (!(data.fileUploadList == undefined) && !(data.fileUploadList == null)) {
                        let fileHtml = '';
                        $.each(data.fileUploadList, function (index, file) {
                            let sizeHtml = fn_getFileSize(file.DXF_GFILE_SIZE);
                            fileHtml = fileHtml +
                                '<tr>' +
                                '   <td scope="col" class="fileName">'+file.ORGINAL_FILE_NM+'</td>' +
                                '   <td scope="col" class="etcInfo">'+sizeHtml+'</td>' +
                                '   <td scope="col" class="etcInfo">' +
                                '       <button type="button" class="smallBtn red"><i class="fa fa-trash"></i><span id="spanFileUploadDelete" gfileSeq="'+file.DXF_GFILE_SEQ+'"> Delete </span></button>'+
                                '   </td>' +
                                '</tr>';
                        });
                        clearCadFileAttachPopup(fileHtml);
                    }
                }, formData, '/uploadControlCadFiles');
            }
        });

        $cadFileConvertUploadCompletedBtn.on('click', function(){
            let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            changes.queryIdList = {
                'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
            };
            $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
            let parameters = { 'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
            fnPostAjax(function (data, callFunctionParam) {
                fnAlertMessageAutoClose('save');
                $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                clearCadFileAttachPopup(getCadUploadBlankHtml());
            }, parameters, '');
        });

        $('#attachDragAndDrop > tbody').on( 'click', 'td', function (e) {
            if($(this).find("span").attr("id") == "spanFileUploadDelete"){
                var dxfGfileSeq = $(this).find("span").attr("gfileSeq");
                // 삭제 처리
                var gridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data')
                var delKdys = [];
                $.each(gridData, function (key, rowData) {
                    if (rowData.DXF_GFILE_SEQ == dxfGfileSeq) {
                        delKdys.push({'rowIndx': rowData});
                    }
                });
                $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: delKdys});
                $commonCadFileAttachGrid.pqGrid('refresh');
                $('#attachDragAndDrop > tbody').find('tr').eq($(this).parent().index()).remove();
                if($('#attachDragAndDrop > tbody').find('tr').length == 0) {
                    clearCadFileAttachPopup(getCadUploadBlankHtml());
                }
            }
        });

        commonCadFileAttachPopup.on('show.bs.modal',function(e) {
            var actionType = $('#common_cad_file_attach_form').find('#actionType').val();
            $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면 등록');
            if(actionType == 'estimate') {          // 견적 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            }else if(actionType == 'control') {     // 주문 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadFileColModel);
            }else if(actionType == 'controlRev') {  // 주문 도면 차수 변경
                $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면 차수 변경');
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadRevFileColModel);
            }else if(actionType == 'inside') {      // 자재 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', insideStockCadFileColModel);
            }
            $commonCadFileAttachGrid.pqGrid('refresh');
        });

        commonCadFileAttachPopup.on('hide.bs.modal',function(e) {
            uploadControlFiles = [];
            $commonCadFileAttachGrid.pqGrid('destroy');

        });

    });

    function callCadDrawingUploadPopup(actionType, queryId) {
        $('#common_cad_file_attach_form').find('#actionType').val(actionType);
        $('#common_cad_file_attach_form').find('#queryId').val(queryId);
        clearCadFileAttachPopup(getCadUploadBlankHtml());
        setTimeout(function() {
            commonCadFileAttachPopup.modal('show');
        }, 200);
    }

    function getCadUploadBlankHtml(){
        return'<tr><td colspan="3" class="spanArea" >마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
    }

    function clearCadFileAttachPopup(fileHtml){
        $('#attachDragAndDrop > tbody').html('');
        $('#attachDragAndDrop > tbody').append(fileHtml).trigger('create');
    }
    /** 캐드 파일 업로드 종료  스크립트 **/

    /** 파일 다운로드 시작 스크립트 **/
    let commonFileDownUploadModel =  [
        {title: 'GFILE_SEQ', dataType: 'string', dataIndx: 'GFILE_SEQ', hidden: true},
        {title: '파일명', dataType: 'string', dataIndx: 'ORGINAL_FILE_NM', width: 400, minWidth: 70,
            render: function(ui) {
                let returnVal = ui.cellData;
                if(ui.rowData.FILE_SEQ != undefined){
                    returnVal += '<span id=\"downloadSingleFile\" class=\"ui-icon ui-icon-search\" style=\"cursor: pointer\"></span>';
                }
                return returnVal;
            },
            postRender: function (ui) {
                let grid = this,
                    $cell = grid.getCell(ui);
                $cell.find("#downloadSingleFile").bind("click", function () {
                    let rowData = ui.rowData;
                    alert(rowData.FILE_SEQ);
                    fnSingleFileDownloadFormPageAction(rowData.FILE_SEQ);
                });
            }
        },
        {title: '용량', dataType: 'string', dataIndx: 'FILE_SIZE',  width: 1, minWidth: 70,
            render: function(ui) {
                return fn_getFileSize(ui.rowData.FILE_SIZE);
            }

        },
        {title: '업로드 일시', dataType: 'string', dataIndx: 'INSERT_DT',  width: 120, minWidth: 70},
        {title: '', align: 'center', dataType: 'string', dataIndx: 'FILE_SEQ', width: 70, minWidth: 100,
            render: function (ui) {
                let deleteYn = $("#common_file_download_form #deleteYn").val();
                let returnVal = "";
                if (ui.cellData) {
                    console.log(eval(deleteYn));
                    if(eval(deleteYn)) returnVal = '<span id="deleteSingleFile" class="ui-icon ui-icon-close" style="cursor: pointer"></span>';
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
                        fnRequestGidData(commonFileDownUploadGrid, postData);
                    }, parameters, '');
                });
            }
        }
    ];

    let commonFileDownUploadObj = {
        height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
        selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
        editable : false,
        scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
        columnTemplate: { align: 'center', halign: 'center', hvalign: 'center' }, //to vertically center align the header cells.
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
        fnRequestGidData(commonFileDownUploadGrid, postData);
    });

    commonFileDownUploadPopup.on('hide.bs.modal', function (e) {
        commonFileDownUploadGrid.pqGrid('destroy');
        $("#common_file_download_form #deleteYn").val(true);
        let callElement = $("#common_file_download_form").find("#callElement").val();
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
                    alert("주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                    return false;
                }
                let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GFILE_SEQ };
                fnRequestGidData(commonFileDownUploadGrid, postData);
                $("#common_file_download_form").find("#GFILE_SEQ").val(GFILE_SEQ);
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
        {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM', width: 95, editable: false},
        {title: '기기명', dataType: 'string', dataIndx: 'EQUIP_NM', width: 95, editable: false},
        {title: '진행상태', dataType: 'string', dataIndx: 'WORK_STATUS', width: 95, editable: false},
        {title: '시작', dataType: 'string', dataIndx: 'WORK_START_DT', width: 95, editable: false},
        {title: '종료', dataType: 'string', dataIndx: 'WORK_FINISH_DT', width: 95, editable: false},
        {title: '소요시간', dataType: 'string', dataIndx: 'WORKING_TIME', width: 95, editable: false},
        {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 95, editable: false},
        {title: '수량', dataType: 'string', dataIndx: 'FINISH_QTY', width: 95, editable: false},
        {title: '불량', dataType: 'string', dataIndx: 'ERROR_QTY', width: 95, editable: false}
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
        columnTemplate: {align: 'center', hvalign: 'center'},
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
        columnTemplate: {align: 'center', hvalign: 'center'},
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
        columnTemplate: {align: 'center', hvalign: 'center'},
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
        {title: 'Step', dataType: 'string', dataIndx: 'CAM_SEQ', width: 95, editable: false},
        {title: '작업위치', dataType: 'string', dataIndx: 'WORK_DIRECTION', width: 95, editable: false},
        {title: '작업내용', dataType: 'string', dataIndx: 'WORK_DESC', width: 95, editable: false},
        {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER_NM', width: 95, editable: false},
        {title: '파일', dataType: 'string', dataIndx: 'CAM_GFILE_SEQ', width: 95, editable: false}
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
        strNoRows: g_noData,
        columnTemplate: {align: 'center', hvalign: 'center'},
        scrollModel: {autoFit: true},
        numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
        selectionModel: { type: 'row', mode: 'single'} ,
        swipeModel: {on: false},
        showTitle: false,
        collapsible: false,
        resizable: false,
        trackModel: {on: true},
        colModel: g_ItemDetailPopColModel04
    };

    let g_ItemDetailPopGridId05 =  $("#g_item_detail_pop_grid_05");
    let g_ItemDetailPopColModel05 = [
        {title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
        {title: '작성자', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 95, editable: false},
        {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', width: 95, editable: false},
        {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT', width: 95, editable: false},
        {title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 95, editable: false},
        {title: '수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY', width: 95, editable: false},
        {title: '불량코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95, editable: false},
        {title: '상세및비고', dataType: 'string', dataIndx: 'Q_INSPECT_DESC', width: 95, editable: false},
        {title: '원인', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM', width: 95, editable: false},
        {title: '조치', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM', width: 95, editable: false},
        {title: '조치방안', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', width: 95, editable: false},
        {title: '작성일자', dataType: 'string', dataIndx: 'Q_DT', width: 95, editable: false}
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
        columnTemplate: {align: 'center', hvalign: 'center'},
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

    let g_item_detail_pop_view = function(CONTROL_SEQ, CONTROL_DETAIL_SEQ){

        // 작업 worker 지정은 협의 필요
        // fnCommCodeDatasourceSelectBoxCreate($("#g_item_detail_pop_form").find("#CAM_WORK_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});

        $("#g_item_detail_pop_form").find("#CONTROL_SEQ").val(CONTROL_SEQ);
        $("#g_item_detail_pop_form").find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);

        $('#g_item_detail_pop').modal('show');

        //기본정보
        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfo');
        let parameters = {
            'url': '/json-info',
            'data': fnFormToJsonArrayData('g_item_detail_pop_form')
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;
            if(dataInfo == null ) {
                fnResetFrom("g_item_detail_pop_form");
                $("#g_item_detail_pop_form").find(".list1").find(".rowStyle").find("td").html('');
            }else{
                //fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                $("#g_item_detail_pop_form").find("#CONTROL_NUM").html(dataInfo.CONTROL_NUM);
                $("#g_item_detail_pop_form").find("#DRAWING_NUM").html(dataInfo.DRAWING_NUM);
                $("#g_item_detail_pop_form").find("#INNER_DUE_DT").html(dataInfo.INNER_DUE_DT);

                $("#g_item_detail_pop_form").find("#ITEM_NM").html(dataInfo.ITEM_NM);
                $("#g_item_detail_pop_form").find("#MODULE_NM").html(dataInfo.MODULE_NM).trigger('create');
                $("#g_item_detail_pop_form").find("#ORDER_QTY_INFO").html(dataInfo.ORDER_QTY_INFO);

                $("#g_item_detail_pop_form").find("#SIZE_TXT").html(dataInfo.SIZE_TXT);
                $("#g_item_detail_pop_form").find("#MATERIAL_SIZE_TXT").html(dataInfo.MATERIAL_SIZE_TXT);
                $("#g_item_detail_pop_form").find("#WORK_TYPE_NM").html(dataInfo.WORK_TYPE_NM);

                $("#g_item_detail_pop_form").find("#MATERIAL_DETAIL_NM").html(dataInfo.MATERIAL_DETAIL_NM);
                $("#g_item_detail_pop_form").find("#SURFACE_TREAT_NM").html(dataInfo.SURFACE_TREAT_NM);
                $("#g_item_detail_pop_form").find("#MATERIAL_ORDER_STATUS_NM").html(dataInfo.MATERIAL_ORDER_STATUS_NM);

                $("#g_item_detail_pop_form").find("#PART_STATUS_NM").html(dataInfo.PART_STATUS_NM);
                $("#g_item_detail_pop_form").find("#DRAWING_VER").html(dataInfo.DRAWING_VER);

                let filedownlod = "<button type='button' class='smallBtn red' onclick=\"javascript:fnSingleFileDownloadFormPageAction('" + dataInfo.DXF_GFILE_SEQ + "');\"><i class='fa fa-trash'></i><span >다운로드</span></button>";

                $("#g_item_detail_pop_form").find("#DXF_GFILE_SEQ").html(filedownlod);

                $("#g_item_detail_pop_form").find("#ORDER_COMP_NM").html(dataInfo.ORDER_COMP_NM);
                $("#g_item_detail_pop_form").find("#DESIGNER_NM").html(dataInfo.DESIGNER_NM);
                $("#g_item_detail_pop_form").find("#OUTSIDE_INFO_OUTSIDE_COMP_NM").html(dataInfo.OUTSIDE_INFO);

                $("#g_item_detail_pop_form").find("#CONTROL_CONFIRM_DT").html(dataInfo.CONTROL_CONFIRM_DT);
                $("#g_item_detail_pop_form").find("#OUT_FINISH_DT").html(dataInfo.OUT_FINISH_DT);
                $("#g_item_detail_pop_form").find("#WORK_HISTORY_INFO").html(dataInfo.WORK_HISTORY_INFO);

                /** CAM 작업 여부에 따른 버튼 표시 **/
                // if(dataInfo.CAM_STATUS == "CWS010" || dataInfo.CAM_STATUS == "CWS030"){ <!-- 대기 중일때 처리 -->
                //     $('.work_info_area').show();
                // }else{
                //     $('.work_info_area').hide();
                // }
            }
        }, parameters, '');

        //가공이력 정보
        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfo2');
        let parameters2 = {
            'url': '/json-info',
            'data': fnFormToJsonArrayData('g_item_detail_pop_form')
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;
            if(dataInfo == null ) {
                fnResetFrom("g_item_detail_pop_form");
            }else{
                //fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_01_info_1").html(dataInfo.WORK_TIME_TOTAL);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_01_info_2").html(dataInfo.WORK_TIME_MPR040);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_01_info_3").html(dataInfo.WORK_TIME_MPR010);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_01_info_4").html(dataInfo.WORK_TIME_MPR020);
                $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_01_info_5").html(dataInfo.WORK_TIME_MPR030);
            }
        }, parameters2, '');

        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
        g_ItemDetailPopObj01.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
        g_ItemDetailPopGridId01.pqGrid(g_ItemDetailPopObj01);

        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid2');
        g_ItemDetailPopObj02.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
        g_ItemDetailPopGridId02.pqGrid(g_ItemDetailPopObj02);

        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid3');
        g_ItemDetailPopObj03.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
        g_ItemDetailPopGridId03.pqGrid(g_ItemDetailPopObj03);

        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid4');
        g_ItemDetailPopObj04.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
        g_ItemDetailPopGrid04 = g_ItemDetailPopGridId04.pqGrid(g_ItemDetailPopObj04);

        $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid5');
        g_ItemDetailPopObj05.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
        g_ItemDetailPopGridId05.pqGrid(g_ItemDetailPopObj05);

        let data4 = g_ItemDetailPopGrid04.pqGrid('option', 'dataModel.data');
        console.log(data4);
        console.log(g_ItemDetailPopGrid04);
        if(data4 != null){
            setTimeout(function() {
                let rowDataArray = g_ItemDetailPopGrid04.pqGrid('getRowData', {rowIndx: 0});
                if(rowDataArray != null){
                     $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html(rowDataArray.STATUS_INFO);
                     $("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").val(rowDataArray['UPDATE_TIME_INFO']);
                }
            }, 2000);
        }

        $("#g_item_detail_pop_form").find("#g_item_detail_pop_barcode_num").focus();
    }
    $("#g_item_detail_pop").on('hide.bs.modal', function(){
        fnResetFrom("g_item_detail_pop_form");
        g_ItemDetailPopGridId01.pqGrid('destroy');
        g_ItemDetailPopGridId02.pqGrid('destroy');
        g_ItemDetailPopGridId03.pqGrid('destroy');
        g_ItemDetailPopGridId04.pqGrid('destroy');
        g_ItemDetailPopGridId05.pqGrid('destroy');
    });

    $("#g_item_detail_pop_form").find('#g_item_detail_pop_grid_05_pop_close, #popClose2').on('click', function () {
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

    $("#g_item_detail_pop_barcode_num").on({
        focus: function () {
            $("#g_item_detail_pop_barcode_img").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
        },
        blur: function () {
            $("#g_item_detail_pop_barcode_img").attr("src","/resource/asset/images/common/img_barcode_long.png");
        },
        keyup: function (e) {
            if (e.keyCode == 13) {
                //0. 바코드 정보 가져오기
                let data = {'queryId': "common.selectControlBarcodeInfo",'BARCODE_NUM': this.value};
                let parameters = {'url': '/json-info','data': data};
                fnPostAjax(function (data, callFunctionParam) {
                    let dataInfo = data.info;
                    if(dataInfo == null ) {
                        alert("해당 바코드가 존재하지 않습니다.");
                        return;
                    }else{
                        let CONTROL_SEQ =  dataInfo.CONTROL_SEQ;
                        let CONTROL_DETAIL_SEQ =  dataInfo.CONTROL_DETAIL_SEQ;
                        g_item_detail_pop_view(CONTROL_SEQ,CONTROL_DETAIL_SEQ);
                    }
                }, parameters, '');
            }
        }
    });

    /**  공통 제품상세 정보  끝 **/


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
</script>