<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div class="page onegrid">
    <div class="bottomWrap">
        <div class="tableNotSearchOneGridWrap">
            <div class="conWrap">
                <div class="left-40Warp">
                    <div class="buttonWrap right_sort">
                        <form class="form-inline" id="business_status_search_form" name="business_status_search_form" role="form">
                            <input type="hidden" name="queryId" id="queryId" value="orderMapper.businessOutgoingList">
                            <span class="ipu_wrap left_float">
                                <label for="BUSINESS_STATUS_INNER_DUE_DT">조회납기일자</label>
                                <input type="text" class="wd_100" name="INNER_DUE_DT" id="BUSINESS_STATUS_INNER_DUE_DT">
                            </span>
                            <span class="slt_wrap mg-left10">
                                <label class="label_50" for="ORDER_COMP_CHARGE">발주처</label>
                                <select class="wd_100" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                    <option value="">All</option>
                                </select>
                                <label class="label_50" for="ORDER_STAFF_SEQ">담당자</label>
                                <select class="wd_100 mg-left10" name="ORDER_STAFF_SEQ" id="ORDER_STAFF_SEQ">
                                    <option value="">All</option>
                                </select>
                            </span>
                        </form>
                    </div>
                    <div id="business_status_grid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="business_status_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
                <div class="right-60Warp" id="controlBusinessStatus">
                    <div id="business_status_calendar"></div>
                    <div class="">
                        <div class="left_float left-Warp">
                            <div class="left_float"><h2>긴급주문 목록</h2></div>
                            <div class="left_float" id="business_emergency_grid"></div>
                            <div class="right_float">
                                전체 조회 건수 (Total : <span id="business_emergency_records" style="color: #00b3ee">0</span>)
                            </div>
                        </div>
                        <div class="left_float right-Warp" style="padding-left:5px;">
                            <div class="left_float"><h2>납기지연 목록</h2></div>
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
                $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker('setDate', info.dateStr);
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
                    $.ajax({
                        url: '/json-list',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'queryId': 'orderMapper.businessMonthOutgoingList',
                            'SEL_START_DATE': moment(info.startStr).format('YYYYMMDD'),
                            'SEL_END_DATE': moment(info.endStr).format('YYYYMMDD')
                        },
                        success: function(data) {
                            successCallback(data.list);
                        }
                    });
                },
                color: "#333bff",   // an option!
                textColor: '#fff' // an option!
            }]
            // , events: function (info, successCallback, failureCallback) {
            //     $.ajax({
            //         url: '/json-list',
            //         type: 'POST',
            //         dataType: 'json',
            //         data: {
            //             'queryId': 'orderMapper.businessMonthOutgoingList',
            //             'SEL_START_DATE': moment(info.startStr).format('YYYYMMDD'),
            //             'SEL_END_DATE': moment(info.endStr).format('YYYYMMDD')
            //         },
            //         success: function(data) {
            //             console.log("################################################");
            //             console.log(data.list);
            //             successCallback(data.list);
            //         }
            //     });
            // }
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


        $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker();
        $('#business_status_search_form').find('#BUSINESS_STATUS_INNER_DUE_DT').datepicker('setDate', 'today');
        fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_STAFF_SEQ'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getCompanyStaffList'}
        });

        $('#business_status_search_form').find('#ORDER_COMP_CD').change(function() {
            fnCommCodeDatasourceSelectBoxCreate($('#business_status_search_form').find('#ORDER_STAFF_SEQ'), 'all', {
                'url': '/json-list',
                'data': {'queryId': 'dataSource.getCompanyStaffList', 'COMP_CD': $(this).val()}
            });
        });

        let businessStatusColModel = [
            {title: '긴', dataType: 'string', dataIndx: 'EMERGENCY_YN_NM', width: 40,},
            {title: '중', dataType: 'string', dataIndx: '', width: 40,},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 50},
            {title: '출고', dataType: 'string', dataIndx: 'DELIVERY_DT', width: 50},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM', width: 120},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', width: 80},
            {title: '현재위치', dataType: 'string', dataIndx: 'LAST_POP_POSITION', width: 80},
            {title: '검사', dataType: 'string', dataIndx: 'INSPECT_GRADE', width: 30},
            {title: '담당자', dataType: 'string', dataIndx: 'USER_NM', width: 80}
        ];

        let businessStatusObj = {
            height: 825, width: 555, minHeight: "auto",
            selectionModel: { type: 'row', mode: 'single'}, rowHtHead: 15, numberCell: {title: 'No.'},
            swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            // scrollModel: { autoFit: true },
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
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
            toolbar: false,
        };
        $businessOutgoingListGrid = $('#' + businessOutgoingListGridId).pqGrid(businessStatusObj);

        let businessEmergencyColModel = [
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 50},
            {title: '출고', dataType: 'string', dataIndx: 'DELIVERY_DT', width: 50},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', width: 80}
        ];

        let businessEmergencyObj = {
            height: 228, width: 500, minHeight: "auto", rowHtHead: 15, numberCell: {title: 'No.'},
            selectionModel: { type: 'row', mode: 'single'}, swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: businessEmergencyColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'businessEmergencyList'},
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessEmergencyListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_emergency_records').html(totalRecords);
            },
            toolbar: false,
        };
        $businessEmergencyListGrid = $('#' + businessEmergencyListGridId).pqGrid(businessEmergencyObj);

        let businessOverOrderColModel = [
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 50},
            {title: '출고', dataType: 'string', dataIndx: 'DELIVERY_DT', width: 50},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', width: 80},
            {title: '담당자', dataType: 'string', dataIndx: 'USER_NM', width: 80}
        ];

        let businessOverOrderObj = {
            height: 228, width: 500, minHeight: "auto", rowHtHead: 15, numberCell: {title: 'No.'},
            selectionModel: { type: 'row', mode: 'single'}, swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: businessOverOrderColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'businessOverOrderList'},
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $businessOverOrderListGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#business_over_total_records').html(totalRecords);
            },
            toolbar: false,
        };
        $businessOverOrderListGrid = $('#' + businessOverOrderListGridId).pqGrid(businessOverOrderObj);

        /*let businessOverDangerColModel = [
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 50},
            {title: '출고', dataType: 'string', dataIndx: 'DELIVERY_DT', width: 50},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 150},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 50},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', width: 80},
            {title: '담당자', dataType: 'string', dataIndx: 'USER_NM', width: 80}
        ];*/

        /*let businessOverDangerObj = {
            height: 228, width: 330, minHeight: "auto", numberCell: {title: 'No.'},
            selectionModel: { type: 'row', mode: 'single'}, swipeModel: {on: false}, trackModel: {on: true},
            collapsible: false, resizable: false, flexWidth: false, showTitle: false,
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
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
        });
    });

</script>