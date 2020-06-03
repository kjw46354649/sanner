` <%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-18
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" name="CONTROL_MANAGE_SEARCH_FORM" id="CONTROL_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlManageList">
            <div class="gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자구분</label>
                            <select class="label_200" name="COMP_CD" id="COMP_CD" title="사업자구분">
                                <option value="">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="label_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주사">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200"name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="text" class="label_200"name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_MANAGE_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="text" class="label_200"name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="RBRUR">규격</label>
                            <select class="label_200" name="RBRUR" id="RBRUR" title="규격">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="THWOGUDXO">소재형태</label>
                            <select class="label_200" name="THWOGUDXO" id="THWOGUDXO" title="소재형태">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1004}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_1" value="today" checked><label for="fr_1001_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_2" value="current_month"><label for="fr_1001_2">현재월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_3" value="three_months"><label for="fr_1001_3">3개월</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_END_DATE" id="CONTROL_MANAGE_END_DATE" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>
                        </div>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">단가</label>
                            <select class="label_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="단가">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업형태</label>
                            <select class="label_200" name="WORK_TYPE" id="WORK_TYPE" title="작업형태">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box"><input id="option1" type="checkbox"><label for="option1"> 자재사급</label></span>
                            <span class="chk_box"><input id="option2" type="checkbox"><label for="option2"> 외주</label></span>
                            <span class="chk_box"><input id="option3" type="checkbox"><label for="option3"> 未단가</label></span>
                            <span class="chk_box"><input id="option4" type="checkbox"><label for="option4"> 긴급</label></span>
                            <span class="chk_box"><input id="option5" type="checkbox"><label for="option5"> part 숨기기</label></span>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn" id="CONTROL_MANAGE_TOPWRAP_BTN">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="hWrap">
            <div>
                <button type="button" class="defaultBtn btn-120w" data-toggle="modal" data-target="#CONTROL_MANGE_POPUP">신규
                    주문 등록
                </button>
                <button type="button" class="defaultBtn btn-120w" data-toggle="modal"
                        data-target="#ESTIMATE_REGISTER_POPUP">견적등록
                </button>
                <button type="button" class="defaultBtn btn-120w" data-toggle="modal"
                        data-target="#TRANSACTION_STATEMENT_POPUP">거래명세표</button>
                <%--<button type="button" class="defaultBtn btn-120w" data-toggle="modal"
                        data-target="#TRANSACTION_STATEMENT_LIST_POPUP">거래명세표 List</button>--%>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w" id="ESTIMATE_LIST_PRINT">견적List출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="DRAWING_PRINT">도면 출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="BARCODE_PRINT">바코드 출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="LABEL_PRINT">라벨 출력</button>
                </div>
            </div>
            <div class="mg-top10">
                <button type="button" class="defaultBtn btn-120w" name="CHANGE_STATUS" id="CONFIRMATION"
                        data-control_status="ORD001" data-control_status_nm="확정">확정
                </button>
                <button type="button" class="defaultBtn btn-120w" name="CHANGE_STATUS" id="CANCEL" data-control_status="ORD002"
                        data-control_status_nm="취소">취소
                </button>
                <button type="button" class="defaultBtn btn-120w" name="CHANGE_STATUS" id="TERMINATION"
                        data-control_status="ORD004" data-control_status_nm="종료">종료
                </button>
                <button type="button" class="defaultBtn btn-120w" data-toggle="modal"
                        data-target="#CONTROL_CLOSE_POPUP">마감
                </button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w" id="DRAWING_REGISTRATION">도면 등록</button>
                    <button type="button" class="defaultBtn btn-120w" id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                    <button type="button" class="defaultBtn btn-120w" id="DRAWING_VIEW">도면 View</button>
                    <button type="button" class="defaultBtn btn-120w red" id="CONTROL_MANAGE_DELETE">삭제</button>
                    <button type="button" class="defaultBtn btn-120w green" id="CONTROL_MANAGE_SAVE">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <span class="buttonWrap">
                <div class="d-inline">
                    <button type=" button" class="smallBtn yellow" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_ALL">전체모드</button>
                    <button type="button" class="smallBtn yellow" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_ESTIMATE">견적관련</button>
                    <button type="button" class="smallBtn yellow" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_QUALITY">품질관련</button>
                    <button type="button" class="smallBtn yellow" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_CLOSE">마감관련</button>
                    <div class="right_float">
                        <span class="slt_wrap namePlusSlt">
                        <label for="SUPPLY_UNIT_COST_APPLY">공급단가적용</label>
                        <select id="SUPPLY_UNIT_COST_APPLY" title="공급단가적용">
                            <option value="0">-Select-</option>
                            <option value="1">1%</option>
                            <option value="3">3%</option>
                            <option value="5">5%</option>
                            <option value="10">10%</option>
                            <option value="15">15%</option>
                            <option value="20">20%</option>
                        </select>
                        </span>
                    </div>
                </div>
            </span>
            <div class="conWrap">
                <div id="CONTROL_MANAGE_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CONTROL_MANAGE_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<div class="popup_container" id="CONTROL_MANGE_POPUP" style="display: none;">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">신규 주문 등록</h3>
        <button type="button" class="pop_close">닫기</button>
        <div>
            <div id="ORDER_REGISTER_GRID"></div>
        </div>
    </div>
</div>

<div class="popup_container" id="CONTROL_CLOSE_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3>월 마감 진행</h3>
        <hr>
        <button type="button" class="pop_close CONTROL_CLOSE_NO">닫기</button>
        <div class="buttonWrap">
            <form class="form-inline" id="CONTROL_CLOSE_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseLeftList">
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                <div class="leftbuttonWrap">
                    <div class="d-inline-block">
                        <label for="CONTROL_CLOSE_YEAR"></label>
                        <select name="CONTROL_CLOSE_YEAR" id="CONTROL_CLOSE_YEAR">
                            <option></option>
                        </select>
                    </div>
                    <div class="d-inline-block">
                        <label for="CONTROL_CLOSE_MONTH"></label>
                        <select name="CONTROL_CLOSE_MONTH" id="CONTROL_CLOSE_MONTH">
                            <option></option>
                        </select>
                    </div>
                    <div class="d-inline-block">
                        <select name="CLOSE_VER" id="CLOSE_VER">
                            <option value="1">1차</option>
                            <option value="2">2차</option>
                            <option value="3">3차</option>
                            <option value="4">4차</option>
                            <option value="5">5차</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="d-inline-block">
            <div style="width: 450px; float:left;">
                <div id="CONTROL_CLOSE_LEFT_GRID"></div>
            </div>
            <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                <span class="arrow right_Arrow"></span>
            </div>
            <div style="width: 450px; float:left;">
                <div id="CONTROL_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>

        <div class="text-center">
            <button class="defaultBtn" id="CONTROL_CLOSE_YES">저장</button>
            <button class="defaultBtn CONTROL_CLOSE_NO">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="TRANSACTION_STATEMENT_POPUP" style="display: none;">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">거래 명세표</h3>
        <button type="button" class="pop_close">닫기</button>

        <!-- 버튼 -->
        <div class="buttonWrap" style="display: block; overflow: hidden;">
            <div class="right_float">
                <button class="popupBtn" id="TRANSACTION_STATEMENT_LABEL_PRINT">라벨 출력</button>
                <button class="popupBtn red" id="TRANSACTION_STATEMENT_DELETE">삭제</button>
                <button class="popupBtn green" id="TRANSACTION_STATEMENT_SAVE">저장</button>
                <button class="popupBtn blue" id="TRANSACTION_STATEMENT_EXPORT">엑셀 출력</button>
            </div>
        </div>

        <form name="TRANSACTION_STATEMENT_FORM" id="TRANSACTION_STATEMENT_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlTransactionStatementList">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
            <input type="hidden" name="CONTROL_SEQ_STR" id="CONTROL_SEQ_STR">
            <!-- 기본 정보 -->
            <div style="margin-bottom: 10px;">
                <h5>기본정보</h5>
                <table class="tableL">
                    <tbody>
                    <tr>
                        <td>발주사</td>
                        <td id="ORDER_COMP_NM"></td>
                        <td>공급사</td>
                        <td id="COMP_NM"></td>
                    </tr>
                    <tr>
                        <td>구매 담당자</td>
                        <td><select name="ORDER_STAFF_SEQ" id="ORDER_STAFF_SEQ">
                            <option></option>
                        </select></td>
                        <td>금액 합계</td>
                        <td name="TOTAL_AMT" id="TOTAL_AMT"></td>
                    </tr>
                    <tr>
                        <td>INV No.</td>
                        <td><input type="text" name="INVOICE_NUM" id="INVOICE_NUM" readonly></td>
                        <td>제목</td>
                        <td><input type="text" name="INVOICE_TITLE" id="INVOICE_TITLE" value="4세대 인라인 조립기"></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- 상세 리스트 -->
            <div>
                <h5>상세 리스트</h5>
                <div id="TRANSACTION_STATEMENT_DETAIL_GRID"></div>
            </div>
        </form>
    </div>
</div>

<%--<div class="popup_container" id="TRANSACTION_STATEMENT_LIST_POPUP" style="display: none;">--%>
<%--    <div class="layerPopup">--%>
<%--        <h3 style="margin-bottom: 10px;">거래 명세표 List</h3>--%>
<%--        <button type="button" class="pop_close">닫기</button>--%>

<%--        <!-- 버튼 -->--%>
<%--        <div class="buttonWrap" style="display: block; overflow: hidden;">--%>
<%--            <div style="float: right">--%>
<%--                <button class="popupBtn red" id="TRANSACTION_STATEMENT_DELETE">삭제</button>--%>
<%--&lt;%&ndash;                <button class="popupBtn" id="TRANSACTION_STATEMENT_LABEL_PRINT">출력</button>&ndash;%&gt;--%>
<%--                <button class="popupBtn" id="TRANSACTION_STATEMENT_EXPORT">Export</button>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div>--%>
<%--            <div id="TRANSACTION_STATEMENT_LIST_GRID"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="popup_container" id="ESTIMATE_REGISTER_POPUP" style="display: none;">
    <div class="layerPopup" style="overflow: scroll;">
        <h3 style="margin-bottom: 10px;">견적서 작성</h3>
        <button type="button" class="pop_close">닫기</button>

        <!-- 버튼 -->
        <div class="buttonWrap" style="display: block; overflow: hidden;">
            <div class="right_float">
                <button class="popupBtn green" id="">저장</button>
                <button class="popupBtn blue" id="">제출</button>
            </div>
        </div>

        <h5>기본정보</h5>
        <form class="form-inline" id="control_estimate_register_info_form" name="control_estimate_register_info_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="">
            <input type="hidden" id="EST_SEQ" name="EST_SEQ" value="">
            <table class="tableL">
                <tbody>
                <tr>
                    <td class="header">발주사</td>
                    <td>
                        <select name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                            <option></option>
                        </select>
                    </td>
                    <td class="header">제목</td>
                    <td colspan="3"><input type="text" value="4세대 ~!@@#"></td>
                </tr>
                <tr>
                    <td class="header">구매 담당자</td>
                    <td>
                        <select name="ORDER_STAFF_SEQ" id="ORDER_STAFF_SEQ">
                            <option></option>
                        </select>
                    </td>
                    <td class="header">품수</td>
                    <td>12313&nbsp;</td>
                    <td class="header">등록일시</td>
                    <td>123123</td>
                </tr>
                <tr>
                    <td class="header">견적번호</td>
                    <td>&nbsp;</td>
                    <td class="header">차수</td>
                    <td>&nbsp;</td>
                    <td class="header">견적 담당자</td>
                    <td>
                        <select name="EST_USER_ID" id="EST_USER_ID">
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="header">견적금액 계</td>
                    <td>&nbsp;</td>
                    <td class="header">결과</td>
                    <td>&nbsp;</td>
                    <td class="header">회신일시</td>
                    <td>&nbsp;</td>
                </tr>
                </tbody>
            </table>

            <h5>상세 리스트</h5>
            <div>
                <button type="button" class="defaultBtn radius" id="btnEstimateRegisterAdd">추가</button>
                <button type="button" class="defaultBtn radius red" id="btnEstimateRegisterDelete">삭제</button>
            </div>
            <div>
                <div>
                    <div id="control_estimate_register_top_grid" class="jqx-refresh"></div>
                </div>
            </div>

            <h5>메일내용</h5>
            <div class="right_float">
                <input type="checkbox" id="estimateRegisterAutoEmailSend"><label for="estimateRegisterAutoEmailSend"> 자동메일발송 사용</label>
            </div>
            <div>
                <textarea class="col-md-12 col-sm-12" name="EMAIL_CONTENT_TXT" id="CONTROL_ESTIMATE_EMAIL_CONTENT_TXT" style="height: 100px;"> </textarea>
            </div>
            <h5>메일수신처</h5>
            <div id="control_estimate_register_bot_grid"></div>

            <h5>첨부파일</h5>
            <div class="fileTableWrap">
                <table class="colStyle" id="attachDragAndDrop">
                    <caption></caption>
                    <thead>
                    <tr>
                        <th scope="col" class="fileName txt">파일명</th>
                        <th scope="col" class="etcInfo">용량</th>
                        <th scope="col" class="etcInfo"></th>
                    </tr>
                    </thead>
                    <tbody class="files"></tbody>
                </table>
            </div>
        </form>
    </div>
</div>

<form id="transaction_statement_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectTransactionStatementInfoExcel:selectTransactionStatementListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="info:data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ_STR:COMP_CD:ORDER_COMP_CD"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="transaction_statement_template"/>
</form>

<form id="transaction_statement_list_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectTransactionStatementListDataExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="transaction_statement_list_template"/>
</form>

<form id="control_estimate_list_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectControlEstimateDetailListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="control_estimate_list_template"/>
</form>

<form id="estimate_register_hidden_form" method="POST">
    <input type="hidden" id="queryId" name="queryId" value="selectEstimateDetailList"/>
    <input type="hidden" id="EST_SEQ" name="EST_SEQ" value=""/>
</form>




<script>
    $(function () {
        'use strict';
        /* variable */
        const BUSINESS_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        const ORDER_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        const COMPANY_STAFF = (function () {
            let list = [];
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getCompanyStaffList'}};

            fnPostAjax(function (data, callFunctionParam) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, compCd: obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();
        let selectedRowIndex = [];
        let $orderManagementGrid;
        const gridId = 'CONTROL_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let colModel = [
            {title: 'ROWNUM', clsHead: 'display_none', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', clsHead: 'display_none', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', clsHead: 'display_none', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', clsHead: 'display_none', dataType: 'integer',dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', clsHead: 'display_none', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', clsHead: 'display_none', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', clsHead: 'display_none', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', clsHead: 'display_none', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},

            {
                title: '주문상태', clsHead: 'cantChange', align: 'center', colModel: [
                    {title: '상태', clsHead: 'display_none', datatype: 'string', dataIndx: 'CONTROL_STATUS_ORIGINAL', hidden: true},
                    {title: '상태', clsHead: 'display_none', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', clsHead: 'cantChange', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', clsHead: 'cantChange', width: 95, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '단가확인', clsHead: 'selectChange', width: 70, dataType: 'string', dataIndx: 'PRICE_CONFIRM', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',  options: fnGetCommCodeGridSelectBox('1017')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let priceConfirm = fnGetCommCodeGridSelectBox('1017');
                        let index = priceConfirm.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = priceConfirm.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : priceConfirm[index].text;
                    }
                }
            },
            {title: '발주업체', clsHead: 'selectChange', dataType: 'string', dataIndx: 'ORDER_COMP_CD', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = ORDER_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ORDER_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : ORDER_COMPANY[index].text;
                    }
                }
            },
            {title: '구매담당', clsHead: 'selectChange', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', editable: true,
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let companyStaffList = COMPANY_STAFF.filter(function (value, index, array) {
                            return value.compCd == ui.rowData.ORDER_COMP_CD;
                        });

                        return companyStaffList;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = COMPANY_STAFF.findIndex(function (element) {
                            return element.text == cellData;
                        });

                        if (index < 0) {
                            index = COMPANY_STAFF.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : COMPANY_STAFF[index].text;
                    }
                }
            },
            {title: '설계자', clsHead: 'inputChange', dataType: 'string', dataIndx: 'DESIGNER_NM', editable: true, styleHead: {'font-weight': 'bold'}},
            {title: '비고', clsHead: 'inputChange', dataType: 'string', dataIndx: 'NOTE', editable: true},
            {title: 'INV No.<br>(거래명세No.)', clsHead: 'cantChange', width: 100, dataType: 'string', dataIndx: 'INVOICE_NUM'},
            {title: '프로젝트', clsHead: 'inputChange', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', editable: true},
            {title: '모듈', clsHead: 'inputChange', width: 70, dataType: 'string', dataIndx: 'MODULE_NM', editable: true},
            {title: '납품처', clsHead: 'inputChange', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', editable: true},
            {title: '비고(라벨)', clsHead: 'inputChange', dataType: 'string', dataIndx: 'LABEL_NOTE', editable: true},
            {title: '주요<br>검사품', clsHead: 'selectChange', dataType: 'string', dataIndx: 'MAIN_INSPECTION', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1059')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let mainInspection = fnGetCommCodeGridSelectBox('1059');
                        let index = mainInspection.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = mainInspection.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : mainInspection[index].text;
                    }
                }
            },
            {title: '긴급', clsHead: 'selectChange control_manage_view_quality', dataType: 'string', dataIndx: 'EMERGENCY_YN', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: 'CONTROL_VER', clsHead: 'control_manage_view_close', dataType: 'string', dataIndx: 'CONTROL_VER', hidden: true},
            {title: '관리번호', clsHead: 'inputChange control_manage_view_estimate', width: 130, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {
                title: 'Part', clsHead: 'cantChange', dataType: 'integer', dataIndx: 'PART_NUM',
                render: function (ui) {
                    if (ui.rowData.WORK_TYPE === 'WTP020') {
                        return '<span class="ui-icon ui-icon-circle-plus" name="PART_NUM_PLUS_BUTTON"></span>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=PART_NUM_PLUS_BUTTON]').on('click', function (event) {
                        let rowData = fnCloneObj(ui.rowData);
                        let data = $orderManagementGrid.pqGrid('option', 'dataModel.data'), totalRecords = data.length;
                        let newPartNum = 0, lastRowIndex = 0, newRowData;

                        for (let i = 0; i < totalRecords; i++) {
                            if (data[i].CONTROL_SEQ === rowData.CONTROL_SEQ) {
                                newPartNum++;
                                lastRowIndex = data[i].pq_ri;
                            }
                        }

                        newRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: lastRowIndex});
                        newRowData = fnCloneObj(newRowData);
                        newRowData.ROWNUM = totalRecords + 1;
                        newRowData.PART_NUM = newPartNum;

                        $orderManagementGrid.pqGrid('addRow', {
                            newRow: newRowData,
                            rowIndx: lastRowIndex + 1,
                            checkEditable: false
                        });
                        event.preventDefault();
                    });
                }
            },
            {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER', hidden: true},
            {title: '도면번호', clsHead: 'inputChange', width: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: '품명', clsHead: 'inputChange', width: 110, dataType: 'string', dataIndx: 'ITEM_NM', editable: true},
            {title: '작업<br>형태', clsHead: 'selectChange', dataType: 'string', dataIndx: 'WORK_TYPE', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1033');
                        let index = workType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : workType[index].text;
                    }
                }
            },
            {title: '외주', clsHead: 'selectChange', dataType: 'string', dataIndx: 'OUTSIDE_YN', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '수행<br>공장', clsHead: 'selectChange', dataType: 'string', dataIndx: 'WORK_FACTORY', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1014')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1014');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }
            },
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', editable: true},
            {title: '규격', width: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let materialDetail = fnGetCommCodeGridSelectBox('1027');
                        let index = materialDetail.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialDetail.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialDetail[index].text;
                    }
                }
            },
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let materialKind = fnGetCommCodeGridSelectBox('1029');

                        let index = materialKind.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialKind.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialKind[index].text;
                    }
                }
            },
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1039')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let surfaceTreat = fnGetCommCodeGridSelectBox('1039');
                        let index = surfaceTreat.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = surfaceTreat.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : surfaceTreat[index].text;
                    }
                }
            },
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', editable: true},
            {title: 'Part<br>단위<br>수량', dataType: 'integer', dataIndx: 'PART_UNIT_QTY'},
            {title: '주문<br>수량', dataType: 'integer', dataIndx: 'ORDER_QTY_TOTAL'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', editable: true},
                    {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY', editable: true}
                ]
            },
            {
                title: '발주정보', align: 'center', colModel: [
                    {
                        title: '', datatype: 'string', dataIndx: 'ORDER_NUM_PLUS_BUTTON',
                        render: function (ui) {
                            if (ui.rowData.WORK_TYPE === 'WTP010' || ui.rowData.WORK_TYPE === 'WTP020' || ui.rowData.WORK_TYPE === 'WTP030') {
                                return '<span class="ui-icon ui-icon-circle-plus" name="ORDER_NUM_PLUS_BUTTON"></span>';
                            }
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);

                            $cell.find('[name=ORDER_NUM_PLUS_BUTTON]').on('click', function (event) {
                                let newRowData = fnCloneObj(ui.rowData);
                                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                                let totalRecords = data.length;

                                newRowData.ROWNUM = totalRecords + 1;
                                $orderManagementGrid.pqGrid('addRow', {
                                    newRow: newRowData,
                                    rowIndx: ui.rowIndx + 1,
                                    checkEditable: false
                                });
                                event.preventDefault();
                            });
                        }
                    },
                    {title: '발주번호', width: 90, datatype: 'string', dataIndx: 'ORDER_NUM', editable: true},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', editable: true},
                    {title: '출고', datatype: 'string', dataIndx: 'CNFRH'},
                    {title: '납기', width: 70, datatype: 'string', dataIndx: 'ORDER_DUE_DT', editable: true},
                    {title: '납품확인', width: 70, datatype: 'string', dataIndx: 'DELIVERY_DT', editable: true},
                ]
            },
            {
                title: '상세가공요건', align: 'center', hidden: true, colModel: [
                    {title: '선반', datatype: 'string', dataIndx: 'DETAIL_LATHE'},
                    {title: '가공면', datatype: 'string', dataIndx: 'DETAIL_SURFACE'},
                    {title: '클램핑', datatype: 'string', dataIndx: 'DETAIL_CLAMPING'},
                    {title: '포켓', datatype: 'string', dataIndx: 'DETAIL_POCKET'},
                    {title: '드릴', datatype: 'string', dataIndx: 'DETAIL_DRILL'},
                    {title: '난도', datatype: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
                ]
            },
            {
                title: '소재마감', align: 'center', hidden: true, colModel: [
                    {title: 'TM각비', datatype: 'string', dataIndx: 'MATERIAL_FINISH_TM'},
                    {title: '연마', datatype: 'string', dataIndx: 'MATERIAL_FINISH_GRIND'},
                    {title: '열처리', datatype: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'}
                ]
            },
            {
                title: '예상소재 Size', align: 'center', hidden: true, colModel: [
                    {title: '@', datatype: 'string', dataIndx: 'RKFH'},
                    {title: '가로', datatype: 'string', dataIndx: 'SIZE_W_M'},
                    {title: '세로', datatype: 'string', dataIndx: 'SIZE_H_M'},
                    {title: '높이', datatype: 'string', dataIndx: 'SIZE_T_M'},
                    {title: '중량(KG)', datatype: 'string', dataIndx: 'SIZE_D_M'},
                    {title: '부피(cm3)', datatype: 'string', dataIndx: 'SIZE_L_M'}
                ]
            },
            {
                title: '항목별 계산견적 단가 (10원단위 반올림)', align: 'center', colModel: [
                    {title: '소재비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AMT', editable: true},
                    {title: 'TM각비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_TM_AMT', editable: true},
                    {title: '연마비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_GRIND_AMT', editable: true},
                    {title: '열처리', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_HEAT_AMT', editable: true},
                    {title: '표면처리', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SURFACE_AMT', editable: true},
                    {title: '가공비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_PROCESS_AMT', editable: true},
                    {title: '기타추가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_ETC_AMT', editable: true},
                    {title: '견적비고', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT_NOTE', editable: true}
                ]
            },
            {title: '계산<br>견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'CALCUL_EST_UNIT_COST',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let UNIT_MATERIAL_AMT = rowData.UNIT_MATERIAL_AMT || 0;
                    let UNIT_TM_AMT = rowData.UNIT_TM_AMT || 0;
                    let UNIT_GRIND_AMT = rowData.UNIT_GRIND_AMT || 0;
                    let UNIT_HEAT_AMT = rowData.UNIT_HEAT_AMT || 0;
                    let UNIT_SURFACE_AMT = rowData.UNIT_SURFACE_AMT || 0;
                    let UNIT_PROCESS_AMT = rowData.UNIT_PROCESS_AMT || 0;
                    let UNIT_ETC_AMT = rowData.UNIT_ETC_AMT || 0;
                    let CALCUL_EST_UNIT_COST = UNIT_MATERIAL_AMT + UNIT_TM_AMT + UNIT_GRIND_AMT + UNIT_HEAT_AMT + UNIT_SURFACE_AMT + UNIT_PROCESS_AMT + UNIT_ETC_AMT;

                    if (CALCUL_EST_UNIT_COST > 0) {
                        return CALCUL_EST_UNIT_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                    }
                }
            },
            {title: '최종<br>견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', editable: true},
            {title: '견적<br>합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'EST_TOTAL_AMOUNT'},
            {title: '최종<br>공급단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', editable: true},
            {title: '합계금액', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMT'},
            {title: '종전가', width: 100, dataType: 'integer', format: '#,###', dataIndx: 'WHDWJSRK'},
            {title: '변경전<br>도면번호', width: 120, dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', editable: true},
            {
                title: '마감/취소 현황', align: 'center', colModel: [
                    {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH'},
                    {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER'},
                    {title: '작성자', datatype: 'string', dataIndx: 'akrkacnlthtkwrtjdwk'},
                    {title: '일시', width: 120, datatype: 'string', dataIndx: 'CLOSE_DT'}
                ]
            },
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let rowIndx = ui.rowIndx,
                        grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: 'Rev.', dataType: 'string', dataIndx: 'REVD.'},
            {title: 'Rev. 일시', width: 120, dataType: 'string', dataIndx: 'REVDLFTL.'},
            {
                title: '외주현황', align: 'center', colModel: [
                    {title: '외주업체', datatype: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '외주업체', datatype: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '자재사급', datatype: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                    {title: '외주단가', datatype: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', datatype: 'integer', dataIndx: 'OUTSIDE_FINAL_AMT'},
                    {title: '요망납기', datatype: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고날짜', datatype: 'string', dataIndx: 'dhlwndlqrhskfWk'},
                    {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE'},
                    {title: '불량Code', datatype: 'string', dataIndx: 'dhlwnqnffidcode'},
                    {title: '조치방안', datatype: 'string', dataIndx: 'dhlwnwhclqkddks'}
                ]
            },
            {title: '등록/업데이트<br>일시', width: 120, dataType: 'string', dataIndx: 'STATUS_DT'},
            {title: 'DEL_YN', clsHead: 'display_none', dataType: 'string', dataIndx: 'DEL_YN', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            height: 700,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            // editModel: {clicksToEdit: 1},
            complete: function (event, ui) {
                // this.flex();
                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');

                $('#CONTROL_MANAGE_RECORDS').html(data.length);
            },
            cellClick: function (event, ui) {
                supplyUnitCostInit(); // 공급단가적용 초기화

                if(ui.rowData.IMG_GFILE_SEQ) callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);  // 셀 선택시 도면 View 실행 중인경우 이미지 표시 하기
            },
            selectChange: function (event, ui) {
                supplyUnitCostInit(); // 공급단가적용 초기화

                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) selectedRowIndex[0] = firstRow;
                    else for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let updateListLength = ui.updateList.length;

                    for (let i = 0; i < updateListLength; i++) {
                        let newRowData = ui.updateList[i].newRow;
                        let rowIndx = ui.updateList[i].rowIndx;

                        if (newRowData.hasOwnProperty('WORK_TYPE')) {
                            let workType = fnGetCommCodeGridSelectBox('1033');
                            let index = workType.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index < 0) {
                                index = workType.findIndex(function (element) {
                                    return element.value === newRowData.WORK_TYPE;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'WORK_TYPE': workType[index].value}
                            });
                        }
                    }
                }

                if (ui.source === 'edit') {
                    let rowIndx = ui.updateList[0].rowIndx;
                    let data = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;
                    let array = ['UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'ORDER_QTY'];
                    let estimateFlag = false;

                    for (let value of array) {
                        if (newRow.hasOwnProperty(value)) {
                            estimateFlag = true;
                        }
                    }

                    if (estimateFlag) {
                        let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == null || data.UNIT_MATERIAL_AMT == '' ? 0 : Number(data.UNIT_MATERIAL_AMT); // 소재비
                        let UNIT_TM_AMT = data.UNIT_TM_AMT == null || data.UNIT_TM_AMT == '' ? 0 : Number(data.UNIT_TM_AMT); //TM각비
                        let UNIT_GRIND_AMT = data.UNIT_GRIND_AMT == null || data.UNIT_GRIND_AMT == '' ? 0 : Number(data.UNIT_GRIND_AMT); // 연마비
                        let UNIT_HEAT_AMT = data.UNIT_HEAT_AMT == null || data.UNIT_HEAT_AMT == '' ? 0 : Number(data.UNIT_HEAT_AMT); // 열처리
                        let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == null || data.UNIT_SURFACE_AMT == '' ? 0 : Number(data.UNIT_SURFACE_AMT); // 표면처리
                        let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == null || data.UNIT_PROCESS_AMT == '' ? 0 : Number(data.UNIT_PROCESS_AMT); // 가공비
                        let UNIT_ETC_AMT = data.UNIT_ETC_AMT == null || data.UNIT_ETC_AMT == '' ? 0 : Number(data.UNIT_ETC_AMT); // 기타추가
                        let ORDER_QTY = data.ORDER_QTY == null || data.ORDER_QTY == '' ? 0 : Number(data.ORDER_QTY); //발주 수량
                        let calculateEstimateAmount = 0; // 견적금액(계산 견적단가)
                        calculateEstimateAmount += UNIT_MATERIAL_AMT;
                        calculateEstimateAmount += UNIT_TM_AMT;
                        calculateEstimateAmount += UNIT_GRIND_AMT;
                        calculateEstimateAmount += UNIT_HEAT_AMT;
                        calculateEstimateAmount += UNIT_SURFACE_AMT;
                        calculateEstimateAmount += UNIT_PROCESS_AMT;
                        calculateEstimateAmount += UNIT_ETC_AMT;

                        let unitFinalEstimateAmount = ui.updateList[0].newRow.UNIT_FINAL_EST_AMT || calculateEstimateAmount; // 최종 견적단가
                        let estimatedTotalAmount = unitFinalEstimateAmount * ORDER_QTY; // 견적 합계 금액
                        let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || estimatedTotalAmount; // 최종 공급단가
                        let finalAmount = unitFinalAmount * ORDER_QTY;// 합계 금액
                        let row;

                        if (ui.updateList[0].newRow.UNIT_FINAL_AMT) {
                            row = {
                                'CALCUL_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
                                // 'UNIT_FINAL_EST_AMT': unitFinalEstimateAmount, // 최종 견적단가
                                // 'EST_TOTAL_AMOUNT': estimatedTotalAmount, // 견적 합계금액 = 최종 견적단가 * 발주수량
                                'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                'FINAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                            };
                        } else {
                            row = {
                                'CALCUL_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
                                'UNIT_FINAL_EST_AMT': unitFinalEstimateAmount, // 최종 견적단가
                                'EST_TOTAL_AMOUNT': estimatedTotalAmount, // 견적 합계금액 = 최종 견적단가 * 발주수량
                                'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                'FINAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                            };
                        }
                        $orderManagementGrid.pqGrid('updateRow', {
                            rowIndx: rowIndx,
                            row: row,
                            checkEditable: false
                        });
                    }
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $orderManagementGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        };
        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupColModel = [
            {
                title: '단가확인', dataType: 'string', dataIndx: 'PRICE_CONFIRM',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1017')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let priceConfirm = fnGetCommCodeGridSelectBox('1017');
                        let index = priceConfirm.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = priceConfirm.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        console.log(index);
                        return (index < 0) ? cellData : priceConfirm[index].text;
                    }
                }
            },
            {
                title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: BUSINESS_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = BUSINESS_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = BUSINESS_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : BUSINESS_COMPANY[index].text;
                    }
                }
            },
            {
                title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = ORDER_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ORDER_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : ORDER_COMPANY[index].text;
                    }
                }
            },
            {
                title: '구매<br>담당자', dataType: 'string', dataIndx: 'ORDER_STAFF_NM',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let companyStaffList = COMPANY_STAFF.filter(function (value, index, array) {
                            return value.compCd == ui.rowData.ORDER_COMP_CD;
                        });

                        return companyStaffList;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = COMPANY_STAFF.findIndex(function (element) {
                            return element.text == cellData;
                        });

                        if (index < 0) {
                            index = COMPANY_STAFF.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : COMPANY_STAFF[index].text;
                    }
                }
            },
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM'},
            {title: '모듈', dataType: 'string', dataIndx: 'MODULE_NM'},
            {title: '납품처', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM'},
            {title: '비고(라벨)', dataType: 'string', dataIndx: 'LABEL_NOTE'},
            {
                title: '주요 검사품', dataType: 'string', dataIndx: 'MAIN_INSPECTION',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1059')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let mainInspection = fnGetCommCodeGridSelectBox('1059');
                        let index = mainInspection.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = mainInspection.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : mainInspection[index].text;
                    }
                }
            },
            {
                title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN',
                editor: {type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM'},
            {
                title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1033');
                        let index = workType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : workType[index].text;
                    }
                }
            },
            {
                title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let yesOrNo = fnGetCommCodeGridSelectBox('1042');
                        let index = yesOrNo.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = yesOrNo.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : yesOrNo[index].text;
                    }
                }
            },
            {
                title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1014')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1014');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }
            },
            {
                title: '소재 사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '가공납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT'},
            {
                title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let materialDetail = fnGetCommCodeGridSelectBox('1027');
                        let index = materialDetail.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialDetail.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialDetail[index].text;
                    }
                }
            },
            {
                title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let materialKind = fnGetCommCodeGridSelectBox('1029');

                        let index = materialKind.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialKind.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialKind[index].text;
                    }
                }
            },
            {
                title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1039')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let surfaceTreat = fnGetCommCodeGridSelectBox('1039');
                        let index = surfaceTreat.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = surfaceTreat.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : surfaceTreat[index].text;
                    }
                }
            },
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE'},
            {title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {
                title: '발주정보', align: 'center', colModel: [
                    {title: '발주번호', datatype: 'string', dataIndx: 'ORDER_NUM'},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY'},
                    {title: '납기', datatype: 'string', dataIndx: 'ORDER_DUE_DT'},
                    {title: '납품확인', datatype: 'string', dataIndx: 'DELIVERY_DT'}
                ]
            },
            {title: '최종<br>견적단가', dataType: 'string', dataIndx: 'UNIT_FINAL_EST_AMT'},
            {title: '최종<br>공급단가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '변경전<br>도면번호', dataType: 'string', dataIndx: 'PREV_DRAWING_NUM'}
        ];
        const popupToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Reset', icon: 'ui-icon-arrowrefresh-1-s', listener: {
                        'click': function () {
                            $orderRegisterGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save & 확정', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function () {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/createNewOrderConfirm',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $('#CONTROL_MANGE_POPUP').modal('hide');
                                $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function () {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/createNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $('#CONTROL_MANGE_POPUP').modal('hide');
                                $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                }
            ]
        };
        const popupObj = {
            height: 700,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center'},
            colModel: popupColModel,
            copyModel: {render: true},
            toolbar: popupToolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    const addListLength = ui.addList.length;
                    const priceConfirmList = fnGetCommCodeGridSelectBox('1017');
                    const mainInspectionList = fnGetCommCodeGridSelectBox('1059');
                    const workTypeList = fnGetCommCodeGridSelectBox('1033');
                    const workFactoryList = fnGetCommCodeGridSelectBox('1014');
                    const materialDetailList = fnGetCommCodeGridSelectBox('1027');
                    const materialKindList = fnGetCommCodeGridSelectBox('1029');
                    const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                    let rowListConvert = [];

                    for (let i = 0; i < addListLength; i++) {
                        const newRowData = ui.addList[i].newRow;
                        const rowIndx = ui.addList[i].rowIndx;
                        let priceConfirm = null;
                        let compCd = null;
                        let orderCompCd = null;
                        let mainInspection = null;
                        let workType = null;
                        let workFactory = null;
                        let materialDetail = null;
                        let materialKind = null;
                        let surfaceTreat = null;

                        console.log(priceConfirmList);
                        // 단가확인
                        if (newRowData.PRICE_CONFIRM !== undefined) {
                            let index = priceConfirmList.findIndex(function (element) {
                                return element.text === newRowData.PRICE_CONFIRM;
                            });
                            if (index >= 0) priceConfirm = priceConfirmList[index].value;
                        }
                        // 사업자
                        if (newRowData.COMP_CD !== undefined) {
                            let index = BUSINESS_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index >= 0) compCd = BUSINESS_COMPANY[index].value;
                        }
                        // 발주업체
                        if (newRowData.ORDER_COMP_CD !== undefined) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index >= 0) orderCompCd = ORDER_COMPANY[index].value;
                        }
                        // 주요검사품
                        if (newRowData.MAIN_INSPECTION !== undefined) {
                            let index = mainInspectionList.findIndex(function (element) {
                                return element.text === newRowData.MAIN_INSPECTION;
                            });

                            if (index >= 0) mainInspection = mainInspectionList[index].value;
                        }
                        // 작업형태
                        if (newRowData.WORK_TYPE !== undefined) {
                            let index = workTypeList.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index >= 0) workType = workTypeList[index].value;
                        }
                        // 수행공장
                        if (newRowData.WORK_FACTORY !== undefined) {
                            let index = workFactoryList.findIndex(function (element) {
                                return element.text === newRowData.WORK_FACTORY;
                            });

                            if (index >= 0) workFactory = workFactoryList[index].value;
                        }
                        //소재 상세
                        if (newRowData.MATERIAL_DETAIL !== undefined) {
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index >= 0) materialDetail = materialDetailList[index].value;
                        }
                        // 소재형태
                        if (newRowData.MATERIAL_KIND !== undefined) {
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index >= 0) materialKind = materialKindList[index].value;
                        }
                        // 표면처리
                        if (newRowData.SURFACE_TREAT !== undefined) {
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index >= 0) surfaceTreat = surfaceTreatList[index].value;
                        }

                        let tempObject = {
                            rowIndx: rowIndx,
                            newRow: {
                                'PRICE_CONFIRM': priceConfirm,
                                'COMP_CD': compCd,
                                'ORDER_COMP_CD': orderCompCd,
                                'MAIN_INSPECTION': mainInspection,
                                'WORK_TYPE': workType,
                                'WORK_FACTORY': workFactory,
                                'MATERIAL_DETAIL': materialDetail,
                                'MATERIAL_KIND': materialKind,
                                'SURFACE_TREAT': surfaceTreat
                            }
                        };
                        rowListConvert.push(tempObject);
                    }
                    $orderRegisterGrid.pqGrid('updateRow', {rowList: rowListConvert});
                }
            }
        };
        let $controlCloseLeftGrid;
        const controlCloseLeftGridId = 'CONTROL_CLOSE_LEFT_GRID';
        let controlCloseLeftColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '마감금액', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '네고금액', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT'}
        ];
        let controlCloseLeftObj = {
            height: 250,
            collapsible: false,
            resizable: false,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: controlCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {return {data: dataJSON.data};}
            }
        };
        let $controlCloseRightGrid;
        const controlCloseRightGridId = 'CONTROL_CLOSE_RIGHT_GRID';
        let controlCloseRightColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '변경 후 마감금액', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '변경 후 네고금액', dataType: 'integer', format: '#,###', dataIndx: 'NEGO_AMT', editable: true},
            {
                title: '추가 금액', align: 'center', colModel: [
                    {title: '', datatype: 'string', dataIndx: 'ADD_QTY'},
                    {title: '', datatype: 'integer', format: '#,###', dataIndx: 'ADD_UNIT_FINAL_AMT'}
                ]
            }
        ];
        let controlCloseRightObj = {
            height: 250,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: controlCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $transactionStatementDetailGrid;
        const transactionStatementDetailGridId = 'TRANSACTION_STATEMENT_DETAIL_GRID';
        const transactionStatementDetailColModel = [
            {title: '주문상태', dataType: 'string', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM'},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '단위', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '공급단가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '금액 계', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '포장수량', dataType: 'integer', format: '#,###', dataIndx: 'PACKING_CNT', editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true},
        ];
        const transactionStatementDetailObj = {
            height: 500,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: transactionStatementDetailColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $transactionStatementListGrid; // 거래 명세표 List Grid
        /* variable */

        /* function */
        let changeDate = function (newDate = new Date(), today = new Date()) {
            $('#CONTROL_MANAGE_START_DATE').val(newDate.yyyymmdd());
            $('#CONTROL_MANAGE_END_DATE').val(today.yyyymmdd());
        };

        let getOrderStatusButton = function (event) {
            let controlStatus = event.target.dataset.control_status;
            let controlStatusNm = event.target.dataset.control_status_nm;

            updateOrderStatus(controlStatus, controlStatusNm);
        };

        let updateOrderStatus = function (controlStatus, controlStatusNm) {
            let selectedRowCount = selectedRowIndex.length;
            let rowListConvert = [];
            let date = new Date().yyyymmddhhmm();

            for (let i = 0; i < selectedRowCount; i++) {
                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: {
                        'CONTROL_STATUS': controlStatus,
                        'PART_STATUS': controlStatus,
                        'ORDER_STATUS': controlStatus,
                        'CONTROL_STATUS_NM': controlStatusNm,
                        'CONTROL_STATUS_DT': date
                    },
                    checkEditable: false
                };
                rowListConvert.push(tempObject);
            }
            $orderManagementGrid.pqGrid('updateRow', {rowList: rowListConvert});
        };

        let loadDataControlClose = function (open) {
            let selectedRowCount = selectedRowIndex.length;
            let list = [];
            let controlSeqList = [];
            let orderCompCdList = [];
            let controlSeqStr = '';
            let orderCompCdStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlSeqList.push(rowData.CONTROL_SEQ);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
            }
            // 중복제거
            controlSeqList = controlSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }
            for (let i = 0; i < orderCompCdList.length; i++) {
                orderCompCdStr += '\'' + orderCompCdList[i] + '\'';

                if (i < orderCompCdList.length - 1) {
                    orderCompCdStr += ',';
                }
            }

            $('#CONTROL_CLOSE_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CONTROL_CLOSE_FORM > #ORDER_COMP_CD').val(orderCompCdStr);

            if (open) {
                let postData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
                postData.queryId = 'orderMapper.selectControlCloseVer';
                let parameters = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    let closeVer = data.list[0] === null ? 1 : data.list[0].MAX_CLOSE_VER;
                    $('#CONTROL_CLOSE_FORM #CLOSE_VER').val(closeVer).prop('selected', true);
                }, parameters, '');

                $controlCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                    return (fnFormToJsonArrayData('#CONTROL_CLOSE_FORM'));
                });
                $controlCloseLeftGrid.pqGrid('refreshDataAndView');
            }

            let controlCloseRightPostData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
            controlCloseRightPostData.list = list;
            let parameters = {
                'url': '/selectControlCloseRightList',
                'data': {data: JSON.stringify(controlCloseRightPostData)}
            };

            fnPostAjax(function (data) {
                $controlCloseRightGrid.pqGrid('option', 'dataModel.data', data.list);
                $controlCloseRightGrid.pqGrid('refreshView');
            }, parameters, '');
        };

        // topWrap 확장 함수
        const topMenuOpen = function () {
            let top = $('#view_tab_100021 .gubunWrap');
            let bottom = $('#view_tab_100021 .bottomWrap');
            let con = $('#view_tab_100021 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '130px'}, 300, 'easeOutCubic');
            bottom.stop().animate({'height': '770px'}, 300, 'easeOutCubic');
            con.css({'height': '640px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        // topWrap 축소 함수
        const topMenuClose = function () {
            let top = $('#view_tab_100021 .gubunWrap');
            let bottom = $('#view_tab_100021 .bottomWrap');
            let con = $('#view_tab_100021 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '40px'}, 300, 'easeInCubic');
            bottom.stop().animate({'height': '855px'}, 300, 'easeOutCubic');
            con.css({'height': '714px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                alert('하나 이상 선택해주세요');
                return true;
            }
        };

        const supplyUnitCostInit = function () {
            $('#SUPPLY_UNIT_COST_APPLY option:eq(0)').prop('selected', true); // 공급단가적용 초기화?
        };
        /* function */

        /* event */
        $('#CONTROL_MANAGE_TOPWRAP_BTN').on('click', function () {
            if ($(this).hasClass('on')) {
                topMenuClose();
                $(this).removeClass('on');
            } else {
                topMenuOpen();
                $(this).addClass('on');
            }
        });

        /**
         * @description 날짜 라디오 변경
         */
        $('[name=CONTROL_MANAGE_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            switch (value) {
                case 'today':
                    changeDate(newDate, today);
                    break;
                case 'current_month':
                    newDate.setDate(1);

                    changeDate(newDate, today);
                    break;
                case 'three_months':
                    newDate.setMonth(newDate.getMonth() - 3);

                    changeDate(newDate, today);
                    break;
            }

            $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').prop('checked', true);
            createOrDestroyDatepicker();
        });

        let createOrDestroyDatepicker = function () {
            let checked = $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').prop('checked');

            if (checked) $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker('destroy');
            else $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker();
        };


        /**
         * @description 날짜 라디오 변경
         */
        $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').on('change', function () {
            createOrDestroyDatepicker();
        });

        $('#CONTROL_MANAGE_SAVE').on('click', function () {
            const insertQueryList = ['orderMapper.createControlPart', 'orderMapper.createControlPartOrder'];
            const updateQueryList = ['orderMapper.updateControlMaster', 'orderMapper.updateControlPart', 'orderMapper.updateControlPartOrder', 'orderMapper.createControlProgress', 'orderMapper.createControlPartProgress'];

            fnModifyPQGrid($orderManagementGrid, insertQueryList, updateQueryList);
        });

        $('#CONTROL_MANAGE_DELETE').on('click', function () {
            let rowListConvert = [];
            let selectedRowCount = selectedRowIndex.length;
            const controlUpdateQueryList = ['orderMapper.DeleteControl'];

            for (let i = 0; i < selectedRowCount; i++) {
                let thisRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                if (!(thisRowData.CONTROL_STATUS_ORIGINAL === undefined || thisRowData.CONTROL_STATUS_ORIGINAL === 'ORD002')) {
                    alert('확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능');
                    return false;
                }

                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: {
                        'DEL_YN': 'Y'
                    }
                };
                rowListConvert.push(tempObject);
            }

            $orderManagementGrid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});

            fnModifyPQGrid($orderManagementGrid, [], controlUpdateQueryList);
        });

        $('#CONTROL_MANGE_POPUP').on({
            'show.bs.modal': function () {
                $orderRegisterGrid = $('#' + popupGridId).pqGrid(popupObj);
            },
            'hide.bs.modal': function () {
                $orderRegisterGrid.pqGrid('destroy');
            }
        });

        $('#CONTROL_CLOSE_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                let selectedRowCount = selectedRowIndex.length;

                for (let i = 0; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    if (rowData.CONTROL_STATUS_ORIGINAL !== 'ORD001') {
                        alert('주문 상태가 확정일 때 월 마감이 가능합니다.');
                        return false;
                    }
                }

                fnAppendSelectboxYear('CONTROL_CLOSE_YEAR', 3);
                fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH');
                $('#CONTROL_CLOSE_MONTH').val(CURRENT_MONTH < 9 ? '0' + CURRENT_MONTH : CURRENT_MONTH).prop('selected', true);

                $('#CONTROL_CLOSE_POPUP #CLOSE_VER')

                $controlCloseLeftGrid = $('#' + controlCloseLeftGridId).pqGrid(controlCloseLeftObj);
                $controlCloseRightGrid = $('#' + controlCloseRightGridId).pqGrid(controlCloseRightObj);

                loadDataControlClose(true);
            },
            'hide.bs.modal': function () {
                $controlCloseLeftGrid.pqGrid('destroy');
                $controlCloseRightGrid.pqGrid('destroy');
            }
        });

        $('#CONTROL_CLOSE_FORM').on('change', function () {
            loadDataControlClose();
        });

        $('#CONTROL_MANAGE_SEARCH').on('click', function () {
            $orderManagementGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM'));
            });
            $orderManagementGrid.pqGrid('refreshDataAndView');
        });

        /**
         * @description 확정버튼 클릭
         */
        $('#CONFIRMATION').on('click', function (event) {
            let selectedRowCount = selectedRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                //TODO: 필수데이터가 입력되어 있어야만 확정 가능
                // if (rowData.OUTSIDE_YN === 'Y') {
                //     // alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                //     // return false;
                // }
            }

            getOrderStatusButton(event);
        });

        /**
         * @description 취소버튼 클릭
         */
        $('#CANCEL').on('click', function (event) {
            let selectedRowCount = selectedRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                if (rowData.OUTSIDE_YN === 'Y') {
                    //TODO: 문구수정
                    alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                    return false;
                }
            }

            getOrderStatusButton(event);
        });

        /**
         * @description 종료버튼 클릭
         */
        $('#TERMINATION').on('click', function (event) {
            let selectedRowCount = selectedRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                if (rowData.ORDER_STATUS_NM === '주문확정') {
                    alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                    return false;
                }

                //TODO: 마감대상이 아닌 대상 중 기록이 필요한 대상은 종료 처리
                // if (rowData.OUTSIDE_YN === 'Y') {
                //     //TODO: 문구수정
                //     alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                //     return false;
                // }
            }

            getOrderStatusButton(event);
        });

        $('#CONTROL_CLOSE_YEAR').on('change', function () {
            fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH', this.value);
        });

        $('[name=CONTROL_MANAGE_VIEW]').on('click', function (event) {
            let elementId = event.target.id;
            let $orderManagementGridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let Cols = $orderManagementGridInstance.Columns();
            let mode = '';

            switch (elementId) {
                case 'CONTROL_MANAGE_VIEW_ALL':
                    mode = 'control_manage_view_all';
                    break;
                case 'CONTROL_MANAGE_VIEW_ESTIMATE':
                    mode = 'control_manage_view_estimate';
                    break;
                case 'CONTROL_MANAGE_VIEW_QUALITY':
                    mode = 'control_manage_view_quality';
                    break;
                case 'CONTROL_MANAGE_VIEW_CLOSE':
                    mode = 'control_manage_view_close';
                    break;
            }

            Cols.alter(function () {
                Cols.each(function (col) {
                    if (mode === 'all') {
                        return col.hasOwnProperty('clsHead') && col.clsHead.includes('display_none') ? col.hidden = true : col.hidden = false;
                    } else if (mode === '') {
                        console.info('확인하세요.');
                    } else {
                        if (col.hasOwnProperty('clsHead')) {
                            let flag = !col.clsHead.includes(mode);

                            col.hidden = flag;

                            if (col.hasOwnProperty('colModel') && col.colModel.length > 0) {
                                let length = col.colModel.length;

                                for (let i = 0; i < length; i++) {
                                    col.colModel[i].hidden = flag;
                                }
                            }
                        }
                    }
                });
            });
        });
        // 거래명세표
        $('#TRANSACTION_STATEMENT_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                let selectedRowCount = selectedRowIndex.length;
                let list = [];
                let controlSeqList = [];
                let compCdList = [];
                let orderCompCdList = [];
                let invoiceNumList = [];
                let controlSeqStr = '';

                for (let i = 0; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    list.push(rowData);
                    controlSeqList.push(rowData.CONTROL_SEQ);
                    compCdList.push(rowData.COMP_CD);
                    orderCompCdList.push(rowData.ORDER_COMP_CD);
                    invoiceNumList.push(rowData.INVOICE_NUM);
                }
                // 중복제거
                controlSeqList = controlSeqList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                compCdList = compCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                invoiceNumList = invoiceNumList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                console.log(invoiceNumList);

                if (controlSeqList.length === 0) {
                    alert('에러!');
                    return false;
                }
                if (compCdList.length === 0) {
                    alert('공급사가 없습니다!');
                    return false;
                }
                if (orderCompCdList.length === 0) {
                    alert('발주사가 없습니다!');
                    return false;
                }
                if (compCdList.length > 1) {
                    alert('선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                    return false;
                }
                if (orderCompCdList.length > 1) {
                    alert('선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                    return false;
                }
                if (invoiceNumList.length > 1) {
                    alert('선택된 대상들의 거래명세 번호는 동일해야 합니다.');
                    return false;
                }

                for (let i = 0; i < controlSeqList.length; i++) {
                    controlSeqStr += controlSeqList[i];

                    if (i < controlSeqList.length - 1) {
                        controlSeqStr += ',';
                    }
                }

                $('#TRANSACTION_STATEMENT_FORM > #COMP_CD').val(compCdList[0]);
                $('#TRANSACTION_STATEMENT_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);
                $('#TRANSACTION_STATEMENT_FORM > #CONTROL_SEQ_STR').val(controlSeqStr);

                let postData = fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM');

                $transactionStatementDetailGrid = $('#' + transactionStatementDetailGridId).pqGrid(transactionStatementDetailObj);
                fnRequestGidData($transactionStatementDetailGrid, postData);

                postData.queryId = 'orderMapper.selectControlTransactionStatementInfo';
                let parameters = {'url': '/json-info', 'data': postData};

                fnPostAjax(function (data) {
                    let obj = data.info;

                    $('#TRANSACTION_STATEMENT_FORM #COMP_NM').text(obj.COMP_NM);
                    $('#TRANSACTION_STATEMENT_FORM #ORDER_COMP_NM').text(obj.ORDER_COMP_NM);
                    $('#TRANSACTION_STATEMENT_FORM #TOTAL_AMT').text(obj.TOTAL_AMT);
                    $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM').val(obj.INVOICE_NUM);
                }, parameters, '');

                /* 구매 담당자 */
                postData.queryId = 'dataSource.getCompanyStaffList';
                parameters = {'url': '/json-list', 'data': postData};

                fnPostAjax(function (data) {
                    $('#TRANSACTION_STATEMENT_FORM #ORDER_STAFF_SEQ').empty();

                    for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                        console.log(data.list);
                        let obj = data.list[i];

                        $('#TRANSACTION_STATEMENT_FORM #ORDER_STAFF_SEQ').append(new Option(obj.ORDER_STAFF_NM, obj.ORDER_STAFF_SEQ));
                    }
                }, parameters, '');

            },
            'hide.bs.modal': function () {
                $transactionStatementDetailGrid.pqGrid('destroy');
            }
        });

        $('#TRANSACTION_STATEMENT_SAVE').on('click', function () {
            let tempList = [];
            let infoPostData = fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM');
            let listPostData = $transactionStatementDetailGrid.pqGrid('option', 'dataModel.data');
            tempList.push(infoPostData);
            console.log(tempList);
            let postData = {
                'info-data': tempList,
                'list-data': listPostData
                // 'INVOICE_NUM':
            };

            let parameters = {'url': '/createInvoice', 'data': {data: JSON.stringify(postData)}}
            fnPostAjax(function (data) {
                alert("<spring:message code='com.alert.default.save.success' />");
                $orderManagementGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('#TRANSACTION_STATEMENT_DELETE').on('click', function () {
            let parameters;
            let selectedRowCount = selectedRowIndex.length;
            let invoiceNumList = [];

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                invoiceNumList.push(rowData.INVOICE_NUM);
            }
            // 중복제거
            invoiceNumList = invoiceNumList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (invoiceNumList[0] === undefined) {
                alert('삭제할 거래명세표가 없습니다.');
                return false;
            }
            if (invoiceNumList.length > 1) {
                alert('선택된 대상들의 거래명세 번호는 동일해야 합니다.');
                return false;
            }

            parameters = {'url': '/removeInvoice', 'data': {INVOICE_NUM: invoiceNumList[0]}};

            fnPostAjax(function (data, callFunctionParam) {
                console.log(data);
                alert('삭제!');
            }, parameters, '');
        });

        $('#TRANSACTION_STATEMENT_EXPORT').on('click', function () {
            let list = [];
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let invoiceNumList = [];
            let controlSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                invoiceNumList.push(rowData.INVOICE_NUM);
            }
            // 중복제거
            controlSeqList = controlSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            compCdList = compCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            invoiceNumList = invoiceNumList.filter(function (element, index, array) {f
                return array.indexOf(element) === index;
            });

            if (invoiceNumList[0] === undefined) {
                alert('엑셀출력할 거래명세표가 없습니다.');
                return false;
            }

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }
            $('#transaction_statement_excel_download #paramData').val(controlSeqStr + ':' + compCdList[0] + ':' + orderCompCdList[0]);
            fnReportFormToHiddenFormPageAction('transaction_statement_excel_download', '/downloadExcel');
        });

        // 견적List출력
        $('#ESTIMATE_LIST_PRINT').on('click', function () {
            let controlSeqList = [];
            let controlSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlSeqList.push(rowData.CONTROL_SEQ);
            }
            // 중복제거
            controlSeqList = controlSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }
            $('#control_estimate_list_excel_download #paramData').val(controlSeqStr);
            fnReportFormToHiddenFormPageAction('control_estimate_list_excel_download', '/downloadExcel');
        });
        // 바코드도면출력
        $('#BARCODE_DRAWING_PRINT').on('click', function () {
            let printHtml  = "";
            let selectedRowCount = selectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                if(!rowData.IMG_GFILE_SEQ){
                    alert("이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.");
                    return;
                }
                printHtml += '<div class="print">' +
                    '   <table class="drawingArea" style="table-layout: fixed; word-wrap:break-word;">' +
                    '        <tbody>' +
                    '        <tr class="controlInfo">' +
                    '           <td scope="col" width="28%" rowspan="2" class="center_sort"><img src="/barcode/code128/1234567890" class="barcode"></td>' +
                    '           <td scope="col" width="10%" rowspan="2" class="center_sort">'+rowData.ORDER_COMP_NM+'</td>' +
                    '           <td scope="col" width="3%" class="center_sort">'+rowData.CONTROL_VER+'</td>' +
                    '           <td scope="col" width="10%" rowspan="2" class="center_sort">'+rowData.CONTROL_NUM+'</td>' +
                    '           <td scope="col" width="3%" class="center_sort">Part</td>' +
                    '           <td scope="col" width="10%" colspan="2" class="center_sort">'+rowData.SIZE_TXT+'</td>' +
                    '           <td scope="col" width="10%" class="center_sort">'+rowData.WORK_TYPE_NM+'</td>' +
                    '           <td scope="col" width="10%" class="center_sort">'+rowData.MATERIAL_FINISH_HEAT+'</td>';
                if(rowData.PART_NUM){
                    printHtml += '           <td scope="col" width="3%" rowspan="2" class="center_sort">'+rowData.PART_UNIT_QTY+'</td>';
                }else{
                    printHtml += '           <td scope="col" width="3%" rowspan="2" class="center_sort">'+rowData.ORDER_QTY+'</td>';
                }
                printHtml = printHtml + '' +
                    '           <td scope="col" width="5%" class="center_sort">원칭</td>' +
                    '           <td scope="col" width="5%" class="center_sort">대칭</td>' +
                    '           <td scope="col" width="5%" class="center_sort">납기</td>' +
                    '        </tr>' +
                    '        <tr class="controlInfo">' +
                    '            <td scope="col" class="center_sort">'+rowData.DRAWING_VER+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.PART_NUM+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.MATERIAL_DETAIL_NM+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.SURFACE_TREAT+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.EMERGENCY_YN+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.MAIN_INSPECTION+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.ORIGINAL_SIDE_QTY+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.OTHER_SIDE_QTY+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.INNER_DUE_DT+'</td>' +
                    '        </tr>' +
                    '        <tr class="imageInfo">' +
                    '            <td scope="col" colspan="14"><img src="/image/'+rowData.IMG_GFILE_SEQ+'" class="drawingImage"></td>' +
                    '        </tr>' +
                    '        </tbody>' +
                    '    </table>' +
                    '</div>';
            }
            let drawingBarcodePrintModalConfirm = function(callback){
                let text = '<h4>' +
                    '           <img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '               <span>' + selectedRowCount + ' 건의 바코드 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '       </h4>';
                $("#commonConfirmBodyHtml").html(text);
                commonConfirmPopup.show();
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    $(this).startWaitMe();
                    $(".cadDrawingPrint").html(printHtml).trigger('create');
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function(e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            drawingBarcodePrintModalConfirm(function(confirm){
                if(confirm){
                    setTimeout(function() {
                        $(this).stopWaitMe();
                        $(".cadDrawingPrint").css("display","");
                        callWindowModalDrawingPopup();
                    }, 2000);
                }
            });
        });
        // 바코드출력
        $('#BARCODE_PRINT').on('click', function () {
            let printHtml = "";
            let selectedRowCount = selectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                console.log(rowData);

                printHtml += '<div class="print">\n' +
                    '            <table class="drawingArea barcodeLabel" style="table-layout: fixed; word-wrap: break-word;">\n' +
                    '                <tbody>\n' +
                    '                    <tr>\n' +
                    '                        <td class="header" rowspan="2">관리번호</td>\n' +
                    '                        <td rowspan="2" colspan="5">' + rowData.CONTROL_NUM + '</td>\n' +
                    '                        <td>0</td>\n' +
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td>1</td>\n' +
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td class="header" rowspan="2">수량</td>\n' +
                    '                        <td rowspan="2">' + rowData.ORDER_QTY_TOTAL + 'EA</td>\n' + //TODO: 확인필요
                    '                        <td>원칭</td>\n' +
                    '                        <td>대칭</td>\n' +
                    '                        <td class="header" rowspan="2">가공납기</td>\n' +
                    '                        <td rowspan="2" colspan="2">' + rowData.INNER_DUE_DT + '</td>\n' +
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td>' + rowData.ORIGINAL_SIDE_QTY + '</td>\n' +
                    '                        <td>' + rowData.OTHER_SIDE_QTY + '</td>\n' +
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td class="header">도면번호</td>\n' +
                    '                        <td colspan="3">' + rowData.DRAWING_NUM + '</td>\n' +
                    '                        <td class="header">재질</td>\n' +
                    '                        <td colspan="2">AL</td>\n' +
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td class="header">규격</td>\n' +
                    '                        <td colspan="3">' + rowData.SIZE_TXT + '</td>\n' +
                    '                        <td class="header">표면처리</td>\n' +
                    '                        <td colspan="2"> + rowData.SURFACE_TREAT + </td>\n' + //TODO:
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td class="header">형태/기타</td>\n' +
                    '                        <td>' + rowData.WORK_TYPE + '</td>\n' + //TODO: WORK_TYPE_NM
                    '                        <td>긴급</td>\n' + //TODO: 긴급
                    '                        <td>열처리</td>\n' + //TODO: 열처리
                    '                        <td class="header">검사</td>\n' +
                    '                        <td colspan="2">' + rowData.MAIN_INSPECTION + '</td>\n' + //TODO: MAIN_INSCPETCTION
                    '                    </tr>\n' +
                    '                    <tr>\n' +
                    '                        <td colspan="4">바코드 llliillilllilli</td>\n' +
                    '                        <td colspan="3">진성정밀</td>\n' +
                    '                    </tr>\n' +
                    '                </tbody>\n' +
                    '            </table>\n' +
                    '        </div>';
            }
            let drawingPrintModalConfirm = function (callback) {
                $("#commonConfirmBodyHtml").html(selectedRowCount + " 건의 바코드가 출력 됩니다.");
                commonConfirmPopup.show();
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    $(this).startWaitMe();
                    $(".cadDrawingPrint").html(printHtml).trigger('create');
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            drawingPrintModalConfirm(function (confirm) {
                if (confirm) {
                    setTimeout(function () {
                        $(this).stopWaitMe();
                        $(".cadDrawingPrint").css("display", "");
                        callWindowModalDrawingPopup();
                    }, 2000);
                }
            });
        });
        // 라벨출력
        $('#LABEL_PRINT').on('click', function () {
            alert('개발중입니다.');
        });
        /** 도면 등록 팝업 호출 **/
        $('#DRAWING_REGISTRATION').on('click', function () {
            setEstiMatePopup('control', 'orderMapper.manageControlCadFiles');
        });
        /** 도면 차수 및 변경 처리 **/
        $('#DRAWING_CHANGE').on('click', function () {
            setEstiMatePopup('controlRev', 'orderMapper.manageControlCadRevFiles');
        });
        /** 도면 보기 팝업 호출 */
        $('#DRAWING_VIEW').on('click', function () {
            callWindowImageViewer(999);
        });
        // 도면출력
        $('#DRAWING_PRINT').on('click', function () {
            let printHtml  = "";
            let selectedRowCount = selectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                if(!rowData.IMG_GFILE_SEQ){
                    alert("이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.");
                    return;
                }
                printHtml += '<div class="print">' +
                    '   <table class="drawingArea" style="table-layout: fixed; word-wrap:break-word;">' +
                    '        <tbody>' +
                    '           <tr class="imageInfo">' +
                    '               <td scope="col" colspan="14"><img src="/image/'+rowData.IMG_GFILE_SEQ+'" class="drawingImage"></td>' +
                    '           </tr>' +
                    '        </tbody>' +
                    '    </table>' +
                    '</div>';
            }
            let drawingPrintModalConfirm = function(callback){
                let text = '<h4>' +
                    '           <img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '               <span>' + selectedRowCount + ' 건의 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '       </h4>';
                $("#commonConfirmBodyHtml").html(text);
                commonConfirmPopup.show();
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    $(this).startWaitMe();
                    $(".cadDrawingPrint").html(printHtml).trigger('create');
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function(e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            drawingPrintModalConfirm(function(confirm){
                if(confirm){
                    setTimeout(function() {
                        $(this).stopWaitMe();
                        $(".cadDrawingPrint").css("display","");
                        callWindowModalDrawingPopup();
                    }, 2000);
                }
            });
        });

        $('#SUPPLY_UNIT_COST_APPLY').on('change', function () {
            if (noSelectedRowAlert()) return false;

            let number = $('#SUPPLY_UNIT_COST_APPLY option:selected').val();
            let rate = 100 - number;

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                let supplyUnitPrice = ((rowData.UNIT_FINAL_AMT * rowData.ORDER_QTY) * (rate / 100)).toFixed(0) || null;

                $orderManagementGrid.pqGrid('updateRow', {'rowIndx': selectedRowIndex[i], row: {'UNIT_FINAL_AMT': supplyUnitPrice}});

                /*if (rowData.CONTROL_STATUS_ORIGINAL !== 'ORD001') {
                    alert('주문 상태가 확정일 때 월 마감이 가능합니다.');
                    return false;
                }*/

            }
        });
        /* event */

        /* init */
        // changeDate();
        $('#CONTROL_MANAGE_START_DATE').datepicker();
        $('#CONTROL_MANAGE_END_DATE').datepicker();
        $('#CONTROL_MANAGE_START_DATE').datepicker('setDate', 'today');
        $('#CONTROL_MANAGE_END_DATE').datepicker('setDate', 'today');
        // setDatePickerToday();
        fnCommCodeDatasourceSelectBoxCreate($('#CONTROL_MANAGE_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CONTROL_MANAGE_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        $orderManagementGrid = $('#' + gridId).pqGrid(obj);
        /* init */

        $('#MONTH_FINISH_YES').on('click', function () {

        });

        $('#CONTROL_CLOSE_YES').on('click', function () {
            let selectedRowCount = selectedRowIndex.length;
            let list = [];
            let controlSeqList = [];
            let controlSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                rowData.CLOSE_VER = $('#CLOSE_VER').val();
                rowData.CLOSE_MONTH = $('#CONTROL_CLOSE_YEAR').val() + $('#CONTROL_CLOSE_MONTH').val();
                list.push(rowData);
            }
            // rightGrid
            let parameters = {'url': '/createMonthFinishClose', 'data': {data: JSON.stringify(list)}};
            fnPostAjax(function (data, callFunctionParam) {
                $orderManagementGrid.pqGrid('refreshDataAndView');
                // $controlCloseLeftGrid.pqGrid('refreshDataAndView');
                // $controlCloseRightGrid.pqGrid('refreshDataAndView');
                $('#CONTROL_CLOSE_POPUP').modal('hide');
            }, parameters, '');
        });

        $('.CONTROL_CLOSE_NO').on('click', function () {
            $('#CONTROL_CLOSE_POPUP').modal('hide');
        });

        $('.pop_close').on('click', function () {
            $(this).parent('.layerPopup').parent('.popup_container').modal('hide');
        });

        /* 견적등록 */
        /** 공통 코드 이외의 처리 부분 **/

        let estimateRegisterSelectedRowIndex;

        let estimateRegisterTopGrid = $("#control_estimate_register_top_grid");
        let estimateRegisterBotGrid = $("#control_estimate_register_bot_grid");
        let $btnEstimateRegisterDrawView = $("#controlBtnEstimateRegisterDrawView");
        let $btnEstimateRegisterDrawAdd = $("#controlBtnEstimateRegisterDrawAdd");

        let estimateRegisterTopColModel= [
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM', width: 150 } ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', width: 80 } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', width: 170 } ,
            /*{title: '', dataType: 'string', dataIndx: 'DRAWING_YN', width: 30 } ,*/
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', validations: [{ type: 'minLen', value: 1, msg: "Required"}], width: 100 } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', width: 50 } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 100 } ,
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1033');
                        let index = workType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : workType[index].text;
                    }
                }
            },
            /*{title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM' ,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_TYPE_NM", id: "MATERIAL_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1035'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },*/
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1027');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1029');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', width: 80,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1039'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1039');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }

            },
            {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE' },
            {title: '소재마감', align: "center", colModel:[
                    {title: 'TM각비', dataType: 'string', dataIndx: 'MATERIAL_FINISH_TM', width: 70 },
                    {title: '연마비', dataType: 'string', dataIndx: 'MATERIAL_FINISH_GRIND', width: 70 },
                    {title: '열처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', width: 70 },
                ]},
            {title: '상세 가공요건', align: "center", colModel:[
                    {title:'선반', dataType: 'string', dataIndx: 'DETAIL_LATHE'},
                    {title:'가공', dataType: 'string', dataIndx: 'DETAIL_SURFACE'},
                    {title:'클램', dataType: 'string', dataIndx: 'DETAIL_CLAMPING'},
                    {title:'포켓', dataType: 'string', dataIndx: 'DETAIL_POCKET'},
                    {title:'드릴', dataType: 'string', dataIndx: 'DETAIL_DRILL'},
                    {title:'난도', dataType: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
                ], hidden: true},
            {title: '소재사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_SUPPLY_YN", id: "MATERIAL_SUPPLY_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1042'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let yesOrNo = fnGetCommCodeGridSelectBox('1042');
                        let index = yesOrNo.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = yesOrNo.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }

                        return (index < 0) ? cellData : yesOrNo[index].text;
                    }
                }
            },
            {title: '예상소재 Size', align: "center", colModel:[
                    {title:'가로', dataType: 'float', dataIndx: 'SIZE_W_M'},
                    {title:'세로', dataType: 'float', dataIndx: 'SIZE_H_M'},
                    {title:'두께', dataType: 'float', dataIndx: 'SIZE_T_M'},
                    {title:'지름', dataType: 'float', dataIndx: 'SIZE_D_M'},
                    {title:'길이', dataType: 'float', dataIndx: 'SIZE_L_M'}
                ], hidden: true},
            {title: '항목별 견적정보', align: "center", colModel: [
                    {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AMT', format: '#,###'},
                    {title: 'TM각비', datatype: 'string', dataIndx: 'UNIT_TM_AMT', format: '#,###'},
                    {title: '연마비', datatype: 'string', dataIndx: 'UNIT_GRIND_AMT', format: '#,###'},
                    {title: '열처리', datatype: 'string', dataIndx: 'UNIT_HEAT_AMT', format: '#,###'},
                    {title: '표면처리', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AMT', format: '#,###'},
                    {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AMT', format: '#,###'},
                    {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_AMT', format: '#,###'},
                    {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE'}
                ]},
            {title: '계산견적단가', dataType: 'float', dataIndx: 'CALCUL_EST_UNIT_COST', format: '#,###', width: 80},
            {title: '최종견적가', dataType: 'float', dataIndx: 'UNIT_FINAL_EST_AMT', format: '#,###', width: 80},
            {title: '금액 계', dataType: 'float', dataIndx: 'DTL_AMOUNT', format: '#,###', width: 80},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            }
        ];

        let estimateRegisterBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'RECEIVER_NM', minWidth: "30%"},
            {title: '메일주소', dataType: 'string', dataIndx: 'RECEIVER_EMAIL', minWidth: "30%"},
            {title: '전화번호', dataType: 'string', dataIndx: 'RECEIVER_TEL', minWidth: "30%"},
            {title: '', dataType: 'string', dataIndx: 'SEQ', editable: false, width: 30 ,
                render: function (ui) {
                    return '<button id="receiverRemove" class="ui-icon ui-icon-close" style="cursor: pointer"></button>'
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowIndex = ui.rowIndx;
                    $cell.find('#receiverRemove').on('click', function (event) {
                        let parameter = {
                            'queryId': 'deleteEstimateEachReceiver',
                            'SEQ': ui.rowData.SEQ
                        };
                        let parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjax(function(data, callFunctionParam){
                            estimateRegisterBotGrid.pqGrid('deleteRow', { rowIndx: rowIndex });
                        }, parameters, '');
                    });
                }
            }
            //{title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden: true }
        ];



        function selectEstimateBotList(COMP_CD) {
            if(estimateRegisterBotGrid.hasClass('pq-grid')){
                estimateRegisterBotGrid.pqGrid('destroy');
            }
            estimateRegisterBotGrid.pqGrid({
                height: 100,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateStaffEmailList', 'COMP_CD': COMP_CD},
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                postRenderInterval: -1,
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                //selectionModel: { type: 'row', mode: 'single'} ,
                collapsible: false,
                swipeModel: {on: false},
                trackModel: {on: true},
                resizable: false,
                colModel: estimateRegisterBotColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData,
                complete: function (event, ui) {
                    this.flex();
                    let data = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data');

                    $('#control_estimate_register_bot_grid_records').html(data.length);
                },
            });

            estimateRegisterBotGrid.pqGrid("refreshDataAndView");
        };


        $("#control_estimate_register_info_form #ORDER_COMP_CD").on('change', function(){
            let compCd = $(this).val();

            fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList', 'COMP_CD': compCd }});
            selectEstimateBotList(compCd);
        });

        function estimateRegisterSaveCallBack(response, callMethodParam){
            estimateRegisterReloadPageData();
        };

        function estimateRegisterReloadPageData(){
            let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
            let postData = { 'queryId': 'estimate.selectEstimateMasterList', 'EST_SEQ': EST_SEQ };

            let parameter = {'url': '/json-list', 'data': postData};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                $("#control_estimate_register_info_form #ORDER_COMP_CD").val(list.ORDER_COMP_CD);
                $("#control_estimate_register_info_form #EST_TITLE").val(list.EST_TITLE);
                $("#control_estimate_register_info_form #ORDER_STAFF_SEQ").val(list.ORDER_STAFF_SEQ);
                $("#control_estimate_register_info_form #COMP_CD").val(list.COMP_CD);
                $("#control_estimate_register_info_form #EST_USER_ID").val(list.EST_USER_ID);
                $("#control_estimate_register_info_form #EST_NUM").val(list.EST_NUM + ' (' + list.EST_VER + ')');
                $("#control_estimate_register_info_form #DTL_CNT").val(list.DTL_CNT);
                $("#control_estimate_register_info_form #DTL_AMOUNT").val(list.DTL_AMOUNT);
                $("#control_estimate_register_info_form #INSERT_DT").val(list.INSERT_DT);
                $("#control_estimate_register_info_form #SEND_DT").val(list.SEND_DT);
                //$("#CONTROL_ESTIMATE_EMAIL_CONTENT_TXT").val(list.EMAIL_CONTENT);
                CKEDITOR.instances.CONTROL_ESTIMATE_EMAIL_CONTENT_TXT.setData(list.EMAIL_CONTENT);
                $("#control_estimate_register_info_form #EST_SEQ").val(EST_SEQ);

                $("#estimate_register_excel_download #EST_SEQ").val(EST_SEQ);

                postData = { 'queryId': 'estimate.selectEstimateDetailList', 'EST_SEQ': EST_SEQ };
                fnRequestGidData(estimateRegisterTopGrid, postData);

                postData = { 'queryId': 'estimate.selectEstimateReceiverList', 'EST_SEQ': EST_SEQ };
                fnRequestGidData(estimateRegisterBotGrid, postData);
            }, parameter, '');
        };

        function getCadUploadBlankHtml(){
            return'<tr><td colspan="3" class="spanArea" >마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
        }

        let fileHtml = getCadUploadBlankHtml();
        $('#attachDragAndDrop > tbody').html('');
        $('#attachDragAndDrop > tbody').append(fileHtml).trigger('create');

        $(document).on('click', '#test', function(){
            estimateRegisterReloadPageData();
        });

        function fnEstimateRegisterSave() {
            $("#control_estimate_register_info_form #queryId").val('selectEstimateNextSequence');

            let parameters = {'url': '/json-list', 'data': $("#control_estimate_register_info_form").serialize()};
            let EST_SEQ = $("#control_estimate_register_info_form #EST_SEQ").val();
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                if (EST_SEQ == '' || EST_SEQ == null) {
                    EST_SEQ = list.EST_SEQ;
                }

                $("#control_estimate_register_info_form #queryId").val('insertEstimateMaster');
                $("#control_estimate_register_info_form #EST_SEQ").val(EST_SEQ);


                let detail_data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
                //let mail_data = $("#CONTROL_ESTIMATE_EMAIL_CONTENT_TXT").val();
                let mail_data = CKEDITOR.instances.CONTROL_ESTIMATE_EMAIL_CONTENT_TXT.getData();
                let receiver_data = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data');
                $("#control_estimate_register_info_form #ESTIMATE_DETAIL_DATA").val(JSON.stringify(detail_data));
                $("#control_estimate_register_info_form #ESTIMATE_RECEIVER_DATA").val(JSON.stringify(receiver_data));
                $("#control_estimate_register_info_form #EMAIL_CONTENT").val(mail_data);

                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);


                parameters = {
                    'url': '/registerEstimateSave',
                    'data': $("#control_estimate_register_info_form").serialize()
                };
                fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

            }, parameters, '');
        }

        /** 버튼 처리 **/
        $("#btn_estimate_register_submit").on("click", function(){
            fnEstimateRegisterSave();

            //Confirm Box
            let headHtml = "messsage", bodyHtml ="", yseBtn="예", noBtn="아니오";

            let autoEmailYn = $("#estimateRegisterAutoEmailSend").is(":checked");
            if(autoEmailYn){
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>메일을 송신합니다. 계속 진행하시겠습니까?</span>' +
                    '</h4>';
            }else{
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>메일 송신 없이 완료처리만 진행합니다.\n 진행하시겠습니까?</span>' +
                    '</h4>';
            }

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let estimateRegisterSubmitConfirm = function(callback) {
                commonConfirmPopup.show();
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            estimateRegisterSubmitConfirm(function(confirm){
                if(confirm) {
                    $("#control_estimate_register_info_form #queryId").val('estimate.updateEstimateMasterFinish');
                    let parameters = {
                        'url': '/json-update',
                        'data': $("#control_estimate_register_info_form").serialize()
                    };
                    fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

                    if (autoEmailYn) {
                        $("#control_estimate_register_info_form #queryId").val('mail.insertEstimateSubmitMail');
                        let parameters = {
                            'url': '/json-update',
                            'data': $("#control_estimate_register_info_form").serialize()
                        };
                        fnPostAjax(estimateRegisterSaveCallBack, parameters, '');
                    }
                }
            });
        });

        $("#btn_estimate_register_save").on("click", function(){
            fnEstimateRegisterSave();
        });

        $("#btnEstimateRegisterAdd").on('click', function(){
            estimateRegisterTopGrid.pqGrid('addNodes', [{}], 0);
        });

        $("#btnEstimateRegisterDelete").on('click', function(){
            let USER_MASTER_QUERY_ID = 'deleteEstimateDetail';

            fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
        });

        $("#btnEstimateRegisterEstimateListExcel").on('click', function(){
            fnReportFormToHiddenFormPageAction("estimate_register_excel_download", "/downloadExcel");
        });

        $("#chkEstimateRegisterDetail").on('click', function(){

        });

        $("#selEstimateRegisterCalculateApply").on('click', function(){

        });

        $("#selEstimateListExcel").on('click', function(){

        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawAdd.click(function () {
            setEstiMatePopup('estimate', 'estimate.manageEstimateCadFiles');
        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawView.click(function () {
            callWindowImageViewer(999);
        });

        /* CKEDITOR 부분 */
        CKEDITOR.replace( 'CONTROL_ESTIMATE_EMAIL_CONTENT_TXT', { height: 176 });
        /* 견적등록 */
        $('#ESTIMATE_REGISTER_POPUP').on({
            'show.bs.modal': function () {
                fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
                // fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
                fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#EST_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
                fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList'}});

                estimateRegisterTopGrid.pqGrid({
                    height: 180,
                    dataModel: {
                        location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                        url: "/paramQueryGridSelect",
                        postData: fnFormToJsonArrayData('#estimate_register_hidden_form'),
                        getData: function (dataJSON) {
                            let data = dataJSON.data;
                            return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                        }
                    },
                    postRenderInterval: -1, //call postRender synchronously.
                    scrollModel: { autoFit: false },
                    columnTemplate: {align: 'center', hvalign: 'center'},
                    numberCell: {width: 30, title: "No", show: true },
                    //selectionModel: { type: 'row', mode: 'single'} ,
                    swipeModel: {on: false},
                    collapsible: false,
                    trackModel: {on: true},
                    resizable: true,
                    colModel: estimateRegisterTopColModel,
                    showTitle: false,
                    title: false,
                    strNoRows: g_noData,
                    complete: function (event, ui) {
                        this.flex();
                        let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');

                        $('#control_estimate_register_top_grid_records').html(data.length);
                    },
                    selectChange: function (event, ui) {
                        if (ui.selection.iCells.ranges[0] !== undefined) {
                            estimateRegisterSelectedRowIndex = [];
                            let estimateRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                            let estimateRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;

                            if (estimateRegisterGridFirstRow === estimateRegisterGridLastRow) {
                                estimateRegisterSelectedRowIndex[0] = estimateRegisterGridFirstRow;
                            } else {
                                for (let i = estimateRegisterGridFirstRow; i <= estimateRegisterGridLastRow; i++) {
                                    estimateRegisterSelectedRowIndex.push(i);
                                }
                            }
                        }
                    },
                    change: function( event, ui ) {
                        if (ui.source === 'paste') {
                            const addListLength = ui.addList.length;
                            const workTypeList = fnGetCommCodeGridSelectBox('1033');
                            const materialDetailList = fnGetCommCodeGridSelectBox('1027');
                            const materialKindList = fnGetCommCodeGridSelectBox('1029');
                            const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                            let rowListConvert = [];

                            for (let i = 0; i < addListLength; i++) {
                                const newRowData = ui.addList[i].newRow;
                                const rowIndx = ui.addList[i].rowIndx;
                                let workType = null;
                                let materialDetail = null;
                                let materialKind = null;
                                let surfaceTreat = null;

                                // 작업형태
                                if (newRowData.WORK_TYPE !== undefined) {
                                    let index = workTypeList.findIndex(function (element) {
                                        return element.text === newRowData.WORK_TYPE;
                                    });

                                    if (index >= 0) workType = workTypeList[index].value;
                                }
                                //소재 상세
                                if (newRowData.MATERIAL_DETAIL !== undefined) {
                                    let index = materialDetailList.findIndex(function (element) {
                                        return element.text === newRowData.MATERIAL_DETAIL;
                                    });

                                    if (index >= 0) materialDetail = materialDetailList[index].value;
                                }
                                // 소재형태
                                if (newRowData.MATERIAL_KIND !== undefined) {
                                    let index = materialKindList.findIndex(function (element) {
                                        return element.text === newRowData.MATERIAL_KIND;
                                    });

                                    if (index >= 0) materialKind = materialKindList[index].value;
                                }
                                // 표면처리
                                if (newRowData.SURFACE_TREAT !== undefined) {
                                    let index = surfaceTreatList.findIndex(function (element) {
                                        return element.text === newRowData.SURFACE_TREAT;
                                    });

                                    if (index >= 0) surfaceTreat = surfaceTreatList[index].value;
                                }

                                let tempObject = {
                                    rowIndx: rowIndx,
                                    newRow: {
                                        'WORK_TYPE': workType,
                                        'MATERIAL_DETAIL': materialDetail,
                                        'MATERIAL_KIND': materialKind,
                                        'SURFACE_TREAT': surfaceTreat
                                    }
                                };
                                rowListConvert.push(tempObject);
                            }
                            estimateRegisterTopGrid.pqGrid('updateRow', {rowList: rowListConvert});
                        }

                        if(ui.source == 'edit'){
                            let rowIndx = ui.updateList[0].rowIndx;
                            let calculateEstimateAmt = 0;
                            let data = ui.updateList[0].rowData;
                            let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == null || data.UNIT_MATERIAL_AMT == '' ? 0 : parseFloat(data.UNIT_MATERIAL_AMT);
                            let UNIT_TM_AMT = data.UNIT_TM_AMT == null || data.UNIT_TM_AMT == '' ? 0 : parseFloat(data.UNIT_TM_AMT);
                            let UNIT_GRIND_AMT = data.UNIT_GRIND_AMT == null || data.UNIT_GRIND_AMT == '' ? 0 : parseFloat(data.UNIT_GRIND_AMT);
                            let UNIT_HEAT_AMT = data.UNIT_HEAT_AMT == null || data.UNIT_HEAT_AMT == '' ? 0 : parseFloat(data.UNIT_HEAT_AMT);
                            let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == null || data.UNIT_SURFACE_AMT == '' ? 0 : parseFloat(data.UNIT_SURFACE_AMT);
                            let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == null || data.UNIT_PROCESS_AMT == '' ? 0 : parseFloat(data.UNIT_PROCESS_AMT);
                            let UNIT_ETC_AMT = data.UNIT_ETC_AMT == null || data.UNIT_ETC_AMT == '' ? 0 : parseFloat(data.UNIT_ETC_AMT);
                            let ITEM_QTY = data.ITEM_QTY == null || data.ITEM_QTY == '' ? 0 : parseFloat(data.ITEM_QTY);

                            calculateEstimateAmt += UNIT_MATERIAL_AMT;
                            calculateEstimateAmt += UNIT_TM_AMT;
                            calculateEstimateAmt += UNIT_GRIND_AMT;
                            calculateEstimateAmt += UNIT_HEAT_AMT;
                            calculateEstimateAmt += UNIT_SURFACE_AMT;
                            calculateEstimateAmt += UNIT_PROCESS_AMT;
                            calculateEstimateAmt += UNIT_ETC_AMT;

                            estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'CALCUL_EST_UNIT_COST': calculateEstimateAmt } });

                            let UNIT_FINAL_EST_AMT = ui.updateList[0].newRow.UNIT_FINAL_EST_AMT
                            if(UNIT_FINAL_EST_AMT != undefined){
                                calculateEstimateAmt = UNIT_FINAL_EST_AMT;
                            }
                            estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'UNIT_FINAL_EST_AMT': calculateEstimateAmt } });

                            calculateEstimateAmt *= ITEM_QTY;
                            estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'DTL_AMOUNT': calculateEstimateAmt } });
                        }
                    },
                    cellSave: function (evt, ui) {
                        if (ui.oldVal === undefined && ui.newVal === null) {
                            estimateRegisterTopGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                        }
                    }
                });
                selectEstimateBotList('');
            },
            'hide.bs.modal': function () {
                estimateRegisterTopGrid.pqGrid('destroy');
            }
        });
    });
</script>
