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
                            <label class="label_100" for="FACTORY_AREA">Area 구분</label>
                            <select class="wd_200" name="FACTORY_AREA" id="FACTORY_AREA" title="Area 구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1005}">
<%--                                    <c:if test="${code.ETC2 == 'W'}">--%>
                                       <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
<%--                                    </c:if>--%>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="PROCESS_TYPE">공정</label>
                            <select  class="wd_200" name="PROCESS_TYPE" id="PROCESS_TYPE" title="공정">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1010}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_SEQ">가공기기</label>
                            <select class="wd_200" name="EQUIP_SEQ" id="EQUIP_SEQ">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM_OR_DRAWING_NUM">관리/도면 번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM_OR_DRAWING_NUM" id="CONTROL_NUM_OR_DRAWING_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_USER_ID">작업자</label>
                            <select class="wd_200" name="WORK_USER_ID" id="WORK_USER_ID">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SIZE_TYPE">규격</label>
                            <select class="wd_100" name="SIZE_TYPE" id="SIZE_TYPE" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="slt_wrap" id="SIZE_W">
                            <label class="label_8">W</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_H">
                            <label class="label_8">H</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_T">
                            <label class="label_8">T</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_D" style="display: none;">
                            <label class="label_8">D</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                        </span>
                        <span class="slt_wrap" id="SIZE_L" style="display: none;">
                            <label class="label_8">L</label>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_L_F" id="SIZE_L_F" placeholder="From" disabled>
                            <span class="nbsp">~</span>
                            <input class="wd_50 for_diabled" type="number" name="SIZE_L_T" id="SIZE_L_T" placeholder="To" disabled>
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
                            <span class="radio_box" style="margin-left:10px;">
                                <input reqcd="R" type="radio" name="PROCESS_FULFILLMENT_HISTORY_TERM" id="PROCESS_FULFILLMENT_HISTORY_TERM_DAY" value="today" ><label for="PROCESS_FULFILLMENT_HISTORY_TERM_DAY">오늘</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="PROCESS_FULFILLMENT_HISTORY_TERM" id="PROCESS_FULFILLMENT_HISTORY_TERM_WEEK" value="week" checked><label for="PROCESS_FULFILLMENT_HISTORY_TERM_WEEK">-1주</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="PROCESS_FULFILLMENT_HISTORY_TERM" id="PROCESS_FULFILLMENT_HISTORY_TERM_MONTH" value="month"><label for="PROCESS_FULFILLMENT_HISTORY_TERM_MONTH">-1개월</label>
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
        $('#process_fulfillment_history_start_dt').datepicker({dateFormat: 'yy/mm/dd', changeYear: true, changeMonth: true});
        $('#process_fulfillment_history_end_dt').datepicker({dateFormat: 'yy/mm/dd', changeYear: true, changeMonth: true});
        $('#process_fulfillment_history_start_dt').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 7));
        $('#process_fulfillment_history_end_dt').datepicker('setDate', 'today');

        /** function **/
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM').find('#WORK_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getMCTWorkerList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getProcessingMachineList'}
        });
        const EQUIP = (function () {
            let list = [];
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getEquipList'}};

            fnPostAjax(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, factoryArea: obj.FACTORY_AREA});
                }
            }, parameters, '');

            return list;
        })();

        /* variable */
        const YEAR = TODAY.getFullYear();
        // const MONTH = TODAY.getMonth() + 1;

        let $processFulfillmentHistoryGrid;
        const tab2GridId = 'NC_PERFORMANCE_HISTORY_GRID';
        let tab2PostData = fnFormToJsonArrayData('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'Area 구분', width: 80, dataIndx: 'FACTORY_AREA_NM'},
            {title: '공정', width: 50, dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비명', width: 50, dataIndx: 'EQUIP_NM'},
            {title: '작업자', width: 65, dataIndx: 'WORK_USER_NM'},
            {
                title: '가공 수행 실적', align: 'center',
                colModel: [
                    {title: '착수일시', width: 90, dataIndx: 'WORK_START_DT'},
                    {title: '완료일시', width: 90, dataIndx: 'WORK_FINISH_DT'},
                    {
                        title: '정지시간', width: 60, dataIndx: 'WORK_STOP_SECOND',
                        render: function (ui) {
                            const cellData = ui.cellData;
                            const min = Math.floor(cellData % 3600 / 60);
                            // console.log(cellData)

                            if (Math.abs(cellData) > 3600) {
                                const hour = Math.floor(cellData / 3600);

                                return hour + 'h ' + min + 'm';
                            } else {
                                return min + 'm';
                            }
                        }},
                    {
                        title: '총 R/T', width: 60, dataIndx: 'WORK_WORK_SECOND',
                        render: function (ui) {
                            const cellData = ui.cellData;
                            const min = Math.floor(cellData % 3600 / 60);

                            if (Math.abs(cellData) > 3600) {
                                const hour = Math.floor(cellData / 3600);

                                return hour + 'h ' + min + 'm';
                            } else {
                                return min + 'm';
                            }
                        }
                    },
                    {
                        title: '1EA R/T', dataType: 'integer', width: 60, dataIndx: 'LEAD_TIME',
                        render: function (ui) {
                            const cellData = ui.cellData;
                            const min = Math.floor(cellData % 3600 / 60);

                            if (Math.abs(cellData) > 3600) {
                                const hour = Math.floor(cellData / 3600);

                                return hour + 'h ' + min + 'm';
                            } else {
                                return min + 'm';
                            }
                        }
                    },
                    {title: '목표수량', width: 60, dataIndx: 'GOAL_QTY'},
                    {title: '완료수량', width: 60, dataIndx: 'FINISH_QTY'},
                    {title: '불량', width: 60, dataIndx: 'ERROR_QTY'},
                    {title: '불량내용', width: 100, dataIndx: 'ERROR_REASON_NM'},
                ]
            },
            {title: '작업지시번호', width: 180, align: 'left', dataIndx: 'CONTROL_NUM'},
            {
                title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '형태', width: 50, dataIndx: 'WORK_TYPE_NM'},
            {title: '가공<br>납기', minWidth: 40, dataIndx: 'INNER_DUE_DT'},
            {title: '도면번호', width: 170, align: 'left', dataIndx: 'DRAWING_NUM'},
            {
                title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '품명', width: 170, align: 'left', dataIndx: 'ITEM_NM'},
            {title: '재질', width: 50, dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재종류', width: 75, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '수량', width: 50, dataIndx: 'CONTROL_PART_QTY'},
            {title: '규격', width: 120, align: 'right', dataIndx: 'SIZE_TXT'},
            {title: '소재 Size', width: 120, align: 'right', dataIndx: 'MATERAIL_ORDER_SIZE'}
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
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: processFulfillmentHistoryFilterRender}, filterModel: { mode: 'OR' },
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
                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
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
        $('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchProcessFulFillment();
            }
        });

        $('#PROCESS_FULFILLMENT_HISTORY_SEARCH').on('click', function () {
            searchProcessFulFillment();
        });

        function searchProcessFulFillment() {
            $processFulfillmentHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM');
            });
            $processFulfillmentHistoryGrid.pqGrid('refreshDataAndView');
        }

        $('#NC_PERFORMANCE_HISTORY_EXCEL_EXPORT').on('click', function () {
            const blob = $processFulfillmentHistoryGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, 'NC 수행 이력.xlsx');
        });

        $("#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM").find('[name=PROCESS_FULFILLMENT_HISTORY_TERM]').change(function () {
            let value = $(this).val();
            let today = TODAY;
            let newDate = new Date();

            switch (value) {
                case 'today':
                    break;
                case 'week':
                    newDate.setDate(newDate.getDate() - 6);
                    break;
                case 'month':
                    newDate.setMonth(newDate.getMonth() - 1);
                    break;
            }
            $("#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM").find('#process_fulfillment_history_start_dt').val(newDate.yyyymmdd());
            $("#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM").find('#process_fulfillment_history_end_dt').val(today.yyyymmdd());
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM').find('#SIZE_TYPE').on('change', function () {
            const $processFulfillmentHistorySearchForm = $('#PROCESS_FULFILLMENT_HISTORY_SEARCH_FORM');
            $processFulfillmentHistorySearchForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($processFulfillmentHistorySearchForm,resetArr)
                    $processFulfillmentHistorySearchForm.find('#SIZE_W').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_H').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_T').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_D').hide();
                    $processFulfillmentHistorySearchForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($processFulfillmentHistorySearchForm,resetArr)
                    $processFulfillmentHistorySearchForm.find('#SIZE_W').hide();
                    $processFulfillmentHistorySearchForm.find('#SIZE_H').hide();
                    $processFulfillmentHistorySearchForm.find('#SIZE_T').hide();
                    $processFulfillmentHistorySearchForm.find('#SIZE_D').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_L').show();
                    break;
                default:
                    $processFulfillmentHistorySearchForm.find('#SIZE_W').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_H').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_T').show();
                    $processFulfillmentHistorySearchForm.find('#SIZE_D').hide();
                    $processFulfillmentHistorySearchForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($processFulfillmentHistorySearchForm,resetArr)
                    $processFulfillmentHistorySearchForm.find('.for_diabled').attr('disabled',true);
            }
        });

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
