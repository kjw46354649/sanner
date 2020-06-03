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
    <div class="topLeftWrap left_float">
        <div>
            <form class="form-inline" id="CONFIRM_ORDER_SEARCH_FORM" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectConfirmOrderList">
                <div class="mg-bottom10">
                    <div class="row">
                        <span>
                            <label class="label_100" for="CONFIRM_ORDER_CORPORATION">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="CONFIRM_ORDER_CORPORATION">
                                <option value="">ALL</option>
                            </select>
                        </span>
                        <span>
                            <label class="label_100" for="CONFIRM_ORDER_MATERIAL">소재</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="CONFIRM_ORDER_MATERIAL">
                                <option value="">ALL</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </div>
                </div>
                <hr style="display: block">
                <div>
                    <div class="mg-bottom10">
                        <p>주문확정 List</p>
                        <span style="float: right">
                            <span class="barCode"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="CONFIRM_ORDER_BARCODE_IMG" style="height: 32px;"></span>
                            <span class="barCodeTxt"><input type="text" class="wd_270_barcode" name="CONFIRM_ORDER_BARCODE_NUM" id="CONFIRM_ORDER_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
                            <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_EMERGENCY_PRIORITY">
                                <input type="checkbox" name="EMERGENCY_YN" id="CONFIRM_ORDER_EMERGENCY_PRIORITY"><i></i>
                                긴급우선 Sorting
                            </label>
                            <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_EXCLUDE_STOCK">
                                <input type="checkbox" name="CONFIRM_ORDER_EXCLUDE_STOCK"
                                       id="CONFIRM_ORDER_EXCLUDE_STOCK"><i></i> 재고 제외
                            </label>
                        </span>
                    </div>
                    <div id="CONFIRM_ORDER_GRID"></div>
                    <div class="right_sort">
                        (Total :
                            <span id="CONFIRM_ORDER_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows
                            <span id="CONFIRM_ORDER_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA)
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="topRightWrap left_float">
        <div>
            <form class="form-inline" id="PROCESS_CONFIRM_SEARCH_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessConfirmList">
                <div class="mg-bottom10">
                    <div class="row">
                        <span>
                            <label class="label_100" for="PROCESS_CONFIRM_CORPORATION">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="PROCESS_CONFIRM_CORPORATION">
                                <option value="">ALL</option>
                                <c:forEach var="code" items="${HighCode.H_1007}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span>
                            <label class="label_100" for="PROCESS_CONFIRM_MATERIAL">소재</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="PROCESS_CONFIRM_MATERIAL">
                                <option value=""> ALL</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </div>
                </div>
                <hr style="display: block">
                <div>
                    <div class="mg-bottom10">
                        <p>가공진행 List</p>
                        <span style="float: right">
                            <label class="checkbox-inline i-checks" for="PROCESS_CONFIRM_EMERGENCY_PRIORITY">
                                <input type="checkbox" name="EMERGENCY_YN"
                                       id="PROCESS_CONFIRM_EMERGENCY_PRIORITY"><i></i> 긴급우선 Sorting
                            </label>
                            <label class="checkbox-inline i-checks" for="PROCESS_CONFIRM_EXCLUDE_STOCK">
                                <input type="checkbox" name="PROCESS_CONFIRM_EXCLUDE_STOCK"
                                       id="PROCESS_CONFIRM_EXCLUDE_STOCK"><i></i> 재고 제외
                            </label>
                        </span>
                    </div>
                    <div id="PROCESS_CONFIRM_GRID"></div>
                    <div class="right_sort">
                        (Total :
                        <span id="PROCESS_CONFIRM_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows
                        <span id="PROCESS_CONFIRM_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span>EA )
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="botLeftWrap left_float">
        <div>
            <form class="form-inline" id="OUTSIDE_SEARCH_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectOutsideProcessingList">
                <div class="mg-bottom10">
                    <div class="row">
                        <span>
                            <label class="label_100" for="OUTSIDE_CORPORATION">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="OUTSIDE_CORPORATION">
                                <option value="">ALL</option>
                            </select>
                        </span>
                        <span>
                            <label class="label_100" for="OUTSIDE_SUBCONTRACTOR">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD"
                                    id="OUTSIDE_SUBCONTRACTOR">
                                <option value="">ALL</option>
                            </select>
                        </span>
                    </div>
                </div>
                <hr style="display: block">
                <div>
                    <div class="mg-bottom10">
                        <p>외주가공 List</p>
                    </div>
                    <div id="OUTSIDE_GRID"></div>
                    <div class="right_sort">
                        (Total :
                            <span id="OUTSIDE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows
                            <span id="OUTSIDE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="botRightWrap left_float">
        <div>
            <form class="form-inline" id="PROCESS_COMPLETE_SEARCH_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectProcessCompleteList">
                <div class="mg-bottom10">
                    <div class="row">
                        <span>
                            <label class="label_100" for="PROCESS_COMPLETE_CORPORATION">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="PROCESS_COMPLETE_CORPORATION">
                                <option value="">ALL</option>
                            </select>
                        </span>
                        <span>
                            <label class="label_100" for="PROCESS_COMPLETE_SUBCONTRACTOR">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="PROCESS_COMPLETE_SUBCONTRACTOR">
                                <option value="">ALL</option>
                            </select>
                        </span>
                    </div>
                </div>
                <hr style="display: block">
                <div>
                    <div class="mg-bottom10">
                        <p>가공완료 List (출하전)</p>
                    </div>
                    <div id="PROCESS_COMPLETE_GRID"></div>
                    <div class="right_sort">
                        (Total :
                        <span id="PROCESS_COMPLETE_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows
                        <span id="PROCESS_COMPLETE_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>



<script>
    $(function () {
        'use strict';
        let $confirmOrderGrid;
        const topLeftGridId = 'CONFIRM_ORDER_GRID';
        let topLeftPostData = fnFormToJsonArrayData('#CONFIRM_ORDER_SEARCH_FORM');
        const topLeftColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '변경일시', minWidth: 100, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {
                title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM',
                render: function (ui) {
                    if (ui.rowData.WORK_NM === '가공조립') {
                        return "<span>플러스버튼</span>";
                    }
                }
            },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY'},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '요망<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', dataType: 'string', dataIndx: 'MAIN_CONFIRM_ORDER'},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '규격', dataType: 'string', dataIndx: 'RBRUR'},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_KIND'},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {
                title: '', minWidth: 70, dataType: 'string', dataIndx: 'PROCESS_CONFIRM_BUTTON',
                render: function (ui) {
                    return '<button name="PROCESS_CONFIRM_BUTTON">가공확정</button>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=PROCESS_CONFIRM_BUTTON]').on('click', function (event) {
                        updatePartStatus(ui.rowData, 'PRO002');
                        event.preventDefault();
                    });
                }
            }
        ];
        let topLeftObj = {
            height: 300,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: topLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: topLeftPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                let data = $confirmOrderGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].ORDER_QTY ? parseInt(data[i].ORDER_QTY) : 0;
                }

                $('#CONFIRM_ORDER_TOTAL_RECORDS').html(totalRecords);
                $('#CONFIRM_ORDER_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            }
        };
        let $processConfirmGrid;
        const topRightGridId = 'PROCESS_CONFIRM_GRID';
        let topRightPostData = fnFormToJsonArrayData('#PROCESS_CONFIRM_SEARCH_FORM');
        const topRightColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY'},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '요망<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', dataType: 'select', dataIndx: 'MAIN_CONFIRM_ORDER'},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '규<br>격', minWidth: 100, dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_KIND'},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '발생일시', dataType: 'string', dataIndx: 'COMP_NUM'},
            {title: '소재주문', dataType: 'string', dataIndx: 'PART_STAUS', hidden: true},
            {title: '소재주문', dataType: 'string', dataIndx: 'PART_STAUS_NM'},
            {
                title: '', minWidth: 70, dataType: 'string', dataIndx: 'CONFIRM_CANCEL_BUTTON',
                render: function (ui) {
                    return '<button name="CONFIRM_CANCEL_BUTTON">확정취소</button>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=CONFIRM_CANCEL_BUTTON]').on('click', function (event) {
                        updatePartStatus(ui.rowData, null);
                        event.preventDefault();
                    });
                }
            }
        ];
        const topRightObj = {
            height: 300,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: topRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: topRightPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                let data = $processConfirmGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].ORDER_QTY ? parseInt(data[i].ORDER_QTY) : 0;
                }

                $('#PROCESS_CONFIRM_TOTAL_RECORDS').html(totalRecords);
                $('#PROCESS_CONFIRM_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            }
        };
        let $outsideGrid;
        const botLeftGridId = 'OUTSIDE_GRID';
        let botLeftPostData = fnFormToJsonArrayData('#OUTSIDE_SEARCH_FORM');
        const botLeftColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM'},
            {
                title: '외주발송', align: 'center', colModel: [
                    {title: '업체명', datatype: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '업체명', datatype: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '일시', datatype: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT', hidden: true},
                ]
            },
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', dataType: 'select', dataIndx: 'MAIN_CONFIRM_ORDER'},
            {title: '형<br>태', dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '형<br>태', dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '규<br>격', dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_KIND'},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '발생일시', dataType: 'string', dataIndx: 'STATUS_DT'}
        ];
        const botLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: botLeftColModel,
            // toolbar: rightBotToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: botLeftPostData,
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            complete: function () {
                let data = $outsideGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].ORDER_QTY ? parseInt(data[i].ORDER_QTY) : 0;
                }

                $('#OUTSIDE_TOTAL_RECORDS').html(totalRecords);
                $('#OUTSIDE_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
        };
        let $processCompleteGrid;
        const botRightGridId = 'PROCESS_COMPLETE_GRID';
        let botRightPostData = fnFormToJsonArrayData('#PROCESS_COMPLETE_SEARCH_FORM');
        const botRightColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_STATUS', dataType: 'integer', dataIndx: 'CONTROL_STATUS', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '관리번호', minWidth: 100, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM'},
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY'},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN'},
            {title: '요망<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'ORDER_DUE_DT'},
            {title: '가공<br>납기', minWidth: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', dataType: 'select', dataIndx: 'MAIN_CONFIRM_ORDER'},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '형<br>태', minWidth: 70, dataType: 'string', dataIndx: 'WORK_NM'},
            {title: '규<br>격', minWidth: 100, dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_KIND'},
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {title: '가공완료<br>일시', dataType: 'string', dataIndx: 'ORDER_QTY'},
            {
                title: '', minWidth: 70, dataType: 'string', dataIndx: 'CONFIRM_CANCEL_BUTTON',
                render: function (ui) {
                    return '<button name="CONFIRM_CANCEL_BUTTON">확정취소</button>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);

                    $cell.find('[name=CONFIRM_CANCEL_BUTTON]').on('click', function (event) {
                        updatePartStatus(ui.rowData, null);
                        event.preventDefault();
                    });
                }
            }
        ];
        const botRightObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: botRightColModel,
            // toolbar: rightBotToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: botRightPostData,
                getData: function (dataJSON) {return {data: dataJSON.data};}
            },
            complete: function () {
                let data = $processCompleteGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    totalOrderQuantity += data[i].ORDER_QTY ? parseInt(data[i].ORDER_QTY) : 0;
                }

                $('#PROCESS_COMPLETE_TOTAL_RECORDS').html(totalRecords);
                $('#PROCESS_COMPLETE_TOTAL_ORDER_QUANTITY').html(totalOrderQuantity);
            },
        };

        let reloadData = function () {
            $confirmOrderGrid.pqGrid('refreshDataAndView');
            $processConfirmGrid.pqGrid('refreshDataAndView');
            $outsideGrid.pqGrid('refreshDataAndView');
        };
        const tenSeconds = 10000;

        // setInterval(reloadData, tenSeconds);

        const isProcessAssembly = function (rowData) {
            let postData = {queryId: 'orderMapper.selectIsProcessAssembly'};
            postData = $.extend(postData, rowData);
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                console.log(data.list);
                return data.list[0];
            }, parameters, '');
        };

        const updatePartStatus = function (rowData, partStatus) {
            let newRowData = fnCloneObj(rowData);
            newRowData.PART_STATUS = partStatus;
            let gridInstance = $processConfirmGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            let QUERY_ID_ARRAY;
            changes.updateList.push(newRowData);
            let parameters;
            debugger;
            if (isProcessAssembly(rowData)) {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatusAll', 'orderMapper.createControlPartProgressAll']};
                changes.queryIdList = QUERY_ID_ARRAY;
                parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
            } else {
                QUERY_ID_ARRAY = {'updateQueryId': ['orderMapper.updateControlPartStatus', 'orderMapper.createControlPartProgress']};
                changes.queryIdList = QUERY_ID_ARRAY;
                parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
            }

            fnPostAjax(function (data, callFunctionParam) {
                $confirmOrderGrid.pqGrid('refreshDataAndView');
                $processConfirmGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        };

        $('#CONFIRM_ORDER_SEARCH_FORM').on('change', function() {
            topLeftPostData = fnFormToJsonArrayData('#CONFIRM_ORDER_SEARCH_FORM');
            $confirmOrderGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return topLeftPostData;
            });
            $confirmOrderGrid.pqGrid('refreshDataAndView');
        });
        $('#PROCESS_CONFIRM_SEARCH_FORM').on('change', function() {
            topRightPostData = fnFormToJsonArrayData('#PROCESS_CONFIRM_SEARCH_FORM');
            $processConfirmGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return topRightPostData;
            });
            $processConfirmGrid.pqGrid('refreshDataAndView');
        });
        $('#OUTSIDE_SEARCH_FORM').on('change', function() {
            botLeftPostData = fnFormToJsonArrayData('#OUTSIDE_SEARCH_FORM');
            $outsideGrid.pqGrid('option', 'dataModel.postData', function (ui) {
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
        /* init */


        $("#CONFIRM_ORDER_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode === 13) {
                $('#barcode_form').children('#queryId').val('popMapper.selectBarcodeInfo');
                $('#barcode_form').children('#popBarcode').val(this.value);

                let parameters = {'url': '/json-list', 'data': $('#barcode_form').serialize()};

                fnPostAjax(function (data, callFunctionParam) {
                    let list = data.list[0];
                    updatePartStatus(list, 'PRO002');
                }, parameters, '');

                e.preventDefault();
            }
        });

    });
</script>
