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

<div id="order_manage_div" class="page estimate">
    <div class="topWrap">
        <form class="form-inline" name="ORDER_MANAGE_SEARCH_FORM" id="ORDER_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectOrderManageList">
            <div class="gubunWrap" style="height: 106px;">
                <ul>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="REGIST_NUM">접수번호</label>
                            <input type="search" class="wd_200" name="REGIST_NUM" id="REGIST_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <input type="text" class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="발주사" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">작업지시번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CONTROL_MANAGE_EXCEL_EXPORT"><img src="${pageContext.request.contextPath}/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="ORDER_MANAGE_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="search" class="wd_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업형태</label>
                            <input type="text" class="wd_200" name="WORK_TYPE" id="WORK_TYPE" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="작업형태" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_STATUS">주문상태</label>
                            <input type="text" class="wd_200" name="ORDER_STATUS" id="ORDER_STATUS" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="소재형태" readonly>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt" style="width: 120px;">
                            <label for="ORDER_SEARCH_CONDITION"></label>
                            <select name="ORDER_SEARCH_CONDITION" id="ORDER_SEARCH_CONDITION" style="width: inherit; text-align-last: center;">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1092}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                            </select>
                        </span>
                        <div class="d-inline-block" style="width:260px">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="ORDER_MANAGE_START_DATE" id="ORDER_MANAGE_START_DATE" readonly><button type="button" id="ORDER_MANAGE_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="ORDER_MANAGE_END_DATE" id="ORDER_MANAGE_END_DATE" readonly><button type="button" id="ORDER_MANAGE_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <span id="order_manage_amount_summary_area" style="padding-left: 10px;">
                                <span class="chk_box">
                                    <input name="AMOUNT_SUMMARY" id="AMOUNT_SUMMARY" type="checkbox">
                                    <label for="AMOUNT_SUMMARY" id="amount_summary_html"> 공급 금액 합계 </label>
                                    <input type="search" class="wd_150" name="AMOUNT_SUMMARY_INPUT" id="AMOUNT_SUMMARY_INPUT" disabled>
                                </span>
                            </span>
                        </span>
                        <span class="gubun" style="margin-left: 2px;"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SIZE_TYPE">규격</label>
                            <select class="wd_100" style="width: 98px !important;" name="SIZE_TYPE" id="SIZE_TYPE" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="slt_wrap" id="SIZE_W">
                            <label class="label_8">W</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_H">
                            <label class="label_8">H</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_T">
                            <label class="label_8">T</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_D" style="display: none;">
                            <label class="label_8">D</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_L" style="display: none;">
                            <label class="label_8">L</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_L_F" id="SIZE_L_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_L_T" id="SIZE_L_T" placeholder="To" disabled>
                        </span>
                        <span class="gubun"></span>
                    </li>
<%--                    <li>--%>
<%--                        <span>--%>
<%--                            <span class="ipu_wrap"><label class="label_100">Option</label></span>--%>
<%--                            <span class="chk_box"><input name="HIDE_CONTROL_NUM" id="HIDE_CONTROL_NUM" type="checkbox"><label for="HIDE_CONTROL_NUM"> 작업지시정보 제외</label></span>--%>
<%--                        </span>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </form>
<%--        <button type="button" class="topWrap_btn" id="ORDER_MANAGE_TOP_WRAP_BTN">펼치기 / 접기</button>--%>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap mb-10">
            <div>
                <button type="button" class="defaultBtn btn-100w" id="NEW_ORDER_REGISTRATION">신규 주문 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="ORDER_DRAWING_REGISTRATION">도면 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_CHANGE">도면변경(Rev. up)</button>
<%--                <button type="button" class="defaultBtn btn-70w" id="MATCH_STOCK">재고충당</button>--%>
                <button type="button" class="defaultBtn btn-70w" id="ESTIMATE_REGISTER_FROM_CONTROL">견적등록</button>
                <button type="button" class="defaultBtn btn-70w" id="TRANSACTION_STATEMENT">거래명세표</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="ORDER_CONFIRMATION" data-control_status="REG001" style="color: blue;">확정</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="ORDER_CANCEL" data-control_status="REG002" style="color: #FF0000;">취소</button>
                <button type="button" class="defaultBtn btn-50w" id="ORDER_MONTH_CLOSE">마감</button>
                <button type="button" class="defaultBtn btn-70w" id="CANCEL_ORDER_MONTH_CLOSE">마감취소</button>
<%--                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="HOLD" data-control_status="ORD005">보류</button>--%>
<%--                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="TERMINATION" data-control_status="ORD004">종료</button>--%>
                <div class="rightSpan">
<%--                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_DRAWING_VIEW">도면 View</button>--%>
                    <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_LIST_PRINT">견적 List</button>
                    <button type="button" class="defaultBtn btn-100w" id="ORDER_ESTIMATE_DRAWING_PRINT">견적도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="ORDER_MANAGE_DRAWING_PRINT">도면 출력</button>
<%--                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_BARCODE_PRINT">바코드 출력</button>--%>
                    <button type="button" class="defaultBtn btn-100w" id="ORDER_MANAGE_LABEL_PRINT">라벨 출력</button>
                </div>
            </div>
            <div class="mt-10">
                <div class="d-inline" style="margin-left: 4px;margin-right: 74px;">
                    <label for="orderManageFilterKeyword"></label><input type="search" id="orderManageFilterKeyword" placeholder="Enter your keyword">
                    <label for="orderManageFrozen" class="label_30" style="font-size: 15px;">Fix</label>
                    <select id="orderManageFrozen" name="orderManageFrozen">
                    </select>
                    <label for="orderManageFilterColumn" style="display: none;"></label>
                    <select id="orderManageFilterColumn" style="display: none;"></select>
                    <label for="orderManageFilterCondition" style="display: none;"></label>
                    <select id="orderManageFilterCondition" style="display: none;">
                        <option value="contain">Contains</option>
                    </select>
                </div>
<%--                <button type="button" name="ORDER_MANAGE_VIEW" id="CONTROL_MANAGE_NORMAL_MODE">일반모드</button>--%>
                <button type="button" name="ORDER_MANAGE_VIEW" id="CONTROL_MANAGE_ALL_MODE">전체모드</button>
                <button type="button" class="virtual-disable" name="ORDER_MANAGE_VIEW" id="CONTROL_MANAGE_INPUT_MODE">입력필드</button>
                <button type="button" class="virtual-disable" name="ORDER_MANAGE_VIEW" id="CONTROL_MANAGE_CLOSE_MODE">마감모드</button>
                <div class="rightSpan">
                    <span class="slt_wrap namePlusSlt">
                        <label for="SUPPLY_UNIT_COST_APPLY">공급단가적용</label>
                        <select id="SUPPLY_UNIT_COST_APPLY" title="공급단가적용">
                            <option value="0"><spring:message code="com.form.top.sel.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1088}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
<%--                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MERGE" style="background-color: #5b9bd5">Merge</button>--%>
                    <button type="button" class="defaultBtn btn-100w red" id="ORDER_MANAGE_DELETE">삭제</button>
                    <button type="button" class="defaultBtn btn-100w green" id="ORDER_MANAGE_SAVE">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="ORDER_MANAGE_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="ORDER_MANAGE_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="popup_container" id="CONTROL_CLOSE_CANCEL_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3>월 마감 취소 진행</h3>
        <hr>
        <button type="button" class="pop_close" name="CONTROL_CLOSE_CANCEL_NO">닫기</button>
        <div class="d-inline-block">
            <form class="form-inline" id="CONTROL_CLOSE_CANCEL_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseCancelLeftList">
                <input type="hidden" name="ORDER_SEQ" id="ORDER_SEQ">
                <div style="width: 450px; float:left;">
                    <div id="CONTROL_CLOSE_CANCEL_LEFT_GRID"></div>
                </div>
                <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
                </div>
                <div style="width: 450px; float:left;">
                    <div id="CONTROL_CLOSE_CANCEL_RIGHT_GRID"></div>
                </div>
            </form>
        </div>

        <div class="text-center">
            <button type="button" class="defaultBtn greenPopGra" id="CONTROL_CLOSE_CANCEL_YES">저장</button>
            <button type="button" class="defaultBtn grayPopGra" name="CONTROL_CLOSE_CANCEL_NO">닫기</button>
        </div>
    </div>
</div>

<form id="control_estimate_list_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="excel.selectControlEstimateDetailListExcel_NEW"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="ORDER_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="control_estimate_list_template"/>
</form>

<input type="button" id="ATTACHMENT_BUTTON" style="display: none;">

