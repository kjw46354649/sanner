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

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-sm-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    소재 주문 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="item_order_register_search_form" name="item_order_register_search_form" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="selectItemOrderRegisterList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="COMP_CD">사업자</label>
                                <select id="COMP_CD" name="COMP_CD" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_COMP_CD">발주사</label>
                                <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MODULE_NM">견적번호</label>
                                <input type="password" class="form-control" id="MODULE_NM" placeholder="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ITEM_NM">품명</label>
                                <input type="password" class="form-control" id="ITEM_NM" placeholder="">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MANAGE_NUM">관리번호</label>
                                <input type="email" class="form-control" id="MANAGE_NUM" placeholder="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DRAWING_NUM">소재주문번호</label>
                                <input type="password" class="form-control" id="DRAWING_NUM" placeholder="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_COMP_CD">소재주문업체</label>
                                <input type="password" class="form-control" id="M_ORDER_COMP_CD" placeholder="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MATERIAL_DETAIL">소재종류</label>
                                <input type="password" class="form-control" id="MATERIAL_DETAIL" placeholder="">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_STAFF_NM">Option</label>
                                <input type="email" class="form-control" id="SEL_STAFF_NM" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <select id="SEARCH_DATE" name="SEARCH_DATE" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HighCode.H_10002}">
                                        <option value="${code.CODE_CD}" >${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                                <input type="password" class="form-control" id="SEL_CEO_NM" placeholder="">
                            </div>
                            <div class="form-group col-md-4 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default" id="btnItemOrderRegisterSearch">SEARCH</div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <%--<div class="row">
            <a href="#item-order-register_record_popup" class="" id="estimatePopupOpen" data-target="" data-toggle="modal" data-refform="item-order-register_record_popup">
                <input type="button" value="POP">
            </a>
        </div>--%>
        <div class="row">
            <div class="col-md-9">
                <div id="item_order_register_left_grid" class="jqx-refresh"></div>
            </div>
            <div class="col-md-3">
                <div id="item_order_register_right_grid" class="jqx-refresh"></div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_register_hidden_form" name="item_order_register_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterPopList"/>
    <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
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
                    //options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}}),
                    options: fnGetCommCodeGridSelectBox('1007'),
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
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1004'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', width: 70,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1000'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                            type: 'multiple',
                            mapIndices: { name: "REQUEST_CD", id: "REQUEST_CD" },
                            cls: 'item_order_register_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1018'),
                            attr: 'multiple',
                            init: function(ui){
                                console.log(ui.rowData.REQUEST_CD);
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
                                let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                    {title: '소재<br>Size', dataType: 'string', dataIndx: ''},
                    {title: '수량', dataType: 'string', dataIndx: ''},
                    {title: '', dataType: 'string', dataIndx: '',
                        render: function(ui){
                            return '<input type="button" value="reset"/>';
                        }
                    },
                    {title: '불출', dataType: 'string', dataIndx: ''},
                ]},
            {title: '비고', dataType: 'string', dataIndx: 'DTL_AMOUNT'},
            {title: '주문<br>요청 일시', dataType: 'date', dataIndx: 'M_ORDER_DT', editable: false}
        ];

        let itemOrderRegisterRightColModel= [
            {title: '창고명', dataType: 'string', dataIndx: 'EST_SEQ' } ,
            {title: '소재종류', dataType: 'string', dataIndx: 'SEQ' } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' } ,
            {title: 'Size(mm)', dataType: 'string', dataIndx: 'ITEM_NM' } ,
            {title: '재고', dataType: 'string', dataIndx: 'DRAWING_NUM' } ,
            {title: '요청', dataType: 'string', dataIndx: 'PART_NUM' } ,
            {title: '', dataType: 'string', dataIndx: '',
                render: function(ui){
                    return '<a href="#"><span class="ui-icon ui-icon-arrowthick-1-e"></span></a>';
                }
            }
        ];

        let itemOrderRegisterPopTopColModel= [
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: false},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_TYPE' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_TYPE_NM", id: "MATERIAL_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1001'),
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
                    options: fnGetCommCodeGridSelectBox('1004'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_KIND"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '상세종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1000'),
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
                            $("#item_order_register_hidden_form #CONCAT_SEQ").val(CONCAT_SEQ);
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
                    type: 'button', label: '보유소재 자동매칭', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'button', label: '보유소재 전체현황', style: 'float: left;', listener: {
                        'click': function (evt, ui) {

                        }
                    }
                }
            ]
        };
        let itemOrderRegisterRightToolbar = {
            items: [
                {   type: 'select', label: '창고', style: 'float: center;', option: fnGetCommCodeGridSelectBox('1045')   },
                {   type: 'select', label: '소재종류', style: 'float: center;', option: fnGetCommCodeGridSelectBox('1045')   },
                {   type: 'select', label: '넓이조건', style: 'float: center;', option: fnGetCommCodeGridSelectBox('1045')   },
                {   type: 'select', label: 'T 조건', style: 'float: center;', option: fnGetCommCodeGridSelectBox('1045')   },
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
                            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegisterPopSave'];
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
            width: "100%", height: 500,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'CONTROL_DETAIL_SEQ',
                url: "/paramQueryGridSelect",
                //postData: fnFormToJsonArrayData(),
                //postData: { 'queryId': 'selectItemOrderRegisterList'},
                postData: fnFormToJsonArrayData('#item_order_register_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            //selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: itemOrderRegisterLeftColModel,
            toolbar: itemOrderRegisterLeftToolbar,
            sort: function () {
                autoMerge(this);
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
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let EST_SEQ = ui.addList[0].rowData.EST_SEQ;
                let EST_VER = ui.addList[0].rowData.EST_VER;
                $("#item-order-register_hidden_form #EST_SEQ").val(EST_SEQ);
                $("#item-order-register_hidden_form #EST_VER").val(EST_VER);
                $("#item-order-register_excel_download #paramData").val(EST_SEQ);
                selectEstimateRightList(EST_SEQ);
                //}
            }
        });

        selectEstimateRightList('', '');

        function selectEstimateRightList(EST_SEQ) {
            itemOrderRegisterRightGrid.pqGrid({
                width: "100%", height: 500,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    //postData: fnFormToJsonArrayData(),
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_SEQ': EST_SEQ},
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
                trackModel: {on: true},
                //resizable: true,
                colModel: itemOrderRegisterRightColModel,
                toolbar: itemOrderRegisterRightToolbar
            });

            itemOrderRegisterRightGrid.pqGrid("refreshDataAndView");
        };

        $('#item_order_register_popup').on('hide.bs.modal', function() {
            itemOrderRegisterPopTopGrid.pqGrid( "destroy" );
            itemOrderRegisterPopBotGrid.pqGrid( "destroy" );
        });

        $('#item_order_register_popup').on('show.bs.modal',function() {
            let CONCAT_SEQ = $("#item_order_register_hidden_form #CONCAT_SEQ").val();

            itemOrderRegisterPopTopGrid.pqGrid({
                width: "100%", height: 500,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('item_order_register_hidden_form'),
                    //postData: { 'queryId': 'selectItemOrderRegisterPopList', 'CONCAT_SEQ' : CONCAT_SEQ },
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
                toolbar: itemOrderRegisterPopTopToolbar
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
                toolbar: itemOrderRegisterPopBotToolbar
            });

            itemOrderRegisterPopTopGrid.pqGrid("refreshDataAndView");
            itemOrderRegisterPopBotGrid.pqGrid("refreshDataAndView");

        });

        $("#btnItemOrderRegisterSearch").on('click', function(){
            itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_search_form'));
            });
            itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
        });
        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
    });


</script>