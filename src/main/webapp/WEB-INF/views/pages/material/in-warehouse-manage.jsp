<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="page-context">
    <div class="row m-b-md">
        <div class="col-sm-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    소재 주문 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="in_warehouse_manage_search_form" name="in_warehouse_manage_search_form" role="form">
                        <input type="hidden" id="queryId" name="queryId" value="selectInWarehouseManageList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="WAREHOUSE">창고</label>
                                <select id="WAREHOUSE" name="WAREHOUSE" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="LOC_NM">위치</label>
                                <select id="LOC_NM" name="LOC_NM" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MATERIAL_KIND">소재형태</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="SIZE">소재규격</label>
                                    <select id="SIZE" name="SIZE" data-required="true" class="form-control parsley-validated">
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="row">
                                        <label class="control-label" for="SIZE_W">가로</label>
                                        <input type="text" class="form-control" id="SIZE_W" placeholder="" size="2">~
                                        <input type="text" class="form-control" id="SIZE_W" placeholder="" size="2">
                                    </div>
                                    <div class="row">
                                        <label class="control-label" for="SIZE_W">가로</label>
                                        <input type="text" class="form-control" id="SIZE_W" placeholder="" size="2">
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="row">
                                        <label class="control-label" for="SIZE_H">세로</label>
                                        <input type="text" class="form-control" id="SIZE_H" placeholder=""size="2">
                                    </div>
                                    <div class="row">
                                        <label class="control-label" for="SIZE_H">세로</label>
                                        <input type="text" class="form-control" id="SIZE_H" placeholder=""size="2">
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <div class="row">
                                        <label class="control-label" for="SIZE_D">두께</label>
                                        <input type="text" class="form-control" id="SIZE_D" placeholder=""size="2">
                                    </div>
                                    <div class="row">
                                        <label class="control-label" for="SIZE_W">두께</label>
                                        <input type="text" class="form-control" id="SIZE_D" placeholder=""size="2">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-6 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default">SEARCH</div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="in_warehouse_manage_top_grid" class="jqx-refresh"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="in_warehouse_manage_bot_grid" class="jqx-refresh"></div>
        </div>
    </div>
</div>

<form id="item_order_history_hidden_form" name="item_order_history_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderHistoryListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>

<form id="item_order_history_inspection_hidden_form" name="item_order_history_inspection_hidden_form">
</form>

<script type="text/javascript">
    'use strict';
    let inWarehouseManageSelectedRowIndex;
    let inWarehouseManageTopGrid = $("#in_warehouse_manage_top_grid");
    let inWarehouseManageBotGrid = $("#in_warehouse_manage_bot_grid");

    $(function () {
        let inWarehouseManageTopColModel= [
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', width: 120 } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', width: 80 } ,
            {title: '소재종류상세', dataType: 'string', dataIndx: 'MATERIAL_TYPE' } ,
            {title: '가로', dataType: 'date', dataIndx: 'SIZE_W', width: 120 },
            {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'  },
            {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T' },
            {title: '지름(D)', dataType: 'string', dataIndx: 'SIZE_D'},
            {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L'},
            {title: '보유수량', dataType: 'string', dataIndx: 'STOCK_QTY' },
            {title: '상세위치', dataType: 'string', dataIndx: 'LOC_NM' },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE' },
            {title: '입고', dataType: 'string', dataIndx: 'IN_QTY' },
            {title: '불출요청', dataType: 'string', dataIndx: '' }
        ];

        let inWarehouseManageBotColModel= [
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_SEQ' },
            {title: '형태', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ' },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ' },
            {title: '불출대기 목록', align: "center", colModel: [
                    {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                    {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                    {title: '두께(T)', dataType: 'string', dataIndx: 'SIZE_T'},
                    {title: '파이', dataType: 'string', dataIndx: 'SIZE_D'},
                    {title: '길이(L)', dataType: 'string', dataIndx: 'SIZE_L'},
                ]},
            {title: '요청수량', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD', width: 80 , editable: false} ,
            {title: '창고', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '위치', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '주문번호', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: '요청일시', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120, editable: false},
            {title: '요청자', dataType: 'string', dataIndx: 'ORDER_QTY' , editable: false},
            {title: '수동 불출', dataType: 'string', dataIndx: 'ORDER_NOTE', editable: false}
        ];

        let inWarehouseManageTopToolbar = {
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
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
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
            ]
        };
        let inWarehouseManageBotToolbar = {
            items: []
        };

        inWarehouseManageTopGrid.pqGrid({
            width: "100%", height: 400,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
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
            resizable: true,
            trackModel: {on: true},
            colModel: inWarehouseManageTopColModel,
            toolbar: inWarehouseManageTopToolbar,
            sort: function () {
                autoMerge(this);
            },
            complete: function(event, ui) {
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
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let MATERIAL_ORDER_NUM = ui.addList[0].rowData.MATERIAL_ORDER_NUM;
                let MATERIAL_COMP_CD = ui.addList[0].rowData.MATERIAL_COMP_CD;
                $("#item_order_history_hidden_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                $("#item_order_history_hidden_form #MATERIAL_COMP_CD").val(MATERIAL_COMP_CD);
                selectInWarehouseManageBotList();
                //}
            }
        });

        selectInWarehouseManageBotList();

        function selectInWarehouseManageBotList() {
            inWarehouseManageBotGrid.pqGrid({
                width: "100%", height: 200,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_history_hidden_form'),
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
                colModel: inWarehouseManageBotColModel,
                toolbar: inWarehouseManageBotToolbar
            });

            inWarehouseManageBotGrid.pqGrid("refreshDataAndView");
        };

        $("#btnItemOrderRegisterSearch").on('click', function(){
            inWarehouseManageTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_warehouse_manage_search_form'));
            });
            inWarehouseManageTopGrid.pqGrid('refreshDataAndView');
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#in_warehouse_manage_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#in_warehouse_manage_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

    });

    $(document).on('click', '#item_order_history_inspection_check', function(event){
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
            inWarehouseManageBotGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_history_hidden_form'));
            });
            inWarehouseManageBotGrid.pqGrid('refreshDataAndView');
        }, parameters, '');
    });
</script>