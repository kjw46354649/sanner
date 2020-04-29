<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="modal" id="item_order_register_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">소재주문 진행</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="item_order_register_popup_form" name="item_order_register_popup_form">
                    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterPopList"/>
                    <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <!-- grid table -->
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>상세 리스트</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="item_order_register_popup_top_grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="item_order_register_popup_bot_grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
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
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_register_search_form" name="item_order_register_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectItemOrderRegisterList">
            <div class="gubunWrap">
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
                        <span class="ipu_wrap"><label class="label_100" for="MODULE_NM">견적번호</label><input type="text" name="MODULE_NM" id="MODULE_NM" class="wd_200" value="" title="견적번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" class="wd_200" value="" title="품명"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterSearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="MANAGE_NUM">관리번호</label><input type="text" name="MANAGE_NUM" id="MANAGE_NUM" class="wd_200" value="" title="관리번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">소재주문번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label><input type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200" value="" title="소재주문업체"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MATERIAL_DETAIL">소재종류</label><input type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200" value="" title="소재주문업체"></span>
                    </li>
                    <li class="">
                        <span class="txt_span pd-right20">Option</span>
                        <span class="chk_box"><input id="pr_ex1" type="checkbox"><label for="pr_ex1"> 발송완료</label></span>
                        <span class="chk_box"><input id="pr_ex2" type="checkbox"><label for="pr_ex2"> 최신차수</label></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap trans_slt mg-right10">
                            <select id="daySltd" name="daySltd" title="등록일시">
                                <option value="" selected="selected">등록일시</option>
                                <option value="1">-ALL-</option>
                                <option value="2">-ALL-</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_1" name=""><label for="fr_1001_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_2" name=""><label for="fr_1001_2">현재월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" id="fr_1001_3" name=""><label for="fr_1001_3">3개월</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input type="text" name="dateOneIp" id="dateOneIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="dateTwoIp" id="dateTwoIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
                            </span>
                        </div>
                        <span class="chk_box"><input id="pr_ex" type="checkbox"><label for="pr_ex">선택</label></span>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_60Wrap">
                    <div class="buttonWrap">
                        <span class="d-inline">
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterOrder">소재주문</button>
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterCancel">주문취소</button>
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterCurrentStock">보유소재 전체현황</button>
                            <span class="chk_box"><input id="chkItemOrderRegisterAutoMatching" type="checkbox"/><label for="chkItemOrderRegisterAutoMatching">보유소개 자동매칭</label></span>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn yelllow" id="btnItemOrderRegisterDrawView">도면 보기</button>
                                <button type="button" class="defaultBtn blue" id="btnItemOrderRegisterSave">Save</button>
                            </span>
                        </span>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_left_grid" class="jqx-refresh"></div>
                    </div>
                </div>
                <div class="right_30Wrap">
                    <div class="buttonWrap">
                        <div class="d-inline">
                            <select id="customSltd" name="customSltd" title="발주처 선태">
                            </select>
                            <select id="materSltd" name="materSltd" title="재질선택">
                            </select>
                            <select id="materSltd" name="materSltd" title="재질선택">
                            </select>
                            <select id="materSltd" name="materSltd" title="재질선택">
                            </select>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn blue" id="btnItemOrderRegisterOutSave">Save</button>
                            </span>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_right_grid" class="jqx-refresh"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_register_hidden_form" name="item_order_register_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterDetail"/>
    <input type="hidden" id="AUTO_SEARCH" name="AUTO_SEARCH" value="N"/>
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ"/>
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ"/>
    <input type="hidden" id="WAREHOUSE_CD" name="WAREHOUSE_CD"/>
    <input type="hidden" id="MATERIAL_DETAIL" name="MATERIAL_DETAIL"/>
    <input type="hidden" id="AREA" name="AREA"/>
    <input type="hidden" id="CONDITION" name="CONDITION"/>
</form>

