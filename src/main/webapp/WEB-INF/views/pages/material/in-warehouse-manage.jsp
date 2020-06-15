<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="popup_container" id="in_warehouse_manage_warehouse_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content; width: 700px;">
        <h3>위치정보관리</h3>
        <button type="button" class="pop_close mg-top10 mg-right8" data-dismiss="modal">닫기</button>
        <form class="form-inline" role="form" id="in_warehouse_manage_warehouse_popup_form" name="in_warehouse_manage_warehouse_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehouseManageWarehouseList">
            <div class="h_area mg-bottom10">

            </div>
            <div class="t_area">
                <div class="t_h">
                    <span class="list_t" style="width: 194px;">창고명</span>
                    <span style="width: 292px;">
                        <select name="WAREHOUSE_CD" id="WAREHOUSE_CD">
                            <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            <c:forEach var="code" items="${HighCode.H_1049}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="tableWrap">
                <div id="in_warehouse_manage_warehouse_grid" class="jqx-refresh"></div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="btnInWarehouseManageWarehouseSave">저장</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="popup_container" id="in_warehouse_manage_out_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content;">
        <h3>소재 주문</h3>
        <button type="button" class="pop_close mg-top10 mg-right8" data-dismiss="modal">닫기</button>
        <form class="form-inline" role="form" id="in_warehouse_manage_out_popup_form" name="in_warehouse_manage_out_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="insertInWarehouseManageOutPop"/>
            <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
            <div class="tableWrap">
                <div class="h_area mg-bottom10">

                </div>
                <div class="list1">
                    <table class="rowStyle">
                        <tbody>
                        <tr>
                            <th rowspan="2">창고명</th><th rowspan="2">위치</th>
                            <th rowspan="2">형태</th><th rowspan="2">소재종류</th>
                            <th colspan="5">소재 Size</th><th rowspan="2">보유수량</th>
                        </tr>
                        <tr>
                            <th>가로</th><th>세로</th><th>두께</th>
                            <th>파이</th><th>길이(L)</th>
                        </tr>
                        <tr>
                            <td><input type="text" id="WAREHOUSE_NM" name="WAREHOUSE_NM" readonly></td>
                            <td><input type="text" id="LOC_NM" name="LOC_NM" readonly></td>
                            <td><input type="text" id="MATERIAL_KIND_NM" name="MATERIAL_KIND_NM" readonly></td>
                            <td><input type="text" id="MATERIAL_DETAIL_NM" name="MATERIAL_DETAIL_NM" readonly></td>
                            <td><input type="text" id="SIZE_W" name="SIZE_W" readonly></td>
                            <td><input type="text" id="SIZE_H" name="SIZE_H" readonly></td>
                            <td><input type="text" id="SIZE_T" name="SIZE_T" readonly></td>
                            <td><input type="text" id="SIZE_D" name="SIZE_D" readonly></td>
                            <td><input type="text" id="SIZE_L" name="SIZE_L" readonly></td>
                            <td><input type="text" id="STOCK_QTY" name="STOCK_QTY" readonly></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="list1">
                <table class="rowStyle">
                    <tbody>
                        <tr><th style="width: 279px;">보유수량</th><th style="width: 280px;">남은수량</th><th style="width: 280px;">불출수량</th><th>요청자</th></tr>
                        <tr>
                            <td><input type="text" id="STOCK_QTY" name="STOCK_QTY" readonly></td>
                            <td><input type="text" id="REMAIN_QTY" name="REMAIN_QTY" readonly></td>
                            <td><input type="text" id="OUT_QTY" name="OUT_QTY"></td>
                            <td>
                                <select id="OUT_USER_ID" name="OUT_USER_ID">
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <h2>&nbsp;</h2>
            <div class="list1">
                <div class="t_area">
                    <div class="t_h">
                        <span class="list_t" style="width: 289px;">용도</span>
                        <span style="width: 580px;">
                            <input id="NOTE" name="NOTE" type="text">
                        </span>
                    </div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="btnInWarehouseManageOutPopSave">저장</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="popup_container" id="in_warehouse_manage_scan_barcode_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content;">
        <h3>소재 불출 진행</h3>
        <button type="button" class="pop_close mg-top10 mg-right8" data-dismiss="modal">닫기</button>
        <form class="form-inline" role="form" id="in_warehouse_manage_scan_barcode_popup_form" name="in_warehouse_manage_out_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehousePop"/>
            <input type="hidden" id="TYPE" name="TYPE" value=""/>
            <input type="hidden" id="MY_MAT_OUT_SEQ" name="MY_MAT_OUT_SEQ"/>
            <input type="hidden" id="BARCODE_NUM" name="BARCODE_NUM"/>
            <div class="tableWrap">
                <div class="h_area mg-bottom10">

                </div>
                <span class="barCode"><img id="barCodeImg" src="/resource/asset/images/common/img_barcode_long.png" alt="바코드"></span>
                <span class="barCodeTxt ipu_wrap"><input type="text" name="popBarcode" id="popBarcode" value="" readonly></span>
                <h2>&nbsp;</h2>
                <div class="t_area">
                    <div class="t_h">
                        <span class="list_t" style="width: 194px;">관리번호</span>
                        <span style="width: 292px;">
                            <input id="CONTROL_NUM" name="CONTROL_NUM" type="text">
                        </span>
                    </div>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="list1">
                <table class="rowStyle" id="inWarehouseManageScanPopDynamicTable">
                    <tbody>
                    <tr class="">
                        <th rowspan="2">No.</th><th rowspan="2">형태</th>
                        <th rowspan="2">소재종류</th><th colspan="5">불출대기 목록</th>
                        <th rowspan="2">보유수량</th><th rowspan="2">요청수량</th>
                        <th rowspan="2">창고</th><th rowspan="2">위치</th>
                        <th rowspan="2">주문번호</th><th rowspan="2">요청일시</th>
                    </tr>
                    <tr class="">
                        <th>가로</th><th>세로</th><th>두께</th>
                        <th>파이</th><th>길이(L)</th>
                    </tr>
                    <tr class="" id="dynamicTableTr">
                        <td><input type="text" id="SEQ" name="SEQ" readonly></td>
                        <td><input type="text" id="MATERIAL_KIND_NM" name="MATERIAL_KIND_NM" readonly></td>
                        <td><input type="text" id="MATERIAL_DETAIL_NM" name="MATERIAL_DETAIL_NM" readonly></td>
                        <td><input type="text" id="SIZE_W" name="SIZE_W" readonly></td>
                        <td><input type="text" id="SIZE_H" name="SIZE_H" readonly></td>
                        <td><input type="text" id="SIZE_T" name="SIZE_T" readonly></td>
                        <td><input type="text" id="SIZE_D" name="SIZE_D" readonly></td>
                        <td><input type="text" id="SIZE_L" name="SIZE_L" readonly></td>
                        <td><input type="text" id="STOCK_QTY" name="STOCK_QTY" readonly></td>
                        <td><input type="text" id="OUT_QTY" name="OUT_QTY" readonly></td>
                        <td><input type="text" id="WAREHOUSE_NM" name="WAREHOUSE_NM" readonly></td>
                        <td><input type="text" id="LOC_NM" name="LOC_NM" readonly></td>
                        <td><input type="text" id="ORDER_NUM" name="ORDER_NUM" readonly></td>
                        <td><input type="text" id="ORDER_DT" name="ORDER_DT" readonly></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h2>&nbsp;</h2>
            <div class="btnWrap">
                <button type="button" class="defaultBtn greenPopGra" id="btnInWarehouseManageScanPopSave">저장</button>
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="page estimate machineWrap">
        <form class="form-inline" id="in_warehouse_manage_search_form" name="in_warehouse_manage_search_form" role="form">
            <div class="topWrap">
                <input type="hidden" name="queryId" id="queryId" value="material.selectInWarehouseManageList">
                <div class="none_gubunWrap row3_topWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="WAREHOUSE">창고</label>
                                <select id="WAREHOUSE" name="WAREHOUSE" title="창고" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="LOC_NM">위치</label>
                                <select id="LOC_NM" name="LOC_NM" title="위치" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" title="소재형태" class="wd_200">
                                </select>
                            </span>
                            <span class="ipu_wrap right_float"></span>
                            <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnInWarehouseManageManageSearch">검색</button></span>
                        </li>
                        <li>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE">소재규격</label><input type="text" name="SIZE" id="SIZE" class="wd_200" value="" title="소재규격"></span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_W">가로</label>
                                <input type="text" name="SIZE_W" id="SIZE_W" class="wd_200" value="" title="가로">
                                <input type="text" name="SIZE_W" id="SIZE_W" class="wd_200" value="" title="가로">
                            </span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_H">세로</label><input type="text" name="SIZE_H" id="SIZE_H" class="wd_200" value="" title="세로"></span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_D">두께</label><input type="text" name="SIZE_D" id="SIZE_D" class="wd_200" value="" title="두께"></span>
                        </li>
                        <li>
                            <span class="ipu_wrap"><label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200" value="" title="소재주문업체"></span>
                            <span class="ipu_wrap"><label class="label_100" for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200" value="" title="소재주문업체"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </form>

        <form class="form-inline" id="in_warehouse_manage_out_search_form" name="in_warehouse_manage_out_search_form" role="form" style="display: none">
            <div class="topWrap">
                <input type="hidden" name="queryId" id="queryId" value="material.selectInWarehouseManageOutList">
                <div class="gubunWrap row3_topWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="WAREHOUSE">창고</label>
                                <select id="WAREHOUSE" name="WAREHOUSE" title="창고" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="LOC_NM">위치</label>
                                <select id="LOC_NM" name="LOC_NM" title="위치" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" title="소재형태" class="wd_200">
                                </select>
                            </span>
                            <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnInWarehouseManageOutSearch">검색</button></span>
                        </li>
                        <li>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE">소재규격</label><input type="text" name="SIZE" id="SIZE" class="wd_200" value="" title="소재규격"></span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_W">가로</label>
                                <input type="text" name="SIZE_W" id="SIZE_W" class="wd_200" value="" title="가로">
                                <input type="text" name="SIZE_W" id="SIZE_W" class="wd_200" value="" title="가로">
                            </span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_H">세로</label><input type="text" name="SIZE_H" id="SIZE_H" class="wd_200" value="" title="세로"></span>
                            <span class="ipu_wrap"><label class="label_100" for="SIZE_D">두께</label><input type="text" name="SIZE_D" id="SIZE_D" class="wd_200" value="" title="두께"></span>
                        </li>
                        <li>
                            <span class="ipu_wrap"><label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200" value="" title="소재주문업체"></span>
                            <span class="ipu_wrap"><label class="label_100" for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200" value="" title="소재주문업체"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </form>

    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap jmestabs" id="in_warehouse_manage_tabs">
            <ul class="smallTabMenuTabs">
                <li class="active"><a href="#IN_WAREHOUSE_MANAGE_TAB1" data-toggle="tab" aria-expanded="true">현황관리</a></li>
                <li><a href="#IN_WAREHOUSE_MANAGE_TAB2" data-toggle="tab" aria-expanded="false">불출이력</a></li>
                <div class="right_sort" id="IN_WAREHOUSE_MANAGE_BUTTON">
                    <button type="button" class="defaultBtn btn-120w" id="btnInWarehouseManageOutBarcode">소재불출(바코드)</button>
                    <button type="button" class="defaultBtn btn-120w" id="btnInWarehouseManageLocation">위치정보관리</button>
                    <button type="button" class="defaultBtn radius" id="btnInWarehouseManageAdd">추가</button>
                    <button type="button" class="defaultBtn radius red" id="btnInWarehouseManageRemove">삭제</button>
                    <button type="button" class="defaultBtn radius green" id="btnInWarehouseManageSave">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active" id="IN_WAREHOUSE_MANAGE_TAB1">
                    <div class="conMainWrap">
                        <div id="in_warehouse_manage_manage_grid01"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="in_warehouse_manage_manage_grid01_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                    <br/>
                    <div class="conWrap">
                        <div id="in_warehouse_manage_manage_grid02"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="in_warehouse_manage_manage_grid02_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
                <ul class="" id="IN_WAREHOUSE_MANAGE_TAB2">
                    <div class="conMainWrap" style="height: 740px">
                        <div id="in_warehouse_manage_out_grid01"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="in_warehouse_manage_out_grid01_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>

