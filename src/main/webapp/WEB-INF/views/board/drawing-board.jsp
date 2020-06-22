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
    <link href="/resource/asset/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/tab.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <script type="text/javascript" src='/resource/plugins/waitme/waitMe.js'></script>
    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)">

<!-- Target Modal Start -->
<div class="modal" id="drawing_worker_target_list_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="buttonWrap right_float">
                    <button type="button" id="area_tab" class="listBlueBtn save">대기</button>
                    <button type="button" id="equip_tab" class="listBlueBtn save">스케줄</button>
                    <button type="button" class="listGrnBtn closeBe targetListClose">닫기</button>
                </div>
                <div class="tableWrap">
                    <div class="tab-content">
                        <div class="equipWrap workList">
                            <table class="modal-table">
                                <thead>
                                    <tr>
                                        <th class="modal-table-header" style="width:65%;">관리번호</th>
                                        <th class="modal-table-header" style="width:10%;">Part</th>
                                        <th class="modal-table-header" style="width:12%;">수량</th>
                                        <th class="modal-table-header" style="width:15%;">납기</th>
                                    </tr>
                                </thead>
                                <tbody id="equipBodyListHtml"></tbody>
                            </table>
                        </div>
                        <div class="areaWrap workList" style="display: none">
                            <table class="modal-table">
                                <thead>
                                    <tr>
                                        <th class="modal-table-header" style="width:65%;">관리번호</th>
                                        <th class="modal-table-header" style="width:10%;">Part</th>
                                        <th class="modal-table-header" style="width:12%;">수량</th>
                                        <th class="modal-table-header" style="width:15%;">납기</th>
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

<!-- Scan Modal Start -->
<div class="modal-scan" id="drawing_worker_scan_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-scan-content">
            <div class="modal-scan-body">
                <div class="tableWrap">
                    <table>
                        <tbody>
                        <tr>
                            <td class="modal-table-contents">관리번호</td>
                            <td class="modal-table-contents">Part</td>
                            <td class="modal-table-contents">수량</td>
                            <td class="modal-table-contents">납기</td>
                        </tr>
                        <tr>
                            <td class="modal-table-header" id="scanControlNumHtml"></td>
                            <td class="modal-table-header" id="scanControlPartHtml"></td>
                            <td class="modal-table-header" id="scanControlOrderQtyHtml"></td>
                            <td class="modal-table-header" id="scanControlInnerOutDtHtml"></td>
                        </tr>
                        </tbody>
                    </table>
                    <div><p class="work-txt">작업을 시작하겠습니까?</p></div>
                    <div class="buttonCenterWrap">
                        <button type="button" id="scanBtnSave" class="listBlueBtn save">시작</button>
                        <button type="button" id="scanBtnCancel" class="listGrnBtn closeBe">취소</button>
                    </div>
                    <div><p class="scan-time">5초 후 자동 진행됩니다 (5)</p></div>
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
                        <p class="stop-time">정지시간 :
                            <span id="stopMinutes">0분</span>
                            <span id="stopSeconds">0초</span>
                        </p>
                    </div>
                    <div style="text-align: center;">
                        <button type="button" id="workRestartBtn" class="gradeMidBtn red">작업재개</button>
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
                        <button type="button" id="cancelBtnSave" class="gradeMidBtn red">취소</button>
                        <button type="button" id="cancelBtnCancel" class="gradeMidBtn white">닫기</button>
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
    <div class="modal-dialog">
        <div class="modal-stop-content">
            <div class="modal-stop-body">
                <div class="tableWrap">
                    <table>
                        <tbody>
                        <tr>
                            <td class="modal-table-header" style="width:10%;">관리번호</td>
                            <td class="modal-table-contents" id="completeControlNumHtml" style="width:50%;text-align: left"></td>
                            <td class="modal-table-header" style="width:8%;">Part</td>
                            <td class="modal-table-contents" id="completeControlPartNumHtml" style="width:7%;"></td>
                            <td class="modal-table-header" style="width:10%;">수량</td>
                            <td class="modal-table-contents" id="completeControlOrderQtyHtml" style="width:15%; text-align: right;"></td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <table>
                        <tbody>
                        <tr>
                            <td class="modal-table-header-end" style="width:30%;">완료수량</td>
                            <td class="modal-table-header-end" style="width:30%;">불량</td>
                            <td class="modal-table-header-end" style="width:40%;">불량원인</td>
                        </tr>
                        <tr>
                            <td class="modal-table-contents-end">
                                <button type="button" style="padding-right: 0px; position: absolute; right: 525px; top: 142px;" class="btn_plus" id="complete_success_qty_pop_plus_btn">더하기</button>
                                <span class="text" style="padding-right: 23px; font-size: 31px; position: absolute; right: 460px; top: 148px;" id="completeControlCompleteQtyHtml">0</span>
                                <button type="button" style="position: absolute; right: 420px; top: 142px;" class="btn_minus" id="complete_success_qty_pop_minus_btn">빼기</button>
                            </td>
                            <td class="modal-table-contents-end">
                                <button type="button" style="position: absolute; right: 355px; top: 142px;" class="btn_plus" id="complete_fail_qty_pop_plus_btn">더하기</button>
                                <span class="text" style="padding-right: 23px; font-size: 31px; position: absolute; right: 286px; top: 148px;" id="completeControlFailQtyHtml">1</span>
                                <button type="button" class="btn_minus" style="position: absolute; right: 250px; top: 142px;" id="complete_fail_qty_pop_minus_btn">빼기</button>
                            </td>
                            <td class="modal-table-contents-end">
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
                    <div><p class="end-txt">작업을<span class="red-txt">완료 하시겠습니까?</span> </p></div>
                    <div style="text-align: center;">
                        <button type="button" id="endBtnSave" class="gradeMaxBtn red">완료</button>
                        <button type="button" id="endBtnCancel" class="gradeMaxBtn white">닫기</button>
                    </div>
