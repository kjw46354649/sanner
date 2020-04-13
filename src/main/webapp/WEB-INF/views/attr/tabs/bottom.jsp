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
                                                <div class="gridWrap">
                                                    <div id="common_cad_file_attach_grid"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div id="attachDragAndDrop" class="dropfile visible-lg">
                                                    <small>Drag and Drop file here</small>
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
            selectionModel : {type: 'row', mode: 'single'},
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: [
                {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70, colModel: []},
                // {title: 'DXF_GFILE_SEQ', dataType: 'integer', dataIndx: 'DXF_GFILE_SEQ', hidden: true, colModel: []},
                {title: 'DWG_GFILE_SEQ', dataType: 'integer', dataIndx: 'DWG_GFILE_SEQ', hidden: true, colModel: []},
                {title: 'PDF_GFILE_SEQ', dataType: 'integer', dataIndx: 'PDF_GFILE_SEQ', hidden: true, colModel: []},
                // {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true, colModel: []},
                {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
                {title: '관리번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 130, minWidth: 100},
                {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 150, minWidth: 150},
                {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 70},
                {title: '파일명', align: 'center', dataType: 'string', dataIndx: 'UPLOAD_FILE_NM', width: 155, minWidth: 70},
                {title: 'DXF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 70, minWidth: 70,
                    render: function (ui) {
                        if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                            return "<i class='fa fa-file fa-2x'>&nbsp;</i>";
                        } else{
                            return "";
                        }
                    },
                },
                {title: 'IMAGE', align: 'center', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', width: 70, minWidth: 70,
                    render: function (ui) {
                        if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                            return "<i id='imageView' class='fa fa-file-image-o fa-2x'>&nbsp;</i>";
                        } else{
                            return "";
                        }
                    },
                    postRender: function (ui) {
                        var rowIndx = ui.rowIndx,
                            grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find("#imageView").bind("click", function () {
                            var rowData = ui.rowData;
                            console.log(rowData.IMG_GFILE_SEQ);
                            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                        });
                    }
                },
                {title: '사이즈', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SIZE', width: 100, minWidth: 70},
                {title: '삭제', align: 'center', dataType: 'string', dataIndx: 'DEL_YN', width: 70, minWidth: 70,
                    render: function (ui) {
                        console.log(ui)
                        return "<button type='button' class='delete_btn'>Delete</button>";
                    },
                    postRender: function (ui) {
                        var rowIndx = ui.rowIndx, grid = this, $cell = grid.getCell(ui);
                        $cell.find("button").button({ icons: { primary: 'ui-icon-scissors'} })
                            .bind("click", function () {
                                grid.addClass({ rowIndx: ui.rowIndx, cls: 'pq-row-delete' });
                                var ans = window.confirm("Are you sure to delete row No " + (rowIndx + 1) + "?");
                                grid.removeClass({ rowIndx: rowIndx, cls: 'pq-row-delete' });
                                if (ans) {
                                    grid.deleteRow({ rowIndx: rowIndx });
                                }
                            });
                    }
                }
            ],
            toolbar: {
                cls: 'pq-toolbar-crud',
                items: [
                    {type: 'textbox', label: '첨부 파일', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'" },
                    {type: 'button', label: 'SAVE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                alert("파일 저장 처리")
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
                    let fileList = data.fileUploadList;
                    if(fileList.length <= 0){
                        alert("주문 정보가 없습니다. 주문 정보를 확인 해 주세요.");
                        return false;
                    }
                    // 도면 번호 없는 경우 삭제 처리
                    var data = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data')
                    var delKdys = [];
                    $.each(data, function(rowItme, key) {
                        if(!rowItme.CONTROL_NUM){
                            delKdys.push({'rowIndx': key});
                        }
                    });
                    $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: delKdys});
                    // 업로드 파일의 정보를 업데이트 한다.
                    $commonCadFileAttachGrid.pqGrid('option', {editable:true});
                    $commonCadFileAttachGrid.pqGrid('addNodes', fileList, 0);
                    $commonCadFileAttachGrid.pqGrid('option', {editable:false});
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