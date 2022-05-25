<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<c:set value="${list[0]}" var="list"/>--%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP 1</title>
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
   	<link rel="shortcut icon" href="/favicon.ico">
   	<!-- Chrome, Safari, IE -->
   	<link rel="icon" href="/favicon.ico">
    <link rel="stylesheet" href="/resource/plugins/dhtmlx/suite.css" type="text/css" />
    <link rel="stylesheet" href="/resource/asset/css/reset.css" type="text/css" />
    <link rel="stylesheet" href="/resource/asset/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/resource/asset/css/tab.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/resource/pop/XEIcon/xeicon.min.css">

    <!-- alertify -->
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/waitme/waitMe.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>
    <script type="text/javascript" src='/resource/plugins/waitme/waitMe.js'></script>
    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>

    <!-- alertify -->
    <script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>

    <!-- socket -->
    <script type="text/javascript" src='/resource/plugins/socket/sockjs.min.js'></script>
    <script type="text/javascript" src='/resource/plugins/stomp/stomp.min.js'></script>

    <style type="text/css">

        html {
            /*cursor: none;*/
       	}

        .dhx_message__icon{
            color:#ffffff !important;
        }
        .dhx_message__text{
            color: #ffffff !important;
        }
        .dhx_message {
            width: 100%;
            background-color: #fd0005 !important;
        }
        .dhx_message-container--top-right {
            top: 300px;
            right: 380px;
            text-align: center;
        }
        .yellowBackground {
            background-color: rgba(255, 252, 145, 0.5) !important;
        }

        @keyframes key-sandglass {
            0% { background: url(/resource/asset/images/work/icon_1.png) no-repeat 0 0; }
            50% { background: url(/resource/asset/images/work/icon_2.png) no-repeat 0 0; }
        }

        .sandglass {
            animation: key-sandglass 2s infinite linear;
        }

        .sandglass_stop {
            background: url(/resource/asset/images/work/icon_4.png) no-repeat 0 0;
        }

        .ajs-cancel {
          display: none;
        }

    </style>
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)" >
<div id="startDiv" style="display: none">
    <div id="startDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;"><srping:message key='drawing.board.alert.14'/></h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%">&nbsp;</td>
                <td style="text-align: center;"><img src="/resource/asset/images/work/icon_4_1.png" width="40px"></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="completeDiv" style="display: none">
    <div id="completeDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;"><srping:message key='drawing.board.alert.15'/></h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%">&nbsp;</td>
                <td style="text-align: center;"><img src="/resource/asset/images/work/icon_4_1.png" width="40px"></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="saveDiv" style="display: none">
    <div id="saveDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;">저장되었습니다.</h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%">&nbsp;</td>
                <td style="text-align: center;"><img src="/resource/asset/images/work/icon_4_1.png" width="40px"></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="errorDiv" style="display: none">
    <div id="errorDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;">검사종류와 불량원인 코드를 선택하세요</h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%">&nbsp;</td>
                <td style="text-align: center;"><img src="/resource/asset/images/work/alarm.png" width="40px"></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="cancelDiv" style="display: none">
    <div id="cancelDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;"><srping:message key='drawing.board.alert.16'/></h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="15%">&nbsp;</td>
                <td style="text-align: center;"><img src="/resource/asset/images/work/icon_4_1.png" width="40px"></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="sameSideYnDiv" style="display: none">
    <div id="sameSideYnDivHtml">
        <table>
            <tr>
                <td width="15%">&nbsp;</td>
                <td rowspan="2" width="25%"><img src="/resource/asset/images/work/alarm.png" width="90px"></td>
                <td width="45%"><h3 style="font-size: 44px;font-weight: bold; text-align: center;"><srping:message key='drawing.board.label.21'/></h3></td>
                <td width="15%">&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
<div id="drawingVerErrorDiv" style="display: none">
    <div id="drawingVerErrorHtml">
        <table>
            <tr>
                <td width="10%">&nbsp;</td>
                <td rowspan="2" width="25%"><img src="/resource/asset/images/work/alarm.png" width="90px"></td>
                <td width="65%"><h3 style="font-size: 24px;font-weight: bold;"><srping:message key='drawing.board.alert.01'/></h3></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><h3 style="font-size: 24px;font-weight: bold;"><srping:message key='drawing.board.alert.02'/></h3></td>
            </tr>
        </table>
    </div>
</div>
<!-- Target Modal Start -->
<div class="modal" id="drawing_worker_target_list_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="buttonWrap right_float">
                    <button type="button" id="area_tab" class="listBlueBtn save"><srping:message key="drawing.board.button.11"/></button>
                    <button type="button" id="equip_tab" class="listBlueBtn save"><srping:message key="drawing.board.button.10"/></button>
                    <button type="button" class="listGrnBtn closeBe targetListClose"><srping:message key="drawing.board.button.09"/></button>
                </div>
                <div class="tableWrap">
                    <div class="tab-content">
                        <div class="equipWrap workList">
                            <table class="modal-table" style="word-wrap:break-word;word-break:break-all;">
                                <thead>
                                    <tr>
                                        <th class="modal-table-header" style="width:291px;"><srping:message key="drawing.board.label.03"/></th>
                                        <th class="modal-table-header" style="width:88px;"><srping:message key="drawing.board.label.04"/></th>
                                        <th class="modal-table-header" style="width:88px;"><srping:message key="drawing.board.label.05"/></th>
                                        <th class="modal-table-header" style="width:108px;"><srping:message key="drawing.board.label.06"/></th>
                                    </tr>
                                </thead>
                                <tbody id="equipBodyListHtml"></tbody>
                            </table>
                        </div>
                        <div class="areaWrap workList" style="display: none">
                            <table class="modal-table" style="word-wrap:break-word;word-break:break-all;">
                                <thead>
                                    <tr>
                                        <th class="modal-table-header" style="width:291px;"><srping:message key="drawing.board.label.03"/></th>
                                        <th class="modal-table-header" style="width:88px;"><srping:message key="drawing.board.label.04"/></th>
                                        <th class="modal-table-header" style="width:88px;"><srping:message key="drawing.board.label.05"/></th>
                                        <th class="modal-table-header" style="width:108px;"><srping:message key="drawing.board.label.06"/></th>
                                    </tr>
                                </thead>
                                <tbody id="popBodyListHtml"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- 보류 상태 확인 Modal Start -->
<div class="modal-scan" id="drawing_worker_hold_popup" style="display: none;">
    <div class="modal-hold-dialog">
        <div class="modal-hold-content">
            <div class="modal-hold-body">
                <div class="tableWrap">
                    <div><h1 class="stop-txt" style="background-color: white;" id="holdControlNumHtml"></h1></div>
                    <div style="margin-top: 20px;text-align: center;">
                        <span class="hold-txt" style="color: #474747;" ><srping:message key="drawing.board.alert.11"/></span>
                        <span class="hold-txt" style="color: #ff0707;" >'<srping:message key="drawing.board.button.15"/>'</span>
                        <span class="hold-txt" style="color: #474747;" ><srping:message key="drawing.board.alert.12"/></span>
                    </div>
                    <div><p class="hold-txt" style="color: #474747;margin-top: 10px;" ><srping:message key="drawing.board.alert.13"/></p></div>
                    <div style="text-align: center;padding-top: 20px;" class="buttonCenterWrap">
                        <button type="button" id="holdBtnSave" class="listBlueBtn"><srping:message key="drawing.board.button.14"/></button>
                        <button type="button" id="holdBtnCancel" class="listGrnBtn"><srping:message key="drawing.board.button.06"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scan Modal End -->

<!-- Drawing Start Modal Start -->
<div class="modal-scan" id="drawing_worker_scan_popup" style="display: none;">
    <div class="modal-start-dialog">
        <div class="modal-start-content">
            <div class="modal-start-body">
                <div class="tableWrap">
                    <div><h1 class="stop-txt" style="background-color: white;" id="scanControlNumHtml"></h1></div>
                    <div><h1 class="stop-txt" style="color: white; margin-top: 10px;" id="scanControlOrderQtyHtml"></h1></div>
                    <div><div id="scanAlertMessageHtml" style="text-align: center; margin-top: 10px;"></div></div>
                    <div><p class="work-txt" style="color: white;margin-top: 10px;" ><srping:message key="drawing.board.alert.06"/></p></div>
                    <div style="text-align: right;" class="buttonCenterWrap">
                        <h1 class="scan-time" style="font-size: 70px; font-weight: bold; color: white">10 <srping:message key="drawing.board.alert.04"/></h1>
                        <button type="button" id="scanBtnSave" class="listBlueBtn"><srping:message key="drawing.board.button.01"/></button>
                        <button type="button" id="scanBtnCancel" class="listGrnBtn"><srping:message key="drawing.board.button.06"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scan Modal End -->

<!-- Stop Modal Start -->
<div class="modal-scan" id="drawing_worker_stop_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-stop-content">
            <div class="modal-stop-body">
                <div class="tableWrap">
                    <div><p class="stop-txt"><srping:message key="drawing.board.message.03"/></p></div>
                    <div>
                        <p class="stop-time"><srping:message key="drawing.board.label.14"/> :
                            <span id="stopHour">0<srping:message key="drawing.board.label.20"/></span>
                            <span id="stopMinutes">0<srping:message key="drawing.board.label.02"/></span>
                            <span id="stopSeconds">0<srping:message key="drawing.board.label.01"/></span>
                        </p>
                    </div>
                    <div style="text-align: center;">
                        <button type="button" id="workRestartBtn" class="gradeMidBtn red" style="width: auto; padding: 0 20px;"><srping:message key="drawing.board.button.13"/></button>
                        <%--<button id="stopBtn">작업재개</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Stop Modal End -->

<!-- Cancel Modal Start -->
<div class="modal-scan" id="drawing_worker_cancel_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-stop-content">
            <div class="modal-stop-body">
                <div class="tableWrap">
                    <div><p class="stop-txt"><srping:message key="drawing.board.message.04"/></p></div>
                    <br/>
                    <div style="text-align: center;">
                        <button type="button" id="cancelBtnSave" class="gradeMidBtn red"><srping:message key="drawing.board.button.05"/></button>
                        <button type="button" id="cancelBtnCancel" class="gradeMidBtn white"><srping:message key="drawing.board.button.12"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cancel Modal End -->
<c:set var="workInfo" value="${drawingInfo.lastWork}" />
<c:if test="${not empty drawingInfo.currentWork}">
    <c:set var="workInfo" value="${drawingInfo.currentWork}" />
</c:if>
<c:choose>
    <c:when test="${workInfo.WORK_STATUS eq 'DBS010'}">
        <div class="bodyWrap stop <c:if test="${drawingInfo.machineInfo.IF_USE_YN ne 'Y'}">none_if</c:if> <c:if test="${drawingInfo.machineInfo.EQUIP_OFF_YN eq 'Y'}">nc_off</c:if>" id="bodyWrap">
    </c:when>
    <c:when test="${workInfo.WORK_STATUS eq 'DBS020'}">
        <div class="bodyWrap work <c:if test="${drawingInfo.machineInfo.IF_USE_YN ne 'Y'}">none_if</c:if> <c:if test="${drawingInfo.machineInfo.EQUIP_OFF_YN eq 'Y'}">nc_off</c:if>" id="bodyWrap">
    </c:when>
    <c:otherwise>
        <div class="bodyWrap complete <c:if test="${drawingInfo.machineInfo.IF_USE_YN ne 'Y'}">none_if</c:if> <c:if test="${drawingInfo.machineInfo.EQUIP_OFF_YN eq 'Y'}">nc_off</c:if>" id="bodyWrap">
    </c:otherwise>
</c:choose>
    <div id="waitMeContainerDiv">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <div class="leftLogWrap">
            <!-- 팝업에서 신규 작업 선택시 처리 되는 부분 이전 정보나 현재 진행 중인 정보를 보여 준다. -->
            <form id="drawing_action_form" name="drawing_action_form" method="POST" action="/drawing-board">
                <input id="DATA_TYPE" name="DATA_TYPE" type="hidden" value="${workInfo.DATA_TYPE}">
                <input id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" type="hidden" value="${workInfo.MCT_WORK_SEQ}">
                <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="${workInfo.CONTROL_SEQ}">
                <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="${workInfo.CONTROL_DETAIL_SEQ}">
                <input id="CONTROL_NUM" name="CONTROL_NUM" type="hidden" value="${workInfo.CONTROL_NUM}">
                <input id="BARCODE_NUM" name="BARCODE_NUM" type="hidden" value="${workInfo.BARCODE_NUM}">
                <input id="PART_NUM" name="PART_NUM" type="hidden" value="${workInfo.PART_NUM}">
                <input id="ORDER_QTY" name="ORDER_QTY" type="hidden" value="${workInfo.ORDER_QTY}">
                <input id="INNER_DUE_DT" name="INNER_DUE_DT" type="hidden" value="${workInfo.INNER_DUE_DT}">
                <input id="FINISH_QTY" name="FINISH_QTY" type="hidden" value="${workInfo.FINISH_QTY}">
                <input id="FINISH_QTY_COPY" name="FINISH_QTY_COPY" type="hidden" value="${workInfo.FINISH_QTY}">
                <input id="COMPLETE_QTY" name="COMPLETE_QTY" type="hidden" value="${workInfo.COMPLETE_QTY}">
                <input id="GOAL_QTY" name="GOAL_QTY" type="hidden" value="${workInfo.GOAL_QTY}">
                <input id="COMPLETE_CYCLE_COUNT" name="COMPLETE_CYCLE_COUNT" type="hidden" value="${workInfo.COMPLETE_CYCLE_COUNT}">
