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
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">접수/작업번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <input type="text" class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="발주사" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="search" class="wd_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CONTROL_MANAGE_EXCEL_EXPORT"><img src="${pageContext.request.contextPath}/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_MANAGE_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자구분</label>
                            <input type="text" class="wd_200" name="COMP_CD" id="COMP_CD" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="사업자구분" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
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
                    <li>
                        <span class="slt_wrap trans_slt" style="width: 120px;">
                            <label for="CONTROL_SEARCH_CONDITION"></label>
                            <select name="CONTROL_SEARCH_CONDITION" id="CONTROL_SEARCH_CONDITION" style="width: inherit; text-align-last: center;">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1047}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                            </select>
                        </span>
                        <div class="d-inline-block" style="width:260px">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE" readonly disabled><button type="button" id="CONTROL_MANAGE_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="CONTROL_MANAGE_END_DATE" id="CONTROL_MANAGE_END_DATE" readonly disabled><button type="button" id="CONTROL_MANAGE_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" style="width: 40px !important;" for="UNIT_PRICE_CONFIRM">단가확인</label>
                            <select class="wd_200" name="UNIT_PRICE_CONFIRM" id="UNIT_PRICE_CONFIRM" title="단가확인">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1017}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업형태</label>
                            <input type="text" class="wd_200" name="WORK_TYPE" id="WORK_TYPE" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="작업형태" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                            <input type="text" class="wd_200" name="MATERIAL_KIND" id="MATERIAL_KIND" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="소재형태" readonly>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box"><input name="MATERIAL_SUPPLY_YN" id="MATERIAL_SUPPLY_YN" type="checkbox"><label for="MATERIAL_SUPPLY_YN"> 자재사급</label></span>
                            <span class="chk_box"><input name="OUTSIDE_YN" id="OUTSIDE_YN" type="checkbox"><label for="OUTSIDE_YN"> 외주</label></span>
                            <span class="chk_box"><input name="NO_UNIT_FINAL_AMT" id="NO_UNIT_FINAL_AMT" type="checkbox"><label for="NO_UNIT_FINAL_AMT"> 未단가</label></span>
                            <span class="chk_box"><input name="EMERGENCY_YN" id="EMERGENCY_YN" type="checkbox"><label for="EMERGENCY_YN"> 긴급</label></span>
                            <span class="chk_box"><input name="HIDE_PART" id="HIDE_PART" type="checkbox"><label for="HIDE_PART"> part 숨기기</label></span>
                        </span>
                        <span class="gubun"></span>
                        <span id="control_manage_amount_summary_area" class="slt_wrap amount_summary_inactive" style="margin-left:150px; padding-left: 10px;">
                            <span class="chk_box"><input name="AMOUNT_SUMMARY" id="AMOUNT_SUMMARY" type="checkbox"><label for="AMOUNT_SUMMARY" id="amount_summary_html"> 공급 금액 합계 : 0</label></span>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn" id="CONTROL_MANAGE_TOP_WRAP_BTN">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="hWrap mb-10">
            <div>
                <button type="button" class="defaultBtn btn-100w" id="NEW_ORDER_REGISTRATION">신규 주문 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_REGISTRATION">도면 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                <button type="button" class="defaultBtn btn-70w" id="MATCH_STOCK">재고충당</button>
                <button type="button" class="defaultBtn btn-70w" id="ESTIMATE_REGISTER_FROM_CONTROL">견적등록</button>
                <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_LIST_PRINT">견적List출력</button>
                <button type="button" class="defaultBtn btn-70w" id="TRANSACTION_STATEMENT">거래명세표</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CONFIRMATION" data-control_status="ORD001" style="color: blue;">확정</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CANCEL" data-control_status="ORD002" style="color: #FF0000;">취소</button>
                <button type="button" class="defaultBtn btn-50w" id="CONTROL_MONTH_CLOSE">마감</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="HOLD" data-control_status="ORD005">보류</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="TERMINATION" data-control_status="ORD004">종료</button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_DRAWING_VIEW">도면 View</button>
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_DRAWING_PRINT">도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_BARCODE_PRINT">바코드 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MANAGE_LABEL_PRINT">라벨 출력</button>
                </div>
            </div>
            <div class="mt-10">
                <div class="d-inline">
                    <label for="controlManageFilterKeyword"></label><input type="search" id="controlManageFilterKeyword" placeholder="Enter your keyword">
                    <label for="controlManageFilterColumn"></label><select id="controlManageFilterColumn"></select>
                    <label for="controlManageFilterCondition"></label><select id="controlManageFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="controlManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="controlManageFrozen" name="controlManageFrozen">
                    </select>
                </div>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_INPUT_MODE">입력필드</button>
                <button type="button" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_NORMAL_MODE">일반모드</button>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_CLOSE_MODE">마감모드</button>
                <button type="button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_ALL_MODE">전체모드</button>
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
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_MERGE" style="background-color: #5b9bd5">Merge</button>
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

<div class="modal" id="CONTROL_MERGE_POPUP" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 691px; height: 388px">
        <div class="modal-content" style="height: inherit;">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">기준 작업지시번호를 선택해주세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <div class="d-flex align-items-center mt-10">
                        <div class="ml-auto">
                            <button type="button" class="defaultBtn btn-100w green" id="CONTROL_MERGE_SAVE">확인</button>
                            <button type="button" class="defaultBtn btn-100w" data-dismiss="modal" style="background-color: #dbdbdb">취소</button>
                        </div>
                    </div>
                    <div class="mt-10">
                        <div id="CONTROL_MERGE_GRID"></div>
                    </div>
                </div>
                <div></div>
            </div>
<%--            <div class="modal-footer" style="text-align: center !important">--%>
<%--                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>

<form id="control_estimate_list_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="excel.selectControlEstimateDetailListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="control_estimate_list_template"/>
</form>

<input type="button" id="ATTACHMENT_BUTTON" style="display: none;">

