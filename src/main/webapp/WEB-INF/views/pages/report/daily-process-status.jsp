<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-14
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page daily_process_status">
    <div class="toolWrap">
        <form class="form-inline" id="DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectDailyProcessStatusLeftList">
            <div class="slt_wrap">
                <label class="label_100">조회년월</label>
                <select class="wd_100" class="two" name="YEAR" id="DAILY_PROCESS_STATUS_YEAR"></select>
                <select class="wd_100" class="two" name="MONTH" id="DAILY_PROCESS_STATUS_MONTH"></select>
            </div>
            <span class="gubun"></span>
            <span class="slt_wrap">
                <label class="label_100" for="WORK_FACTORY">대상공장</label>
                <select class="wd_200" name="WORK_FACTORY" id="WORK_FACTORY" title="대상공장">
                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                    <c:forEach var="code" items="${HighCode.H_1014}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
            </span>
            <span class="ipu_wrap right_float">
<%--                <button type="button" class="defaultBtn radius blue" id="DAILY_PROCESS_STATUS_SEARCH">검색</button>--%>
            </span>
        </form>
    </div>
    <div class="leftWrap left_float">
        <div style="height: inherit;">
            <div class="d-flex align-items-center">
                <div>
                </div>
                <div class="ml-auto">
                    <button type="button" id="DAILY_PROCESS_STATUS_LEFT_EXPORT_EXCEL"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                    <button type="button" class="defaultBtn btn-100w green" id="DAILY_PROCESS_STATUS_LEFT_SAVE">저장</button>
                </div>
            </div>
            <hr>
            <div id="DAILY_PROCESS_STATUS_LEFT_GRID"></div>
        </div>
    </div>
    <div class="rightWrap left_float">
        <form class="form-inline" id="DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
            <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectDailyProcessStatusRightList">
            <input type="hidden" name="DT" id="DT">
            <input type="hidden" name="WORK_FACTORY" id="WORK_FACTORY">
            <div style="height: inherit;">
                <div class="d-flex align-items-center">
                    <div>
                        <span class="chk_box"><input name="VIEW_UNIT_PRICE_INFORMATION" id="VIEW_UNIT_PRICE_INFORMATION" type="checkbox"><label for="VIEW_UNIT_PRICE_INFORMATION"> 단가정보 보기</label></span>
                    </div>
                    <div class="ml-auto">
                        <button type="button" class="defaultBtn btn-100w green" id="DAILY_PROCESS_STATUS_RIGHT_SAVE">저장</button>
                    </div>
                </div>
                <hr>
                <div id="DAILY_PROCESS_STATUS_RIGHT_GRID"></div>
            </div>
        </form>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        let isRightSaveButtonClick = false;
        let selectedRowIndex = [];
        fnAppendSelectboxYear('DAILY_PROCESS_STATUS_YEAR', 10);
        fnAppendSelectboxMonth('DAILY_PROCESS_STATUS_MONTH');
        $('#DAILY_PROCESS_STATUS_MONTH').val(CURRENT_MONTH < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);

        const leftGridId = 'DAILY_PROCESS_STATUS_LEFT_GRID';
        let leftPostData = fnFormToJsonArrayData('#DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM');
        const leftColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'DT', dataIndx: 'DT', hidden: true},
            {title: '날짜', minWidth: 40, maxWidth: 40, dataIndx: 'CAL_DT_NM'},
            {title: '요일', minWidth: 30, maxWidth: 30, dataIndx: 'WEEK_DAY_NM'},
            {
                title: '가공완료', align: 'center', colModel: [
                    {title: '품수', maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_CNT'},
                    {title: '수량', maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'PART_QTY'}
                ]
            },
            {title: '예상금액', minWidth: 65, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_AMT'},
            {title: '목표금액', minWidth: 65, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'DT_GOAL_AMT'},
            {title: '달성<br>비율(%)', align: 'right', minWidth: 50, maxWidth: 50, dataIndx: 'GOAL_RATIO'},
            {title: '기준<br>근무', minWidth: 40, maxWidth: 40, dataType: 'integer', format: '#,###', dataIndx: 'WORKING_TIME'},
            {
                title: '부적합', align: 'center', colModel: [
                    {title: '품수', minWidth: 40, maxWidth: 45, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_CNT'},
                    {title: '수량', minWidth: 40, maxWidth: 45, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_QTY'}
                ]
            },
            {
                title: '비고', dataIndx: 'NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    const rowData = ui.rowData;

                    return !(rowData.CAL_DT_NM === '합계' || rowData.CAL_DT_NM === '총계');
                }
            }
        ];
        const leftObj = {
            height: '94%',
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: leftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: leftPostData,
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            sortModel: {on: false},
            complete: function () {
                const data = $dailyProcessStatusLeftGrid.pqGrid('option', 'dataModel.data');

                if (data.length > 0) {
                    const rowIndx = isRightSaveButtonClick ? selectedRowIndex[0] : 0;

                    $dailyProcessStatusLeftGrid.pqGrid('setSelection', {rowIndx: rowIndx});
                }
            },
            rowSelect: function (event, ui) {
                if (!(ui.addList[0].rowData.CAL_DT_NM === '합계' || ui.addList[0].rowData.CAL_DT_NM === '총계')) {
                    const rowData = ui.addList[0].rowData;
                    const dt = rowData.DT || null;
                    const workFactory = rowData.WORK_FACTORY || null;
                    selectedRowIndex[0] = rowData.pq_ri;

                    $("#DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM").find("#DT").val(dt);
                    $("#DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM").find("#WORK_FACTORY").val(workFactory);
                    $dailyProcessStatusRightGrid.pqGrid("option", "dataModel.postData", function (ui) {
                        return fnFormToJsonArrayData('DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM');
                    });
                    $dailyProcessStatusRightGrid.pqGrid("refreshDataAndView");
                }
            },
            rowInit: function (ui) {
                if (ui.rowData.WEEK_DAY_NM === '일') {
                    return {style: {'color': '#FF0000'}};
                }

                switch (ui.rowData.CAL_DT_NM) {
                    case '합계':
                        return {style: {'background': '#FFFF00'}};
                    case '총계':
                        return {style: {'background': '#FFE4B5'}};
                }
            }
        };

        const rightGridId = 'DAILY_PROCESS_STATUS_RIGHT_GRID';
        let rightPostData = fnFormToJsonArrayData('#DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM');
        const rightColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width:75, dataIndx: 'ORDER_COMP_NM'},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '수행<br>공장', minWidth: 40, maxWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '', minWidth: 30, maxWidth: 30, dataIndx: 'CONTROL_NUM_BUTTON',
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
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업지시번호', minWidth: 150, maxWidth: 180, dataIndx: 'CONTROL_NUM'},
            {
                title: '', minWidth: 30, maxWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '가공<br>납기', minWidth: 40, maxWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '수량<br>추가', minWidth: 40, dataIndx: 'ADDITIONAL_QTY'},
            {title: '발주<br>수량', minWidth: 40, maxWidth: 40, dataIndx: 'PART_QTY'},
            {title: '가공완료<br>일시', minWidth: 75, maxWidth: 75, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '소요<br>시간(분)', align: 'right', minWidth: 55, dataIndx: 'WORK_TIME'},
            {
                title: '예상단가', minWidth: 65, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '단가정보', align: 'center', colModel: [
                    {title: '종전가', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT', hidden: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                                cellData = "";
                                ui.rowData.PREV_UNIT_FINAL_AMT = "";
                            }
                            return {cls: cls, text: cellData};
                        }
                    },
                    {title: '견적가', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', hidden: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                                cellData = "";
                                ui.rowData.UNIT_FINAL_EST_AMT = "";
                            }
                            return {cls: cls, text: cellData};
                        }
                    },
                    {title: '공급가', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', hidden: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                                cellData = "";
                                ui.rowData.UNIT_FINAL_AMT = "";
                            }
                            return {cls: cls, text: cellData};
                        }
                    }
                ]
            },
            {title: '합계금액', minWidth: 65, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {
                // title: 'P/H', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'PRICE_PER_HOUR',
                title: '계산가공원가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CP_TOTAL', minWidth: 75,
                style: {'color': 'blue'}
            },
            {
                title: '계산원가 단가', align: 'center', colModel: [
                    {title: '소재비', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AUTO_AMT', hidden: true},
                    {title: '연마비', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT', hidden: true},
                    {title: '열처리', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', hidden: true},
                    {title: '표면처리', minWidth: 50, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SURFACE_AUTO_AMT', hidden: true}
                ]
            },
            {
                title: '검사결과', align: 'center', colModel: [
                    {title: '등급', minWidth: 30, dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '검사코드', maxWidth: 95, dataIndx: 'INSPECT_RESULT_NM'}
                ]
            },
            {title: '부적합<br>수량', minWidth:40, maxWidth: 40, dataIndx: 'ERROR_QTY'},
            {
                title: '비고', dataIndx: 'NOTE', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const rightObj = {
            height: '94%',
            collapsible: false,
            postRenderInterval: -1,
            resizable: true,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: false},
            trackModel: {on: true},
            // selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: rightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: rightPostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            editorKeyDown: function(evt, ui){
                if (evt.keyCode === 13) { //enter key.
                    evt.originalEvent.keyCode = 40; //disguise down key.
                }
            },
            cellKeyDown: function (event, ui) {
                let rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const totalRecords = this.option('dataModel.data').length;
                if (event.keyCode == $.ui.keyCode.DOWN && rowIndx < totalRecords) {
                    rowIndx++;
                } else if (event.keyCode == $.ui.keyCode.UP && rowIndx > 0) {
                    rowIndx--;
                }
                sr.removeAll();
                sr.add({rowIndx: rowIndx});
                const selRowData = this.getRowData({rowIndx: rowIndx});
                if(typeof selRowData != 'undefined' && typeof selRowData.IMG_GFILE_SEQ != 'undefined') {
                    callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                }
            },
        };

        const $dailyProcessStatusLeftGrid = $('#' + leftGridId).pqGrid(leftObj);
        const $dailyProcessStatusRightGrid = $('#' + rightGridId).pqGrid(rightObj);
        /* init */

        /* function */
        const changeViewColumn = function (checked) {
            const $dailyProcessStatusRightGridInstance = $dailyProcessStatusRightGrid.pqGrid('getInstance').grid;
            const Cols = $dailyProcessStatusRightGridInstance.Columns();
            const array = ['PREV_UNIT_FINAL_AMT','UNIT_FINAL_EST_AMT','UNIT_FINAL_AMT','UNIT_MATERIAL_AUTO_AMT','UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT','UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT','UNIT_SURFACE_AUTO_AMT'];
            const parameter = checked ? 'diShow' : 'diHide';
            Cols.hide({[parameter]: array});
        };
        /* function */

        /* event */
        $('#DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM').on('change', function () {
            isRightSaveButtonClick = false;
            $dailyProcessStatusLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM');
            });
            $dailyProcessStatusLeftGrid.pqGrid('refreshDataAndView');
        });

        $('#DAILY_PROCESS_STATUS_LEFT_SAVE').on('click', function () {
            const updateQueryList = ['reportMapper.insertUpdateWorkingDayNote'];

            fnModifyPQGrid($dailyProcessStatusLeftGrid, [], updateQueryList);
        });
        $('#DAILY_PROCESS_STATUS_RIGHT_SAVE').on('click', function () {
            const updateQueryList = ['reportMapper.updateControlNote', 'reportMapper.updateControlPartForecastUnitAmt'];
            isRightSaveButtonClick = true;

            fnModifyPQGrid($dailyProcessStatusRightGrid, [], updateQueryList);
            //FIXME: 변경된 데이터의 cell만 reload
            setTimeout(function () {
                $dailyProcessStatusLeftGrid.pqGrid('refreshDataAndView');
            }, 1000);
        });
        $('#VIEW_UNIT_PRICE_INFORMATION').on('click', function () {
            changeViewColumn(this.checked);
        });

        $('#DAILY_PROCESS_STATUS_LEFT_EXPORT_EXCEL').on('click', function () {
            const blob = $dailyProcessStatusLeftGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '일별 가공현황.xlsx');
        });
        /* event */
    });
</script>