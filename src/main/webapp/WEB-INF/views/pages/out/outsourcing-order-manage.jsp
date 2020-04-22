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
        <form class="form-inline" id="OUTSIDE_ORDER_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideOrderManageList">
            <div class="gubunWrap">
                <div class="form-group1">
                    <div class="group-item">
                        <label for="COMP_CD">사업자</label>
                        <select name="COMP_CD" id="COMP_CD">
                            <option value="">All</option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="ORDER_COMP_CD">발주사</label>
                        <select name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                            <option value="">All</option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="DRAWING_NUM">도면번호</label>
                        <input type="text" name="DRAWING_NUM" id="DRAWING_NUM">
                    </div>
                    <div class="group-item">
                        <label for="ITEM_NM">품명</label>
                        <input type="text" name="ITEM_NM" id="ITEM_NM">
                    </div>
                    <div class="group-item">
                        <label for="CONTROL_NUM">관리번호</label>
                        <input type="text" name="CONTROL_NUM" id="CONTROL_NUM">
                    </div>
                    <div class="group-item">
                        <label for="MODULE_NM">모듈명</label>
                        <input type="text" name="MODULE_NM" id="MODULE_NM">
                    </div>
                    <div class="group-item">
                        <label for="OUTSIDE_COMP_CD">외주업체</label>
                        <select name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <option value="">All</option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="">외주발주상태</label>
                        <select name="" id="">
                            <option value="">All</option>
                            <c:forEach var="code" items="${HighCode.H_1031}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="dateWrap">
                        <div class="leftSpan">
                            <span class="slt_wrap">
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
                                <span class="chk_box no_txt"><input id="pr_ex" type="checkbox"><label for="pr_ex">선택</label></span>
                            </div>
                        </div>
                        <div class="group-item">
                            <label for="WORK_TYPE">작업구분</label>
                            <select name="WORK_TYPE" id="WORK_TYPE">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1013}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="group-item">
                            <label for="WORK_TYPE">품질현황</label>
                            <select name="WORK_TYPE" id="WORK_TYPE">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1040}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="group-item-option">
                        <label>Option</label>
                    </div>
                    <div class="chk_box_area">
                        <input type="checkbox" id="option1"><label for="option1">입고완료</label>
                    </div>
                    <div class="group-item">
                        <label for="AMOUNT_SUM">금액총합계</label>
                        <input type="text" id="AMOUNT_SUM" readonly>
                    </div>
                    <button type="button" class="search_btn" id="OUTSIDE_SEARCH">검색</button>
                </div>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="defaultBtn" data-toggle="modal" data-target="#REQUEST_OUTSIDE_POPUP">
                        외주가공
                        요청
                    </button>
                    <button type="button" class="defaultBtn" data-toggle="modal" data-target="#CANCEL_PROCESSING_REQUEST_POPUP">
                        가공요청 취소
                    </button>
                    <button type="button" class="defaultBtn" id="ORDER_EXTRACTION">발주서 추출</button>
                    <button type="button" class="defaultBtn" data-toggle="modal" data-target="#OUTSIDE_CLOSE_POPUP">외주마감
                    </button>
                </div>
                <div class="col-md-6 ta-r">
                    <button type="button" class="defaultBtn grayGra" id="DRAWING_VIEW">도면 View</button>
                    <button type="button" class="defaultBtn blueGra" id="OUTSIDE_ORDER_MANAGE_SAVE">Save</button>
                    <button type="button" class="defaultBtn yelllowGra" id="OUTSIDE_ORDER_MANAGE_DELETE">Delete</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conMainWrap">
                <div id="OUTSIDE_ORDER_MANAGE_GRID"></div>
            </div>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="modal" id="REQUEST_OUTSIDE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row m-b-md">
                <div class="col-sm-12">
                    <section class="panel panel-default">
                        <header class="panel-heading font-bold">
                            외주 가공 요청
                            <div class="btnSaveCloseBox">
                                <div type="button" class="btn btn-success btn-sm btn-default" id="OUTSIDE_PROCESS_REQUEST_SAVE">
                                    Save & Submit
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <form class="form-inline" id="OUTSIDE_PROCESS_REQUEST_FORM" role="form">
                                <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
                                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
                                <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
                                <div class="panel-body line_tit portlet-body form bg-light">
                                    <!-- grid table -->
                                    <section class="bg-light">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <strong>메일 내용</strong>
                                                    </header>
                                                    <div class="row">
                                                        <div class="gridWrap">
                                                            <textarea class="col-md-12 col-sm-12" id="EMAIL_CONTENT" name="EMAIL_CONTENT"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="bg-light">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <div class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <strong>메일 수신처</strong>
                                                    </header>
                                                    <div class="gridWrap">
                                                        <div id="MAIL_RECIPIENT_GRID"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <strong>첨부파일</strong>
                                                    </header>
                                                    <div class="gridWrap">
                                                        <input type="file">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="bg-light">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="OUTSIDE_REQUEST_GRID"></div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="modal" id="CANCEL_PROCESSING_REQUEST_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">외주가공 요청</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label for="SUBCONTRACTOR_REQUESTED">요청 외주업체</label>
                        <select name="" id="SUBCONTRACTOR_REQUESTED">

                        </select>
                        <textarea></textarea>
                    </div>
                    <div class="col-md-6">
                        <div id="MAIL_GRID"></div>
                        <div class="dropfile visible-lg">
                            <small>Drag and Drop file here</small>
                        </div>
                    </div>
                </div>
                <div id="ORDER_REGISTER_GRID"></div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="modal" id="OUTSIDE_CLOSE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">월 마감 진행(외주주문)</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5">
                        <div id="OUTSIDE_CLOSE_LEFT_GRID"></div>
                    </div>
                    <div class="col-md-2">
                        화살표~>
                    </div>
                    <div class="col-md-5">
                        <div id="OUTSIDE_CLOSE_RIGHT_GRID"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <form class="form-inline" id="OUTSIDE_CLOSE_LEFT_FORM" role="form">
                            <input type="hidden" name="queryId" id="queryId" value="selectOutsideCloseLeftList">
                            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
                            <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label class="control-label">대상 년/월</label>
                                </div>
                                <div class="col-md-5">
                                    <select name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR">
                                        <option></option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH">
                                        <option></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-6">
                                    <label for="CLOSE_VER">차수</label>
                                </div>
                                <div class="col-md-6">
                                    <select name="CLOSE_VER" id="CLOSE_VER">
                                        <option value="1">
                                            1차
                                        </option>
                                        <option value="2">
                                            2차
                                        </option>
                                        <option value="3">
                                            3차
                                        </option>
                                        <option value="4">
                                            4차
                                        </option>
                                    </select>
                                </div>
                            </div>
                    </div>
                    </form>
                    <div class="col-md-6">
                        <b>진행 하시겠습니까?</b>
                        <div class="text-right">
                            <button id="OUTSIDE_CLOSE_YES">Yes</button>
                            <button id="OUTSIDE_CLOSE_NO">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>