<form id="in_warehouse_manage_hidden_form" name="in_warehouse_manage_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehouseManageListDetail"/>
    <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>

<form id="in_warehouse_manage_out_hidden_form" name="in_warehouse_manage_out_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehouseManageOutList"/>
</form>

<script type="text/javascript">
    'use strict';
    let inWarehouseManageManageGrid01 = $("#in_warehouse_manage_manage_grid01");
    let inWarehouseManageManageGrid02 = $("#in_warehouse_manage_manage_grid02");
    let inWarehouseManageOutGrid = $("#in_warehouse_manage_out_grid01");
    let inWarehouseManageWarehousePopupGrid = $("#in_warehouse_manage_warehouse_grid");

    $(function () {
        let inWarehouseManageSelectedRowIndex =[];
        let inWarehouseManageManageColModel01= [
            {title: '', dataType: 'string', dataIndx: 'MY_MAT_STOCK_SEQ', hidden: true},
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', width: "7%" ,
                editor: {
                    type: 'select',
                    mapIndices: { name: "WAREHOUSE_NM", id: "WAREHOUSE_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1049'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WAREHOUSE_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM', width: "7%" ,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND_NM", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_KIND"]=clave;
                        if(clave == 'SHP010'){
                            rowData["SIZE_D"]='';
                            rowData["SIZE_L"]='';

                        }else if(clave == 'SHP020'){
                            rowData["SIZE_W"]='';
                            rowData["SIZE_H"]='';
                            rowData["SIZE_T"]='';

                        }else if(clave == 'SHP030'){
                            rowData["SIZE_T"]='';
                            rowData["SIZE_D"]='';
                        }
                        inWarehouseManageManageGrid01.pqGrid("refresh");
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            } ,
            {title: '소재종류상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , minWidth: "8%",
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 150 } ,
            {title: '보유수량', dataType: 'string', dataIndx: 'STOCK_QTY', minWidth: 80 },
            {title: '불출대기수량', dataType: 'string', dataIndx: 'OUT_WAIT_QTY', minWidth: 80 },
            {title: '상세위치', dataType: 'string', dataIndx: 'LOC_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "LOC_NM", id: "LOC_SEQ" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :
                                {
                                    "queryId": 'dataSource.getLocationListWithWarehouse',
                                    "WAREHOUSE_CD" : WAREHOUSE_CD
                                }
                        };
                        let ajaxData = "";

                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                            console.log(data);
                        }, warehouseData, '');

                        return ajaxData;
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["LOC_SEQ"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 600 },
            {title: '입고', dataType: 'string', dataIndx: 'IN_QTY', minWidth: "3%" },
            {title: '불출요청', dataType: 'string', dataIndx: '', minWidth: "5%" ,
                render: function(ui){
                    return '<input type="button" id="inWarehouseOutPop" value="불출" style="width:70px;"/>';
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#inWarehouseOutPop').on('click', function (event) {
                        $("#in_warehouse_manage_out_popup").modal("show");

                        fnJsonDataToForm('in_warehouse_manage_out_popup', ui.rowData);
                    });
                }
            },
            {title: '가로', dataType: 'string', dataIndx: 'SIZE_W', hidden: true },
            {title: '세로', dataType: 'string', dataIndx: 'SIZE_H', hidden: true },
            {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T', hidden: true },
            {title: '지름(D)', dataType: 'string', dataIndx: 'SIZE_D', hidden: true },
            {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L', hidden: true }
        ];

        let inWarehouseManageManageColModel02= [
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM' ,},
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' },
            {title: '불출대기 목록', align: "center", colModel: [
                    {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                    {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                    {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T'},
                    {title: '파이', dataType: 'string', dataIndx: 'SIZE_D'},
                    {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L'},
                ]},
            {title: '요청수량', dataType: 'string', dataIndx: 'OUT_QTY', width: 80 , editable: false} ,
            {title: '창고', dataType: 'string', dataIndx: 'WAREHOUSE_NM', width: 120, editable: false},
            {title: '위치', dataType: 'string', dataIndx: 'LOC_NM', width: 120, editable: false},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, editable: false},
            {title: '요청일시', dataType: 'string', dataIndx: 'OUT_DT', width: 120, editable: false},
            {title: '요청자', dataType: 'string', dataIndx: 'OUT_USER_ID' , editable: false},
            {title: '수동 불출', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', editable: false,
                render: function (ui) {
                    return '<button id="inWarehouseManualOut" style="cursor: pointer">불출</button>'
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#inWarehouseManualOut').on('click', function (event) {
                        $("#in_warehouse_manage_scan_barcode_popup_form #TYPE").val('manual');
                        $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val(ui.rowData.MY_MAT_OUT_SEQ);
                        $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val('');

                        $("#in_warehouse_manage_scan_barcode_popup").modal('show');
                    });
                }
            }
        ];

        let inWarehouseManageOutColModel= [
            {title: '수불구분', dataType: 'string', dataIndx: 'IN_OUT_NM', minWidth: '5%'},
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', minWidth: '9%' },
            {title: '위치', dataType: 'string', dataIndx: 'LOC_NM', minWidth: '9%' },
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM', minWidth: '5%'} ,
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: '9%'},
            {title: '구격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: '9%'},
            {title: '입고수량', dataType: 'string', dataIndx: 'IN_QTY', minWidth: '5%'},
            {title: '불출수량', dataType: 'string', dataIndx: 'OUT_QTY', minWidth: '5%'},
            {title: '요청자', dataType: 'string', dataIndx: 'REGISTED_ID', minWidth: '6%' },
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', minWidth: '10%'},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: '10%'},
            {title: '수행일시', dataType: 'string', dataIndx: 'REGISTED_DT', minWidth: '14%'}
        ];

        let inWarehouseManageWarehouseColModel= [
            {title: '', dataType: 'string', dataIndx: 'WAREHOUSE_CD', hidden: true},
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', editable: false,
                editor: {
                    type: 'select',
                    mapIndices: { name: "WAREHOUSE_NM", id: "WAREHOUSE_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1049'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageWarehousePopupGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WAREHOUSE_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '위치명', dataType: 'string', dataIndx: 'LOC_NM' },
            {title: '위치 설명', dataType: 'string', dataIndx: 'LOC_DESC', width: 150 },
            {title: '용도', dataType: 'string', dataIndx: 'LOC_USE', width: 150} ,
            {title: '업데이트 일시', dataType: 'date', dataIndx: 'UPDATE_DT', width: 120, editable: false},
            {title: '작성자', dataType: 'string', dataIndx: 'INSERT_ID', width: 120, editable: false}
        ];

        let inWarehouseManageManageToolbar01 = {
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            inWarehouseManageManageGrid01.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            $("#in_warehouse_manage_hidden_form #queryId").val("material.deleteInWarehouseManage");
                            let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#in_warehouse_manage_hidden_form')};

                            fnPostAjax(function (data, callFunctionParam) {
                                inWarehouseManageManageGrid01.pqGrid("refreshDataAndView");
                            }, parameters, '');
                        }
                    }
                },
                {
                    type: 'button', label: '소재불출(바코드)', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'button', label: '위치 정보 관리', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            $("#in_warehouse_manage_warehouse_popup").modal("show");
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let inWarehouseManageInsertUpdateQueryList = ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'];
                            fnModifyPQGrid(inWarehouseManageManageGrid01, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
                        }
                    }
                },
            ]
        };
        let inWarehouseManageManageToolbar02 = {
            items: []
        };

        let inWarehouseManageOutToolbar = {
            items: []
        };
        let inWarehouseManageWarehouseToolbar = {
            items: [
                {   type: 'select', cls:'inWarehouseManageWarehouseSelectBox', label: '창고명', style: 'float: left;', options: function() {
                        let options = fnGetCommCodeGridToolbarSelectBox('1049');
                        return options;

                        let text = $(".inWarehouseManageWarehouseSelectBox option:selected").val();
                        $("#in_warehouse_manage_warehouse_popup_form #WAREHOUSE_CD").val(text);
                    },
                    listener: {
                        'change': function () {
                            let text = $(".inWarehouseManageWarehouseSelectBox option:selected").val();
                            $("#in_warehouse_manage_warehouse_popup_form #WAREHOUSE_CD").val(text);

                            inWarehouseManageWarehousePopupGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                return (fnFormToJsonArrayData('#in_warehouse_manage_warehouse_popup_form'));
                            });
                            inWarehouseManageWarehousePopupGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let inWarehouseManageInsertUpdateQueryList = ['insertUpdateInWarehouseManageWarehouse'];
                            fnModifyPQGrid(inWarehouseManageWarehousePopupGrid, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            let WAREHOUSE_CD = $(".inWarehouseManageWarehouseSelectBox option:selected").val();
                            let WAREHOUSE_NM = $(".inWarehouseManageWarehouseSelectBox option:selected").text();
                            inWarehouseManageWarehousePopupGrid.pqGrid('addRow', {
                                newRow: {WAREHOUSE_CD:WAREHOUSE_CD, WAREHOUSE_NM:WAREHOUSE_NM},
                                rowIndx : 0,
                                checkEditable: false
                            });
                        }
                    }
                }
            ]
        };

        inWarehouseManageManageGrid01.pqGrid({
            width: "100%", height: 438,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'MY_MAT_STOCK_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#in_warehouse_manage_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            postRenderInterval: -1,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            strNoRows: g_noData,
            trackModel: {on: true},
            colModel: inWarehouseManageManageColModel01,
            showTitle: false,
            complete: function(event, ui) {
                this.flex();
                let data = inWarehouseManageManageGrid01.pqGrid('option', 'dataModel.data');

                $('#in_warehouse_manage_manage_grid01_records').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    inWarehouseManageSelectedRowIndex = [];
                    let itemOrderHistoryGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let itemOrderHistoryGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (itemOrderHistoryGridFirstRow === itemOrderHistoryGridLastRow) {
                        inWarehouseManageSelectedRowIndex[0] = itemOrderHistoryGridFirstRow;
                    } else {
                        for (let i = itemOrderHistoryGridFirstRow; i <= itemOrderHistoryGridLastRow; i++) {
                            inWarehouseManageSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function (event, ui) {
                //if(ui.addList.length > 0 ) {
                let MY_MAT_STOCK_SEQ = ui.addList[0].rowData.MY_MAT_STOCK_SEQ;
                let LOC_SEQ = ui.addList[0].rowData.LOC_SEQ;

                $("#in_warehouse_manage_hidden_form #queryId").val("material.selectInWarehouseManageListDetail");
                $("#in_warehouse_manage_hidden_form #MY_MAT_STOCK_SEQ").val(MY_MAT_STOCK_SEQ);
                $("#in_warehouse_manage_hidden_form #LOC_SEQ").val(LOC_SEQ);
                selectInWarehouseManageManageGrid02List();
                //}
            }
        });

        selectInWarehouseManageManageGrid02List();
        function selectInWarehouseManageManageGrid02List(){
            inWarehouseManageManageGrid02.pqGrid({
                width: "100%", height: 272,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#in_warehouse_manage_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                postRenderInterval: -1, //call postRender synchronously.
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                strNoRows: g_noData,
                trackModel: {on: true},
                colModel: inWarehouseManageManageColModel02,
                showTitle: false,
                editable: false,
                complete: function(event, ui) {
                    this.flex();
                    let data = inWarehouseManageManageGrid02.pqGrid('option', 'dataModel.data');

                    $('#in_warehouse_manage_manage_grid02_records').html(data.length);
                },
            });

            inWarehouseManageManageGrid02.pqGrid('refreshDataAndView');
        }

        inWarehouseManageOutGrid.pqGrid({
            width: "100%", height: "100%",
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#in_warehouse_manage_out_hidden_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: true,
            strNoRows: g_noData,
            trackModel: {on: true},
            colModel: inWarehouseManageOutColModel,
            showTitle: false,
            editable: false,
            complete: function(event, ui) {
                this.flex();
                let data = inWarehouseManageOutGrid.pqGrid('option', 'dataModel.data');

                $('#in_warehouse_manage_out_grid01_records').html(data.length);
            },
        });

        $("#btnInWarehouseManageManageSearch").on('click', function(){
            inWarehouseManageManageGrid01.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_search_form'));
            });
            inWarehouseManageManageGrid01.pqGrid('refreshDataAndView');
        });

        $("#btnInWarehouseManageOutSearch").on('click', function(){
            inWarehouseManageOutGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_out_hidden_form'));
            });
            inWarehouseManageOutGrid.pqGrid('refreshDataAndView');
        });

        $("#in_warehouse_manage_tabs").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#in_warehouse_manage_out_search_form').toggle(); // show -> hide , hide -> show
                $('#in_warehouse_manage_search_form').toggle(); // show -> hide , hide -> show
                $("#IN_WAREHOUSE_MANAGE_BUTTON").toggle();
            }
        });

        $('#in_warehouse_manage_warehouse_popup').on('show.bs.modal',function() {
            inWarehouseManageWarehousePopupGrid.pqGrid({
                width: "100%", height: 350,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'LOC_SEQ',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('in_warehouse_manage_warehouse_popup_form'),
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                strNoRows: g_noData,
                resizable: false,
                trackModel: {on: true},
                colModel: inWarehouseManageWarehouseColModel,
                //toolbar: inWarehouseManageWarehouseToolbar,
                complete: function(event, ui) {
                    this.flex();
                    let data = inWarehouseManageWarehousePopupGrid.pqGrid('option', 'dataModel.data');

                    $('#in_warehouse_manage_manage_grid01_records').html(data.length);
                },
            });

            inWarehouseManageWarehousePopupGrid.pqGrid("refreshDataAndView");
        });

        $('#in_warehouse_manage_scan_barcode_popup').on('show.bs.modal',function() {
            fnSearchScanTableOnData();
        });

        $('#in_warehouse_manage_scan_barcode_popup').on('hide.bs.modal',function() {
            $("#in_warehouse_manage_scan_barcode_popup_form #TYPE").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #CONTROL_NUM").val('');

            $("#in_warehouse_manage_scan_barcode_popup_form").find('#dynamicTableTr').remove();
        });

        function fnSearchScanTableOnData(){
            $("#in_warehouse_manage_scan_barcode_popup_form").find('#dynamicTableTr').remove();

            let MY_MAT_OUT_SEQ = $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val();
            let BARCODE_NUM = $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val();
            if(MY_MAT_OUT_SEQ == '' && BARCODE_NUM == ''){
                fnMakeScanTableTdOnData('');
            } else {
                let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('in_warehouse_manage_scan_barcode_popup_form')};
                fnPostAjax(function(data, callFunctionParam){
                    fnMakeScanTableTdOnData(data);
                }, parameters, '');
            }
        }
        function fnMakeScanTableTdOnData(data){
            let html = "";
            let list = data.list;
            if(data != '') {
                for(var i=0; i<list.length; i++) {
                    html +='<tr class="outTopTableStyle" id="dynamicTableTr">';
                    html += '<td><input type="text" id="SEQ" name="SEQ" value="'+ list[i].SEQ +'" readonly></td>';
                    html += '<td><input type="text" id="MATERIAL_KIND_NM" name="MATERIAL_KIND_NM" value="'+ fnEmptyValReturn(list[i].MATERIAL_KIND_NM) +'" readonly></td>';
                    html += '<td><input type="text" id="MATERIAL_DETAIL_NM" name="MATERIAL_DETAIL_NM" value="'+ fnEmptyValReturn(list[i].MATERIAL_DETAIL_NM) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_W" name="SIZE_W" value="'+ fnEmptyValReturn(list[i].SIZE_W) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_H" name="SIZE_H" value="'+ fnEmptyValReturn(list[i].SIZE_H) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_T" name="SIZE_T" value="'+ fnEmptyValReturn(list[i].SIZE_T) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_D" name="SIZE_D" value="'+ fnEmptyValReturn(list[i].SIZE_D) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_L" name="SIZE_L" value="'+ fnEmptyValReturn(list[i].SIZE_L) +'" readonly></td>';
                    html += '<td><input type="text" id="STOCK_QTY" name="STOCK_QTY" value="'+ fnEmptyValReturn(list[i].STOCK_QTY) +'" readonly></td>';
                    html += '<td><input type="text" id="OUT_QTY" name="OUT_QTY" value="'+ fnEmptyValReturn(list[i].OUT_QTY) +'"></td>';
                    html += '<td><input type="text" id="WAREHOUSE_NM" name="WAREHOUSE_NM" value="'+ fnEmptyValReturn(list[i].WAREHOUSE_NM) +'" readonly></td>';
                    html += '<td><input type="text" id="LOC_NM" name="LOC_NM" value="'+ fnEmptyValReturn(list[i].LOC_NM) +'" readonly></td>';
                    html += '<td><input type="text" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM" value="'+ fnEmptyValReturn(list[i].MATERIAL_ORDER_NUM) +'" readonly></td>';
                    html += '<td><input type="text" id="ORDER_DT" name="ORDER_DT" value="'+ fnEmptyValReturn(list[i].ORDER_DT) +'" readonly></td>';
                    html += '</tr>';

                    $("#in_warehouse_manage_scan_barcode_popup_form #CONTROL_NUM").val(fnEmptyValReturn(list[i].CONTROL_NUM));
                }
            }

            $("#in_warehouse_manage_scan_barcode_popup_form #inWarehouseManageScanPopDynamicTable tbody").append(html);
        }

        function fnEmptyValReturn(data){
            if(data == undefined || data == null) data = ''
            return data;
        }

        /** Element Event **/
        $("#popBarcode").on('keyup', function(event){
            $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val($(this).val());
            $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val('');
            fnSearchScanTableOnData();
        });

        $("#in_warehouse_manage_warehouse_popup_form #WAREHOUSE_CD").on('change', function(){
            inWarehouseManageWarehousePopupGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_warehouse_popup_form'));
            });
            inWarehouseManageWarehousePopupGrid.pqGrid('refreshDataAndView');
        });

        /** 버튼 처리 **/
        $("#btnInWarehouseManageAdd").on('click', function(){
            inWarehouseManageManageGrid01.pqGrid('addNodes', [{}], 0);
        });

        $("#btnInWarehouseManageRemove").on('click', function(){
            $("#in_warehouse_manage_hidden_form #queryId").val("material.deleteInWarehouseManageDetail");
            let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#in_warehouse_manage_hidden_form')};

            fnPostAjax(function (data, callFunctionParam) {
                $("#in_warehouse_manage_hidden_form #queryId").val("material.deleteInWarehouseManageMaster");
                let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#in_warehouse_manage_hidden_form')};
                fnPostAjax(function (data, callFunctionParam) {
                    inWarehouseManageManageGrid01.pqGrid("refreshDataAndView");
                }, parameters, '');
            }, parameters, '');
        });

        $("#btnInWarehouseManageOutBarcode").on('click', function(){
            $("#in_warehouse_manage_scan_barcode_popup_form #TYPE").val('scan');
            $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val('');

            $("#in_warehouse_manage_scan_barcode_popup").modal("show");
        });

        $("#btnInWarehouseManageLocation").on('click', function(){
            $("#in_warehouse_manage_warehouse_popup").modal("show");
        });

        $("#btnInWarehouseManageWarehouseSave").on('click', function(){
            let inWarehouseManageInsertUpdateQueryList = ['insertUpdateInWarehouseManageWarehouse'];
            fnModifyPQGrid(inWarehouseManageWarehousePopupGrid, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
        });

        $("#btnInWarehouseManageSave").on('click', function(){
            let inWarehouseManageInsertUpdateQueryList = ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'];
            fnModifyPQGrid(inWarehouseManageManageGrid01, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
        });

        $("#btnInWarehouseManageScanPopSave").on('click', function(){
            let type = $("#in_warehouse_manage_scan_barcode_popup_form #TYPE").val();
            let my_mat_out_seq = $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val();
            let barcode_num = $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val();
            let parameter;

            if(type == 'manual'){
                parameter = {
                    'queryId': 'material.updateInWarehouseOut',
                    'MY_MAT_OUT_SEQ': my_mat_out_seq
                };
            } else if(type == 'scan') {
                parameter = {
                    'queryId': 'material.updateInWarehouseScan',
                    'BARCODE_NUM': barcode_num
                };
            }
            let parameters = {'url': '/json-update', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                selectInWarehouseManageManageGrid02List();
            }, parameters, '');
        });


        fnCommCodeDatasourceSelectBoxCreate($("#in_warehouse_manage_out_popup_form").find("#OUT_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});

    });

</script>