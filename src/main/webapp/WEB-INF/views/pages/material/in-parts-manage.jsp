<%--
  Created by IntelliJ IDEA.
  User: jw.kim
  Date: 2020-04-28
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate machineWrap">
    <div class="topWrap">
        <form class="form-inline" id="search_form" name="search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="material.selectConsumableList">
            <input type="hidden" id="SEL_TAB_TYPE" name="SEL_TAB_TYPE" value="1">
            <div class="gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="SEL_WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="SEL_WAREHOUSE_CD" name="SEL_WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_LOC_SEQ" class="label_100">위치</label>
                            <select id="SEL_LOC_SEQ" name="SEL_LOC_SEQ" title="위치" data-required="true"  class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_CONSUMABLE_TYPE" class="label_100">자재종류</label>
                            <select id="SEL_CONSUMABLE_TYPE" name="SEL_CONSUMABLE_TYPE" title="자재종류" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1053}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_CONSUMABLE_DETAIL" class="label_100">자재상세종류</label>
                            <select id="SEL_CONSUMABLE_DETAIL" name="SEL_CONSUMABLE_DETAIL" title="자재상세종류" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="searchBtn">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="SEL_CONSUMABLE_NUM" class="label_100">자재 관리번호</label>
                            <input type="text" name="SEL_CONSUMABLE_NUM" id="SEL_CONSUMABLE_NUM" placeholder="자재 관리번호" value="" title="자재 관리번호" class="wd_200">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="SEL_CONSUMABLE_NM" class="label_100">자재명</label>
                            <input type="text" name="SEL_CONSUMABLE_NM" id="SEL_CONSUMABLE_NM" placeholder="자재명" value="" title="자재명" class="wd_200">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_ACTIVE_YN" class="label_100">활성여부</label>
                            <select id="SEL_ACTIVE_YN" name="SEL_ACTIVE_YN" title="활성여부" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                  <c:forEach var="vlocale" items="${HighCode.H_1042}">
                                      <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                  </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap mg-right10">
                             <label for="SEL_DAY_TYPE" class="label_100">날짜조회</label>
                            <select id="SEL_DAY_TYPE" name="SEL_DAY_TYPE" title="날짜조회" class="wd_100">
                                <option value="1">입력일시</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_1" value="today" ><label for="fr_1001_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_2" value="current_month"><label for="fr_1001_2">현재월</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="CONTROL_MANAGE_TERM" id="fr_1001_3" value="three_months"><label for="fr_1001_3">3개월</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_ST_DT" placeholder="" value="" title="시작날짜">
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_END_DT" placeholder="" value="" title="종료날짜">
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                        </div>
                        <span class="chk_box mg-left20">&nbsp;&nbsp;<input id="SEL_TERM_DT_USE" name="SEL_TERM_DT_USE" type="checkbox"><label for="SEL_TERM_DT_USE">선택</label></span>

                    </li>
                </ul>

            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>

    <div class="bottomWrap">
        <div class="hWrap">
            <div class="d-inline">

                <div class="rightSpan">
                    <button type="button" id="mainSaveBtn" class="defaultBtn yelllowGra">Save</button>

                </div>
            </div>
        </div>


        <div class="tableWrap jmestabs" id="div_tabs_part">
            <ul class="smallTabMenuTabs">
                <li class="active"><a href="#_TAB1" data-toggle="tab" aria-expanded="true">현황관리</a></li>
                <li><a href="#_TAB2" data-toggle="tab" aria-expanded="false">불출이력</a></li>
                <div class="right_sort">
                    <button type="button" id="mainAddBtn" class="defaultBtn radius ">Add</button>
                    <button type="button" id="mainDeleteBtn" class="defaultBtn radius red ">Delete</button>
                    <button type="button" id="mainLocBtn" class="defaultBtn radius black ">위치정보관리</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="_TAB1">
                    <div id="main_grid_01"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="MAIN_GRID_01_TOTAL_RECORDS" style="color: #00b3ee">0</span>)
                    </div>
                </ul>
                <ul class="conWrap" id="_TAB2">
                    <div id="main_grid_02"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="MAIN_GRID_02_TOTAL_RECORDS" style="color: #00b3ee">0</span>)
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>
<form class="form-inline" id="save_form" name="save_form" role="form">
    <input type="hidden" id="mainGrid" name="mainGrid" value="">
