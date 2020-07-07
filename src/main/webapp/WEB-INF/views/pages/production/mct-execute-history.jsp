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

<div class="page estimate mct_execute_history">
    <div class="topWrap">
        <form class="form-inline" id="CAM_WORK_HISTORY_GRID_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectCamWorkHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">MCT 공장 구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1005}">
                                    <c:if test="${code.ETC2 == 'W'}">
                                       <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">NC NO.</label>
                            <select class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">소재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
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
                            <label class="label_100" for="CLOSE_VER">규격</label>
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
                                <option value="1" selected="selected">수정일시</option>
                                <option value="2">가공확정일시</option>
                            </select>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_nc_execute_history_start_dt" id="mct_nc_execute_history_start_dt"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_nc_execute_history_end_dt" id="mct_nc_execute_history_end_dt" readonly><button type="button">달력선택</button>
                            </span>
                            <%--<span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>--%>
                        </div>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_USER_ID">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
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
                            <select class="wd_200" name="FACTORY_AREA" id="FACTORY_AREA" title="공장구분">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1005}">
                                    <c:if test="${code.ETC2 == 'W'}">
                                       <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">NC NO.</label>
                            <select class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ">
                                <option value="">전체</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">소재종류</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">형태</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">전체</option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
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
                            <label class="label_100" for="CLOSE_VER">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
                                <option value="">전체</option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mg-right10">
                            <label class="label_100" for="CLOSE_VER">작업일시</label>
                            <%--<select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>--%>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_dw_execute_history_start_dt" id="mct_dw_execute_history_start_dt"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="mct_dw_execute_history_end_dt" id="mct_dw_execute_history_end_dt" readonly><button type="button">달력선택</button>
                            </span>
