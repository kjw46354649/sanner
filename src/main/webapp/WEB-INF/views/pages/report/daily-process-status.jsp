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
                <button type="button" class="defaultBtn radius blue" data-toggle="modal" data-target="#TARGET_AMOUNT_REGISTER_POPUP">목표금액 설정</button>
            </span>
        </form>
    </div>
    <div class="leftWrap left_float">
        <div style="height: inherit;">
            <div class="d-flex align-items-center">
                <div></div>
                <div class="ml-auto">
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

<div class="popup_container" id="TARGET_AMOUNT_REGISTER_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>목표 금액 설정</h3>
        <hr>
        <button type="button" class="pop_close" name="TARGET_AMOUNT_REGISTER_CLOSE">닫기</button>
        <form class="form-inline" id="TARGET_AMOUNT_REGISTER_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectTargetAmountRegisterList">
            <div class="d-flex align-items-center">

                <div>
                    <span class="slt_wrap">
                        <label class="label_100">조회년월</label>
                        <select class="wd_100" class="two" name="YEAR" id="TARGET_AMOUNT_REGISTER_YEAR"></select>
                    </span>
                    <span class="slt_wrap">
                        <label class="label_100" for="WORK_FACTORY">대상공장</label>
                        <select class="wd_200" name="WORK_FACTORY" id="WORK_FACTORY" title="대상공장">
                            <c:forEach var="code" items="${HighCode.H_1014}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w green" id="DAILY_PROCESS_STATUS_TARGET_AMOUNT_SAVE">
                        저장
                    </button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="TARGET_AMOUNT_REGISTER_GRID"></div>
        </div>

        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="TARGET_AMOUNT_REGISTER_CLOSE">닫기</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        // TODO: element name 변경
        fnAppendSelectboxYear('DAILY_PROCESS_STATUS_YEAR', 10);
        fnAppendSelectboxMonth('DAILY_PROCESS_STATUS_MONTH');
        $('#DAILY_PROCESS_STATUS_MONTH').val(CURRENT_MONTH < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);

        (function (id, severalYears) {
            $('#' + id).empty();
            let date = new Date();
            date.setMonth(date.getMonth() + 1);
            let year = date.getFullYear();

            for (let i = year - 2; i < year + severalYears; i++) {
                $('#' + id).append(new Option(i + '년', i));
            }
            $('#' + id).val(CURRENT_YEAR).prop('selected', true);
        })('TARGET_AMOUNT_REGISTER_YEAR', 3);


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
            {title: '예상금액', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT'},
            {title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'DT_GOAL_AMT'},
            {title: '달성비율', maxWidth: 50, dataIndx: 'GOAL_RATIO'},
            {title: '기준근무', maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'WORKING_TIME'},
            {
                title: '부적합', align: 'center', colModel: [
                    {title: '품수', maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_CNT'},
                    {title: '수량', maxWidth: 50, dataType: 'integer', format: '#,###', dataIndx: 'ERROR_QTY'}
                ]
            },
            {
                title: '비고', dataIndx: 'NOTE', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
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
            complete: function (event, ui) {
                const data = $dailyProcessStatusLeftGrid.pqGrid('option', 'dataModel.data');

                if (data.length > 0) {
                    $dailyProcessStatusLeftGrid.pqGrid('setSelection', {rowIndx: 0});
                }
            },
            rowSelect: function (event, ui) {
                if (!(ui.addList[0].rowData.CAL_DT_NM === '합계' || ui.addList[0].rowData.CAL_DT_NM === '총계')) {
                    const rowData = ui.addList[0].rowData;
                    const dt = rowData.DT || null;
                    const workFactory = rowData.WORK_FACTORY || null;
                    $("#DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM").find("#DT").val(dt);
                    $("#DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM").find("#WORK_FACTORY").val(workFactory);
                    $dailyProcessStatusRightGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('DAILY_PROCESS_STATUS_RIGHT_SEARCH_FORM');
                    } );
                    $dailyProcessStatusRightGrid.pqGrid("refreshDataAndView");
                }
            },
            rowInit: function (ui) {
                if (ui.rowData.WEEK_DAY_NM === '일') {
                    return {style: {'color': 'red'}};
                }

                switch (ui.rowData.CAL_DT_NM) {
                    case '합계':
                        return {style: {'background': 'yellow'}};
                    case '총계':
                        return {style: {'background': '#FFE699'}};
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
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '', minWidth: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
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
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 25, dataType: 'integer', format: '#,###', dataIndx: 'PART_NUM'},
            {title: '가공<br>납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '발주량', dataIndx: 'PART_QTY'},
            {title: '가공완료<br>일시', width: 80, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '소요<br>시간', dataIndx: 'WORK_TIME'},
            {
                title: '예상단가', dataType: 'integer', format: '#,###', dataIndx: 'FORECAST_UNIT_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {title: '합계금액', dataIndx: 'TOTAL_AMT'},
            {
                title: 'P/H', dataType: 'integer', format: '#,###', dataIndx: 'PRICE_PER_HOUR',
                style: {'color': 'blue'}
            },
            {
                title: '단가정보', align: 'center', colModel: [
                    {title: '종전가', dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT', hidden: true},
                    {title: '견적가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', hidden: true},
                    {title: '공급가', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', hidden: true}
                ]
            },
            {
                title: '검사결과', align: 'center', colModel: [
                    {title: '등급', dataIndx: 'INSPECT_GRADE_NM'},
                    {title: '검사코드', dataIndx: 'INSPECT_RESULT_NM'}
                ]
            },
            {title: '부적합<br>수량', dataIndx: 'ERROR_QTY'},
            {
                title: '비고', dataIndx: 'NOTE', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const rightObj = {
            height: '94%',
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: rightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: rightPostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        const targetAmountRegisterGridId = 'TARGET_AMOUNT_REGISTER_GRID';
        let targetAmountRegisterPostData = fnFormToJsonArrayData('#TARGET_AMOUNT_REGISTER_FORM');
        const targetAmountRegisterColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '대상년월', dataIndx: 'YYYYMM'},
            {title: '대상공장', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '대상공장', dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'GOAL_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const targetAmountObj = {
            height: 365,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: targetAmountRegisterColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: targetAmountRegisterPostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
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

        const $dailyProcessStatusLeftGrid = $('#' + leftGridId).pqGrid(leftObj);
        const $dailyProcessStatusRightGrid = $('#' + rightGridId).pqGrid(rightObj);
        let $targetAmountRegisterGrid;
        /* init */

        /* function */
        const changeViewColumn = function (checked) {
            const $dailyProcessStatusRightGridInstance = $dailyProcessStatusRightGrid.pqGrid('getInstance').grid;
            const Cols = $dailyProcessStatusRightGridInstance.Columns();
            const array = ['PREV_UNIT_FINAL_AMT','UNIT_FINAL_EST_AMT','UNIT_FINAL_AMT'];
            const parameter = checked ? 'diShow' : 'diHide';
            Cols.hide({[parameter]: array});
        };
        /* function */

        /* event */
        $('#DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM').on('change', function () {
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

            fnModifyPQGrid($dailyProcessStatusRightGrid, [], updateQueryList);
        });
        $('#VIEW_UNIT_PRICE_INFORMATION').on('click', function () {
            changeViewColumn(this.checked);
        });

        $('#TARGET_AMOUNT_REGISTER_POPUP').on({
            'show.bs.modal': function () {
                $targetAmountRegisterGrid = $('#' + targetAmountRegisterGridId).pqGrid(targetAmountObj);
            },
            'hide.bs.modal': function () {
                $targetAmountRegisterGrid.pqGrid('destroy');
            }
        });
        
        $('[name=TARGET_AMOUNT_REGISTER_CLOSE]').on('click', function () {
            $('#TARGET_AMOUNT_REGISTER_POPUP').modal('hide');
        });
        
        $('#TARGET_AMOUNT_REGISTER_FORM').on('change', function () {
            $targetAmountRegisterGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#TARGET_AMOUNT_REGISTER_FORM');
            });
            $targetAmountRegisterGrid.pqGrid('refreshDataAndView');
        });

        $('#DAILY_PROCESS_STATUS_TARGET_AMOUNT_SAVE').on('click', function () {
            const insertQueryList = ['reportMapper.createTargetAmount'];
            const updateQueryList = ['reportMapper.createTargetAmount'];

            fnModifyPQGrid($targetAmountRegisterGrid, insertQueryList, updateQueryList);
        });
        /* event */
    });
</script>