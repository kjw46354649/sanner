<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2021-01-14
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page monthly_quality_board">
    <div class="top_wrap">
        <form id="monthly_quality_board_top_form" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId">
            <div class="d-flex align-items-center">
                <div>
                    <span class="slt_wrap">
                        <label class="label_100">조회년월</label>
                        <select class="wd_100" name="START_YEAR" id="monthly_quality_board_start_year"></select>
                        <select class="wd_100" name="START_MONTH" id="monthly_quality_board_start_month"></select>
                        <span style="margin: 0 5px; font-size: 1.2rem; vertical-align: middle;">~</span>
                        <select class="wd_100" name="END_YEAR" id="monthly_quality_board_end_year" disabled></select>
                        <select class="wd_100" name="END_MONTH" id="monthly_quality_board_end_month" disabled></select>
                        <span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH"><label for="RANGE_SEARCH"> 기간검색</label></span>
                    </span>
                    <span class="slt_wrap">
                        <!-- TODO: -->
                        <label class="label_100">조회구분</label>
                        <select class="wd_100" name="asdfasdfasdf" id="asdfasdfasdf">
                            <option value="ORDER">발주처</option>
                            <option value="OUTSIDE">외주업체</option>
                            <option value="MATERIAL">재질</option>
                        </select>
                    </span>
                    <span class="slt_wrap">
                        <label class="label_100">검사등급</label>
                        <select id="INSPECT_GRADE" name="INSPECT_GRADE" title="검사등급">
                            <c:forEach var="vlocale" items="${HighCode.H_1040}">
                                <c:if test="${vlocale.CODE_CD == 'GRD030' or vlocale.CODE_CD == 'GRD040' or vlocale.CODE_CD == 'GRD050'}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                </div>
            </div>
        </form>
        <div></div>
    </div>

    <div class="middle_wrap">
        <div id="monthly_quality_board_middle_wrap_div_1">
            <div id="monthly_quality_board_topGrid"></div>
        </div>
        <div id="monthly_quality_board_middle_wrap_div_2"></div>
        <div id="monthly_quality_board_middle_wrap_div_3"></div>
        <div id="monthly_quality_board_middle_wrap_div_4"></div>
        <div id="monthly_quality_board_middle_wrap_div_5"></div>
    </div>
    <div class="bottom_wrap">
        <div class="hWrap">
            <form id="monthly_quality_board_bot_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectMonthlyQualityBoardDetail">
                <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                <input type="hidden" name="MATERIAL_TYPE" id="MATERIAL_TYPE">
                <div class="d-flex align-items-center">
                    <div>

                    </div>
                    <div class="ml-auto">
                        <span class="slt_wrap">
                            <label class="label_100" for="BOTTOM_INSPECT_GRADE">검사등급</label>
                            <input type="text" class="wd_200" name="BOTTOM_INSPECT_GRADE" id="BOTTOM_INSPECT_GRADE" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="검사등급" readonly>
                            <input type="hidden" name="SEL_BOTT_INSPECT_GRADE" id="SEL_BOTT_INSPECT_GRADE">
                        </span>
                        <label for="monthlyQualityBoardFilterKeyword"></label><input type="search" id="monthlyQualityBoardFilterKeyword" placeholder="Enter your keyword">
                        <label for="monthlyQualityBoardFilterColumn"></label><select id="monthlyQualityBoardFilterColumn"></select>
                        <label for="monthlyQualityBoardFilterCondition"></label>
                        <select id="monthlyQualityBoardFilterCondition">
                            <c:forEach var="code" items="${HighCode.H_1083}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </form>
        </div>
        <div class="conWrap">
            <div id="monthly_quality_board_botGrid"></div>
            <div class="right_sort">
                전체 조회 건수 (Total : <span id="monthly_quality_board_bot_total_records" style="color: #00b3ee">0</span>)
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        let comboData = new Array() ;
        <c:forEach var="vlocale" items="${HighCode.H_1040}">
        var data1 = new Object() ;
        data1.id = '${vlocale.CODE_CD}' ;
        data1.title = '${vlocale.CODE_NM_KR}' ;
        comboData.push(data1) ;
        </c:forEach>
        let bottom_combotree = $("#BOTTOM_INSPECT_GRADE").comboTree({
            source : comboData,
            isMultiple: true,
            cascadeSelect: false
        })

        const D_GRADE = 'GRD040';
        const lastMonth = new Date((new Date()).setMonth(TODAY.getMonth() - 1));
        fnAppendSelectboxYear('monthly_quality_board_start_year', 10);
        fnAppendSelectboxYear('monthly_quality_board_end_year', 10);
        fnAppendSelectboxMonth('monthly_quality_board_start_month');
        fnAppendSelectboxMonth('monthly_quality_board_end_month');
        $('#monthly_quality_board_start_year').val(lastMonth.getFullYear()).prop('selected', true);
        $('#monthly_quality_board_start_month').val(String(lastMonth.getMonth() + 1).padStart(2, '0')).prop('selected', true);
        $('#monthly_quality_board_end_month').val(CURRENT_MONTH + 1 < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);
        $('#monthly_quality_board_top_form').find('#INSPECT_GRADE').val(D_GRADE);

        let topFormData = fnFormToJsonArrayData('#monthly_quality_board_top_form');
        topFormData.queryId = 'reportMapper.selectMonthlyQualityBoardFromOrder';
        const topGridId = 'monthly_quality_board_topGrid';
        const topGridColModel = [
            {
                title: '납품/검사현황', halign: 'center', colModel: [
                    {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
                    {title: '발주처', dataIndx: 'ORDER_COMP_NM', minWidth:85},
                    {title: '출고<br>품수', minWidth:50, maxWidth:55, dataIndx: 'PART_CNT'},
                    {title: '검사<br>품수', minWidth:50, maxWidth:55, dataIndx: 'INSPECT_CNT'},
                    {title: '검사<br>비율', minWidth:50, maxWidth:55, dataIndx: 'INSPECT_RATIO'},
                    {title: '합격<br>률', minWidth:50, maxWidth:55, dataIndx: 'PASS_RATIO'},
                    {
                        title: 'A', halign: 'center', colModel: [
                            {title: '품수', dataIndx: 'A_CNT', minWidth:45, maxWidth:45},
                            {title: '%', dataIndx: 'A_RATIO', minWidth:40, maxWidth:40},
                        ]
                    },
                    {
                        title: 'B', halign: 'center', colModel: [
                            {title: '품수', dataIndx: 'B_CNT', minWidth:45, maxWidth:45},
                            {title: '%', dataIndx: 'B_RATIO', minWidth:40, maxWidth:40},
                        ]
                    },
                    {
                        title: 'C', halign: 'center', colModel: [
                            {title: '품수', dataIndx: 'C_CNT', minWidth:45, maxWidth:45},
                            {title: '%', dataIndx: 'C_RATIO', minWidth:40, maxWidth:40},
                        ]
                    },
                    {
                        title: 'D', halign: 'center', colModel: [
                            {title: '품수', dataIndx: 'D_CNT', minWidth:45, maxWidth:45},
                            {title: '%', dataIndx: 'D_RATIO', minWidth:40, maxWidth:40},
                        ]
                    },
                ]
            },
            {
                title: '반품', halign: 'center', colModel: [
                    {
                        title: 'RT-D', halign: 'center', colModel: [
                            {title: '품수', dataIndx: 'RETURN_CNT', minWidth:45, maxWidth:45},
                            {title: '%', dataIndx: 'RETURN_RATIO', minWidth:40, maxWidth:40},
                        ]
                    }

                ]
            }
        ];
        const topGridObj = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            editable: false,
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render:monthlyQualityBoardTopRender},
            // styleHead: {'background': '#ffe699'},
            colModel: topGridColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: topFormData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                const data = this.option('dataModel.data');

                if (data.length > 0) {
                    const firstRow = 0;

                    $topGrid.pqGrid('setSelection', {rowIndx: firstRow});
                }
            },
            rowSelect: function (event, ui) {
                const rowData = ui.addList[0].rowData;
                updateBotPostData(rowData);
                botGridRefreshDataAndView();
            },
            sortModel: {on: false},

        };
        const $topGrid = $('#' + topGridId).pqGrid(topGridObj);

        function monthlyQualityBoardTopRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData;
            if(ui.rowIndx == 0) {
                ui.style[0] = ui.style[0] + "background-color:#ffff00;";
            }
            return val;
        }

        const botGridId = 'monthly_quality_board_botGrid';
        const botGridColModel = [
            {title: '출고<br>일자', maxWidth: 50, dataIndx: 'OUT_FINISH_DT'},
            {title: '가공<br>완료', maxWidth: 50, dataIndx: 'INNER_WORK_FINISH_DT'},
            {title: '발주처', minWidth: 85, dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', minWidth: 30, maxWidth: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업지시번호', align: 'left', width: 180,  dataIndx: 'CONTROL_NUM'},
            {title: '도면번호', align: 'left', width: 150,  dataIndx: 'DRAWING_NUM'},
            {
                title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '재질', width: 60, dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '수량', dataIndx: 'PART_QTY'},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {title: '외주업체', width: 75, dataIndx: 'OUTSIDE_COMP_NM'},
            // {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},    // 임시 감추기 처리 2021.05.07
            // {title: '외주업체', width: 75, dataIndx: 'OUTSIDE_COMP_NM'},
            // {title: '', dataIndx: 'na2'},
            {
                title: '검사현황', halign: 'center', colModel: [
                    {title: 'Seq.', dataIndx: 'INSPECT_RNUM'},
                    {title: '담당관', width: 65, dataIndx: 'INSPECT_USER_NM'},
                    {title: '등급', dataIndx: 'INSPECT_GRADE_NM',
                        render: function (ui) {
                            if (ui.rowData.INSPECT_GRADE == 'GRD040' || ui.rowData.INSPECT_GRADE == 'GRD050') {
                                return {style: 'color: #FF0000'};
                            }
                        }
                    },
                    {title: '수량', dataIndx: 'ERROR_QTY'},
                    {title: '검사코드', width: 115, dataIndx: 'INSPECT_RESULT_NM'},
                    {title: '상세내용', align: 'left', width: 200, dataIndx: 'INSPECT_DESC',
                        render: function (ui) {
                            return '<span title="' + ui.rowData.INSPECT_DESC+ '">' + ((typeof ui.cellData != 'undefined')? ui.cellData:'')+ '</span>';
                        }
                    },
                    {title: '발생공정', width: 60, dataIndx: 'ERROR_PROCESS_NM'},
                    {title: '원인', width: 115, dataIndx: 'ERROR_REASON_NM'},
                    {title: '조치', dataIndx: 'ERROR_ACTION_NM'},
                    {title: '조치방안 및 비고', width: 110, dataIndx: 'ERROR_NOTE'},
                    {title: '작성일시', width: 110, dataIndx: 'INSERT_DT'},
                ]
            }
        ];
        const botGridObj = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            selectionModel: { type: 'row', mode: 'single'},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: monthlyQualityBoardFilterRender},
            filterModel: {mode: 'OR'},
            // styleHead: {'background': '#ffe699'},
            colModel: botGridColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dataReady: function () {
                const totalRecords = this.option('dataModel.data').length;
                $('#monthly_quality_board_bot_total_records').html(totalRecords);
            },
            sortModel: {on: false},
            complete: function () {
                // 필터 옵션 생성
                let filterOpts = '<option value=\"\">All Fields</option>';
                let frozenOts = '<option value="0">Selected</option>';

                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === false || column.hidden === undefined;
                    if (hiddenYn && column.title) {
                        filterOpts += '<option value="' + column.dataIndx + '">' + column.title + '</option>';
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $('#monthlyQualityBoardFilterColumn').html(filterOpts);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
            }
        };
        const $botGrid = $('#' + botGridId).pqGrid(botGridObj);

        const chart1 = Highcharts.chart('monthly_quality_board_middle_wrap_div_2', {
            chart: {
                type: 'pie',
                height: '100%',
                styledMode: true
            },
            title: {
                text: '불량유형',
                align: 'left',
                style: {
                    fontSize: '1.4rem'
                }
            },
            credits: {
                enabled: false
            },
            subtitle: {
                text: '20219년 9월',
                align: 'right',
                y: 14,
                // verticalAlign: 'middle',
            },
            legend: {
                // maxHeight:80,
                // height:80,
                verticalAlign:'top',
                y: 135,
                floating:true
            },
            plotOptions: {
                pie: {
                    size: 105,
                    shadow: false,
                    center: ['50%', '0%'],
                    showInLegend: true,
                    dataLabels: {
                        useHTML: true,
                        // format: '<b>{point.percentage:.0f} %</b>',
                        format: '<span style="font-weight: bold;color: black;font-size: 13px;">{point.percentage:.0f} %</span>',
                        // style: {
                        //     fontSize: '13px',
                        //     fontWeight: 'bold',
                        //     textOutline: '',
                        //     color:'#000000'
                        // }
                        // format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            tooltip: {
                enabled: false,
                // valueSuffix: '%'
            },
            series: [{
                data: [],
                // size: '100%',
                innerSize: '50%',
                dataLabels: {
                    // formatter: function () {
                    //   return this.y > 5 ? this.point.name : null;
                    // },
                    distance: -10,
                }
                // id: 'versions'
            }]
        });

        const chart2 = Highcharts.chart('monthly_quality_board_middle_wrap_div_3', {
            chart: {
                type: 'pie',
                height: '100%',
                styledMode: true
            },
            title: {
                text: '발생공정',
                align: 'left',
                style: {
                    fontSize: '1.4rem'
                }
            },
            credits: {
                enabled: false
            },
            subtitle: {
                text: '20219년 9월',
                align: 'right',
                y: 14,
                // verticalAlign: 'middle',
            },
            legend: {
                verticalAlign:'top',
                y: 135,
                floating:true
            },
            plotOptions: {
                pie: {
                    size: 105,
                    shadow: false,
                    center: ['50%', '0%'],
                    showInLegend: true,
                    dataLabels: {
                        useHTML: true,
                        // format: '{point.percentage:.0f} %',
                        format: '<span style="font-weight: bold;color: black;font-size: 13px;">{point.percentage:.0f} %</span>',
                        // style: {
                        //     fontSize: '13px',
                        //     textOutline: '',
                        //     color:'#000000'
                        // }
                    }
                }
            },
            tooltip: {
                enabled: false,
                // valueSuffix: '%'
            },
            series: [{
                data: [],
                // size: '100%',
                innerSize: '50%',
                dataLabels: {
                    distance: -10,
                },
            }],
        });

        const chart3 = Highcharts.chart('monthly_quality_board_middle_wrap_div_4', {
            chart: {
                type: 'pie',
                height: (screen.availWidth >= 1800)?'100%':'93%',
                styledMode: true
            },
            credits: {
                enabled: false
            },
            title: {
                text: '발생원인',
                align: 'left',
                style: {
                    fontSize: '1.4rem'
                }
            },
            subtitle: {
                text: '20219년 9월',
                align: 'right',
                y: 14,
                // verticalAlign: 'middle',
            },
            legend: {
                verticalAlign:'top',
                y: 135,
                floating:true,
            },
            plotOptions: {
                pie: {
                    size: 105,
                    // size: '60%',
                    shadow: false,
                    center: ['50%', '0%'],
                    showInLegend: true,
                    dataLabels: {
                        useHTML: true,
                        // format: '{point.percentage:.0f} %',
                        format: '<span style="font-weight: bold;color: black;font-size: 13px;">{point.percentage:.0f} %</span>',
                        // style: {
                        //     fontSize: '13px',
                        //     textOutline: '',
                        //     color:'#000000'
                        // }
                    }
                }
            },
            tooltip: {
                enabled: false,
                // valueSuffix: '%'
            },
            series: [{
                data: [],
                // size: '100%',
                innerSize: '50%',
                dataLabels: {
                    distance: -10
                }
            }],
        });


        const chart4 = Highcharts.chart('monthly_quality_board_middle_wrap_div_5', {
            chart: {
                styledMode: true
            },
            title: {
                align: 'left',
                text: '월별 품질 현황',
                style: {
                    fontSize: '1.4rem'
                }
            },
            xAxis: {
                categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
            },
            yAxis: [{ // Primary yAxis
                 title: {
                    text: '대상품수',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '{value}',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                }
            }
            , { // Secondary yAxis  //TODO: remove secondary
                title: {
                    text: 'RATIO',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                labels: {
                    format: '{value}%',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                opposite: true
            }
            ],
            //TODO: legend show false
            legend: {
                align: 'center',
                // x: -30,
                verticalAlign: 'top',
                // y: 25,
                floating: true,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },
            credits: {
                enabled: false
            },
            tooltip: {
                shared: true
            },
            series: [{
                name: '검사등급',
                type: 'column',
                data: [],
                tooltip: {
                    valueSuffix: 'ea'
                }
            }, {
                name: '발생률(%)',
                type: 'spline',
                yAxis: 1,
                data: [],
                tooltip: {
                    valueSuffix: '%'
                }
            }]
        });
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

        const changeHighchartsSubtitle = function (element, text) {
            if (element) {
                element.setSubtitle({text: text});
            }
        };

        const changeHighchartsSeriesName = function (element, data) {
            if (element) {
                for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                    element.series[i].setName(data[i]);
                }
            }
        };

        const changeHighchartsSeriesData = function (element, data) {
            if (element) {
                for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                    element.series[i].setData(data[i]);
                }
            }
        };

        const changeHighchartsCategories = function (element, axis, data) {
            if (element) {
                if (axis.includes('x')) {
                    element.xAxis[0].setCategories(data);
                } else {
                    element.yAxis[0].setCategories(data);
                }
            }
        };
        //월별 품질 현황
        const changeMonthlyQualityStatus = function () {
            getJsonList('reportMapper.selectDailyActualOperateRate', function (arg) {
                const list = arg.list;
                const dataArray = [[], [], [], []];

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    nameArray.push(obj.DATA_TYPE_NM);

                    for (let j = 1; j <= 7; j++) {
                        dataArray[i].push(obj['DATA_VALUE_' + j]);
                    }
                }

                changeHighchartsSeriesData(chart4, dataArray);
            });
        };

        const updateTopColModel = function (value) {
            const colM = $topGrid.pqGrid('option').colModel;

                switch (value) {
                    case 'ORDER':
                        colM[0].colModel[0] = {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true};
                        colM[0].colModel[1] = {title: '발주처', dataIndx: 'ORDER_COMP_NM'};
                        break;
                    case 'OUTSIDE':
                        colM[0].colModel[0] = {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true};
                        colM[0].colModel[1] = {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'};
                        break;
                    case 'MATERIAL':
                        colM[0].colModel[0] = {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true};
                        colM[0].colModel[1] = {title: '재질', dataIndx: 'MATERIAL_TYPE_NM'};
                        break;
                }

                $topGrid.pqGrid('refreshCM', colM).pqGrid('refresh');
        };

        const updateTopPostData = function (value) {
            let queryId = '';

            switch (value) {
                case 'ORDER':
                    queryId = 'selectMonthlyQualityBoardFromOrder';
                    break;
                case 'OUTSIDE':
                    queryId = 'selectMonthlyQualityBoardFromOutside';
                    break;
                case 'MATERIAL':
                    queryId = 'selectMonthlyQualityBoardFromMaterialType';
                    break;
            }

            topFormData.queryId = 'reportMapper.' + queryId;

            $topGrid.pqGrid('option', 'dataModel.postData', function () {
                return topFormData;
            });
        };

        const topGridRefreshDataAndView = function () {
            $topGrid.pqGrid('refreshDataAndView');
        };

        const updateBotPostData = function (rowData) {
            // fnResetFrom('monthly_quality_board_bot_form');
            let asdfasdfasdf = $('#asdfasdfasdf').val();
            switch (asdfasdfasdf) {
                case 'ORDER':
                    $('#monthly_quality_board_bot_form > #ORDER_COMP_CD').val(rowData.ORDER_COMP_CD);
                    break;
                case 'OUTSIDE':
                    $('#monthly_quality_board_bot_form > #OUTSIDE_COMP_CD').val(rowData.OUTSIDE_COMP_CD);
                    break;
                case 'MATERIAL':
                    $('#monthly_quality_board_bot_form > #MATERIAL_TYPE').val(rowData.MATERIAL_TYPE);
                    break;
            }
        };

        const botGridRefreshDataAndView = function () {
            $botGrid.pqGrid('refreshDataAndView');
        };

        function monthlyQualityBoardFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value === val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                if (ui.column.dataType === 'integer') {
                    val = numberWithCommas(val);
                } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                    let o = new Date(val);
                    val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
                }

                let condition = $('#monthlyQualityBoardFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#monthlyQualityBoardFilterKeyword').val(),
                    txtUpper = (txt == null) ? '' : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === 'end') {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length !== valUpper.length) {
                        indx = -1;
                    }
                } else if (condition === 'contain') {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition === 'begin') {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }

                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                    // return val;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }

        const changeBadType = function () {
            let queryId = '';
            switch ($('#INSPECT_GRADE').val()) {
                case 'GRD030':
                case 'GRD040':
                    queryId = 'selectBadTypeCD';
                    break;
                case 'GRD050':
                    queryId = 'selectBadTypeReturn';
                    break;
            }

            getJsonList('reportMapper.' + queryId, function (arg) {
                const list = arg.list;
                const array = [];
                const dataArray = [];
                let subtitle = '';

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = {
                        name: list[i].BAD_TYPE_NM,
                        y: list[i].CNT
                        // color: colors[i]
                    };
                    dataArray[i] = obj;
                }

                array[0] = dataArray;

                subtitle = $('#monthly_quality_board_start_year').val() + '.' + $('#monthly_quality_board_start_month').val() + '월';
                subtitle += $('#monthly_quality_board_top_form').find('#RANGE_SEARCH').prop('checked') ? ' ~ ' + $('#monthly_quality_board_end_year').val() + '.' + $('#monthly_quality_board_end_month').val() + '월' : '';
                changeHighchartsSubtitle(chart1, subtitle);
                changeHighchartsSeriesData(chart1, array);
            });
        };
        const changeGenerationProcess = function () {
            let queryId = '';
            switch ($('#INSPECT_GRADE').val()) {
                case 'GRD030':
                case 'GRD040':
                    queryId = 'selectGenerationProcessCD';
                    break;
                case 'GRD050':
                    queryId = 'selectGenerationProcessReturn';
                    break;
            }

            getJsonList('reportMapper.' + queryId, function (arg) {
                const list = arg.list;
                const array = [];
                const dataArray = [];
                let subtitle = '';

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = {
                        name: list[i].ERROR_PROCESS_NM,
                        y: list[i].CNT
                        // color: colors[i]
                    };
                    dataArray[i] = obj;
                }

                array[0] = dataArray;

                subtitle = $('#monthly_quality_board_start_year').val() + '.' + $('#monthly_quality_board_start_month').val() + '월';
                subtitle += $('#monthly_quality_board_top_form').find('#RANGE_SEARCH').prop('checked') ? ' ~ ' + $('#monthly_quality_board_end_year').val() + '.' + $('#monthly_quality_board_end_month').val() + '월' : '';

                changeHighchartsSubtitle(chart2, subtitle);
                changeHighchartsSeriesData(chart2, array);
            });
        };

        const changeCauses = function () {
            let queryId = '';
            switch ($('#INSPECT_GRADE').val()) {
                case 'GRD030':
                case 'GRD040':
                    queryId = 'selectCausesCD';
                    break;
                case 'GRD050':
                    queryId = 'selectCausesReturn';
                    break;
            }

            getJsonList('reportMapper.' + queryId, function (arg) {
                const list = arg.list;
                const array = [];
                const dataArray = [];
                let subtitle = '';

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = {
                        name: list[i].ERROR_PROCESS_NM,
                        y: list[i].CNT
                        // color: colors[i]
                    };
                    dataArray[i] = obj;
                }

                array[0] = dataArray;

                subtitle = $('#monthly_quality_board_start_year').val() + '.' + $('#monthly_quality_board_start_month').val() + '월';
                subtitle += $('#monthly_quality_board_top_form').find('#RANGE_SEARCH').prop('checked') ? ' ~ ' + $('#monthly_quality_board_end_year').val() + '.' + $('#monthly_quality_board_end_month').val() + '월' : '';

                changeHighchartsSubtitle(chart3, subtitle);
                changeHighchartsSeriesData(chart3, array);
            });
        };

        const changeAnnualQualityStatus = function () {
            getJsonList('reportMapper.selectAnnualQualityStatus', function (arg) {
                const list = arg.list;
                const dataArray = [[], []];

                for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                    const obj = list[i];
                    for (let j = 1; j <= 12; j++) {
                        const value = obj['DATA_VALUE_' + String(j).padStart(2, '0')] || 0;
                        dataArray[i].push(value);
                    }
                }

                changeHighchartsSeriesData(chart4, dataArray);
            });
        };
        /* function */
        /* event */
        $('#monthly_quality_board_top_form').on('change', function () {
            topFormData = fnFormToJsonArrayData('#monthly_quality_board_top_form');
            bottom_combotree.clearSelection();
            setTimeout(function() {
                var grade = $("#INSPECT_GRADE").val();
                $('span[data-id="'+grade+'"]').trigger('click')
                // bottom_combotree.singleItemClick($('span[data-id="'+grade+'"]'));
            },100);
            // $('#monthly_quality_board_bot_form').find("#BOTTOM_INSPECT_GRADE").val($("#INSPECT_GRADE").val());
            $("#monthly_quality_board_bot_form").find("#SEL_BOTT_INSPECT_GRADE").val("'"+$("#INSPECT_GRADE").val()+"'");
            const asdfasdfasdf = $('#asdfasdfasdf').val();
            updateTopPostData(asdfasdfasdf);
            updateTopColModel(asdfasdfasdf);
            topGridRefreshDataAndView();

            changeBadType();
            changeGenerationProcess();
            changeCauses();
            changeAnnualQualityStatus();
        });

        $('#monthly_quality_board_top_form').find('#RANGE_SEARCH').on('change', function () {
            const isNotChecked = !$(this).prop('checked');
            $('#monthly_quality_board_end_year').prop('disabled', isNotChecked);
            $('#monthly_quality_board_end_month').prop('disabled', isNotChecked);
        });
        $('#monthly_quality_board_bot_form').find('#BOTTOM_INSPECT_GRADE').on('change', function () {
            let SEL_INSPECT_GRADE_SELECT = $("#monthly_quality_board_bot_form").find("#HIDDEN_BOTTOM_INSPECT_GRADE").val();
            // let arr = SEL_INSPECT_GRADE_SELECT.trim().split(",");
            // let rtn = "";
            // if(SEL_INSPECT_GRADE_SELECT != ""){
            //     $.each(arr, function(row, key) {
            //         console.log($(".ComboTreeItemChlid").find("#check" + key.trim()))
            //         console.log($(".ComboTreeItemChlid").find("#check" + key.trim()).parent()[0])
            //         console.log($(".ComboTreeItemChlid").find("#check" + key.trim()).parent()[0].dataset)
            //         let id = $(".ComboTreeItemChlid").find("#check" + key.trim()).parent()[0].dataset.id
            //         rtn += " '" + id + "',";
            //     });
            //     rtn = rtn.substring(0,rtn.length-1);
            // }
            $("#monthly_quality_board_bot_form").find("#SEL_BOTT_INSPECT_GRADE").val(SEL_INSPECT_GRADE_SELECT);
            $botGrid.pqGrid('option', 'dataModel.postData', function () {
                const botFormData = fnFormToJsonArrayData('#monthly_quality_board_bot_form');
                const mergeFormData = $.extend(true, {}, topFormData, botFormData);

                return mergeFormData;
            });
            $botGrid.pqGrid('refreshDataAndView');
        });

        $('#monthlyQualityBoardFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($botGrid, 'monthlyQualityBoardFilterKeyword', 'monthlyQualityBoardFilterCondition', 'monthlyQualityBoardFilterColumn');
            },
            'search': function () {
                fnFilterHandler($botGrid, 'monthlyQualityBoardFilterKeyword', 'monthlyQualityBoardFilterCondition', 'monthlyQualityBoardFilterColumn');
            }
        });
        /* event */

        $('#monthly_quality_board_top_form').change();

    });
</script>