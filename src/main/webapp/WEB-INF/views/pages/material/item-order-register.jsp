<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="popup_container" id="item_order_register_popup" style="display: none;" data-keyboard="false" data-backdrop="static">
    <div class="layerPopup" style="width:1728px; height: fit-content;">
        <h3>소재 주문</h3>
        <span style="padding-left: 30px;">
            <span class="barCode" id="itemOrderRegisterBarcodeSpan"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="itempOrderResgisterBarcodeImg" style="height: 32px;"></span>
            <span class="barCodeTxt"><label for="itempOrderResgisterBarcodeNum"></label><input type="text" class="wd_270_barcode" id="itempOrderResgisterBarcodeNum" placeholder="도면의 바코드를 스캔해 주세요"></span>
        </span>
        <button type="button" class="pop_close mt-10 mr-8" data-dismiss="modal">닫기</button>
        <div class="t_area mt-10">
            <div class="t_h">
                <span class="list_t" style="width: 192px;">소재주문번호</span>
                <span style="width: 203px;">
                    <input type="text" name="" id="item_order_register_material_order_num" value="" style="background: lightgrey;" readonly>
                    <input type="hidden" name="" id="item_order_register_material_order_num_temp" value="">
                </span>
                <span class="list_t" style="width: 100px;">작성자</span>
                <span style="width: 100px;">
                    <select id="ORDER_USER_ID" name="ORDER_USER_ID" title="작성자" class="wd_100"></select>
                </span>
                <span id="item_order_register_popup_order_datetime" style="display: none; border: none; margin-left: 80px;">
                    주문일시 : 2020/05/13 17:23
                </span>
                <div style="line-height: 45px; display: none; padding-right: 5px;" class="d-inline right_float" id="orderNotCompleteBtnBox">
                    <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterPopAdd">추가</button>
                    <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterPopSave">저장</button>
                    <button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterPopSubmit">제출</button>
                    <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterPopDelete">삭제</button>
                </div>
                <div style="line-height: 45px; display: none; padding-right: 5px;" class="d-inline right_float" id="orderCompleteBtnBox">
                    <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterPopPrint">Print</button>
                    <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterPopCancel">제출 취소</button>
                </div>
            </div>
        </div>
        <div class="h_area mb-10">

        </div>
        <form class="form-inline" role="form" id="item_order_register_popup_form" name="item_order_register_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterPopList"/>
            <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
            <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
            <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
            <div class="d-flex tableWrap">
                <div class="mr-10">
                    <div id="item_order_register_popup_top_grid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="item_order_register_popup_top_grid_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
                <div class="ml-auto" style="display: none; width: 400px; height: 500px; overflow: auto;">
                    <div class="gridWrap popupTableDiv list1" style="height: 500px; overflow: auto"></div>
                </div>
            </div>
            <br/>
            <div class="btnWrap">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_register_search_form" name="item_order_register_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectItemOrderRegisterList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="COMP_CD" class="label_100">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_100">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">도면번호</label><input type="search" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="도면번호"></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="WORK_TYPE">작업형태</label>
                            <select class="wd_200" name="WORK_TYPE" id="WORK_TYPE" title="작업형태">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1033}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="CONTROL_NUM">작업지시번호</label><input type="search" name="CONTROL_NUM" id="CONTROL_NUM" class="wd_200" value="" title="작업지시번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MATERIAL_ORDER_NUM">소재주문번호</label><input type="search" name="MATERIAL_ORDER_NUM" id="MATERIAL_ORDER_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="M_COMP_CD">소재주문업체</label>
                            <select name="M_COMP_CD" id="M_COMP_CD" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li class="">
                        <span class="slt_wrap trans_slt" style="width: 120px;">
                            <select name="ITEM_ORDER_REGISTER_CONDITION" id="ITEM_ORDER_REGISTER_CONDITION" style="width: inherit; text-align-last: center;">
                                <c:forEach var="code" items="${HighCode.H_1085}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <div class="calendar_wrap" style="width:542px; padding-left: 0">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_REGISTER_START_DATE" id="ITEM_ORDER_REGISTER_START_DATE"><button type="button" id="ITEM_ORDER_REGISTER_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_REGISTER_END_DATE" id="ITEM_ORDER_REGISTER_END_DATE" readonly><button type="button" id="ITEM_ORDER_REGISTER_END_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="radio_box" style="margin-left:10px;">
                                <input reqcd="R" type="radio" name="SEL_ITEM_ORDER_REGISTER_TERM" id="SEL_ITEM_ORDER_REGISTER_TERM_DAY" value="today" ><label for="SEL_ITEM_ORDER_REGISTER_TERM_DAY">오늘</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="SEL_ITEM_ORDER_REGISTER_TERM" id="SEL_ITEM_ORDER_REGISTER_TERM_WEEK" value="week"><label for="SEL_ITEM_ORDER_REGISTER_TERM_WEEK">-1주</label>
                            </span>
                            <span class="radio_box">
                                <input reqcd="R" type="radio" name="SEL_ITEM_ORDER_REGISTER_TERM" id="SEL_ITEM_ORDER_REGISTER_TERM_MONTH" value="month"><label for="SEL_ITEM_ORDER_REGISTER_TERM_MONTH">-1개월</label>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box"><input type="checkbox" name="MATERIAL_ORDER_STATUS_CHECK_BOX" id="ORDER_WAIT_YN" value="NULL,MST001,MST003" checked><label for="ORDER_WAIT_YN"> 주문대기</label></span>
                            <span class="chk_box"><input type="checkbox" name="MATERIAL_ORDER_STATUS_CHECK_BOX" id="ORDER_YN" value="MST002" checked><label for="ORDER_YN"> 주문완료</label></span>
                            <span class="chk_box"><input type="checkbox" name="MATERIAL_ORDER_STATUS_CHECK_BOX" id="IN_YN" value="MST004"><label for="IN_YN"> 입고완료</label></span>
                            <span class="chk_box"><input type="checkbox" name="SHIPMENT_YN" id="SHIPMENT_YN"><label for="SHIPMENT_YN"> 출하완료</label></span>
                            <span class="chk_box"><input type="checkbox" name="OUTSIDE_YN" id="ITEM_ORDER_REGISTER_OUTSIDE_YN"><label for="ITEM_ORDER_REGISTER_OUTSIDE_YN"> 외주가공</label></span>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="ITEM_ORDER_REGISTER_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterSearch">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
            <input type="hidden" name="MATERIAL_ORDER_STATUS" id="MATERIAL_ORDER_STATUS">
            <input type="checkbox" name="IN_YN" id="HIDDEN_IN_YN" style="display: none">
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_60Wrap" id="dynamic_left_div"  style="width: 100%;">
                    <div class="buttonWrap">
                        <div class="d-inline">
                            <input type="search" id="itemOrderRegisterFilterKeyword" placeholder="Enter your keyword">
                            <select id="itemOrderRegisterFilterColumn"></select>
                            <select id="itemOrderRegisterFilterCondition">
                                <c:forEach var="code" items="${HighCode.H_1083}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>

                            <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterOrder">소재주문</button>
                            <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterCancel">주문취소</button>
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterCurrentStock">보유소재 전체현황</button>
                            <span class="chk_box"><input id="chkItemOrderRegisterAutoMatching" type="checkbox"/><label for="chkItemOrderRegisterAutoMatching">보유소재 자동매칭</label></span>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterSave">저장</button>
                            </span>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_left_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_register_left_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
                <div class="right_30Wrap" id="dynamic_right_div" style="display: none; width: 0">
                    <div class="buttonWrap">
                        <div class="d-inline">
                            <select id="itemOrderRegisterWarehouseSelectBox" name="itemOrderRegisterWarehouseSelectBox" title="창고">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1049}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <select id="itemOrderRegisterMaterialDetailSelectBox" name="itemOrderRegisterMaterialDetailSelectBox" title="소재종류">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <span class="slt_wrap">
                                <label for="itemOrderRegisterAreaSelectBox">가로세로</label>
                                <select id="itemOrderRegisterAreaSelectBox" name="itemOrderRegisterAreaSelectBox" class="wd_70" title="넓이조건">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1050}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label for="itemOrderRegisterAreaSelectBox">두께(T)</label>
                                <select id="itemOrderRegisterTconditionSelectBox" name="itemOrderRegisterTconditionSelectBox" class="wd_70" title="T 조건">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1050}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterOutSave">저장</button>
                            </span>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_right_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_register_right_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_register_hidden_form" name="item_order_register_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectItemOrderRegisterDetail"/>
    <input type="hidden" id="AUTO_SEARCH" name="AUTO_SEARCH" value="N"/>
    <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ"/>
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ"/>
    <input type="hidden" id="WAREHOUSE_CD" name="WAREHOUSE_CD"/>
    <input type="hidden" id="MATERIAL_DETAIL" name="MATERIAL_DETAIL"/>
    <input type="hidden" id="AREA" name="AREA"/>
    <input type="hidden" id="CONDITION" name="CONDITION"/>
    <input type="hidden" id="SIZE_W" name="SIZE_W"/>
    <input type="hidden" id="SIZE_H" name="SIZE_H"/>
    <input type="hidden" id="SIZE_T" name="SIZE_T"/>
</form>

