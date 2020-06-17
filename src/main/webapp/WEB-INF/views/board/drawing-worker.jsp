<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style>
        select:focus, input[type="text"]:focus, input[type="password"]:focus, input[type="tel"]:focus, input[type="number"]:focus, textarea:focus {
            border: none !important;
        }
        select option {
            font-size: 20px;
        }
    </style>
</head>
<body onresize="parent.resizeTo(1024,600)" onload="parent.resizeTo(1024,600)">
    <div class="bodyWrap user" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <header>
            <div class="head">
                <span><srping:message key="drawing.login.user.sel"/></span>
                <span>
                    <select id="DEPT" name="DEPT" title="부서">
                        <c:forEach var="code" items="${workerGroupList}">
                            <option value="${code.CODE_CD}">${code.CODE_NM}</option>
                        </c:forEach>
                    </select>
                </span>
            </div>
            <div class="langBtn">
                <button type="button" id="local_ko" name="local_ko" <c:if test="${LocalInfo eq 'ko'}"> class="on" </c:if> >Korean</button>
                <button type="button" id="local_en" name="local_en" <c:if test="${LocalInfo ne 'ko'}"> class="on" </c:if> >English</button>
            </div>
        </header>
        <form id="drawing_worker_form" method="post" action="/drawing-board">
            <input id="USER_ID" name="USER_ID" type="hidden" value="">
            <input id="USER_NM" name="USER_NM" type="hidden" value="${FACTORY_AREA}">
            <input id="USER_GFILE_SEQ" name="USER_GFILE_SEQ" type="hidden" value="${EQUIP_SEQ}">
            <section class="contents">
                <ul class="userWrap" id="userWrapHtml">
<%--                    <c:forEach var="user" items="#{user}">--%>
<%--                    <li class="userBox" attr="${user.DEPT}">--%>
<%--                        <a href="#" class="userTag" attr="${user.USER_ID}">--%>
<%--                            <div class="userImg"><img src="${user.FILE_PATH}" alt=""></div>--%>
<%--                            <div class="userName">--%>
<%--                                <span class="ko">${user.USER_ID} </span><span>/</span><span class="en"> ${user.USER_NM}</span>--%>
<%--                            </div>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    </c:forEach>--%>
                </ul>
            </section>
        </form>
        <form action="/drawing-change-user-locale" id="locale-form" name="locale-form" method="get">
            <input type="hidden" name="lang" id="lang" value="">
        </form>
    </div>
<script type='text/javascript'>

    $(function () {

        $('#local_ko').click(function(){
            $("#locale-form").find("#lang").val("ko");
            document.getElementById('locale-form').submit();
        });

        $('#local_en').click(function(){
            $("#locale-form").find("#lang").val("en");
            document.getElementById('locale-form').submit();
        });

        $("#DEPT").on('change', function(){
            let selDept = $(this).val();
            $.ajax({
                type: 'POST', url: '/drawing-json-list', dataType: 'json', async: false,
                data: {"queryId":"drawingMapper.selectDrawingUser", "DEPARTMENT" : selDept},
                success: function (data, textStatus, jqXHR) {
                    if (textStatus === 'success') {
                        let workerHtml = "";
                        $("#drawing_worker_form").find('userWrapHtml').html("");
                        for(let i=0; i < data.list.length; i++){
                            workerHtml += '<li class="userBox" >';
                            workerHtml += '    <a href="#" class="userTag" attr="' + data.list[i].USER_ID + '" attrNm="' + data.list[i].USER_NM + '" attrSeq="' + data.list[i].PHOTO_GFILE_SEQ + '">';
                            workerHtml += '        <div class="userImg"><img src="/image/' + data.list[i].PHOTO_GFILE_SEQ + '" alt=""></div>';
                            workerHtml += '        <div class="userName">';
                            workerHtml += '            <span class="ko">' + data.list[i].USER_ID + ' </span><span>/</span><span class="en"> ' + data.list[i].USER_NM + ' </span>';
                            workerHtml += '        </div>';
                            workerHtml += '    </a>';
                            workerHtml += '</li>';
                        }
                        $("#drawing_worker_form").find('#userWrapHtml').html(workerHtml);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });

        $("#DEPT").trigger("change");

        $(".userTag").on('click', function(){
           $("#USER_ID").val($(this).attr("attr"));
           $("#USER_NM").val($(this).attr("attrNm"));
           $("#USER_GFILE_SEQ").val($(this).attr("attrSeq"));
           $("#drawing_worker_form").submit();
        });
    });

</script>
</body>
