<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>진성정밀 MES 시스템</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
    <jsp:include page="/WEB-INF/views/attr/common/body-script.jsp"></jsp:include>
</head>
<body>
    <div id="waitMeContainerDiv">
        <div class="bodyWrap" id="bodyWrap">
            <section class="containerBody">
                <div class="contentsSingleWrap">
                    <div class="page process_confirm_single">
                        <div class="toolWrap">
                            <span class="barCode" id="processConfirmBarcodeSpan"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="CONFIRM_ORDER_BARCODE_IMG" style="height: 32px;"></span>
                            <span class="barCodeTxt"><input type="text" class="wd_270_barcode" name="CONFIRM_ORDER_BARCODE_NUM" id="CONFIRM_ORDER_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요" style="ime-mode:disable;"></span>
                            <div class="right_float">
                                <span class="refresh mg-left10"><button type="button" id="PROCESS_CONFIRM_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
                                <button type="button" class="defaultBtn btn-100w" id="PROCESS_CONFIRM_DETAIL">상세정보 조회</button>
                                <button type="button" class="defaultBtn btn-100w" id="PROCESS_CONFIRM_DRAWING_VIEW">도면 보기</button>
                            </div>
                        </div>
                        <div class="topLeftWrap left_float">
                            <form class="form-inline" id="CONFIRM_ORDER_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
                                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectConfirmOrderList">
                                <div style="height: inherit;">
                                    <div>
                                        <p class="d-inline-block">
                                            주문확정 List ( Total :&nbsp;&nbsp;&nbsp;
                                            <span id="CONFIRM_ORDER_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                                            <span id="CONFIRM_ORDER_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                                        </p>
                                        <div class="d-inline-block right_float">
                                            <span>
                                                <label class="label_50" for="CONFIRM_ORDER_CORPORATION">발주처</label>
                                                <select class="wd_100" name="ORDER_COMP_CD" id="CONFIRM_ORDER_CORPORATION">
                                                    <option value="">ALL</option>
                                                </select>
                                            </span>
                                            <span>
                                                <label class="label_50" for="CONFIRM_ORDER_MATERIAL">소재</label>
                                                <select class="wd_100" name="MATERIAL_TYPE" id="CONFIRM_ORDER_MATERIAL">
                                                    <option value="">ALL</option>
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

                        <div class="topRightWrap right_float">
                            <form class="form-inline" id="PROCESS_CONFIRM_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
                                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessConfirmList">
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
                                                <label class="label_50" for="PROCESS_CONFIRM_CORPORATION">발주처</label>
                                                <select class="wd_100" name="ORDER_COMP_CD" id="PROCESS_CONFIRM_CORPORATION">
                                                    <option value="">ALL</option>
                                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                                    </c:forEach>
                                                </select>
                                            </span>
                                                <span>
                                                <label class="label_50" for="PROCESS_CONFIRM_MATERIAL">소재</label>
                                                <select class="wd_100" name="MATERIAL_TYPE" id="PROCESS_CONFIRM_MATERIAL">
                                                    <option value=""> ALL</option>
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
                                <div style="height: inherit;">
                                    <div>
                                        <p class="d-inline-block">
                                            외주가공 List ( Total :&nbsp;&nbsp;&nbsp;
                                            <span id="OUTSIDE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                                            <span id="OUTSIDE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                                        </p>
                                        <div class="d-inline-block right_float">
                                            <span>
                                                <label class="label_50" for="OUTSIDE_CORPORATION">발주처</label>
                                                <select class="wd_100" name="ORDER_COMP_CD" id="OUTSIDE_CORPORATION">
                                                    <option value="">ALL</option>
                                                </select>
                                            </span>
                                            <span>
                                                <label class="label_50" for="OUTSIDE_SUBCONTRACTOR">외주업체</label>
                                                <select class="wd_100" name="OUTSIDE_COMP_CD" id="OUTSIDE_SUBCONTRACTOR">
                                                    <option value="">ALL</option>
                                                </select>
                                            </span>
                                        </div>
                                        <hr>
                                    </div>
                                    <div id="OUTSIDE_GRID"></div>
                                </div>
                            </form>
                        </div>

                        <div class="botRightWrap right_float">
                            <form class="form-inline" id="PROCESS_COMPLETE_SEARCH_FORM" role="form" onsubmit="return false;" style="height: inherit;">
                                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessCompleteList">
                                <div style="height: inherit;">
                                    <div>
                                        <p class="d-inline-block">
                                            가공완료 List (출하전) ( Total :&nbsp;&nbsp;&nbsp;
                                            <span id="PROCESS_COMPLETE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows&nbsp;&nbsp;&nbsp;
                                            <span id="PROCESS_COMPLETE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                                        </p>
                                        <div class="d-inline-block right_float">
                                            <span>
                                                <label class="label_50" for="PROCESS_COMPLETE_CORPORATION">발주처</label>
                                                <select class="wd_100" name="ORDER_COMP_CD" id="PROCESS_COMPLETE_CORPORATION">
                                                    <option value="">ALL</option>
                                                </select>
                                            </span>
                                            <span>
                                                <label class="label_50" for="PROCESS_COMPLETE_SUBCONTRACTOR">외주업체</label>
                                                <select class="wd_100" name="OUTSIDE_COMP_CD" id="PROCESS_COMPLETE_SUBCONTRACTOR">
                                                    <option value="">ALL</option>
                                                </select>
                                            </span>
                                        </div>
                                        <hr>
                                    </div>
                                    <div id="PROCESS_COMPLETE_GRID"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
    </div>
</body>
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
                    {
                        title: '변경일시', width: '12.5%', datatype: 'date', dataIndx: 'CONTROL_STATUS_DT',
                        render: function (ui) {
                            return ui.cellData.substring(2);
                        }
                    }
                ]
            },
            {
                title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                styleHead: {'font-weight': 'bold', 'color': 'red'},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '', width: '7.5%', dataIndx: 'PROCESS_CONFIRM_BUTTON',
                render: function () {
                    return '<button class="miniBtn green" name="PROCESS_CONFIRM_BUTTON">가공확정</button>';
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
            {title: '발주업체', width: '7.5%', dataIndx: 'ORDER_COMP_NM'},
            {title: '', align: 'center', minWidth: 30,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: '15%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'},
            {title: '발주<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '7.5%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'},
            // {title: '표면<br>처리', /*width: '7.5%',*/  dataIndx: 'SURFACE_TREAT_NM'},
            // {title: '열<br>처리', dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            // {title: '비고', /*width: '20%',*/ dataIndx: 'CONTROL_NOTE'}
        ];
        let topLeftObj = {
            height: '95%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
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
                selectedRowIndex[0] = ui.addList[0].rowIndx;
                selectedGrid = $(this.element.context);
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
            {title: '진행상태', width: '5%', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', width: '5%', dataIndx: 'LAST_POP_POSITION'},
            {
                title: '', width: '7.5%', dataIndx: 'CONFIRM_CANCEL_BUTTON',
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
            {title: '발주업체', width: '7%', dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', align: 'center', minWidth: 30,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: '15%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '요망<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '주<br>요', dataIndx: 'MAIN_INSPECTION_NM'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '5%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT_NM'},
            {title: '열<br>처리', dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '가공확정일시', width: '7.5%', dataType: 'date', dataIndx: 'CONTROL_STATUS_DT',
                render: function (ui) {
                    return ui.cellData.substring(2);
                }
            }
        ];
        const topRightObj = {
            height: '95%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
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
                selectedRowIndex[0] = ui.addList[0].rowIndx;
                selectedGrid = $(this.element.context);
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
            {title: '발주업체', width: '7.5%', dataIndx: 'ORDER_COMP_NM'},
            {title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '', align: 'center', minWidth: 30,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: '15%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {
                title: '외주발송', align: 'center', colModel: [
                    {title: '업체명', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '업체명', width: '7.5%', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '일시', width: '12.5%', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                ]
            },
            {title: '자재<br>사급', minWidth: 40, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '외주<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
            {title: '발주<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'ORDER_DUE_DT'},
            // {title: '가공<br>납기', width: '7.5%', dataIndx: 'INNER_DUE_DT'},
            // {title: '주<br>요', width: '7.5%', dataType: 'select', dataIndx: 'MAIN_INSPECTION_NM'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '7.5%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: '5%', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', width: '7.5%',  dataIndx: 'SURFACE_TREAT_NM'},
            {title: '열<br>처리', dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'}
        ];
        const botLeftObj = {
            height: '90%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: botLeftColModel,
            // toolbar: rightBotToolbar,
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
                selectedRowIndex[0] = ui.addList[0].rowIndx;
                selectedGrid = $(this.element.context);
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
            {title: '진행상태', width: '5%', dataIndx: 'PART_STATUS_NM'},
            {title: '현재위치', width: '5%', dataIndx: 'LAST_POP_POSITION'},
            {title: '검사<br>실적', dataIndx: 'INSPECT_GRADE_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: '7%', dataIndx: 'ORDER_COMP_NM'},
            {
                title: '', align: 'center', minWidth: 30,
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="doubleFilesIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=detailView]').bind("click", function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', width: '15%', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', minWidth: 30, dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '수행<br>공장', minWidth: 40, dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '자재<br>사급', minWidth: 35, dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '요망<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 40, dataType: 'date', format: 'm/dd', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '주<br>요', dataIndx: 'MAIN_INSPECTION_NM'},
            {title: '작업<br>형태', minWidth: 40, dataIndx: 'WORK_TYPE_NM'},
            {title: '규격', width: '5%', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT_NM'},
            {title: '열<br>처리', dataIndx: 'MATERIAL_FINISH_HEAT_NM'},
            {title: '주문<br>수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '가공완료<br>일시', width: '7.5%', dataType: 'date', dataIndx: 'INNER_WORK_FINISH_DT',
                render: function (ui) {
                    return ui.cellData.substring(2);
                }
            },
        ];
        const botRightObj = {
            height: '90%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: botRightColModel,
            // toolbar: rightBotToolbar,
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
                selectedRowIndex[0] = ui.addList[0].rowIndx;
                selectedGrid = $(this.element.context);
            }
        };

        let reloadData = function () {
            $confirmOrderGrid.pqGrid('refreshDataAndView');
            $processConfirmGrid.pqGrid('refreshDataAndView');
            $outsideGrid.pqGrid('refreshDataAndView');
            $processCompleteGrid.pqGrid('refreshDataAndView');
        };

        /*const isProcessAssembly = function (rowData) {
            let flag = false;
            let postData = {queryId: 'orderMapper.selectIsProcessAssembly'};
            postData = $.extend(postData, rowData);
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                flag = data.list[0].FLAG;
            }, parameters, '');

            return flag;
        };*/

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
                return false;
            } else {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatus', 'orderMapper.createControlPartProgress']};
                changes.queryIdList = QUERY_ID_ARRAY;
                parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

                fnPostAjax(function () {
                    $confirmOrderGrid.pqGrid('refreshDataAndView');
                    $processConfirmGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        };
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

        /* init */
        fnCommCodeDatasourceSelectBoxCreate($('#CONFIRM_ORDER_SEARCH_FORM').find('#CONFIRM_ORDER_CORPORATION'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_CONFIRM_SEARCH_FORM').find('#PROCESS_CONFIRM_CORPORATION'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_SEARCH_FORM').find('#OUTSIDE_CORPORATION'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_COMPLETE_SEARCH_FORM').find('#PROCESS_COMPLETE_CORPORATION'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_SEARCH_FORM').find('#OUTSIDE_SUBCONTRACTOR'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#PROCESS_COMPLETE_SEARCH_FORM').find('#PROCESS_COMPLETE_SUBCONTRACTOR'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        $confirmOrderGrid = $('#' + topLeftGridId).pqGrid(topLeftObj);
        $processConfirmGrid = $('#' + topRightGridId).pqGrid(topRightObj);
        $outsideGrid = $('#' + botLeftGridId).pqGrid(botLeftObj);
        $processCompleteGrid = $('#' + botRightGridId).pqGrid(botRightObj);

        const THIRTY_SECONDS = 30 * 1000;
        setInterval(reloadData, THIRTY_SECONDS);
        /* init */

        const isNotBarcodeValid = function (barcodeNum) {
            let flag = false;
            let parameters = {'url': '/processConfirmBarcodeInfo', 'data': {BARCODE_NUM: fnBarcodeKo2En(barcodeNum)}};

            fnPostAjaxAsync(function (data) {
                flag = data.flag;
                if (data.flag) {
                    fnConfirm(null, data.message, function () {}, null, 5);
                }
            }, parameters, '');

            return flag;
        };

        $("#CONFIRM_ORDER_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode === 13) {
                let barcodeNum = fnBarcodeKo2En(this.value);

                if(isNotBarcodeValid(barcodeNum)) {
                    this.value = '';
                    return false;
                }

                let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info', 'data': data};
                fnPostAjax(function (data) {
                    let dataInfo = data.info;

                    updatePartStatus(dataInfo, 'PRO002');
                }, parameters, '');

                this.value = '';
            }
        });

        $('#PROCESS_CONFIRM_REFRESH').on('click', function () {
            reloadData();
        });

        /** 도면 보기 팝업 호출 */
        $('#PROCESS_CONFIRM_DRAWING_VIEW').on('click', function () {
            let rowData = selectedGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex});

            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
        });

        $('#processConfirmBarcodeSpan').on('click', function () {
            $('#CONFIRM_ORDER_BARCODE_NUM').focus();
        });

        $('#CONFIRM_ORDER_BARCODE_NUM').on({
            focus: function () {
                $('#CONFIRM_ORDER_BARCODE_IMG').attr('src','/resource/asset/images/common/img_barcode_long_on.png');
            },
            blur: function () {
                $('#CONFIRM_ORDER_BARCODE_IMG').attr('src','/resource/asset/images/common/img_barcode_long.png');
            }
        });

        $('#PROCESS_CONFIRM_DETAIL').on('click', function () {
            g_item_detail_pop_view('', '');
        });

        /** 전체창으로 주문 확정 띄우기 **/
        $('#PROCESS_CONFIRM_FULLSCREEN').on('click', function () {
            window.open('/workConfirm');
        });

    });
</script>
</html>