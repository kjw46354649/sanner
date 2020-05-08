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
            <div class="gubunWrap">
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
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="TAB1_SEARCH">검색</button>
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
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>

    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="NC_PERFORMANCE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectNcPerformanceHistoryList">
            <div class="gubunWrap">
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
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="TAB2_SEARCH">검색</button>
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
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
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
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '출고', dataType: 'string', dataIndx: 'CNFRH'},
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주요', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'CONTROL_PART_NUM'},
            {title: '소재종류<br>상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '수량', dataType: 'integer', dataIndx: 'PART_UNIT_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {
                title: 'NC Actual', align: 'center', colModel: [
                    {
                        title: 'Seq1', align: 'center', colModel: [
                            {title: 'Seq1', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq1', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq2', align: 'center', colModel: [
                            {title: 'Seq2', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq2', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq3', align: 'center', colModel: [
                            {title: 'Seq3', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq3', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq4', align: 'center', colModel: [
                            {title: 'Seq4', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq4', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {title: 'TOTAL', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '단위소요', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '밀링', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '선반', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '연마', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {title: '총<br>가공시간', dataType: 'integer', dataIndx: 'PART_STATUS_NM'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '작업<br>구분', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'Step', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '가공위치', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '작업내용', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '작업자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '파일', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '비고', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: 'Update', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {title: '이전위치', dataType: 'string', dataIndx: 'POP_PREV_POSITION'},
            {title: '가공<br>확정 일시', dataType: 'string', dataIndx: 'SATAUS_DT'},
            {title: '소재입고<br>일시', dataType: 'string', dataIndx: 'MATERIAL_INNER_DT'},
            {title: '비고 기록사항', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '판정', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '불량Code', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '원인', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '조치방안', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '작성일자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            }
        ];
        const tab1Obj = {
            height: 750,
            collapsible: false,
            resizable: true,
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
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ'},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ'},
            {title: 'MCT<br>공장 구분', dataType: 'string', dataIndx: 'FACTORY_AREA'},
            {title: 'NC명', dataType: 'string', dataIndx: 'NCMONG'},
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
            resizable: true,
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

        $('#TAB1_SEARCH').on('click', function () {
            tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM')
            $outsideCloseStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return tab1PostData;
            });
            $outsideCloseStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#TAB2_SEARCH').on('click', function () {
            tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM')
            $ncPerformanceHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return tab2PostData;
            });
            $ncPerformanceHistoryGrid.pqGrid('refreshDataAndView');
        });

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
