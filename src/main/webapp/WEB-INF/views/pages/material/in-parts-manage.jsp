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
                    <form class="form-inline" id="in_part_manage_search_form" name="in_part_manage_search_form" role="form">
                        <input type="hidden" id="queryId" name="queryId" value="selectItemOrderHistoryList">
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
                                <label class="control-label" for="MATERIAL_DETAIL">자재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MATERIAL_KIND">자제상세종류</label>
                                <select id="MATERIAL_KIND" name="MATERIAL_KIND" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MANAGE_NUM">자재 관리번호</label>
                                <input type="email" class="form-control" id="MANAGE_NUM" placeholder="">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DRAWING_NUM">자재명</label>
                                <input type="password" class="form-control" id="DRAWING_NUM" placeholder="">
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
    <div id="in_parts_manage_tabs">
        <div class="row">&nbsp;
            <ul class="nav nav-tabs m-b-n-xxs">
                <li class="active">
                    <a href="#IN_PARTS_MANAGE_TAB1" data-toggle="tab" aria-expanded="true">현황관리</a>
                </li>
                <li class="">
                    <a href="#IN_PARTS_MANAGE_TAB2" data-toggle="tab" aria-expanded="false">불출이력</a>
                </li>
            </ul>
            <div class="panel panel-default tab-content">
                <ul class="list-group tab-pane active" id="IN_PARTS_MANAGE_TAB1">
                    <div id="in_parts_manage_tab01_grid"></div>
                </ul>
                <ul class="list-group tab-pane list-group-alt list-group-lg" id="IN_PARTS_MANAGE_TAB2">
                    <div id="in_parts_manage_tab02_grid"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<form id="in_parts_manage_hidden_form" name="in_parts_manage_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderHistoryListDetail"/>
    <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
    <input type="hidden" id="MATERIAL_COMP_CD" name="MATERIAL_COMP_CD"/>
</form>

<form id="item_order_history_inspection_hidden_form" name="item_order_history_inspection_hidden_form">
</form>

<script type="text/javascript">
    'use strict';
    let inPartsManageSelectedRowIndex;
    let inPartsManageTab01Grid = $("#in_parts_manage_tab01_grid");
    let inPartsManageTab02Grid = $("#in_parts_manage_tab02_grid");

    $(function () {
        let inPartsManageTab01ColModel= [
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

        let inPartsManageTab02ColModel= [
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_SEQ' },
            {title: 'w형태', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ' },
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

        let inPartsManageTab01Toolbar = {
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
        let inPartsManageTab02Toolbar = {
            items: []
        };

        inPartsManageTab01Grid.pqGrid({
            width: "100%", height: 600,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#in_part_manage_search_form'),
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
            colModel: inPartsManageTab01ColModel,
            toolbar: inPartsManageTab01Toolbar,
            complete: function(event, ui) {
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    inPartsManageSelectedRowIndex = [];
                    let itemOrderHistoryGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let itemOrderHistoryGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (itemOrderHistoryGridFirstRow === itemOrderHistoryGridLastRow) {
                        inPartsManageSelectedRowIndex[0] = itemOrderHistoryGridFirstRow;
                    } else {
                        for (let i = itemOrderHistoryGridFirstRow; i <= itemOrderHistoryGridLastRow; i++) {
                            inPartsManageSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui ) {
            }
        });

        inPartsManageTab02Grid.pqGrid({
            width: "100%", height: 600,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#in_parts_manage_hidden_form'),
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
            colModel: inPartsManageTab02ColModel,
            toolbar: inPartsManageTab02Toolbar
        });

        $("#btnItemOrderRegisterSearch").on('click', function(){
            inPartsManageTab01Grid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#in_part_manage_search_form'));
            });
            inPartsManageTab01Grid.pqGrid('refreshDataAndView');
        });

        /** 공통 코드 이외의 처리 부분 **/

        $("#in_parts_manage_tabs").tabs({});
    });

</script>