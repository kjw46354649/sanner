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
                <span class="imgWrap"><img src="asset/images/common/profile.png" alt=""></span>
                <span class="textWrap"><b>홍길동</b>님 안녕하세요.</span>
                <span class="btnWrap"><button type="button" class="btn"></button></span>
            </div>
            <div class="gnbWrap" id="gnbWrap">
                <ul>
        <c:set var="menuCnt" value="0"/>
        <c:set var="parentMenuSeq" value=""/>
        <c:forEach var="menu" items="${LocalMenu}">
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
        </c:forEach>
                            </ul>
                        </div>
                    </li>
<%--                    <li class="depth1 no1 on">--%>
<%--                        <a href="#a;">견적접수</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#a;">견적관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적표준 계산 관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적 표준 계산 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no2">--%>
<%--                        <a href="#a;">주문관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#a;">견적관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적표준 계산 관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적 표준 계산 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no3">--%>
<%--                        <a href="#a;">외주관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#a;">견적관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적표준 계산 관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적 표준 계산 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no4">--%>
<%--                        <a href="#a;">주문관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#a;">견적관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적표준 계산 관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적 표준 계산 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no5">--%>
<%--                        <a href="#a;">외주관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#a;">견적관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적표준 계산 관리</a></li>--%>
<%--                                <li><a href="#a;">견적서 작성</a></li>--%>
<%--                                <li><a href="#a;">견적 표준 계산 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
                </ul>
            </div>
            <div class="sideWrap">
                <a href="#a;" class="btn_allMenu"><span>메뉴열기</span></a>
            </div>
        </div>