<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-06
  Time: 오후 3:58
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
        <form class="form-inline" id="OUTSIDE_ORDER_MANAGE_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideOrderManageList">
            <div class="none_gubunWrap row4_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="ITEM_NM" id="ITEM_NM">
                        </span>

                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="MODULE_NM">모듈명</label>
                            <input type="text" class="wd_200" name="MODULE_NM" id="MODULE_NM">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100">외주발주상태</label>
                            <label for="OUTSIDE_STATUS"></label><select class="wd_200" name="OUTSIDE_STATUS" id="OUTSIDE_STATUS">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1031}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mr-10">
                            <label for="OUTSIDE_SEARCH_CONDITION"></label><select name="OUTSIDE_SEARCH_CONDITION" id="OUTSIDE_SEARCH_CONDITION" style="width: 100px; text-align-last: center;">
                                <c:forEach var="code" items="${HighCode.H_1084}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <div class="d-inline-block" style="width: 542px">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="OUTSIDE_MANAGE_START_DATE" id="OUTSIDE_MANAGE_START_DATE"><button type="button" id="OUTSIDE_MANAGE_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="OUTSIDE_MANAGE_END_DATE" id="OUTSIDE_MANAGE_END_DATE" readonly><button type="button" id="OUTSIDE_MANAGE_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업구분</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1013}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">품질현황</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1040}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box wd_100"><input name="EXCLUDE_REQUEST_COMPLETED" id="EXCLUDE_REQUEST_COMPLETED" type="checkbox" checked><label for="EXCLUDE_REQUEST_COMPLETED"> 요청완료제외</label></span>
                            <span class="chk_box wd_100"><input name="IN_STOCK" id="IN_STOCK" type="checkbox" checked><label for="IN_STOCK"> 입고완료제외</label></span>
                            <span class="gubun"></span>
                            <span class="ipu_wrap">
                                <label class="label_100" for="AMOUNT_SUM">금액총합계</label>
                                <input type="text" class="wd_200" id="AMOUNT_SUM" readonly>
                            </span>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="OUTSIDE_ORDER_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row4_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <label for="outsourcingOrderManageFilterKeyword"></label><input type="text" id="outsourcingOrderManageFilterKeyword" placeholder="Enter your keyword">
                <label for="outsourcingOrderManageFilterColumn"></label><select id="outsourcingOrderManageFilterColumn"></select>
                <label for="outsourcingOrderManageFilterCondition"></label><select id="outsourcingOrderManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="outsourcingOrderManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="outsourcingOrderManageFrozen" name="outsourcingOrderManageFrozen">
                </select>
            </div>
            <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#REQUEST_OUTSIDE_POPUP">
                외주가공 요청
            </button>
            <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#CANCEL_REQUEST_OUTSIDE_POPUP">
                가공요청 취소
            </button>
            <button type="button" class="defaultBtn btn-100w" id="ORDER_EXTRACTION">발주서 추출</button>
            <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#OUTSIDE_CLOSE_POPUP">외주마감
            </button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_VIEW">도면 View</button>
                <button type="button" class="defaultBtn btn-100w red" id="OUTSIDE_ORDER_MANAGE_DELETE">삭제</button>
                <button type="button" class="defaultBtn btn-100w green" id="OUTSIDE_ORDER_MANAGE_SAVE">저장</button>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="OUTSIDE_ORDER_MANAGE_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="OUTSIDE_ORDER_MANAGE_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<div class="popup_container" id="REQUEST_OUTSIDE_POPUP" style="display: none;">
    <div class="layerPopup" style="overflow: scroll;">
        <h3 style="margin-bottom: 10px;">외주 가공 요청</h3>
        <button type="button" class="pop_close" name="REQUEST_OUTSIDE_POPUP_CLOSE">닫기</button>
        <hr>
        <form class="form-inline" name="REQUEST_OUTSIDE_MAIL_FORM" id="REQUEST_OUTSIDE_MAIL_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId">
            <input type="hidden" name="TEMPLATE_SEQ" id="TEMPLATE_SEQ" value="2">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="OUTSIDE_STATUS" id="OUTSIDE_STATUS" value="OST001">
            <input type="hidden" name="ROW_CNT" id="ROW_CNT">
            <input type="hidden" name="GFILE_SEQ" id="GFILE_SEQ">
            <input type="hidden" name="RECEIVE_EMAIL" id="RECEIVE_EMAIL">
            <input type="hidden" name="CC_EMAIL" id="CC_EMAIL">
            <div class="text-right mb-10">
                <button class="defaultBtn green" id="REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
            </div>
            <div style="display: grid; grid-template-columns: repeat(2, 1fr);  grid-template-rows: repeat(2, 1fr); gap: 20px; margin-bottom: 10px;">
                <div style="grid-column-start: 1; grid-column-end: 2; grid-row-start: 1; grid-row-end: 3;">
                    <div style="display: inline-block;">
                        <h5>메일내용</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <label for="OUTSIDE_COMP_CD">요청 외주 업체</label>
                        <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <option></option>
                        </select>
                    </div>
                    <div>
                        <label for="REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></label><textarea name="EMAIL_CONTENT_TXT" id="REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></textarea>
                    </div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 1; grid-row-end: 2;">
                    <div class="d-inline-block"><h5>메일수신처</h5></div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn red" id="REQUEST_OUTSIDE_MAIL_DESTINATION_DELETE_BUTTON">삭제</button>
                        <button class="defaultBtn green" id="REQUEST_OUTSIDE_MAIL_DESTINATION_ADD_BUTTON">추가</button>
                    </div>
                    <div id="REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 2; grid-row-end: 3;">
                    <div class="d-inline-block"><h5>첨부파일</h5></div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn green" id="REQUEST_OUTSIDE_FILE_UPLOAD_BUTTON">추가</button>
                    </div>
                    <div id="REQUEST_OUTSIDE_FILE_GRID"></div>
                </div>
            </div>
        </form>
        <form class="form-inline" id="REQUEST_OUTSIDE_PROCESS_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="REQUEST_OUTSIDE_GRID"></div>
        </form>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" name="REQUEST_OUTSIDE_POPUP_CLOSE">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="CANCEL_REQUEST_OUTSIDE_POPUP" style="display: none;">
    <div class="layerPopup" style="overflow: scroll;">
        <h3 style="margin-bottom: 10px;">외주 가공 취소 요청</h3>
        <button type="button" class="pop_close" name="CANCEL_REQUEST_OUTSIDE_POPUP_CLOSE">닫기</button>
        <hr>
        <form class="form-inline" name="CANCEL_REQUEST_OUTSIDE_MAIL_FORM" id="CANCEL_REQUEST_OUTSIDE_MAIL_FORM" role="form" onsubmit="return false;">
            <input type="hidden" id="queryId" name="queryId">
            <input type="hidden" id="TEMPLATE_SEQ" name="TEMPLATE_SEQ" value="3">
            <input type="hidden" id="COMP_CD" name="COMP_CD" value="">
            <input type="hidden" name="OUTSIDE_STATUS" id="OUTSIDE_STATUS" value="OST002">
            <input type="hidden" name="ROW_CNT" id="ROW_CNT">
            <input type="hidden" name="GFILE_SEQ" id="GFILE_SEQ">
            <input type="hidden" name="RECEIVE_EMAIL" id="RECEIVE_EMAIL">
            <input type="hidden" name="CC_EMAIL" id="CC_EMAIL">
            <div class="text-right mb-10">
                <button class="defaultBtn green" id="CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
            </div>
            <div style="display: grid; grid-template-columns: repeat(2, 1fr);  grid-template-rows: repeat(2, 1fr); gap: 20px; margin-bottom: 10px;">
                <div style="grid-column-start: 1; grid-column-end: 2; grid-row-start: 1; grid-row-end: 3;">
                    <div style="display: inline-block;">
                        <h5>메일내용</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <label for="OUTSIDE_COMP_CD">요청 외주 업체</label>
                        <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <option></option>
                        </select>
                    </div>
                    <div>
                        <label for="CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></label><textarea name="EMAIL_CONTENT_TXT" id="CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></textarea>
                    </div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 1; grid-row-end: 2;">
                    <div class="d-inline-block"><h5>메일수신처</h5></div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn red" id="CANCEL_REQUEST_OUTSIDE_MAIL_DESTINATION_DELETE_BUTTON">삭제</button>
                        <button class="defaultBtn green" id="CANCEL_REQUEST_OUTSIDE_MAIL_DESTINATION_ADD_BUTTON">추가</button>
                    </div>
                    <div id="CANCEL_REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 2; grid-row-end: 3;">
                    <div class="d-inline-block"><h5>첨부파일</h5></div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn green" id="CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD_BUTTON">추가</button>
                    </div>
                    <div id="CANCEL_REQUEST_OUTSIDE_FILE_GRID"></div>
                </div>
            </div>
        </form>
        <form class="form-inline" id="CANCEL_REQUEST_OUTSIDE_PROCESS_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="CANCEL_REQUEST_OUTSIDE_GRID"></div>
        </form>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" name="CANCEL_REQUEST_OUTSIDE_POPUP_CLOSE">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="OUTSIDE_CLOSE_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 1536px; height: 648px;">
        <h3> 월 마감 진행(협력업체)</h3>
        <hr>
        <button type="button" class="pop_close" name="OUTSIDE_CLOSE_NO">닫기</button>
        <div class="buttonWrap">
            <form class="form-inline" id="OUTSIDE_CLOSE_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseLeftList">
                <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
                <input type="hidden" name="COMP_CD" id="COMP_CD">
                <input type="hidden" name="OUTSIDE_COMP_CD_QUOTATION" id="OUTSIDE_COMP_CD_QUOTATION">
                <div class="leftbuttonWrap" style="width: 710px;">
                    <div class="d-inline-block">
                        <label for="OUTSIDE_CLOSE_POP_COMP_CD"></label>
                        <select name="COMP_CD" id="OUTSIDE_CLOSE_POP_COMP_CD">
                            <option></option>
                        </select>
                    </div>
                    <div class="d-inline-block">
                        <label for="OUTSIDE_CLOSE_POP_YEAR"></label>
                        <select name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_POP_YEAR">
                            <option></option>
                        </select>
                    </div>
                    <div class="d-inline-block">
                        <label for="OUTSIDE_CLOSE_POP_MONTH"></label>
                        <select name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_POP_MONTH">
                            <option></option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div class="d-inline-block">
            <div style="width: 710px; float:left;">
                <div id="OUTSIDE_CLOSE_LEFT_GRID"></div>
            </div>
            <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 475px;">
                <img src="<c:url value="/resource/asset/images/common/img_right_arrow.png"/>" alt="오른쪽 화살표">
            </div>
            <div style="width: 710px; float:left;">
                <div id="OUTSIDE_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>

        <div class="text-center">
            <button class="defaultBtn greenPopGra" id="OUTSIDE_CLOSE_YES">저장</button>
            <button class="defaultBtn grayPopGra" name="OUTSIDE_CLOSE_NO">닫기</button>
        </div>
    </div>
