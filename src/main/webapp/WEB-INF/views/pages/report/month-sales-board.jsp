<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2021-02-25
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page month_sales_board">
    <div class="top_wrap">
        <form id="month_sales_board_top_form" role="form" onsubmit="return false;">
            <div class="d-flex align-items-center">
                <div>
                    <span class="slt_wrap">
                        <label class="label_100">조회년월</label>
                        <select class="wd_100" name="YEAR" id="month_sales_board_year"></select>
                        <select class="wd_100" name="MONTH" id="month_sales_board_month"></select>
                    </span>
                    <span class="slt_wrap">
                        <label class="label_100" for="comp_cd">사업자구분</label>
                        <select class="wd_200" name="COMP_CD" id="comp_cd" title="사업자구분">
                            <option value=""><spring:message code="com.form.top.all.option"/></option>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                </div>
            </div>
        </form>
    </div>

    <div class="middle_wrap">
        <div>
            <div><h4>월간현황</h4></div>
            <div>
                <table id="monthly_status_table">
                    <tr>
                        <th><span name="month">12</span>월 영업목표</th>
                    </tr>
                    <tr>
                        <td id="goal_amt_kor" style="font-size: 24px;">10억</td>
                    </tr>
                    <tr>
                        <th><span name="month">12</span>월 매출현황</th>
                    </tr>
                    <tr>
                        <td id="sales_amt_kor" style="font-size: 24px;">10억 3천</td>
                    </tr>
                    <tr>
                        <th><span name="month">12</span>월 달성률</th>
                    </tr>
                    <tr>
                        <td id="month_ratio" style="font-size: 24px;">105%</td>
                    </tr>
                </table>
            </div>
            <div>
                <div id="monthly_status_chart"></div>
            </div>
        </div>
        <div>
            <div><h4>누적현황</h4></div>
            <div>
                <table id="cumulative_status_table">
                    <tr>
                        <th>누적 영업목표</th>
                    </tr>
                    <tr>
                        <td id="goal_amt_kor" style="font-size: 24px;">45억</td>
                    </tr>
                    <tr>
                        <th>누적 매출현황</th>
                    </tr>
                    <tr>
                        <td id="sales_amt_kor" style="font-size: 24px;">41억 3천</td>
                    </tr>
                    <tr>
                        <th>누적 달성률</th>
                    </tr>
                    <tr>
                        <td id="month_ratio" style="font-size: 24px;">89%</td>
                    </tr>
                </table>
            </div>
            <div>
                <div id="cumulative_status_chart"></div>
            </div>
        </div>
        <div>
            <div id="annual_sales_status_chart"></div>
        </div>
    </div>
    <div class="bottom_wrap">
        <div>
            <div class="hWrap">
                <div class="d-flex align-items-center">
                    <div>
                        <h4>상세매출현황</h4>
                    </div>
                    <div class="ml-auto">
                        <span>(단위 : 천원)</span>
                    </div>
                </div>
            </div>
            <div class="conWrap">
                <div id="month_sales_board_botGrid1" style="margin:auto;"></div>
            </div>
        </div>
        <div>
            <div class="hWrap">
                <div class="d-flex align-items-center">
                    <div>
                        <h4>외주현황</h4>
                    </div>
                    <div class="ml-auto">
                        <span>(단위 : 천원)</span>
                    </div>
                </div>
            </div>
            <div class="conWrap">
                <div id="month_sales_board_botGrid2"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        const lastMonth = new Date((new Date()).setMonth(TODAY.getMonth() - 1));
        fnAppendSelectboxYear('month_sales_board_year', 10);
        fnAppendSelectboxMonth('month_sales_board_month');
        $('#month_sales_board_year').val(lastMonth.getFullYear()).prop('selected', true);
        $('#month_sales_board_month').val(CURRENT_MONTH + 1 < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);
        fnCommCodeDatasourceSelectBoxCreate($('#month_sales_board_top_form').find('#comp_cd'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        let topFormData = fnFormToJsonArrayData('#month_sales_board_top_form');
        // Build the chart
        const chart1 = Highcharts.chart('monthly_status_chart', {
            chart: {
                type: 'pie',
                height: '100%',
                styledMode: true
            },
            title: {
                text: '발주처 비율',
                align: 'left',
                style: {
                    fontSize: '1.4rem'
                }
            },
            subtitle: {
                text: '2020년 12월',
                align: 'right',
                y: 14,
                // verticalAlign: 'middle',
            },
            tooltip: {
                enabled: false
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    enableMouseTracking: false,
                    dataLabels: {
                        format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                        // distance: -50,
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: []
            }]
        });
        // Build the chart
        const chart2 = Highcharts.chart('cumulative_status_chart', {
            chart: {
                type: 'pie',
                height: '100%',
                styledMode: true
            },
            title: {
                text: '발주처 비율',
                align: 'left',
                style: {
                    fontSize: '1.4rem'
                }
            },
            subtitle: {
                text: '2020년 12월',
                align: 'right',
                y: 14,
                // verticalAlign: 'middle',
            },
            tooltip: {
                enabled: false
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    enableMouseTracking: false,
                    dataLabels: {
                        format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                        // distance: -50,
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: []
            }]
        });

        const chart3 = Highcharts.chart('annual_sales_status_chart', {
            chart: {
                styledMode: true
            },
            title: {
                align: 'left',
                text: '월별현황 (2020년)',
                style: {
                    fontSize: '1.6rem'
                }
            },
            xAxis: [{
                categories: [
                    '1월',
                    '2월',
                    '3월',
                    '4월',
                    '5월',
                    '6월',
                    '7월',
                    '8월',
                    '9월',
                    '10월',
                    '11월',
                    '12월'
                ]
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    // format: '{value} 원',
                    formatter: function () {
                        return this.value / 100000000 + '억원';
                    },
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: null
                }
            }, { // Secondary yAxis
                max: 125,
                title: {
                    text: null
                },
                labels: {
                    format: '{value} %',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                // layout: 'vertical',
                align: 'center',
                verticalAlign: 'top',
                floating: true,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || // theme
                    'rgba(255,255,255,0.25)'
            },
            plotOptions: {
                series: {
                    enableMouseTracking: false
                }
            },
            series: [{
                name: '목표매출',
                type: 'column',
                data: [],
                tooltip: {
                    valueSuffix: ' 원'
                }
            }, {
                name: '달성매출',
                type: 'column',
                data: [],
                tooltip: {
                    valueSuffix: ' 원'
                }
            }, {
                name: '달성률',
                type: 'spline',
                yAxis: 1,
                data: [],
                tooltip: {
                    valueSuffix: '%'
                }
            }]
        });

        const botLeftGridId = 'month_sales_board_botGrid1';
        const botLeftGridColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: '발주처명', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처명', width: 110, dataIndx: 'COMP_NM'},
            {
                title: '변동', dataIndx: 'PLUS_MINUS',
                render: function (ui) {
                    if (ui.rowData.PLUS_MINUS_RED_YN === 'Y') {
                        return {style: {'color': '#FF0000'}};
                    }
                }
            },
            {title: 'PLUS_MINUS_RED_YN', dataIndx: 'PLUS_MINUS_RED_YN', hidden: true},
            {title: '업종', width: 140, dataIndx: 'BUSINESS_ITEM'},
            {
                title: '월간실적', align: 'center', colModel: [
                    {title: '매출금액', width: 80, align: 'right', dataType: 'integer', format: '#,###',dataIndx: 'MONTH_AMT', summary: {type: 'sum'}},
                    {title: '품수', width: 60, align: 'right', dataType: 'integer', format: '#,###',dataIndx: 'MONTH_ORDER_CNT', summary: {type: 'sum'}},
                    {title: '수량', width: 60, align: 'right', dataType: 'integer', format: '#,###',dataIndx: 'MONTH_ORDER_QTY', summary: {type: 'sum'}},
                ]
            },
            {
                title: '누적실적(년간)', align: 'center', colModel: [
                    {title: '매출금액', width: 100, align: 'right', dataType: 'integer', format: '#,###',dataIndx: 'YEAR_AMT', summary: {type: 'sum'}},
                    {title: '품수', width: 100, align: 'right', dataType: 'integer', format: '#,###',dataIndx: 'YEAR_ORDER_CNT', summary: {type: 'sum'}},
                    {title: '수량', width: 60, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'YEAR_ORDER_QTY', summary: {type: 'sum'}},
                ]
            },
            {title: '누적<br>가공시간', width: 60, align: 'right', dataIndx: 'MCT_WORK_TIME', format: '#,###', summary: {type: 'sum'},
                render: function (ui) {
                    return numberWithCommas(ui.cellData) + 'h';
                },
            },
            {title: '시간당<br>매출', width: 70, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'YEAR_AMT_PER_HOUR', summary: {type: 'sum'}},
            {title: '이전<br>거래년월', width: 70, dataIndx: 'PREV_SALES_MONTH'},
            {title: '구분', width: 100, dataIndx: 'NOTE'},
            {title: '영업담당', width: 70, dataIndx: 'STAFF_NM'}
        ];
        const leftGroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const botLeftGridObj = {
            height: 380,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            // selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            styleHead: {'background': '#2b2b2b'},
            colModel: botLeftGridColModel,
            groupModel: leftGroupModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            summaryTitle: {sum: '{0}'},
        };
        const $botLeftGrid = $('#' + botLeftGridId).pqGrid(botLeftGridObj);
        
        const botRightGridId = 'month_sales_board_botGrid2';
        const botRightGridColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: '외주업체명', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체명', dataIndx: 'COMP_NM'},
            {title: '월 매입금액', dataType: 'integer', align: 'right', format: '#,###', dataIndx: 'MONTH_AMT', summary: {type: 'sum'}},
            {title: '품수<br>(월단위)', dataType: 'integer', align: 'right', format: '#,###',dataIndx: 'MONTH_PART_CNT', summary: {type: 'sum'}},
            {title: '수량<br>(월단위)', dataType: 'integer', align: 'right', format: '#,###',dataIndx: 'MONTH_PART_QTY', summary: {type: 'sum'}},
            {title: '누적<br>매입금액', dataType: 'integer', align: 'right', format: '#,###', dataIndx: 'YEAR_AMT', summary: {type: 'sum'}},
            {title: '누적품수', dataType: 'integer', align: 'right', format: '#,###', dataIndx: 'YEAR_PART_CNT', summary: {type: 'sum'}},
            {title: '누적수량', dataType: 'integer', align: 'right', format: '#,###', dataIndx: 'YEAR_PART_QTY', summary: {type: 'sum'}},
        ];
        const rightGroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const botRightGridObj = {
            height: 380,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            // selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            styleHead: {'background': '#fde598'},
            colModel: botRightGridColModel,
            groupModel: rightGroupModel,
            summaryTitle: {sum: '{0}'},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
        };
        const $botRightGrid = $('#' + botRightGridId).pqGrid(botRightGridObj);
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
        };

        const changeHighchartsSubtitle = function (element, text) {
            if (element) {
                element.setSubtitle({text: text});
            }
        };

        const changeHighchartsSeriesData = function (element, data) {
            if (element) {
                if(element.series.length > 1){
                    for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                        element.series[i].setData(data[i]);
                    }
                }else{
                    element.series[0].setData(data);
                }
            }
        };
        // 월간현황1, 누적현황1
        const changeTable = function (target) {
            let queryId = '';

            switch (target) {
                case 'monthly':
                    queryId = 'selectMonthlyBusinessStatusList';
                    break;
                case 'cumulative':
                    queryId = 'selectMonthlyBusinessCumulativeStatusList';
                    break;
            }

            getJsonList('reportMapper.' + queryId, function (arg) {
                const list = arg.list;
                createTable(target, list);
            });
        };
        // 월간현황 발주처 비율, 누적현황 발주처 비율
        const changePieChart = function (target) {
            let queryId = '';
            let chart;
            let subtitle;
            let selectedYear = $('#month_sales_board_year').val();

            switch (target) {
                case 'monthly':
                    queryId = 'selectMonthlyBusinessStatusRatioList';
                    chart = chart1;
                    subtitle = selectedYear + '년 ' + $('#month_sales_board_month').val() + '월';
                    break;
                case 'cumulative':
                    queryId = 'selectMonthlyBusinessCumulativeStatusRatioList';
                    chart = chart2;
                    subtitle = selectedYear + '년 1월 ~ ' + selectedYear + '년 12월';
                    break;
            }

            getJsonList('reportMapper.' + queryId, function (arg) {
                const list = arg.list;
                const dataArray = [];
                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    dataArray.push({
                        name: list[i].ORDER_COMP_NM,
                        y: list[i].SALES_AMT
                    });
                }
                changeHighchartsSubtitle(chart, subtitle);
                changeHighchartsSeriesData(chart, dataArray);
            });
        };

        const changeStatus = function (target) {
            changeTable(target);
            changePieChart(target);
        };
        // 월간현황
        const changeAnnualBusinessStatus = function () {
            getJsonList('reportMapper.selectAnnualBusinessStatusList', function (arg) {
                const list = arg.list;
                const array = [[], [], []];

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    const dataArray = [];

                    for (let j = 1; j <= 12; j++) {
                        dataArray[j - 1] = obj['DATA_VALUE_' + String(j).padStart(2, '0')] || 0;
                    }
                    array[i] = dataArray;
                }
                changeHighchartsTitle(chart3, '월별현황 (' + $('#month_sales_board_year').val() +  '년)')
                changeHighchartsSeriesData(chart3, array);
            });
        };
        
        const refreshBotLeftGrid = function () {
            const formData = fnCloneObj(topFormData);
            formData.queryId = 'reportMapper.selectDetailedCumulativeStatusByMonthlyOrderCompList';

            $botLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return formData;
            });
            $botLeftGrid.pqGrid('refreshDataAndView');
        };
        
        const refreshBotRightGrid = function () {
            const formData = fnCloneObj(topFormData);
            formData.queryId = 'reportMapper.selectOutsourcingProcessPurchaseStatusByCompanyList';

            $botRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return formData;
            });
            $botRightGrid.pqGrid('refreshDataAndView');
        };

        const createTable = function (target, data) {
            let tableId;

            switch (target) {
                case 'monthly':
                    tableId = 'monthly_status_table';
                    break;
                case 'cumulative':
                    tableId = 'cumulative_status_table';
                    break;
            }

            const GOAL_AMT_KOR = data !== undefined && data[0].GOAL_AMT_KOR ? data[0].GOAL_AMT_KOR : '';
            const SALES_AMT_KOR = data !== undefined && data[0].SALES_AMT_KOR ? data[0].SALES_AMT_KOR : '';
            const MONTH_RATIO = data !== undefined && data[0].MONTH_RATIO ? data[0].MONTH_RATIO + '%' : '';
            const $table = $('.month_sales_board').find('#' + tableId);
            $table.find('#goal_amt_kor').html(GOAL_AMT_KOR);
            $table.find('#sales_amt_kor').html(SALES_AMT_KOR);
            $table.find('#month_ratio').html(MONTH_RATIO);
        };
        /* function */
        /* event */
        $('#month_sales_board_top_form').on('change', function () {
            topFormData = fnFormToJsonArrayData('#month_sales_board_top_form');
            changeStatus('monthly');
            changeStatus('cumulative');
            changeAnnualBusinessStatus();
            refreshBotLeftGrid();
            refreshBotRightGrid();

            $('#monthly_status_table [name=month]').html($('#month_sales_board_month').val());
        });
        /* event */

        $('#month_sales_board_top_form').change();
    });
</script>