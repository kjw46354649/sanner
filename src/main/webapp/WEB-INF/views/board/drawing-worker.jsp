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
    <div class="bodyWrap user" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <header>
            <div class="head">사용자 선택하기
                <span>
                    <select id="DEPT" name="DEPT" title="부서">
                        <c:forEach var="code" items="${HighCode.H_1061}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
            </div>
            <div class="langBtn">
                <button type="button" class="on">Korean</button>
                <button type="button">English</button>
            </div>
        </header>
        <form id="drawing_worker_form" method="post" action="/drawing-board">
            <input id="FACTORY_AREA" name="FACTORY_AREA" type="hidden" value="${FACTORY_AREA}">
            <input id="EQUIP_SEQ" name="EQUIP_SEQ" type="hidden" value="${EQUIP_SEQ}">
            <input id="USER_ID" name="USER_ID" type="hidden" value="">
            <section class="contents">
                <ul class="userWrap">
                    <c:forEach var="user" items="#{user}">
                    <li class="userBox" attr="${user.DEPT}">
                        <a href="#" class="userTag" attr="${user.USER_ID}">
                            <div class="userImg"><img src="${user.FILE_PATH}" alt=""></div>
                            <div class="userName">
                                <span class="ko">${user.USER_ID} </span><span>/</span><span class="en"> ${user.USER_NM}</span>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </section>
        </form>
    </div>
<script type='text/javascript'>

    $(function () {
        $("#DEPT").on('change', function(){
            let selDept = $(this).val();

            $(".userWrap").find("li").each(function() {
                let dept = $(this).attr("attr");
                if(selDept == dept) {
                    $(this).css("display", 'block');
                }else{
                    $(this).css("display", 'none');
                }
            });
        });

        $(".userTag").on('click', function(){
           $("#USER_ID").val($(this).attr("attr"));

           $("#drawing_worker_form").submit();
        });

        $(".langBtn").find("button").on('click', function(){
            $(".langBtn").find("button").each(function() {
                $(this).removeClass("on");
            });

            $(this).addClass("on");
        });
    });

</script>
</body>