<%--                            <span class="chk_box"><input id="CONTROL_MANAGE_DATE" type="checkbox"><label for="CONTROL_MANAGE_DATE">선택</label></span>--%>
                        </div>
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
                <div class="d-inline right_float" id="CAM_WORK_HISTORY_BOX" style="font-weight: normal;">
                    <input type="text" id="camWorkHistoryFilterKeyword" placeholder="Enter your keyword">
                    <select id="camWorkHistoryFilterColumn"></select>
                    <select id="camWorkHistoryFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="camWorkHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="camWorkHistoryFrozen" name="camWorkHistoryFrozen">
                    </select>
                </div>
                <div class="d-inline right_float" id="NC_PERFORMANCE_HISTORY_BOX" style="display: none; font-weight: normal;">
                    <input type="text" id="ncPerformanceHistoryFilterKeyword" placeholder="Enter your keyword">
                    <select id="ncPerformanceHistoryFilterColumn"></select>
                    <select id="ncPerformanceHistoryFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="ncPerformanceHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="ncPerformanceHistoryFrozen" name="ncPerformanceHistoryFrozen">
                    </select>
                </div>
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
        /** function **/
        fnCommCodeDatasourceSelectBoxCreate($('#NC_PERFORMANCE_HISTORY_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#NC_PERFORMANCE_HISTORY_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CAM_WORK_HISTORY_GRID_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });

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
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '가공<br>납기', minWidth: 15, width: 40, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '가공<br>완료', dataType: 'string', dataIndx: 'CNFRH'},
            {title: '긴<br>급', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주요<br>검사', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_NUM_BUTTON', width: 25, minWidth: 25, editable: false,
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
            {title: '관리번호', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM', styleHead: {'color': 'red'}},
            {title: '파<br>트', dataType: 'integer', dataIndx: 'CONTROL_PART_NUM', styleHead: {'color': 'red'}},
            {title: '', dataType: 'string', dataIndx: 'WhatIsThis'},
            {title: '소재종류<br>상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE'},
            {
                title: 'NC Actual', align: 'center', colModel: [
                    {title: 'Seq.1', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_1'},
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_1'},
                    {title: 'Seq.2', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_2'},
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_2'},
                    {title: 'Seq.3', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_3'},
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_3'},
                    {title: 'Seq.4', minWidth: 15, width: 40, datatype: 'integer', dataIndx: 'EQUIP_SEQ_4'},
                    {title: 'W/T', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'WORKING_TIME_4'},
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
                    {title: '위치', datatype: 'string', dataIndx: 'WORK_DIRECTION'},
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
                    {title: '비고 및 공유사항',  minWidth: 100, width: 150, datatype: 'string', dataIndx: 'NOTE'},
                    {title: 'Update', minWidth: 75, width: 75, datatype: 'string', dataIndx: 'CAM_FINISH_DT'}
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
            height: 720,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: false},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center',  editable: false, render: camWorkHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: tab1ColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROWNUM',
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
                $("#camWorkHistoryFilterColumn").empty();
                $("#camWorkHistoryFilterColumn").html(filterOpts);
                $("#camWorkHistoryFrozen").empty();
                $("#camWorkHistoryFrozen").html(frozenOts);
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
            {title: 'MCT<br>공장 구분', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: 'NC명', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', minWidth: 20, width: 180, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 20, width: 20, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
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
            {title: '도면번호', minWidth: 20, width: 170, dataType: 'string', dataIndx: 'DRAWING_NUM'},
            {title: '품명', minWidth: 20, width: 170, dataType: 'string', dataIndx: 'ITEM_NM'},
            {title: '형태', minWidth: 20, width: 50, dataType: 'string', dataIndx: 'WORK_TYPE_NM'},
            {title: '소재종류', minWidth: 20, width: 60, dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '수량', minWidth: 20, width: 50, align: 'right', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '규격', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE'},
            {title: '착수일시', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'WORK_START_DT'},
            {title: '완료일시', minWidth: 20, width: 120, dataType: 'string', dataIndx: 'WORK_FINISH_DT'},
            {title: '정지<br>시간', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'WORK_STOP_MINUTE'},
            {title: '소요<br>시간', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'WORK_WORK_MINUTE'},
            {title: '단위<br>소요', minWidth: 20, width: 70, align: 'right', dataType: 'string', dataIndx: 'LEAD_TIME'},
            {title: '작업자', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'WORK_USER_ID'}
        ];
        let tab2Obj = {
            height: 720,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: false},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false, render: ncPerformanceHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: tab2ColModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROWNUM',
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
                $("#ncPerformanceHistoryFilterColumn").empty();
                $("#ncPerformanceHistoryFilterColumn").html(filterOpts);
                $("#ncPerformanceHistoryFrozen").empty();
                $("#ncPerformanceHistoryFrozen").html(frozenOts);
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

        function camWorkHistoryFilterRender(ui) {
            var val = ui.cellData == undefined ? "" : ui.cellData,
                filter = ui.column.filter,
                crules = (filter || {}).crules;

            if (filter && filter.on && crules && crules[0].value) {
                var condition = $("#camWorkHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#camWorkHistoryFilterKeyword").val(),
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
                if (indx >= 0) {
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

        function ncPerformanceHistoryFilterRender(ui) {
            var val = ui.cellData == undefined ? "" : ui.cellData,
                filter = ui.column.filter,
                crules = (filter || {}).crules;

            if (filter && filter.on && crules && crules[0].value) {
                var condition = $("#ncPerformanceHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#ncPerformanceHistoryFilterKeyword").val(),
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
                if (indx >= 0) {
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

        $("#camWorkHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($camWorkHistoryGrid, 'camWorkHistoryFilterKeyword', 'camWorkHistoryFilterCondition', 'camWorkHistoryFilterColumn');
        });

        $("#camWorkHistoryFrozen").on('change', function(e){
            fnFrozenHandler($camWorkHistoryGrid, $(this).val());
        });

        $("#ncPerformanceHistoryFilterKeyword").on("keyup", function(e){
            fnFilterHandler($ncPerformanceHistoryGrid, 'ncPerformanceHistoryFilterKeyword', 'ncPerformanceHistoryFilterCondition', 'ncPerformanceHistoryFilterColumn');
        });

        $("#ncPerformanceHistoryFrozen").on('change', function(e){
            fnFrozenHandler($ncPerformanceHistoryGrid, $(this).val());
        });
        
        $('#MCT_EXECUTE_HISTORY_TAB').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('.topWrap').toggle(); // show -> hide , hide -> show
                $("#CAM_WORK_HISTORY_BOX").toggle();
                $("#NC_PERFORMANCE_HISTORY_BOX").toggle();

                // $('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
                // $('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
            }
        });
        /* init */
    });
</script>
