<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${list[0]}" var="list"/>
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
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)">

<!-- Target Modal Start -->
<div class="modal" id="drawing_worker_target_list_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="slecBox" id="equip_tab"><a href="#">${drawingInfo.machineInfo.EQUIP_NM} 스케줄</a></div>
                <div class="slecBox" id="area_tab"><a href="#">${drawingInfo.machineInfo.EQUIP_NM}</a></div>
                <button type="button" class="close" data-dismiss="modal">
                    <span>×</span>
                </button>
                <div class="tableWrap">
                    <div class="tab-content">
                        <div class="equipWrap">
                            <table class="modal-table">
                                <tbody>
                                    <tr>
                                        <td class="modal-table-header">관리번호</td>
                                        <td class="modal-table-header">Part</td>
                                        <td class="modal-table-header">수량</td>
                                        <td class="modal-table-header">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                    <tr>
                                        <td class="modal-table-contents">관리번호</td>
                                        <td class="modal-table-contents">Part</td>
                                        <td class="modal-table-contents">수량</td>
                                        <td class="modal-table-contents">납기</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="areaWrap" style="display: none">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="modal-table-header">관리번호</td>
                                    <td class="modal-table-header">Part</td>
                                    <td class="modal-table-header">수량</td>
                                    <td class="modal-table-header">납기</td>
                                </tr>
                                <tr>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                </tr>
                                <tr>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                    <td class="modal-table-contents">1</td>
                                </tr>
                                </tbody>
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
                            <td class="modal-table-header">C19-062502</td>
                            <td class="modal-table-header">1</td>
                            <td class="modal-table-header">32</td>
                            <td class="modal-table-header">10/5</td>
                        </tr>
                        </tbody>
                    </table>
                    <div><p class="work-txt">작업을 시작하겠습니까?</p></div>
                    <div>
                        <button id="scanBtnSave">Yes</button>
                        <button id="scanBtnCancel">Cancel</button>
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
                    <div>
                        <button id="stopBtn">작업재개</button>
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
                    <div>
                        <button id="cancelBtnSave">Yes</button>
                        <button id="cancelBtnCancel">Cancel</button>
                    </div>
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
                            <td class="modal-table-header">관리번호</td>
                            <td class="modal-table-contents">C19-0624-02</td>
                            <td class="modal-table-header">Part</td>
                            <td class="modal-table-contents">1</td>
                            <td class="modal-table-header">수량</td>
                            <td class="modal-table-contents">60</td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    <table>
                        <tbody>
                        <tr>
                            <td class="modal-table-header-end">완료수량</td>
                            <td class="modal-table-header-end">불량</td>
                            <td class="modal-table-header-end">불량원인</td>
                        </tr>
                        <tr>
                            <td class="modal-table-contents-end">32</td>
                            <td class="modal-table-contents-end">1</td>
                            <td class="modal-table-contents-end"></td>
                        </tr>
                        </tbody>
                    </table>
                    <div><p class="end-txt">작업을<span class="red-txt">종료하시겠습니까?</span> </p></div>
                    <div>
                        <button id="endBtnSave">Yes</button>
                        <button id="endBtnCancel">Cancel</button>
                    </div>
                    <div><p class="scan-time">5초 후 자동 진행됩니다 (5)</p></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal End -->

    <div class="bodyWrap work" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <div class="leftLogWrap">
            <form id="drawing_log_out_form" method="POST" action="/drawing-worker">
                <input id="FACTORY_AREA" name="FACTORY_AREA" type="hidden" value="${list.FACTORY_AREA}">
                <input id="EQUIP_SEQ" name="EQUIP_SEQ" type="hidden" value="${list.EQUIP_SEQ}">
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
                        <div class="endBox"><a href="#">종료하기</a></div>
                        <div class="stopBox"><a href="#">일시</br>정지</a></div>
                        <div class="cancelBox"><a href="#">작업</br>취소</a></div>
                    </div>
                </c:if>
                <div class="contsWrap">
                    <c:set var="workInfo" value="${drawingInfo.lastWork}" />
                    <c:if test="${not empty drawingInfo.currentWork}">
                        <c:set var="workInfo" value="${drawingInfo.currentWork}" />
                    </c:if>s
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
                            <span class="time"><c:if test="${not empty workInfo}">${workInfo.WORK_TIME}</c:if>분</span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit">작업</span>
                            <span class="time"><c:if test="${not empty workInfo}">${workInfo.STOP_TIME}</c:if>분</span>
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
                                    <td><div><c:if test="${not empty workInfo}">${workInfo.ORDERT_QTY}</c:if></div></td>
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

        $(".slecBox").on('click', function(){
            $("#drawing_worker_target_list_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });
        $(".endBox").on('click', function(){
            $("#drawing_worker_end_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });
        $(".stopBox").on('click', function(){
            $("#drawing_worker_stop_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });
        $(".cancelBox").on('click', function(){
            $("#drawing_worker_cancel_popup").css("display", "block");
            $(".bodyWrap").addClass("modal-open-body");
        });


        /* POPUP */
        //Target Popup
        $(".close").on('click', function(){
            fnPopupClose("drawing_worker_target_list_popup");
        });

        $("#equip_tab").on('click', function(){
            $(".equipWrap").css('display', 'block');
            $(".areaWrap").css('display', 'none');
        });

        $("#area_tab").on('click', function(){
            $(".equipWrap").css('display', 'none');
            $(".areaWrap").css('display', 'block');
        });

        $("#drawing_worker_target_list_popup").find("tr").on('click', function(){
            $("#drawing_worker_target_list_popup").css("display", "none");
            $("#drawing_worker_scan_popup").css("display", "block");
        });

        //Scan Popup
        $("#drawing_worker_scan_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];

            let seconds = 5;
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
                        fnPopupClose("drawing_worker_scan_popup");
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

        //Stop Popup
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
                        clearTimeout(stopInterval);
                    }
                });
            }
        });

        $("#stopBtn").on('click', function(){
            fnPopupClose("drawing_worker_stop_popup");
        });


        //Cancel Popup
        $("#cancelBtnCancel").on('click', function(){
            fnPopupClose("drawing_worker_cancel_popup");
        });

        $("#cancelBtnSave").on('click', function(){

        });


        //End Popup
        $("#drawing_worker_end_popup").bind('style', function(e) {
            let style =  $(this).attr('style');
            let display = style.split(":")[1];

            let seconds = 5;
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
                        fnPopupClose("drawing_worker_end_popup");
                    }
                }, 1000);
            }
        });

        $("#endBtnCancel").on('click', function(){
            fnPopupClose("drawing_worker_end_popup");
        });

        $("#endBtnSave").on('click', function(){

        });
        /* POPUP */

    });

    function fnDrawingBoardSave(){

        $.ajax({
            url: '/drawing',
            cache: false,
            type: "POST",
            data: {'queryId': 'drawingMapper.selectDrawingEquipment'},
            dataType: "json",
            async: false,
            success: function(data) {
                equipmentData = data.list;
            },
            complete: function(){}
        });
    }

    function fnPopupClose(popId){
        $("#"+popId).css("display", "none");
        $(".bodyWrap").removeClass("modal-open-body");
    }
    function fnRemainTimeSet(seconds){
        let html = seconds+"초 후 자동 진행됩니다 ("+seconds+")";
        return html;
    }

</script>
</body>
