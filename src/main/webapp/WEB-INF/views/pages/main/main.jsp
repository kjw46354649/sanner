<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-18
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page main">
    <div class="leftWrap">
        <div class="topWrap" style="padding: 0 0;">
            <div class="searchWrap ">
                <div class="hWrap">
                    <form class="form-inline" id="operating_rate_and_operation_record_search_form" name="operating_rate_and_operation_record_search_form" role="form">
                        <input type="hidden" name="EQUIP_SEQ" id="EQUIP_SEQ" value="">
                        <div class="d-flex align-items-center">
                            <div>
<%--                                <span class="slt_wrap">--%>
<%--                                    <label class="label_50_p0" for="inquiry_target">조회대상</label>--%>
<%--                                    <select class="wd_70" id="inquiry_target" title="조회대상" style="width: 65px !important; padding-left: 5px;">--%>
<%--                                        <option value="process">가공수행</option>--%>
<%--&lt;%&ndash;                                        <option value="cam">CAM설계</option>&ndash;%&gt;--%>
<%--                                    </select>--%>
<%--                                </span>--%>
                                <span class="slt_wrap">
                                    <label class="label_50_p0" for="user_id" style="width: 40px !important;">작업자</label>
                                    <select class="wd_100" name="USER_ID" id="user_id" title="작업자" style="padding-left: 5px;"></select>
                                </span>
                                <span class="slt_wrap">
                                    <label class="label_50_p0" for="factory_area" style="width: 30px !important;">구역</label>
                                    <select class="wd_100" name="FACTORY_AREA" id="factory_area" style="padding-left: 5px;">
                                        <option value=""><spring:message
                                                code="com.form.top.all.option"/></option>
                                        <c:forEach var="code" items="${HighCode.H_1005}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <span class="slt_wrap">
                                    <label class="label_50_p0" for="user_id">집계일자</label>
                                    <span class="calendar_span">
                                        <input type="text" title="집계일자" name="BATCH_DT" id="main_aggregation_dt" readonly style="width: 100px; padding: 0 5px;">
                                        <button type="button" id="main_aggregation_dt_button" style="width: 24px;">달력선택</button>
                                    </span>
                                </span>
                            </div>
<%--                            <div class="ml-auto mr-10">--%>
<%--                                <button type="button" id="refresh_main_left"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button>--%>
<%--                            </div>--%>
                        </div>
                    </form>
                </div>
            </div>
<%--            <div class="chartWrap hWrap">--%>
<%--                <div class="card">--%>
<%--                    <div id="chart0"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="vGraph">
                <ul class="vGraph_ul">
                </ul>
            </div>
            <div class="tableWrap">
                <div id="grid1">
                    <div id="main_left_grid_1"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="main_left_grid_1_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>

                <div id="grid2" style="display: none;">
                    <div id="main_left_grid_2"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="main_left_grid_2_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
            </div>
        </div>
        <div class="noticeWrap">
            <div class="hWrap" style="height: 35px;">
                <h2>게시판</h2>
                <button class="view_all" id="dash_board_btn">전체보기&nbsp;&nbsp;&#62;</button>
            </div>
            <div class="conWrap list main_board_div">
            </div>
        </div>
    </div>
    <div class="rightWrap">
        <div class="tableWrap">
            <div class="hWrap">
                <form class="form-inline" id="main_master_search_form" name="main_master_search_form" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="main.selectMainTodayMCTList_new">
                    <div class="d-flex align-items-center">
                        <div>
                            <!-- <h2>가공 대상 List</h2> -->
                            <span class="slt_wrap ml-10">
                                <label class="label_50" for="work_factory">공장구분</label>
                                <select class="wd_70" name="WORK_FACTORY" id="work_factory" title="공장구분">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1014}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap ml-10">
                                <label class="label_50" for="work_status_type_1">진행상태</label>
                                <span class="radio_box">
                                    <input type="radio" name="WORK_STATUS_TYPE" id="work_status_type_1" value="1" checked><label for="work_status_type_1">가공전</label>
                                </span>
                                <span class="radio_box" style="margin-left: 0;">
                                    <input type="radio" name="WORK_STATUS_TYPE" id="work_status_type_2" value="2"><label for="work_status_type_2">가공중</label>
                                </span>
                                <span class="radio_box" style="margin-left: 0;">
                                    <input type="radio" name="WORK_STATUS_TYPE" id="work_status_type_3" value="3"><label for="work_status_type_3">가공완료</label>
                                </span>
                            </span>
                        </div>
                        <div class="ml-auto mr-10">
                            <span class="slt_wrap ml-10">
                                <input type="checkbox" name="ASSEMBLY_YN" id="assembly_yn" style="margin-right: 5px;" checked><label for="assembly_yn">조립제외</label>
                            </span>
                            <button type="button" id="refresh_main_right"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="conWrap">
                <div id="main_manager_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="main_master_total_records" style="color: #00b3ee">0</span>)
                </div>
                <%--                <img src="/resource/asset/images/common/img_table_sp.jpg" alt="테이블샘플">--%>
            </div>
        </div>
    </div>
