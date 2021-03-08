<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-23
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page process_confirm">
    <div class="toolWrap">
        <span class="barCode" id="processConfirmBarcodeSpan"><img src="<c:url value="/resource/asset/images/common/img_barcode_long.png"/>" alt="바코드" id="CONFIRM_ORDER_BARCODE_IMG" style="height: 32px;"></span>
        <span class="barCodeTxt"><label for="CONFIRM_ORDER_BARCODE_NUM"></label><input type="text" class="wd_270_barcode" name="CONFIRM_ORDER_BARCODE_NUM" id="CONFIRM_ORDER_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요" autocomplete="off"></span>
        <button type="button" class="defaultBtn btn-100w orange" data-toggle="modal" data-target="#outsourcingConversionModal">외주 전환</button>
        <div class="right_float">
            <span class="refresh ml-10"><button type="button" id="PROCESS_CONFIRM_REFRESH"><img src="<c:url value="/resource/asset/images/common/btn_refresh.png"/>" alt="새로고침"></button></span>
            <span>
                <label class="label_50" for="TOP_PROCESS_CONFIRM_CORPORATION">발주처</label>
                <select class="wd_100" name="TOP_PROCESS_CONFIRM_CORPORATION" id="TOP_PROCESS_CONFIRM_CORPORATION">
                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                    <c:forEach var="code" items="${HighCode.H_1007}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
            </span>
            <label for="processConfirmFilterKeyword"></label><input type="search" id="processConfirmFilterKeyword" placeholder="Enter your keyword">
            <label for="processConfirmFilterColumn"></label>
            <select id="processConfirmFilterColumn">
