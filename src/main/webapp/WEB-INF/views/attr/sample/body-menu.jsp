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
            <h1 class="logo"><a href="/jmes"><span class="invisible">진성정밀 MES 시스템</span></a></h1>
            <div class="profileWrap">
                <span class="imgWrap"><img src="asset/images/common/profile.png" alt=""></span>
                <span class="textWrap"><b>홍길동</b>님 안녕하세요.</span>
                <span class="btnWrap"><button type="button" class="btn"></button></span>
            </div>
            <div class="gnbWrap" id="gnbWrap">
                <ul>
                    <li class="depth1 no1"><a href="#">견적관리</a>
                        <div class="depth2">
                            <ul>
                                <li><a href="#" url="/static/biz/estimate-list" tname="견적관리" pid="100011">견적관리</a></li>
<%--                                <li><a href="#" url="/static/biz/estimate-register" tname="견적작성" pid="100012">견적작성</a></li>--%>
                            </ul>
                        </div>
                    </li>
<%--                    <li class="depth1 no1"><a href="#">주문관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/order/control-manage" tname="주문관리" pid="100021">주문관리</a></li>--%>
<%--                                <li><a href="#" url="/static/order/process-confirm" tname="가공확정" pid="100022">가공확정</a></li>--%>
<%--                                <li><a href="#" url="/static/order/order-status" tname="영업현황" pid="100023">영업현황</a></li>--%>
<%--                                <li><a href="#" url="/static/order/close-history" tname="마감이력" pid="100024">마감이력</a></li>--%>
<%--                                <li><a href="#" url="/static/order/sales-status" tname="매출현황" pid="100025">매출현황</a></li>--%>
                                <%--<li><a href="#" url="/static/order/incoming-amount-manage" tname="수금관리" pid="100026">수금관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no1"><a href="#">외주관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/out/outsourcing-order-manage" tname="외주 주문관리" pid="100031">외주 주문관리</a></li>--%>
<%--                                <li><a href="#" url="/static/out/outsourcing-close-history" tname="외주 마감이력" pid="100032">외주 마감이력</a></li>--%>
<%--                                <li><a href="#" url="/static/out/outsourcing-status" tname="외주현황" pid="100033">외주현황</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li><li class="depth1 no1"><a href="#">소재관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/material/item-order-register" tname="소재 주문등록" pid="100041">소재 주문등록</a></li>--%>
<%--                                <li><a href="#" url="/static/material/item-order-history" tname="소재 주문이력" pid="100042">소재 주문이력</a></li>--%>
<%--                                <li><a href="#" url="/static/material/in-warehouse-manage" tname="보유 소재 관리" pid="100043">보유 소재 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/material/in-parts-manage" tname="자재 소모품 관리" pid="100044">자재 소모품 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/material/stock-manage" tname="재고 관리" pid="100045">재고 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no1"><a href="#">생산관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/production/mct-plan-manage" tname="MCT 가공계획 관리" pid="100051">MCT 가공계획 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/production/mct-result-manage" tname="MCT 실적관리" pid="100052">MCT 실적관리</a></li>--%>
<%--                                <li><a href="#" url="/static/production/mct-execute-history" tname="MCT 수행이력 관리" pid="100053">MCT 수행이력 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/production/rnd-db" tname="가공조건 연구 DB" pid="100054">가공조건 연구 DB</a></li>--%>
<%--                                <li><a href="#" url="/static/production/machine-manage" tname="장비이력 관리" pid="100055">장비이력 관리</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no1"><a href="#">검사/출하 관리</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/inspection-manage" tname="검사실적 관리" pid="100061">검사실적 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/inspection-history" tname="검사이력 관리" pid="100062">검사이력 관리</a></li>--%>
<%--                                <li><a href="#" url="/static/outgoing-manage" tname="출하관리" pid="100063">출하관리</a></li>--%>
<%--                                <li><a href="#" url="/static/outgoing-return-history" tname="출하/반품 이력조회" pid="100064">출하/반품 이력조회</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="depth1 no1"><a href="#">레포트</a>--%>
<%--                        <div class="depth2">--%>
<%--                            <ul>--%>
<%--                                <li><a href="#" url="/static/report/daily-board" tname="일보조회" pid="100071">일보조회</a></li>--%>
<%--                                <li><a href="#" url="/static/report/mct-execute-board" tname="MCT 가동현황" pid="100072">MCT 가동현황</a></li>--%>
<%--                                <li><a href="#" url="/static/report/monthly-quality-board" tname="월간 품질현황" pid="100073">월간 품질현황</a></li>--%>
<%--                                <li><a href="#" url="/static/report/monthly-productivity-board" tname="월간 생산성" pid="100074">월간 생산성</a></li>--%>
<%--                                <li><a href="#" url="/static/report/month-sales-board" tname="월간 영업현황" pid="100075">월간 영업현황</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </li>--%>
                    <li class="depth1 no1"><a href="#">시스템</a>
                        <div class="depth2">
                            <ul>
                                <li><a href="#" url="/static/system/user-master" tname="사용자 관리" pid="100081">사용자 관리</a></li>
                                <%--<li><a href="#" url="/static/system/menu-master" tname="메뉴 관리" pid="100082">메뉴 관리</a></li>
                                <li><a href="#" url="/static/system/common-code-master" tname="공통 참조코드" pid="100083">공통 참조코드</a></li>
                                <li><a href="#" url="/static/system/authority-group-master" tname="권한 그룹관리" pid="100084">권한 그룹관리</a></li>
                                <li><a href="#" url="/static/system/authority-menu-master" tname="권한별 메뉴 관리" pid="100085">권한별 메뉴 관리</a></li>
                                <li><a href="#" url="/static/system/company-master" tname="업체정보 관리" pid="100086">업체정보 관리</a></li>
                                <li><a href="#" url="/static/system/company-holiday-master" tname="휴일 관리" pid="100087">휴일 관리</a></li>
                                <li><a href="#" url="/static/system/mail-history" tname="메일발송 이력" pid="100088">메일발송 이력</a></li>
                                <li><a href="#" url="/static/system/batch-manage" tname="배치 관리" pid="100089">배치 관리</a></li>--%>
                            </ul>
                        </div>
                    </li>
                    <%--<li class="depth1 no1"><a href="#">POP</a>
                        <div class="depth2">
                            <ul>
                                <li><a href="#" url="" tname="POP 관리" pid="1000101">POP 관리</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="depth1 no1"><a href="#">드로잉보드</a>
                        <div class="depth2">
                            <ul>
                                <li><a href="#" url="" tname="DRAWING 로그인" pid="1000111">DRAWING 로그인</a></li>
                                <li><a href="#" url="" tname="DRAWING 작업자" pid="1000112">DRAWING 작업자</a></li>
                                <li><a href="#" url="" tname="DRAWING 작업" pid="1000113">DRAWING 작업</a></li>
                            </ul>
                        </div>
                    </li>--%>
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