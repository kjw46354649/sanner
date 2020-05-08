<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="estimate_master_search_form" name="estimate_master_search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="estimate.selectEstimateMasterList">
            <div class="gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="COMP_CD" class="label_100">사업자구분</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자구분" class="wd_200"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_100">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="TITLE">제목</label><input type="text" name="TITLE" id="TITLE" class="wd_200" value="" title="제목"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">도면번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="도면번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnEstimateListSearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="MODULE_NM">견적번호</label><input type="text" name="MODULE_NM" id="MODULE_NM" class="wd_200" value="" title="견적번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" class="wd_200 " value="" title="품명"></span>
                    </li>
                    <span class="">
                        <span class="ipu_wrap"><label class="label_100" for="MODULE_NM">일자별 조회</label></span>
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
        <div class="hWrap">
            <div class="d-inline">
                <button type="button" class="defaultBtn btn-120w" id="btnEstimateListNewEstimate">견적서 신규 작성</button>
                <button type="button" class="defaultBtn btn-120w" id="btnEstimateListNewVersion">차수 생성</button>
                <%--<span class="chk_box mg-left15"><input id="chkEstimateListDetail" type="checkbox"><label for="chkEstimateListDetail"> 견적상세요건</label></span>--%>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn radius green" id="btnEstimateListSave">저장</button>
                    <button type="button" class="defaultBtn radius red" id="btnEstimateListDelete">삭제</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="buttonWrap">
                <div class="d-inline">
                    <button type="button" class="smallBtn yellow">견적정보</button>
                    <button type="button" class="smallBtn yellow">금액정보</button>
                    <span class="slt_wrap namePlusSlt right_float">
                        <label for="selEstimateListExcel">견적서 추출</label>
                        <select id="selEstimateListExcel" name="selEstimateListExcel" title="견적서 추출"></select>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateListDrawView">도면 보기</button>
                    </span>
                </div>
            </div>
            <div class="conMainWrap">
                <div id="estimate_master_top_grid" class="jqx-refresh"></div><br/>
            </div>
            <div class="conWrap">
                <div id="estimate_master_bot_grid" class="jqx-refresh"></div>
            </div>
        </div>
    </div>
</div>

<form class="form-inline" id="estimate_master_hidden_form" name="estimate_master_hidden_form" role="form">
    <input type="hidden" id="queryId" name="queryId" value="insertEstimateVersion"/>
    <input type="hidden" id="EST_SEQ" name="EST_SEQ"/>
    <input type="hidden" id="EST_VER" name="EST_VER"/>
    <input type="hidden" id="N_EST_SEQ" name="N_EST_SEQ"/>
</form>

<form id="estimate_master_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectEstimateDetailListExcel:selectEstimateMasterInfoExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="data:info"/>
    <input type="hidden" id="paramName" name="paramName" value="EST_SEQ"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="estimate_template"/>
</form>

