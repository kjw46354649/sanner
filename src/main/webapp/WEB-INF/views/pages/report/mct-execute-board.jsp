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
<button type="button" class="defaultBtn radius btn-120w blue" data-toggle="modal" data-target="#setWorkingTimeModal">Working Time 설정</button>
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

                fnPostAjax(function (data) {
                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                        $workingTimeGrid.pqGrid('refreshDataAndView');
                    });
                }, parameters, '');
            }
        });
        /* event */
    });
</script>