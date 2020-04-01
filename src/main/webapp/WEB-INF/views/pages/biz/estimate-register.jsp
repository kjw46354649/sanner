<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="modal" id="estimate_master_record_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Mail Box</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="estimate_register_email_popup_form" name="estimate_register_email_popup_form">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <section class="bg-light">
                            <div class="row">

                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>메일 내용</strong>
                                        </header>
                                        <div class="row">
                                            <div class="gridWrap">
                                                <textarea class="col-md-12 col-sm-12">
                                                    Text Test
                                                </textarea>
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
                    업체 정보 관리
                    <div class="btnSaveCloseBox">
                        <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_save">Save</div>
                        <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_submit">Submit</div>
                    </div>
                </header>
                <div class="panel-body">
                    <form class="form-inline" role="form" id="estimate_register_info_form" name="estimate_register_info_form">
                        <input type="hidden" id="queryId" name="queryId" value="selectEstimateNextSequence"/>
                        <input type="hidden" id="EST_SEQ" name="EST_SEQ" value=""/>
                        <div class="panel-body line_tit portlet-body form bg-light">
                            <section class="bg-light">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <form class="form-horizontal" data-validate="parsley" action="#">
                                            <section class="panel panel-default">
                                                <header class="panel-heading">
                                                    <strong>기본 정보</strong>
                                                </header>
                                                <div class="panel-body">
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">발주사</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" data-required="true" class="form-control parsley-validated">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-8 col-sm-8">
                                                        <label class="col-md-2 col-sm-2 control-label">제목</label>
                                                        <div class="col-md-10 col-sm-10">
                                                            <input type="text" data-notblank="true" class="form-control" data-required="true" id="EST_TITLE" name="EST_TITLE">
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">구매 담당자</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <select id="ORDER_STAFF_SEQ" name="ORDER_STAFF_SEQ" data-required="true" class="form-control parsley-validated">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">사업자구분</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <select id="COMP_CD" name="COMP_CD" data-required="true" class="form-control parsley-validated">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">견적 담당자</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <select id="EST_USER_ID" name="EST_USER_ID" data-required="true" class="form-control parsley-validated">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">견적번호 (차수)</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" id="EST_NUM" name="EST_NUM" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" id="DTL_CNT" name="DTL_CNT" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">견적금액 계</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" id="DTL_AMOUNT" name="DTL_AMOUNT" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">업데이트 일시</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" id="INSERT_DT" name="INSERT_DT" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" id="SEND_DT" name="SEND_DT" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </form>
                                    </div>
                                </div>
                            </section>
                            <!-- grid table -->
                            <section class="bg-light">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>상세 리스트</strong>
                                            </header>
                                            <div class="row">
                                                <div class="gridWrap">
                                                    <div id="estimate_register_top_grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="bg-light">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>메일 내용</strong>
                                            </header>
                                            <div class="row">
                                                <div class="gridWrap">
                                                    <textarea class="col-md-12 col-sm-12" id="EMAIL_CONTENT" name="EMAIL_CONTENT"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="bg-light">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>메인 수신처</strong>
                                            </header>
                                            <div class="gridWrap">
                                                <div id="estimate_register_bot_grid" class="jqx-refresh"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>첨부파일</strong>
                                            </header>
                                            <div class="gridWrap">
                                                <input type="file">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>

<input type="button" id="test">
<form id="estimate_register_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectEstimateDetailListExcel"/>
    <input type="hidden" id="paramName" name="paramName" value="EST_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