<script>
    var $orderManagementGrid;
    var selectedOrderManagementRowIndex = [];
    $(function () {
        'use strict';
        /* variable */
        const FAMILY_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
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

            fnPostAjax(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, compCd: obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();

        const gridId = 'ORDER_MANAGE_GRID';
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'ORDER_STATUS', hidden: true},
                    {title: '상태', minWidth: 30, dataIndx: 'ORDER_STATUS_NM'},
                    {title: '일자', dataIndx: 'ORDER_STATUS_DT', format: 'mm/dd',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData.substring(0, 5);
                        }
                    }
                ]
            },
            {
                title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1017')}
            },
            {
                title: '사업자<br>구분', width: 75, dataIndx: 'COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: FAMILY_COMPANY}
            },
            {
                title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY}
            },
            {
                title: '비고', align: 'left', width: 100, dataIndx: 'NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                }
            },
            {
                title: '접수번호', align: 'left', width: 180, dataIndx: 'REGIST_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#FF0000'},
                style: {'font-weight': 'bold', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                }
            },
            {
                title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                }
            },
            {title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON', styleHead: {'background':'#a9d3f5'},
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ, rowData);
                    });
                }
            },
            {
                title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                        }
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                        }
                    }
                ]
            },
            {title: 'ORDER_DUE_DT_COPY', dataType: 'String', dataIndx: 'ORDER_DUE_DT_COPY', hidden: true},
            {
                title: '발주납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {type: 'textbox', init: fnDateEditor},
                render: function (ui) {
                    let rowData = ui.rowData;
                    rowData.ORDER_DUE_DT_COPY = ui.cellData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')}
            },
            {
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1059')},
            },
            {title: '주요<br>검사', width: 50, dataIndx: 'MAIN_INSPECTION_NM', hidden: true},
            {
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002' ;
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                }
            },
            {
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let rowData = ui.rowData;

                        if (rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002') {
                            return fnGetCommCodeGridSelectBox('1027');F
                        } else { // 확정
                            return fnGetCommCodeGridSelectBoxEtc('1027', rowData.MATERIAL_TYPE);
                        }
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = null;
                    let index = -1;
                    let options = fnGetCommCodeGridSelectBox('1027');

                    index = options.findIndex(function (element) {
                        return element.value === cellData;
                    });
                    if (index > -1) cellData = options[index].text;

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1039')
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '소재<br>비고', width: 80, dataIndx: 'MATERIAL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                }
            },
            {
                title: '특수처리', align: 'center', dataIndx: 'SPECIAL_TREATMENT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: [
                        {'value':'MATERIAL_FINISH_GRIND_YN', 'text':'연마'},
                        {'value':'MATERIAL_FINISH_HEAT_YN', 'text':'열처리'}
                    ]
                },
            },
            {
                title: '작업지시번호', align: 'left', width: 140, dataIndx: 'CONTROL_NUM',
                editable: false
            },
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '가공확정', minWidth: 60, dataIndx: 'PART_STATUS'},
            {title: 'INV No.', width: 100, dataIndx: 'INVOICE_NUM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '출하', align: 'center',
                colModel: [
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'OUT_QTY'},
                    {title: '일자', dataType: 'date', dataIndx: 'OUT_FINISH_DT'}
                ]
            },
            {
                title: '반품', align: 'center',
                colModel: [
                    {title: '발생', dataType: 'date', dataIndx: 'RETURN_INSERT_DT'},
                    {title: '조치', dataType: 'date', dataIndx: 'RETURN_FINISH_DT'}
                ]
            },
            {title: 'DELIVERY_DT_COPY', dataType: 'String', dataIndx: 'DELIVERY_DT_COPY', hidden: true},
            {
                title: '납품확인', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'DELIVERY_DT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {type: 'textbox', init: fnDateEditor},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    rowData.DELIVERY_DT_COPY = ui.cellData;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_TOTAL_AMT',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '계산<br>견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SUM_AUTO_AMT',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '종전가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '변경전 도면번호', align: 'left', width: 120, dataIndx: 'PREV_DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '모듈', align: 'left', width: 70, dataIndx: 'MODULE_NM', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '납품처', align: 'left', dataIndx: 'DELIVERY_COMP_NM', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        return COMPANY_STAFF.filter(function (value) {
                            return value.compCd === ui.rowData.ORDER_COMP_CD;
                        });
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData || ' ';
                    let rowData = ui.rowData;
                    let cls = null;

                    if (cellData === undefined || cellData === '') {
                        return '';
                    } else {
                        let index = COMPANY_STAFF.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = COMPANY_STAFF.findIndex(function (element) {
                                return element.value === Number(cellData);
                            });
                        }

                        return {cls: cls, text: (index < 0) ? cellData : COMPANY_STAFF[index].text};
                    }
                }
            },
            {
                title: '설계자', dataIndx: 'DESIGNER_NM', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.ORDER_STATUS != 'REG003';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: 'CAD', minWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'PDF', minWidth: 35, dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: 'Rev.', dataIndx: 'DRAWING_VER',
                render: function (ui) {
                    if (ui.cellData) return '<span id="drawingVerSpan" style="cursor: pointer;text-decoration: underline;">'+ui.cellData + '</span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#drawingVerSpan').bind('click', function () {
                        let rowData = ui.rowData;
                        drawingRevPopupWindow(rowData.ORDER_SEQ, rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: 'Rev. 일시', width: 120, dataIndx: 'DRAWING_UP_DT'},
            {
                title: '자동 계산견적 단가 (10원단위 반올림)', align: 'center',
                colModel: [
                    // {title: '합계', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {title: '소재비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_AUTO_AMT'},
                    {title: '표면처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SURFACE_AUTO_AMT'},
                    {title: '가공비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_PROCESS_AUTO_AMT'},
                    // {title: '연마비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT'},
                    // {title: '열처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT'},
                    {
                        title: '기타추가', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_ETC_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '견적비고', align: 'left', dataIndx: 'UNIT_AMT_NOTE',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },
            {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '생성일시', width: 90, dataIndx: 'ORDER_INSERT_DT'},
            {title: 'CONTROL_BARCODE_NUM', dataIndx: 'CONTROL_BARCODE_NUM', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            height: 665,
            // virtualX: true,
            // virtualY: true,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            copyModel: {render: true},
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: controlManageFilterRender},
            filterModel: {mode: 'OR'},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            sortModel: {on: false},
            load: function () {
                if($('#orderManageFilterKeyword').val() !== '')
                    fnFilterHandler($orderManagementGrid, 'orderManageFilterKeyword', 'orderManageFilterCondition', 'orderManageFilterColumn');
                autoMerge(this, true);
                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#ORDER_MANAGE_RECORDS').html(data.length);
                amountSummaryHtml();
            },
            cellClick: function (event, ui) {
                supplyUnitCostInit(); // 공급단가적용 초기화
                // if(ui.rowData.IMG_GFILE_SEQ && typeof(windowImageViewer) != 'undefined' && !windowImageViewer.closed) callQuickRowChangeDrawingImageViewer(ui.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            selectChange: function (event, ui) {
                // alert("selectChange");
                supplyUnitCostInit(); // 공급단가적용 초기화
                selectedOrderManagementRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedOrderManagementRowIndex.push(i);
                    if (firstRow === lastRow) {
                        let selRowData = $orderManagementGrid.pqGrid("getRowData", {rowIndx: firstRow});
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData); // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                        // callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);
                    }else {
                        let selFirstRowData = $orderManagementGrid.pqGrid("getRowData", {rowIndx: firstRow});
                        let selLastRowData = $orderManagementGrid.pqGrid("getRowData", {rowIndx: lastRow});

                        if(selFirstRowData.REGIST_NUM == selLastRowData.REGIST_NUM) {
                            callQuickRowChangeDrawingImageViewer(selFirstRowData.IMG_GFILE_SEQ,selFirstRowData);
                        }
                    }
                }
                amountSummaryHtml();
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 18);
                // 필터 옵션 생성
                let filterOpts = '<option value=\"\">All Fields</option>';
                let frozenOts = '<option value="0">Selected</option>';

                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === false || column.hidden === undefined;
                    if (hiddenYn && column.title) {
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $('#orderManageFilterColumn').html(filterOpts);
                $('#orderManageFrozen').html(frozenOts);
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let updateListLength = ui.updateList.length;

                    for (let i = 0; i < updateListLength; i++) {
                        let newRowData = ui.updateList[i].newRow;
                        let rowIndx = ui.updateList[i].rowIndx;

                        // 단가확인
                        if (newRowData.hasOwnProperty('PRICE_CONFIRM')) {
                            let priceConfirmList = fnGetCommCodeGridSelectBox('1017');
                            let index = priceConfirmList.findIndex(function (element) {
                                return element.text === newRowData.PRICE_CONFIRM;
                            });

                            if (index < 0) {
                                index = priceConfirmList.findIndex(function (element) {
                                    return element.value === newRowData.PRICE_CONFIRM;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'PRICE_CONFIRM': priceConfirmList[index].value}
                            });
                        }
                        // 사업자 구분
                        if (newRowData.hasOwnProperty('COMP_CD')) {
                            let index = FAMILY_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index < 0) {
                                index = FAMILY_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.COMP_CD;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'COMP_CD': FAMILY_COMPANY[index].value}
                            });
                        }
                        // 발주업체
                        if (newRowData.hasOwnProperty('ORDER_COMP_CD')) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index < 0) {
                                index = ORDER_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.ORDER_COMP_CD;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'ORDER_COMP_CD': ORDER_COMPANY[index].value}
                            });
                        }
                        // 주요검사
                        if (newRowData.hasOwnProperty('MAIN_INSPECTION')) {
                            let mainInspectionList = fnGetCommCodeGridSelectBox('1059');
                            let index = mainInspectionList.findIndex(function (element) {
                                return element.text === newRowData.MAIN_INSPECTION;
                            });

                            if (index < 0) {
                                index = mainInspectionList.findIndex(function (element) {
                                    return element.value === newRowData.MAIN_INSPECTION;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MAIN_INSPECTION': mainInspectionList[index].value}
                            });
                        }
                        // 작업형태
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
                        // 소재종류
                        if (newRowData.hasOwnProperty('MATERIAL_DETAIL')) {
                            let materialDetailList = fnGetCommCodeGridSelectBox('1027');
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index < 0) {
                                index = materialDetailList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_DETAIL;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_DETAIL': materialDetailList[index].value}
                            });
                        }
                        // 소재형태
                        if (newRowData.hasOwnProperty('MATERIAL_KIND')) {
                            let materialKindList = fnGetCommCodeGridSelectBox('1029');
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index < 0) {
                                index = materialKindList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_KIND;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_KIND': materialKindList[index].value}
                            });
                        }
                        // 표면처리
                        if (newRowData.hasOwnProperty('SURFACE_TREAT')) {
                            let surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index < 0) {
                                index = surfaceTreatList.findIndex(function (element) {
                                    return element.value === newRowData.SURFACE_TREAT;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'SURFACE_TREAT': surfaceTreatList[index].value}
                            });
                        }
                        // 연마
                        if (newRowData.hasOwnProperty('MATERIAL_FINISH_GRIND')) {
                            let materialFinishGrindList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
                            let index = materialFinishGrindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_GRIND;
                            });

                            if (index < 0) {
                                index = materialFinishGrindList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_FINISH_GRIND;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_FINISH_GRIND': materialFinishGrindList[index].value}
                            });
                        }
                        // 열처리
                        if (newRowData.hasOwnProperty('MATERIAL_FINISH_HEAT')) {
                            let materialFinishHeatList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
                            let index = materialFinishHeatList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_HEAT;
                            });

                            if (index < 0) {
                                index = materialFinishHeatList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_FINISH_HEAT;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_FINISH_HEAT': materialFinishHeatList[index].value}
                            });
                        }
                    }
                }

                if (ui.source === 'edit' || ui.source === 'clear') {
                    let rowIndx = ui.updateList[0].rowIndx;
                    let data = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;
                    let row;

                    const estimateArray = ['ORDER_QTY', 'UNIT_FINAL_AMT'];
                    let estimateFlag = false;
                    for (let value of estimateArray) {
                        if (newRow.hasOwnProperty(value)) {
                            estimateFlag = true;
                            break;
                        }
                    }

                    if (estimateFlag) {
                        const ORDER_QTY = data.ORDER_QTY == null || data.ORDER_QTY === '' ? 0 : Number(data.ORDER_QTY); //발주 수량
                        let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || 0; // 최종 공급단가
                        let finalAmount = unitFinalAmount * ORDER_QTY;// 합계 금액

                        if (ui.updateList[0].newRow.UNIT_FINAL_AMT) {
                            row = {
                                'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                'FINAL_TOTAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                            };
                        } else {
                            // 파트
                            if (data.WORK_TYPE !== 'WTP050') {
                                row = {
                                    'UNIT_FINAL_AMT': ui.updateList[0].newRow.UNIT_FINAL_AMT, // 최종 공급단가
                                    'FINAL_TOTAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                                };
                            }
                        }

                        $orderManagementGrid.pqGrid('updateRow', {
                            rowIndx: rowIndx,
                            row: row,
                            checkEditable: false
                        });
                    }
                    $orderManagementGrid.pqGrid('refreshView');
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $orderManagementGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            beforePaste: function (evt, ui) {
                let CM = this.getColModel(),
                    rows = ui.rows,
                    area = ui.areas[0],
                    //r1 = area.r1,
                    c1 = area.c1;
                for (let i = 0; i < rows.length; i++) {
                    let row = rows[i];
                    for (let j = 0; j < row.length; j++) {
                        let column = CM[j + c1],
                            dt = column.dataType;
                        if (dt === 'integer' || dt === 'float') {
                            row[j] = row[j].replace(/[^(\d|.)]/g, '');
                        }else if(dt === 'date') {
                            let colName = column.dataIndx + "_COPY"
                            let dateCopy = $orderManagementGrid.pqGrid("getRowData", {rowIndx: area.r1})[colName];
                            if(typeof dateCopy != 'undefined' && dateCopy != null && dateCopy != '') {
                                row[j] = dateCopy;
                            }
                            if(row[j].indexOf("-") >= 0 ) {
                                row[j] = row[j].replace(/-/gi,"/");
                            }
                        }
                    }
                }
            }
        };
        let newOrderRegistrationPopup;
        let controlMonthClosePopup;
        let transactionStatementPopup;
        let $controlMergeGrid;
        /* variable */

        /* function */
        const changeViewColumn = function (elementId) {
            let $orderManagementGridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let Cols = $orderManagementGridInstance.Columns();
            let commArray = [
                'ORDER_STATUS_NM', 'ORDER_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD', 'NOTE', 'CONTROL_NUM', 'CONTROL_NUM_BUTTON',
                'MAIN_INSPECTION', 'DRAWING_NUM_BUTTON', 'REGIST_NUM', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT',
                'DELIVERY_DT', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ITEM_NM', 'SIZE_TXT', 'WORK_TYPE', 'MATERIAL_SUPPLY_YN',
                'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_FINISH_HEAT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'PREV_DRAWING_NUM'
            ];
            let array = [];
            const inputModeArray1 = [
                'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'MATERIAL_FINISH_GRIND', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'EST_TOTAL_AMT', 'PROJECT_NM', 'MODULE_NM',
                'DELIVERY_COMP_NM', 'LABEL_NOTE', 'SAME_SIDE_YN'
            ]
            const normalModeArray1 = [
                'OUT_QTY', 'OUT_FINISH_DT', 'INVOICE_NUM', 'FINAL_TOTAL_AMT', 'PREV_UNIT_FINAL_AMT', 'DETAIL_MACHINE_REQUIREMENT',
                'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ', 'DRAWING_VER', 'DRAWING_UP_DT',
                'CONTROL_PART_INSERT_UPDATE_DT', 'ORDER_IMG_GFILE_SEQ', 'SAME_SIDE_YN'
            ];
            const closeModeArray1 = [
                'INVOICE_NUM', 'OUT_QTY', 'OUT_FINISH_DT', 'CLOSE_DT', 'DETAIL_MACHINE_REQUIREMENT', 'UNIT_SUM_AUTO_AMT', 'MATERIAL_FINISH_GRIND',
                'UNIT_MATERIAL_AUTO_AMT', 'UNIT_MATERIA_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT', 'UNIT_PROCESS_AUTO_AMT',
                'UNIT_SURFACE_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'FINAL_TOTAL_AMT', 'PREV_UNIT_FINAL_AMT', 'PROJECT_NM', 'ORDER_STAFF_NM', 'ORDER_IMG_GFILE_SEQ',
                'MODULE_NM', 'DELIVERY_COMP_NM', 'LABEL_NOTE'
            ];
            const allModeArray1 = [
                'INVOICE_NUM', 'PROJECT_NM', 'MODULE_NM', 'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'DELIVERY_COMP_NM', 'LABEL_NOTE', 'SAME_SIDE_YN',
                'OUT_QTY', 'OUT_FINISH_DT', 'CLOSE_DT', 'MATERIAL_FINISH_GRIND', 'DETAIL_MACHINE_REQUIREMENT', 'UNIT_SUM_AUTO_AMT',
                'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'UNIT_MATERIAL_AUTO_AMT', 'UNIT_MATERIA_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT',
                'UNIT_SURFACE_AUTO_AMT', 'UNIT_PROCESS_AUTO_AMT', 'UNIT_SURFACE_AMT', 'FINAL_TOTAL_AMT', 'PREV_UNIT_FINAL_AMT', 'DXF_GFILE_SEQ', 'ORDER_IMG_GFILE_SEQ',
                'PDF_GFILE_SEQ', 'DRAWING_VER', 'DRAWING_UP_DT', 'ETC_GFILE_SEQ',
                'UNIT_MATERIAL_AUTO_AMT', 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT',
                'UNIT_SURFACE_AUTO_AMT', 'CONTROL_PART_INSERT_UPDATE_DT'
            ];

            switch (elementId) {
                case 'CONTROL_MANAGE_INPUT_MODE':
                    array = commArray.concat(inputModeArray1);
                    break;
                case 'CONTROL_MANAGE_NORMAL_MODE':
                    array = commArray.concat(normalModeArray1);
                    break;
                case 'CONTROL_MANAGE_CLOSE_MODE':
                    array = commArray.concat(closeModeArray1);
                    break;
                case 'CONTROL_MANAGE_ALL_MODE':
                    array = commArray.concat(allModeArray1);
                    break;
            }

            Cols.alter(function () {
                Cols.each(function (col) {
                    let flag = array.includes(col.dataIndx);
                    flag = !flag;
                    col.hidden = flag;
                    if (flag === false && col.parent !== undefined) {
                        col.parent.hidden = flag;
                    }
                });
            });
        };

        const getOrderStatusButton = function (event) {
            let orderStatus = event.target.dataset.control_status;
            confirmOrderStatus(orderStatus);
        };

        const confirmOrderStatus = function (orderStatus) {
            let orderStatusNm = '';
            let orderSeqList = [];

            switch (orderStatus) {
                case 'REG001':
                    orderStatusNm = '확정';
                    break;
                case 'REG002':
                    orderStatusNm = '확정취소';
                    break;
            }

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData  = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                orderSeqList[i] = rowData.ORDER_SEQ;
            }

            // 중복제거
            orderSeqList = [...new Set(orderSeqList)];
            let message =
                '<h4>\n' +
                '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                '    <span>선택하신 ' + orderSeqList.length + ' 건을 ' + orderStatusNm + '처리합니다. \n진행하시겠습니까?</span>\n' +
                '</h4>';
            fnConfirm(null, message, function () {updateOrderStatus(orderStatus)});
        };

        const updateOrderStatus = function (orderStatus) {
            let list = [];
            let orderStatusList = [];
            let message;
            let outsideFlag = false;
            let controlFlag = false;
            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                list[i] = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // 값 변경 전 이상 case 확인하기 위해 배열에 담는다.
                orderStatusList[i] = list[i].ORDER_STATUS || undefined;
                list[i].ORDER_STATUS = orderStatus;

                // if(list[i].OUTSIDE_YN == 'Y' && (list[i].OUTSIDE_STATUS == 'OST001' || list[i].OUTSIDE_STATUS == 'OST003')) {
                //     outsideFlag = true;
                // }
                if(typeof list[i].CONTROL_NUM != 'undefined' && list[i].CONTROL_NUM != null && list[i].CONTROL_NUM != '') {
                    controlFlag = true;
                }
            }


            // 중복제거
            orderStatusList = [...new Set(orderStatusList)];

            /**
             * 상태값이 다를 때
             * 이미 처리된 대상에 대해서 동일한 상태처리를 진행할 경우
             * 빈칸인 상태에서 취소를 진행하는 경우
             */
            if ((orderStatusList.length > 1 && !(orderStatusList.includes('REG002') && orderStatusList.includes(undefined))) || orderStatusList[0] === orderStatus) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>상태변경이 불가한 대상이 있습니다.\n선택목록을 확인해주세요</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }
            if(outsideFlag) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>외주가공 중에는 취소가 불가능합니다.\n외주가공 취소 후 진행해주세요.</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }
            if(controlFlag) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>작업번호가 연계된 접수건은 상태 변경이 불가합니다.</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }

            let parameters = {'url': '/managerOrderStatus', 'data': {data: JSON.stringify(list)}};

            fnPostAjax(function () {
                message =
                    '<h4>\n' +
                    '    <img style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>' + "<spring:message code='com.alert.default.save.success' />" + '</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                $orderManagementGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        };

        // topWrap 확장 함수
        const topMenuOpen = function () {
            let top = $('#order_manage_div .gubunWrap');
            let bottom = $('#order_manage_div .bottomWrap');
            let con = $('#order_manage_div .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '130px'}, 300, 'easeOutCubic');
            bottom.stop().animate({'height': '740px'}, 300, 'easeOutCubic');
            con.css({'height': '640px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        // topWrap 축소 함수
        const topMenuClose = function () {
            let rollSeq = '${authUserInfo.ROLE_SEQ}';
            let top = $('#order_manage_div .gubunWrap');
            let bottom = $('#order_manage_div .bottomWrap');
            let con = $('#order_manage_div .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '37px'}, 300, 'easeInCubic');
            bottom.stop().animate({'height': '825px'}, 300, 'easeOutCubic');
            con.css({'height': '714px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        const noSelectedRowAlert = function () {
            if (selectedOrderManagementRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        const supplyUnitCostInit = function () {
            $('#SUPPLY_UNIT_COST_APPLY option:eq(0)').prop('selected', true); // 공급단가적용 초기화?
        };

        function controlManageFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
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

                let condition = $('#orderManageFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#orderManageFilterKeyword').val(),
                    txtUpper = (txt == null) ? '' : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === 'end') {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length !== valUpper.length) {
                        indx = -1;
                    }
                } else if (condition === 'contain') {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition === 'begin') {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }

                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                    // return val;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }

        const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');
            const orderList = ['ORDER_STATUS_NM', 'ORDER_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD',
                'NOTE', 'REGIST_NUM', 'DRAWING_NUM', 'DRAWING_NUM_BUTTON', 'ORDER_NUM', 'ORDER_QTY', 'ORIGINAL_SIDE_QTY',
                'OTHER_SIDE_QTY', 'ORDER_DUE_DT', 'WORK_TYPE', 'MATERIAL_SUPPLY_YN', 'MAIN_INSPECTION', 'SAME_SIDE_YN',
                'SIZE_TXT', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'SPECIAL_TREATMENT', 'PREV_DRAWING_NUM',
                'PROJECT_NM', 'MODULE_NM', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_TOTAL_AMT',
                'UNIT_SUM_AUTO_AMT', 'PREV_UNIT_FINAL_AMT', 'DELIVERY_COMP_NM', 'LABEL_NOTE', 'ITEM_NM', 'ORDER_STAFF_SEQ',
                'DESIGNER_NM', 'UNIT_SUM_AUTO_AMT', 'UNIT_MATERIAL_AUTO_AMT', 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT',
                'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT', 'UNIT_PROCESS_AUTO_AMT', 'UNIT_ETC_AMT',
                'UNIT_AMT_NOTE', 'INVOICE_NUM', 'OUT_QTY', 'OUT_FINISH_DT', 'RETURN_INSERT_DT',
                'RETURN_FINISH_DT', 'ORDER_INSERT_DT', 'PDF_GFILE_SEQ', 'DXF_GFILE_SEQ', 'DRAWING_VER', 'DRAWING_UP_DT', 'MATERIAL_NOTE'
            ];
            const includeList = orderList;

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['REGIST_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['REGIST_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (orderList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        } /*else if (partList.includes(dataIndx)) {
                            let controlDetailSeq = data[j]['CONTROL_DETAIL_SEQ'],
                                controlDetailSeqPrev = data[j - 1] ? data[j - 1]['CONTROL_DETAIL_SEQ'] : undefined;

                            if (controlNum === controlNumPrev && controlDetailSeq === controlDetailSeqPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /!**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 *!/
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }*/
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };

        const validationCheck = function (dataList) {
            let gridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let arr = changes.addList.concat(changes.updateList);
            let rowNumArr = [];
            $.each(arr,function(idx,Item) {
                rowNumArr.push(Item.ROW_NUM);
            });
            // workTypeCheck(dataList);
            registNumCheck(dataList)
            // drawingNumCheck(dataList);

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];
                if(rowNumArr.indexOf(rowData.ROW_NUM) >= 0) {
                    if (Object.keys(rowData).length > 2) {
                        requiredCheck(rowData);
                        badCodeCheck(rowData);
                        dateCheck(rowData);
                        sameSideCheck(rowData)
                        // inputErrorCheck(rowData);
                    }
                }
            }
        };

        const dateCheck = function (rowData) {
            var dt = new Date(rowData.ORDER_DUE_DT);
            var today = new Date();

            if(dt < today) {
                addErrorList(rowData.pq_ri, 'ORDER_DUE_DT');
            }
        }
        const sameSideCheck = function (rowData) {
            if(rowData.SAME_SIDE_YN == 'Y' && (fnIsEmpty(rowData.ORIGINAL_SIDE_QTY) || fnIsEmpty(rowData.OTHER_SIDE_QTY))) {
                addErrorList(rowData.pq_ri, 'ORIGINAL_SIDE_QTY');
                addErrorList(rowData.pq_ri, 'OTHER_SIDE_QTY');
            }else if(rowData.SAME_SIDE_YN != 'Y' && (!fnIsEmpty(rowData.ORIGINAL_SIDE_QTY) || !fnIsEmpty(rowData.OTHER_SIDE_QTY))) {
                addErrorList(rowData.pq_ri, 'ORIGINAL_SIDE_QTY');
                addErrorList(rowData.pq_ri, 'OTHER_SIDE_QTY');
            }
        }
        const registNumCheck = function (dataList) {
            // const groupedOrderSeq = fnGroupBy(dataList, 'ORDER_SEQ');
            const groupedRegistNum = fnGroupBy(dataList, 'REGIST_NUM');
            $.each(groupedRegistNum, function (idx,Item) {
                if(idx !== 'undefined' && idx != 'null' && idx != '') {
                    $.each(Item, function (idx2,Item2) {
                        // if(Item.length > 1) {
                        //     addErrorList(Item2.pq_ri, 'REGIST_NUM');
                        // }else {
                            var regexpSpec = /[^A-Za-z0-9\-\_]/gi;
                            if(regexpSpec.test(Item2.REGIST_NUM)) {
                                addErrorList(Item2.pq_ri, 'REGIST_NUM');
                            }
                        // }
                    })
                }
            })
        }
        const workTypeCheck = function (dataList) {
            let groupedControlNum = fnGroupBy(dataList, 'CONTROL_NUM');

            for (let controlNum in groupedControlNum) {
                if (groupedControlNum.hasOwnProperty(controlNum)) {
                    let groupedWorkType = fnGroupBy(groupedControlNum[controlNum], 'WORK_TYPE');

                    if (groupedWorkType.hasOwnProperty('WTP020')) {
                        if (groupedWorkType.hasOwnProperty('WTP010') || groupedWorkType.hasOwnProperty('WTP040')) {
                            for (let i = 0; i < groupedControlNum[controlNum].length; i++) {
                                addErrorList(groupedControlNum[controlNum][i].pq_ri, 'WORK_TYPE');
                            }
                        }
                    }
                }
            }
        };

        const drawingNumCheck = function (dataList) {
            const groupedControlNum = fnGroupBy(dataList, 'CONTROL_NUM');

            for (let controlNum in groupedControlNum) {
                const orderNum = fnGroupBy(groupedControlNum[controlNum], 'ORDER_NUM');

                for (let i in orderNum) {
                    if (!fnIsEmpty(i) && i !== 'undefined') {
                        const ORDER_DRAWING_NUM = fnGroupBy(orderNum[i], 'ORDER_DRAWING_NUM');

                        for (let j in ORDER_DRAWING_NUM) {
                            if (ORDER_DRAWING_NUM[j].length > 1) {
                                for (let k in ORDER_DRAWING_NUM[j]) {
                                    addErrorList(ORDER_DRAWING_NUM[j][k].pq_ri, 'ORDER_DRAWING_NUM');
                                }
                            }
                        }
                    }
                }
            }
        };
        // required 체크
        const requiredCheck = function (rowData) {
            let list;
            // 21.09.09 개선 버전에서는 주문관리화면에서 작업형태 - 단품, 조립, 수정만 생성가능함
            const commonRequiredList = ['COMP_CD', 'ORDER_COMP_CD', 'REGIST_NUM', 'DRAWING_NUM', 'ORDER_DUE_DT', 'SIZE_TXT', 'ORDER_QTY', 'WORK_TYPE', 'MATERIAL_KIND'];
            const modifiedList = ['MATERIAL_SUPPLY_YN']; // 수정

            if(rowData.WORK_TYPE == 'WTP030') {
                list = commonRequiredList.concat(modifiedList);
            }else {
                list = commonRequiredList;
            }

            for (let i in list) {
                if (rowData[list[i]] === undefined || rowData[list[i]] == null || rowData[list[i]] === '' || (rowData[list[i]] != null && typeof rowData[list[i]] == 'object' && !Object.keys(rowData[list[i]]).length)) {
                    addErrorList(rowData.pq_ri, list[i]);
                }
            }
        };
        // 잘못된 데이터(코드) 체크
        const badCodeCheck = function (rowData) {
            const rowIndex = rowData.pq_ri;
            const priceConfirmList = fnGetCommCodeGridSelectBox('1017');
            const mainInspectionList = fnGetCommCodeGridSelectBox('1059');
            const workTypeList = fnGetCommCodeGridSelectBox('1033');
            const workFactoryList = fnGetCommCodeGridSelectBox('1014');
            const materialDetailList = fnGetCommCodeGridSelectBox('1027');
            const materialKindList = fnGetCommCodeGridSelectBox('1029');
            const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
            const materialFinishHeatList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
            const materialFinishGrindList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');

            // 단가확인
            if (rowData.PRICE_CONFIRM !== undefined && rowData.PRICE_CONFIRM !== null && rowData.PRICE_CONFIRM !== '') {
                let index = priceConfirmList.findIndex(function (element) {
                    return element.value === rowData.PRICE_CONFIRM;
                });
                if (index < 0) addErrorList(rowIndex, 'PRICE_CONFIRM');
            }
            // 사업자
            if (rowData.COMP_CD !== undefined && rowData.COMP_CD !== null && rowData.COMP_CD !== '') {
                let index = FAMILY_COMPANY.findIndex(function (element) {
                    return element.value === rowData.COMP_CD;
                });

                if (index < 0) addErrorList(rowIndex, 'COMP_CD');
            }
            // 발주업체
            if (rowData.ORDER_COMP_CD !== undefined && rowData.ORDER_COMP_CD !== null && rowData.ORDER_COMP_CD !== '') {
                let index = ORDER_COMPANY.findIndex(function (element) {
                    return element.value === rowData.ORDER_COMP_CD;
                });

                if (index < 0) addErrorList(rowIndex, 'ORDER_COMP_CD');
            }
            // 구매 담당자
            if (rowData.ORDER_STAFF_SEQ !== undefined && rowData.ORDER_STAFF_SEQ !== null && rowData.ORDER_STAFF_SEQ !== '') {
                let index = COMPANY_STAFF.findIndex(function (element) {
                    return element.value === Number(rowData.ORDER_STAFF_SEQ);
                });

                if (index < 0) addErrorList(rowIndex, 'ORDER_STAFF_SEQ');
            }
            // 주요검사품
            if (rowData.MAIN_INSPECTION !== undefined && rowData.MAIN_INSPECTION !== null && rowData.MAIN_INSPECTION !== '') {
                let index = mainInspectionList.findIndex(function (element) {
                    return element.value === rowData.MAIN_INSPECTION;
                });

                if (index < 0) addErrorList(rowIndex, 'MAIN_INSPECTION');
            }
            // 작업형태
            if (rowData.WORK_TYPE !== undefined && rowData.WORK_TYPE !== null && rowData.WORK_TYPE !== '') {
                let index = workTypeList.findIndex(function (element) {
                    return element.value === rowData.WORK_TYPE;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_TYPE');
            }
            //소재 상세
            if (rowData.MATERIAL_DETAIL !== undefined && rowData.MATERIAL_DETAIL !== null && rowData.MATERIAL_DETAIL !== '') {
                let index = materialDetailList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_DETAIL;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_DETAIL');
            }
            // 소재형태
            if (rowData.MATERIAL_KIND !== undefined && rowData.MATERIAL_KIND !== null && rowData.MATERIAL_KIND !== '') {
                let index = materialKindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_KIND;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_KIND');
            }
            // 표면처리
            if (rowData.SURFACE_TREAT !== undefined && rowData.SURFACE_TREAT !== null && rowData.SURFACE_TREAT !== '') {
                let index = surfaceTreatList.findIndex(function (element) {
                    return element.value === rowData.SURFACE_TREAT;
                });

                if (index < 0) addErrorList(rowIndex, 'SURFACE_TREAT');
            }
            // 열처리
            if (rowData.MATERIAL_FINISH_HEAT !== undefined && rowData.MATERIAL_FINISH_HEAT !== null && rowData.MATERIAL_FINISH_HEAT !== '') {
                let index = materialFinishHeatList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_HEAT;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_HEAT');
            }
            // 연마
            if (rowData.MATERIAL_FINISH_GRIND !== undefined && rowData.MATERIAL_FINISH_GRIND !== null && rowData.MATERIAL_FINISH_GRIND !== '') {
                let index = materialFinishGrindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_GRIND;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_GRIND');
            }
        };
        // 잘못 입력된 데이터 체크
        const inputErrorCheck = function (rowData) {
            let list = [];
            const singleList = ['PART_UNIT_QTY']; // 단품
            const assemblyList = ['MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY']; // 조립
            const modifiedList = ['PART_UNIT_QTY']; // 수정
            const stockList = ['PART_UNIT_QTY', 'ORDER_NUM', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'REGIST_NUM']; // 재고
            const partList = ['ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'REGIST_NUM']; // 파트

            switch (rowData.WORK_TYPE) {
                case 'WTP010':
                    list = singleList;
                    break;
                case 'WTP020':
                    list = assemblyList;
                    break;
                case 'WTP030':
                    list = modifiedList;
                    break;
                case 'WTP040':
                    list = stockList;
                    break;
                case 'WTP050':
                    list = partList;
                    break;
            }

            for (let i in list) {
                if (list.hasOwnProperty(i)) {
                    if (rowData[list[i]] !== undefined && rowData[list[i]] != null && rowData[list[i]] !== '') {
                        addErrorList(rowData.pq_ri, list[i]);
                    }
                }
            }
        };

        // error
        let errorList = [];
        let prevErrorList = [];
        const addErrorList = function (rowIndex, dataIndex) {
            let tempObject = {};
            tempObject.rowIndx = rowIndex;
            tempObject.dataIndx = dataIndex;
            errorList.push(tempObject);
        };

        // cell 색 변경
        const changeCellColor = function (list, prevList) {
            for(let i in prevList) {
                if (prevList.hasOwnProperty(i)) {
                    $orderManagementGrid.pqGrid('removeClass', {rowIndx: prevList[i].rowIndx, dataIndx: prevList[i].dataIndx, cls: 'bg-lightcoral'} );
                }
            }

            if (list.length > 0) {
                for(let i in list) {
                    if (list.hasOwnProperty(i)) {
                        $orderManagementGrid.pqGrid('addClass', {rowIndx: list[i].rowIndx, dataIndx: list[i].dataIndx, cls: 'bg-lightcoral'} );
                    }
                }
            }
        };

        const changeColumnFilter = function () {
            // 필터 옵션 변경
            let filterOpts = '<option value=\"\">All Fields</option>';
            let frozenOts = '<option value="0">Selected</option>';

            $orderManagementGrid.pqGrid('getInstance').grid.getColModel().forEach(function (column) {
                let hiddenYn = column.hidden === false || column.hidden === undefined;
                if (hiddenYn && column.title) {
                    filterOpts += '<option value="' + column.dataIndx + '">' + column.title + '</option>';
                    frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                }
            });

            $('#orderManageFilterColumn').html(filterOpts);
            $('#orderManageFrozen').html(frozenOts);
        };
        /* function */

        /* event */
        $('#ORDER_MANAGE_TOP_WRAP_BTN').on('click', function () {
            if ($(this).hasClass('on')) {
                topMenuClose();
                $(this).removeClass('on');
            } else {
                topMenuOpen();
                $(this).addClass('on');
            }$("#ORDER_MANAGE_GRID").pqGrid("getInstance").grid.getChanges({format:'byVal'});
        });

        $('#ORDER_MANAGE_SAVE').on('click', function () {
            prevErrorList = errorList;
            errorList = [];
            let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            validationCheck(data);
            changeCellColor(errorList, prevErrorList);
            if (errorList.length) {
                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                return false;
            }
            // 작업지시번호 수정 여부 확인
            let gridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});

            $.each(changes.oldList,function (idx,Item) {
                $.each(Item,function (idx2,Item2) {
                    if(typeof Item2 == 'undefined') {
                        changes.oldList[idx][idx2] = "";
                    }
                })
            });

            let parameters = {'url': '/validationCheckBeforeSaveFromOrder', 'data': {data: JSON.stringify(changes)}};
            let flag = false;

            fnPostAjaxAsync(function (data) {
                flag = data.flag;

                if (flag) {
                    fnAlert(null, data.message);
                    return false;
                }
            }, parameters, '');
            if (!flag) {
                parameters = {'url': '/saveFromOrderManage', 'data': {data: JSON.stringify(changes)}};

                fnPostAjaxAsync(function (data) {
                    if (data.flag) {
                        fnAlert(null, data.message);
                        return false;
                    }

                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>');
                    $orderManagementGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        });

        $('#ORDER_MANAGE_DELETE').on('click', function () {
            let list = [];
            let tempList = [];
            // let controlNumList = [];
            let message;

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let thisRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // controlNumList[i] = thisRowData.CONTROL_NUM;
                if(typeof thisRowData.IS_NEW_ROW != 'undefined' && thisRowData.IS_NEW_ROW != null && thisRowData.IS_NEW_ROW == true) {
                    tempList.push({rowIndx : thisRowData.pq_ri})
                }else {
                    list.push(thisRowData);
                }

                if (!(thisRowData.ORDER_STATUS === undefined || thisRowData.ORDER_STATUS === null || thisRowData.ORDER_STATUS === 'REG002')) {
                    message =
                        '<h4>\n' +
                        '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                        '    <span>확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능합니다</span>\n' +
                        '</h4>';
                    fnAlert(null, message);
                    return false;
                }
            }
            if(list.length > 0) {
                //TODO: list.lenth 건수
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>' + (list.length + tempList.length) + ' 건이 삭제됩니다. 진행하시겠습니까?</span>\n' +
                    '</h4>';
                fnConfirm(null, message, function () {
                    $orderManagementGrid.pqGrid("deleteRow", {rowList: tempList});
                    let parameters = {'url': '/removeOrder', 'data': {data: JSON.stringify(list)}};
                    fnPostAjax(function (data) {
                        if(data.flag) {
                            fnAlert(null, data.message);
                        }else {
                            fnAlert(null, "<spring:message code='com.alert.default.remove.success' />");
                            $orderManagementGrid.pqGrid('refreshDataAndView');

                        }
                    }, parameters, '');
                });
            }else if(tempList.length > 0) {
                $orderManagementGrid.pqGrid("deleteRow", {rowList: tempList});
            }
        });

        $('#NEW_ORDER_REGISTRATION').on('click', function () {
            let url = '/newOrderRegistration';
            // 팝업 사이즈
            let nWidth = 1400;
            let nHeight = 770;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (newOrderRegistrationPopup === undefined || newOrderRegistrationPopup.closed) {
                newOrderRegistrationPopup = window.open(url, '', strOption);
            } else {
                newOrderRegistrationPopup.focus();
            }
        });


        $('#ORDER_MONTH_CLOSE').on('click', function () {
            let compCdList = [];
            let list = [];
            let orderCompCdList = [];
            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let orderStatusFlag = false;
            let orderCloseFlag = false;

            if (noSelectedRowAlert()) {
                return false;
            }
            if (fnIsGridEditing($orderManagementGrid)) {
                return false;
            }
            if (selectedRowCount > 300) {
                fnAlert(null, '300건까지 선택하여 마감 가능합니다.');
                return false;
            }

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                list[i] = rowData;
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                if(rowData.ORDER_STATUS == 'REG001') {
                    orderStatusFlag = true;
                }else if(rowData.ORDER_STATUS == 'REG003') {
                    orderCloseFlag = true;
                }else {
                    orderStatusFlag = false;
                }
            }

            // 중복제거
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];
            if (compCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                return false;
            }
            if (orderCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                return false;
            }
            if(orderCloseFlag) {
                fnAlert(null, '이미 마감된 건은 마감처리가 불가합니다.');
                return false;
            }

            if(!orderStatusFlag) {
                fnAlert(null, '주문 마감은 주문 확정 이후에 가능합니다.');
                return false;
            }

            let url = '/controlMonthClose';
            // 팝업 사이즈
            let nWidth = 1080;
            let nHeight = 480;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (controlMonthClosePopup === undefined || controlMonthClosePopup.closed) {
                controlMonthClosePopup = window.open(url, '', strOption);
            } else {
                controlMonthClosePopup.focus();
            }
        });


        let $controlCloseCancelLeftGrid;
        const controlCloseCancelLeftGridId = 'CONTROL_CLOSE_CANCEL_LEFT_GRID';
        const controlCloseCancelLeftColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER'},
            {title: '품수', dataType: 'integer', format: '#,###', dataIndx: 'CNT'},
            {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, align: 'right', dataIndx: 'FINAL_NEGO_AMT'}
        ];
        const controlCloseCancelLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: controlCloseCancelLeftColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function (event, ui) {
                let gridInstance = $controlCloseCancelRightGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };
        let $controlCloseCancelRightGrid;
        const controlCloseCancelRightGridId = 'CONTROL_CLOSE_CANCEL_RIGHT_GRID';
        const controlCloseCancelRightColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataType: 'integer', format: '#,###', dataIndx: 'CNT'},
            {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const controlCloseCancelRightObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            // dragColumns: {enabled: false},
            editable: false,
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: controlCloseCancelRightColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function (event, ui) {
                let gridInstance = $controlCloseCancelLeftGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };


        const loadDataControlCloseCancel = function () {
            let orderSeqList = new Set ();
            let orderSeqStr = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                if (rowData.ORDER_SEQ) {
                    orderSeqList.add(rowData.ORDER_SEQ);
                }
            }

            for (let item of orderSeqList) {
                orderSeqStr += item;
                orderSeqStr += ',';
            }

            orderSeqStr = orderSeqStr.substring(0, orderSeqStr.length - 1);

            $('#CONTROL_CLOSE_CANCEL_FORM > #ORDER_SEQ').val(orderSeqStr);

            let postData = fnFormToJsonArrayData('#CONTROL_CLOSE_CANCEL_FORM');
            postData.queryId = 'orderMapper.selectControlCloseCancelLeftList';
            $controlCloseCancelLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $controlCloseCancelLeftGrid.pqGrid('refreshDataAndView');

            postData.queryId = 'orderMapper.selectControlCloseCancelRightList';
            $controlCloseCancelRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $controlCloseCancelRightGrid.pqGrid('refreshDataAndView');
        };

        $('#CANCEL_ORDER_MONTH_CLOSE').on('click', function () {
            let compCdList = [];
            let orderCompCdList = [];
            if (noSelectedRowAlert()) {
                return false;
            }
            for (let i = 0; i < selectedOrderManagementRowIndex.length; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);

                if(rowData.ORDER_STATUS != 'REG003') {
                    fnAlert(null, '마감취소는 마감된 주문건만 가능합니다.');
                    return false;
                }
            }
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];

            if (compCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                return false;
            }
            if (orderCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사와 공급사는 동일해야 합니다.');
                return false;
            }
            $("#CONTROL_CLOSE_CANCEL_POPUP").modal('show');
        });

        $('#CONTROL_CLOSE_CANCEL_POPUP').on({
            'show.bs.modal': function () {

                $controlCloseCancelLeftGrid = $('#' + controlCloseCancelLeftGridId).pqGrid(controlCloseCancelLeftObj);
                $controlCloseCancelRightGrid = $('#' + controlCloseCancelRightGridId).pqGrid(controlCloseCancelRightObj);

                loadDataControlCloseCancel();
            },
            'hide.bs.modal': function () {
                $controlCloseCancelLeftGrid.pqGrid('destroy');
                $controlCloseCancelRightGrid.pqGrid('destroy');
            }
        });
        $('#CONTROL_CLOSE_CANCEL_YES').on('click', function () {
            let list = [];

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                list.push(rowData);
            }

            let rightData = $controlCloseCancelRightGrid.pqGrid('option', 'dataModel.data');
            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            let parameters = {'url': '/removeMonthClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $('#CONTROL_CLOSE_CANCEL_POPUP').modal('hide');
                $orderManagementGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });
        $('[name=CONTROL_CLOSE_CANCEL_NO]').on('click', function () {
            $('#CONTROL_CLOSE_CANCEL_POPUP').modal('hide');
        });

        $('#ORDER_MANAGE_SEARCH').on('click', function () {
            selectedOrderManagementRowIndex = [];
            let orderSts = $("#ORDER_MANAGE_SEARCH_FORM").find("#HIDDEN_ORDER_STATUS").val();
            if(orderSts.indexOf("REGTEMP") >= 0) {
                let tempOrderSts = orderSts + ", 'REG002'";
                $("#ORDER_MANAGE_SEARCH_FORM").find("#HIDDEN_ORDER_STATUS").val(tempOrderSts);
            }
            $orderManagementGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#ORDER_MANAGE_SEARCH_FORM'));
            });
            $orderManagementGrid.pqGrid('refreshDataAndView');
        });

        /**
         * @description 확정버튼 클릭
         */
        $('#ORDER_CONFIRMATION').on('click', function (event) {
            if (fnIsGridEditing($orderManagementGrid)) {
                return false;
            }
            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }

            let selectedRowCount = selectedOrderManagementRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // TODO: 필수데이터가 입력되어 있어야만 확정 가능
                if (fnIsEmpty(rowData.ORDER_QTY)) {
                    fnAlert(null, '주문수량을 확인해주시기 바랍니다');
                    return false;
                }

                if (fnIsEmpty(rowData.DRAWING_NUM)) {
                    fnAlert(null, '발주 도면 번호를 등록 후 다시 시도해주세요');
                    return false;
                }

                if (fnIsEmpty(rowData.PDF_GFILE_SEQ)) {
                    fnAlert(null, 'PDF확장자 파일 도면을 등록 후 다시 시도해주세요');
                    return false;
                }
                if(rowData.ORDER_STATUS == 'REG003') {
                    fnAlert(null, '이미 마감된 주문건 입니다.');
                    return false;
                }

                if (rowData.SAME_SIDE_YN === 'Y' || !fnIsEmpty(rowData.ORIGINAL_SIDE_QTY) || !fnIsEmpty(rowData.OTHER_SIDE_QTY)) {
                    if(Number(rowData.ORDER_QTY) !== (Number(rowData.ORIGINAL_SIDE_QTY) + Number(rowData.OTHER_SIDE_QTY))) {
                        fnAlert(null, rowData.REGIST_NUM + '<br>대칭 수량을 확인해주시기 바랍니다');
                        return false;
                    }
                    if (!(rowData.SAME_SIDE_YN === 'Y')) {
                        fnAlert(null, rowData.REGIST_NUM + '<br>대칭을 확인해주시기 바랍니다');
                        return false;
                    }
                }
            }

            getOrderStatusButton(event);
        });

        /**
         * @description 보류버튼 클릭
         */
        // $('#HOLD').on('click', function (event) {
        //     if (fnIsGridEditing($orderManagementGrid)) {
        //         return false;
        //     }
        //
        //     getOrderStatusButton(event);
        // });

        /**
         * @description 취소버튼 클릭
         */
        $('#ORDER_CANCEL').on('click', function (event) {
            let selectedRowCount = selectedOrderManagementRowIndex.length;

             for (let i = 0; i < selectedRowCount; i++) {
                 let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                 if (rowData.ORDER_STATUS == 'REG003') {
                     fnAlert(null, '마감된 주문건은 취소 불가합니다.');
                     return false;
                 }
             }

            getOrderStatusButton(event);
        });

        /**
         * @description 종료버튼 클릭
         */
        // $('#TERMINATION').on('click', function (event) {
        //     getOrderStatusButton(event);
        // });

        $('#CONTROL_CLOSE_YEAR').on('change', function () {
            fnAppendSelectboxMonth('CONTROL_CLOSE_MONTH', this.value);
        });

        $('[name=ORDER_MANAGE_VIEW]').on('click', function (event) {
            // column
            changeViewColumn(event.target.id);
            // 필터 컬럼 변경
            changeColumnFilter();
            // css 변경
            $(this).removeClass('virtual-disable').siblings('[name=ORDER_MANAGE_VIEW]').addClass('virtual-disable');
            $orderManagementGrid.pqGrid('refreshView');
        });
        // 거래명세표
        $('#TRANSACTION_STATEMENT').on('click', function () {
            if (noSelectedRowAlert()) {
                return false;
            }
            if (fnIsGridEditing($orderManagementGrid)) {
                return false;
            }

            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let invoiceNumList = [];

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                invoiceNumList.push(rowData.INVOICE_NUM);
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];
            invoiceNumList = [...new Set(invoiceNumList)];

            if (controlSeqList.length === 0) {
                fnAlert(null, '에러!');
                return false;
            }
            if (compCdList.length === 0) {
                fnAlert(null, '공급사가 없습니다!');
                return false;
            }
            if (orderCompCdList.length === 0) {
                fnAlert(null, '발주사가 없습니다!');
                return false;
            }
            if (compCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 사업자는 동일해야 합니다.');
                return false;
            }
            if (orderCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                return false;
            }
            if (invoiceNumList.length > 1) {
                fnAlert(null, '선택된 대상들의 거래명세 번호는 동일해야 합니다.');
                return false;
            }

            let url = '/transactionStatement';
            // 팝업 사이즈
            let nWidth = 1250;
            let nHeight = 820;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (transactionStatementPopup === undefined || transactionStatementPopup.closed) {
                transactionStatementPopup = window.open(url, '', strOption);
            } else {
                transactionStatementPopup.focus();
            }
        });

        // 견적List출력
        $('#ESTIMATE_LIST_PRINT').on('click', function () {
            let orderSeqList = [];
            let orderSeqStr = '';

            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                orderSeqList.push(rowData.ORDER_SEQ);
            }
            // 중복제거
            orderSeqList = [...new Set(orderSeqList)];

            for (let i = 0; i < orderSeqList.length; i++) {
                orderSeqStr += orderSeqList[i];

                if (i < orderSeqList.length - 1) {
                    orderSeqStr += ',';
                }
            }
            $('#control_estimate_list_excel_download #paramData').val(orderSeqStr);
            fnReportFormToHiddenFormPageAction('control_estimate_list_excel_download', '/downloadExcel');
        });

        if (!alertify.barcodeDrawingConfirm) {
            alertify.dialog('barcodeDrawingConfirm', function () {
                return {
                    setup: function () {
                        let settings = alertify.confirm().settings;
                        for (let prop in settings)
                            this.settings[prop] = settings[prop];
                        let setup = alertify.confirm().setup();
                        setup.buttons[1].invokeOnClose = false; // indicate if closing the dialog should trigger this button action
                        setup.buttons.push({
                            text: '취소',
                            scope: 'primary'
                        });
                        return setup;
                    },
                    settings: {
                        oncontinue: null
                    },
                    callback: function (closeEvent) {
                        if (closeEvent.index == 2) {
                            if (typeof this.get('oncontinue') === 'function') {
                                let returnValue;
                                returnValue = this.get('oncontinue').call(this, closeEvent);
                                if (typeof returnValue !== 'undefined') {
                                    closeEvent.cancel = !returnValue;
                                }
                            }
                        } else {
                            alertify.confirm().callback.call(this, closeEvent);
                        }
                    }
                };
            }, false, 'confirm');
        }

        // 견적도면 출력
        $('#ORDER_ESTIMATE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            const gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            let selectOrderList = '';
            let message = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                if (rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002') {
                    fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                    return false;
                }
                if (fnIsEmpty(rowData.IMG_GFILE_SEQ)) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                }
                selectOrderList += String(rowData.ORDER_SEQ) + '|';
            }

            message =
                '<h4>' +
                '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '   <span>' + selectedOrderManagementRowIndex.length + ' 건의 견적도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '</h4>';
            fnConfirm(null, message, function () {
                printJS({printable: '/makeEstimateDrawingPrint', properties: {selectOrderList:selectOrderList, flag:'N'}, type: 'pdf', showModal: true});
            });
        });

        // 바코드 출력
        $('#CONTROL_MANAGE_BARCODE_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let selectControlPartCount = 0;
            let selectControlPartInfo = '';
            let formData = [];
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                let curControlPartInfo = rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ;
                if (!(rowData.CONTROL_STATUS === 'ORD001')) {
                    fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                    return false;
                }
                if (!rowData.ORDER_IMG_GFILE_SEQ) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                // } else if(rowData.WORK_TYPE != 'WTP020' && selectControlPartInfo != curControlPartInfo){
                } else if(selectControlPartInfo != curControlPartInfo){
                    selectControlPartCount++;
                    selectControlPartInfo = curControlPartInfo;
                    formData.push(rowData.CONTROL_BARCODE_NUM);
                }
            }
            let message =
                '<h4>\n' +
                '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                '    <span>선택하신 ' + selectControlPartCount + '건을 처리합니다. \n진행하시겠습니까?</span>\n' +
                '</h4>';

            fnConfirm(null, message, function () {
                fnBarcodePrint(function(data){
                    fnAlert(null, data.message);
                }, formData, '');
            });
        });
        // 라벨 출력
        $('#ORDER_MANAGE_LABEL_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;

            let barcodeList = [];
            let orderSeqList = [];
            let selectedRowCount = selectedOrderManagementRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                if (rowData.ORDER_STATUS === undefined || rowData.ORDER_STATUS === 'REG002') {
                    fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                    return false;
                }
                orderSeqList.push(rowData.ORDER_SEQ);
            }
            orderSeqList = [...new Set(orderSeqList)];
            for (let i = 0; i < orderSeqList.length; i++) {
                let postData = {
                    'queryId': 'inspection.selectOutgoingLabelType4',
                    'ORDER_SEQ': orderSeqList[i]
                };
                let parameter = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    for (let i = 0, DATALIST_LENGTH = data.list.length; i < DATALIST_LENGTH; i++) {
                        barcodeList.push(data.list[i].BARCODE_NUM);
                    }
                }, parameter, '');
            }

            let bCodePrintLen = barcodeList.length;
            if (bCodePrintLen) {
                let message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>선택하신 ' + bCodePrintLen + '건을 처리합니다. \n진행하시겠습니까?</span>\n' +
                    '</h4>';
                fnConfirm(null, message, function () {
                    fnBarcodePrint(function (data) {
                        fnAlert(null, data.message);
                    }, barcodeList, '');
                });
            } else {
                fnAlert(null, '출력할 바코드가 존재 하지 않습니다.');
            }
        });

        /** 도면 등록 팝업 호출 **/
        $('#ORDER_DRAWING_REGISTRATION').on('click', function () {
            drawingUploadPopupWindow('order', 'drawingUploadMapper.manageOrderCadFiles', '');
        });
        /** 도면 차수 및 변경 처리 **/
        $('#DRAWING_CHANGE').on('click', function () {
            let orderSeqList = new Set(); // 선택 된 row 작업지시번호
            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }
            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                 const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                 if(typeof rowData.CONTROL_NUM != 'undefined' && rowData.CONTROL_NUM != null && rowData.CONTROL_NUM != '')
                     orderSeqList.add(rowData.ORDER_SEQ);
            }
            if (orderSeqList.size <= 0) {
                fnAlert(null, '도면 변경은 작업번호가 연계된 이후에만 가능합니다.');
                return false;
            }
            var paramDatas = {'orderList': Array.from(orderSeqList)};
            var parameters = {
                'url': '/controlCadRevPrev',
                'data': {"gridData": JSON.stringify(paramDatas)}
            };

            fnPostAjax(function (data) {
                drawingUploadPopupWindow('controlRev', 'drawingUploadMapper.manageControlCadRevFiles', data.workKey);
            }, parameters, '');
        });
        /** 도면 보기 팝업 호출 */
        $('#CONTROL_MANAGE_DRAWING_VIEW').on('click', function () {
            let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[0]});
            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
        });
        // 도면 출력
        $('#ORDER_MANAGE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            const gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            const groupedOrderSeq = fnGroupBy(gridData, 'ORDER_SEQ');
            let orderSeqList = new Set(); // 선택 된 row 작업지시번호
            let drawingNumList = new Set();
            let selectOrderList = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                orderSeqList.add(rowData.ORDER_SEQ);
            }
            // 작업지시번호
            for(let orderSeq of orderSeqList) {
                // 발주 개수 + 파트 개수
                for (let j = 0, GROUPED_CONTROL_SEQ_LENGTH =  groupedOrderSeq[orderSeq].length; j < GROUPED_CONTROL_SEQ_LENGTH; j++) {
                    const rowData = groupedOrderSeq[orderSeq][j];
                    if (fnIsEmpty(rowData.IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    } else {
                        selectOrderList += String(rowData.ORDER_SEQ) + '|';
                        drawingNumList.add(rowData.DRAWING_NUM);
                    }
                }
            }

            const message =
                '<h4>' +
                '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '   <span>' + drawingNumList.size + ' 건의 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '</h4>';
            fnConfirm(null, message, function () {
                printJS({printable:'/makeCadPrint', properties: {selectControl:selectOrderList, printType:'order'}, type: 'pdf', showModal:true});
            });
        });

        $('#SUPPLY_UNIT_COST_APPLY').on('change', function () {
            if (noSelectedRowAlert()) return false;

            let number = $('#SUPPLY_UNIT_COST_APPLY option:selected').val();

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                let supplyUnitPrice = (Math.ceil(rowData.UNIT_FINAL_AMT * (number / 100) / 100) * 100).toFixed(0) || null;
                let finalAmount = (supplyUnitPrice * rowData.ORDER_QTY) || null; // 10의 자리 올림

                $orderManagementGrid.pqGrid('updateRow', {'rowIndx': selectedOrderManagementRowIndex[i], row: {'UNIT_FINAL_AMT': supplyUnitPrice, 'FINAL_TOTAL_AMT': finalAmount}, checkEditable: false});
            }
        });

        $('[name=CONTROL_MANGE_CLOSE]').on('click', function () {
            $('#CONTROL_MANGE_POPUP').modal('hide');
        });

        $('#CONTROL_MANAGE_EXCEL_EXPORT').on('click', function () {
            const blob = $orderManagementGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '주문관리.xlsx');
        });
        /* event */

        /* init */
        // changeDate();
        const $orderManageStartDate = $('#ORDER_MANAGE_START_DATE');
        const $orderManageEndDate = $('#ORDER_MANAGE_END_DATE');
        $orderManageStartDate.datepicker({dateFormat: 'yy/mm/dd'});
        $orderManageEndDate.datepicker({dateFormat: 'yy/mm/dd'});
        var today = new Date();
        var startDay = new Date(today.getFullYear(),today.getMonth()-3,1);
        $orderManageStartDate.datepicker('setDate', startDay);
        $orderManageEndDate.datepicker('setDate', 'today');
        // 발주사
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    comboData.push({title: obj.text, id: obj.value, value: obj.value});
                }

                $('#ORDER_MANAGE_SEARCH_FORM #ORDER_COMP_CD').comboTree({
                    source : comboData,
                    isMultiple: true,
                    cascadeSelect: false,
                });
            }, parameters, '');
        })();
        // 사업자
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getBusinessCompanyList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    comboData.push({title: obj.text, id: obj.value});
                }

                $('#ORDER_MANAGE_SEARCH_FORM #COMP_CD').comboTree({
                    source : comboData,
                    isMultiple: true,
                    cascadeSelect: false
                });
            }, parameters, '');
        })();
        // 소재형태
        (function () {
            let comboData = [{title: '저장', id: 'REGTEMP'}];

            <c:forEach var="vlocale" items="${HighCode.H_1091}">
                <c:if test="${vlocale.CODE_CD ne 'REG002'}">
                comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
                </c:if>
            </c:forEach>

            $('#ORDER_MANAGE_SEARCH_FORM #ORDER_STATUS').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false,
                selected: ['REGTEMP','REG001']
            });
        })();
        // 작업형태
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1033}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#ORDER_MANAGE_SEARCH_FORM #WORK_TYPE').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();
        $('#ORDER_SEARCH_CONDITION').val('ROM001').prop("selected",true);
        $orderManagementGrid = $('#' + gridId).pqGrid(obj);


        $('#ESTIMATE_REGISTER_FROM_CONTROL').on('click', function (event) {
            if (noSelectedRowAlert()) {
                return false;
            }

            let orderSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let orderStaffSeqList = [];
            let orderSeqStr = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                orderSeqList.push(rowData.ORDER_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                orderStaffSeqList.push(rowData.ORDER_STAFF_SEQ);
            }
            // 중복제거
            orderSeqList = [...new Set(orderSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];
            orderStaffSeqList = [...new Set(orderStaffSeqList)];

            if (orderSeqList.length === 0) {
                fnAlert(null, '에러!');
                return false;
            }
            // if (compCdList.length === 0 || compCdList[0] === undefined) {
            //     fnAlert(null, '공급사(사업자)가 없습니다!');
            //     return false;
            // }
            // if (orderCompCdList.length === 0 || orderCompCdList[0] === undefined) {
            //     fnAlert(null, '발주사가 없습니다!');
            //     return false;
            // }
            if (compCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 사업자는 동일해야 합니다.');
                return false;
            }
            if (orderCompCdList.length > 1) {
                fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                return false;
            }
            if (orderStaffSeqList.length > 1) {
                fnAlert(null, '선택된 대상들의 구매 담당자는 동일해야 합니다.');
                return false;
            }

            for (let i = 0; i < orderSeqList.length; i++) {
                orderSeqStr += orderSeqList[i];

                if (i < orderSeqList.length - 1) {
                    orderSeqStr += ',';
                }
            }

            $('#estimate_version_up_sequence_form > #hidden_order_seq').val(orderSeqStr);

            $("a[pid='" + $("#estimateNo").val() + "']").trigger('click');
            setTimeout(function () {
                $('#updateFromControl').trigger('click');
            }, 1000);
            event.preventDefault();
        });

        $('#orderManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($orderManagementGrid, 'orderManageFilterKeyword', 'orderManageFilterCondition', 'orderManageFilterColumn');
                autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);

                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#ORDER_MANAGE_RECORDS').html(data.length);
            },
            'search': function () {
                fnFilterHandler($orderManagementGrid, 'orderManageFilterKeyword', 'orderManageFilterCondition', 'orderManageFilterColumn');
                autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);

                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#ORDER_MANAGE_RECORDS').html(data.length);
            }
        });

        $('#orderManageFrozen').on('change', function(){
            fnFrozenHandler($orderManagementGrid, $(this).val());
        });

        $('#ORDER_MANAGE_START_DATE_BUTTON').on('click', function () {
            $('#ORDER_MANAGE_START_DATE').focus();
        });
        $('#ORDER_MANAGE_END_DATE_BUTTON').on('click', function () {
            $('#ORDER_MANAGE_END_DATE').focus();
        });

        $('#ORDER_SEARCH_CONDITION').on('change', function () {
            const $orderManageDates = $('[id^=ORDER_MANAGE][id$=DATE]');

            $(this).val() === '' ? $orderManageDates.prop('disabled', true) : $orderManageDates.prop('disabled', false);
        });

        $('#ATTACHMENT_BUTTON').on('click', function () {
            let $attachmentButton = $('#ATTACHMENT_BUTTON');
            let GfileKey = $('#common_file_download_form').find('#GFILE_SEQ').val();
            let rowIndx = $attachmentButton.data('rowIndx');

            if (GfileKey !== '' && GfileKey !== $attachmentButton.data('GfileKey')) {
                $orderManagementGrid.pqGrid('updateRow', {rowIndx: rowIndx, row: {'ETC_GFILE_SEQ': GfileKey}, checkEditable: false});
                $('#ORDER_MANAGE_SAVE').click();
            }
        });

        $('#CONTROL_MERGE').on({
            'click': function () {
                if (noSelectedRowAlert()) return false;
                let flag = false;
                let dataList = [];

                for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                    dataList[i] = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                }

                let postData = {'ACTION': 'CHECK', list: dataList};
                let parameter = {'url': '/mergeControl', 'data': {data: JSON.stringify(postData)}};
                fnPostAjaxAsync(function (data) {
                    flag = data.flag;

                    if (flag) {
                        fnAlert(null, data.message);
                    }
                }, parameter, '');

                if (!flag) {
                    const groupedWorkType = fnGroupBy(dataList, 'WORK_TYPE');
                    if (groupedWorkType.hasOwnProperty('WTP020') && groupedWorkType.hasOwnProperty('WTP050')) {
                        if (groupedWorkType.hasOwnProperty('WTP010') || groupedWorkType.hasOwnProperty('WTP030') || groupedWorkType.hasOwnProperty('WTP040') || groupedWorkType.hasOwnProperty('WTP060')) {
                            fnAlert(null, '조립/파트 구성이 불일치 합니다.');
                            return;
                        } else {
                            const groupedControlSeq = fnGroupBy(dataList, 'CONTROL_SEQ');
                            let prevPartNum = new Set();

                            for (let controlSeq in groupedControlSeq) {
                                let partNum = new Set();

                                for (let i = 0; i < groupedControlSeq[controlSeq].length; i++) {
                                    partNum.add(groupedControlSeq[controlSeq][i].PART_NUM);
                                }

                                if (prevPartNum.size > 0) {
                                    if (prevPartNum.size !== partNum.size) {
                                        fnAlert(null, '조립/파트 구성이 불일치 합니다.');
                                        return;
                                    }
                                }
                                prevPartNum = partNum;
                            }
                        }
                    }
                    $('#CONTROL_MERGE_POPUP').modal('show');
                }
            }
        });

        $('#CONTROL_MERGE_POPUP').on({
            'show.bs.modal': function () {
                let dataList = [];

                for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                    dataList[i] = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                }

                dataList = fnCloneObj(dataList);
                const controlMergeGridId = 'CONTROL_MERGE_GRID';
                const controlMergeColModel = [
                    {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
                    {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
                    {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
                    {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
                    {
                        title: '', type: 'checkbox', dataIndx: 'CONTROL_MERGE_CHECKBOX', editable: true,
                        cb: {check: 'Y', uncheck: 'N', maxCheck: 1},
                    },
                    {title: '작업지시번호', align: 'left', width: 180, dataIndx: 'CONTROL_NUM'},
                    {title: '파<br>트', minWidth: 30, dataIndx: 'PART_NUM'},
                    {title: '형태', dataIndx: 'WORK_TYPE_NM'},
                    {title: '접수번호', align: 'left', width: 140, dataIndx: 'REGIST_NUM'},
                    {title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM'},
                    {title: '도면번호', align: 'left', width: 150, dataIndx: 'ORDER_DRAWING_NUM'},
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'}
                ];
                const controlMergeObj = {
                    minHeight: '100%',
                    height: 260,
                    collapsible: false,
                    showTitle: false,
                    strNoRows: g_noData,
                    rowHtHead: 15,
                    copyModel: {render: true},
                    numberCell: {title: 'No.'},
                    scrollModel: {autoFit: true},
                    trackModel: {on: true},
                    editable: false,
                    columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
                    colModel: controlMergeColModel,
                    dataModel: {data: dataList},
                    sortModel: {on: false},
                    complete: function () {
                        autoMerge(this, true);
                    }
                };
                $controlMergeGrid = $('#' + controlMergeGridId).pqGrid(controlMergeObj);

                setTimeout(function () {
                    $controlMergeGrid.pqGrid('refresh');
                }, 100);
            },
            'hide.bs.modal': function () {
                if ($('#CONTROL_MERGE_GRID').pqGrid('instance')) {
                    $controlMergeGrid.pqGrid('destroy');
                }
            }
        });

        $('#CONTROL_MERGE_SAVE').on('click', function () {
            const grid = $controlMergeGrid.pqGrid('getInstance').grid;
            const node = grid.Checkbox('CONTROL_MERGE_CHECKBOX').getCheckedNodes();
            const data = grid.option('dataModel.data');

            if (node.length > 0) {
                let postData = {
                    'ACTION': 'SAVE',
                    'STANDARD_CONTROL_SEQ': node[0].CONTROL_SEQ,
                    'STANDARD_CONTROL_DETAIL_SEQ': node[0].CONTROL_DETAIL_SEQ,
                    'STANDARD_ORDER_SEQ': node[0].ORDER_SEQ,
                    list: data
                };
                let parameter = {'url': '/mergeControl', 'data': {data: JSON.stringify(postData)}};
                fnPostAjaxAsync(function (data) {
                    if (data.flag == true) {
                        fnAlert(null, data.message);
                    } else {
                        fnAlert(null, '<spring:message code="com.alert.default.save.success"/>');
                        $('#CONTROL_MERGE_POPUP').modal('hide');
                        $('#ORDER_MANAGE_SEARCH').click();
                    }
                }, parameter, '');
            } else {
                fnAlert(null, '<spring:message code="com.alert.default.need.checkedText"/>');
            }
        });

        $('#ORDER_MANAGE_SEARCH_FORM').find('#AMOUNT_SUMMARY').on('click', function(){
            amountSummaryHtml();
        });

        function amountSummaryHtml() {
            const $orderManageSearchForm = $('#ORDER_MANAGE_SEARCH_FORM');
            $orderManageSearchForm.find('#order_manage_amount_summary_area').removeClass("amount_summary_active");
            $orderManageSearchForm.find('#order_manage_amount_summary_area').addClass("amount_summary_inactive");
            let amountSummaryChk = $orderManageSearchForm.find('#AMOUNT_SUMMARY').is(":checked");
            if (amountSummaryChk) {
                let totalAmount = 0;
                var tempArr = []
                for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                    tempArr.push(rowData);
                    // if (rowData.FINAL_TOTAL_AMT) {
                    //     totalAmount += parseFloat(rowData.FINAL_TOTAL_AMT);
                    // }
                }
                const groupArr = fnGroupBy(tempArr,'ORDER_SEQ');
                $.each(groupArr,function (idx,Item) {
                    if (Item[0].FINAL_TOTAL_AMT) {
                        totalAmount += parseFloat(Item[0].FINAL_TOTAL_AMT);
                    }
                })
                let totalAmountCurrency = pq.formatNumber(totalAmount, "#,###,###");
                $orderManageSearchForm.find('#order_manage_amount_summary_area').addClass("amount_summary_active");
                $orderManageSearchForm.find('#AMOUNT_SUMMARY_INPUT').val(totalAmountCurrency);
            }
        }

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#ORDER_MANAGE_SEARCH_FORM').find('#SIZE_TYPE').on('change', function () {
            const $orderManageSearchForm = $('#ORDER_MANAGE_SEARCH_FORM');
            $orderManageSearchForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];
            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($orderManageSearchForm,resetArr)
                    $orderManageSearchForm.find('#SIZE_W').show();
                    $orderManageSearchForm.find('#SIZE_H').show();
                    $orderManageSearchForm.find('#SIZE_T').show();
                    $orderManageSearchForm.find('#SIZE_D').hide();
                    $orderManageSearchForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($orderManageSearchForm,resetArr)
                    $orderManageSearchForm.find('#SIZE_W').hide();
                    $orderManageSearchForm.find('#SIZE_H').hide();
                    $orderManageSearchForm.find('#SIZE_T').hide();
                    $orderManageSearchForm.find('#SIZE_D').show();
                    $orderManageSearchForm.find('#SIZE_L').show();
                    break;
                default: // 전체
                    $orderManageSearchForm.find('#SIZE_W').show();
                    $orderManageSearchForm.find('#SIZE_H').show();
                    $orderManageSearchForm.find('#SIZE_T').show();
                    $orderManageSearchForm.find('#SIZE_D').hide();
                    $orderManageSearchForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($orderManageSearchForm,resetArr)

                    $orderManageSearchForm.find('.for_diabled').attr('disabled',true);
            }
        });

    });
</script>
