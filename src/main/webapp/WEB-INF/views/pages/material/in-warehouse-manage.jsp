<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="modal popup" id="in_warehouse_manage_warehouse_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header topWrap">
                <div class="hWrap">
                    <h2>위치정보 관리</h2>
                </div>
            </div>
            <div class="topWrap">
                <form class="form-inline" role="form" id="in_warehouse_manage_warehouse_popup_form" name="in_warehouse_manage_warehouse_popup_form">
                    <input type="hidden" id="queryId" name="queryId" value="selectInWarehouseManageWarehouseList">
                    <input type="hidden" id="WAREHOUSE_CD" name="WAREHOUSE_CD" value="">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <!-- grid table -->
                        <section class="bg-light">
                            <div class="panel panel-default">
                                <div class="tableWrap">
                                    <div class="gridWrap">
                                        <div class="hWrap">
                                            <button type="button" class="search_btn" id="btnItemOrderRegisterSearch">검색</button>
                                        </div>
                                        <div id="in_warehouse_manage_warehouse_grid" class="jqx-refresh"></div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<div class="page estimate machineWrap">
        <form class="form-inline" id="in_warehouse_manage_search_form" name="in_warehouse_manage_search_form" role="form">
            <div class="topWrap">
                <input type="hidden" name="queryId" id="queryId" value="selectInWarehouseManageList">
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
                <input type="hidden" name="queryId" id="queryId" value="selectInWarehouseManageOutList">
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
    <input type="hidden" id="queryId" name="queryId" value="selectInWarehouseManageListDetail"/>
    <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>

