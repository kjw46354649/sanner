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
                <h4 class="modal-title">견적 상세 정보</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">주문으로 이동</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="estimate_master_record_popup_search_form" name="estimate_master_record_popup_search_form">
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
                                                        <input type="text" data-notblank="true" id="P_ORDER_COMP_CD" name="ORDER_COMP_CD" class="form-control" placeholder="발주사">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-8 col-sm-8">
                                                    <label class="col-md-2 col-sm-2 control-label">제목</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" data-notblank="true" id="EST_TITLE" name="EST_TITLE" class="form-control" placeholder="Title">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">구매 담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="ORDER_STAFF_NM" name="ORDER_STAFF_NM" placeholder="구매 담당자">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="DTL_CNT" name="DTL_CNT" placeholder="품수">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">등록일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="INSERT_DT" name="INSERT_DT" placeholder="등록일시">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적번호</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="EST_NUM" name="EST_NUM" placeholder="견적번호">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">차수</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="P_EST_VER" name="EST_VER" placeholder="차수">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적 담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="EST_USER_ID" name="EST_USER_ID" placeholder="견적 담당자">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적금액 계</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="DTL_AMOUNT" name="DTL_AMOUNT" placeholder="견적금액 계">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label"></label>
                                                    <div class="col-md-8 col-sm-8">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" id="SEND_DT" name="SEND_DT" placeholder="회신일시">
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
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="estimate_master_popup_top_grid" class="jqx-refresh"></div>
                                                </div>
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
                                                <textarea class="col-md-12 col-sm-12">
                                                    Text Test
                                                </textarea>
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
                                            <div id="estimate_master_popup_bot_grid" class="jqx-refresh"></div>
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
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="estimate_master_search_form" name="estimate_master_search_form" role="form">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="COMP_CD">사업자구분</label>
                                <select id="COMP_CD" name="COMP_CD" data-required="true" class="form-control parsley-validated">
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="ORDER_COMP_CD">발주사</label>
                                <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="MODULE_NM">견적번호</label>
                                <input type="password" class="form-control" id="MODULE_NM" placeholder="">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="TITLE">제목</label>
                                <input type="email" class="form-control" id="TITLE" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="DRAWING_NUM">도면번호</label>
                                <input type="password" class="form-control" id="DRAWING_NUM" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="ITEM_NM">품명</label>
                                <input type="password" class="form-control" id="ITEM_NM" placeholder="">
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
                                <div type="submit" class="btn btn-success btn-sm btn-default">SEARCH</div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <%--<div class="row">
            <a href="#estimate_master_record_popup" class="" id="estimatePopupOpen" data-target="" data-toggle="modal" data-refform="estimate_master_record_popup">
                <input type="button" value="POP">
            </a>
        </div>--%>
        <div class="row">
            <div class="col-md-12">
                <div id="estimate_master_top_grid" class="jqx-refresh"></div>
            </div>
        </div>
        <div class="row">&nbsp;
            <div class="col-md-12">
                <div id="estimate_master_bot_grid" class="jqx-refresh"></div>
            </div>
        </div>
    </div>
</div>

<form class="form-inline" id="estimate_master_hidden_form" name="estimate_master_hidden_form" role="form">
    <input type="hidden" id="queryId" name="queryId" value="insertEstimateVersion"/>
    <input type="hidden" id="EST_SEQ" name="EST_SEQ"/>
    <input type="hidden" id="EST_VER" name="EST_VER"/>
</form>

<form id="estimate_master_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectEstimateDetailListExcel:selectEstimateMasterInfoExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data:info"/>
    <input type="hidden" id="paramName" name="paramName" value="EST_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="estimate_template"/>
</form>

