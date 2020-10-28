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
<div class="popup_container" id="in_warehouse_manage_out_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content;">
        <h3 style="margin-bottom: 10px;">소재 불출 진행</h3>
        <button type="button" class="pop_close mt-10 mr-8" data-dismiss="modal">닫기</button>
        <br/>
        <form class="form-inline" role="form" id="in_warehouse_manage_out_popup_form" name="in_warehouse_manage_out_popup_form" method="POST">
            <input type="hidden" id="queryId" name="queryId" value="insertInWarehouseManageOutPop"/>
            <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
            <div class="tableWrap">
                <table>
                    <tbody>
                    <tr class="outTopTableStyle">
                        <th rowspan="2">창고명</th><th rowspan="2">위치</th>
                        <th rowspan="2">형태</th><th rowspan="2">소재종류</th>
                        <th colspan="5">소재 Size</th><th rowspan="2">보유수량</th>
                    </tr>
                    <tr class="outTopTableStyle">
                        <th>가로</th><th>세로</th><th>두께</th>
                        <th>파이</th><th>길이(L)</th>
                    </tr>
                    <tr class="outTopTableStyle">
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
            <br/>
            <div class="tableWrap">
                <table id="inWarehouseOutPopTable">
                    <tbody>
                    <tr class="outMidTableStyle"><th>보유수량</th><th>남은수량</th><th>불출수량</th><th> </th><th>요청자</th></tr>
                    <tr class="outMidTableStyle">
                        <td><input type="text" id="STOCK_QTY" name="STOCK_QTY" readonly></td>
                        <td><input type="text" id="REMAIN_QTY" name="REMAIN_QTY" readonly></td>
                        <td><input type="text" id="OUT_QTY" name="OUT_QTY"></td>
                        <td>
                            <button type="button" id="btnInWarehouseManageOutPopPlus" class="btn_plus">더하기</button>
                            <button type="button" id="btnInWarehouseManageOutPopMinus" class="btn_minus">빼기</button>
                        </td>
                        <td>
                            <select id="OUT_USER_ID" name="OUT_USER_ID">
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </br>
                <table>
                    <tr class="outBotTableStyle">
                        <th>용도</th>
                        <td><input id="NOTE" name="NOTE" type="text" style='width: 100%;'></td>
                    </tr>
                </table>
            </div>
            <p> 불출 하시겠습니까?</p>
            <div class="popBtnWrap">
                <button type="button" class="btnSave" id="btnInWarehouseManageOutPopSave">저장</button>
                <button class="btnCancel" id="btnInWarehouseManageOutPopCancel" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="popup_container" id="in_warehouse_manage_scan_barcode_popup" style="display: none;">
    <div class="layerPopup" style="height: fit-content;">
        <h3>소재 불출 진행</h3>
        <button type="button" class="pop_close mt-10 mr-8" data-dismiss="modal">닫기</button>
        <form class="form-inline" role="form" id="in_warehouse_manage_scan_barcode_popup_form" name="in_warehouse_manage_scan_barcode_popup_form" method="POST">
            <input type="hidden" id="queryId" name="queryId" value="material.selectInWarehousePop"/>
            <input type="hidden" id="TYPE" name="TYPE" value=""/>
            <input type="hidden" id="MY_MAT_OUT_SEQ" name="MY_MAT_OUT_SEQ"/>
            <input type="hidden" id="BARCODE_NUM" name="BARCODE_NUM"/>
            <div class="tableWrap">
                <div class="h_area mb-10">
                    <span class="buttonWrap" id="inspect_method_btn">
                        <span style="height: 30px;float: left;">&nbsp;</span>
                    </span>
                    <ul class="listWrap right_float">
                        <span class="barCode"><img id="barCodeImg" src="/resource/asset/images/common/img_barcode_long.png" alt="바코드"></span>
                        <span class="barCodeTxt"><input type="text" class="wd_270_barcode hg_30" id="inWarehouseManageBarcode" value="" placeholder="도면의 바코드를 스캔해 주세요" style="border: 1px solid #e6e6e6;"></span>
                    </ul>
                </div>
                <div class="t_area">
                    <div class="t_h">
                        <span class="list_t" style="width: 194px;">관리번호</span>
                        <span style="width: 292px;">
                            <input id="CONTROL_NUM" name="CONTROL_NUM" type="text" readonly>
                        </span>
                    </div>
                </div>
            </div>
            <h2>&nbsp;</h2>
            <div class="list1">
                <table class="rowStyle" id="inWarehouseManageScanPopDynamicTable">
                    <tbody>
                    <tr class="">
                        <th style="width: 30px;">No.</th><th style="width: 45px;">형태</th>
                        <th style="width: 70px;">소재종류</th><th style="width: 80px;">규격</th>
                        <th style="width: 45px">보유수량</th><th style="width: 45px">요청수량</th>
                        <th style="width: 70px;">창고</th><th style="width: 70px;">위치</th>
                        <th>주문번호</th><th>요청일시</th>
                    </tr>
                    <tr class="" id="dynamicTableTr">
                        <td><input type="text" id="SEQ" name="SEQ" readonly></td>
                        <td><input type="text" id="MATERIAL_KIND_NM" name="MATERIAL_KIND_NM" readonly></td>
                        <td><input type="text" id="MATERIAL_DETAIL_NM" name="MATERIAL_DETAIL_NM" readonly></td>
                        <td><input type="text" id="SIZE_TXT" name="SIZE_TXT" readonly></td>
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
                                <label class="label_100" for="WAREHOUSE_CD">창고</label>
                                <select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1049}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="LOC_SEQ">위치</label>
                                <select id="LOC_SEQ" name="LOC_SEQ" title="위치" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1027}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" title="소재형태" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1029}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