</form>
<!-- layer popup : S -->
<div class="popup_container consumable_container" id="PARTS_MANAGE_CURRENT_POPUP" style="display: none;">
    <form class="form-inline" id="pop_form" name="pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="material.selectConsumableList">
        <input type="hidden" id="SEL_CONSUMABLE_STOCK_SEQ" name="SEL_CONSUMABLE_STOCK_SEQ" value="">
        <input type="hidden" id="CONSUMABLE_STOCK_SEQ" name="CONSUMABLE_STOCK_SEQ" value="">
        <input type="hidden" id="OUT_QTY" name="OUT_QTY" value="0">
        <input type="hidden" id="STOCK_QTY" name="STOCK_QTY" value="">
        <div class="layerPopup consumablePop">
            <h3>자재/소모품 불출</h3>
            <button type="button" class="pop_close">닫기</button>
            <div class="list1">
                <table class="rowStyle">
                    <caption></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th>창고명</th>
                        <th>위치</th>
                        <th>자재관리번호</th>
                        <th>자재명</th>
                        <th>비고</th>
                    </tr>
                    <tr>
                        <td id="POP_WAREHOUSE_CD_NM"></td>
                        <td id="POP_LOC_SEQ_NM"></td>
                        <td id="POP_CONSUMABLE_NUM"></td>
                        <td id="POP_CONSUMABLE_NM"></td>
                        <td id="POP_NOTE"></td>
                    </tr>
                </table>
            </div>
            <h4>&nbsp;</h4>
            <div class="list1">
                <table class="rowStyle">
                    <caption></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                    </colgroup>
                    <tr>
                        <th>보유수량</th>
                        <th>남은수량</th>
                        <th>불출수량</th>
                        <th></th>
                        <th>요청자</th>
                    </tr>
                    <tr>
                        <td id="POP_STOCK_QTY"></td>
                        <td id="POP_CURR_QTY"></td>
                        <td id="POP_OUT_QTY"></td>
                        <td>
                            <button type="button" id="btnPlus" class="btn_plus">더하기</button>
                            <button type="button" id="btnMinus" class="btn_minus">빼기</button>
                        </td>
                        <td>
                            <select id="REQUEST_USER_ID" name="REQUEST_USER_ID" data-required="true" class="wd_180">
                                <option value=""><spring:message code="com.form.top.sel.option" /></option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <h4>&nbsp;</h4>
            <div class="list1">
                <table class="rowStyle">
                    <caption></caption>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tr>
                        <th>용도</th>
                        <td><input type="text" id="OUT_USE" name="OUT_USE" value="" class="wd_760"></td>
                    </tr>
                </table>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn btn-120w red" id="partsPopSaveBtn">SAVE</button>
                <button type="button" class="defaultBtn btn-120w green" id="partsCloseBtn">Close</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#btnPlus').on('click', function(e) {
        calcQty("PLUS");
    });
    $('#btnMinus').on('click', function(e) {
        calcQty("MINUS");
    });
    let calcQty = function(type){

        let POP_STOCK_QTY = $('#POP_STOCK_QTY').html();
        let POP_CURR_QTY = $('#POP_CURR_QTY').html();
        let POP_OUT_QTY = $("#pop_form").find("#OUT_QTY").val();
        if(POP_STOCK_QTY == "" || POP_STOCK_QTY == "0"){
            alert("수량이 없습니다.");
            return;
        }
        if(type == "PLUS"){
            if(parseInt(POP_CURR_QTY) > 0){
                POP_OUT_QTY = parseInt(POP_OUT_QTY)+1;
                POP_CURR_QTY = parseInt(POP_CURR_QTY)-1;
            }
        }else if(type == "MINUS"){
            if(parseInt(POP_OUT_QTY) > 0){
                POP_OUT_QTY = parseInt(POP_OUT_QTY)-1;
                POP_CURR_QTY = parseInt(POP_CURR_QTY)+1;
            }

        }

        $('#POP_CURR_QTY').html(POP_CURR_QTY);
        $('#POP_OUT_QTY').html(POP_OUT_QTY);
        $('#OUT_QTY').val(POP_OUT_QTY);
        console.log("POP_CURR_QTY",POP_CURR_QTY);
        console.log("POP_OUT_QTY",POP_OUT_QTY);

    }
    /**  선언 **/
    let SelectedRowIndex = [];

    let mainGridId01 = $("#main_grid_01");
    let mainColModel01;
    let mainPostData01;
    let mainObj01;

    let mainGridId02 = $("#main_grid_02");
    let mainColModel02;
    let mainPostData02;
    let mainObj02;
    let $mainGrid02;


    $(function () {
        'use strict';

        $("#search_form").find("#SEL_ACTIVE_YN").val("Y");

        /**  현황관리(GRID01) 그리드 선언 시작 **/
        $("#search_form").find("#queryId").val("material.selectConsumableList");
        mainPostData01 = fnFormToJsonArrayData('#search_form');
        mainColModel01 = [
            {title: 'CONSUMABLE_STOCK_SEQ', dataType: 'string', dataIndx: 'CONSUMABLE_STOCK_SEQ', hidden:true},
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "WAREHOUSE_CD_NM", id: "WAREHOUSE_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1049'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["WAREHOUSE_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '위치', dataType: 'string', dataIndx: 'LOC_SEQ_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "LOC_SEQ_NM", id: "LOC_SEQ" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
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
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["LOC_SEQ"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '자재관리번호', dataType: 'string', dataIndx: 'CONSUMABLE_NUM',
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '자재명', dataType: 'string', dataIndx: 'CONSUMABLE_NM',
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '자재종류', dataType: 'string', dataIndx: 'CONSUMABLE_TYPE_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "CONSUMABLE_TYPE_NM", id: "CONSUMABLE_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1053'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["CONSUMABLE_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '자재상세종류', dataType: 'string', dataIndx: 'CONSUMABLE_DETAIL_NM', minWidth: 120,
                editor: {
                    type: 'select',
                    mapIndices: { name: "CONSUMABLE_DETAIL_NM", id: "CONSUMABLE_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: function(ui) {
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let CONSUMABLE_TYPE = rowData["CONSUMABLE_TYPE"];

                        return fnGetCommCodeRefCdGridSelectBox('1054', CONSUMABLE_TYPE);
                    },
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["CONSUMABLE_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '보유수량', dataType: 'string', dataIndx: 'STOCK_QTY', editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true},
            {title: '입고', dataType: 'integer', dataIndx: 'IN_QTY', editable: true},
            {title: '불출', align: 'center', dataType: 'string', dataIndx: 'POPUP', width: 20, minWidth: 20, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['CONSUMABLE_STOCK_SEQ'] > 0 && ui.rowData['STOCK_QTY'] > 0) return "[불출]";
                    return '';
                }
            },
            {title: '활성여부', align: 'center', dataIndx: 'ACTIVE_YN', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}, type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            }
        ];
        mainGridId01.pqGrid({
            width: "100%", height: 600,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'CONSUMABLE_STOCK_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('search_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center'
            },
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: mainColModel01,
            complete: function () {
                let data = mainGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#MAIN_GRID_01_TOTAL_RECORDS').html(totalRecords);
            },
            rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                if (ui.dataIndx == 'POPUP') {
                    if (ui.rowData['CONSUMABLE_STOCK_SEQ'] > 0 && ui.rowData['STOCK_QTY'] > 0){
                        $("#pop_form").find("#SEL_CONSUMABLE_STOCK_SEQ").val(ui.rowData['CONSUMABLE_STOCK_SEQ']);
                        $("#pop_form").find("#queryId").val("material.selectConsumableList");
                        $('#PARTS_MANAGE_CURRENT_POPUP').modal('show');
                    }else{}
                    return;
                }
            }
        });
        /**  현황관리(GRID01) 그리드 선언 끝 **/

        /**  수불이력 그리드 선언 시작 **/
        $("#search_form").find("#queryId").val("material.selectConsumableHistoryList");
        mainPostData02 = fnFormToJsonArrayData('#search_form');
        mainColModel02 = [
            {title: '수불 구분', dataType: 'string', dataIndx: 'IN_OUT_NM', editable: false},
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM', editable: false},
            {title: '위치', dataType: 'string', dataIndx: 'LOC_NM', editable: false},
            {title: '자재관리번호', dataType: 'string', dataIndx: 'CONSUMABLE_NUM', editable: false},
            {title: '자재명', dataType: 'string', dataIndx: 'CONSUMABLE_NM', editable: false},
            {title: '자재종류', dataType: 'string', dataIndx: 'CONSUMABLE_TYPE_NM', editable: false},
            {title: '자재상세종류', dataType: 'string', dataIndx: 'CONSUMABLE_DETAIL_NM', editable: false},
            {title: '입고수량', dataType: 'string', dataIndx: 'IN_QTY', editable: false},
            {title: '불출수량', dataType: 'string', dataIndx: 'OUT_QTY', editable: false},
            {title: '요청자', dataType: 'string', dataIndx: 'REQUEST_USER_NM', editable: false},
            {title: '입력일시', dataType: 'string', dataIndx: 'IN_OUT_DT', editable: false}
        ];
        mainGridId02.pqGrid({
            width: "100%", height: 600,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'CONSUMABLE_STOCK_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('search_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center'
            },
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: mainColModel02,
            complete: function () {
                let data = mainGridId02.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#MAIN_GRID_02_TOTAL_RECORDS').html(totalRecords);
            },
            rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                if (ui.dataIndx == 'POPUP') {
                    if (ui.rowData['CONSUMABLE_STOCK_SEQ'] > 0){
                        alert("불출 팝업");
                    }else{}
                    return;
                }
            }
        });
        /**  수불이력 그리드 선언 끝 **/
        $("#search_form").find("#queryId").val("material.selectConsumableList");