<form id="outsourcing_order_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectOutsourcingOrderExcel:selectOutsourcingOrderInfoExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data:info"/>
    <input type="hidden" id="paramName" name="paramName" value="OUTSIDE_ORDER_NUM:COMP_CD:ORDER_STAFF_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="outsourcing_order_template"/>
</form>

<script>
    $(function () {
        'use strict';
        /* variable */
        let selectedRowIndex = [];
        let $outsideOrderManageGrid;
        const gridId = 'OUTSIDE_ORDER_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM');
        const colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {
                title: 'CONTROL_DETAIL_SEQ',
                dataType: 'integer',
                dataIndx: 'CONTROL_DETAIL_SEQ',
                hidden: true,
                colModel: []
            },
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true, colModel: []},
            {
                title: 'OUTSIDE_REQUEST_SEQ',
                dataType: 'integer',
                dataIndx: 'OUTSIDE_REQUEST_SEQ',
                hidden: true,
                colModel: []
            },
            {title: '담당자', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', hidden: true, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '원발주<br>상태', dataType: 'string', dataIndx: 'CONTROL_STATUS_NM', colModel: []},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'OUTSIDE_STATUS', hidden: true, colModel: []},
            {title: '상태변경<br>일시', dataType: 'string', dataIndx: 'OUTSIDE_STATUS_DT', colModel: []},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true, colModel: []},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', colModel: []},
            {title: '입고일자', dataType: 'string', dataIndx: 'DLQRHDLFWK', colModel: []},
            {title: '외주<br>발주번호', dataType: 'string', dataIndx: 'OUTSIDE_ORDER_NUM', editable: true, colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'OUTSIDE_NOTE', editable: true, colModel: []},
            {title: '비고(주문)', dataType: 'select', dataIndx: 'NOTE', colModel: []},
            {title: '', dataType: 'select', dataIndx: 'RHKSFLQJSGH', colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true, colModel: []},
            {title: '', dataType: 'string', dataIndx: 'EHAUSQJSGH', colModel: []},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true, colModel: []},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true, colModel: []},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '자재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', editable: true, colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', editable: true, colModel: []},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
            {title: '사급<br>여부', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', colModel: []},
            {title: '소재<br>제공', dataType: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', colModel: []},
            {
                title: '요청 가공 사항', align: 'center', colModel: [
                    {title: '완제품', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', editable: true},
                    {title: '가공', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', editable: true},
                    {title: '연마', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', editable: true},
                    {title: '표면처리', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', editable: true},
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', editable: true}
                ]
            },
            {title: '요망납기', dataType: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT', editable: true, colModel: []},
            {title: '외주<br>확정단가', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT', colModel: []},
            {title: '금액<br>합계', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {title: '외주<br>종전가', dataType: 'string', dataIndx: 'DHLWNWHDWJSRK', colModel: []},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', datatype: 'string', dataIndx: 'INNER_DUE_DT'},
                    {title: '공급단가', datatype: 'string', dataIndx: 'UNIT_FINAL_AMT'},
                    {title: '발주처', datatype: 'string', dataIndx: 'ORDER_COMP_CD'},
                    {title: '발주처', datatype: 'string', dataIndx: 'ORDER_COMP_NM'}
                ]
            },
            {
                title: '품질결과', align: 'center', hidden: true, colModel: [
                    {title: 'Seq.', datatype: 'string', dataIndx: 'Seq.'},
                    {title: '결과', datatype: 'string', dataIndx: 'RUFRHK'},
                    {title: '불량코드', datatype: 'string', dataIndx: 'QNFFIDZHEM'},
                    {title: '측정일시', datatype: 'string', dataIndx: 'CMRWJDDLFTL'}
                ]
            },
            {title: '원주문<br>확정 일시', datatype: 'string', dataIndx: 'CONTROL_STATUS_DATE', colModel: []},
            {title: '외주가공<br>요청일시.', dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DATE', colModel: []},
            {title: '외주가공<br>마감일시', dataType: 'string', dataIndx: 'OUTSIDE_FINISH_DATE', colModel: []},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT', colModel: []}
        ];
        const obj = {
            // height: 600,
            collapsible: false,
            resizable: true,
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
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) selectedRowIndex[0] = firstRow;
                    else for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            }
        };
        let $mailRecipientGrid;
        const mailRecipientGridId = 'MAIL_RECIPIENT_GRID';
        const mailRecipientColModel = [
            {title: '', dataType: 'string', dataIndx: 'STAFF_SEQ', hidden: true},
            {title: '성함', dataType: 'string', dataIndx: 'STAFF_NM'},
            {title: '메일주소', dataType: 'string', dataIndx: 'STAFF_EMAIL'},
            {title: '전화번호', dataType: 'string', dataIndx: 'STAFF_TEL'}
        ];
        const mailRecipientToolbar = {
            items: [
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {

                        }
                    }
                }
            ]
        };
        const mailRecipientObj = {
            height: 200,
            collapsible: false,
            resizable: true,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
            colModel: mailRecipientColModel,
            toolbar: toolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                // postData: {'queryId': 'dataSource.selectCompanyStaffEmailList', 'COMP_CD': 'COMP_CD'}, // TODO: COMP_CD 변수
                postData: {'queryId': 'dataSource.emptyGrid', 'COMP_CD': 'COMP_CD'}, // TODO: COMP_CD 변수
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let $outsideProcessRequestGrid;
        const outsideProcessRequestGridId = 'OUTSIDE_REQUEST_GRID';
        const outsideProcessRequestColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true, colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true, colModel: []},
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM', colModel: []},
            {title: '규격', minWidth: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true, colModel: []},
            {title: '자재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면<br>처리', minWidth: 70, dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []}, // 확인 필요
            {title: '소재<br>제공', dataType: 'bool', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', colModel: []}, // 확인 필요
            {
                title: '요청가공', align: 'center', colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    },
                    {
                        title: '표면<br>처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    },
                    {
                        title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    }
                ]
            },
            {title: '요망<br>납기', datatype: 'date', dataIndx: 'OUTSIDE_HOPE_DUE_DT', editable: true},
            {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE', editable: true},
        ];
        const outsideProcessRequestObj = {
            height: 200,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
            colModel: outsideProcessRequestColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                recIndx: 'ROWNUM',
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
            {title: '외주업체', dataType: 'string', dataIndx: 'ORDER_COMP', hidden: true},
            {title: '외주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '마감금액', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'}
        ];
        const outsideCloseLeftObj = {
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
            colModel: outsideCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $outsideCloseRightGrid;
        const outsideCloseRightGridId = 'OUTSIDE_CLOSE_RIGHT_GRID';
        const outsideCloseRightColModel = [
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true, colModel: []},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', colModel: []},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true, colModel: []},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN', colModel: []},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER', colModel: []},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY', colModel: []},
            {title: '변경후 마감금액', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {
                title: '추가 금액', align: 'center', colModel: [
                    {title: '', datatype: 'string', dataIndx: 'ADD_QTY'},
                    {title: '', datatype: 'string', dataIndx: 'ADD_UNIT_FINAL_AMT'}
                ]
            }
        ];
        const outsideCloseRightObj = {
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center',
                editable: false
            },
            colModel: outsideCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        let loadOutsideProcessData = function () {
            let selectedRowCount = selectedRowIndex.length;
            let controlSeqStr = '';
            let controlDetailSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                controlSeqStr += rowData.CONTROL_SEQ;
                controlDetailSeqStr += rowData.CONTROL_DETAIL_SEQ;

                if (i < selectedRowCount - 1) {
                    controlSeqStr += ','
                    controlDetailSeqStr += ','
                }
            }

            $('#OUTSIDE_PROCESS_REQUEST_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#OUTSIDE_PROCESS_REQUEST_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);

            $outsideProcessRequestGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#OUTSIDE_PROCESS_REQUEST_FORM'));
            });
            $outsideProcessRequestGrid.pqGrid('refreshDataAndView');
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
                coCompCdStr += coCompCdList[i];

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

        $outsideOrderManageGrid = $('#' + gridId).pqGrid(obj);

        $('#REQUEST_OUTSIDE_POPUP').on('show.bs.modal', function () {
            $mailRecipientGrid = $('#' + mailRecipientGridId).pqGrid(mailRecipientObj);
            $outsideProcessRequestGrid = $('#' + outsideProcessRequestGridId).pqGrid(outsideProcessRequestObj);
            loadOutsideProcessData();
        });

        $('#OUTSIDE_PROCESS_REQUEST_SAVE').on('click', function () {
            const updateQueryList = ['updateOutsideProcessRequest'];

            fnModifyPQGrid($outsideProcessRequestGrid, [], updateQueryList);
        });

        $('#ORDER_EXTRACTION').on('click', function () {
            let selectedRowCount = selectedRowIndex.length;
            let outsideOrderNumStr = '';
            let orderStaffSeqStr = '';
            let compCdList = [];

            // outsourcing_order_excel_download paramData
            // OUTSIDE_ORDER_NUM:COMP_CD:ORDER_STAFF_SEQ

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $outsideOrderManageGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                outsideOrderNumStr = rowData.OUTSIDE_ORDER_NUM;
                compCdList.push(rowData.OUTSIDE_COMP_CD);
                orderStaffSeqStr = rowData.ORDER_STAFF_SEQ;
            }
            // 중복제거
            compCdList = compCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (compCdList.length > 1) {
                alert('선택된 대상들의 외주업체는 반드시 동일해야함');
                return false;
            }
            $('#outsourcing_order_excel_download #paramData').val(outsideOrderNumStr + ':' + compCdList[0] + ':' + orderStaffSeqStr);

            fnReportFormToHiddenFormPageAction('outsourcing_order_excel_download', '/downloadExcel');
        });

        $('#OUTSIDE_CLOSE_POPUP').on('show.bs.modal', function () {
            fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR', 3);
            fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH', CURRENT_YEAR);

            $outsideCloseLeftGrid = $('#' + outsideCloseLeftGridId).pqGrid(outsideCloseLeftObj);
            $outsideCloseRightGrid = $('#' + outsideCloseRightGridId).pqGrid(outsideCloseRightObj);

            loadOutsideCloseData();
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
                rowData.CLOSE_MONTH = $('#OUTSIDE_CLOSE_YEAR').val() + $('#OUTSIDE_CLOSE_MONTH').val();
                list.push(rowData);
            }

            let parameters = {'url': '/insertOutsideClose', 'data': {data: JSON.stringify(list)}}
            fnPostAjax(function (data, callFunctionParam) {
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                $outsideCloseLeftGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('#OUTSIDE_CLOSE_POPUP').on('hide.bs.modal', function () {
            $outsideCloseLeftGrid.pqGrid('destroy');
            $outsideCloseRightGrid.pqGrid('destroy');
        });

        $('#OUTSIDE_SEARCH').on('click', function () {
            $outsideOrderManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM'));
            });
            $outsideOrderManageGrid.pqGrid('refreshDataAndView');
        });

        $('#OUTSIDE_ORDER_MANAGE_SAVE').on('click', function () {
            const updateQueryList = ['updateControlPart'];

            fnModifyPQGrid($outsideOrderManageGrid, [], updateQueryList);
        });

        $('#OUTSIDE_ORDER_MANAGE_DELETE').on('click', function () {

        });

        /* init */
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
        /* init */
    });
</script>