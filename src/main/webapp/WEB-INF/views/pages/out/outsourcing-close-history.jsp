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
            <div class="gubunWrap">
                <div class="form-group1">
                    <div class="group-item">
                        <label for="COMP_CD">사업자</label>
                        <select name="COMP_CD" id="COMP_CD">
                            <option value="">All</option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="ORDER_COMP_CD">발주사</label>
                        <select name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                            <option value="">All</option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="DRAWING_NUM">도면번호</label>
                        <input type="text" name="DRAWING_NUM" id="DRAWING_NUM">
                    </div>
                    <div class="group-item">
                        <label for="ITEM_NM">품명</label>
                        <input type="text" name="ITEM_NM" id="ITEM_NM">
                    </div>
                    <div class="group-item">
                        <label for="CONTROL_NUM">관리번호</label>
                        <input type="text" name="CONTROL_NUM" id="CONTROL_NUM">
                    </div>
                    <div class="group-item">
                        <label for="ORDER_NUM">발주번호</label>
                        <input type="text" name="ORDER_NUM" id="ORDER_NUM">
                    </div>
                    <div class="group-item">
                        <!-- TODO: 규격 -->
                        <label for="STANDARD">규격</label>
                        <select id="STANDARD">
                            <option></option>
                        </select>
                    </div>
                    <div class="group-item">
                        <label for="MODULE_NM">모듈명</label>
                        <input type="text" name="MODULE_NM" id="MODULE_NM">
                    </div>
                    <div class="line line-dashed b-b line-xs"></div>
                    <div class="group-item">
                        <label for="OUTSIDE_CLOSE_YEAR">마감/종료 월</label>
                        <select class="two" name="OUTSIDE_CLOSE_YEAR" id="OUTSIDE_CLOSE_YEAR"></select>
                        <select class="two" name="OUTSIDE_CLOSE_MONTH" id="OUTSIDE_CLOSE_MONTH"></select>
                    </div>
                    <div class="group-item">
                        <label for="UNIT_PRICE">단가</label>
                        <select class="two" id="UNIT_PRICE">
                            <option></option>
                        </select>
                        <input type="text" class="two" id="UNIT_PRICE_1">
                    </div>
                    <div class="group-item">
                        <label for="AMOUNT_SUM">금액합산</label>
                        <input type="text" name="AMOUNT_SUM" id="AMOUNT_SUM" readonly>
                    </div>
                    <button type="button" class="search_btn" id="OUTSIDE_CLOSE_HISTORY_SEARCH">검색</button>
                </div>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="defaultBtn" id="OUTSIDE_CLOSE_CANCEL">마감 취소</button>
                </div>
                <div class="col-md-6 ta-r">
                    <button type="button" class="defaultBtn grayGra" id="DRAWING_VIEW">도면 View</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conMainWrap">
                <div id="OUTSIDE_CLOSE_HISTORY_GRID"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        let selectedRowIndex = [];
        let $outsideCloseHistoryGrid;
        const gridId = 'OUTSIDE_CLOSE_HISTORY_GRID';
        let postData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM');
        const colModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true, colModel: []},
            {
                title: 'CONTROL_DETAIL_SEQ',
                dataType: 'integer',
                dataIndx: 'CONTROL_DETAIL_SEQ',
                hidden: true,
                colModel: []
            },
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true, colModel: []},
            {
                title: 'OUTSIDE_REQUEST_SEQ',
                dataType: 'integer',
                dataIndx: 'OUTSIDE_REQUEST_SEQ',
                hidden: true,
                colModel: []
            },
            {title: 'CLOSE_VER', dataType: 'integer', dataIndx: 'CLOSE_VER', hidden: false, colModel: []},
            {title: 'PART_STATUS', dataType: 'string', dataIndx: 'PART_STATUS', hidden: false, colModel: []},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자<br>구분', minWidth: 70, dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '외주<br>구분', dataType: 'string', dataIndx: 'OUTSIDE_YN', hidden: true, colModel: []},
            {title: '원발주<br>상태', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '외주<br>발주상태', dataType: 'string', dataIndx: 'DHLWNQKFWNTKDXO', hidden: true, colModel: []},
            {title: '상태변경<br>일시', minWidth: 70, dataType: 'string', dataIndx: 'TKDXOQUSRUDDLFTL', colModel: []},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true, colModel: []},
            {title: '외주업체', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', colModel: []},
            {title: '입고일자', dataType: 'string', dataIndx: 'DLQRHDLFWK', colModel: []},
            {title: '외주<br>발주번호', dataType: 'string', dataIndx: 'OUTSIDE_ORDER_NUM', editable: true, colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'OUTSIDE_NOTE', editable: true, colModel: []},
            {title: '비고(주문)', dataType: 'select', dataIndx: 'NOTE', colModel: []},
            {title: '', dataType: 'select', dataIndx: 'RHKSFLQJSGH', colModel: []},
            {title: '관리번호', minWidth: 70, dataType: 'string', dataIndx: 'CONTROL_NUM', editable: true, colModel: []},
            {title: '', dataType: 'string', dataIndx: 'EHAUSQJSGH', colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', editable: true, colModel: []},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: true, colModel: []},
            {title: '품명', minWidth: 70, dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '규격', minWidth: 100, dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '자재종류', minWidth: 90, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', editable: true, colModel: []},
            {title: '규격', minWidth: 90, dataType: 'string', dataIndx: 'SIZE_TXT', editable: true, colModel: []},
            {title: '소재<br>종류', minWidth: 90, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            // {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
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
            {title: '원주문<br>확정 일시', minWidth: 70, datatype: 'string', dataIndx: 'CONTROL_STATUS', colModel: []},
            {title: '외주가공<br>요청일시.', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_REQUEST_DATE', colModel: []},
            {title: '외주가공<br>마감일시', minWidth: 70, dataType: 'string', dataIndx: 'OUTSIDE_FINISH_DATE', colModel: []},
            {title: 'DXF', dataType: 'string', dataIndx: 'STATUS_DT', colModel: []}
        ];
        const obj = {
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

                    newRowData.ROWNUM = totalRecords + 1;
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

                    newRowData.ROWNUM = totalRecords + 1;
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
        /* variable */

        /* function */
        /*let getOrderStatusButton = function (event) {
            let controlStatus = event.target.dataset.control_status;
            let controlStatusNm = event.target.dataset.control_status_nm;

            updateControlPartStatus(controlStatus, controlStatusNm);
        };*/

        let updateControlPartStatus = function () {
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
            let s = '', i = 0;

            while (i++ < len) s += this;

            return s;
        };
        String.prototype.zf = function (len) {
            return '0'.string(len - this.length) + this;
        };
        Number.prototype.zf = function (len) {
            return this.toString().zf(len);
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
            const updateQueryList = ['orderMapper.updateControlPartStatus', 'orderMapper.insertControlPartProgress'];
            const deleteQuery = 'outMapper.deleteOutsideClose';

            fnModifyPQGrid($outsideCloseHistoryGrid, [], updateQueryList);
            fnDeletePQGrid($outsideCloseHistoryGrid, selectedRowIndex, deleteQuery);
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
        fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR', 10);
        fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH', CURRENT_YEAR);
        $outsideCloseHistoryGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
