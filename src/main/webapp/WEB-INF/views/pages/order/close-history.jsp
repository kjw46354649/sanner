<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-01
  Time: 오전 10:42
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
        <form class="form-inline" id="CLOSE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectCloseHistoryList">
            <div class="none_gubunWrap row4_topWrap">
                <ul>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주사">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="text" class="wd_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD" title="사업자구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="RBRUR">규격</label>
                            <select class="wd_200" name="RBRUR" id="RBRUR" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <div class="ipu_wrap">
                            <label class="label_100" for="MODULE_NM">모듈명</label>
                            <input type="text" class="wd_200" name="MODULE_NM" id="MODULE_NM">
                        </div>
                    </li>
                    <li>
                        <div class="slt_wrap">
                            <label class="label_100" for="QUALITY_SEQ">품질Seq.</label>
                            <select class="wd_200" name="QUALITY_SEQ" id="QUALITY_SEQ">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </div>
                        <span class="gubun"></span>
                        <div class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUMBER">INV No.</label>
                            <input type="text" class="wd_200" name="ORDER_NUMBER" id="ORDER_NUMBER">
                        </div>
                        <span class="gubun"></span>
                        <div class="slt_wrap">
                            <label class="label_100" for="UNIT_PRICE">단가</label>
                            <select class="wd_200" id="UNIT_PRICE">
                                <option></option>
                            </select>
                            <%--                        <label class="label_100" for="UNIT_PRICE_1"></label>--%>
                            <%--                        <input type="text" class="wd_200" id="UNIT_PRICE_1">--%>
                        </div>
                        <span class="gubun"></span>
                        <div class="ipu_wrap">
                            <label class="label_100" for="AMOUNT_SUM">금액합산</label>
                            <input type="text" class="wd_200" name="AMOUNT_SUM" id="AMOUNT_SUM" readonly>
                        </div>
                    </li>
                    <li>
                        <div class="slt_wrap">
                            <label class="label_100">마감/종료 월</label>
                            <select class="wd_100" class="two" name="CLOSE_YEAR" id="CLOSE_HISTORY_CLOSE_YEAR"></select>
                            <select class="wd_100" class="two" name="CLOSE_MONTH" id="CLOSE_HISTORY_CLOSE_MONTH"></select>
                        </div>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100">조회 Option</label></span>
                        <span class="wd_200" style="display: inline-block;">
                            <span class="chk_box"><input type="checkbox" name="DEADLINE" id="DEADLINE"><label for="DEADLINE">마감</label></span>
                            <span class="chk_box"><input type="checkbox" name="END" id="END"><label for="END">종료</label></span>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100">항목 Option</label></span>
                        <span class="wd_200" style="display: inline-block;">
                            <span class="chk_box"><input type="checkbox" name="PART_NUM" id="PART_NUM"><label for="PART_NUM">Part</label></span>
                            <span class="chk_box"><input type="checkbox" name="ORDER_NUM" id="ORDER_NUM"><label for="ORDER_NUM">발주번호</label></span>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="CLOSE_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row4_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="text" id="closeHistoryFilterKeyword" placeholder="Enter your keyword">
                <select id="closeHistoryFilterColumn"></select>
                <select id="closeHistoryFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="closeHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="closeHistoryFrozen" name="closeHistoryFrozen">
                </select>
            </div>
            <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#CONTROL_CLOSE_CANCEL_POPUP">마감 취소</button>
            <button type="button" class="defaultBtn btn-100w" id="CONTROL_FINISH_CANCEL">종료 취소</button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-100w" id="CLOSE_HISTORY_DRAWING_PRINT">도면 출력</button>
                <button type="button" class="defaultBtn btn-100w" id="CLOSE_HISTORY_BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                <button type="button" class="defaultBtn btn-100w" id="BARCODE_PRINT">바코드 출력</button>
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_VIEW">도면 View</button>
                <button type="button" class="defaultBtn btn-100w green" id="CONTROL_CLOSE_HISTORY_SAVE">저장</button>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="CLOSE_HISTORY_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CLOSE_HISTORY_RECORDS" style="color: #00b3ee">0</span>)
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
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
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