<div id="stockMatchPopup" class="stockSearchPopup" style="display: none;">
    <form class="form-inline" id="stock_match_pop_form" name="stock_match_pop_form" role="form" onsubmit="return false;">
        <input type="hidden" id="queryId" name="queryId" value="orderMapper.selectMatchStockList">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
        <input type="hidden" id="SAVE_YN" name="SAVE_YN" value="N">
        <div class="stockPopupWrap">
            <div class="searchPopup">
                <h3><i class="xi-library-bookmark"></i> 재고 매칭 검색 및 지정</h3>
                <div class="searchPopupWrap">
                    <div class="stockMapLeft">
                        <!--도면삽입-->
                        <img id="match_stock_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
                    </div>
                    <div class="searchPopupRight">
                        <div class="searchPopupRightTop">
                            <h4><i class="xi-library-bookmark"></i> 매칭 List</h4>
                            <button type="button" id="stock_match_pop_refresh" class="refreshBtn">
                                <img src="./resource/asset/images/common/btn_refresh.png" alt="새로고침">
                            </button>
                            <div class="barcode barcode_div">
                                <span class="barCode">
                                    <img src="resource/asset/images/common/img_barcode_long.png" alt="바코드" id="stock_match_barcode_img">
                                </span>
                                <span class="barCodeTxt">
                                    <input type="text" class="wd_200 hg_35" id="STOCK_MATCH_BARCODE_NUM" placeholder="도면의 바코드를 스캔해주세요">
                                </span>
                            </div>
                        </div>
                        <div id="match_stock_grid" class="listTable">
                            <!--gird삽입-->
                        </div>
                        <div class="stockPopupBtnWrap">
                            <button id="matchStockDetailBtn" class="mapDetailBtn">도면상세보기</button>
                            <button id="stockBtnClose4" class="stockBtnClose">닫기</button>
                            <button id="matchStockBtnSave" class="stockBtnSave">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

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

        const gridId = 'CONTROL_MANAGE_GRID';
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', dataType: 'integer',dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {
                        title: '상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM',
                        render: function (ui) {
                            if (ui.cellData === '보류') {
                                return {style: 'color: #ff0000'};
                            }
                        }
                    },
                    {title: '', minWidth: 20, dataType: 'integer', dataIndx: 'CONTROL_VER'},
                    {title: '변경일', dataIndx: 'CONTROL_STATUS_DT',
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

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1017')}
            },
            {
                title: '사업자<br>구분', width: 75, dataIndx: 'COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: FAMILY_COMPANY}
            },
            {
                title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY}
            },
            {
                title: '비고', align: 'left', width: 100, dataIndx: 'CONTROL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1059')},
                /*render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === undefined || cellData === '') {
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
                }*/
            },
            {title: '주요<br>검사', width: 50, dataIndx: 'MAIN_INSPECTION_NM', hidden: true},
            {
                title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            // {
            //     title: '총장', minWidth: 30, dataType: 'integer', dataIndx: 'TOTAL_SHEET',
            //     styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            //     editable: function (ui) {
            //         let rowData = ui.rowData;
            //
            //         return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
            //     }
            // },
            {
                title: '작업지시번호', align: 'left', width: 180, dataIndx: 'CONTROL_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#FF0000'},
                style: {'font-weight': 'bold', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '파<br>트', minWidth: 30, dataIndx: 'PART_NUM', styleHead: {'background':'#A9D3F5'},
                editable: function(ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                render: function (ui) {
                    if (ui.rowData.WORK_TYPE === 'WTP020' && ui.rowData.LAG_WORK_TYPE === undefined && ui.rowData.CONTROL_STATUS !== 'ORD001') {
                        return '<span class="ui-icon ui-icon-circle-plus" name="PART_NUM_PLUS_BUTTON" style="cursor: pointer"></span>';
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
                        newRowData.WORK_TYPE = 'WTP050';
                        newRowData.CONTROL_DETAIL_SEQ = null;
                        newRowData.ORDER_DRAWING_NUM = null;
                        newRowData.DRAWING_VER = null;
                        newRowData.DRAWING_UP_DT = null;
                        newRowData.PREV_DRAWING_NUM = null;
                        newRowData.OUTSIDE_YN = null;
                        newRowData.WORK_FACTORY = null;
                        newRowData.MATERIAL_SUPPLY_YN = null;
                        newRowData.INNER_DUE_DT = null;
                        newRowData.SIZE_TXT = null;
                        newRowData.SIZE_TYPE = null;
                        newRowData.SIZE_W = null;
                        newRowData.SIZE_H = null;
                        newRowData.SIZE_T = null;
                        newRowData.SIZE_D = null;
                        newRowData.SIZE_L = null;
                        newRowData.MATERIAL_TYPE = null;
                        newRowData.MATERIAL_DETAIL = null;
                        newRowData.MATERIAL_KIND = null;
                        newRowData.SURFACE_TREAT = null;
                        newRowData.MATERIAL_NOTE = null;
                        newRowData.PART_UNIT_QTY = null;
                        newRowData.ORIGINAL_SIDE_QTY = null;
                        newRowData.OTHER_SIDE_QTY = null;
                        newRowData.MATERIAL_FINISH_GRIND = null;
                        newRowData.MATERIAL_FINISH_HEAT = null;
                        newRowData.UNIT_MATERIAL_AMT = null;
                        newRowData.UNIT_MATERIAL_FINISH_GRIND_AMT = null;
                        newRowData.UNIT_MATERIAL_FINISH_HEAT_AMT = null;
                        newRowData.UNIT_SURFACE_AMT = null;
                        newRowData.UNIT_PROCESS_AMT = null;
                        newRowData.UNIT_ETC_AMT = null;
                        newRowData.UNIT_AMT_NOTE = null;
                        newRowData.UNIT_FINAL_EST_AMT = null;
                        newRowData.UNIT_FINAL_AMT = null;
                        newRowData.DWG_GFILE_SEQ = null;
                        newRowData.ORDER_DXF_GFILE_SEQ = null;
                        newRowData.ORDER_PDF_GFILE_SEQ = null;
                        newRowData.ORDER_IMG_GFILE_SEQ = null;
                        newRowData.VIEW_GFILE_SEQ = null;
                        newRowData.ETC_GFILE_SEQ = null;
                        newRowData.PART_STATUS = null;
                        // newRowData.STATUS_DT = null;
                        newRowData.MCT_NOTE = null;
                        newRowData.MCT_WORK_TYPE = null;
                        newRowData.OUTSIDE_COMP_CD = null;
                        newRowData.OUTSIDE_ORDER_NUM = null;
                        newRowData.OUTSIDE_NOTE = null;
                        newRowData.OUTSIDE_MATERIAL_SUPPLY_YN = null;
                        newRowData.OUTSIDE_REQUEST_FINISH_YN = null;
                        newRowData.OUTSIDE_REQUEST_PROCESS_YN = null;
                        newRowData.OUTSIDE_REQUEST_GRIND_YN = null;
                        newRowData.OUTSIDE_REQUEST_SURFACE_YN = null;
                        newRowData.OUTSIDE_REQUEST_ETC = null;
                        newRowData.OUTSIDE_HOPE_DUE_DT = null;
                        newRowData.OUTSIDE_UNIT_AMT = null;
                        newRowData.OUTSIDE_CONFIRM_DT = null;
                        newRowData.OUTSIDE_IN_DT = null;
                        newRowData.OUTSIDE_STATUS = null;
                        newRowData.OUTSIDE_STATUS_DT = null;
                        newRowData.INNER_WORK_FINISH_DT = null;
                        newRowData.FORECAST_UNIT_AMT = null;
                        // 발주
                        newRowData.ORDER_SEQ = null;
                        newRowData.ORDER_NUM = null;
                        newRowData.REGIST_NUM = null;
                        newRowData.ORDER_QTY = null;
                        newRowData.ORDER_DUE_DT = null;
                        newRowData.DELIVERY_DT = null;
                        // newRowData.OUT_FINISH_DT = null;
                        newRowData.PROJECT_NM = null;
                        newRowData.MODULE_NM = null;
                        newRowData.DELIVERY_COMP_NM = null;
                        newRowData.LABEL_NOTE = null;
                        newRowData.ORDER_STAFF_SEQ = null;
                        newRowData.DESIGNER_NM = null;
                        newRowData.ORDER_DRAWING_NUM = null;
                        // newRowData.DWG_GFILE_SEQ = null; // 확인 필요
                        // newRowData.ORDER_DXF_GFILE_SEQ = null; // 확인 필요
                        // newRowData.ORDER_PDF_GFILE_SEQ = null; // 확인 필요
                        // newRowData.ORDER_IMG_GFILE_SEQ = null; // 확인 필요
                        // newRowData.VIEW_GFILE_SEQ = null; // 확인 필요
                        newRowData.ITEM_NM = null;
                        newRowData.ORIGINAL_SIDE_QTY = null;
                        newRowData.OTHER_SIDE_QTY = null;
                        newRowData.UNIT_FINAL_EST_AMT = null;
                        newRowData.UNIT_FINAL_AMT = null;
                        newRowData.PREV_DRAWING_NUM = null;
                        newRowData.IS_NEW_ROW = true;

                        $orderManagementGrid.pqGrid('addRow', {
                            newRow: newRowData,
                            rowIndx: lastRowIndex + 1,
                            checkEditable: false
                        });
                        // $orderManagementGrid.pqGrid('setSelection', {rowIndx: lastRowIndex + 1});
                        event.preventDefault();
                    });
                }
            },
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON', styleHead: {'background':'#A9D3F5'},
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
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && (fnIsEmpty(rowData.PART_NUM) && rowData.WORK_TYPE !== 'WTP050');
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')}
            },
            {title: '참<br>조', minWidth: 30, dataIndx: 'ETC_GFILE_SEQ', styleHead: {'background':'#a9d3f5'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = cellData ? 'floppyDiskAble' : 'floppyDiskDisable';
                    let text = '<span class="' + cls + '" name="attachment" style="cursor: pointer"></span>';

                    return {text: text};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowData = ui.rowData;

                    $cell.find('[name=attachment]').bind('click', function () {
                        if (fnIsGridEditing($orderManagementGrid)) {
                            return false;
                        }

                        let GfileKey = ui.rowData.ETC_GFILE_SEQ;
                        $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
                        const $attachmentButton = $('#ATTACHMENT_BUTTON');
                        $attachmentButton.data('rowIndx', ui.rowIndx);
                        $attachmentButton.data('GfileKey', GfileKey);
                        if (rowData.ETC_GFILE_SEQ) {
                            $("#common_file_download_form #deleteYn").val(true);
                        } else {
                            $("#common_file_download_form #deleteYn").val(false);
                        }
                        commonFileDownUploadPopupCall(GfileKey, 'ATTACHMENT_BUTTON');
                    });
                }
            },
            {
                title: '가공<br>납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'INNER_DUE_DT', formatRaw: 'yy/mm/dd',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002');
                },
                editor: {type: 'textbox', init: fnDateEditor},
            },
            {
                title: 'Part<br>Unit', dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE === 'WTP050';
                },
                render: function (ui) {
                    let rowData = ui.rowData;

                    if (rowData.WORK_TYPE !== 'WTP050') {
                        let cls = 'bg-lightgray';

                        return {cls: cls};
                    }
                }
            },
            {title: '수량<br>추가', dataType: 'integer', format: '#,###', dataIndx: 'ADDITIONAL_QTY',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.WORK_TYPE != 'WTP020' && rowData.WORK_TYPE != 'WTP040';
                },
                render: function (ui) {
                    let rowData = ui.rowData;

                    if (rowData.WORK_TYPE == 'WTP020' || rowData.WORK_TYPE == 'WTP040') {
                        let cls = 'bg-lightgray';

                        return {cls: cls};
                    }
                }
            },
            {title: '발주<br>수량', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '대칭', align: 'center',
                colModel: [
                    {title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'DNJSCLD'},
                    {title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'EOCLD'}
                ]
            },
            {
                title: '재고충당', align: 'center',
                colModel: [
                    {title: '재고번호', dataType: 'String', dataIndx: 'INSIDE_STOCK_NUM', width: 100, minWidth: 100},
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_REQUEST_QTY', width: 40, minWidth: 40},
                    {title: '불출', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_OUT_QTY', width: 40, minWidth: 40}
                ]
            },
            {
                title: '외주', minWidth: 30, dataIndx: 'OUTSIDE_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '수행<br>공장', dataIndx: 'WORK_FACTORY',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1014', null)}
            },
            {
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '발주정보', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {
                        title: '', minWidth: 25, dataIndx: 'ORDER_NUM_PLUS_BUTTON',
                        styleHead: {'background': '#a9d3f5'},
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null, text = '';

                            if ((ui.rowData.WORK_TYPE === 'WTP010' || ui.rowData.WORK_TYPE === 'WTP020' || ui.rowData.WORK_TYPE === 'WTP030') && (ui.rowData.CONTROL_STATUS === undefined || ui.rowData.CONTROL_STATUS == null || ui.rowData.CONTROL_STATUS === 'ORD002')) {
                                if (ui.rowData.LAG_WORK_TYPE === undefined) {
                                    text = '<span class="ui-icon ui-icon-circle-plus" name="ORDER_NUM_PLUS_BUTTON" style="cursor: pointer"></span>';
                                } else {
                                    text = '<span class="ui-icon ui-icon-circle-minus" name="ORDER_NUM_MINUS_BUTTON" style="cursor: pointer"></span>';
                                }
                            }
                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: text};
                        },
                        postRender: function (ui) {
                            const grid = this;
                            const $cell = grid.getCell(ui);

                            $cell.find('[name=ORDER_NUM_PLUS_BUTTON]').on('click', function () {
                                const data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                                const totalRecords = data.length;
                                const groupedControlNum = fnGroupBy(data, 'CONTROL_NUM');
                                let newRowData = fnCloneObj(ui.rowData);
                                let rowIndex;
                                newRowData.ROW_NUM = totalRecords + 1;
                                newRowData.ORDER_SEQ = null;
                                newRowData.ORDER_NUM = null;
                                newRowData.REGIST_NUM = null;
                                newRowData.ORDER_DRAWING_NUM = null;
                                newRowData.ORDER_QTY = null;
                                newRowData.ORIGINAL_SIDE_QTY = null;
                                newRowData.OTHER_SIDE_QTY = null;
                                newRowData.ORDER_DUE_DT = null;
                                newRowData.OUT_QTY = null;
                                newRowData.ORDER_OUT_FINISH_DT = null;
                                newRowData.INVOICE_NUM = null;
                                newRowData.DELIVERY_DT = null;
                                newRowData.LAG_WORK_TYPE = 'not undefined'; // minus button 표시하기 위함

                                for (let i = 0, LENGTH = groupedControlNum[newRowData.CONTROL_NUM].length; i < LENGTH; i++) {
                                    const rowData = groupedControlNum[newRowData.CONTROL_NUM][i];
                                    const WORK_TYPE = rowData.WORK_TYPE;

                                    if (WORK_TYPE === 'WTP010' || WORK_TYPE === 'WTP020' || WORK_TYPE === 'WTP030') {
                                        rowIndex = rowData.pq_ri;
                                    }
                                }

                                $orderManagementGrid.pqGrid('addRow', {
                                    newRow: newRowData,
                                    rowIndx: rowIndex + 1,
                                    checkEditable: false
                                });
                                $orderManagementGrid.pqGrid('setSelection', {rowIndx: rowIndex + 1});

                                autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);
                            });

                            $cell.find('[name=ORDER_NUM_MINUS_BUTTON]').on('click', function () {
                                fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                                    fnDeletePQGrid($orderManagementGrid, [ui.rowIndx], 'orderMapper.deleteControlPartOrder');
                                });
                            });
                        }
                    },
                    {
                        title: '접수번호', align: 'left', width: 140, dataIndx: 'REGIST_NUM',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                                cellData = "";
                                ui.rowData.REGIST_NUM = "";
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                                cellData = "";
                                ui.rowData.ORDER_NUM = "";
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '도면번호', align: 'left', width: 150, dataIndx: 'ORDER_DRAWING_NUM',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                        }
                    },
                    {title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON', styleHead: {'background':'#a9d3f5'},
                        render: function (ui) {
                            if (ui.rowData.ORDER_IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                            else return '';
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find('#imageView').bind('click', function () {
                                let rowData = ui.rowData;
                                callQuickDrawingImageViewer(rowData.ORDER_IMG_GFILE_SEQ, rowData);
                            });
                        }
                    },
                    {
                        title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '원', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '대', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '발주납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'ORDER_DUE_DT',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        editor: {type: 'textbox', init: fnDateEditor},
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '출고', dataIndx: 'OUT_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '출고일자', dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_OUT_FINISH_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {title: 'INV No.', width: 100, dataIndx: 'INVOICE_NUM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '마감일자', dataType: 'date', format: 'mm/dd', dataIndx: 'CLOSE_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '계산견적', width: 55, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT',
                        // hidden: true, // 20210331 임시 hidden 처리
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '납품확인', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'DELIVERY_DT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editor: {type: 'textbox', init: fnDateEditor},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_TOTAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '종전가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002' && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '모듈', align: 'left', width: 70, dataIndx: 'MODULE_NM', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002' && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '납품처', align: 'left', dataIndx: 'DELIVERY_COMP_NM', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002' && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002' && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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

                                if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                    cls = 'bg-lightgray';
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

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002' && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
                },
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let rowData = ui.rowData;

                        if (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') {
                            return fnGetCommCodeGridSelectBox('1027');
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

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                        cellData = "";
                        ui.rowData.MATERIAL_DETAIL = "";
                    }

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

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.MATERIAL_KIND = "";

                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
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

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.SURFACE_TREAT = "";
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '후가공', align: 'center', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                colModel: [
                    {
                        title: '연마', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020';
                        },
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020')},
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020') {
                                cls = 'bg-lightgray';
                                ui.cellData = "";
                                ui.rowData.MATERIAL_FINISH_GRIND = "";
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020';
                        },
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030')},
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020') {
                                cls = 'bg-lightgray';
                                ui.cellData = "";
                                ui.rowData.MATERIAL_FINISH_HEAT = "";
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },
            {
                title: '소재비고', dataIndx: 'MATERIAL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.MATERIAL_NOTE = "";
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '가공요건', width: 85, dataIndx: 'DETAIL_MACHINE_REQUIREMENT',
                // hidden: true, // 20210331 임시 hidden 처리
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    let text = '';
                    let isDisabled = rowData.WORK_TYPE === 'WTP020' ? 'disabled' : '';

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    text = '<button class="miniBtn" name="processing_requirements"' + isDisabled + ' style="background-color: #ffffd1">가공요건</button>';

                    return {cls: cls, text: text};
                },
                postRender(ui) {
                    const grid = this,
                        $cell = grid.getCell(ui);

                    $cell.find("[name=processing_requirements]").bind("click", function () {
                        processingRequirementsPop('CONTROL');
                    });
                }
            },
            {
                title: '종전가 도면번호', align: 'left', width: 120, dataIndx: 'PREV_DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP040';
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            /*{
                title: '견적<br>합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'EST_TOTAL_AMT', hidden: true,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = null, text = cellData;

                    if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },*/
            {
                title: '자동 계산견적 단가', align: 'center', hidden: true,
                colModel: [
                    {title: '합계', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {title: '소재비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_AUTO_AMT'},
                    {title: '연마비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT'},
                    {title: '열처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT'},
                    {title: '표면처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SURFACE_AUTO_AMT'},
                    {title: '가공비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_PROCESS_AUTO_AMT'},
                    {
                        title: '기타추가', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_ETC_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '견적비고', align: 'left', dataIndx: 'UNIT_AMT_NOTE',
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP050';
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },
            {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {
                title: 'DXF', minWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
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
            {title: 'Rev.', dataIndx: 'DRAWING_VER'},
            {title: 'Rev. 일시', width: 120, dataIndx: 'DRAWING_UP_DT'},
            {
                title: '외주현황', align: 'center', colModel: [
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '소재제공', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                    {title: '외주단가', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT', hidden: true},
                    {title: '합계금액', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_FINAL_AMT', hidden: true},
                    {title: '외주납기', dataType: 'date', format: 'mm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고일시', dataIndx: 'OUTSIDE_IN_DT_F'},
                    {title: '비고', dataIndx: 'OUTSIDE_NOTE', hidden: true},
                ]
            },
            {title: '등록/업데이트<br>일시', width: 90, dataIndx: 'CONTROL_PART_INSERT_UPDATE_DT'},
            {title: 'CONTROL_BARCODE_NUM', dataIndx: 'CONTROL_BARCODE_NUM', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            height: 720,
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
                if($('#controlManageFilterKeyword').val() !== '')
                    fnFilterHandler($orderManagementGrid, 'controlManageFilterKeyword', 'controlManageFilterCondition', 'controlManageFilterColumn');
                autoMerge(this, true);
                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#CONTROL_MANAGE_RECORDS').html(data.length);
                amountSummaryHtml();
            },
            cellClick: function (event, ui) {
                supplyUnitCostInit(); // 공급단가적용 초기화
                // if(ui.rowData.ORDER_IMG_GFILE_SEQ && typeof(windowImageViewer) != 'undefined' && !windowImageViewer.closed) callQuickRowChangeDrawingImageViewer(ui.rowData.ORDER_IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
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
                        callQuickRowChangeDrawingImageViewer(selRowData.ORDER_IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                }
                amountSummaryHtml();
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 24);
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
                $('#controlManageFilterColumn').html(filterOpts);
                $('#controlManageFrozen').html(frozenOts);
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
                        // 수행공장
                        if (newRowData.hasOwnProperty('WORK_FACTORY')) {
                            let workFactoryList = fnGetCommCodeGridSelectBox('1014');
                            let index = workFactoryList.findIndex(function (element) {
                                return element.text === newRowData.WORK_FACTORY;
                            });

                            if (index < 0) {
                                index = workFactoryList.findIndex(function (element) {
                                    return element.value === newRowData.WORK_FACTORY;
                                });
                            }
                            $orderManagementGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'WORK_FACTORY': workFactoryList[index].value}
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
            let array = [];
            const inputModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN',
                'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM', 'DRAWING_NUM_BUTTON', 'ORDER_DRAWING_NUM',
                'ORDER_NUM_PLUS_BUTTON', 'REGIST_NUM', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'PART_UNIT_QTY',
                'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ITEM_NM', 'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'SIZE_TXT', 'WORK_TYPE', 'INNER_DUE_DT', 'OUTSIDE_YN',
                'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE',
                'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT',
                'UNIT_ETC_AMT', 'UNIT_AMT_NOTE',
                'UNIT_FINAL_EST_AMT', 'EST_TOTAL_AMT', 'UNIT_FINAL_AMT', 'PROJECT_NM', 'MODULE_NM', 'DELIVERY_COMP_NM',
                'LABEL_NOTE', 'PREV_DRAWING_NUM', 'SAME_SIDE_YN',
                'INSIDE_STOCK_NUM','STOCK_REQUEST_QTY','STOCK_OUT_QTY','ADDITIONAL_QTY'
                // , 'DETAIL_MACHINE_REQUIREMENT', 'TOTAL_SHEET'
            ];
            const normalModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD',
                'CONTROL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN', 'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM',
                'DRAWING_NUM_BUTTON', 'ORDER_DRAWING_NUM', 'ORDER_NUM_PLUS_BUTTON', 'REGIST_NUM', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT',
                'OUT_QTY', 'ORDER_OUT_FINISH_DT', 'INVOICE_NUM', 'PART_UNIT_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY',
                'CONTROL_PART_QTY', 'WORK_TYPE', 'INNER_DUE_DT', 'OUTSIDE_YN', 'WORK_FACTORY', 'MATERIAL_SUPPLY_YN',
                'SIZE_TXT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_TOTAL_AMT',
                'PREV_UNIT_FINAL_AMT', 'ITEM_NM',
                'DETAIL_MACHINE_REQUIREMENT', // 20210331 임시 hidden 처리
                'PREV_DRAWING_NUM', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT',
                'MATERIAL_FINISH_HEAT', 'MATERIAL_NOTE', 'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ', 'DRAWING_VER',
                'DRAWING_UP_DT', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN',
                'OUTSIDE_UNIT_AMT', 'OUTSIDE_IN_DT_F', 'DELIVERY_DT', 'CONTROL_PART_INSERT_UPDATE_DT', 'ORDER_IMG_GFILE_SEQ',
                'EOCLD', 'DNJSCLD', 'SAME_SIDE_YN',
                'INSIDE_STOCK_NUM','STOCK_REQUEST_QTY','STOCK_OUT_QTY','ADDITIONAL_QTY'
                // , 'TOTAL_SHEET'
            ];
            const closeModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD',
                'CONTROL_NOTE', 'INVOICE_NUM', 'MAIN_INSPECTION', 'EMERGENCY_YN', 'CONTROL_NUM_BUTTON',
                'CONTROL_NUM', 'PART_NUM', 'DRAWING_NUM_BUTTON', 'ORDER_DRAWING_NUM', 'ITEM_NM', 'SIZE_TXT',
                'WORK_TYPE', 'OUTSIDE_YN', 'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT', 'MATERIAL_DETAIL', 'MATERIAL_KIND',
                'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY', 'CONTROL_PART_QTY', 'ORIGINAL_SIDE_QTY',
                'OTHER_SIDE_QTY', 'ORDER_NUM_PLUS_BUTTON', 'REGIST_NUM', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'OUT_QTY',
                'ORDER_OUT_FINISH_DT', 'CLOSE_DT', 'DELIVERY_DT',
                'DETAIL_MACHINE_REQUIREMENT', 'UNIT_SUM_AUTO_AMT', // 20210331 임시 hidden 처리
                'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT', 'UNIT_MATERIAL_AUTO_AMT',
                'UNIT_MATERIA_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT',
                'UNIT_PROCESS_AUTO_AMT', 'UNIT_SURFACE_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE',
                'MODULE_NM', 'DELIVERY_COMP_NM', 'LABEL_NOTE', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT',
                'FINAL_TOTAL_AMT', 'PREV_UNIT_FINAL_AMT', 'PROJECT_NM', 'ITEM_NM', 'ORDER_STAFF_NM', 'PREV_DRAWING_NUM',
                'ORDER_IMG_GFILE_SEQ', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN', 'OUTSIDE_UNIT_AMT',
                'OUTSIDE_FINAL_AMT',
                'INSIDE_STOCK_NUM','STOCK_REQUEST_QTY','STOCK_OUT_QTY','ADDITIONAL_QTY'
                //, 'TOTAL_SHEET'
            ];
            const allModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD',
                'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'CONTROL_NOTE', 'INVOICE_NUM', 'PROJECT_NM', 'MODULE_NM',
                'DELIVERY_COMP_NM', 'LABEL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN',
                'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM', 'DRAWING_NUM_BUTTON', 'ORDER_DRAWING_NUM', 'ITEM_NM',
                'SIZE_TXT', 'WORK_TYPE', 'EOCLD', 'DNJSCLD', 'SAME_SIDE_YN', 'OUTSIDE_YN', 'WORK_FACTORY',
                'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT',
                'MATERIAL_NOTE', 'PART_UNIT_QTY', 'CONTROL_PART_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY',
                'ORDER_NUM_PLUS_BUTTON', 'REGIST_NUM', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'OUT_QTY', 'ORDER_OUT_FINISH_DT',
                'CLOSE_DT', 'DELIVERY_DT', 'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT',
                'DETAIL_MACHINE_REQUIREMENT', 'UNIT_SUM_AUTO_AMT', // 20210331 임시 hidden 처리
                'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'UNIT_FINAL_EST_AMT', 'UNIT_MATERIAL_AUTO_AMT',
                'UNIT_MATERIA_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT',
                'UNIT_PROCESS_AUTO_AMT', 'UNIT_SURFACE_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE',
                'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_TOTAL_AMT', 'PREV_UNIT_FINAL_AMT', 'PREV_DRAWING_NUM',
                'DXF_GFILE_SEQ', 'ORDER_IMG_GFILE_SEQ', 'PDF_GFILE_SEQ', 'DRAWING_VER', 'DRAWING_UP_DT',
                'ETC_GFILE_SEQ', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN', 'OUTSIDE_UNIT_AMT',
                'OUTSIDE_FINAL_AMT', 'OUTSIDE_HOPE_DUE_DT', 'OUTSIDE_IN_DT_F', 'OUTSIDE_NOTE', 'UNIT_MATERIAL_AUTO_AMT',
                'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT', 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT',
                'CONTROL_PART_INSERT_UPDATE_DT',
                'INSIDE_STOCK_NUM','STOCK_REQUEST_QTY','STOCK_OUT_QTY','ADDITIONAL_QTY'
                //, 'TOTAL_SHEET'
            ];

            switch (elementId) {
                case 'CONTROL_MANAGE_INPUT_MODE':
                    array = inputModeArray;
                    break;
                case 'CONTROL_MANAGE_NORMAL_MODE':
                    array = normalModeArray;
                    break;
                case 'CONTROL_MANAGE_CLOSE_MODE':
                    array = closeModeArray;
                    break;
                case 'CONTROL_MANAGE_ALL_MODE':
                    array = allModeArray;
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
            let controlStatus = event.target.dataset.control_status;
            confirmOrderStatus(controlStatus);
        };

        const confirmOrderStatus = function (controlStatus) {
            let controlStatusNm = '';
            let controlSeqList = [];

            switch (controlStatus) {
                case 'ORD001':
                    controlStatusNm = '확정';
                    break;
                case 'ORD002':
                    controlStatusNm = '확정취소';
                    break;
                case 'ORD004':
                    controlStatusNm = '종료';
                    break;
                case 'ORD005':
                    controlStatusNm = '보류';
                    break;
            }

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData  = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                controlSeqList[i] = rowData.CONTROL_SEQ;
            }

            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            let message =
                '<h4>\n' +
                '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                '    <span>선택하신 ' + controlSeqList.length + ' 건을 ' + controlStatusNm + '처리합니다. \n진행하시겠습니까?</span>\n' +
                '</h4>';
            fnConfirm(null, message, function () {updateOrderStatus(controlStatus)});
        };

        const updateOrderStatus = function (controlStatus) {
            let list = [];
            let controlStatusList = [];
            let message;
            let outsideFlag = false;
            let closeFlag = false;
            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                list[i] = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // 값 변경 전 이상 case 확인하기 위해 배열에 담는다.
                controlStatusList[i] = list[i].CONTROL_STATUS || undefined;
                list[i].CONTROL_STATUS = controlStatus;
                if(list[i].OUTSIDE_YN == 'Y' && (list[i].OUTSIDE_STATUS == 'OST001' || list[i].OUTSIDE_STATUS == 'OST003')) {
                    outsideFlag = true;
                }
                if(typeof list[i].CLOSE_DT != 'undefined' && list[i].CLOSE_DT != null && list[i].CLOSE_DT != '') {
                    closeFlag = true;
                }
            }

            // 중복제거
            controlStatusList = [...new Set(controlStatusList)];

            /**
             * 상태값이 다를 때
             * 이미 처리된 대상에 대해서 동일한 상태처리를 진행할 경우
             * 빈칸인 상태에서 취소를 진행하는 경우
             */
            if ((controlStatusList.length > 1 && !(controlStatusList.includes('ORD002') && controlStatusList.includes(undefined))) || controlStatusList[0] === controlStatus || (controlStatusList[0] === undefined && controlStatus === 'ORD004')) {
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
            if(closeFlag) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>마감된 대상이 존재하여 종료가 불가합니다.</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }

            let parameters = {'url': '/managerControlStatus', 'data': {data: JSON.stringify(list)}};

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
            let rollSeq = '${authUserInfo.ROLE_SEQ}';
            let top = $('#view_tab_' + rollSeq + '0201 .gubunWrap');
            let bottom = $('#view_tab_' + rollSeq + '0201 .bottomWrap');
            let con = $('#view_tab_' + rollSeq + '0201 .bottomWrap .tableWrap .conWrap');

            top.stop().animate({'height': '130px'}, 300, 'easeOutCubic');
            bottom.stop().animate({'height': '740px'}, 300, 'easeOutCubic');
            con.css({'height': '640px'});

            $orderManagementGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
        };

        // topWrap 축소 함수
        const topMenuClose = function () {
            let rollSeq = '${authUserInfo.ROLE_SEQ}';
            let top = $('#view_tab_' + rollSeq + '0201 .gubunWrap');
            let bottom = $('#view_tab_' + rollSeq + '0201 .bottomWrap');
            let con = $('#view_tab_' + rollSeq + '0201 .bottomWrap .tableWrap .conWrap');

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

                let condition = $('#controlManageFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#controlManageFilterKeyword').val(),
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

            const controlList = [
                'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'CONTROL_VER', 'COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NOTE',
                'MAIN_INSPECTION', 'EMERGENCY_YN', 'CONTROL_STATUS_NM', 'CONTROL_STATUS_DT',
                'PRICE_CONFIRM', 'SAME_SIDE_YN', 'CONTROL_MERGE_CHECKBOX'
                // , 'TOTAL_SHEET'
            ];
            const partList = [
                'PART_NUM', 'DRAWING_VER', 'DRAWING_UP_DT', 'PREV_DRAWING_NUM',
                'WORK_TYPE', 'CONTROL_PART_QTY', 'DNJSCLD', 'EOCLD', 'OUTSIDE_YN', 'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT',
                'SIZE_TXT', 'SIZE_TYPE', 'SIZE_W', 'SIZE_H', 'SIZE_T', 'SIZE_D', 'SIZE_L',
                'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE',
                'PART_UNIT_QTY', 'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT',
                'UNIT_SURFACE_AMT',
                'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'DETAIL_MACHINE_REQUIREMENT',
                'UNIT_AMT_NOTE',
                'DWG_GFILE_SEQ', 'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ', 'ORDER_IMG_GFILE_SEQ', 'VIEW_GFILE_SEQ', 'ETC_GFILE_SEQ',
                'MCT_NOTE', 'MCT_WORK_TYPE',
                'OUTSIDE_COMP_CD', 'OUTSIDE_COMP_NM', 'OUTSIDE_ORDER_NUM', 'OUTSIDE_NOTE', 'OUTSIDE_MATERIAL_SUPPLY_YN',
                'OUTSIDE_REQUEST_FINISH_YN', 'OUTSIDE_REQUEST_PROCESS_YN', 'OUTSIDE_REQUEST_GRIND_YN',
                'OUTSIDE_REQUEST_SURFACE_YN', 'OUTSIDE_REQUEST_ETC', 'OUTSIDE_HOPE_DUE_DT', 'OUTSIDE_UNIT_AMT',
                'OUTSIDE_FINAL_AMT', 'OUTSIDE_IN_DT_F', 'OUTSIDE_STATUS', 'OUTSIDE_STATUS_DT',
                'UNIT_MATERIAL_AUTO_AMT', 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT',
                'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', 'UNIT_SURFACE_AUTO_AMT', 'UNIT_PROCESS_AUTO_AMT',
                'CONTROL_PART_INSERT_UPDATE_DT',
                'UNIT_SUM_AUTO_AMT', 'INSIDE_STOCK_NUM', 'STOCK_REQUEST_QTY', 'STOCK_OUT_QTY','ADDITIONAL_QTY'
            ];
            const includeList = controlList.concat(partList);

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['CONTROL_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (controlList.includes(dataIndx)) {
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
                        } else if (partList.includes(dataIndx)) {
                            let controlDetailSeq = data[j]['CONTROL_DETAIL_SEQ'],
                                controlDetailSeqPrev = data[j - 1] ? data[j - 1]['CONTROL_DETAIL_SEQ'] : undefined;

                            if (controlNum === controlNumPrev && controlDetailSeq === controlDetailSeqPrev) {
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
                        }
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };

        const validationCheck = function (dataList) {
            workTypeCheck(dataList);
            registNumCheck(dataList)
            controlNumCheck(dataList)
            // drawingNumCheck(dataList);

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];

                if (Object.keys(rowData).length > 2) {
                    requiredCheck(rowData);
                    badCodeCheck(rowData);
                    inputErrorCheck(rowData);
                }
            }
        };
        const controlNumCheck = function (dataList) {
            $.each(dataList, function (idx,Item) {
                var regexpSpec = /[^A-Za-z0-9\-]/gi;
                if(regexpSpec.test(Item.CONTROL_NUM)) {
                    addErrorList(Item.pq_ri, 'CONTROL_NUM');
                }
            })
        }
        const registNumCheck = function (dataList) {
            const groupedRegistNum = fnGroupBy(dataList, 'REGIST_NUM');
            // console.log(groupedRegistNum);
            $.each(groupedRegistNum, function (idx,Item) {
                if(idx !== 'undefined' && idx != 'null' && idx != '') {
                    $.each(Item, function (idx2,Item2) {
                        if(Item.length > 1) {
                            addErrorList(Item2.pq_ri, 'REGIST_NUM');
                        }else {
                            var regexpSpec = /[^A-Za-z0-9\-\_]/gi;
                            if(regexpSpec.test(Item2.REGIST_NUM)) {
                                addErrorList(Item2.pq_ri, 'REGIST_NUM');
                            }
                        }
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
            const commonRequiredList = ['COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NUM', 'ORDER_DRAWING_NUM', /*'ITEM_NM', FIXME 확인*/ 'INNER_DUE_DT', 'SIZE_TXT'];
            const singleList = ['MATERIAL_KIND', 'SURFACE_TREAT', 'ORDER_QTY']; // 단품
            const assemblyList = ['ORDER_QTY']; // 조립
            const modifiedList = ['MATERIAL_KIND', 'SURFACE_TREAT', 'ORDER_QTY']; // 수정
            const stockList = ['MATERIAL_KIND', 'ORDER_QTY']; // 재고
            const partList = ['PART_NUM', 'MATERIAL_KIND', 'SURFACE_TREAT', 'PART_UNIT_QTY']; // 파트

            switch (rowData.WORK_TYPE) {
                case 'WTP010':
                    // list = $.extend(true, commonRequiredList, singleList);
                    list = commonRequiredList.concat(singleList);
                    break;
                case 'WTP020':
                    list = commonRequiredList.concat(assemblyList);
                    break;
                case 'WTP030':
                    list = commonRequiredList.concat(modifiedList);
                    break;
                case 'WTP040':
                    list = commonRequiredList.concat(stockList);
                    break;
                case 'WTP050':
                    list = commonRequiredList.concat(partList);
                    break;
                default:
                    list = commonRequiredList.concat(['WORK_TYPE']);
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
            // 수행공장
            if (rowData.WORK_FACTORY !== undefined && rowData.WORK_FACTORY !== null && rowData.WORK_FACTORY !== '') {
                let index = workFactoryList.findIndex(function (element) {
                    return element.value === rowData.WORK_FACTORY;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_FACTORY');
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

            $('#controlManageFilterColumn').html(filterOpts);
            $('#controlManageFrozen').html(frozenOts);
        };
        /* function */

        /* event */
        $('#CONTROL_MANAGE_TOP_WRAP_BTN').on('click', function () {
            if ($(this).hasClass('on')) {
                topMenuClose();
                $(this).removeClass('on');
            } else {
                topMenuOpen();
                $(this).addClass('on');
            }
        });

        $('#CONTROL_MANAGE_SAVE').on('click', function () {
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
            // console.log('changes',changes)
            $.each(changes.oldList,function (idx,Item) {
                $.each(Item,function (idx2,Item2) {
                    if(typeof Item2 == 'undefined') {
                        changes.oldList[idx][idx2] = "";
                    }
                })
            });

            let parameters = {'url': '/validationCheckBeforeSaveFromControl', 'data': {data: JSON.stringify(changes)}};
            let flag = false;

            fnPostAjaxAsync(function (data) {
                flag = data.flag;

                if (flag) {
                    fnAlert(null, data.message);
                    return false;
                }
            }, parameters, '');

            if (!flag) {
                parameters = {'url': '/saveFromControlManage', 'data': {data: JSON.stringify(changes)}};

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

        $('#CONTROL_MANAGE_DELETE').on('click', function () {
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

                if (!(thisRowData.CONTROL_STATUS === undefined || thisRowData.CONTROL_STATUS === null || thisRowData.CONTROL_STATUS === 'ORD002')) {
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
                    let parameters = {'url': '/removeControl', 'data': {data: JSON.stringify(list)}};
                    fnPostAjax(function () {
                        fnAlert(null, "<spring:message code='com.alert.default.remove.success' />");
                        $orderManagementGrid.pqGrid('refreshDataAndView');
                    }, parameters, '');
                });
            }else if(tempList.length > 0) {
                $orderManagementGrid.pqGrid("deleteRow", {rowList: tempList});
            }

            // let estimateRegisterSubmitConfirm = function (callback) {
            //     commonConfirmPopup.show();
            //     $('#commonConfirmYesBtn').unbind().click(function (e) {
            //         e.stopPropagation();
            //         commonConfirmPopup.hide();
            //         callback(true);
            //         return;
            //     });
            //     $('.commonConfirmCloseBtn').unbind().click(function (e) {
            //         e.stopPropagation();
            //         commonConfirmPopup.hide();
            //     });
            // };
            // estimateRegisterSubmitConfirm(function (confirm) {
            //     if (confirm) {
            //         let parameters = {'url': '/removeControl', 'data': {data: JSON.stringify(list)}};
            //         fnPostAjax(function (data) {
            <%--            fnAlert(null, '<spring:message code='com.alert.default.remove.success' />');--%>
            //             $orderManagementGrid.pqGrid('refreshDataAndView');
            //         }, parameters, '');
            //     }
            // });
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


        $('#CONTROL_MONTH_CLOSE').on('click', function () {
            let compCdList = [];
            let list = [];
            let orderCompCdList = [];
            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let controlStatusFlag = false;

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
                if(rowData.CONTROL_STATUS == 'ORD001') {
                    controlStatusFlag = true;
                }else {
                    controlStatusFlag = false;
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
            if(!controlStatusFlag) {
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

        $('#CONTROL_MANAGE_SEARCH').on('click', function () {
            selectedOrderManagementRowIndex = [];
            $orderManagementGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM'));
            });
            $orderManagementGrid.pqGrid('refreshDataAndView');
        });

        /**
         * @description 확정버튼 클릭
         */
        $('#CONFIRMATION').on('click', function (event) {
            if (fnIsGridEditing($orderManagementGrid)) {
                return false;
            }

            let selectedRowCount = selectedOrderManagementRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // TODO: 필수데이터가 입력되어 있어야만 확정 가능
                if (fnIsEmpty(rowData.CONTROL_PART_QTY)) {
                    fnAlert(null, '주문수량을 확인해주시기 바랍니다');
                    return false;
                }

                if (fnIsEmpty(rowData.ORDER_DRAWING_NUM)) {
                    fnAlert(null, '발주 도면 번호를 등록 후 다시 시도해주세요');
                    return false;
                }

                if (fnIsEmpty(rowData.PDF_GFILE_SEQ)) {
                    fnAlert(null, 'PDF확장자 파일 도면을 등록 후 다시 시도해주세요');
                    return false;
                }

                if (rowData.SAME_SIDE_YN === 'Y' || !fnIsEmpty(rowData.DNJSCLD) || !fnIsEmpty(rowData.EOCLD)) {
                    if(Number(rowData.CONTROL_PART_QTY) !== (Number(rowData.DNJSCLD) + Number(rowData.EOCLD))) {
                        fnAlert(null, rowData.CONTROL_NUM + '<br>대칭 수량을 확인해주시기 바랍니다');
                        return false;
                    }
                    if (!(rowData.SAME_SIDE_YN === 'Y')) {
                        fnAlert(null, rowData.CONTROL_NUM + '<br>대칭을 확인해주시기 바랍니다');
                        return false;
                    }
                }
            }

            getOrderStatusButton(event);
        });

        /**
         * @description 보류버튼 클릭
         */
        $('#HOLD').on('click', function (event) {
            if (fnIsGridEditing($orderManagementGrid)) {
                return false;
            }

            getOrderStatusButton(event);
        });

        /**
         * @description 취소버튼 클릭
         */
        $('#CANCEL').on('click', function (event) {
            // let selectedRowCount = selectedOrderManagementRowIndex.length;

            //TODO: 외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능
            /* for (let i = 0; i < selectedRowCount; i++) {
                 let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                 if (rowData.OUTSIDE_YN === 'Y') {
                     fnAlert(null, '외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
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
            // column
            changeViewColumn(event.target.id);
            // 필터 컬럼 변경
            changeColumnFilter();
            // css 변경
            $(this).removeClass('virtual-disable').siblings('[name=CONTROL_MANAGE_VIEW]').addClass('virtual-disable');
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
            let nWidth = 1012;
            let nHeight = 800;
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
            let controlSeqList = [];
            let controlSeqStr = '';

            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                controlSeqList.push(rowData.CONTROL_SEQ);
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }
            $('#control_estimate_list_excel_download #paramData').val(controlSeqStr);
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

        // 바코드도면 출력
        $('#CONTROL_MANAGE_BARCODE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            const gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            const groupedControlSeq = fnGroupBy(gridData, 'CONTROL_SEQ');
            let controlSeqList = new Set(); // 선택 된 row 작업지시번호
            let controlDetailList = new Set();
            let multiOrderControlNumList = new Set();
            let selectControlList = '';
            let message = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                controlSeqList.add(rowData.CONTROL_SEQ);
            }

            // 작업지시번호
            for(let controlSeq of controlSeqList) {
                // 발주 개수 + 파트 개수
                for (let j = 0, GROUPED_CONTROL_SEQ_LENGTH =  groupedControlSeq[controlSeq].length; j < GROUPED_CONTROL_SEQ_LENGTH; j++) {
                    const rowData = groupedControlSeq[controlSeq][j];
                    const rowDataNext = groupedControlSeq[controlSeq][j + 1] ? groupedControlSeq[controlSeq][j + 1] : undefined;

                    if (rowData.CONTROL_STATUS !== 'ORD001') {
                        fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                        return false;
                    }
                    if (fnIsEmpty(rowData.ORDER_IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    } else {
                        let controlDetailSeq = rowData.CONTROL_DETAIL_SEQ;
                        let controlDetailSeqNext = rowDataNext ? rowDataNext.CONTROL_DETAIL_SEQ : undefined;

                        if (controlDetailSeq === controlDetailSeqNext) {
                            if (rowData.ORDER_DRAWING_NUM !== rowDataNext.ORDER_DRAWING_NUM) {
                                multiOrderControlNumList.add(rowData.CONTROL_NUM);
                            }
                        }
                        controlDetailList.add(controlDetailSeq);
                        selectControlList += String(rowData.CONTROL_SEQ) + String(controlDetailSeq) + '|';
                    }
                }
            }

            if (multiOrderControlNumList.size > 0) {
                // 중복제거
                message = '동일 작업지시번호에 도면번호가 다른 대상이 있습니다. 포함하여 출력할까요?<br>';
                message += '<span class="text-blue">대상작업지시번호</span><br>';
                for (let value of multiOrderControlNumList) {
                    message += '<span class="text-blue">' + value + '</span><br>';
                }

                // invoke the custom dialog
                alertify.barcodeDrawingConfirm(message).set({
                    'onok': function () {
                        printJS({printable: '/makeCadBarcodePrint', properties: {selectControl:selectControlList, flag:'Y'}, type: 'pdf', showModal: true});
                    },
                    'oncancel': function () {
                        printJS({printable: '/makeCadBarcodePrint', properties: {selectControl:selectControlList, flag:'N'}, type: 'pdf', showModal: true});
                    },
                    'oncontinue': function () {

                    },
                    'labels': {
                        'ok': '포함',
                        'cancel': '미포함'
                    }
                });
            } else {
                message =
                    '<h4>' +
                    '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '   <span>' + controlDetailList.size + ' 건의 바코드도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '</h4>';
                fnConfirm(null, message, function () {
                    printJS({printable: '/makeCadBarcodePrint', properties: {selectControl:selectControlList, flag:'N'}, type: 'pdf', showModal: true});
                });
            }
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
        $('#CONTROL_MANAGE_LABEL_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;

            let barcodeList = [];
            let selectedRowCount = selectedOrderManagementRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                if (!(rowData.CONTROL_STATUS === 'ORD001')) {
                    fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                    return false;
                }

                let postData = {
                    'queryId': 'inspection.selectOutgoingLabelType2',
                    'CONTROL_SEQ': rowData.CONTROL_SEQ,
                    'CONTROL_DETAIL_SEQ': rowData.CONTROL_DETAIL_SEQ,
                    'ORDER_SEQ': rowData.ORDER_SEQ
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
        $('#DRAWING_REGISTRATION').on('click', function () {
            drawingUploadPopupWindow('control', 'drawingUploadMapper.manageControlCadFiles', '');
        });
        /** 도면 차수 및 변경 처리 **/
        $('#DRAWING_CHANGE').on('click', function () {
            let controlSeqList = new Set(); // 선택 된 row 작업지시번호
            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }
            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                 const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                 if(rowData.ORDER_OUT_FINISH_DT === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD003')
                     controlSeqList.add(rowData.CONTROL_SEQ);
            }
            if (controlSeqList.size <= 0) {
                fnAlert(null, '확정, 마감 상태의 작업지시번호만 도면 변경이 가능합니다.');
                return false;
            }
            var paramDatas = {'controlList': Array.from(controlSeqList)};
            var parameters = {
                'url': '/controlCadRevPrev',
                'data': {"gridData": JSON.stringify(paramDatas)}
            };
            console.log(parameters);

            fnPostAjax(function (data) {
                console.log(data.workKey);
                drawingUploadPopupWindow('controlRev', 'drawingUploadMapper.manageControlCadRevFiles', data.workKey);
            }, parameters, '');
        });
        /** 도면 보기 팝업 호출 */
        $('#CONTROL_MANAGE_DRAWING_VIEW').on('click', function () {
            let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[0]});
            callWindowImageViewer(rowData.ORDER_IMG_GFILE_SEQ);
        });
        // 도면 출력
        $('#CONTROL_MANAGE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            const gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            const groupedControlSeq = fnGroupBy(gridData, 'CONTROL_SEQ');
            let controlSeqList = new Set(); // 선택 된 row 작업지시번호
            let drawingNumList = new Set();
            let selectControlList = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                controlSeqList.add(rowData.CONTROL_SEQ);
            }
            // 작업지시번호
            for(let controlSeq of controlSeqList) {
                // 발주 개수 + 파트 개수
                for (let j = 0, GROUPED_CONTROL_SEQ_LENGTH =  groupedControlSeq[controlSeq].length; j < GROUPED_CONTROL_SEQ_LENGTH; j++) {
                    const rowData = groupedControlSeq[controlSeq][j];
                    if (fnIsEmpty(rowData.ORDER_IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    } else {
                        selectControlList += String(rowData.CONTROL_SEQ) + String(rowData.CONTROL_DETAIL_SEQ) + '|';
                        drawingNumList.add(rowData.ORDER_DRAWING_NUM);
                    }
                }
            }

            const message =
                '<h4>' +
                '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '   <span>' + drawingNumList.size + ' 건의 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '</h4>';
            fnConfirm(null, message, function () {
                printJS({printable:'/makeCadPrint', properties: {selectControl:selectControlList}, type: 'pdf', showModal:true});
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
        const $controlManageStartDate = $('#CONTROL_MANAGE_START_DATE');
        const $controlManageEndDate = $('#CONTROL_MANAGE_END_DATE');
        $controlManageStartDate.datepicker({dateFormat: 'yy/mm/dd'});
        $controlManageEndDate.datepicker({dateFormat: 'yy/mm/dd'});
        $controlManageStartDate.datepicker('setDate', 'today');
        $controlManageEndDate.datepicker('setDate', 'today');
        // 발주사
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    comboData.push({title: obj.text, id: obj.value, value: obj.value});
                }

                $('#CONTROL_MANAGE_SEARCH_FORM #ORDER_COMP_CD').comboTree({
                    source : comboData,
                    isMultiple: true,
                    cascadeSelect: false
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

                $('#CONTROL_MANAGE_SEARCH_FORM #COMP_CD').comboTree({
                    source : comboData,
                    isMultiple: true,
                    cascadeSelect: false
                });
            }, parameters, '');
        })();
        // 소재형태
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1029}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#CONTROL_MANAGE_SEARCH_FORM #MATERIAL_KIND').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();
        // 작업형태
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1033}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#CONTROL_MANAGE_SEARCH_FORM #WORK_TYPE').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();

        $orderManagementGrid = $('#' + gridId).pqGrid(obj);
        /* init */

        let matchStockGrid = $("#match_stock_grid");
        let gridCellEditable = function(ui){
            let rowData = matchStockGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let OUT_STATUS = rowData["OUT_STATUS"];
            let RNUM = rowData["RNUM"];
            if(OUT_STATUS == 'OUT002') {
                return false;
            }else if(typeof RNUM != 'undefined' && RNUM != '' && RNUM != null) {
                return false;
            }else {
                return true;
            }
        }

        let matchStockColModel = [
            {title: 'RNUM', dataType: 'integer', dataIndx: 'RNUM', hidden: true},
            {title: 'RNUM_SUB', dataType: 'integer', dataIndx: 'RNUM_SUB', hidden: true},
            {title: 'CONTROL_NUM', dataType: 'string', dataIndx: 'CONTROL_NUM', hidden: true},
            {title: 'OUT_STATUS', dataType: 'string', dataIndx: 'OUT_STATUS', hidden: true},
            {title: 'MATERIAL_DETAIL', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {title: 'CONTROL_PART_INFO', dataType: 'string', dataIndx: 'CONTROL_PART_INFO', hidden: true},
            {title: 'ORDER_QTY', dataType: 'integer', dataIndx: 'ORDER_QTY', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, editable: false},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true, editable: false},
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true, editable: false},
            {title: 'INSIDE_OUT_SEQ', dataType: 'integer', dataIndx: 'INSIDE_OUT_SEQ', hidden: true, editable: false},
            {title: 'IMG_GFILE_SEQ', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {
                dataIndx: 'CHECK_BOX',
                dataType: 'bool',
                hidden: true,
                editable: true
            },
            {title:'No', width: 30, maxWidth: 30, dataIndx: "RNUM", cbId: 'CHECK_BOX', type: "checkbox",
                editable: function (ui) {return gridCellEditable(ui);},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return {text: rowData.RNUM, cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {cls: 'disabled', style: 'background-color: #d7d7d7;'};
                    }
                    return {cls :''};
                }
                ,postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;

                    if(typeof rowData.REQUEST_QTY == 'undefined' || rowData.REQUEST_QTY == null || rowData.REQUEST_QTY =='') {
                        $cell.find('input[type=checkbox]').prop('checked', false);
                        ui.rowData.CHECK_BOX = false;
                    }else if(typeof rowData.INSIDE_OUT_SEQ != 'undefined' && rowData.INSIDE_OUT_SEQ != null && rowData.INSIDE_OUT_SEQ != '') {
                        $cell.find('input[type=checkbox]').prop('checked', true);
                        ui.rowData.CHECK_BOX = true;
                    }else {
                        ui.rowData.CHECK_BOX = $cell.find('input[type=checkbox]').prop('checked');
                        ui.cellData = $cell.find('input[type=checkbox]').prop('checked');
                    }
                }
            },
            {title: '작업번호<br>재고번호', minWidth: 140, dataIndx: 'INSIDE_STOCK_NUM',
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return {text: rowData.CONTROL_PART_INFO, cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {style: 'background-color: #d7d7d7;'};
                    }
                }
            },
            {title: '소재', minWidth: 80, dataIndx: 'MATERIAL_DETAIL_NM',
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return { cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {style: 'background-color: #d7d7d7;'};
                    }
                }
            },
            {title: '규격', minWidth: 90, dataIndx: 'SIZE_TXT',
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return { cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {style: 'background-color: #d7d7d7;'};
                    }
                }
            },
            {title: '주문수량<br>불출요청', width: 50, dataType: 'integer', dataIndx: 'REQUEST_QTY',
                editable: function (ui) {return gridCellEditable(ui);},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let $row = grid.getRow(ui);
                    if(rowData.OUT_STATUS == 'OUT002') {
                        return {style: 'background-color: #d7d7d7;'};
                    }else if( typeof rowData.RNUM == 'undefined' || rowData.RNUM == "" || rowData.RNUM == null) {
                        if(ui.cellData != null && ui.cellData > 0) {
                            ui.rowData.CHECK_BOX = true;
                            $row.find('input[type=checkbox]').prop('checked', true);
                        }else {
                            ui.rowData.CHECK_BOX = false;
                            $row.find('input[type=checkbox]').prop('checked', false);
                        }
                        return {style : 'background-color: #fff599;'};
                    }else {
                        return { cls : 'matchGrid_lightRed'};
                    }
                }
            },
            {title: '불출수량', width: 50, dataType: 'string', dataIndx: 'OUT_QTY',
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return { cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {style: 'background-color: #d7d7d7;'};
                    }
                }
            },
            {title: '현재<br>재고', width: 50, dataType: 'integer', dataIndx: 'CURR_QTY',
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        return { cls : 'matchGrid_lightRed'};
                    }
                    if(rowData.OUT_STATUS == 'OUT002') {
                        // grid.addClass({ rowIndx: rowIndx, dataIndx: dataIndx, cls: 'disabled' });
                        return {style: 'background-color: #d7d7d7;'};
                    }
                }
            }
        ];

        let matchStockObj = {
            height: 550, width: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15,
            swipeModel: {on: false}, trackModel: {on: true},
            strNoRows: g_noData,
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            // scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: matchStockColModel,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM_SUB',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_match_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            toolbar: false,
            rowSelect: function (event, ui) {
                let dataArr = ['RNUM','INSIDE_STOCK_NUM','MATERIAL_DETAIL_NM','SIZE_TXT','REQUEST_QTY','OUT_QTY','CURR_QTY']
                if(ui.addList.length > 0) {
                    var rowData = ui.addList[0].rowData;

                    if(typeof rowData.RNUM != 'undefined' && rowData.RNUM != null && rowData.RNUM != '') {
                        $.each(dataArr,function (idx, Item) {
                            if(matchStockGrid.pqGrid('hasClass', {rowIndx: rowData.pq_ri, cls: 'matchGrid_lightRed'})) {
                                matchStockGrid.pqGrid('removeClass', {rowIndx: rowData.pq_ri, dataIndx: Item, cls: 'matchGrid_lightRed'} );
                            }
                            matchStockGrid.pqGrid('addClass', {rowIndx: rowData.pq_ri, dataIndx: Item, cls: 'matchGrid_selected'} );
                        })
                    }
                    if(typeof rowData.IMG_GFILE_SEQ != 'undefined' && rowData.IMG_GFILE_SEQ != ''){
                        $("#match_stock_img").attr("src", '/qimage/' + rowData.IMG_GFILE_SEQ);
                        $("#stock_match_pop_form").find("#GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
                    }else {
                        $("#match_stock_img").attr("src", '/resource/main/blank.jpg');
                        $("#stock_match_pop_form").find("#GFILE_SEQ").val("");
                    }
                }
                if(ui.deleteList.length > 0) {
                    var beforeRowData = ui.deleteList[0].rowData;
                    if(typeof beforeRowData.RNUM != 'undefined' && beforeRowData.RNUM != null && beforeRowData.RNUM != '') {
                        $.each(dataArr,function (idx, Item) {
                            matchStockGrid.pqGrid('removeClass', {rowIndx: beforeRowData.pq_ri, dataIndx: Item, cls: 'matchGrid_selected'} );
                            matchStockGrid.pqGrid('addClass', {rowIndx: beforeRowData.pq_ri, dataIndx: Item, cls: 'matchGrid_lightRed'} );
                        })
                    }
                }
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});
                let nextRowData = "";
                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx +1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx -1});
                }
                if(typeof nextRowData != 'undefined' && nextRowData != null && nextRowData != '') {
                    if(typeof nextRowData.IMG_GFILE_SEQ != 'undefined' && nextRowData.IMG_GFILE_SEQ != ''){
                        $("#match_stock_img").attr("src", '/qimage/' + nextRowData.IMG_GFILE_SEQ);
                        $("#stock_match_pop_form").find("#GFILE_SEQ").val(nextRowData.IMG_GFILE_SEQ);
                    }else {
                        $("#match_stock_img").attr("src", '/resource/main/blank.jpg');
                        $("#stock_match_pop_form").find("#GFILE_SEQ").val("");
                    }
                }
            },
        };
        matchStockGrid.pqGrid(matchStockObj);

        $('#matchStockDetailBtn').on('click', function (e) {
            let gFileSeq = $("#stock_match_pop_form").find("#GFILE_SEQ").val();
            if(gFileSeq != '') {
                callWindowImageViewer(gFileSeq);
            }
        })
        $('#matchStockBtnSave').on('click', function (e) {
            let gridInstance = matchStockGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let duplChk = {};
            var flag = false;
            var dupFlag = false;
            $.each(changes.updateList, function (idx,Item) {
                var id = Item.CONTROL_SEQ + '_' + Item.CONTROL_DETAIL_SEQ;
                if(Item.CHECK_BOX) {
                    // if(Item.REQUEST_QTY == null || Item.REQUEST_QTY == '' || typeof Item.REQUEST_QTY == 'undefined' || Item.REQUEST_QTY <= 0) {
                    //     flag = true;
                    //     return;
                    // }

                    if(typeof duplChk[id] == 'undefined' || duplChk[id] == null) {
                        duplChk[id] = [idx];
                    }else {
                        duplChk[id].push(idx);
                        dupFlag = true;
                        return;
                    }
                }
            })

            if(dupFlag) {
                fnAlert(null,'불출 요청은 파트단위당 1개의 재고번호만 가능합니다.');
                return;
            }
            let parameters = {'url': '/matchStockSave', 'data': {data: JSON.stringify(changes)}};

            fnPostAjaxAsync(function (data) {
                if (data.flag) {
                    fnAlert(null, data.message);
                    return false;
                }
                $("#stock_match_pop_form").find("#SAVE_YN").val("Y");
                fnAlert(null, '<spring:message code="com.alert.default.save.success"/>',function (){
                    $("#stockMatchPopup").modal('hide')
                });
            }, parameters, '');
        })

        $('#stock_match_pop_refresh').on('click', function (e) {
            matchStockGrid.pqGrid('option', 'dataModel.postData', function () {
                return { 'queryId': 'orderMapper.selectMatchStockList', 'CONTROL_SEQ': $("#stock_match_pop_form").find("#CONTROL_SEQ").val()};
            });
            matchStockGrid.pqGrid('refreshDataAndView');
        })

        $('#MATCH_STOCK').on('click', function (e) {
            if (selectedOrderManagementRowIndex.length <= 0) {
                fnAlert(null, '하나 이상의 작업을 선택해주세요');
                return false;
            }else {
                let rowCnt = "";
                let CONTROL_SEQ = "";
                let controlSeqList = [];
                for (let i = 0; i < selectedOrderManagementRowIndex.length; i++) {
                    let rowData = $orderManagementGrid.pqGrid("getRowData", {rowIndx: selectedOrderManagementRowIndex[i]});
                    controlSeqList.push(rowData.CONTROL_SEQ)
                }
                controlSeqList = [...new Set(controlSeqList)];

                for (let i = 0; i < controlSeqList.length; i++) {
                    CONTROL_SEQ += controlSeqList[i] + ",";
                }
                CONTROL_SEQ = CONTROL_SEQ.substr(0, CONTROL_SEQ.length - 1);

                $("#stock_match_pop_form").find("#CONTROL_SEQ").val(CONTROL_SEQ);

                $("#stockMatchPopup").modal('show');
                $("#STOCK_MATCH_BARCODE_NUM").focus();
            }
        });
        $('#stockBtnClose4').on('click', function (e) {
            $("#stockMatchPopup").modal('hide');
        })

        $("#stockMatchPopup").on({
            'show.bs.modal': function () {
                matchStockGrid.pqGrid(matchStockObj);
                $("#stock_match_pop_form").find("#SAVE_YN").val("N");

                matchStockGrid.pqGrid('option', 'dataModel.postData', function () {
                    return { 'queryId': 'orderMapper.selectMatchStockList', 'CONTROL_SEQ': $("#stock_match_pop_form").find("#CONTROL_SEQ").val()};
                });
                matchStockGrid.pqGrid('refreshDataAndView');
                setTimeout(function (){
                    matchStockGrid.pqGrid('setSelection', {rowIndx: 0});
                },300);
            },'hide.bs.modal': function () {
                if ($('#match_stock_grid').pqGrid('instance')) {
                    matchStockGrid.pqGrid('destroy');
                }
                if($("#stock_match_pop_form").find("#SAVE_YN").val() == "Y"){
                    $("#CONTROL_MANAGE_SEARCH").trigger('click');
                }
            }
        });
        $("#STOCK_MATCH_BARCODE_NUM").on({
            focus: function () {
                $("#stock_match_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#stock_match_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            },
            keydown: function (e) {
                if (e.keyCode == 13) {
                    e.preventDefault();
                    let BARCODE_NUM = fnBarcodeKo2En(this.value);
                    let parameters = {
                        'url': '/json-info',
                        'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"common.selectControlBarcodeInfo"}
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        if(data.info != null) {
                            let parameters2 = {
                                'url': '/json-list',
                                'data': {"CONTROL_SEQ":data.info.CONTROL_SEQ,"queryId":"orderMapper.selectMatchStockList"}
                            };
                            fnPostAjax(function (data2, callFunctionParam) {
                                var lastIdx = matchStockGrid.pqGrid('option', 'dataModel.data').length - 1;
                                let rNumData = matchStockGrid.pqGrid('getData', {dataIndx: ['RNUM']});
                                let rNumSubData = matchStockGrid.pqGrid('getData', {dataIndx: ['RNUM_SUB']});
                                let matRSub = parseInt(rNumSubData[rNumSubData.length-1].RNUM_SUB) + 1

                                var addRowCounter = matchStockGrid.pqGrid('option', 'dataModel.data').length + 1;
                                if(data2.list.length > 0) {
                                    $.each(data2.list, function(idx,Item) {
                                        if(Item.SORT == 1) {
                                            Item.RNUM = parseInt(rNumData[rNumData.length-1].RNUM) + 1
                                        }
                                        Item.RNUM_SUB = matRSub
                                        matRSub = matRSub + 1

                                        matchStockGrid.pqGrid('addRow', {
                                            newRow: Item,
                                            rowIndx: addRowCounter,
                                            checkEditable: false
                                        })
                                        addRowCounter++;
                                    })

                                    matchStockGrid.pqGrid('refreshView');
                                }
                            }, parameters2, '');
                        }else {
                            fnAlert(null, "해당 바코드가 존재하지 않습니다.");
                        }
                        $("#STOCK_MATCH_BARCODE_NUM").val('');
                    }, parameters, '');
                }
            }
        });

        $('#ESTIMATE_REGISTER_FROM_CONTROL').on('click', function (event) {
            if (noSelectedRowAlert()) {
                return false;
            }

            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let orderStaffSeqList = [];
            let controlSeqStr = '';

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                orderStaffSeqList.push(rowData.ORDER_STAFF_SEQ);
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];
            orderStaffSeqList = [...new Set(orderStaffSeqList)];

            if (controlSeqList.length === 0) {
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

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#estimate_version_up_sequence_form > #hidden_control_seq').val(controlSeqStr);

            $("a[pid='" + $("#estimateNo").val() + "']").trigger('click');
            setTimeout(function () {
                $('#updateFromControl').trigger('click');
            }, 1000);
            event.preventDefault();
        });

        $('#controlManageFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($orderManagementGrid, 'controlManageFilterKeyword', 'controlManageFilterCondition', 'controlManageFilterColumn');
                autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);

                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#CONTROL_MANAGE_RECORDS').html(data.length);
            },
            'search': function () {
                fnFilterHandler($orderManagementGrid, 'controlManageFilterKeyword', 'controlManageFilterCondition', 'controlManageFilterColumn');
                autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);

                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $('#CONTROL_MANAGE_RECORDS').html(data.length);
            }
        });

        $('#controlManageFrozen').on('change', function(){
            fnFrozenHandler($orderManagementGrid, $(this).val());
        });

        $('#CONTROL_MANAGE_START_DATE_BUTTON').on('click', function () {
            $('#CONTROL_MANAGE_START_DATE').focus();
        });
        $('#CONTROL_MANAGE_END_DATE_BUTTON').on('click', function () {
            $('#CONTROL_MANAGE_END_DATE').focus();
        });

        $('#CONTROL_SEARCH_CONDITION').on('change', function () {
            const $controlManageDates = $('[id^=CONTROL_MANAGE][id$=DATE]');

            $(this).val() === '' ? $controlManageDates.prop('disabled', true) : $controlManageDates.prop('disabled', false);
        });

        $('#ATTACHMENT_BUTTON').on('click', function () {
            let $attachmentButton = $('#ATTACHMENT_BUTTON');
            let GfileKey = $('#common_file_download_form').find('#GFILE_SEQ').val();
            let rowIndx = $attachmentButton.data('rowIndx');

            if (GfileKey !== '' && GfileKey !== $attachmentButton.data('GfileKey')) {
                $orderManagementGrid.pqGrid('updateRow', {rowIndx: rowIndx, row: {'ETC_GFILE_SEQ': GfileKey}, checkEditable: false});
                $('#CONTROL_MANAGE_SAVE').click();
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
                        $('#CONTROL_MANAGE_SEARCH').click();
                    }
                }, parameter, '');
            } else {
                fnAlert(null, '<spring:message code="com.alert.default.need.checkedText"/>');
            }
        });

        $('#CONTROL_MANAGE_SEARCH_FORM').find('#AMOUNT_SUMMARY').on('click', function(){
            amountSummaryHtml();
        });

        function amountSummaryHtml() {
            const $controlManageSearchForm = $('#CONTROL_MANAGE_SEARCH_FORM');
            $controlManageSearchForm.find('#amount_summary_html').html("공급 금액 합계 : 0");
            $controlManageSearchForm.find('#control_manage_amount_summary_area').removeClass("amount_summary_active");
            $controlManageSearchForm.find('#control_manage_amount_summary_area').addClass("amount_summary_inactive");
            let amountSummaryChk = $controlManageSearchForm.find('#AMOUNT_SUMMARY').is(":checked");
            if (amountSummaryChk) {
                let totalAmount = 0;

                for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                    if (rowData.FINAL_TOTAL_AMT) {
                        totalAmount += parseFloat(rowData.FINAL_TOTAL_AMT);
                    }
                }
                let totalAmountCurrency = pq.formatNumber(totalAmount, "#,###,###");
                $controlManageSearchForm.find('#control_manage_amount_summary_area').addClass("amount_summary_active");
                $controlManageSearchForm.find('#amount_summary_html').html("공급 금액 합계 : " + totalAmountCurrency);
            }
        }

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#CONTROL_MANAGE_SEARCH_FORM').find('#SIZE_TYPE').on('change', function () {
            const $controlManageSearchForm = $('#CONTROL_MANAGE_SEARCH_FORM');
            $controlManageSearchForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];
            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($controlManageSearchForm,resetArr)
                    $controlManageSearchForm.find('#SIZE_W').show();
                    $controlManageSearchForm.find('#SIZE_H').show();
                    $controlManageSearchForm.find('#SIZE_T').show();
                    $controlManageSearchForm.find('#SIZE_D').hide();
                    $controlManageSearchForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($controlManageSearchForm,resetArr)
                    $controlManageSearchForm.find('#SIZE_W').hide();
                    $controlManageSearchForm.find('#SIZE_H').hide();
                    $controlManageSearchForm.find('#SIZE_T').hide();
                    $controlManageSearchForm.find('#SIZE_D').show();
                    $controlManageSearchForm.find('#SIZE_L').show();
                    break;
                default: // 전체
                    $controlManageSearchForm.find('#SIZE_W').show();
                    $controlManageSearchForm.find('#SIZE_H').show();
                    $controlManageSearchForm.find('#SIZE_T').show();
                    $controlManageSearchForm.find('#SIZE_D').hide();
                    $controlManageSearchForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($controlManageSearchForm,resetArr)

                    $controlManageSearchForm.find('.for_diabled').attr('disabled',true);
            }
        });

    });
</script>
