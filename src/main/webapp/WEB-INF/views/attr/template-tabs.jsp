<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>진성정밀 MES 시스템</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body-default-script"/>
</head>
<body>
    <div id="waitMeContainerDiv">
        <dl id="skiptoContent">
            <dt><strong class="invisible">바로가기 메뉴</strong></dt>
            <dd><a href="#bodyWrap">본문 바로가기</a></dd>
            <dd><a href="#gnbWrap">주메뉴 바로가기</a></dd>
        </dl>
        <hr />
        <div class="bodyWrap" id="bodyWrap">
            <section class="containerBody">
                <div class="navbarWrap">
                    <div class="locationWrap"><%--<ul><li><a href="#a;">Home</a></li></ul>--%></div>
                </div>
                <div class="tabMenuWrap">
                    <ul class="tabMenu"></ul>
                </div>
                <div class="contentsWrap"></div>
                <tiles:insertAttribute name="body-menu"/>
            </section>
        </div>
        <tiles:insertAttribute name="bottom"/>
    </div>
</body>
</html>