<%--                <option value="">All Fields</option>--%>
                <option value="CONTROL_NUM">관리번호</option>
            </select>
            <label for="processConfirmFilterCondition"></label>
            <select id="processConfirmFilterCondition">
                <c:forEach var="code" items="${HighCode.H_1083}">
                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                </c:forEach>
            </select>
            <button type="button" class="defaultBtn btn-100w orange" id="PROCESS_CONFIRM_FULLSCREEN">FULL SCREEN</button>
        </div>
    </div>
    <div class="topLeftWrap left_float">
        <form class="form-inline" id="CONFIRM_ORDER_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectConfirmOrderList">
            <input type="hidden" name="ORDER_COMP_CD" id="CONFIRM_ORDER_CORPORATION" value="">
            <div style="height: inherit;">
                <div>
                    <p class="d-inline-block">
                        주문확정 List ( Total :&nbsp;&nbsp;&nbsp;
                        <span id="CONFIRM_ORDER_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                        <span id="CONFIRM_ORDER_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                    </p>
                    <div class="d-inline-block right_float">
                        <span>
                            <label class="label_50" for="CONFIRM_ORDER_MATERIAL">소재</label>
                            <select class="wd_100" name="MATERIAL_DETAIL" id="CONFIRM_ORDER_MATERIAL">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </div>
                    <hr>
                </div>
                <div id="CONFIRM_ORDER_GRID"></div>
            </div>
        </form>
    </div>

    <div class="topRightWrap left_float">
        <form class="form-inline" id="PROCESS_CONFIRM_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessConfirmList">
            <input type="hidden" name="ORDER_COMP_CD" id="PROCESS_CONFIRM_CORPORATION" value="">
            <div style="height: inherit;">
                <div>
                    <p class="d-inline-block">
                        가공진행 List ( Total :&nbsp;&nbsp;&nbsp;
                        <span id="PROCESS_CONFIRM_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                        <span id="PROCESS_CONFIRM_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span>EA )
                    </p>
                    <div class="d-inline-block right_float">
                        <label class="checkbox-inline i-checks" for="EMERGENCY_YN">
                            <input type="checkbox" name="EMERGENCY_YN"
                                   id="EMERGENCY_YN"><i></i> Show Only 긴급
                        </label>
                            <span>
                            <label class="label_50" for="PROCESS_CONFIRM_MATERIAL">소재</label>
                            <select class="wd_100" name="MATERIAL_DETAIL" id="PROCESS_CONFIRM_MATERIAL">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </div>
                    <hr>
                </div>
                <div id="PROCESS_CONFIRM_GRID"></div>
            </div>
        </form>
    </div>

    <div class="botLeftWrap left_float">
        <form class="form-inline" id="OUTSIDE_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectOutsideProcessingList">
            <input type="hidden" name="ORDER_COMP_CD" id="OUTSIDE_CORPORATION" value="">
            <div style="height: inherit;">
                <div>
                    <p class="d-inline-block">
                        외주가공 List ( Total :&nbsp;&nbsp;&nbsp;
                        <span id="OUTSIDE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                        <span id="OUTSIDE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                    </p>
                    <div class="d-inline-block right_float">
                        <span>
                            <label class="label_50" for="OUTSIDE_SUBCONTRACTOR">외주업체</label>
                            <select class="wd_100" name="OUTSIDE_COMP_CD" id="OUTSIDE_SUBCONTRACTOR">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </div>
                    <hr>
                </div>
                <div id="OUTSIDE_GRID"></div>
            </div>
        </form>
    </div>

    <div class="botRightWrap left_float">
        <form class="form-inline" id="PROCESS_COMPLETE_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessCompleteList">
            <input type="hidden" name="ORDER_COMP_CD" id="PROCESS_COMPLETE_CORPORATION" value="">
            <div style="height: inherit;">
                <div>
                    <p class="d-inline-block">
                        가공완료 List (출하전) ( Total :&nbsp;&nbsp;&nbsp;
                        <span id="PROCESS_COMPLETE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                        <span id="PROCESS_COMPLETE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                    </p>
                    <div class="d-inline-block right_float">
                    </div>
                    <hr>
                </div>
                <div id="PROCESS_COMPLETE_GRID"></div>
            </div>
        </form>
    </div>

    <!-- 외주 전환 -->
    <div class="modal" id="outsourcingConversionModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 500px">
                <div class="modal-header">
                    <h5 class="modal-title" style="font-size: large; font-weight: bold">외주 전환</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <img src="<c:url value="/resource/asset/images/common/img_barcode_long.png"/>" alt="바코드" id="OUTSOURCING_CONVERSION_IMG" height="32px;">
                        <input type="text" id="OUTSOURCING_CONVERSION_BARCODE_NUM" autocomplete="off" style="margin: 0 10px">
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center !important">
                    <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 외주 전환 -->
</div>
<script>
    $(function () {
        'use strict';
        let selectedRowIndex = [];
        let selectedGrid;
        let $confirmOrderGrid;
        const topLeftGridId = 'CONFIRM_ORDER_GRID';
        let topLeftPostData = fnFormToJsonArrayData('#CONFIRM_ORDER_SEARCH_FORM');
        const topLeftColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', width: '10%', datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {
                title: '긴<br>급', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'EMERGENCY_YN',
                styleHead: {'font-weight': 'bold', 'color': 'red'},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '', width: '10%', dataIndx: 'PROCESS_CONFIRM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_STATUS !== 'ORD005') {
                        return '<button class="miniBtn green" name="PROCESS_CONFIRM_BUTTON">가공확정</button>';
                    } else {
                        return '<button class="miniBtn green" name="PROCESS_CONFIRM_BUTTON" disabled>가공확정</button>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=PROCESS_CONFIRM_BUTTON]').on('click', function (event) {
                        updatePartStatus(ui.rowData, 'PRO002');
                        event.preventDefault();
                    });
                }
            },
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: '10%', dataIndx: 'ORDER_COMP_NM'},
            {title: '', minWidth: 30, width: 30, maxWidth: 30,
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
            {title: '관리번호', width: '23%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'IMG_GFILE_SEQ', 
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '주문<br>수량', maxWidth: 30, dataIndx: 'CONTROL_PART_QTY'},
            {title: '발주<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '7.5%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'}
        ];
        let topLeftObj = {
            height: '90%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: processConfirmFilterRender},
            filterModel: {mode: 'OR'},
            editable: false,
            colModel: topLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: topLeftPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dataReady: function () {
                let data = $confirmOrderGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].CONTROL_PART_QTY ? parseInt(data[i].CONTROL_PART_QTY) : 0;
                }

                $('#CONFIRM_ORDER_TOTAL_RECORDS').html(totalRecords);
                $('#CONFIRM_ORDER_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
            rowSelect: function (event, ui) {
                selectedRowIndex[0] = ui.addList[0] ? ui.addList[0].rowIndx : undefined;
                selectedGrid = $(this.element.context);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };
        let $processConfirmGrid;
        const topRightGridId = 'PROCESS_CONFIRM_GRID';
        let topRightPostData = fnFormToJsonArrayData('#PROCESS_CONFIRM_SEARCH_FORM');
        const topRightColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '진행상태', dataIndx: 'PART_STATUS', hidden: true},
            {title: '진행상태', width: '10%', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', width: '10%', dataIndx: 'LAST_POP_POSITION'},
            {
                title: '', width: '10%', dataIndx: 'CONFIRM_CANCEL_BUTTON',
                render: function () {
                    return '<button class="miniBtn red" name="CONFIRM_CANCEL_BUTTON">확정취소</button>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=CONFIRM_CANCEL_BUTTON]').on('click', function (event) {
                        updatePartStatus(ui.rowData, null);
                        event.preventDefault();
                    });
                }
            },
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: '10%', dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', minWidth: 30, width: 30, maxWidth: 30,
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
            {title: '관리번호', width: '23%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'IMG_GFILE_SEQ', 
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '요망<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT'},
            {
                title: '긴<br>급', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '작업<br>형태', width: '10%', dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '10%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', width: '10%',  dataIndx: 'SURFACE_TREAT_NM'},
            {title: '열<br>처리', minWidth: 40, width: 40, maxWidth: 40, dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            {title: '주문<br>수량', maxWidth: 30, dataIndx: 'CONTROL_PART_QTY'},
            {title: '가공확정일시', width: '10%', dataType: 'date', dataIndx: 'CONTROL_STATUS_DT'}
        ];
        const topRightObj = {
            height: '90%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: processConfirmFilterRender},
            filterModel: {mode: 'OR'},
            editable: false,
            colModel: topRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: topRightPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dataReady: function () {
                let data = $processConfirmGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].CONTROL_PART_QTY ? parseInt(data[i].CONTROL_PART_QTY) : 0;
                }

                $('#PROCESS_CONFIRM_TOTAL_RECORDS').html(totalRecords);
                $('#PROCESS_CONFIRM_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
            rowSelect: function (event, ui) {
                selectedRowIndex[0] = ui.addList[0] ? ui.addList[0].rowIndx : undefined;
                selectedGrid = $(this.element.context);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };
        let $outsideGrid;
        const botLeftGridId = 'OUTSIDE_GRID';
        let botLeftPostData = fnFormToJsonArrayData('#OUTSIDE_SEARCH_FORM');
        const botLeftColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: '10%', dataIndx: 'ORDER_COMP_NM'},
            {title: '외주확정<br>일시', width: '10%', dataIndx: 'OUTSIDE_CONFIRM_DT'},
            {
                title: '긴<br>급', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '', align: 'center', minWidth: 30, width: 30, maxWidth: 30,
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
            {title: '관리번호', width: '23%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'IMG_GFILE_SEQ', 
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '외주발송', align: 'center', colModel: [
                    {title: '업체명', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '업체명', width: '10%', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '일시', width: '12.5%', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                ]
            },
            {title: '자재<br>사급', minWidth: 40, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '외주<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
            {title: '발주<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '10%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', width: '10%',  dataIndx: 'SURFACE_TREAT_NM'},
			{title: '열<br>처리', minWidth: 40, width: 40, maxWidth: 40, dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            {title: '주문<br>수량', maxWidth: 30, dataIndx: 'CONTROL_PART_QTY'}
        ];
        const botLeftObj = {
            height: '85%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: processConfirmFilterRender},
            filterModel: {mode: 'OR'},
            editable: false,
            colModel: botLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: botLeftPostData,
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            dataReady: function () {
                let data = $outsideGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].CONTROL_PART_QTY ? parseInt(data[i].CONTROL_PART_QTY) : 0;
                }

                $('#OUTSIDE_TOTAL_RECORDS').html(totalRecords);
                $('#OUTSIDE_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
            rowSelect: function (event, ui) {
                selectedRowIndex[0] = ui.addList[0] ? ui.addList[0].rowIndx : undefined;
                selectedGrid = $(this.element.context);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };
        let $processCompleteGrid;
        const botRightGridId = 'PROCESS_COMPLETE_GRID';
        let botRightPostData = fnFormToJsonArrayData('#PROCESS_COMPLETE_SEARCH_FORM');
        const botRightColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '진행상태', dataIndx: 'PART_STATUS', hidden: true},
            {title: '진행상태', width:'10%', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', width:'10%', dataIndx: 'LAST_POP_POSITION'},
            {title: '검사<br>실적', maxWidth: 30, dataIndx: 'INSPECT_GRADE_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: '10%', dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', align: 'center', minWidth: 30, width: 30, maxWidth: 30,
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
            {title: '관리번호', width: '23%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'IMG_GFILE_SEQ', 
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '요망<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT'},
            {
                title: '긴<br>급', minWidth: 30, width: 30, maxWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '10%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', width: '10%',  dataIndx: 'SURFACE_TREAT_NM'},
            {title: '주문<br>수량', maxWidth: 30, dataIndx: 'CONTROL_PART_QTY'},
            {title: '가공완료<br>일시', width: '10%', dataIndx: 'INNER_WORK_FINISH_DT'},
        ];
        const botRightObj = {
            height: '85%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: processConfirmFilterRender},
            filterModel: {mode: 'OR'},
            editable: false,
            colModel: botRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: botRightPostData,
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            dataReady: function () {
                let data = $processCompleteGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].CONTROL_PART_QTY ? parseInt(data[i].CONTROL_PART_QTY) : 0;
                }

                $('#PROCESS_COMPLETE_TOTAL_RECORDS').html(totalRecords);
                $('#PROCESS_COMPLETE_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
            rowSelect: function (event, ui) {
                selectedRowIndex[0] = ui.addList[0] ? ui.addList[0].rowIndx : undefined;
                selectedGrid = $(this.element.context);
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});

                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                }

                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };

        let reloadProcessConfigData = function () {
            $confirmOrderGrid.pqGrid('refreshDataAndView');
            $processConfirmGrid.pqGrid('refreshDataAndView');
            $outsideGrid.pqGrid('refreshDataAndView');
            $processCompleteGrid.pqGrid('refreshDataAndView');
        };

        const hasInStock = function (rowData) {
            let flag = false;
            let postData = {queryId: 'orderMapper.selectHasInStock'};
            postData = $.extend(postData, rowData);
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                flag = data.list[0].FLAG;
            }, parameters, '');

            return flag;
        };

        const updatePartStatus = function (rowData, partStatus) {
            let newRowData = fnCloneObj(rowData);
            newRowData.PART_STATUS = partStatus;
            let gridInstance = $processConfirmGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let QUERY_ID_ARRAY;
            changes.updateList.push(newRowData);
            let parameters;

            /*if (isProcessAssembly(rowData)) {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatusAll', 'orderMapper.createControlPartProgressAll']};
            } else {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatus', 'orderMapper.createControlPartProgress', 'orderMapper.updateControlPartAssembly']};
            }*/
            if (hasInStock(rowData)) {
                fnAlert(null, '소재입고된 항목은 확정취소가 불가능합니다.');
                failPlay();
                return false;
            } else {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatus', 'orderMapper.createControlPartProgress']};
                changes.queryIdList = QUERY_ID_ARRAY;
                parameters = {'url': '/processControlConfirmProcess', 'data': {data: JSON.stringify(changes)}};

                fnPostAjaxSound(function () {
                    $confirmOrderGrid.pqGrid('refreshDataAndView');
                    $processConfirmGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        };

        const updateOutsideConversion = function (rowData) {
            let newRowData = fnCloneObj(rowData);
            let gridInstance = $processConfirmGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let QUERY_ID_ARRAY;
            changes.updateList.push(newRowData);
            let parameters;

            QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateOutsideConversion', 'orderMapper.updateOutsideConfirmDt']};
            changes.queryIdList = QUERY_ID_ARRAY;
            parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

            fnPostAjaxSound(function () {
                $confirmOrderGrid.pqGrid('refreshDataAndView');
                $outsideGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        };

        function processConfirmFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value === val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                if (ui.column.dataType === 'integer') {
                    val = numberWithCommas(val);
                } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                    let o = new Date(val);
                    val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
                }

                let condition = $('#processConfirmFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#processConfirmFilterKeyword').val(),
                    txtUpper = (txt == null) ? '' : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === 'end') {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length !== valUpper.length) {
                        indx = -1;
                    }
                } else if (condition === 'contain') {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition === 'begin') {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }

                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }
        /* function */

        $('#CONFIRM_ORDER_SEARCH_FORM').on('change', function() {
            topLeftPostData = fnFormToJsonArrayData('#CONFIRM_ORDER_SEARCH_FORM');
            $confirmOrderGrid.pqGrid('option', 'dataModel.postData', function () {
                return topLeftPostData;
            });
            $confirmOrderGrid.pqGrid('refreshDataAndView');
        });
        $('#PROCESS_CONFIRM_SEARCH_FORM').on('change', function() {
            topRightPostData = fnFormToJsonArrayData('#PROCESS_CONFIRM_SEARCH_FORM');
            $processConfirmGrid.pqGrid('option', 'dataModel.postData', function () {
                return topRightPostData;
            });
            $processConfirmGrid.pqGrid('refreshDataAndView');
        });
        $('#OUTSIDE_SEARCH_FORM').on('change', function() {
            botLeftPostData = fnFormToJsonArrayData('#OUTSIDE_SEARCH_FORM');
            $outsideGrid.pqGrid('option', 'dataModel.postData', function () {
                return botLeftPostData;
            });
            $outsideGrid.pqGrid('refreshDataAndView');
        });
        $('#PROCESS_COMPLETE_SEARCH_FORM').on('change', function() {
            botRightPostData = fnFormToJsonArrayData('#PROCESS_COMPLETE_SEARCH_FORM');
            $processCompleteGrid.pqGrid('option', 'dataModel.postData', function () {
                return botRightPostData;
            });
            $processCompleteGrid.pqGrid('refreshDataAndView');
        });

        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#TOP_PROCESS_CONFIRM_CORPORATION'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        $("#TOP_PROCESS_CONFIRM_CORPORATION").change(function(){
            let corporation = this.value;
            $('#CONFIRM_ORDER_SEARCH_FORM').find('#CONFIRM_ORDER_CORPORATION').val(corporation);
            $('#PROCESS_CONFIRM_SEARCH_FORM').find('#PROCESS_CONFIRM_CORPORATION').val(corporation);
            $('#OUTSIDE_SEARCH_FORM').find('#OUTSIDE_CORPORATION').val(corporation);
            $('#PROCESS_COMPLETE_SEARCH_FORM').find('#PROCESS_COMPLETE_CORPORATION').val(corporation);

            $('#CONFIRM_ORDER_SEARCH_FORM').trigger("change");
            $('#PROCESS_CONFIRM_SEARCH_FORM').trigger("change");
            $('#OUTSIDE_SEARCH_FORM').trigger("change");
            $('#PROCESS_COMPLETE_SEARCH_FORM').trigger("change");
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_SEARCH_FORM').find('#OUTSIDE_SUBCONTRACTOR'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        $confirmOrderGrid = $('#' + topLeftGridId).pqGrid(topLeftObj);
        $processConfirmGrid = $('#' + topRightGridId).pqGrid(topRightObj);
        $outsideGrid = $('#' + botLeftGridId).pqGrid(botLeftObj);
        $processCompleteGrid = $('#' + botRightGridId).pqGrid(botRightObj);

        const THIRTY_SECONDS = 30 * 1000;
        setInterval(reloadProcessConfigData, THIRTY_SECONDS);
        /* init */

        const isNotBarcodeValid = function (barcodeNum, type) {
            let flag = false;
            let parameters = {'url': '/processConfirmBarcodeInfo', 'data': {BARCODE_NUM: fnBarcodeKo2En(barcodeNum), TYPE: type}};

            fnPostAjaxAsync(function (data) {
                if (data.flag) {
                    flag = data.flag;

                    fnConfirm(null, data.message, function () {}, null, 5);
                }
            }, parameters, '');

            return flag;
        };

        $("#CONFIRM_ORDER_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode === 13) {
                let barcodeNum = fnBarcodeKo2En(this.value);

                if (!(windowImageViewer === undefined || windowImageViewer.closed)) {
                    let rowData = selectedGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex});
                    callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                }
                if(isNotBarcodeValid(barcodeNum, 'confirm')) {
                    this.value = '';
                    failPlay();
                    return false;
                }
                let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info', 'data': data};
                fnPostAjax(function (data) {
                    let dataInfo = data.info;
                    if (!(windowImageViewer === undefined || windowImageViewer.closed)) {
                        callWindowImageViewer(dataInfo.IMG_GFILE_SEQ);
                    }
                    updatePartStatus(dataInfo, 'PRO002');
                }, parameters, '');

                this.value = '';
            }
        });

        $('#PROCESS_CONFIRM_REFRESH').on('click', function () {
            reloadProcessConfigData();
        });

        $('#processConfirmBarcodeSpan').on('click', function () {
            $('#CONFIRM_ORDER_BARCODE_NUM').focus();
        });

        $('#CONFIRM_ORDER_BARCODE_NUM').on({
            focus: function () {
                $('#CONFIRM_ORDER_BARCODE_IMG').prop('src','/resource/asset/images/common/img_barcode_long_on.png');
            },
            blur: function () {
                $('#CONFIRM_ORDER_BARCODE_IMG').prop('src','/resource/asset/images/common/img_barcode_long.png');
            }
        });

        /** 전체창으로 주문 확정 띄우기 **/
        $('#PROCESS_CONFIRM_FULLSCREEN').on('click', function () {
            window.open('/workConfirm');
        });

        $('#OUTSOURCING_CONVERSION_IMG').on('click', function () {
            $('#OUTSOURCING_CONVERSION_BARCODE_NUM').focus();
        });

        $('#OUTSOURCING_CONVERSION_BARCODE_NUM').on({
            focus: function () {
                $('#OUTSOURCING_CONVERSION_IMG').prop('src','/resource/asset/images/common/img_barcode_long_on.png');
            },
            blur: function () {
                $('#OUTSOURCING_CONVERSION_IMG').prop('src','/resource/asset/images/common/img_barcode_long.png');
            }
        });

        $("#OUTSOURCING_CONVERSION_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode === 13) {
                let barcodeNum = fnBarcodeKo2En(this.value);
                if(isNotBarcodeValid(barcodeNum, 'conversion')) {
                    this.value = '';
                    failPlay();
                    return false;
                }
                let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info', 'data': data};
                fnPostAjax(function (data) {
                    let dataInfo = data.info;
                    if (!(windowImageViewer === undefined || windowImageViewer.closed)) {
                        callWindowImageViewer(dataInfo.IMG_GFILE_SEQ);
                    }
                    updateOutsideConversion(dataInfo);
                }, parameters, '');

                this.value = '';
            }
        });

        $('#outsourcingConversionModal').on('show.bs.modal', function () {
            setTimeout(function() {
                $('#OUTSOURCING_CONVERSION_BARCODE_NUM').focus();
            });
        });

        $('#processConfirmFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($confirmOrderGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($processConfirmGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($outsideGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($processCompleteGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
            },
            'search': function () {
                fnFilterHandler($confirmOrderGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($processConfirmGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($outsideGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
                fnFilterHandler($processCompleteGrid, 'processConfirmFilterKeyword', 'processConfirmFilterCondition', 'processConfirmFilterColumn');
            }
        });
    });
</script>
