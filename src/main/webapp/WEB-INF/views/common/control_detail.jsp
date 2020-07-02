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
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>거래 명세표</title>
</head>
<body>
<div class="popup_container" id="SALES_STATUS_DETAIL_LIST_VIEW_POPUP">
    <div class="layerPopup">
        <h3>상세 List 조회</h3>
        <hr>
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
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" id="SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE">닫기
            </button>
        </div>
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
            height: 670,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
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

       $('#SALES_STATUS_DETAIL_LIST_VIEW_POPUP_CLOSE').on('click', function () {
           window.close();
       });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"></jsp:include>
