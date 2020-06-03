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
            <button type="button" class="defaultBtn btn-120w" data-toggle="modal" data-target="#REQUEST_OUTSIDE_POPUP">
                외주가공 요청
            </button>
            <button type="button" class="defaultBtn btn-120w" data-toggle="modal" data-target="#CANCEL_REQUEST_OUTSIDE_POPUP">
                가공요청 취소
            </button>
            <button type="button" class="defaultBtn btn-120w" id="ORDER_EXTRACTION">발주서 추출</button>
            <button type="button" class="defaultBtn btn-120w" data-toggle="modal" data-target="#OUTSIDE_CLOSE_POPUP">외주마감
            </button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="DRAWING_VIEW">도면 View</button>
                <button type="button" class="defaultBtn btn-120w red" id="OUTSIDE_ORDER_MANAGE_DELETE">삭제</button>
                <button type="button" class="defaultBtn btn-120w green" id="OUTSIDE_ORDER_MANAGE_SAVE">저장</button>
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
        <button type="button" class="pop_close">닫기</button>

        <!-- 버튼 -->
        <div class="buttonWrap" style="display: block; overflow: hidden;">
            <div class="right_float">
                <button class="popupBtn green" id="REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
            </div>
        </div>

        <div>
            <label for="">요청 외주 업체</label>
            <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <option></option>
            </select>
        </div>

        <form class="form-inline" name="REQUEST_OUTSIDE_MAIL_FORM" id="REQUEST_OUTSIDE_MAIL_FORM" role="form">
            <input type="hidden" id="queryId" name="queryId" value="">
            <input type="hidden" id="EST_SEQ" name="EST_SEQ" value="">
            <h5>메일내용</h5>
            <div>
                <textarea class="col-md-12 col-sm-12" name="EMAIL_CONTENT_TXT" id="REQUEST_OUTSIDE_EMAIL_CONTENT_TXT" style="height: 100px;"> </textarea>
            </div>
            <h5>메일수신처</h5>
            <div id="REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>

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
        <form class="form-inline" id="OUTSIDE_PROCESS_REQUEST_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="OUTSIDE_REQUEST_GRID"></div>
        </form>
    </div>
</div>

<div class="popup_container" id="CANCEL_REQUEST_OUTSIDE_POPUP" style="display: none;">
    <div class="layerPopup" style="overflow: scroll;">
        <h3 style="margin-bottom: 10px;">외주 가공 취소 요청</h3>
        <button type="button" class="pop_close">닫기</button>

        <!-- 버튼 -->
        <div class="buttonWrap" style="display: block; overflow: hidden;">
            <div class="right_float">
                <button class="popupBtn green" id="CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT">저장 & 제출</button>
            </div>
        </div>

        <div>
            <label for="">요청 외주 업체</label>
            <select class="" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <option></option>
            </select>
        </div>

        <form class="form-inline" name="CANCEL_REQUEST_OUTSIDE_MAIL_FORM" id="CANCEL_REQUEST_OUTSIDE_MAIL_FORM" role="form">
            <input type="hidden" id="queryId" name="queryId" value="">
            <input type="hidden" id="EST_SEQ" name="EST_SEQ" value="">
            <h5>메일내용</h5>
            <div>
                <textarea class="col-md-12 col-sm-12" name="CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT" id="CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT" style="height: 100px;"> </textarea>
            </div>
            <h5>메일수신처</h5>
            <div id="CANCEL_REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID"></div>

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
        <form class="form-inline" id="CANCEL_REQUEST_OUTSIDE_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectOutsideProcessRequestList"/>
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ"/>
            <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ"/>
            <div id="CANCEL_REQUEST_OUTSIDE_GRID"></div>
        </form>
    </div>
</div>