</div>

<input type="button" id="REQUEST_OUTSIDE_FILE_UPLOAD" style="display: none;">
<input type="button" id="CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD" style="display: none;">

<form id="outsourcing_order_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectOutsourcingOrderExcel:selectOutsourcingOrderInfoExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data:info"/>
    <input type="hidden" id="paramName" name="paramName" value="OUTSIDE_ORDER_NUM:ORDER_COMP_CD:ORDER_STAFF_SEQ:CONTROL_SEQ:CONTROL_DETAIL_SEQ:COMP_CD"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="outsourcing_order_template"/>
</form>

<script>
    $(function () {
        'use strict';
        /* variable */
        const OUTSOURCE_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });
        let selectedRowIndex = [];
        let selectedReqeustMailRowIndex = [];
        let selectedCancelMailRowIndex = [];
        let $outsideOrderManageGrid;
        const gridId = 'OUTSIDE_ORDER_MANAGE_GRID';
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: '담당자', dataType: 'integer', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
            {title: '사업자<br>구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', dataIndx: 'COMP_NM'},
            {title: '외주<br>구분', dataIndx: 'OUTSIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '원발주<br>상태', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '외주<br>발주상태', dataIndx: 'OUTSIDE_STATUS', hidden: true},
            {title: '외주<br>발주상태', dataIndx: 'OUTSIDE_STATUS_NM'},
            {title: '상태변경<br>일시', width: 100, dataIndx: 'OUTSIDE_STATUS_DT'},
            {
                title: '외주업체', width: 70, dataIndx: 'OUTSIDE_COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.OUTSIDE_STATUS !== 'OST001';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: OUTSOURCE_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let index = OUTSOURCE_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = OUTSOURCE_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : OUTSOURCE_COMPANY[index].text;
                    }
                }
            },
            {title: '비고(주문)', width: 90, dataIndx: 'CONTROL_NOTE'},
            {title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, dataIndx: 'PART_NUM'},
            {title: '', minWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="magnifyingGlassIcon" id="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', width: 90, dataIndx: 'DRAWING_NUM'},
            {title: '작업<br>형태', width: 70, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: 70, dataIndx: 'SIZE_TXT'},
            {title: '소재종류', width:70, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면처리', width:90, dataIndx: 'SURFACE_TREAT_NM'},
            {title: '사급<br>여부', minWidth: 30, width: 40, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '소재<br>제공', minWidth: 30, width: 40, dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;
                    // console.log(rowData.OUTSIDE_STATUS);
                    // console.log(rowData.MATERIAL_SUPPLY_YN);
                    // console.log(rowData.OUTSIDE_STATUS !== 'OST001');
                    // console.log(rowData.MATERIAL_SUPPLY_YN !== 'Y');
                    // console.log(rowData.OUTSIDE_STATUS !== 'OST001' || rowData.MATERIAL_SUPPLY_YN !== 'Y');
                    // return rowData.OUTSIDE_STATUS !== 'OST001' || rowData.MATERIAL_SUPPLY_YN !== 'Y';
                    return rowData.OUTSIDE_STATUS !== 'OST001';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;

                    return cellData === 'Y' ? cellData : rowData.MATERIAL_SUPPLY_YN === 'Y' ? 'Y' : '';
                }
            },
            {
                title: '요청 가공 사항', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.OUTSIDE_STATUS !== 'OST001';
                        },
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;
                            return rowData.OUTSIDE_STATUS !== 'OST001';
                        },
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.OUTSIDE_STATUS !== 'OST001';
                        },
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '표면', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.OUTSIDE_STATUS !== 'OST001';
                        },
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '기타사항', width: 90, dataIndx: 'OUTSIDE_REQUEST_ETC',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.OUTSIDE_STATUS !== 'OST001';
                        }
                    }
                ]
            },
            {title: '외주납기', width: 70, dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true, editor: {type: 'textbox', init: fnDateEditor},
                render: function (ui) {
                    if (ui.cellData) {
                        let date = ui.cellData;

                        return date.substring(5);
                    } else {
                        let visibleDate = new Date(ui.rowData.INNER_DUE_DT);
                        visibleDate.setDate(visibleDate.getDate() - 1);
                        return visibleDate.mmdd();
                    }
                }
            },
            {
                title: '비고', width: 90, dataIndx: 'OUTSIDE_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: true
            },
            {title: '입고일시', width: 100, dataIndx: 'OUTSIDE_IN_DT2'},
            {title: '수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT', render: function (ui) {}},
                    {title: '견적단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT'},
                    {title: '공급단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
                    {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
                    {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'}
                ]
            },
            {
                title: '외주<br>발주번호', width:90, dataIndx: 'OUTSIDE_ORDER_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: true
            },
            {
                title: '외주<br>확정단가', width: 90, align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, format: '#,###',
                editable: true
            },
            {title: '금액<br>합계', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_TOTAL_AMT'},
            {title: '외주<br>종전가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DHLWNWHDWJSRK'},
            {
                title: '품질결과', align: 'center', colModel: [
                    {title: 'Seq.', minWidth: 30, width: 35, datatype: 'integer', dataIndx: 'INSPECT_NUM'},
                    {title: '등급', minWidth: 30, width: 35, dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '불량코드', minWidth: 30, width: 70, dataIndx: 'INSPECT_RESULT_NM'},
                    {title: '측정일시', dataIndx: 'INSPECT_INSERT_UPDATE_DT'}
                ]
            },
            {title: '외주<br>확정 일시', width: 100, dataIndx: 'OUTSIDE_CONFIRM_DT'},
            {title: '외주가공<br>요청일시', width: 100, dataIndx: 'OUTSIDE_REQUEST_DT'},
            {
                title: 'DXF', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35,
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
                title: 'PDF', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: '원칭', dataIndx: 'ORIGINAL_SIDE_QTY', hidden: true},
            {title: '대칭', dataIndx: 'OTHER_SIDE_QTY', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            height: 680,
            collapsible: false,
            resizable: false,
            postRenderInterval: -1,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            editable: false,
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: outsourcingOrderManageFilterRender},
            filterModel: {mode: 'OR'},
            colModel: colModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 19);
                // 필터 옵션 생성
                let filterOpts = '<option value=\"\">All Fields</option>';
                let frozenOts = '<option value="0">Selected</option>';

                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === false || column.hidden === undefined;
                    if (hiddenYn && column.title) {
                        filterOpts += '<option value="' + column.dataIndx + '">' + column.title + '</option>';
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $("#outsourcingOrderManageFilterColumn").html(filterOpts);
                $("#outsourcingOrderManageFrozen").html(frozenOts);
            },
            complete: function () {
                let data = $outsideOrderManageGrid.pqGrid('option', 'dataModel.data');

                $('#OUTSIDE_ORDER_MANAGE_RECORDS').html(data.length);
            },
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $outsideOrderManageGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        };
        let $mailRecipientGrid;
        const mailRecipientGridId = 'REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID';
        const mailRecipientColModel = [
            {title: '', dataIndx: 'STAFF_SEQ', hidden: true},
            {title: '성함', dataIndx: 'STAFF_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '메일주소', dataIndx: 'STAFF_EMAIL',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '전화번호', dataIndx: 'STAFF_TEL',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {
                title: '수신', datatype: 'bool', dataIndx: 'RECEPTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                type: 'checkbox', cb: {all: false, header: false, select: false, check: 'true', uncheck: 'false'}
            },
            {
                title: '참조', datatype: 'bool', dataIndx: 'REFERENCE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                type: 'checkbox', cb: {all: false, header: false, select: false, check: 'true', uncheck: 'false'}
            }
        ];
        const mailRecipientObj = {
            height: 175,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            selectionModel: {type: 'row', mode: 'single'},
            trackModel: {on: true},
            dragColumns: {enabled: false},
            // editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: mailRecipientColModel,
            // toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'outMapper.selectOutsideMailDestination', 'OUTSIDE_COMP_CD': ''}, // TODO: COMP_CD 변수
                recIndx: 'STAFF_SEQ',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                selectedReqeustMailRowIndex = ui.addList[0].rowIndx;
            }
        };
        let $requestOutsideFileGrid;
        const requestOutsideFileGridId = 'REQUEST_OUTSIDE_FILE_GRID';
        const requestOutsideFileColModel =  [
            {title: 'GFILE_SEQ', dataIndx: 'GFILE_SEQ', hidden: true},
            {title: '파일명', dataIndx: 'ORGINAL_FILE_NM', width: 500, minWidth: 70,
                render: function(ui) {
                    let returnVal = ui.cellData;
                    if (ui.rowData.FILE_SEQ !== undefined) {
                        returnVal += '<span id=\"downloadSingleFile\" class=\"ui-icon ui-icon-search\" style=\"cursor: pointer\"></span>';
                    }
                    return returnVal;
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadSingleFile").bind("click", function () {
                        let rowData = ui.rowData;

                        fnSingleFileDownloadFormPageAction(rowData.FILE_SEQ);
                    });
                }
            },
            {title: '용량', dataIndx: 'FILE_SIZE',  width: 100, minWidth: 100,
                render: function(ui) {
                    return fn_getFileSize(ui.cellData);
                }

            },
            {title: '업로드 일시', dataIndx: 'INSERT_DT',  width: 110, minWidth: 70},
            {title: '', align: 'center', dataIndx: 'FILE_SEQ', width: 40, minWidth: 40,
                render: function (ui) {
                    let EST_STATUS = $("#estimate_register_info_form #EST_STATUS").val();
                    let returnVal = "";
                    if (ui.cellData) {
                        if (EST_STATUS !== 'EST020') returnVal = '<span id="deleteSingleFile" class="ui-icon ui-icon-close" style="cursor: pointer"></span>';

                        return returnVal;
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#deleteSingleFile').on('click', function (event) {
                        let rowData = ui.rowData;
                        let parameter = {
                            'queryId': 'common.deleteFileKey',
                            'FILE_SEQ': rowData.FILE_SEQ
                        };
                        let parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjaxAsync(function(data, callFunctionParam){
                            let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': rowData.GFILE_SEQ };
                            fnRequestGridData($requestOutsideFileGrid, postData);
                        }, parameters, '');
                    });
                }
            }
        ];
        const requestOutsideFileObj = {
            height: 165,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            selectionModel : {type: 'row', mode: 'single'},
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            editable : false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: requestOutsideFileColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'common.selectGfileFileListInfo', 'GFILE_SEQ': $("#estimate_register_info_form").find("#GFILE_SEQ").val()},
                recIndx: 'FILE_SEQ',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
                }
            },
            dataReady: function (event, ui) {
                if($requestOutsideFileGrid === undefined){
                    $requestOutsideFileGrid.pqGrid(requestOutsideFileObj);
                    $requestOutsideFileGrid.pqGrid('refresh');
                }
                let data = $requestOutsideFileGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#estimate_register_file_grid_records').html(totalRecords);
            },
        };
        let $outsideProcessRequestGrid;
        const outsideProcessRequestGridId = 'REQUEST_OUTSIDE_GRID';
        const outsideProcessRequestColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM', editable: true},
            {title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM', editable: true},
            {title: '파<br>트', minWidth:30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '규격', minWidth: 110, dataIndx: 'SIZE_TXT', editable: true},
            {title: '자재<br>종류', minWidth: 70, dataIndx: 'MATERIAL_DETAIL',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {title: '표면<br>처리', minWidth: 70, dataIndx: 'SURFACE_TREAT',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {title: '수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '소재<br>제공', minWidth: 30, width: 40, dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.OUTSIDE_STATUS !== 'OST001' || rowData.MATERIAL_SUPPLY_YN !== 'Y';
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;

                    return cellData === 'Y' ? cellData : rowData.MATERIAL_SUPPLY_YN === 'Y' ? 'Y' : '';
                }
            },
            {
                title: '요청 가공 사항', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {title: '기타사항', dataIndx: 'OUTSIDE_REQUEST_ETC', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
                ]
            },
            {title: '외주<br>요망납기', datatype: 'date', dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true, editor: {type: 'textbox', init: fnDateEditor},
                render: function (ui) {
                    if(!ui.cellData) {
                        let visibleDate = new Date(ui.rowData.INNER_DUE_DT);
                        visibleDate.setDate(visibleDate.getDate() - 3);
                        return visibleDate.mmdd();
                    }
                }
            },
            {title: '비고', dataIndx: 'OUTSIDE_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
        ];
        const outsideProcessRequestObj = {
            height: 200,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            // scrollModel: {autoFit: true},
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: outsideProcessRequestColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                recIndx: 'ROW_NUM',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function(event, ui) {
                this.flex();
            }
        };
        let $cancelMailRecipientGrid;
        const cancelMailRecipientGridId = 'CANCEL_REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID';
        const cancelMailRecipientObj = {
            height: 175,
            collapsible: false,
            resizable: false,
            showTitle: false,
            scrollModel: {autoFit: true},
            selectionModel: {type: 'row', mode: 'single'},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            // editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: mailRecipientColModel,
            toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.selectCompanyStaffEmailList', 'COMP_CD': ''},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                selectedReqeustMailRowIndex = ui.addList[0].rowIndx;
            }
        };
        let $cancelRequestOutsideFileGrid;
        const cancelRequestOutsideFileGridId = 'CANCEL_REQUEST_OUTSIDE_FILE_GRID';
        const cancelRequestOutsideFileColModel =  [
            {title: 'GFILE_SEQ', dataIndx: 'GFILE_SEQ', hidden: true},
            {title: '파일명', dataIndx: 'ORGINAL_FILE_NM', width: 500, minWidth: 70,
                render: function(ui) {
                    let returnVal = ui.cellData;
                    if (ui.rowData.FILE_SEQ !== undefined) {
                        returnVal += '<span id=\"downloadSingleFile\" class=\"ui-icon ui-icon-search\" style=\"cursor: pointer\"></span>';
                    }
                    return returnVal;
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadSingleFile").bind("click", function () {
                        let rowData = ui.rowData;

                        fnSingleFileDownloadFormPageAction(rowData.FILE_SEQ);
                    });
                }
            },
            {title: '용량', dataIndx: 'FILE_SIZE',  width: 100, minWidth: 100,
                render: function(ui) {
                    return fn_getFileSize(ui.cellData);
                }

            },
            {title: '업로드 일시', dataIndx: 'INSERT_DT',  width: 110, minWidth: 70},
            {title: '', align: 'center', dataIndx: 'FILE_SEQ', width: 40, minWidth: 40,
                render: function (ui) {
                    let EST_STATUS = $("#estimate_register_info_form #EST_STATUS").val();
                    let returnVal = "";
                    if (ui.cellData) {
                        if (EST_STATUS !== 'EST020') returnVal = '<span id="deleteSingleFile" class="ui-icon ui-icon-close" style="cursor: pointer"></span>';

                        return returnVal;
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#deleteSingleFile').on('click', function (event) {
                        let rowData = ui.rowData;
                        let parameter = {
                            'queryId': 'common.deleteFileKey',
                            'FILE_SEQ': rowData.FILE_SEQ
                        };
                        let parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjaxAsync(function(data, callFunctionParam){
                            let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': rowData.GFILE_SEQ };
                            fnRequestGridData($cancelRequestOutsideFileGrid, postData);
                        }, parameters, '');
                    });
                }
            }
        ];
        const cancelRequestOutsideFileObj = {
            height: 175,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            selectionModel : {type: 'row', mode: 'single'},
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            editable : false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: cancelRequestOutsideFileColModel,
            toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'common.selectGfileFileListInfo', 'GFILE_SEQ': $("#estimate_register_info_form").find("#GFILE_SEQ").val()},
                recIndx: 'FILE_SEQ',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
                }
            },
            dataReady: function (event, ui) {
                if($cancelRequestOutsideFileGrid === undefined){
                    $cancelRequestOutsideFileGrid.pqGrid(cancelRequestOutsideFileObj);
                    $cancelRequestOutsideFileGrid.pqGrid('refresh');
                }
                let data = $cancelRequestOutsideFileGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#estimate_register_file_grid_records').html(totalRecords);
            },
        };
        let $cancelRequestOutsideGrid;
        const cancelRequestOutsideGridId = 'CANCEL_REQUEST_OUTSIDE_GRID';
        const cancelRequestOutsideColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM', editable: true},
            {title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', minWidth: 120, dataIndx: 'DRAWING_NUM', editable: true},
            {title: '파<br>트', minWidth:30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '규격', minWidth: 110, dataIndx: 'SIZE_TXT', editable: true},
            {title: '자재<br>종류', minWidth: 70, dataIndx: 'MATERIAL_DETAIL',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {title: '표면<br>처리', minWidth: 70, dataIndx: 'SURFACE_TREAT',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {title: '수량', dataIndx: 'ITEM_QTY'},
            {
                title: '소재<br>제공', dataType: 'bool', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;

                    return cellData === 'Y' ? cellData : rowData.MATERIAL_SUPPLY_YN === 'Y' ? 'Y' : '';
                }
            },
            {
                title: '요청가공', align: 'center', colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN',
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN',
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN',
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면<br>처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN',
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {title: '기타사항', dataIndx: 'OUTSIDE_REQUEST_ETC'}
                ]
            },
            {title: '외주<br>요망납기', datatype: 'date', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
            {title: '비고', dataIndx: 'OUTSIDE_NOTE'}
        ];
        const cancelRequestOutsideObj = {
            height: 200,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: cancelRequestOutsideColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                recIndx: 'ROW_NUM',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function(event, ui) {
                this.flex();
            }
        };

        let $outsideCloseLeftGrid;
        const outsideCloseLeftGridId = 'OUTSIDE_CLOSE_LEFT_GRID';
        // let outsideCloseLeftPostData;
        const outsideCloseLeftColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '대상업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '대상업체', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'VIEW_CLOSE_VER'},
            {title: '품수', dataIndx: 'CNT'},
            {title: '검수', dataIndx: 'CONTROL_PART_QTY'},
            {title: '외주금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_TOTAL_AMT'},
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT'},
            {
                title: 'Update 차수', dataType: 'integer', dataIndx: 'UPDATE_CLOSE_VER', editable: true,
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: [
                        {value: 0, text: '신규차수'},
                        {value: 1, text: '1차'},
                        {value: 2, text: '2차'},
                        {value: 3, text: '3차'},
                        {value: 4, text: '4차'},
                        {value: 5, text: '5차'},
                    ]
                },
                styleHead: {'background': '#a9d3f5'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let itemList = [
                        {value: 0, text: '신규차수'},
                        {value: 1, text: '1차'},
                        {value: 2, text: '2차'},
                        {value: 3, text: '3차'},
                        {value: 4, text: '4차'},
                        {value: 5, text: '5차'},
                    ];
                    let index = itemList.findIndex(function (element) {
                        return element.value === Number(cellData);
                    });

                    return (index < 0) ? cellData : itemList[index].text;
                }
            }
        ];
        const outsideCloseLeftObj = {
            height: 475,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            editModel: {clicksToEdit: 1},
            colModel: outsideCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            change: function (evt, ui) {
                if (ui.source === 'edit') {
                    let rowData = fnCloneObj(ui.updateList[0].rowData);
                    rowData.CLOSE_VER = rowData.UPDATE_CLOSE_VER > 0 ? rowData.UPDATE_CLOSE_VER : rowData.NEW_CLOSE_VER;

                    $(this.element.context).pqGrid('updateRow', {'rowIndx': rowData.pq_ri , row: {'CLOSE_VER': rowData.CLOSE_VER, 'VIEW_CLOSE_VER': rowData.CLOSE_VER + '차'}, checkEditable: false });
                    changeOutsideCloseRightData(rowData);
                }
            },
        };
        let $outsideCloseRightGrid;
        const outsideCloseRightGridId = 'OUTSIDE_CLOSE_RIGHT_GRID';

        const outsideCloseRightColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {
                title: '', maxWidth: 50, dataType: 'integer', dataIndx: 'STATUS',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let text = '';

                    switch (cellData) {
                        case 2:
                            text = 'New';
                            break;
                        case 3:
                            text = 'Modify';
                            break;
                    }

                    return text;
                }
            },
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '대상업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '대상업체', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataIndx: 'CNT'},
            {title: '검수', dataIndx: 'CONTROL_PART_QTY'},
            {title: '외주금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_TOTAL_AMT'},
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const outsideCloseRightObj = {
            height: 475,
            collapsible: false,
            resizable: false,
            showTitle: false,
            scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: outsideCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            rowInit: function (ui) {
                switch (ui.rowData.STATUS) {
                    case 2:
                        return {style: {'background': '#FFF2CC'}};
                    case 3:
                        return {style: {'background': '#B9EDFF'}};
                }
            }
        };

        const loadOutsideProcessData = function (formElement) {
            let controlSeqStr = '';
            let controlDetailSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                controlSeqStr += rowData.CONTROL_SEQ;
                controlDetailSeqStr += rowData.CONTROL_DETAIL_SEQ;

                if (i < selectedRowCount - 1) {
                    controlSeqStr += ',';
                    controlDetailSeqStr += ',';
                }
            }

            $('#' + formElement + ' > #CONTROL_SEQ').val(controlSeqStr);
            $('#' + formElement + ' > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);

            let grid = $('#' + formElement).find('[id$=REQUEST_OUTSIDE_GRID]');
            grid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#' + formElement));
            });
            grid.pqGrid('refreshDataAndView');
        };

        const loadCancelRequestOutsideData = function () {
            let selectedRowCount = selectedRowIndex.length;
            let controlSeqStr = '';
            let controlDetailSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                controlSeqStr += rowData.CONTROL_SEQ;
                controlDetailSeqStr += rowData.CONTROL_DETAIL_SEQ;

                if (i < selectedRowCount - 1) {
                    controlSeqStr += ',';
                    controlDetailSeqStr += ',';
                }
            }

            $('#CANCEL_REQUEST_OUTSIDE_PROCESS_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CANCEL_REQUEST_OUTSIDE_PROCESS_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);

            $cancelRequestOutsideGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CANCEL_REQUEST_OUTSIDE_PROCESS_FORM'));
            });
            $cancelRequestOutsideGrid.pqGrid('refreshDataAndView');
        };

        let loadOutsideCloseData = function () {
            let selectedRowCount = selectedRowIndex.length;
            let controlDetailSeqList = [];
            // let compCdList = [];
            let outsideCompCdList = [];
            let controlDetailSeqStr = '';
            let compCdStr = $('#OUTSIDE_CLOSE_FORM').find('#OUTSIDE_CLOSE_POP_COMP_CD').val();
            let outsideCompCdStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlDetailSeqList.push(rowData.CONTROL_DETAIL_SEQ);
                // compCdList.push(rowData.COMP_CD);
                outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
            }
            // 중복제거
            // compCdList = [...new Set(compCdList)];
            outsideCompCdList = [...new Set(outsideCompCdList)];

            for (let i = 0, LENGTH = controlDetailSeqList.length; i < LENGTH; i++) {
                controlDetailSeqStr += controlDetailSeqList[i];

                if (i < LENGTH - 1) {
                    controlDetailSeqStr += ',';
                }
            }
            // for (let i = 0, LENGTH = compCdList.length; i < LENGTH; i++) {
            //     compCdStr += compCdList[i];
            //
            //     if (i < LENGTH - 1) {
            //         compCdStr += ',';
            //     }
            // }
            for (let i = 0, LENGTH = outsideCompCdList.length; i < LENGTH; i++) {
                outsideCompCdStr += '\'' + outsideCompCdList[i] + '\'';

                if (i < LENGTH - 1) {
                    outsideCompCdStr += ',';
                }
            }

            $('#OUTSIDE_CLOSE_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);
            $('#OUTSIDE_CLOSE_FORM > #COMP_CD').val(compCdStr);
            $('#OUTSIDE_CLOSE_FORM > #OUTSIDE_COMP_CD_QUOTATION').val(outsideCompCdStr);


            // left
            let outsideCloseLeftPostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_FORM');
            outsideCloseLeftPostData.queryId = 'outMapper.selectOutsideCloseLeftList';

            $outsideCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#OUTSIDE_CLOSE_FORM'));
            });
            $outsideCloseLeftGrid.pqGrid('refreshDataAndView');

            // setTimeout(function () {
            //     let leftGirdData = $outsideCloseLeftGrid.pqGrid('option', 'dataModel.data');
            //     console.log('leftGirdData1');
            //     console.log(leftGirdData);
            // }, 1000);
            // right
            let outCloseRightPostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_FORM');
            outCloseRightPostData.queryId = 'outMapper.selectOutsideCloseRightList';
            $outsideCloseRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return outCloseRightPostData;
            });
            $outsideCloseRightGrid.pqGrid('refreshDataAndView');
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        const changeDate = function (newDate = new Date(), today = new Date()) {
            $('#OUTSIDE_MANAGE_START_DATE').val(newDate.yyyymmdd());
            $('#OUTSIDE_MANAGE_END_DATE').val(today.yyyymmdd());
        };

        const checkStatus = function (mailFormElement, status) {
            // status : OST001 = 가공요청, OST002 = 요청취소
            let compCdList= [];
            let outsideCompCdList = [];
            let outsideStatusList = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                compCdList[i] = rowData.COMP_CD;
                outsideCompCdList[i] = rowData.OUTSIDE_COMP_CD;
                outsideStatusList[i] = rowData.OUTSIDE_STATUS;
            }

            // 중복제거
            compCdList = [...new Set(compCdList)];
            outsideCompCdList = [...new Set(outsideCompCdList)];
            outsideStatusList = [...new Set(outsideStatusList)];

            if (compCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                return true;
            }
            if (outsideCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 협력업체는 동일해야 합니다.');
                return true;
            }
            if (outsideStatusList.length > 1 && !(outsideStatusList.includes(undefined) && outsideStatusList.includes('OST002'))) {
                fnAlert(null, '외주발주상태가 일치 하지 않습니다.');
                return true;
            }

            if (outsideStatusList[0] === 'OST001' && outsideStatusList[0] === status) {
                fnAlert(null, '이미 외주가공한 대상입니다.');
                return true;
            }

            if (outsideStatusList[0] === 'OST002' && outsideStatusList[0] === status) {
                fnAlert(null, '이미 가공요청 취소한 대상입니다.');
                return true;
            }

            if (outsideStatusList[0] === undefined && status === 'OST002') {
                fnAlert(null, '가공요청 취소 할 수 없습니다.');
                return true;
            }

            if(outsideStatusList.includes('OST003')) {
                fnAlert(null, '이미 입고완료 된 대상이 포함되어있습니다.');
                return true;
            }

            $('#' + mailFormElement + ' > #COMP_CD').val(compCdList[0]);
        };

        const selectOutsideCompCd = function (mailFormElement) {
            let outsideCompCdList = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
            }

            // 중복제거
            outsideCompCdList = [...new Set(outsideCompCdList)];

            $('#' + mailFormElement + ' #OUTSIDE_COMP_CD').val(outsideCompCdList[0]);
        };

        const getRequestOutsideMailContent = function (mailFormElement, textAreaElementId) {
            let postData = fnFormToJsonArrayData('#' + mailFormElement);
            postData.queryId = 'outMapper.selectRequestOutsideMailContent';
            let parameters = {'url': '/json-list', 'data': postData};
            fnPostAjaxAsync(function (data) {
                try {
                    let content = data.list[0].TEMPLATE_CONTENT;
                    $('#' + textAreaElementId).val(content);
                    CKEDITOR.instances[textAreaElementId].setData(content);
                } catch (e) {
                    console.log(e);
                }
            }, parameters, '');
        };

        const getRequestOutsideMailDestination = function (mailFormElement) {
            let postData = fnFormToJsonArrayData('#' + mailFormElement);
            postData.queryId = 'outMapper.selectOutsideMailDestination';
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                let grid = $('#' + mailFormElement).find('[id$=REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID]');
                grid.pqGrid('option', 'dataModel.data', data.list);
                grid.pqGrid('refreshView');
            }, parameters, '');
        };

        let createMailInnerTable = function (type, list) {
            let table = '';
            let font_header = 'background:lightgray; font-weight:600;';
            let st_center = 'border:1px solid #d0d0d0; text-align:center;';

            table +=
                '<table style="border-spacing: 0;">\n' +
                    '<thead>\n' +
                    '    <tr>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">No.</th>\n' +
                    '        <th rowspan="2" style="width:200px; ' + st_center + font_header + '">관리번호</th>\n' +
                    '        <th rowspan="2" style="width:30px; ' + st_center + font_header + '">Part</th>\n' +
                    '        <th rowspan="2" style="width:150px; ' + st_center + font_header + '">도면번호</th>\n' +
                    '        <th rowspan="2" style="width:120px; ' + st_center + font_header + '">규격</th>\n' +
                    '        <th rowspan="2" style="width:100px;' + st_center + font_header + '">소재종류</th>\n' +
                    '        <th rowspan="2" style="width:100px;' + st_center + font_header + '">표면처리</th>\n' +
                    '        <th rowspan="2" style="width:60px;' + st_center + font_header + '">소재<br>제공</th>\n' +
                    '        <th rowspan="2" style="width:50px;' + st_center + font_header + '">대칭<br>가공</th>\n' +
                    '        <th rowspan="2" style="width:100px;' + st_center + font_header + '">수량</th>\n' +
                    '        <th colspan="5" style="width:390px;' + st_center + font_header + '">요청가공</th>\n' +
                    '        <th rowspan="2" style="width:80px;' + st_center + font_header + '">요망<br>납기</th>\n' +
                    '    </tr>\n' +
                    '    <tr>\n' +
                    '        <th style="width:50px; ' + st_center + font_header + '">완성품</th>\n' +
                    '        <th style="width:50px; ' + st_center + font_header + '">가공</th>\n' +
                    '        <th style="width:50px; ' + st_center + font_header + '">연마</th>\n' +
                    '        <th style="width:70px; ' + st_center + font_header + '">표면처리</th>\n' +
                    '        <th style="width:150px; ' + st_center + font_header + '">기타사항</th>\n' +
                    '    </tr>\n' +
                    '</thead>\n' +
                    '<tbody>\n';

            let titleInfo = "";
            for (let i = 0, LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                let outsideMaterialSupplyYnChecked = list[i].OUTSIDE_MATERIAL_SUPPLY_YN === 'Y' ? '○' : '';
                let outsideRequestFinishYnChecked = list[i].OUTSIDE_REQUEST_FINISH_YN === 'Y' ? '○' : '';
                let outsideRequestProcessYnChecked = list[i].OUTSIDE_REQUEST_PROCESS_YN === 'Y' ? '○' : '';
                let outsideRequestGrindYnChecked = list[i].OUTSIDE_REQUEST_GRIND_YN === 'Y' ? '○' : '';
                let outsideRequestSurfaceYnChecked = list[i].OUTSIDE_REQUEST_SURFACE_YN === 'Y' ? '○' : '';
                let sideQtyYnChecked = ''; // 대칭가공
                let requestEtc = list[i].OUTSIDE_REQUEST_ETC || '';
                // let outsideNote = list[i].OUTSIDE_NOTE || '';
                let sideQtyText = '';

                if (list[i].ORIGINAL_SIDE_QTY || list[i].OTHER_SIDE_QTY) {
                    sideQtyYnChecked = '○';
                    let originalSideQty = list[i].ORIGINAL_SIDE_QTY || 0;
                    let otherSideQty = list[i].OTHER_SIDE_QTY || 0;
                    sideQtyText = '(원' + originalSideQty + ', 대' + otherSideQty + ')';
                }

                table +=
                '    <tr>\n' +
                '        <td style="' + st_center + '">' + list[i].ROW_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].CONTROL_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].PART_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].DRAWING_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].SIZE_TXT + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].MATERIAL_DETAIL_NM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].SURFACE_TREAT_NM + '</td>\n' +
                '        <td style="' + st_center + '">' + outsideMaterialSupplyYnChecked + '</td>\n' +
                '        <td style="' + st_center + '">' + sideQtyYnChecked + '</td>\n';
                if (sideQtyText === '') {
                    table += '        <td style="' + st_center + '">' + list[i].CONTROL_PART_QTY + '</td>\n';
                } else {
                    table += '        <td style="' + st_center + '">' + list[i].CONTROL_PART_QTY + ' ' + sideQtyText + '</td>\n';
                }
                table +=
                '        <td style="' + st_center + '">' + outsideRequestFinishYnChecked + '</td>\n' +
                '        <td style="' + st_center + '">' + outsideRequestProcessYnChecked +'</td>\n' +
                '        <td style="' + st_center + '">' + outsideRequestGrindYnChecked + '</td>\n' +
                '        <td style="' + st_center + '">' + outsideRequestSurfaceYnChecked + '</td>\n' +
                '        <td style="' + st_center + '">' + requestEtc + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].OUTSIDE_HOPE_DUE_DT + '</td>\n' +
                '    </tr>\n';

                if (i === 0) {
                    titleInfo = list[i].CONTROL_NUM;
                }
            }
            if (list.length <= 1) {
                titleInfo = titleInfo;
            } else {
                titleInfo = titleInfo + " 외 " + (list.length - 1) + "품";
            }

            if (type == "request") {
                $('#REQUEST_OUTSIDE_MAIL_FORM').find('#ROW_CNT').val(titleInfo);
            } else {
                $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').find('#ROW_CNT').val(titleInfo);
            }

            table += '</tbody>\n';
            table += '</table>';
            return table;
        };

        const clearMailFileAttachPopup = function (element, fileHtml) {
            $(element).children('tbody').html('');
            $(element).children('tbody').append(fileHtml).trigger('create');
        };

        const clearMailForm = function (popupElement) {
            $(popupElement).find('queryId').val('');
            $(popupElement).find('GFILE_SEQ').val('');
        };

        function outsourcingOrderManageFilterRender(ui) {
            let val = ui.cellData === undefined ? "" : ui.cellData,
                options = ui.column.editor === undefined ? "" : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value === val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                if (ui.column.dataType === 'integer') {
                    val = numberWithCommas(val);
                } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                    let o = new Date(val);
                    val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
                }

                let condition = $("#outsourcingOrderManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#outsourcingOrderManageFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                } else if (condition === "contain") {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition === "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }

        const changeOutsideCloseRightData = function (rowData) {
            let list = [];
            let controlDetailSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                list[i] = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
            }
            let groupedOutsideCompCd = fnGroupBy(list, 'OUTSIDE_COMP_CD');

            let changedList = groupedOutsideCompCd[rowData.OUTSIDE_COMP_CD];
            for (let i = 0, LENGTH = changedList.length; i < LENGTH; i++) {
                if (i > 0) {
                    controlDetailSeqStr += ', ';
                }
                controlDetailSeqStr += changedList[i].CONTROL_DETAIL_SEQ;
            }

            rowData.CONTROL_DETAIL_SEQ = controlDetailSeqStr;
            rowData.queryId = 'outMapper.selectOutsideCloseRightList';
            let parameters = {'url': '/json-list', 'data': rowData};
            fnPostAjax(function (data) {
                let outsideCloseRightGridData = $outsideCloseRightGrid.pqGrid('option', 'dataModel.data');
                const deleteRowList = outsideCloseRightGridData.reduce(function (acc, obj) {
                    if (rowData.OUTSIDE_COMP_CD === obj.OUTSIDE_COMP_CD) {
                        acc.push({rowIndx: obj.pq_ri});
                    }
                    return acc;
                }, []);

                const addRowList = data.list.reduce(function (accumulator, currentValue, currentIndex) {
                    accumulator.push({
                        newRow: currentValue,
                        rowIndx: deleteRowList[0].rowIndx + currentIndex
                    });
                    return accumulator;
                }, []);

                $outsideCloseRightGrid.pqGrid('deleteRow', {rowList: deleteRowList});
                $outsideCloseRightGrid.pqGrid('addRow', {rowList: addRowList, checkEditable: false});
            }, parameters, '');
        };
        /* function */

        /* event */
        $('[name=OUTSIDE_MANAGE_TERM]').change(function () {
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
        });

        $('#REQUEST_OUTSIDE_POPUP').on({
            'show.bs.modal': function (event) {
                if (noSelectedRowAlert()) {
                    return false;
                }
                if (checkStatus('REQUEST_OUTSIDE_MAIL_FORM', 'OST001')) {
                    return false;
                }
                if (fnIsGridEditing($outsideOrderManageGrid)) {
                    return false;
                }

                clearMailForm(event.currentTarget);
                // 첨부파일 Element 초기화
                clearMailFileAttachPopup($('#attachDragAndDrop1'),getCadUploadBlankHtml());
                $('#REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val('');
                // 그리드 생성
                $mailRecipientGrid = $('#' + mailRecipientGridId).pqGrid(mailRecipientObj);
                $outsideProcessRequestGrid = $('#' + outsideProcessRequestGridId).pqGrid(outsideProcessRequestObj);
                $requestOutsideFileGrid = $('#' + requestOutsideFileGridId).pqGrid(requestOutsideFileObj);
                // 요청 외주 업체 선택
                selectOutsideCompCd('REQUEST_OUTSIDE_MAIL_FORM');
                setTimeout(function() {
                    // 메일 수신처 가져오기
                    getRequestOutsideMailDestination('REQUEST_OUTSIDE_MAIL_FORM');
                }, 500);
                // 메일 템플릿 가져오기
                getRequestOutsideMailContent('REQUEST_OUTSIDE_MAIL_FORM', 'REQUEST_OUTSIDE_EMAIL_CONTENT_TXT');
                // 하단 그리드 데이터 가져오기
                loadOutsideProcessData('REQUEST_OUTSIDE_PROCESS_FORM');
            },
            'hide.bs.modal': function () {
                $mailRecipientGrid.pqGrid('destroy');
                $outsideProcessRequestGrid.pqGrid('destroy');
                $requestOutsideFileGrid.pqGrid('destroy');
            }
        });

        $('#CANCEL_REQUEST_OUTSIDE_POPUP').on({
            'show.bs.modal': function (event) {
                if (noSelectedRowAlert()) {
                    return false;
                }
                if (checkStatus('CANCEL_REQUEST_OUTSIDE_MAIL_FORM', 'OST002')) {
                    return false;
                }
                if (fnIsGridEditing($outsideOrderManageGrid)) {
                    return false;
                }

                clearMailForm(event.currentTarget);
                // 첨부파일 Element 초기화
                clearMailFileAttachPopup($('#attachDragAndDrop2'),getCadUploadBlankHtml());
                $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val('');
                // 그리드 생성
                $cancelMailRecipientGrid = $('#' + cancelMailRecipientGridId).pqGrid(cancelMailRecipientObj);
                $cancelRequestOutsideGrid = $('#' + cancelRequestOutsideGridId).pqGrid(cancelRequestOutsideObj);
                $cancelRequestOutsideFileGrid = $('#' + cancelRequestOutsideFileGridId).pqGrid(cancelRequestOutsideFileObj);
                // 요청 외주 업체 선택
                selectOutsideCompCd('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
                setTimeout(function() {
                    // 메일 수신처 가져오기
                    getRequestOutsideMailDestination('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
                }, 500);
                // 메일 템플릿 가져오기
                getRequestOutsideMailContent('CANCEL_REQUEST_OUTSIDE_MAIL_FORM', 'CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT');
                // 하단 그리드 데이터 가져오기
                loadOutsideProcessData('CANCEL_REQUEST_OUTSIDE_PROCESS_FORM');
            },
            'hide.bs.modal': function () {
                $cancelMailRecipientGrid.pqGrid('destroy');
                $cancelRequestOutsideGrid.pqGrid('destroy');
                $cancelRequestOutsideFileGrid.pqGrid('destroy');
            }
        });

        $('#OUTSIDE_PROCESS_REQUEST_SAVE').on('click', function () {
            const updateQueryList = ['outMapper.updateOutsideProcessRequest'];

            fnModifyPQGrid($outsideProcessRequestGrid, [], updateQueryList);
        });

        $('#ORDER_EXTRACTION').on('click', function () {
            if (noSelectedRowAlert()) {
                return false;
            }
            if (fnIsGridEditing($outsideOrderManageGrid)) {
                return false;
            }

            let controlSeqStr = '';
            let controlDetailSeqStr = '';
            let outsideOrderNumStr = '';
            let orderStaffSeqStr = '';
            let controlSeqList = [];
            let controlDetailSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.OUTSIDE_COMP_CD);
                controlSeqList.push(rowData.CONTROL_SEQ);
                controlDetailSeqList.push(rowData.CONTROL_DETAIL_SEQ);
                outsideOrderNumStr = rowData.OUTSIDE_ORDER_NUM;
                orderStaffSeqStr = rowData.ORDER_STAFF_SEQ;
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            controlDetailSeqList = [...new Set(controlDetailSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];

            if (orderCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 외주업체는 반드시 동일해야합니다');
                return false;
            }

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlSeqStr += ',';
                }
            }
            for (let i = 0, CONTROL_DETAIL_SEQ_LIST_LENGTH = controlDetailSeqList.length; i < CONTROL_DETAIL_SEQ_LIST_LENGTH; i++) {
                controlDetailSeqStr += controlDetailSeqList[i];

                if (i < CONTROL_DETAIL_SEQ_LIST_LENGTH - 1) {
                    controlDetailSeqStr += ',';
                }
            }
            // if(orderCompCdList[0] == undefined) {
            //     console.log('undefined!');
            // }
            $('#outsourcing_order_excel_download #paramData').val(outsideOrderNumStr + ':' + orderCompCdList[0] + ':' + orderStaffSeqStr + ':' + controlSeqStr + ':' + controlDetailSeqStr  + ':' + compCdList[0]);

            fnReportFormToHiddenFormPageAction('outsourcing_order_excel_download', '/downloadExcel');
        });

        $('#OUTSIDE_CLOSE_POPUP').on({
            'show.bs.modal': function () {
                let selectedRowCount = selectedRowIndex.length;
                let compCdList = [];
                let outsideCompCdList = [];

                for (let i = 0; i < selectedRowCount; i++) {
                    let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    // compCdList.push(rowData.COMP_CD);
                    outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
                }
                // 중복제거
                // compCdList = [...new Set(compCdList)];
                outsideCompCdList = [...new Set(outsideCompCdList)];

                if (outsideCompCdList.length === 0 || outsideCompCdList[0] === undefined) {
                    fnAlert(null, '외주업체가 없습니다!');
                    return false;
                }

                // if (compCdList.length > 1) {
                //     fnAlert(null, '선택된 대상들의 사업자는 동일해야 합니다.');
                //     return false;
                // }
                // if (outsideCompCdList.length > 1) {
                //     fnAlert(null, '선택된 대상들의 협력업체는 동일해야 합니다.');
                //     return false;
                // }

                fnAppendSelectboxYear('OUTSIDE_CLOSE_POP_YEAR', 3);
                fnAppendSelectboxMonth('OUTSIDE_CLOSE_POP_MONTH', CURRENT_YEAR);

                $outsideCloseLeftGrid = $('#' + outsideCloseLeftGridId).pqGrid(outsideCloseLeftObj);
                $outsideCloseRightGrid = $('#' + outsideCloseRightGridId).pqGrid(outsideCloseRightObj);

                loadOutsideCloseData();
            },
            'hide.bs.modal': function () {
                $outsideCloseLeftGrid.pqGrid('destroy');
                $outsideCloseRightGrid.pqGrid('destroy');
            }
        });

        $('#OUTSIDE_CLOSE_FORM').on('change', function () {
            loadOutsideCloseData();
        });

        $('#OUTSIDE_CLOSE_YES').on('click', function () {
            let list = [];
            let compCd = $('#OUTSIDE_CLOSE_POP_COMP_CD option:selected').val();
            let closeMonth = $('#OUTSIDE_CLOSE_POP_YEAR').val() + $('#OUTSIDE_CLOSE_POP_MONTH').val();
            let rightData = $outsideCloseRightGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                rowData.COMP_CD = compCd;
                rowData.CLOSE_MONTH = closeMonth;

                list[i] = rowData;
            }

            for (let i = 0; i < list.length; i++) {
                for (let j = 0; j < rightData.length; j++) {
                    if (list[i].OUTSIDE_COMP_CD === rightData[j].OUTSIDE_COMP_CD) {
                        list[i].CLOSE_VER = rightData[j].CLOSE_VER;
                    }
                }
            }

            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            let parameters = {'url': '/createOutsideClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                $('#OUTSIDE_CLOSE_POPUP').modal('hide');
            }, parameters, '');
        });

        $('[name=OUTSIDE_CLOSE_NO]').on('click', function () {
            $('#OUTSIDE_CLOSE_POPUP').modal('hide');
        });

        $('#OUTSIDE_ORDER_SEARCH').on('click', function () {
            $outsideOrderManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM'));
            });
            $outsideOrderManageGrid.pqGrid('refreshDataAndView');
        });

        $('#OUTSIDE_ORDER_MANAGE_SAVE').on('click', function () {
            const updateQueryList = ['outMapper.updateControlPartOutsourcingOrderManage'];

            fnModifyPQGrid($outsideOrderManageGrid, [], updateQueryList);
        });

        $('#OUTSIDE_ORDER_MANAGE_DELETE').on('click', function () {
            let list = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                list.push(rowData);

                if (rowData.OUTSIDE_STATUS === 'OST001') {
                    let messsage =
                        '<h4>\n' +
                        '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                        '    <span>외주발주상태가 빈칸이나 요청취소인 경우에만 가능합니다</span>\n' +
                        '</h4>';
                    fnAlert(null, messsage);
                    return false;
                }
            }

            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                let parameters = {'url': '/modifyOutsideOrder', 'data': {data: JSON.stringify(list)}};

                fnPostAjax(function (data) {
                    fnAlert(null, "<spring:message code='com.alert.default.remove.success' />");
                    $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            });
        });

        $('.pop_close').on('click', function () {
            $(this).parent('.layerPopup').parent('.popup_container').modal('hide');
        });

        $('[name=REQUEST_OUTSIDE_POPUP_CLOSE]').on('click', function () {
            $('#REQUEST_OUTSIDE_POPUP').modal('hide');
        });

        $('[name=CANCEL_REQUEST_OUTSIDE_POPUP_CLOSE]').on('click', function () {
            $('#CANCEL_REQUEST_OUTSIDE_POPUP').modal('hide');
        });

        $('#CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', _.debounce(function (){
            cancelRequestOutsideConfirm();
        }, 500));
        /* 가공 취소 요청 */

        /* 외주가공요청 파일 업로드 */
        $("#REQUEST_OUTSIDE_FILE_UPLOAD_BUTTON").on('click', function(){
            let GfileKey = $('#REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val();
            $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
            commonFileDownUploadPopupCall(GfileKey, 'REQUEST_OUTSIDE_FILE_UPLOAD');
        });

        $('#REQUEST_OUTSIDE_FILE_UPLOAD').on('click', function () {
            let GfileKey = $('#common_file_download_form').find('#GFILE_SEQ').val();
            $('#REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val(GfileKey);
            let postData = {'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GfileKey};
            fnRequestGridData($requestOutsideFileGrid, postData);
        });
        /* 외주가공요청 파일 업로드 */

        /* 가공요청 취소 파일 업로드 */
        $("#CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD_BUTTON").on('click', function(){
            let GfileKey = $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val();
            $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
            commonFileDownUploadPopupCall(GfileKey, 'CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD');
        });

        $('#CANCEL_REQUEST_OUTSIDE_FILE_UPLOAD').on('click', function () {
            let GfileKey = $('#common_file_download_form').find('#GFILE_SEQ').val();
            $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #GFILE_SEQ').val(GfileKey);
            let postData = {'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GfileKey};
            fnRequestGridData($cancelRequestOutsideFileGrid, postData);
        });
        /* 가공요청 취소 파일 업로드 */

        $("#outsourcingOrderManageFilterKeyword").on("keyup", function(e){
            fnFilterHandler($outsideOrderManageGrid, 'outsourcingOrderManageFilterKeyword', 'outsourcingOrderManageFilterCondition', 'outsourcingOrderManageFilterColumn');
        });

        $("#outsourcingOrderManageFrozen").on('change', function(e){
            fnFrozenHandler($outsideOrderManageGrid, $(this).val());
        });

        $('#OUTSIDE_MANAGE_START_DATE_BUTTON').on('click', function () {
            $('#OUTSIDE_MANAGE_START_DATE').focus();
        });

        $('#OUTSIDE_MANAGE_END_DATE_BUTTON').on('click', function () {
            $('#OUTSIDE_MANAGE_END_DATE').focus();
        });

        $('#REQUEST_OUTSIDE_MAIL_DESTINATION_ADD_BUTTON').on('click', function () {
            $mailRecipientGrid.pqGrid('addRow', {newRow: {}, rowIndx: 0});
        });

        $('#REQUEST_OUTSIDE_MAIL_DESTINATION_DELETE_BUTTON').on('click', function () {
            $mailRecipientGrid.pqGrid('deleteRow', {'rowIndx': selectedReqeustMailRowIndex});
        });

        $('#CANCEL_REQUEST_OUTSIDE_MAIL_DESTINATION_ADD_BUTTON').on('click', function () {
            $cancelMailRecipientGrid.pqGrid('addRow', {newRow: {}, rowIndx: 0});
        });

        $('#CANCEL_REQUEST_OUTSIDE_MAIL_DESTINATION_DELETE_BUTTON').on('click', function () {
            $cancelMailRecipientGrid.pqGrid('deleteRow', {'rowIndx': selectedReqeustMailRowIndex});
        });
        /* event */

        /* init */
        $('#OUTSIDE_MANAGE_START_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#OUTSIDE_MANAGE_END_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#OUTSIDE_MANAGE_START_DATE').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 7));
        $('#OUTSIDE_MANAGE_END_DATE').datepicker('setDate', 'today');

        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM').find('#OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_FORM').find('#OUTSIDE_CLOSE_POP_COMP_CD'), null, {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        setTimeout(function() {
            const JINSEONG_COMP_CD = 'CMP0003';
            $('#OUTSIDE_CLOSE_FORM').find('#OUTSIDE_CLOSE_POP_COMP_CD').val(JINSEONG_COMP_CD).prop('selected', true);
        }, 1000);
        $outsideOrderManageGrid = $('#' + gridId).pqGrid(obj);
        $outsideOrderManageGrid.pqGrid('option', 'dataModel.postData', function () {
            return (fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM'));
        });
        $outsideOrderManageGrid.pqGrid('refreshDataAndView');


        /* 견적 요청*/
        // CKEDITOR 부분
        CKEDITOR.replace('REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 285});

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CANCEL_REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });

        $('#REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', _.debounce(function () {
            let mailFlag = true;
            let outsideCompCd = $('#REQUEST_OUTSIDE_MAIL_FORM').find('#OUTSIDE_COMP_CD').val();
            let mailRecipientData = $mailRecipientGrid.pqGrid('option', 'dataModel.data');

            if (!outsideCompCd) {
                fnAlert(null, '요청 외주 업체가 없습니다.');
                return false;
            }

            let receiveEmail = "";
            let hccEmail = "";

            for (let i in mailRecipientData) {
                if (mailRecipientData.hasOwnProperty(i)) {
                    if (mailRecipientData[i].RECEPTION === 'true') {
                        if(mailFlag) mailFlag = false;
                        if(!receiveEmail)
                            receiveEmail += mailRecipientData[i].STAFF_EMAIL;
                        else
                            receiveEmail += "," + mailRecipientData[i].STAFF_EMAIL;
                    }
                    if(mailRecipientData[i].REFERENCE === 'true') {
                        if(!hccEmail)
                            hccEmail += mailRecipientData[i].STAFF_EMAIL;
                        else
                            hccEmail += "," + mailRecipientData[i].STAFF_EMAIL;

                    }
                }
            }
            $('#REQUEST_OUTSIDE_MAIL_FORM').find('#RECEIVE_EMAIL').val(receiveEmail);
            $('#REQUEST_OUTSIDE_MAIL_FORM').find('#CC_EMAIL').val(hccEmail);

            if (mailFlag) {
                fnAlert(null, '메일 수신자 정보는 필수입니다.');
                return false;
            }

            let step1List = $outsideProcessRequestGrid.pqGrid('option', 'dataModel.data');
            // 메일 내용
            let a = CKEDITOR.instances.REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
            // 하단 그리드 테이블로 생성
            let b = createMailInnerTable('request', step1List);
            let c = a + b;
            $('#REQUEST_OUTSIDE_MAIL_FORM #REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);

            let STEP1LIST_LENGTH = step1List.length;
            // $('#REQUEST_OUTSIDE_MAIL_FORM #ROW_CNT').val(STEP1LIST_LENGTH);
            for (let i = 0; i < STEP1LIST_LENGTH; i++) {
                step1List[i].OUTSIDE_COMP_CD = outsideCompCd;
            }

            let step4List = $mailRecipientGrid.pqGrid('option', 'dataModel.data');
            let requestMailForm = fnFormToJsonArrayData('#REQUEST_OUTSIDE_MAIL_FORM'); //object
            let postData = {
                status: 'request',
                controlPartList: step1List, // 그리드
                mailReceiverList: step4List, // 수신처
                requestMailForm: requestMailForm // tbl_outside_request 저장용
            };
            let parameters = {'url': '/managerRequestOutside', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
                $('#REQUEST_OUTSIDE_POPUP').modal('hide');
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        }, 500));

        $('#REQUEST_OUTSIDE_MAIL_FORM #OUTSIDE_COMP_CD').on('change', function () {
            // 메일 수신처 가져오기
            getRequestOutsideMailDestination('REQUEST_OUTSIDE_MAIL_FORM');
        });

        $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #OUTSIDE_COMP_CD').on('change', function () {
            // 메일 수신처 가져오기
            getRequestOutsideMailDestination('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
        });
        /* 가공 요청*/

        /* 가공 취소 요청 */
        CKEDITOR.replace('CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 285});

        const cancelRequestOutsideConfirm = function () {
            let message =
                '<h4>\n' +
                '    <span>이미 가공이 진행되고 있을 수 있습니다. 반드시 해당업체 확인 후에 진행바랍니다. 취소 진행 및 메일발송을 진행하시겠습니까?</span>\n' +
                '</h4>';

            fnConfirm(null, message, function () {
                let mailFlag = true;
                let cancelMailRecipientData = $cancelMailRecipientGrid.pqGrid('option', 'dataModel.data');

                let receiveEmail = "";
                let hccEmail = "";
                for(let i in cancelMailRecipientData) {
                    if (cancelMailRecipientData.hasOwnProperty(i)) {
                        if (cancelMailRecipientData[i].RECEPTION === 'true') {
                            if (mailFlag) mailFlag = false;
                            if(!receiveEmail)
                                receiveEmail += cancelMailRecipientData[i].STAFF_EMAIL;
                            else
                                receiveEmail += "," + cancelMailRecipientData[i].STAFF_EMAIL;
                        }
                        if (cancelMailRecipientData[i].REFERENCE === 'true') {
                            if(!hccEmail)
                                hccEmail += cancelMailRecipientData[i].STAFF_EMAIL;
                            else
                                hccEmail += "," + cancelMailRecipientData[i].STAFF_EMAIL;
                        }
                    }
                }
                if (mailFlag) {
                    fnAlert(null, '메일 수신자 정보는 필수입니다.');
                    return false;
                }

                $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').find('#RECEIVE_EMAIL').val(receiveEmail);
                $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').find('#CC_EMAIL').val(hccEmail);

                let step1List = $cancelRequestOutsideGrid.pqGrid('option', 'dataModel.data');
                // 메일 내용
                let a = CKEDITOR.instances.CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
                // 하단 그리드 테이블로 생성
                let b = createMailInnerTable('cancel', step1List);
                let c = a + b;
                $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);

                let outsideCompCd = $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').find('#OUTSIDE_COMP_CD').val();

                let STEP1LIST_LENGTH = step1List.length;
                // $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #ROW_CNT').val(STEP1LIST_LENGTH);
                for (let i = 0; i < STEP1LIST_LENGTH; i++) {
                    step1List[i].OUTSIDE_COMP_CD = outsideCompCd;
                }

                let step4List = $cancelMailRecipientGrid.pqGrid('option', 'dataModel.data');
                let requestMailForm = fnFormToJsonArrayData('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM'); //object
                let postData = {
                    status: 'cancel',
                    controlPartList: step1List, // 그리드
                    mailReceiverList: step4List, // 수신처
                    requestMailForm: requestMailForm // tbl_outside_request 저장용
                };

                let parameters = {'url': '/managerRequestOutside', 'data': {data: JSON.stringify(postData)}};
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
                    $('#CANCEL_REQUEST_OUTSIDE_POPUP').modal('hide');
                    $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            });
            // let estimateRegisterSubmitConfirm = function (callback) {
            //     commonConfirmPopup.show();
            //     $("#commonConfirmYesBtn").unbind().click(function (e) {
            //         e.stopPropagation();
            //         commonConfirmPopup.hide();
            //         callback(true);
            //         return;
            //     });
            //     $(".commonConfirmCloseBtn").unbind().click(function (e) {
            //         e.stopPropagation();
            //         commonConfirmPopup.hide();
            //     });
            // };
            // estimateRegisterSubmitConfirm(function (confirm) {
            //     if (confirm) {
            //
            //     }
            // });
        };

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceProcessCompanyList'}
        });


        /* init */
    });
</script>