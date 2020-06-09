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
    <input type="hidden" id="hidden_est_seq" id="hidden_est_seq">
</form>
<div class="modal" id="common_cad_file_attach_pop" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">도면 등록11</h4>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="common_cad_file_attach_form" name="common_cad_file_attach_form">
                    <input type="hidden" id="queryId" name="queryId" value="">
                    <input type="hidden" id="actionType" name="actionType" value="">
                    <input type="hidden" id="fileGrid" name="fileGrid" value="">
                    <div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="left_float">
                                    <h3>주문 도면 리스트</h3>
                                </div>
                                <div class="right_float">
                                    <button type="button" class="defaultBtn blueGra" id="cadFileConvertUploadCompletedBtn">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="common_cad_file_attach_grid" style="margin:auto;"></div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h3>파일 업로드</h3>
                        <table class="colStyle" id="attachDragAndDrop" cellspacing='0' style="overflow: auto; height: 150px;">
                            <caption></caption>
                            <colgroup><col width="*"><col width="10%"><col width="20%"></colgroup>
                            <thead><th scope="col">파일명</th><th scope="col">용량</th><th scope="col"></th></thead>
                            <tbody class="files"></tbody>
                        </table>
                        <div style="float: right;">
                            <h2>첨부파일 개수 : 4      에러파일 : 1</h2>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    let $cadFileConvertUploadCompletedBtn = $("#cadFileConvertUploadCompletedBtn");
    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let estimateCadFileColModel;
    let controlCadFileColModel;
    let insideStockCadFileColModel;
    let commonCadFileAttachObj;
    let $commonCadFileAttachGrid;
    let commonCadFileAttachColModel;
    let commonCadFileAttachToolbar;
    var empty_data = [];

    $(function() {
        'use strict';

        estimateCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '견적번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '차수', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100}
        ];

        controlCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
            {title: 'Part', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
            {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50}
        ];

        insideStockCadFileColModel =  [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70},
            {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
            {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
            {title: '재고번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
            {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
            {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100}
        ];

        commonCadFileAttachObj = {
            height: 250, width: "100%", collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            editable : false,
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: controlCadFileColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 5},
                recIndx: 'ROWNUM',
                getData: function (dataJSON) { return {data: dataJSON.data || []}; }
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
                uploadControlFiles = [];    // 파일 업로드 정보 초기화
                $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                fnFormDataFileUploadAjax(function (data) {
                    let fileUploadDataList = data.fileUploadDataList;
                    if (fileUploadDataList.length <= 0) {
                        alert("주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                        return false;
                    }
                    // 도면 번호 없는 경우 삭제 처리
                    var gridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data')
                    var delKdys = [];
                    $.each(gridData, function (key, rowData) {
                        if (!rowData.CONTROL_NUM) {
                            delKdys.push({'rowIndx': rowData});
                        }
                    });
                    $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: delKdys});
                    // 업로드 파일의 정보를 업데이트 한다.
                    $commonCadFileAttachGrid.pqGrid('option', {editable: true});
                    $commonCadFileAttachGrid.pqGrid('addNodes', fileUploadDataList, 0);
                    $commonCadFileAttachGrid.pqGrid('option', {editable: false});
                    $commonCadFileAttachGrid.pqGrid('refresh');

                    if (!(data.fileUploadList == undefined) && !(data.fileUploadList == null)) {
                        var fileHtml = '';
                        $.each(data.fileUploadList, function (index, file) {
                            let sizeHtml = fn_getFileSize(file.DXF_GFILE_SIZE);
                            fileHtml = fileHtml +
                                '<tr>' +
                                '   <td scope="col">'+file.ORGINAL_FILE_NM+'</td>' +
                                '   <td scope="col">'+sizeHtml+'</td>' +
                                '   <td scope="col">' +
                                '       <button type="button" class="btn red"><i class="fa fa-trash"></i><span id="spanFileUploadDelete" gfileSeq="'+file.DXF_GFILE_SEQ+'"> Delete </span></button>'+
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
                let fileHtml = '<tr><td colspan="3" style="text-align: center;">마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
                clearCadFileAttachPopup(fileHtml);
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
                    let fileHtml = '<tr><td colspan="3" style="text-align: center;">마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
                    clearCadFileAttachPopup(fileHtml);
                }
            }
        });

        commonCadFileAttachPopup.on('show.bs.modal',function(e) {
            var actionType = $('#common_cad_file_attach_form').find('#type').val();
            $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);
            if(actionType == 'estimate') {
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            }else if(actionType == 'control') {
                $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            }else if(actionType == 'inside') {
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
        $('#common_cad_file_attach_form').find('#type').val(actionType);
        $('#common_cad_file_attach_form').find('#queryId').val(queryId);
        let fileHtml = '<tr><td colspan="3" style="text-align: center;">마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
        clearCadFileAttachPopup(fileHtml);
        setTimeout(function() {
            commonCadFileAttachPopup.modal('show');
        }, 200);
    }

    function clearCadFileAttachPopup(fileHtml){
        $('#attachDragAndDrop > tbody').html('');
        $('#attachDragAndDrop > tbody').append(fileHtml).trigger('create');
    }

    function fn_getFileSize(fileSize){
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        if (fileSize == 0) return 'n/a';
        var i = parseInt(Math.floor(Math.log(fileSize) / Math.log(1024)));
        return (fileSize  / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
    }

</script>