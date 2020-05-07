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
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="estimate_register_info_form" name="estimate_register_info_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="">
            <div class="basicWrap">
                <ul>
                    <li>
                        <div class="right_sort">
                            <button type="button" class="defaultBtn radius" id="btn_estimate_register_save">저장</button>
                            <button type="button" class="defaultBtn radius yellow" id="btn_estimate_register_submit">제출</button>
                        </div>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_100">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="EST_TITLE" class="label_100">제목</label><input type="text" name="EST_TITLE" id="EST_TITLE" class="wd_500" value="" title="제목"></span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label for="ORDER_STAFF_SEQ" class="label_100">구매 담당자 </label>
                            <select id="ORDER_STAFF_SEQ" name="ORDER_STAFF_SEQ" title="구매 담당자" class="wd_200">
                            </select>
                        </span>
                        <span class="slt_wrap">
                        <span class="gubun"></span>
                            <label for="COMP_CD" class="label_100">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="EST_USER_ID" class="label_100">견적 담당자</label>
                            <select id="EST_USER_ID" name="EST_USER_ID" title="견적 담당자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="EST_NUM" class="label_100">견적번호 (차수)</label><input type="text" name="EST_NUM" id="EST_NUM" class="wd_200" value="" title="견적번호 (차수)" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="DTL_AMOUNT" class="label_100">견적금액 계</label><input type="text" name="DTL_AMOUNT" id="DTL_AMOUNT" class="wd_200" value="" title="견적금액 계" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="INSERT_DT" class="label_100">업데이트 일시</label><input type="text" name="INSERT_DT" id="INSERT_DT" class="wd_200" value="" title="업데이트 일시" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="SEND_DT" class="label_100">회신일시</label><input type="text" name="SEND_DT" id="SEND_DT" class="wd_200" value="" title="회신일시" readonly></span>
                        <span class="gubun"></span>
                    </li>
                </ul>
            </div>
        </form>
        <%--<button type="button" class="topWrap_btn">펼치기 / 접기</button>--%>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <div class="right_sort">
                    <button type="button" class="defaultBtn btn-120w" id="btnEstimateRegisterEstimateListExcel">견적List 출력</button>
                    <button type="button" class="defaultBtn btn-120w" id="btnEstimateRegisterAdd">추가</button>
                    <button type="button" class="defaultBtn btn-120w" id="btnEstimateRegisterDelete">삭제</button>
                </div>
            </div>

            <%--<span class="chk_box mg-left15"><input id="chkEstimateRegisterDetail" type="checkbox"><label for="chkEstimateRegisterDetail"> 견적상세요건</label></span>--%>
        </div>
        <div class="tableWrap">
            <div class="buttonWrap">
                <div class="d-inline">
                    <button type="button" class="smallBtn yellow">견적정보</button>
                    <button type="button" class="smallBtn yellow">금액정보</button>
                    <span class="slt_wrap namePlusSlt right_float">
                        <label for="selEstimateRegisterCalculateApply">계산견적적용</label>
                        <select id="selEstimateRegisterCalculateApply" name="selEstimateRegisterCalculateApply" title="계산견적적용">
                            <option>Select</option>
                            <option>10%</option>
                            <option>20%</option>
                        </select>
                        <label for="selEstimateListExcel">견적서 추출</label>
                        <select id="selEstimateListExcel" name="selEstimateListExcel" title="견적서 추출">
                        </select>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateRegisterDrawAdd">도면 등록</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateRegisterDrawView">도면 보기</button>
                    </span>
                </div>
            </div>
            <div class="conMainWrap">
                <div id="estimate_register_top_grid" class="jqx-refresh"></div>
            </div>
            <br>
            <div class="conWrap">
                <div class="popup">
                    <div class="resultWrap">
                        <div class="left_sort">
                            <div class="col-md-6 col-sm-6">
                                <h3>메일내용</h3><textarea class="col-md-12 col-sm-12" id="EMAIL_CONTENT" name="EMAIL_CONTENT" style="height: 320px;"></textarea>
                            </div>
                            <div class="right_sort">
                                <h3 style="text-align: left;">메일수신처</h3>
                                <div class="conMainWrap">
                                    <div id="estimate_register_bot_grid"></div>
                                </div>
                                <br>
                                <h3 style="text-align: left;">첨부파일</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        let $btnEstimateRegisterDrawView = $("#btnEstimateRegisterDrawView");
        let $btnEstimateRegisterDrawAdd = $("#btnEstimateRegisterDrawAdd");

        let estimateRegisterTopColModel= [
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM', width: 80 } ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', width: 80 } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', width: 80 } ,
            {title: '', dataType: 'string', dataIndx: 'DRAWING_YN', width: 30 } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', validations: [{ type: 'minLen', value: 1, msg: "Required"}], width: 100 } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', width: 50 } ,
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                        let rowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                    {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE', format: '#,###'}
                ]},
            {title: '계산견적단가', dataType: 'float', dataIndx: 'CALCUL_EST_UNIT_COST', format: '#,###', width: 80},
            {title: '최종견적가', dataType: 'float', dataIndx: 'FINAL_EST_UNIT_PRICE', format: '#,###', width: 80},
            {title: '금액 계', dataType: 'float', dataIndx: 'FINAL_AMOUNT', format: '#,###', width: 80},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'DWF', dataType: 'string', dataIndx: 'DWF_GFILE_SEQ'},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'},
            {title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ'},
            {title: 'EST_SEQ', dataType: 'string', dataIndx: 'EST_SEQ' , hidden:true} ,
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ' , hidden:true}
        ];

        let estimateRegisterBotColModel= [
            {title: '', dataType: 'string', dataIndx: 'STAFF_SEQ', hidden: true },
            {title: '성함', dataType: 'string', dataIndx: 'STAFF_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'STAFF_EMAIL' },
            {title: '전화번호', dataType: 'string', dataIndx: 'STAFF_TEL' }
        ];

        estimateRegisterTopGrid.pqGrid({
            height: 300,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectEstimateDetailList'},
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            scrollModel: { autoFit: false },
            columnTemplate: {align: 'center', hvalign: 'center'},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: true,
            colModel: estimateRegisterTopColModel,
            showTitle: false,
            title: false,
            strNoRows: g_noData,
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
                    console.log(ui);

                    let rowIndx = ui.updateList[0].rowIndx;
                    let calculateEstimateAmt = 0;
                    let dataColumn = ['ITEM_QTY', 'UNIT_MATERIAL_AMT', 'UNIT_TM_AMT', 'UNIT_GRIND_AMT', 'UNIT_HEAT_AMT', 'UNIT_SURFACE_AMT', 'UNIT_PROCESS_AMT', 'UNIT_ETC_AMT'];
                    let data = ui.updateList[0].rowData;
                    let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == '' ? 0 : parseFloat(data.UNIT_MATERIAL_AMT);
                    let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == '' ? 0 : parseFloat(data.UNIT_SURFACE_AMT);
                    let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == '' ? 0 : parseFloat(data.UNIT_PROCESS_AMT);
                    let UNIT_ETC_AMT = data.UNIT_ETC_AMT == '' ? 0 : parseFloat(data.UNIT_ETC_AMT);
                    let ITEM_QTY = data.ITEM_QTY == '' ? 0 : parseFloat(data.ITEM_QTY);

                    calculateEstimateAmt += UNIT_MATERIAL_AMT;
                    calculateEstimateAmt += UNIT_SURFACE_AMT;
                    calculateEstimateAmt += UNIT_PROCESS_AMT;
                    calculateEstimateAmt += UNIT_ETC_AMT;
                    console.log("UNIT_MATERIAL_AMT:"+"["+UNIT_MATERIAL_AMT+"], "+"UNIT_SURFACE_AMT:"+"["+UNIT_SURFACE_AMT+"], "+
                        "UNIT_PROCESS_AMT:"+"["+UNIT_PROCESS_AMT+"], "+"UNIT_ETC_AMT:"+"["+UNIT_ETC_AMT+"]"+ "calculateEstimateAmt:"+"["+calculateEstimateAmt+"]");

                    estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'CALCUL_EST_UNIT_COST': calculateEstimateAmt } });

                    calculateEstimateAmt *= ITEM_QTY;
                    estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'FINAL_AMOUNT': calculateEstimateAmt } });

                }
            }
        });

        selectEstimateBotList('');

        function selectEstimateBotList(COMP_CD) {
            estimateRegisterBotGrid.pqGrid({
                height: 100,
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
                trackModel: {on: true},
                resizable: true,
                colModel: estimateRegisterBotColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData
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
            //estimateRegisterReloadPageData();
        };

        function estimateRegisterReloadPageData(){
            let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
            let postData = { 'queryId': 'estimate.selectEstimateMasterList', 'EST_SEQ': EST_SEQ };

            let parameter = {'url': '/json-list', 'data': postData};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                console.log(list);
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

                postData = { 'queryId': 'estimate.selectEstimateDetailList', 'EST_SEQ': EST_SEQ };
                fnRequestGidData(estimateRegisterTopGrid, postData);

                $("#estimate_register_excel_download #EST_SEQ").val(EST_SEQ);
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
            }, parameter, '');
        };

        $(document).on('click', '#test', function(){
            estimateRegisterReloadPageData();
        });


        /** 버튼 처리 **/
        $("#btn_estimate_register_save").on("click", function(){
            $("#estimate_register_info_form #queryId").val('selectEstimateNextSequence');

            let parameters = {'url': '/json-list', 'data': $("#estimate_register_info_form").serialize()};
            let EST_SEQ = $("#estimate_register_info_form #EST_SEQ").val();
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                if(EST_SEQ == '' || EST_SEQ == null){
                    EST_SEQ = list.EST_SEQ;
                }

                alert(EST_SEQ);
                $("#estimate_register_info_form #queryId").val('insertEstimateMaster');
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);

                parameters = {'url': '/json-create', 'data': $("#estimate_register_info_form").serialize()};
                fnPostAjax(estimateRegisterSaveCallBack, parameters, '');

            }, parameters, '');
        });

        $("#btnEstimateRegisterAdd").on('click', function(){
            estimateRegisterTopGrid.pqGrid('addNodes', [{}], 0);
        });

        $("#btnEstimateRegisterDelete").on('click', function(){
            let USER_MASTER_QUERY_ID = 'deleteEstimateDetail';

            fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
        });

        $("#btnEstimateRegisterEstimateListExcel").on('click', function(){
            fnReportFormToHiddenFormPageAction("packing_history_list_search_form", "/downloadExcel");
        });

        $("#chkEstimateRegisterDetail").on('click', function(){

        });

        $("#selEstimateRegisterCalculateApply").on('click', function(){

        });

        $("#selEstimateListExcel").on('click', function(){

        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawAdd.click(function () {
            setEstiMatePopup('estimate', 'estimate.manageEstimateCadFiles');
        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawView.click(function () {
            callWindowImageViewer(999);
        });

    });
</script>