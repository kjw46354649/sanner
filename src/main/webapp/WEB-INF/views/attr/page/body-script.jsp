<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-03-05
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<link rel="stylesheet"
      href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css"/>
<script src="/resource/main/js/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<!-- Bootstrap -->
<script src="/resource/main/js/bootstrap.js"></script>
<!-- App -->
<script src="/resource/main/js/app.js"></script>
<script src="/resource/main/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/resource/main/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
<script src="/resource/main/js/charts/sparkline/jquery.sparkline.min.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.min.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.tooltip.min.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.spline.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.pie.min.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.resize.js"></script>
<script src="/resource/main/js/charts/flot/jquery.flot.grow.js"></script>
<script src="/resource/main/js/charts/flot/demo.js"></script>

<script src="/resource/main/js/calendar/bootstrap_calendar.js"></script>
<script src="/resource/main/js/calendar/demo.js"></script>

<script src="/resource/main/js/sortable/jquery.sortable.js"></script>
<script src="/resource/main/js/app.plugin.js"></script>

<script src="/resource/plugins/paramquery/pqgrid.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script>
    /**
     * @description 그리드 생성
     * @param {string} gridId
     * @param {object} postData
     * @param {object} colModel
     * @param {object} toolbar
     */
    var fnCreatePQGrid = function (gridId, postData, colModel, toolbar) {
        'use strict';
        var obj = {
            // width: 700,
            // height: 400,
            collapsible: false,
            resizable: true,
            // title: '',
            // pageModel: {type: "remote"},
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: colModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'GET',
                url: '/paramQueryGridSelect',
                postData: postData,
                // recIndx: 'USER_ID',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                    // return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            toolbar: toolbar
        };
        $('#' + gridId).pqGrid(obj);
    };
    /**
     * @description 그리드 데이터 삽입/갱신
     * @param {string} gridId
     * @param {array} insertQueryList
     * @param {array} updateQueryList
     */
    var fnModifyPQGrid = function (gridId, insertQueryList, updateQueryList) {
        'use strict';
        var grid = $('#' + gridId).pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (grid.isDirty()) {
            var changes = grid.getChanges({format: 'byVal'});
            var QUERY_ID_ARRAY = {
                'insertQueryId': insertQueryList,
                'updateQueryId': updateQueryList,
            };
            changes.queryIdList = QUERY_ID_ARRAY;

            $.ajax({
                type: 'POST',
                url: '/paramQueryModifyGrid',
                async: true,
                dataType: 'json',
                data: {'data': JSON.stringify(changes)},
                success: function (result) {
                    //FIXME: 캡슐화 후 refresh 안 됨
                    $('#' + gridId).pqGrid('refreshDataAndView');
                },
                error: function (e) {
                    console.error(e);
                }
            });
        }
    };
    /**
     * @description 그리드 데이터 삭제
     * @param {string} gridId
     * @param {array} selectedRowIndex
     * @param {string} QUERY_ID
     */
    var fnDeletePQGrid = function (gridId, selectedRowIndex, QUERY_ID) {
        'use strict';
        var rowDataArray = [];
        var selectedRowCount = selectedRowIndex.length;

        for (var i = 0; i < selectedRowCount; i++) {
            rowDataArray[i] = $('#' + gridId).pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
            rowDataArray[i].queryId = QUERY_ID;
        }

        $.ajax({
            type: 'POST',
            url: '/paramQueryDeleteGrid',
            async: true,
            dataType: 'json',
            data: {'data': JSON.stringify(rowDataArray)},
            success: function (result) {
                console.log(result);
                if (selectedRowCount > 0) {
                    var rowListConvert = [];

                    for (var row of selectedRowIndex) {
                        rowListConvert.push({'rowIndx': row});
                    }

                    //FIXME: 캡슐화 후 deletRow 안 됨
                    $('#' + gridId).pqGrid('deleteRow', {rowList: rowListConvert});
                }
            },
            error: function (e) {
                console.error(e);
            }
        });
    };
    /**
     * @description 그리드 검색조건 조회
     * @param {string} gridId
     * @param {object} postData
     */
    var fnRequestGidData = function (gridId, postData) {
        'use strict';
        $.ajax({
            type: 'POST',
            url: '/json-list',
            async: true,
            dataType: 'json',
            data: postData,
            success: function (dataJSON) {
                $('#' + gridId).pqGrid("option", "dataModel.data", dataJSON.list);
                $('#' + gridId).pqGrid('refreshDataAndView');
            },
            error: function (e) {
                console.error(e);
            }
        });
    };
</script>