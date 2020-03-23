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
        <aside class="bg-black aside-md hidden-print hidden-xs" id="nav">
            <section class="vbox">
                <section class="w-f scrollable">
                    <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
                        <div class="clearfix wrapper dk nav-user hidden-xs">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                  <span class="thumb avatar pull-left m-r">
                                    <img src="/resource/main/images/a0.png" class="dker" alt="...">
                                    <i class="on md b-black"></i>
                                  </span>
                                    <span class="hidden-nav-xs clear">
                                    <span class="block m-t-xs">
                                      <strong class="font-bold text-lt">John.Smith</strong>
                                      <b class="caret"></b>
                                    </span>
                                    <span class="text-muted text-xs block">Art Director</span>
                                  </span>
                                </a>
                                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                    <li>
                                        <span class="arrow top hidden-nav-xs"></span>
                                        <a href="#">Settings</a>
                                    </li>
                                    <li>
                                        <a href="profile.html">Profile</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="badge bg-danger pull-right">3</span>
                                            Notifications
                                        </a>
                                    </li>
                                    <li>
                                        <a href="docs.html">Help</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="modal.lockme.html" data-toggle="ajaxModal" >Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <!-- nav -->
                        <nav class="nav-primary hidden-xs">
                            <div class="text-muted text-sm hidden-nav-xs padder m-t-sm m-b-sm">Start</div>
                            <ul class="nav nav-main" id="left_menu_wide_list" data-ride="collapse">
                                <c:set var="menuCnt" value="0"/>
                                <c:forEach var="menu" items="${LocalMenu}">
                                    <c:if test="${menu.PARENT_MENU_SEQ eq 0}">
                                    <c:if test="${menuCnt ne 0}">
                                        </li>
                                    </c:if>
                                        <li >
                                            <a href="#" class="auto">
                                                <span class="pull-right text-muted">
                                                  <i class="i i-circle-sm-o text"></i>
                                                  <i class="i i-circle-sm text-active"></i>
                                                </span>
                                            <i class="i i-grid2 icon">
                                            </i>
                                                <span class="font-bold">${menu.PARENT_MENU_NM}</span>
                                            </a>
                                    </c:if>
                                    <c:if test="${menu.PARENT_MENU_SEQ ne 0}">
                                        <ul class="nav dk">
                                            <li class="tabMenuClick" url="${menu.MENU_LINK}" tname="${menu.MENU_NM}" pid="${menu.CD_NO}">
                                                <a href="#" class="auto">
                                                    <i class="i i-dot"></i>

                                                    <span>${menu.MENU_NM}</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </nav>
                        <!-- / nav -->
                    </div>
                </section>

                <footer class="footer hidden-xs no-padder text-center-nav-xs">
                    <a href="modal.lockme.html" data-toggle="ajaxModal" class="btn btn-icon icon-muted btn-inactive pull-right m-l-xs m-r-xs hidden-nav-xs">
                        <i class="i i-logout"></i>
                    </a>
                    <a href="#nav" data-toggle="class:nav-xs" class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs">
                        <i class="i i-circleleft text"></i>
                        <i class="i i-circleright text-active"></i>
                    </a>
                </footer>
            </section>
        </aside>