<%--                <input id="ERROR_QTY" name="ERROR_QTY" type="hidden" value="">--%>
<%--                <input id="ERROR_REASON" name="ERROR_REASON" type="hidden" value="">--%>
                <input id="RE_BARCODE_NUM" name="RE_BARCODE_NUM" type="hidden" value="">
                <input id="LEFT_TIME" name="LEFT_TIME" type="hidden" value="${workInfo.LEFT_TIME}">
                <input id="WORK_ACTIVE_TIME" name="WORK_ACTIVE_TIME" type="hidden" value="${workInfo.WORK_ACTIVE_TIME}">
                <input id="WORK_STATUS" name="WORK_STATUS" type="hidden" value="${workInfo.WORK_STATUS}">
                <input id="WORK_STOP_TIME" name="WORK_STOP_TIME" type="hidden" value="${workInfo.WORK_STOP_TIME}">
                <input id="CURRENT_STATUS_TIME" name="CURRENT_STATUS_TIME" type="hidden" value="${workInfo.CURRENT_STATUS_TIME}">
            </form>
            <form id="re_start_work_info_form" name="re_start_work_info_form" method="POST" onsubmit="return false;">
                <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="${reStartWorkinfo.CONTROL_SEQ}">
                <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="${reStartWorkinfo.CONTROL_DETAIL_SEQ}">
                <input id="CONTROL_NUM" name="CONTROL_NUM" type="hidden" value="${reStartWorkinfo.CONTROL_NUM}">
                <input id="PART_NUM" name="PART_NUM" type="hidden" value="${reStartWorkinfo.PART_NUM}">
                <input id="ORDER_QTY" name="ORDER_QTY" type="hidden" value="${reStartWorkinfo.ORDER_QTY}">
                <input id="INNER_DUE_DT" name="INNER_DUE_DT" type="hidden" value="${reStartWorkinfo.INNER_DUE_DT}">
                <input id="RE_BARCODE_NUM" name="RE_BARCODE_NUM" type="hidden" value="${reStartWorkinfo.BARCODE_NUM}">
            </form>
            <form id="drawing_log_out_form" name="drawing_log_out_form" method="POST" action="/drawing-worker">
                <input id="EQUIP_NM" name="EQUIP_NM" type="hidden" value="${drawingInfo.machineInfo.EQUIP_NM}">
                <input id="EQUIP_SEQ" name="EQUIP_SEQ" type="hidden" value="${drawingInfo.machineInfo.EQUIP_SEQ}">
                <input id="FACTORY_AREA" name="FACTORY_AREA" type="hidden" value="${drawingInfo.machineInfo.FACTORY_AREA}">
                <input id="IF_USE_YN" name="IF_USE_YN" type="hidden" value="${drawingInfo.machineInfo.IF_USE_YN}">
                <input id="USER_ID" name="USER_ID" type="hidden" value="${drawingInfo.userInfo.USER_ID}">
    <%--            <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="<c:if test="${not empty workInfo}">${workInfo.CONTROL_SEQ}</c:if>">--%>
    <%--            <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="<c:if test="${not empty workInfo}">${workInfo.CONTROL_DETAIL_SEQ}</c:if>">--%>
                <div class="logInWrap" style="background: #8aea8a;">
                    <div class="mainTit">${drawingInfo.machineInfo.EQUIP_NM}</div>
                    <div class="userWrap">
                        <div class="userImg"><img src="/image/${drawingInfo.userInfo.USER_GFILE_SEQ}" alt=""></div>
                        <div class="userInfo">
                            <p class="name">${drawingInfo.userInfo.USER_NM}</p>
<%--                            <p><span class="dept">(${drawingInfo.userInfo.USER_ID})</span></p>--%>
                        </div>
                        <div class="logStatus mt-10"><button type="submit">Log off</button></div>
                    </div>
                </div>
            </form>
        </div>
        <div class="rightDbWorkWrap">
            <div>
                <c:if test="${empty drawingInfo.currentWork}">
                    <input type="hidden" name="curStatus" id="curStatus" value="stop">
                    <div class="contsTitWrap" id="workMainLastConts">
                        <div class="contsTit"><srping:message key='drawing.board.label.11'/></div>
                        <div class="slecBox"><a href="#"><srping:message key='drawing.board.label.12'/></a></div>
                    </div>
                </c:if>
                <c:if test="${not empty drawingInfo.currentWork}">
                    <input type="hidden" name="curStatus" id="curStatus" value="work">
                    <div class="contsTitWrap" id="workMainProgressConts">
                        <div class="contsTit blink-blue" style="padding-left: 0"><srping:message key='drawing.board.label.13'/></div>
                        <div class="contsTit blink-red" style="padding-left: 0"><srping:message key='drawing.board.button.07'/></div>
                        <div class="contsTit blink-red-2" style="padding-left: 0">Stop (NC OFF)</div>
                        <div id="workReserveTimeInfo" class="contsTit"></div>
                        <div class="right_sort">
                            <button type="button" id="workCancelBtn" class="graDbBtn red" style="min-width: 90px; padding: 0 5px;"><srping:message key='drawing.board.button.06'/></button>&nbsp;
                            <c:if test="${drawingInfo.machineInfo.IF_USE_YN ne 'Y'}">
                                <button type="button" id="reserveBtn" class="reserveDbDisableBtn" style="min-width: 90px; padding: 0 5px;"><input id="reserveChecked" type="checkbox" style="margin-bottom:2px; margin-right:10px; zoom:2.0;"/><srping:message key='drawing.board.button.16'/></button>&nbsp;
                                <button type="button" id="workPuaseBtn" class="graDbBtn yellow" style="min-width: 90px; padding: 0 5px;color: black !important;"><srping:message key='drawing.board.button.07'/></button>&nbsp;
                            </c:if>
                            <button type="button" id="workCompletelBtn" class="graDbBtn purple" style="min-width: 90px; padding: 0 5px;"><srping:message key='drawing.board.button.08'/></button>
                        </div>
                    </div>
                </c:if>
                <div class="workInWrap mt-10">
                    <div class="topConts" style="color: black;font-weight: bold;">
                        <div class="timeWrap" style="width: 67%;"><!-- 작업번호 -->
                            <span class="timeTit"><srping:message key='drawing.board.button.19'/></span>
                            <span class="time mr-5" style="width: 75%;">
                                <span><c:if test="${not empty workInfo}">${workInfo.CONTROL_NUM_NM}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap ml-5" style="width: 32%"><!-- 시작 -->
                            <span class="timeTit"><i class="xi-play-circle-o"></i><srping:message key='drawing.board.button.01'/></span>
                            <span class="time" style="width:59%;padding: 10px 5px;">
                                <span><c:if test="${not empty workInfo}">${workInfo.WORK_START_DT}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap" style="width: 38%;"><!-- 수량 -->
                            <span class="timeTit"><srping:message key='drawing.board.label.05'/></span>
                            <span class="time" style="width: 74%;padding: 10px 5px;">
                                <span class="text-red"><c:if test="${not empty workInfo}">${workInfo.SAME_SIDE_TEXT}</c:if></span>
                                <span><c:if test="${not empty workInfo}">${workInfo.ORDER_QTY_INFO}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap ml-5" style="width: 28%;"><!-- 가공납기 -->
                            <span class="timeTit"><srping:message key='drawing.board.label.06'/></span>
                            <span class="time mr-5" style="width: 40%;">
                                <span><c:if test="${not empty workInfo}">${workInfo.INNER_DUE_DT}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap ml-5" style="width: 32%;"> <!-- 종료 -->
                            <span class="timeTit"><i class="xi-check-circle"></i><srping:message key='drawing.board.button.02'/></span>
                            <span class="time" style="width:59%;padding: 10px 5px;">
                                <span><c:if test="${not empty workInfo}">${workInfo.WORK_FINISH_DT}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap" style="width: 28%;"><!-- 이전 공정 -->
                            <span class="timeTit"><srping:message key='drawing.board.label.23'/></span>
                            <span class="time" id="latest_process_list" style="width: 65%;cursor: pointer;font-size: 1.2rem;line-height: 22px;position:relative;">
                                <div class="arrow-sm-right" style="left: 89%;top:-2%;"></div>
                                <span><c:if test="${not empty workInfo}">${workInfo.LATEST_PROCESS}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap ml-5" style="width: 38%;"><!-- 공유사항 -->
                            <span class="timeTit"><srping:message key='drawing.board.label.24'/></span>
                            <span class="time" id="note_list" style="width: 72%;font-size:1.1rem;margin-right: 5px;cursor: pointer;overflow: hidden;position:relative;">
                            <div class="arrow-sm-right" style="left: 92%;top:-2%;"></div>
                                <span><c:if test="${not empty workInfo}">${workInfo.NOTE}</c:if></span>
                                <span><c:if test="${not empty workInfo}">${workInfo.MCT_NOTE}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap ml-5" style="width: 32%;"><!-- 과거기록 -->
                            <span class="timeTit"><srping:message key='drawing.board.label.08'/></span>
                            <span class="time" id="drawing_quality_history" style="width: 70%;font-size:1.1rem;cursor: pointer;padding: 5px;position:relative;">
                                <div class="arrow-sm-right" style="left: 91%;top:-2%;"></div>
                                <span><c:if test="${not empty workInfo}">${workInfo.INSPECT_DT}</c:if>
                                    <c:if test="${not empty workInfo && not empty workInfo.INSPECT_GRADE_NM}">&nbsp;등급 ${workInfo.INSPECT_GRADE_NM}</c:if>
                                </span>
                                <span><c:if test="${not empty workInfo}">${workInfo.ERROR_REASON_NM}</c:if></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="alertConts">
                    <c:if test="${not empty workInfo && workInfo.MAIN_INSPECTION ne ''}">
                        <span class="alertBox"><div class="arrow-square-left"></div>${workInfo.MAIN_INSPECTION}</span>
                    </c:if>
                    <c:if test="${not empty workInfo && workInfo.EMERGENCY_YN eq 'Y'}">
                        <span class="alertBox"><div class="arrow-square-left"></div><srping:message key='drawing.board.label.10'/></span>
                    </c:if>
                    <c:if test="${not empty workInfo && workInfo.SAME_SIDE_YN eq 'Y'}">
                        <span class="alertBox"><div class="arrow-square-left"></div><srping:message key='drawing.board.label.18'/></span>
                    </c:if>
                    <c:if test="${not empty workInfo && workInfo.MATERIAL_FINISH_HEAT ne ''}">
                        <%--                            <span class="alertBox">${workInfo.MATERIAL_FINISH_HEAT}</span>--%>
                        <span class="alertBox" style="<c:if test="${not empty LocalInfo && LocalInfo eq 'en'}">width:145px;</c:if>"><div class="arrow-square-left"></div><srping:message key='drawing.board.label.22'/></span>
                    </c:if>
                    <c:if test="${(empty workInfo || (workInfo.MATERIAL_FINISH_HEAT eq '' &&  workInfo.MAIN_INSPECTION eq '' &&  orkInfo.EMERGENCY_YN ne 'Y' && workInfo.SAME_SIDE_YN ne 'Y'))}">
                        <span style="height: 35px; line-height: 35px;">&nbsp; &nbsp;</span>
                    </c:if>
                    <button type="button" id="inputErrorQtyBtn" style="min-width: 90px;padding: 0 10px;float: right;color: red;background: yellow;border: 1px solid;" class="graDbBtn">불량실적 입력
                    </button>
                </div>
            </div>
        </div>
        <div class="bottomDbWrap">
            <div style="float: left;padding: 0 30px 0 30px;width: 40%;">
                <div class="d-flex">
                    <div class="nc_process_title">
                        <span>NC 가공 Cycle 정보</span>
                    </div>
                    <div class="nc_off_div">
                        <span>(NC OFF)</span>
                    </div>
                </div>
                <div class="workInWrap nc_disabled ncOffWorkWrap">
                    <div class="topConts" style="color: black;font-weight: bold;width: 100%;">
                        <div class="timeWrap" style="width: 100%;">
                            <span class="timeTit">Unit Qty.</span>
                            <span class="time">
                                <span class="UNIT_QTY"><c:if test="${not empty workInfo && drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">${workInfo.UNIT_QTY}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap" style="width: 100%;">
                            <span class="timeTit" style="padding: 5px;">Finish Cycle</span>
                            <span class="time">
                                <span class="COMPLETE_CYCLE_COUNT"><c:if test="${not empty workInfo && drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">${workInfo.COMPLETE_CYCLE_COUNT}</c:if></span>
                            </span>
                        </div>
                        <div class="timeWrap d-flex" style="width: 100%;text-align: center;font-size: 24px;line-height: 40px;">
                            <span class="status_work" id="CYCLE_ACTIVE_SPAN" style="width: 50%;">
                                <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">${workInfo.CURRENT_STATUS_TIME_FORMAT}</c:if>
                            </span>
                            <span>/</span>
                            <span id="finish_cycle_time" style="width: 50%;">
                                <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">${workInfo.LATEST_CYCLE_TIME}</c:if>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right_float" style="width: 59%;">
                <div class="nc_process_title">
                    <span>가공수행 정보</span>
                </div>
                <div class="workInWrap" style="width: 95%;">
                    <div class="d-flex topConts" style="color: black;font-weight: bold;width: 100%;">
                        <div style="width: 85%;height: 100%;">
                            <div class="timeWrap" style="width: 100%;">
                                <span class="timeTit green" style="width: 30%;">Active</span>
                                <span class="time status_work">
                                    <span id="WORK_ACTIVE_TIME_SPAN">${workInfo.WORK_ACTIVE_TIME_FORMAT}</span>
                                </span>
                                <span class="timeTit purple" style="width: 25%;">목표</span>
                                <span class="time" style="width: 35%;">
                                    <span><c:if test="${not empty workInfo}">${workInfo.GOAL_QTY}</c:if></span>
                                </span>
                            </div>
                            <div class="timeWrap" style="width: 100%;">
                                <span class="timeTit orange" style="width: 30%;">Stop</span>
                                <span class="time status_stop">
                                    <span id="WORK_STOP_TIME_SPAN">${workInfo.WORK_STOP_TIME_FORMAT}</span>
                                </span>
                                <span class="timeTit green nc_disabled" style="width: 25%;">완료</span>
                                <span class="time COMPLETE_QTY" style="width: 35%;">
                                    <span id="COMPLETE_QTY_MAIN">${workInfo.COMPLETE_QTY}</span>
                                </span>
                            </div>
                            <div class="timeWrap" style="width: 100%;">
                                <span class="timeTit darkBlue nc_disabled" style="width: 30%;">Left</span>
                                <span class="time">
                                    <span id="LEFT_TIME_SPAN">
                                        <c:choose>
                                            <c:when test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">
                                                ${workInfo.LEFT_TIME}
                                            </c:when>
                                            <c:otherwise>
                                                -
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </span>
                                <span class="timeTit red" style="width: 25%;">불량</span>
                                <span class="time" style="color: #9b1313;width: 35%;">
                                    <span><c:if test="${not empty workInfo}">${workInfo.ERROR_QTY}</c:if></span>
                                </span>
                            </div>
                        </div>
                        <div style="width: 15%;text-align: center;">
                            <button id="edit_qty_info" style="margin-top: 40px;">
                                <i class="xi-border-color" style=" font-size: 55px;"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- reserve Modal Start -->
