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
                <h4 class="modal-title">도면 등록</h4>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="common_cad_file_attach_form" name="common_cad_file_attach_form">
                    <input type="hidden" id="queryId" name="queryId" value="">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <!-- grid table -->
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong> 도면 업로드 상세 리스트</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div id="attachDragAndDrop" class="gridWrap">
                                                    <div id="common_cad_file_attach_grid"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadFileAttachObj;
    let $commonCadFileAttachGrid;
    let commonCadFileAttachColModel;
    let commonCadFileAttachToolbar;
    var empty_data = [];

    $(function() {
        'use strict';

        commonCadFileAttachObj = {
            // width: 700,
            height: 300, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true}, showBottom : true,
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: [
                {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, editable: false, colModel: []},
                {title: 'DXF_GFILE_SEQ', dataType: 'integer', dataIndx: 'DXF_GFILE_SEQ', hidden: true, editable: false, colModel: []},
                {title: 'DWG_GFILE_SEQ', dataType: 'integer', dataIndx: 'DWG_GFILE_SEQ', hidden: true, editable: false, colModel: []},
                {title: 'PDF_GFILE_SEQ', dataType: 'integer', dataIndx: 'PDF_GFILE_SEQ', hidden: true, editable: false, colModel: []},
                {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true, editable: false, colModel: []},
                {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE'},
                {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM'},
                {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM'},
                {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM'},
                {title: '파일명', align: 'center', dataType: 'string', dataIndx: 'FILE_NM'},
                {title: 'DXF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ'},
                {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'},
                {title: '사이즈', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SIZE'},
                {title: '삭제', align: 'center', dataType: 'string', dataIndx: 'DEL_YN'}
            ],
            toolbar: {
                cls: 'pq-toolbar-crud',
                items: [
                    {type: 'textbox', label: '첨부 파일', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'" },
                    {type: 'button', label: 'SAVE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                alert("파일 저장 처리")
                            }}
                    },
                    {type: 'button', label: 'FIND FILE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                alert("파일 추가 처리")
                            }}
                    }
                ]
            },
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 10},
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
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
                fnFormDataFileUploadAjax(function (data) {
                    let fileInfo = data.fileUploadList[0];
                    $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                    $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                }, formData, '/uploadControlCadFiles');
            }
        });

        commonCadFileAttachPopup.on('show.bs.modal',function(e) {
            $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);
        });

        commonCadFileAttachPopup.on('hide.bs.modal',function(e) {
            uploadControlFiles = [];
            $commonCadFileAttachGrid.pqGrid('destroy');
        });
    });

</script>