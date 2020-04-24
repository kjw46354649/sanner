<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>진성정밀 MES 시스템</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
    <!-- <link rel="shortcut icon" href="./asset/images/common/favicon-32.png"> -->
    <!-- Chrome, Safari, IE -->
    <!-- <link rel="icon" href="./asset/images/common/favicon.ico"> -->
    <!-- Android&IOS Touch Icon -->
    <!-- <link rel="apple-touch-icon-precomposed" href="./asset/images/common/favicon-152.png"> -->
    <link href="/resource/asset/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <!-- include Head : e -->
</head>
<body>
<!-- <dl id="skiptoContent">
    <dt><strong class="invisible">바로가기 메뉴</strong></dt>
    <dd><a href="#bodyWrap">본문 바로가기</a></dd>
    <dd><a href="#gnbWrap">주메뉴 바로가기</a></dd>
</dl> -->
<hr />
<header>
    <div class="header login">
        <h1 class="logo"><a href="/"><span class="invisible">진성정밀 MES 시스템</span></a></h1>
    </div>
</header>
<div class="bodyWrap login" id="bodyWrap">
    <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
    <tiles:insertAttribute name="body"/>
</div>
</body>
</html>