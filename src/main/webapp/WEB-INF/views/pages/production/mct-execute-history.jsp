<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-05-08
  Time: 오전 9:09
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
        <form class="form-inline" id="CAM_WORK_HISTORY_GRID_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectCamWorkHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">MCT 공장 구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">NC NO.</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">자재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CLOSE_NOTE">후처리</label>
                            <input type="text" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200"name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">자재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">형태</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_1" value="today" checked><label for="fr_1001_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_2" value="current_month"><label for="fr_1001_2">현재월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_3" value="three_months"><label for="fr_1001_3">3개월</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_END_DATE" id="CONTROL_MANAGE_END_DATE" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>
                        </div>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">작업자</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="CAM_WORK_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="NC_PERFORMANCE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectNcPerformanceHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">MCT 공장 구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">NC NO.</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">자재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CLOSE_NOTE">후처리</label>
                            <input type="text" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="label_200"name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="label_200"name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">자재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">형태</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_1" value="today" checked><label for="fr_1001_1">3개월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_2" value="current_month"><label for="fr_1001_2">1개월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_3" value="three_months"><label for="fr_1001_3">오늘</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_START_DATE" id="CONTROL_MANAGE_START_DATE"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="CONTROL_MANAGE_END_DATE" id="CONTROL_MANAGE_END_DATE" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>
                        </div>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">작업자</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                            </select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="NC_PERFORMANCE_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="MCT_EXECUTE_HISTORY_TAB" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CAM_WORK_HISTORY" data-toggle="tab" aria-expanded="true">CAM 작업이력</a>
                </li>
                <li>
                    <a href="#NC_PERFORMANCE_HISTORY" data-toggle="tab" aria-expanded="false">NC수행 이력</a>
                </li>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="CAM_WORK_HISTORY">
                    <div id="CAM_WORK_HISTORY_GRID"></div>
                </ul>
                <ul class="conWrap" id="NC_PERFORMANCE_HISTORY">
                    <div id="NC_PERFORMANCE_HISTORY_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $camWorkHistoryGrid;
        const tab1GridId = 'CAM_WORK_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = MONTH;

        const tab1ColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ'},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ'},
            {title: '납기', minWidth: 15, width: 40, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '출고', dataType: 'string', dataIndx: 'CNFRH'},
            {title: '긴<br>급', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형<br>태', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_NUM_BUTTON'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'CONTROL_PART_NUM'},
            {title: '', dataType: 'string', dataIndx: 'WhatIsThis'},
            {title: '소재종류<br>상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE'},
            {
                title: 'NC Actual', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {title: 'Seq.1', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_1', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_1;
                            let backgroundColor = colorClassification(status);

                            // if (status) {
                            //     $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            // }

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', { rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_1', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_1;
                            let backgroundColor = colorClassification(status);

                            /*if (status) {
                                return $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }*/

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {
                                    rowIndx: ui.rowIndx,
                                    dataIndx: ui.dataIndx,
                                    cls: backgroundColor
                                });

                                return cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_1', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_1', hidden: true},
                    {title: 'Seq.2', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_2', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_2;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_2', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_2;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                return cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_2', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_2', hidden: true},
                    {title: 'Seq.3', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_3', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_3;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_3', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_3;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                return cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_3', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_3', hidden: true},
                    {title: 'Seq.4', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_4', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_4;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_4', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_4;
                            let backgroundColor = colorClassification(status);

                            if (cellData) {
                                $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                return cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_4', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_4', hidden: true},
                    {title: 'TOTAL', datatype: 'integer', dataIndx: 'MCT_WORK_TIME'},
                    {title: '단위소요', datatype: 'integer', dataIndx: 'UNIT_LEAD_TIME'}
                ]
            },
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'string', dataIndx: 'PROCESS_PROGRESS_NC'},
                    {title: '밀링', datatype: 'string', dataIndx: 'PROCESS_PROGRESS_MILLING'},
                    {title: '선반', datatype: 'string', dataIndx: 'PROCESS_PROGRESS_RACK'},
                    {title: '연마', datatype: 'string', dataIndx: 'PROCESS_PROGRESS_GRINDING'},
                ]
            },
            {title: '총<br>가공시간', dataType: 'integer', dataIndx: 'MCT_WORK_TIME'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '작업<br>구분', dataType: 'string', dataIndx: 'MCT_WORK_TYPE_NM'},
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'step', minWidth: 30, width: 35, datatype: 'integer', dataIndx: 'CAM_STEP'},
                    {title: '가공위치', minWidth: 30, width: 50, datatype: 'string', dataIndx: 'WORK_DIRECTION'},
                    {title: '작업내용', minWidth: 30, width: 80, datatype: 'string', dataIndx: 'WORK_DESC'},
                    {title: '작업자', minWidth: 30, width: 100, datatype: 'string', dataIndx: 'WORK_USER_ID'},
                    {title: '파일', minWidth: 30, width: 60, datatype: 'string', dataIndx: '',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let iconFiles = '';
                            if(rowData.CAM_FILE_SEQ) iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="cursor: pointer; margin-left:3px;"></span>&nbsp;&nbsp;';
                            if(rowData.NC_FILE_SEQ) iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="cursor: pointer; margin-left:25px;"></span>';
                            return iconFiles;
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('#downloadCAMFIle').bind('click', function(e) {
                                console.log(rowData.CAM_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                console.log(rowData.NC_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },
                    {title: '비고',  minWidth: 100, width: 150, datatype: 'string', dataIndx: 'NOTE'},
                    {title: '업데이트', minWidth: 75, width: 75, datatype: 'string', dataIndx: 'CAM_FINISH_DT'}
                ]
            },
            {title: '이전<br>위치', minWidth: 70, width: 70, dataType: 'string', dataIndx: 'POP_PREV_POSITION'},
            {title: '가공<br>확정 일시', minWidth: 75, width: 75, dataType: 'string', dataIndx: 'SATAUS_DT'},
            {title: '소재입고<br>일시', minWidth: 75, width: 75, dataType: 'string', dataIndx: 'MATERIAL_RECEIPT_DT'},
            {title: '비고 기록사항', minWidth: 100, width: 150, dataType: 'string', dataIndx: 'MATERIAL_DETAIL'}, //TODO: 확인필요
            {
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq.', minWidth: 30, width: 35, datatype: 'integer', dataIndx: 'INSPECT_STEP'},
                    {title: '판정', minWidth: 30, width: 35, datatype: 'string', dataIndx: 'INSPECT_GRADE'},
                    {title: '불량코드', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'INSPECT_RESULT'},
                    {title: '불량수량', minWidth: 20, width: 55, datatype: 'string', dataIndx: 'ERROR_QTY'},
                    {title: '불량원인', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'ERROR_REASON'},
                    {title: '조치방안', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'ERROR_NOTE'},
                    {title: '작성일자', minWidth: 75, width: 75, datatype: 'string', dataIndx: 'INSPECT_DT'}
                ]
            }
        ];
        const tab1Obj = {
            height: 750,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center',  editable: false},
            colModel: tab1ColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                this.flex();
            }
        };
        let $ncPerformanceHistoryGrid;
        const tab2GridId = 'NC_PERFORMANCE_HISTORY_GRID';
        let tab2PostData = fnFormToJsonArrayData('#NC_PERFORMANCE_HISTORY_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT<br>공장 구분', dataType: 'string', dataIndx: 'FACTORY_AREA'},
            {title: 'NC명', dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'CONTROL_PART_NUM'},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_TYPE'},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '소재분류', dataType: 'string', dataIndx: 'MATERIAL_KIND'},
            {title: '수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {
                title: '소재마감', align: 'center', colModel: [
                    {title: 'TM각비', datatype: 'string', dataIndx: 'MATERIAL_FINISH_TM'},
                    {title: '연마', datatype: 'string', dataIndx: 'MATERIAL_FINISH_GRIND'},
                    {title: '열처리', datatype: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'}
                ]
            },
            {title: '착수일시', dataType: 'string', dataIndx: 'WORK_START_DT'},
            {title: '완료일시', dataType: 'string', dataIndx: 'WORK_FINISH_DT'},
            {title: '정지<br>시간', dataType: 'string', dataIndx: 'WORK_STOP_DT'},
            {title: '소요<br>시간', dataType: 'string', dataIndx: 'LEAD_TIME'},
            {title: '단위<br>소요', dataType: 'string', dataIndx: 'UNIT_LEAD_TIME'},
            {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER_ID'}
        ];
        let tab2Obj = {
            height: 750,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: tab2ColModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        /* function */
        const colorClassification = function (status) {
            let backgroundColor = '';
            switch (status) {
                case '가동중':
                    backgroundColor = 'bg-green';
                    break;
                case '완료':
                    backgroundColor = 'bg-light_blue';
                    break;
                case '비가동상태':
                    backgroundColor = 'bg-yellow';
                    break;
                case '일시정지상태':
                    backgroundColor = 'bg-orange';
                    break;
            }
            return backgroundColor;
        };
        /* function */


        /* event */
        $('#CAM_WORK_HISTORY_SEARCH').on('click', function () {
            $camWorkHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#CAM_WORK_HISTORY_GRID_SEARCH_FORM');
            });
            $camWorkHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#NC_PERFORMANCE_HISTORY_SEARCH').on('click', function () {
            $ncPerformanceHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#NC_PERFORMANCE_HISTORY_SEARCH_FORM');
            });
            $ncPerformanceHistoryGrid.pqGrid('refreshDataAndView');
        });
        /* event */

        /* init */
        $camWorkHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $ncPerformanceHistoryGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('YEAR', 10);

        $('#CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_LEFT', this.value);
        });
        $('#CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT', this.value);
        });
        $('#RANGE_SEARCH').on('change', function (event) {
            if ($(this).prop('checked')) {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });


        $('#MCT_EXECUTE_HISTORY_TAB').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('.topWrap').toggle(); // show -> hide , hide -> show
                // $('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
                // $('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
            }
        });
        /* init */
    });
</script>
