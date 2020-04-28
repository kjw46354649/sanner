<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP</title>
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/drawing.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)">
<div class="row">
    <div class="text-center">
        <img src="/resource/drawing/drawing_02.jpg" class="img-fluid" alt="Responsive image" usemap="#workerMap">
        <map name="workerMap">
            <area shape="circle" coords="189, 175, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
            <area shape="circle" coords="514, 175, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
            <area shape="circle" coords="840, 175, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
            <area shape="circle" coords="189, 443, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
            <area shape="circle" coords="514, 443, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
            <area shape="circle" coords="840, 443, 78" href="/drawing-board" target="_self" onFocus="blur()"/>
        </map>
    </div>
</div>
<script type='text/javascript'>

</script>
</body>
