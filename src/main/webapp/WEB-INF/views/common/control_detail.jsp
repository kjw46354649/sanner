<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-07-01
  Time: 오후 2:15
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
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>거래 명세표</title>
</head>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">상세 List 조회</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
    <div>
        <form class="form-inline" id="DETAIL_LIST_VIEW_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlDetailList">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="CLOSE_MONTH" id="CLOSE_MONTH">
            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
            <input type="hidden" name="CLOSE_VER" id="CLOSE_VER">
            <div id="DETAIL_LIST_VIEW_GRID"></div>
        </form>
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="CONTROL_MANGE_CLOSE_BUTTON">닫기</button>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let rowData = opener.$closingHistoryGrid.pqGrid('getRowData', {rowIndx: opener.salesClosingHistoryRowIndex});
        $('#DETAIL_LIST_VIEW_FORM > #COMP_CD').val(rowData.COMP_CD);
        $('#DETAIL_LIST_VIEW_FORM > #CLOSE_MONTH').val(rowData.CLOSE_MONTH);
        $('#DETAIL_LIST_VIEW_FORM > #ORDER_COMP_CD').val(rowData.ORDER_COMP_CD);
        $('#DETAIL_LIST_VIEW_FORM > #CLOSE_VER').val(rowData.CLOSE_VER);
        const detailListViewGridId = 'DETAIL_LIST_VIEW_GRID';
        const detailListViewPostData = fnFormToJsonArrayData('#DETAIL_LIST_VIEW_FORM');
        const detailListViewColModel = [
            {title: '사업자<br>구분', minWidth: 70, dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', colModel: []},
            {title: 'INV No.<br>(거래명세No.)', minWidth: 100, dataType: 'string', dataIndx: 'CHARGE_USER_ID', colModel: []},
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', colModel: []},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM', colModel: []},
            {title: '파<br>트', align: 'right', dataType: 'integer', dataIndx: 'PART_NUM', colModel: []},
            {title: '도면번호', minWidth: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', colModel: []},
            {title: '품명', minWidth: 110, dataType: 'string', dataIndx: 'ITEM_NM', colModel: []},
            {title: '작업<br>형태', minWidth: 110, dataType: 'string', dataIndx: 'WORK_NM', colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'OUTSIDE_YN', colModel: []},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', colModel: []},
            {title: '소재<br>종류', minWidth: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', colModel: []},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', colModel: []},
            {title: '파트<br>단위<br>수량', align: 'right', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', colModel: []},
            {title: '발주번호', minWidth: 90, datatype: 'string', dataIndx: 'ORDER_NUM', colModel: []},
            // {title: '주문<br>수량', dataType: 'string', dataIndx: 'ITEM_QTY', colModel: []},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '견적단가', minWidth: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', colModel: []},
            {title: '공급단가', minWidth: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', colModel: []},
            {title: '합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMOUNT', colModel: []}
        ];
        const detailListViewObj = {
            height: 650,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: detailListViewColModel,
            strNoRows: g_noData,
            // dataModel: {data: qwe}
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: detailListViewPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
       const $detailListViewGrid = $('#' + detailListViewGridId).pqGrid(detailListViewObj);

        /* function */
        // Returns a function, that, as long as it continues to be invoked, will not
        // be triggered. The function will be called after it stops being called for
        // N milliseconds. If `immediate` is passed, trigger the function on the
        // leading edge, instead of the trailing.
        const debounce = function (func, wait, immediate) {
            let timeout, result;

            let later = function(context, args) {
                timeout = null;
                if (args) result = func.apply(context, args);
            };

            let debounced = restArguments(function(args) {
                if (timeout) clearTimeout(timeout);
                if (immediate) {
                    let callNow = !timeout;
                    timeout = setTimeout(later, wait);
                    if (callNow) result = func.apply(this, args);
                } else {
                    timeout = delay(later, wait, this, args);
                }

                return result;
            });

            debounced.cancel = function() {
                clearTimeout(timeout);
                timeout = null;
            };

            return debounced;
        };

        // Some functions take a letiable number of arguments, or a few expected
        // arguments at the beginning and then a letiable number of values to operate
        // on. This helper accumulates all remaining arguments past the function’s
        // argument length (or an explicit `startIndex`), into an array that becomes
        // the last argument. Similar to ES6’s "rest parameter".
        const restArguments = function (func, startIndex) {
            startIndex = startIndex == null ? func.length - 1 : +startIndex;
            return function() {
                let length = Math.max(arguments.length - startIndex, 0),
                    rest = Array(length),
                    index = 0;
                for (; index < length; index++) {
                    rest[index] = arguments[index + startIndex];
                }
                switch (startIndex) {
                    case 0: return func.call(this, rest);
                    case 1: return func.call(this, arguments[0], rest);
                    case 2: return func.call(this, arguments[0], arguments[1], rest);
                }
                let args = Array(startIndex + 1);
                for (index = 0; index < startIndex; index++) {
                    args[index] = arguments[index];
                }
                args[startIndex] = rest;
                return func.apply(this, args);
            };
        };

        // Delays a function for the given number of milliseconds, and then calls
        // it with the arguments supplied.
        const delay = restArguments(function(func, wait, args) {
            return setTimeout(function() {
                return func.apply(null, args);
            }, wait);
        });
        /* function */

        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', debounce(function() {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $detailListViewGrid.pqGrid('option', 'height', size);
        }, 500));

       $('#SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE').on('click', function () {
           window.close();
       });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