<script type="text/javascript">
    $(function () {
        'use strict';
        let click_seq;
        let estimateMasterSelectedRowIndex;
        let estimateMasterTopGrid = $("#estimate_master_top_grid");
        let estimateMasterBotGrid = $("#estimate_master_bot_grid");

        let estimateMasterPopTopGrid = $("#estimate_master_record_popup #estimate_master_popup_top_grid");
        let estimateMasterPopBotGrid = $("#estimate_master_record_popup #estimate_master_popup_bot_grid");

        let estimateMasterTopColModel= [
            //{title: 'No.', dataType: 'string', dataIndx: 'EST_SEQ'},
            {title: 'Status', dataType: 'string', dataIndx: 'EST_STATUS_NM', editable: false},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "ORDER_COMP_NM", id: "ORDER_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ORDER_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "COMP_NM", id: "COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '견적번호', dataType: 'string', dataIndx: 'EST_NUM'},
            {title: '차수', dataType: 'string', dataIndx: 'EST_VER', editable: false},
            {title: '', dataType: 'string', dataIndx: '', editable: false,
                render: function(ui){
                    return '<a href="#estimate_master_record_popup" class="" id="estimatePopupOpen" data-target="" data-toggle="modal" data-refform="estimate_master_record_popup">' +
                        '<span class="ui-icon ui-icon-circle-zoomin"></span>' +
                        '</a>';
                }
            },
            {title: '제목', dataType: 'string', dataIndx: 'EST_TITLE'},
            {title: '품수', dataType: 'string', dataIndx: 'DTL_CNT', editable: false},
            {title: '금액 계', dataType: 'string', dataIndx: 'DTL_AMOUNT'},
            {title: '등록일시', dataType: 'date', dataIndx: 'INSERT_DT', editable: false},
            {title: '견적담당', dataType: 'string', dataIndx: 'EST_USER_ID'},
            {title: '발송일시', dataType: 'string', dataIndx: 'SEND_DT', editable: false},
            {title: '', dataType: 'string', dataIndx: '', editable: false},
            {title: '주문접수', dataType: 'date', dataIndx: '', editable: false,
                render: function(ui){
                    return '<a href="#"><span class="ui-icon ui-icon-arrowthick-1-e"></span></a>';
                }
            }
        ];

        let estimateMasterBotColModel= [
            {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ' , hidden:true} ,
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ' , hidden:true} ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM' } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM' } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM' } ,
            {title: '규격', align: "center", colModel: [
                //{title: '타입', dataType: 'string', dataIndx: 'SIZE_TYPE'},
                {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                {title: '두꼐', dataType: 'string', dataIndx: 'SIZE_T'},
                {title: '지름', dataType: 'string', dataIndx: 'SIZE_D'},
                {title: '길이', dataType: 'string', dataIndx: 'SIZE_L'},
            ]},
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE',
                editor: {
                    type: 'select',
                    mapIndices: { name: "WORK_TYPE", id: "WORK_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1013'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WORK_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_TYPE',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_TYPE", id: "MATERIAL_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1004'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1000'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT',
                editor: {
                    type: 'select',
                    mapIndices: { name: "COMP_SUPPLY_YN", id: "COMP_SUPPLY_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1002'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["COMP_SUPPLY_YN"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_SUPPLY_YN", id: "MATERIAL_SUPPLY_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1045'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_SUPPLY_YN"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '열처리', dataType: 'string', dataIndx: 'HEAT_TREAT_YN',
                editor: {
                    type: 'select',
                    mapIndices: { name: "HEAT_TREAT_YN", id: "HEAT_TREAT_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1045'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["HEAT_TREAT_YN"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
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
                {title:'가로', dataType: 'float', dataIndx: 'SIZE_W'},
                {title:'세로', dataType: 'float', dataIndx: 'SIZE_H'},
                {title:'높이', dataType: 'float', dataIndx: 'SIZE_T'},
                {title:'중량(KG)', dataType: 'float', dataIndx: 'SIZE_D'},
                {title:'부피(cm3)', dataType: 'float', dataIndx: 'SIZE_L'}
            ], hidden: true},
            {title: '항목별 견적정보', align: "center", colModel: [
                {title: '소재비', dataType: 'string', dataIndx: 'MATERIAL_UNIT_COST'},
                {title: 'TM각비', dataType: 'string', dataIndx: 'TOUCH_UNIT_COST'},
                {title: '표면 처리비', dataType: 'string', dataIndx: 'SURFACE_UNIT_COST'},
                {title: '가공비', dataType: 'string', dataIndx: 'PROCESS_UNIT_COST'},
                {title: '기타추가', dataType: 'string', dataIndx: 'ETC_UNIT_COST'}
            ]},
            {title: '계산견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE'},
            {title: '최종견적가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE'},
            {title: '금액 계', dataType: 'string', dataIndx: ''},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'}
        ];

        let estimateMasterPopTopColModel= [
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY' },
            {title: '견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE' },
            {title: '최종단가', dataType: 'string', dataIndx: '' },
            {title: '최종금액 계', dataType: 'string', dataIndx: '' },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE' },
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ' },
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ' }
        ];

        let estimateMasterPopBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '전화번호', dataType: 'string', dataIndx: 'ITEM_QTY' }
        ];

        let estimateMasterTopToolbar = {
            items: [
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let ESTIMATE_MASTER_QUERY_ID = ['deleteEstimateMaster', 'deleteEstimateDetail'];

                            fnDeletePQGrid(estimateMasterTopGrid, estimateMasterSelectedRowIndex, ESTIMATE_MASTER_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {

                            let estimateMasterInsertQueryList = ['insertEstimateMaster'];
                            let estimateMasterUpdateQueryList = ['updateEstimateMaster'];
                            fnModifyPQGrid(estimateMasterTopGrid, estimateMasterInsertQueryList, estimateMasterUpdateQueryList);

                            estimateMasterInsertQueryList = ['insertEstimateMaster'];
                            estimateMasterUpdateQueryList = ['updateEstimateMaster'];
                            fnModifyPQGrid(estimateMasterBotGrid, estimateMasterInsertQueryList, estimateMasterUpdateQueryList);

                        }
                    }
                },
                {
                    type: 'button', label: '도면 View', style: 'float: right;', listener: {
                        'click': function (evt, ui) {

                        }
                    }
                },
                {   type: 'select', style: 'float: right;'  },
                {
                    type: 'button', label: '견적서추출', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            fnReportFormToHiddenFormPageAction("estimate_master_excel_download", "/downloadExcel");
                        }
                    }
                },
                {
                    type: 'button', label: '견적서 신규 작성', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            $("li .tabMenuClick[pid='100012']").trigger('click');
                            if(!$("li .tabMenuClick[pid='100012']").hasClass("active")){
                                $("li .tabMenuClick[pid='100012']").addClass("active");
                            }

                        }
                    }
                },
                {
                    type: 'button', label: '차수생성', style: 'float: left;', listener: {
                        'click': function (evt, ui) {
                            let data = {
                                'queryId': 'insertEstimateMasterVersion',
                                'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                                'ESR_VER' : $("#estimate_master_hidden_form #EST_SEQ").val()
                            }
                            let parameters = {'url': '/json-create', 'data': data};
                            fnPostAjax('', parameters, '');

                            data = {
                                'queryId': 'insertEstimateDetailVersion',
                                'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                                'ESR_VER' : $("#estimate_master_hidden_form #EST_SEQ").val()
                            }
                            parameters = {'url': '/json-create', 'data': data};
                            fnPostAjax(estimateMasterVersionUpCallBack, parameters, '');

                        }
                    }
                },
                {
                    type: 'checkbox', label: '상세견적요건', style: 'float: left;', listener: {
                        'change': function (evt, ui) {
                            let colM = estimateMasterBotGrid.pqGrid("option", "colModel");
                            let listM = [14, 15];
                            let hiddenYn = evt.target.checked == true ? false : true;
                            for (let tmpI = 0; tmpI < listM.length; tmpI++) {
                                for (let colCnt = 0; colCnt < colM[listM[tmpI]].colModel.length; colCnt++) {
                                    colM[listM[tmpI]].colModel[colCnt].hidden = hiddenYn;
                                }
                                colM[listM[tmpI]].hidden = hiddenYn;
                            }
                            estimateMasterBotGrid.pqGrid("option", "colModel", colM);
                            estimateMasterBotGrid.pqGrid("refresh");
                        }
                    }
                }
            ]
        };
        let estimateMasterBotToolbar = {
            items: []
        };

        let estimateMasterPopTopToolbar = {
            items: []
        };

        let estimateMasterPopBotToolbar = {
            items: [{ type: 'checkbox', label: '자동메일 발송', style: 'float: right;' }]
        };

        estimateMasterTopGrid.pqGrid({
            width: "100%", height: 200,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
                url: "/paramQueryGridSelect",
                //postData: fnFormToJsonArrayData(),
                postData: { 'queryId': 'selectEstimateMasterList'},
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
            colModel: estimateMasterTopColModel,
            toolbar: estimateMasterTopToolbar,
            complete: function(event, ui) {
                estimateMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    estimateMasterSelectedRowIndex = [];
                    let estimateMasterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let estimateMasterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (estimateMasterGridFirstRow === estimateMasterGridLastRow) {
                        estimateMasterSelectedRowIndex[0] = estimateMasterGridFirstRow;
                    } else {
                        for (let i = estimateMasterGridFirstRow; i <= estimateMasterGridLastRow; i++) {
                            estimateMasterSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                let EST_SEQ = ui.addList[0].rowData.EST_SEQ;
                let EST_VER = ui.addList[0].rowData.EST_VER;
                $("#estimate_master_hidden_form #EST_SEQ").val(EST_SEQ);
                $("#estimate_master_hidden_form #EST_VER").val(EST_VER);
                $("#estimate_master_excel_download #paramData").val(EST_SEQ);
                selectEstimateBotList(EST_SEQ);
                //}
            }
            /*cellDblClick: function( event, ui ) {
                $("#estimatePopupOpen").trigger('click');
            }*/
        });

        selectEstimateBotList('', '');

        function selectEstimateBotList(EST_SEQ) {
            estimateMasterBotGrid.pqGrid({
                width: "100%", height: 350,
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
                colModel: estimateMasterBotColModel,
                toolbar: estimateMasterBotToolbar
            });

            estimateMasterBotGrid.pqGrid("refreshDataAndView");
        };

        $('#estimate_master_record_popup').on('hide.bs.modal', function() {
            estimateMasterPopTopGrid.pqGrid( "destroy" );
            estimateMasterPopBotGrid.pqGrid( "destroy" );
        });

        $('#estimate_master_record_popup').on('show.bs.modal',function() {
            let EST_SEQ = $("#estimate_master_hidden_form #EST_SEQ").val();

            let postData = { 'queryId': 'estimate.selectEstimateMasterListPop', 'EST_SEQ':EST_SEQ};
            let parameter = {'url': '/json-list', 'data': postData};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                $("#estimate_master_record_popup #P_ORDER_COMP_CD").val(list.ORDER_COMP_NM);
                $("#estimate_master_record_popup #EST_TITLE").val(list.EST_TITLE);
                $("#estimate_master_record_popup #EST_NUM").val(list.EST_NUM);
                $("#estimate_master_record_popup #ORDER_STAFF_NM").val(list.ORDER_STAFF_NM);
                $("#estimate_master_record_popup #COMP_CD").val(list.COMP_NM);
                $("#estimate_master_record_popup #EST_USER_ID").val(list.EST_USER_ID);
                $("#estimate_master_record_popup #P_EST_VER").val(list.EST_VER);
                $("#estimate_master_record_popup #DTL_CNT").val(list.DTL_CNT);
                $("#estimate_master_record_popup #DTL_AMOUNT").val(list.DTL_AMOUNT);
                $("#estimate_master_record_popup #INSERT_DT").val(list.INSERT_DT);
                $("#estimate_master_record_popup #SEND_DT").val(list.SEND_DT);
            }, parameter, '');

            estimateMasterPopTopGrid.pqGrid({
                width: "100%", height: 200,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'MODULE_NM',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_SEQ' : EST_SEQ },
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                filterModel: { on: true, mode: "AND", header: true, type: "local" },
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                colModel: estimateMasterPopTopColModel,
                toolbar: estimateMasterPopTopToolbar
            });

            estimateMasterPopBotGrid.pqGrid({
                width: "100%", height: 150,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
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
                colModel: estimateMasterPopBotColModel,
                toolbar: estimateMasterPopBotToolbar
            });

            estimateMasterPopTopGrid.pqGrid("refreshDataAndView");
            estimateMasterPopBotGrid.pqGrid("refreshDataAndView");

        });

        $("#SEL_COMP_CLASS").on("change", function(){
            //fnGetCommCodeBasicSelectBox( $("#SEL_COMP_TYPE"), '', $(this).val(), 'A');
        });

        function estimateMasterVersionUpCallBack(){
            estimateMasterTopGrid.pqGrid('refreshDataAndView');
        };

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

    });


</script>