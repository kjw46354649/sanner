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
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value="">All</option>
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
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="">외주발주상태</label>
                            <select class="wd_200" name="" id="">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1031}">
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
                            <input reqcd="R" type="radio" name="OUTSIDE_MANAGE_TERM" id="OUTSIDE_CAL_TODAY" value="today" checked><label for="OUTSIDE_CAL_TODAY">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="OUTSIDE_MANAGE_TERM" id="OUTSIDE_CAL_CURRENT_MONTH" value="current_month"><label for="OUTSIDE_CAL_CURRENT_MONTH">현재월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="OUTSIDE_MANAGE_TERM" id="OUTSIDE_CAL_THREE_MONTHS" value="three_months"><label for="OUTSIDE_CAL_THREE_MONTHS">3개월</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="OUTSIDE_MANAGE_START_DATE" id="OUTSIDE_MANAGE_START_DATE"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="OUTSIDE_MANAGE_END_DATE" id="OUTSIDE_MANAGE_END_DATE" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>
                        </div>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업구분</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1013}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">품질현황</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1040}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box wd_200"><input id="option1" type="checkbox"><label for="option1"> 입고완료</label></span>
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
            <input type="hidden" name="GFILE_SEQ" id="GFILE_SEQ">
            <div style="display: grid; grid-template-columns: repeat(2, 1fr);  grid-template-rows: repeat(2, 1fr); gap: 20px; margin-bottom: 10px;">
                <div style="grid-column-start: 1; grid-column-end: 2; grid-row-start: 1; grid-row-end: 3;">
                    <div style="display: inline-block;">
                        <h5>메일내용</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <label for="">요청 외주 업체</label>
                        <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <option></option>
                        </select>
                    </div>
                    <div>
                        <textarea name="EMAIL_CONTENT_TXT" id="REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></textarea>
                    </div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 1; grid-row-end: 2;">
                    <div class="d-inline-block">
                        <h5>메일수신처</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn green" id="REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
                    </div>
                    <div id="REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 2; grid-row-end: 3;">
                    <h5>첨부파일</h5>
                    <div class="fileTableWrap">
                        <table class="colStyle" name="attachDragAndDrop" id="attachDragAndDrop1">
                            <caption></caption>
                            <thead>
                            <tr>
                                <th scope="col" class="fileName txt" style="width: 60%;">파일명</th>
                                <th scope="col" class="etcInfo" style="width: 20%;">용량</th>
                                <th scope="col" class="etcInfo" style="width: 20%;">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody class="files"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </form>
        <form class="form-inline" id="REQUEST_OUTSIDE_PROCESS_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="REQUEST_OUTSIDE_GRID"></div>
        </form>
        <div class="text-center">
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
            <input type="hidden" name="GFILE_SEQ" id="GFILE_SEQ">
            <div style="display: grid; grid-template-columns: repeat(2, 1fr);  grid-template-rows: repeat(2, 1fr); gap: 20px; margin-bottom: 10px;">
                <div style="grid-column-start: 1; grid-column-end: 2; grid-row-start: 1; grid-row-end: 3;">
                    <div style="display: inline-block;">
                        <h5>메일내용</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <label for="">요청 외주 업체</label>
                        <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <option></option>
                        </select>
                    </div>
                    <div>
                        <textarea name="EMAIL_CONTENT_TXT" id="CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT"></textarea>
                    </div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 1; grid-row-end: 2;">
                    <div class="d-inline-block">
                        <h5>메일수신처</h5>
                    </div>
                    <div class="d-inline-block right_float">
                        <button class="defaultBtn green" id="CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
                    </div>
                    <div id="CANCEL_REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>
                </div>
                <div style="grid-column-start: 2; grid-column-end: 3; grid-row-start: 2; grid-row-end: 3;">
                    <h5>첨부파일</h5>
                    <div class="fileTableWrap">
                        <table class="colStyle" name="attachDragAndDrop" id="attachDragAndDrop2">
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
                </div>
            </div>
        </form>
        <form class="form-inline" id="CANCEL_REQUEST_OUTSIDE_PROCESS_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="CANCEL_REQUEST_OUTSIDE_GRID"></div>
        </form>
        <div class="text-center">
            <button type="button" class="defaultBtn grayPopGra" name="CANCEL_REQUEST_OUTSIDE_POPUP_CLOSE">닫기</button>
        </div>
    </div>
