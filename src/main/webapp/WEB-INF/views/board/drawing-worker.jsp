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
    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>
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
        <header>
            <div class="head" style="padding-left: 0px;">
                <%--<span><srping:message key="drawing.login.user.department"/></span>--%>
                <span>
                    <select id="DEPT" name="DEPT" title="부서">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${workerGroupList}">
                            <option value="${code.CODE_CD}">${code.CODE_NM}</option>
                        </c:forEach>
                    </select>
                </span>
            </div>
            <div class="langBtn">
                <button type="button" id="local_ko" name="local_ko" <c:if test="${LocalInfo eq 'ko'}"> class="on" </c:if> ><srping:message key="index.locale.language.kr"/></button>
                <button type="button" id="local_en" name="local_en" <c:if test="${LocalInfo ne 'ko'}"> class="on" </c:if> ><srping:message key="index.locale.language.en"/></button>
                <button type="button" id="go_home" name="go_home" class="on green" >Home</button>
            </div>
        </header>
        <form id="drawing_worker_form" method="post" action="/drawing-board">
            <input id="USER_ID" name="USER_ID" type="hidden" value="">
            <input id="USER_NM" name="USER_NM" type="hidden" value="${FACTORY_AREA}">
            <input id="USER_GFILE_SEQ" name="USER_GFILE_SEQ" type="hidden" value="${EQUIP_SEQ}">
            <section class="contents">
                <ul class="userWrap" id="userWrapHtml"></ul>
            </section>
        </form>
        <form action="/drawing-change-user-locale" id="locale-form" name="locale-form" method="POST">
            <input type="hidden" name="lang" id="lang" value="">
        </form>
        <form action="/drawing" id="home-form" name="home-form" method="POST"></form>
    </div>
<div class="modal-scan" id="no_nfc_popup" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-stop-content">
            <div class="modal-stop-body">
                <div class="tableWrap">
                    <div>
                        <p class="stop-txt">등록되지 않은 기기입니다.</p>
                    </div>
                    <div style="text-align: center;">
                        <button type="button" class="gradeMidBtn red close_pop" style="width: auto; padding: 0 20px;">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

        $('#go_home').click(function(){
            document.getElementById('home-form').submit();
        });
        $('.close_pop').click(function(){
            $("#no_nfc_popup").css("display", "none");
            $(".bodyWrap").removeClass("modal-open-body");
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
                        $("#drawing_worker_form").find('#userWrapHtml').html(workerHtml).trigger('create');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });
        $("#DEPT").trigger("change");

        onScan.attachTo(document, {
            onScan: function(nfcId, iQty) {
                let nfcTemp = nfcId.toUpperCase();
                if(nfcTemp.indexOf("C") == 0 || nfcTemp.indexOf("L") == 0 || nfcTemp.indexOf("W") == 0) {
                }else {
                    $.ajax({
                        type: 'POST', url: '/drawing-json-info', dataType: 'json', async: false,
                        data: {"queryId":"drawingMapper.selectNfcData", "LOGIN_KEY" : nfcId},
                        success: function (data, textStatus, jqXHR) {
                            if (textStatus === 'success') {
                                if(data.info == null) {
                                    $("#no_nfc_popup").css("display", "block");
                                    $(".bodyWrap").addClass("modal-open-body");
                                }else {
                                    $("#drawing_worker_form").find("#USER_ID").val(data.info.USER_ID);
                                    $("#drawing_worker_form").find("#USER_NM").val(data.info.USER_NM);
                                    $("#drawing_worker_form").find("#USER_GFILE_SEQ").val(data.info.PHOTO_GFILE_SEQ);
                                    $("#drawing_worker_form").submit();
                                }
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log('err',textStatus);
                        }
                    });
                }
            }
        });
    });
    $(document).on('click', '.userTag', function(event){
        $("#USER_ID").val($(this).attr("attr"));
        $("#USER_NM").val($(this).attr("attrNm"));
        $("#USER_GFILE_SEQ").val($(this).attr("attrSeq"));
        $("#drawing_worker_form").submit();
    });


</script>
</body>