<script type="text/javascript">
    'use strict';
    let estimateMasterSelectedRowIndex;
    let estimateMasterTopGrid = $("#estimate_master_top_grid");
    let estimateMasterBotGrid = $("#estimate_master_bot_grid");

    $(function () {

        let estimateMasterTopColModel= [
            //{title: 'No.', dataType: 'string', dataIndx: 'EST_SEQ'},
            {title: 'Status', dataType: 'string', dataIndx: 'EST_STATUS_NM', editable: false, width: 80},
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
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', editable: false, width: 60},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "COMP_NM", id: "COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '견적번호', dataType: 'string', dataIndx: 'EST_NUM', editable: false, width: 150},
            {title: '차수', dataType: 'string', dataIndx: 'EST_VER', editable: false, width: 50},
            {title: '', dataType: 'string', dataIndx: '', editable: false, width: 30,
                render: function(ui){
                    let EST_STATUS = ui.rowData.EST_STATUS;
                    let EST_SEQ = ui.rowData.EST_SEQ;

                    return '<a href="#" id="estimateRegisterPage">' +
                        '<span data-status="'+EST_STATUS+'" data-seq="'+EST_SEQ+'" class="ui-icon ui-icon-circle-zoomin"></span>' +
                        '</a>';
                }
            },
            {title: '제목', dataType: 'string', dataIndx: 'EST_TITLE', width: 180},
            {title: '품수', dataType: 'string', dataIndx: 'DTL_CNT', editable: false},
            {title: '금액 계', dataType: 'string', dataIndx: 'DTL_AMOUNT', format: '#,###'},
            {title: '등록일시', dataType: 'date', dataIndx: 'INSERT_DT', editable: false},
            {title: '견적담당', dataType: 'string', dataIndx: 'EST_USER',
                editor: {
                    type: 'select',
                    mapIndices: { name: "EST_USER", id: "EST_USER_ID" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["EST_USER_ID"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '발송일시', dataType: 'string', dataIndx: 'SEND_DT', editable: false},
            {title: '', dataType: 'string', dataIndx: '', editable: false, width: 40},
            {title: '주문접수', dataType: 'date', dataIndx: '', editable: false, width: 60,
                render: function(ui){
                    let EST_STATUS = ui.rowData.EST_STATUS;
                    let EST_SEQ = ui.rowData.EST_SEQ;
                    let EST_VER = ui.rowData.EST_VER;

                    if(EST_STATUS == 'EST010'){
                        return '<a href="#" id="estimateOrder">' +
                            '<span data-seq="'+EST_SEQ+'" data-ver="'+EST_VER+'" class="ui-icon ui-icon-arrowthick-1-e"></span>' +
                            '</a>';
                    }
                }
            }
        ];

        let estimateMasterBotColModel= [
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM', width: 80 } ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', width: 80 } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', width: 80 } ,
            {title: '', dataType: 'string', dataIndx: 'DRAWING_YN', width: 30 } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', validations: [{ type: 'minLen', value: 1, msg: "Required"}], width: 100 } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', width: 50 ,
                render: function (ui) {
                    if (ui.rowData.WORK_TYPE === 'WTP020') {
                        return '<a href="#" id="estimatePartPlus">' +
                            '<span data-idx="'+ui.rowIndx+'" class="ui-icon ui-icon-plus" style="cursor: pointer"></span>' +
                            '</a>'
                    }
                }
            } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 100 } ,
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "WORK_TYPE_NM", id: "WORK_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1033'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WORK_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM' ,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_TYPE_NM", id: "MATERIAL_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1035'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_KIND_NM", id: "MATERIAL_KIND" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_KIND"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT_NM', width: 80,
                editor: {
                    type: 'select',
                    mapIndices: { name: "SURFACE_TREAT_NM", id: "SURFACE_TREAT" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1039'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["SURFACE_TREAT"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE' },
            {title: '소재마감', align: "center", colModel:[
                    {title: 'TM각비', dataType: 'string', dataIndx: 'MATERIAL_FINISH_TM'},
                    {title: '연마비', dataType: 'string', dataIndx: 'MATERIAL_FINISH_GRIND'},
                    {title: '열처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
                ]},
            {title: '상세 가공요건', align: "center", colModel:[
                    {title:'선반', dataType: 'string', dataIndx: 'DETAIL_LATHE'},
                    {title:'가공', dataType: 'string', dataIndx: 'DETAIL_SURFACE'},
                    {title:'클램', dataType: 'string', dataIndx: 'DETAIL_CLAMPING'},
                    {title:'포켓', dataType: 'string', dataIndx: 'DETAIL_POCKET'},
                    {title:'드릴', dataType: 'string', dataIndx: 'DETAIL_DRILL'},
                    {title:'난도', dataType: 'string', dataIndx: 'DETAIL_DIFFICULTY'}
                ], hidden: true},
            {title: '소재사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN',
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_SUPPLY_YN", id: "MATERIAL_SUPPLY_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_SUPPLY_YN"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '예상소재 Size', align: "center", colModel:[
                    {title:'가로', dataType: 'float', dataIndx: 'SIZE_W_M'},
                    {title:'세로', dataType: 'float', dataIndx: 'SIZE_H_M'},
                    {title:'두께', dataType: 'float', dataIndx: 'SIZE_T_M'},
                    {title:'지름', dataType: 'float', dataIndx: 'SIZE_D_M'},
                    {title:'길이', dataType: 'float', dataIndx: 'SIZE_L_M'}
                ], hidden: true},
            {title: '항목별 견적정보', align: "center", colModel: [
                    {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AMT', format: '#,###'},
                    /*{title: '소재마감', dataType: 'integer', dataIndx: '', format: '#,###'},   */
                    {title: '표면 처리비', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AMT', format: '#,###'},
                    {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AMT', format: '#,###'},
                    {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_AMT', format: '#,###'},
                    {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE'}
                ]},
            {title: '계산견적단가', dataType: 'float', dataIndx: 'CALCUL_EST_UNIT_COST', format: '#,###', width: 80},
            {title: '최종견적가', dataType: 'float', dataIndx: 'FINAL_EST_UNIT_PRICE', format: '#,###', width: 80},
            {title: '금액 계', dataType: 'float', dataIndx: 'DTL_AMOUNT', format: '#,###', width: 80},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            //{title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                }
            },
            //{title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'},
            {
                title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="ui-icon ui-icon-search" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            }
        ];

        estimateMasterTopGrid.pqGrid({
            width: '100%', height: 300,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
                url: "/paramQueryGridSelect",
                //postData: fnFormToJsonArrayData(),
                postData: fnFormToJsonArrayData('#estimate_master_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            scrollModel: { autoFit: true },
            columnTemplate: {align: 'center', hvalign: 'center'},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            colModel: estimateMasterTopColModel,
            showTitle: false,
            strNoRows: g_noData,
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
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    estimateMasterTopGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        });

        function selectEstimateBotList(EST_SEQ) {
            if(estimateMasterBotGrid.hasClass('pq-grid')){
                estimateMasterBotGrid.pqGrid('destroy');
            }
            estimateMasterBotGrid.pqGrid({
                minHeight: "100%",
                height: '100%',
                width: '100%',
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_SEQ': EST_SEQ},
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                postRenderInterval: -1, //call postRender synchronously.
                scrollModel: { autoFit: true },
                columnTemplate: {align: 'center', hvalign: 'center'},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                trackModel: {on: true},
                resizable: false,
                colModel: estimateMasterBotColModel,
                showTitle: false,
                strNoRows: g_noData,
                change: function( event, ui ) {
                    if(ui.source == 'edit'){
                        let rowIndx = ui.updateList[0].rowIndx;
                        let calculateEstimateAmt = 0;
                        let data = ui.updateList[0].rowData;
                        let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == null || data.UNIT_MATERIAL_AMT == '' ? 0 : parseInt(data.UNIT_MATERIAL_AMT);
                        let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == null || data.UNIT_SURFACE_AMT == '' ? 0 : parseInt(data.UNIT_SURFACE_AMT);
                        let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == null || data.UNIT_PROCESS_AMT == '' ? 0 : parseInt(data.UNIT_PROCESS_AMT);
                        let UNIT_ETC_AMT = data.UNIT_ETC_AMT == null || data.UNIT_ETC_AMT == '' ? 0 : parseInt(data.UNIT_ETC_AMT);
                        let ITEM_QTY = data.ITEM_QTY == null || data.ITEM_QTY == '' ? 0 : parseInt(data.ITEM_QTY);

                        calculateEstimateAmt += UNIT_MATERIAL_AMT;
                        calculateEstimateAmt += UNIT_SURFACE_AMT;
                        calculateEstimateAmt += UNIT_PROCESS_AMT;
                        calculateEstimateAmt += UNIT_ETC_AMT;
                        estimateMasterBotGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'CALCUL_EST_UNIT_COST': calculateEstimateAmt } });

                        calculateEstimateAmt *= ITEM_QTY;
                        estimateMasterBotGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'DTL_AMOUNT': calculateEstimateAmt } });
                    }
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        estimateMasterBotGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                    }
                }
            });

            estimateMasterBotGrid.pqGrid("refreshDataAndView");
        };


        /** 버튼 처리 **/
        $("#btnEstimateListSearch").on('click', function(){
            estimateMasterTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#estimate_master_search_form'));
            });
            estimateMasterTopGrid.pqGrid('refreshDataAndView');
        });

        $("#btnEstimateListDelete").on('click', function(){
            let ESTIMATE_MASTER_QUERY_ID = ['deleteEstimateMaster', 'deleteEstimateDetail'];
            fnDeletePQGrid(estimateMasterTopGrid, estimateMasterSelectedRowIndex, ESTIMATE_MASTER_QUERY_ID);
        });

        $("#btnEstimateListSave").on('click', function(){
            let estimateDetailInsertQueryList = ['insertEstimateDetail'];
            let estimateDetailUpdateQueryList = ['updateEstimateDetail'];
            fnModifyPQGrid(estimateMasterBotGrid, estimateDetailInsertQueryList, estimateDetailUpdateQueryList);

            let estimateMasterInsertQueryList = ['insertEstimateMaster'];
            let estimateMasterUpdateQueryList = ['updateEstimateMaster'];
            fnModifyPQGrid(estimateMasterTopGrid, estimateMasterInsertQueryList, estimateMasterUpdateQueryList);
        });

        $("#btnEstimateListDrawView").on('click', function(){ });

        $("#selEstimateListExcel").on('click', function(){
            fnReportFormToHiddenFormPageAction("estimate_master_excel_download", "/downloadExcel");
        });

        $("#btnEstimateListNewEstimate").on('click', function(){
            $("a[pid='100012']").trigger("click");
        });

        $("#btnEstimateListNewVersion").on('click', function(){
            let parameters = {'url': '/json-list', 'data': {'queryId':'selectEstimateNextSequence'}};
            let EST_SEQ = "";

            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                EST_SEQ = list.EST_SEQ;
                $("#estimate_master_hidden_form #N_EST_SEQ").val(EST_SEQ);
                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);

                let parameter = {
                    'queryId': 'insertEstimateMasterVersion',
                    'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                    'N_EST_SEQ' : $("#estimate_master_hidden_form #N_EST_SEQ").val()
                };
                parameters = {'url': '/json-create', 'data': parameter};
                fnPostAjax(function (data, callFunctionParam) {
                    parameter = {
                        'queryId': 'insertEstimateDetailVersion',
                        'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                        'N_EST_SEQ' : $("#estimate_master_hidden_form #N_EST_SEQ").val()
                    };
                    parameters = {'url': '/json-create', 'data': parameter};
                    fnPostAjax('', parameters, '');

                    $("a[pid='100012']").trigger("click");
                    $("#test").trigger('click');
                }, parameters, '');
            }, parameters, '');
        });

        $("#chkEstimateListDetail").on('change', function(evt){
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
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

    });

    /** 그리드 버튼 처리 **/
    $(document).on('click', '#estimateOrder', function(event){
        let seq = event.target.dataset.seq;
        let parameters = {'url': '/json-list', 'data': { 'queryId': 'selectEstimateOrderControlData', 'EST_SEQ': seq}};
        fnPostAjax(function (data, callFunctionParam) {

            let parameters = {
                'url': '/registerEstimateOrder',
                'data': {data: JSON.stringify(data.list)}
            };

            fnPostAjax(function () {
                alert("<spring:message code='com.alert.default.save.success' />");
                $("#btnEstimateListSearch").trigger('click');
            }, parameters, '');

        }, parameters, '');
    });

    $(document).on('click', '#estimatePartPlus', function(event){
        let rowIndex = event.target.dataset.idx;
        let data = estimateMasterBotGrid.pqGrid('option', 'dataModel.data'), totalRecords = data.length;
        let newPartNum = 0, newRowIndex = 0;

        let newRowData = fnCloneObj(data[rowIndex]);
        for (let i = 0; i < totalRecords; i++) {
            if (data[i].PARENT_SEQ === newRowData.PARENT_SEQ) {
                newPartNum++;
                newRowIndex = data[i].pq_ri + 1;
            }
        }

        newRowData.ROWNUM = totalRecords + 1;
        newRowData.PART_NUM = newPartNum;
        newRowData.WORK_TYPE = 'WTP010';

        estimateMasterBotGrid.pqGrid('addRow', {
            newRow: newRowData,
            rowIndx: newRowIndex,
            checkEditable: false
        });
    });

    /** 화면 이동 처리 **/
    $(document).on('click', '#estimateRegisterPage', function(event){
        let seq = event.target.dataset.seq;
        let status = event.target.dataset.status;

        if(status == 'EST010'){
            $("#estimate_version_up_sequence_form #hidden_est_seq").val(seq);

            $("a[pid='100012']").trigger("click");
            $("#test").trigger('click');
        }
    });


</script>