<%--                                <button type="button" id="IN_WAREHOUSE_MANAGE_MANAGE_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>--%>
                                <button type="button" class="defaultBtn radius blue" id="btnInWarehouseManageManageSearch">검색</button>
                            </span>
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
<%--                        <li>--%>
<%--                            <span class="ipu_wrap"><label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200" value="" title="소재주문업체"></span>--%>
<%--                            <span class="ipu_wrap"><label class="label_100" for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200" value="" title="소재주문업체"></span>--%>
<%--                        </li>--%>
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
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1049}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="LOC_SEQ">위치</label>
                                <select id="LOC_SEQ" name="LOC_SEQ" title="위치" class="wd_200">
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1027}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_KIND">소재형태</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" title="소재형태" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1029}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
                                <button type="button" id="IN_WAREHOUSE_MANAGE_OUT_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                                <button type="button" class="defaultBtn radius blue" id="btnInWarehouseManageOutSearch">검색</button>
                            </span>
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
                            <span class="ipu_wrap"><label class="label_100" for="IN_OUT_NM">수불 구분</label>
                                <select id="IN_OUT_NM" name="IN_OUT_NM" title="수불 구분" class="wd_200">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1055}">
                                        <option value="${code.CODE_NM_KR}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
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
                <div class="d-inline right_float" id="IN_WAREHOUSE_MANAGE_BUTTON" style="font-weight: normal;">
                    <input type="text" id="inWarehouseManageFilterKeyword" placeholder="Enter your keyword">
                    <select id="inWarehouseManageFilterColumn"></select>
                    <select id="inWarehouseManageFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="inWarehouseManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="inWarehouseManageFrozen" name="inWarehouseManageFrozen">
                    </select>
                    <button type="button" class="defaultBtn btn-120w" id="btnInWarehouseManageOutBarcode">소재불출(바코드)</button>
                    <button type="button" class="defaultBtn btn-120w" id="btnInWarehouseManageLocation">위치정보관리</button>
                    <button type="button" class="defaultBtn radius" id="btnInWarehouseManageAdd">추가</button>
                    <button type="button" class="defaultBtn radius red" id="btnInWarehouseManageRemove">삭제</button>
                    <button type="button" class="defaultBtn radius green" id="btnInWarehouseManageSave">저장</button>
                </div>
                <div class="d-inline right_float" id="IN_WAREHOUSE_MANAGE_OUT_BUTTON" style="display: none; font-weight: normal;">
                    <input type="text" id="inWarehouseManageOutFilterKeyword" placeholder="Enter your keyword">
                    <select id="inWarehouseManageOutFilterColumn"></select>
                    <select id="inWarehouseManageOutFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="inWarehouseManageOutFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="inWarehouseManageOutFrozen" name="inWarehouseManageOutFrozen">
                    </select>
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
                    <div class="conMainWrap" style="height: 712px">
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
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', width: "7%" ,
                editable: function(ui){
                    if(ui.rowData != undefined) {
                        let MY_MAT_STOCK_SEQ = ui.rowData.MY_MAT_STOCK_SEQ == undefined ? '' : ui.rowData.MY_MAT_STOCK_SEQ;
                        if(MY_MAT_STOCK_SEQ) return false;
                        return true;
                    }
                    return false;
                },
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1049') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1049');

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
            {title: '상세위치', dataType: 'string', dataIndx: 'LOC_SEQ', minWidth: 120,
                editable: function(ui){
                    if(ui.rowData != undefined) {
                        let MY_MAT_STOCK_SEQ = ui.rowData.MY_MAT_STOCK_SEQ == undefined ? '' : ui.rowData.MY_MAT_STOCK_SEQ;
                        if(MY_MAT_STOCK_SEQ) {
                            return false;
                        } else{
                            return true;
                        }
                    } else {
                        return false;
                    }
                },
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
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
                        let ajaxData = [];

                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');

                        return ajaxData;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
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
                        }, warehouseData, '');

                        let index = ajaxData.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ajaxData.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : ajaxData[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', width: "7%" ,
                editable: function(ui){
                    if(ui.rowData != undefined) {
                        let MY_MAT_STOCK_SEQ = ui.rowData.MY_MAT_STOCK_SEQ == undefined ? '' : ui.rowData.MY_MAT_STOCK_SEQ;
                        if(MY_MAT_STOCK_SEQ) {
                            return false;
                        } else{
                            return true;
                        }
                    } else {
                        return false;
                    }
                },
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
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , minWidth: "8%",
                editable: function(ui){
                    if(ui.rowData != undefined) {
                        let MY_MAT_STOCK_SEQ = ui.rowData.MY_MAT_STOCK_SEQ == undefined ? '' : ui.rowData.MY_MAT_STOCK_SEQ;
                        if(MY_MAT_STOCK_SEQ) {
                            return false;
                        } else{
                            return true;
                        }
                    } else {
                        return false;
                    }
                },
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
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 150, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} ,
                editable: function(ui){
                    if(ui.rowData != undefined) {
                        let MY_MAT_STOCK_SEQ = ui.rowData.MY_MAT_STOCK_SEQ == undefined ? '' : ui.rowData.MY_MAT_STOCK_SEQ;
                        if(MY_MAT_STOCK_SEQ) {
                            return false;
                        } else{
                            return true;
                        }
                    } else {
                        return false;
                    }
                },
            },
            {title: '보유수량', dataType: 'string', dataIndx: 'STOCK_QTY', minWidth: 80, editable: false },
            {title: '불출대기수량', dataType: 'string', dataIndx: 'OUT_WAIT_QTY', minWidth: 80, editable: false },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 600, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
            {title: '입고', dataType: 'string', dataIndx: 'IN_QTY', minWidth: "3%" ,styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
            {title: '불출요청', dataType: 'string', dataIndx: '', minWidth: "5%" , editable: false,
                render: function(ui){
                    return '<button type="button" id="inWarehouseOutPop" class="miniBtn blue">불출</button>';
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
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM' , minWidth: 180},
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' , minWidth: 60},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , minWidth: 100},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 150 } ,
            /*{title: '불출대기 목록', align: "center", colModel: [
                    {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                    {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                    {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T'},
                    {title: '파이', dataType: 'string', dataIndx: 'SIZE_D'},
                    {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L'},
                ]},*/
            {title: '요청수량', dataType: 'string', dataIndx: 'OUT_QTY', width: 80 , editable: false} ,
            {title: '창고', dataType: 'string', dataIndx: 'WAREHOUSE_NM', width: 120, editable: false},
            {title: '위치', dataType: 'string', dataIndx: 'LOC_NM', width: 120, editable: false},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 150, editable: false},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', width: 30, editable: false},
            {title: '요청일시', dataType: 'string', dataIndx: 'OUT_DT', width: 120, editable: false},
            {title: '요청자', dataType: 'string', dataIndx: 'OUT_USER_ID', minWidth: 100 , editable: false},
            {title: '수동 불출', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', editable: false, minWidth: 80,
                render: function (ui) {
                    return '<button type="button" id="inWarehouseManualOut" class="miniBtn blue">불출</button>'
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
            {title: '요청자', dataType: 'string', dataIndx: 'REGISTED_USER', minWidth: '6%' },
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', minWidth: '10%'},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
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
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: '10%'},
            {title: '수행일시', dataType: 'string', dataIndx: 'REGISTED_DT', minWidth: '14%'}
        ];

        inWarehouseManageManageGrid01.pqGrid({
            width: "100%", height: 438,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#in_warehouse_manage_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            postRenderInterval: -1,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: inWarehouseManageFilterRender}, filterModel: { mode: 'OR' },
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
            editModel: {clicksToEdit: 1},
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#inWarehouseManageFilterColumn").empty();
                $("#inWarehouseManageFilterColumn").html(filterOpts);
                $("#inWarehouseManageFrozen").empty();
                $("#inWarehouseManageFrozen").html(frozenOts);
            },
            complete: function(event, ui) {
                this.flex();
                let data = inWarehouseManageManageGrid01.pqGrid('option', 'dataModel.data');

                $('#in_warehouse_manage_manage_grid01_records').html(data.length);
            },
            selectChange: function (event, ui) {
                inWarehouseManageSelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) inWarehouseManageSelectedRowIndex.push(i);
                }
            },
            rowSelect: function (event, ui) {
                //if(ui.addList.length > 0 ) {
                let MY_MAT_STOCK_SEQ = ui.addList[0].rowData.MY_MAT_STOCK_SEQ;
                let LOC_SEQ = ui.addList[0].rowData.LOC_SEQ;

                $("#in_warehouse_manage_hidden_form #MY_MAT_STOCK_SEQ").val(MY_MAT_STOCK_SEQ);
                $("#in_warehouse_manage_hidden_form #LOC_SEQ").val(LOC_SEQ);
                //selectInWarehouseManageManageGrid02List();
                //}
            },
            change: function (evt, ui) {
                if(ui.source == "edit") {
                    let WAREHOUSE_CD = ui.updateList[0].newRow.WAREHOUSE_CD == undefined ? "" : ui.updateList[0].newRow.WAREHOUSE_CD;
                    if(WAREHOUSE_CD != "") {
                        let rowIndx = ui.updateList[0].rowIndx;
                        inWarehouseManageManageGrid01.pqGrid('updateRow', {rowIndx: rowIndx, row: {"LOC_SEQ": ""}});
                    }
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    inWarehouseManageManageGrid01.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        });

        selectInWarehouseManageManageGrid02List();
        function selectInWarehouseManageManageGrid02List(){
            $("#in_warehouse_manage_hidden_form #queryId").val("material.selectInWarehouseManageListDetail");
            inWarehouseManageManageGrid02.pqGrid({
                width: "100%", height: 245,
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
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: false},
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
                    //this.flex();
                    let data = inWarehouseManageManageGrid02.pqGrid('option', 'dataModel.data');

                    $('#in_warehouse_manage_manage_grid02_records').html(data.length);
                },
            });

            inWarehouseManageManageGrid02.pqGrid('refreshDataAndView');
        }

        selectInWarehouseManageManageGrid03List();
        function selectInWarehouseManageManageGrid03List() {
            inWarehouseManageOutGrid.pqGrid({
                width: "100%", height: "100%",
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#in_warehouse_manage_out_search_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: inWarehouseManageOutFilterRender}, filterModel: { mode: 'OR' },
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true},
                selectionModel: {type: 'row', mode: 'single'},
                swipeModel: {on: false},
                collapsible: false,
                resizable: true,
                strNoRows: g_noData,
                trackModel: {on: true},
                colModel: inWarehouseManageOutColModel,
                showTitle: false,
                editable: false,
                load: function( event, ui ) {
                    var filterOpts = '<option value=\"\">All Fields</option>';
                    var frozenOts = '<option value="0">Selected</option>';
                    this.getColModel().forEach(function(column){
                        let hiddenYn = column.hidden == undefined ? true : false;
                        if(hiddenYn && column.title){
                            filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                            frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                        }
                    });
                    $("#inWarehouseManageOutFilterColumn").empty();
                    $("#inWarehouseManageOutFilterColumn").html(filterOpts);
                    $("#inWarehouseManageOutFrozen").empty();
                    $("#inWarehouseManageOutFrozen").html(frozenOts);
                },
                complete: function (event, ui) {
                    this.flex();
                    let data = inWarehouseManageOutGrid.pqGrid('option', 'dataModel.data');

                    $('#in_warehouse_manage_out_grid01_records').html(data.length);
                },
            });
        }

        $("#btnInWarehouseManageManageSearch").on('click', function(){
            inWarehouseManageManageGrid01.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_search_form'));
            });
            inWarehouseManageManageGrid01.pqGrid('refreshDataAndView');

            inWarehouseManageManageGrid02.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_hidden_form'));
            });
            inWarehouseManageManageGrid02.pqGrid('refreshDataAndView');
        });

        $("#btnInWarehouseManageOutSearch").on('click', function(){
            inWarehouseManageOutGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_out_search_form'));
            });
            inWarehouseManageOutGrid.pqGrid('refreshDataAndView');
        });

        $("#in_warehouse_manage_tabs").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#in_warehouse_manage_out_search_form').toggle(); // show -> hide , hide -> show
                $('#in_warehouse_manage_search_form').toggle(); // show -> hide , hide -> show
                $("#IN_WAREHOUSE_MANAGE_BUTTON").toggle();
                $("#IN_WAREHOUSE_MANAGE_OUT_BUTTON").toggle();
            }
        });



        $('#in_warehouse_manage_scan_barcode_popup').on('show.bs.modal',function() {
            fnSearchScanTableOnData();
        });

        $('#in_warehouse_manage_scan_barcode_popup').on('hide.bs.modal',function() {
            $("#in_warehouse_manage_scan_barcode_popup_form #TYPE").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #CONTROL_NUM").val('');
            $("#in_warehouse_manage_scan_barcode_popup_form #inWarehouseManageBarcode").val('');

            $("#in_warehouse_manage_scan_barcode_popup_form").find('#dynamicTableTr').remove();
        });

        function fnSearchScanTableOnData(){
            $("#in_warehouse_manage_scan_barcode_popup_form").find('#dynamicTableTr').remove();

            let MY_MAT_OUT_SEQ = $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val();
            let BARCODE_NUM = $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val();
            if(MY_MAT_OUT_SEQ == '' && BARCODE_NUM == ''){
                fnMakeScanTableTdOnData('');
            } else {
                let parameters = {'url': '/json-list', 'data': $("#in_warehouse_manage_scan_barcode_popup_form").serialize()};
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
                    /*html += '<td><input type="text" id="SIZE_W" name="SIZE_W" value="'+ fnEmptyValReturn(list[i].SIZE_W) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_H" name="SIZE_H" value="'+ fnEmptyValReturn(list[i].SIZE_H) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_T" name="SIZE_T" value="'+ fnEmptyValReturn(list[i].SIZE_T) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_D" name="SIZE_D" value="'+ fnEmptyValReturn(list[i].SIZE_D) +'" readonly></td>';
                    html += '<td><input type="text" id="SIZE_L" name="SIZE_L" value="'+ fnEmptyValReturn(list[i].SIZE_L) +'" readonly></td>';*/
                    html += '<td><input type="text" id="SIZE_TXT" name="SIZE_TXT" value="'+ fnEmptyValReturn(list[i].SIZE_TXT) +'" readonly></td>';
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
        $("#inWarehouseManageBarcode").on('keyup', function(e){
            if (e.keyCode == 13) {
                $("#in_warehouse_manage_scan_barcode_popup_form #BARCODE_NUM").val($(this).val());
                $("#in_warehouse_manage_scan_barcode_popup_form #MY_MAT_OUT_SEQ").val('');
                fnSearchScanTableOnData();
            }
        });

        $("#inWarehouseManageBarcode").on({
            focus: function () {
                $("#in_warehouse_manage_scan_barcode_popup #barCodeImg").attr("src","/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#in_warehouse_manage_scan_barcode_popup #barCodeImg").attr("src","/resource/asset/images/common/img_barcode_long.png");
            }
        });

        $("#in_warehouse_manage_out_popup_form #OUT_QTY").on("keyup", function(e) {
            $(this).val($(this).val().replace(/[^0-9]/g,""));

            let compareQty = $("#in_warehouse_manage_out_popup_form #STOCK_QTY").val();
            let outQty = $(this).val();
            if(Number(compareQty) < Number(outQty)){
                fnAlert(null, "불출 수량을 확인 해 주세요.");
                $(this).val(outQty.substring(0, outQty.length-1));
                outQty = $(this).val();
            }

            let stockQty = Number(compareQty) - Number(outQty);
            $("#in_warehouse_manage_out_popup_form #REMAIN_QTY").val(stockQty);
        });
        $('#btnInWarehouseManageOutPopPlus').on('click', function(e) {
            calcQty("PLUS");
        });
        $('#btnInWarehouseManageOutPopMinus').on('click', function(e) {
            calcQty("MINUS");
        });
        let calcQty = function(type) {

            let POP_STOCK_QTY = $('#inWarehouseOutPopTable #STOCK_QTY').val();
            let POP_REMAIN_QTY = $('#inWarehouseOutPopTable #REMAIN_QTY').val() == '' ? $('#inWarehouseOutPopTable #STOCK_QTY').val() : $('#inWarehouseOutPopTable #REMAIN_QTY').val();
            let POP_OUT_QTY = $("#inWarehouseOutPopTable #OUT_QTY").val() == '' ? '0' : $("#inWarehouseOutPopTable #OUT_QTY").val();
            if (POP_STOCK_QTY == "" || POP_STOCK_QTY == "0") {
                fnAlert(null, "수량이 없습니다.");
                return;
            }
            if (type == "PLUS") {
                if (Number(POP_REMAIN_QTY) > 0) {
                    POP_OUT_QTY = Number(POP_OUT_QTY) + 1;
                    POP_REMAIN_QTY = Number(POP_STOCK_QTY) - POP_OUT_QTY;
                }
            } else if (type == "MINUS") {
                if (Number(POP_OUT_QTY) > 0) {
                    POP_OUT_QTY = Number(POP_OUT_QTY) - 1;
                    POP_REMAIN_QTY = Number(POP_STOCK_QTY) - POP_OUT_QTY;
                }
            }
            $('#inWarehouseOutPopTable #REMAIN_QTY').val(POP_REMAIN_QTY);
            $("#inWarehouseOutPopTable #OUT_QTY").val(POP_OUT_QTY);
        }

        /** 버튼 처리 **/
        $("#btnInWarehouseManageAdd").on('click', function(){
            let rowCnt = inWarehouseManageManageGrid01.pqGrid('option', 'dataModel.data').length;
            inWarehouseManageManageGrid01.pqGrid('addNodes', [{}], 0);
        });

        $("#btnInWarehouseManageRemove").on('click', function(){
            $("#in_warehouse_manage_hidden_form #queryId").val("material.deleteInWarehouseManageDetail");
            let parameters = {'url': '/json-list', 'data': $("#in_warehouse_manage_hidden_form").serialize()};

            fnPostAjax(function (data, callFunctionParam) {
                $("#in_warehouse_manage_hidden_form #queryId").val("material.deleteInWarehouseManageMaster");
                let parameters = {'url': '/json-list', 'data': $("#in_warehouse_manage_hidden_form").serialize()};
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
            fnCommonWarehouse();
        });

        $("#btnInWarehouseManageSave").on('click', function(){
            let gridInstance = inWarehouseManageManageGrid01.pqGrid('getInstance').grid;
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let QUERY_ID_ARRAY = {
                    'insertQueryId': ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'],
                    'updateQueryId': ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'],
                    'selectQueryId': ['selectInWarehouseManageSaveCheck']
                };
                changes.queryIdList = QUERY_ID_ARRAY;
                let parameters = {'url': '/inWarehouseManageSave', 'data': {data: JSON.stringify(changes)}};
                fnPostAjax(function (data, callFunctionParam) {
                    let result = data.result;
                    if(result == 'success') {
                        $("#btnInWarehouseManageManageSearch").trigger('click');
                        $("#btnInWarehouseManageOutSearch").trigger('click');
                    } else {
                        fnAlert(null, "중복되는 리스트가 존재합니다.");
                    }
                }, parameters, '');
            }

            //let inWarehouseManageInsertUpdateQueryList = ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'];
            //fnModifyPQGrid(inWarehouseManageManageGrid01, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
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
                $("#in_warehouse_manage_scan_barcode_popup").modal('hide');

                $("#btnInWarehouseManageManageSearch").trigger('click');
                $("#btnInWarehouseManageOutSearch").trigger('click');
                //selectInWarehouseManageManageGrid02List();
            }, parameters, '');
        });

        $("#btnInWarehouseManageOutPopSave").on('click', function(){
            let OUT_QTY = $("#in_warehouse_manage_out_popup_form #OUT_QTY").val();
            if(OUT_QTY == '' || OUT_QTY == '0') {
                fnAlert(null, "수량을 입력해 주세요.");
                return false;
            } else {
                $("#in_warehouse_manage_out_popup_form #queryId").val("material.insertInWareHouseManageOutManual");
                let parameters = {'url': '/json-create', 'data': $("#in_warehouse_manage_out_popup_form").serialize()};
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    $("#in_warehouse_manage_out_popup").modal('hide');

                    $("#btnInWarehouseManageManageSearch").trigger('click');
                    $("#btnInWarehouseManageOutSearch").trigger('click');
                }, parameters, '');
            }
        });

        $("#inWarehouseManageFilterKeyword").on("keyup", function(e){
            fnFilterHandler(inWarehouseManageManageGrid01, 'inWarehouseManageFilterKeyword', 'inWarehouseManageFilterCondition', 'inWarehouseManageFilterColumn');
        });

        $("#inWarehouseManageFrozen").on('change', function(e){
            fnFrozenHandler(inWarehouseManageManageGrid01, $(this).val());
        });

        $("#inWarehouseManageOutFilterKeyword").on("keyup", function(e){
            fnFilterHandler(inWarehouseManageOutGrid, 'inWarehouseManageOutFilterKeyword', 'inWarehouseManageOutFilterCondition', 'inWarehouseManageOutFilterColumn');
        });

        $("#inWarehouseManageOutFrozen").on('change', function(e){
            fnFrozenHandler(inWarehouseManageOutGrid, $(this).val());
        });

        fnCommCodeDatasourceSelectBoxCreate($("#in_warehouse_manage_out_popup_form").find("#OUT_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});

        function inWarehouseManageFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if(options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if(index > -1) val = options[index].text;
            }
            if (val) {
                var condition = $("#inWarehouseManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#inWarehouseManageFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                }
                else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                }
                else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                }
                else {
                    return val;
                }
            }
            else {
                return val;
            }
        }

        function inWarehouseManageOutFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if(options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if(index > -1) val = options[index].text;
            }
            if (val) {
                var condition = $("#inWarehouseManageOutFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#inWarehouseManageOutFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                }
                else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                }
                else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }
                if (indx >= 0 && txt) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                }
                else {
                    return val;
                }
            }
            else {
                return val;
            }
        }

        fnCommCodeDatasourceSelectBoxCreate($('#in_warehouse_manage_search_form').find('#LOC_SEQ'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#in_warehouse_manage_out_search_form').find('#LOC_SEQ'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}
        });

        // $('#IN_WAREHOUSE_MANAGE_MANAGE_EXCEL_EXPORT').on('click', function () {
        //     const blob = inWarehouseManageManageGrid01.pqGrid('getInstance').grid.exportData({
        //         format: 'xlsx',
        //         render: true,
        //         type: 'blob'
        //     });
        //
        //     saveAs(blob, '현황관리.xlsx');
        // });

        $('#IN_WAREHOUSE_MANAGE_OUT_EXCEL_EXPORT').on('click', function () {
            const blob = inWarehouseManageOutGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '불출이력.xlsx');
        });
    });

</script>