</form>
<script type="text/javascript">
    $(function () {

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#EST_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList'}});

        'use strict';
        let estimateRegisterSelectedRowIndex;

        let estimateRegisterTopGrid = $("#estimate_register_top_grid");
        let estimateRegisterBotGrid = $("#estimate_register_bot_grid");

        let estimateRegisterTopColModel= [
            {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ' , hidden:true} ,
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ' , hidden:true} ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM' } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' } ,
            {title: '', dataType: 'string', dataIndx: 'DRAWING_YN' } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', validations: [{ type: 'minLen', value: 1, msg: "Required"}] } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM' } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT' } ,
            /*
            {title: '규격', align: "center", colModel: [
                //{title: '타입', dataType: 'string', dataIndx: 'SIZE_TYPE'},
                {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                {title: '두꼐', dataType: 'string', dataIndx: 'SIZE_T'},
                {title: '지름', dataType: 'string', dataIndx: 'SIZE_D'},
                {title: '길이', dataType: 'string', dataIndx: 'SIZE_L'},
            ]},
            */
            {title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE',
                editor: {
                    type: 'select',
                    mapIndices: { name: "WORK_TYPE", id: "WORK_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1013'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WORK_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE' },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1000'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1004'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_KIND"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT',
                editor: {
                    type: 'select',
                    mapIndices: { name: "SURFACE_TREAT", id: "SURFACE_TREAT" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1002'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["SURFACE_TREAT"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE' },
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '상세 가공요건', align: "center", colModel:[
                {title:'선반', dataType: 'string', dataIndx: 'DETAIL_LATHE'},
                {title:'가공면', dataType: 'string', dataIndx: 'DETAIL_SURFACE'},
                {title:'클램핑', dataType: 'string', dataIndx: 'DETAIL_CLAMPING'},
                {title:'포켓', dataType: 'string', dataIndx: 'DETAIL_POCKET'},
                //{title:'공차', dataType: 'string', dataIndx: 'DETAIL_TOLERANCE'},
                {title:'드릴', dataType: 'string', dataIndx: 'DETAIL_DRILL'},
                {title:'난도', dataType: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
            ], hidden: true},
            {title: '예상소재 Size', align: "center", colModel:[
                {title:'가로', dataType: 'float', dataIndx: 'SIZE_W_M'},
                {title:'세로', dataType: 'float', dataIndx: 'SIZE_H_M'},
                {title:'두께', dataType: 'float', dataIndx: 'SIZE_T_M'},
                {title:'지름', dataType: 'float', dataIndx: 'SIZE_D_M'},
                {title:'길이', dataType: 'float', dataIndx: 'SIZE_L_M'}
            ], hidden: true},
            {title: '항목별 견적정보', align: "center", colModel: [
                    {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AMT'},
                    {title: 'TM각비', dataType: 'integer', dataIndx: 'UNIT_TM_AMT'},
                    {title: '연마비', dataType: 'integer', dataIndx: 'UNIT_GRIND_AMT'},
                    {title: '열처리', dataType: 'integer', dataIndx: 'UNIT_HEAT_AMT'},
                    {title: '표면 처리비', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AMT'},
                    {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AMT'},
                    {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_NOTE'},
                    {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE'}
                ]},
            {title: '계산견적단가', dataType: 'float', dataIndx: 'CALCUL_EST_UNIT_COST'},
            {title: '최종견적가', dataType: 'float', dataIndx: 'FINAL_EST_UNIT_PRICE'},
            {title: '금액 계', dataType: 'float', dataIndx: 'FINAL_AMOUNT'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'DWF', dataType: 'string', dataIndx: 'DWF_GFILE_SEQ'},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'},
            {title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ'}
        ];

        let estimateRegisterBotColModel= [
            {title: '', dataType: 'string', dataIndx: 'STAFF_SEQ', hidden: true },
            {title: '성함', dataType: 'string', dataIndx: 'STAFF_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'STAFF_EMAIL' },
            {title: '전화번호', dataType: 'string', dataIndx: 'STAFF_TEL' }
        ];

        let estimateRegisterTopToolbar = {
            items: [
                {
                    type: 'button', label: '도면 보기', icon: '', style: 'float: right;', listener: {
                        'click': function (evt, ui) {}
                    }
                },
                {
                    type: 'button', label: '도면 등록', icon: '', style: 'float: right;', listener: {
                        'click': function (evt, ui) {}
                    }
                },
                {
                    type: 'button', label: '계산견적적용', icon: '', style: 'float: right;', listener: {
                        'click': function (evt, ui) {}
                    }
                },
                {   type: 'select', label: '', style: 'float: right;', option: fnGetCommCodeGridSelectBox('1045')   },
                {
                    type: 'checkbox', label: '상세견적요건', style: 'float: right;', listener: {
                        'change': function (evt, ui) {
                            let colM = estimateRegisterTopGrid.pqGrid("option", "colModel");
                            let listM = [15,16];
                            let hiddenYn = evt.target.checked == true ? false : true;
                            for(let tmpI = 0; tmpI < listM.length; tmpI++) {
                                for(let colCnt = 0; colCnt < colM[listM[tmpI]].colModel.length; colCnt++){
                                    colM[listM[tmpI]].colModel[colCnt].hidden = hiddenYn;
                                }
                                colM[listM[tmpI]].hidden = hiddenYn;
                            }
                            estimateRegisterTopGrid.pqGrid("option", "colModel", colM);
                            estimateRegisterTopGrid.pqGrid( "refresh" );
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            let USER_MASTER_QUERY_ID = 'deleteEstimateDetail';

                            fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            estimateRegisterTopGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: '견적List 출력', icon: 'ui-icon-plus', style: 'float: left;', listener: {
                        'click': function (evt, ui) {

                            fnReportFormToHiddenFormPageAction("packing_history_list_search_form", "/downloadExcel");
                        }
                    }
                }
            ]
        };
        let estimateRegisterBotToolbar = {
            items: [
                {
                type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                    'click': function (evt, ui) {

                    }
                }
            }]
        };

        estimateRegisterTopGrid.pqGrid({
            width: "100%", height: 200,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectEstimateDetailList'},
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true },
            //selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            //resizable: true,
            colModel: estimateRegisterTopColModel,
            toolbar: estimateRegisterTopToolbar,
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    estimateRegisterSelectedRowIndex = [];
                    let estimateRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let estimateRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (estimateRegisterGridFirstRow === estimateRegisterGridLastRow) {
                        estimateRegisterSelectedRowIndex[0] = estimateRegisterGridFirstRow;
                    } else {
                        for (let i = estimateRegisterGridFirstRow; i <= estimateRegisterGridLastRow; i++) {
                            estimateRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            change: function( event, ui ) {
                if(ui.source == 'edit'){
                    let rowIndx = ui.updateList[0].rowIndx;
                    let calculateEstimateAmt = 0;
                    let dataColumn = ['ITEM_QTY', 'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT'];
                    let data = estimateRegisterTopGrid.pqGrid( "getData", { dataIndx: dataColumn } );

                    calculateEstimateAmt += data[0].UNIT_MATERIAL_AMT == undefined ? 0 : parseFloat(data[0].UNIT_MATERIAL_AMT);
                    calculateEstimateAmt += data[0].UNIT_TM_AMT == undefined ? 0 : parseFloat(data[0].UNIT_TM_AMT);
                    calculateEstimateAmt += data[0].UNIT_GRIND_AMT == undefined ? 0 : parseFloat(data[0].UNIT_GRIND_AMT);
                    calculateEstimateAmt += data[0].UNIT_HEAT_AMT == undefined ? 0 : parseFloat(data[0].UNIT_HEAT_AMT);
                    calculateEstimateAmt += data[0].UNIT_SURFACE_AMT == undefined ? 0 : parseFloat(data[0].UNIT_SURFACE_AMT);
                    calculateEstimateAmt += data[0].UNIT_PROCESS_AMT == undefined ? 0 : parseFloat(data[0].UNIT_PROCESS_AMT);
                    calculateEstimateAmt += data[0].UNIT_ETC_AMT == undefined ? 0 : parseFloat(data[0].UNIT_ETC_AMT);
                    estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'CALCUL_EST_UNIT_COST': calculateEstimateAmt } });

                    calculateEstimateAmt *= parseFloat(data[0].ITEM_QTY);
                    estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'FINAL_AMOUNT': calculateEstimateAmt } });

                }
            }
        });

        selectEstimateBotList('');

        function selectEstimateBotList(COMP_CD) {
            estimateRegisterBotGrid.pqGrid({
                width: "100%", height: 200,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectCompanyStaffEmailList', 'COMP_CD': COMP_CD},
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                collapsible: false,
                swipeModel: {on: false},
                resizable: false,
                trackModel: {on: true},
                //resizable: true,
                colModel: estimateRegisterBotColModel,
                toolbar: estimateRegisterBotToolbar
            });

            estimateRegisterBotGrid.pqGrid("refreshDataAndView");
        };


        $("#estimate_register_info_form #ORDER_COMP_CD").on('change', function(){
            let compCd = $(this).val();

            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList', 'COMP_CD': compCd }});
            selectEstimateBotList(compCd);
        });

        function estimateRegisterSaveCallBack(response, callMethodParam){
            let estimateRegisterInsertQueryList = ['insertEstimateDetail'];
            let estimateRegisterUpdateQueryList = ['updateEstimateDetail'];
            let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();

            let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            for(let tempI=0; tempI<totalRecords; tempI++){
                estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'EST_SEQ': EST_SEQ } });
            }

            fnModifyPQGrid(estimateRegisterTopGrid, estimateRegisterInsertQueryList, estimateRegisterUpdateQueryList);
            estimateRegisterReloadPageData();
        };

        $("#btn_estimate_register_save").on("click", function(){
            $("#estimate_register_info_form #queryId").val('selectEstimateNextSequence');

            let parameters = {'url': '/json-list', 'data': $("#estimate_register_info_form").serialize()};
            let EST_SEQ = $("#estimate_register_info_form #EST_SEQ").val();
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                if(EST_SEQ == '' || EST_SEQ == null){
                    EST_SEQ = list.EST_SEQ;
                }

                $("#estimate_register_info_form #queryId").val('insertEstimateMaster');
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);

                parameters = {'url': '/json-create', 'data': $("#estimate_register_info_form").serialize()};
                fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

            }, parameters, '');
        });

        function estimateRegisterReloadPageData(){
            let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
            let postData = { 'queryId': 'estimate.selectLastValEstimateMasterInfo', 'EST_SEQ': EST_SEQ};

            let parameter = {'url': '/json-list', 'data': postData};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                $("#estimate_register_info_form #ORDER_COMP_CD").val(list.ORDER_COMP_CD);
                $("#estimate_register_info_form #EST_TITLE").val(list.EST_TITLE);
                $("#estimate_register_info_form #ORDER_STAFF_SEQ").val(list.ORDER_STAFF_SEQ);
                $("#estimate_register_info_form #COMP_CD").val(list.COMP_CD);
                $("#estimate_register_info_form #EST_USER_ID").val(list.EST_USER_ID);
                $("#estimate_register_info_form #EST_NUM").val(list.EST_NUM + ' (' + list.EST_VER + ')');
                $("#estimate_register_info_form #DTL_CNT").val(list.DTL_CNT);
                $("#estimate_register_info_form #DTL_AMOUNT").val(list.DTL_AMOUNT);
                $("#estimate_register_info_form #INSERT_DT").val(list.INSERT_DT);
                $("#estimate_register_info_form #SEND_DT").val(list.SEND_DT);

                postData = { 'queryId': 'estimate.selectLastValEstimateDetailList', 'EST_SEQ': EST_SEQ };
                fnRequestGidData(estimateRegisterTopGrid, postData);

                $("#estimate_register_excel_download #EST_SEQ").val(EST_SEQ);
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
            }, parameter, '');
        };

        $(document).on('click', '#test', function(){
            estimateRegisterReloadPageData();
        });

        //estimateRegisterReloadPageData();
    });
</script>