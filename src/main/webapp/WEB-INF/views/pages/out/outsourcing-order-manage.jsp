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

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-md-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    외주 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="OUTSIDE_ORDER_MANAGE_SEARCH_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId"
                               value="outMapper.selectOutsourcingOrderManageList">
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
                                <label class="control-label" for="MODULE_NM">모듈명</label>
                                <input type="text" class="form-control" name="MODULE_NM" id="MODULE_NM">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="OUTSIDE_COMP_CD">외주업체</label>
                                <select class="form-control" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="">외주발주상태</label>
                                <select class="form-control" name="" id="">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1031}">
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
                                    <label class="control-label" for="WORK_TYPE">작업구분</label>
                                    <select class="form-control" name="WORK_TYPE" id="WORK_TYPE">
                                        <option value="">All</option>
                                        <c:forEach var="code" items="${HighCode.H_1013}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                    <label for="UNIT_CONST_1"></label>
                                    <input type="text" class="form-control" id="UNIT_CONST_1">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="WORK_TYPE">품질현황</label>
                                    <select class="form-control" name="WORK_TYPE" id="WORK_TYPE">
                                        <option value="">All</option>
                                        <c:forEach var="code" items="${HighCode.H_1040}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">option</label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 입고완료
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="AMOUNT_SUM">금액총합계</label>
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
                    <a href="#REQUEST_OUTSIDE_POPUP" data-toggle="modal" data-refform="CONTROL_MANGE_POPUP">
                        <input type="button" value="외주가공 요청">
                    </a>
                    <a href="#CANCEL_PROCESSING_REQUEST_POPUP" data-toggle="modal" data-refform="CONTROL_MANGE_POPUP">
                        <input type="button" value="가공요청 취소">
                    </a>
                    <button id="ORDER_EXTRACTION">발주서 추출</button>
                    <a href="#OUTSIDE_CLOSE_POPUP" data-toggle="modal" data-refform="CONTROL_MANGE_POPUP">
                        <input type="button" value="외주마감">
                    </a>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="OUTSIDE_ORDER_MANAGE_GRID"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="modal" id="REQUEST_OUTSIDE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
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
                        <label class="control-label" for="SUBCONTRACTOR_REQUESTED">요청 외주업체</label>
                        <select class="form-control" name="" id="SUBCONTRACTOR_REQUESTED">

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
<div class="modal" id="REQUEST_OUTSIDE_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
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
                        <label class="control-label" for="SUBCONTRACTOR_REQUESTED">요청 외주업체</label>
                        <select class="form-control" name="" id="SUBCONTRACTOR_REQUESTED">

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
                        <label class="control-label" for="SUBCONTRACTOR_REQUESTED">요청 외주업체</label>
                        <select class="form-control" name="" id="SUBCONTRACTOR_REQUESTED">

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
                                    <select class="form-control" name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR">
                                        <option></option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH">
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

<script>
    $(function () {
        'use strict';
        /* variable */
        let selectedRowIndex = [];
        let $outsideOrderManageGrid;
        const gridId = 'OUTSIDE_ORDER_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM');
        let colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true, colModel: []},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true, colModel: []},
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN', hidden: true, colModel: []},
            {title: '원발주<br>상태', dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'DHLWNQKFWNTKDXO', hidden: true, colModel: []},
            {title: '상태변경<br>일시', dataType: 'string', dataIndx: 'TKDXOQUSRUDDLFTL', colModel: []},
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
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
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
            {title: '원주문<br>확정 일시', datatype: 'string', dataIndx: 'CONTROL_STATUS', colModel: []},
            {title: '외주가공<br>요청일시.', dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DATE', colModel: []},
            {title: '외주가공<br>마감일시', dataType: 'string', dataIndx: 'OUTSIDE_FINISH_DATE', colModel: []},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT', colModel: []}
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
        let $outsideCloseLeftGrid;
        const outsideCloseLeftGridId = 'OUTSIDE_CLOSE_LEFT_GRID';
        let outsideCloseLeftPostData;
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

        let loadDataOutsideClose = function () {
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

        $('#OUTSIDE_CLOSE_POPUP').on('show.bs.modal', function () {
            fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR', 3);
            fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH');

            $outsideCloseLeftGrid = $('#' + outsideCloseLeftGridId).pqGrid(outsideCloseLeftObj);
            $outsideCloseRightGrid = $('#' + outsideCloseRightGridId).pqGrid(outsideCloseRightObj);

            loadDataOutsideClose();
        });

        $('#OUTSIDE_CLOSE_LEFT_FORM').on('change', function () {
            loadDataOutsideClose();
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

        $('#testSearch').on('click', function () {
            $outsideOrderManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#OUTSIDE_ORDER_MANAGE_SEARCH_FORM'));
            });
            $outsideOrderManageGrid.pqGrid('refreshDataAndView');
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