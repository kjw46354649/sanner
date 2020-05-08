<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="stock_manage_form" name="stock_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockList">
            <div class="gubunWrap" style="height: 84px;">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주사">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="stock_manage_search_btn">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재 Type</label>
                             <select id="SEL_MATERIAL_DETAIL" name="SEL_MATERIAL_DETAIL" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1027}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="SEL_WAREHOUSE_CD" name="SEL_WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <button type="button" class="defaultBtn btn-120w" id="stock_manage_add_btn">Add</button>
            <button type="button" class="defaultBtn btn-120w" id="stock_manage_delete_btn">delete</button>
            <button type="button" class="defaultBtn btn-120w" id="stock_manage_area_info_btn">위치정보관리</button>
            <button type="button" class="defaultBtn btn-120w" id="stock_manage_new_btn">입고</button>
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="stock_manage_drawing_new_btn">도면 등록</button>
                <button type="button" class="defaultBtn btn-120w" id="stock_manage_drawing_view_btn">도면 View</button>
                <button type="button" class="defaultBtn btn-120w green" id="stock_manage_save_btn">저장</button>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="stock_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="stock_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 재고입고 mini popup : S -->
<div class="popup_container" id="stock_manage_pop" style="display: none;">
    <form class="form-inline" id="stock_manage_pop_form" name="stock_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="material.selectInsideStockInfo">
    <div class="miniPopup">
        <div class="headWrap">
            <h4>재고 입고</h4>
            <button class="closeBtn">닫기</button>
        </div>
        <div class="contentWrap">
            <table>
                <caption></caption>
                <colgroup>
                    <col width="10%">
                    <col width="*">
                    <col width="5%">
                    <col width="5%">
                    <col width="5%">
                </colgroup>
                <tr>
                    <th>도면번호</th>
                    <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250"></td>
<%--                    <th class="bg_green">Part</th>--%>
<%--                    <td>23</td>--%>
                </tr>
                <tr>
                    <th>재고번호</th>
                    <td colspan="4"><input type="text" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM"  value="" title="재고번호" class="wd_250"></td>
                </tr>
                <tr>
                    <th>규격</th>
                    <td colspan="4"><input type="text" name="SIZE_FULL" id="SIZE_FULL"  value="" title="규격" class="wd_250"></td>
                </tr>
                <tr>
                    <th>창고</th>
                    <td class="nopadding bg_green">
				    	<span>
							<select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" data-required="true">
								<option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
							</select>
						</span>
                    </td>
                    <th>위치</th>
                    <td colspan="2" class="nopadding bg_green">
				    	<span>
							 <select id="LOC_SEQ" name="LOC_SEQ" title="위치" data-required="true" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
						</span>
                    </td>
                </tr>
                <tr>
                    <th>현재수량</th>
                    <td><input type="text" name="INSIDE_STOCK_CURR_QTY" id="INSIDE_STOCK_CURR_QTY"  value="" title="현재수량" class="wd_50"></td>
                    <th>변경후수량</th>
                    <td colspan="2"><input type="text" name="INSIDE_STOCK_AFTER_QTY" id="INSIDE_STOCK_AFTER_QTY"  value="" title="변경후수량" class="wd_50"></td>
                </tr>
                <tr>
                    <th>입고수량</th>
                    <td colspan="4" class="bg_green">
                        <button type="button" class="btn_plus" id="inside_stock_qty_plus_btn">더하기</button>
                        <span class="text" id="INSIDE_STOCK_IN_QTY">0</span>
                        <button type="button" class="btn_minus" id="inside_stock_qty_minus_btn">빼기</button>
                        <button type="button" class="btn_allPlus" id="inside_stock_qty_all_btn">전량</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="footerWrap">
            <div class="barcode" id="footer_barcode">
                <span class="barCodeTxt">도면의 바코드를 스캔해 주세요</span>
                <span class="barCode"><img src="/resource/asset/images/common/img_barcode.png" alt="바코드"></span>
            </div>
            <div class="process">
                <span class="pr_txt" id="footer_msg" style="display:none"><b>입고</b>를 진행하겠습니까?</span>
<%--                <span class="pr_txt">재고를 <b>신규 생성</b>하시겠습니까?</span>--%>
<%--                <span class="pr_txt"><b class="block">입고가 완료되었습니다.</b>추가 진행하려면 바코드를 스캔해주세요</span>--%>
                <div class="btnWrap">
                    <button type="button" class="submit" id="inside_stock_pop_save_btn">submit</button>
                    <button type="button" class="cancel" id="inside_stock_pop_close_btn">cancel</button>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<!-- 재고입고 mini popup : E -->