<form id="in_warehouse_manage_out_hidden_form" name="in_warehouse_manage_out_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectInWarehouseManageOutList"/>
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
            /*{title: '가로', dataType: 'string', dataIndx: 'SIZE_W', minWidth: 60 ,
                editable: function(ui) {
                    let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    return getSizeEditYn('SIZE_W', rowData);
                }
            },
            {title: '세로', dataType: 'string', dataIndx: 'SIZE_H', minWidth: 60 ,
                editable: function(ui) {
                    let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    return getSizeEditYn('SIZE_H', rowData);
                }
            },
            {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T', minWidth: 60 ,
                editable: function(ui) {
                    let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    return getSizeEditYn('SIZE_T', rowData);
                }
            },
            {title: '지름(D)', dataType: 'string', dataIndx: 'SIZE_D', minWidth: 60 ,
                editable: function(ui) {
                    let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    return getSizeEditYn('SIZE_D', rowData);
                }
            },
            {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L', minWidth: 60 ,
                editable: function(ui) {
                    let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    return getSizeEditYn('SIZE_L', rowData);
                }
            },*/
            {title: '보유수량', dataType: 'string', dataIndx: 'STOCK_QTY', minWidth: 80 },
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
                    return '<input type="button" value="불출" style="width:70px;"/>';
                }
            }
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
            {title: '수동 불출', dataType: 'string', dataIndx: 'ORDER_NOTE', editable: false}
        ];

        let inWarehouseManageOutColModel= [
            {title: '수불구분', dataType: 'string', dataIndx: 'IN_OUT_TYPE', minWidth: '5%',
                editor: {
                    type: 'select',
                    mapIndices: { name: "IN_OUT_TYPE", id: "IN_OUT_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1055'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = inWarehouseManageManageGrid01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["IN_OUT_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
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
                            $("#in_warehouse_manage_hidden_form #queryId").val("deleteInWarehouseManage");
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

                $("#in_warehouse_manage_hidden_form #queryId").val("selectInWarehouseManageListDetail");
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

        function getSizeEditYn(typeNm, rowData){
            let MATERIAL_KIND = rowData['MATERIAL_KIND'];
            if(MATERIAL_KIND == 'SHP010'){
                if(typeNm == 'SIZE_W')  return true;
                if(typeNm == 'SIZE_H')  return true;
                if(typeNm == 'SIZE_T')  return true;
                if(typeNm == 'SIZE_D')  return false;
                if(typeNm == 'SIZE_L')  return false;

            }else if(MATERIAL_KIND == 'SHP020'){
                if(typeNm == 'SIZE_W')  return false;
                if(typeNm == 'SIZE_H')  return false;
                if(typeNm == 'SIZE_T')  return false;
                if(typeNm == 'SIZE_D')  return true;
                if(typeNm == 'SIZE_L')  return true;

            }else if(MATERIAL_KIND == 'SHP030'){
                if(typeNm == 'SIZE_W')  return true;
                if(typeNm == 'SIZE_H')  return true;
                if(typeNm == 'SIZE_T')  return false;
                if(typeNm == 'SIZE_D')  return false;
                if(typeNm == 'SIZE_L')  return true;
            }
        }

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
                width: "100%", height: 300,
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
                toolbar: inWarehouseManageWarehouseToolbar,
                complete: function(event, ui) {
                    this.flex();
                    let data = inWarehouseManageWarehousePopupGrid.pqGrid('option', 'dataModel.data');

                    $('#in_warehouse_manage_manage_grid01_records').html(data.length);
                },
            });

            inWarehouseManageWarehousePopupGrid.pqGrid("refreshDataAndView");
        });

        /** 버튼 처리 **/
        $("#btnInWarehouseManageAdd").on('click', function(){
            inWarehouseManageManageGrid01.pqGrid('addNodes', [{}], 0);
        });

        $("#btnInWarehouseManageRemove").on('click', function(){
            $("#in_warehouse_manage_hidden_form #queryId").val("deleteInWarehouseManageDetail");
            let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#in_warehouse_manage_hidden_form')};

            fnPostAjax(function (data, callFunctionParam) {
                $("#in_warehouse_manage_hidden_form #queryId").val("deleteInWarehouseManageMaster");
                let parameters = {'url': '/json-list', 'data': fnFormToJsonArrayData('#in_warehouse_manage_hidden_form')};
                fnPostAjax(function (data, callFunctionParam) {
                    inWarehouseManageManageGrid01.pqGrid("refreshDataAndView");
                }, parameters, '');
            }, parameters, '');
        });

        $("#btnInWarehouseManageOutBarcode").on('click', function(){

        });

        $("#btnInWarehouseManageLocation").on('click', function(){
            $("#in_warehouse_manage_warehouse_popup").modal("show");
        });

        $("#btnInWarehouseManageSave").on('click', function(){
            let inWarehouseManageInsertUpdateQueryList = ['material.insertUpdateInWarehouseManageMaster','material.insertUpdateInWarehouseManageDetail'];
            fnModifyPQGrid(inWarehouseManageManageGrid01, inWarehouseManageInsertUpdateQueryList, inWarehouseManageInsertUpdateQueryList);
        });

    });

    $(document).on('click', '#item_warehouse_manage_out', function(event){
        let seq = event.target.dataset.seq;
        let col = event.target.dataset.col;
        let val = event.target.dataset.val;

        let valueElement = document.createElement("input");
        let queryElement = document.createElement("input");
        let seqElement = document.createElement("input");

        valueElement.type = "hidden";
        valueElement.id = col;
        valueElement.name = col;
        valueElement.setAttribute("value", val);

        queryElement.type = "hidden";
        queryElement.id = "queryId";
        queryElement.name = "queryId";
        queryElement.setAttribute("value", "updateItemOrderHistoryInspection");

        seqElement.type = "hidden";
        seqElement.id = "MATERIAL_ORDER_SEQ";
        seqElement.name = "MATERIAL_ORDER_SEQ";
        seqElement.setAttribute("value", seq);

        $("#item_order_history_inspection_hidden_form").empty();
        $("#item_order_history_inspection_hidden_form").append(valueElement);
        $("#item_order_history_inspection_hidden_form").append(queryElement);
        $("#item_order_history_inspection_hidden_form").append(seqElement);

        let parameters = {'url': '/json-update', 'data': $("#item_order_history_inspection_hidden_form").serialize()};
        fnPostAjax(function (data, callFunctionParam) {
            inWarehouseManageManageGrid02.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
            });
            inWarehouseManageManageGrid02.pqGrid('refreshDataAndView');
        }, parameters, '');
    });
</script>