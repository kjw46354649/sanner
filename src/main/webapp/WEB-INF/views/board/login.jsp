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
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
   	<link rel="shortcut icon" href="/favicon.ico">
   	<!-- Chrome, Safari, IE -->
   	<link rel="icon" href="/favicon.ico">
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
    <div class="bodyWrap login" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <form id="drawing_login_form" name="drawing_login_form" method="POST" action="/drawing-worker">
            <input type="hidden" name="queryId" id="queryId" value="drawingMapper.selectDrawingEquipment">
            <input type="hidden" name="EQUIP_NM" id="EQUIP_NM" value="">
            <input type="hidden" name="SEL_EQUIP_SEQ" id="SEL_EQUIP_SEQ" value="${EQUIP_SEQ}">
            <div class="loginWrap">
                <ul>
                    <li>
                        <select id="FACTORY_AREA" name="FACTORY_AREA" title="메뉴선택">
                            <c:forEach var="code" items="${areaList}">
                                <option value="${code.CODE_CD}" <c:if test="${FACTORY_AREA eq code.CODE_CD}">selected="selected"</c:if> >${code.CODE_NM}</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li>
                        <select id="EQUIP_SEQ" name="EQUIP_SEQ" title="메뉴선택"></select>
                    </li>
                </ul>
                <p class="txt"><srping:message key="drawing.login.plz"/></p>
                <div class="btn">
                    <button type="button" id="selectUserBtn"><srping:message key="drawing.login.user.sel"/></button>
                </div>
                <div class="langBtn">
                    <button type="button" id="local_ko" name="local_ko" <c:if test="${LocalInfo eq 'ko'}"> class="on" </c:if> ><srping:message key="index.locale.language.kr"/></button>
                    <button type="button" id="local_en" name="local_en" <c:if test="${LocalInfo ne 'ko'}"> class="on" </c:if> ><srping:message key="index.locale.language.en"/></button>
                </div>
            </div>
        </form>
        <form action="/drawing-change-locale" id="locale-form" name="locale-form" method="get">
            <input type="hidden" name="lang" id="lang" value="">
        </form>
    </div>
<script type='text/javascript'>

    let equipment = $("#drawing_login_form").find("#EQUIP_SEQ");
    $(function () {

        $('#local_ko').click(function(){
            $("#locale-form").find("#lang").val("ko");
            document.getElementById('locale-form').submit();
        });

        $('#local_en').click(function(){
            $("#locale-form").find("#lang").val("en");
            document.getElementById('locale-form').submit();
        });

        $("#selectUserBtn").click(function () {
            if($("#drawing_login_form").find("#EQUIP_SEQ option:checked").val() == ""){
                fnAlert(null, "<srping:message key='drawing.board.alert.08'/>");
                return false;
            }
            $("#drawing_login_form").find("#EQUIP_NM").val($("#drawing_login_form").find("#EQUIP_SEQ option:checked").text());
            document.getElementById('drawing_login_form').submit();
        })

        $("#FACTORY_AREA").on('change', function(){
            $.ajax({
                type: 'POST', url: '/drawing-json-list', dataType: 'json', async: false,
                data: {"queryId":"drawingMapper.selectDrawingEquipment", "FACTORY_AREA" : $("#drawing_login_form").find("#FACTORY_AREA").val()},
                success: function (data, textStatus, jqXHR) {
                    if (textStatus === 'success') {
                        equipment.find('option').remove();
                        for(let i=0; i < data.list.length; i++){
                            document.getElementById("EQUIP_SEQ").options.add(new Option(data.list[i].EQUIP_NM, data.list[i].EQUIP_SEQ));
                        }
                        if($("#drawing_login_form").find("#SEL_EQUIP_SEQ").val() != "")
                            $("#EQUIP_SEQ").val($("#drawing_login_form").find("#SEL_EQUIP_SEQ").val()).prop("selected", true);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });

        $("#FACTORY_AREA").trigger("change");
    });

</script>
</body>
