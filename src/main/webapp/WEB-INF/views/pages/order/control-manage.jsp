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
            <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">
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
                <button type="button" class="defaultBtn btn-120w" id="SPECIFICATION_ON_TRANSACTION">거래명세표</button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w" id="ESTIMATE_AUTOMATIC_CALCULATION">견적자동계산</button>
                    <button type="button" class="defaultBtn btn-120w" id="ESTIMATE_LIST_PRINT">견적List출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="DRAWING_PRINT">도면 출력</button>
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
                            <option></option>
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

<%--<div class="popup_container" id="CONTROL_CLOSE_POPUP" style="display: none;">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">월 마감 진행</h3>
        <button type="button" class="pop_close">닫기</button>
        <div>
            <div class="col-md-5">
                <div id="CONTROL_CLOSE_LEFT_GRID"></div>
            </div>
            <div class="col-md-2">
                화살표 ~>
            </div>
            <div class="col-md-5">
                <div id="CONTROL_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>
    </div>
</div>--%>

<div class="modal" id="" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title"></h4>
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
                            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseLeftList">
                            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                            <div class="col-md-8">
                                <div class="col-md-3">
                                    <label>대상 년/월</label>
                                </div>
                                <div class="col-md-5">
                                    <label for="CONTROL_CLOSE_YEAR"></label><select name="CONTROL_CLOSE_YEAR" id="CONTROL_CLOSE_YEAR">
                                    <option></option>
                                </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="CONTROL_CLOSE_MONTH"></label><select name="CONTROL_CLOSE_MONTH" id="CONTROL_CLOSE_MONTH">
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
                        </form>
                    </div>
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
                <div class="col-sm-12">
                    <section class="panel panel-default">
                        <header class="panel-heading font-bold">
                            업체 정보 관리
                            <div class="btnSaveCloseBox">
                                <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_save">
                                    Save
                                </div>
                                <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_submit">
                                    Submit
                                </div>
                            </div>
                        </header>
                        <div class="panel-body">
                            <form class="form-inline" role="form" id="control_estimate_register_info_form" name="control_estimate_register_info_form">
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
                                                                    <input type="text" data-notblank="true" data-required="true" id="EST_TITLE" name="EST_TITLE">
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">구매
                                                                    담당자</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select>
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
                                                                <label class="col-md-4 col-sm-4 control-label">견적
                                                                    담당자</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <select id="EST_USER_ID" name="EST_USER_ID" data-required="true" class="form-control parsley-validated">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">견적번호
                                                                    (차수)</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" id="EST_NUM" name="EST_NUM" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" id="DTL_CNT" name="DTL_CNT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">견적금액
                                                                    계</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" id="DTL_AMOUNT" name="DTL_AMOUNT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="line line-dashed b-b pull-in"></div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">업데이트
                                                                    일시</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" id="INSERT_DT" name="INSERT_DT" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4 col-sm-4">
                                                                <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <input type="text" id="SEND_DT" name="SEND_DT" readonly>
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
                                                            <label for="EMAIL_CONTENT"></label><textarea class="col-md-12 col-sm-12" id="EMAIL_CONTENT" name="EMAIL_CONTENT"></textarea>
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
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', clsHead: 'display_none', datatype: 'string', dataIndx: 'CONTROL_STATUS_ORIGINAL', hidden: true},
                    {title: '상태', clsHead: 'display_none', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', width: 95, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '사업자<br>구분', clsHead: 'display_none', width: 70, dataType: 'string', dataIndx: 'COMP_CD', editable: true,
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
            {title: '발주업체', clsHead: 'display_none', dataType: 'string', dataIndx: 'ORDER_COMP_CD', editable: true,
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
            {title: '구매담당', clsHead: 'display_none', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', editable: true,
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
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', editable: true, styleHead: {'font-weight': 'bold'}},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true},
            {title: 'INV No.<br>(거래명세No.)', width: 100, dataType: 'string', dataIndx: 'CHARGE_USER_ID'},
            {title: '프로젝트', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', editable: true},
            {title: '모듈', width: 70, dataType: 'string', dataIndx: 'MODULE_NM', editable: true},
            {title: '납품처', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', editable: true},
            {title: '비고(라벨)', dataType: 'string', dataIndx: 'LABEL_NOTE', editable: true},
            {title: '주요<br>검사품', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '긴급', clsHead: 'control_manage_view_quality', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: 'CONTROL_VER', clsHead: 'control_manage_view_close', dataType: 'string', dataIndx: 'CONTROL_VER', hidden: true},
            {title: '관리번호', clsHead: 'control_manage_view_estimate', width: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {
                title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM',
                render: function (ui) {
                    if (ui.rowData.WORK_TYPE === 'WTP020') {
                        return "<span>플러스버튼</span>";
                    }
                }
            },
            {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER', hidden: true},
            {title: '도면번호', width: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: '품명', width: 110, dataType: 'string', dataIndx: 'ITEM_NM', editable: true},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM'},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN'},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY_NM'},
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', editable: true},
            {title: '규격', width: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', hidden: true},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM'},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
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
                            if (ui.rowData.WORK_NM === 'WTP020') {
                                return '<span>플러스버튼</span>';
                            }
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
            {title: '계산<br>견적단가', width: 90, dataType: 'integer', dataIndx: 'CALCUL_EST_UNIT_COST'},
            {title: '최종<br>견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', editable: true},
            {title: '견적<br>합계금액', width: 90, dataType: 'integer', dataIndx: 'RUSWJRGKQRpRMADOR'},
            {title: '최종<br>공급단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', editable: true},
            {title: '합계금액', dataType: 'integer', dataIndx: 'FINAL_AMOUNT'},
            {title: '종전가', width: 100, dataType: 'integer', dataIndx: 'WHDWJSRK'},
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
                        console.log(rowData.IMG_GFILE_SEQ);
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
                    {title: '자재사급', datatype: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN'},
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
            resizable: true,
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
            editModel: {clicksToEdit: 1},
            complete: function (event, ui) {
                // this.flex();
                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');

                $('#CONTROL_MANAGE_RECORDS').html(data.length);
            },
            cellClick: function (event, ui) {
                console.group('cellClick');
                console.log(ui.rowData);
                console.groupEnd();
                if(ui.rowData.IMG_GFILE_SEQ) {
                    callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ)  // 셀 선택시 도면 View 실행 중인경우 이미지 표시 하기
                };
                if (ui.dataIndx === 'PART_NUM' && ui.rowData.WORK_TYPE === 'WTP020') {
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
                    newRowData.WORK_TYPE = 'WTP010';

                    $orderManagementGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: newRowIndex,
                        checkEditable: false
                    });
                }

                if (ui.dataIndx === 'ORDER_NUM_PLUS_BUTTON' && ui.rowData.WORK_TYPE === 'WTP020') {
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
                    console.log(selectedRowIndex);
                }
            },
            change: function (evt, ui) {
                console.group('change');
                console.log(ui);
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
                console.groupEnd();
            },
            cellSave: function (evt, ui) {
                console.group('cellSave');
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $orderManagementGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
                console.groupEnd();
            },
            columnResize: function (event, ui) {
                cosole.count();
                console.log(event);
                console.log(ui);
            }
        };
        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupColModel = [
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
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1052')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let mainInspection = fnGetCommCodeGridSelectBox('1052');
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
                title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN',
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
                            let dataLength = data.length;

                            for (let i = 0; i < dataLength; i++) {
                                data[i].CONTROL_STATUS = 'ORD001';
                            }

                            let parameters = {
                                'url': '/registerNewOrderConfirm',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
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
                                'url': '/registerNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
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
            resizable: true,
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
                    const mainInspectionList = fnGetCommCodeGridSelectBox('1052');
                    const workTypeList = fnGetCommCodeGridSelectBox('1033');
                    const workFactoryList = fnGetCommCodeGridSelectBox('1014');
                    const materialDetailList = fnGetCommCodeGridSelectBox('1027');
                    const materialKindList = fnGetCommCodeGridSelectBox('1029');
                    const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                    let rowListConvert = [];

                    for (let i = 0; i < addListLength; i++) {
                        const newRowData = ui.addList[i].newRow;
                        const rowIndx = ui.addList[i].rowIndx;
                        let compCd = null;
                        let orderCompCd = null;
                        let mainInspection = null;
                        let workType = null;
                        let workFactory = null;
                        let materialDetail = null;
                        let materialKind = null;
                        let surfaceTreat = null;

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
            {title: '마감금액', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'}
        ];
        let controlCloseLeftObj = {
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
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
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '변경후 마감금액', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {
                title: '추가 금액', align: 'center', colModel: [
                    {title: '', datatype: 'string', dataIndx: 'ADD_QTY'},
                    {title: '', datatype: 'integer', format: '#,###', dataIndx: 'ADD_UNIT_FINAL_AMT'}
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
        /* variable */

        /* function */
        let changeDate = function (newDate = new Date(), today = new Date()) {
            console.group('changeDate');
            $('#CONTROL_MANAGE_START_DATE').val(newDate.yyyymmdd());
            $('#CONTROL_MANAGE_END_DATE').val(today.yyyymmdd());
            console.groupEnd();
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
                orderCompCdStr += orderCompCdList[i];

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
                    console.log(closeVer);
                    $('#CONTROL_CLOSE_FORM #CLOSE_VER').val(closeVer).prop('selected', true);
                }, parameters, '');
            }

            $controlCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CONTROL_CLOSE_FORM'));
            });
            $controlCloseLeftGrid.pqGrid('refreshDataAndView');

            let controlCloseRightPostData = fnFormToJsonArrayData('#CONTROL_CLOSE_FORM');
            controlCloseRightPostData.list = list;
            let parameters = {
                'url': '/selectControlCloseRightList',
                'data': {data: JSON.stringify(controlCloseRightPostData)}
            };

            fnPostAjax(function (data) {
                $controlCloseRightGrid.pqGrid('option', 'dataModel.data', data.list);
                $controlCloseRightGrid.pqGrid('refresh');
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
        }
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

        $('#CONTROL_MANAGE_SAVE').on('click', function () {
            const updateQueryList = ['updateControlMaster', 'updateControlPart', 'updateControlPartOrder', 'insertControlProgress', 'insertControlPartProgress'];

            fnModifyPQGrid($orderManagementGrid, [], updateQueryList);
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
        $('#SPECIFICATION_ON_TRANSACTION').on('click', function () {
            let gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            console.log(gridData);
            alert('개발중입니다.');
        });
        // 견적자동계산
        $('#ESTIMATE_AUTOMATIC_CALCULATION').on('click', function () {
            alert('개발중입니다.');
        });
        // 견적List출력
        $('#ESTIMATE_LIST_PRINT').on('click', function () {
            alert('개발중입니다.');
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
                $("#drawingPrintMessageHtml").html(selectedRowCount + " 건의 바코드 도면이 출력 됩니다.");
                commonDrawingPrintPopup.show();
                $("#drawingPrintActionBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonDrawingPrintPopup.hide();
                    $(this).startWaitMe();
                    $(".cadDrawingPrint").html(printHtml).trigger('create');
                    callback(true);
                    return;
                });
                $(".drawingPrintCloseBtn").unbind().click(function(e) {
                    e.stopPropagation();
                    commonDrawingPrintPopup.hide();
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
            alert('개발중입니다.');
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
                $("#drawingPrintMessageHtml").html(selectedRowCount + " 건의 바코드 도면이 출력 됩니다.");
                commonDrawingPrintPopup.show();
                $("#drawingPrintActionBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonDrawingPrintPopup.hide();
                    $(this).startWaitMe();
                    $(".cadDrawingPrint").html(printHtml).trigger('create');
                    callback(true);
                    return;
                });
                $(".drawingPrintCloseBtn").unbind().click(function(e) {
                    e.stopPropagation();
                    commonDrawingPrintPopup.hide();
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

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                rowData.CLOSE_VER = $('#CLOSE_VER').val();
                rowData.CLOSE_MONTH = $('#CONTROL_CLOSE_YEAR').val() + $('#CONTROL_CLOSE_MONTH').val();
                list.push(rowData);
            }

            // rightGrid
            let parameters = {'url': '/insertMonthFinishClose', 'data': {data: JSON.stringify(list)}};
            fnPostAjax(function (data, callFunctionParam) {
                $orderManagementGrid.pqGrid('refreshDataAndView');
                $controlCloseLeftGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        /* 견적등록 */
        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_COMP_CD"), 'sel', {
            "url": "/json-list",
            "data": {"queryId": 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#COMP_CD"), 'sel', {
            "url": "/json-list",
            "data": {"queryId": 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#EST_USER_ID"), 'sel', {
            "url": "/json-list",
            "data": {"queryId": 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {
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
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
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
                    if (ui.source === 'edit') {
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


            $("#control_estimate_register_info_form #ORDER_COMP_CD").on('change', function () {
                let compCd = $(this).val();

                fnCommCodeDatasourceSelectBoxCreate($("#control_estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {
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
                    $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);

                    parameters = {'url': '/json-create', 'data': $("#control_estimate_register_info_form").serialize()};
                    fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

                }, parameters, '');
            });

            function estimateRegisterReloadPageData() {
                let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
                let postData = {'queryId': 'estimate.selectLastValEstimateMasterInfo', 'EST_SEQ': EST_SEQ};

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

                    postData = {'queryId': 'estimate.selectLastValEstimateDetailList', 'EST_SEQ': EST_SEQ};
                    fnRequestGidData(estimateRegisterTopGrid, postData);

                    $("#estimate_register_excel_download #EST_SEQ").val(EST_SEQ);
                    $("#control_estimate_register_info_form #EST_SEQ").val(EST_SEQ);
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
