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

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-md-12">
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    주문 마감 이력
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="CONTROL_MANAGE_SEARCH_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CORPORATION">사업자</label>
                                <select class="form-control" name="CORPORATION" id="CORPORATION">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CLIENT">발주사</label>
                                <select class="form-control" name="CLIENT" id="CLIENT">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DRAWING_NUMBER">도면번호</label>
                                <input type="text" class="form-control" name="DRAWING_NUMBER" id="DRAWING_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="PRODUCT_NAME">품명</label>
                                <input type="text" class="form-control" name="PRODUCT_NAME" id="PRODUCT_NAME">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CONTROL_NUMBER">관리번호</label>
                                <input type="text" class="form-control" name="CONTROL_NUMBER" id="CONTROL_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_NUMBER">발주번호</label>
                                <input type="text" class="form-control" name="ORDER_NUMBER" id="ORDER_NUMBER">
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
                                <label class="control-label" for="">모듈명</label>
                                <input type="text" class="form-control" name="MODULE_NM" id="MODULE_NM">
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="OPTIONAL_CONDITIONS">선택적조건</label>
                                <select class="form-control" name="OPTIONAL_CONDITIONS" id="OPTIONAL_CONDITIONS">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label" for="CONTROL_NUMBER"></label>
                                <select class="form-control" name="CORPORATION" id="CORPORATION">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_NUMBER">INV No.</label>
                                <input type="text" class="form-control" name="ORDER_NUMBER" id="ORDER_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="UNIT_PRICE">단가</label>
                                <select class="form-control" id="UNIT_PRICE">
                                    <option></option>
                                </select>
                                <label for="UNIT_PRICE_1"></label><input type="text" class="form-control" id="UNIT_PRICE_1">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="">금액합산</label>
                                <input type="text" class="form-control" name="AMOUNT_SUM" id="AMOUNT_SUM" readonly>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="OPTIONAL_CONDITIONS">마감/종료 월</label>
                                    <select class="form-control" name="OPTIONAL_CONDITIONS" id="OPTIONAL_CONDITIONS">
                                        <option value="">Select</option>
                                        <c:forEach var="code" items="${HighCode.H_1007}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                    <label class="control-label" for="CONTROL_NUMBER"></label>
                                    <select class="form-control" name="CORPORATION" id="CORPORATION">
                                        <option value="">All</option>
                                        <c:forEach var="code" items="${HighCode.H_1007}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="AMOUNT_SUM">조회 Option</label>
                                    <label class="checkbox-inline i-checks" for="DEADLINE">
                                        <input type="checkbox" name="DEADLINE" id="DEADLINE"><i></i> 마감
                                    </label>
                                    <label class="checkbox-inline i-checks" for="END">
                                        <input type="checkbox" name="END" id="END"><i></i> 종료
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="AMOUNT_SUM">항목 Option</label>
                                    <label class="checkbox-inline i-checks" for="PART_NUM">
                                        <input type="checkbox" name="PART_NUM" id="PART_NUM"><i></i> Part
                                    </label>
                                    <label class="checkbox-inline i-checks" for="ORDER_NUM">
                                        <input type="checkbox" name="ORDER_NUM" id="ORDER_NUM"><i></i> 발주번호
                                    </label>
                                </div>
                                <div class="form-group col-md-3 text-right">
                                    <div type="submit" class="btn btn-success btn-sm btn-default" id="testSearch">
                                        Search
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
        let $orderManagementGrid;
        const gridId = 'CONTROL_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true, colModel: []},
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true, colModel: []},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true, colModel: []},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true, colModel: []},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true, colModel: []},
            {title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true, colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', hidden: true, colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', colModel: []},
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', colModel: []},
            {title: 'INV No.<br>(거래명세No.)', dataType: 'string', dataIndx: 'CHARGE_USER_ID', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', colModel: []},
            {title: '주요<br>검사품', dataType: 'select', dataIndx: 'MAIN_INSPECTION_YN', colModel: [],
                editor: {
                    type: 'select',
                    mapIndices: {name: 'MAIN_INSPECTION_YN_NM', id: 'MAIN_INSPECTION_YN'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1045'),
                    getData: function (ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['MAIN_INSPECTION_YN'] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            },
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN', colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', colModel: []},
            {
                title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM', colModel: [],
                render: function (ui) {
                    if (ui.rowData.WORK_NM === '가공조립') {
                        return "<span>플러스버튼</span>";
                    }
                }
            },
            {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER', hidden: true, colModel: []},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', colModel: []},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true, colModel: []},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', colModel: []},
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', colModel: []},
            {title: '가공납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE', colModel: []},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', colModel: []},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', colModel: []},
            {title: 'Part<br>단위<br>수량', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY', colModel: []},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
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
                    {title: '발주번호', datatype: 'string', dataIndx: 'ORDER_NUM'},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY'},
                    {title: '출고', datatype: 'string', dataIndx: 'CNFRH'},
                    {title: '납기', datatype: 'string', dataIndx: 'HOPE_DUE_DT'},
                    {title: '납품확인', datatype: 'string', dataIndx: 'DELIVERY_DT'},
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
                title: '예상소재 Size', align: 'center', hidden: true, colModel: [
                    {title: '가로', datatype: 'string', dataIndx: 'RKFH'},
                    {title: '세로', datatype: 'string', dataIndx: 'TPFH'},
                    {title: '높이', datatype: 'string', dataIndx: 'SHVDL'},
                    {title: '중량(KG)', datatype: 'string', dataIndx: 'WNDFID'},
                    {title: '부피(cm3)', datatype: 'string', dataIndx: 'QNVL'}
                ]
            },
            /* ,
             {
                 title: '항목별 계산견적 단가', align: 'center', colModel: [
                     {title: '소재비', datatype: 'string', dataIndx: ''},
                     {title: '소재마감', datatype: 'string', dataIndx: ''},
                     {title: '표면처리', datatype: 'string', dataIndx: ''},
                     {title: '가공비', datatype: 'string', dataIndx: ''},
                     {title: '기타추가', datatype: 'string', dataIndx: ''}
                 ]
             },
             {title: '계산<br>견적단가', dataType: 'string', dataIndx: '', colModel: []},
             {title: '최종<br>견적단가', dataType: 'string', dataIndx: '', colModel: []},
             {title: '견적<br>합계금액', dataType: 'string', dataIndx: '', colModel: []},
             {title: '최종<br>공급단가', dataType: 'string', dataIndx: '', colModel: []},
             {title: '합계금액', dataType: 'string', dataIndx: '', colModel: []},
             {title: '종전가', dataType: 'string', dataIndx: '', colModel: []}*/
            {title: '변경전<br>도면번호', dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', colModel: []},
            {title: 'NOTE', dataType: 'string', dataIndx: 'NOTE', editable: true, colModel: []}
        ];
        let toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: '마감/종료 취소', icon: 'ui-icon-cancel', listener: {
                        'click': function (evt, ui) {
                            const updateQueryList = ['updateControlMaster', 'updateControlPart'];

                            fnModifyPQGrid($orderManagementGrid, [], updateQueryList);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const updateQueryList = ['orderMapper.updateControlMaster', 'orderMapper.updateControlPart'];

                            fnModifyPQGrid($orderManagementGrid, [], updateQueryList);
                        }
                    }
                },
                {
                    type: 'button', label: '도면 View', icon: 'ui-icon-document', style: 'float: right;', listener: {
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
            ]
        };
        let obj = {
            // width: 700,
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
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
                    let data = $orderManagementGrid.pqGrid('option', 'dataModel.data');
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

        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        let popupColModel = [
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', colModel: []},
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', colModel: []},
            {title: '주요 검사품',  dataType: 'select', dataIndx: 'MAIN_INSPECTION_YN', colModel: []},
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
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_TYPE', colModel: []},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: '열처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', colModel: []},
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
        let popupToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                // {
                //     cls: 'title-hidden',
                //     type: 'textbox',
                //     label: '업체 리스트',
                //     style: 'font-size: 1.3rem;padding: 4px;font-weight: bold;'
                // },
                {
                    type: 'button', label: 'Save & 확정', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/registerNewOrderConfirm',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function (data, callFunctionParam) {
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
                                $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                }
            ]
        };
        let popoupObj = {
            // width: 700,
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            // trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: popupColModel,
            // editModel:{clicksToEdit: 2},
            toolbar: popupToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'orderMapper.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
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
            let s = '';
            let i = 0;

            while (i++ < len) {
                s += this;
            }

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
                        'ORDER_STATUS': controlStatus,
                        'ORDER_STATUS_NM': controlStatusNm,
                        'STATUS_DT': date
                    }
                };
                rowListConvert.push(tempObject);
            }
            $orderManagementGrid.pqGrid('updateRow', {rowList: rowListConvert});
        };
        /* function */

        /* event */
        /**
         * @description 날짜 라디오 변경
         */
        $('[name=CONTROL_MANAGE_TERM]').change(function () {
            let value = $(this).val();
            let today = new Date();
            let newDate = new Date();

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

            if (checked) {
                $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker('destroy');
            } else {
                $('[id^=CONTROL_MANAGE][id$=DATE]').datepicker();
            }
        }

        /**
         * @description 날짜 라디오 변경
         */
        $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').on('change', function () {
            createOrDestoryDatepicker();
        });

        $('#CONTROL_MANGE_POPUP').on('show.bs.modal', function () {
            $orderRegisterGrid = $('#' + popupGridId).pqGrid(popoupObj);
        });

        $('#CONTROL_MANGE_POPUP').on('hide.bs.modal', function () {
            $orderRegisterGrid.pqGrid('destroy');
        });

        $('#testSearch').on('click', function () {
            postData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM')
            $orderManagementGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return postData;
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

        /**
         * @description 마감버튼 클릭
         */
        $('#DEADLINE').on('click', function (event) {
            let selectedRowCount = selectedRowIndex.length;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                if (rowData.ORDER_STATUS_NM === '주문확정') {
                    alert('외주가 ‘Y’ 인 상태에서는 외주관리화면에서 대상을 먼저 삭제해야만 확정취소가 가능');
                    return false;
                }

            }

            getOrderStatusButton(event);
        });
        /* event */

        /* init */
        changeDate();
        fnCommCodeDatasourceSelectBoxCreate($('#CONTROL_MANAGE_SEARCH_FORM').find('#CLIENT'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        $orderManagementGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