<script>
    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let stockManageGridId01 = $("#stock_manage_grid");
        let stockManageColModel01;
        let stockManagePostData01;
        let stockManageObj01;

        /**  리스트 그리드 선언 시작 **/
        $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
        stockManagePostData01 = fnFormToJsonArrayData('#stock_manage_form');
        stockManageColModel01 = [
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "ORDER_COMP_CD_NM", id: "ORDER_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let stockManageCompData = {
                            "url" : '/json-list',
                            'data': {'queryId': 'dataSource.getOrderCompanyList'}
                        };
                        let ajaxStockManageData = "";
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxStockManageData = data.list;
                        }, stockManageCompData, '');

                        return ajaxStockManageData;
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ORDER_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM',
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM',
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', editable: false,
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "COMP_CD_NM", id: "COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let stockManageCompData = {
                            "url" : '/json-list',
                            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
                        };
                        let ajaxStockManageData = "";
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxStockManageData = data.list;
                        }, stockManageCompData, '');

                        return ajaxStockManageData;
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '규격', dataType: 'string', dataIndx: 'STOCK_SIZE_FULL', editable: true},
            {title: '소재Type', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '재고수량(EA)', dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', editable: true},
            {
                title: '대칭', datatype: 'integer', align: 'center', colModel: [
                    {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', editable: true},
                    {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY', editable: true}
                ]
            },
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "WAREHOUSE_CD_NM", id: "WAREHOUSE_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1049'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WAREHOUSE_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '위치', dataType: 'string', dataIndx: 'LOC_SEQ_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "LOC_SEQ_NM", id: "LOC_SEQ" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                        };
                        let ajaxData = "";
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');

                        return ajaxData;
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["LOC_SEQ"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 20, minWidth: 20, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[PDF]";
                    return '';
                }
            },
            {title: '생성일시', dataType: 'string', dataIndx: 'INSERT_TIME', editable: false},
            {title: '수정일시', dataType: 'string', dataIndx: 'UPDATE_TIME', editable: false},
            {title: '입고', align: 'center', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN', width: 20, minWidth: 20, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['INSIDE_STOCK_NUM'] > 0) return "[입고]";
                    return '';
                }
            },
            {title: '출고', align: 'center', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_OUT', width: 20, minWidth: 20, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['INSIDE_STOCK_NUM'] > 0) return "[출고]";
                    return '';
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true}
        ];
        stockManageGridId01.pqGrid({
            width: "100%", height: 600,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: stockManageColModel01,
            complete: function () {
                let data = stockManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid_records').html(totalRecords);
            },
            rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;
                return;
                if (ui.dataIndx == 'POPUP') {
                    if (ui.rowData['CONSUMABLE_STOCK_SEQ'] > 0 && ui.rowData['STOCK_QTY'] > 0){
                        $("#pop_form").find("#SEL_CONSUMABLE_STOCK_SEQ").val(ui.rowData['CONSUMABLE_STOCK_SEQ']);
                        $("#pop_form").find("#queryId").val("material.selectConsumableList");
                        $('#PARTS_MANAGE_CURRENT_POPUP').modal('show');
                    }else{}
                    return;
                }
            }
        });
        /**  현황관리(GRID01) 그리드 선언 끝 **/
        $("#stock_manage_pop").on('hide.bs.modal', function(){
            fnResetFrom("stock_manage_pop_form");
            $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
            $("#stock_manage_search_btn").trigger("click");
        });
        $("#stock_manage_pop").on('show.bs.modal', function(){
            return;
            $("#stock_manage_pop_form").find("#queryId").val("material.selectInsideStockInfo");

            let parameters = {
                'url': '/json-info',
                'data': $('#stock_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if(dataInfo == null ) {
                    fnResetFrom("stock_manage_pop_form");
                    //$("#stock_manage_pop_form").find("#EQUIP_ID_NM").html("");
                }else{
                    fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                    $("#stock_manage_pop_form").find("#SEL_CONSUMABLE_STOCK_SEQ").val(dataInfo.CONSUMABLE_STOCK_SEQ);
                    $("#stock_manage_pop_form").find("#POP_WAREHOUSE_CD_NM").html(dataInfo.WAREHOUSE_CD_NM);

                }
            }, parameters, '');
        });

        $('#stock_manage_add_btn').on('click', function () {
            stockManageGridId01.pqGrid('addNodes', [{}], 0);
        });
        $('#inside_stock_pop_save_btn').on('click', function () {
            //규격 validation
            alert("팝업저장");
        });
        $('#stock_manage_new_btn').on('click', function () {
            //$("#stock_manage_pop_form").find("#WAREHOUSE_CD").val("")
            $("#pop_form").find("#queryId").val("material.selectConsumableList");
            $('#stock_manage_pop').modal('show');
        });
        $('#stock_manage_pop_form').find('.closeBtn').on('click', function () {
            $('#stock_manage_pop').modal('hide');
        });
        $('#stock_manage_pop_form').find('#inside_stock_pop_close_btn').on('click', function () {
            $('#stock_manage_pop').modal('hide');
        });
        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            let WAREHOUSE_CD = this.value;
            let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'material.selectWarehouseLocationList'}};
            fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });

        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

    });
</script>
