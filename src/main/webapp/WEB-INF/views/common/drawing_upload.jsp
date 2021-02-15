<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2021-02-15
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>도면 등록 상세 팝업</title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="icon" href="/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/resource/plugins/jquery-ui-1.11.4/themes/smoothness/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/main/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <!-- alertify -->
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />

    <link rel="stylesheet" type="text/css" href="/resource/asset/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/webFont.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/style.css" />

    <link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/waitme/waitMe.css" />

</head>
<body>
<div style="padding: 10px;">
    <h3 id="common_cad_file_attach_pop_title" style="font-size: 20px; font-family: 'NotoKrB'; color: #000; ">도면 등록</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
    <!-- CAD 도면 업로드 공통 Start -->
    <div>
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
            </div>
            <div class="fileTableInfoWrap right_float">
                <h4>첨부파일 개수 : <span id="successCntHtml">0</span><span class="errorInfo">에러파일 : <span id="errorCntHtml">0</span></span></h4>
            </div>
        </form>
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="cam_work_detail_close">닫기</button>
    </div>
    <!-- CAD 도면 업로드 공통 End -->
</div>

<script type="text/javascript" src="/resource/plugins/bluebird.min.js"></script>
<script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>
<script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/resource/asset/js/front.js"></script>
<!--jQuery dependencies-->
<script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<!--ParamQuery Grid js files-->
<script type="text/javascript" src="/resource/plugins/paramquery/pqgrid.min.js" ></script>
<!--ParamQuery Grid localization file (necessary since v5.2.0)-->
<script type="text/javascript" src="/resource/plugins/paramquery/localize/pq-localize-en.js"></script>
<!--Include jsZip file to support xlsx and zip export (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/jsZip-2.5.0/jszip.min.js" ></script>
<!--Include jquery.resize to support auto height of detail views in hierarchy (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/resize/jquery.resize.js" ></script>
<!--Include pqTouch file to provide support for touch devices (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/pqTouch/pqtouch.min.js" ></script>
<script type="text/javascript" src="/resource/plugins/paramquery/pqSelect/pqselect.min.js" ></script>
<script type="text/javascript" src='/resource/plugins/waitme/waitMe.js'></script>
<script type="text/javascript" class="cssdesk" src="/resource/plugins/moment-2.11.0/min/moment.min.js"></script>
<!-- alertify -->
<script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>
<script type='text/javascript'>

    let commonCadFileAttachPopup = $("#common_cad_file_attach_pop");
    let $commonCadFileAttachGrid;

    $(function() {
        'use strict';

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

    /**
     * @description Ajax Post
     * @param {function} callFunction - 리텅 Function 처리
     * @param {object} params - 호출 URL에 Parameter 정보
     * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
     */
    let fnPostAjax = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    fnAlert(null, '<srping:message key="error.common"/>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    let fnPostAjaxAsync = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            async: false,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //console.log(textStatus);
                //console.log(jqXHR);
                //console.log(errorThrown);
                //console.log('error=[' + jqXHR + ' ' + "status" + ' ' + textStatus + ' ' + "errorThrown" + errorThrown+']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    /**
     * @description Ajax Post
     * @param {function} callFunction - 리텅 Function 처리
     * @param {object} params - 호출 URL에 Parameter 정보
     * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
     */
    let fnPostAjaxSound = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    successPlay();
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    failPlay();
                    fnAlert(null, '<srping:message key="error.common"/>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                failPlay();
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    /**
     * Normal File upload
     * */
    let fnFormDataFileUploadAjax = function (callFunction, formData, submitUrl) {
        'use strict';
        let actionUrl = (submitUrl) ? submitUrl : '/uploadNormalFile';
        let callback = $.Callbacks();
        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: actionUrl,
            contentType : false,
            processData: false,
            data: formData,
            beforeSend: function (jqXHR, settings) {
              $(this).startWaitMe();
            },
            complete: function (jqXHR, textStatus) {
              $(this).stopWaitMe();
            },
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(jQuery.parseJSON(data));
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    /* form에 JsonData를 셋팅 한다.
		/* formid : form 아이디
		/* data : json return data
		*/
    let fnJsonDataToForm = function (formid, data) {
        fnResetFrom(formid);
        if(formid.indexOf("#") == -1) formid = "#"+formid;
        $.each(data, function(key, value) {
            let $ctrl = $(formid).find('[name='+key+']');
            if ($ctrl.is('select')){
                $('option', $ctrl).each(function() {
                    if (this.value == value)
                        this.selected = true;
                });
            } else if ($ctrl.is('textarea')) {
                $ctrl.val(value);
            } else {
                switch($ctrl.attr("type")) {
                    case "text":
                    case "number":
                    case "date":
                    case "password":
                    case "hidden":
                        $ctrl.val(value);
                        break;
                    case "checkbox":
                        if (value == '1' || $ctrl.val() == value)
                            $ctrl.prop('checked', true);
                        else
                            $ctrl.prop('checked', false);
                        break;
                    case 'radio':
                        $ctrl.filter('[value="' + value + '"]').attr('checked', 'checked');
                        break;
                }
            }
        });
    };

    /* form 값을 JsonData 값으로 변경하여 전달 한다.
		/* formid : form 아이디
		/* data : json return data
		*/
    let fnFormToJsonArrayData = function (formid) {
        if(formid.indexOf("#") == -1) formid = "#"+formid;
        let elementArray = {};
        let formArr = $(formid).serializeArray();
        for(let i=0; i < formArr.length; i++) {
            let tmp = formArr[i];
            let name = tmp.name;
            let value = "";
            if(name != null){
                let $ctrl = $(formid).find('[name='+name+']');
                if ($ctrl.is('select')){
                    value = $ctrl.val();
                } else if ($ctrl.is('textarea')) {
                    value = $ctrl.val();
                } else {
                    switch($ctrl.attr("type")) {
                        case "text":
                        case "number":
                        case "date":
                        case "password":
                        case "hidden":
                        case "search":
                            value = $ctrl.val();
                            break;
                        case "checkbox":
                            if($ctrl.prop('checked')) value = true;
                            else value = false;
                            break;
                        case 'radio':
                            value = $("input:radio[name=" + name + "]:checked").val();
                            break;
                    }
                }
                elementArray[name] = value;
            }
        }
        return elementArray;
    };

    /**
     *	Form reset 처리
     *	formId : form Id
     **/
    let fnResetFrom = function (formid){
        if(formid.indexOf("#") == -1) formid = $("#"+formid);
        formid.find('input[type=text], input[type=number], input[type=password], input[type=file], textarea').val('');
        formid.find('input[type=radio], input[type=checkbox]').removeAttr('checked').removeAttr('selected');
        // select box 첫번째 값이 공백이 아니면 첫번째 값으로 셋팅
        $('select', formid).each(function() {
            $(this).val($(this).prop('defaultSelected'));
            if($(this).find('option:first').val() == ''){
                $(this).val('');
            } else {
                $(this).val($(this).find('option:first').val());
            }
        });

        // hidden value가 queryId, url 제외 나머지 clear
        $('input:hidden', formid).each(function() {
            if($(this).attr("type") == "button" || $(this).attr("id") == "url" || $(this).attr("id") == "queryId"){
            }else{
                $(this).val('');
            }
        });
    }

    /**
     * @description 그리드 생성
     * @param {string} gridId
     * @param {object} postData
     * @param {object} colModel
     * @param {object} toolbar
     * @returns {object | jQuery} grid
     */
    let fnCreatePQGrid = function (gridId, postData, colModel, toolbar) {
        'use strict';
        let obj = {
            // width: 700,
            // height: 400,
            collapsible: false,
            resizable: true,
            // title: '',
            // pageModel: {type: 'remote'},
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: colModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'POST',
                url: '/paramQueryGridSelect',
                postData: postData,
                // recIndx: 'USER_ID',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                    // return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            toolbar: toolbar
        };
        return $('#' + gridId).pqGrid(obj);
    };

    /**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button or closes the dialog.
     *
     * fnAlert(null,"<h1>안녕하세요</h1>", function () {alert('확인 클릭')});
     *
     */
    const fnAlert = function (title, message, onok) {
        alertify.alert()
            .setting({
                'title': title,
                'message': message,
                'onok': onok,
                'movable': false,
                'transitionOff': true
            }).show();
    };

    /**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button.
     * @oncancel {Function} Invoked when the user clicks Cancel button or closes the dialog.
     * @autoOk {number} Automatically confirms the dialog after n seconds.
     *
     * fnConfirm(null, 'message', function() {alert('확인 클릭')}, function() {alert('취소 클릭')}, 5);
     *
     */
    const fnConfirm = function (title, message, onok, oncancel, autoOk) {
        if (autoOk == undefined || autoOk == null) {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show();
        } else {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show().autoOk(autoOk);
        }
    };

</script>
</body>
</html>
