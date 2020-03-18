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
<%--                                <li  class="active">--%>
<%--                                    <a href="#" class="auto">--%>
<%--                                        <i class="i i-statistics icon">--%>
<%--                                        </i>--%>
<%--                                        <span class="font-bold">견적관리</span>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon">
                                        </i>
                                        <span class="font-bold">견적 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li class="tabMenuClick" url="/static/biz/estimate_mater" tname="권한그룹 관리" pid="05">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>견적서 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>견적서 작성</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon">
                                        </i>
                                        <span class="font-bold">주문 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>주문 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>가공 확정 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                     <ul class="nav dk">
                                         <li >
                                             <a href="#" class="auto">
                                                 <b class="badge bg-success lt pull-right">2</b>
                                                 <i class="i i-dot"></i>

                                                 <span>영업 현황 조회</span>
                                             </a>
                                         </li>
                                     </ul>
                                     <ul class="nav dk">
                                         <li >
                                             <a href="#" class="auto">
                                                 <b class="badge bg-success lt pull-right">2</b>
                                                 <i class="i i-dot"></i>

                                                 <span>주문 마감 이력</span>
                                             </a>
                                         </li>
                                     </ul>
                                     <ul class="nav dk">
                                         <li >
                                             <a href="#" class="auto">
                                                 <b class="badge bg-success lt pull-right">2</b>
                                                 <i class="i i-dot"></i>

                                                 <span>매출 현황</span>
                                             </a>
                                         </li>
                                     </ul>
                                     <ul class="nav dk">
                                         <li >
                                             <a href="#" class="auto">
                                                 <b class="badge bg-success lt pull-right">2</b>
                                                 <i class="i i-dot"></i>

                                                 <span>수금 관리</span>
                                             </a>
                                         </li>
                                     </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon"></i>
                                        <span class="font-bold">외주 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>외주 주문 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>외주 마감 이력</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>외주 현황</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon"></i>
                                        <span class="font-bold">소재 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>소재주문 등록</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>소재주문 이력</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>보유소재 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>자재 소모품 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>재고 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon"></i>
                                        <span class="font-bold">생산 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>MCT 가공계획 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>MCT 실적관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>MCT 수행이력 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>가공조건 연구 DB</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>장비이력 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon"></i>
                                        <span class="font-bold">검사/출하 관리</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>검사실적 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>검사이력 조회</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>출하 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>출하/반품 이력조회</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                        <span class="pull-right text-muted">
                                          <i class="i i-circle-sm-o text"></i>
                                          <i class="i i-circle-sm text-active"></i>
                                        </span>
                                        <i class="i i-grid2 icon"></i>
                                        <span class="font-bold">레포트</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>일보 조회</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>MCT 가동현황</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>월간 품질현황</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>월간 생산성</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li >
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>월간 영업현황</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li >
                                    <a href="#" class="auto">
                                    <span class="pull-right text-muted">
                                      <i class="i i-circle-sm-o text"></i>
                                      <i class="i i-circle-sm text-active"></i>
                                    </span>
                                        <i class="i i-grid2 icon">
                                        </i>
                                        <span class="font-bold">시스템</span>
                                    </a>
                                    <ul class="nav dk">
                                        <li class="tabMenuClick" url="/static/system/user-manger-list" tname="사용자 관리" pid="02">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>
                                                <span>사용자 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li  class="tabMenuClick" url="/static/system/menu-manager-list" tname="메뉴 관리" pid="03">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>
                                                <span>메뉴 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li class="tabMenuClick" url="/static/system/common-reference-code-list" tname="공통 참조코드" pid="04">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>공통 참조코드</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li class="tabMenuClick" url="/static/system/authority-group-master" tname="권한그룹 관리" pid="05">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>권한그룹 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <ul class="nav dk">
                                        <li class="tabMenuClick" url="/static/system/authority-menu-management" tname="권한별 메뉴 관리" pid="06">
                                            <a href="#" class="auto">
                                                <b class="badge bg-success lt pull-right">2</b>
                                                <i class="i i-dot"></i>

                                                <span>권한별 메뉴 관리</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
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