<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-10
  Time: 오후 3:10
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
        <form class="form-inline" id="OUTSIDE_CLOSE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
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
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="text" class="wd_200" name="ORDER_NUM" id="ORDER_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <!-- TODO: 규격 -->
                            <label class="label_100" for="STANDARD">규격</label>
                            <select class="wd_200" id="STANDARD">
                                <option></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="MODULE_NM">모듈명</label>
                            <input type="text" class="wd_200" name="MODULE_NM" id="MODULE_NM">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_CLOSE_YEAR">마감/종료 월</label>
                            <select class="wd_100" name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR"></select>
                            <select class="wd_100" name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="UNIT_PRICE">단가</label>
                            <select class="wd_100" class="two" id="UNIT_PRICE">
                                <option></option>
                            </select>
                            <input type="text" class="wd_100" class="two" id="UNIT_PRICE_1">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="AMOUNT_SUM">금액합산</label>
                            <input type="text" class="wd_200" name="AMOUNT_SUM" id="AMOUNT_SUM" readonly>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="OUTSIDE_CLOSE_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="text" id="outsourcingCloseHistoryFilterKeyword" placeholder="Enter your keyword">
                <select id="outsourcingCloseHistoryFilterColumn"></select>
                <select id="outsourcingCloseHistoryFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="outsourcingCloseHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="outsourcingCloseHistoryFrozen" name="outsourcingCloseHistoryFrozen">
                </select>
            </div>
            <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#OUTSIDE_CLOSE_CANCEL_POPUP">마감 취소</button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-100w" id="DRAWING_VIEW">도면 View</button>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="OUTSIDE_CLOSE_HISTORY_GRID"></div>
            </div>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="popup_container" id="OUTSIDE_CLOSE_CANCEL_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3>월 마감 취소 진행(외주주문)</h3>
        <hr>
        <button type="button" class="pop_close" name="OUTSIDE_CLOSE_CANCEL_NO">닫기</button>
        <div class="d-inline-block">
            <form class="form-inline" id="OUTSIDE_CLOSE_CANCEL_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseCancelLeftList">
                <input type="hidden" name="CONTROL_DETAIL_SEQ" id="CONTROL_DETAIL_SEQ">
                <input type="hidden" name="COMP_CD" id="COMP_CD">
                <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <input type="hidden" name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR">
                <input type="hidden" name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH">
                <input type="hidden" name="OUTSIDE_CLOSE_VER" id="OUTSIDE_CLOSE_VER">
                <div style="width: 450px; float:left;">
                    <div id="OUTSIDE_CLOSE_CANCEL_LEFT_GRID"></div>
                </div>
                <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
                </div>
                <div style="width: 450px; float:left;">
                    <div id="OUTSIDE_CLOSE_CANCEL_RIGHT_GRID"></div>
                </div>
            </form>
        </div>

        <div class="text-center">
            <button class="defaultBtn greenPopGra"  id="OUTSIDE_CLOSE_CANCEL_YES">저장</button>
            <button class="defaultBtn grayPopGra" name="OUTSIDE_CLOSE_CANCEL_NO">닫기</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR', 10);
        fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH');
        $('#OUTSIDE_CLOSE_MONTH').val(CURRENT_MONTH < 9 ? '0' + CURRENT_MONTH : CURRENT_MONTH).prop('selected', true);
        /* variable */
        let selectedRowIndex = [];
        let $outsideCloseHistoryGrid;
        const gridId = 'OUTSIDE_CLOSE_HISTORY_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM');
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            // {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: 'CLOSE_VER', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CLOSE_VER', hidden: true},
            {title: 'PART_STATUS', dataIndx: 'PART_STATUS', hidden: true},
            {title: '마감월', dataIndx: 'OUTSIDE_CLOSE_MONTH'},
            {title: '차수', dataIndx: 'OUTSIDE_CLOSE_VER'},
            {title: '사업자<br>구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', minWidth: 70, dataIndx: 'COMP_NM'},
            {title: '외주<br>구분', dataIndx: 'OUTSIDE_YN'},
            {title: '원발주<br>상태', minWidth: 70, dataIndx: 'CONTROL_PART_STATUS'},
            {title: '외주<br>발주상태', dataIndx: 'DHLWNQKFWNTKDXO', hidden: true},
            {title: '상태변경<br>일시', minWidth: 70, dataIndx: 'PART_SATUS_DT'},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', minWidth: 70, dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '입고일시', dataIndx: 'OUTSIDE_IN_DT'},
            {title: '외주<br>발주번호', dataIndx: 'OUTSIDE_ORDER_NUM'},
            {title: '비고', dataIndx: 'OUTSIDE_NOTE'},
            {title: '비고(주문)', width: 150, dataIndx: 'CONTROL_NOTE'},
            {title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: 150, dataIndx: 'CONTROL_NUM'},
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
            {title: '도면번호', width: 90, dataIndx: 'DRAWING_NUM'},
            {title: '파<br>트', dataIndx: 'PART_NUM'},
            {title: '품명', minWidth: 70, dataIndx: 'ITEM_NM'},
            {title: '규격', minWidth: 100, dataIndx: 'SIZE_TXT'},
            {title: '표면처리', dataIndx: 'SURFACE_TREAT_NM'},
            {title: '규격', minWidth: 90, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', minWidth: 90, dataIndx: 'MATERIAL_DETAIL_NM'},
            // {title: '수량', dataIndx: 'ITEM_QTY'},
            {title: '사급<br>여부', dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '소재<br>제공', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '요청 가공 사항', align: 'center', colModel: [
                    {title: '완제품', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN'},
                    {title: '가공', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN'},
                    {title: '연마', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN'},
                    {title: '표면처리', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN'},
                    {title: '기타사항', dataIndx: 'OUTSIDE_REQUEST_ETC'}
                ]
            },
            {title: '요망납기', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
            {title: '외주<br>확정단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
            {title: '금액<br>합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '외주<br>종전가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DHLWNWHDWJSRK'},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', minWidth: 70, dataIndx: 'INNER_DUE_DT'},
                    {title: '공급단가', dataIndx: 'UNIT_FINAL_AMT'},
                    {title: '발주처', dataIndx: 'ORDER_COMP_CD'},
                    {title: '발주처', dataIndx: 'ORDER_COMP_NM'}
                ]
            },
            {
                title: '품질결과', align: 'center', hidden: true, colModel: [
                    {title: 'Seq.', dataIndx: 'Seq.'},
                    {title: '결과', dataIndx: 'RUFRHK'},
                    {title: '불량코드', dataIndx: 'QNFFIDZHEM'},
                    {title: '측정일시', dataIndx: 'CMRWJDDLFTL'}
                ]
            },
            {title: '원주문<br>확정 일시', width: 100, dataIndx: 'CONTROL_STATUS'},
            {title: '외주가공<br>요청일시.', width: 100, dataIndx: 'OUTSIDE_REQUEST_DATE'},
            {title: '외주가공<br>마감일시', width: 100, dataIndx: 'OUTSIDE_FINISH_DATE'},
            {title: 'DXF', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
            }
        ];
        const obj = {
            minHeight: '100%',
            height: 700,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: outsourcingCloseHistoryFilterRender}, filterModel: { mode: 'OR' },
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
                $("#outsourcingCloseHistoryFilterColumn").empty();
                $("#outsourcingCloseHistoryFilterColumn").html(filterOpts);
                $("#outsourcingCloseHistoryFrozen").empty();
                $("#outsourcingCloseHistoryFrozen").html(frozenOts);
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PART_NUM' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $outsideCloseHistoryGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;
                    let newPartNum = 0;
                    let newRowIndex = 0;

                    for (let i = 0; i < totalRecords; i++) {
                        if (data[i].CONTROL_SEQ === newRowData.CONTROL_SEQ) {
                            newPartNum++;
                            newRowIndex = data[i].pq_ri + 1;
                        }
                    }

                    newRowData.ROW_NUM = totalRecords + 1;
                    newRowData.PART_NUM = newPartNum;
                    newRowData.WORK_NM = '가공';
                    newRowData.WORK_TYPE = 'FCT01';

                    $outsideCloseHistoryGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: newRowIndex,
                        checkEditable: false
                    });
                }

                if (ui.dataIndx === 'ORDER_NUM_PLUS_BUTTON' && ui.rowData.WORK_NM === '가공조립') {
                    let newRowData = fnCloneObj(ui.rowData);
                    let data = $outsideCloseHistoryGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;

                    newRowData.ROW_NUM = totalRecords + 1;
                    $outsideCloseHistoryGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: ui.rowIndx + 1,
                        checkEditable: false
                    });
                }
            },
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            }
        };
        let $outsideCloseCancelLeftGrid;
        const outsideCloseCancelLeftGridId = 'OUTSIDE_CLOSE_CANCEL_LEFT_GRID';
        const outsideCloseCancelLeftColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', width: 70,  dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataIndx: 'CNT'},
            {title: '건수', dataIndx: 'CONTROL_PART_QTY'},
            {title: '발주가', width: 90, align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 90, align: 'right', dataIndx: 'FINAL_NEGO_AMT'}
        ];
        const outsideCloseCancelLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: outsideCloseCancelLeftColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function () {
                let gridInstance = $outsideCloseCancelRightGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };
        let $outsideCloseCancelRightGrid;
        const outsideCloseCancelRightGridId = 'OUTSIDE_CLOSE_CANCEL_RIGHT_GRID';
        const outsideCloseCancelRightColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', width: 70,  dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN', style: {'font-weight': 'bold', 'color': 'red'}},
            {title: '품수', dataIndx: 'CNT', style: {'font-weight': 'bold', 'color': 'red'}},
            {title: '건수', dataIndx: 'CONTROL_PART_QTY', style: {'font-weight': 'bold', 'color': 'red'}},
            {title: '발주가', width: 90, align: 'right', dataIndx: 'TOTAL_AMT', style: {'font-weight': 'bold', 'color': 'red'}},
            {title: '마감금액', width: 90, align: 'right', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const outsideCloseCancelRightObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            // dragColumns: {enabled: false},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: outsideCloseCancelRightColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function () {
                let gridInstance = $outsideCloseCancelLeftGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };
        /* variable */

        /* function */
        /*let getOrderStatusButton = function (event) {
            let controlStatus = event.target.dataset.control_status;
            let controlStatusNm = event.target.dataset.control_status_nm;

            updateControlPartStatus(controlStatus, controlStatusNm);
        };*/

        const updateControlPartStatus = function () {
            let selectedRowCount = selectedRowIndex.length;
            let rowListConvert = [];
            let date = new Date().format('MM-dd HH:mm');

            for (let i = 0; i < selectedRowCount; i++) {
                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: {
                        'PART_STATUS': null
                    }
                };
                rowListConvert.push(tempObject);
            }
            $outsideCloseHistoryGrid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        const loadDataOutsideCloseCancel = function () {
            let list = [];
            let controlDetailSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let outsideCompCdList = [];
            let controlDetailSeqStr = '';
            let compCdStr = '';
            let orderCompCdStr = '';
            let controlCloseMonth;
            let closeVer;

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlDetailSeqList.push(rowData.CONTROL_DETAIL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
                outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
            }
            // 중복제거
            controlDetailSeqList = [...new Set(controlDetailSeqList)];

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlDetailSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlDetailSeqStr += controlDetailSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlDetailSeqStr += ',';
                }
            }

            controlCloseMonth = parseInt(list[0].OUTSIDE_CLOSE_MONTH);
            closeVer = list[0].CLOSE_VER;

            $('#OUTSIDE_CLOSE_CANCEL_FORM > #CONTROL_DETAIL_SEQ').val(controlDetailSeqStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #COMP_CD').val(compCdStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #ORDER_COMP_CD').val(orderCompCdStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #OUTSIDE_CLOSE_MONTH').val(controlCloseMonth);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #OUTSIDE_CLOSE_VER').val(closeVer);

            let postData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_CANCEL_FORM');
            $outsideCloseCancelLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $outsideCloseCancelLeftGrid.pqGrid('refreshDataAndView');

            postData.queryId = 'outMapper.selectOutsideCloseCancelRightList';
            fnRequestGridData($outsideCloseCancelRightGrid, postData);
        };

        function outsourcingCloseHistoryFilterRender(ui) {
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
                var condition = $("#outsourcingCloseHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#outsourcingCloseHistoryFilterKeyword").val(),
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
        $('#OUTSIDE_CLOSE_HISTORY_SEARCH').on('click', function () {
            postData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM')
            $outsideCloseHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return postData;
            });
            $outsideCloseHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#OUTSIDE_CLOSE_CANCEL').on('click', function () {
            updateControlPartStatus();
            const updateQueryList = ['orderMapper.updateControlPartStatus', 'orderMapper.createControlPartProgress'];
            const deleteQuery = 'outMapper.deleteOutsideClose';

            fnModifyPQGrid($outsideCloseHistoryGrid, [], updateQueryList);
            fnDeletePQGrid($outsideCloseHistoryGrid, selectedRowIndex, deleteQuery);
        });

        $('#OUTSIDE_CLOSE_CANCEL_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                // 동일한 발주사, 공급사인지 확인
                let compCdList = [];
                let orderCompCdList = [];
                let outsideCompCdList = [];

                for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $outsideCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    compCdList.push(rowData.COMP_CD);
                    orderCompCdList.push(rowData.ORDER_COMP_CD);
                    outsideCompCdList.push(rowData.OUTSIDE_COMP_CD);
                }

                // 중복제거
                compCdList = [...new Set(compCdList)];
                orderCompCdList = [...new Set(orderCompCdList)];
                outsideCompCdList = [...new Set(outsideCompCdList)];

                if (compCdList.length > 1) {
                    fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                    return false;
                }
                if (orderCompCdList.length > 1) {
                    fnAlert(null, '선택된 대상들의 공급사는 동일해야 합니다.');
                    return false;
                }
                if (outsideCompCdList.length > 1) {
                    fnAlert(null, '선택된 대상들의 협력업체는 동일해야 합니다.');
                    return false;
                }

                $('#OUTSIDE_CLOSE_CANCEL_FORM > #COMP_CD').val(compCdList[0]);
                $('#OUTSIDE_CLOSE_CANCEL_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);
                $('#OUTSIDE_CLOSE_CANCEL_FORM > #OUTSIDE_COMP_CD').val(outsideCompCdList[0]);

                // 빈 그리드 생성
                $outsideCloseCancelLeftGrid = $('#' + outsideCloseCancelLeftGridId).pqGrid(outsideCloseCancelLeftObj);
                $outsideCloseCancelRightGrid = $('#' + outsideCloseCancelRightGridId).pqGrid(outsideCloseCancelRightObj);

                // 데이터
                loadDataOutsideCloseCancel();
            },
            'hide.bs.modal': function () {
                $outsideCloseCancelLeftGrid.pqGrid('destroy');
                $outsideCloseCancelRightGrid.pqGrid('destroy');
            }
        });

        $('#OUTSIDE_CLOSE_CANCEL_YES').on('click', function () {
            let list = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
            }

            let rightData = $outsideCloseCancelRightGrid.pqGrid('option', 'dataModel.data');
            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            let parameters = {'url': '/removeOutsideClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $('#OUTSIDE_CLOSE_CANCEL_POPUP').modal('hide');
                $outsideCloseHistoryGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('[name=OUTSIDE_CLOSE_CANCEL_NO]').on('click', function () {
            $('#OUTSIDE_CLOSE_CANCEL_POPUP').modal('hide');
        });

        $("#outsourcingCloseHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($outsideCloseHistoryGrid, 'outsourcingCloseHistoryFilterKeyword', 'outsourcingCloseHistoryFilterCondition', 'outsourcingCloseHistoryFilterColumn');
        });

        $("#outsourcingCloseHistoryFrozen").on('change', function(e){
            fnFrozenHandler($outsideCloseHistoryGrid, $(this).val());
        });
        /* event */

        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        $outsideCloseHistoryGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