<%--                    <div>--%>
<%--                        <button id="endBtnSave">Yes</button>--%>
<%--                        <button id="endBtnCancel">Cancel</button>--%>
<%--                    </div>--%>
                    <div><p class="scan-time">5초 후 자동 진행됩니다 (5)</p></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal End -->
<div class="bodyWrap work waitMeContainerDiv" id="bodyWrap">
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
        </form>
        <form id="drawing_log_out_form" name="drawing_log_out_form" method="POST" action="/drawing-worker">
            <input id="EQUIP_NM" name="EQUIP_NM" type="hidden" value="${drawingInfo.machineInfo.EQUIP_NM}">
            <input id="EQUIP_SEQ" name="EQUIP_SEQ" type="hidden" value="${drawingInfo.machineInfo.EQUIP_SEQ}">
            <input id="FACTORY_AREA" name="FACTORY_AREA" type="hidden" value="${drawingInfo.machineInfo.FACTORY_AREA}">
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
    <div class="rightWorkWrap">
        <div class="workInWrap">
            <c:if test="${empty drawingInfo.currentWork}">
                <div class="contsTitWrap" id="workMainLastConts">
                    <div class="contsTit">최근 작업내용</div>
                    <div class="slecBox"><a href="#">작업대상 선택</a></div>
                </div>
            </c:if>
            <c:if test="${not empty drawingInfo.currentWork}">
                <div class="contsTitWrap" id="workMainProgressConts" style="">
                    <div class="contsTit">진행중인 작업</div>
                    <div class="right_sort">
                        <button type="button" id="workCancelBtn" class="gradeMidBtn red">작업취소</button>
                        <button type="button" id="workPuaseBtn" class="gradeMidBtn green">일시정지</button>
                        <button type="button" id="workCompletelBtn" class="gradeMidBtn purple">종료하기</button>
                    </div>
