<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-03-05
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <div class="sidebarWrap on">
            <h1 class="logo"><a href="/main"><span class="invisible">진성정밀 MES 시스템</span></a></h1>
            <div class="profileWrap">
                <span class="imgWrap"><img src="/image/${authUserInfo.PHOTO_GFILE_SEQ}" alt=""></span>
                <span class="textWrap" style="top:13px;">
                    <span style="font-size: 12px;">${authUserInfo.LOGIN_TIME}</span><br>
                    <b>${authUserInfo.USER_NM}</b>님 안녕하세요.
                </span>
                <a href="/userLogout" id="logoutBtn"><span class="btnWrap"><button type="button" class="btn"></button></span></a>
            </div>
            <div class="gnbWrap" id="gnbWrap">
                <ul>
        <c:set var="menuCnt" value="0"/>
        <c:set var="parentMenuSeq" value=""/>
        <c:forEach var="menu" items="${authUserMenu}">
            <c:if test="${menu.PARENT_MENU_SEQ eq 0}">
                <c:if test="${menuCnt > 0}">
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${menu.MENU_SEQ ne parentMenuSeq}">
                    <li class="depth1 no1">
                        <a href="#">${menu.PARENT_MENU_NM}</a>
                        <div class="depth2">
                            <ul>
                </c:if>
            </c:if>
            <c:if test="${menu.PARENT_MENU_SEQ ne 0}">
                <li><a href="#" url="${menu.MENU_LINK}" tname="${menu.MENU_NM}" pid="${menu.CD_NO}">${menu.MENU_NM}</a></li>
            </c:if>
            <c:set var="menuCnt" value="${menuCnt + 1}"/>
            <c:if test="${menu.MENU_SEQ eq 12}">
                <input type="hidden" name="estimateNo" id="estimateNo" value="${menu.CD_NO}">
            </c:if>
            <c:if test="${menu.MENU_SEQ eq 24}">
                <input type="hidden" name="stockNo" id="stockNo" value="${menu.CD_NO}">
            </c:if>
        </c:forEach>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sideWrap">
                <a href="#a;" class="btn_allMenu"><span>메뉴열기</span></a>
            </div>
        </div>
<script type="text/javascript">

    $(document).ready(function(){
        $("#logoutBtn").on("click", function() {
            let ip = "${ipAddress}";
            let userId = '${authUserInfo.USER_ID}';

            let date = new Date();
            var dateStr = date.getFullYear() + '-' + ('00'+(date.getMonth()+1)).substr(-2) + '-' + ('00'+date.getDate()).substr(-2) + ' ' + ('00'+date.getHours()).substr(-2) + ':' + ('00'+date.getMinutes()).substr(-2)  + ':' +('00'+date.getSeconds()).substr(-2) + '.' + date.getMilliseconds();
            let logParam = {
                // 'crtfcKey':'$5$API$X1KoDEUj3kPHqU9JwaEEFE0u.GjI/1uSvIR2A304FbC', //이노데일 버전 인증키
                'crtfcKey':'$5$API$fWGgUcRM2Dm85Pdh/QFfrNnYjXPg1autH5a1tLE14RA', //진성정밀 버전 인증키
                'logDt':dateStr,
                'useSe':'종료',
                'sysUser':userId,
                'conectIp':ip,
                'dataUsgqty':userId.length
            }
            $.ajax({
                type: "POST", dataType: "json", url: "https://log.smart-factory.kr/apisvc/sendLogData.json", data: logParam,
                success: function(data){
                    console.log(data);
                },
                error: function(xhr, status, error){
                    alert(error);
                    return false;
                }
            });
        })
    });
</script>