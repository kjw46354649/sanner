<%--
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
                <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#CONTROL_MANGE_POPUP">신규 주문 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_REGISTRATION">도면 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_REGISTER_FROM_CONTROL">견적등록</button>
                <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_LIST_PRINT">견적List출력</button>
                <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#TRANSACTION_STATEMENT_POPUP">거래명세표</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CONFIRMATION" data-control_status="ORD001" data-control_status_nm="확정" style="color: blue;">확정</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CANCEL" data-control_status="ORD002" data-control_status_nm="취소" style="color: red;">취소</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="TERMINATION" data-control_status="ORD004" data-control_status_nm="종료">종료</button>
                <button type="button" class="defaultBtn btn-50w" data-toggle="modal" data-target="#CONTROL_CLOSE_POPUP">마감</button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_DRAWING_VIEW">도면 View</button>
                    <button type="button" class="defaultBtn btn-100w" id="DRAWING_PRINT">도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="BARCODE_PRINT">바코드 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="LABEL_PRINT">라벨 출력</button>
                </div>
            </div>
            <div class="mg-top10">
                <button type=" button" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_ALL">전체모드</button>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_EASY">간편모드</button>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_ESTIMATE">견적관련</button>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_VIEW_CLOSE">마감관련</button>
                <div class="rightSpan">
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
                    <button type="button" class="defaultBtn btn-100w red" id="CONTROL_MANAGE_DELETE">삭제</button>
                    <button type="button" class="defaultBtn btn-100w green" id="CONTROL_MANAGE_SAVE">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
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
        <button type="button" class="pop_close" name="CONTROL_MANGE_CLOSE">닫기</button>
        <div>
            <div id="ORDER_REGISTER_GRID"></div>
        </div>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" name="CONTROL_MANGE_CLOSE">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="CONTROL_CLOSE_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3>월 마감 진행</h3>
        <hr>
        <button type="button" class="pop_close" name="CONTROL_CLOSE_NO">닫기</button>
        <div class="buttonWrap">
            <form class="form-inline" id="CONTROL_CLOSE_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId">
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                <input type="hidden" name="COMP_CD" id="COMP_CD">
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
                <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
            </div>
            <div style="width: 450px; float:left;">
                <div id="CONTROL_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>

        <div class="text-center">
            <button type="button" class="defaultBtn greenPopGra" id="CONTROL_CLOSE_YES">저장</button>
            <button type="button" class="defaultBtn grayPopGra" name="CONTROL_CLOSE_NO">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="TRANSACTION_STATEMENT_POPUP" style="display: none;">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">거래 명세표</h3>
        <button type="button" class="pop_close">닫기</button>
        <hr>
        <form name="TRANSACTION_STATEMENT_FORM" id="TRANSACTION_STATEMENT_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlTransactionStatementList">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
            <input type="hidden" name="CONTROL_SEQ_STR" id="CONTROL_SEQ_STR">
            <input type="hidden" name="INVOICE_NUM" id="INVOICE_NUM_INPUT">
            <!-- 기본 정보 -->
            <div style="margin-bottom: 10px;">
                <div style="overflow: auto;">
                    <h5 class="d-inline-block">기본정보</h5>
                    <div class="d-inline-block right_float buttonWrap" style="overflow: hidden;">
                        <div>
                            <button class="popupBtn" id="TRANSACTION_STATEMENT_LABEL_PRINT">라벨 출력</button>
                            <button class="popupBtn red" id="TRANSACTION_STATEMENT_DELETE">삭제</button>
                            <button class="popupBtn green" id="TRANSACTION_STATEMENT_SAVE">저장</button>
                            <button class="popupBtn blue" id="TRANSACTION_STATEMENT_EXPORT">엑셀 출력</button>
                        </div>
                    </div>
                </div>
                <!-- 버튼 -->

                <table class="tableL">
                    <tbody>
                    <tr>
                        <td class="headerDisable">발주사</td>
                        <td id="ORDER_COMP_NM"></td>
                        <td class="headerDisable">공급사</td>
                        <td id="COMP_NM"></td>
                    </tr>
                    <tr>
                        <td class="headerSelectChange">구매 담당자</td>
                        <td><select name="ORDER_STAFF_SEQ" id="ORDER_STAFF_SEQ" style="width: 100%; border: 0; text-align: center;">
                            <option></option>
                        </select></td>
                        <td class="headerDisable">금액 합계</td>
                        <td name="TOTAL_AMT" id="TOTAL_AMT"></td>
                    </tr>
                    <tr>
                        <td class="headerDisable">INV No.</td>
                        <td ID="INVOICE_NUM"></td>
                        <td class="headerInputChange">제목</td>
                        <td><input type="text" name="INVOICE_TITLE" id="INVOICE_TITLE" style="width: 100%; border: 0; text-align: center;" autocomplete="off"></td>
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
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" id="TRANSACTION_STATEMENT_POPUP_CLOSE_BUTTON">닫기</button>
        </div>
    </div>
