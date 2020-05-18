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
</form>
<!-- CAD 도면 업로드 공통 Start -->
<div class="modal" id="common_cad_file_attach_pop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg cadDrawing">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="headerTitle_01">도면 등록</h2>
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
                        <table class="colStyle mg-top20" id="attachDragAndDrop" >
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
<div class="modal" id="common_file_download_pop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg cadDrawing">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="headerTitle_01">다운로드</h2>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="common_file_download_form" name="common_file_download_form">
                    <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
                    <div id="common_file_download_grid" style="margin:auto;"></div>
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
<div class="modal" id="common_drawing_print_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog cadDrawing" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close drawingPrintCloseBtn" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title">출력 정보</h2>
            </div>
            <div class="modal-body">
                <div><h4><img style='width: 32px; height: 32px;' src='/resource/main/images/print.png'>&nbsp;&nbsp;<span id="drawingPrintMessageHtml">32 건의 바코드 도면이 출력 됩니다.</span> 진행하시겠습니까?</h4></div>
            </div>
            <div class="modal-footer">
                <button type="button" id="drawingPrintActionBtn" class="defaultBtn radius blue">출력</button>
                <button type="button" class="defaultBtn radius drawingPrintCloseBtn" data-dismiss="modal">아니오</button>
            </div>
        </div>
    </div>
</div>
<div class="cadDrawingPrint" style="display: none; height: 1px;"></div>
<!-- 인쇄 div end -->
<script type="text/javascript">

    let $cadFileConvertUploadCompletedBtn = $("#cadFileConvertUploadCompletedBtn");
    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let commonDrawingPrintPopup = $("#common_drawing_print_popup");
    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadFileAttachObj;
    let $commonCadFileAttachGrid;
    let empty_data = [];

    let commonFileDownloadPopup = $("#common_file_download_pop");
    let commonFileDownloadGridId = "common_file_download_grid";
    let $commonFileDownloadGrid;

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
            if(actionType == 'estimate') {          // 견적 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            }else if(actionType == 'control') {     // 주문 도면 등록
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadFileColModel);
            }else if(actionType == 'controlRev') {  // 주문 도면 차수 변경
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

    function setEstiMatePopup(actionType, queryId) {
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
    let commonFileDownloadModel =  [
        {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 1, minWidth: 70},
        {title: 'FILE_SEQ', dataType: 'string', dataIndx: 'FILE_SEQ', hidden: true, width: 1, minWidth: 70},
        {title: '파일명', dataType: 'string', dataIndx: 'NEW_DRAWING_NUM', hidden: true, width: 1, minWidth: 70},
        {title: '용량', dataType: 'string', dataIndx: 'SEQ', hidden: true, width: 1, minWidth: 70},
        {title: '파일 타입', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        {title: '다운로드', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100}
    ];

    let commonFileDownloadObj = {
        height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
        selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
        editable : false,
        scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
        columnTemplate: { align: 'center', halign: 'center', hvalign: 'center' }, //to vertically center align the header cells.
        colModel: commonFileDownloadModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: {queryId: 'common.selectGfileFileListInfo', 'GFILE_SEQ': $("#common_file_download_form").find("#GFILE_SEQ").val()},
            recIndx: 'ROWNUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data || []};
            }
        },
        dataReady: function (event, ui) {
            let data = $commonFileDownloadGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            $('#filedownloadTotalCount').html(totalRecords);
        },
    };

    commonFileDownloadPopup.on('show.bs.modal',function(e) {
        $commonFileDownloadGrid = $('#' + commonFileDownloadGridId).pqGrid(commonFileDownloadObj);
        $commonFileDownloadGrid.pqGrid('option', 'colModel', commonFileDownloadModel);
        $commonFileDownloadGrid.pqGrid('refresh');
    });

    commonFileDownloadPopup.on('hide.bs.modal',function(e) {
        $commonFileDownloadGrid.pqGrid('destroy');
    });

    let commonFileDownloadPopupCall = function(GfileKey){
        $("#common_file_download_form").find("#GFILE_SEQ").val(GfileKey);
        commonCadFileAttachPopup.modal('show');
    };
    /** 파일 다운로드 종료 스크립트 **/

    function fn_getFileSize(fileSize){
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        if (fileSize == 0) return 'n/a';
        var i = parseInt(Math.floor(Math.log(fileSize) / Math.log(1024)));
        return (fileSize  / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
    }

</script>