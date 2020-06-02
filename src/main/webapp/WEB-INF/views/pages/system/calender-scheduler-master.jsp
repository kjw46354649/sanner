<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-05-27
  Time: 오후 8:43
  To change this template use File | Settings | File Templates.
--%>
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
                <div id="business_status_calendar"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    let schedulerCalendar;

    $(function () {
        'use strict';

        function onCalendarDayClick(date, allDay, jsEvent, view) {
            // Check to see whether the mouse was hovering over our day corner overlay
            // that is itself applied to the fullCalendar's selection overlay div.
            // If it is, then we know we clicked on the day number and not some other
            // part of the cell.
            if ($('.my-cell-overlay-day-corner').is(':hover')) {
                alert('Click!');
            }
        }

        let schedulerCalendarEl = document.getElementById('business_status_calendar');
        let schedulerCalendarProps = {
            customButtons: {
                holidaySetting: {
                    text: '휴일정보 설정',
                    click: function() {
                        alert('clicked the custom button!');
                    }
                }
            }
            , plugins : [ 'interaction', 'dayGrid' ] //월 캘린더
            , height: 860
            , selectable: true
            , selectMirror: true
            , select: function(arg) {
                let title = prompt('일정 메모');
                if (title) {
                    let parameters = {'url': '/json-create', 'data': {'queryId':'systemMapper.insertSchedulerNote', 'CAL_DT': arg.startStr, 'NOTE':title}};
                    fnPostAjax(function (data, callFunctionParam) {
                        schedulerCalendar.refetchEvents();
                    }, parameters, '');
                }
                schedulerCalendar.unselect()
            }
            , header : { left  :'holidaySetting', center : 'title', right : 'prev,next today'
            }
            , locale : 'ko' // 한국어 설정이다. 하지만 date Cell 포맷팅이 어려우니 그냥 주석으로
            , dayClick: function(date){
                console.log(date);
            }
            , titleFormat : function(date) { // title 설정
                return date.date.year +"년 "+(date.date.month +1)+"월";
            }
            , columnHeaderText : function(date) {
                var weekList = ['일','월','화','수','목','금','토'];
                return weekList[date.getDay()]; // 헤더 var weekList = ['일','월','화','수','목','금','토'];
            }
            , datesRender: function(info) {
                schedulerCalendar.getEventSources();
            }
            , defaultDate : TODAY // 기준일자
            , editable : true
            , eventLimit : true // allow "more" link when too many events
            , eventColor : '#5c6a96' // 이벤트 색상
            , eventBorderColor : '#5c6a96'
            , eventBackgroundColor : '#ffffff'
            // , events : eventData
            , eventClick : function(calEvent, jsEvent, view) {
                alert('Event: ' + calEvent.title);
                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                alert('View: ' + view.name);
                console.log("eventClick");
                console.log(date);
                console.log(jsEvent);
                console.log(view);
                let title = prompt('일정 메모');
                if (title) {
                    let parameters = {'url': '/json-create', 'data': {'queryId':'systemMapper.insertSchedulerNote', 'CAL_DT': arg.startStr, 'NOTE':title}};
                    fnPostAjax(function (data, callFunctionParam) {
                        schedulerCalendar.refetchEvents();
                    }, parameters, '');
                }
                schedulerCalendar.unselect()
            } // 이벤트 클릭 시
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
                        url: '/json-list', type: 'POST', dataType: 'json', data: {
                            'queryId': 'systemMapper.selectSchedulerNote',
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
        };
        schedulerCalendar = new FullCalendar.Calendar(schedulerCalendarEl, schedulerCalendarProps);
        schedulerCalendar.render();

        let fn_calDateClick = function(){
            alert("test");
        };

    });

</script>