<div class="popup_container" id="OUTSIDE_CLOSE_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3> 마감 진행(외주주문)</h3>
        <hr>
        <button type="button" class="pop_close OUTSIDE_CLOSE_NO">닫기</button>
        <div class="buttonWrap">
            <form class="form-inline" id="OUTSIDE_CLOSE_LEFT_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseLeftList">
                <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
                <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <div class="leftbuttonWrap">
                    <div class="d-inline-block">
                        <label for="OUTSIDE_CLOSE_YEAR"></label>
                        <select name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR">
                            <option></option>
                        </select>
                    </div>
                    <div class="d-inline-block">
                        <label for="OUTSIDE_CLOSE_MONTH"></label>
                        <select name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH">
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
                <span class="arrow right_Arrow"></span>
            </div>
            <div style="width: 450px; float:left;">
                <div id="OUTSIDE_CLOSE_RIGHT_GRID"></div>
            </div>
        </div>

        <div class="text-center">
            <button class="defaultBtn" id="OUTSIDE_CLOSE_YES">저장</button>
            <button class="defaultBtn OUTSIDE_CLOSE_NO">닫기</button>
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
        let selectedRowIndex = [];
        let $outsideOrderManageGrid;
        const gridId = 'OUTSIDE_ORDER_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM');
        const colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: '담당자', dataType: 'integer', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN'},
            {title: '원발주<br>상태', dataType: 'string', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'OUTSIDE_STATUS'},
            {title: '상태변경<br>일시', dataType: 'string', dataIndx: 'OUTSIDE_STATUS_DT'},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', editable:true,
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
            {title: '입고일자', dataType: 'string', dataIndx: 'DLQRHDLFWK'},
            {title: '외주<br>발주번호', dataType: 'string', dataIndx: 'OUTSIDE_ORDER_NUM', editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'OUTSIDE_NOTE', editable: true},
            {title: '비고(주문)', dataType: 'select', dataIndx: 'NOTE'},
            {title: '', width: 10, dataType: 'string', dataIndx: 'RHKSFLQJSGH'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {title: '', width: 10, dataType: 'string', dataIndx: 'EHAUSQJSGH'},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '자재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', editable: true},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '사급<br>여부', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '소재<br>제공', dataType: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN', editable: true,
                editor: {type: 'select',
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
                title: '요청 가공 사항', align: 'center', colModel: [
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
                        title: '표면처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', editable: true,
                        type: 'checkbox',
                        cb: {
                            all: false, //header checkbox to affect checkboxes on all pages.
                            header: false, //for header checkbox.
                            check: 'Y', //check the checkbox when cell value is "YES".
                            uncheck: 'N' //uncheck when "NO".
                        }
                    },
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', editable: true}
                ]
            },
            {title: '요망납기', dataType: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT', editable: true},
            {title: '외주<br>확정단가', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT', editable: true},
            {title: '금액<br>합계', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '외주<br>종전가', dataType: 'string', dataIndx: 'DHLWNWHDWJSRK'},
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
            {title: '원주문<br>확정 일시', datatype: 'string', dataIndx: 'CONTROL_STATUS_DATE'},
            {title: '외주가공<br>요청일시', dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DATE'},
            {title: '외주가공<br>마감일시', dataType: 'string', dataIndx: 'OUTSIDE_FINISH_DATE'},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT'}
        ];
        const obj = {
            minHeight: '100%',
            height: 750,
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
            height: 100,
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
        const outsideProcessRequestGridId = 'OUTSIDE_REQUEST_GRID';
        const outsideProcessRequestColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '규격', minWidth: 110, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '자재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '표면<br>처리', minWidth: 70, dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'}, // 확인 필요
            {title: '소재<br>제공', dataType: 'bool', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN'}, // 확인 필요
            {
                title: '요청가공', align: 'center', colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '표면<br>처리', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
                    },
                    {
                        title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', editable: true,
                        type: 'checkbox', cb: {all: false, header: false, check: 'Y', uncheck: 'N'}
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
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
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
        let $cancelMailRecipientGrid;
        const cancelMailRecipientGridId = 'CANCEL_REQUEST_OUTSIDE_MAIL_RECIPIENT_GRID';
        const cancelMailRecipientObj = {
            height: 100,
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

        let $cancelRequestOutsideGrid;
        const cancelRequestOutsideGridId = 'OUTSIDE_REQUEST_GRID';
        const cancelRequestOutsideObj = {
            height: 200,
            collapsible: false,
            resizable: true,
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
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '마감금액', dataType: 'string', dataIndx: 'TOTAL_AMT'}
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
            {title: '변경후 마감금액', dataType: 'string', dataIndx: 'TOTAL_AMT'},
            {
                title: '추가 금액', align: 'center', colModel: [
                    {title: '', datatype: 'string', dataIndx: 'ADD_QTY'},
                    {title: '', datatype: 'string', dataIndx: 'ADD_UNIT_FINAL_AMT'}
                ]
            }
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

        const loadOutsideProcessData = function () {
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

            $('#OUTSIDE_PROCESS_REQUEST_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#OUTSIDE_PROCESS_REQUEST_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);

            $outsideProcessRequestGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#OUTSIDE_PROCESS_REQUEST_FORM'));
            });
            $outsideProcessRequestGrid.pqGrid('refreshDataAndView');
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

            $('#CANCEL_REQUEST_OUTSIDE_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CANCEL_REQUEST_OUTSIDE_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);

            $cancelRequestOutsideGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CANCEL_REQUEST_OUTSIDE_FORM'));
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

        // topWrap 확장 함수
        const topMenuOpen = function () {
            let top = $('#view_tab_100031 .gubunWrap');
            let bottom = $('#view_tab_100031 .bottomWrap');
            let con = $('#view_tab_100031 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '130px'}, 300, 'easeOutCubic');
            bottom.stop().animate({'height': '770px'}, 300, 'easeOutCubic');
            con.css({'height': '640px'});

            $outsideOrderManageGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        // topWrap 축소 함수
        const topMenuClose = function () {
            let top = $('#view_tab_100031 .gubunWrap');
            let bottom = $('#view_tab_100031 .bottomWrap');
            let con = $('#view_tab_100031 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '40px'}, 300, 'easeInCubic');
            bottom.stop().animate({'height': '855px'}, 300, 'easeOutCubic');
            con.css({'height': '764px'});

            $outsideOrderManageGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
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
        /* function */

        /* event */
        $('[name=OUTSIDE_MANAGE_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();
            console.log(value);
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

            // $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').prop('checked', true);
            // createOrDestroyDatepicker();
        });

        $('#REQUEST_OUTSIDE_POPUP').on('show.bs.modal', function () {
            if (noSelectedRowAlert()) {
                return false;
            }

            $mailRecipientGrid = $('#' + mailRecipientGridId).pqGrid(mailRecipientObj);
            $outsideProcessRequestGrid = $('#' + outsideProcessRequestGridId).pqGrid(outsideProcessRequestObj);
            loadOutsideProcessData();

            // let mail_data = CKEDITOR.instances.REQUEST_OUTSIDE_EMAIL_CONTENT_TXT.getData();
            // console.log(mail_data);
            // $("#REQUEST_OUTSIDE_EMAIL_CONTENT_TXT").val('mail_data');

        });

        $('#CANCEL_REQUEST_OUTSIDE_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                $cancelMailRecipientGrid = $('#' + cancelMailRecipientGridId).pqGrid(cancelMailRecipientObj);
                $cancelRequestOutsideGrid = $('#' + cancelRequestOutsideGridId).pqGrid(cancelRequestOutsideObj);
                loadCancelRequestOutsideData();
            },
            'hide.bs.modal': function () {

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

                fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR', 3);
                fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH', CURRENT_YEAR);

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
                rowData.CLOSE_MONTH = $('#OUTSIDE_CLOSE_YEAR').val() + $('#OUTSIDE_CLOSE_MONTH').val();
                list.push(rowData);
            }

            let parameters = {'url': '/createOutsideClose', 'data': {data: JSON.stringify(list)}}
            fnPostAjax(function (data, callFunctionParam) {
                $outsideOrderManageGrid.pqGrid('refreshDataAndView');
                // $outsideCloseLeftGrid.pqGrid('refreshDataAndView');
                $('#OUTSIDE_CLOSE_POPUP').modal('hide');
            }, parameters, '');
        });

        $('.OUTSIDE_CLOSE_NO').on('click', function () {
            console.log('click');
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

        });

        $('.pop_close').on('click', function () {
            $(this).parent('.layerPopup').parent('.popup_container').modal('hide');
        });

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
        CKEDITOR.replace('REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 176});
        function getCadUploadBlankHtml(){
            return'<tr><td colspan="3" class="spanArea" >마우스로 파일을 Drag & Drop 하세요.</td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>';
        }

        // let estimateRegisterBotGrid = $("#control_estimate_register_bot_grid");
        // const estimateRegisterBotColModel= [
        //     {title: '성함', dataType: 'string', dataIndx: 'RECEIVER_NM', minWidth: "30%"},
        //     {title: '메일주소', dataType: 'string', dataIndx: 'RECEIVER_EMAIL', minWidth: "30%"},
        //     {title: '전화번호', dataType: 'string', dataIndx: 'RECEIVER_TEL', minWidth: "30%"},
        //     {title: '', dataType: 'string', dataIndx: 'SEQ', editable: false, width: 30 ,
        //         render: function (ui) {
        //             return '<button id="receiverRemove" class="ui-icon ui-icon-close" style="cursor: pointer"></button>'
        //         },
        //         postRender: function (ui) {
        //             let grid = this;
        //             let $cell = grid.getCell(ui);
        //             let rowIndex = ui.rowIndx;
        //             $cell.find('#receiverRemove').on('click', function (event) {
        //                 let parameter = {
        //                     'queryId': 'deleteEstimateEachReceiver',
        //                     'SEQ': ui.rowData.SEQ
        //                 };
        //                 let parameters = {'url': '/json-remove', 'data': parameter};
        //                 fnPostAjax(function(data, callFunctionParam){
        //                     estimateRegisterBotGrid.pqGrid('deleteRow', { rowIndx: rowIndex });
        //                 }, parameters, '');
        //             });
        //         }
        //     }
        //     //{title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden: true }
        // ];

        // 파일 업로드
        let fileHtml = getCadUploadBlankHtml();
        $('#REQUEST_OUTSIDE_POPUP #attachDragAndDrop > tbody').html('');
        $('#REQUEST_OUTSIDE_POPUP #attachDragAndDrop > tbody').append(fileHtml).trigger('create');

        const outsideRequestConfirm = function () {
            let headHtml = 'messsage', bodyHtml = '', yseBtn = '예', noBtn = '아니오';
            let autoEmailYn = $('#estimateRegisterAutoEmailSend').is(':checked');

            bodyHtml =
                '<h4>\n' +
                '        <span>이미 가공이 진행되고 있을 수 있습니다. 반드시 해당업체 확인 후에 진행바랍니다. 취소 진행 및 메일발송을 진행하시겠습니까?</span>\n' +
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
                    outsideRequestSave();
                    outsideRequestSendEmail();
                    // $("#estimate_register_info_form #queryId").val('mail.insertEstimateSubmitMail');
                }
            });
        };

        const outsideRequestSave = function () {
            const updateQueryList = ['outMapper.updateOutsideProcessRequest'];

            fnModifyPQGrid($outsideProcessRequestGrid, [], updateQueryList);
        };

        const outsideRequestSendEmail = function () {
            let parameters = {
                'url': '/json-create',
                'data': {queryId: 'mail.insertOutsideRequestSubmitMail'}
            };
            fnPostAjax(function (data, callFunctionParam) {
                console.log(data);
            }, parameters, '');
        };

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });

        $('#REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', function (){
           /* real
           let success = false;
            success = requestSave();
            if (success) {
                reqeustSendEmail();
            }*/
           //test

            outsideRequestConfirm();
        });
        /* 가공 요청*/

        /* 가공 취소 요청 */
        CKEDITOR.replace('CANCEL_REQUEST_OUTSIDE_EMAIL_CONTENT_TXT', {height: 176});
        $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #attachDragAndDrop > tbody').html('');
        $('#CANCEL_REQUEST_OUTSIDE_MAIL_FORM #attachDragAndDrop > tbody').append(fileHtml).trigger('create');

        const cancelRequestOutsideConfirm = function () {
            let headHtml = 'messsage', bodyHtml = '', yseBtn = '예', noBtn = '아니오';
            let autoEmailYn = $('#estimateRegisterAutoEmailSend').is(':checked');

            bodyHtml =
                '<h4>\n' +
                '        <span>이미 가공이 진행되고 있을 수 있습니다. 반드시 해당업체 확인 후에 진행바랍니다. 취소 진행 및 메일발송을 진행하시겠습니까?</span>\n' +
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
                    cancelRequestOutsideSave();
                    cancelRequestOutsideSendEmail();
                    // $("#estimate_register_info_form #queryId").val('mail.insertEstimateSubmitMail');
                }
            });
        };

        const cancelRequestOutsideSave = function () {
            const updateQueryList = ['outMapper.updateOutsideProcessRequest'];

            fnModifyPQGrid($outsideProcessRequestGrid, [], updateQueryList);
        };

        const cancelRequestOutsideSendEmail = function () {
            let parameters = {
                'url': '/json-create',
                'data': {queryId: 'mail.insertOutsideRequestSubmitMail'}
            };
            fnPostAjax(function (data, callFunctionParam) {
                console.log(data);
            }, parameters, '');
        };

        fnCommCodeDatasourceSelectBoxCreate($('#REQUEST_OUTSIDE_POPUP').find('#OUTSIDE_COMP_CD'), 'select', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });

        $('#CANCEL_REQUEST_OUTSIDE_SAVE_SUBMIT').on('click', function (){
            /* real
            let success = false;
             success = cancelRequestOutsideSave();
             if (success) {
                 cancelRequestOutsideSendEmail();
             }*/
            //test

            cancelRequestOutsideConfirm();
        });
        /* 가공 취소 요청 */



        /* init */
    });
</script>