<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-05-15
  Time: 오전 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="page estimate">
    <div class="bottomWrap full_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_30Wrap">
                    <div class="buttonWrap right_sort">
                        <span class="d-inline">
                            <button type="button" class="defaultBtn radius" id="btnOrderStatusExcel">주문서 출력</button>
                            <button type="button" class="defaultBtn radius red" id="btnOrderStatusCancel">주문취소</button>
                        </span>
                    </div>
                    <div class="conMainWrap">
                        <div id="order_status_left_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="order_status_left_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
                <div class="right_60Wrap">
                    <div class="buttonWrap">
                        <div class="right_sort">
                            <button type="button" class="defaultBtn radius green" id="btnOrderStatusSave">검사 입고</button>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="order_status_right_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="order_status_right_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="order_status_hidden_form" name="order_status_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectOrderStatusListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>

<form id="order_status_inspection_hidden_form" name="order_status_inspection_hidden_form">
</form>

<script type="text/javascript">
    'use strict';
    let OrderStatusSelectedRowIndex;
    let OrderStatusLeftGrid = $("#order_status_left_grid");
    let OrderStatusRightGrid = $("#order_status_right_grid");

    $(function () {
        let OrderStatusLeftColModel= [
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 } ,
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_NM', width: 80 } ,
            {title: '총수량', dataType: 'string', dataIndx: 'ORDER_QTY' } ,
            {title: '주문일시', dataType: 'date', dataIndx: 'ORDER_DT', width: 120 },
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD' , hidden: true}
        ];

        let OrderStatusRightColModel= [
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120 , editable: false} ,
            {title: '주문업체', dataType: 'string', dataIndx: 'MATERIAL_COMP_CD', width: 80 , editable: false} ,
            {title: '소재종류', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '형태', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '상세종류', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: '소재Size', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120, editable: false},
            {title: '주문', dataType: 'string', dataIndx: 'ORDER_QTY' , editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'ORDER_NOTE', editable: false},
            {title: '금액.', dataType: 'string', dataIndx: 'ORDER_AMT '},
            {title: '수입검사', dataType: 'string', align: "center", colModel: [
                    {title: '소재', dataType: 'string', dataIndx: 'INSPECT_MATERIAL_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_MATERIAL_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="order_status_inspection_check">' +
                                '   <span data-col="INSPECT_MATERIAL_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                    {title: '외관', dataType: 'string', dataIndx: 'INSPECT_SURFACE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_SURFACE_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="order_status_inspection_check">' +
                                '   <span data-col="INSPECT_SURFACE_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                    {title: '치수', dataType: 'string', dataIndx: 'INSPECT_SIZE_YN', editable: false,
                        render: function(ui){
                            let icon = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'ui-icon-check' : 'ui-icon-closethick';
                            let returnVal = ui.rowData.INSPECT_SIZE_YN == 'Y' ? 'N' : 'Y';
                            let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ;
                            return '<a href="#" id="order_status_inspection_check">' +
                                '   <span data-col="INSPECT_SIZE_YN" data-val="'+returnVal+'" data-seq="'+MATERIAL_ORDER_SEQ+'" class="ui-icon '+icon+'"></span></a>';
                        }
                    },
                ]},
            {title: '검사 비고', dataType: 'string', dataIndx: 'INSPECT_NOTE'},
            {title: '입고', dataType: 'string', dataIndx: '', width: 80, editable: false,
                render: function(ui){
                    return '<a href="#"><span class="ui-icon ui-icon-closethick"></span></a>';
                }
            },
            {title: '입고 일시', dataType: 'string', dataIndx: 'IN_DT', editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: '', editable: false}
        ];

        let OrderStatusLeftToolbar = {
            items: [
                {
                    type: 'button', label: '주문취소', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                }
            ]
        };
        let OrderStatusRightToolbar = {
            items: [
                {
                    type: 'button', label: 'Save', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                },
                {
                    type: 'button', label: '주문서출력', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                        }
                    }
                }
            ]
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

        OrderStatusLeftGrid.pqGrid({
            height: '100%',
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROW_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#order_status_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            scrollModel: {autoFit: false},
            rowHtHead: 15,
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: OrderStatusLeftColModel,
            showTitle: false,
            title: false,
            sort: function () {
                autoMerge(this);
            },
            complete: function(event, ui) {
                this.flex();
                let data = OrderStatusLeftGrid.pqGrid('option', 'dataModel.data');

                $('#order_status_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    OrderStatusSelectedRowIndex = [];
                    let OrderStatusGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let OrderStatusGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (OrderStatusGridFirstRow === OrderStatusGridLastRow) {
                        OrderStatusSelectedRowIndex[0] = OrderStatusGridFirstRow;
                    } else {
                        for (let i = OrderStatusGridFirstRow; i <= OrderStatusGridLastRow; i++) {
                            OrderStatusSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let MATERIAL_ORDER_NUM = ui.addList[0].rowData.MATERIAL_ORDER_NUM;
                let MATERIAL_COMP_CD = ui.addList[0].rowData.MATERIAL_COMP_CD;
                $("#order_status_hidden_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                $("#order_status_hidden_form #MATERIAL_COMP_CD").val(MATERIAL_COMP_CD);
                selectOrderStatusRightList();
                //}
            }
        });

        selectOrderStatusRightList();

        function selectOrderStatusRightList() {
            OrderStatusRightGrid.pqGrid({
                height: '100%',
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROW_NUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#order_status_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: true},
                rowHtHead: 15,
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                //resizable: false,
                colModel: OrderStatusRightColModel,
                showTitle: false,
                title: false,
                complete: function(event, ui) {
                    this.flex();
                    let data = OrderStatusRightGrid.pqGrid('option', 'dataModel.data');

                    $('#order_status_right_grid_records').html(data.length);
                },
            });

            OrderStatusRightGrid.pqGrid("refreshDataAndView");
        };

        $("#btnItemOrderRegisterSearch").on('click', function(){
            OrderStatusLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#order_status_search_form'));
            });
            OrderStatusLeftGrid.pqGrid('refreshDataAndView');
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#order_status_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#order_status_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

    });

    $(document).on('click', '#order_status_inspection_check', function(event){
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
        queryElement.setAttribute("value", "updateOrderStatusInspection");

        seqElement.type = "hidden";
        seqElement.id = "MATERIAL_ORDER_SEQ";
        seqElement.name = "MATERIAL_ORDER_SEQ";
        seqElement.setAttribute("value", seq);

        $("#order_status_inspection_hidden_form").empty();
        $("#order_status_inspection_hidden_form").append(valueElement);
        $("#order_status_inspection_hidden_form").append(queryElement);
        $("#order_status_inspection_hidden_form").append(seqElement);

        let parameters = {'url': '/json-update', 'data': $("#order_status_inspection_hidden_form").serialize()};
        fnPostAjax(function (data, callFunctionParam) {
            OrderStatusRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#order_status_hidden_form'));
            });
            OrderStatusRightGrid.pqGrid('refreshDataAndView');
        }, parameters, '');
    });
</script>