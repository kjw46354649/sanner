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
        <form class="form-inline" id="PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectNcPerformanceHistoryList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="FACTORY_AREA">MCT 공장 구분</label>
                            <select class="wd_200" name="FACTORY_AREA" id="FACTORY_AREA" title="공장구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
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
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select class="wd_200" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">형태</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_USER_ID">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap trans_slt mr-10">
                            <label class="label_100">작업일시</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" name="process_fulfillment_history_start_dt" id="process_fulfillment_history_start_dt"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="process_fulfillment_history_end_dt" id="process_fulfillment_history_end_dt" readonly><button type="button">달력선택</button>
                            </span>
                        </div>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="NC_PERFORMANCE_HISTORY_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="PROCESS_FULFILLMENT_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="processFulfillmentHistoryFilterKeyword" placeholder="Enter your keyword">
                <select id="processFulfillmentHistoryFilterColumn"></select>
                <select id="processFulfillmentHistoryFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="processFulfillmentHistoryFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="processFulfillmentHistoryFrozen" name="processFulfillmentHistoryFrozen">
                </select>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="NC_PERFORMANCE_HISTORY_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="PROCESS_FULFILLMENT_HISTORY_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        $('#process_fulfillment_history_start_dt').datepicker({dateFormat: 'yy/mm/dd'});
        $('#process_fulfillment_history_end_dt').datepicker({dateFormat: 'yy/mm/dd'});
        $('#process_fulfillment_history_start_dt').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 7));
        $('#process_fulfillment_history_end_dt').datepicker('setDate', 'today');

        /** function **/
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMctEquipList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });

        /* variable */
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $processFulfillmentHistoryGrid;
        const tab2GridId = 'NC_PERFORMANCE_HISTORY_GRID';
        let tab2PostData = fnFormToJsonArrayData('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT<br>공장 구분', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: 'NC명', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '관리번호', minWidth: 20, width: 180, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 20, width: 20, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
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
            {title: '정지<br>시간', minWidth: 50, width: 55, align: 'right', dataType: 'string', dataIndx: 'WORK_STOP_MINUTE'},
            {title: '소요<br>시간', minWidth: 50, width: 55, align: 'right', dataType: 'string', dataIndx: 'WORK_WORK_MINUTE'},
            {title: '단위<br>소요', minWidth: 50, width: 55, align: 'right', dataType: 'string', dataIndx: 'LEAD_TIME'},
            {title: '작업자', minWidth: 20, width: 80, dataType: 'string', dataIndx: 'WORK_USER_ID'}
        ];
        let tab2Obj = {
            height: 700,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: false},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false, render: processFulfillmentHistoryFilterRender}, filterModel: { mode: 'OR' },
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
                $("#processFulfillmentHistoryFilterColumn").empty();
                $("#processFulfillmentHistoryFilterColumn").html(filterOpts);
                $("#processFulfillmentHistoryFrozen").empty();
                $("#processFulfillmentHistoryFrozen").html(frozenOts);
            },
            complete: function (event, ui) {
                let data = this.option('dataModel.data');

                $('#PROCESS_FULFILLMENT_HISTORY_RECORDS').html(data.length);
            }
        };
        /* variable */

        /* function */
        function processFulfillmentHistoryFilterRender(ui) {
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
                var condition = $("#processFulfillmentHistoryFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#processFulfillmentHistoryFilterKeyword").val(),
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
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
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
        $('#PROCESS_FULFILLMENT_HISTORY_SEARCH').on('click', function () {
            $processFulfillmentHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM');
            });
            $processFulfillmentHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#NC_PERFORMANCE_HISTORY_EXCEL_EXPORT').on('click', function () {
            const blob = $processFulfillmentHistoryGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, 'NC 수행 이력.xlsx');
        });
        /* event */

        /* init */
        $processFulfillmentHistoryGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

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

        $('#processFulfillmentHistoryFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($processFulfillmentHistoryGrid, 'processFulfillmentHistoryFilterKeyword', 'processFulfillmentHistoryFilterCondition', 'processFulfillmentHistoryFilterColumn');

                let data = $processFulfillmentHistoryGrid.option('dataModel.data');
                $('#PROCESS_FULFILLMENT_HISTORY_RECORDS').html(data.length);
            },
            'search': function () {
                fnFilterHandler($processFulfillmentHistoryGrid, 'processFulfillmentHistoryFilterKeyword', 'processFulfillmentHistoryFilterCondition', 'processFulfillmentHistoryFilterColumn');

                let data = $processFulfillmentHistoryGrid.option('dataModel.data');
                $('#PROCESS_FULFILLMENT_HISTORY_RECORDS').html(data.length);
            }
        });

        $("#processFulfillmentHistoryFrozen").on('change', function(e){
            fnFrozenHandler($processFulfillmentHistoryGrid, $(this).val());
        });

        $(".datepicker-input").each(function () {
            $(this).datepicker({
                dateFormat: 'yy/mm/dd',
            });
            $(this).datepicker('setDate', 'today');
        });

        /* init */
    });
</script>
