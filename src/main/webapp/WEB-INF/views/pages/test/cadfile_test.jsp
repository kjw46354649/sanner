<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES - CAD file Convert Testing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resource/main/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/css/animate.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/css/icon.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/css/font.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/css/app.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/main/js/calendar/bootstrap_calendar.css" type="text/css"/>
    <!--jQueryUI version >= 1.11.4 only -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <!--ParamQuery Grid css files-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.ui.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resource/plugins/waitme/waitMe.css" type="text/css"/>
    <script src='/resource/main/js/jquery.min.js'></script>
    <script src='/resource/main/js/bootstrap.js'></script>
    <script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js'></script>
    <script src='/resource/plugins/paramquery/pqgrid.min.js'></script>
    <script src='/resource/plugins/waitme/waitMe.js'></script>
    <style>
        #attachDragAndDrop{
            outline: 2px dashed #92b0b3 ;
            outline-offset:-10px;
            text-align: center;
            transition: all .15s ease-in-out;
            width: 100%;
            height: 50px;
            background-color: gray;
        }
    </style>
</head>
<body id="top">
    <div id="waitMeContainerDiv">
        <form class="" role="form" id="common_cad_file_attach_form" name="common_cad_file_attach_form" >
            <input type="hidden" id="queryId" name="queryId" value="">
            <div class="panel-body line_tit portlet-body form bg-light">
                <!-- grid table -->
                <section class="bg-light">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <header class="panel-heading">
                                    <strong> 도면 테스트</strong>
                                </header>
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="gridWrap">
                                            <div id="common_cad_file_attach_grid"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="gridWrap">
                                            <img id="cad_img_src" name="cad_img_src" src="/image/999" width="920px" class="img-fluid" alt="Responsive image">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <small># Drag and Drop file here</small>
                                    <div class="col-md-12 col-sm-12">
                                        <div id="attachDragAndDrop"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </form>
    </div>
<!-- Custom JS Script -->
<script type="text/javascript">

    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadFileAttachObj;
    let $commonCadFileAttachGrid;
    let commonCadFileAttachColModel;
    let commonCadFileAttachToolbar;
    var empty_data = [];
    var multiFileUploadBox = [];    // 임시 형태의 file upload 저장소

    var $waitMeMainContainer;

    $(function() {
        'use strict';

        $.fn.startWaitMe = function() {
            $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
        };

        $.fn.stopWaitMe = function() {
            $waitMeMainContainer.waitMe('hide');
        };

        /**
         * Normal File upload
         * */
        let fnFormDataFileUploadAjax = function (callFunction, formData, submitUrl) {
            let actionUrl = (submitUrl) ? submitUrl : '/uploadNormalFile';
            let callback = $.Callbacks();
            $.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                url: actionUrl,
                async: true,
                cache: false,
                contentType: false,
                processData: false,
                data: formData,
                timeout: 600000,
                success: function (data, textStatus, jqXHR) {
                    $(this).stopWaitMe();
                    if (textStatus === 'success') {
                        // if (data.exception === null) {
                        callback.add(callFunction);
                        callback.fire(jQuery.parseJSON(data));
                    } else {
                        alert("업로드 중 문제가 발생하였습니다. 잠시후 작업해 주십시오.");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (!(waitMeMainContainer === undefined)) $(this).stopWaitMe();
                    alert("업로드 중 문제가 발생하였습니다. 잠시후 작업해 주십시오.");
                }
            });
        };

        commonCadFileAttachObj = {
            // width: 700,
            height: 700, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', valign: 'center' //to vertically center align the header cells.
            },
            colModel: [
                {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, width: 70, minWidth: 70, colModel: []},
                {title: 'NOTE', align: 'center', dataType: 'string', dataIndx: 'MESSAGE', width: 200, minWidth: 70},
                {title: '파일명', align: 'center', dataType: 'string', dataIndx: 'UPLOAD_FILE_NM', width: 300, minWidth: 70},
                {title: 'DXF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 70, minWidth: 70,
                    render: function (ui) {
                        if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                            return "<i id='imageViewPOP' class='fa fa-file fa-2x'>&nbsp;</i>";
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
                            // console.log(rowData.IMG_GFILE_SEQ);
                            $("#cad_img_src").attr("src", "/image/" + rowData.IMG_GFILE_SEQ);
                            // callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                        });
                    }
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
                            // console.log(rowData.IMG_GFILE_SEQ);
                            $("#cad_img_src").attr("src", "/image/" + rowData.IMG_GFILE_SEQ);
                            // callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                        });
                    }
                }
            ],
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 1},
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
            e.stopPropagation();
            e.preventDefault();
            $(e.target).css({
                "background-color": "yellow",
                "outline-offset": "-20px"
            });
        }).on("dragleave", function(e) {  //드래그 요소가 나갔을때
            e.stopPropagation();
            e.preventDefault();
            $(e.target).css({
                "background-color": "gray",
                "outline-offset": "-10px"
            });
        }).on("dragover", function(e) {
            e.stopPropagation();
            e.preventDefault();
        }).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
            e.preventDefault();
            $(e.target).css({
                "background-color": "gray",
                "outline-offset": "-10px"
            });
            let cadFiles = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
            let formData = new FormData();
            for(let i = 0; i < cadFiles.length; i++) {
                let file = cadFiles[i];

                let fileName = file.name;
                let fileNameArr = fileName.split("\.");
                if(fileNameArr[1].toUpperCase() != "DXF"){
                    alert(" DXF 파일만 등록 가능합니다.");
                    return;
                }else{
                    formData.append("files", file);
                }
            }
            $(this).startWaitMe();
            fnFormDataFileUploadAjax(function (data) {
                let fileList = data.fileUploadList;
                if(fileList.length <= 0){
                    alert("파일 정보가 없습니다.");
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
                $("#cad_img_src").attr("src", "/image/999");
            }, formData, '/uploadControlCadFilesTesting');
        });

        $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);

    });

</script>
</body>
</html>