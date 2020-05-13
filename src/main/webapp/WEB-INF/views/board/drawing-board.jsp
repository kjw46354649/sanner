<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            <div class="logInWrap">
                <div class="mainTit">MCT 1호</div>
                <div class="userWrap">
                    <div class="userImg"><img src="/resource/asset/images/user/user.jpg" alt=""></div>
                    <div class="userInfo">
                        <p class="name">홍길동</p>
                        <p><span class="dept">관리부</span> / <span class="position"></span>차장</p>
                    </div>
                    <div class="logStatus"><button type="button">Log off</button></div>
                </div>
                <div class="langBtn">
                    <button type="button" class="on">Korean</button>
                    <button type="button">English</button>
                </div>
            </div>
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
                                    <th>납기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><div>C19-0625-02</div></td>
                                    <td><div>1</div></td>
                                    <td><div>32</div></td>
                                    <td><div>10/4</div></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="share">
                            <div class="shareTit">공유</div>
                            <div class="shareConts">좌측 모서리 파임 현상 발생, 후가공시 보완요망<br>상/하단 연마 필요, 드릴 관통 탭 주의</div>
                        </div>
                        <div class="qual">
                            <div class="qualTit">품질</div>
                            <div class="qualConts">
                                <span>03</span>
                                <span class="txtR">불합격(3)</span>
                                <span>02.평탄불량 - HOL공차 불량</span>
                            </div>
                        </div>
                    </div>
                    <div class="alertConts">
                        <span class="alertBox">주요검사</span>
                        <span class="alertBox">긴급</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type='text/javascript'>

</script>
</body>