</div>

<form id="transaction_statement_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectTransactionStatementInfoExcel:selectTransactionStatementListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="info:data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ_STR:COMP_CD:ORDER_COMP_CD:INVOICE_NUM"/>
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
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', dataType: 'integer',dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},

            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_ORIGINAL', hidden: true},
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '', minWidth:15, width:20, dataType: 'integer', dataIndx: 'CONTROL_VER'},
                    {title: '변경일시', width: 95, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '단가확인', width: 70, dataType: 'string', dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'CONTROL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: 'INV No.<br>(거래명세No.)', width: 100, dataType: 'string', dataIndx: 'INVOICE_NUM'},
            {title: '프로젝트', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '모듈', width: 70, dataType: 'string', dataIndx: 'MODULE_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '납품처', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '비고(라벨)', width: 100, dataType: 'string', dataIndx: 'LABEL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '주요<br>검사품', dataType: 'string', dataIndx: 'MAIN_INSPECTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {title: '긴<br>급', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '관리번호', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {
                title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true,
                render: function (ui) {
                    if (ui.rowData.WORK_TYPE === 'WTP020' && ui.rowData.LAG_WORK_TYPE === undefined) {
                        return '<span class="ui-icon ui-icon-circle-plus" name="PART_NUM_PLUS_BUTTON"></span>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=PART_NUM_PLUS_BUTTON]').on('click', function (event) {
                        let rowData = fnCloneObj(ui.rowData);
                        let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                        let newPartNum = 1, lastRowIndex = 0, totalRecords = data.length, newRowData;

                        for (let i = 0; i < totalRecords; i++) {
                            if (data[i].CONTROL_SEQ === rowData.CONTROL_SEQ) {
                                Number(data[i].PART_NUM) > 0 ? newPartNum++ : newPartNum;
                                lastRowIndex = data[i].pq_ri;
                            }
                        }

                        newRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: lastRowIndex});
                        newRowData = fnCloneObj(newRowData);
                        newRowData.ROW_NUM = totalRecords + 1;
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
            {title: '도면번호', width: 150, dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '품명', width: 150, dataType: 'string', dataIndx: 'ITEM_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '규격', width: 110, dataType: 'string', dataIndx: 'SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')},
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
            {title: '외<br>주', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'OUTSIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1014')},
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
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027')},
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
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
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
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: 'Part<br>단위<br>수량', align: 'right', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true},
            {title: '주문<br>수량', align: 'right', dataType: 'integer', dataIndx: 'CONTROL_ORDER_QTY'},
            {
                title: '대칭', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
                ]
            },
            {
                title: '발주정보', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
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

                                newRowData.ROW_NUM = totalRecords + 1;
                                $orderManagementGrid.pqGrid('addRow', {
                                    newRow: newRowData,
                                    rowIndx: ui.rowIndx + 1,
                                    checkEditable: false
                                });
                                event.preventDefault();
                            });
                        }
                    },
                    {title: '발주번호', width: 90, datatype: 'string', dataIndx: 'ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '납기', width: 70, datatype: 'string', dataIndx: 'ORDER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '출고', datatype: 'string', dataIndx: 'OUT_QTY'},
                    {title: '출고일자', datatype: 'string', dataIndx: 'ORDER_OUT_FINISH_DT'},
                    {title: '납품확인', width: 70, datatype: 'string', dataIndx: 'DELIVERY_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                ]
            },
            {
                title: '상세가공요건', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {title: '선반', datatype: 'string', dataIndx: 'DETAIL_LATHE', },
                    {title: '가공면', datatype: 'string', dataIndx: 'DETAIL_SURFACE'},
                    {title: '클램핑', datatype: 'string', dataIndx: 'DETAIL_CLAMPING'},
                    {title: '포켓', datatype: 'string', dataIndx: 'DETAIL_POCKET'},
                    {title: '드릴', datatype: 'string', dataIndx: 'DETAIL_DRILL'},
                    {title: '난도', datatype: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
                ]
            },
            {
                title: '소재마감', align: 'center',  styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {
                        title: 'TM각비', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_TM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010')},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '') {
                                return '';
                            } else {
                                let workFactory = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010');
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
                        title: '연마비', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_GRIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020')},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '') {
                                return '';
                            } else {
                                let workFactory = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
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
                        title: '열처리', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030')},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '') {
                                return '';
                            } else {
                                let workFactory = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
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
                ]
            },
            {
                title: '예상소재 Size', align: 'center', hidden: false, colModel: [
                    {title: '@', datatype: 'string', dataIndx: 'RKFH'},
                    {title: '가로', datatype: 'string', dataIndx: 'SIZE_W_M'},
                    {title: '세로', datatype: 'string', dataIndx: 'SIZE_H_M'},
                    {title: '높이', datatype: 'string', dataIndx: 'SIZE_T_M'},
                    {title: '중량<br>(KG)', datatype: 'string', dataIndx: 'SIZE_D_M'},
                    {title: '부피<br>(cm³)', datatype: 'string', dataIndx: 'SIZE_L_M'}
                ]
            },
            {
                title: '항목별 계산견적 단가 (10원단위 반올림)', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
                    {title: '소재비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: 'TM각비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_TM_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '연마비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_GRIND_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '열처리', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_HEAT_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '표면처리', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SURFACE_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '가공비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_PROCESS_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '기타추가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_ETC_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
                    {title: '견적비고', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT_NOTE',styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},  editable: true}
                ]
            },
            {title: '계산<br>견적단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CALCUL_EST_UNIT_COST',
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
            {title: '최종<br>견적단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '견적<br>합계금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'EST_TOTAL_AMOUNT'},
            {title: '최종<br>공급단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '합계금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMT'},
            {title: '종전가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'WHDWJSRK'},
            {title: '변경전<br>도면번호', width: 120, dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {
                title: '마감/취소 현황', align: 'center', colModel: [
                    {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
                    {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
                    {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER', hidden: true},
                    {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER_TRAN'},
                    {title: '작성자', datatype: 'string', dataIndx: 'CLOSE_USER_ID'},
                    {title: '일시', width: 120, datatype: 'string', dataIndx: 'CLOSE_DT'}
                ]
            },
            {
                title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
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
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
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
                    {title: '외주단가', align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_FINAL_AMT'},
                    {title: '요망납기', datatype: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고날짜', datatype: 'string', dataIndx: 'dhlwndlqrhskfWk'},
                    {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE'},
                    {title: '불량Code', datatype: 'string', dataIndx: 'dhlwnqnffidcode'},
                    {title: '조치방안', datatype: 'string', dataIndx: 'dhlwnwhclqkddks'}
                ]
            },
            {title: '등록/업데이트<br>일시', width: 120, dataType: 'string', dataIndx: 'STATUS_DT'},
            {title: 'CONTROL_BARCODE_NUM', dataType: 'string', dataIndx: 'CONTROL_BARCODE_NUM', hidden: true},
            {title: 'LABEL_BARCODE_NUM', dataType: 'string', dataIndx: 'LABEL_BARCODE_NUM', hidden: true},
            {title: 'DEL_YN', dataType: 'string', dataIndx: 'DEL_YN', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            height: 710,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData, recIndx: 'ROW_NUM',
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

                if(ui.rowData.IMG_GFILE_SEQ && (typeof(windowImageViewer) == 'undefined' || windowImageViewer.closed)) callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
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
                    let row;

                    // 항목별 계산견적 단가
                    const estimateArray = ['UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'ORDER_QTY', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT'];
                    let estimateFlag = false;
                    for (let value of estimateArray) {
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
                        let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || unitFinalEstimateAmount; // 최종 공급단가
                        let finalAmount = unitFinalAmount * ORDER_QTY;// 합계 금액

                       if (ui.updateList[0].newRow.UNIT_FINAL_AMT) {
                            row = {
                                // 'CALCUL_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
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
                title: '단가확인', width: 70, dataType: 'string', dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                        return (index < 0) ? cellData : priceConfirm[index].text;
                    }
                }
            },
            {
                title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD',  styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '구매<br>담당자', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '비고', width: 200, dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '프로젝트', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '모듈', width: 70, dataType: 'string', dataIndx: 'MODULE_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '납품처', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '비고(라벨)', width: 100, dataType: 'string', dataIndx: 'LABEL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '주요 검사품', dataType: 'string', dataIndx: 'MAIN_INSPECTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '긴<br>급', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {title: '관리번호', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '도면번호', width: 150, dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '품명',  width: 150, dataType: 'string', dataIndx: 'ITEM_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '외<br>주', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'OUTSIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '소재<br>사급', minWidth: 20, width: 25, dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                title: '표면<br>처리', width: 50, dataType: 'string', dataIndx: 'SURFACE_TREAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1039')},
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
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '대칭', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
                    {title: '원칭', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '대칭', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
                ]
            },
            {
                title: '발주정보', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {title: '발주번호', datatype: 'string', dataIndx: 'ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '납기', datatype: 'string', dataIndx: 'ORDER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
                    {title: '납품확인', datatype: 'string', dataIndx: 'DELIVERY_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}}
                ]
            },
            {title: '최종<br>견적단가', dataType: 'string', dataIndx: 'UNIT_FINAL_EST_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '최종<br>공급단가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '변경전<br>도면번호', dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
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
                                // $orderRegisterGrid.pqGrid('refreshDataAndView');
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
                                // $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                }
            ]
        };
        const popupObj = {
            height: 680,
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
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 21},
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
                        let orderStaffSeq = null;
                        let mainInspection = null;
                        let workType = null;
                        let workFactory = null;
                        let materialDetail = null;
                        let materialKind = null;
                        let surfaceTreat = null;

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
                        // 구매 담당자
                        if (newRowData.ORDER_STAFF_SEQ !== undefined) {
                            let index = COMPANY_STAFF.findIndex(function (element) {
                                return element.text === newRowData.ORDER_STAFF_SEQ;
                            });

                            if (index >= 0) orderStaffSeq = COMPANY_STAFF[index].value;
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
                                'ORDER_STAFF_SEQ': orderStaffSeq,
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
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, align: 'right', dataType: 'string', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, align: 'right', dataType: 'string', dataIndx: 'FINAL_NEGO_AMT'}
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
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
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
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '주문상태', dataType: 'string', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM'},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '단위', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '수량', align: 'right', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '공급단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '금액 계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '포장수량', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'PACKING_CNT', editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true},
            {title: 'LABEL_BARCODE_NUM', dataType: 'string', dataIndx: 'LABEL_BARCODE_NUM', hidden: true},
        ];
        const transactionStatementDetailObj = {
            height: 470,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: transactionStatementDetailColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
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
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let controlSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
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

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#CONTROL_CLOSE_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CONTROL_CLOSE_FORM > #COMP_CD').val(compCdList[0]);
            $('#CONTROL_CLOSE_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);

            if (open) {
                // 마지막 마감 차수 가져오기
                let postData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
                postData.queryId = 'orderMapper.selectControlCloseVer';
                let parameters = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    let closeVer = data.list.length > 0 ? data.list[0].MAX_CLOSE_VER : 1;
                    $('#CONTROL_CLOSE_FORM #CLOSE_VER').val(closeVer).prop('selected', true);
                }, parameters, '');

                let controlCloseLeftPostData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
                controlCloseLeftPostData.queryId = 'orderMapper.selectControlCloseLeftList';
                $controlCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                    return controlCloseLeftPostData;
                });
                $controlCloseLeftGrid.pqGrid('refreshDataAndView');
            }

            let controlCloseRightPostData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
            controlCloseRightPostData.queryId = 'orderMapper.selectControlCloseRightList';
            $controlCloseRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return controlCloseRightPostData;
            });
            $controlCloseRightGrid.pqGrid('refreshDataAndView');
        };

        // topWrap 확장 함수
        const topMenuOpen = function () {
            let rollSeq = '${authUserInfo.ROLE_SEQ}';
            let top = $('#view_tab_' + rollSeq + '0201 .gubunWrap');
            let bottom = $('#view_tab_' + rollSeq + '0201 .bottomWrap');
            let con = $('#view_tab_' + rollSeq + '0201 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '130px'}, 300, 'easeOutCubic');
            bottom.stop().animate({'height': '770px'}, 300, 'easeOutCubic');
            con.css({'height': '640px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        // topWrap 축소 함수
        const topMenuClose = function () {
            let rollSeq = '${authUserInfo.ROLE_SEQ}';
            let top = $('#view_tab_' + rollSeq + '0201 .gubunWrap');
            let bottom = $('#view_tab_' + rollSeq + '0201 .bottomWrap');
            let con = $('#view_tab_' + rollSeq + '0201 .bottomWrap .tableWrap .conWrap');

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
            // if (fnIsGridEditing($orderManagementGrid)) return false;
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

                let compCdList = [];
                let orderCompCdList = [];

                for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    compCdList.push(rowData.COMP_CD);
                    orderCompCdList.push(rowData.ORDER_COMP_CD);
                }

                // 중복제거
                compCdList = compCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                if (compCdList.length > 1) {
                    alert('선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                    return false;
                }
                if (orderCompCdList.length > 1) {
                    alert('선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                    return false;
                }

                fnAppendSelectboxYear('CONTROL_CLOSE_YEAR', 3);
                fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH');
                $('#CONTROL_CLOSE_MONTH').val(CURRENT_MONTH < 9 ? '0' + CURRENT_MONTH : CURRENT_MONTH).prop('selected', true);

                $('#CONTROL_CLOSE_POPUP #CLOSE_VER');

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

                // TODO: 필수데이터가 입력되어 있어야만 확정 가능
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

            //TODO: 외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능
            /* for (let i = 0; i < selectedRowCount; i++) {
                 let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                 if (rowData.OUTSIDE_YN === 'Y') {
                     alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                     return false;
                 }
             }*/

            getOrderStatusButton(event);
        });

        /**
         * @description 종료버튼 클릭
         */
        $('#TERMINATION').on('click', function (event) {
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

            //css 변경
            $(this).removeClass('virtual-disable').siblings().addClass('virtual-disable');
        });
        // 거래명세표
        $('#TRANSACTION_STATEMENT_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                let selectedRowCount = selectedRowIndex.length;
                let controlSeqList = [];
                let compCdList = [];
                let orderCompCdList = [];
                let invoiceNumList = [];
                let controlSeqStr = '';

                for (let i = 0; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

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
                postData.queryId = 'orderMapper.selectControlTransactionStatementInfo';
                let parameters = {'url': '/json-info', 'data': postData};

                fnPostAjaxAsync(function (data) {
                    let obj = data.info;

                    $('#TRANSACTION_STATEMENT_FORM #COMP_NM').text(obj.COMP_NM);
                    $('#TRANSACTION_STATEMENT_FORM #ORDER_COMP_NM').text(obj.ORDER_COMP_NM);
                    $('#TRANSACTION_STATEMENT_FORM #TOTAL_AMT').text(obj.TOTAL_AMT);
                    $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM').text(obj.INVOICE_NUM);
                    $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM_INPUT').val(obj.INVOICE_NUM);

                    $transactionStatementDetailGrid = $('#' + transactionStatementDetailGridId).pqGrid(transactionStatementDetailObj);

                    postData = fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM');
                    postData.queryId = 'orderMapper.selectControlTransactionStatementList';
                    parameters = {'url': '/json-list', 'data': postData};

                    fnPostAjax(function (data) {
                        $transactionStatementDetailGrid.pqGrid('option', 'dataModel.data', data.list);
                        $transactionStatementDetailGrid.pqGrid('refreshView');
                        controlSeqList = [];
                        controlSeqStr = '';
                        for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                            let obj = data.list[i];

                            controlSeqList.push(obj.CONTROL_SEQ);
                            controlSeqStr += controlSeqList[i];

                            if (i < controlSeqList.length - 1) {
                                controlSeqStr += ',';
                            }
                        }
                    }, parameters, '');
                }, parameters, '');

                /* 구매 담당자 */
                postData.queryId = 'dataSource.getCompanyStaffList';
                parameters = {'url': '/json-list', 'data': postData};

                fnPostAjax(function (data) {
                    $('#TRANSACTION_STATEMENT_FORM #ORDER_STAFF_SEQ').empty();

                    for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
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
        $('#TRANSACTION_STATEMENT_LABEL_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let formData = [];
            let data = $transactionStatementDetailGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, DATA_LENGTH = data.length; i < DATA_LENGTH; i++) {
                formData.push(data[i].LABEL_BARCODE_NUM);
            }

            fnBarcodePrint(function(data, callFunctionParam){
                alert(data.message);
            }, formData, '');
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
                alert("<spring:message code='com.alert.default.remove.success' />");
                $('#TRANSACTION_STATEMENT_POPUP').modal('hide');
                $orderManagementGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('#TRANSACTION_STATEMENT_EXPORT').on('click', function () {
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let invoiceNumList = [];
            let controlSeqStr = '';
            let data = $transactionStatementDetailGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                invoiceNumList.push(rowData.INVOICE_NUM);
            }

            invoiceNumList = invoiceNumList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (invoiceNumList[0] === undefined) {
                alert('저장 후 엑셀 출력해주세요.');
                return false;
            }

            for (let i = 0, DATA_LENGTH = data.length; i < DATA_LENGTH; i++) {
                controlSeqList.push(data[i].CONTROL_SEQ);
                compCdList.push(data[i].COMP_CD);
                orderCompCdList.push(data[i].ORDER_COMP_CD);
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

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#transaction_statement_excel_download #paramData').val(controlSeqStr + ':' + compCdList[0] + ':' + orderCompCdList[0] + ':' + invoiceNumList[0]);
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
                    '           <td scope="col" width="28%" rowspan="2" class="center_sort"><img src="/barcode/code128/' +rowData.CONTROL_BARCODE_NUM+ '" class="barcode"></td>' +
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
                    '            <td scope="col" class="center_sort">'+rowData.EMERGENCY_BARCODE_NM+'</td>' +
                    '            <td scope="col" class="center_sort">'+rowData.MAIN_INSPECTION_NM+'</td>' +
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
        // 바코드 출력
        $('#BARCODE_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let formData = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                formData.push(rowData.CONTROL_BARCODE_NUM);
            }

            fnBarcodePrint(function(data, callFunctionParam){
                alert(data.message);
            }, formData, '');
        });
        // 라벨 출력
        $('#LABEL_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let formData = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                formData.push(rowData.LABEL_BARCODE_NUM);
            }

            fnBarcodePrint(function(data, callFunctionParam){
                alert(data.message);
            }, formData, '');
        });
        /** 도면 등록 팝업 호출 **/
        $('#DRAWING_REGISTRATION').on('click', function () {
            callCadDrawingUploadPopup('control', 'orderMapper.manageControlCadFiles');
        });
        /** 도면 차수 및 변경 처리 **/
        $('#DRAWING_CHANGE').on('click', function () {
            callCadDrawingUploadPopup('controlRev', 'orderMapper.manageControlCadRevFiles');
        });
        /** 도면 보기 팝업 호출 */
        $('#CONTROL_MANAGE_DRAWING_VIEW').on('click', function () {
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
                let supplyUnitPrice = (rowData.UNIT_FINAL_AMT * (rate / 100)).toFixed(0) || null;
                let finalAmount = (supplyUnitPrice * rowData.ORDER_QTY) || null;

                $orderManagementGrid.pqGrid('updateRow', {'rowIndx': selectedRowIndex[i], row: {'UNIT_FINAL_AMT': supplyUnitPrice, 'FINAL_AMT': finalAmount}, checkEditable: false});
            }
        });

        $('[name=CONTROL_MANGE_CLOSE]').on('click', function () {
            $('#CONTROL_MANGE_POPUP').modal('hide');
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
            let firstRowData = $controlCloseRightGrid.pqGrid('getRowData', {rowIndx: 0});
            let postData = {
                'info-data': firstRowData,
                'list-data': list
            };

            // rightGrid
            let parameters = {'url': '/createMonthFinishClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $orderManagementGrid.pqGrid('refreshDataAndView');
                $('#CONTROL_CLOSE_POPUP').modal('hide');
            }, parameters, '');
        });

        $('[name=CONTROL_CLOSE_NO]').on('click', function () {
            $('#CONTROL_CLOSE_POPUP').modal('hide');
        });

        $('.pop_close').on('click', function () {
            $(this).parent('.layerPopup').parent('.popup_container').modal('hide');
        });

        $('#TRANSACTION_STATEMENT_POPUP_CLOSE_BUTTON').on('click', function () {
            $('#TRANSACTION_STATEMENT_POPUP').modal('hide');
        });

        $('#ESTIMATE_REGISTER_FROM_CONTROL').on('click', function (event) {
            if (noSelectedRowAlert()) {
                return false;
            }

            let list = [];
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let orderStaffSeqList = [];
            let controlSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                orderStaffSeqList.push(rowData.ORDER_STAFF_SEQ);
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
            orderStaffSeqList = orderStaffSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (controlSeqList.length === 0) {
                alert('에러!');
                return false;
            }
            // if (compCdList.length === 0 || compCdList[0] === undefined) {
            //     alert('공급사(사업자)가 없습니다!');
            //     return false;
            // }
            // if (orderCompCdList.length === 0 || orderCompCdList[0] === undefined) {
            //     alert('발주사가 없습니다!');
            //     return false;
            // }
            if (compCdList.length > 1) {
                alert('선택된 대상들의 사업자는 동일해야 합니다.');
                return false;
            }
            if (orderCompCdList.length > 1) {
                alert('선택된 대상들의 발주사는 동일해야 합니다.');
                return false;
            }
            if (orderStaffSeqList.length > 1) {
                alert('선택된 대상들의 구매 담당자는 동일해야 합니다.');
                return false;
            }

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#estimate_version_up_sequence_form > #hidden_control_seq').val(controlSeqStr);

            $("a[pid='10000102']").trigger('click');
            setTimeout(function () {
                $('#updateFromControl').trigger('click');
            }, 800);
            event.preventDefault();
        });
    });
</script>
