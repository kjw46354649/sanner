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
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <input type="text" class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="발주사" readonly>
                            <input type="hidden" name="SEL_INSPECT_GRADE" id="SEL_INSPECT_GRADE">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="text" class="label_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
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
                            <input type="text" class="label_200"name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="RBRUR">규격</label>
                            <select class="label_200" name="RBRUR" id="RBRUR" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                            <input type="text" class="wd_200" name="MATERIAL_KIND" id="MATERIAL_KIND" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="소재형태" readonly>
                        </span>
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
                        <div class="d-inline-block" style="width:542px">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE" readonly disabled><button type="button" id="CONTROL_MANAGE_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_END_DATE" id="CONTROL_MANAGE_END_DATE" readonly disabled><button type="button" id="CONTROL_MANAGE_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="UNIT_PRICE_CONFIRM">단가확인</label>
                            <select class="label_200" name="UNIT_PRICE_CONFIRM" id="UNIT_PRICE_CONFIRM" title="단가확인">
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
                        <span id="amount_summary_area" class="slt_wrap controlAmountSummaryUnActive" style="margin-left:150px; padding-left: 10px;">
                            <span class="chk_box"><input name="AMOUNT_SUMMARY" id="AMOUNT_SUMMARY" type="checkbox"><label for="AMOUNT_SUMMARY" id="amount_summary_html"> 공급 금액 합계 : 0</label></span>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn" id="CONTROL_MANAGE_TOPWRAP_BTN">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="hWrap mb-10">
            <div>
                <button type="button" class="defaultBtn btn-100w" id="NEW_ORDER_REGISTRATION">신규 주문 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_REGISTRATION">도면 등록</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_REGISTER_FROM_CONTROL">견적등록</button>
                <button type="button" class="defaultBtn btn-100w" id="ESTIMATE_LIST_PRINT">견적List출력</button>
                <button type="button" class="defaultBtn btn-100w" id="TRANSACTION_STATEMENT">거래명세표</button>
                <%--                <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#TRANSACTION_STATEMENT_POPUP">거래명세표</button>--%>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CONFIRMATION" data-control_status="ORD001" style="color: blue;">확정</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="CANCEL" data-control_status="ORD002" style="color: red;">취소</button>
                <button type="button" class="defaultBtn btn-50w" name="CHANGE_STATUS" id="TERMINATION" data-control_status="ORD004">종료</button>
                <button type="button" class="defaultBtn btn-50w" id="CONTROL_MONTH_CLOSE">마감</button>
                <%--                <button type="button" class="defaultBtn btn-50w" data-toggle="modal" data-target="#CONTROL_CLOSE_POPUP">마감</button>--%>
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
                    <label for="controlManageFilterKeyword"></label><input type="text" id="controlManageFilterKeyword" placeholder="Enter your keyword">
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
                <button type=" button" class="virtual-disable" name="CONTROL_MANAGE_VIEW" id="CONTROL_MANAGE_ALL_MODE">전체모드</button>
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

