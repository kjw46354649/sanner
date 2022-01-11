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
    <div id="waitMeContainerDiv">
        <div id="common_cad_file_attach_pop" style="padding: 10px;">
            <h3 id="common_cad_file_attach_pop_title" style="font-size: 20px; font-family: 'NotoKrB'; color: #000; ">도면 등록</h3>
            <!-- CAD 도면 업로드 공통 Start -->
            <div>
                <form class="" role="form" id="common_cad_file_attach_form" name="common_cad_file_attach_form">
                    <input type="hidden" id="queryId" name="queryId" value="${queryId}">
                    <input type="hidden" id="actionType" name="actionType" value="${actionType}">
                    <input type="hidden" id="actionUrl" name="actionUrl" value="">
                    <input type="hidden" id="fileGrid" name="fileGrid" value="">
                    <input type="hidden" id="WORK_KEY" name="WORK_KEY" value="${WORK_KEY}">
                    <div>
                        <div id="common_cad_file_attach_grid" style="margin:auto;"></div>
                        <div class="right_sort fileTableInfoWrap">
                            <h4>전체 조회 건수 (Total : <span id="cadFileUploadTotalCount" style="color: #00b3ee">0</span>)</h4>
                        </div>
                    </div>
                    <div><br></div>
                    <div>
                        <div id="attachDragAndDrop">
                            <div id="common_cad_upload_file_grid" style="margin:auto;"></div>
                            <div class="right_sort fileTableInfoWrap">
                                <h4>첨부파일 개수 : <span id="successCntHtml">0</span><span class="errorInfo ml-5">에러파일 : <span id="errorCntHtml">0</span></span></h4>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div style="text-align: center; margin: 12px 0;">
                <button type="button" class="defaultBtn greenPopGra" id="cadFileConvertUploadCompletedBtn" disabled>저장</button>
                <button type="button" class="defaultBtn grayPopGra" id="drawing_upload_close">닫기</button>
            </div>
            <!-- CAD 도면 업로드 공통 End -->
        </div>
    </div>
    <form class="" role="form" id="common_cad_reversion_control_list_form" name="common_cad_reversion_control_list_form">
        <input type="hidden" id="queryId" name="queryId" value="drawingUploadMapper.selectDrawingUploadControlRevList">
        <input type="hidden" id="WORK_KEY" name="WORK_KEY" value="${WORK_KEY}">
    </form>
    <form class="" role="form" id="common_cad_stock_form" name="common_cad_stock_form">
        <input type="hidden" id="queryId" name="queryId" value="drawingUploadMapper.selectDrawingUploadStockList">
        <input type="hidden" id="INSIDE_STOCK_SEQ_STR" name="INSIDE_STOCK_SEQ_STR" value="${INSIDE_STOCK_SEQ_STR}">
    </form>
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

    let commonCadFileAttachGridId = "common_cad_file_attach_grid";
    let commonCadUploadFileGridId = "common_cad_upload_file_grid";
    let commonCadFileAttachObj;
    let commonCadUploadFileObj;
    let $commonCadFileAttachGrid;
    let $commonCadUploadFileGrid;
    let $cadFileConvertUploadCompletedBtn = $("#cadFileConvertUploadCompletedBtn");
    var $waitMeMainContainer;

    $.fn.startWaitMe = function() {
        $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
    };

    $.fn.stopWaitMe = function() {
        $waitMeMainContainer.waitMe('hide');
    };

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
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                } else {
                    fnAlert(null, '<srping:message key="error.common"/>');
                    if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
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
                    callback.add(callFunction);
                    callback.fire(jQuery.parseJSON(data));
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

    /** 캐드 파일 업로드 시작 스크립트 **/
    let estimateCadFileColModel =  [
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 1, minWidth: 70},
        {title: 'No.', dataType: 'string', dataIndx: 'NO', width: 50, minWidth: 30},
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

    let orderCadFileColModel =  [
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 70, minWidth: 70},
        {title: 'No.', dataType: 'string', dataIndx: 'NO', width: 50, minWidth: 30},
        {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
        {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
        {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
        {title: '발주번호', align: 'center', dataType: 'string', dataIndx: 'ORDER_NUM', width: 155, minWidth: 50},
        {title: '접수번호', align: 'center', dataType: 'string', dataIndx: 'REGIST_NUM', width: 155, minWidth: 80,
            styleHead: {'font-weight': 'bold','color': 'red'}
        },
        {title: 'Rev', align: 'center', dataType: 'string', dataIndx: 'DRAWING_VER', width: 50, minWidth: 50},
        {
            title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
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
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 70, minWidth: 70},
        {title: 'No.', dataType: 'string', dataIndx: 'NO', width: 50, minWidth: 30},
        {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
        {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        // {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 150, minWidth: 100},
        {title: '작업지시번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
        {title: '파트', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
        {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
        {title: '접수번호', align: 'center', dataType: 'string', dataIndx: 'REGIST_NUM', width: 155, minWidth: 80},
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
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 70, minWidth: 70},
        {title: 'No.', dataType: 'string', dataIndx: 'NO', width: 50, minWidth: 30},
        {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 1, minWidth: 1},
        {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        // {title: '파트', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
        // {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 155, minWidth: 100},
        {title: '접수번호', align: 'center', dataType: 'string', dataIndx: 'REGIST_NUM', width: 155, minWidth: 100,
            styleHead: {'font-weight': 'bold','color': 'red'}
        },
        {title: '발주처', align: 'center', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 120, minWidth: 80},
        // {title: '발주번호', align: 'center', dataType: 'string', dataIndx: 'ORDER_NUM', width: 155, minWidth: 100},
        {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
        {title: '현재 Rev.', align: 'center', dataType: 'string', dataIndx: 'CURRENT_REV', width: 60, minWidth: 60},
        {title: '변경 Rev.', align: 'center', dataType: 'string', dataIndx: 'NEXT_REV', width: 60, minWidth: 60,
            styleHead: {'font-weight': 'bold','color': 'blue'}
        },
        // {title: '최근 변경일자', align: 'center', dataType: 'string', dataIndx: 'DRAWING_UP_DT', width: 100, minWidth: 50},
        {
            title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
            styleHead: {'font-weight': 'bold','color': 'blue'},
            render: function (ui) {
                if (ui.cellData) return 'V'
            }
        },
        {
            title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
            styleHead: {'font-weight': 'bold','color': 'blue'},
            render: function (ui) {
                if (ui.cellData) return 'V'
            }
        },
        {title: '작업지시번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
        {title: '진행상태', datatype: 'string', dataIndx: 'PART_STATUS_NM', width: 100, minWidth: 80}
    ];

    let insideStockCadFileColModel =  [
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 70, minWidth: 70},
        {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 70, minWidth: 70},
        {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        // {title: '비고', datatype: 'string', dataIndx: 'UPLOAD_MESSAGE', width: 250, minWidth: 100},
        {title: '재고번호', datatype: 'string', dataIndx: 'INSIDE_STOCK_NUM', width: 120, minWidth: 100},
        {title: '규격', align: 'center', dataType: 'string', dataIndx: 'SIZE_TXT', width: 100, minWidth: 100},
        {title: '품명', align: 'center', dataType: 'string', dataIndx: 'ITEM_NM', width: 150, minWidth: 100},
        {
            title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
            render: function (ui) {
                if (ui.cellData) {
                    let cls = "pdfGrayImageIcon";
                    if(ui.rowData.SUCCESS == 'Y') cls = "pdfBlueImageIcon";
                    return '<span class="'+ cls + '" style="cursor: pointer"></span>';
                }
            }
        },
        {
            title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
            render: function (ui) {
                if (ui.cellData) {
                    let cls = "pdfGrayImageIcon";
                    if(ui.rowData.SUCCESS == 'Y') cls = "pdfBlueImageIcon";
                    return '<span class="'+ cls + '" style="cursor: pointer"></span>';
                }
            }
        }
    ];

    let controlPartCadFileColModel =  [
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 70, minWidth: 70},
        {title: 'No.', dataType: 'string', dataIndx: 'NO', width: 50, minWidth: 30},
        {title: 'DXF_GFILE_SEQ', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', hidden: true, width: 1, minWidth: 1},
        {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true, width: 1, minWidth: 70},
        {title: '작업지시번호', datatype: 'string', dataIndx: 'CONTROL_NUM', width: 155, minWidth: 100},
        {title: '파트', align: 'center', dataType: 'string', dataIndx: 'PART_NUM', width: 50, minWidth: 50},
        {title: '도면번호', align: 'center', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 155, minWidth: 100},
        {
            title: 'CAD', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
            render: function (ui) {
                if (ui.cellData) {
                    let cls = "pdfGrayImageIcon";
                    if(ui.rowData.SUCCESS == 'Y') cls = "pdfBlueImageIcon";
                    return '<span class="'+ cls + '" style="cursor: pointer"></span>';
                }
            }
        },
        {
            title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ',
            render: function (ui) {
                if (ui.cellData) {
                    let cls = "pdfGrayImageIcon";
                    if(ui.rowData.SUCCESS == 'Y') cls = "pdfBlueImageIcon";
                    return '<span class="'+ cls + '" style="cursor: pointer"></span>';
                }
            }
        }
    ];

    commonCadFileAttachObj = {
        height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
        numberCell: {show: false}, // numberCell: {title: 'No.'},
        selectionModel : {type: 'row', mode: 'single'}, dragColumns: {enabled: false}, editable : false,
        scrollModel: {autoFit: true}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
        columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
        colModel: controlCadFileColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: {queryId: 'dataSource.emptyGrid'},
            recIndx: 'ROW_NUM',
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
        {title: 'ROW_NUM', dataType: 'string', dataIndx: 'ROW_NUM', hidden: true, width: 0, minWidth: 0},
        {title: 'UPLOAD_SEQ', dataType: 'string', dataIndx: 'UPLOAD_SEQ', hidden: true, width: 0, minWidth: 0},
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
        {title: '메시지', align: 'center', dataType: 'string', dataIndx: 'MESSAGE', width: 180, minWidth: 100},
        {title: '작업', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataType: 'string', dataIndx: 'CAM_STATUS',
            render: function (ui) {
                return '<button type="button" class="miniBtn red" id="REMOVE_CAD_FILE_UPLOAD_BTN">삭제</button>';
            },
            postRender: function (ui) {
                let grid = this;
                let $cell = grid.getCell(ui);
                let rowData = ui.rowData;
                $cell.find('#REMOVE_CAD_FILE_UPLOAD_BTN').bind('click', function(e) {
                    let commonCadFileAttachGridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data');
                    const deleteRowList = commonCadFileAttachGridData.reduce(function (acc, eachRowData) {
                        if (rowData.FILE_EXT === "pdf" && rowData.PDF_GFILE_SEQ === eachRowData.PDF_GFILE_SEQ) {
                            eachRowData.PDF_GFILE_SEQ = '';
                        } else if (rowData.FILE_EXT === "dxf" && rowData.DXF_GFILE_SEQ === eachRowData.DXF_GFILE_SEQ) {
                            eachRowData.DXF_GFILE_SEQ = '';
                        }
                        if (!eachRowData.DXF_GFILE_SEQ && !eachRowData.PDF_GFILE_SEQ) {
                            acc.push({rowIndx: eachRowData.pq_ri});
                        }
                        return acc;
                    }, []);
                    let parameter = {
                        'queryId': 'drawingUploadMapper.deleteDrawingUpload',
                        'UPLOAD_SEQ': ui.rowData.UPLOAD_SEQ
                    };

                    let parameters = {'url': '/json-remove', 'data': parameter};

                    fnPostAjax(function (data) {
                        $commonCadFileAttachGrid.pqGrid('deleteRow', {rowList: deleteRowList, effect: true});
                        $commonCadFileAttachGrid.pqGrid('refresh');
                        $commonCadUploadFileGrid.pqGrid("deleteRow", {rowIndx: ui.rowIndx, effect: true });
                        $commonCadUploadFileGrid.pqGrid('refresh');
                    }, parameters, '');
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
            recIndx: 'ROW_NUM',
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
            formData.append('WORK_KEY', $('#common_cad_file_attach_form').find("#WORK_KEY").val());

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
                // 도면 번호 없는 매핑 데이터 삭제 처리
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
            }, formData, $('#common_cad_file_attach_form').find('#actionUrl').val());
        }
    });

    const fnGroupBy = function (objectArray, property) {
        return objectArray.reduce(function (acc, obj) {
            var key = obj[property];
            if (!acc[key]) {
                acc[key] = [];
            }
            acc[key].push(obj);
            return acc;
        }, {});
    };

    $cadFileConvertUploadCompletedBtn.on('click', function () {
        const actionType = $('#common_cad_file_attach_form').find('#actionType').val();
        // 주문 도면 차수 변경
        if (actionType === 'controlRev') {
            let gridData = $commonCadFileAttachGrid.pqGrid('option', 'dataModel.data')
            let gridData2 = $commonCadUploadFileGrid.pqGrid('option', 'dataModel.data')
            let groupByFileAttach = fnGroupBy(gridData, 'DRAWING_NUM');
            let groupByUploadFile = fnGroupBy(gridData2, 'MAPPING_STR');
            let drawingFlag = false;
            $.each(groupByFileAttach, function (idx,Item) {
                if(typeof groupByUploadFile[idx] == 'undefined') {
                    drawingFlag = true;
                }
            })
            if(drawingFlag) {
                fnAlert(null, "선택한 대상의 도면을 모두 업로드 하셔야합니다.");
                return false;
            }

            var message = '도면 변경시 바코드가 변경되며,<br>이미 배포된 바코드 출력도면은 교체해야 합니다.<br><br>진행하시겠습니까?';
            $.each(gridData, function (idx,Item) {
               if(typeof Item.OUT_FINISH_STATUS != 'undefined' && Item.OUT_FINISH_STATUS == 'RLS010') {
                    message = '출고 완료 대상이 존재합니다. 도면변경을 진행하시겠습니까?<br><br>※ 도면 변경시 바코드가 변경되며, 이미 배포된 바코드 출력도면은 교체해야합니다.';
               }
            });
            // return;
            fnConfirm(null, message, function () {
                let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});
                changes.queryIdList = {
                    'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
                };
                $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
                // console.log('changes',changes);
                // return;
                let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlert(null,"<h1>저장되었습니다.</h1>", function () {
                        $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                        $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                        $('#drawing_upload_close').trigger("click");
                    });
                }, parameters, '');
            });
        }else {
            var flag = false;
            if(actionType == 'inside') {
                const gridData = $commonCadUploadFileGrid.pqGrid('option', 'dataModel.data');
                const groupedInsideStock = fnGroupBy(gridData, 'INSIDE_STOCK_NUM');

                $.each(groupedInsideStock,function (idx, Item) {
                    if(Item.length < 2) {
                        flag = true;
                    }
                });
            }
            if(flag) {
                fnConfirm(null, '1가지 종류의 파일만 업로드하는 대상이 있습니다.<br>진행 하시겠습니까?', function () {
                    let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
                    let changes = gridInstance.getChanges({format: 'byVal'});
                    changes.queryIdList = {
                        'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
                    };
                    $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
                    let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
                    fnPostAjax(function (data, callFunctionParam) {
                        fnAlert(null,"<h1>저장되었습니다.</h1>", function () {
                            $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                            $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                            $('#drawing_upload_close').trigger("click");
                        });
                    }, parameters, '');
                });
            }else {
                let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});
                changes.queryIdList = {
                    'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
                };
                $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
                let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
                // return;
                fnPostAjax(function (data, callFunctionParam) {
                    fnConfirm(null, '<span style="text-align: center;">저장 완료되었습니다.<br>저장이 완료된 대상에 대해서 <span style="color: blue;">주문확정</span>을 진행 하시겠습니까?</span>',
                        function () { // onOk
                            let parameterConfirm = {'url':'/orderConfirmFromDrawing', 'data':{data: JSON.stringify(changes)}};
                            fnPostAjax(function (data, callFunctionParam) {
                                if(data.flag) {
                                    fnAlert(null,data.message);
                                }else {
                                    fnAlert(null, "확정처리 되었습니다.", function () {
                                        $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                                        $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                                        $('#drawing_upload_close').trigger("click");
                                    });
                                }
                            }, parameterConfirm, '');
                        }, function () { // onCancel
                            $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                            $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                            $('#drawing_upload_close').trigger("click");
                        }
                    )
                    // fnAlert(null,"<h1>저장되었습니다.</h1>", function () {
                    //     $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                    //     $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                    //     $('#drawing_upload_close').trigger("click");
                    // });
                }, parameters, '');
            }
        }
    })
    function saveFile() {
        let gridInstance = $commonCadFileAttachGrid.pqGrid('getInstance').grid;
        let changes = gridInstance.getChanges({format: 'byVal'});
        changes.queryIdList = {
            'insertQueryId': [$('#common_cad_file_attach_form').find("#queryId").val()]
        };
        $("#common_cad_file_attach_form").find("#fileGrid").val(JSON.stringify(changes));
        let parameters = {'url': '/cadFileConvert', 'data': {data: JSON.stringify(changes)}};
        fnPostAjax(function (data, callFunctionParam) {
            fnAlert(null,"<h1>저장되었습니다.</h1>", function () {
                $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
                $commonCadUploadFileGrid.pqGrid('refreshDataAndView');
                $('#drawing_upload_close').trigger("click");
            });
        }, parameters, '');
    }

    $('#drawing_upload_close').on('click', function () {
        window.opener.callDrawingUploadPopupWindow($('#common_cad_file_attach_form').find('#actionType').val());
        window.close();
    });

    function fn_getFileSize(fileSize){
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        if (fileSize == 0) return 'n/a';
        var i = parseInt(Math.floor(Math.log(fileSize) / Math.log(1024)));
        return (fileSize  / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
    }

    function initDrawingLoad(){

        let actionType = $('#common_cad_file_attach_form').find('#actionType').val();
        $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);
        $commonCadFileAttachGrid.pqGrid('refreshDataAndView');
        // $commonCadFileAttachGrid = $('#' + commonCadFileAttachGridId).pqGrid(commonCadFileAttachObj);

        if(actionType == 'estimate') {          // 견적 도면 등록
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('견적 도면 등록');
            $commonCadFileAttachGrid.pqGrid('option', 'colModel', estimateCadFileColModel);
            $('#common_cad_file_attach_form').find('#actionUrl').val("/uploadEstimateCadFiles");
        }else if(actionType == 'controlPart') {     // 주문 도면 등록
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면 업로드');
            $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlPartCadFileColModel);
            $('#common_cad_file_attach_form').find('#actionUrl').val("/uploadControlCadFiles");
        }else if(actionType == 'order') {
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('주문 도면 등록');
            $commonCadFileAttachGrid.pqGrid('option', 'colModel', orderCadFileColModel);
            $('#common_cad_file_attach_form').find('#actionUrl').val("/uploadControlCadFiles");
        }else if(actionType == 'controlRev') {  // 주문 도면 차수 변경
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면변경(Revision up)');
            $commonCadFileAttachGrid.pqGrid('option', 'colModel', controlCadRevFileColModel);
            $('#common_cad_file_attach_form').find('#actionUrl').val("/uploadControlCadFiles");
        }else if(actionType == 'inside') {      // 재고 도면 등록, 교체
            $('#common_cad_file_attach_pop').find('#common_cad_file_attach_pop_title').html('도면 등록 / 교체');
            $commonCadFileAttachGrid.pqGrid('option', 'colModel', insideStockCadFileColModel);
            $('#common_cad_file_attach_form').find('#actionUrl').val("/uploadControlCadFiles");
        }

        $commonCadUploadFileGrid = $('#' + commonCadUploadFileGridId).pqGrid(commonCadUploadFileObj);
        $commonCadUploadFileGrid.pqGrid('refresh');

        if(actionType == 'controlRev' || actionType == 'controlPart') {  // 주문 도면 차수 변경의 경우 선택한 주문 정보를 조회한다.
            let parameters = {'url': '/json-list', 'data': $("#common_cad_reversion_control_list_form").serialize()};
            fnPostAjax(function (data) {
                $commonCadFileAttachGrid.pqGrid('option', {editable: true});
                $commonCadFileAttachGrid.pqGrid('addNodes', data.list, 0);
                $commonCadFileAttachGrid.pqGrid('option', {editable: false});   // 수정 여부를 false 처리 한다.
            }, parameters, '');
        }else if(actionType == 'inside') {
            let parameters = {'url': '/json-list', 'data': $("#common_cad_stock_form").serialize()};
            fnPostAjax(function (data) {
                $commonCadFileAttachGrid.pqGrid('option', {editable: true});
                $commonCadFileAttachGrid.pqGrid('addNodes', data.list, 0);
                $commonCadFileAttachGrid.pqGrid('option', {editable: false});   // 수정 여부를 false 처리 한다.
            }, parameters, '');

        }
    }

    initDrawingLoad();

</script>
</body>
</html>
