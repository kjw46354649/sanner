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

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-md-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    주문 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="CONTROL_MANAGE_SEARCH_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="COMP_CD">사업자</label>
                                <select class="form-control" name="COMP_CD" id="COMP_CD">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_COMP_CD">발주사</label>
                                <select class="form-control" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DRAWING_NUM">도면번호</label>
                                <input type="text" class="form-control" name="DRAWING_NUM" id="DRAWING_NUM">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ITEM_NM">품명</label>
                                <input type="text" class="form-control" name="ITEM_NM" id="ITEM_NM">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CONTROL_NUM">관리번호</label>
                                <input type="text" class="form-control" name="CONTROL_NUM" id="CONTROL_NUM">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_NUM">발주번호</label>
                                <input type="text" class="form-control" name="ORDER_NUM" id="ORDER_NUM">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="STANDARD">규격</label>
                                <select class="form-control" id="STANDARD">
                                    <option></option>
                                </select>
                                <label for="standard_1"></label><input type="text" class="form-control" id="STANDARD_1"
                                                                       size="3">
                                *
                                <label for="standard_2"></label><input type="text" class="form-control" id="STANDARD_2"
                                                                       size="3">
                                *
                                <label for="standard_3"></label><input type="text" class="form-control" id="STANDARD_3"
                                                                       size="3">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="">소재형태</label>
                                <select class="form-control" name="" id="">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1004}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for=""></label>
                                    <select class="form-control" id="">
                                        <option value="">All</option>
                                        <c:forEach var="code" items="${HighCode.H_1047}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="CONTROL_MANAGE_TERM" value="today" checked>
                                            <i></i>
                                            오늘
                                        </label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="CONTROL_MANAGE_TERM" value="current_month">
                                            <i></i>
                                            현재월
                                        </label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="CONTROL_MANAGE_TERM" value="three_months">
                                            <i></i>
                                            3개월
                                        </label>
                                    </div>
                                    <input type="text" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE"
                                           readonly> ~
                                    <input type="text"
                                           name="CONTROL_MANAGE_END_DATE"
                                           id="CONTROL_MANAGE_END_DATE" readonly>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="CONTROL_MANAGE_DATEPICKER_READ_ONLY" checked><i></i>
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="UNIT_CONST">단가</label>
                                    <select class="form-control" id="UNIT_CONST">
                                        <option></option>
                                    </select>
                                    <label for="UNIT_CONST_1"></label>
                                    <input type="text" class="form-control" id="UNIT_CONST_1">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="WORK_TYPE">작업형태</label>
                                    <select class="form-control" name="WORK_TYPE" id="WORK_TYPE">
                                        <option value="">All</option>
                                        <c:forEach var="code" items="${HighCode.H_1033}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="option">option</label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 자재사급
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 외주
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 未단가
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 긴급
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> part 숨기기
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="AMOUNT_SUM">금액합산</label>
                                    <input type="text" class="form-control" id="AMOUNT_SUM" readonly>
                                </div>
                                <div class="form-group col-md-3 text-right">
                                    <div type="submit" class="btn btn-success btn-sm btn-default" id="testSearch">
                                        search
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <a href="#CONTROL_MANGE_POPUP" class="" id="" data-target="" data-toggle="modal"
                       data-refform="CONTROL_MANGE_POPUP">
                        <input type="button" value="신규 주문 등록">
                    </a>
                    <button id="DRAWING_REGISTRATION">도면 등록</button>
                    <button id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                    <button name="CHANGE_STATUS" id="CONFIRMATION" data-control_status="ORD001"
                            data-control_status_nm="확정">확정
                    </button>
                    <button name="CHANGE_STATUS" id="CANCEL" data-control_status="ORD002"
                            data-control_status_nm="취소">취소
                    </button>
                    <button name="CHANGE_STATUS" id="TERMINATION" data-control_status="ORD004"
                            data-control_status_nm="종료">종료
                    </button>
                    <a href="#CONTROL_CLOSE_POPUP" data-toggle="modal" data-refform="CONTROL_CLOSE_POPUP">
                        <input type="button" value="마감">
                    </a>
                    <a href="#ESTIMATE_REGISTER_POPUP" data-toggle="modal" data-refform="ESTIMATE_REGISTER_POPUP">
                        <input type="button" value="견적등록">
                    </a>
                    <button id="SPECIFICATION_ON_TRANSACTION">거래명세표</button>
                    <button id="DRAWING_VIEW">도면 View</button>
                    <button id="DRAWING_PRINT">도면 출력</button>
                    <button id="BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button id="LABEL_PRINT">라벨 출력</button>
                </div>
                <div class="col-md-12">
                    <button id="ESTIMATE_AUTOMATIC_CALCULATION">견적자동계산</button>
                    <button id="ESTIMATE_LIST_PRINT">견적List출력</button>
                    <label class="control-label" for="SUPPLY_UNIT_COST_APPLY">공급단가적용</label>
                    <select id="SUPPLY_UNIT_COST_APPLY">
                        <option></option>
                    </select>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <%--                    <i class="fa fa-plus-circle"></i>--%>
                    <div id="CONTROL_MANAGE_GRID"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="modal" id="CONTROL_MANGE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">신규 주문 등록</h4>
            </div>
            <div class="modal-body">
                <div id="ORDER_REGISTER_GRID"></div>
                <div id="TEMP_ORDER_REGISTER_GRID"></div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="modal" id="CONTROL_CLOSE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">월 마감 진행</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5">
                        <div id="CONTROL_CLOSE_LEFT_GRID"></div>
                    </div>
                    <div class="col-md-2">
                        화살표~>
                    </div>
                    <div class="col-md-5">
                        <div id="CONTROL_CLOSE_RIGHT_GRID"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <form class="form-inline" id="CONTROL_CLOSE_FORM" role="form">
                            <input type="hidden" name="queryId" id="queryId" value="selectControlCloseLeftList">
                            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                        <div class="col-md-8">
                            <div class="col-md-3">
                                <label class="control-label" for="UNIT_CONST">대상 년/월</label>
                            </div>
                            <div class="col-md-5">
                                <select class="form-control" name="CONTROL_CLOSE_YEAR" id="CONTROL_CLOSE_YEAR">
                                    <option></option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select class="form-control" name="CONTROL_CLOSE_MONTH" id="CONTROL_CLOSE_MONTH">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-6">
                                <label class="control-label" for="CLOSE_VER">차수</label>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control" name="CLOSE_VER" id="CLOSE_VER">
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
                            <button id="CONTROL_CLOSE_YES">Yes</button>
                            <button id="CONTROL_CLOSE_NO">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="modal" id="ESTIMATE_REGISTER_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row m-b-md">
                <div class="col-sm-12">&nbsp;
                    <section class="panel panel-default">
                        <header class="panel-heading font-bold">
                            업체 정보 관리
                            <div class="btnSaveCloseBox">
                                <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_save">Save</div>
                                <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_submit">Submit</div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <form class="form-inline" role="form" id="estimate_register_info_form" name="estimate_register_info_form">
                                <input type="hidden" id="queryId" name="queryId" value="selectEstimateNextSequence"/>
                                <input type="hidden" id="EST_SEQ" name="EST_SEQ" value=""/>
                                <div class="panel-body line_tit portlet-body form bg-light">
                                    <section class="bg-light">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <form class="form-horizontal" data-validate="parsley" action="#">
                                                    <section class="panel panel-default">
                                                        <header class="panel-heading">
                                                            <strong>기본 정보</strong>
                                                        </header>
                                                        <div class="panel-body">
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">발주사</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" data-required="true" class="form-control parsley-validated">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-8 col-sm-8">
                                                                <label class="col-md-2 col-sm-2 control-label">제목</label>
                                                                <div class="col-md-10 col-sm-10">
                                                                    <input type="text" data-notblank="true" class="form-control" data-required="true" id="EST_TITLE" name="EST_TITLE">
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">구매 담당자</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select id="ORDER_STAFF_SEQ" name="ORDER_STAFF_SEQ" data-required="true" class="form-control parsley-validated">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">사업자구분</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select id="COMP_CD" name="COMP_CD" data-required="true" class="form-control parsley-validated">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">견적 담당자</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select id="EST_USER_ID" name="EST_USER_ID" data-required="true" class="form-control parsley-validated">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">견적번호 (차수)</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" class="form-control" id="EST_NUM" name="EST_NUM" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" class="form-control" id="DTL_CNT" name="DTL_CNT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">견적금액 계</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" class="form-control" id="DTL_AMOUNT" name="DTL_AMOUNT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">업데이트 일시</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" class="form-control" id="INSERT_DT" name="INSERT_DT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" class="form-control" id="SEND_DT" name="SEND_DT" readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </form>
                                            </div>
                                        </div>
                                    </section>
                                    <!-- grid table -->
                                    <section class="bg-light">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="panel panel-default">
                                                    <header class="panel-heading">
                                                        <strong>상세 리스트</strong>
                                                    </header>
                                                    <div class="row">
                                                        <div class="gridWrap">
                                                            <div id="estimate_register_top_grid" class="jqx-refresh"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
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
                                                        <strong>메인 수신처</strong>
                                                    </header>
                                                    <div class="gridWrap">
                                                        <div id="estimate_register_bot_grid" class="jqx-refresh"></div>
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


