<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2021-01-27
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<%--<jsp:include page="/WEB-INF/views/attr/tabs/body-menu.jsp"/>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문 현황</title>
</head>
<body>
<div class="page onegrid">
    <div class="bottomWrap">
        <div class="tableNotSearchOneGridWrap" style="margin-top: 10px;margin-right: 15px;">
            <div class="conWrap" style="height: 1060px;">
                <div class="left-40Warp" style="width: calc(100% - 960px);">
                    <div class="buttonWrap">
                        <form class="form-inline" id="business_status_search_form" name="business_status_search_form" role="form">
                            <input type="hidden" name="queryId" id="queryId" value="orderMapper.businessOutgoingList">
                            <div class="d-flex align-items-center">
                                <div>
                                    <span class="ipu_wrap">
                                        <label for="BUSINESS_STATUS_INNER_DUE_DT">조회납기일자</label>
                                        <input type="text" class="wd_100" name="INNER_DUE_DT" id="BUSINESS_STATUS_INNER_DUE_DT">
                                    </span>
                                </div>
                                <div class="ml-auto">
                                    <span class="timer">
                                        <button type="button" id="business_refresh_timer"><img src="/resource/asset/images/common/btn_stopwatch.png" alt="타이머"></button>
                                    </span>
                                    <span class="refresh">
                                        <button type="button" id="business_status_refresh"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button>
                                    </span>
                                    <span class="slt_wrap ml-10">
                                        <label for="ORDER_COMP_CD">발주처</label>
                                        <select class="wd_100" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                            <option value=""><spring:message code="com.form.top.all.option"/></option>
                                        </select>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="business_status_grid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="business_status_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
                <div class="right-60Warp" id="controlBusinessStatus" style="width: 945px;">
                    <div id="business_status_calendar"></div>
                    <div class="">
                        <div class="left_float left-Warp" style="width: 475px;">
                            <div class="left_float"><h2 style="color: red">긴급/반품 목록</h2></div>
                            <div class="left_float" id="business_emergency_grid"></div>
                            <div class="right_float">
                                전체 조회 건수 (Total : <span id="business_emergency_records" style="color: #00b3ee">0</span>)
                            </div>
                        </div>
                        <div class="left_float right-Warp" style="width: 455px;padding-left: 10px;">
                            <div class="left_float"><h2 style="color: red">납기지연 목록</h2></div>
                            <div class="left_float" id="business_over_order_grid"></div>
                            <div class="right_float">
                                전체 조회 건수 (Total : <span id="business_over_total_records" style="color: #00b3ee">0</span>)
                            </div>
                        </div>
                        <%--                        <div class="right_float right-Warp">--%>
                        <%--                            <div class="left_float"><h2>납기지연 위험 목록</h2></div>--%>
                        <%--                            <div class="left_float" id="business_over_danger_grid"></div>--%>
                        <%--                            <div class="right_float">--%>
                        <%--                                전체 조회 건수 (Total : <span id="business_over_danger_total_records" style="color: #00b3ee">0</span>)--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                    </div>
                    <%--                    <div class="right_sort">--%>
                    <%--                        전체 조회 건수 (Total : <span id="authority_access_menu_total_records" style="color: #00b3ee">0</span>)--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="timer_pop" style="display: none;" >
    <div class="layerPopup" style="width: 200px;height: 150px;z-index:9999;margin: inherit;top: 40px;left: 26%;font-size: 14px;">
        <div class="mb05">
            <input type="radio" id="none_set" name="timer_setting" value="0"
                   checked>
            <label for="none_set">미설정</label>
        </div>
        <div class="mb05">
            <input type="radio" id="min_1" name="timer_setting" value="1">
            <label for="min_1">1분</label>
        </div>
        <div class="mb05">
            <input type="radio" id="min_5" name="timer_setting" value="5">
            <label for="min_5">5분</label>
        </div>
        <div class="mb05">
            <input type="radio" id="min_10" name="timer_setting" value="10">
            <label for="min_10">10분</label>
        </div>
        <button type="button" class="pop_close mt-10 mr-8" id="close_timerPop">닫기</button>
    </div>
