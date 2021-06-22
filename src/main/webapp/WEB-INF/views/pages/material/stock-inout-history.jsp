<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="stock_in_out_form" name="stock_in_out_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockInoutHistory">
            <input type="hidden" name="popType" id="popType" value="">
            <input type="hidden" name="V_INSIDE_STOCK_SEQ" id="V_INSIDE_STOCK_SEQ" value="">
            <div class="none_gubunWrap row3_topWrap" >
                <ul>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="INSIDE_STOCK_NUM">재고번호</label>
                            <input type="search" class="wd_200" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM" title="재고번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">비고</label>
                            <input type="search" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="비고">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <%--                        <span class="ipu_wrap">--%>
                        <%--                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재종류</label>--%>
                        <%--                            <input type="text" class="wd_200" name="SEL_MATERIAL_DETAIL" id="SEL_MATERIAL_DETAIL" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" readonly>--%>
                        <%--                        </span>--%>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_INOUT_WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="SEL_INOUT_WAREHOUSE_CD" name="SEL_INOUT_WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_INOUT_LOC_SEQ" class="label_100">재고위치</label>
                            <select id="SEL_INOUT_LOC_SEQ" name="SEL_INOUT_LOC_SEQ" title="재고위치" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <div class="slt_wrap">
                            <label class="label_100" for="SIZE_TYPE">규격</label>
                            <select class="wd_100" class="two" name="SIZE_TYPE" id="SIZE_TYPE">
                                <%--                            <select class="wd_100" class="two" name="SEL_SIZE_TYPE" id="SEL_SIZE_TYPE">--%>
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <span class="slt_wrap" id="SIZE_W">
                                <label class="label_8">W</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_F" id="SIZE_W_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_W_T" id="SIZE_W_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_H">
                                <label class="label_8">H</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_F" id="SIZE_H_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_H_T" id="SIZE_H_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_T">
                                <label class="label_8">T</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_F" id="SIZE_T_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_T_T" id="SIZE_T_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_D" style="display: none;">
                                <label class="label_8">D</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_F" id="SIZE_D_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_D_T" id="SIZE_D_T" placeholder="To" disabled>
                            </span>
                            <span class="slt_wrap" id="SIZE_L" style="display: none;">
                                <label class="label_8">L</label>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_F" id="SIZE_L_F" placeholder="From" disabled>
                                <span class="nbsp">~</span>
                                <input class="wd_50 for_diabled" type="number" name="SIZE_L_T" id="SIZE_L_T" placeholder="To" disabled>
                            </span>
                            <span class="gubun"></span>
                            <span class="slt_wrap">
                                <label class="label_100">수행일자</label>
                            </span>
                            <div class="calendar_wrap" style="padding-left: 0px;">
                                <span class="calendar_span">
                                    <input type="text" name="SEL_STOCK_ST_DT" id="SEL_STOCK_ST_DT" placeholder="" value="" title="시작날짜" readonly=""><button type="button">달력선택</button>
                                </span>
                                    <span class="nbsp">~</span>
                                    <span class="calendar_span">
                                    <input type="text" name="SEL_STOCK_END_DT" id="SEL_STOCK_END_DT" placeholder="" value="" title="종료날짜" readonly=""><button type="button">달력선택</button>
                                </span>
                            </div>
                        </div>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="STOCK_INOUT_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="stock_in_out_search_btn">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="search" id="stockInoutFilterKeyword" placeholder="Enter your keyword">
                <select id="stockInoutFilterColumn"></select>
                <select id="stockInoutFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="stockInoutFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="stockInoutFrozen" name="stockInoutFrozen">
                </select>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="stock_in_out_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="stock_in_out_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<form id="stock_inout_hidden_form" name="stock_inout_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="material.selectStockRequestList"/>
    <input type="hidden" id="MY_MAT_STOCK_SEQ" name="MY_MAT_STOCK_SEQ"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>
<input type="button" id="stockInoutFileUpload" style="display: none;">

