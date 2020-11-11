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

    <style type="text/css">

        html {
            cursor: none;
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
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;">시작 되었습니다.</h3></td>
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
                <td><h3 style="font-size: 30px;font-weight: bold; text-align: center;">완료 되었습니다.</h3></td>
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
                <td width="45%"><h3 style="font-size: 44px;font-weight: bold; text-align: center;">대칭주의</h3></td>
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
                <td width="65%"><h3 style="font-size: 24px;font-weight: bold;">도면정보가 변경되었습니다.</h3></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><h3 style="font-size: 24px;font-weight: bold;">사무실에 확인 바랍니다.</h3></td>
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
                    <div><p class="stop-txt"><span class="red-txt">일시정지</span> 되었습니다</p></div>
                    <div>
                        <p class="stop-time"><srping:message key="drawing.board.label.14"/> :
                            <span id="stopMinutes">0<srping:message key="drawing.board.label.01"/></span>
                            <span id="stopSeconds">0<srping:message key="drawing.board.label.02"/></span>
                        </p>
                    </div>
                    <div style="text-align: center;">
                        <button type="button" id="workRestartBtn" class="gradeMidBtn red"><srping:message key="drawing.board.button.13"/></button>
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
                    <div><p class="stop-txt">작업을<span class="red-txt">취소</span>하시겠습니까?</p></div>
                    <br/>
                    <div style="text-align: center;">
                        <button type="button" id="cancelBtnSave" class="gradeMidBtn red"><srping:message key="drawing.board.button.05"/></button>
                        <button type="button" id="cancelBtnCancel" class="gradeMidBtn white"><srping:message key="drawing.board.button.12"/></button>
                    </div>
<%--                    <div>--%>
<%--                        <button id="cancelBtnSave">Yes</button>--%>
<%--                        <button id="cancelBtnCancel">Cancel</button>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cancel Modal End -->
<!-- End Modal Start -->
<div class="modal-scan" id="drawing_worker_end_popup" style="display: none;">
    <div class="modal-end-dialog">
        <div class="modal-end-content">
            <div class="modal-end-body">
                <div class="tableWrap">
                    <div><h1 class="stop-txt" id="completeControlNumHtml"></h1></div>
                    <br/>
                    <table>
                        <tbody>
                        <tr>
                            <td class="modal-end-dialog-table-header-end" style="width:30%;"><srping:message key="drawing.board.label.15"/></td>
                            <td class="modal-end-dialog-table-header-end" style="width:30%; color: red"><srping:message key="drawing.board.label.16"/></td>
                            <td class="modal-end-dialog-table-header-end" style="width:40%;"><srping:message key="drawing.board.label.17"/></td>
                        </tr>
                        <tr>
                            <td class="modal-end-dialog-table-contents-end">
                                <button type="button" style="padding-right: 0px; position: absolute; right: 625px; top: 144px;" class="btn_plus" id="complete_success_qty_pop_plus_btn">더하기</button>
                                <span class="text" style="padding-right: 23px; font-size: 40px; position: absolute; right: 536px; top: 146px;" id="completeControlCompleteQtyHtml">0</span>
                                <button type="button" style="position: absolute; right: 489px; top: 144px;" class="btn_minus" id="complete_success_qty_pop_minus_btn">빼기</button>
                            </td>
                            <td class="modal-end-dialog-table-contents-end">
                                <button type="button" style="position: absolute; right: 424px; top: 144px;" class="btn_plus" id="complete_fail_qty_pop_plus_btn">더하기</button>
                                <span class="text" style="padding-right: 23px; font-size: 40px; position: absolute; right: 337px; top: 146px;" id="completeControlFailQtyHtml">1</span>
                                <button type="button" class="btn_minus" style="position: absolute; right: 289px; top: 144px;" id="complete_fail_qty_pop_minus_btn">빼기</button>
                            </td>
                            <td class="modal-end-dialog-table-contents-end">
                                <select id="ERROR_REASON" name="ERROR_REASON">
                                    <option value="" selected><srping:message key="com.frm.select.default.option"/></option>
                                    <c:forEach var="code" items="${errorReasonList}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <div id="singleComplete" style="display: block"><p class="end-txt"><srping:message key="drawing.board.message.01"/></p></div>
                    <div id="continueComplete" style="display: none"><p class="continue-end-txt"><srping:message key="drawing.board.message.02"/></p></div>
                    <div style="text-align: right;">
                        <h1 class="scan-time" style="font-size: 70px; font-weight: bold;">10 <srping:message key="drawing.board.alert.04"/></h1>
                        <button type="button" id="endBtnSave" class="gradeMaxBtn red"><srping:message key="drawing.board.button.05"/></button>
                        <button type="button" id="endBtnCancel" class="gradeMaxBtn white"><srping:message key="drawing.board.button.12"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal End -->
<div class="bodyWrap work" id="bodyWrap">
    <div id="waitMeContainerDiv">
        <c:set var="workInfo" value="${drawingInfo.lastWork}" />
        <c:if test="${not empty drawingInfo.currentWork}">
            <c:set var="workInfo" value="${drawingInfo.currentWork}" />
        </c:if>
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
                <input id="FINISH_QTY" name="FINISH_QTY" type="hidden" value="${workInfo.ORDER_QTY}">
                <input id="ERROR_QTY" name="ERROR_QTY" type="hidden" value="">
                <input id="ERROR_REASON" name="ERROR_REASON" type="hidden" value="">
                <input id="RE_BARCODE_NUM" name="RE_BARCODE_NUM" type="hidden" value="">
                <input id="WORK_MINUTE" name="WORK_MINUTE" type="hidden" value="${workInfo.WORK_MINUTE}">
                <input id="WORK_SECOND" name="WORK_SECOND" type="hidden" value="${workInfo.WORK_SECOND}">
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
                <input id="USER_ID" name="USER_ID" type="hidden" value="${drawingInfo.userInfo.USER_ID}">
    <%--            <input id="CONTROL_SEQ" name="CONTROL_SEQ" type="hidden" value="<c:if test="${not empty workInfo}">${workInfo.CONTROL_SEQ}</c:if>">--%>
    <%--            <input id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" type="hidden" value="<c:if test="${not empty workInfo}">${workInfo.CONTROL_DETAIL_SEQ}</c:if>">--%>
                <div class="logInWrap">
                    <div class="mainTit">${drawingInfo.machineInfo.EQUIP_NM}</div>
                    <div class="userWrap">
                        <div class="userImg"><img src="/image/${drawingInfo.userInfo.USER_GFILE_SEQ}" alt=""></div>
                        <div class="userInfo">
                            <p class="name">${drawingInfo.userInfo.USER_NM}</p>
                            <p><span class="dept">(${drawingInfo.userInfo.USER_ID})</span></p>
                        </div>
                        <div class="logStatus"><button type="submit">Log off</button></div>
                    </div>
                    <%--<div class="langBtn">
                        <button type="button" class="on">Korean</button>
                        <button type="button">English</button>
                    </div>--%>
                </div>
            </form>
        </div>
        <div class="rightDbWorkWrap">
            <div class="workInWrap">
                <c:if test="${empty drawingInfo.currentWork}">
                    <input type="hidden" name="curStatus" id="curStatus" value="stop">
                    <div class="contsTitWrap" id="workMainLastConts">
                        <div class="contsTit"><srping:message key='drawing.board.label.11'/></div>
                        <div class="slecBox"><a href="#"><srping:message key='drawing.board.label.12'/></a></div>
                    </div>
                </c:if>
                <c:if test="${not empty drawingInfo.currentWork}">
                    <input type="hidden" name="curStatus" id="curStatus" value="work">
                    <div class="contsTitWrap" id="workMainProgressConts" style="">
                        <div class="contsTit"><srping:message key='drawing.board.label.13'/></div>
                        <div class="right_sort">
                            <button type="button" id="workCancelBtn" class="graDbBtn red"><srping:message key='drawing.board.button.06'/></button>&nbsp;
                            <button type="button" id="workPuaseBtn" class="graDbBtn yellow"><srping:message key='drawing.board.button.07'/></button>&nbsp;
                            <button type="button" id="workCompletelBtn" class="graDbBtn purple"><srping:message key='drawing.board.button.08'/></button>
                        </div>
    <%--                    <div class="endBox"><a href="#">종료하기</a></div>--%>
    <%--                    <div class="stopBox"><a href="#">일시</br>정지</a></div>--%>
    <%--                    <div class="cancelBox"><a href="#">작업</br>취소</a></div>--%>
                    </div>
                </c:if>
                <div class="contsWrap">
                    <div class="topConts">
                        <div class="timeWrap">
                            <span class="timeTit"><srping:message key='drawing.board.button.01'/></span>
                            <span class="time"><span><c:if test="${not empty workInfo}">${workInfo.WORK_START_DT}</c:if></span></span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit"><srping:message key='drawing.board.button.02'/></span>
                            <span class="time"><span><c:if test="${not empty workInfo}">${workInfo.WORK_FINISH_DT}</c:if></span></span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit"><srping:message key='drawing.board.button.03'/></span>
                            <span class="time" id="stopTimeInfo">
                                <c:if test="${not empty workInfo}">${workInfo.STOP_MINUTE}</c:if> &nbsp;<srping:message key='drawing.board.label.02'/>
                                <c:if test="${not empty workInfo}">${workInfo.STOP_SECOND}</c:if> &nbsp;<srping:message key='drawing.board.label.01'/>
                            </span>
                        </div>
                        <div class="timeWrap <c:if test="${workInfo.DATA_TYPE eq 'CUR'}">yellowBackground</c:if>">
                            <span style="padding-top: 3px;" class="timeTit <c:if test="${workInfo.DATA_TYPE eq 'CUR'}">sandglass</c:if><c:if test="${workInfo.DATA_TYPE ne 'CUR'}">sandglass_stop</c:if>">
                                <srping:message key='drawing.board.button.04'/></span>
                            <span class="time" id="workTimeInfo">
                                <c:if test="${not empty workInfo}">${workInfo.WORK_MINUTE}</c:if> &nbsp;<srping:message key='drawing.board.label.02'/>
                                <c:if test="${not empty workInfo}">${workInfo.WORK_SECOND}</c:if> &nbsp;<srping:message key='drawing.board.label.01'/>
                            </span>
                        </div>
                    </div>
                    <div class="middleConts">
                        <div class="tbl">
                            <table>
                                <caption>관리번호, Part, 수량, 납기로 구분된 테이블</caption>
                                <colgroup>
                                    <col width="383px">
                                    <col width="107px">
<%--                                    <col width="111px">--%>
                                    <col width="107px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><srping:message key='drawing.board.label.03'/></th>
                                    <th><srping:message key='drawing.board.label.05'/></th>
                                    <th><srping:message key='drawing.board.label.06'/></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><div><c:if test="${not empty workInfo}">${workInfo.CONTROL_NUM_NM}</c:if></div></td>
<%--                                    <td><div><c:if test="${not empty workInfo}">${workInfo.PART_NUM}</c:if></div></td>--%>
                                    <td><div><c:if test="${not empty workInfo}">${workInfo.ORDER_QTY_INFO}</c:if></div></td>
                                    <td><div><c:if test="${not empty workInfo}">${workInfo.INNER_DUE_DT}</c:if></div></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="share">
                            <div class="shareTit"><srping:message key='drawing.board.label.07'/></div>
                            <div class="shareConts">
                                <c:if test="${not empty workInfo}">${workInfo.NOTE}</br></c:if>
                                <c:if test="${not empty workInfo}">${workInfo.MCT_NOTE}</c:if>
                            </div>
                        </div>
                        <div class="qual">
                            <div class="qualTit"><srping:message key='drawing.board.label.08'/></div>
                            <div class="qualConts">
                                <span>
                                    <c:if test="${not empty workInfo.INSPECT_DT}">
                                        ${workInfo.INSPECT_DT}&nbsp;${workInfo.INSPECT_GRADE_NM}&nbsp;${workInfo.INSPECT_RESULT_NM}&nbsp;${workInfo.ERROR_REASON_NM}
                                    </c:if>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="alertConts">
                        <c:if test="${not empty workInfo && workInfo.MAIN_INSPECTION ne ''}">
                            <span class="alertBox">${workInfo.MAIN_INSPECTION}</span>
                        </c:if>
                        <c:if test="${not empty workInfo && workInfo.EMERGENCY_YN eq 'Y'}">
                            <span class="alertBox"><srping:message key='drawing.board.label.10'/></span>
                        </c:if>
                        <c:if test="${not empty workInfo && workInfo.SAME_SIDE_YN eq 'Y'}">
                            <span class="alertBox"><srping:message key='drawing.board.label.18'/></span>
                        </c:if>
                        <c:if test="${not empty workInfo && workInfo.MATERIAL_FINISH_HEAT ne ''}">
                            <span class="alertBox">${workInfo.MATERIAL_FINISH_HEAT}</span>
                        </c:if>
                        <c:if test="${(empty workInfo || (workInfo.MATERIAL_FINISH_HEAT eq '' &&  workInfo.MAIN_INSPECTION eq '' &&  orkInfo.EMERGENCY_YN ne 'Y' && workInfo.SAME_SIDE_YN ne 'Y'))}">
                            <span style="height: 35px; line-height: 35px;">&nbsp; &nbsp;</span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript'>

    var $waitMeMainContainer;

    $.fn.startWaitMe = function() {
        $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
    };

    $.fn.stopWaitMe = function() {
        $waitMeMainContainer.waitMe('hide');
    };

    $(function () {

        $(document).ajaxStart(function() {
            // show loader on start
            $(this).startWaitMe();
        }).ajaxSuccess(function() {
            // hide loader on success
            $(this).stopWaitMe();
        });

        // 공통 SetTimeOut 변수
        let stopInterval;
        let workTimeInterval;

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
                let parameters = {
                    'url': '/drawing/barcode',
                    'data': { 'queryId': 'drawingMapper.selectDrawingBarcodeScanInfo', 'BARCODE_NUM': barcodeNum}
                };
                fnPostAjax(function (data, callFunctionParam) {

                    let returnCode = data.returnCode;
                    let curStatus = $("#curStatus").val();

                    if(returnCode == "RET00") {
                        if (curStatus == "stop") {
                            startWork(data.info);
                        } else if (curStatus == "work" && barcodeNum == $("#BARCODE_NUM").val()) {
                            $("#workCompletelBtn").trigger('click');
                        } else {
                            $("#singleComplete").hide();
                            $("#continueComplete").show();
                            $("#drawing_action_form").find("#RE_BARCODE_NUM").val(barcodeNum);
                            $("#workCompletelBtn").trigger('click');
                        }
                    }else if(returnCode == "RET97"){
                        fnDrawingDialogAlert('drawingVerErrorHtml', 3);
                    }else{
                        showMessage(data.message);
                        return false;
                    }
                }, parameters, '');
            }
        });

        $(".slecBox").on('click', function(){
            /** 대기 리스트와 plan 리스트를 조회한다. **/
            /** 첫번째 plan 리스트를 조회한다.**/
            // getWorkList("pop");
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
                $("#drawing_worker_stop_popup").css("display", "block");
                $(".bodyWrap").addClass("modal-open-body");
            }, parameters, '');
        });

        $("#drawing_worker_stop_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];

            let seconds = 0;
            let minutes = 0;
            let hours = 0;
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
                    $("#stopSeconds").html(seconds + '<srping:message key='drawing.board.label.01'/>');
                    $("#stopMinutes").html(minutes + '<srping:message key='drawing.board.label.02'/>');
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
                reloadDrawingBoard();
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

        $(".targetListClose").on('click', function(){
            fnPopupClose("drawing_worker_target_list_popup");
            setFocusBody();
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
                }else{
                    showMessage(data.message);
                    return false;
                }
            }, parameters, '');
        });

        let reStartWorkControlNum = $("#re_start_work_info_form").find("#CONTROL_NUM").val();

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
        }

        //Scan Popup
        $("#drawing_worker_scan_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            // let seconds = 10;
            let seconds = 5000;
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
            setFocusBody();
        });

        //Cancel Popup
        $("#cancelBtnCancel").on('click', function(){
            fnPopupClose("drawing_worker_cancel_popup");
            setFocusBody();
        });

        $("#cancelBtnSave").on('click', function(){
            let parameters = {
                'url': '/drawing-board-cancel',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnPopupClose("drawing_worker_cancel_popup");
                reloadDrawingBoard();
            }, parameters, '');
        });

        /** 종료 즉 완료하기 팝업창 자동 호출 **/
        $("#workCompletelBtn").on('click', function(){
            $("#drawing_worker_end_popup").find("#completeControlNumHtml").html($("#drawing_action_form").find("#CONTROL_NUM").val());
            $("#drawing_worker_end_popup").find("#completeControlCompleteQtyHtml").html($("#drawing_action_form").find("#FINISH_QTY").val());
            $("#drawing_worker_end_popup").find("#completeControlFailQtyHtml").html($("#drawing_action_form").find("#ERROR_QTY").val());
            $("#drawing_worker_end_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });

        $("#drawing_worker_end_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            // let seconds = 10;
            let seconds = 50000;
            if( display.indexOf("none") > 0){
                $("#drawing_worker_end_popup .scan-time").html(seconds);
                stopInterval = setInterval(function() {
                    seconds--;
                    $("#drawing_worker_end_popup .scan-time").html(seconds);
                    $("#drawing_worker_end_popup").bind('style', function(e) {
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
            fnPopupClose("drawing_worker_end_popup");
            reloadDrawingBoard();
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
                fnPopupClose("drawing_worker_end_popup");
                fnDrawingAlertDialogAlert('completeDivHtml', 1);
                reloadDrawingBoard();
            }, parameters, '');
        });

        /** 작업 완료 플러스 처리 **/
        $("#complete_success_qty_pop_plus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let afterQty = parseInt(finishQty) + 1;
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);
            if((afterQty + errorParseQty) > orderQty) return false;
            $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
            $("#completeControlCompleteQtyHtml").html(afterQty);
        });

        /** 작업 완료 마이너스 처리 **/
        $("#complete_success_qty_pop_minus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let afterQty = parseInt(finishQty) - 1;
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);
            if(afterQty < 0) return false;
            $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
            $("#completeControlCompleteQtyHtml").html(afterQty);
            // if((afterQty + errorParseQty) <= orderQty && afterQty >= 0 ){
            //     $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
            //     $("#completeControlCompleteQtyHtml").html(afterQty);
            // }
        });

        /** 불량 수량 플러스 처리 **/
        $("#complete_fail_qty_pop_plus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let finishParseQty = isNaN(parseInt(finishQty)) ? 0 : parseInt(finishQty);
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);
            let afterQty = parseInt(errorParseQty) + 1
            if((finishParseQty + afterQty) > orderQty) return false;
            $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
            $("#completeControlFailQtyHtml").html(afterQty);
            // if((afterQty + finishParseQty) <= orderQty){
            //     $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
            //     $("#completeControlFailQtyHtml").html(afterQty);
            // }
        });

        /** 불량 수량 마이너스 처리 **/
        $("#complete_fail_qty_pop_minus_btn").on('click', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let finishParseQty = isNaN(parseInt(finishQty)) ? 0 : parseInt(finishQty);
            let errorParseQty = isNaN(parseInt(errorQty)) ? 0 : parseInt(errorQty);
            let afterQty = parseInt(errorQty) - 1;
            if(afterQty < 0) return false;
            $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
            $("#completeControlFailQtyHtml").html(afterQty);
            // if((afterQty + finishParseQty) <= orderQty && afterQty >= 0) {
            //     $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
            //     $("#completeControlFailQtyHtml").html(afterQty);
            // }
        });

        $("#ERROR_REASON").on('change', function(){
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
            $("#drawing_action_form").find("#ERROR_REASON").val($(this).val());
        });

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
                fnDrawingAlertDialogAlert('startDivHtml', 1);
                fnResetFrom("drawing_action_form");
                fnPopupClose("drawing_worker_scan_popup");
                reloadDrawingBoard();
            }, parameters, '');
        }

        function fnPopupClose(popId){
            $("#"+popId).css("display", "none");
            $(".bodyWrap").removeClass("modal-open-body");
            reloadDrawingBoard();
        }

        function fnRemainTimeSet(seconds){
            let html = seconds + " " + '<srping:message key='drawing.board.alert.04'/>';
            return html;
        }

        let setFocusBody = function(){
            $("#bodyWrap").focus();
            let minutes = $("#drawing_action_form").find("#WORK_MINUTE").val();
            let seconds = $("#drawing_action_form").find("#WORK_SECOND").val();
            let dataType = $("#drawing_action_form").find("#DATA_TYPE").val();
            if( dataType === "CUR"){
                workTimeInterval = setInterval(function() {
                    seconds++;
                    if(seconds == 60){
                        seconds = 0;
                        minutes++;
                    }
                    let workTimeHtml = minutes + '<srping:message key='drawing.board.label.02'/>' + '&nbsp;' + seconds + '<srping:message key='drawing.board.label.01'/>'
                    $("#workTimeInfo").html(workTimeHtml);
                }, 1000);
            }
            $("#bodyWrap").focus();
        }

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
       let fnResetFrom = function (formid){
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

        const fnDrawingAlertDialogAlert = function (elementId, autoClose) {
            let alertBox = alertify.drawingAlertDialog($('#' + elementId)[0]);
            if (autoClose) {
                setTimeout(function() {
                    alertBox.close();
                }, autoClose * 1000);
            }
        };

        // fnDrawingAlertDialogAlert('completeDivHtml', 9999);

        /** Main 페이지 로딩시 Body 기본으로 Focus 되도록 처리 **/
        setFocusBody();

    });
</script>
</body>
