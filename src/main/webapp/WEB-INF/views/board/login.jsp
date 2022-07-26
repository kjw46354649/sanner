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
    <!-- alertify -->
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/waitme/waitMe.css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <!-- alertify -->
    <script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>
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
<div id="drawingErrorDiv" style="display: none">
    <div id="drawingErrorHtml">
        <table>
            <tr>
                <td width="10%">&nbsp;</td>
                <td rowspan="2" width="25%"><img src="/resource/asset/images/work/alarm.png" width="90px"></td>
                <td width="65%"><h3 style="font-size: 24px;font-weight: bold;"><srping:message key='drawing.board.alert.08'/></h3></td>
            </tr>
        </table>
    </div>
</div>
    <div class="bodyWrap login" id="bodyWrap">
        <!-- contents 영역에 각페이지 명에 맞는 class 추가 !! -->
        <form id="drawing_login_form" name="drawing_login_form" method="POST" action="/drawing-worker">
            <input type="hidden" name="queryId" id="queryId" value="drawingMapper.selectDrawingEquipment">
            <input type="hidden" name="EQUIP_NM" id="EQUIP_NM" value="">
            <input type="hidden" name="IF_USE_YN" id="IF_USE_YN" value="">
            <input type="hidden" name="SEL_EQUIP_SEQ" id="SEL_EQUIP_SEQ" value="${EQUIP_SEQ}">
            <div class="loginWrap">
                <ul>
                    <li>
                        <select id="FACTORY_AREA" name="FACTORY_AREA" title="공장 선택">
                            <c:forEach var="code" items="${areaList}">
                                <option value="${code.CODE_CD}" <c:if test="${FACTORY_AREA eq code.CODE_CD}">selected="selected"</c:if> >${code.CODE_NM}</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li>
                        <select id="EQUIP_SEQ" name="EQUIP_SEQ" title="장비 선택">
                            <option value=""><srping:message key="drawing.board.label.25"/></option>
                            <c:forEach var="code" items="${equipList}">
                                <option value="${code.EQUIP_SEQ}" <c:if test="${EQUIP_SEQ eq code.EQUIP_SEQ}">selected="selected"</c:if> >${code.EQUIP_NM}</option>
                            </c:forEach>
                        </select>
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
    let selEquipList = [];
    let jsonStr;

    alertify.drawingDialog || alertify.dialog('drawingDialog',function(){
        return {
            main:function(content){ this.setContent(content); },
            setup:function(){
                return { options:{ basic:true, maximizable:false, resizable:false, padding:false } };
            },
            settings:{ selector:undefined },
            hooks: {
                onshow: function() {
                    this.elements.dialog.style.maxWidth = 'none';
                    this.elements.dialog.style.width = '80%';
                }
            }
        };
    });

    const fnDrawingDialogAlert = function (elementId, autoClose) {
        let alertBox = alertify.drawingDialog($('#' + elementId)[0]);
        if (autoClose) {
            setTimeout(function() {
                alertBox.close();
            }, autoClose * 1000);
        }
    };

    $(function () {


        <c:forEach var="equip" items="${equipList}">
        selEquipList.push({EQUIP_SEQ: '${equip.EQUIP_SEQ}', IF_USE_YN: '${equip.IF_USE_YN}', EQUIP_NM: '${equip.EQUIP_NM}'});
        </c:forEach>

        console.log(selEquipList);

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
                <%--fnAlert(null, "<srping:message key='drawing.board.alert.08'/>");--%>
                fnDrawingDialogAlert('drawingErrorHtml', 1);
                return false;
            }
            $.each(selEquipList, function (idx, Item) {
                let selEquipSeq = $("#drawing_login_form").find("#EQUIP_SEQ option:checked").val();
                if(Item.EQUIP_SEQ == selEquipSeq) {
                    $("#drawing_login_form").find("#IF_USE_YN").val(Item.IF_USE_YN);
                }
            })
            $("#drawing_login_form").find("#EQUIP_NM").val($("#drawing_login_form").find("#EQUIP_SEQ option:checked").text());
            document.getElementById('drawing_login_form').submit();
        })

        $("#FACTORY_AREA").on('change', function(){
            $.ajax({
                type: 'POST', url: '/drawing-json-list', dataType: 'json', async: false,
                data: {"queryId":"drawingMapper.selectDrawingEquipment", "FACTORY_AREA" : $("#drawing_login_form").find("#FACTORY_AREA").val()},
                success: function (data, textStatus, jqXHR) {
                    if (textStatus === 'success') {
                        selEquipList = data.list;
                        equipment.find('option').remove();
                        document.getElementById("EQUIP_SEQ").options.add(new Option("<srping:message key='drawing.board.label.25'/>", ""));
                        for(let i=0; i < data.list.length; i++){
                            document.getElementById("EQUIP_SEQ").options.add(new Option(data.list[i].EQUIP_NM, data.list[i].EQUIP_SEQ));
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });
    });

</script>
</body>