<div class="modal-scan" id="drawing_reserve_time_popup" style="display: none;">
    <div class="modal-end-dialog">
        <div class="modal-end-content">
            <div class="modal-end-body">
                <div class="tableWrap">
                    <br/>
                    <table>
                        <tbody>
                            <tr>
                                <td class="modal-reserve-dialog-table">
                                    <img id="reserveHourUpBtn" src="/resource/asset/images/common/arrow_up.png">
                                </td>
                                <td class="modal-reserve-dialog-table">
                                    <img id="reserveMinuteUpBtn" src="/resource/asset/images/common/arrow_up.png">
                                </td>
                                <td class="modal-reserve-dialog-table" rowspan="3">
                                    <button type="button" id="reserveEndCheckBtn" class="graDbBtn gray" style="width: 125px; text-align: justify"><input id="reserveEndChecked" type="checkbox" style="margin-bottom:2px; margin-right:10px; zoom:2.0;"/><srping:message key='drawing.board.button.02'/></button>
                                    <br/>&nbsp;<br/>
                                    <button type="button" id="reservePauseCheckBtn" class="graDbBtn gray" style="width: 125px; text-align: justify"><input id="reservePauseChecked" type="checkbox" style="margin-bottom:2px; margin-right:10px; zoom:2.0;" /><srping:message key='drawing.board.button.07'/></button>
                                </td>
                            </tr>
                            <tr>
                                <td class="modal-reserve-dialog-text-table">
                                    <span id="reserveHourHtml">0</span> <srping:message key="drawing.board.label.20"/>
                                </td>
                                <td class="modal-reserve-dialog-text-table">
                                    <span id="reserveMinuteHtml">0</span> <srping:message key="drawing.board.label.02"/> <srping:message key="drawing.board.label.19"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="modal-reserve-dialog-table">
                                    <img id="reserveHourDownBtn" src="/resource/asset/images/common/arrow_down.png">
                                </td>
                                <td class="modal-reserve-dialog-table">
                                    <img id="reserveMinuteDownBtn" src="/resource/asset/images/common/arrow_down.png">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div style="text-align: center;">
                        <button type="button" id="reserveSaveBtn" class="reservePopBtn blue"><srping:message key='drawing.board.button.18'/></button>
                        <button type="button" id="reserveCloseBtn" class="reservePopBtn yellow"><srping:message key='drawing.board.button.09'/></button>
                        <button type="button" id="reserveCancelBtn" class="reservePopBtn red" style="display: none;"><srping:message key='drawing.board.button.17'/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Target Modal Start -->
<div class="modal" id="drawing_latest_process_list_popup" style="display: none;">
    <div class="modal-dialog" style="width: 650px;">
        <div class="modal-content">
            <div class="modal-body" style="height: 360px;">
                <div class="tableWrap">
                    <h3>가공공정이력</h3>
                    <div class="tab-content mt-10">
                        <div class="areaWrap workList">
                            <table class="modal-table" style="word-wrap:break-word;word-break:break-all;">
                                <thead>
                                    <tr>
                                        <th class="modal-table-header" style="width:8%;">No</th>
                                        <th class="modal-table-header" style="width:11%;">공정</th>
                                        <th class="modal-table-header" style="width:28%;">기기 및 작업자</th>
                                        <th class="modal-table-header" style="width:30%;">작업시작/종료</th>
                                        <th class="modal-table-header" style="width:70px;">상태</th>
                                        <th class="modal-table-header" style="width:80px;">수량</th>
                                    </tr>
                                </thead>
                                <tbody id="latestProcessListHtml" style="height: 198px;"></tbody>
                            </table>
                            <br>
                            <div class="mt-05 center_sort">
                                <button type="button" id="closeProcessListBtn" class="gradeMaxBtn"><srping:message key="drawing.board.button.09"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- Target Modal Start -->
<div class="modal" id="drawing_note_list_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="height: 360px;">
                <div class="tableWrap">
                    <h3>공유비고사항</h3>
                    <div class="tab-content mt-10">
                        <div class="areaWrap workList">
                            <table class="modal-table" style="word-wrap:break-word;word-break:break-all;">
                                <thead>
                                <tr>
                                    <th class="modal-table-header wd_70">No</th>
                                    <th class="modal-table-header wd_150">입력구분</th>
                                    <th class="modal-table-header" style="width:348px;">비고</th>
                                </tr>
                                </thead>
                                <tbody id="drawingNoteHtml" style="height: 198px;"></tbody>
                            </table>
                            <br>
                            <div class="mt-05 center_sort">
                                <button type="button" id="closeNoteListBtn" class="gradeMaxBtn"><srping:message key="drawing.board.button.09"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- Target Modal Start -->
<div class="modal" id="drawing_quality_history_popup" style="display: none;">
    <div class="modal-dialog" style="width: 850px;">
        <div class="modal-content">
            <div class="modal-body" style="height: 465px;overflow: hidden;">
                <div class="tableWrap">
                    <h3>유사형태가공 품질기록</h3>
                    <div class="tab-content mt-10">
                        <form id="drawing_quality_history_form">
                            <input type="hidden" id="queryId" name="queryId" value="drawingMapper.selectDrawingQualityHistoryList">
                            <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="${workInfo.CONTROL_SEQ}">
                            <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="${workInfo.CONTROL_DETAIL_SEQ}">
                        </form>
                        <div class="areaWrap">
                            <div class="d-flex">
                                <div style="width: 38%;margin-right: 1%;">
<%--                                    <div id="work_history_grid"></div>--%>
                                    <table id="work_history_table" class="modal-table" style="word-wrap:break-word;word-break:break-all;">
                                        <thead style="float: left;width: 100%;">
                                            <tr>
                                                <th class="modal-table-header" style="font-size: 16px;width: 15%;">검사일시</th>
                                                <th class="modal-table-header" style="width: 28%;">수행작업자</th>
                                                <th class="modal-table-header" style="width: 13%;" rowspan="2">등급</th>
                                            </tr>
                                            <tr>
                                                <th class="modal-table-header" colspan="2">작업번호</th>
                                            </tr>
                                        </thead>
                                        <tbody id="drawingWorkHistoryHtml" style="cursor: pointer;">
                                        </tbody>
                                    </table>
                                </div>
                                <div>
                                    <img id="drawing_history_image" src="/resource/main/blank.jpg" style="width: 500px;height:353.8px;border: 1px solid gray;">
                                    <table class="drawing_history_img_table" style="display: none;">
                                        <tbody style="border: 1px solid gray;">
                                            <tr>
                                                <td id="DRAWING_HISTORY_INSPECT_RESULT_NM" style="border: 1px solid gray;width: 40%;"></td>
                                                <td id="DRAWING_HISTORY_ERROR_PROCESS_NM" style="width: 15%;"></td>
                                                <td id="DRAWING_HISTORY_ERROR_REASON_NM"></td>
                                            </tr>
                                            <tr class="trHeight">
                                                <td id="DRAWING_HISTORY_ERROR_NOTE" colspan="3"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <br>
                            <div class="mt-05 center_sort">
                                <button type="button" id="closeWorkHistoryBtn" class="gradeMaxBtn"><srping:message key="drawing.board.button.09"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- Target Modal Start -->
<div class="modal <c:if test="${drawingInfo.machineInfo.IF_USE_YN ne 'Y'}">none_if</c:if>" id="drawing_edit_qty_popup" style="display: none;">
    <div class="modal-dialog" style="width: 750px;">
        <div class="modal-content" style="background: #dce6f5;">
            <div class="modal-body" style="overflow: hidden;">
                <div class="tableWrap">
                    <h3>수량정보 입력</h3>
                    <div class="tab-content mt-10">
                        <form id="drawing_edit_qty_form">
                            <input id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" type="hidden" value="${workInfo.MCT_WORK_SEQ}">
                            <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="${workInfo.CONTROL_SEQ}">
                            <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="${workInfo.CONTROL_DETAIL_SEQ}">
                            <input id="GOAL_QTY" name="GOAL_QTY" type="hidden" value="${workInfo.GOAL_QTY}">
                            <input id="COMPLETE_QTY" name="COMPLETE_QTY" type="hidden" value="${workInfo.COMPLETE_QTY}">
                            <input id="UNIT_QTY" name="UNIT_QTY" type="hidden" value="${workInfo.UNIT_QTY}">
                            <input id="ADJUST_QTY" name="ADJUST_QTY" type="hidden" value="${workInfo.ADJUST_QTY}">
                            <div class="areaWrap">
                                <div class="d-flex">
                                    <div style="width: 35%;margin-right: 2%;height: 275px;border: 1px solid #aba9a9;display: flex;border-radius: 10px;padding: 15px 15px 15px 15px;font-size: 35px;color: black;">
                                        <div class="div_flex_column">
                                            <span class="timeTit wd_75 purple" style="font-size: 28px;border-radius: 10px;display: inline-grid;">목표
                                                <span style="font-size: 16px;">Target</span>
                                            </span>
                                            <span class="db_span qtyBtn"  data-type="max" data-target="GOAL_QTY">Max.</span>
                                            <span class="db_span qtyBtn" data-type="half" data-target="GOAL_QTY">1 / 2</span>
                                            <span class="db_span qtyBtn" data-type="min" data-target="GOAL_QTY">Min.</span>
                                        </div>
                                        <div class="div_flex_column" style="width:52%;margin-left: 6%;">
                                            <span id="GOAL_QTY_SPAN" class="mt-15 mb-05" style="text-align: center;font-size: 45px;min-height: 52px;"><c:if test="${not empty workInfo}">${workInfo.GOAL_QTY}</c:if></span>
                                            <div class="arrow-up qty_arrow_btn" data-type="plus" data-target="GOAL_QTY" style="margin-bottom: 90px;"></div>
                                            <div class="arrow-down qty_arrow_btn" data-type="minus" data-target="GOAL_QTY"></div>
                                        </div>
                                    </div>
                                    <div style="width:35%;border: 1px solid #aba9a9;border-radius: 10px;display: flex;padding: 15px 15px 15px 15px;color: black;height: 275px;margin-right: 2%;">
                                        <div class="div_flex_column">
                                            <span class="timeTit wd_75 green nc_disabled" style="font-size: 28px;border-radius: 10px;display: inline-grid;">완료
                                                <span style="font-size: 16px;">Complete</span>
                                            </span>
                                            <span class="db_span nc_disabled <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">qtyBtn</c:if>" data-type="max" data-target="COMPLETE_QTY">Max.</span>
                                            <span class="db_span nc_disabled <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">qtyBtn</c:if>" data-type="half" data-target="COMPLETE_QTY">1 / 2</span>
                                            <span class="db_span nc_disabled <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">qtyBtn</c:if>" data-type="min" data-target="COMPLETE_QTY">Min.</span>
                                        </div>
                                        <div class="div_flex_column" style="width:52%;margin-left: 6%;">
                                            <span id="COMPLETE_QTY_SPAN" class="mt-15 mb-05 COMPLETE_QTY" style="text-align: center;font-size: 45px;min-height: 53px;">
                                                <c:if test="${not empty workInfo}">${workInfo.COMPLETE_QTY}</c:if>
                                            </span>
                                            <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">
                                                <div class="arrow-up qty_arrow_btn" data-type="plus" data-target="COMPLETE_QTY"></div>
                                                <span class="wd_70 mt-20 mb-20" style="font-size: 20px;text-align: center;min-height: 50px;">
                                                    조정
                                                    <br>
                                                    <span id="ADJUST_QTY_SPAN">
                                                        <c:if test="${not empty workInfo}"><c:if test="${workInfo.ADJUST_QTY > 0}">+</c:if>${workInfo.ADJUST_QTY}</c:if>
                                                    </span>
                                                </span>
                                                <div class="arrow-down qty_arrow_btn" data-type="minus" data-target="COMPLETE_QTY"></div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div style="width: 23%;border: 1px solid #aba9a9;border-radius: 10px;padding: 15px 15px 15px 15px;color: black;height: 275px;">
                                        <div class="div_flex_column" style="font-size: 35px;">
                                            <span class="db_span_blue nc_disabled">Unit Qty.</span>
                                            <div class="div_sm_section">
                                                <c:if test="${drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">
                                                    <div class="arrow-left unitQty_arrow_btn" data-type="minus"></div>
                                                    <span id="UNIT_QTY_SPAN" class="wd_100 UNIT_QTY" style="text-align: center;"><c:if test="${not empty workInfo}">${workInfo.UNIT_QTY}</c:if></span>
                                                    <div class="arrow-right unitQty_arrow_btn" data-type="plus"></div>
                                                </c:if>
                                            </div>
                                            <span class="db_span_blue bgGray_border nc_disabled mt-20">Finsih Cycle</span>
                                            <div class="div_sm_section">
                                                <span class="wd_100 COMPLETE_CYCLE_COUNT" style="text-align: center;">
                                                    <c:if test="${not empty workInfo && drawingInfo.machineInfo.IF_USE_YN eq 'Y'}">
                                                        ${workInfo.COMPLETE_CYCLE_COUNT}
                                                    </c:if>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="mt-05 center_sort">
                                    <button type="button" id="saveEditQtyBtn" class="gradeMaxBtn green" style="margin-right: 8%;">Save</button>
                                    <button type="button" id="closeEditQtyBtn" class="gradeMaxBtn lightGray">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- Target Modal Start -->
