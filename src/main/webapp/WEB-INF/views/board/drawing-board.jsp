<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set value="${list[0]}" var="list"/>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP</title>
    <link href="/resource/asset/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/tab.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)">
    <div class="bodyWrap work" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <div class="leftLogWrap">
            <form id="drawing_log_out_form" method="POST" action="/drawing-worker">
                <input id="FACTORY_AREA" name="FACTORY_AREA" type="hidden" value="${list.FACTORY_AREA}">
                <input id="EQUIP_ID" name="EQUIP_ID" type="hidden" value="${list.EQUIP_ID}">
                <div class="logInWrap">
                    <div class="mainTit">${list.EQUIP_NM} </div>
                    <div class="userWrap">
                        <div class="userImg"><img src="/resource/asset/images/user/user.jpg" alt=""></div>
                        <div class="userInfo">
                            <p class="name">${list.USER_NM}</p>
                            <p><span class="dept">관리부</span> / <span class="position"></span>차장</p>
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
                <div class="contsTitWrap">
                    <div class="contsTit">최근 작업내용</div>
                    <div class="slecBox"><a href="#a;">작업대상 선택</a></div>
                </div>
                <div class="contsWrap">
                    <div class="topConts">
                        <div class="timeWrap">
                            <span class="timeTit">시작</span>
                            <span class="time"><span>10/5 </span><span>16:32</span></span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit">종료</span>
                            <span class="time"><span>10/5 </span><span>16:32</span></span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit">정지</span>
                            <span class="time">12분</span>
                        </div>
                        <div class="timeWrap">
                            <span class="timeTit"></span>
                            <span class="time">32분</span>
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
                                    <td><div>${list.CONTROL_NUM}</div></td>
                                    <td><div>${list.PART_NUM}</div></td>
                                    <td><div>${list.ORDERT_QTY}</div></td>
                                    <td><div>${list.INNER_DUE_DT}</div></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="share">
                            <div class="shareTit">공유</div>
                            <div class="shareConts">좌측 모서리 파임 현상 발생, 후가공시 보완요망<br>상/하단 연마 필요, 드릴 관통 탭 주의</div>
                        </div>
                        <div class="qual">
                            <div class="qualTit">과거<br/>기록</div>
                            <div class="qualConts">
                                <span>#######</span>
                            </div>
                        </div>
                    </div>
                    <div class="alertConts">
                        <c:if test="${list.MAIN_INSPECTION == 'Y'}">
                            <span class="alertBox">주요검사</span>
                        </c:if>
                        <c:if test="${list.EMERGENCY_YN == 'Y'}">
                            <span class="alertBox">긴급</span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type='text/javascript'>

    $(function () {

    });

</script>
</body>