/**  이벤트  **/

        $(".datepicker-input").each(function(){ $(this).datepicker();});

        $("#search_form").find("#SEL_WAREHOUSE_CD").change(function(){
            let WAREHOUSE_CD = this.value;
            let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'material.selectWarehouseLocationList'}};
            fnCommCodeDatasourceSelectBoxCreate($("#search_form").find("#SEL_LOC_SEQ"), 'all', paramData);
        });
        $("#search_form").find("#SEL_CONSUMABLE_TYPE").change(function(){
            let highCd =  1054;
            let refCD =  this.value;
            fnCommCodeRefCdDynamicSelectBoxCreate($("#search_form").find("#SEL_CONSUMABLE_DETAIL"), highCd, 'all', refCD);

        });
        let fnGetCommCodeRefCdGridSelectBox = function (highCd, refCd) {
            'use strict';
            let selectBoxContents = [];
            for(var i=0; i < g_code.length; i++){
                if(g_code[i].HIGH_CD == highCd){
                    if(g_code[i].REF_CD == refCd) {
                        selectBoxContents.push({'value': g_code[i].CODE_CD, 'text': g_code[i].CODE_NM_KR});
                    }
                }
            }
            return selectBoxContents;
        };
        let fnCommCodeRefCdDynamicSelectBoxCreate = function ($formId, highCd, selectType, refCd) {
            'use strict';
            $formId[0].options.length = 0;
            fnSelectBoxTopSetting($formId, selectType);
            for(let i=0; i < g_code.length; i++){
                if(g_code[i].HIGH_CD == highCd){

                    if(refCd !='' || refCd != null) {
                        if(g_code[i].REF_CD == refCd) {

                            $formId[0].add(new Option(g_code[i].CODE_NM_KR, g_code[i].CODE_CD));
                        }
                    }else{
                        $formId[0].add(new Option(g_code[i].CODE_NM_KR, g_code[i].CODE_CD));
                    }
                }
            }
        };
        $("#searchBtn").on('click', function(e) {
            let targetTab = $("#search_form").find("#SEL_TAB_TYPE").val();
            let SEL_TERM_DT_USE = $("#search_form").find("#SEL_TERM_DT_USE").val();
            let SEL_ST_DT = $("#search_form").find("#SEL_ST_DT").val();
            let SEL_END_DT = $("#search_form").find("#SEL_END_DT").val();

            if(SEL_TERM_DT_USE == "Y"){
                if(SEL_ST_DT == "" || SEL_END_DT == ""){
                    alert("날짜 검색을 선택하셨습니다.\n시작날짜와 종료날짜를 선택하여 주십시오.");
                    return;
                }
            }

            if(targetTab == "1"){
                //$mainGrid01 = $('#' + mainGridId01).pqGrid(mainObj01);
                mainGridId01.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#search_form');
                } );
                mainGridId01.pqGrid("refreshDataAndView");
            }else if(targetTab == "2"){
                //$mainGrid02 = $('#' + mainGridId02).pqGrid(mainObj02);
                mainGridId02.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#search_form');
                } );
                mainGridId02.pqGrid("refreshDataAndView");
            }else{
                alert("탭 선택이 잘못되었습니다.");
            }

        });
        $('#SEL_TERM_DT_USE').on('click', function(e) {
            if ($(this).is(':checked')) {
                $(this).val('Y');
            }else {
                $(this).val('N');
            }
        });

        $("#mainAddBtn").click(function(event){
            mainGridId01.pqGrid('addNodes', [{"ACTIVE_YN":"Y"}], 0);
        });
        $("#mainLocBtn").click(function(event){
            alert("위치정보관리 작업중");
        });

        let gridValidation = function(targetGrid){
            let gridInstance = $("#" + targetGrid).pqGrid('getInstance').grid;
            let addList = gridInstance.getChanges().addList;
            let errCnt = 0;
            for (var i = 0; i < addList.length; i++) {
                var rowData = addList[i];
                var isValid = gridInstance.isValid({ "rowData": rowData }).valid;
                if (!isValid) {
                    errCnt++;
                }
            }

            let updateList = gridInstance.getChanges().updateList;
            for (var i = 0; i < updateList.length; i++) {
                var rowData = updateList[i];
                var isValid = gridInstance.isValid({ "rowData": rowData }).valid;
                if (!isValid) {
                    errCnt++;
                }
            }

            if(errCnt >0){
                return false;
            }else{
                return true;
            }

        }
        $("#mainSaveBtn").click(function(event){

            if(!gridValidation("main_grid_01")){
                alert("그리드의 값이 올바르지 않습니다.");
                return;
            }

            if(confirm("저장 하시겠습니까?")){
                // 그리드 데이터 폼에 넣기 to-do
                let insertQueryList = ['material.insertConsumable','material.insertConsumableIn'];
                let updateQueryList = ['material.updateConsumable','material.insertConsumableIn'];
                fnModifyPQGrid(mainGridId01, insertQueryList, updateQueryList);



                var gridInstance = mainGridId01.pqGrid('getInstance').grid;
                var changes = gridInstance.getChanges({format: 'byVal'});
                //$("#save_form").find("#mainGrid").val(JSON.stringify(changes));
                console.log("change",JSON.stringify(changes));
                return;
                // let parameters = {
                //     'url': '/managerEquip',
                //     'data': $('#save_form').serialize()
                // };
                // fnPostAjax(function (data, callFunctionParam) {
                //     alert('장비상세 정보가 저장되었습니다.');
                //     $('#PARTS_MANAGE_CURRENT_POPUP').modal('hide');
                //     $searchBtn.trigger("click");
                // }, parameters, '');

            }
        });

        $("#mainDeleteBtn").click(function(event){
            if(SelectedRowIndex == "" || SelectedRowIndex == null){
                alert("삭제할 데이터를 선택해 주십시오.");
                return;
            }
            let rowCnt = "";
            let rowData = mainGridId01.pqGrid("getRowData", {rowIndx: SelectedRowIndex});
            let CONSUMABLE_STOCK_SEQ = rowData["CONSUMABLE_STOCK_SEQ"];
            let deleteData = {
                "url" : '/json-info',
                'data' :
                    {
                        "queryId": 'material.selectConsumableInCnt',
                        "CONSUMABLE_STOCK_SEQ" : CONSUMABLE_STOCK_SEQ
                    }
            };
            fnPostAjaxAsync(function (data, callFunctionParam) {
                rowCnt = data.info.CNT;
                console.log(rowCnt);
            }, deleteData, '');

            if(rowCnt > 0){
                alert("입고 이력이 존재 합니다.\n삭제를 위해서 관리자에게 문의 하십시오.");
                return;
            }else{
                if(confirm("자재관리가 바로 삭제됩니다.\n삭제 하시겠습니까?")){
                    //$historyGrid.pqGrid('deleteRow', {'rowIndx': SelectedRowIndex});//rowIndx
                    fnDeletePQGrid(mainGridId01, SelectedRowIndex, "material.deleteConsumable");
                }
            }
        });
        $('[name=CONTROL_MANAGE_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            switch (value) {
                case 'today':
                    changeDate(newDate, today);
                    break;
                case 'current_month':
                    newDate.setDate(1);

                    changeDate(newDate, today);
                    break;
                case 'three_months':
                    newDate.setMonth(newDate.getMonth() - 3);

                    changeDate(newDate, today);
                    break;
            }

           // $('#CONTROL_MANAGE_DATEPICKER_READ_ONLY').prop('checked', true);
            //createOrDestoryDatepicker();
        });
        let changeDate = function (newDate = new Date(), today = new Date()) {

            $('#SEL_ST_DT').val(newDate.yyyymmdd());
            $('#SEL_END_DT').val(today.yyyymmdd());

        };
        $('.pop_close, #partsCloseBtn').on('click', function(e) {
            $('#PARTS_MANAGE_CURRENT_POPUP').modal('hide');
        });

        $('#partsPopSaveBtn').click(function(event){
            if(confirm("불출 신청 하시겠습니까?")){

                $("#pop_form").find("#queryId").val("material.insertConsumableOut");
                let parameters = {
                    'url': '/json-update',
                    'data': $('#pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    alert("불출 신청 되었습니다.");
                    $("#searchBtn").trigger('click');
                    $('#PARTS_MANAGE_CURRENT_POPUP').modal('hide');

                }, parameters, '');

            };
        });

        let paramData = {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}};
        fnCommCodeDatasourceSelectBoxCreate($("#pop_form").find("#REQUEST_USER_ID"), '', paramData);
    });



    $("#div_tabs_part").tabs({
        activate: function(event, ui) {
            ui.newPanel.find('.pq-grid').pqGrid('refresh');
            let selTab = ui.newPanel.selector;
            if(selTab == "#_TAB1"){
                $("#search_form").find("#SEL_TAB_TYPE").val("1");
                $("#search_form").find("#queryId").val("material.selectConsumableList");

                $("#mainAddBtn").show();
                $("#mainDeleteBtn").show();
                $("#mainLocBtn").show();
            }else if(selTab == "#_TAB2"){
                $("#search_form").find("#SEL_TAB_TYPE").val("2");
                $("#search_form").find("#queryId").val("material.selectConsumableHistoryList");
                $("#mainAddBtn").hide();
                $("#mainDeleteBtn").hide();
                $("#mainLocBtn").hide();
            }
            $("#searchBtn").trigger('click');

        }
    });

    $("#PARTS_MANAGE_CURRENT_POPUP").on('hide.bs.modal', function(){
        fnResetFrom("pop_form");
        $("#machine_manage_pop_form").find("#queryId").val("material.selectConsumableList");
        $("#searchBtn").trigger("click");
    });
    // 모달 open
    $("#PARTS_MANAGE_CURRENT_POPUP").on('show.bs.modal', function(){
        $("#pop_form").find("#queryId").val("material.selectConsumableList");
        console.log($('#pop_form').serialize());
        let parameters = {
            'url': '/json-info',
            'data': $('#pop_form').serialize()
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;

            if(dataInfo == null ) {
                alert("해당 정보가 없습니다. ")
                $('#PARTS_MANAGE_CURRENT_POPUP').modal('hide');
            }else{
                fnJsonDataToForm("pop_form", dataInfo);
                $("#pop_form").find("#SEL_CONSUMABLE_STOCK_SEQ").val(dataInfo.CONSUMABLE_STOCK_SEQ);
                $("#pop_form").find("#POP_WAREHOUSE_CD_NM").html(dataInfo.WAREHOUSE_CD_NM);
                $("#pop_form").find("#POP_LOC_SEQ_NM").html(dataInfo.LOC_SEQ_NM);
                $("#pop_form").find("#POP_CONSUMABLE_NUM").html(dataInfo.CONSUMABLE_NUM);
                $("#pop_form").find("#POP_CONSUMABLE_NM").html(dataInfo.CONSUMABLE_NM);
                $("#pop_form").find("#POP_NOTE").html(dataInfo.NOTE);
                $("#pop_form").find("#POP_STOCK_QTY").html(dataInfo.STOCK_QTY);
                $("#pop_form").find("#POP_CURR_QTY").html(dataInfo.STOCK_QTY);
                $("#pop_form").find("#POP_OUT_QTY").html("0");
                $("#pop_form").find("#OUT_QTY").val("0");
                $("#pop_form").find("#OUT_USE").val("");
            }
        }, parameters, '');
    });

    // topWrap 확장 함수
    function topMenuOpen(){
        var top = $('.gubunWrap');
        var con = $('.bottomWrap .tableWrap .conWrap');
        var con2 = $('.bottomWrap .tableWrap .conSubWrap');
        var _h = con.height() - 100;
        var _h2 = con2.height() - 100;

        top.stop().animate({height:'136px'},300, 'easeOutCubic');
        con.stop().animate({height: _h },300, 'easeOutCubic');
        con2.stop().animate({height: _h2 },300, 'easeOutCubic');
    }

    // topWrap 축소 함수
    function topMenuClose(){
        var top = $('.gubunWrap');
        var con = $('.bottomWrap .tableWrap .conWrap');
        var con2 = $('.bottomWrap .tableWrap .conSubWrap');
        var _h = con.height() + 100;
        var _h2 = con2.height() + 100;

        top.stop().animate({height:"36px"}, 300, 'easeInCubic');
        con.stop().animate({height: _h},300, 'easeInCubic');
        con2.stop().animate({height: _h2},300, 'easeInCubic');
    }

</script>
