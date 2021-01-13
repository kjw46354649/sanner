<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-21
  Time: 오후 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page mct_execute_board">
    <div class="top_wrap">
        <form id="mct_execute_board_top_form" role="form" onsubmit="return false;">
            <div class="d-flex align-items-center">
                <div>
                    <span class="calendar_span">
                        <label class="label_100" for="mct_execute_board_date">집계일자</label>
                        <input type="text" title="달력정보" name="BATCH_DT" id="mct_execute_board_date" readonly><button type="button" id="mct_execute_board_date_button">달력선택</button>
                    </span>
                    <span class="gubun"></span>
                    <span class="slt_wrap">
                        <label class="label_100" for="mct_execute_board_work_factory">공장구분</label>
                        <select class="wd_100" name="WORK_FACTORY" id="mct_execute_board_work_factory">
                            <option value=""><spring:message code="com.form.top.all.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1014}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="gubun"></span>
                    <span class="slt_wrap">
                        <label class="label_100" for="mct_execute_board_factory_area">위치구분</label>
                        <select class="wd_100" name="FACTORY_AREA" id="mct_execute_board_factory_area">
                            <option value=""><spring:message code="com.form.top.all.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1005}">
                               <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="gubun"></span>
                    <span class="slt_wrap">
                        <label class="label_100" for="mct_execute_board_process_type">공정구분</label>
                        <select class="wd_100" name="PROCESS_TYPE" id="mct_execute_board_process_type">
                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                            <c:forEach var="vlocale" items="${HighCode.H_1010}">
                                <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="gubun"></span>
                    <span class="slt_wrap">
                        <label class="label_100" for="mct_execute_board_equip_seq">장비번호</label>
                        <select class="wd_100" name="EQUIP_SEQ" id="mct_execute_board_equip_seq">
                            <option value="">ㅈㅂㅂㅎ</option>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn radius btn-120w blue" data-toggle="modal" data-target="#setWorkingTimeModal">Working Time 설정</button>
                    <button type="button" class="defaultBtn radius blue" id="mct_execute_board_search">검색</button>
                </div>
            </div>
        </form>
    </div>

    <div class="middle_wrap">
        <div id="middle_wrap_div_1"></div>
        <div id="middle_wrap_div_2"></div>
        <div id="middle_wrap_div_3">
            <table id="dsfsd12346dg">
                <colgroup>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                    <col style="width: 30px;"></col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">2018년</th>
                        <th scope="col">1월</th>
                        <th scope="col">2월</th>
                        <th scope="col">3월</th>
                        <th scope="col">4월</th>
                        <th scope="col">5월</th>
                        <th scope="col">6월</th>
                        <th scope="col">7월</th>
                        <th scope="col">8월</th>
                        <th scope="col">9월</th>
                        <th scope="col">10월</th>
                        <th scope="col">11월</th>
                        <th scope="col">12월</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td scope="row">24시간</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td scope="row">근무시간</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td scope="row">가동시간</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td scope="row">절대가동률</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td scope="row">실가동률</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="middle_wrap_div_4"></div>
        <div id="middle_wrap_div_5"></div>
        <div id="middle_wrap_div_6"></div>
    </div>

    <div class="bottom_wrap">
        <form id="mct_execute_board_bot_form">
            <input type="hidden" name="queryId" id="queryId">
        </form>
        <div id="mct_execute_board_grid"></div>
    </div>