<script>
    $(function () {
        'use strict';
        let testList = '<c:out value="${HighCode.H_1049}"/>';
        let listHigh = [];
        let listJson = {"WARE_HOUSE":[],"MATERIAL_TYPE":[],"LOC_SEQ":[],"ORDER_COMP_CD":[],"COMP_CD":[]};
        <c:forEach var="vlocale" items="${HighCode.H_1049}">
            var tmpJson = {
                "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
                "CODE_CD":"${vlocale.CODE_CD}"
            }
            listJson.WARE_HOUSE.push(tmpJson);
        </c:forEach>

        <c:forEach var="vlocale" items="${HighCode.H_1035}">
        var tmpJson = {
            "CODE_NM_KR" : "${vlocale.CODE_NM_KR}",
            "CODE_CD":"${vlocale.CODE_CD}"
        }
        listJson.MATERIAL_TYPE.push(tmpJson);
        </c:forEach>

        let selectedRowIndex = [];

        let stockInoutGridId01 = $("#stock_in_out_grid"); // 재고관리 메인 그리드
        let stockInoutColModel01;
        let stockInoutPostData01;
        var timer;

        let today = new Date();
        $('#SEL_STOCK_ST_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_STOCK_END_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#SEL_STOCK_ST_DT').datepicker('setDate', new Date(CURRENT_YEAR, CURRENT_MONTH, TODAY.getDate() - 7));
        $('#SEL_STOCK_END_DT').datepicker('setDate', 'today');

        /**  리스트 그리드 선언 시작 **/
        $("#stock_in_out_form").find("#queryId").val("material.selectInsideStockInoutHistory");
        stockInoutPostData01 = fnFormToJsonArrayData('#stock_in_out_form');
        stockInoutColModel01 = [
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: 'TYPE_CODE', dataType: 'string', dataIndx: 'TYPE_CODE', hidden: true},
            {title: 'SEQ', dataType: 'integer', dataIndx: 'SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '수행일시', dataType: 'string', dataIndx: 'INSERT_TIME', minWidth: 100, width: 100, editable: false},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 130, width: 130, editable: false},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1049') },
                postRender:function( ui ){
                    let WHC = ui.rowData.WAREHOUSE_CD;
                    if(typeof WHC != 'undefined' && WHC != null && WHC != '' && WHC.indexOf('WHR') < 0) {
                        $.each(listJson.WARE_HOUSE, function (idx,Item) {
                            if(Item.CODE_NM_KR.toUpperCase() == ui.rowData.WAREHOUSE_CD.toUpperCase()) {
                                ui.rowData.WAREHOUSE_CD = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '재고위치', dataType: 'string', dataIndx: 'LOC_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
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
                },
                postRender:function( ui ){
                    let LS = ui.rowData.LOC_SEQ;
                    let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                    if(typeof LS != 'undefined' && LS != null && LS != '') {
                        $.each(listJson.LOC_SEQ, function (idx,Item) {
                            if(Item.WAREHOUSE_CD == WAREHOUSE_CD && Item.text == ui.rowData.LOC_SEQ) {
                                ui.rowData.LOC_SEQ = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD',  minWidth: 110, width: 110,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({
                        "url" : '/json-list',
                        'data': {'queryId': 'dataSource.getOrderCompanyList'}
                    }),
                },
                editable: function (ui) {return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                postRender:function( ui ){
                    let ordercompcd = ui.rowData.ORDER_COMP_CD;
                    if(typeof ordercompcd != 'undefined' && ordercompcd != null && ordercompcd != '' && ordercompcd.indexOf('CMP') < 0) {
                        $.each(listJson.ORDER_COMP_CD, function (idx,Item) {
                            if(Item.CODE_NM.toUpperCase() == ui.rowData.ORDER_COMP_CD.toUpperCase()) {
                                ui.rowData.ORDER_COMP_CD = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 100, width: 100,
                editable: function (ui) { return gridCellEditable(ui);},
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',editable: function (ui) { return gridCellEditable(ui);},
                minWidth: 100, width: 100,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 170, width: 170,
                editable: function (ui) { return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
            },
            {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}})
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ],
                postRender:function( ui ){
                    let cmpCd = ui.rowData.COMP_CD;
                    if(typeof cmpCd != 'undefined' && cmpCd != null && cmpCd != '' && cmpCd.indexOf('CMP') < 0) {
                        $.each(listJson.COMP_CD, function (idx,Item) {
                            if(Item.CODE_NM.toUpperCase() == ui.rowData.COMP_CD.toUpperCase()) {
                                ui.rowData.COMP_CD = Item.CODE_CD;
                            }
                        })
                    }
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 100, width: 100, editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {title: '구분', dataType: 'string', dataIndx: 'TYPE', minWidth: 40, width: 40,
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: false,
            },
            {title: '수량', dataType: 'integer', dataIndx: 'QTY', format: '#,###', editable: false},
            {
                title: '연계 작업번호', align: 'center', editable: false,
                colModel: [
                    {title: '작업번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 140, width: 140, editable: false},
                    {title: '요청수량', dataType: 'integer', dataIndx: 'REQUEST_QTY', editable: false}
                ]
            },
            {title: '', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN_OUT', minWidth: 60, width: 60,
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: false,
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    if(rowData.LATEST_YN == '1') {
                        return '<button type="button" class="miniBtn black" id="INSIDE_STOCK_QTY_CANCEL_ACTION">취소</button>';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#INSIDE_STOCK_QTY_CANCEL_ACTION').bind('click', function(e) {
                        e.preventDefault();

                        let parameters = {
                            'url': '/json-info',
                            'data': {"SEQ":rowData.SEQ, "INSIDE_STOCK_SEQ":rowData.INSIDE_STOCK_SEQ, "queryId":"material.selectInsideStockCheckIn"}
                        };
                        if(rowData.TYPE_CODE == 'OUT') {
                            parameters.data.queryId = "material.selectInsideStockCheckOut";
                        }
                        fnPostAjax(function (data, callFunctionParam) {
                            console.log(data);
                            if(data.info != null && data.info.flag == 1) {

                                let parameters2 = {
                                    'url': '/cancelInsideStock',
                                    'data': rowData
                                };
                                fnPostAjax(function (data, callFunctionParam) {
                                    console.log(data);
                                    if(data.flag) {
                                        fnAlert(null, "오류가 발생하였습니다.");
                                    }else {
                                        fnAlert(null, "취소 처리 되었습니다.");
                                        $("#stock_in_out_search_btn").trigger('click');
                                    }
                                }, parameters2, '');
                            }else {
                                fnAlert(null, "취소 불가합니다.");
                            }
                        }, parameters, '');
                    });
                }
            },
        ];
        stockInoutGridId01.pqGrid({
            height: 700,
            postRenderInterval: -1, //call postRender synchronously.
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_in_out_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: stockManageFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'single'} ,
            selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            copyModel: {render: true},
            colModel: stockInoutColModel01,
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
                $("#stockInoutFilterColumn").empty();
                $("#stockInoutFilterColumn").html(filterOpts);
                $("#stockInoutFrozen").empty();
                $("#stockInoutFrozen").html(frozenOts);
            },
            cellSave: function (evt, ui) {
                if (ui.dataIndx == "WAREHOUSE_CD_NM" && ui.newVal !== ui.oldVal) {
                    stockInoutGridId01.pqGrid("updateRow", { 'rowIndx': ui.rowIndx , row: { 'LOC_SEQ_NM': '' } });
                }
            },
            complete: function () {
                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            },
            /*rowSelect: function (event, ui) {
                selectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    selectedRowIndex.push(selectList[i].rowIndx);
                }
            },*/
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
            },
            change: function (evt, ui) {
                if(ui.source == "edit") {
                    let WAREHOUSE_CD = ui.updateList[0].newRow.WAREHOUSE_CD == undefined ? "" : ui.updateList[0].newRow.WAREHOUSE_CD;
                    if(WAREHOUSE_CD != "") {
                        let rowIndx = ui.updateList[0].rowIndx;
                        stockInoutGridId01.pqGrid('updateRow', {rowIndx: rowIndx, row: {"LOC_SEQ": ""}});
                    }
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                /*if (ui.dataIndx == 'DXF_GFILE_SEQ') {
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.DXF_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockInoutGridId01, rowIndx, 'DXF_GFILE_SEQ');
                    }

                    return;
                }
                if (ui.dataIndx == 'IMG_GFILE_SEQ') {

                    if (ui.rowData['IMG_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockInoutGridId01, rowIndx, 'IMG_GFILE_SEQ');
                    }

                    return;
                }*/
            }
            // ,cellClick: function (event, ui) {
            //     let rowIndx = ui.rowIndx, $grid = this;
            //     if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_IN') {//입고
            //             $("#stock_in_out_form").find("#popType").val("GRID_IN");
            //             $("#stock_in_out_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData['INSIDE_STOCK_NUM']);
            //             $('#stock_manage_pop').modal('show');
            //         }
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_OUT') {//출고
            //
            //             if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
            //                 alert("출고할 재고수량이 없습니다.");
            //             }else{
            //                 $("#stock_in_out_form").find("#popType").val("GRID_OUT");
            //                 $("#stock_in_out_form").find("#V_INSIDE_STOCK_SEQ").val(ui.rowData['INSIDE_STOCK_NUM']);
            //                 $('#stock_manage_pop').modal('show');
            //             }
            //         }
            //     }
            // }
        });
        /**  현황관리(GRID01) 그리드 선언 끝 **/

        let gridCellEditable = function(ui){
            let rowData = stockInoutGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let INSIDE_STOCK_NUM = rowData["INSIDE_STOCK_NUM"];
            if (INSIDE_STOCK_NUM == null || INSIDE_STOCK_NUM == "" || INSIDE_STOCK_NUM== "undefined" || INSIDE_STOCK_NUM== undefined) {
                return true;
            }else{
                return false;
            }
        }

        $("#stock_in_out_search_btn").on('click', function () {
            let SEL_SIZE_SEARCH_TYPE = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE_E_1 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val();
            let SEL_SIZE_SEARCH_TYPE_E_2 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val();
            let SEL_SIZE_SEARCH_TYPE_E_3 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_1 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val();
            let SEL_SIZE_SEARCH_TYPE_R_2 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val();
            let SEL_SIZE_SEARCH_TYPE_R_3 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_4 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val();
            let SEL_SIZE_SEARCH_TYPE_R_5 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val();
            let SEL_SIZE_SEARCH_TYPE_R_6 = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val();

            if(SEL_SIZE_SEARCH_TYPE == "1") {//Range
                if (SEL_SIZE_SEARCH_TYPE_R_1 == "" || SEL_SIZE_SEARCH_TYPE_R_2 == "" || SEL_SIZE_SEARCH_TYPE_R_3 == ""
                    || SEL_SIZE_SEARCH_TYPE_R_4 == "" || SEL_SIZE_SEARCH_TYPE_R_5 == "" || SEL_SIZE_SEARCH_TYPE_R_6 == "") {
                    fnAlert(null, "Range 검색을 선택하셨습니다.\n구간 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                if (SEL_SIZE_SEARCH_TYPE_E_1 == "" || SEL_SIZE_SEARCH_TYPE_E_2 == "" || SEL_SIZE_SEARCH_TYPE_E_3 == "") {
                    fnAlert(null, "Equal 검색을 선택하셨습니다.\n각 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }


            stockInoutGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_in_out_form');
            } );
            stockInoutGridId01.pqGrid("refreshDataAndView");

        });

        $("#stock_in_out_form").find("#SEL_SIZE_TYPE").change(function(){
            resetSelSizeVal("1");
            displaySelSize();
        });
        $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").change(function(){
            resetSelSizeVal("2");
            displaySelSize();
        });
        let displaySelSize = function(type){
            let SEL_SIZE_TYPE = $("#stock_in_out_form").find("#SEL_SIZE_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE = $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").val();

            if(SEL_SIZE_TYPE == ""){
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
            }else if(SEL_SIZE_TYPE =="MSS010"){//일반
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").show();
            }else if(SEL_SIZE_TYPE =="MSS020" || SEL_SIZE_TYPE =="MSS030" || SEL_SIZE_TYPE =="MSS040"){
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").hide();
            }


            if(SEL_SIZE_SEARCH_TYPE == ""){
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "1"){//Range
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R").show();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E").show();
            }
        }
        let resetSelSizeVal = function(type){
            if(type == "1"){
                $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE").val("");
            }
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val("");
            $("#stock_in_out_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val("");

        }

        fnCommCodeDatasourceSelectBoxCreate($('#stock_in_out_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_in_out_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        // fnCommCodeDatasourceSelectBoxCreate($('#stock_in_out_form').find('#SEL_INOUT_LOC_SEQ'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}
        // });

        let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getLocationListWithWarehouse'}};
        fnPostAjaxAsync(function(data){
            let optText1 = "<option value=''><spring:message code='com.form.top.all.option'/></option>";

            $.each(data.list,function (idx,Item) {
                optText1 += "<option class='dep2 "+Item.WAREHOUSE_CD +"' value='" + Item.value + "' >" + Item.CODE_NM +"</option>"
            });
            $("#SEL_INOUT_LOC_SEQ").html(optText1);
            listJson.LOC_SEQ = data.list;
        }, parameters, '');

        let parameters2 = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};
        fnPostAjaxAsync(function(data){
            listJson.ORDER_COMP_CD = data.list;
        }, parameters2, '');

        let parameters3 = {'url': '/json-list', 'data': {'queryId': 'dataSource.getBusinessCompanyList'}};
        fnPostAjaxAsync(function(data){
            listJson.COMP_CD = data.list;
        }, parameters3, '');

        $("#SEL_INOUT_WAREHOUSE_CD").on('change', function () {
            $("#stock_in_out_form").find('.dep2').hide();
            $('#SEL_INOUT_LOC_SEQ').prop('selectedIndex', 0);
            if($(this).val() != '') {
                $('#SEL_INOUT_LOC_SEQ').attr('disabled',false);
                $('#SEL_INOUT_LOC_SEQ > .' + $(this).val()).show();
            }else {
                $("#SEL_INOUT_LOC_SEQ").attr('disabled',true);
            }
        });

        // 소재종류
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1027}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#stock_in_out_form').find('#SEL_MATERIAL_DETAIL').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();


        $('#stockInoutFileUpload').on('click', function () {
            $("#stock_in_out_search_btn").trigger('click');
        });

        /** 그리드 필터 **/
        $('#stockInoutFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler(stockInoutGridId01, 'stockInoutFilterKeyword', 'stockInoutFilterCondition', 'stockInoutFilterColumn');

                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            },
            'search': function () {
                fnFilterHandler(stockInoutGridId01, 'stockInoutFilterKeyword', 'stockInoutFilterCondition', 'stockInoutFilterColumn');

                let data = stockInoutGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_in_out_grid_records').html(totalRecords);
            }
        });

        $("#stockInoutFrozen").on('change', function(e){
            fnFrozenHandler(stockInoutGridId01, $(this).val());
        });

        function stockManageFilterRender(ui) {
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
                var condition = $("#stockInoutFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#stockInoutFilterKeyword").val(),
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

        $('#STOCK_INOUT_EXCEL_EXPORT').on('click', function () {
            const blob = stockInoutGridId01.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '재고 관리.xlsx');
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }
        $('#stock_in_out_form').find('#SIZE_TYPE').on('change', function () {
            const $stockInoutForm = $('#stock_in_out_form');
            $stockInoutForm.find('.for_diabled').attr('disabled',false);
            let resetArr = [];

            switch (this.value) {
                case 'XYZ010':
                    resetArr = ['SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('#SIZE_W').show();
                    $stockInoutForm.find('#SIZE_H').show();
                    $stockInoutForm.find('#SIZE_T').show();
                    $stockInoutForm.find('#SIZE_D').hide();
                    $stockInoutForm.find('#SIZE_L').hide();
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('#SIZE_W').hide();
                    $stockInoutForm.find('#SIZE_H').hide();
                    $stockInoutForm.find('#SIZE_T').hide();
                    $stockInoutForm.find('#SIZE_D').show();
                    $stockInoutForm.find('#SIZE_L').show();
                    break;
                default:
                    $stockInoutForm.find('#SIZE_W').show();
                    $stockInoutForm.find('#SIZE_H').show();
                    $stockInoutForm.find('#SIZE_T').show();
                    $stockInoutForm.find('#SIZE_D').hide();
                    $stockInoutForm.find('#SIZE_L').hide();
                    resetArr = ['SIZE_W_F','SIZE_W_T','SIZE_H_F','SIZE_H_T','SIZE_T_F','SIZE_T_T','SIZE_D_F','SIZE_D_T','SIZE_L_F','SIZE_L_T']
                    resetInput($stockInoutForm,resetArr)
                    $stockInoutForm.find('.for_diabled').attr('disabled',true);
            }
        });
    });
</script>