</div>

<div class="popup_container" id="OUTSIDE_CLOSE_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3> 월 마감 진행(협력업체)</h3>
        <hr>
        <button type="button" class="pop_close" name="OUTSIDE_CLOSE_NO">닫기</button>
        <div class="buttonWrap">
            <form class="form-inline" id="OUTSIDE_CLOSE_LEFT_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseLeftList">
                <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
                <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <div class="leftbuttonWrap">
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
                <div id="OUTSIDE_CLOSE_LEFT_GRID"></div>
            </div>
            <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
            </div>
            <div style="width: 450px; float:left;">
                <div id="OUTSIDE_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>

        <div class="text-center">
            <button class="defaultBtn greenPopGra" id="OUTSIDE_CLOSE_YES">저장</button>
            <button class="defaultBtn grayPopGra" name="OUTSIDE_CLOSE_NO">닫기</button>
        </div>
    </div>
</div>

<form id="outsourcing_order_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectOutsourcingOrderExcel:selectOutsourcingOrderInfoExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data:info"/>
    <input type="hidden" id="paramName" name="paramName" value="OUTSIDE_ORDER_NUM:COMP_CD:ORDER_STAFF_SEQ:CONTROL_SEQ:CONTROL_DETAIL_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="outsourcing_order_template"/>
</form>

