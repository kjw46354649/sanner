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
            <div class="gubunWrap row3_topWrap">
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
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="OUTSIDE_CLOSE_HISTORY_SEARCH">검색</button>
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
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <button type="button" class="defaultBtn btn-120w" data-toggle="modal" data-target="#OUTSIDE_CLOSE_CANCEL_POPUP">마감 취소</button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="DRAWING_VIEW">도면 View</button>
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
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseLeftList">
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                <input type="hidden" name="COMP_CD" id="COMP_CD">
                <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                <input type="hidden" name="OUTSIDE_CLOSE_CANCEL_YEAR" id="OUTSIDE_CLOSE_CANCEL_YEAR">
                <input type="hidden" name="OUTSIDE_CLOSE_CANCEL_MONTH" id="OUTSIDE_CLOSE_CANCEL_MONTH">
                <input type="hidden" name="CLOSE_VER" id="CLOSE_VER">
                <div style="width: 450px; float:left;">
                    <div id="OUTSIDE_CLOSE_CANCEL_LEFT_GRID"></div>
                </div>
                <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                    <span class="arrow right_Arrow"></span>
                </div>
                <div style="width: 450px; float:left;">
                    <div id="OUTSIDE_CLOSE_CANCEL_RIGHT_GRID"></div>
                </div>
            </form>
        </div>

        <div class="text-center">
            <button class="defaultBtn" id="OUTSIDE_CLOSE_CANCEL_YES">저장</button>
            <button class="defaultBtn" name="OUTSIDE_CLOSE_CANCEL_NO">닫기</button>
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
            {title: 'OUTSIDE_REQUEST_SEQ', dataType: 'integer', dataIndx: 'OUTSIDE_REQUEST_SEQ', hidden: true},
            {title: 'CLOSE_VER', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CLOSE_VER', hidden: false},
            {title: 'PART_STATUS', dataType: 'string', dataIndx: 'PART_STATUS', hidden: false},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', minWidth: 70, dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN', hidden: true},
            {title: '원발주<br>상태', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'DHLWNQKFWNTKDXO', hidden: true},
            {title: '상태변경<br>일시', minWidth: 70, dataType: 'string', dataIndx: 'TKDXOQUSRUDDLFTL'},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '입고일자', dataType: 'string', dataIndx: 'DLQRHDLFWK'},
            {title: '외주<br>발주번호', dataType: 'string', dataIndx: 'OUTSIDE_ORDER_NUM', editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'OUTSIDE_NOTE', editable: true},
            {title: '비고(주문)', dataType: 'select', dataIndx: 'NOTE'},
            {title: '', dataType: 'select', dataIndx: 'RHKSFLQJSGH'},
            {title: '관리번호', minWidth: 70, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true},
            {title: '', dataType: 'string', dataIndx: 'EHAUSQJSGH'},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true},
            {title: '품명', minWidth: 70, dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '규격', minWidth: 100, dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '자재종류', minWidth: 90, dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', editable: true},
            {title: '규격', minWidth: 90, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true},
            {title: '소재<br>종류', minWidth: 90, dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '사급<br>여부', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '소재<br>제공', dataType: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN'},
            {
                title: '요청 가공 사항', align: 'center', colModel: [
                    {title: '완제품', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN', editable: true},
                    {title: '가공', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN', editable: true},
                    {title: '연마', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN', editable: true},
                    {title: '표면처리', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN', editable: true},
                    {title: '기타사항', datatype: 'string', dataIndx: 'OUTSIDE_REQUEST_ETC', editable: true}
                ]
            },
            {title: '요망납기', dataType: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT', editable: true},
            {title: '외주<br>확정단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
            {title: '금액<br>합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '외주<br>종전가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DHLWNWHDWJSRK'},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', minWidth: 70, datatype: 'string', dataIndx: 'INNER_DUE_DT'},
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
            {title: '원주문<br>확정 일시', minWidth: 70, datatype: 'string', dataIndx: 'CONTROL_STATUS'},
            {title: '외주가공<br>요청일시.', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DATE'},
            {title: '외주가공<br>마감일시', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_FINISH_DATE'},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT'}
        ];
        const obj = {
            minHeight: '100%',
            height: 700,
            collapsible: false,
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
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
        let $outsideCloseCancelLeftGrid;
        const outsideCloseCancelLeftGridId = 'OUTSIDE_CLOSE_CANCEL_LEFT_GRID';
        const outsideCloseCancelColModel = [
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', width: 70,  dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', width: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '건수', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '발주가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CLOSE_CONTROL_AMT'}
        ];
        const outsideCloseCancelObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: outsideCloseCancelColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $outsideCloseCancelRightGrid;
        const outsideCloseCancelRightGridId = 'OUTSIDE_CLOSE_CANCEL_RIGHT_GRID';
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
                alert('하나 이상 선택해주세요');
                return true;
            }
        };

        const loadDataOutsideCloseCancel = function () {
            let list = [];
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let controlSeqStr = '';
            let compCdStr = '';
            let orderCompCdStr = '';
            let controlCloseYear;
            let controlCloseMonth;
            let closeVer;

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $outsideCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
            }
            // 중복제거
            controlSeqList = controlSeqList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            compCdList = compCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });
            orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlSeqStr += ',';
                }
            }
            for (let i = 0, COMP_CD_LIST_LENGTH = compCdList.length; i < COMP_CD_LIST_LENGTH; i++) {
                compCdStr += '\'' + compCdList[i] + '\'';

                if (i < COMP_CD_LIST_LENGTH - 1) {
                    compCdStr += ',';
                }
            }
            for (let i = 0, ORDER_COMP_CD_LIST_LENGTH = orderCompCdList.length; i < ORDER_COMP_CD_LIST_LENGTH; i++) {
                orderCompCdStr += '\'' + orderCompCdList[i] + '\'';

                if (i < ORDER_COMP_CD_LIST_LENGTH - 1) {
                    orderCompCdStr += ',';
                }
            }

            controlCloseYear = list[0].CLOSE_MONTH.substring(0, 4);
            controlCloseMonth = list[0].CLOSE_MONTH.substring(4);
            closeVer = list[0].CLOSE_VER;
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #COMP_CD').val(compCdStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #ORDER_COMP_CD').val(orderCompCdStr);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #OUTSIDE_CLOSE_CANCEL_YEAR').val(controlCloseYear);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #OUTSIDE_CLOSE_CANCEL_MONTH').val(controlCloseMonth);
            $('#OUTSIDE_CLOSE_CANCEL_FORM > #CLOSE_VER').val(closeVer);

            let postData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_CANCEL_FORM');
            $outsideCloseCancelLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $outsideCloseCancelLeftGrid.pqGrid('refreshDataAndView');

            postData.queryId = 'orderMapper.selectControlCloseCancelRightList';
            fnRequestGidData($outsideCloseCancelRightGrid, postData);
        };

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

                for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                    let rowData = $outsideCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    compCdList.push(rowData.COMP_CD);
                    orderCompCdList.push(rowData.ORDER_COMP_CD);
                }

                // 중복제거
                compCdList = compCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                orderCompCdList = orderCompCdList.filter(function (element, index, array) {
                    return array.indexOf(element) === index;
                });
                if (compCdList.length > 1) {
                    alert('선택된 대상들의 발주사는 동일해야 합니다.');
                    return false;
                }
                if (orderCompCdList.length > 1) {
                    alert('선택된 대상들의 공급사는 동일해야 합니다.');
                    return false;
                }

                // 빈 그리드 생성
                $outsideCloseCancelLeftGrid = $('#' + outsideCloseCancelLeftGridId).pqGrid(outsideCloseCancelObj);
                $outsideCloseCancelRightGrid = $('#' + outsideCloseCancelRightGridId).pqGrid(outsideCloseCancelObj);

                // 데이터
                loadDataOutsideCloseCancel();
            },
            'hide.bs.modal': function () {
                $outsideCloseCancelLeftGrid.pqGrid('destroy');
                $outsideCloseCancelRightGrid.pqGrid('destroy');
            }
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
