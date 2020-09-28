<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-22
  Time: 오후 5:30
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
        <form class="form-inline" id="OUTSIDE_DETAIL_LIST_VIEW_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideDetailList">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="CLOSE_MONTH" id="CLOSE_MONTH">
            <input type="hidden" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
            <input type="hidden" name="CLOSE_VER" id="CLOSE_VER">
            <div id="OUTSIDE_DETAIL_LIST_VIEW_GRID"></div>
        </form>
    </div>
    <div class="right_sort">
        전체 조회 건수 (Total : <span id="OUTSIDE_DETAIL_LIST_VIEW_RECORDS" style="color: #00b3ee">0</span>)
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="OUTSIDE_DETAIL_CLOSE_BUTTON">닫기</button>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let rowData = opener.$outsideCloseStatusGrid.pqGrid('getRowData', {rowIndx: opener.outsideCloseStatusRowIndex});
        $('#OUTSIDE_DETAIL_LIST_VIEW_FORM > #COMP_CD').val(rowData.COMP_CD);
        $('#OUTSIDE_DETAIL_LIST_VIEW_FORM > #CLOSE_MONTH').val(rowData.CLOSE_MONTH);
        $('#OUTSIDE_DETAIL_LIST_VIEW_FORM > #OUTSIDE_COMP_CD').val(rowData.OUTSIDE_COMP_CD);
        $('#OUTSIDE_DETAIL_LIST_VIEW_FORM > #CLOSE_VER').val(rowData.CLOSE_VER);
        const outsideDetailListViewGridId = 'OUTSIDE_DETAIL_LIST_VIEW_GRID';
        const outsideDetailListViewPostData = fnFormToJsonArrayData('#OUTSIDE_DETAIL_LIST_VIEW_FORM');
        const outsideDetailListViewColModel = [
            {
                title: '마감정보', align: 'center', colModel: [
                    {title: '마감월', width: 60, dataIndx: 'OUTSIDE_CLOSE_MONTH'},
                    {title: '차수', minWidth: 30, dataIndx: 'OUTSIDE_CLOSE_VER'},
                    {title: '매입사업자', width: 70, dataIndx: 'OUTSIDE_CLOSE_COMP_NM'}
                ]
            },
            {title: '원발주<br>사업자구분', width: 70, dataIndx: 'COMP_NM'},
            {title: '외주업체', width: 70, dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '', align: 'center', minWidth: 25,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
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
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '도면번호', width: 120, dataIndx: 'DRAWING_NUM'},
            {title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '작업<br>형태', width: 70, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL'},
            {title: '표면처리', width: 80, dataIndx: 'SURFACE_TREAT'},
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '발주처<br>사급', minWidth: 30, width: 40, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '소재<br>제공', minWidth: 30, width: 40, dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;

                    return cellData === 'Y' ? cellData : rowData.MATERIAL_SUPPLY_YN === 'Y' ? 'Y' : '';
                }
            },
            {
                title: '요청 가공 사항', align: 'center', colModel: [
                    {
                        title: '완제품', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_FINISH_YN',
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '가공', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_PROCESS_YN',
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '연마', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_GRIND_YN',
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {
                        title: '표면', datatype: 'bool', dataIndx: 'OUTSIDE_REQUEST_SURFACE_YN',
                        type: 'checkbox',
                        cb: {all: false, header: false, check: 'Y', uncheck: 'N'},
                        render: function (ui) {
                            if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                            return '<input type="checkbox">';
                        }
                    },
                    {title: '기타사항', width: 90, dataIndx: 'OUTSIDE_REQUEST_ETC'}
                ]
            },
            {title: '외주<br>납기', width: 70, dataIndx: 'OUTSIDE_HOPE_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editor: {type: 'textbox', init: fnDateEditor},
                render: function (ui) {
                    if (ui.cellData) {
                        let date = ui.cellData;

                        return date.substring(5);
                    } else {
                        let visibleDate = new Date(ui.rowData.INNER_DUE_DT);
                        visibleDate.setDate(visibleDate.getDate() - 1);
                        return visibleDate.mmdd();
                    }
                }
            },
            {title: '비고', width: 90, dataIndx: 'OUTSIDE_NOTE'},
            {title: '입고일시', width: 100, dataIndx: 'OUTSIDE_IN_DT2'},
            {
                title: '대칭', align: 'center', colModel: [
                    {title: '원칭', align: 'right', dataType: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '대칭', align: 'right', dataType: 'integer', dataIndx: 'OTHER_SIDE_QTY'}
                ]
            },
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '원발주 정보', align: 'center', colModel: [
                    {title: '납기', width: 70, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT', render: function (ui) {}},
                    {title: '공급단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
                    {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
                    {title: '발주처', width: 70, dataIndx: 'ORDER_COMP_NM'}
                ]
            },
            {title: '외주<br>발주번호', width:90, dataIndx: 'OUTSIDE_ORDER_NUM'},
            {title: '외주<br>확정단가', width: 90, align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT'},
            {title: '금액<br>합계', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_TOTAL_AMT'},
            {title: '외주<br>확정 일시', width: 100, dataIndx: 'OUTSIDE_CONFIRM_DT'},
            {title: '외주가공<br>요청일시', width: 100, dataIndx: 'OUTSIDE_REQUEST_DT'}
        ];
        const outsideDetailListViewObj = {
            height: 650,
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: outsideDetailListViewColModel,
            strNoRows: g_noData,
            // dataModel: {data: qwe}
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: outsideDetailListViewPostData,
                getData: function (dataJSON) {
                    console.log(dataJSON.data);
                    return {data: dataJSON.data};
                }
            },
            // render: function () {
            //     열 고정
                // this.option('freezeCols', 9);
            // },
            load: function () {
                let data = $outsideDetailListViewGrid.pqGrid('option', 'dataModel.data');
                $('#OUTSIDE_DETAIL_LIST_VIEW_RECORDS').html(data.length);
            }
        };
       const $outsideDetailListViewGrid = $('#' + outsideDetailListViewGridId).pqGrid(outsideDetailListViewObj);
        /* function */

        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', _.debounce(function() {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $outsideDetailListViewGrid.pqGrid('option', 'height', size);
        }, 500));

       $('#OUTSIDE_DETAIL_CLOSE_BUTTON').on('click', function () {
           window.close();
       });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