<script>
    $(function () {
        'use strict';
        /* variable */
        const OUTSOURCE_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        const dateEditor = function (ui) {
            let $inp = ui.$cell.find('input'), $grid = $(this);
            $inp.datepicker({
                changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yy-mm-dd',
                onSelect: function () { this.firstOpen = true; },
                beforeShow: function (input, inst) {return !this.firstOpen; },
                onClose: function () { this.focus(); }
            });
        };
        let selectedRowIndex = [];
        let $outsideOrderManageGrid;
        const gridId = 'OUTSIDE_ORDER_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM');
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: '담당자', dataType: 'integer', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '원발주<br>상태', dataType: 'string', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'OUTSIDE_STATUS', hidden: true},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'OUTSIDE_STATUS_NM'},
            {title: '상태변경<br>일시', width: 100, dataType: 'string', dataIndx: 'OUTSIDE_STATUS_DT'},
            {title: '외주업체', width: 70, dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable:true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: OUTSOURCE_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
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
            {title: '입고일자', width: 100, dataType: 'string', dataIndx: 'OUTSIDE_INNER_DT'},
            {title: '외주<br>발주번호', dataType: 'string', dataIndx: 'OUTSIDE_ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true},
            {title: '비고', width: 90, dataType: 'string', dataIndx: 'OUTSIDE_NOTE', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true},
            {title: '비고(주문)', width: 90, dataType: 'string', dataIndx: 'CONTROL_NOTE'},
            {title: '', minWidth: 30, width: 30, dataType: 'string', dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM) return '<span class="desktopIcon" style="cursor: pointer"></span>'
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
            {title: '관리번호', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '', minWidth: 30, width: 30, dataType: 'string', dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.DRAWING_NUM) return '<span class="eyeIcon" style="cursor: pointer"></span>'
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
            {title: '도면번호', width: 90, dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true},
            {title: '품명', width: 150, dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '규격', width: 70, dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '자재종류', width:70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면처리', width:90, dataType: 'string', dataIndx: 'SURFACE_TREAT_NM'},
            {title: '수량', dataType: 'integer', dataIndx: 'ITEM_QTY'},
            {title: '사급<br>여부', minWidth: 30, width: 40, dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '소재<br>제공', minWidth: 30, width: 40, dataType: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '요청 가공 사항', align: 'center', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true}
                ]
            },
            {title: '요망납기', width: 70, dataType: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true, editor: {type: 'textbox', init: dateEditor}},
            {title: '외주<br>확정단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true},
            {title: '금액<br>합계', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '외주<br>종전가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DHLWNWHDWJSRK'},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', width: 70, datatype: 'string', dataIndx: 'INNER_DUE_DT'},
                    {title: '공급단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
                    {title: '발주처', datatype: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
                    {title: '발주처', width: 70, datatype: 'string', dataIndx: 'ORDER_COMP_NM'}
                ]
            },
            {
                title: '품질결과', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'string', dataIndx: 'Seq.'},
                    {title: '결과', datatype: 'string', dataIndx: 'RUFRHK'},
                    {title: '불량코드', datatype: 'string', dataIndx: 'QNFFIDZHEM'},
                    {title: '측정일시', datatype: 'string', dataIndx: 'CMRWJDDLFTL'}
                ]
            },
            {title: '원주문<br>확정 일시', width: 130, datatype: 'string', dataIndx: 'CONTROL_STATUS_DT'},
            {title: '외주가공<br>요청일시', width: 130, dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DT'},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT'}
        ];
        const obj = {
            minHeight: '100%',
            height: 700,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
            colModel: colModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData,
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                let data = $outsideOrderManageGrid.pqGrid('option', 'dataModel.data');

                $('#OUTSIDE_ORDER_MANAGE_RECORDS').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) selectedRowIndex[0] = firstRow;
                    else for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
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
            {title: '', dataType: 'string', dataIndx: 'STAFF_SEQ', hidden: true},
            {title: '성함', dataType: 'string', dataIndx: 'STAFF_NM'},
            {title: '메일주소', dataType: 'string', dataIndx: 'STAFF_EMAIL'},
            {title: '전화번호', dataType: 'string', dataIndx: 'STAFF_TEL'}
        ];
        const mailRecipientObj = {
            height: 175,
            collapsible: false,
            resizable: false,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: mailRecipientColModel,
            toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.selectCompanyStaffEmailList', 'COMP_CD': ''}, // TODO: COMP_CD 변수
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $outsideProcessRequestGrid;
        const outsideProcessRequestGridId = 'REQUEST_OUTSIDE_GRID';
        const outsideProcessRequestColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: 'Part', align: 'right', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '규격', minWidth: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '자재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
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
            {title: '표면<br>처리', minWidth: 70, dataType: 'string', dataIndx: 'SURFACE_TREAT',
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
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '소재<br>제공', dataType: 'bool', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    console.log(cellData);

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '요청가공', align: 'center', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면<br>처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true}
                ]
            },
            {title: '요망<br>납기', datatype: 'date', dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true, editor: {type: 'textbox', init: dateEditor}},
            {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true},
        ];
        const outsideProcessRequestObj = {
            height: 200,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: outsideProcessRequestColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                recIndx: 'ROW_NUM',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
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
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: mailRecipientColModel,
            toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.selectCompanyStaffEmailList', 'COMP_CD': ''},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $cancelRequestOutsideGrid;
        const cancelRequestOutsideGridId = 'CANCEL_REQUEST_OUTSIDE_GRID';
        const cancelRequestOutsideColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: 'Part', align: 'right', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '규격', minWidth: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '자재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
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
            {title: '표면<br>처리', minWidth: 70, dataType: 'string', dataIndx: 'SURFACE_TREAT',
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
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '소재<br>제공', dataType: 'bool', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    console.log(cellData);

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '요청가공', align: 'center', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면<br>처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true}
                ]
            },
            {title: '요망<br>납기', datatype: 'date', dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true, editor: {type: 'textbox', init: dateEditor}},
            {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE', styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': '#ffffff'}, editable: true},
        ];
        const cancelRequestOutsideObj = {
            height: 200,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: outsideProcessRequestColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                recIndx: 'ROW_NUM',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $outsideCloseLeftGrid;
        const outsideCloseLeftGridId = 'OUTSIDE_CLOSE_LEFT_GRID';
        // let outsideCloseLeftPostData;
        const outsideCloseLeftColModel = [
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '대상업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '대상업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '발주가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'}, // 2020-06-08
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'}
        ];
        const outsideCloseLeftObj = {
            height: 250,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: outsideCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {return {data: dataJSON.data};}
            }
        };
        let $outsideCloseRightGrid;
        const outsideCloseRightGridId = 'OUTSIDE_CLOSE_RIGHT_GRID';
        const outsideCloseRightColModel = [
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '발주가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'}
        ];
        const outsideCloseRightObj = {
            height: 250,
            collapsible: false,
            resizable: false,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: outsideCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {return {data: dataJSON.data};}
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
            let coCompCdList = [];
            let controlDetailSeqStr = '';
            let coCompCdStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlDetailSeqList.push(rowData.CONTROL_DETAIL_SEQ);
                coCompCdList.push(rowData.OUTSIDE_COMP_CD);
            }
            // 중복제거
            coCompCdList = coCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            for (let i = 0; i < controlDetailSeqList.length; i++) {
                controlDetailSeqStr += controlDetailSeqList[i];

                if (i < controlDetailSeqList.length - 1) {
                    controlDetailSeqStr += ',';
                }
            }
            for (let i = 0; i < coCompCdList.length; i++) {
                coCompCdStr += '\'' + coCompCdList[i] + '\'';

                if (i < coCompCdList.length - 1) {
                    coCompCdStr += ',';
                }
            }

            $('#OUTSIDE_CLOSE_LEFT_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);
            $('#OUTSIDE_CLOSE_LEFT_FORM > #OUTSIDE_COMP_CD').val(coCompCdStr);

            $outsideCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#OUTSIDE_CLOSE_LEFT_FORM'));
            });
            $outsideCloseLeftGrid.pqGrid('refreshDataAndView');

            let controlCloseRightPostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_LEFT_FORM')
            controlCloseRightPostData.queryId = 'selectOutsideCloseRightList';
            let parameters = {'url': '/paramQueryGridSelect', 'data': controlCloseRightPostData}

            fnPostAjax(function (data, callFunctionParam) {
                $outsideCloseRightGrid.pqGrid('option', 'dataModel.data', data.data);
                $outsideCloseRightGrid.pqGrid('refreshView');
            }, parameters, '');
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                alert('하나 이상 선택해주세요');
                return true;
            }
        };

        const changeDate = function (newDate = new Date(), today = new Date()) {
            $('#OUTSIDE_MANAGE_START_DATE').val(newDate.yyyymmdd());
            $('#OUTSIDE_MANAGE_END_DATE').val(today.yyyymmdd());
        };

        const asdfasdf = function (mailFormElement, status) {
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
            compCdList = compCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            outsideCompCdList = outsideCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (compCdList.length > 1) {
                alert('선택된 대상들의 발주사는 동일해야 합니다.');
                return true;
            }
            if (outsideCompCdList.length > 1) {
                alert('선택된 대상들의 협력업체는 동일해야 합니다.');
                return true;
            }
            console.log(outsideStatusList);
            if (outsideStatusList.length > 1) {
                alert('상태가 일치 하지 않음');
                return true;
            }

            if (outsideStatusList[0] === 'OST001' && outsideStatusList[0] === status) {
                alert('이미 발송된 요청입니다.');
                return true;
            }

            if (outsideStatusList[0] === 'OST002' && outsideStatusList[0] === status) {
                alert('이미 발송된 요청입니다.');
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
            outsideCompCdList = outsideCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            console.log($('#' + mailFormElement + ' #OUTSIDE_COMP_CD').val());
            console.log(outsideCompCdList[0]);
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

        let makeMailInnerTable = function (list) {
            let table = '';
            let font_header = 'background:lightgray; font-weight:600;';
            let st_center = 'border:1px solid #d0d0d0; text-align:center;';

            table +=
                '<table style="border-spacing: 0;">\n' +
                    '<thead>\n' +
                    '    <tr>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">No.</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">관리번호</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">도면번호</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">Part</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">규격</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">자재<br>종류</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">표면<br>처리</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">소재<br>제공</th>\n' +
                    '        <th colspan="5" style="' + st_center + font_header + '">요청가공</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">요망<br>납기</th>\n' +
                    '        <th rowspan="2" style="' + st_center + font_header + '">비고</th>\n' +
                    '    </tr>\n' +
                    '    <tr>\n' +
                    '        <th style="' + st_center + font_header + '">완제품</th>\n' +
                    '        <th style="' + st_center + font_header + '">가공</th>\n' +
                    '        <th style="' + st_center + font_header + '">연마</th>\n' +
                    '        <th style="' + st_center + font_header + '">표면<br>처리</th>\n' +
                    '        <th style="' + st_center + font_header + '">기타사항</th>\n' +
                    '    </tr>\n' +
                    '</thead>\n' +
                    '<tbody>\n';

            for (let i = 0, LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                let outsideMaterialSupplyYnChecked = list[i].OUTSIDE_MATERIAL_SUPPLY_YN === 'Y' ? 'checked' : '';
                let outsideRequestFinishYnChecked = list[i].OUTSIDE_REQUEST_FINISH_YN === 'Y' ? 'checked' : '';
                let outsideRequestProcessYnChecked = list[i].OUTSIDE_REQUEST_PROCESS_YN === 'Y' ? 'checked' : '';
                let outsideRequestGrindYnChecked = list[i].OUTSIDE_REQUEST_GRIND_YN === 'Y' ? 'checked' : '';
                let outsideRequestSurfaceYnChecked = list[i].OUTSIDE_REQUEST_SURFACE_YN === 'Y' ? 'checked' : '';

                table +=
                '    <tr>\n' +
                '        <td style="' + st_center + '">' + list[i].ROW_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].CONTROL_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].DRAWING_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].PART_NUM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].SIZE_TXT + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].MATERIAL_DETAIL_NM + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].SURFACE_TREAT_NM + '</td>\n' +
                '        <td style="' + st_center + '"><input type="checkbox" value="' + list[i].OUTSIDE_MATERIAL_SUPPLY_YN + '" ' + outsideMaterialSupplyYnChecked + '></td>\n' +
                '        <td style="' + st_center + '"><input type="checkbox" value="' + list[i].OUTSIDE_REQUEST_FINISH_YN + '" ' + outsideRequestFinishYnChecked + '></td>\n' +
                '        <td style="' + st_center + '"><input type="checkbox" value="' + list[i].OUTSIDE_REQUEST_PROCESS_YN + '" ' + outsideRequestProcessYnChecked + '></td>\n' +
                '        <td style="' + st_center + '"><input type="checkbox" value="' + list[i].OUTSIDE_REQUEST_GRIND_YN + '" ' + outsideRequestGrindYnChecked + '></td>\n' +
                '        <td style="' + st_center + '"><input type="checkbox" value="' + list[i].OUTSIDE_REQUEST_SURFACE_YN + '" ' + outsideRequestSurfaceYnChecked + '></td>\n' +
                '        <td style="' + st_center + '">' + list[i].OUTSIDE_REQUEST_ETC + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].OUTSIDE_HOPE_DUE_DT + '</td>\n' +
                '        <td style="' + st_center + '">' + list[i].OUTSIDE_NOTE + '</td>\n' +
                '    </tr>\n';
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
                if (asdfasdf('REQUEST_OUTSIDE_MAIL_FORM', 'OST001')) {
                    return false;
                }

                clearMailForm(event.currentTarget);
                // 첨부파일 Element 초기화
                clearMailFileAttachPopup($('#attachDragAndDrop1'),getCadUploadBlankHtml());
                // 그리드 생성
                $mailRecipientGrid = $('#' + mailRecipientGridId).pqGrid(mailRecipientObj);
                $outsideProcessRequestGrid = $('#' + outsideProcessRequestGridId).pqGrid(outsideProcessRequestObj);
                // 요청 외주 업체 선택
                selectOutsideCompCd('REQUEST_OUTSIDE_MAIL_FORM');
                // 메일 수신처 가져오기
                getRequestOutsideMailDestination('REQUEST_OUTSIDE_MAIL_FORM');
                // 메일 템플릿 가져오기
                getRequestOutsideMailContent('REQUEST_OUTSIDE_MAIL_FORM', 'REQUEST_OUTSIDE_EMAIL_CONTENT_TXT');
                // 하단 그리드 데이터 가져오기
                loadOutsideProcessData('REQUEST_OUTSIDE_PROCESS_FORM');
            },
            'hide.bs.modal': function () {
                $mailRecipientGrid.pqGrid('destroy');
                $outsideProcessRequestGrid.pqGrid('destroy');
            }
        });

        $('#CANCEL_REQUEST_OUTSIDE_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }
                if (asdfasdf('CANCEL_REQUEST_OUTSIDE_MAIL_FORM', 'OST002')) {
                    return false;
                }

                clearMailForm(event.currentTarget);
                // 첨부파일 Element 초기화
                clearMailFileAttachPopup($('#attachDragAndDrop2'),getCadUploadBlankHtml());
                // 그리드 생성
                $cancelMailRecipientGrid = $('#' + cancelMailRecipientGridId).pqGrid(cancelMailRecipientObj);
                $cancelRequestOutsideGrid = $('#' + cancelRequestOutsideGridId).pqGrid(cancelRequestOutsideObj);
                // 요청 외주 업체 선택
                selectOutsideCompCd('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
                // 메일 수신처 가져오기
                getRequestOutsideMailDestination('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
                // 메일 템플릿 가져오기
                getRequestOutsideMailContent('CANCEL_REQUEST_OUTSIDE_MAIL_FORM', 'CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT');
                // 하단 그리드 데이터 가져오기
                loadOutsideProcessData('CANCEL_REQUEST_OUTSIDE_PROCESS_FORM');
            },
            'hide.bs.modal': function () {
                $cancelMailRecipientGrid.pqGrid('destroy');
                $cancelRequestOutsideGrid.pqGrid('destroy');
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

            let controlSeqStr = '';
            let controlDetailSeqStr = '';
            let outsideOrderNumStr = '';
            let orderStaffSeqStr = '';
            let controlSeqList = [];
            let controlDetailSeqList = [];
            let orderCompCdList = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                console.log(rowData)
                orderCompCdList.push(rowData.OUTSIDE_COMP_CD);
                controlSeqList.push(rowData.CONTROL_SEQ);
                controlDetailSeqList.push(rowData.CONTROL_DETAIL_SEQ);
                outsideOrderNumStr = rowData.OUTSIDE_ORDER_NUM;
                orderStaffSeqStr = rowData.ORDER_STAFF_SEQ;
            }
            console.log(controlSeqList);
            console.log(controlDetailSeqList);
            // 중복제거
            controlSeqList = controlSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            controlDetailSeqList = controlDetailSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (orderCompCdList.length > 1) {
                alert('선택된 대상들의 외주업체는 반드시 동일해야함');
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
            $('#outsourcing_order_excel_download #paramData').val(outsideOrderNumStr + ':' + orderCompCdList[0] + ':' + orderStaffSeqStr + ':' + controlSeqStr + ':' + controlDetailSeqStr);

            fnReportFormToHiddenFormPageAction('outsourcing_order_excel_download', '/downloadExcel');
        });

        $('#OUTSIDE_CLOSE_POPUP').on({
            'show.bs.modal': function () {
                let selectedRowCount = selectedRowIndex.length;
                let outsideCompCdList = [];

                for (let i = 0; i < selectedRowCount; i++) {
                    let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
                }
                // 중복제거
                outsideCompCdList = outsideCompCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });

                if (outsideCompCdList.length === 0 || outsideCompCdList[0] === undefined) {
                    alert('외주업체가 없습니다!');
                    return false;
                }

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

        $('#OUTSIDE_CLOSE_LEFT_FORM').on('change', function () {
            loadOutsideCloseData();
        });

        $('#OUTSIDE_CLOSE_YES').on('click', function () {
            let selectedRowCount = selectedRowIndex.length;
            let list = [];

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                rowData.CLOSE_VER = $('#CLOSE_VER').val();
                rowData.CLOSE_MONTH = $('#OUTSIDE_CLOSE_POP_YEAR').val() + $('#OUTSIDE_CLOSE_POP_MONTH').val();
                list.push(rowData);
            }

            let parameters = {'url': '/createOutsideClose', 'data': {data: JSON.stringify(list)}};
            fnPostAjax(function (data, callFunctionParam) {
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                // $outsideCloseLeftGrid.pqGrid('refreshDataAndView');
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
            const updateQueryList = ['orderMapper.updateControlPart'];

            fnModifyPQGrid($outsideOrderManageGrid, [], updateQueryList);
        });

        $('#OUTSIDE_ORDER_MANAGE_DELETE').on('click', function () {
            let list = [];
            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
            }

            let parameters = {'url': '/modifyOutsideOrder', 'data': {data: JSON.stringify(list)}};

            fnPostAjax(function (data) {
                alert("<spring:message code='com.alert.default.remove.success' />");
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
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
        /* event */

        /* init */
        $('#OUTSIDE_MANAGE_START_DATE').datepicker();
        $('#OUTSIDE_MANAGE_END_DATE').datepicker();
        $('#OUTSIDE_MANAGE_START_DATE').datepicker('setDate', 'today');
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
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });

        $outsideOrderManageGrid = $('#' + gridId).pqGrid(obj);

        /* 견적 요청*/
        // CKEDITOR 부분
        CKEDITOR.replace('REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 285});

        const outsideRequestSave = function () {
            const updateQueryList = ['outMapper.updateControlPart'];

            fnModifyPQGrid($outsideProcessRequestGrid, [], updateQueryList);
        };

        const outsideRequestSendEmail = function (mailFormElement) {
            let list = $outsideProcessRequestGrid.pqGrid('option', 'dataModel.data');
            let a = CKEDITOR.instances.REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
            let b = makeMailInnerTable(list);
            let c = a + b;
            $('#REQUEST_OUTSIDE_MAIL_FORM > #queryId').val('mail.insertOutsideRequestSubmitMail');
            $('#REQUEST_OUTSIDE_MAIL_FORM #REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);
            let parameters = {'url': '/json-create', 'data': $('#REQUEST_OUTSIDE_MAIL_FORM').serialize()};
            console.log(parameters);
            fnPostAjax(function (data, callFunctionParam) {
                alert("<spring:message code='com.alert.default.save.success' />");
            }, parameters, '');
        };

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CANCEL_REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });

        $('#REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', function (){
            // // 메일 전송 부분
            let step1List = $outsideProcessRequestGrid.pqGrid('option', 'dataModel.data');
            let a = CKEDITOR.instances.REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
            let b = makeMailInnerTable(step1List);
            let c = a + b;
            // $('#REQUEST_OUTSIDE_MAIL_FORM > #queryId').val('mail.insertOutsideRequestSubmitMail');
            $('#REQUEST_OUTSIDE_MAIL_FORM #REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);
            //
            let outsideCompCd = $('#REQUEST_OUTSIDE_MAIL_FORM').find('#OUTSIDE_COMP_CD').val();
            for (let i = 0, STEP1LIST_LENGTH = step1List.length; i < STEP1LIST_LENGTH; i++) {
                step1List[i].OUTSIDE_COMP_CD = outsideCompCd;
            }
            let step4List = $mailRecipientGrid.pqGrid('option', 'dataModel.data');
            // REQUEST_OUTSIDE_MAIL_FORM
            let requestMailForm = fnFormToJsonArrayData('#REQUEST_OUTSIDE_MAIL_FORM'); //object
            let postData = {
                controlPartList: step1List, // 그리드
                mailReceiverList: step4List, // 수신처
                requestMailForm: requestMailForm // tbl_outside_request 저장용
            };

            let parameters = {'url': '/managerRequestOutside', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                alert("<spring:message code='com.alert.default.save.success' />");
                $('#REQUEST_OUTSIDE_POPUP').modal('hide');
            }, parameters, '');

            // outsideRequestSave();
            // outsideRequestSendEmail();
            // $('#REQUEST_OUTSIDE_POPUP').modal('hide');
            // outsideRequestConfirm();
        });

        $('#REQUEST_OUTSIDE_MAIL_FORM').on('change', function () {
            // 메일 수신처 가져오기
            getRequestOutsideMailDestination('REQUEST_OUTSIDE_MAIL_FORM');
        });

        $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').on('change', function () {
            // 메일 수신처 가져오기
            getRequestOutsideMailDestination('CANCEL_REQUEST_OUTSIDE_MAIL_FORM');
        });
        /* 가공 요청*/

        /* 가공 취소 요청 */
        CKEDITOR.replace('CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 285});

        const cancelRequestOutsideConfirm = function () {
            let headHtml = 'messsage', bodyHtml = '', yseBtn = '예', noBtn = '아니오';

            bodyHtml =
                '<h4>\n' +
                '    <span>이미 가공이 진행되고 있을 수 있습니다. 반드시 해당업체 확인 후에 진행바랍니다. 취소 진행 및 메일발송을 진행하시겠습니까?</span>\n' +
                '</h4>';

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let estimateRegisterSubmitConfirm = function (callback) {
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
            estimateRegisterSubmitConfirm(function (confirm) {
                if (confirm) {
                    let step1List = $cancelRequestOutsideGrid.pqGrid('option', 'dataModel.data');
                    let a = CKEDITOR.instances.CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
                    let b = makeMailInnerTable(step1List);
                    let c = a + b;
                    // $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM > #queryId').val('mail.insertOutsideRequestSubmitMail');
                    $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);
                    //
                    let outsideCompCd = $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').find('#OUTSIDE_COMP_CD').val();
                    for (let i = 0, STEP1LIST_LENGTH = step1List.length; i < STEP1LIST_LENGTH; i++) {
                        step1List[i].OUTSIDE_COMP_CD = outsideCompCd;
                    }
                    let step4List = $cancelMailRecipientGrid.pqGrid('option', 'dataModel.data');
                    // CANCEL_REQUEST_OUTSIDE_MAIL_FORM
                    let requestMailForm = fnFormToJsonArrayData('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM'); //object
                    let postData = {
                        controlPartList: step1List, // 그리드
                        mailReceiverList: step4List, // 수신처
                        requestMailForm: requestMailForm // tbl_outside_request 저장용
                    };

                    let parameters = {'url': '/managerRequestOutside', 'data': {data: JSON.stringify(postData)}};
                    fnPostAjax(function (data, callFunctionParam) {
                        alert("<spring:message code='com.alert.default.save.success' />");
                        $('#CANCEL_REQUEST_OUTSIDE_POPUP').modal('hide');
                    }, parameters, '');
                }
            });
        };

        const cancelRequestOutsideSave = function () {
            const updateQueryList = ['outMapper.updateOutsideProcessRequest'];

            fnModifyPQGrid($cancelRequestOutsideGrid, [], updateQueryList);
        };

        const cancelRequestOutsideSendEmail = function () {
            let list = $cancelRequestOutsideGrid.pqGrid('option', 'dataModel.data');
            let a = CKEDITOR.instances.CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
            let b = makeMailInnerTable(list);
            let c = a + b;
            $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM > #queryId').val('mail.insertOutsideRequestSubmitMail');
            $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT').val(c);
            let parameters = {'url': '/json-create', 'data': $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM').serialize()};
            fnPostAjax(function (data, callFunctionParam) {
                alert("<spring:message code='com.alert.default.save.success' />");
            }, parameters, '');
        };

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });

        $('#CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', function (){
            cancelRequestOutsideConfirm();
        });
        /* 가공 취소 요청 */


        /* 메일 드래그앤드랍 */
        /** drag & drop file Attach */
        // 임시 비활성화
       /* let uploadFiles = [];

        let $attachDragAndDrop = $('[name=attachDragAndDrop]');
        $attachDragAndDrop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
            $(this).addClass('drag-over');
        }).on("dragleave", function(e) {  //드래그 요소가 나갔을때
            $(this).removeClass('drag-over');
        }).on("dragover", function(e) {
            e.stopPropagation();
            e.preventDefault();
        }).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
            e.preventDefault();
            $(this).removeClass('drag-over');
            let files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
            for(let i = 0; i < files.length; i++) {
                let file = files[i];
                uploadFiles.push(file); //업로드 목록에 추가
            }
            if (uploadFiles.length > 0) { // file upload
                let formData = new FormData();
                $.each(uploadFiles, function(i, file) {
                    if(file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
                        formData.append('file', file, file.name);
                });
                formData.append('queryId', $('#common_cad_file_attach_form').find("#queryId").val() + "_select");
                formData.append('GFILE_SEQ', '');
                uploadFiles = [];    // 파일 업로드 정보 초기화
                fnFormDataFileUploadAjax(function (data) {
                    let fileUploadList = data.fileUploadList;
                    // 메일폼을 찾아서 GFILE_SEQ를 대입한다
                    $(e.currentTarget).closest('[id$=REQUEST_OUTSIDE_MAIL_FORM]').children('#GFILE_SEQ').val(data.GFILE_SEQ);

                    if (!(fileUploadList === undefined) && !(fileUploadList === null)) {
                        let fileHtml = '';
                        $.each(fileUploadList, function (index, file) {
                            let sizeHtml = fn_getFileSize(file.FILE_SIZE);
                            fileHtml = fileHtml +
                                '<tr>' +
                                '   <td scope="col" class="fileName">'+file.ORGINAL_FILE_NM+'</td>' +
                                '   <td scope="col" class="etcInfo">'+sizeHtml+'</td>' +
                                '   <td scope="col" class="etcInfo">' +
                                '       <button type="button" class="smallBtn red"><i class="fa fa-trash"></i><span id="spanFileUploadDelete" gfileSeq="'+file.DXF_GFILE_SEQ+'"> Delete </span></button>'+
                                '   </td>' +
                                '</tr>';
                        });
                        clearMailFileAttachPopup(e.currentTarget, fileHtml);
                    }
                }, formData, '');
            }
        });*/
        /* 메일 드래그앤드랍 */

        /* init */
    });
</script>