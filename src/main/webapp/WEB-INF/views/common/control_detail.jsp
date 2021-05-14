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
    <title>상세 List 조회</title>
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
    <div class="right_sort">
        전체 조회 건수 (Total : <span id="DETAIL_LIST_VIEW_RECORDS" style="color: #00b3ee">0</span>)
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="CONTROL_DETAIL_CLOSE_BUTTON">닫기</button>
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
            {title: '사업자<br>구분', width: 70, dataIndx: 'COMP_NM'},
            {title: '발주업체', width: 70, dataIndx: 'ORDER_COMP_NM'},
            {title: '비고', dataIndx: 'NOTE'},
            {title: 'INV No.<br>(거래명세No.)', width: 100, dataIndx: 'CHARGE_USER_ID'},
            {title: '모듈명', dataIndx: 'MODULE_NM'},
            {title: '', align: 'center', minWidth: 25, 
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
            {title: '작업지시번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 25, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>'
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
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
            {title: '품명', width: 110, dataIndx: 'ITEM_NM'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '외주', dataIndx: 'OUTSIDE_YN'},
            {title: '자재<br>사급', dataIndx: 'OUTSIDE_YN'},
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT_NM'},
            {title: 'Part<br>Unit', dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY'},
            {title: '접수번호', align: 'left', width: 140, dataIndx: 'REGIST_NUM'},
            {title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM'},
            {title: '수량', dataIndx: 'ORDER_QTY'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT'},
            {title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '합계금액', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMT'}
        ];
        const detailListViewObj = {
            height: 650,
            collapsible: false,
            postRenderInterval: -1,
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
            },
            render: function () {
                // 열 고정
                this.option('freezeCols', 9);
            },
            load: function () {
                let data = $detailListViewGrid.pqGrid('option', 'dataModel.data');
                $('#DETAIL_LIST_VIEW_RECORDS').html(data.length);
            }
        };
       const $detailListViewGrid = $('#' + detailListViewGridId).pqGrid(detailListViewObj);
        /* function */

        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', _.debounce(function() {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $detailListViewGrid.pqGrid('option', 'height', size);
        }, 500));

       $('#CONTROL_DETAIL_CLOSE_BUTTON').on('click', function () {
           window.close();
       });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
