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
            <input type="hidden" name="queryId" id="queryId" value="selectCloseHistoryList">
            <div class="basicWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD" title="사업자구분">
                                <option value="">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주사">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="CLOSE_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="text" class="wd_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="RBRUR">규격</label>
                            <select class="wd_200" name="RBRUR" id="RBRUR" title="규격">
                                <option value="" selected="selected">ALL</option>
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
                                <option value="">All</option>
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
                            <label class="label_100" for="CLOSE_YEAR">마감/종료 월</label>
                            <select class="wd_100" class="two" name="CLOSE_YEAR" id="CLOSE_YEAR"></select>
                            <select class="wd_100" class="two" name="CLOSE_MONTH" id="CLOSE_MONTH"></select>
                        </div>
                        <span class="gubun"></span>
                        <span class="txt_span pd-right20">조회 Option</span>
                        <span class="chk_box"><input type="checkbox" name="DEADLINE" id="DEADLINE"><label for="DEADLINE">마감</label></span>
                        <span class="chk_box"><input type="checkbox" name="END" id="END"><label for="END">종료</label></span>
                        <span class="gubun"></span>
                        <span class="txt_span pd-right20">항목 Option</span>
                        <span class="chk_box"><input type="checkbox" name="PART_NUM" id="PART_NUM"><label for="PART_NUM">Part</label></span>
                        <span class="chk_box"><input type="checkbox" name="ORDER_NUM" id="ORDER_NUM"><label for="ORDER_NUM">발주번호</label></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <button type="button" class="defaultBtn btn-120w" id="DEADLINE_OR_END_CANCLE">마감/종료 취소</button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="DRAWING_VIEW">도면 View</button>
                <button type="button" class="defaultBtn btn-120w green" id="CONTROL_CLOSE_HISTORY_SAVE">저장</button>
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
        let selectedRowIndex = [];
        let $closeHistoryGrid;
        const gridId = 'CLOSE_HISTORY_GRID';
        let postData = fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM');
        postData.CLOSE_YEAR = CURRENT_YEAR;
        postData.CLOSE_MONTH = CURRENT_MONTH < 10 ? '0' + CURRENT_MONTH : CURRENT_MONTH;
        const colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {
                title: 'CONTROL_PROGRESS_SEQ',
                dataType: 'integer',
                dataIndx: 'CONTROL_PROGRESS_SEQ',
                hidden: true,
                colModel: []
            },
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true, colModel: []},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true, colModel: []},
            {
                title: 'CONTROL_DETAIL_SEQ',
                dataType: 'integer',
                dataIndx: 'CONTROL_DETAIL_SEQ',
                hidden: true,
                colModel: []
            },
            {
                title: 'PART_PROGRESS_SEQ',
                dataType: 'integer',
                dataIndx: 'PART_PROGRESS_SEQ',
                hidden: true,
                colModel: []
            },
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true, colModel: []},
            {
                title: '주문상태', align: 'center', colModel: [
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
            {
                title: 'INV No.<br>(거래명세No.)',
                minWidth: 100,
                dataType: 'string',
                dataIndx: 'CHARGE_USER_ID',
                colModel: []
            },
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', editable: true, colModel: []},
            {
                title: '주요<br>검사품', dataType: 'select', dataIndx: 'MAIN_INSPECTION', colModel: [],
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
            // {title: '주문<br>수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
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
            {
                title: '최종<br>견적단가',
                minWidth: 90,
                dataType: 'string',
                dataIndx: 'UNIT_FINAL_EST_AMT',
                colModel: [],
                editable: true
            },
            {title: '견적<br>합계금액', minWidth: 90, dataType: 'string', dataIndx: 'RUSWJRGKQRpRMADOR', colModel: []},
            {
                title: '최종<br>공급단가',
                minWidth: 90,
                dataType: 'string',
                dataIndx: 'UNIT_FINAL_AMT',
                colModel: [],
                editable: true
            },
            {title: '합계금액', dataType: 'string', dataIndx: 'FINAL_AMOUNT', colModel: []},
            {title: '종전가', minWidth: 100, dataType: 'string', dataIndx: 'WHDWJSRK', colModel: []},
            {
                title: '변경전<br>도면번호',
                minWidth: 120,
                dataType: 'string',
                dataIndx: 'PREV_DRAWING_NUM',
                colModel: [],
                editable: true
            },
            {
                title: '마감/취소 현황', align: 'center', colModel: [
                    {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH'},
                    {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER'},
                    {title: '작성자', datatype: 'string', dataIndx: 'akrkacnlthtkwrtjdwk'},
                    {title: '일시', datatype: 'string', dataIndx: 'CLOSE_DT'}
                ]
            },
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ'},
            {title: 'Rev.', dataType: 'string', dataIndx: 'REVD.', colModel: []},
            {title: 'Rev. 일시', minWidth: 70, dataType: 'string', dataIndx: 'REVDLFTL.', colModel: []},
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
            {title: '등록/업데이트<br>일시', minWidth: 100, dataType: 'string', dataIndx: 'STATUS_DT', colModel: []}
        ];
        const obj = {
            height: 658,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
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
            complete: function () {
                let data = $closeHistoryGrid.pqGrid('option', 'dataModel.data');

                $('#CLOSE_HISTORY_RECORDS').html(data.length);
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PART_NUM' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $closeHistoryGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;
                    let newPartNum = 0;
                    let newRowIndex = 0;

                    for (let i = 0; i < totalRecords; i++) {
                        if (data[i].CONTROL_SEQ === newRowData.CONTROL_SEQ) {
                            newPartNum++;
                            newRowIndex = data[i].pq_ri + 1;
                        }
                    }

                    newRowData.ROWNUM = totalRecords + 1;
                    newRowData.PART_NUM = newPartNum;
                    newRowData.WORK_NM = '가공';
                    newRowData.WORK_TYPE = 'FCT01';

                    $closeHistoryGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: newRowIndex,
                        checkEditable: false
                    });
                }

                if (ui.dataIndx === 'ORDER_NUM_PLUS_BUTTON' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $closeHistoryGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;

                    newRowData.ROWNUM = totalRecords + 1;
                    $closeHistoryGrid.pqGrid('addRow', {
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

                    if (firstRow === lastRow) {
                        selectedRowIndex[0] = firstRow;
                    } else {
                        for (let i = firstRow; i <= lastRow; i++) {
                            selectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        /* variable */

        /* function */
        let updateControlStatus = function () {
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
        };
        /* function */

        /* event */
        $('#CLOSE_HISTORY_SEARCH').on('click', function () {
            postData = fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM')
            $closeHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return postData;
            });
            $closeHistoryGrid.pqGrid('refreshDataAndView');
        });
        // $('#CLOSE_YEAR').on('change', function() {
        //     fnAppendSelectboxMonth('CLOSE_MONTH', this.value);
        // });

        $('#DEADLINE_OR_END_CANCLE').on('click', function () {
            updateControlStatus();
        });

        $('#DRAWING_VIEW').on('click', function () {

        });

        $('#CONTROL_CLOSE_HISTORY_SAVE').on('click', function () {
            const updateQueryList = ['orderMapper.updateControlStatus', 'orderMapper.insertControlProgress'];

            fnModifyPQGrid($closeHistoryGrid, [], updateQueryList);
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
        fnAppendSelectboxYear('CLOSE_YEAR', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH', CURRENT_YEAR);
        $closeHistoryGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