<script type="text/javascript">
    let itemOrderRegisterSelectedRowIndex;
    let itemOrderRegisterLeftGrid = $("#item_order_register_left_grid");
    let itemOrderRegisterRightGrid = $("#item_order_register_right_grid");

    let itemOrderRegisterPopTopGrid = $("#item_order_register_popup #item_order_register_popup_top_grid");

    $(function () {
        'use strict';
        const $itemOrderRegisterStartDate = $('#ITEM_ORDER_REGISTER_START_DATE');
        const $itemOrderRegisterEndDate = $('#ITEM_ORDER_REGISTER_END_DATE');
        $itemOrderRegisterStartDate.datepicker({dateFormat: 'yy/mm/dd'});
        $itemOrderRegisterEndDate.datepicker({dateFormat: 'yy/mm/dd'});
        $itemOrderRegisterStartDate.datepicker('setDate', 'today');
        $itemOrderRegisterEndDate.datepicker('setDate', 'today');

        $('#MATERIAL_ORDER_STATUS').val("'NULL','MST001','MST003','MST002'");

        /** 공통 코드 이외의 처리 부분 **/
        const $itemOrderRegisterSearchForm = $("#item_order_register_search_form");
        fnCommCodeDatasourceSelectBoxCreate($itemOrderRegisterSearchForm.find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($itemOrderRegisterSearchForm.find("#M_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($itemOrderRegisterSearchForm.find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_popup").find("#ORDER_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});

        $itemOrderRegisterSearchForm.find('[name=SEL_ITEM_ORDER_REGISTER_TERM]').change(function () {
             let value = $(this).val(), today = new Date(), newDate = new Date();
             // console.log(value);
             switch (value) {
                 case "today":
                     break;
                 case "week":
                     newDate.setDate(newDate.getDate() - 6);
                     break;
                 case "month":
                     newDate.setMonth(newDate.getMonth() - 1);
                     break;
             }
             $itemOrderRegisterSearchForm.find('#ITEM_ORDER_REGISTER_START_DATE').val(newDate.yyyymmdd());
             $itemOrderRegisterSearchForm.find('#ITEM_ORDER_REGISTER_END_DATE').val(today.yyyymmdd());
        });

        $itemOrderRegisterSearchForm.find('#SEL_ITEM_ORDER_REGISTER_TERM_WEEK').click();

        let itemOrderRegisterLeftColModel= [
            {title: '가공<br>확정일시', dataIndx: 'STATUS_DT', width: 75, editable: false},
            {title: '', align: 'center', dataIndx: 'CONTROL_NUM_BUTTON', width: 25, minWidth: 25, editable: false,
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
            {title: '작업지시번호', align: 'left', dataIndx: 'CONTROL_PART_NUM', width: 150, editable: false,
                render: function(ui){
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if (WORK_TYPE === 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            {title: '도면번호', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE', minWidth: 50, width: 50, editable: false,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')}
            },
            {title: '현재위치', dataIndx: 'POP_POSITION_NM', width: 80, editable: false},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM', width: 60, editable: false,
                editor: {
                    type: 'select',
                    mapIndices: { name: "ORDER_COMP_NM", id: "ORDER_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    //options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}}),
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ORDER_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '규격', dataIndx: 'SIZE_TXT', minWidth: 90, width: 90, editable: false },
            {title: '규격_가로', dataIndx: 'SIZE_W', minWidth: 90, width: 90, editable: false, hidden: true },
            {title: '규격_세로', dataIndx: 'SIZE_H', minWidth: 90, width: 90, editable: false, hidden: true },
            {title: '규격_두께', dataIndx: 'SIZE_T', minWidth: 90, width: 90, editable: false, hidden: true },
            {title: '조정<br>수량', dataIndx: 'ADDITIONAL_QTY', minWidth: 50, width: 50, editable: false},
            {title: '발주<br>수량', dataIndx: 'ORDER_QTY', minWidth: 50, width: 50, editable: false},
            {
                title: '재고충당', align: 'center',
                colModel: [
                    {title: '재고번호', dataType: 'String', dataIndx: 'INSIDE_STOCK_NUM', width: 100, minWidth: 100, editable: false},
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_REQUEST_QTY', width: 40, minWidth: 40, editable: false},
                    {title: '불출', dataType: 'integer', format: '#,###', dataIndx: 'STOCK_OUT_QTY', width: 40, minWidth: 40, editable: false}
                ]
            },
            {title: '소재<br>주문상태', dataIndx: 'M_STATUS_NM', width: 70, editable: false},
            {title: '소재 주문번호', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, editable: false,
                render: function (ui) {
                    let cls = null;
                    if (ui.cellData) cls = 'underlinePoint';
                    return {cls: cls, text: itemOrderRegisterFilterRender(ui)};
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    if($cell.hasClass("underlinePoint")){
                        $cell.bind("click", function () {
                            itemOrder('cell');
                        });
                    }
                }
            },
            {title: '주문요청 일시', dataType: 'date', dataIndx: 'M_ORDER_DT',  width: 90, editable: false},
            {
                title: '비고', dataIndx: 'NOTE', minWidth: 120,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {
                    return itemOrderRegisterGridCellEditable(ui);
                }
            },
            {title: '가공<br>납기', dataIndx: 'INNER_DUE_DT', width: 50, editable: false},
            {title: '소재<br>형태', dataIndx: 'MATERIAL_KIND', minWidth: 60, width: 60, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '소재<br>종류', dataIndx: 'MATERIAL_DETAIL', minWidth: 70, width: 70, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);},
            },
            {title: '요청소재<br>Size(mm)', dataIndx: 'M_SIZE_TXT', minWidth: 90, width: 90, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 120,
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '주문<br>수량', dataIndx: 'M_ORDER_QTY', minWidth: 50, width: 50, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '주문업체', dataIndx: 'M_COMP_CD', width: 70, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}),
                },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '요청사항', align: "center", colModel: [
                    {title: '요청사항', dataType: 'html', dataIndx: 'REQUEST_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, minWidth: 150,
                        halign:'center', align: 'left',
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                let cellData = ui.cellData;
                                let codeList = [];

                                if (cellData) {
                                    cellData = cellData.split(',');
                                    for (let i = 0, list = fnGetCommCodeGridSelectBox('1026'), LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                                        if (cellData.includes(list[i].text)) {
                                            codeList.push(list[i].value);
                                        }
                                    }
                                }
                                ui.$editor.val(codeList).pqSelect({
                                    checkbox: true,
                                    multiplePlaceholder: "<spring:message code='com.form.top.sel.option'/>",
                                    selectallText: "<spring:message code='com.form.top.all.option'/>"
                                });
                            },
                            getData: function(ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal= "", concatCd = "";

                                if(clave == null){
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length-1);
                                return concatVal.substring(0, concatVal.length-1);
                            }
                        },
                        editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
                    },
                    {title: '비고', dataIndx: 'M_ORDER_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, minWidth: 120,
                        editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {
                title: '보유소재 충당수량', align: "center", colModel: [
                    {title: '충당소재Size', dataIndx: 'OUT_SIZE_TXT', editable: false, width: 120},
                    {title: '수량', dataIndx: 'OUT_QTY', editable: false},
                    {title: '완료', dataIndx: 'COMPLETE_OUT_QTY', editable: false},
                    {
                        title: '', dataIndx: 'RESET_BUTTON', editable: false, width: 60,
                        render: function (ui) {
                            let ORDER_STATUS = ui.rowData.M_STATUS == undefined ? '' : ui.rowData.M_STATUS;
                            let returnVal = '<button type="button" id="itemOrderRegisterOutReset" class="miniBtn gray">Reset</button>';
                            if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') {
                                returnVal = '';
                            }
                            return returnVal;
                        },
                        postRender: function (ui) {
                            const grid = this,
                                $cell = grid.getCell(ui),
                                rowData = ui.rowData;
                            $cell.find("#itemOrderRegisterOutReset").bind("click", function () {
                                const data = {
                                    queryId: 'material.deleteMaterialOrderToNumber,material.deleteItemOrderRegisterOut',
                                    MATERIAL_ORDER_NUM: rowData.MATERIAL_ORDER_NUM,
                                    MY_MAT_OUT_SEQ: rowData.MY_MAT_OUT_SEQ
                                };
                                let parameters = {'url': '/json-manager', 'data': data};
                                fnPostAjax(function () {
                                    itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                                        return (fnFormToJsonArrayData('#item_order_register_search_form'));
                                    });
                                    itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');

                                    itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.postData', function () {
                                        return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                                    });
                                    itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                                }, parameters, '');
                            });
                        }
                    },
                    {
                        title: '상태', dataIndx: 'OUT_YN', editable: false,
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                ]
            },
            {title: '.', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true}
        ];

        let itemOrderRegisterRightColModel = [
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM' , editable: false, minWidth: 80} ,
            {title: '상세위치', dataType: 'string', dataIndx: 'LOC_NM', minWidth: 80},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , editable: false, minWidth: 80} ,
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' , editable: false, minWidth: 50} ,
            {title: 'Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT' , editable: false, minWidth: 100} ,
            {title: '재고', dataType: 'integer', dataIndx: 'STOCK_QTY' , editable: false, minWidth: 40} ,
            {title: '요청', dataType: 'integer', dataIndx: 'OUT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} , minWidth: 40} ,
            {title: 'MY_MAT_STOCK_SEQ', dataType: 'string', dataIndx: 'MY_MAT_STOCK_SEQ', hidden: true } ,
            {title: 'MY_MAT_OUT_SEQ', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', hidden: true } ,
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true } ,
            {title: 'MATERIAL_ORDER_SEQ', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true } ,
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true }
        ];

        const itemOrderRegisterPopTopColModel = [
            {
                title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {
                title: '작업지시번호', halign: 'center', align: 'left', dataType: 'string', dataIndx: 'CONTROL_PART_NUM', width: 180, editable: false, styleHead: {'font-weight': 'bold','color': 'red'},
                render: function (ui) {
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if (WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, editable: false, styleHead: {'font-weight': 'bold','color': 'red'}},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '주문대상 관리정보', align: 'center', colModel: [
                    {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 110, editable: false},
                    {title: '조정', dataType: 'string', dataIndx: 'ADDITIONAL_QTY', minWidth: 40, width: 40, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '발주', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '충당요청', dataType: 'string', dataIndx: 'STOCK_REQUEST_QTY', minWidth: 40, width: 40, editable: false}
                ]
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let rowData = ui.rowData;
                        if(fnIsEmpty(rowData.MATERIAL_TYPE)) {
                            return fnGetCommCodeGridSelectBox('1027');
                        }else {
                            return fnGetCommCodeGridSelectBoxEtc('1027', rowData.MATERIAL_TYPE);
                        }
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 110, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 35, width: 35, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, validations: [{ type: 'minLen', value: 1, msg: "Required"}]},
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 95, validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: "value", labelIndx: "text", options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}), },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '주문요청사항', align: "center", colModel: [
                    {   title: '요청사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 150,
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        halign:'center', align: 'left',
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_pop_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                let cellData = ui.cellData;
                                let codeList = [];

                                if (cellData) {
                                    cellData = cellData.split(',');
                                    for (let i = 0, list = fnGetCommCodeGridSelectBox('1026'), LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                                        if (cellData.includes(list[i].text)) {
                                            codeList.push(list[i].value);
                                        }
                                    }
                                }
                                ui.$editor.val(codeList).pqSelect({
                                    checkbox: true,
                                    multiplePlaceholder: "<spring:message code='com.form.top.sel.option'/>",
                                    selectallText: "<spring:message code='com.form.top.all.option'/>"
                                });
                            },
                            getData: function (ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal = "", concatCd = "";

                                if (clave == null) {
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length - 1);
                                return concatVal.substring(0, concatVal.length - 1);
                            }
                        }
                    },
                    {   title: '비고사항',
                        dataType: 'string',
                        dataIndx: 'M_ORDER_NOTE',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        minWidth: 120
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {
                title: '이전 완료주문 정보', align: 'center', colModel: [
                    {
                        title: '주문번호', dataIndx: 'FINISH_MATERIAL_ORDER_NUM', minWidth: 110, editable: false,
                        render: function (ui) {
                            const cellData = ui.cellData;

                            if (cellData) {
                                return cellData.replace(/&lt;/g, '<');
                            }
                        }
                    },
                    {
                        title: '수량', dataIndx: 'M_ORDER_COMPLETED_QTY', width: 55, editable: false,
                        render: function (ui) {
                            const cellData = ui.cellData;

                            if (cellData) {
                                return cellData.replace(/&lt;/g, '<');
                            }
                        }
                    },
                ]
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 60},
            {title: '', dataType: 'string', dataIndx: '', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    let ORDER_STATUS = ui.rowData.ORDER_STATUS;
                    if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') return '';
                    else return '<span id="deleteItem" class="circleMinusIcon" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    let rowIndex = ui.rowIndx;
                    $cell.find("#deleteItem").bind("click", function () {
                        let rowData = ui.rowData;
                        let parameters = {
                            'url': '/json-list',
                            'data': {
                                'queryId': 'deleteMaterialOrderToSequence',
                                'MATERIAL_ORDER_SEQ': rowData.MATERIAL_ORDER_SEQ
                            }
                        };
                        fnPostAjaxAsync(function () {
                            itemOrderRegisterPopTopGrid.pqGrid('deleteRow', {rowIndx: rowIndex});

                            makeInnerTable();
                        }, parameters, '');
                    });
                }
            },
            {title: '입고일시', dataIndx: 'IN_DT', width: 100, editable: false},
            {title: 'ORG_M_ORDER_QTY', dataType: 'string', dataIndx: 'ORG_M_ORDER_QTY', hidden: true},
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MATERIAL_ORDER_SEQ', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: 'MATERIAL_ORDER_NUM', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true},
            {title: 'ORDER_USER_ID', dataType: 'string', dataIndx: 'ORDER_USER_ID', hidden: true}
        ];

        const itemOrderRegisterPopTopColModel_temp = [
            {
                title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {
                title: '작업지시번호', halign: 'center', align: 'left', dataType: 'string', dataIndx: 'CONTROL_PART_NUM', width: 180, editable: false, styleHead: {'font-weight': 'bold','color': 'red'},
                render: function (ui) {
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if (WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, editable: false, styleHead: {'font-weight': 'bold','color': 'red'}},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '주문대상 관리정보', align: 'center', colModel: [
                    {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 110, editable: false},
                    {title: '조정', dataType: 'string', dataIndx: 'ADDITIONAL_QTY', minWidth: 40, width: 40, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '발주', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '충당요청', dataType: 'string', dataIndx: 'STOCK_REQUEST_QTY', minWidth: 40, width: 40, editable: false}
                ]
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 110, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 35, width: 35, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 95, validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: "value", labelIndx: "text", options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}), },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '주문요청사항', align: "center", colModel: [
                    {   title: '요청사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 150,
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        halign:'center', align: 'left',
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_pop_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                let cellData = ui.cellData;
                                let codeList = [];

                                if (cellData) {
                                    cellData = cellData.split(',');
                                    for (let i = 0, list = fnGetCommCodeGridSelectBox('1026'), LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                                        if (cellData.includes(list[i].text)) {
                                            codeList.push(list[i].value);
                                        }
                                    }
                                }
                                ui.$editor.val(codeList).pqSelect({
                                    checkbox: true,
                                    multiplePlaceholder: "<spring:message code='com.form.top.sel.option'/>",
                                    selectallText: "<spring:message code='com.form.top.all.option'/>"
                                });
                            },
                            getData: function (ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal = "", concatCd = "";

                                if (clave == null) {
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length - 1);
                                return concatVal.substring(0, concatVal.length - 1);
                            }
                        }
                    },
                    {   title: '비고사항',
                        dataType: 'string',
                        dataIndx: 'M_ORDER_NOTE',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        minWidth: 120
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 60},
            {title: '', dataType: 'string', dataIndx: '', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    let ORDER_STATUS = ui.rowData.ORDER_STATUS;
                    if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') return '';
                    else return '<span id="deleteItem" class="circleMinusIcon" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    let rowIndex = ui.rowIndx;
                    $cell.find("#deleteItem").bind("click", function () {
                        let rowData = ui.rowData;
                        let parameters = {
                            'url': '/json-list',
                            'data': {
                                'queryId': 'deleteMaterialOrderToSequence',
                                'MATERIAL_ORDER_SEQ': rowData.MATERIAL_ORDER_SEQ
                            }
                        };
                        fnPostAjaxAsync(function () {
                            itemOrderRegisterPopTopGrid.pqGrid('deleteRow', {rowIndx: rowIndex});

                            makeInnerTable();
                        }, parameters, '');
                    });
                }
            },
            {title: '입고일시', dataIndx: 'IN_DT', width: 100, editable: false},
            {title: 'ORG_M_ORDER_QTY', dataType: 'string', dataIndx: 'ORG_M_ORDER_QTY', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'ORDER_USER_ID', hidden: true}
        ];

        const itemOrderRegisterPopTopColModel_disabled= [
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {title: '작업지시번호', halign: 'center', align: 'left', dataType: 'string', dataIndx: 'CONTROL_PART_NUM', width: 180, editable: false,
                render: function(ui){
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if (WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            // {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, width: 30, editable: false, styleHead: {'font-weight': 'bold','color': 'red'}},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '주문대상 관리정보', align: 'center', colModel: [
                    {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 110, editable: false},
                    {title: '조정', dataType: 'string', dataIndx: 'ADDITIONAL_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '충당요청', dataType: 'string', dataIndx: 'STOCK_REQUEST_QTY', minWidth: 40, width: 40, editable: false}
                ]
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , editable: false,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , editable: false,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', editable: false, width: 110},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 35, width: 35, editable: false },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 95, editable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}),
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '주문요청사항', align: "center", colModel: [
                    {   title: '요청사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 150, width: 150, editable: false,
                        halign:'center', align: 'left',
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_pop_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                let cellData = ui.cellData;
                                let codeList = [];

                                if (cellData) {
                                    cellData = cellData.split(',');
                                    for (let i = 0, list = fnGetCommCodeGridSelectBox('1026'), LIST_LENGTH = list.length; i < LIST_LENGTH; i++) {
                                        if (cellData.includes(list[i].text)) {
                                            codeList.push(list[i].value);
                                        }
                                    }
                                }
                                ui.$editor.val(codeList).pqSelect({
                                    checkbox: true,
                                    multiplePlaceholder: "<spring:message code='com.form.top.sel.option'/>",
                                    selectallText: "<spring:message code='com.form.top.all.option'/>"
                                });
                            },
                            getData: function (ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal = "", concatCd = "";

                                if (clave == null) {
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length - 1);
                                return concatVal.substring(0, concatVal.length - 1);
                            }
                        }
                    },
                    {title: '비고사항', dataType: 'string', dataIndx: 'M_ORDER_NOTE', minWidth: 120, width: 120, editable: false}
                ]
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', width: 60, editable: false},
            {title: '', dataType: 'string', dataIndx: '', minWidth: 25, width: 25, editable: false,
                render: function () {return '';}
            },
            {title: '입고일시', dataIndx: 'IN_DT', width: 100, editable: false},
            {title: 'ORG_M_ORDER_QTY', dataType: 'string', dataIndx: 'ORG_M_ORDER_QTY', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'ORDER_USER_ID', hidden: true}
        ];

        itemOrderRegisterLeftGrid.pqGrid({
            height: '100%',
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'CONTROL_DETAIL_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#item_order_register_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            postRenderInterval: -1,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: itemOrderRegisterFilterRender}, filterModel: { mode: 'OR' },
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: itemOrderRegisterLeftColModel,
            showTitle: false,
            title: false,
            strNoRows: g_noData,
            editModel: {clicksToEdit: 1},
            load: function () {
                let opts = '<option value=\"\">All Fields</option>';
                const $itemOrderRegisterFilterColumn = $("#itemOrderRegisterFilterColumn");
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden === undefined;
                    if(hiddenYn && column.title){
                        opts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                    }
                });
                $itemOrderRegisterFilterColumn.html(opts);

                let rollSeq = '${authUserInfo.ROLE_SEQ}';
                let pqTheme = $('#view_tab_' + rollSeq + '0401 .pq-theme');
                pqTheme.css('overflow', 'initial');

                const autoMerge = function (grid, refresh) {
                    let mergeCellList = [],
                        colModelList = grid.getColModel(),
                        i = colModelList.length,
                        data = grid.option('dataModel.data');


                    const controlList = [
                        // 'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'ORDER_COMP_NM',
                    ];
                    const partList = [
                        'STATUS_DT', 'CONTROL_NUM_BUTTON', 'CONTROL_PART_NUM', 'DRAWING_NUM','IMG_GFILE_SEQ',
                        'WORK_TYPE', 'POP_POSITION_NM', 'ORDER_COMP_NM', 'SIZE_TXT', 'SIZE_W', 'SIZE_H', 'SIZE_T',
                        'ORDER_QTY' /* , 'OUT_SIZE_TXT', 'OUT_QTY', 'COMPLETE_OUT_QTY', 'RESET_BUTTON', 'OUT_YN' */ // 확인 필요
                    ];
                    const includeList = controlList.concat(partList);

                    while (i--) {
                        let dataIndx = colModelList[i].dataIndx,
                            rc = 1,
                            j = data.length;

                        if (includeList.includes(dataIndx)) {
                            while (j--) {
                                let controlNum = data[j]['CONTROL_PART_NUM'],
                                    controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_PART_NUM'] : undefined,
                                    cellData = data[j][dataIndx],
                                    cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                                if (controlList.includes(dataIndx)) {
                                    if (controlNum === controlNumPrev) {
                                        // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                        if (cellData == cellDataPrev) {
                                            rc++;
                                        }
                                    } else if (rc > 1) {
                                        /**
                                         * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                         * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                         * rc: number of rows in the range. 범위 내 행 수.
                                         * cc: number of columns in the range. 범위 내 열 수.
                                         */
                                        mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                        rc = 1;
                                    }
                                } else if (partList.includes(dataIndx)) {
                                    let cellData = data[j][dataIndx],
                                        cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                                    if (controlNum === controlNumPrev) {
                                        // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                        if (cellData == cellDataPrev) {
                                            rc++;
                                        }
                                    } else if (rc > 1) {
                                        /**
                                         * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                         * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                         * rc: number of rows in the range. 범위 내 행 수.
                                         * cc: number of columns in the range. 범위 내 열 수.
                                         */
                                        mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                        rc = 1;
                                    }
                                }
                            }
                        }
                    }

                    grid.option('mergeCells', mergeCellList);
                    if (refresh) {
                        grid.refreshView();
                    }
                };

                autoMerge(this, true);
            },
            complete: function () {
                let data = itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.data');

                $('#item_order_register_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                itemOrderRegisterSelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) itemOrderRegisterSelectedRowIndex.push(i);
                }
            },
            cellClick: function( event, ui) {
                let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ === undefined ? '' : ui.rowData.MATERIAL_ORDER_SEQ;
                let ORDER_STATUS = ui.rowData.M_STATUS === undefined ? '' : ui.rowData.M_STATUS;

                // 소재 입고 상태
                if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') {
                    $("#btnItemOrderRegisterOutSave").attr('disabled', true);
                } else {
                    // 확인 필요
                    // if (MATERIAL_ORDER_SEQ === '') {
                        $("#btnItemOrderRegisterOutSave").attr('disabled', false);
                    // } else {
                    //     $("#btnItemOrderRegisterOutSave").attr('disabled', true);
                    // }
                }

                $("#item_order_register_hidden_form #MATERIAL_ORDER_SEQ").val(MATERIAL_ORDER_SEQ);
                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.rowData.CONTROL_DETAIL_SEQ);
                $("#item_order_register_hidden_form #SIZE_W").val(ui.rowData.SIZE_W);
                $("#item_order_register_hidden_form #SIZE_H").val(ui.rowData.SIZE_H);
                $("#item_order_register_hidden_form #SIZE_T").val(ui.rowData.SIZE_T);

                let hiddenYn = $("#item_order_register_hidden_form #AUTO_SEARCH").val();
                if (hiddenYn === 'Y') {
                    $('#itemOrderRegisterMaterialDetailSelectBox').val(ui.rowData.MATERIAL_DETAIL);
                    $('#item_order_register_hidden_form #MATERIAL_DETAIL').val(ui.rowData.MATERIAL_DETAIL);
                    itemOrderRegisterRightGrid.pqGrid('destroy');
                    selectItemOrderRegisterRightList();
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    itemOrderRegisterLeftGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        });

        selectItemOrderRegisterRightList();

        function selectItemOrderRegisterRightList() {
            itemOrderRegisterRightGrid.pqGrid({
                height: '100%',
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'MY_MAT_STOCK_SEQ',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_register_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                trackModel: {on: true},
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                colModel: itemOrderRegisterRightColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData,
                complete: function () {
                    let data = itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_register_right_grid_records').html(data.length);
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        itemOrderRegisterRightGrid.pqGrid('updateRow', {
                            rowIndx: ui.rowIndx,
                            row: {[ui.dataIndx]: ui.oldVal}
                        });
                    }
                },
                change: function (evt, ui) {
                    let MATERIAL_ORDER_SEQ = $("#item_order_register_hidden_form #MATERIAL_ORDER_SEQ").val();
                    let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
                    let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
                    if ((CONTROL_SEQ !== '' && CONTROL_DETAIL_SEQ !== '') || MATERIAL_ORDER_SEQ !== '') {
                        itemOrderRegisterRightGrid.pqGrid("updateRow", {'rowIndx': ui.updateList[0].rowIndx,
                            row: {'CONTROL_SEQ': CONTROL_SEQ, 'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ, 'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ}});
                    }
                }
            });
        }

        let itemOrderRegisterGridCellEditable = function(ui){
            let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let M_STATUS = rowData.M_STATUS;
            // return M_STATUS !== 'MST002';
            return M_STATUS !== 'MST002' && (typeof rowData.M_STATUS != 'undefined' && typeof rowData.MATERIAL_ORDER_NUM != 'undefined');
        };

        $('#item_order_register_popup').on({
            'show.bs.modal': function () {
                $('.popupTableDiv').parent().width('100%');
                $('.popupTableDiv').parent().prev().width('100%');

                itemOrderRegisterPopTopGrid.pqGrid({
                    width: '100%', height: 500,
                    dataModel: {
                        location: 'remote', dataType: 'json', method: 'POST', recIndx: 'ROWNUM',
                        url: '/paramQueryGridSelect',
                        postData: fnFormToJsonArrayData('item_order_register_popup_form'),
                        getData: function (dataJSON) {
                            return {data: dataJSON.data};
                        }
                    },
                    columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                    scrollModel: {autoFit: true},
                    numberCell: {width: 30, title: 'No', show: true},
                    selectionModel: {type: 'cell', mode: 'multiple'},
                    swipeModel: {on: false},
                    collapsible: false,
                    postRenderInterval: -1,
                    resizable: false,
                    trackModel: {on: true},
                    colModel: itemOrderRegisterPopTopColModel,
                    showTitle: false,
                    title: false,
                    editModel: {clicksToEdit: 1},
                    complete: function () {
                        const data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
                        const $itemOrderRegisterMaterialOrderNum = $('#item_order_register_material_order_num');
                        const $itemOrderRegisterMaterialOrderNumTemp = $('#item_order_register_material_order_num_temp');
                        const $orderUserId = $('#item_order_register_popup').find('#ORDER_USER_ID');
                        const $itemOrderRegisterPopupOrderDatetime = $('#item_order_register_popup_order_datetime');
                        let MATERIAL_ORDER_NUM = '';
                        let ORDER_USER_ID = '';
                        let ORDER_STATUS = '';

                        if (data.length > 0) {
                            $('#item_order_register_popup_top_grid_records').html(data.length);
                            MATERIAL_ORDER_NUM = $('#item_order_register_popup_form #MATERIAL_ORDER_NUM').val();
                            ORDER_USER_ID = data[0].ORDER_USER_ID === undefined ? '' : data[0].ORDER_USER_ID;
                            ORDER_STATUS = data[0].ORDER_STATUS === undefined ? '' : data[0].ORDER_STATUS;
                        }
                        let parameters = {
                            'url': '/json-list',
                            'data': {'queryId': 'material.selectItemOrderRegisterNextMaterialOrderNum'}
                        };
                        fnPostAjaxAsync(function (data) {
                            let list = data.list[0];

                            if (fnIsEmpty(MATERIAL_ORDER_NUM)) {
                                MATERIAL_ORDER_NUM = list.MATERIAL_ORDER_NUM;
                                $itemOrderRegisterMaterialOrderNumTemp.val(MATERIAL_ORDER_NUM);
                            } else {
                                $itemOrderRegisterMaterialOrderNum.val(MATERIAL_ORDER_NUM);
                                $itemOrderRegisterMaterialOrderNumTemp.val(MATERIAL_ORDER_NUM);
                            }

                            if (!fnIsEmpty($itemOrderRegisterMaterialOrderNum.val()) && ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') {
                                $orderUserId.val(ORDER_USER_ID || '');
                            } else {
                                $orderUserId.val('${authUserInfo.USER_ID}');
                            }

                            makeInnerTable();
                        }, parameters, '');
                        // 주문일시 가져오기
                        parameters = {
                            'url': '/json-info',
                            'data': {
                                queryId: 'material.selectItemOrderRegisterOrderDatetime',
                                MATERIAL_ORDER_NUM: $itemOrderRegisterMaterialOrderNum.val()
                            }
                        };
                        fnPostAjaxAsync(function (data) {
                            let info = data.info;

                            if (fnIsEmpty(info)) {
                                $itemOrderRegisterPopupOrderDatetime.hide();
                            } else {
                                $itemOrderRegisterPopupOrderDatetime.html('주문일시 : ' + info.ORDER_DT);
                                $itemOrderRegisterPopupOrderDatetime.show();
                            }
                        }, parameters, '');

                        btnDisabled();
                    },
                    cellSave: function (evt, ui) {
                        if (ui.oldVal === undefined && ui.newVal === null) {
                            itemOrderRegisterPopTopGrid.pqGrid('updateRow', {
                                rowIndx: ui.rowIndx,
                                row: {[ui.dataIndx]: ui.oldVal}
                            });
                        }
                    },
                    change: function (evt, ui) {
                        $('#btnItemOrderRegisterPopSubmit').attr('disabled', true);
                        if (ui.source === 'edit' || ui.source === 'clear') {
                            let rowIndx = ui.updateList[0].rowIndx;
                            let data = ui.updateList[0].rowData;
                            let newRow = ui.updateList[0].newRow;

                            if(newRow.hasOwnProperty("ADDITIONAL_QTY")) {
                                let totalQty = Number(data.ORG_M_ORDER_QTY) + Number(fnIsEmpty(newRow.ADDITIONAL_QTY)?0:newRow.ADDITIONAL_QTY)
                                this.updateRow({
                                    rowIndx: rowIndx,
                                    row: {
                                        'M_ORDER_QTY': totalQty
                                    },
                                    checkEditable: false
                                });
                            }
                            this.refreshView();
                        }
                    },
                });

                setTimeout(function () {
                    $('#item_order_register_popup').find('#itempOrderResgisterBarcodeNum').focus();
                }, 1000);
            },
            'hide.bs.modal': function () {
                const $popupTableDiv = $('.popupTableDiv');
                if (itemOrderRegisterPopTopGrid.hasClass('pq-grid')) {
                    itemOrderRegisterPopTopGrid.pqGrid('destroy');
                }

                $('#item_order_register_material_order_num').val('');
                $('#item_order_register_material_order_num_temp').val('');

                $popupTableDiv.parent().hide();
                $popupTableDiv.html('');

                $('#btnItemOrderRegisterSearch').trigger('click');
            }
        });

        $('#item_order_register_search_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchItemOrderRegister();
            }
        });
        /** 버튼 처리 **/
        $('#btnItemOrderRegisterSearch').on('click', function(){
            searchItemOrderRegister();
        });

        function searchItemOrderRegister() {
            itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_search_form'));
            });
            itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
        }

        $("#btnItemOrderRegisterOrder").on('click', function(){
            itemOrder('button');
        });

        $("#btnItemOrderRegisterCancel").on('click', function(){
            orderCancel('grid');
        });

        $("#btnItemOrderRegisterCurrentStock").on('click', function(){
            $("a[pid='"+ $("#stockNo").val() +"']").trigger("click");
        });

        $("#chkItemOrderRegisterAutoMatching").on('change', function(evt){
            let hiddenYn = evt.target.checked === true ? 'Y' : 'N';
            $("#item_order_register_hidden_form #AUTO_SEARCH").val(hiddenYn);

            if (hiddenYn === 'Y') {
                divClose();
            } else {
                divOpen();
            }
        });

        $("#btnItemOrderRegisterSave").on('click', function(){
            let itemOrderRegisterInsertUpdateQueryList = ['material.insertUpdateItemOrderRegister', 'material.updateMaterialOrderUnitMaterialAutoAmt', 'material.updateControlPartMaterial', 'orderMapper.updateControlAutomaticQuote'];

            fnModifyPQGrid(itemOrderRegisterLeftGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);
        });

        $('#btnItemOrderRegisterOutSave').on('click', function(){
            let MATERIAL_ORDER_SEQ = $('#item_order_register_hidden_form #MATERIAL_ORDER_SEQ').val();
            let CONTROL_SEQ = $('#item_order_register_hidden_form #CONTROL_SEQ').val();
            let CONTROL_DETAIL_SEQ = $('#item_order_register_hidden_form #CONTROL_DETAIL_SEQ').val();

            if ((CONTROL_SEQ !== '' && CONTROL_DETAIL_SEQ !== '') || MATERIAL_ORDER_SEQ !== '') {
                const gridInstance = itemOrderRegisterRightGrid.pqGrid('getInstance').grid;
                //추가 또는 수정된 값이 있으면 true
                if (gridInstance.isDirty()) {
                    let changes = gridInstance.getChanges({format: 'byVal'});
                    let parameters = {'url': '/providePossessionMaterialSave', 'data': {data: JSON.stringify(changes)}};

                    fnPostAjaxAsync(function (data, callFunctionParam) {
                        itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                        setTimeout(function () {
                            $('#btnItemOrderRegisterSearch').trigger('click');
                        }, 1000);
                    }, parameters, '');
                }
            } else {
                fnAlert(null, 'You must be select item.');
            }
        });

        /**
         * fnFilterHandler
         * @Parameter
         * */
        $('#itemOrderRegisterFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(itemOrderRegisterLeftGrid, 'itemOrderRegisterFilterKeyword', 'itemOrderRegisterFilterCondition', 'itemOrderRegisterFilterColumn');

                let data = itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.data');
                $('#item_order_register_left_grid_records').html(data.length);
            },
            'search': function () {
                fnFilterHandler(itemOrderRegisterLeftGrid, 'itemOrderRegisterFilterKeyword', 'itemOrderRegisterFilterCondition', 'itemOrderRegisterFilterColumn');

                let data = itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.data');
                $('#item_order_register_left_grid_records').html(data.length);
            }
        });

        $('#itemOrderRegisterFilterCondition').on('change', function () {
            fnFilterHandler(itemOrderRegisterLeftGrid, 'itemOrderRegisterFilterKeyword', 'itemOrderRegisterFilterCondition', 'itemOrderRegisterFilterColumn');
        });

        $('#itemOrderRegisterWarehouseSelectBox').on('change', function () {
            let text = $(this).val();
            $('#item_order_register_hidden_form #WAREHOUSE_CD').val(text);

            itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $('#itemOrderRegisterMaterialDetailSelectBox').on('change', function () {
            let text = $(this).val();
            $('#item_order_register_hidden_form #MATERIAL_DETAIL').val(text);

            itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $('#itemOrderRegisterAreaSelectBox').on('change', function () {
            let text = $(this).val();
            $('#item_order_register_hidden_form #AREA').val(text);

            itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $('#itemOrderRegisterTconditionSelectBox').on('change', function(){
            let text = $(this).val();
            $('#item_order_register_hidden_form #CONDITION').val(text);

            itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        /** 팝업 바코드 처리 **/
        $("#itemOrderRegisterBarcodeSpan").on('click', function(){
            $("#itempOrderResgisterBarcodeNum").focus();
        });

        $("#itempOrderResgisterBarcodeImg").on('click', function(){
            $("#itempOrderResgisterBarcodeNum").focus();
        });
        $('#itempOrderResgisterBarcodeNum').on({
            focus: function () {
                $('#itempOrderResgisterBarcodeImg').attr('src','/resource/asset/images/common/img_barcode_long_on.png');
            },
            blur: function () {
                $('#itempOrderResgisterBarcodeImg').attr('src','/resource/asset/images/common/img_barcode_long.png');
            }
        });

        $("#itempOrderResgisterBarcodeNum").on('keyup', function(e) {
            if (e.keyCode === 13) {
                let barcodeNum = fnBarcodeKo2En(this.value);
                let paramData = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                let parameters = {'url': '/json-info', 'data': paramData};
                fnPostAjax(function (data) {
                    let BARCODE_YN = data.info.DEL_YN || 'Y';
                    if (BARCODE_YN === 'Y') {
                        fnAlert(null, "유효하지 않은 도면 바코드입니다.");
                    } else {

                        paramData = {'queryId': "material.selectItemOrderInfo", 'CONTROL_SEQ': data.info.CONTROL_SEQ, 'CONTROL_DETAIL_SEQ':data.info.CONTROL_DETAIL_SEQ};
                        let parameters2 = {'url': '/json-list', 'data': paramData};

                        fnPostAjax(function (data2) {
                            if(data2.list.length > 0) {
                                fnAlert(null, '요청중인 소재주문정보가 존재합니다');
                                return;
                            }else {
                                let CONCAT_SEQ = "'" + data.info.CONTROL_SEQ + data.info.CONTROL_DETAIL_SEQ + "'";
                                paramData = {'queryId': "material.selectItemOrderRegisterPopListSeq", 'CONCAT_SEQ': CONCAT_SEQ};
                                let parameters = {'url': '/json-info', 'data': paramData};
                                fnPostAjax(function (data3) {
                                    if (data3.info) {
                                        let newRowData = fnCloneObj(data3.info);
                                        let newRowIndex = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length + 1;
                                        newRowData.ROWNUM = newRowIndex;

                                        itemOrderRegisterPopTopGrid.pqGrid('addRow', {
                                            newRow: newRowData,
                                            rowIndx: newRowIndex,
                                            checkEditable: false
                                        });
                                    } else {
                                        fnAlert(null, "유효하지 않은 도면 바코드입니다.");
                                    }
                                }, parameters, '');
                            }
                        },parameters2,'');

                    }
                }, parameters, '');

                this.value = '';
            }
        });

        /** 팝업 버튼 처리 **/
        $("#btnItemOrderRegisterPopAdd").on('click', function(){
            let date = new Date();
            let rowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
            date = date.getFullYear() +"-"+ ("0"+(date.getMonth()+1)).slice(-2) +"-"+ ("0"+(date.getDate()+1)).slice(-2);
            itemOrderRegisterPopTopGrid.pqGrid('addNodes', [{ "HOPE_DUE_DT": date}], rowCount+1);

            $("#btnItemOrderRegisterPopSubmit").attr("disabled", true);
        });
        const checkMaterialOrderStatus = function (callback) {
            let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');

            let controlSeqStr = '';
            let controlDetailSeqStr = '';
            for (let i = 0, selectedRowCount = data.length; i < selectedRowCount; i++) {
                let rowData = data[i];

                if(typeof rowData.CONTROL_SEQ != 'undefined' && typeof rowData.CONTROL_DETAIL_SEQ != 'undefined') {
                    controlSeqStr += rowData.CONTROL_SEQ;
                    controlDetailSeqStr += rowData.CONTROL_DETAIL_SEQ;

                    if (i < selectedRowCount - 1) {
                        controlSeqStr += ',';
                        controlDetailSeqStr += ',';
                    }
                }

                if(rowData.M_ORDER_QTY <= 0) {
                    fnAlert(null, "주문수량이 0개인 작업이 존재합니다.");
                    return false;
                }
            }

            if(controlSeqStr == "" && controlDetailSeqStr == "") {
                callback(false);
            }else {
                let parameters = {
                    'url': '/json-list',
                    'data': {"CONTROL_SEQ":controlSeqStr,"CONTROL_DETAIL_SEQ":controlDetailSeqStr,"queryId":"material.selectOrderStatusBeforeMaterialOrder"}
                };
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    if(data.list.length > 0) {
                        var flag = false;
                        $.each(data.list, function(idx,Item) {
                            if(Item.OUTSIDE_YN == 'Y') { // 외주가공건인 경우.
                                if(Item.OUTSIDE_MATERIAL_SUPPLY_YN == 'N') {
                                    flag = true;
                                    return;
                                }
                            }else if(Item.CONTROL_STATUS != 'ORD001' ) { // 주문상태가 확정이 아닌경우
                                flag = true;
                                return;
                            }else if(Item.PART_STATUS == 'PRO003') { //가공확정 취소인 경우
                                flag = true;
                                return;
                            }
                        })

                        if(flag) {
                            fnAlert('','소재주문이 불가능한 주문 건이 있습니다. 확인해주세요');
                            // $("#OUTSIDE_ORDER_MANAGE_SEARCH_FORM #OUTSIDE_ORDER_SEARCH").trigger('click');
                        }
                        callback(flag);
                        // return flag;
                    }else {
                        fnAlert('',"작업지시번호를 확인해주세요.");
                        callback(true);
                        // return true;
                    }
                }, parameters, '');

            }
        }
        $("#btnItemOrderRegisterPopSave").on('click', _.debounce(function () {
            checkMaterialOrderStatus(function(flag) {
                if(!flag) {
                    $("#item_order_register_popup_form #queryId").val("selectItemOrderRegisterPopListNum");
                    let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num_temp").val();
                    let ORDER_USER_ID = $("#item_order_register_popup").find("#ORDER_USER_ID").val();
                    let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
                    let targetData = [];
                    for (let tempI = 0, totalRecords = data.length; tempI < totalRecords; tempI++) {
                        itemOrderRegisterPopTopGrid.pqGrid("updateRow", {
                            'rowIndx': tempI,
                            row: {'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM, 'ORDER_USER_ID': ORDER_USER_ID}
                        });
                        let inputField = ['ADDITIONAL_QTY', 'MATERIAL_KIND', 'MATERIAL_DETAIL', 'M_SIZE_TXT',
                            'M_ORDER_QTY', 'M_COMP_CD', 'REQUEST_NOTE', 'M_ORDER_NOTE', 'NOTE'];

                        var rowData = data[tempI];
                        var flag = false;
                        for(key in data[tempI]) {
                            if(inputField.includes(key) && !fnIsEmpty(rowData[key])) {
                                flag = true;
                            }
                        }
                        if(flag) {
                            targetData.push(rowData);
                        }
                    }

                    let gridInstance = itemOrderRegisterPopTopGrid.pqGrid('getInstance').grid;
                    let changes = gridInstance.getChanges();

                    if (gridInstance.isDirty()) {
                        let parameters = {'url': '/itemOrderRegisterPopSave', 'data': {data: JSON.stringify(targetData)}};
                        fnPostAjaxAsync(function (data) {
                            if (data.flag === true) {
                                fnAlert(null, '<srping:message key="error.common"/>');
                                return false;
                            }

                            $("#item_order_register_material_order_num").val(MATERIAL_ORDER_NUM);
                            $('#item_order_register_popup_form #MATERIAL_ORDER_NUM').val(MATERIAL_ORDER_NUM);
                            itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.postData', function () {
                                return (fnFormToJsonArrayData('#item_order_register_popup_form'));
                            });
                            itemOrderRegisterPopTopGrid.pqGrid('refreshDataAndView');

                            btnDisabled();
                            //Popup table 생성
                            makeInnerTable();
                        }, parameters, '');
                    }
                }
            });
        }, 1000));

        $("#btnItemOrderRegisterPopSubmit").on('click', _.debounce(function () {
            checkMaterialOrderStatus(function(flag) {
                if(!flag) {
                    if (materialOrderEmptyRowCheck()) {
                        return false;
                    }
                    //메일 여부
                    itemOrderRegisterPopMail();
                }
            });
        },1000));

        $("#btnItemOrderRegisterPopDelete").on('click', function() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();
            //Confirm Box
            let title = "Information";
            let message = "주문서를 삭제하시겠습니까?";

            fnConfirm(title, message, function () {
                let parameter = {
                    'queryId': 'material.deleteMaterialOrderToNumber',
                    'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                };
                let parameters = {'url': '/json-manager', 'data': parameter};
                fnPostAjax(function () {
                    fnAlert(null, '취소 완료되었습니다.');
                    if ($('#item_order_register_popup').hasClass('in')) {
                        $('#item_order_register_popup').modal('hide');
                    }
                }, parameters, '');
            });
        });

        $("#btnItemOrderRegisterPopPrint").on('click', function(){
            itemOrderRegisterPopOrderSheet('N');
        });

        $("#btnItemOrderRegisterPopCancel").on('click', function(){
            orderCancel('pop');
        });

        const itemOrder = function (target) {
            if (itemOrderRegisterSelectedRowIndex) {
                let concatSeq = '';
                let orderNum = new Set();
                let orderStatus = new Set();

                for (let i = 0, selectedRowCount = itemOrderRegisterSelectedRowIndex.length; i < selectedRowCount; i++) {
                    const controlSeq = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ || '';
                    const controlDetailSeq = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ || '';
                    concatSeq += "'" + controlSeq + "" + controlDetailSeq + "',";
                    orderStatus.add(itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).M_STATUS);
                    orderNum.add(itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).MATERIAL_ORDER_NUM);
                }

                concatSeq = concatSeq.substr(0, concatSeq.length - 1);

                if (target === 'button') {
                    // 임시저장상태
                    if (orderStatus.has(undefined) && !orderNum.has(undefined)) {
                        fnAlert(null, '요청중인 소재주문정보가 존재합니다');
                        return;
                    }

                    $('#item_order_register_popup_form #queryId').val('material.selectItemOrderRegisterPopListSeq');
                    $('#item_order_register_popup_form #CONCAT_SEQ').val(concatSeq);
                    $('#item_order_register_popup_form #MATERIAL_ORDER_NUM').val('');
                } else if (target === 'cell') {
                    $('#item_order_register_popup_form #queryId').val('selectItemOrderRegisterPopListNum');
                    $('#item_order_register_popup_form #CONCAT_SEQ').val('');
                    $('#item_order_register_popup_form #MATERIAL_ORDER_NUM').val(orderNum.values().next().value);
                } else {
                    fnAlert(null, 'error');
                    return;
                }
            } else {
                $('#item_order_register_popup_form #queryId').val('material.selectItemOrderRegisterPopListSeq');
                $('#item_order_register_popup_form #CONCAT_SEQ').val(0);
            }

            $('#item_order_register_popup').modal('show');
        };

        function orderCancel(type) {
            let concatSeqDataArray = '';
            let orderSeqDataArray = '';
            let selectedRowCount = '';
            let availableCancel = true;
            let includeOrder = true;

            if (type === 'pop') {
                selectedRowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
                for (let i = 0; i < selectedRowCount; i++) {
                    let CONTROL_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).CONTROL_SEQ;
                    let CONTROL_DETAIL_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).CONTROL_DETAIL_SEQ;
                    let MATERIAL_ORDER_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).MATERIAL_ORDER_SEQ;
                    let ORDER_STATUS = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).M_STATUS;
                    CONTROL_SEQ = CONTROL_SEQ === undefined ? "0" : CONTROL_SEQ;
                    CONTROL_DETAIL_SEQ = CONTROL_DETAIL_SEQ === undefined ? "0" : CONTROL_DETAIL_SEQ;

                    concatSeqDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
                    orderSeqDataArray += "'"+MATERIAL_ORDER_SEQ+"',";

                    // 소재 입고 상태
                    if (ORDER_STATUS === 'MST003' || ORDER_STATUS === 'MST004') {
                        availableCancel = false;
                        continue;
                    }
                    // 소재 주문 상태
                    if (ORDER_STATUS === 'MST002') {
                        includeOrder = false;
                    }
                }
            } else if('grid') {
                selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
                for (let i = 0; i < selectedRowCount; i++) {
                    let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                    let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                    let MATERIAL_ORDER_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).MATERIAL_ORDER_SEQ;
                    let ORDER_STATUS = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).M_STATUS;
                    CONTROL_SEQ = CONTROL_SEQ === undefined ? "0" : CONTROL_SEQ;
                    CONTROL_DETAIL_SEQ = CONTROL_DETAIL_SEQ === undefined ? "0" : CONTROL_DETAIL_SEQ;

                    concatSeqDataArray += "'" + CONTROL_SEQ + "" + CONTROL_DETAIL_SEQ + "',";
                    orderSeqDataArray += "'" + MATERIAL_ORDER_SEQ + "',";

                    // 소재 입고 상태
                    if (ORDER_STATUS === 'MST003' || ORDER_STATUS === 'MST004') {
                        availableCancel = false;
                        continue;
                    }
                    // 소재 주문 상태
                    if (ORDER_STATUS === 'MST002') {
                        includeOrder = false;
                    }
                }
            }

            if (!availableCancel) {
                fnAlert(null, "소재주문상태를 확인 해 주세요.");
                return false;
            }
            
            let title = "Information";
            let message = !includeOrder ? "이미 주문서가 발송된 대상도 포함되어 있습니다.<br>업체에 반드시 확인바랍니다.<br>취소를 진행하시겠습니까?" : "주문을 취소하시겠습니까?";

            fnConfirm(title, message, function () {
                let CONCAT_SEQ = concatSeqDataArray.substr(0 , concatSeqDataArray.length-1);
                let ORDER_SEQ = orderSeqDataArray.substr(0 , orderSeqDataArray.length-1);

                $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
                $("#item_order_register_popup_form #MATERIAL_ORDER_SEQ").val(ORDER_SEQ);

                const data = {
                    'queryId': 'material.insertItemOrderRegisterMasterOrderHistory,material.updateItemOrderRegisterMaterialOrderCancel,material.deleteItemOrderRegisterOut2,material.updateItemOrderRegisterControlPartCancel',
                    'CONCAT_SEQ': CONCAT_SEQ,
                    'MATERIAL_ORDER_SEQ': ORDER_SEQ,
                };
                const parameter = {'url': '/json-manager', 'data': data};
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlert(null, '취소 완료되었습니다.');
                    $('#item_order_register_popup').modal('hide');
                    itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                }, parameter, '');
            });
        }

        function makeMailInnerTable(list) {
            let ref_key = '';
            let table = '';

            const st_center = 'border:1px solid #d0d0d0; text-align:center; padding:0px 15px 0px 15px; ';
            const font_header = 'background:lightgray; font-weight:600;';

            table += '<table style="border-spacing:0; min-width:50%;"><tr>';
            table += '<td style="'+ st_center + font_header +'">발주업체</td>';
            table += '<td style="'+ st_center + font_header +'">공급업체</td>';
            table += '<td style="'+ st_center + font_header +'">형태</td>';
            table += '<td style="'+ st_center + font_header +'">소재종류</td>';
            table += '<td style="'+ st_center + font_header +'">주문 Size</td>';
            table += '<td style="'+ st_center + font_header +'">수량</td>';
            table += '<td style="'+ st_center + font_header +'">요청사항</td>';
            table += '<td style="'+ st_center + font_header +'">비고</td>';
            table += '<td style="'+ st_center + font_header +'">납기</td>' + '</tr>';

            for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                let material_order_seq = list[i].MATERIAL_ORDER_SEQ;

                table += '<tr>';
                table += '<td style="' + st_center + '">진성정밀</td>';
                table += '<td style="' + st_center + '">' + list[i].MATERIAL_COMP_NM + '</td>';
                table += '<td style="' + st_center + '">' + list[i].MATERIAL_KIND_NM + '</td>';
                table += '<td style="' + st_center + '">' + list[i].MATERIAL_DETAIL_NM + '</td>';
                table += '<td style="' + st_center + '">' + list[i].SIZE_TXT + '</td>';
                table += '<td style="' + st_center + '">' + list[i].ORDER_QTY + '</td>';
                table += '<td style="' + st_center + '">' + list[i].REQUEST_NOTE + '</td>';
                table += '<td style="' + st_center + '">' + list[i].ORDER_NOTE + '</td>';
                table += '<td style="' + st_center + '">' + list[i].ORDER_DT + '</td>';
                table += '</tr>';

                ref_key += "'" + material_order_seq + "',";

            }

            table += '</table>';
            return table;
        }

        function makeInnerTable() {
            const MATERIAL_ORDER_NUM = $('#item_order_register_material_order_num').val();
            const parameter = {
                'queryId': 'material.selectItemOrderRegisterPopTable2',
                'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
            };
            const parameters = {'url': '/json-list', 'data': parameter};
            let table = '';

            fnPostAjaxAsync(function (data) {
                const list = data.list;
                const LIST_LENGTH = list.length;

                if (LIST_LENGTH > 0) {
                    table = '<table class="materialSupply">';

                    for (let i = 0; i < LIST_LENGTH; i++) {
                        const rowData = list[i];
                        const materialCompCd = rowData.MATERIAL_COMP_CD;
                        const materialCompCdPrev = list[i - 1] ? list[i - 1].MATERIAL_COMP_CD : undefined;
                        const materialCompCdNext = list[i + 1] ? list[i + 1].MATERIAL_COMP_CD : undefined;
                        const groupedMaterialCompCd = fnGroupBy(list, 'MATERIAL_COMP_CD');
                        const orderQtyInfo = rowData.ORDER_QTY_INFO || '0EA';

                        if (materialCompCd === materialCompCdNext) {
                            const materialDetailNm = rowData.MATERIAL_DETAIL_NM || '';
                            const sizeTxt = rowData.SIZE_TXT || '';

                            if (materialCompCd !== materialCompCdPrev) {
                                const ROWSPAN_LENGTH = groupedMaterialCompCd[rowData.MATERIAL_COMP_CD].length + 1;
                                const materialCompNm = rowData.MATERIAL_COMP_NM || '';
                                const compEmail = rowData.COMP_EMAIL || '';
                                table += '<tr>';
                                table += '<td class="bg-title" rowspan="' + ROWSPAN_LENGTH + '" style="max-width: 110px;">' + materialCompNm + '</td>';
                                table += '<td class="bg-title" colspan="3">' + compEmail + '</td>';
                                table += '</tr>';
                            }
                            table += '<tr>';
                            table += '<td style="max-width: 110px;">' + materialDetailNm + '</td>';
                            table += '<td class="text-right" style="max-width: 110px;">' + sizeTxt + '</td>';
                            table += '<td class="text-right" style="max-width: 55px;">' + orderQtyInfo + '</td>';
                            table += '</tr>';
                        } else {
                            table += '<tr style="">';
                            table +=    '<td class="bg-sum" colspan="2">합계</td>';
                            table +=    '<td class="bg-sum text-right">' + orderQtyInfo + '</td>';
                            table += '</tr>';
                        }
                    }
                    table += '</table>';
                    const $popupTableDiv = $(".popupTableDiv")
                    $popupTableDiv.parent().prev().width(1200);
                    itemOrderRegisterPopTopGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
                    $popupTableDiv.parent().show();
                    $popupTableDiv.html(table);
                }
            }, parameters, '');
        }

        const materialOrderEmptyRowCheck = function () {
            const gridData = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data')

            for (let i = 0, LENGTH = gridData.length; i < LENGTH; i++) {
                if (Object.keys(gridData[i]).length < 8) {
                    fnAlert(null, '소재 주문 제출이 불가합니다.');
                    return true;
                }
                if(typeof gridData[i].M_COMP_CD == 'undefined' || gridData[i].M_COMP_CD == null || gridData[i].M_COMP_CD == '') {
                    fnAlert(null, '소재 주문 업체를 선택해주세요');
                    return true;
                }
            }

            return false;
        };

        function itemOrderRegisterPopMail() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            //Confirm Box
            let title = "Information";
            let message = "주문서를 발송하시겠습니까?";

            fnConfirm(title, message, function () {
                let list = [];
                for (let i = 0, rowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length; i < rowCount; i++) {
                    let rowData = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i});
                    list.push(rowData);
                }
                let changes = {
                    'addList': list,
                    'updateList': list
                };
                changes.queryIdList = {
                    'insertQueryId': ['material.insertUpdateItemOrderRegisterPopStatus', 'material.insertItemOrderRegisterControlPartProgress'],
                    'updateQueryId': ['material.updateItemOrderRegisterPartStatus', 'material.insertItemOrderRegisterControlPartProgress']
                };
                let parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

                fnPostAjax(function () {
                    let parameter = {
                        'queryId': 'material.selectItemOrderRegisterPopMailTable',
                        'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
                    };
                    let parameters = {'url': '/json-list', 'data': parameter};
                    fnPostAjaxAsync(function (data) {
                        if(data.list.length == 0 && list.length == 1) {
                            if(list[0].OUT_QTY == list[0].ORDER_QTY) {
                                let parameter = {
                                    'queryId': 'material.updateItemOrderRegisterOrderStatus',
                                    'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                };
                                let parameters = {'url': '/json-update', 'data': parameter};
                                fnPostAjaxAsync(function () {
                                    itemOrderRegisterPopOrderSheet('N');
                                }, parameters, '');
                            }
                        }else {
                            let list = data.list;
                            let compareCd = list[0].MATERIAL_COMP_CD;
                            let compCd = '';
                            let tableList = [];
                            let innerTable = '';

                            for (let i = 0, LENGTH = list.length; i < LENGTH; i++) {
                                compCd = list[i].MATERIAL_COMP_CD;
                                if (compareCd !== compCd) {
                                    innerTable = makeMailInnerTable(tableList);
                                    let parameter = {
                                        'queryId': 'mail.insertItemOrderRegisterPopSubmitMail',
                                        'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                        'MATERIAL_COMP_CD': compareCd,
                                        'INNER_TABLE': innerTable
                                    };
                                    let parameters = {'url': '/json-create', 'data': parameter};

                                    tableList = [];
                                    fnPostAjaxAsync(function (data, callFunctionParam) {
                                    }, parameters, '');

                                    compareCd = compCd;
                                }
                                tableList.push(list[i]);
                            }

                            innerTable = makeMailInnerTable(tableList);
                            let parameter = {
                                'queryId': 'mail.insertItemOrderRegisterPopSubmitMail',
                                'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                'MATERIAL_COMP_CD': compareCd,
                                'INNER_TABLE': innerTable
                            };
                            let parameters = {'url': '/json-create', 'data': parameter};
                            fnPostAjaxAsync(function () {
                                let parameter = {
                                    'queryId': 'material.updateItemOrderRegisterOrderStatus',
                                    'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                };
                                let parameters = {'url': '/json-update', 'data': parameter};
                                fnPostAjaxAsync(function () {
                                    itemOrderRegisterPopOrderSheet('Y');
                                }, parameters, '');
                            }, parameters, '');
                        }
                    }, parameters, '');
                }, parameters, '');
            });
        }

        function itemOrderRegisterPopOrderSheet(mailYn) {
            //Confirm Box
            let title = 'Information', message;

            if (mailYn === 'Y') {
                message =
                    '<h4>\n' +
                    '<img style="width: 32px; height: 32px;" src="/resource/main/images/print.png" alt="">&nbsp;&nbsp;\n' +
                    '<span>성공적으로 발송되었습니다. 주문서를 출력하시겠습니까?</span>' +
                    '</h4>';
            } else {
                message =
                    '<h4>\n' +
                    '<img style="width: 32px; height: 32px;" src="/resource/main/images/print.png" alt="">&nbsp;&nbsp;\n' +
                    '<span>주문서를 출력하시겠습니까?</span>' +
                    '</h4>';
            }

            fnConfirm(title, message, function () {
                let MATERIAL_ORDER_NUM = $('#item_order_register_material_order_num').val();

                printJS({printable:'/makeItemOrderSheetPrint', properties: {MATERIAL_ORDER_NUM: MATERIAL_ORDER_NUM}, type:'pdf', showModal:true});
            });

            itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#item_order_register_popup_form'));
            });
            itemOrderRegisterPopTopGrid.pqGrid('refreshDataAndView');

            btnDisabled();
        }

        const btnDisabled = function () {
            const data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
            const $orderNotCompleteBtnBox = $('#orderNotCompleteBtnBox');
            const $orderCompleteBtnBox = $('#orderCompleteBtnBox');
            const $item_order_register_popup = $('#item_order_register_popup');
            let MATERIAL_ORDER_NUM = '';
            let ORDER_STATUS = '';

            $('#item_order_register_popup_top_grid_records').html(data.length);

            if (data.length > 0) {
                MATERIAL_ORDER_NUM = $('#item_order_register_popup_form #MATERIAL_ORDER_NUM').val();
                ORDER_STATUS = data[0].ORDER_STATUS === undefined ? '' : data[0].ORDER_STATUS;
            }

            $orderNotCompleteBtnBox.css('display', 'none');
            $orderCompleteBtnBox.css('display', 'none');
            $item_order_register_popup.find('#ORDER_USER_ID').attr('disabled', false);

            if (fnIsEmpty(MATERIAL_ORDER_NUM)) {
                $('#btnItemOrderRegisterPopAdd').attr('disabled', false);
                $('#btnItemOrderRegisterPopSave').attr('disabled', false);
                $('#btnItemOrderRegisterPopSubmit').attr('disabled', true);

                $('#btnItemOrderRegisterPopDelete').css('display', 'none');
                $orderNotCompleteBtnBox.css('display', 'block');
                $item_order_register_popup.find('#ORDER_USER_ID').attr('disabled', false);
            } else {
                if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') {
                    $('#btnItemOrderRegisterPopAdd').attr('disabled', true);
                    $('#btnItemOrderRegisterPopSave').attr('disabled', true);
                    $('#btnItemOrderRegisterPopSubmit').attr('disabled', true);
                    $item_order_register_popup.find('#ORDER_USER_ID').attr('disabled', true);

                    $orderCompleteBtnBox.css('display', 'block');
                } else {
                    $('#btnItemOrderRegisterPopAdd').attr('disabled', false);
                    $('#btnItemOrderRegisterPopSave').attr('disabled', false);
                    $('#btnItemOrderRegisterPopSubmit').attr('disabled', false);
                    $item_order_register_popup.find('#ORDER_USER_ID').attr('disabled', false);

                    $orderNotCompleteBtnBox.css('display', 'block');
                }
                $('#btnItemOrderRegisterPopDelete').css('display', 'inline');
            }

            if (!fnIsEmpty(MATERIAL_ORDER_NUM)) {
                if (ORDER_STATUS === 'MST002' || ORDER_STATUS === 'MST004') { // MST002 : 주문완료 , MST004 : 소재입고
                    itemOrderRegisterPopTopGrid.pqGrid('option', 'colModel', itemOrderRegisterPopTopColModel_disabled);
                } else {
                    itemOrderRegisterPopTopGrid.pqGrid('option', 'colModel', itemOrderRegisterPopTopColModel_temp);
                }
            } else {
                itemOrderRegisterPopTopGrid.pqGrid('option', 'colModel', itemOrderRegisterPopTopColModel);
            }
            itemOrderRegisterPopTopGrid.pqGrid('refresh');
        };

        /**
         * fnFilterHandler
         * @Parameter
         * */
        function itemOrderRegisterFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return String(element.value) === String(val);
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                let condition = $('#itemOrderRegisterFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#itemOrderRegisterFilterKeyword').val(),
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
                    const txt1 = val.toString().substring(0, indx);
                    const txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    const txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + '<span style="background: #FFFF00; color: #333;">' + txt2 + '</span>' + txt3;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }
    });

    // topWrap 확장 함수
    function divOpen(){
        const leftDiv = $('#dynamic_left_div');
        const rightDiv = $('#dynamic_right_div');

        rightDiv.css('display', 'none');
        leftDiv.stop().animate({width:'100%'},100, 'easeOutCubic');
        rightDiv.stop().animate({width:'0%'},100, 'easeOutCubic');

        setTimeout(function(){
            itemOrderRegisterLeftGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
            itemOrderRegisterRightGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
        }, 100);

    }

    // topWrap 축소 함수
    function divClose(){
        const leftDiv = $('#dynamic_left_div');
        const rightDiv = $('#dynamic_right_div');

        leftDiv.stop().animate({width:'64.5%'},100, 'easeOutCubic');
        rightDiv.stop().animate({width:'32.5%'},100, 'easeOutCubic');
        rightDiv.css('display', 'block');
        setTimeout(function(){
            itemOrderRegisterLeftGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
            itemOrderRegisterRightGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
        }, 100);
    }

    $('#ITEM_ORDER_REGISTER_START_DATE_BUTTON').on('click', function () {
        $('#ITEM_ORDER_REGISTER_START_DATE').focus();
    });

    $('#ITEM_ORDER_REGISTER_END_DATE_BUTTON').on('click', function () {
        $('#ITEM_ORDER_REGISTER_END_DATE').focus();
    });

    $('[name=MATERIAL_ORDER_STATUS_CHECK_BOX]').on('change', function () {
        let checkedValue = '';

        $("input[name=MATERIAL_ORDER_STATUS_CHECK_BOX]:checked").each(function (index) {
            if (index > 0) {
                checkedValue += ', ';
            }

            checkedValue += '\'' + $(this).val().replace(/,/g, "','") + '\'';
        });

        $('[name=IN_YN]').prop('checked', checkedValue.includes('MST004'));
        $('#MATERIAL_ORDER_STATUS').val(checkedValue);
    });

    $('#ITEM_ORDER_REGISTER_EXCEL_EXPORT').on('click', function () {
        const blob = itemOrderRegisterLeftGrid.pqGrid('getInstance').grid.exportData({
            format: 'xlsx',
            render: true,
            type: 'blob'
        });

        saveAs(blob, '소재 주문등록.xlsx');
    });

</script>