</div>
<script type="text/javascript">

    let $businessOutgoingListGrid;
    let businessOutgoingListGridId = 'business_status_grid';

    /** business emergency grid */
    let $businessEmergencyListGrid;
    let businessEmergencyListGridId = 'business_emergency_grid';

    /** business Over Order grid */
    let $businessOverOrderListGrid;
    let businessOverOrderListGridId = 'business_over_order_grid';

    /** business Will Over Order Danger grid */
    /*let $businessOverDangerListGrid;
    let businessOverDangerListGridId = 'business_over_danger_grid';*/
    let businessCalendar;

    $(function () {
        'use strict';
        let businessCalendarEl = document.getElementById('business_status_calendar');
        let businessCalendarProps = {
            plugins : [ 'interaction', 'dayGrid' ] //월 캘린더
            , height: 600
            , header : { left  :''
                , center : 'title'
                , right : 'prev,next today'
            }
            //, locale : 'ko' // 한국어 설정이다. 하지만 date Cell 포맷팅이 어려우니 그냥 주석으로
            // titleFormat: { // will produce something like "Tuesday, September 18, 2018"
            //     month: '2-digit',
            //     year: 'numeric',
            //     day: 'numeric',
            //     weekday: 'long'
            // }
            , titleFormat : function(date) { // title 설정
                return date.date.year +"년 "+(date.date.month +1)+"월";
            }
            , columnHeaderText : function(date) {
                var weekList = ['일','월','화','수','목','금','토'];
                return weekList[date.getDay()]; // 헤더 var weekList = ['일','월','화','수','목','금','토'];
            }
            , datesRender: function(info) {
                businessCalendar.getEventSources();
            }
            , dateClick: function(info) {
                $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker('setDate', info.dateStr.replace(/-/g, '/'));
                $businessOutgoingListGrid.pqGrid('option', 'dataModel.postData', function () {
                    return (fnFormToJsonArrayData('#business_status_search_form'));
                });
                $businessOutgoingListGrid.pqGrid('refreshDataAndView');
                // info.dayEl.style.backgroundColor = 'red';
            }
            , selectable: true
            , defaultDate : TODAY // 기준일자
            , editable : false
            , eventLimit : true // allow "more" link when too many events
            , eventColor : '#5c6a96' // 이벤트 색상
            , eventBorderColor : '#5c6a96'
            , eventBackgroundColor : '#ffffff'
            // , events : eventData
            // , eventClick : fn_calEventClick // 이벤트 클릭 시
            // , dateClick : fn_calDateClick // 백그라운드 클릭시
            , droppable : false // this allows things to be dropped onto the calendar
            // , drop : fn_calDrop  // 그리드에서 긁어올 때
            // , eventAllow :function (dropInfo, draggedEvent) { //드롭 가능한 위치 설정
            // , dropAccept : '.cool-event' // 긁어올 수 있는 draggable 설정
            // , eventReceive : function (event, xhr) { debugger; return false;    } // drag 종료 시
            // , eventOverlap: function(stillEvent, movingEvent) {debugger; return false;    } // 이벤트가 겹칠 때
            // , eventSourceSuccess : function(content, xhr) {debugger; return false;    }
            // , eventDragStop : function(stillEvent, movingEvent) {debugger; return false;    }
            // , eventDrop  : function(stillEvent, movingEvent) {debugger; return false;    }
            , eventSources: [{
                events: function (info, successCallback, failureCallback) {
                    // console.log(moment(info.startStr).format('YYYYMMDD'));
                    $.ajax({
                        url: '/json-list',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'queryId': 'orderMapper.businessMonthOutgoingList',
                            'SEL_START_DATE': moment(info.startStr).format('YYYYMMDD'),
                            'SEL_END_DATE': moment(info.endStr).format('YYYYMMDD'),
                            'ORDER_COMP_CD': $('#business_status_search_form').find("#ORDER_COMP_CD").val(),
                            // 'ORDER_COMP_CHARGE': $('#business_status_search_form').find("#ORDER_STAFF_SEQ").val()
                        },
                        success: function (data) {
                            successCallback(data.list);
                        }
                    });
                },
                // color: "#333bff",   // an option!
                textColor: '#000000' // an option!
            }]
            , eventOrder: "SORT_1,-SORT_2" // Determines the ordering events within the same day.
        };
        businessCalendar = new FullCalendar.Calendar(businessCalendarEl, businessCalendarProps);
        businessCalendar.render();

        // let loadMonthSalesList = function(event){
        //     let parameters = {
        //         'url': '/json-list',
        //         'data': {'queryId':'orderMapper.businessMonthOutgoingList', 'SEL_CALENDAR_DATE':moment(businessCalendar.getDate()).format('YYYYMM')}
        //     };
        //     fnPostAjax(function (data, callFunctionParam) {
        //
        //         console.log(data);
        //
        //
        //     }, parameters, '');
        //
        // };

        // loadMonthSalesList();

        $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker('setDate', 'today');
        fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        // fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_STAFF_SEQ'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.selectOrderCompChargeList',
        //         'COMP_CD': $('#business_status_search_form').find("#ORDER_COMP_CD").val(),
        //     }
        //     // 'data': {'queryId': 'dataSource.getCompanyStaffList'}
        // });

        // $('#business_status_search_form').find('#ORDER_COMP_CD').change(function() {
        //     fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_STAFF_SEQ'), 'all', {
        //         'url': '/json-list',
        //         'data': {'queryId': 'dataSource.getCompanyStaffList', 'COMP_CD': $(this).val()}
        //     });
        // });

        let businessStatusColModel = [
            {dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: '주문', dataIndx: 'CONTROL_STATUS_NM', minWidth: 40},
            {title: '긴', dataIndx: 'EMERGENCY_YN_NM', minWidth: 30, styleHead: {'color': 'red'}},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', minWidth: 70},
            {title: '납기', minWidth: 40, dataIndx: 'ORDER_DUE_DT'},
            {title: '출고', minWidth: 40, dataIndx: 'OUT_FINISH_DT'},
            {title: '', align: 'center', minWidth: 30,
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
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업지시번호', align: 'left', minWidth: 150, dataIndx: 'CONTROL_NUM'},
            {
                title: '', minWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '수량', dataIndx: 'ORDER_QTY', minWidth: 30},
            {title: '접수번호', dataIndx: 'REGIST_NUM', minWidth: 130},
            {title: '발주번호', dataIndx: 'ORDER_NUM', minWidth: 90},
            {title: '도면번호', align: 'left', width: 128, dataIndx: 'DRAWING_NUM'},
            {title: '진행상태', dataIndx: 'PART_STATUS', width: 72},
            {title: '현재위치', dataIndx: 'LAST_POP_POSITION', width: 63},
            {title: '검사', dataIndx: 'INSPECT_GRADE_NM', minWidth: 30}
        ];

        let businessStatusObj = {
            height: 995, width: 885, minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15, numberCell: {title: 'No.'},
            swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            // scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: businessStatusColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('business_status_search_form'),
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessOutgoingListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_status_total_records').html(totalRecords);
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
                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
            },
            toolbar: false,
        };
        $businessOutgoingListGrid = $('#' + businessOutgoingListGridId).pqGrid(businessStatusObj);

        let businessEmergencyColModel = [
            {dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '구분', minWidth: 40, dataIndx: 'TYPE_NM',
                render: function (ui) {
                    switch (ui.cellData) {
                        case '긴급':
                            return {style: 'color: #FF0000;'};
                        case '반품':
                            return {style: 'background-color: #FAFAAA; color: #FF0000;'};
                    }
                }
            },
            {title: '납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {title: '작업지시번호', dataIndx: 'CONTROL_PART_INFO', width: 180},
            {
                title: '', minWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON', editable: false,
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '수량', dataIndx: 'CONTROL_PART_QTY_INFO', minWidth: 30},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM', width: 60}
        ];

        let businessEmergencyObj = {
            height: 400, width: 475, minHeight: "auto", rowHtHead: 15, numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'}, swipeModel: {on: false}, scrollModel: {autoFit: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'}, //to vertically center align the header cells.
            colModel: businessEmergencyColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'orderMapper.selectBusinessEmergencyList'},
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessEmergencyListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_emergency_records').html(totalRecords);
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
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
                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            toolbar: false,
        };
        $businessEmergencyListGrid = $('#' + businessEmergencyListGridId).pqGrid(businessEmergencyObj);

        let businessOverOrderColModel = [
            {dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {title: '작업지시번호', dataIndx: 'CONTROL_PART_INFO', width: 180},
            {
                title: '', minWidth: 30, dataIndx: 'DRAWING_NUM_BUTTON', editable: false,
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '수량', dataIndx: 'CONTROL_PART_QTY_INFO', minWidth: 30},
            {title: '진행상태', dataIndx: 'PART_STATUS_NM', width: 60}
        ];

        let businessOverOrderObj = {
            height: 400, width: 465, minHeight: "auto", rowHtHead: 15, numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'}, swipeModel: {on: false}, scrollModel: {autoFit: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'}, //to vertically center align the header cells.
            colModel: businessOverOrderColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'orderMapper.selectBusinessOverOrderList'},
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessOverOrderListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_over_total_records').html(totalRecords);
            },
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        callQuickRowChangeDrawingImageViewer(Item.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                })
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
                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
            toolbar: false,
        };
        $businessOverOrderListGrid = $('#' + businessOverOrderListGridId).pqGrid(businessOverOrderObj);

        /*let businessOverDangerColModel = [
            {title: '납기', dataIndx: 'ORDER_DUE_DT', width: 50},
            {title: '출고', dataIndx: 'DELIVERY_DT', width: 50},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '수량', dataIndx: 'ORDER_QTY', width: 50},
            {title: '진행상태', dataIndx: 'PART_STATUS', width: 80},
            {title: '담당자', dataIndx: 'USER_NM', width: 80}
        ];*/

        /*let businessOverDangerObj = {
            height: 228, width: 330, minHeight: "auto", numberCell: {title: 'No.'},
            selectionModel: { type: 'row', mode: 'single'}, swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: businessOverDangerColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'businessOverDangerList'},
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessOverDangerListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_over_danger_total_records').html(totalRecords);
            },
            toolbar: false,
        };*/
        // $businessOverDangerListGrid = $('#' + businessOverDangerListGridId).pqGrid(businessOverDangerObj);


        $('#business_status_search_form').on('change', function () {
            $businessOutgoingListGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#business_status_search_form'));
            });
            $businessOutgoingListGrid.pqGrid('refreshDataAndView');
            businessCalendar.refetchEvents();
        });

        $('#business_status_refresh').on('click', function () {
            $businessOutgoingListGrid.pqGrid('refreshDataAndView');
            $businessEmergencyListGrid.pqGrid('refreshDataAndView');
            $businessOverOrderListGrid.pqGrid('refreshDataAndView');
            businessCalendar.refetchEvents();
            var today = new Date();
            businessCalendar.gotoDate(today);
        });
        $('#business_refresh_timer').on('click', function () {
            $("#timer_pop").show();
        });
        $('#close_timerPop').on('click', function () {
            $("#timer_pop").hide();
        });

        let timerId = 0;
        $('input[name="timer_setting"]').change(function() {
            // 모든 radio를 순회한다.
            let selectVal = $(this).val();
            let timer = 0;
            switch (selectVal) {
                case "1": // 1뷴
                    timer = 1000 * 60;
                    break;
                case "5": // 5분
                    timer = 1000 * 60 * 5;
                    break;
                case "10": // 10분
                    timer = 1000 * 60  * 10;
                    break;

            }
            clearInterval(timerId);
            if(selectVal !== "0") {
                timerId = setInterval(function () {
                    $businessOutgoingListGrid.pqGrid('refreshDataAndView');
                    $businessEmergencyListGrid.pqGrid('refreshDataAndView');
                    $businessOverOrderListGrid.pqGrid('refreshDataAndView');
                    businessCalendar.refetchEvents();
                    var today = new Date();
                    businessCalendar.gotoDate(today);
                },timer)
            }
        });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