</div>
<!-- 외주 전환 -->
<div class="modal" id="setWorkingTimeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">Working Time 설정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="height: 648px">
                <div></div>
                <div>
                    <div class="d-flex align-items-center">
                        <div>
                            <h5 style="font-size: medium; font-weight: bold">요일별 Working Time</h5>
                        </div>
                        <div class="ml-auto">
                            <button type="button" class="defaultBtn btn-100w green" id="WORKING_TIME_SAVE">저장</button>
                        </div>
                    </div>
                    <div class="mt-10" id="WORKING_TIME_GRID"></div>
                </div>
                <div></div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        /* init */
        const $mctExecuteBoardDate = $('#mct_execute_board_date');
        $mctExecuteBoardDate.datepicker({dateFormat: 'yy/mm/dd'});
        $mctExecuteBoardDate.datepicker('setDate', -1);
        let mctExecuteBoardDateYear = $('#mct_execute_board_date').datepicker('getDate').getFullYear();

        fnCommCodeDatasourceSelectBoxCreate($('#mct_execute_board_equip_seq'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getEquipList'}
        });
        let topFormData = fnFormToJsonArrayData('#mct_execute_board_top_form');
        /* 가공납기 준수율 */
        let gaugeOptions = {
            chart: {
                type: 'solidgauge'
            },
            pane: {
                center: ['50%', '85%'],
                size: '170%',
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
                enabled: false
            },

            // the value axis
            yAxis: {
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
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };

        let chart1 = Highcharts.chart('middle_wrap_div_1', Highcharts.merge(gaugeOptions, {
            chart: {
                // width: 215,
                height: 190
            },
            title: {
                align: 'left',
                text: '가공납기 준수율',
                style: {
                    fontSize: '1.4rem'
                }
            },
            yAxis: {
                min: 0,
                max: 100,
            },
            credits: {
                enabled: false
            },
            series: [{
                name: 'processing delivery compliance rate',
                data: [0],
                dataLabels: {
                    format:
                        '<div style="text-align:center">' +
                        '<span style="font-size:25px">{y}</span>' +
                        '<span style="font-size:25px">%</span>' +
                        '</div>'
                },
                tooltip: {
                    valueSuffix: ' %'
                }
            }]

        }));
        /* 가공납기 준수율 */
        /* 일일 가동률 Rank 5 */
        let chart2 = Highcharts.chart('middle_wrap_div_2', {
            chart: {
                type: 'bar',
                // width: 220,
                // height: 150
            },
            title: {
                align: 'left',
                text: '일일 가동률 Rank5',
                style: {
                    fontSize: '1.4rem'
                }
            },
            xAxis: {
                categories: []
            },
            yAxis: {
                min: 0,
                title: {
                    text: null
                }
            },
            legend: {
                reversed: true
            },
            plotOptions: {
                series: {
                    stacking: 'normal'
                }
            },
            series: [{
                name: '절대가동률',
                data: []
            }, {
                name: '실가동률',
                data: []
            }]
        });
        /* 일일 가동률 Rank 5 */
        /* 일일 가동률 추이 (7days) */
        let chart3 = Highcharts.chart('middle_wrap_div_4', {
            chart: {
                type: 'column'
            },
            title: {
                align: 'left',
                text: '일별 가동률 추이 (7days)',
                style: {
                    fontSize: '1.4rem'
                }
            },
            xAxis: {
                categories: [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: null
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:2">{series.name}</td>' +
                    '<td style="padding:2"><b>{point.y}</b></td></tr>',
                    // '<td style="padding:2"><b>{point.y:.1f}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '절대가동률',
                data: []
            }, {
                name: '실가동률',
                data: []
            }]
        });
        /* 일일 가동률 추이 (7days) */
        /* 주별 가동률 추이 (8week) */
        let chart4 = Highcharts.chart('middle_wrap_div_5', {
            chart: {
                type: 'column'
            },
            title: {
                align: 'left',
                text: '주별 가동률 추이 (8weeks)',
                style: {
                    fontSize: '1.4rem'
                }
            },
            xAxis: {
                categories: [
                    'M-7W',
                    'M-6W',
                    'M-5W',
                    'M-4W',
                    'M-3W',
                    'M-2W',
                    'M-1W',
                    'M'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: null
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:2">{series.name}</td>' +
                    '<td style="padding:2"><b>{point.y}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '절대가동률',
                data: []
            }, {
                name: '실가동률',
                data: []
            }]
        });
        /* 주별 가동률 추이 (8week) */
        /* 월별 가동률 추이 (2018年) */
        let chart5 = Highcharts.chart('middle_wrap_div_6', {
            chart: {
                type: 'column'
            },
            title: {
                align: 'left',
                text: '월별 가동률 추이 (2018年)',
                style: {
                    fontSize: '1.4rem'
                }
            },
            xAxis: {
                categories: [
                    '1月',
                    '2月',
                    '3月',
                    '4月',
                    '5月',
                    '6月',
                    '7月',
                    '8月',
                    '9月',
                    '10月',
                    '11月',
                    '12月'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: null
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:2">{series.name}</td>' +
                    '<td style="padding:2"><b>{point.y}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: '절대가동률',
                data: []
            }, {
                name: '실가동률',
                data: []
            }]
        });
        /* 월별 가동률 추이 (2018年) */
        /* grid */
        const gridId = 'mct_execute_board_grid';
        const colModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true},
            {title: '공장', dataIndx: 'WORK_FACTORY_NM'},
            {title: '설치위치<br>(Area 구분정보)', width: 120, dataIndx: 'FACTORY_AREA_NM'},
            {title: '공정<br>종류', dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비번호', width: 65, dataIndx: 'EQUIP_NM'},
            {title: '규격정보', width: 150, dataIndx: 'EQUIP_SIZE'},
            {title: 'Working<br>Time', width: 75, dataIndx: 'WORK_TIME', editable: true, styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '가동시간', width: 75, dataIndx: 'PAUSE_TIME'},
            {title: '정지시간', width: 75, dataIndx: 'REPAIR_TIME'},
            {title: '실가동률', width: 70, dataIndx: 'REAL_RATIO', dataType: 'integer', format: '#,###%'},
            {title: 'EQUIP_SEQ', width: 70, dataIndx: 'EQUIP_SEQ', hidden: true},
            {
                title: '시간별 가동현황 (2018.08.12)', align: 'center',
                colModel: [
                    {
                        title: '08', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0800', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0830', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '09', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0900', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0930', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '10', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1000', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1030', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '11', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1100', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1230', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '12', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1200', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1230', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '13', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1300', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1330', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '14', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1400', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1430', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '15', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1500', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1530', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '16', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1600', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1630', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '17', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1700', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1730', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '18', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1800', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1830', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '19', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_1900', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_1930', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '20', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_2000', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_2030', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '21', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_2100', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_2130', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '22', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_2200', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_2230', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '23', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_2300', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_2330', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '24', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0000', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0030', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '01', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0100', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0130', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '02', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0200', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0230', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '03', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0300', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0330', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '04', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0400', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0430', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '05', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0500', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0530', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '06', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0600', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0630', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                    {
                        title: '07', halign: 'center', colModel: [
                            {title: '00', dataIndx: 'STATUS_0700', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                            {title: '30', dataIndx: 'STATUS_0730', render: function (ui) {switch (ui.cellData) {case 'WORKING': return {cls: 'bg-originalgreen', text: ''}; case 'PAUSE': return {cls: 'bg-orange', text: ''}; default: return {cls: 'bg-white', text: ''};}}},
                        ]
                    },
                ]
            },
        ];
        const obj = {
            height: '100%',
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            sortModel: {on: false},
            load: function (event, ui) {
                let date = $('#mct_execute_board_date').val().replaceAll('/', '.');

                console.log($('#mct_execute_board_grid #pq-head-cell-u5-0-11-right').find('.pq-title-span'));
                $('#mct_execute_board_grid #pq-head-cell-u5-0-11-right > div > span.pq-title-span').html('시간별 가동현황 (' + date + ')');
                this.refreshHeader();                 //TODO: refresh header
            }
        };
        const $mctExecuteBoardGrid = $('#' + gridId).pqGrid(obj);

        /* grid */
        /* init */

        /* function */
        const getJsonList = function (queryId, callFunction) {
            let postData = fnCloneObj(topFormData);
            postData.queryId = queryId;
            let parameters = {
                'url': '/json-list',
                'data': postData
            };

            fnPostAjax(function (data) {
                callFunction(data);
            }, parameters, '');
        };

        const changeHighchartsTitle = function (element, text) {
            if (element) {
                element.setTitle({text: text});
            }
        }

        const changeHighchartsSeriesName = function (element, data) {
            if (element) {
                for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                    element.series[i].setName(data[i]);
                }
            }
        }
        const changeHighchartsSeriesData = function (element, data) {
            if (element) {
                for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                    element.series[i].setData(data[i]);
                }
            }
        }
        // 일일 실 가동률
        const changeDailyActualOperateRate = function () {
            getJsonList('reportMapper.selectDailyActualOperateRate', function (arg) {
                let point;
                let newVal;
                newVal = arg.list ? arg.list[0].REAL_RATIO : undefined;

                if (chart1) {
                    point = chart1.series[0].points[0];
                    point.update(newVal);
                }
            });
        }
        // 일일 가동률 Rank5
        const changeDailyOperateRateRank5 = function () {
            getJsonList('reportMapper.selectDailyOperateRateRank5', function (arg) {
                const list = arg.list;

                if (chart2) {
                    let categories = [];
                    let absRatio = [];
                    let realRatio = [];

                    list.forEach((value, index) => {
                        categories[index] = value.EQUIP_NM;
                        absRatio[index] = Number(value.ABS_RATIO);
                        realRatio[index] = Number(value.REAL_RATIO);
                    });

                    chart2.xAxis[0].setCategories(categories);
                    chart2.series[0].setData(absRatio);
                    chart2.series[1].setData(realRatio);
                }
            });
        };
        // 밑에 테이블
        const changeTable = function (data) {
            getJsonList('reportMapper.selectMonthlyOperateRateTrend', function (arg) {
                const list = arg.list;
                let htmlString = '';
                htmlString += '<table>';
                htmlString += '    <colgroup>';
                for (let i = 0; i < 13; i++) {
                    htmlString += '        <col style="width: 30px;"></col>';
                }
                htmlString += '    </colgroup>';
                htmlString += '    <thead>';
                htmlString += '    <tr>';
                htmlString += '        <th scope="col">' + mctExecuteBoardDateYear + '년</th>';
                htmlString += '        <th scope="col">1월</th>';
                htmlString += '        <th scope="col">2월</th>';
                htmlString += '        <th scope="col">3월</th>';
                htmlString += '        <th scope="col">4월</th>';
                htmlString += '        <th scope="col">5월</th>';
                htmlString += '        <th scope="col">6월</th>';
                htmlString += '        <th scope="col">7월</th>';
                htmlString += '        <th scope="col">8월</th>';
                htmlString += '        <th scope="col">9월</th>';
                htmlString += '        <th scope="col">10월</th>';
                htmlString += '        <th scope="col">11월</th>';
                htmlString += '        <th scope="col">12월</th>';
                htmlString += '    </tr>';
                htmlString += '    </thead>';
                htmlString += '    <tbody>';
                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    const dataTypeName = obj.DATA_TYPE_NM || '';
                    htmlString += '    <tr>';
                    htmlString += '        <td scope="row">' + dataTypeName + '</td>';
                    for(let j = 1; j <= 12; j++) {
                        const value = obj['DATA_VALUE_' + j] || '';
                        htmlString += '        <td>' + value + '</td>';
                    }
                    htmlString += '    </tr>';
                }
                htmlString += '    </tbody>';
                htmlString += '</table>';

                $('#dsfsd12346dg').html(htmlString);
            });

        };
        // 일별 가동률 추이
        const changeDailyMCTOperateRateTrendSevenDays = function () {
            getJsonList('reportMapper.selectDailyMCTOperateRateTrendSevenDays', function (arg) {
                const list = arg.list;
                const nameArray = [];
                const dataArray = [[], []];

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    nameArray.push(obj.DATA_TYPE_NM);

                    for (let j = 1; j <= 7; j++) {
                        dataArray[i].push(obj['DATA_VALUE_' + j]);
                    }
                }

                changeHighchartsSeriesName(chart3, nameArray);
                changeHighchartsSeriesData(chart3, dataArray);
            });
        };
        // 주별 가동률 추이 (8week)
        const changeWeeklyMctOperateRateEightWeeks = function () {
            getJsonList('reportMapper.selectWeeklyMctOperateRateEightWeeks', function (arg) {
                const list = arg.list;
                const nameArray = [];
                const dataArray = [[], []];

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    nameArray.push(obj.DATA_TYPE_NM);

                    for (let j = 1; j <= 8; j++) {
                        dataArray[i].push(obj['DATA_VALUE_' + j]);
                    }
                }
                changeHighchartsSeriesName(chart4, nameArray);
                changeHighchartsSeriesData(chart4, dataArray);
            });
        };
        // 월별 가동률 추이(2018年)
        const changeMonthlyOperateRateTrend = function () {
            getJsonList('reportMapper.selectMonthlyOperateRateTrend', function (arg) {
                const list = arg.list;
                const dataArray = [[], []];
                let k = -1;

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    if (obj.DATA_TYPE_NM === '절대가동률' || obj.DATA_TYPE_NM === '실가동률') {
                        k++;
                        for (let j = 1; j <= 12; j++) {
                            dataArray[k].push(obj['DATA_VALUE_' + j] || 0);
                        }
                    }
                }
                changeHighchartsTitle(chart5, '월별 가동률 추이 (' + mctExecuteBoardDateYear + '年)')
                changeHighchartsSeriesData(chart5, dataArray);
            });
        };
        //하단 그리드
        const refreshMctExecuteBoardGrid = function () {
            $mctExecuteBoardGrid.pqGrid('option', 'dataModel.postData', function () {
                const postData = fnFormToJsonArrayData('#mct_execute_board_top_form');
                postData.queryId = 'reportMapper.selectDFGSDFG123';
                return postData;
            });
            $mctExecuteBoardGrid.pqGrid('refreshDataAndView');
        };
        /* function */

        /* event*/

        $('#mct_execute_board_date').on('change', function () {
           mctExecuteBoardDateYear = $('#mct_execute_board_date').datepicker('getDate').getFullYear();
        });

        $('#mct_execute_board_search').on('click', function () {
            topFormData = fnFormToJsonArrayData('#mct_execute_board_top_form');
            changeDailyActualOperateRate(); // 일일 실가동률
            changeDailyOperateRateRank5();
            changeTable();
            changeDailyMCTOperateRateTrendSevenDays();
            changeWeeklyMctOperateRateEightWeeks();
            changeMonthlyOperateRateTrend();
            refreshMctExecuteBoardGrid();
        });

        $('.sideWrap a').on('click', function (e) {
            setTimeout(function(){
                chart1.reflow();
                chart2.reflow();
                chart3.reflow();
                chart4.reflow();
                chart5.reflow();
            }, 500);
        });
        /* event*/

        /* init */
        $('#mct_execute_board_search').click();
        /* init */






















        /* init */
        let $workingTimeGrid;
        const workingTimeId = 'WORKING_TIME_GRID';
        // let leftPostData = fnFormToJsonArrayData('#DAILY_PROCESS_STATUS_LEFT_SEARCH_FORM');
        const workingTimeColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '위치', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '위치', dataIndx: 'WORK_FACTORY_NM', editable: false},
            {title: '월', dataType: 'integer', dataIndx: 'MON', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '화', dataType: 'integer', dataIndx: 'TUE', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '수', dataType: 'integer', dataIndx: 'WED', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '목', dataType: 'integer', dataIndx: 'THU', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '금', dataType: 'integer', dataIndx: 'FRI', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '토', dataType: 'integer', dataIndx: 'SAT', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {title: '일', dataType: 'integer', dataIndx: 'SUN', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}}
        ];
        const workingTimeObj = {
            height: 105,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: workingTimeColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'reportMapper.selectWorkingWeekTimeList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* init */

        /* event */
        $('#setWorkingTimeModal').on({
            'show.bs.modal': function () {
                $workingTimeGrid = $('#' + workingTimeId).pqGrid(workingTimeObj);
            },
            'hide.bs.modal': function () {
                $workingTimeGrid.pqGrid('destroy');
            }
        });

        $('#WORKING_TIME_SAVE').on('click', function () {
            let gridInstance = $workingTimeGrid.pqGrid('getInstance').grid;
            //추가 또는 수정된 값이 있으면 true
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let parameters = {'url': '/updateWorkingTime', 'data': {data: JSON.stringify(changes)}}

                fnPostAjax(function () {
                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                        $workingTimeGrid.pqGrid('refreshDataAndView');
                    });
                }, parameters, '');
            }
        });
        /* event */
    });
</script>