<div class="modal" id="drawing_error_qty_popup" style="display: none;">
    <div class="modal-dialog" style="width: 750px;">
        <div class="modal-content" style="background: #dce6f5;">
            <div class="modal-body" style="overflow: hidden;">
                <div class="tableWrap">
                    <h3>불량실적 입력
                        <span class="mr-10" style="color: black;float: right;"><c:if test="${not empty workInfo}">${workInfo.CONTROL_NUM_NM}</c:if></span>
                    </h3>
                    <div class="tab-content mt-5">
                        <form id="drawing_error_qty_form">
                            <input type="hidden" id="queryId" name="queryId" value="drawingMapper.selectDrawingWorkHistoryList">
                            <input id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" type="hidden" value="${workInfo.MCT_WORK_SEQ}">
                            <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="${workInfo.CONTROL_SEQ}">
                            <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="${workInfo.CONTROL_DETAIL_SEQ}">
                            <input id="ERROR_QTY" name="ERROR_QTY" type="hidden" value="1"
                            <div class="areaWrap workList">
                                <div class="d-flex" style="flex-direction: column;">
                                    <div class="d-flex" style="border-radius: 10px;color: black;padding: 5px;">
                                        <div class="div_flex_column" style="width: 25%;text-align: center;margin: 30px 20px 0px 10px;">
                                            <span class="db_span purple wd_110" style="border-radius: 5px;margin-top: 0;cursor:default;">불량 수량</span>
                                            <span id="ERROR_QTY_SPAN" class="mt-20" style="font-size: 45px;">1</span>
                                        </div>
                                        <div class="wd_515" style="height: 150px;font-size: 18px;">
                                            <table class="modal-table wd_515" style="word-wrap:break-word;word-break:break-all;height: 150px;">
                                                <thead class="wd_515" style="float:left;">
                                                    <tr>
                                                        <th class="modal-table-header" style="width:14%;">일자</th>
                                                        <th class="modal-table-header" style="width:15%;">등록자</th>
                                                        <th class="modal-table-header" style="width:39%;">검사코드</th>
                                                        <th class="modal-table-header" style="width:13%;">원인</th>
                                                        <th class="modal-table-header wd_70">수량</th>
                                                        <th id="deleteAllError" class="modal-table-header wd_80" style="cursor: pointer;">
                                                            <i class="xi-trash"></i>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="drawingErrorHtml" class="wd_520" style="height: 125px;float:left;overflow-x: hidden;overflow-y: auto;">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="mt-10 d-flex" style="border-radius: 10px;padding: 0px 10px 10px 10px;color: black;">
                                        <div class="div_flex_column" style="width: 25%;">
                                            <div class="d-flex mt-10 mb-10" style="align-items: center;">
                                                <div class="arrow-left-50 mr-20 error_arrow_btn" data-type="minus"></div>
                                                <div class="arrow-right-50 error_arrow_btn" data-type="plus"></div>
                                            </div>
                                            <div class="d-flex mt-10 mb-10" style="align-items: center;">
                                                <span class="db_span_sm wd_60 mr-20 error_qty_btn" data-type="min">Min.</span>
                                                <span class="db_span_sm wd_60 error_qty_btn" data-type="max">Max.</span>
                                            </div>
                                        </div>
                                        <div class="div_flex_column mt-20" style="width: 43%;font-size: 40px;margin-left: 2%;">
                                            <select class="mb-20" id="INSPECT_RESULT" name="INSPECT_RESULT" title="검사종류 코드">
                                                <option value="">- 검사종류 코드 -</option>
                                                <c:forEach var="code" items="${HighCode.H_1015}">
                                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                                </c:forEach>
                                            </select>
                                            <select id="ERROR_REASON" name="ERROR_REASON" title="불량원인 코드">
                                                <option value="">- 불량원인 코드 -</option>
                                                <c:forEach var="code" items="${HighCode.H_1032}">
                                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                                </c:forEach>
                                            </select>
                                            <button type="button" id="closeErrorQtyBtn" class="gradeMaxBtn lightGray mt-30">Close</button>
                                        </div>
                                        <div class="div_flex_column mt-20" style="width: 30%;font-size: 40px;margin-left: 2%;">
                                            <button type="button" id="registErrorQtyBtn" class="green" style="font-size: 35px;padding: 30px;font-weight: bold;">등록</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<!-- Target Modal Start -->
<div class="modal" id="drawing_work_complete_popup" style="display: none;">
    <div class="modal-dialog" style="width: 650px;">
        <div class="modal-content">
            <div class="modal-body" style="height: 360px;padding-left: 25px;">
                <div class="tableWrap">
                    <div class="tab-content mt-10 d-flex" style="font-size: 27px;font-weight: bold;color: black;height: 50px;line-height: 50px;">
                        <div class="mr-10" style="width: 40%;text-align: center;background: #b7f7ff;">
                            <span>${drawingInfo.machineInfo.EQUIP_NM} ${drawingInfo.userInfo.USER_NM}</span>
                        </div>
                        <div style="width: 60%;text-align: center;background: #b7f7ff;">
                            <span><c:if test="${not empty workInfo}">${workInfo.CONTROL_NUM_NM}</c:if></span>
                        </div>
                    </div>
                    <div class="mb-20 mt-10" style="height: 195px;background: #e7fefe;text-align: center;color: black;padding: 10px;">
                        <div>
                            <div class="d-flex mt-20 ml-20">
                                <span class="timeTit wd_75 purple" style="font-size: 28px;border-radius: 10px;display: inline-grid;">목표
                                    <span style="font-size: 16px;">Target</span>
                                </span>
                                <span class="mt-15 mb-05 wd_130" style="text-align: center;font-size: 45px;min-height: 52px;">
                                    <c:if test="${not empty workInfo}">${workInfo.GOAL_QTY}</c:if>
                                </span>
                                        <span class="timeTit wd_75 green" style="font-size: 28px;border-radius: 10px;display: inline-grid;">완료
                                    <span style="font-size: 16px;">Complete</span>
                                </span>
                                <div class="div_sm_section">
                                    <div id="complete_success_qty_pop_minus_btn" class="arrow-left-25" data-type="minus"></div>
                                    <span id="completeControlCompleteQtyHtml" class="wd_130 COMPLETE_QTY" style="text-align: center;font-size: 45px;">${workInfo.FINISH_QTY}</span>
                                    <div id="complete_success_qty_pop_plus_btn" class="arrow-right-25" data-type="plus"></div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-30" style="font-size: 35px;font-weight: bold;">
                            작업을 <span class="text-blue">완료</span>합니다 <span id="complete_count_span">(5)</span>
                        </div>
                    </div>
                    <div class="mt-05 center_sort">
                        <button type="button" id="endBtnSave" class="gradeMaxBtn green" style="margin-right: 8%;">확인</button>
                        <button type="button" id="endBtnCancel" class="gradeMaxBtn lightGray">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Target Modal End -->

<form id="drawing_worker_form" method="post" action="/drawing-board">
    <input id="USER_ID" name="USER_ID" type="hidden" value="">
    <input id="USER_NM" name="USER_NM" type="hidden" value="">
    <input id="USER_GFILE_SEQ" name="USER_GFILE_SEQ" type="hidden" value="">
    <section class="contents">
        <ul class="userWrap" id="userWrapHtml"></ul>
    </section>