</div>
<script>

    let $mainLeftGrid1;
    let mainLeftGrid1Id = 'main_left_grid_1';
    let $mainLeftGrid2;
    let mainLeftGrid2Id = 'main_left_grid_2';
    let $mainMasterGrid;
    let mainMasterGridId = 'main_manager_grid';
    let login_id = '${authUserInfo.USER_ID}';

    $(function () {
        'use strict';
        $('#operating_rate_and_operation_record_search_form').find('#main_aggregation_dt').datepicker({dateFormat: 'yy/mm/dd'});
        $('#operating_rate_and_operation_record_search_form').find('#main_aggregation_dt').datepicker('setDate', '-1D');

        fnCommCodeDatasourceSelectBoxCreate($('#operating_rate_and_operation_record_search_form').find('#user_id'), 'all', {
                'url': '/json-list',
                'data': {'queryId': 'dataSource.getUserList'}
            }, function () {
                $('#user_id').val(login_id).prop("selected",true);
        });

        const leftTopForm = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
        const leftColModel1 = [
            {title: '', dataIndx: 'MCT_WORK_SEQ', hidden: true},
            {title: '공정', dataIndx: 'PROCESS_TYPE_NM', minWidth: 40, width: 40},
            {title: '장비<br>번호', dataIndx: 'EQUIP_NM'},
            {
                title: '', dataIndx: '', minWidth: 25,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
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
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', width: 150, align: 'left'},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 85},
            {title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>'
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
            {title: '재질', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '작업<br>수량', dataIndx: 'FINISH_QTY'},
            {title: '불량<br>발생', dataIndx: 'ERROR_QTY'},
            {title: '검사<br>등급', dataIndx: 'LAST_INSPECT_NM'},
            {title: '작업자', dataIndx: 'WORK_USER_NM'},
            {title: '착수일시', dataIndx: 'WORK_START_DT', width: 75},
            {title: '완료일시', dataIndx: 'WORK_FINISH_DT', width: 75}
        ];
        const leftPostData1 = $.extend(true, {}, leftTopForm, {queryId: 'main.selectProcessHistoryList-main'});
        const leftObj1 = {
            height: 333,
            collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            selectionModel: { type: 'row', mode: 'single'},
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: leftColModel1,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: leftPostData1,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function () {
                const totalRecords = this.option('dataModel.data').length;
                $('#main_left_grid_1_total_records').html(totalRecords);
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
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ,Item.rowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
            },
            toolbar: false,
        };

        $mainLeftGrid1 = $('#' + mainLeftGrid1Id).pqGrid(leftObj1);

        const leftColModel2 = [
            {title: '', dataIndx: 'CAM_SEQ', hidden: true},
            {title: '실적등록<br>일시', dataIndx: 'FINISH_DT', width: 75},
            {title: '가공<br>납기', dataIndx: 'INNER_DUE_DT', width: 75},
            {
                title: '', dataIndx: '', minWidth: 25,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
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
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', width: 150, align: 'left'},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 85},
            {title: '수<br>량', dataIndx: 'PART_QTY'},
            {title: 'Step', dataIndx: 'STEP_SEQ'},
            {title: '위치', dataIndx: 'WORK_DIRECTION_NM'},
            {title: '작업자', dataIndx: ''},
            {title: '진행상태', dataIndx: ''},
            {
                title: '최근가공', align: 'center',
                colModel: [
                    {title: '공정', dataIndx: 'PROCESS_TYPE_NM'},
                    {title: '기기명', dataIndx: 'EQUIP_NM'}
                ]
            },
        ];
        const leftPostData2 = $.extend(true, {}, leftTopForm, {queryId: 'main.selectCamWorkHistoryList-main'});
        const leftObj2 = {
            height: 383,
            collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: leftColModel2,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: leftPostData2,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function () {
                const totalRecords = this.option('dataModel.data').length;
                $('#main_left_grid_2_total_records').html(totalRecords);
            },
            toolbar: false,
        };

        $mainLeftGrid2 = $('#' + mainLeftGrid2Id).pqGrid(leftObj2);

        let rightColModel = [
            {title: '가공확정', dataIndx: 'WORK_CONFIRM_DT', width: 75},
            {title: '긴급<br>보류', dataIndx: 'EMERGENCY_DELAY_NM',minWidth: 35, width: 35},
            {title: '불량<br>반품', dataIndx: 'ERROR_RETURN_NM',minWidth: 35, width: 35},
            {
                title: '가공<br>납기', dataIndx: 'INNER_DUE_DT',minWidth: 40, width: 40,
                render: function (ui) {
                    const rowData = ui.rowData
                    if (rowData.DELAY_YN === 'Y') {
                        return {style: 'background-color: #ffff00;'};
                    }
                }
            },
            {title: '공장<br>구분', dataIndx: 'WORK_FACTORY_NM',minWidth: 45, width: 45},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM', width: 70},
            {title: '발주업체', dataIndx: 'ORDER_COMP_NM', width: 60},
            {
                title: '', dataIndx: '', minWidth: 25,
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
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
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', minWidth: 150, align: 'left'},
            {title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>'
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
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', width: 45, minWidth: 45},
            {title: '수량<br>추가', dataIndx: 'ADDITIONAL_QTY', dataType: 'integer', format: '#,###', minWidth: 35, width: 35},
            {title: '발주<br>수량', dataIndx: 'PART_QTY', dataType: 'integer', format: '#,###', minWidth: 40, width: 40},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 85},
            {title: '현재위치', dataIndx: 'POP_POSITION_NM', width: 60},
            {title: '비고', dataIndx: 'NOTE', minWidth: 105, align: 'left'},
            {
                title: '재고충당', align: 'center',
                colModel: [
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_REQUEST_QTY', width: 40, minWidth: 40},
                    {title: '불출', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_OUT_QTY', width: 40, minWidth: 40}
                ]
            }
        ];

        const rightObj = {
            height: 814,
            selectionModel: { type: 'row', mode: 'single'},
            collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: rightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('main_master_search_form'),
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function () {
                const totalRecords = this.option('dataModel.data').length;
                $('#main_master_total_records').html(totalRecords);
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
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ,Item.rowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
            },
            toolbar: false,
        };
        $mainMasterGrid = $('#' + mainMasterGridId).pqGrid(rightObj);

        const gaugeOptions = {
            chart: {
                width: 120,
                height: 80,
                type: 'solidgauge'
            },
            title: {
                margin: 0,
                style: {
                    fontSize: '1rem'
                },
                // verticalAlign: 'bottom',
            },
            credits: {
                enabled: false
            },
            pane: {
                center: ['50%', '85%'],
                size: '160%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor:
                        Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },
            exporting: {
                enabled: false
            },
            tooltip: {
                enabled: false,
                // valueSuffix: ' %'
            },
            // the value axis
            yAxis: {
                min: 0,
                max: 100,
                stops: [
                    [0.1, '#55BF3B'], // green
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#DF5353'] // red
                ],
                lineWidth: 0,
                tickWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    enabled: false
                    // y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        // y: 5,
                        // borderWidth: 0,
                        // useHTML: true
                    }
                }
            }
        };

        const removeChartWrap = function () {
            // $('.chartWrap').empty();
            $('.vGraph_ul').empty();
        };

        const refreshChart = function (data) {
            for (let i = 0; i < data.list.length; i++) {
                const rowData = data.list[i];
                // createChartElement(i);
                // createChart(rowData, i);
                var spanClass = "down75";
                if(rowData.REAL_RATIO > 75) {
                    spanClass = "over75";
                }
                var tempRatio = rowData.REAL_RATIO
                var top = 100 - tempRatio;;
                if(tempRatio >= 100 ) {
                    tempRatio = 100;
                    top = 100 - tempRatio;
                }else if(tempRatio < 14) {
                    top = 88;
                }
                var html = '<li><div style="height: 125px;width:100%;border: 1px solid #6c6262;margin: 0px 0px 5px 0px;cursor: pointer;" class="div_graph" data-value="' +((typeof rowData.EQUIP_SEQ != 'undefined' && rowData.EQUIP_SEQ != null)?rowData.EQUIP_SEQ:'')+ '">';
                html += '<span class="gBar" style="height:' + tempRatio + '%;top:'+(top) + '%';
                if(rowData.EQUIP_NM.toLowerCase() == 'average') {
                    html += ';background:#4a8de3';
                }
                html += ';">';
                html += '<span class="'+spanClass+'">'+ rowData.REAL_RATIO +'%</span></span></div>';
                html += '<div style="height: 35px;"><span style="font-weight: bold;font-size: 13px;color: #000000;position: relative;">' + rowData.EQUIP_NM ;
                html += '</span></div></li>';
                $(".vGraph_ul").append(html);
                // $(".vGraph_ul").append('<li><span class="gTerm">' + rowData.EQUIP_NM + '</span><span class="gBar" style="height:' + tempRatio +'%"><span class="'+spanClass+'">'+ rowData.REAL_RATIO +'%</span></span></li>')
            }
        };
        const createChartElement = function (index) {
            const $charWrap = $('.chartWrap');
            const valueElement = $('<div class="card"><div id="' + 'chart' + index + '"></div></div>');
            $charWrap.append(valueElement);
        };
        function clickGraph() {
            console.log($(this))
        }

        const createChart = function (rowData, index) {
            Highcharts.chart('chart' + index, Highcharts.merge(gaugeOptions, {
                title: {
                    text: rowData.EQUIP_NM
                },
                series: [{
                    name: rowData.EQUIP_NM,
                    data: [rowData.REAL_RATIO],
                    dataLabels: {
                        format:
                            '<div style="text-align:center">' +
                            '<span>{y}</span>' +
                            '<span>%</span>' +
                            '</div>'
                    },
                }]
            }));
        };

        const loadChartDataList = function () {
            const postData = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
            postData.queryId = 'main.selectOperatingRateChart'
            const parameter = {'url': '/json-list', 'data': postData}

            fnPostAjax(function (data) {
                removeChartWrap();

                if (Array.isArray(data.list) && data.list.length > 0) {
                    refreshChart(data);
                }
           }, parameter, '');
        };
        loadChartDataList();

        const getBoardList = function () {
            const parameter = {'url': '/json-list', 'data': {
                    'queryId':'main.selectBoardListForMain'
                }
            };

            fnPostAjax(function (data) {
                if(data.list.length > 0) {
                    $.each(data.list, function (idx,Item) {
                        var board = '<ul class="board_ul"><li>';
                        board += '<a href="/dashBoard/'+Item.BOARD_SEQ +'"';
                        board += 'onclick="window.open(this.href,';
                        board += "'_blank',"
                        board += "'width=1100px,height=610px'); return false;" + '">';
                        board += '<div class="rowList">';
                        board += '<span class="leftText list_title">' + Item.BOARD_TITLE + '</span>';
                        board += '<span class="rightText list_date">' + Item.INSERT_DT + '</span>';
                        board += '</div>';
                        board += '<div class="rowList">';
                        board += '<span class="leftText list_text ellipsis"></span>';
                        board += '<span class="rightText list_write">작성자 : <b>'+ Item.INSERT_ID +'</b></span>';
                        board += '</div>';
                        board += '</a>';
                        board += '</li></ul>';

                        $(".main_board_div").append(board);
                    })
                }else {
                    var html = '<div style="font-size: 20px;margin-top: 7px;margin-bottom: 10px;text-align: center;height: 204px;border: 1px solid #d9d9d9;border-radius: 8px;box-shadow: 1px 1px #999999;">';
                    html += '<span style="line-height: 204px;">No Data<span></span></span></div>';
                    $(".main_board_div").append(html);
                }
            }, parameter, '');
        }
        getBoardList();

        const loadLeftGrid = function () {
            const $form = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
            const leftPostData1 = $.extend(true, {}, $form, {queryId: 'main.selectProcessHistoryList-main'});
            // const leftPostData2 = $.extend(true, {}, $form, {queryId: 'main.selectCamWorkHistoryList-main'});

            $mainLeftGrid1.pqGrid('option', 'dataModel.postData', function () {
                return leftPostData1;
            });
            $mainLeftGrid1.pqGrid('refreshDataAndView');


            // $mainLeftGrid2.pqGrid('option', 'dataModel.postData', function () {
            //     return leftPostData2;
            // });
            // $mainLeftGrid2.pqGrid('refreshDataAndView');
        };

        const refreshLeft = function () {
            loadChartDataList();
            loadLeftGrid();
        };

        const refreshRight = function () {
            $mainMasterGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#main_master_search_form'));
            });
            $mainMasterGrid.pqGrid('refreshDataAndView');
        };

        $('#operating_rate_and_operation_record_search_form').on('change', function () {
            $("#operating_rate_and_operation_record_search_form").find("#EQUIP_SEQ").val("");
            refreshLeft();
        });

        $('#main_master_search_form').on('change', function () {
            refreshRight();
        });

        $('#refresh_main_left').on('click', function () {
            refreshLeft();
        });

        $('#refresh_main_right').on('click', function () {
            refreshRight();
        });

        // $('#inquiry_target').on('change', function () {
        //     switch (this.value) {
        //         case 'process':
        //             $('.page.main #grid1').show();
        //             $('.page.main #grid2').hide();
        //             break;
        //         case 'cam':
        //             $('.page.main #grid1').hide();
        //             $('.page.main #grid2').show();
        //             break;
        //     }
        // });

        $('#main_aggregation_dt_button').on('click', function () {
            $('#main_aggregation_dt').focus();
        });

        $('#dash_board_btn').on('click', function () {
            window.open('/dashBoard','','width=1100px,height=610px');
        });
    });
    $(document).ready(function(){
        $(document).on("click",".div_graph",function(e){
            $(".gBar").removeClass("select_graph");
            $(this).find(".gBar").addClass("select_graph");
            var equipSeq = $(this).data('value');
            $("#operating_rate_and_operation_record_search_form").find("#EQUIP_SEQ").val(equipSeq);

            const $form = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
            const leftPostData1 = $.extend(true, {}, $form, {queryId: 'main.selectProcessHistoryList-main'});
            // const leftPostData2 = $.extend(true, {}, $form, {queryId: 'main.selectCamWorkHistoryList-main'});

            $('#main_left_grid_1').pqGrid('option', 'dataModel.postData', function () {
                return leftPostData1;
            });
            $('#main_left_grid_1').pqGrid('refreshDataAndView');
        })
    });

</script>