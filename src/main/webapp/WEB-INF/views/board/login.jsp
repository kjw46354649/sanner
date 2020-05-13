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
    <div class="bodyWrap login" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <div class="loginWrap">
            <ul>
                <li><label for="menu_1">메뉴선택</label>
                    <select id="menu_1" name="menu_1" title="메뉴선택">
                        <c:forEach var="code" items="${HighCode.H_1005}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </li>
                <li><label for="menu_2">메뉴선택</label>
                    <select id="menu_2" name="menu_2" title="메뉴선택">
                        <option value="" selected="selected">NC-1</option>
                        <option value="1">NC-1</option>
                        <option value="2">NC-1</option>
                    </select>
                </li>
            </ul>
            <p class="txt">로그인해 주세요</p>
            <div class="btn"><button id="drawingLogin" type="button">사용자 선택하기</button></div>
            <div class="langBtn">
                <button type="button" class="on">Korean</button>
                <button type="button">English</button>
            </div>
        </div>
    </div>
<script type='text/javascript'>
    let equipmentData;
    $(function () {

        $.ajax({
            url: '/json-list',
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

        fnSelectBoxCreate();

        $("#menu_1").on('change', function(){
            fnSelectBoxCreate();
        });

        $("#drawingLogin").on('click', function(){

        });

    });

    let fnSelectBoxCreate = function () {
        'use strict';
        let location = $("#menu_1 option:selected").val();
        let html = "";

        for(let i=0; i < equipmentData.length; i++) {
            if(location == equipmentData[i].FACTORY_AREA) {
                html += '<option value="'+equipmentData[i].EQUIP_ID+'">'+equipmentData[i].EQUIP_NM+'</option>';
            }
        }
        $("#menu_2").html(html);
    };
</script>
</body>