<form id="control_estimate_list_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="excel.selectControlEstimateDetailListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data"/>
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ"/>
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
                    {title: '상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM'},
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
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1017')}
            },
            {
                title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM_NM', hidden: true,
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '사업자<br>구분', width:75, dataIndx: 'COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: FAMILY_COMPANY}
            },
            {title: '사업자<br>구분', dataIndx: 'COMP_CD_NM', hidden: true},
            {
                title: '발주업체', width:75, dataIndx: 'ORDER_COMP_CD',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY}
            },
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD_NM', hidden: true},
            {
                title: '비고', width:75, dataIndx: 'CONTROL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
            {title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION_NM', hidden: true},
            {
                title: '긴<br>급', minWidth: 15, width: 20, dataIndx: 'EMERGENCY_YN',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
                title: '총장', minWidth: 30, width: 30, dataType: 'integer', dataIndx: 'TOTAL_SHEET',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON', styleHead: {'background':'#a9d3f5'},
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind('click', function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {
                title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'red'},
                style: {'font-weight': 'bold', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            {
                title: '파<br>트', minWidth: 25, dataIndx: 'PART_NUM', styleHead: {'background':'#a9d3f5'},
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
                        newRowData.CONTROL_DETAIL_SEQ = null;
                        newRowData.CONTROL_PART_QTY = null;
                        newRowData.OUT_QTY = null;
                        newRowData.ORDER_OUT_FINISH_DT = null;
                        newRowData.OUTSIDE_COMP_CD = null;
                        newRowData.OUTSIDE_COMP_NM = null;
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
                        newRowData.OUTSIDE_IN_DT = null;
                        newRowData.OUTSIDE_STATUS = null;
                        newRowData.OUTSIDE_STATUS_DT = null;
                        $orderManagementGrid.pqGrid('addRow', {
                            newRow: newRowData,
                            rowIndx: lastRowIndex + 1,
                            checkEditable: false
                        });
                        $orderManagementGrid.pqGrid('setSelection', {rowIndx: lastRowIndex + 1});
                        event.preventDefault();
                    });
                }
            },
            {title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON', styleHead: {'background':'#a9d3f5'},
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
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
                                text = '<span class="ui-icon ui-icon-circle-plus" name="ORDER_NUM_PLUS_BUTTON" style="cursor: pointer"></span>';
                            }
                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: text};
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);

                            $cell.find('[name=ORDER_NUM_PLUS_BUTTON]').on('click', function (event) {
                                let newRowData = fnCloneObj(ui.rowData);
                                let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                                let totalRecords = data.length;
                                newRowData.ROW_NUM = totalRecords + 1;
                                newRowData.ORDER_SEQ = null;
                                newRowData.ORDER_NUM = null;
                                newRowData.ORDER_QTY = null;
                                newRowData.ORDER_DUE_DT = null;
                                newRowData.OUT_QTY = null;
                                newRowData.ORDER_OUT_FINISH_DT = null;
                                newRowData.DELIVERY_DT = null;

                                $orderManagementGrid.pqGrid('addRow', {
                                    newRow: newRowData,
                                    rowIndx: ui.rowIndx + 1,
                                    checkEditable: false
                                });
                                $orderManagementGrid.pqGrid('setSelection', {rowIndx: ui.rowIndx + 1});
                                event.preventDefault();
                            });
                        }
                    },
                    {
                        title: '발주번호', width: 90, dataIndx: 'ORDER_NUM',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
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
                        title: '수량', dataIndx: 'ORDER_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050');
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
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

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
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

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
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
                        title: '납품확인', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'DELIVERY_DT',
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
                ]
            },
            {
                title: '견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
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
                title: '공급단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
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
                title: '합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMT',
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
                title: '종전가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'PREVIOUS_PRICE',
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
                title: 'Part<br>Unit', dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                        }
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                        }
                    }
                ]
            },
            {title: '주문<br>수량', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002';
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')}
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', hidden: true},

            {
                title: '가공납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD002');
                },
                editor: {type: 'textbox', init: fnDateEditor},
            },
            {
                title: '외<br>주', minWidth: 15, width: 20, dataIndx: 'OUTSIDE_YN',
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
                /*render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === undefined || cellData === '') {
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
                }*/
            },
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM', hidden: true},
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
            {title: '진행상태', dataIndx: 'PART_STATUS', hidden: true},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM'},
            {
                title: '가공<br>완료', width: 70, dataIndx: 'INNER_WORK_FINISH_DT',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData) {
                        return cellData.substring(0, 5);
                    }
                }
            },
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
                }
            },
            /*{
                title: '예상소재 Size ( mm / Kg / cm3)', align: 'center', hidden: true, colModel: [
                    {
                        title: '@', dataIndx: 'RKFH',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '가로', dataIndx: 'SIZE_W_M',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {title: '세로', dataIndx: 'SIZE_H_M',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {title: '높이', dataIndx: 'SIZE_T_M',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }},
                    {
                        title: '중량', dataIndx: 'SIZE_D_M',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '부피', dataIndx: 'SIZE_L_M',
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null, text = cellData;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },*/


            /*{
                title: '견적<br>합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'EST_TOTAL_AMOUNT', hidden: true,
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
                title: '프로젝트', width: 200, align: 'left', dataIndx: 'PROJECT_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '모듈', width: 70, align: 'left', dataIndx: 'MODULE_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '납품처', dataIndx: 'DELIVERY_COMP_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '비고(라벨)', width: 100, align: 'left', dataIndx: 'LABEL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '품명', width: 150, align: 'left', dataIndx: 'ITEM_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
            {title: '구매담당', dataIndx: 'ORDER_STAFF_NM', hidden: true},
            {
                title: '설계자', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002';
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
                title: '변경전<br>도면번호', width: 120, dataIndx: 'PREV_DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
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
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027')},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
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
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                },
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030')},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {
                title: '소재비고', dataIndx: 'MATERIAL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && rowData.WORK_TYPE !== 'WTP020'
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: controlManageFilterRender(ui)};
                }
            },
            {title: '계산<br>견적단가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'CALC_EST_UNIT_COST',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = null, text = cellData;

                    if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: text};
                }
            },
            {
                title: '소재마감', align: 'center', hidden: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                colModel: [
                    {
                        title: 'TM각비', width: 70, dataIndx: 'MATERIAL_FINISH_TM', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        editor: {
                            type: 'select',
                            valueIndx: 'value',
                            labelIndx: 'text',
                            options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010')
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '연마비', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND', hidden: true,
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020')},
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },

                ]
            },
            {
                title: '항목별 계산견적 단가 (10원단위 반올림)',
                align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                hidden: true,
                colModel: [
                    {
                        title: '소재비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: 'TM각비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_TM_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '연마비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_GRIND_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '열처리', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_HEAT_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '표면처리', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SURFACE_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '가공비', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_PROCESS_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '기타추가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_ETC_AMT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    },
                    {
                        title: '견적비고', dataIndx: 'UNIT_AMT_NOTE',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls, text: controlManageFilterRender(ui)};
                        }
                    }
                ]
            },
            {
                title: '가공요건', width: 60, dataIndx: 'DETAIL_MACHINE_REQUIREMENT', hidden: true,
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (rowData.CONTROL_STATUS === undefined || rowData.CONTROL_STATUS === 'ORD001' || rowData.CONTROL_STATUS === 'ORD002') && !(rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    //TODO: button

                    if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls, text: ''};
                }
            },
            {title: '현재 위치', dataIndx: 'POP_POSITION', hidden: true},
            {title: '현재 위치', dataIndx: 'POP_POSITION_NM'},
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
            {title: '바코드도면<br>출력일시', width: 120, dataType: 'date', /*format: 'mm/dd',*/ dataIndx: '', hidden: true},
            {title: '라벨<br>출력일시', width: 120, dataType: 'date', /*format: 'mm/dd',*/ dataIndx: '', hidden: true},
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
                        $('#ATTACHMENT_BUTTON').data('rowIndx', ui.rowIndx);
                        $('#ATTACHMENT_BUTTON').data('GfileKey', GfileKey);
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
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq.', minWidth: 30, width: 35, dataType: 'integer', dataIndx: 'INSPECT_NUM'},
                    {title: '등급', minWidth: 30, width: 35, dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '불량/반품', minWidth: 30, width: 70, dataIndx: 'INSPECT_TYPE_NM', hidden: true},
                    {title: '불량코드', minWidth: 30, width: 70, dataIndx: 'INSPECT_RESULT_NM', hidden: true},
                    {title: '비고', minWidth: 20, width: 55, dataIndx: 'INSPECT_DESC', hidden: true},
                    {title: '조치', minWidth: 30, width: 70, dataIndx: 'ERROR_ACTION_NM', hidden: true},
                    {title: '조치방안', minWidth: 30, width: 70, dataIndx: 'ERROR_NOTE', hidden: true}
                ]
            },
            {
                title: '외주현황', align: 'center', colModel: [
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '자재사급', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                    {title: '외주단가', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_FINAL_AMT', hidden: true},
                    {title: '요망납기', dataType: 'date', format: 'mm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT', hidden: true},
                    {title: '입고날짜', dataIndx: 'OUTSIDE_IN_DT'},
                    {title: '비고', dataIndx: 'OUTSIDE_NOTE', hidden: true},
                    {title: '불량코드', dataIndx: 'OUTSIDE_INSPECT_RESULT_NM', hidden: true},
                    {title: '조치방안', dataIndx: 'OUTSIDE_ERROR_NOTE', hidden: true}
                ]
            },
            {title: '등록/업데이트<br>일시', width: 120, dataIndx: 'CONTROL_PART_INSERT_UPDATE_DT'},
            {title: 'CONTROL_BARCODE_NUM', dataIndx: 'CONTROL_BARCODE_NUM', hidden: true},
            {title: 'LABEL_BARCODE_NUM', dataIndx: 'LABEL_BARCODE_NUM', hidden: true},
            {title: 'DEL_YN', dataIndx: 'DEL_YN', hidden: true}
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
                if(ui.rowData.IMG_GFILE_SEQ && typeof(windowImageViewer) != 'undefined' && !windowImageViewer.closed) callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            selectChange: function (event, ui) {
                supplyUnitCostInit(); // 공급단가적용 초기화

                selectedOrderManagementRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedOrderManagementRowIndex.push(i);
                }
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
                $('#controlManageFilterColumn').empty();
                $('#controlManageFilterColumn').html(filterOpts);
                $('#controlManageFrozen').empty();
                $('#controlManageFrozen').html(frozenOts);
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

                if (ui.source === 'edit' || ui.source === 'clear') {
                    let rowIndx = ui.updateList[0].rowIndx;
                    let data = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;
                    let row;

                    // 항목별 계산견적 단가
                    const estimateArray = ['UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'ORDER_QTY', 'UNIT_FINAL_AMT'];
                    let estimateFlag = false;
                    for (let value of estimateArray) {
                        if (newRow.hasOwnProperty(value)) {
                            estimateFlag = true;
                            break;
                        }
                    }

                    if (estimateFlag) {
                        let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == null || data.UNIT_MATERIAL_AMT === '' ? 0 : Number(data.UNIT_MATERIAL_AMT); // 소재비
                        let UNIT_TM_AMT = data.UNIT_TM_AMT == null || data.UNIT_TM_AMT === '' ? 0 : Number(data.UNIT_TM_AMT); //TM각비
                        let UNIT_GRIND_AMT = data.UNIT_GRIND_AMT == null || data.UNIT_GRIND_AMT === '' ? 0 : Number(data.UNIT_GRIND_AMT); // 연마비
                        let UNIT_HEAT_AMT = data.UNIT_HEAT_AMT == null || data.UNIT_HEAT_AMT === '' ? 0 : Number(data.UNIT_HEAT_AMT); // 열처리
                        let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == null || data.UNIT_SURFACE_AMT === '' ? 0 : Number(data.UNIT_SURFACE_AMT); // 표면처리
                        let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == null || data.UNIT_PROCESS_AMT === '' ? 0 : Number(data.UNIT_PROCESS_AMT); // 가공비
                        let UNIT_ETC_AMT = data.UNIT_ETC_AMT == null || data.UNIT_ETC_AMT === '' ? 0 : Number(data.UNIT_ETC_AMT); // 기타추가
                        let CONTROL_PART_QTY = data.CONTROL_PART_QTY == null || data.CONTROL_PART_QTY === '' ? 0 : Number(data.CONTROL_PART_QTY); //발주 수량
                        let calculateEstimateAmount = 0; // 견적금액(계산 견적단가)
                        calculateEstimateAmount += UNIT_MATERIAL_AMT;
                        calculateEstimateAmount += UNIT_TM_AMT;
                        calculateEstimateAmount += UNIT_GRIND_AMT;
                        calculateEstimateAmount += UNIT_HEAT_AMT;
                        calculateEstimateAmount += UNIT_SURFACE_AMT;
                        calculateEstimateAmount += UNIT_PROCESS_AMT;
                        calculateEstimateAmount += UNIT_ETC_AMT;

                        // let unitFinalEstimateAmount = ui.updateList[0].newRow.UNIT_FINAL_EST_AMT || calculateEstimateAmount; // 최종 견적단가
                        // let estimatedTotalAmount = unitFinalEstimateAmount * CONTROL_PART_QTY; // 견적 합계 금액
                        let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || 0; // 최종 공급단가
                        // let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || unitFinalEstimateAmount; // 최종 공급단가
                        let finalAmount = unitFinalAmount * CONTROL_PART_QTY;// 합계 금액

                        if (ui.updateList[0].newRow.UNIT_FINAL_AMT) {
                            row = {
                                // 'CALC_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
                                // 'UNIT_FINAL_EST_AMT': unitFinalEstimateAmount, // 최종 견적단가
                                // 'EST_TOTAL_AMOUNT': estimatedTotalAmount, // 견적 합계금액 = 최종 견적단가 * 발주수량
                                'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                'FINAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                            };
                        } else {
                            // 파트
                            if (data.WORK_TYPE === 'WTP050') {
                                row = {
                                    'CALC_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
                                    // 'UNIT_FINAL_EST_AMT': unitFinalEstimateAmount, // 최종 견적단가
                                    // 'EST_TOTAL_AMOUNT': estimatedTotalAmount, // 견적 합계금액 = 최종 견적단가 * 발주수량
                                    // 'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                    // 'FINAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                                };
                            } else {
                                row = {
                                    'CALC_EST_UNIT_COST': calculateEstimateAmount, // 계산 견적단가
                                    // 'UNIT_FINAL_EST_AMT': unitFinalEstimateAmount, // 최종 견적단가
                                    // 'EST_TOTAL_AMOUNT': estimatedTotalAmount, // 견적 합계금액 = 최종 견적단가 * 발주수량
                                    'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                    'FINAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
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
                        if (dt == "integer" || dt == "float") {
                            row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                        }
                    }
                }
            }
        };
        let newOrderRegistrationPopup;
        let controlMonthClosePopup;
        let transactionStatementPopup;
        /* variable */

        /* function */
        const changeViewColumn = function (elementId) {
            let $orderManagementGridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let Cols = $orderManagementGridInstance.Columns();
            let array = [];
            const inputModeArray = [
                'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN',
                'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM', 'DRAWING_NUM_BUTTON', 'DRAWING_NUM',
                'ORDER_NUM_PLUS_BUTTON', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'PART_UNIT_QTY',
                'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ITEM_NM', 'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'SIZE_TXT', 'WORK_TYPE', 'INNER_DUE_DT', 'OUTSIDE_YN',
                'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE',
                'MATERIAL_FINISH_TM', 'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT', 'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT',
                'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE',
                'UNIT_FINAL_EST_AMT', 'EST_TOTAL_AMOUNT', 'UNIT_FINAL_AMT', 'PROJECT_NM', 'MODULE_NM', 'DELIVERY_COMP_NM',
                'LABEL_NOTE', 'PREV_DRAWING_NUM'
            ];
            const normalModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD',
                'CONTROL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN', 'TOTAL_SHEET', 'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM',
                'DRAWING_NUM_BUTTON', 'DRAWING_NUM', 'ORDER_NUM_PLUS_BUTTON', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT',
                'OUT_QTY', 'ORDER_OUT_FINISH_DT', 'INVOICE_NUM', 'PART_UNIT_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY',
                'CONTROL_PART_QTY', 'WORK_TYPE', 'INNER_DUE_DT', 'OUTSIDE_YN', 'WORK_FACTORY', 'MATERIAL_SUPPLY_YN',
                'PART_STATUS_NM', 'SIZE_TXT', 'INNER_WORK_FINISH_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_AMT',
                'PREVIOUS_PRICE', 'PROJECT_NM', 'MODULE_NM', 'DELIVERY_COMP_NM', 'LABEL_NOTE', 'ITEM_NM', 'ORDER_STAFF_SEQ',
                'DESIGNER_NM', 'PREV_DRAWING_NUM', 'MATERIAL_DETAIL', 'MATERIAL_TYPE_NM', 'MATERIAL_KIND', 'SURFACE_TREAT',
                'MATERIAL_FINISH_HEAT', 'MATERIAL_NOTE', 'CALC_EST_UNIT_COST', 'POP_POSITION_NM', 'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ', 'DRAWING_VER',
                'DRAWING_UP_DT', 'INSPECT_NUM', 'INSPECT_GRADE_NM', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN',
                'OUTSIDE_UNIT_AMT', 'OUTSIDE_IN_DT', 'DELIVERY_DT', 'IMG_GFILE_SEQ', 'CONTROL_PART_INSERT_UPDATE_DT'
            ];
            const closeModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NOTE', 'INVOICE_NUM',
                'MAIN_INSPECTION',
                'EMERGENCY_YN', 'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM', 'DRAWING_NUM_BUTTON', 'DRAWING_NUM',
                'ITEM_NM', 'SIZE_TXT', 'WORK_TYPE', 'OUTSIDE_YN',
                'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT', 'INNER_WORK_FINISH_DT', 'MATERIAL_DETAIL', 'MATERIAL_TYPE_NM', 'MATERIAL_KIND',
                'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY', 'CONTROL_PART_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY',
                'ORDER_NUM_PLUS_BUTTON', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'OUT_QTY', 'ORDER_OUT_FINISH_DT',
                'DELIVERY_DT', 'DETAIL_MACHINE_REQUIREMENT', 'MATERIAL_FINISH_TM', 'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT',
                'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT',
                'UNIT_ETC_AMT', 'UNIT_AMT_NOTE',
                'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_AMT', 'PREVIOUS_PRICE', 'PROJECT_NM', 'ITEM_NM', 'ORDER_STAFF_SEQ',
                'ORDER_STAFF_NM', 'PREV_DRAWING_NUM', 'PART_STATUS_NM',
                'IMG_GFILE_SEQ', 'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN'
            ];
            const allModeArray = [
                'CONTROL_STATUS_NM', 'CONTROL_VER', 'CONTROL_STATUS_DT', 'PRICE_CONFIRM', 'COMP_CD', 'ORDER_COMP_CD', 'ORDER_STAFF_SEQ',
                'DESIGNER_NM', 'CONTROL_NOTE', 'INVOICE_NUM', 'PROJECT_NM', 'MODULE_NM', 'DELIVERY_COMP_NM', 'LABEL_NOTE',
                'MAIN_INSPECTION', 'EMERGENCY_YN', 'TOTAL_SHEET', 'CONTROL_NUM_BUTTON', 'CONTROL_NUM', 'PART_NUM',
                'DRAWING_NUM_BUTTON', 'DRAWING_NUM', 'ITEM_NM', 'SIZE_TXT',
                'WORK_TYPE', 'OUTSIDE_YN', 'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT', 'INNER_WORK_FINISH_DT', 'MATERIAL_DETAIL',
                'MATERIAL_TYPE_NM', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY', 'CONTROL_PART_QTY',
                'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ORDER_NUM_PLUS_BUTTON', 'ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT',
                'OUT_QTY', 'ORDER_OUT_FINISH_DT', 'DELIVERY_DT', 'DETAIL_MACHINE_REQUIREMENT', 'MATERIAL_FINISH_TM', 'MATERIAL_FINISH_GRIND',
                'MATERIAL_FINISH_HEAT', 'RKFH', 'SIZE_W_M', 'SIZE_H_M', 'SIZE_T_M', 'SIZE_D_M', 'SIZE_L_M',
                'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT',
                'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'CALC_EST_UNIT_COST', 'UNIT_FINAL_EST_AMT',
                'UNIT_FINAL_AMT', 'FINAL_AMT', 'PREVIOUS_PRICE', 'PREV_DRAWING_NUM', 'POP_POSITION_NM', 'PART_STATUS_NM', 'DXF_GFILE_SEQ', 'IMG_GFILE_SEQ', 'PDF_GFILE_SEQ', 'DRAWING_VER',
                'DRAWING_UP_DT', 'ETC_GFILE_SEQ', 'INSPECT_NUM', 'INSPECT_GRADE_NM', 'INSPECT_TYPE_NM', 'INSPECT_RESULT_NM', 'INSPECT_DESC',
                'ERROR_ACTION_NM', 'ERROR_NOTE', 'OUTSIDE_COMP_NM', 'OUTSIDE_MATERIAL_SUPPLY_YN', 'OUTSIDE_UNIT_AMT', 'OUTSIDE_FINAL_AMT',
                'OUTSIDE_HOPE_DUE_DT', 'OUTSIDE_IN_DT', 'OUTSIDE_NOTE', 'OUTSIDE_INSPECT_RESULT_NM', 'OUTSIDE_ERROR_NOTE',
                'CONTROL_PART_INSERT_UPDATE_DT'
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
            confrimOrderStatus(controlStatus);
        };

        const confrimOrderStatus = function (controlStatus) {
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

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                list[i] = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                // 값 변경 전 이상 case 확인하기 위해 배열에 담는다.
                controlStatusList[i] = list[i].CONTROL_STATUS || undefined;
                list[i].CONTROL_STATUS = controlStatus;
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
                    return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
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
                'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'PART_NUM', 'CONTROL_VER', 'COMP_CD', 'ORDER_COMP_CD',
                'CONTROL_NOTE', 'MAIN_INSPECTION', 'EMERGENCY_YN', 'TOTAL_SHEET', 'CONTROL_STATUS_NM',
                'CONTROL_STATUS_DT', 'ORDER_STAFF_SEQ', 'DESIGNER_NM', 'PROJECT_NM', 'MODULE_NM', 'DELIVERY_COMP_NM',
                'LABEL_NOTE', 'MAIN_INSPECTION', 'PRICE_CONFIRM', 'ORDER_OUT_FINISH_DT', 'CONTROL_PART_INSERT_UPDATE_DT',
                'DRAWING_NUM_BUTTON'
            ];
            const partList = [
                'PART_NUM', 'DRAWING_NUM', 'ORDER_NUM_PLUS_BUTTON', 'DRAWING_VER', 'DRAWING_UP_DT', 'PREV_DRAWING_NUM', 'ITEM_NM', 'WORK_TYPE',
                'CONTROL_PART_QTY', 'OUTSIDE_YN', 'WORK_FACTORY', 'MATERIAL_SUPPLY_YN', 'INNER_DUE_DT', 'SIZE_TXT',
                'SIZE_TYPE', 'SIZE_W', 'SIZE_H', 'SIZE_T', 'SIZE_D', 'SIZE_L', 'SIZE_W_M', 'SIZE_H_M', 'SIZE_T_M',
                'SIZE_D_M', 'SIZE_L_M', 'MATERIAL_TYPE', 'MATERIAL_TYPE_NM', 'MATERIAL_DETAIL', 'MATERIAL_KIND',
                'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY', 'ORIGINAL_SIDE_QTY',
                'OTHER_SIDE_QTY', 'DETAIL_LATHE', 'DETAIL_SURFACE', 'DETAIL_CLAMPING', 'DETAIL_POCKET', 'DETAIL_DRILL',
                'DETAIL_DIFFICULTY', 'CALC_EST_UNIT_COST', 'MATERIAL_FINISH_TM', 'MATERIAL_FINISH_GRIND', 'MATERIAL_FINISH_HEAT',
                'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT',
                'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT', 'UNIT_AMT_NOTE', 'DETAIL_MACHINE_REQUIREMENT',
                'UNIT_MATERIAL_AUTO_YN', 'UNIT_TM_AUTO_YN', 'POP_POSITION_NM',
                'UNIT_GRIND_AUTO_YN', 'UNIT_HEAT_AUTO_YN', 'UNIT_SURFACE_AUTO_YN', 'UNIT_PROCESS_AUTO_YN', 'UNIT_AMT _NOTE',
                'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'FINAL_AMT', 'DWG_GFILE_SEQ', 'DXF_GFILE_SEQ', 'PDF_GFILE_SEQ',
                'IMG_GFILE_SEQ', 'VIEW_GFILE_SEQ', 'PART_STATUS', 'PART_STATUS_NM', 'STATUS_DT', 'MCT_NOTE', 'MCT_WORK_TYPE',
                'OUTSIDE_COMP_CD', 'OUTSIDE_COMP_NM', 'OUTSIDE_ORDER_NUM', 'OUTSIDE_NOTE', 'OUTSIDE_MATERIAL_SUPPLY_YN',
                'OUTSIDE_REQUEST_FINISH_YN', 'OUTSIDE_REQUEST_PROCESS_YN', 'OUTSIDE_REQUEST_GRIND_YN',
                'OUTSIDE_REQUEST_SURFACE_YN', 'OUTSIDE_REQUEST_ETC', 'OUTSIDE_HOPE_DUE_DT', 'OUTSIDE_UNIT_AMT',
                'OUTSIDE_FINAL_AMT', 'OUTSIDE_IN_DT', 'OUTSIDE_STATUS', 'OUTSIDE_STATUS_DT', 'INNER_WORK_FINISH_DT',
                'INSPECT_NUM', 'INSPECT_GRADE_NM', 'INSPECT_TYPE_NM', 'INSPECT_RESULT_NM', 'INSPECT_DESC',
                'ERROR_ACTION_NM', 'ERROR_NOTE', 'OUTSIDE_INSPECT_RESULT_NM', 'OUTSIDE_ERROR_NOTE', 'PREVIOUS_PRICE',
                'INVOICE_NUM'
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
                            cellData = data[j][dataIndx],
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                        if (controlList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData === cellDataPrev) {
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
                                if (cellDataPrev !== undefined && cellData === cellDataPrev) {
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

        const valiiiiiiiiiiiiiiiiiidationnnnnnnnnnnnnnnnn = function () {
            let gridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            let addList = gridInstance.getChanges().addList;
            let updateList = gridInstance.getChanges().updateList;
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

        $('#CONTROL_MANAGE_SAVE').on('click', function () {
            const insertQueryList = ['orderMapper.createControlPart', 'orderMapper.createControlPartOrder', 'orderMapper.createControlBarcode', 'orderMapper.createOutBarcode'];
            const updateQueryList = ['orderMapper.updateControlFromControlManage', 'orderMapper.updateControlPartFromControlManage', 'orderMapper.updateControlPartOrder'];

            fnModifyPQGrid($orderManagementGrid, insertQueryList, updateQueryList);
        });

        $('#CONTROL_MANAGE_DELETE').on('click', function () {
            let list = [];
            // let controlNumList = [];
            let message;

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let thisRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                list[i] = thisRowData;
                // controlNumList[i] = thisRowData.CONTROL_NUM;

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

            //TODO: list.lenth 건수
            message =
                '<h4>\n' +
                '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                '    <span>' + list.length + ' 건이 삭제됩니다. 진행하시겠습니까?</span>\n' +
                '</h4>';
            fnConfirm(null, message, function () {
                let parameters = {'url': '/removeControl', 'data': {data: JSON.stringify(list)}};
                fnPostAjax(function () {
                    fnAlert(null, "<spring:message code='com.alert.default.remove.success' />");
                    $orderManagementGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            });

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
            let orderCompCdList = [];
            let selectedRowCount = selectedOrderManagementRowIndex.length;

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

                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
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
            $orderManagementGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM'));
            });
            $orderManagementGrid.pqGrid('refreshDataAndView');
        });

        /**
         * @description 확정버튼 클릭
         */
        $('#CONFIRMATION').on('click', function (event) {
            let selectedRowCount = selectedOrderManagementRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});

                // TODO: 필수데이터가 입력되어 있어야만 확정 가능
                if (fnIsEmpty(rowData.PDF_GFILE_SEQ)) {
                    //TODO: 문구 수정
                    fnAlert(null, 'PDF확장자 파일 도면을 등록 후 다시 시도해주세요.');
                    return false;
                }
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
            $('#controlManageFilterColumn').empty();
            $('#controlManageFilterColumn').html(filterOpts);
            $('#controlManageFrozen').empty();
            $('#controlManageFrozen').html(frozenOts);
            //css 변경
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
        // 바코드도면출력
        $('#CONTROL_MANAGE_BARCODE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let selectControlPartCount = 0;
            let selectControlPartInfo = '';
            let selectControlList = '';
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                let curControlPartInfo = rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ;
                if (!(rowData.CONTROL_STATUS === 'ORD001')) {
                    fnAlert(null, '주문상태 확정 이후 출력 가능합니다');
                    return false;
                }
                if (!rowData.IMG_GFILE_SEQ) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                // } else if(rowData.WORK_TYPE != 'WTP020' && selectControlPartInfo != curControlPartInfo){
                } else if(selectControlPartInfo !== curControlPartInfo){
                    selectControlList += rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ + '^';
                    selectControlPartCount++;
                    selectControlPartInfo = curControlPartInfo;
                }
            }

                let message = '<h4>' +
                    '           <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '               <span>' + selectControlPartCount + ' 건의 바코드 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '       </h4>';

            fnConfirm(null, message, function () {
                printJS({printable:'/makeCadBarcodePrint?selectControlList=' + encodeURI(selectControlList), type:'pdf', showModal:true});
            });
        });
        // 바코드 출력
        $('#CONTROL_MANAGE_BARCODE_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let bodyHtml;
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
                if (!rowData.IMG_GFILE_SEQ) {
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
            callCadDrawingUploadPopup('control', 'orderMapper.manageControlCadFiles');
        });
        /** 도면 차수 및 변경 처리 **/
        $('#DRAWING_CHANGE').on('click', function () {
            callCadDrawingUploadPopup('controlRev', 'orderMapper.manageControlCadRevFiles');
        });
        /** 도면 보기 팝업 호출 */
        $('#CONTROL_MANAGE_DRAWING_VIEW').on('click', function () {
            let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[0]});

            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
        });
        // 도면출력
        $('#CONTROL_MANAGE_DRAWING_PRINT').on('click', function () {
            let selectedRowCount = selectedOrderManagementRowIndex.length;
            let imgGfileSeq = '';
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                if (!rowData.IMG_GFILE_SEQ) {
                    fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                    return;
                } else {
                    imgGfileSeq += rowData.IMG_GFILE_SEQ + '^';
                }
            }

            // let drawingPrintModalConfirm = function(callback){
            let message = '<h4>' +
                '           <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '               <span>' + selectedRowCount + ' 건의 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '       </h4>';
            fnConfirm(null, message, function () {
                printJS({printable: '/makeCadPrint?imgGfileSeq=' + encodeURI(imgGfileSeq), type: 'pdf', showModal: true});
            });
        });

        $('#SUPPLY_UNIT_COST_APPLY').on('change', function () {
            if (noSelectedRowAlert()) return false;

            let number = $('#SUPPLY_UNIT_COST_APPLY option:selected').val();
            let rate = 100 - number;

            for (let i = 0, selectedRowCount = selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedOrderManagementRowIndex[i]});
                let supplyUnitPrice = (Math.ceil(rowData.UNIT_FINAL_AMT * (rate / 100) / 100) * 100).toFixed(0) || null;
                let finalAmount = (supplyUnitPrice * rowData.ORDER_QTY) || null; // 10의 자리 올림

                $orderManagementGrid.pqGrid('updateRow', {'rowIndx': selectedOrderManagementRowIndex[i], row: {'UNIT_FINAL_AMT': supplyUnitPrice, 'FINAL_AMT': finalAmount}, checkEditable: false});
            }
        });

        $('[name=CONTROL_MANGE_CLOSE]').on('click', function () {
            $('#CONTROL_MANGE_POPUP').modal('hide');
        });
        /* event */

        /* init */
        // changeDate();
        $('#CONTROL_MANAGE_START_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#CONTROL_MANAGE_END_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#CONTROL_MANAGE_START_DATE').datepicker('setDate', 'today');
        $('#CONTROL_MANAGE_END_DATE').datepicker('setDate', 'today');
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

        // 화면 첫 로딩시에 조회 안되게 처리
        $orderManagementGrid = $('#' + gridId).pqGrid(obj);
        // $orderManagementGrid.pqGrid('option', 'dataModel.postData', function () {
        //     return (fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM'));
        // });
        // $orderManagementGrid.pqGrid('refreshDataAndView');
        /* init */

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
            }, 800);
            event.preventDefault();
        });

        $('#controlManageFilterKeyword').on('keyup', function(){
            fnFilterHandler($orderManagementGrid, 'controlManageFilterKeyword', 'controlManageFilterCondition', 'controlManageFilterColumn');
            autoMerge($orderManagementGrid.pqGrid('getInstance').grid, true);

            let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
            $('#CONTROL_MANAGE_RECORDS').html(data.length);
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
            $(this).val() === '' ? $('[id^=CONTROL_MANAGE][id$=DATE]').prop('disabled', true) : $('[id^=CONTROL_MANAGE][id$=DATE]').prop('disabled', false);
        });

        $('#ATTACHMENT_BUTTON').on('click', function () {
            let GfileKey = $('#common_file_download_form').find('#GFILE_SEQ').val();
            let rowIndx = $('#ATTACHMENT_BUTTON').data('rowIndx');

            if (GfileKey !== '' && GfileKey !== $('#ATTACHMENT_BUTTON').data('GfileKey')) {
                $orderManagementGrid.pqGrid('updateRow', {rowIndx: rowIndx, row: {'ETC_GFILE_SEQ': GfileKey}, checkEditable: false});
                $('#CONTROL_MANAGE_SAVE').click();
            }
        });

        $('#CONTROL_MANAGE_SEARCH_FORM').find('#AMOUNT_SUMMARY').on('click', function(){
            amountSummaryHtml();
        });

        function amountSummaryHtml() {
            $('#CONTROL_MANAGE_SEARCH_FORM').find('#amount_summary_html').html("공급 금액 합계 : 0");
            $('#CONTROL_MANAGE_SEARCH_FORM').find('#amount_summary_area').removeClass("controlAmountSummaryActive");
            $('#CONTROL_MANAGE_SEARCH_FORM').find('#amount_summary_area').addClass("controlAmountSummaryUnActive");
            let amountSummaryChk = $('#CONTROL_MANAGE_SEARCH_FORM').find('#AMOUNT_SUMMARY').is(":checked");
            if(amountSummaryChk) {
                let totalAmount = 0;
                let gridData = $orderManagementGrid.pqGrid('option', 'dataModel.data');
                $.each(gridData, function (key, rowData) {
                    if (rowData.FINAL_AMT) {
                        totalAmount += parseFloat(rowData.FINAL_AMT);
                    }
                });
                let totalAmountCurrency = pq.formatNumber(totalAmount, "#,###,###");
                $('#CONTROL_MANAGE_SEARCH_FORM').find('#amount_summary_area').addClass("controlAmountSummaryActive");
                $('#CONTROL_MANAGE_SEARCH_FORM').find('#amount_summary_html').html("공급 금액 합계 : " + totalAmountCurrency);
            }
        }

    });
</script>