<script type="text/javascript">
    $(function () {
        'use strict';
        let itemOrderRegisterSelectedRowIndex;
        let itemOrderRegisterLeftGrid = $("#item_order_register_left_grid");
        let itemOrderRegisterRightGrid = $("#item_order_register_right_grid");

        let itemOrderRegisterPopTopGrid = $("#item_order_register_popup #item_order_register_popup_top_grid");
        let itemOrderRegisterPopBotGrid = $("#item_order_register_popup #item_order_register_popup_bot_grid");

        let itemOrderRegisterLeftColModel= [
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문 발주 상태', align: "center", colModel: [
                    {title: '상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', width: 70, editable: false},
                    {title: '확정/취소 일시', dataType: 'date', dataIndx: 'STATUS_DT', width: 120, editable: false}
                ]},
            {title: '소재주문<br>상태', dataType: 'string', dataIndx: 'M_STATUS_NM', width: 70, editable: false},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80, editable: false,
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
            {title: '소재 주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, editable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_NM', width: 80,
                editor: {
                    type: 'select',
                    mapIndices: { name: "M_COMP_NM", id: "M_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    //options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}}),
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}}),
                    //options: fnGetCommCodeGridSelectBox('1007'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["M_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: false},
            {title: '도면Rev.', dataType: 'string', dataIndx: 'DRAWING_VER ', editable: false},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ', editable: false},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', editable: false},
            {title: '요망<br>납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 80, editable: false},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND_NM", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', width: 70,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120 } ,
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', width: 120},
            {title: '요청 사항', align: "center", colModel: [
                    {title: '요청<br>사항', dataType: 'string', dataIndx: 'REQUEST_CD', width: 120,
                        editor: {
                            type: 'select',
                            mapIndices: { name: "REQUEST_CD", id: "REQUEST_CD" },
                            cls: 'item_order_register_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            //attr: 'multiple',
                            init: function(ui) {
                                ui.$cell.find("select").pqSelect();
                                ui.$cell.find("select").pqSelect('open');
                            },
                            getData: function(ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal= "", concatCd = "";

                                if(clave == null){
                                    return concatVal;
                                }

                                for(let iTmp=0; iTmp<clave.length; iTmp++){
                                    concatVal += ui.$cell.find("select option[value='"+clave[iTmp]+"']").text()+",";
                                    concatCd += clave[iTmp]+",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_CD"] = concatCd.substring(0, concatCd.length-1);
                                return concatVal.substring(0, concatVal.length-1);
                            }
                        }
                    },
                    {title: '비고', dataType: 'string', dataIndx: 'M_ORDER_NOTE', width: 120},
                ]},
            {title: '원<br>발주량', dataType: 'string', dataIndx: 'ORDER_QTY', editable: false},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY' },
            {title: '보유소재 충당수량', align: "center", colModel: [
                    {title: '소재<br>Size', dataType: 'string', dataIndx: 'OUT_SIZE_TXT'},
                    {title: '수량', dataType: 'string', dataIndx: 'OUT_QTY'},
                    {title: '', dataType: 'string', dataIndx: '',
                        render: function(ui){
                            return '<input type="button" value="reset"/>';
                        }
                    },
                    {title: '불출', dataType: 'string', dataIndx: 'OUT_YN'},
                ]},
            {title: '비고', dataType: 'string', dataIndx: 'DTL_AMOUNT'},
            {title: '주문<br>요청 일시', dataType: 'date', dataIndx: 'M_ORDER_DT', editable: false}
        ];

        let itemOrderRegisterRightColModel= [
            {title: 'MY_MAT_OUT_SEQ', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', hidden: true } ,
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true } ,
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true } ,
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM' } ,
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' } ,
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' } ,
            {title: 'Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT' } ,
            {title: '재고', dataType: 'string', dataIndx: 'STOCK_QTY' } ,
            {title: '요청', dataType: 'string', dataIndx: 'OUT_QTY' } ,
            {title: '', dataType: 'string', dataIndx: 'OUT_YN',
                render: function(ui){
                    let returnVal = "";
                    if(ui.rowData.OUT_YN == 'Y') {
                        let returnVal = '<a href="#"><span class="ui-icon ui-icon-arrowthick-1-e"></span></a>';
                    }
                    return returnVal;
                }
            }
        ];

        let itemOrderRegisterPopTopColModel= [
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_TYPE_NM", id: "MATERIAL_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1035'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_KIND"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '상세종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', width: 80, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '요청<br>사항', dataType: 'string', dataIndx: 'REQUEST_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'M_ORDER_NOTE'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY' , validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_NM', width: 80, validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "M_COMP_NM", id: "M_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1007'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["M_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 80, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120, editable: false},
            {title: '원<br>발주량', dataType: 'string', dataIndx: 'ORDER_QTY ', editable: false}
        ];

        let itemOrderRegisterPopBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '전화번호', dataType: 'string', dataIndx: 'ITEM_QTY' }
        ];

        let itemOrderRegisterLeftToolbar = {
            items: [
                {
                    type: 'button', label: 'save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegister'];
                            fnModifyPQGrid(itemOrderRegisterLeftGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);
                        }
                    }
                },
                {
                    type: 'button', label: '도면 View', style: 'float: right;', listener: {
                        'click': function (evt, ui) {

                        }
                    }
                },
                {
                    type: 'button', label: '소재주문', style: 'float: left;', listener: {
                        'click': function () {
                            let rowDataArray = "";
                            let selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
                            for (let i = 0; i < selectedRowCount; i++) {
                                let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                                let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                                rowDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
                            }
                            let CONCAT_SEQ = rowDataArray.substr(0 , rowDataArray.length-1);
                            $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
                            $("#item_order_register_popup").modal('toggle');
                        }
                    }

                },
                {
                    type: 'button', label: '주문취소', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'checkbox', label: '보유소재 자동매칭', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            let hiddenYn = evt.target.checked == true ? 'Y' : 'N';
                            $("#item_order_register_hidden_form #AUTO_SEARCH").val(hiddenYn);
                        }
                    }
                },
                {
                    type: 'button', label: '보유소재 전체현황', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            royal_tab_api.add(0, true, '보유 소재 관리', '/static/material/in-warehouse-manage', true, '100043', '');
                        }
                    }
                }
            ]
        };
        let itemOrderRegisterRightToolbar = {
            items: [
                {
                    type: 'select',
                    cls: 'itemOrderRegisterWarehouseSelectBox',
                    label: '창고',
                    style: 'float: left;',
                    options: fnGetCommCodeGridToolbarSelectBox('1049', 'A'),
                    listener: {
                        'change': function () {
                            let text = $(".itemOrderRegisterWarehouseSelectBox option:selected").val();
                            $("#item_order_register_hidden_form #WAREHOUSE_CD").val(text);

                            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                            });
                            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'select',
                    cls: 'itemOrderRegisterMaterialDetailSelectBox',
                    label: '소재종류',
                    style: 'float: left;',
                    options: fnGetCommCodeGridToolbarSelectBox('1027', 'A'),
                    listener: {
                        'change': function () {
                            let text = $(".itemOrderRegisterMaterialDetailSelectBox option:selected").val();
                            $("#item_order_register_hidden_form #MATERIAL_DETAIL").val(text);

                            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                            });
                            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'select',
                    cls: 'itemOrderRegisterAreaSelectBox',
                    label: '넓이조건',
                    style: 'float: left;',
                    options: fnGetCommCodeGridToolbarSelectBox('1050', 'A'),
                    listener: {
                        'change': function () {
                            let text = $(".itemOrderRegisterAreaSelectBox option:selected").val();
                            $("#item_order_register_hidden_form #AREA").val(text);

                            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                            });
                            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'select',
                    cls: 'itemOrderRegisterTconditionSelectBox',
                    label: 'T 조건',
                    style: 'float: left;',
                    options: fnGetCommCodeGridToolbarSelectBox('1050', 'A'),
                    listener: {
                        'change': function () {
                            let text = $(".itemOrderRegisterTconditionSelectBox option:selected").val();
                            $("#item_order_register_hidden_form #CONDITION").val(text);

                            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                            });
                            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'button', label: 'save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (event, ui) {
                            let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
                            let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
                            if(CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !=''){
                                itemOrderRegisterRightGrid.pqGrid("updateRow", { 'rowIndx': itemOrderRegisterSelectedRowIndex , row: { 'CONTROL_SEQ': CONTROL_SEQ,'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ  } });
                                let itemOrderRegisterOutInsertUpdateQueryList = ['insertUpdateItemOrderRegisterOut'];
                                fnModifyPQGrid(itemOrderRegisterRightGrid, itemOrderRegisterOutInsertUpdateQueryList, itemOrderRegisterOutInsertUpdateQueryList);
                            }else{
                                alert("You must be select item.");
                                return;
                            }
                        }
                    }
                },
            ]
        };

        let itemOrderRegisterPopTopToolbar = {
            items: [
                {
                    type: 'button', label: 'Save & Submit', icon: 'ui-icon-mail-open', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();
                            let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
                            let totalRecords = data.length;
                            for(let tempI=0; tempI<totalRecords; tempI++){
                                itemOrderRegisterPopTopGrid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM } });
                            }
                            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegisterPopSave','updateItemOrderRegister'];
                            fnModifyPQGrid(itemOrderRegisterPopTopGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);

                            //$("#item_order_register_popup").modal('toggle');
                            $("#btnItemOrderRegisterSearch").trigger('click');
                            //itemOrderRegisterLeftGrid.pqGrid("refreshDataAndView");
                        }
                    }
                },
                {   type: 'textbox', label: '소재주문번호', style: 'float: left; font-size: 18px;', attr: 'id="item_order_register_material_order_num"',
                        value: function (evt, ui) {
                            let parameters = {'url': '/json-list', 'data': {'queryId': 'selectItemOrderRegisterNextMaterialOrderNum'}};
                            fnPostAjax(function (data, callFunctionParam) {
                                let list = data.list[0];
                                $("#item_order_register_material_order_num").val(list.MATERIAL_ORDER_NUM);
                            }, parameters, '');
                        }
                },
                {
                    type: 'button', label: '추가', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            itemOrderRegisterPopTopGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                }
            ]
        };

        let itemOrderRegisterPopBotToolbar = {
            items: []
        };

        function autoMerge(grid, refresh) {
            var mc = [],
                CM = grid.option("colModel"),
                i = CM.length,
                data = grid.option("dataModel.data");

            while (i--) {
                var dataIndx = CM[i].dataIndx,
                    rc = 1,
                    j = data.length;

                while (j--) {
                    var cd = data[j][dataIndx],
                        cd_prev = data[j - 1] ? data[j - 1][dataIndx] : undefined;
                    if (cd_prev !== undefined && cd == cd_prev) {
                        rc++;
                    }
                    else if (rc > 1) {
                        mc.push({ r1: j, c1: i, rc: rc, cc: 1 });
                        rc = 1;
                    }
                }
            }
            grid.option("mergeCells", mc);
            if (refresh) {
                grid.refreshView();
            }
        };

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
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: true,
            trackModel: {on: true},
            colModel: itemOrderRegisterLeftColModel,
            showTitle: false,
            title: false,
            strNoRows: g_noData,
            sort: function () {
                autoMerge(this, true);
            },
            complete: function(event, ui) {
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    itemOrderRegisterSelectedRowIndex = [];
                    let itemOrderRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let itemOrderRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (itemOrderRegisterGridFirstRow === itemOrderRegisterGridLastRow) {
                        itemOrderRegisterSelectedRowIndex[0] = itemOrderRegisterGridFirstRow;
                    } else {
                        for (let i = itemOrderRegisterGridFirstRow; i <= itemOrderRegisterGridLastRow; i++) {
                            itemOrderRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui) {
                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.addList[0].rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.addList[0].rowData.CONTROL_DETAIL_SEQ);
            },
            cellClick: function( event, ui) {
                itemOrderRegisterSelectedRowIndex = [];
                itemOrderRegisterSelectedRowIndex.push(ui.rowIndx);

                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.rowData.CONTROL_DETAIL_SEQ);

                let hiddenYn = $("#item_order_register_hidden_form #AUTO_SEARCH").val();
                if(hiddenYn == 'Y') {
                    $(".itemOrderRegisterMaterialDetailSelectBox").val(ui.rowData.MATERIAL_DETAIL);
                    $("#item_order_register_hidden_form #MATERIAL_DETAIL").val(ui.rowData.MATERIAL_DETAIL);
                    selectItemOrderRegisterRightList();
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
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: true,
                trackModel: {on: true},
                colModel: itemOrderRegisterRightColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData,
            });

            itemOrderRegisterRightGrid.pqGrid("refreshDataAndView");
        };

        $('#item_order_register_popup').on('hide.bs.modal', function() {
            itemOrderRegisterPopTopGrid.pqGrid( "destroy" );
            itemOrderRegisterPopBotGrid.pqGrid( "destroy" );
        });

        $('#item_order_register_popup').on('show.bs.modal',function() {
            let CONCAT_SEQ = $("#item_order_register_popup_form #CONCAT_SEQ").val();

            itemOrderRegisterPopTopGrid.pqGrid({
                width: "100%", height: 500,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('item_order_register_popup_form'),
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
                resizable: false,
                trackModel: {on: true},
                colModel: itemOrderRegisterPopTopColModel,
                showTitle: false,
            });

            itemOrderRegisterPopBotGrid.pqGrid({
                width: "100%", height: 150,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList'},
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                virtualX: true, virtualY: true,
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single', column: true } ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                colModel: itemOrderRegisterPopBotColModel,
                showTitle: false,
            });

        });

        /** 버튼 처리 **/
        $("#btnItemOrderRegisterSearch").on('click', function(){
            itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_search_form'));
            });
            itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
        });

        $("#btnItemOrderRegisterOrder").on('click', function(){
            let rowDataArray = "";
            let selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                rowDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
            }
            let CONCAT_SEQ = rowDataArray.substr(0 , rowDataArray.length-1);
            $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
            $("#item_order_register_popup").modal('toggle');
        });

        $("#btnItemOrderRegisterCancel").on('click', function(){

        });

        $("#btnItemOrderRegisterCurrentStock").on('click', function(){
            $("a[pid='100043']").trigger("click");
        });

        $("#chkItemOrderRegisterAutoMatching").on('change', function(evt){
            let hiddenYn = evt.target.checked == true ? 'Y' : 'N';
            $("#item_order_register_hidden_form #AUTO_SEARCH").val(hiddenYn);
        });

        $("#btnItemOrderRegisterDrawView").on('click', function(){

        });

        $("#btnItemOrderRegisterSave").on('click', function(){
            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegister'];
            fnModifyPQGrid(itemOrderRegisterLeftGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);
        });

        $("#btnItemOrderRegisterOutSave").on('click', function(){
            let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
            let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
            if(CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !=''){
                itemOrderRegisterRightGrid.pqGrid("updateRow", { 'rowIndx': itemOrderRegisterSelectedRowIndex , row: { 'CONTROL_SEQ': CONTROL_SEQ,'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ  } });
                let itemOrderRegisterOutInsertUpdateQueryList = ['insertUpdateItemOrderRegisterOut'];
                fnModifyPQGrid(itemOrderRegisterRightGrid, itemOrderRegisterOutInsertUpdateQueryList, itemOrderRegisterOutInsertUpdateQueryList);
            }else{
                alert("You must be select item.");
                return;
            }
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
    });
</script>