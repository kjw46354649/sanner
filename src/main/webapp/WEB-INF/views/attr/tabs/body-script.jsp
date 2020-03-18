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


<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css"/>
<script src="/resource/main/js/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
<!-- Bootstrap -->
<script src="/resource/main/js/bootstrap.js"></script>
<!-- royal tab -->
<script src="/resource/plugins/royal_tab/js/royal_tab.js"></script>
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
<!-- paramQuery Grid -->
<script src="/resource/plugins/paramquery/pqgrid.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


<script type="text/javascript">

    var royal_tab_api = null;
    var g_code;

    $(document).ready(function() {

        royal_tab_api = new Royal_Tab_Api($('div.royal_tab'));
        royal_tab_api.add(0, true, "MAIN", "/static/main/main", true, "01", addRoyalTabCallBackMethod);
        // royal_tab_api.add(0, true, "${authUserFMenu.MENUNM}", "${authUserFMenu.PATHFILE}", true, "${authUserFMenu.MENUID}");

        $("#royal_tab_more").delegate("i", "click", function(){
            royal_tab_api.remove($('#royal_tab_more > li > i').index(this));
        });

        $("#left_menu_wide_list").find('.tabMenuClick').on('click', function() {
            royal_tab_api.add(0, true, $(this).attr("tname"), $(this).attr("url"), true, $(this).attr("pid"), addRoyalTabCallBackMethod);
        });

        function addRoyalTabCallBackMethod(){
            let windows
            let viewScrollerHeight = parseInt($("#view-scroller").outerHeight(true));
            let activeViewItemHeight = parseInt($(".active_view_item").outerHeight(true));
            let addValue = 100;

            console.log(viewScrollerHeight);
            console.log(activeViewItemHeight);

            if(activeViewItemHeight > 905) {
                $(".active_view_item").height(activeViewItemHeight + (905 - activeViewItemHeight));
            }
            //$("#view-scroller").height(activeViewItemHeight);
            //$(".active_view_item").height(activeViewItemHeight);
        }

        $(window).resize( function() {
            addRoyalTabCallBackMethod();

            console.log(parseInt($("#view-scroller").outerHeight(true)));
        } );

        $.ajax({
            url: '/json-list',
            cache: false,
            type: "POST",
            data: {'queryId': 'systemMapper.selectSessionCodeList'},
            dataType: "json",
            async: false,
            success: function(data) {
                g_code = data.list;
            },
            complete: function(){}
        });
    });

    /**
     * @description Ajax Post
     * @param {function} callFunction - 리텅 Function 처리
     * @param {object} params - 호출 URL에 Parameter 정보
     * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
     */
    var fnPostAjax = function (callFunction, params, callFunctionParam) {
        'use strict';
        var callback = $.Callbacks();
        var param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };
    /**
     * @description 그리드 생성
     * @param {string} gridId
     * @param {object} postData
     * @param {object} colModel
     * @param {object} toolbar
     * @returns {object | jQuery} grid
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
        return $('#' + gridId).pqGrid(obj);
    };
    /**
     * @description 그리드 검색조건 조회
     * @param {object | jQuery} grid
     * @param {object} postData
     */
    var fnRequestGidData = function (grid, postData) {
        'use strict';
        var parameter = {'url': '/json-list', 'data': postData}

        fnPostAjax(function (data, callFunctionParam) {
            grid.pqGrid("option", "dataModel.data", data.list);
            grid.pqGrid('refreshDataAndView');
        }, parameter, '');
    };
    /**
     * @description 그리드 데이터 삽입/갱신
     * @param {object | jQuery} grid
     * @param {array} insertQueryList
     * @param {array} updateQueryList
     */
    var fnModifyPQGrid = function (grid, insertQueryList, updateQueryList) {
        'use strict';
        var parameters;
        var gridInstance = grid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            var changes = gridInstance.getChanges({format: 'byVal'});
            var QUERY_ID_ARRAY = {
                'insertQueryId': insertQueryList,
                'updateQueryId': updateQueryList,
            };
            changes.queryIdList = QUERY_ID_ARRAY;
            parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}}

            console.log(grid);

            fnPostAjax(function (data, callFunctionParam) {

                console.log(grid);
                console.log(gridInstance);
                grid.pqGrid('option', 'dataModel.data', data).pqGrid('refreshDataAndView')
                //gridInstance.pqGrid('refreshDataAndView');
            }, parameters, '');
        }
    };
    /**
     * @description 그리드 데이터 삭제
     * @param {object | jQuery} grid
     * @param {array} selectedRowIndex
     * @param {string} QUERY_ID
     */
    var fnDeletePQGrid = function (grid, selectedRowIndex, QUERY_ID) {
        'use strict';
        var parameters;
        var rowDataArray = [];
        var selectedRowCount = selectedRowIndex.length;

        for (var i = 0; i < selectedRowCount; i++) {
            rowDataArray[i] = grid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
            rowDataArray[i].queryId = QUERY_ID;
        }

        parameters = {'url': '/paramQueryDeleteGrid', 'data': {data: JSON.stringify(rowDataArray)}}

        fnPostAjax(function (data, callFunctionParam) {
            if (selectedRowCount > 0) {
                var rowListConvert = [];

                for (var row of selectedRowIndex) {
                    rowListConvert.push({'rowIndx': row});
                }

                grid.pqGrid('deleteRow', {rowList: rowListConvert});
            }
        }, parameters, '');
    };

    let fnGetCommCodeSelectBox = function (highCd) {
        'use strict';
        var selectBoxContents = [];

        for(var i=0; i < g_code.length; i++){
            if(g_code[i].HIGH_CD == highCd){
                selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM_EN});
            }
        }
        return selectBoxContents;
    }

</script>