<%--                    <div class="endBox"><a href="#">종료하기</a></div>--%>
<%--                    <div class="stopBox"><a href="#">일시</br>정지</a></div>--%>
<%--                    <div class="cancelBox"><a href="#">작업</br>취소</a></div>--%>
                </div>
            </c:if>
            <div class="contsWrap">
                <div class="topConts">
                    <div class="timeWrap">
                        <span class="timeTit">시작</span>
                        <span class="time"><span><c:if test="${not empty workInfo}">${workInfo.WORK_START_DT}</c:if></span></span>
                    </div>
                    <div class="timeWrap">
                        <span class="timeTit">종료</span>
                        <span class="time"><span><c:if test="${not empty workInfo}">${workInfo.WORK_FINISH_DT}</c:if></span></span>
                    </div>
                    <div class="timeWrap">
                        <span class="timeTit">정지</span>
                        <span class="time"><c:if test="${not empty workInfo}">${workInfo.STOP_TIME}</c:if>분</span>
                    </div>
                    <div class="timeWrap">
                        <span class="timeTit">작업</span>
                        <span class="time"><c:if test="${not empty workInfo}">${workInfo.WORK_TIME}</c:if>분</span>
                    </div>
                </div>
                <div class="middleConts">
                    <div class="tbl">
                        <table>
                            <caption>관리번호, Part, 수량, 납기로 구분된 테이블</caption>
                            <colgroup>
                                <col width="288px">
                                <col width="91px">
                                <col width="111px">
                                <col width="107px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>관리번호</th>
                                <th>Part</th>
                                <th>수량</th>
                                <th>가공납기</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><div><c:if test="${not empty workInfo}">${workInfo.CONTROL_NUM}</c:if></div></td>
                                <td><div><c:if test="${not empty workInfo}">${workInfo.PART_NUM}</c:if></div></td>
                                <td><div><c:if test="${not empty workInfo}">${workInfo.ORDER_QTY}</c:if></div></td>
                                <td><div><c:if test="${not empty workInfo}">${workInfo.INNER_DUE_DT}</c:if></div></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="share">
                        <div class="shareTit">공유</div>
                        <div class="shareConts"><c:if test="${not empty workInfo}">${workInfo.NOTE}</c:if></div>
                    </div>
                    <div class="qual">
                        <div class="qualTit">과거<br/>기록</div>
                        <div class="qualConts">
                            <span></span>
                        </div>
                    </div>
                </div>
                <div class="alertConts">
                    <c:if test="${not empty workInfo && workInfo.MAIN_INSPECTION eq 'Y'}">
                        <span class="alertBox">주요검사</span>
                    </c:if>
                    <c:if test="${not empty workInfo && workInfo.EMERGENCY_YN eq 'Y'}">
                        <span class="alertBox">긴급</span>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript'>

    var $waitMeMainContainer;

    $(function () {

        // 공통 SetTimeOut 변수
        let stopInterval;

        // 스타일 변경 이벤트
        var ev = new $.Event('style'),
            orig = $.fn.css;
        $.fn.css = function() {
            $(this).trigger(ev);
            return orig.apply(this, arguments);
        }

        $.fn.startWaitMe = function() {
            $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
        };

        $.fn.stopWaitMe = function() {
            $waitMeMainContainer.waitMe('hide');
        };

        console.log("test==============> 2");

        onScan.attachTo(document.getElementById("bodyWrap"), {
            onScan: function(barcodeNum, iQty) {
                // $(this).startWaitMe();
                /** 메인 창에서 바코드 스캔 된 경우 **/
                /** 진행중인 작업이 없는 경우는 신규 작업 시작 처리 **/
                /** 진행중인 작업이 있는 경우 작업중인 바코드인 경우 종료 처리 팝업 호출
                                            신규 바코드 경우 현재 작업중인 내용 종료 처리 하고 자동으로 신규 작업 시작 처리 **/
                console.log('bodyWrap=[' + barcodeNum + ']');
            }
        });

        // onScan.attachTo(document);
        // // Register event listener
        // document.addEventListener('scan', function(sScancode, iQuantity) {
        //     // alert(iQuantity + 'x ' + sScancode);
        //
        //     console.log('bodyWrap=[' + barcodeNum + ']');
        // });

        $(".slecBox").on('click', function(){
            /** 대기 리스트와 plan 리스트를 조회한다. **/
            /** 첫번째 plan 리스트를 조회한다.**/
            // getWorkList("pop");
            $("#drawing_worker_target_list_popup").css("display", "block");
            $("#area_tab").trigger("click");
            $(".bodyWrap").addClass("modal-open-body");
        });

        /** 완료 팝업 오픈 처리 **/
        $("#workCompletelBtn").on('click', function(){
            $("#drawing_worker_end_popup").find("#completeControlNumHtml").html($("#drawing_action_form").find("#CONTROL_NUM").val());
            $("#drawing_worker_end_popup").find("#completeControlPartNumHtml").html($("#drawing_action_form").find("#PART_NUM").val());
            $("#drawing_worker_end_popup").find("#completeControlOrderQtyHtml").html($("#drawing_action_form").find("#ORDER_QTY").val());
            $("#drawing_worker_end_popup").find("#completeControlCompleteQtyHtml").html($("#drawing_action_form").find("#FINISH_QTY").val());
            $("#drawing_worker_end_popup").find("#completeControlFailQtyHtml").html($("#drawing_action_form").find("#ERROR_QTY").val());
            $("#drawing_worker_end_popup").css("display", "block");
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
                    $("#stopSeconds").html(seconds +"초");
                    $("#stopMinutes").html(minutes +"분");
                }, 1000);
                $("#drawing_worker_stop_popup").bind('style', function(e) {
                    let style =  $(this).attr('style');
                    let display = style.split(":")[1];
                    if( display.indexOf("block") > 0){
                        $("#workRestartBtn").trigger("click");
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
                        workerListHtml += '<tr class="workListAction" stype="'+sType+'" sControlSeq="' + data.list[i].CONTROL_SEQ + '" sControlDetailSeq="' + data.list[i].CONTROL_DETAIL_SEQ + '">';
                        workerListHtml += '    <td class="modal-table-contents" style="width:65%;">' + data.list[i].CONTROL_NUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:10%;">' + data.list[i].PART_NUM + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" style="width:12%;">' + data.list[i].ORDER_QTY + '</td>';
                        workerListHtml += '    <td class="modal-table-contents" >' + data.list[i].INNER_DUE_DT + '</td>';
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
            let controlSeq = $(this).attr("sControlSeq");
            let controlDetailSeq = $(this).attr("sControlDetailSeq");

            var tr = $(this);
            var td = tr.children();

            $("#drawing_worker_scan_popup").find("#scanControlNumHtml").html(td.eq(0).text());
            $("#drawing_worker_scan_popup").find("#scanControlPartHtml").html(td.eq(1).text());
            $("#drawing_worker_scan_popup").find("#scanControlOrderQtyHtml").html(td.eq(2).text());
            $("#drawing_worker_scan_popup").find("#scanControlInnerOutDtHtml").html(td.eq(3).text());

            $("#drawing_action_form").find("#CONTROL_SEQ").val(controlSeq);
            $("#drawing_action_form").find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);

            $("#drawing_worker_target_list_popup").css("display", "none");
            $("#drawing_worker_scan_popup").css("display", "block");
        });

        //Scan Popup
        $("#drawing_worker_scan_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            // let seconds = 5;
            let seconds = 5000;
            if( display.indexOf("none") > 0){
                $("#drawing_worker_scan_popup .scan-time").html(fnRemainTimeSet(seconds));
                stopInterval = setInterval(function() {
                    seconds--;
                    $("#drawing_worker_scan_popup .scan-time").html(fnRemainTimeSet(seconds));
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
                fnPopupClose("drawing_worker_cancel_popup");
                reloadDrawingBoard();
            }, parameters, '');
        });

        /** 종료 하기 팝업창 자동 호출 **/
        $("#drawing_worker_end_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];
            // let seconds = 5;
            let seconds = 50000;
            if( display.indexOf("none") > 0){
                $("#drawing_worker_end_popup .scan-time").html(fnRemainTimeSet(seconds));
                stopInterval = setInterval(function() {
                    seconds--;
                    $("#drawing_worker_end_popup .scan-time").html(fnRemainTimeSet(seconds));
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
            fnPopupClose("drawing_worker_end_popup");
        });

        /** 작업 완료 처리 **/
        $("#endBtnSave").on('click', function(){
            let parameters = {
                'url': '/drawing-board-complete',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnPopupClose("drawing_worker_end_popup");
                reloadDrawingBoard();
            }, parameters, '');
        });

        /** 작업 완료 플러스 처리 **/
        $("#complete_success_qty_pop_plus_btn").on('click', function(){
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let afterQty = parseInt(finishQty) + 1;
            if(afterQty <= orderQty){
                $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
                $("#completeControlCompleteQtyHtml").html(afterQty);
            }
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
        });

        /** 작업 완료 마이너스 처리 **/
        $("#complete_success_qty_pop_minus_btn").on('click', function(){
            let finishQty = $("#drawing_action_form").find("#FINISH_QTY").val();
            let afterQty = parseInt(finishQty) - 1;
            if(afterQty >= 0){
                $("#drawing_action_form").find("#FINISH_QTY").val(afterQty);
                $("#completeControlCompleteQtyHtml").html(afterQty);
            }
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
        });

        /** 불량 수량 플러스 처리 **/
        $("#complete_fail_qty_pop_plus_btn").on('click', function(){
            let orderQty = $("#drawing_action_form").find("#ORDER_QTY").val();
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let afterQty = 1;
            if(errorQty) afterQty = parseInt(errorQty) + 1
            if(afterQty <= orderQty){
                $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
                $("#completeControlFailQtyHtml").html(afterQty);
            }
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
        });

        /** 불량 수량 마이너스 처리 **/
        $("#complete_fail_qty_pop_minus_btn").on('click', function(){
            let errorQty = $("#drawing_action_form").find("#ERROR_QTY").val();
            let afterQty = 0;
            if(errorQty) afterQty = parseInt(errorQty) - 1;
            if(afterQty >= 0) {
                $("#drawing_action_form").find("#ERROR_QTY").val(afterQty);
                $("#completeControlFailQtyHtml").html(afterQty);
            }
            clearTimeout(stopInterval);
            $("#drawing_worker_end_popup .scan-time").html("");
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
            let parameters = {
                'url': '/drawing-board-start',
                'data': $("#drawing_action_form").serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
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
            let html = seconds+"초 후 자동 진행됩니다 ("+seconds+")";
            return html;
        }

        /** 공통 처리 스크립트 **/
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

    });

</script>
</body>