</form>
<!-- reserve Modal End -->
<script type='text/javascript'>

    let $waitMeMainContainer;
    /** reserveType 0: none, 1:stop, 2:pause **/
    let reserveType = 0;
    let reserveHour = 0;
    let reserveMinute = 0;
    let workHistoryList = [];

    let beforeReserveType = 0;
    let beforeReserveHour = 0;
    let beforeReserveMinute = 0;

    // 공통 SetTimeOut 변수
    let reserveInterval;
    let stopInterval;
    let workTimeInterval;
    let workTimeIntervalIsPause = false;

    var reserveHourHtml = 0;
    var reserveMinuteHtml = 0;
    var reserveSecondHtml = 0;

    const if_use_yn = $("#drawing_log_out_form").find("#IF_USE_YN").val();

    $.fn.startWaitMe = function() {
        $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
    };

    $.fn.stopWaitMe = function() {
        $waitMeMainContainer.waitMe('hide');
    };

    let showMessage = function(message){
        dhx.message({
            text: message, icon: "dxi-close", "expire": 2000, "position": "top-right", type:"myCss"
        });
    }

    /** 공통 처리 스크립트
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
                    showMessage('<srping:message key='error.common'/>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showMessage('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
            }
        });
    };

    /**
     *	Form reset 처리
     *	formId : form Id
     **/
    let fnResetForm = function (formid){
        if(formid.indexOf("#") == -1) formid = $("#"+formid);
        formid.find('input:text, input:password, input:file, textarea').val('');
        formid.find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
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

    alertify.drawingDialog || alertify.dialog('drawingDialog',function(){
        return {
            main:function(content){ this.setContent(content); },
            setup:function(){
                return { options:{ basic:true, maximizable:false, resizable:false, padding:false } };
            },
            settings:{ selector:undefined },
            hooks: {
                onshow: function() {
                    this.elements.dialog.style.maxWidth = 'none';
                    this.elements.dialog.style.width = '80%';
                }
            }
        };
    });

    const fnDrawingDialogAlert = function (elementId, autoClose) {
        let alertBox = alertify.drawingDialog($('#' + elementId)[0]);
        if (autoClose) {
            setTimeout(function() {
                alertBox.close();
            }, autoClose * 1000);
        }
    };

    alertify.drawingAlertDialog || alertify.dialog('drawingAlertDialog',function(){
        return {
            main:function(content){ this.setContent(content); },
            setup:function(){
                return { options:{ basic:true, maximizable:false, resizable:false, padding:false } };
            },
            settings:{ selector:undefined },
            hooks: {
                onshow: function() {
                    this.elements.dialog.style.maxWidth = 'none';
                    this.elements.dialog.style.width = '30%';
                }
            }
        };
    });

    async function fnDrawingAlertDialogAlert(elementId, autoClose) {
        let alertBox = alertify.drawingAlertDialog($('#' + elementId)[0]);
        if (autoClose) {
            await new Promise(resolve => setTimeout(resolve, 1000 + autoClose));
            alertBox.close();
            return;
        }
    };

    let getDrawingErrorList = function(){
        let innerHtmlObj = $("#drawing_error_qty_popup").find("#drawingErrorHtml");
        let parameters = {
            'url': '/drawing-json-list',
            'data': {"queryId":"drawingMapper.selectDrawingErrorList",
                "MCT_WORK_SEQ" : $("#drawing_error_qty_form").find("#MCT_WORK_SEQ").val()
            }
        };
        fnPostAjax(function (data, callFunctionParam) {
            let workerListHtml = "";
            innerHtmlObj.html("");
            if(data.list.length > 0 ) {
                for (let i = 0; i < data.list.length; i++) {
                    workerListHtml += '<tr>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 14%;">' + data.list[i].INSERT_DT + '</td>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 15%;">' + data.list[i].INSERT_ID + '</td>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 39%;">' + data.list[i].INSPECT_RESULT_NM + '</td>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 13%;">' + data.list[i].ERROR_REASON_NM + '</td>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 60px;">' + data.list[i].ERROR_QTY + '</td>';
                    workerListHtml += '    <td class="modal-table-contents deleteErrorQty" style="width: 50px;cursor:pointer;" data-target="'+ data.list[i].MCT_INSPECT_SEQ +'"><i class="xi-trash"></i></td>';
                    workerListHtml += '</tr>';
                }
            }else{
                workerListHtml += '<tr>';
                workerListHtml += '    <td class="modal-table-contents wd_515" colspan="6">Data Not Found.</td>';
                workerListHtml += '</tr>';
            }
            innerHtmlObj.append(workerListHtml);
        }, parameters, '');
    };

    $(function () {

        $(document).ajaxStart(function() {
            // show loader on start
            $(this).startWaitMe();
        }).ajaxSuccess(function() {
            // hide loader on success
            $(this).stopWaitMe();
        });

        /** 작업 예약 처리 팝업 **/
        $("#reserveBtn").on('click', function(){

            beforeReserveType = reserveType;
            beforeReserveHour = reserveHour;
            beforeReserveMinute = reserveMinute;

            reserveDisplayTime();
            reserveButtonSwitch();

            if(reserveType == 0){
                reserveType = 2;
            }

            reserveTypeSwitch();

            $("#drawing_reserve_time_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });

        $("#reserveSaveBtn").on('click', function(){
            clearTimeout(reserveInterval);

            var reserveSec = (reserveHour * 60 * 60 * 1000) + (reserveMinute * 60 * 1000);
            if(reserveSec <= 0){
                showMessage("<srping:message key='drawing.board.alert.09'/>");
                return false;
            }
            if(reserveType == 0){
                showMessage("<srping:message key='drawing.board.alert.10'/>");
                return false;
            }
            if(reserveType != 0) {

                reserveTypeSwitch();
                fnPopupCloseNotReload("drawing_reserve_time_popup");

                reserveInterval = setInterval(function() {

                    reserveSec -= 1000;

                    reserveHourHtml = reserveTimeSplit(reserveSec, 1);
                    reserveMinuteHtml = reserveTimeSplit(reserveSec, 2);
                    reserveSecondHtml = reserveTimeSplit(reserveSec, 3);

                    $("#workReserveTimeInfo").html('<span><span class="text-blue">' + reserveDisplayHtml(reserveHourHtml) + ":" + reserveDisplayHtml(reserveMinuteHtml) + ":" + reserveDisplayHtml(reserveSecondHtml) + '</span> <srping:message key="drawing.board.label.19"/> <span class="text-red">' + reserveDisplayType() + '</span></span>');

                    if(reserveSec <= 0) {
                        clearTimeout(reserveInterval);
                        if(reserveType == 1){
                            $("#workCompletelBtn").trigger('click');
                        }else{
                            reserveType = 0;
                            reserveHour = 0;
                            reserveMinute = 0;
                            reserveDisplayTime();
                            reserveTypeSwitch();
                            $("#workReserveTimeInfo").html('');
                            $("#workPuaseBtn").trigger('click');
                        }
                    }
                }, 1000);

            }
        });

        $("#reserveCancelBtn").on('click', function(){
            reserveType = 0;
            reserveHour = 0;
            reserveMinute = 0;
            clearTimeout(reserveInterval);
            $("#workReserveTimeInfo").html('<span class="timeTit"><srping:message key='drawing.board.button.02'/></span><span class="time"><span></span></span>');
            reserveDisplayTime();
            reserveTypeSwitch();
            fnPopupCloseNotReload("drawing_reserve_time_popup");
        });

        $("#reserveCloseBtn").on('click', function(){
            reserveType = beforeReserveType;
            reserveHour = beforeReserveHour;
            reserveMinute = beforeReserveMinute;
            reserveTypeSwitch();
            fnPopupCloseNotReload("drawing_reserve_time_popup");
        });

        $("#reserveEndCheckBtn").on('click', function(){
            reserveType = 1;
            reserveTypeSwitch();
        });

        $("#reservePauseCheckBtn").on('click', function(){
            reserveType = 2;
            reserveTypeSwitch();
        });

        /** 예약 시간 조정 **/
        $("#reserveHourUpBtn").on('click', function(){
            if(reserveHour >= 12) return;
            reserveHour++;
            reserveDisplayTime();
        });
        $("#reserveHourDownBtn").on('click', function(){
            if(reserveHour > 0) reserveHour--;
            reserveDisplayTime();
        });
        $("#reserveMinuteUpBtn").on('click', function(){
            if(reserveMinute >= 60) return;
            reserveMinute+=5;
            reserveDisplayTime();
        });
        $("#reserveMinuteDownBtn").on('click', function(){
            if(reserveMinute > 0) reserveMinute-=5;
            reserveDisplayTime();
        });

        /** 예약 시간(시, 분, 초) 두자리 표시
         * type : 1 (Hour), 2 (minute), 3 second
         **/
        let reserveTimeSplit = function(timeVal, type) {
            var time;
            switch (type) {
                case 1:
                    time = Math.floor((timeVal % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    break;
                case 2:
                    time = Math.floor((timeVal % (1000 * 60 * 60)) / (1000 * 60));
                    break;
                case 3:
                    time = Math.floor((timeVal % (1000 * 60)) / 1000);
                    break;
            }
            if(time) return parseInt(time);
            else return 0;
        }

        /** 예약 시간(시, 분, 초) 두자리 표시 **/
        let reserveDisplayHtml = function(timeVal) {
            var time = String(timeVal);
            if(timeVal < 10){
                time = "0" + time;
            }
            return time;
        }

        /** 예약 타입 표시 **/
        let reserveDisplayType = function() {
            var name = "";
            switch (reserveType) {
                case 1:
                    name = '<srping:message key='drawing.board.button.02'/>';
                    break;
                case 2:
                    name = '<srping:message key='drawing.board.button.07'/>';
                    break;
            }
            return name;
        }

        /** 예약 시간 표시 **/
        let reserveDisplayTime = function() {
            $("#drawing_reserve_time_popup").find("#reserveHourHtml").html(reserveHour);
            $("#drawing_reserve_time_popup").find("#reserveMinuteHtml").html(reserveMinute);
        }

        /** 예약 타입에 따른 버튼 표시 **/
        let reserveButtonSwitch = function() {
            switch (reserveType) {
                case 1:
                    $("#reserveCancelBtn").show();
                    break;
                case 2:
                    $("#reserveCancelBtn").show();
                    break;
                default:
                    $("#reserveCancelBtn").hide();
            }
        }

        /** 예약 타입에 따른 표시 **/
        let reserveTypeSwitch = function(){
            switch (reserveType) {
                case 1:
                    $("#drawing_reserve_time_popup").find("#reserveEndChecked").prop('checked', true);
                    $("#drawing_reserve_time_popup").find("#reservePauseChecked").prop('checked', false);
                    $("#reserveChecked").prop('checked', true);

                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").addClass("sky");
                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").removeClass("gray");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").addClass("gray");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").removeClass("sky");

                    $("#reserveBtn").addClass("reserveDbEnableBtn");
                    $("#reserveBtn").removeClass("reserveDbDisableBtn");
                    break;
                case 2:
                    $("#drawing_reserve_time_popup").find("#reserveEndChecked").prop('checked', false);
                    $("#drawing_reserve_time_popup").find("#reservePauseChecked").prop('checked', true);
                    $("#reserveChecked").prop('checked', true);

                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").addClass("gray");
                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").removeClass("sky");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").addClass("sky");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").removeClass("gray");

                    $("#reserveBtn").addClass("reserveDbEnableBtn");
                    $("#reserveBtn").removeClass("reserveDbDisableBtn");
                    break;
                default:
                    $("#drawing_reserve_time_popup").find("#reserveEndChecked").prop('checked', false);
                    $("#drawing_reserve_time_popup").find("#reservePauseChecked").prop('checked', false);
                    $("#reserveChecked").prop('checked', false);

                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").addClass("gray");
                    $("#drawing_reserve_time_popup").find("#reserveEndCheckBtn").removeClass("sky");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").addClass("gray");
                    $("#drawing_reserve_time_popup").find("#reservePauseCheckBtn").removeClass("sky");

                    $("#reserveBtn").addClass("reserveDbDisableBtn");
                    $("#reserveBtn").removeClass("reserveDbEnableBtn");
            }
        }

        // 스타일 변경 이벤트
        var ev = new $.Event('style'),
            orig = $.fn.css;
        $.fn.css = function() {
            $(this).trigger(ev);
            return orig.apply(this, arguments);
        }

        /** 메인 창에서 바코드 스캔 된 경우 **/
        /** 진행중인 작업이 없는 경우는 신규 작업 시작 처리 **/
        /** 진행중인 작업이 있는 경우 작업중인 바코드인 경우 종료 처리 팝업 호출
                                    신규 바코드 경우 현재 작업중인 내용 종료 처리 하고 자동으로 신규 작업 시작 처리 **/
        onScan.attachTo(document, {
            onScan: function(barcodeNum, iQty) {
                let barcodeTemp = barcodeNum.toUpperCase();
                if(barcodeTemp.indexOf("C") == 0 || barcodeTemp.indexOf("L") == 0 || barcodeTemp.indexOf("W") == 0) {
                    let parameters = {
                        'url': '/drawing/barcode',
                        'data': { 'queryId': 'drawingMapper.selectDrawingBarcodeScanInfo', 'BARCODE_NUM': barcodeNum}
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        let returnCode = data.returnCode;
                        let curStatus = $("#curStatus").val();
                        if (returnCode == "RET00") {
                            if (curStatus == "stop") {
                                if($("#drawing_worker_scan_popup").css('display') == 'none') {
                                    startWork(data.info);
                                }
                            } else if (curStatus == "work" && barcodeNum == $("#BARCODE_NUM").val()) {
                                $("#workCompletelBtn").trigger('click');
                            } else {
                                $("#singleComplete").hide();
                                $("#continueComplete").show();
                                $("#drawing_action_form").find("#RE_BARCODE_NUM").val(barcodeNum);
                                $("#workCompletelBtn").trigger('click');
                            }
                        } else if (returnCode == "RET97") {
                            fnDrawingDialogAlert('drawingVerErrorHtml', 3);
                        } else if (returnCode == "RET96") {
                            holdWork(data.info);
                        } else {
                            showMessage(data.message);
                            return false;
                        }
                    }, parameters, '');
                }else {
                    let parameters = {
                        'url': '/drawing-json-info',
                        'data': { 'queryId': 'drawingMapper.selectNfcData', 'NFC_ID': barcodeNum}
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        if(data.info == null) {
                            showMessage("등록되지 않은 기기입니다.");
                        }else {
                            $("#drawing_worker_form").find("#USER_ID").val(data.info.USER_ID)
                            $("#drawing_worker_form").find("#USER_NM").val(data.info.USER_NM)
                            $("#drawing_worker_form").find("#USER_GFILE_SEQ").val(data.info.PHOTO_GFILE_SEQ)
                            $("#drawing_worker_form").submit();
                        }
                    }, parameters, '');

                }
            }
        });

        $(".slecBox").on('click', function(){
            /** 대기 리스트와 plan 리스트를 조회한다. **/
            /** 첫번째 plan 리스트를 조회한다.**/
            $("#drawing_worker_target_list_popup").css("display", "block");
            $("#area_tab").trigger("click");
            $(".bodyWrap").addClass("modal-open-body");
        });

        //Stop Popup
        $("#workPuaseBtn").on('click', function(){
            let parameters = {
                'url': '/drawing-board-pause',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                $("#drawing_action_form").find("#CURRENT_STATUS_TIME").val(0);
                $("#drawing_worker_stop_popup").css("display", "block");
                $(".bodyWrap").addClass("modal-open-body");
                workTimeIntervalIsPause = true;
            }, parameters, '');
        });

        $("#drawing_worker_stop_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            let currTime = Number($("#drawing_action_form").find("#CURRENT_STATUS_TIME").val());
            let hours = 0;
            let minutes = 0;
            let seconds = 0;
            if(currTime > 0) {
                hours = Math.floor(currTime / 3600);
                minutes = Math.floor((currTime % 3600)/60);
                seconds = Math.floor((currTime % 3600) % 60);
            }
            if( display.indexOf("none") > 0){
                stopInterval = setInterval(function() {
                    seconds++;
                    if(seconds == 60){
                        seconds = 0;
                        minutes++;
                    }
                    if(minutes == 60){
                        minutes = 0;
                        hours++;
                    }
                    $("#stopSeconds").html(seconds + '&nbsp;<srping:message key='drawing.board.label.01'/>');
                    $("#stopMinutes").html(minutes + '&nbsp;<srping:message key='drawing.board.label.02'/>');
                    $("#stopHour").html(hours + '&nbsp;<srping:message key='drawing.board.label.20'/>');
                }, 1000);
                $("#drawing_worker_stop_popup").bind('style', function(e) {
                    let style =  $(this).attr('style');
                    let display = style.split(":")[1];
                    if( display.indexOf("block") > 0){
                        // $("#workRestartBtn").trigger("click");
                        clearTimeout(stopInterval);
                    }
                });
            }
        });
        /** 일시 중지 이후에 다시 재 시작 한 경우 처리 **/
        $("#workRestartBtn").on('click', function(){
            let parameters = {
                'url': '/drawing-board-restart',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnPopupClose("drawing_worker_stop_popup");
            }, parameters, '');
        });

        /** 작업 취소 팝업 호출 **/
        $("#workCancelBtn").on('click', function(){
            $("#drawing_worker_cancel_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });

        /* POPUP */
        //Target Popup
        let getWorkList = function(sType){
            let innerHtmlObj = $("#drawing_worker_target_list_popup").find("#equipBodyListHtml");
            let parameters = {
                'url': '/drawing-json-list',
                'data': {"queryId":"drawingMapper.selectDrawingBoardWorkPlanList", "EQUIP_SEQ" : $("#drawing_log_out_form").find("#EQUIP_SEQ").val()}
            };
            if(sType == "pop"){
                innerHtmlObj = $("#drawing_worker_target_list_popup").find("#popBodyListHtml");
                parameters = {
                    'url': '/drawing-json-list',
                    'data': {"queryId":"drawingMapper.selectDrawingBoardPopList", "FACTORY_AREA" : $("#drawing_log_out_form").find("#FACTORY_AREA").val()}
                };
            }
            fnPostAjax(function (data, callFunctionParam) {
                let workerListHtml = "";
                innerHtmlObj.html("");
                if(data.list.length > 0 ) {
                    for (let i = 0; i < data.list.length; i++) {
                        workerListHtml += '<tr class="workListAction" stype="'+sType+'" sBarcodeNum="' + data.list[i].BARCODE_NUM + '" >';
                        workerListHtml += '    <td class="modal-table-contents" style="width:283px;">' + data.list[i].CONTROL_NUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:87px;">' + data.list[i].PART_NUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:87px;">' + data.list[i].ORDER_QTY + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:108px;">' + data.list[i].INNER_DUE_DT + '</td>';
                        workerListHtml += '</tr>';
                    }
                }else{
                    workerListHtml += '<tr>';
                    workerListHtml += '    <td class="modal-table-contents" colspan="4">Data Not Found.</td>';
                    workerListHtml += '</tr>';
                }
                innerHtmlObj.append(workerListHtml).trigger('create');
            }, parameters, '');
        };

        let getLatestProcessList = function(){
            let innerHtmlObj = $("#drawing_latest_process_list_popup").find("#latestProcessListHtml");
            let parameters = {
                'url': '/drawing-json-list',
                'data': {"queryId":"drawingMapper.selectDrawingLatestProcessList",
                    "CONTROL_SEQ" : $("#drawing_action_form").find("#CONTROL_SEQ").val(),
                    "CONTROL_DETAIL_SEQ": $("#drawing_action_form").find("#CONTROL_DETAIL_SEQ").val()
                }
            };
            fnPostAjax(function (data, callFunctionParam) {
                let workerListHtml = "";
                innerHtmlObj.html("");
                if(data.list.length > 0 ) {
                    for (let i = 0; i < data.list.length; i++) {
                        workerListHtml += '<tr class="workListAction">';
                        workerListHtml += '    <td class="modal-table-contents" style="width:8%;">' + data.list[i].RNUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:11%;">' + data.list[i].PROCESS_TYPE_NM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:28%;">' + data.list[i].EQUIP_NM +'&nbsp;' + data.list[i].WORK_USER + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:30%;"><span class="ml-5" style="float: left;">' + data.list[i].WORK_START_DT +'</span><span class="mr-5 mt-05" style="float:right;min-width: 110px;"> - ' + ((typeof data.list[i].WORK_FINISH_DT != 'undefined')?data.list[i].WORK_FINISH_DT:'') + '</span></td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:70px;">' + ((typeof data.list[i].WORK_STATUS != 'undefined')?data.list[i].WORK_STATUS:'') + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:75px;">' + ((typeof data.list[i].FINISH_QTY != 'undefined')?data.list[i].FINISH_QTY:'') + '</td>';
                        workerListHtml += '</tr>';
                    }
                }else{
                    workerListHtml += '<tr>';
                    workerListHtml += '    <td class="modal-table-contents" colspan="6">Data Not Found.</td>';
                    workerListHtml += '</tr>';
                }
                innerHtmlObj.append(workerListHtml);
            }, parameters, '');
        };

        let getDrawingNote = function(){
            let innerHtmlObj = $("#drawing_note_list_popup").find("#drawingNoteHtml");
            let parameters = {
                'url': '/drawing-json-list',
                'data': {"queryId":"drawingMapper.selectDrawingNoteList",
                    "CONTROL_SEQ" : $("#drawing_action_form").find("#CONTROL_SEQ").val(),
                    "CONTROL_DETAIL_SEQ": $("#drawing_action_form").find("#CONTROL_DETAIL_SEQ").val()
                }
            };
            fnPostAjax(function (data, callFunctionParam) {
                let workerListHtml = "";
                innerHtmlObj.html("");
                if(data.list.length > 0 ) {
                    for (let i = 0; i < data.list.length; i++) {
                        workerListHtml += '<tr class="workListAction">';
                        workerListHtml += '    <td class="modal-table-contents" style="width:68px;">' + data.list[i].RNUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:150px;">' + data.list[i].NOTE_TYPE_NM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:340px;">' + data.list[i].NOTE + '</td>';
                        workerListHtml += '</tr>';
                    }
                }else{
                    workerListHtml += '<tr>';
                    workerListHtml += '    <td class="modal-table-contents" colspan="3">Data Not Found.</td>';
                    workerListHtml += '</tr>';
                }
                innerHtmlObj.append(workerListHtml);
            }, parameters, '');
        };

        let getDrawingQualityHistory = function(){
            let innerHtmlObj = $("#drawing_quality_history_popup").find("#drawingWorkHistoryHtml");
            let parameters = {
                'url': '/drawing-json-list',
                'data': {"queryId":"drawingMapper.selectDrawingQualityHistoryList",
                    "CONTROL_SEQ" : $("#drawing_action_form").find("#CONTROL_SEQ").val(),
                    "CONTROL_DETAIL_SEQ": $("#drawing_action_form").find("#CONTROL_DETAIL_SEQ").val(),
                    "EQUIP_SEQ": $("#drawing_log_out_form").find("#EQUIP_SEQ").val()
                }
            };
            fnPostAjax(function (data, callFunctionParam) {
                let workerListHtml = "";
                innerHtmlObj.html("");
                if(data.list.length > 0 ) {
                    workHistoryList = data.list;
                    for (let i = 0; i < data.list.length; i++) {
                        workerListHtml += ' <tr class="tr_row rnum_' + data.list[i].RNUM +' '+((i == 0)?'select':'') +'">';
                        workerListHtml += '    <td class="modal-table-contents" style="width: 33%;">' + data.list[i].INSPECT_DT + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width: 48%;">' + ((data.list[i].WORKER_NM !== undefined)?data.list[i].WORKER_NM:'') + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" rowspan="2">' + data.list[i].INSPECT_GRADE_NM + '<br>'
                        workerListHtml += '     (' + data.list[i].INSPECT_GRADE_NOTE + ')';
                        workerListHtml += '     </td>';
                        workerListHtml += ' </tr>';
                        workerListHtml += ' <tr class="tr_row rnum_'+ data.list[i].RNUM + ' ' + ((i == 0)?'select':'') +'">';
                        workerListHtml += '    <td class="modal-table-contents"colspan="2">' + data.list[i].CONTROL_NUM + '</td>';
                        workerListHtml += ' </tr>';

                        if(i == 0) {
                            $("#drawing_quality_history_popup").find("#drawing_history_image").attr("src", "/qimage/" + data.list[i].IMG_GFILE_SEQ);
                            if(data.list[i].INSPECT_GRADE != 'GRD010' && data.list[i].INSPECT_GRADE != 'GRD020') {
                                $("#drawing_quality_history_popup").find(".drawing_history_img_table").show();
                                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_INSPECT_RESULT_NM").text(data.list[i].INSPECT_RESULT_NM);
                                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_PROCESS_NM").text(data.list[i].ERROR_PROCESS_NM);
                                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_REASON_NM").text(data.list[i].ERROR_REASON_NM);
                                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_NOTE").text(data.list[i].INSPECT_DESC);
                            }
                        }
                    }
                }else{
                    workerListHtml += '<tr>';
                    workerListHtml += '    <td class="modal-table-contents" style="width: 360px;" colspan="3">Data Not Found.</td>';
                    workerListHtml += '</tr>';
                }
                innerHtmlObj.append(workerListHtml);
            }, parameters, '');
        };

        $(".targetListClose").on('click', function(){
            fnPopupClose("drawing_worker_target_list_popup");
        });

        $("#equip_tab").on('click', function(){
            getWorkList("plan");
            $(".equipWrap").css('display', 'block');
            $(".areaWrap").css('display', 'none');
        });

        $("#area_tab").on('click', function(){
            getWorkList("pop");
            $(".equipWrap").css('display', 'none');
            $(".areaWrap").css('display', 'block');
        });

        $(document).on("click", '#drawing_worker_target_list_popup .workListAction', function() {
            let barcodeNum = $(this).attr("sBarcodeNum");
            let parameters = {
                'url': '/drawing/barcode',
                'data': { 'queryId': 'drawingMapper.selectDrawingBarcodeScanInfo', 'BARCODE_NUM': barcodeNum}
            };
            fnPostAjax(function (data, callFunctionParam) {
                let returnCode = data.returnCode;
                if(returnCode == "RET00") {
                    startWork(data.info);
                }else if(returnCode == "RET97"){
                    fnDrawingDialogAlert('drawingVerErrorHtml', 3);
                }else if(returnCode == "RET96"){
                    holdWork(data.info);
                }else{
                    showMessage(data.message);
                    return false;
                }
            }, parameters, '');
        });

        /** 보류 상태 팝업 처리 **/
        let holdWork = function(dataInfo){
            $("#drawing_worker_hold_popup").find("#holdControlNumHtml").html(dataInfo.CONTROL_INFO);
            $("#drawing_worker_hold_popup").css("display", "block");
            $("#holdBtnSave").on('click', function(){
                $("#drawing_worker_target_list_popup").css("display", "none");
                startWork(dataInfo);
            });
            $("#holdBtnCancel").on('click', function(){
                $("#drawing_worker_hold_popup").css("display", "none");
            });
        };

        let restartWorkControlNumFn = function(reStartWorkControlNum){
            if(reStartWorkControlNum){
                let barcodeNum = $("#re_start_work_info_form").find("#RE_BARCODE_NUM").val();
                let parameters = {
                    'url': '/drawing/barcode',
                    'data': { 'queryId': 'drawingMapper.selectDrawingBarcodeScanInfo', 'BARCODE_NUM': barcodeNum}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    let returnCode = data.returnCode;
                    if(returnCode == "RET00") {
                        startWork(data.info);
                    }else if(returnCode == "RET97"){
                        fnDrawingDialogAlert('drawingVerErrorHtml', 3);
                    }else{
                        showMessage(data.message);
                        return false;
                    }
                }, parameters, '');
            }
        };

        let startWork = function(dataInfo){
            if(dataInfo.SAME_SIDE_YN_NM){
                fnDrawingDialogAlert('sameSideYnDivHtml', 1);
            }
            $("#drawing_worker_scan_popup").find("#scanControlNumHtml").html(dataInfo.CONTROL_INFO);
            $("#drawing_worker_scan_popup").find("#scanControlOrderQtyHtml").html(dataInfo.ORDER_QTY_INFO);

            let scanAlertMessage = "";
            if(dataInfo.SAME_SIDE_YN_NM) scanAlertMessage += '<span class="listAlertBtn">'+dataInfo.SAME_SIDE_YN_NM+'</span>';
            if(dataInfo.MAIN_INSPECTION_NM) scanAlertMessage += '<span class="listAlertBtn">'+dataInfo.MAIN_INSPECTION_NM+'</span>';
            if(dataInfo.MATERIAL_FINISH_HEAT_NM) scanAlertMessage += '<span class="listAlertBtn">'+dataInfo.MATERIAL_FINISH_HEAT_NM+'</span>';

            $("#drawing_worker_scan_popup").find("#scanAlertMessageHtml").html(scanAlertMessage);

            $("#drawing_action_form").find("#CONTROL_SEQ").val(dataInfo.CONTROL_SEQ);
            $("#drawing_action_form").find("#CONTROL_DETAIL_SEQ").val(dataInfo.CONTROL_DETAIL_SEQ);
            $("#drawing_worker_target_list_popup").css("display", "none");
            $("#drawing_worker_scan_popup").css("display", "block");
        };

        //Scan Popup
        $("#drawing_worker_scan_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            let seconds = 7;
            // let seconds = 5000;
            if( display.indexOf("none") > 0){
                $("#drawing_worker_scan_popup .scan-time").html(seconds);
                stopInterval = setInterval(function() {
                    seconds--;
                    $("#drawing_worker_scan_popup .scan-time").html(seconds);
                    $("#drawing_worker_scan_popup").bind('style', function(e) {
                        let style =  $(this).attr('style');
                        let display = style.split(":")[1];
                        if( display.indexOf("block") > 0){
                            clearTimeout(stopInterval);
                        }
                    });
                    if(seconds == 0) {
                        clearTimeout(stopInterval);
                        fnDrawingBoardSave();
                    }
                }, 1000);
            }
        });

        $("#scanBtnSave").on('click', function(){
            fnDrawingBoardSave();
        });

        $("#scanBtnCancel").on('click', function(){
            fnPopupClose("drawing_worker_scan_popup");
        });

        //Cancel Popup
        $("#cancelBtnCancel").on('click', function(){
            fnPopupClose("drawing_worker_cancel_popup");
        });

        $("#cancelBtnSave").on('click', function(){
            let parameters = {
                'url': '/drawing-board-cancel',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnDrawingAlertDialogAlert('cancelDivHtml', 3).then(result =>
                    fnPopupClose("drawing_worker_cancel_popup")
                );
            }, parameters, '');
        });

        /** 종료 즉 완료하기 팝업창 자동 호출 **/
        $("#workCompletelBtn").on('click', function(){
            $("#drawing_work_complete_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
            let goalQty = $("#drawing_action_form").find("#GOAL_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY_COPY").val();
            if(goalQty != finishQty) {
                $("#drawing_work_complete_popup").find("#completeControlCompleteQtyHtml").text(goalQty);
                $("#drawing_action_form").find("#FINISH_QTY").val(goalQty);
            }
            if(if_use_yn != "Y") {
                workTimeIntervalIsPause = true;
            }
        });

        $("#drawing_work_complete_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            let seconds = 5;
            if( display.indexOf("none") > 0){
                $("#drawing_work_complete_popup").find("#complete_count_span").text("("+seconds+")");
                stopInterval = setInterval(function() {
                    seconds--;
                    $("#drawing_work_complete_popup").find("#complete_count_span").text("("+seconds+")");
                    $("#drawing_work_complete_popup").bind('style', function(e) {
                        let style =  $(this).attr('style');
                        let display = style.split(":")[1];
                        if( display.indexOf("block") > 0){
                            clearTimeout(stopInterval);
                        }
                    });
                    if(seconds == 0) {
                        clearTimeout(stopInterval);
                        $("#endBtnSave").trigger('click');
                    }
                }, 1000);
            }
        });

        /** 작업 완료 취소 처리 **/
        $("#endBtnCancel").on('click', function(){
            $("#singleComplete").show();
            $("#continueComplete").hide();
            $("#drawing_action_form").find("#RE_BARCODE_NUM").val('');
            fnPopupCloseNotReload("drawing_work_complete_popup");
            if(if_use_yn != "Y") {
                workTimeIntervalIsPause = false;
            }
        });

        /** 작업 완료 처리 **/
        $("#endBtnSave").on('click', function(){
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let finishParseQty = isNaN(parseInt(finishQty)) ? 0 : parseInt(finishQty);
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);
            if(finishParseQty <= 0 && errorParseQty <= 0){
                showMessage("<srping:message key='drawing.board.alert.05'/>");
                return false;
            }
            let parameters = {
                'url': '/drawing-board-complete',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnDrawingAlertDialogAlert('completeDivHtml', 3).then(result =>
                    fnPopupClose("drawing_work_complete_popup")
                );
            }, parameters, '');
        });

        /** 작업 완료 플러스 처리 **/
        $("#complete_success_qty_pop_plus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_work_complete_popup").find("#complete_count_span").text("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let afterQty = parseInt(finishQty) + 1;

            $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
            $("#drawing_work_complete_popup").find("#completeControlCompleteQtyHtml").html(afterQty);
        });

        /** 작업 완료 마이너스 처리 **/
        $("#complete_success_qty_pop_minus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_work_complete_popup").find("#complete_count_span").text("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let afterQty = parseInt(finishQty) - 1;
            if(afterQty < 0) return false;
            $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
            $("#drawing_work_complete_popup").find("#completeControlCompleteQtyHtml").html(afterQty);
        });

        /** 불량 수량 플러스 처리 **/
        $("#complete_fail_qty_pop_plus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY_COPY").val();

            let finishParseQty = isNaN(parseInt(finishQty)) ? 0 : parseInt(finishQty);
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);

            let afterErrorQty = parseInt(errorParseQty) + 1;
            if(afterErrorQty > orderQty) return false;

            $("#drawing_action_form").find("#ERROR_QTY").val(afterErrorQty);
            $("#completeControlFailQtyHtml").html(afterErrorQty);
        });

        $("#latest_process_list").on('click', function(){
            getLatestProcessList();
            $("#drawing_latest_process_list_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });

        $("#closeProcessListBtn").on('click', function(){
            fnPopupCloseNotReload('drawing_latest_process_list_popup');
        });

        $("#note_list").on('click', function(){
            getDrawingNote();
            $("#drawing_note_list_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        })

        $("#closeNoteListBtn").on('click', function(){
            fnPopupCloseNotReload('drawing_note_list_popup');
        });

        $("#drawing_quality_history").on('click', function(){
            getDrawingQualityHistory();
            $("#drawing_quality_history_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        })

        $("#closeWorkHistoryBtn").on('click', function(){
            fnPopupCloseNotReload('drawing_quality_history_popup');

            $("#drawing_quality_history_popup").find("#drawing_history_image").attr("src", "/resource/main/blank.jpg");
            $("#drawing_quality_history_popup").find(".drawing_history_img_table").hide();
            $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_INSPECT_RESULT_NM").val("");
            $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_PROCESS_NM").val("");
            $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_REASON_NM").val("");
            $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_NOTE").val("");
        });

        $("#edit_qty_info").on('click', function(){
            let dataType = $("#drawing_action_form").find("#DATA_TYPE").val();
            if (dataType == "CUR") {
                $("#drawing_edit_qty_popup").css("display", "block");
                $(".bodyWrap").addClass("modal-open-body");
            }
        })

        $("#closeEditQtyBtn").on('click', function(){
            $("#drawing_edit_qty_form").find("#GOAL_QTY").val('${workInfo.GOAL_QTY}')
            $("#drawing_edit_qty_form").find("#GOAL_QTY_SPAN").text('${workInfo.GOAL_QTY}');
            $("#drawing_edit_qty_form").find("#COMPLETE_QTY").val('${workInfo.COMPLETE_QTY}');
            $("#drawing_edit_qty_form").find("#COMPLETE_QTY_SPAN").text('${workInfo.COMPLETE_QTY}');
            $("#drawing_edit_qty_form").find("#UNIT_QTY").val('${workInfo.UNIT_QTY}');
            $("#drawing_edit_qty_form").find("#UNIT_QTY_SPAN").text('${workInfo.UNIT_QTY}');
            $("#drawing_edit_qty_form").find("#ADJUST_QTY").val('${workInfo.ADJUST_QTY}');
            $("#drawing_edit_qty_form").find("#ADJUST_QTY_SPAN").text('${workInfo.ADJUST_QTY}');
            fnPopupCloseNotReload('drawing_edit_qty_popup');
        });

        $("#saveEditQtyBtn").on('click', function(){
            let parameters = {
                'url': '/drawing-json-update',
                'data': {
                    'queryId':'drawingMapper.updateMctWorkQty',
                    'MCT_WORK_SEQ':$("#drawing_edit_qty_form").find("#MCT_WORK_SEQ").val(),
                    'GOAL_QTY':$("#drawing_edit_qty_form").find("#GOAL_QTY").val(),
                    'LOGIN_USER_ID':$("#drawing_log_out_form").find("#USER_ID").val()
                }
            };
            if(if_use_yn == "Y") {
                parameters.data.UNIT_QTY = $("#drawing_edit_qty_form").find("#UNIT_QTY").val();
                parameters.data.ADJUST_QTY = $("#drawing_edit_qty_form").find("#ADJUST_QTY").val();
            }
            fnPostAjax(function (data, callFunctionParam) {
                fnDrawingAlertDialogAlert('saveDivHtml', 3).then(result =>
                    fnPopupClose('drawing_edit_qty_popup')
                );
            }, parameters, '');
        });

        $(".unitQty_arrow_btn").on('click', function (e) {
            let type = $(this).data('type');
            let unitQty = Number($("#drawing_edit_qty_form").find("#UNIT_QTY").val());
            let completeQty = Number($("#drawing_edit_qty_form").find("#COMPLETE_QTY").val());
            let finishCycle = Number($("#drawing_action_form").find("#COMPLETE_CYCLE_COUNT").val());

            if(type == 'plus') {
                unitQty = unitQty + 1;
            }else if(type == 'minus') {
                unitQty = unitQty - 1;
                if(unitQty <= 0) {
                    unitQty = 1;
                }
            }
            $("#drawing_edit_qty_form").find("#UNIT_QTY").val(unitQty);
            $("#drawing_edit_qty_form").find("#UNIT_QTY_SPAN").text(unitQty);

            completeQty = Number(unitQty) * (finishCycle);
            $("#drawing_edit_qty_form").find("#COMPLETE_QTY").val(completeQty);
            $("#drawing_edit_qty_form").find("#COMPLETE_QTY_SPAN").text(completeQty);

            $("#drawing_edit_qty_form").find("#ADJUST_QTY").val(0);
            $("#drawing_edit_qty_form").find("#ADJUST_QTY_SPAN").text(0);

        });

        $(".qty_arrow_btn").on('click', function (e) {
            let type = $(this).data('type');
            let target = $(this).data('target');
            let newQty = Number($(this).parents('form').find("#"+target).val());
            let targetQty = Number($(this).parents('form').find("#"+target).val());
            let finishQty = Number($("#drawing_action_form").find("#FINISH_QTY_COPY").val());

            if(type == 'plus') {
                newQty = Number(targetQty) + 1;
            }else if(type == 'minus') {
                newQty = Number(targetQty) - 1;
            }

            if(target == 'GOAL_QTY' && newQty > finishQty) {
                newQty = finishQty;
            }else if(newQty < 0) {
                newQty = 0;
            }

            if(target == 'COMPLETE_QTY') {
                let finishCycle = Number($("#drawing_action_form").find("#COMPLETE_CYCLE_COUNT").val());
                let unitQty = Number($("#drawing_edit_qty_form").find("#UNIT_QTY").val());
                let defaultQty = unitQty * finishCycle;
                let adjustQty =  newQty - defaultQty;
                $("#drawing_edit_qty_form").find("#ADJUST_QTY").val(adjustQty);
                $("#drawing_edit_qty_form").find("#ADJUST_QTY_SPAN").text(((adjustQty>0)?'+':'') + adjustQty);
            }

            $(this).parents('form').find("#"+target).val(newQty);
            $(this).parents('form').find("#"+target+"_SPAN").text(newQty);
        });

        $(".qtyBtn").on('click', function (e) {
            let type = $(this).data('type');
            let target = $(this).data('target');
            let newQty = Number($(this).parents('form').find("#"+target).val());
            let finishQty = Number($("#drawing_action_form").find("#FINISH_QTY_COPY").val());
            let finishCycle = Number($("#drawing_action_form").find("#COMPLETE_CYCLE_COUNT").val());
            let unitQty = Number($("#drawing_edit_qty_form").find("#UNIT_QTY").val());

            if(type == 'min') {
                newQty = 0;
            }else if(type == 'half') {
                newQty = Math.floor(finishQty / 2);
            }else if(type == 'max') {
                newQty = finishQty;
            }

            if(target == "COMPLETE_QTY") {
                let defaultQty = unitQty * finishCycle;
                let adjustQty =  newQty - defaultQty;
                $("#drawing_edit_qty_form").find("#ADJUST_QTY").val(adjustQty);
                $("#drawing_edit_qty_form").find("#ADJUST_QTY_SPAN").text(((adjustQty>0)?'+':'') + adjustQty);
            }

            $(this).parents('form').find("#"+target).val(newQty);
            $(this).parents('form').find("#"+target+"_SPAN").text(newQty);
        })

        $("#inputErrorQtyBtn").on('click', function(){
            getDrawingErrorList();
            $("#drawing_error_qty_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        })

        $("#closeErrorQtyBtn").on('click', function(){
            // $("#drawing_error_qty_form #INSPECT_RESULT option:eq(0)").prop("selected", true);
            // $("#drawing_error_qty_form #ER7ROR_REASON option:eq(0)").prop("selected", true);
            // $("#drawing_error_qty_form").find("#ERROR_QTY").val(1);
            // $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(1);
            fnPopupClose('drawing_error_qty_popup');
        })

        $("#registErrorQtyBtn").on('click', function(){
            let inspectResult = $("#drawing_error_qty_form").find("#INSPECT_RESULT").val();
            let errReason = $("#drawing_error_qty_form").find("#ERROR_REASON").val();

            if(inspectResult == "" || errReason == "") {
                fnDrawingAlertDialogAlert('errorDivHtml', 3);
            }else {
                let parameters = {
                    'url': '/drawing-error-regist',
                    'data': $("#drawing_error_qty_form").serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnDrawingAlertDialogAlert('saveDivHtml', 3);
                    getDrawingErrorList();
                    $("#drawing_error_qty_form #INSPECT_RESULT option:eq(0)").prop("selected", true);
                    $("#drawing_error_qty_form #ER7ROR_REASON option:eq(0)").prop("selected", true);
                    $("#drawing_error_qty_form").find("#ERROR_QTY").val(1);
                    $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(1);
                }, parameters, '');
            }
        })

        $(".error_arrow_btn").on('click', function() {
            let type = $(this).data('type');
            let finishQty = Number($("#drawing_action_form").find("#FINISH_QTY_COPY").val());
            let errorQty = Number($("#drawing_error_qty_form").find("#ERROR_QTY").val());

            if(type == 'plus') {
                errorQty++;
            }else if(type == 'minus') {
                errorQty--;
            }
            if(errorQty > finishQty) {
                errorQty = finishQty
            }else if(errorQty <= 0) {
                errorQty = 1;
            }

            $("#drawing_error_qty_form").find("#ERROR_QTY").val(errorQty);
            $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(errorQty);
        })

        $(".error_qty_btn").on('click', function() {
            let type = $(this).data('type');
            let finishQty = Number($("#drawing_action_form").find("#FINISH_QTY_COPY").val());
            let errorQty = Number($("#drawing_error_qty_form").find("#ERROR_QTY").val());

            if(type == 'min') {
                errorQty = 1;
            }else if(type == 'max') {
                errorQty = finishQty;
            }

            $("#drawing_error_qty_form").find("#ERROR_QTY").val(errorQty);
            $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(errorQty);
        });

        $("#deleteAllError").on('click', function () {
            let trLength = $("#drawingErrorHtml").find("tr").length;
            if(trLength > 0) {
                let parameters = {
                    'url': '/drawing-json-delete',
                    'data': {
                        'queryId':"drawingMapper.deleteAllErrorQty",
                        'MCT_WORK_SEQ': $("#drawing_error_qty_form").find("#MCT_WORK_SEQ").val(),
                        'LOGIN_USER_ID':$("#drawing_log_out_form").find("#USER_ID").val()
                    }
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnDrawingAlertDialogAlert('saveDivHtml', 3);
                    getDrawingErrorList();
                    $("#drawing_error_qty_form #INSPECT_RESULT option:eq(0)").prop("selected", true);
                    $("#drawing_error_qty_form #ERROR_REASON option:eq(0)").prop("selected", true);
                    $("#drawing_error_qty_form").find("#ERROR_QTY").val(1);
                    $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(1);
                }, parameters, '');
            }
        })

        /* POPUP */
        let reloadDrawingBoard = function(){
            $("#drawing_action_form").submit();
        };

        function fnDrawingBoardSave(){
            /** todo 최신 작업과 같은 Part 작업인 경우 진행 안되도록 처리 **/
            let parameters = {
                'url': '/drawing-board-start',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnResetForm("drawing_action_form");
                fnDrawingAlertDialogAlert('startDivHtml', 3).then(result =>
                    fnPopupClose("drawing_worker_scan_popup")
                );
            }, parameters, '');
        }

        function fnPopupClose(popId){
            $("#"+popId).css("display", "none");
            $(".bodyWrap").removeClass("modal-open-body");
            reloadDrawingBoard();
        }

        function fnPopupCloseNotReload(popId){
            $("#"+popId).css("display", "none");
            $(".bodyWrap").removeClass("modal-open-body");
            $("#bodyWrap").focus();
        }

        function fnRemainTimeSet(seconds){
            let html = seconds + " " + '<srping:message key='drawing.board.alert.04'/>';
            return html;
        }

        let work_stop_interval;
        function stopTimer() {
            let currTime = Number($("#drawing_action_form").find("#CURRENT_STATUS_TIME").val()) + Number($("#drawing_action_form").find("#WORK_STOP_TIME").val());
            let hours = 0;
            let minutes = 0;
            let seconds = 0;
            if(currTime > 0) {
                hours = Math.floor(currTime / 3600);
                minutes = Math.floor((currTime % 3600)/60);
                seconds = Math.floor((currTime % 3600) % 60);
            }
            work_stop_interval = setInterval(function() {
                seconds++;
                if(seconds == 60){
                    seconds = 0;
                    minutes++;
                }
                if(minutes == 60){
                    minutes = 0;
                    hours++;
                }
                $("#WORK_STOP_TIME_SPAN").text(hours +'h ' + minutes +'m ' + seconds + 's');
            },1000);
        }

        let work_active_interval;
        function activeTimer() {
            let currTime = Number($("#drawing_action_form").find("#CURRENT_STATUS_TIME").val()) + Number($("#drawing_action_form").find("#WORK_ACTIVE_TIME").val());
            let hours = 0;
            let minutes = 0;
            let seconds = 0;
            if(currTime > 0) {
                hours = Math.floor(currTime / 3600);
                minutes = Math.floor((currTime % 3600)/60);
                seconds = Math.floor((currTime % 3600) % 60);
            }
            work_active_interval = setInterval(function() {
                if (!workTimeIntervalIsPause){
                    seconds++;
                    if(seconds == 60){
                        seconds = 0;
                        minutes++;
                    }
                    if(minutes == 60){
                        minutes = 0;
                        hours++;
                    }
                    $("#WORK_ACTIVE_TIME_SPAN").text(hours +'h ' + minutes +'m ' + seconds + 's');
                }
            },1000);
        }

        let work_cycle_active_interval;
        function cycleActiveTimer() {
            let currTime = Number($("#drawing_action_form").find("#CURRENT_STATUS_TIME").val());
            let hours = 0;
            let minutes = 0;
            let seconds = 0;
            if(currTime > 0) {
                hours = Math.floor(currTime / 3600);
                minutes = Math.floor((currTime % 3600)/60);
                seconds = Math.floor((currTime % 3600) % 60);
            }
            work_cycle_active_interval = setInterval(function() {
                if (!workTimeIntervalIsPause){
                    seconds++;
                    if(seconds == 60){
                        seconds = 0;
                        minutes++;
                    }
                    if(minutes == 60){
                        minutes = 0;
                        hours++;
                    }
                    $("#CYCLE_ACTIVE_SPAN").text(hours +'h ' + minutes +'m ' + seconds + 's');
                }
            },1000);
        }

        let work_left_interval;
        function leftTimer() {
            let currTime = Number($("#drawing_action_form").find("#LEFT_TIME").val());
            let hours = 0;
            let minutes = 0;
            let seconds = 0;

            work_left_interval = setInterval(function() {
                if (!workTimeIntervalIsPause){
                    if(currTime > 0) {
                        currTime--;

                        if(currTime < 0) {
                            currTime = 0;
                        }

                        hours = Math.floor(currTime / 3600);
                        minutes = Math.floor((currTime % 3600)/60);
                        seconds = Math.floor((currTime % 3600) % 60);

                        $("#LEFT_TIME_SPAN").text(hours +'h ' + minutes +'m ' + seconds + 's');
                    }else {
                        clearInterval(work_left_interval);
                    }
                }
            },1000);
        }

        function makeTimeSec(time) {
            let hours = 0;
            let minutes = 0;
            let seconds = 0;
            if(time > 0) {
                hours = Math.floor(time / 3600);
                minutes = Math.floor((time % 3600)/60);
                seconds = Math.floor((time % 3600) % 60);
            }

            return hours + 'h ' + minutes +'m ' + seconds + 's';
        }

        let setFocusBody = function(){
            $("#bodyWrap").focus();
            let workStatus = $("#drawing_action_form").find("#WORK_STATUS").val();
            let dataType = $("#drawing_action_form").find("#DATA_TYPE").val();
            let leftTime = $("#drawing_action_form").find("#LEFT_TIME").val();
            $("#LEFT_TIME_SPAN").text(makeTimeSec(leftTime));
            if (dataType === "CUR") {
                if(workStatus == 'DBS010'){ // 임시중지상태
                    if(if_use_yn != 'Y') {
                        $("#drawing_worker_stop_popup").css("display", "block");
                        $(".bodyWrap").addClass("modal-open-body");
                        workTimeIntervalIsPause = true;
                    }else {
                        stopTimer();
                        clearTimeout(work_active_interval);
                        clearTimeout(work_cycle_active_interval);
                        clearTimeout(work_left_interval);
                    }
                }else{ // 진행중
                    activeTimer();
                    if(if_use_yn == 'Y') {
                        clearTimeout(work_stop_interval);
                        cycleActiveTimer();
                        if(leftTime > 0) {
                            leftTimer();
                        }
                    }
                    $("#bodyWrap").focus();
                }
            }
        }

        function clearAllTimer() {
            clearTimeout(work_active_interval);
            clearTimeout(work_cycle_active_interval);
            clearTimeout(work_left_interval);
            clearTimeout(work_stop_interval);
        }

        let iConnectCount = 0;
        function jmesConnect() {
            let socket = new SockJS('/jmes-ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, (frame) => {
                stompClient.subscribe('/topic/notice', function (notificationMessage) {
                    if(if_use_yn == "Y") {
                        var data = JSON.parse(notificationMessage.body);
                        let dataList = data.list;
                        let equipSeq = $("#drawing_log_out_form").find("#EQUIP_SEQ").val();
                        let equipNm = $("#drawing_log_out_form").find("#EQUIP_NM").val().replace("-","");
                        let curWorkStatus = $("#drawing_action_form").find("#WORK_STATUS").val();
                        if(data.equipNm.includes(equipNm)) {
                            $.each(dataList, function (idx,Item) {
                                if(Item.EQUIP_SEQ == equipSeq) {
                                    $("#bodyWrap").removeClass("stop");
                                    $("#bodyWrap").removeClass("work");
                                    $("#bodyWrap").removeClass("nc_off");

                                    if(Item.WORK_STATUS == 'DBS010') {
                                        $("#bodyWrap").addClass("stop");
                                    }else if(Item.WORK_STATUS == 'DBS020'){
                                        $("#bodyWrap").addClass("work");
                                    }

                                    if(Item.EQUIP_OFF_YN == 'Y') {
                                        $("#bodyWrap").addClass("nc_off");
                                    }

                                    if(typeof Item.MCT_WORK_SEQ != 'undefined' && Item.MCT_WORK_SEQ != null && Item.MCT_WORK_SEQ != '') {
                                        $(".UNIT_QTY").text(Item.UNIT_QTY);
                                        $(".COMPLETE_CYCLE_COUNT").text(Item.COMPLETE_CYCLE_COUNT);
                                        $(".COMPLETE_QTY").text(Item.COMPLETE_QTY);
                                        $("#finish_cycle_time").text(Item.LATEST_CYCLE_TIME);
                                        $("#drawing_edit_qty_form").find("#UNIT_QTY").val(Item.UNIT_QTY);
                                        $("#drawing_action_form").find("#COMPLETE_CYCLE_COUNT").val(Item.COMPLETE_CYCLE_COUNT);
                                        $("#drawing_action_form").find("#WORK_STATUS").val(Item.WORK_STATUS);
                                        $("#drawing_action_form").find("#COMPLETE_QTY").val(Item.COMPLETE_QTY);
                                        $("#drawing_edit_qty_form").find("#COMPLETE_QTY").val(Item.COMPLETE_QTY);
                                        $("#drawing_action_form").find("#LEFT_TIME").val(Item.LEFT_TIME);
                                        $("#drawing_action_form").find("#CURRENT_STATUS_TIME").val(Item.CURRENT_STATUS_TIME);
                                        $("#drawing_action_form").find("#WORK_ACTIVE_TIME").val(Item.WORK_ACTIVE_TIME);
                                        $("#drawing_action_form").find("#WORK_STOP_TIME").val(Item.WORK_STOP_TIME);
                                        clearAllTimer();
                                        setFocusBody();
                                    }
                                }
                            })
                        }
                    }
                });
            }, () => {
                setTimeout(() => {
                    if(iConnectCount == 6) {
                        fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
                        return;
                    }else if(iConnectCount <= 5){
                        jmesConnect();
                    }
                    iConnectCount++
                }, 5000);
            });
        }

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
        /** Main 페이지 로딩시 Body 기본으로 Focus 되도록 처리 **/
        setFocusBody();
        // if(if_use_yn == "Y") {
            jmesConnect();
        // }

        restartWorkControlNumFn($("#re_start_work_info_form").find("#CONTROL_NUM").val());

    });
    $(document).on("click",".tr_row",function(e){
        let className = $(this).attr('class').split(" ");
        let commonClass = className[1];
        let rnum = className[1].replace("rnum_","");

        $("#drawing_quality_history_popup").find("#drawing_history_image").attr("src", "/resource/main/blank.jpg");
        $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_INSPECT_RESULT_NM").text("");
        $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_PROCESS_NM").text("");
        $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_REASON_NM").text("");
        $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_NOTE").text("");

        $.each(workHistoryList, function (idx,Item) {
            if(Item.RNUM == rnum) {
                $("#drawing_quality_history_popup").find("#drawing_history_image").attr("src", "/qimage/" + Item.IMG_GFILE_SEQ);
                if(Item.INSPECT_GRADE == 'GRD010' || Item.INSPECT_GRADE == 'GRD020') {
                    $("#drawing_quality_history_popup").find(".drawing_history_img_table").hide();
                }else {
                    $("#drawing_quality_history_popup").find(".drawing_history_img_table").show();
            }
                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_INSPECT_RESULT_NM").text(Item.INSPECT_RESULT_NM);
                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_PROCESS_NM").text(Item.ERROR_PROCESS_NM);
                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_REASON_NM").text(Item.ERROR_REASON_NM);
                $("#drawing_quality_history_popup").find("#DRAWING_HISTORY_ERROR_NOTE").text(Item.INSPECT_DESC);
            }
        })

        $(".tr_row").removeClass("select");
        if(!$(this).hasClass("select")) {
            $("."+commonClass).addClass("select");
        }
    })

    $(document).on("click",".deleteErrorQty",function(e){
        let mctInspectSeq = $(this).data('target');

        if(mctInspectSeq != null && mctInspectSeq != "") {

            let parameters = {
                'url': '/drawing-json-delete',
                'data': {
                    'queryId':"drawingMapper.deleteErrorQty",
                    'MCT_INSPECT_SEQ': mctInspectSeq,
                    'LOGIN_USER_ID':$("#drawing_log_out_form").find("#USER_ID").val()
                }
            };

            fnPostAjax(function (data, callFunctionParam) {
                fnDrawingAlertDialogAlert('saveDivHtml', 3)
                getDrawingErrorList();
                $("#drawing_error_qty_form #INSPECT_RESULT option:eq(0)").prop("selected", true);
                $("#drawing_error_qty_form #ERROR_REASON option:eq(0)").prop("selected", true);
                $("#drawing_error_qty_form").find("#ERROR_QTY").val(1);
                $("#drawing_error_qty_form").find("#ERROR_QTY_SPAN").text(1);
            }, parameters, '');
        }
    });
</script>
</body>
