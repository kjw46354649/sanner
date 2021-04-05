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
        <div class="topWrap">
            <div class="searchWrap ">
                <div class="hWrap">
                    <form class="form-inline" id="operating_rate_and_operation_record_search_form" name="operating_rate_and_operation_record_search_form" role="form">
                        <div class="d-flex align-items-center">
                            <div>
                                <span class="slt_wrap ml-10">
                                    <label class="label_50" for="inquiry_target">조회대상</label>
                                    <select class="wd_70" id="inquiry_target" title="조회대상">
                                        <option value="process">가공수행</option>
                                        <option value="cam">CAM설계</option>
                                    </select>
                                </span>
                                <span class="slt_wrap ml-10">
                                    <label class="label_50" for="user_id">작업자</label>
                                    <select class="wd_70" name="USER_ID" id="user_id" title="작업자"></select>
                                </span>
                                <span class="slt_wrap ml-10">
                                    <label class="label_50" for="factory_area">위치구분</label>
                                    <select class="wd_70" name="FACTORY_AREA" id="factory_area">
                                        <option value=""><spring:message
                                                code="com.form.top.all.option"/></option>
                                        <c:forEach var="code" items="${HighCode.H_1005}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <span class="calendar_span">
                                    <input type="text" title="집계일자" name="BATCH_DT" id="main_aggregation_dt" readonly>
                                    <button type="button" id="main_aggregation_dt_button">달력선택</button>
                                </span>
                            </div>
                            <div class="ml-auto mr-10">
                                <button type="button" id="refresh_main_left"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="chartWrap hWrap">
<%--                <div class="card">--%>
<%--                    <div id="chart0"></div>--%>
<%--                </div>--%>
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
            <div class="hWrap">
                <h2>게시판</h2>
                <a href="#a;" class="view_all">전체보기&nbsp;&nbsp;&#62;</a>
            </div>
            <div class="conWrap list">
                <ul>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="rightWrap">
        <div class="tableWrap">
            <div class="hWrap">
                <form class="form-inline" id="main_master_search_form" name="main_master_search_form" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="main.selectMainTodayMCTList">
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
                                <input type="checkbox" name="ASSEMBLY_YN" id="assembly_yn" checked><label for="assembly_yn">조립제외</label>
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

    $(function () {
        'use strict';
        $('#operating_rate_and_operation_record_search_form').find('#main_aggregation_dt').datepicker({dateFormat: 'yy/mm/dd'});
        $('#operating_rate_and_operation_record_search_form').find('#main_aggregation_dt').datepicker('setDate', 'today');

        fnCommCodeDatasourceSelectBoxCreate($('#operating_rate_and_operation_record_search_form').find('#user_id'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getUserList'}
        });

        const leftTopForm = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
        const leftColModel1 = [
            {title: '', dataIndx: 'MCT_WORK_SEQ', hidden: true},
            {title: '공정', dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비<br>No.', dataIndx: 'EQUIP_NM'},
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
            {title: '관리번호', dataIndx: 'CONTROL_NUM', width: 150, align: 'left'},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 85},
            {title: '', dataIndx: '', minWidth: 25},
            {title: '재질', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '작업자', dataIndx: 'WORK_USER_NM'},
            {title: '착수일시', dataIndx: 'WORK_START_DT', width: 75},
            {title: '완료일시', dataIndx: 'WORK_FINISH_DT', width: 75},
            {title: '작업<br>수량', dataIndx: 'FINISH_QTY'},
            {title: '불량<br>발생', dataIndx: 'ERROR_QTY'},
            {title: '검사<br>등급', dataIndx: 'LAST_INSPECT_NM'}
        ];
        const leftPostData1 = $.extend(true, {}, leftTopForm, {queryId: 'main.selectProcessHistoryList-main'});
        const leftObj1 = {
            height: 385,
            collapsible: false, postRenderInterval: -1, //call postRender synchronously.
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
            {title: '관리번호', dataIndx: 'CONTROL_NUM', width: 150, align: 'left'},
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
            height: 385,
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
            {title: '긴급<br>보류', dataIndx: 'EMERGENCY_DELAY_NM'},
            {title: '불량<br>반품', dataIndx: 'ERROR_RETURN_NM'},
            {
                title: '가공<br>납기', dataIndx: 'INNER_DUE_DT',
                render: function (ui) {
                    const rowData = ui.rowData
                    if (rowData.DELAY_YN === 'Y') {
                        return {style: 'background-color: #ffff00;'};
                    }
                }
            },
            {title: '공장<br>구분', dataIndx: 'WORK_FACTORY_NM'},
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
            {title: '관리번호', dataIndx: 'CONTROL_NUM', width: 150, align: 'left'},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
            {title: '수량', dataIndx: 'PART_QTY', dataType: 'integer', format: '#,###'},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 85},
            {title: '현재위치', dataIndx: 'POP_POSITION_NM', width: 60},
            {title: '비고', dataIndx: 'NOTE', width: 100}
        ];

        const rightObj = {
            height: 800,
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
            $('.chartWrap').empty();
        };

        const refreshChart = function (data) {
            for (let i = 0; i < data.list.length; i++) {
                const rowData = data.list[i];
                createChartElement(i);
                createChart(rowData, i);
            }
        };

        const createChartElement = function (index) {
            const $charWrap = $('.chartWrap');
            const valueElement = $('<div class="card"><div id="' + 'chart' + index + '"></div></div>');
            $charWrap.append(valueElement);
        };

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

        const loadLeftGrid = function () {
            const $form = fnFormToJsonArrayData('#operating_rate_and_operation_record_search_form');
            const leftPostData1 = $.extend(true, {}, $form, {queryId: 'main.selectProcessHistoryList-main'});
            const leftPostData2 = $.extend(true, {}, $form, {queryId: 'main.selectCamWorkHistoryList-main'});

            $mainLeftGrid1.pqGrid('option', 'dataModel.postData', function () {
                return leftPostData1;
            });
            $mainLeftGrid1.pqGrid('refreshDataAndView');


            $mainLeftGrid2.pqGrid('option', 'dataModel.postData', function () {
                return leftPostData2;
            });
            $mainLeftGrid2.pqGrid('refreshDataAndView');
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

        $('#inquiry_target').on('change', function () {
            switch (this.value) {
                case 'process':
                    $('.page.main #grid1').show();
                    $('.page.main #grid2').hide();
                    break;
                case 'cam':
                    $('.page.main #grid1').hide();
                    $('.page.main #grid2').show();
                    break;
            }
        });

        $('#main_aggregation_dt_button').on('click', function () {
            $('#main_aggregation_dt').focus();
        });
    });
</script>