<script>
    $(function () {
        'use strict';
        /* variable */
        let selectedRowIndex = [];
        let $closeHistoryGrid;
        const gridId = 'CLOSE_HISTORY_GRID';
        let postData = fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM');
        postData.CLOSE_YEAR = CURRENT_YEAR;
        postData.CLOSE_MONTH = CURRENT_MONTH < 10 ? '0' + CURRENT_MONTH : CURRENT_MONTH;
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {
                title: '마감 현황', align: 'center', colModel: [
                    {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
                    {title: '마감월', width: 55, dataIndx: 'CLOSE_MONTH_TRAN'},
                    {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
                    {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
                    {title: '작성자', dataIndx: 'CLOSE_USER_ID', hidden: true},
                    {title: '작성자', dataIndx: 'CLOSE_USER_NM'}
                ]
            },
            {title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', width: 110, dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '사업자<br>구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', minWidth: 70, dataIndx: 'COMP_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', minWidth: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
            {title: '구매담당', dataIndx: 'ORDER_STAFF_NM'},
            {title: '설계자', dataIndx: 'DESIGNER_NM'},
            {title: '비고', dataIndx: 'CONTROL_NOTE'},
            {title: 'INV No.<br>(거래명세No.)', width: 100, dataIndx: 'INVOICE_NUM'},
            {title: '모듈명', width: 70, dataIndx: 'MODULE_NM'},
            {
                title: '주요<br>검사품', dataType: 'select', dataIndx: 'MAIN_INSPECTION',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1059')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {title: '긴급', dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: 'CONTROL_VER', dataIndx: 'CONTROL_VER', hidden: true},
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
            {title: '관리번호', width: 150, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', dataType: 'integer', dataIndx: 'PART_NUM',
                // render: function (ui) {
                //     if (ui.rowData.WORK_TYPE === 'WTP020') {
                //         return '<span class="ui-icon ui-icon-circle-plus" name="PART_NUM_PLUS_BUTTON"></span>';
                //     }
                // }
            },
            {title: '도면번호버전', dataIndx: 'DRAWING_VER', hidden: true},
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
            {title: '도면번호', minWidth: 120, dataIndx: 'DRAWING_NUM'},
            {title: '품명', minWidth: 110, dataIndx: 'ITEM_NM'},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '작업<br>형태', minWidth: 70, dataIndx: 'WORK_TYPE_NM'},
            {title: '외주', dataIndx: 'OUTSIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '가공납기', minWidth: 70, dataIndx: 'INNER_DUE_DT'},
            {title: '규격', minWidth: 110, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', minWidth: 70, dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {title: '소재<br>종류', minWidth: 70, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재<br>형태', dataIndx: 'MATERIAL_KIND', hidden: true},
            {title: '소재<br>형태', dataIndx: 'MATERIAL_KIND_NM'},
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT', hidden: true},
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT_NM'},
            {title: '열<br>처리', dataIndx: 'MATERIAL_FINISH_HEAT'},
            {title: '소재비고', dataIndx: 'MATERIAL_NOTE'},
            {title: 'Part<br>Unit', dataType: 'integer', dataIndx: 'PART_UNIT_QTY'},
            // {title: '주문<br>수량', dataIndx: 'ITEM_QTY'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {
                title: '발주정보', align: 'center', colModel: [
                    {
                        title: '', dataIndx: 'ORDER_NUM_PLUS_BUTTON',
                        render: function (ui) {
                            if (ui.rowData.WORK_NM === '가공조립') {
                                return "<span>플러스버튼</span>";
                            }
                        }
                    },
                    {title: '발주번호', minWidth: 90, dataIndx: 'ORDER_NUM'},
                    {title: '수량', dataIndx: 'ORDER_QTY'},
                    {title: '출고', dataIndx: 'CNFRH'},
                    {title: '납기', dataIndx: 'HOPE_DUE_DT'},
                    {title: '납품확인', minWidth: 70, dataIndx: 'DELIVERY_DT'},
                ]
            },
            {
                title: '상세가공요건', align: 'center', hidden: true, colModel: [
                    {title: '선반', dataIndx: 'DETAIL_LATHE'},
                    {title: '가공면', dataIndx: 'DETAIL_SURFACE'},
                    {title: '클램핑', dataIndx: 'DETAIL_CLAMPING'},
                    {title: '포켓', dataIndx: 'DETAIL_POCKET'},
                    {title: '드릴', dataIndx: 'DETAIL_DRILL'},
                    {title: '난도', dataIndx: 'DETAIL_DIFFICULTY'}
                ]
            },
            {
                title: '소재마감', align: 'center', hidden: true, colModel: [
                    {title: 'TM각비', dataIndx: 'MATERIAL_FINISH_TM'},
                    {title: '연마', dataIndx: 'MATERIAL_FINISH_GRIND'},
                    {title: '열처리', dataIndx: 'MATERIAL_FINISH_HEAT'}
                ]
            },
            {
                title: '예상소재 Size', align: 'center', hidden: true, colModel: [
                    {title: '@', dataIndx: 'RKFH'},
                    {title: '가로', dataIndx: 'SIZE_W_M'},
                    {title: '세로', dataIndx: 'SIZE_H_M'},
                    {title: '높이', dataIndx: 'SIZE_T_M'},
                    {title: '중량(KG)', dataIndx: 'SIZE_D_M'},
                    {title: '부피(cm³)', dataIndx: 'SIZE_L_M'}
                ]
            },
            {
                title: '항목별 계산견적 단가 (10원단위 반올림)', align: 'center', colModel: [
                    {title: '소재비', dataIndx: 'UNIT_MATERIAL_AMT'},
                    {title: 'TM각비', dataIndx: 'UNIT_TM_AMT'},
                    {title: '연마비', dataIndx: 'UNIT_GRIND_AMT'},
                    {title: '열처리', dataIndx: 'UNIT_HEAT_AMT'},
                    {title: '표면처리', dataIndx: 'UNIT_SURFACE_AMT'},
                    {title: '가공비', dataIndx: 'UNIT_PROCESS_AMT'},
                    {title: '기타추가', dataIndx: 'UNIT_ETC_AMT'},
                    {title: '견적비고', dataIndx: 'UNIT_AMT_NOTE'}
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
            {title: '변경전<br>도면번호', minWidth: 120, dataIndx: 'PREV_DRAWING_NUM', colModel: []},
            {
                title: 'DXF', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
                title: 'PDF', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
            {title: 'Rev.', dataIndx: 'REVD.'},
            {title: 'Rev. 일시', minWidth: 70, dataIndx: 'REVDLFTL.'},
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
                    {title: '외주단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_FINAL_AMT'},
                    {title: '요망납기', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고날짜', dataIndx: 'dhlwndlqrhskfWk'},
                    {title: '비고', dataIndx: 'OUTSIDE_NOTE'},
                    {title: '불량Code', dataIndx: 'dhlwnqnffidcode'},
                    {title: '조치방안', dataIndx: 'dhlwnwhclqkddks'}
                ]
            },
            {title: '등록/업데이트<br>일시', minWidth: 100, dataIndx: 'STATUS_DT'},
            {title: 'Note', minWidth: 100, dataIndx: 'CLOSE_DETAIL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const obj = {
            height: 670,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            // selectionModel: {type: 'row', mode: 'single'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false ,render: closeHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#closeHistoryFilterColumn").empty();
                $("#closeHistoryFilterColumn").html(filterOpts);
                $("#closeHistoryFrozen").empty();
                $("#closeHistoryFrozen").html(frozenOts);
            },
            complete: function () {
                let data = $closeHistoryGrid.pqGrid('option', 'dataModel.data');

                $('#CLOSE_HISTORY_RECORDS').html(data.length);
            },
            // rowSelect: function (event, ui) {
            //     selectedRowIndex[0] = ui.addList[0].rowIndx;
            // }
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            }
        };
        let $controlCloseCancelLeftGrid;
        const controlCloseCancelLeftGridId = 'CONTROL_CLOSE_CANCEL_LEFT_GRID';
        const controlCloseCancelLeftColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', width: 70,  dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '건수', dataIndx: 'CONTROL_ORDER_QTY', hidden: true},
            {title: '건수', dataIndx: 'CONTROL_ORDER_QTY_TRAN'},
            {title: '공급가', width: 90, align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 90, align: 'right', dataIndx: 'FINAL_NEGO_AMT'}
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
            {title: '사업자', width: 70, dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '건수', dataIndx: 'CONTROL_ORDER_QTY', hidden: true},
            {title: '건수', dataIndx: 'CONTROL_ORDER_QTY_TRAN'},
            {title: '공급가', width: 90, align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 90, align: 'right', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
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

        /* variable */

        /* function */
        const updateControlStatus = function () {
            let selectedRowCount = selectedRowIndex.length;
            let rowListConvert = [];
            let date = new Date().yyyymmddhhmm();

            for (let i = 0; i < selectedRowCount; i++) {
                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: {
                        'CONTROL_STATUS': null,
                        'CONTROL_STATUS_NM': null,
                        'CONTROL_STATUS_DT': date
                    }
                };
                rowListConvert.push(tempObject);
            }
            $closeHistoryGrid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});
            const updateQueryList = ['orderMapper.createControlProgress', 'orderMapper.updateControlStatus'];

            fnModifyPQGrid($closeHistoryGrid, [], updateQueryList);
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        const loadDataControlCloseCancel = function () {
            let list = [];
            let controlSeqList = [];
            let controlSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlSeqList.push(rowData.CONTROL_SEQ);
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#CONTROL_CLOSE_CANCEL_FORM > #CONTROL_SEQ').val(controlSeqStr);

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

        let isDifferentStatus = function (status) {
            // status ORD003 마감, ORD004 종료
            let controlStatusList = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlStatusList.push(rowData.CONTROL_STATUS);
            }
            // 중복제거
            controlStatusList = [...new Set(controlStatusList)];

            if (controlStatusList.length > 1) {
                fnAlert(null, '주문 상태가 다릅니다.'); //TODO: 문구 수정
                return true;
            }
            if(controlStatusList[0] !== status) {
                fnAlert(null, '주문 상태가 다릅니다.'); //TODO: 문구 수정
                return true;
            }

            return false;
        };

        function closeHistoryFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if(options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if(index > -1) val = options[index].text;
            }
            if (val) {
                var condition = $("#closeHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#closeHistoryFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                }
                else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                }
                else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
                }
                else {
                    return val;
                }
            }
            else {
                return val;
            }
        }
        /* function */

        /* event */
        $('#CLOSE_HISTORY_SEARCH').on('click', function () {
            postData = fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM')
            $closeHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return postData;
            });
            $closeHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#CONTROL_CLOSE_CANCEL_POPUP').on({
            'show.bs.modal': function () {
                // updateControlStatus();
                if (noSelectedRowAlert()) {
                    return false;
                }

                if (isDifferentStatus('ORD003')) {
                    return false;
                }

                let compCdList = [];
                let orderCompCdList = [];

                for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    compCdList.push(rowData.COMP_CD);
                    orderCompCdList.push(rowData.ORDER_COMP_CD);
                }

                // 중복제거
                compCdList = [...new Set(compCdList)];
                orderCompCdList = [...new Set(orderCompCdList)];

                if (compCdList.length > 1) {
                    fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                    return false;
                }
                if (orderCompCdList.length > 1) {
                    fnAlert(null, '선택된 대상들의 공급사는 동일해야 합니다.');
                    return false;
                }

                $controlCloseCancelLeftGrid = $('#' + controlCloseCancelLeftGridId).pqGrid(controlCloseCancelLeftObj);
                $controlCloseCancelRightGrid = $('#' + controlCloseCancelRightGridId).pqGrid(controlCloseCancelRightObj);

                loadDataControlCloseCancel();
            },
            'hide.bs.modal': function () {
                $controlCloseCancelLeftGrid.pqGrid('destroy');
                $controlCloseCancelRightGrid.pqGrid('destroy');
            }
        });

        $('#DRAWING_VIEW').on('click', function () {

        });

        $('#CONTROL_CLOSE_HISTORY_SAVE').on('click', function () {
            const updateQueryList = ['orderMapper.updateControlPart', 'orderMapper.updateMonthCloseDetailNote'];

            fnModifyPQGrid($closeHistoryGrid, [], updateQueryList);
        });

        $('[name=CONTROL_CLOSE_CANCEL_NO]').on('click', function () {
            $('#CONTROL_CLOSE_CANCEL_POPUP').modal('hide');
        });

        $('#CONTROL_CLOSE_CANCEL_YES').on('click', function () {
            let list = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

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
                $closeHistoryGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('#CONTROL_FINISH_CANCEL').on('click', function () {
            if (noSelectedRowAlert()) {
                return false;
            }
            if (isDifferentStatus('ORD004')) {
                return false;
            }

            updateControlStatus();
        });

        $("#closeHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($closeHistoryGrid, 'closeHistoryFilterKeyword', 'closeHistoryFilterCondition', 'closeHistoryFilterColumn');
        });

        $("#closeHistoryFrozen").on('change', function(e){
            fnFrozenHandler($closeHistoryGrid, $(this).val());
        });
        // 도면출력
        $('#CLOSE_HISTORY_DRAWING_PRINT').on('click', function () {
            let selectedRowCount = selectedRowIndex.length;
            let imgGfileSeq = '';
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
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
        // 바코드도면출력
        $('#CLOSE_HISTORY_BARCODE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let selectedRowCount = selectedRowIndex.length;
            let selectControlPartCount = 0;
            let selectControlPartInfo = '';
            let selectControlList = '';
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                let curControlPartInfo = rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ;
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
        $('#BARCODE_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            let bodyHtml;
            let selectedRowCount = selectedRowIndex.length;
            let selectControlPartCount = 0;
            let selectControlPartInfo = '';
            let formData = [];
            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $closeHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
                let curControlPartInfo = rowData.CONTROL_SEQ + '' + rowData.CONTROL_DETAIL_SEQ;
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
        /* event */

        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#CLOSE_HISTORY_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CLOSE_HISTORY_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnAppendSelectboxYear('CLOSE_HISTORY_CLOSE_YEAR', 10);
        fnAppendSelectboxMonth('CLOSE_HISTORY_CLOSE_MONTH');
        $('#CLOSE_HISTORY_CLOSE_MONTH').val(postData.CLOSE_MONTH);
        $closeHistoryGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