<script>
    $(function () {
        'use strict';
        /* variable */
        let $drawingRegistration = $("#DRAWING_REGISTRATION");
        let selectedRowIndex = [];
        let $orderManagementGrid;
        const gridId = 'CONTROL_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true, colModel: []},
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true, colModel: []},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true, colModel: []},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true, colModel: []},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true, colModel: []},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true, colModel: []},
            {title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', minWidth: 100, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자<br>구분', minWidth: 70, dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true, colModel: []},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', hidden: true, colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', colModel: []},
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', editable: true, colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true, colModel: []},
            {title: 'INV No.<br>(거래명세No.)', minWidth: 100, dataType: 'string', dataIndx: 'CHARGE_USER_ID', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', editable: true, colModel: []},
            {title: '주요<br>검사품', dataType: 'select', dataIndx: 'MAIN_INSPECTION', colModel: [],
                editor: {
                    type: 'select',
                    mapIndices: {name: 'MAIN_INSPECTION_NM', id: 'MAIN_INSPECTION'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1045'),
                    getData: function (ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['MAIN_INSPECTION'] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            },
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN', colModel: []},
            {title: 'CONTROL_VER', dataType: 'string', dataIndx: 'CONTROL_VER', hidden: true, colModel: []},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true, colModel: []},
            {
                title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM', colModel: [],
                render: function (ui) {
                    if (ui.rowData.WORK_NM === '가공조립') {
                        return "<span>플러스버튼</span>";
                    }
                }
            },
            {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER', hidden: true, colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true, colModel: []},
            {title: '품명', minWidth: 110, dataType: 'string', dataIndx: 'ITEM_NM', editable: true, colModel: []},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true, colModel: []},
            {title: '작업<br>형태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', colModel: []},
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', colModel: []},
            {title: '가공납기', minWidth: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', editable: true, colModel: []},
            {title: '규격', minWidth: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true, colModel: []},
            {title: '소재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE', colModel: []},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', colModel: []},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', colModel: []},
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', editable: true, colModel: []},
            {title: 'Part<br>단위<br>수량', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', editable: true},
                    {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY', editable: true},
                ]
            },
            {
                title: '발주정보', align: 'center', colModel: [
                    {
                        title: '', datatype: 'string', dataIndx: 'ORDER_NUM_PLUS_BUTTON',
                        render: function (ui) {
                            if (ui.rowData.WORK_NM === '가공조립') {
                                return "<span>플러스버튼</span>";
                            }
                        }
                    },
                    {title: '발주번호', minWidth: 90, datatype: 'string', dataIndx: 'ORDER_NUM', editable: true},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', editable: true},
                    {title: '출고', datatype: 'string', dataIndx: 'CNFRH'},
                    {title: '납기', datatype: 'string', dataIndx: 'HOPE_DUE_DT', editable: true},
                    {title: '납품확인', minWidth: 70, datatype: 'string', dataIndx: 'DELIVERY_DT', editable: true},
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
                     {title: '소재비', datatype: 'string', dataIndx: 'UNIT_MATERIAL_AMT', editable: true},
                     {title: 'TM각비', datatype: 'string', dataIndx: 'UNIT_TM_AMT', editable: true},
                     {title: '연마비', datatype: 'string', dataIndx: 'UNIT_GRIND_AMT', editable: true},
                     {title: '열처리', datatype: 'string', dataIndx: 'UNIT_HEAT_AMT', editable: true},
                     {title: '표면처리', datatype: 'string', dataIndx: 'UNIT_SURFACE_AMT', editable: true},
                     {title: '가공비', datatype: 'string', dataIndx: 'UNIT_PROCESS_AMT', editable: true},
                     {title: '기타추가', datatype: 'string', dataIndx: 'UNIT_ETC_AMT', editable: true},
                     {title: '견적비고', datatype: 'string', dataIndx: 'UNIT_AMT_NOTE', editable: true}
                 ]
             },
             {title: '계산<br>견적단가', minWidth: 90, dataType: 'string', dataIndx: 'CALCUL_EST_UNIT_COST', colModel: []},
             {title: '최종<br>견적단가', minWidth: 90, dataType: 'string', dataIndx: 'UNIT_FINAL_EST_AMT', colModel: [], editable: true},
             {title: '견적<br>합계금액', minWidth: 90, dataType: 'string', dataIndx: 'RUSWJRGKQRpRMADOR', colModel: []},
             {title: '최종<br>공급단가', minWidth: 90, dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', colModel: [], editable: true},
             {title: '합계금액', dataType: 'string', dataIndx: 'FINAL_AMOUNT', colModel: []},
             {title: '종전가', minWidth: 100, dataType: 'string', dataIndx: 'WHDWJSRK', colModel: []},
            {title: '변경전<br>도면번호', minWidth: 120, dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', colModel: [], editable: true},
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ'},
            {title: 'Rev.', dataType: 'string', dataIndx: 'REVD.', colModel: []},
            {title: 'Rev. 일시', minWidth: 70, dataType: 'string', dataIndx: 'REVDLFTL.', colModel: []},
            {title: '등록/업데이트<br>일시', minWidth: 100, dataType: 'string', dataIndx: 'STATUS_DT', colModel: []}
        ];
        let toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'checkbox', label: '상세견적요건', style: 'float: left;', listener: {
                        'change': function (evt, ui) {
                            let $orderManagementGridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
                            let Cols = $orderManagementGridInstance.Columns();
                            let titles = ['상세가공요건', '소재마감', '예상소재 Size'];

                            Cols.alter(function () {
                                for (let i = 0; i < titles.length; i++) {
                                    let col = Cols.find(function (col) {
                                        return col.title === titles[i];
                                    });
                                    col.hidden = !col.hidden;

                                    for (let j = 0; j < col.colModel.length; j++) {
                                        col.colModel[j].hidden = col.hidden;
                                    }
                                }
                            })
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const DELETE_QUERY_ID = '';
                            let selectedRowCount = selectedRowIndex.length;

                            for (let i = 0; i < selectedRowCount; i++) {
                                let thisRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                                if (!(thisRowData.ORDER_STATUS_NM === undefined || thisRowData.ORDER_STATUS_NM === null || thisRowData.ORDER_STATUS_NM === '' || thisRowData.ORDER_STATUS_NM === '확정취소')) {
                                    alert('확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능');
                                    return false;
                                }
                            }

                            fnDeletePQGrid($orderManagementGrid, selectedRowIndex, DELETE_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const updateQueryList = ['updateControlMaster', 'updateControlPart', 'updateControlPartOrder', 'insertControlProgress', 'insertControlPartProgress'];

                            fnModifyPQGrid($orderManagementGrid, [], updateQueryList);
                        }
                    }
                }
            ]
        };
        let obj = {
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
            toolbar: toolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData,
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PART_NUM' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $orderManagementGrid.pqGrid('option', 'dataModel.data'), totalRecords = data.length;
                    let newPartNum = 0, newRowIndex = 0;

                    for (let i = 0; i < totalRecords; i++) {
                        if (data[i].CONTROL_SEQ === newRowData.CONTROL_SEQ) {
                            newPartNum++;
                            newRowIndex = data[i].pq_ri + 1;
                        }
                    }

                    newRowData.ROWNUM = totalRecords + 1;
                    newRowData.PART_NUM = newPartNum;
                    newRowData.WORK_NM = '단품가공';
                    newRowData.WORK_TYPE = 'WTP010';

                    $orderManagementGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: newRowIndex,
                        checkEditable: false
                    });
                }

                if (ui.dataIndx === 'ORDER_NUM_PLUS_BUTTON' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;

                    newRowData.ROWNUM = totalRecords + 1;
                    $orderManagementGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: ui.rowIndx + 1,
                        checkEditable: false
                    });
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
        let $orderRegisterGrid;
        let $tempOrderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupTempGridId = 'TEMP_ORDER_REGISTER_GRID';
        const popupColModel = [
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', colModel: []},
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', colModel: []},
            {title: '주요 검사품',  dataType: 'select', dataIndx: 'MAIN_INSPECTION', colModel: []},
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN', colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', colModel: []},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', colModel: []},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', colModel: []},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', colModel: []},
            {title: '소재 사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', colModel: []},
            {title: '가공납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '소재상세종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', colModel: []},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', colModel: []},
            {title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY', colModel: []},
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
            {title: '최종<br>견적단가', dataType: 'string', dataIndx: 'UNIT_FINAL_EST_AMT', colModel: []},
            {title: '최종<br>공급단가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {title: '변경전<br>도면번호', dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', colModel: []}
        ];
        const popupToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Reset', icon: 'ui-icon-arrowrefresh-1-s', listener: {
                        'click': function (evt, ui) {
                            $orderRegisterGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save & 확정', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');

                            for (let i = 0; i < data.length; i++) data[i].STATUS = 'ORD001'

                            let parameters = {
                                'url': '/registerNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function (data, callFunctionParam) {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/registerNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function (data, callFunctionParam) {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                }
            ]
        };
        const popoupObj = {
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            dragColumns: {enabled: false},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center'
            },
            colModel: popupColModel,
            toolbar: popupToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
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
            },
            beforePaste: function(evt, ui){
                console.log(evt);
                console.log(ui);
                //sanitize pasted data.
                // var CM = this.getColModel(),
                //     rows = ui.rows,
                //     area = ui.areas[0],
                //     c1 = area.c1;
                //
                // for(var i=0; i<rows.length; i++){
                //     var row = rows[i];
                //     for(var j=0; j<row.length; j++){
                //         var column = CM[j+c1],
                //             dt = column.dataType;
                //         if( dt == "integer" || dt == "float" ){
                //
                //             row[j] = row[j].replace(/[^(\d|\.)]/g,"");
                //         }
                //     }
                // }
            },

        };
        let $controlCloseLeftGrid;
        const controlCloseLeftGridId = 'CONTROL_CLOSE_LEFT_GRID';
        let controlCloseLeftColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP', hidden:true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden:true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '마감금액', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'}
        ];
        let controlCloseLeftObj = {
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
            colModel: controlCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $controlCloseRightGrid;
        const controlCloseRightGridId = 'CONTROL_CLOSE_RIGHT_GRID';
        let controlCloseRightColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden:true, colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden:true, colModel: []},
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
        let controlCloseRightObj = {
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
            colModel: controlCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        /* function */
        let changeDate = function (newDate = new Date(), today = new Date()) {
            $('#CONTROL_MANAGE_START_DATE').val(newDate.format('MM/dd/yyyy'));
            $('#CONTROL_MANAGE_END_DATE').val(today.format('MM/dd/yyyy'));
        };

        Date.prototype.format = function (f) {
            if (!this.valueOf()) {
                return ' ';
            }

            let weekKorName = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
            let weekKorShortName = ['일', '월', '화', '수', '목', '금', '토'];
            let weekEngName = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            let weekEngShortName = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            let d = this;

            return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
                switch ($1) {
                    case 'yyyy':
                        return d.getFullYear(); // 년 (4자리)
                    case 'yy':
                        return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
                    case 'MM':
                        return (d.getMonth() + 1).zf(2); // 월 (2자리)
                    case 'dd':
                        return d.getDate().zf(2); // 일 (2자리)
                    case 'KS':
                        return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
                    case 'KL':
                        return weekKorName[d.getDay()]; // 요일 (긴 한글)
                    case 'ES':
                        return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
                    case 'EL':
                        return weekEngName[d.getDay()]; // 요일 (긴 영어)
                    case 'HH':
                        return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
                    case 'hh':
                        return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
                    case 'mm':
                        return d.getMinutes().zf(2); // 분 (2자리)
                    case 'ss':
                        return d.getSeconds().zf(2); // 초 (2자리)
                    case 'a/p':
                        return d.getHours() < 12 ? '오전' : '오후'; // 오전/오후 구분
                    default:
                        return $1;
                }
            });
        };

        String.prototype.string = function (len) {
            let s = '', i = 0;

            while (i++ < len) s += this;

            return s;
        };
        String.prototype.zf = function (len) {
            return '0'.string(len - this.length) + this;
        };
        Number.prototype.zf = function (len) {
            return this.toString().zf(len);
        };

        let getOrderStatusButton = function (event) {
            let controlStatus = event.target.dataset.control_status;
            let controlStatusNm = event.target.dataset.control_status_nm;

            updateOrderStatus(controlStatus, controlStatusNm);
        };

        let updateOrderStatus = function (controlStatus, controlStatusNm) {
            let selectedRowCount = selectedRowIndex.length;
            let rowListConvert = [];
            let date = new Date().format('MM-dd HH:mm');

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
        
        let loadDataControlClose = function () {
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
                orderCompCdStr += orderCompCdList[i];

                if (i < orderCompCdList.length - 1) {
                    orderCompCdStr += ',';
                }
            }

            $('#CONTROL_CLOSE_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CONTROL_CLOSE_FORM > #ORDER_COMP_CD').val(orderCompCdStr);

            $controlCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CONTROL_CLOSE_FORM'));
            });
            $controlCloseLeftGrid.pqGrid('refreshDataAndView');

            let controlCloseRightPostData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM')
            controlCloseRightPostData.list = list;
            let parameters = {'url': '/selectControlCloseRightList', 'data': {data: JSON.stringify(controlCloseRightPostData)}}

            fnPostAjax(function (data, callFunctionParam) {
                $controlCloseRightGrid.pqGrid('option', 'dataModel.data', data.list);
                $controlCloseRightGrid.pqGrid('refreshView');
            }, parameters, '');
        };
        /* function */

        /* event */
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
            createOrDestoryDatepicker();
        });

        let createOrDestoryDatepicker = function () {
            let checked = $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').prop('checked');

            if (checked) $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker('destroy');
            else $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker();
        };


        /**
         * @description 날짜 라디오 변경
         */
        $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').on('change', function () {
            createOrDestoryDatepicker();
        });

        $('#CONTROL_MANGE_POPUP').on('show.bs.modal', function () {
            $orderRegisterGrid = $('#' + popupGridId).pqGrid(popoupObj);
            $tempOrderRegisterGrid = $('#' + popupTempGridId).pqGrid(popoupObj);
        });

        $('#CONTROL_MANGE_POPUP').on('hide.bs.modal', function () {
            $orderRegisterGrid.pqGrid('destroy');
            $tempOrderRegisterGrid.pqGrid('destroy');
        });

        $('#CONTROL_CLOSE_POPUP').on('show.bs.modal', function () {
            fnAppendSelectboxYear('CONTROL_CLOSE_YEAR', 3);
            fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH');

            $controlCloseLeftGrid = $('#' + controlCloseLeftGridId).pqGrid(controlCloseLeftObj);
            $controlCloseRightGrid = $('#' + controlCloseRightGridId).pqGrid(controlCloseRightObj);

            loadDataControlClose();
        });

        $('#CONTROL_CLOSE_POPUP').on('hide.bs.modal', function () {
            $controlCloseLeftGrid.pqGrid('destroy');
            $controlCloseRightGrid.pqGrid('destroy');
        });

        $('#CONTROL_CLOSE_FORM').on('change', function () {
            loadDataControlClose();
        });

        $('#testSearch').on('click', function () {
            $orderManagementGrid.pqGrid('option', "dataModel.postData", function (ui) {
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
                if (rowData.OUTSIDE_YN === 'Y') {
                    //TODO: 문구수정
                    alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                    return false;
                }
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

        $('#CONTROL_CLOSE_YEAR').on('change', function() {
            fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH', this.value);
        });
        /* event */

        /* init */
        changeDate();
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


        /* 도면 등록 팝업 호출 */
        $drawingRegistration.click(function(){
            commonCadFileAttachPopup.modal('show');
        });

        $('#CONTROL_CLOSE_YES').on('click', function() {
            let selectedRowCount = selectedRowIndex.length;
            let list = [];

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                rowData.CLOSE_VER = $('#CLOSE_VER').val();
                rowData.CLOSE_MONTH = $('#CONTROL_CLOSE_YEAR').val() + $('#CONTROL_CLOSE_MONTH').val();
                list.push(rowData);
            }

            // rightGrid
            let parameters = {'url': '/insertMonthFinishClose', 'data': {data: JSON.stringify(list)}}
            fnPostAjax(function (data, callFunctionParam) {
                $controlCloseLeftGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        /* 견적등록 */
            /** 공통 코드 이외의 처리 부분 **/
            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_COMP_CD"), 'sel', {
                "url": "/json-list",
                "data": {"queryId": 'dataSource.getOrderCompanyList'}
            });
            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#COMP_CD"), 'sel', {
                "url": "/json-list",
                "data": {"queryId": 'dataSource.getBusinessCompanyList'}
            });
            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#EST_USER_ID"), 'sel', {
                "url": "/json-list",
                "data": {"queryId": 'dataSource.getUserList'}
            });
            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {
                "url": "/json-list",
                "data": {"queryId": 'dataSource.getCompanyStaffList'}
            });

            let estimateRegisterSelectedRowIndex;

            let estimateRegisterTopGrid = $("#estimate_register_top_grid");
            let estimateRegisterBotGrid = $("#estimate_register_bot_grid");

            let estimateRegisterTopColModel = [
                {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ', hidden: true},
                {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden: true},
                {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM'},
                {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM'},
                {title: '', dataType: 'string', dataIndx: 'DRAWING_YN'},
                {
                    title: '도면번호',
                    dataType: 'string',
                    dataIndx: 'DRAWING_NUM',
                    validations: [{type: 'minLen', value: 1, msg: "Required"}]
                },
                {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM'},
                {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT'},
                /*
                {title: '규격', align: "center", colModel: [
                    //{title: '타입', dataType: 'string', dataIndx: 'SIZE_TYPE'},
                    {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                    {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                    {title: '두꼐', dataType: 'string', dataIndx: 'SIZE_T'},
                    {title: '지름', dataType: 'string', dataIndx: 'SIZE_D'},
                    {title: '길이', dataType: 'string', dataIndx: 'SIZE_L'},
                ]},
                */
                {
                    title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE',
                    editor: {
                        type: 'select',
                        mapIndices: {name: "WORK_TYPE", id: "WORK_TYPE"},
                        valueIndx: "value",
                        labelIndx: "text",
                        options: fnGetCommCodeGridSelectBox('1013'),
                        getData: function (ui) {
                            let clave = ui.$cell.find("select").val();
                            let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                            rowData["WORK_TYPE"] = clave;
                            return ui.$cell.find("select option[value='" + clave + "']").text();
                        }
                    }
                },
                {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE'},
                {
                    title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                    editor: {
                        type: 'select',
                        mapIndices: {name: "MATERIAL_DETAIL", id: "MATERIAL_DETAIL"},
                        valueIndx: "value",
                        labelIndx: "text",
                        options: fnGetCommCodeGridSelectBox('1000'),
                        getData: function (ui) {
                            let clave = ui.$cell.find("select").val();
                            let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                            rowData["MATERIAL_DETAIL"] = clave;
                            return ui.$cell.find("select option[value='" + clave + "']").text();
                        }
                    }
                },
                {
                    title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                    editor: {
                        type: 'select',
                        mapIndices: {name: "MATERIAL_KIND", id: "MATERIAL_KIND"},
                        valueIndx: "value",
                        labelIndx: "text",
                        options: fnGetCommCodeGridSelectBox('1004'),
                        getData: function (ui) {
                            let clave = ui.$cell.find("select").val();
                            let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                            rowData["MATERIAL_KIND"] = clave;
                            return ui.$cell.find("select option[value='" + clave + "']").text();
                        }
                    }
                },
                {
                    title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT',
                    editor: {
                        type: 'select',
                        mapIndices: {name: "SURFACE_TREAT", id: "SURFACE_TREAT"},
                        valueIndx: "value",
                        labelIndx: "text",
                        options: fnGetCommCodeGridSelectBox('1002'),
                        getData: function (ui) {
                            let clave = ui.$cell.find("select").val();
                            let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                            rowData["SURFACE_TREAT"] = clave;
                            return ui.$cell.find("select option[value='" + clave + "']").text();
                        }
                    }
                },
                {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE'},
                {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
                {
                    title: '상세 가공요건', align: "center", colModel: [
                        {title: '선반', dataType: 'string', dataIndx: 'DETAIL_LATHE'},
                        {title: '가공면', dataType: 'string', dataIndx: 'DETAIL_SURFACE'},
                        {title: '클램핑', dataType: 'string', dataIndx: 'DETAIL_CLAMPING'},
                        {title: '포켓', dataType: 'string', dataIndx: 'DETAIL_POCKET'},
                        //{title:'공차', dataType: 'string', dataIndx: 'DETAIL_TOLERANCE'},
                        {title: '드릴', dataType: 'string', dataIndx: 'DETAIL_DRILL'},
                        {title: '난도', dataType: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
                    ], hidden: true
                },
                {
                    title: '예상소재 Size', align: "center", colModel: [
                        {title: '가로', dataType: 'float', dataIndx: 'SIZE_W_M'},
                        {title: '세로', dataType: 'float', dataIndx: 'SIZE_H_M'},
                        {title: '두께', dataType: 'float', dataIndx: 'SIZE_T_M'},
                        {title: '지름', dataType: 'float', dataIndx: 'SIZE_D_M'},
                        {title: '길이', dataType: 'float', dataIndx: 'SIZE_L_M'}
                    ], hidden: true
                },
                {
                    title: '항목별 견적정보', align: "center", colModel: [
                        {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AMT'},
                        {title: 'TM각비', dataType: 'integer', dataIndx: 'UNIT_TM_AMT'},
                        {title: '연마비', dataType: 'integer', dataIndx: 'UNIT_GRIND_AMT'},
                        {title: '열처리', dataType: 'integer', dataIndx: 'UNIT_HEAT_AMT'},
                        {title: '표면 처리비', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AMT'},
                        {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AMT'},
                        {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_NOTE'},
                        {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE'}
                    ]
                },
                {title: '계산견적단가', dataType: 'float', dataIndx: 'CALCUL_EST_UNIT_COST'},
                {title: '최종견적가', dataType: 'float', dataIndx: 'UNIT_FINAL_EST_AMT'},
                {title: '금액 계', dataType: 'float', dataIndx: 'FINAL_AMOUNT'},
                {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
                {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
                {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ'},
                {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'},
                {title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ'}
            ];

            let estimateRegisterBotColModel = [
                {title: '', dataType: 'string', dataIndx: 'STAFF_SEQ', hidden: true},
                {title: '성함', dataType: 'string', dataIndx: 'STAFF_NM'},
                {title: '메일주소', dataType: 'string', dataIndx: 'STAFF_EMAIL'},
                {title: '전화번호', dataType: 'string', dataIndx: 'STAFF_TEL'}
            ];

            let estimateRegisterTopToolbar = {
                items: [
                    {
                        type: 'button', label: '도면 보기', icon: '', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                            }
                        }
                    },
                    {
                        type: 'button', label: '도면 등록', icon: '', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                            }
                        }
                    },
                    {
                        type: 'button', label: '계산견적적용', icon: '', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                            }
                        }
                    },
                    {type: 'select', label: '', style: 'float: right;', option: fnGetCommCodeGridSelectBox('1045')},
                    {
                        type: 'checkbox', label: '상세견적요건', style: 'float: right;', listener: {
                            'change': function (evt, ui) {
                                let colM = estimateRegisterTopGrid.pqGrid("option", "colModel");
                                let listM = [15, 16];
                                let hiddenYn = evt.target.checked == true ? false : true;
                                for (let tmpI = 0; tmpI < listM.length; tmpI++) {
                                    for (let colCnt = 0; colCnt < colM[listM[tmpI]].colModel.length; colCnt++) {
                                        colM[listM[tmpI]].colModel[colCnt].hidden = hiddenYn;
                                    }
                                    colM[listM[tmpI]].hidden = hiddenYn;
                                }
                                estimateRegisterTopGrid.pqGrid("option", "colModel", colM);
                                estimateRegisterTopGrid.pqGrid("refresh");
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: left;', listener: {
                            'click': function (evt, ui) {
                                let USER_MASTER_QUERY_ID = 'deleteEstimateDetail';

                                fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                            'click': function (evt, ui) {
                                estimateRegisterTopGrid.pqGrid('addNodes', [{}], 0);
                            }
                        }
                    },
                    {
                        type: 'button', label: '견적List 출력', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                            'click': function (evt, ui) {

                                fnReportFormToHiddenFormPageAction("packing_history_list_search_form", "/downloadExcel");
                            }
                        }
                    }
                ]
            };
            let estimateRegisterBotToolbar = {
                items: [
                    {
                        type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                            'click': function (evt, ui) {

                            }
                        }
                    }]
            };

        $('#ESTIMATE_REGISTER_POPUP').on('show.bs.modal', function () {
            console.log(selectedRowIndex);
            let rowDataList = [];
            for (let i = 0; i < selectedRowIndex.length; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: rowData,
                    checkEditable: false
                };
                rowDataList[i] = rowData;
                // rowDataList[i] = tempObject;
            }
            estimateRegisterTopGrid.pqGrid({
                width: "100%", height: 200,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: {'queryId': 'selectEstimateDetailList'},
                    getData: function (dataJSON) {
                        return {data: rowDataList};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center'},
                //scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true},
                //selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                //resizable: true,
                colModel: estimateRegisterTopColModel,
                toolbar: estimateRegisterTopToolbar,
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
                change: function (event, ui) {
                    if (ui.source == 'edit') {
                        let rowIndx = ui.updateList[0].rowIndx;
                        let calculateEstimateAmt = 0;
                        let dataColumn = ['ITEM_QTY', 'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT'];
                        let data = estimateRegisterTopGrid.pqGrid("getData", {dataIndx: dataColumn});

                        calculateEstimateAmt += data[0].UNIT_MATERIAL_AMT == undefined ? 0 : parseFloat(data[0].UNIT_MATERIAL_AMT);
                        calculateEstimateAmt += data[0].UNIT_TM_AMT == undefined ? 0 : parseFloat(data[0].UNIT_TM_AMT);
                        calculateEstimateAmt += data[0].UNIT_GRIND_AMT == undefined ? 0 : parseFloat(data[0].UNIT_GRIND_AMT);
                        calculateEstimateAmt += data[0].UNIT_HEAT_AMT == undefined ? 0 : parseFloat(data[0].UNIT_HEAT_AMT);
                        calculateEstimateAmt += data[0].UNIT_SURFACE_AMT == undefined ? 0 : parseFloat(data[0].UNIT_SURFACE_AMT);
                        calculateEstimateAmt += data[0].UNIT_PROCESS_AMT == undefined ? 0 : parseFloat(data[0].UNIT_PROCESS_AMT);
                        calculateEstimateAmt += data[0].UNIT_ETC_AMT == undefined ? 0 : parseFloat(data[0].UNIT_ETC_AMT);
                        estimateRegisterTopGrid.pqGrid("updateRow", {
                            'rowIndx': rowIndx,
                            row: {'CALCUL_EST_UNIT_COST': calculateEstimateAmt}
                        });

                        calculateEstimateAmt *= parseFloat(data[0].ITEM_QTY);
                        estimateRegisterTopGrid.pqGrid("updateRow", {
                            'rowIndx': rowIndx,
                            row: {'FINAL_AMOUNT': calculateEstimateAmt}
                        });

                    }
                }
            });

            selectEstimateBotList('');

            function selectEstimateBotList(COMP_CD) {
                estimateRegisterBotGrid.pqGrid({
                    width: "100%", height: 200,
                    dataModel: {
                        location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                        url: "/paramQueryGridSelect",
                        postData: {'queryId': 'selectCompanyStaffEmailList', 'COMP_CD': COMP_CD},
                        getData: function (dataJSON) {
                            let data = dataJSON.data;
                            return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                        }
                    },
                    scrollModel: {autoFit: true},
                    numberCell: {width: 30, title: "No", show: true},
                    selectionModel: {type: 'row', mode: 'single'},
                    collapsible: false,
                    swipeModel: {on: false},
                    resizable: false,
                    trackModel: {on: true},
                    //resizable: true,
                    colModel: estimateRegisterBotColModel,
                    toolbar: estimateRegisterBotToolbar
                });

                estimateRegisterBotGrid.pqGrid("refreshDataAndView");
            }


            $("#estimate_register_info_form #ORDER_COMP_CD").on('change', function () {
                let compCd = $(this).val();

                fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {
                    "url": "/json-list",
                    "data": {"queryId": 'dataSource.getCompanyStaffList', 'COMP_CD': compCd}
                });
                selectEstimateBotList(compCd);
            });

            function estimateRegisterSaveCallBack(response, callMethodParam) {
                let estimateRegisterInsertQueryList = ['insertEstimateDetail'];
                let estimateRegisterUpdateQueryList = ['updateEstimateDetail'];
                let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();

                let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for (let tempI = 0; tempI < totalRecords; tempI++) {
                    estimateRegisterTopGrid.pqGrid("updateRow", {'rowIndx': tempI, row: {'EST_SEQ': EST_SEQ}});
                }

                fnModifyPQGrid(estimateRegisterTopGrid, estimateRegisterInsertQueryList, estimateRegisterUpdateQueryList);
                estimateRegisterReloadPageData();
            }

            $("#btn_estimate_register_save").on("click", function () {
                $("#estimate_register_info_form #queryId").val('selectEstimateNextSequence');

                let parameters = {'url': '/json-list', 'data': $("#estimate_register_info_form").serialize()};
                let EST_SEQ = $("#estimate_register_info_form #EST_SEQ").val();
                fnPostAjax(function (data, callFunctionParam) {
                    let list = data.list[0];
                    if (EST_SEQ == '' || EST_SEQ == null) {
                        EST_SEQ = list.EST_SEQ;
                    }

                    $("#estimate_register_info_form #queryId").val('insertEstimateMaster');
                    $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                    $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);

                    parameters = {'url': '/json-create', 'data': $("#estimate_register_info_form").serialize()};
                    fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

                }, parameters, '');
            });

            function estimateRegisterReloadPageData() {
                let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
                let postData = {'queryId': 'estimate.selectLastValEstimateMasterInfo', 'EST_SEQ': EST_SEQ};

                let parameter = {'url': '/json-list', 'data': postData};
                fnPostAjax(function (data, callFunctionParam) {
                    let list = data.list[0];
                    $("#estimate_register_info_form #ORDER_COMP_CD").val(list.ORDER_COMP_CD);
                    $("#estimate_register_info_form #EST_TITLE").val(list.EST_TITLE);
                    $("#estimate_register_info_form #ORDER_STAFF_SEQ").val(list.ORDER_STAFF_SEQ);
                    $("#estimate_register_info_form #COMP_CD").val(list.COMP_CD);
                    $("#estimate_register_info_form #EST_USER_ID").val(list.EST_USER_ID);
                    $("#estimate_register_info_form #EST_NUM").val(list.EST_NUM + ' (' + list.EST_VER + ')');
                    $("#estimate_register_info_form #DTL_CNT").val(list.DTL_CNT);
                    $("#estimate_register_info_form #DTL_AMOUNT").val(list.DTL_AMOUNT);
                    $("#estimate_register_info_form #INSERT_DT").val(list.INSERT_DT);
                    $("#estimate_register_info_form #SEND_DT").val(list.SEND_DT);

                    postData = {'queryId': 'estimate.selectLastValEstimateDetailList', 'EST_SEQ': EST_SEQ};
                    fnRequestGidData(estimateRegisterTopGrid, postData);

                    $("#estimate_register_excel_download #EST_SEQ").val(EST_SEQ);
                    $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                }, parameter, '');
            }

            $(document).on('click', '#test', function () {
                estimateRegisterReloadPageData();
            });

            $('#ESTIMATE_REGISTER_POPUP #ORDER_COMP_CD').val(rowDataList[0].ORDER_COMP_CD);
            $('#ESTIMATE_REGISTER_POPUP #ORDER_STAFF_SEQ').val(rowDataList[0].ORDER_STAFF_SEQ);
            $('#ESTIMATE_REGISTER_POPUP #COMP_CD').val(rowDataList[0].COMP_CD);
        });

        $('#ESTIMATE_REGISTER_POPUP').on('hide.bs.modal', function () {
            estimateRegisterTopGrid.pqGrid('destroy');
        });
        /* 견적등록 */
    });
</script>