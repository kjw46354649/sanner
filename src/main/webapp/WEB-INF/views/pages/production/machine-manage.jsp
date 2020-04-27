<%--
  Created by IntelliJ IDEA.
  User: jw.kim
  Date: 2020-04-21
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>

    .layerPopup .list99 { height: 360px; -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=10, Direction=0, Color=#000000)"; }
    .layerPopup .list99 .rowStyle tr th { border: 1px solid #acb9b9; background: #e8f0f0; color: #162f2f; text-align: center; padding: 5px; }
    .layerPopup .list99 .rowStyle tr td { border: 1px solid #cecece; color: #444; padding: 5px; text-align: center; font-family: 'NotoKrR'; }
    .layerPopup .list99 .rowStyle tr td.red { color: #e71b1b; }

    .layerPopup .list98 { height: 200px; background: #e1e1e1; }

    .resultWrap99 { -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=10, Direction=0, Color=#000000)"; }
    .resultWrap99 .leftWrap { height: 150px; width: 40%; float: left; }
    .resultWrap99 .rightWrap { height: 150px; width: 58%; float: right; }





</style>



<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="machine_manage_search_form" name="machine_manage_search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="machine.selectMachineList">
            <input type="hidden" id="SEL_EQUIP_KIND" name="SEL_EQUIP_KIND" value="1">
            <div class="gubunWrap">
                <ul>
                    <div class="dateWrap">
                        <button type="button" class="search_btn" id="searchBtn">검색</button>
                    </div>
                    <li>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP_TYPE">장비종류</label>
                            <select id="SEL_EQUIP_TYPE" name="SEL_EQUIP_TYPE" title="장비종류" data-required="true" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1012}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP_SIZE">장비규격</label>
                            <select id="SEL_EQUIP_SIZE" name="SEL_EQUIP_SIZE" title="장비규격" data-required="true" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1034}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="SEL_EQUIP_NM">장비명</label>
                            <input type="text" name="SEL_EQUIP_NM" id="SEL_EQUIP_NM" placeholder="장비명" value="" title="장비명">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label for="SEL_FACTORY_AREA">설치위치</label>
                            <select id="SEL_FACTORY_AREA" name="SEL_FACTORY_AREA" title="설치위치" data-required="true" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1005}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="SEL_MAIN_USER_ID">담당자</label>
                            <input type="text" name="SEL_MAIN_USER_ID" id="SEL_MAIN_USER_ID" placeholder="담당자" value="" title="담당자">
                        </span>
                    </li>
                </ul>
                <div class="dateWrap">
                    <div class="leftSpan">
                        <span class="slt_wrap">
                            <select id="SEL_DAY_TYPE" name="SEL_DAY_TYPE" title="날짜조회">
                                <option value="1">구입시기</option>
<%--                                <option value="2">정비일시</option>--%>
<%--                                <option value="3">최근종료일시</option>--%>
                            </select>
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
                            <span class="chk_box no_txt"><input id="SEL_TERM_DT_USE" name="SEL_TERM_DT_USE" type="checkbox"><label for="SEL_TERM_DT_USE">선택</label></span>
                        </div>

                    </div>
                    <div class="rightSpan">
                        <span class="txt">&nbsp;</span>
                    </div>

                </div>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap">
        <div class="hWrap" style="height:55px">
<%--            <span class="buttonWrap">--%>
<%--                <button type="button" class="defaultBtn">견적서 신규 작성</button>--%>
<%--            </span>--%>
            <div class="rightSpan">
                <span class="buttonWrap">
                    <button type="button" id="newBtn" class="defaultBtn yelllowGra">신규등록</button>
                </span>
            </div>
        </div>
        <div class="tableWrap">
<%--            <span class="buttonWrap">--%>
<%--                <button type="button" class="smallBtn">견적정보</button>--%>
<%--                <button type="button" class="smallBtn blue">금액정보</button>--%>
<%--            </span>--%>
<%--            <div class="conMainWrap buttonWrap">--%>
<%--                <div id="estimate_master_top_grid" class="jqx-refresh"></div>--%>
<%--            </div>--%>
<%--            <span class="buttonWrap">--%>
<%--            </span>--%>
<%--            <div class="conSubWrap">--%>
<%--                <div id="estimate_master_bot_grid" class="jqx-refresh"></div>--%>
<%--            </div>--%>
            <div id="div_tabs">
                <div class="">&nbsp;
                    <ul class="nav nav-tabs m-b-n-xxs">
                        <li class="active">
                            <a href="#_TAB1" data-toggle="tab" aria-expanded="true">가공장비</a>
                        </li>
                        <li class="">
                            <a href="#_TAB2" data-toggle="tab" aria-expanded="false">기타장비</a>
                        </li>
                    </ul>
                    <div class="panel panel-default tab-content">
                        <ul class="list-group tab-pane active" id="_TAB1">
                            <div class="row">
                                <div id="machine_manage_current_grid"></div>
                            </div>
                        </ul>
                        <ul class="list-group tab-pane list-group-alt list-group-lg" id="_TAB2">
                            <div class="row">
                                <div id="machine_manage_etc_grid"></div>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- layer popup : S -->
<div class="popup_container" id="CURRENT_POPUP" style="display: none;">
    <form class="form-inline" id="machine_manage_pop_form" name="machine_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectMachineInfo">
        <input type="hidden" id="SEQ" name="SEQ" value="">
        <input type="hidden" id="EQUIP_KIND" name="EQUIP_KIND" value="">
        <input type="hidden" id="EQUIP_ID" name="EQUIP_ID" value="" >
        <input type="hidden" id="historyGrid" name="historyGrid" value="" >

        <div class="layerPopup">
            <h3>장비상세정보</h3>
            <button type="button" class="pop_close">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
					<span class="buttonWrap">
						<button type="button" id="saveBtn" class="onoff left on">SAVE</button>
						<button type="button" id="deleteBtn" class="onoff right">DELETE</button>
					</span>

                </div>
                <div class="resultWrap99 list99">
                    <div class="leftWrap">
                        <input type="hidden" id="PHOTO_GFILE_SEQ" name="PHOTO_GFILE_SEQ" value="">
                        <img src="/image/999" id="PHOTO_GFILE_SRC" width="400px" alt="장비사진" class="img-circle m-b">
                        <div class="btnWrap">
                            <button type="button" id="photo_upload" class="defaultBtn">사진변경하기</button>
                        </div>
                    </div>
                    <div class="rightWrap">
                        <table class="rowStyle">
                            <caption></caption>
                            <colgroup>
                                <col width="24%">
                                <col width="24%">
                                <col width="24%">
                                <col width="24%">
                            </colgroup>
                            <tr>
                                <th scope="row">Item ID</th>
                                <td id="EQUIP_ID_NM"></td>
                                <th scope="row">구분</th>
                                <td id="EQUIP_KIND_NM"></td>
                            </tr>
                            <tr>
                                <th scope="row">장비명</th>
                                <td ><input type="text" name="EQUIP_NM" id="EQUIP_NM" placeholder="장비명" value="" title="장비명"></td>
                                <th scope="row">공정</th>
                                <td>
                                    <select id="PROCESS_TYPE" name="PROCESS_TYPE" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1010}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">장비종류</th>
                                <td>
                                    <select id="EQUIP_TYPE" name="EQUIP_TYPE" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1012}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">장비규격</th>
                                <td>
                                    <select id="EQUIP_SIZE" name="EQUIP_SIZE" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1034}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">제조사</th>
                                <td>
                                    <select id="EQUIP_COMP_CD" name="EQUIP_COMP_CD" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1037}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">설치위치</th>
                                <td>
                                    <select id="FACTORY_AREA" name="FACTORY_AREA" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1005}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">담당자(정)</th>
                                <td>
                                    <select id="MAIN_USER_ID" name="MAIN_USER_ID" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    </select>
                                </td>
                                <th scope="row">담당자(부)</th>
                                <td>
                                    <select id="SUB_USER_ID" name="SUB_USER_ID" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">구입시기</th>
                                <td>
                                    <input class="datepicker-input" type="text" name="PURCHASE_DT" id="PURCHASE_DT" placeholder="" value="" title="구입시기" readonly>
                                </td>
                                <th scope="row">리셀러</th>
                                <td>
                                    <select id="RESELLER_CD" name="RESELLER_CD" data-required="true" class="form-control parsley-validated">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1022}">
                                            <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td colspan="3">
                                    <input type="hidden" id="ETC_GFILE_SEQ" name="ETC_GFILE_SEQ" value="">
                                    <input type="text" id="ETC_GFILE_SEQ_NM" name="ETC_GFILE_SEQ_NM" class="form-control" placeholder="첨부파일" readonly>
                                    <input type="button" id="etc_attach_file" name="etc_attach_file" value="fileUpload">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비고</th>
                                <td colspan="3">
                                    <input type="text" id="NOTE" name="NOTE" class="form-control" placeholder="비고">
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div class="rightSpan">

                    <span class="buttonWrap">
                        <button type="button" class="defaultBtn grayGra" id="addHistoryBtn">Add</button>
                        <button type="button" class="defaultBtn yelllowGra" id="deleteHistoryBtn">Delete</button>
                    </span>
                </div>

                <div class="list98">
                    <div id="div_tabs2">
                        <div class="">&nbsp;
                            <ul class="nav nav-tabs m-b-n-xxs">
                                <li class="active" id="_TAB3_TITLE">
                                    <a href="#_TAB3" data-toggle="tab" aria-expanded="true">작동로그</a>
                                </li>
                                <li class="" id="_TAB4_TITLE">
                                    <a href="#_TAB4" data-toggle="tab" aria-expanded="false">정비이력</a>
                                </li>
                            </ul>
                            <div class="panel panel-default tab-content">
                                <ul class="list-group tab-pane active" id="_TAB3">
                                    <div class="row">
                                        <div id="machine_manage_log_grid"></div>
                                    </div>
                                </ul>
                                <ul class="list-group tab-pane list-group-alt list-group-lg" id="_TAB4">
                                    <div class="row">
                                        <div id="machine_manage_history_grid"></div>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%--            <div class="btnWrap">--%>
<%--                <button type="button" class="defaultBtn">CLOSE</button>--%>
<%--            </div>--%>
        </div>

</div>
<!-- 품질실적 layer popup : E -->


<script type="text/javascript">
    /**  선언 **/
    let $searchBtn = $("#searchBtn");
    let $saveBtn = $("#saveBtn");
    let $deleteBtn = $("#deleteBtn");
    let $newBtn = $("#newBtn");

    let SelectedRowIndex = [];

    let currentGridId = 'machine_manage_current_grid';
    let currentColModel;
    let currentPostData;
    let currentObj;
    let $currentGrid;

    let etcGridId = 'machine_manage_etc_grid';
    let etcColModel;
    let etcPostData;
    let etcObj;
    let $etcGrid;

    let logGridId = 'machine_manage_log_grid';
    let logColModel;
    let logPostData;
    let logObj;
    let $logGrid;

    let historyGridId = 'machine_manage_history_grid';
    let historyColModel;
    let historyPostData;
    let historyObj;
    let $historyGrid;

    $(function () {
        'use strict';

/**  가공장비 그리드 선언 시작 **/
        currentPostData = fnFormToJsonArrayData('#machine_manage_search_form');
        currentColModel = [
            {title: '사진', dataType: 'string', dataIndx: 'PHOTO_GFILE_SEQ', minWidth: 80 ,
                render: function(ui){
                    let CELL_PHOTO_GFILE_SEQ = ui.rowData['PHOTO_GFILE_SEQ'];
                    if (CELL_PHOTO_GFILE_SEQ > 0) return "<img src='/image/" + CELL_PHOTO_GFILE_SEQ + " width='100px' height='100px'>";
                    return "";
                },
                postRender: function (ui) {
                    // let grid = this, $cell = grid.getCell(ui);
                    // $cell.find("#imageView").bind("click", function () {
                    //     callWindowImageViewer(ui.rowData.PHOTO_GFILE_SEQ);
                    // });
                }
            },
            {title: 'Item ID', dataType: 'string', dataIndx: 'EQUIP_ID'},
            {title: '장비명', dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비<br>종류', dataType: 'string', dataIndx: 'EQUIP_TYPE_NM'},
            {title: '장비<br>규격', dataType: 'string', dataIndx: 'EQUIP_SIZE_NM'},
            {title: '제조사', dataType: 'string', dataIndx: 'EQUIP_COMP_NM'},
            {title: '리셀러', dataType: 'string', dataIndx: 'RESELLER_NM'},
            {title: '설치위치', dataType: 'string', dataIndx: 'FACTORY_AREA_NM'},
            {title: '공장<br>구분', dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: '구입시기', dataType: 'string', dataIndx: 'PURCHASE_DT'},
            {title: '담당(정)', dataType: 'string', dataIndx: 'MAIN_USER_NM'},
            {title: '담당(부)', dataType: 'string', dataIndx: 'SUB_USER_NM'},
            {title: '작동시작<br>(누적)', dataType: 'string', dataIndx: 'WORKING_TIME'},
            //{title: '최근<br>정비일시', dataType: 'string', dataIndx: ''},
            {title: '최근종료일시', dataType: 'string', dataIndx: 'LAST_REPAIR_DT'},
            {title: '최근 수행 관리번호', dataType: 'string', dataIndx: 'LAST_CONTROL_NUM'}
        ];
        currentObj = {
            width: 1450,
            height: 600, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            editable : false,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: currentColModel,
            toolbar: {},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: currentPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PHOTO_GFILE_SEQ' || ui.dataIndx === 'EQUIP_NM'){
                    let target = ui.rowData.EQUIP_ID;

                    fnResetFrom("machine_manage_pop_form");
                    $("#machine_manage_pop_form").find("#EQUIP_ID").val(target);
                    $('#CURRENT_POPUP').modal('show');
                }
            }
        };
        $currentGrid = $('#' + currentGridId).pqGrid(currentObj);
/**  가공장비 그리드 선언 끝 **/

/**  기타장비 그리드 선언 시작 **/
        etcPostData = fnFormToJsonArrayData('#machine_manage_search_form');
        etcColModel = [
            {title: '사진', dataType: 'string', dataIndx: 'PHOTO_GFILE_SEQ', minWidth: 80 ,
                render: function(ui){
                    let CELL_PHOTO_GFILE_SEQ = ui.rowData['PHOTO_GFILE_SEQ'];
                    if (CELL_PHOTO_GFILE_SEQ > 0) return "<img src='/image/" + CELL_PHOTO_GFILE_SEQ + " width='100px' height='100px'>";
                    return "";
                },
                postRender: function (ui) {
                    // let grid = this, $cell = grid.getCell(ui);
                    // $cell.find("#imageView").bind("click", function () {
                    //     callWindowImageViewer(ui.rowData.PHOTO_GFILE_SEQ);
                    // });
                }
            },
            {title: 'Item ID', dataType: 'string', dataIndx: 'EQUIP_ID'},
            {title: '장비명', dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비<br>종류', dataType: 'string', dataIndx: 'EQUIP_TYPE_NM'},
            {title: '장비<br>규격', dataType: 'string', dataIndx: 'EQUIP_SIZE_NM'},
            {title: '제조사', dataType: 'string', dataIndx: 'EQUIP_COMP_NM'},
            {title: '리셀러', dataType: 'string', dataIndx: 'RESELLER_NM'},
            {title: '설치위치', dataType: 'string', dataIndx: 'FACTORY_AREA_NM'},
            {title: '공장<br>구분', dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: '구입시기', dataType: 'string', dataIndx: 'PURCHASE_DT'},
            {title: '담당(정)', dataType: 'string', dataIndx: 'MAIN_USER_NM'},
            {title: '담당(부)', dataType: 'string', dataIndx: 'SUB_USER_NM'},
            {title: '작동시작<br>(누적)', dataType: 'string', dataIndx: 'WORKING_TIME'},
            //{title: '최근<br>정비일시', dataType: 'string', dataIndx: ''},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        etcObj = {
            width: 1450,
            height: 600, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: etcColModel,
            toolbar: {},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: etcPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PHOTO_GFILE_SEQ' || ui.dataIndx === 'EQUIP_NM'){
                    let target = ui.rowData.EQUIP_ID;

                    fnResetFrom("machine_manage_pop_form");
                    $("#machine_manage_pop_form").find("#EQUIP_ID").val(target);
                    $('#CURRENT_POPUP').modal('show');
                }
            }
        };
        $etcGrid = $('#' + etcGridId).pqGrid(etcObj);
/**  기타장비 그리드 선언 끝 **/

/**  작동로그 그리드 선언 시작 선언만 해놓고 작업은 업무 협의 되면 진행. **/
        logPostData = fnFormToJsonArrayData('#machine_manage_search_form');
        logColModel = [
            {title: '관리번호', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '재질', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '규격', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '수량', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '시작일시', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '작업자', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '종료일시', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '작업자', dataType: 'string', dataIndx: 'EQUIP_ID'},
            // {title: '정지시간', dataType: 'string', dataIndx: 'EQUIP_ID'},
            {title: '작업시간', dataType: 'string', dataIndx: 'SEQ'}
        ];
        logObj = {
            width: 950,
            height: 170, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: logColModel,
            toolbar: {},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: logPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowClick: function( event, ui ) {
                console.log(ui) ;
                // let rowData = ui.rowData;
                // fnResetFrom("company_master_register_form");
                // $("#company_master_register_form").find("#COMP_CD").val(rowData.COMP_CD);
                // $('#system_company_popup').modal('show');
            }
        };
        $logGrid = $('#' + logGridId).pqGrid(logObj);
/**  작동로그 그리드 선언 끝 **/

/**  정비이력 그리드 선언 시작 **/
let dateEditor = function (ui) {
    let $inp = ui.$cell.find("input"),
        grid = this,
        format = ui.column.format || "yy-mm-dd",
        //val = $.datepicker.formatDate("yy-mm-dd HH:mm", new Date($inp.val()));
        //val = $.datepicker.formatTime("YYYY-MM-DD HH:mm", new Date($inp.val()));
        val = $inp.val();

    //initialize the editor
    $inp
        .attr('readonly', 'readonly')
        .val(val)
        .datetimepicker({
            // changeMonth: true,
            // changeYear: true,
            dateFormat: format,
            timeFormat : "HH:mm",
            showAnim: '',
            onSelect: function () {
                this.firstOpen = true;
            },
            beforeShow: function (input, inst) {
                setTimeout(function () {
                    //to fix the issue of datepicker z-index when grid is in maximized state.
                    $('.ui-datepicker').css('z-index', 999999999999);
                });
                return !this.firstOpen;
            },
            onClose: function () {
                this.focus();
            }
        });
}
        historyPostData = fnFormToJsonArrayData('#machine_manage_pop_form');
        historyColModel = [
            {title: 'EQUIP_ID', dataType: 'string', dataIndx: 'EQUIP_ID', hidden:true},
            {title: 'SEQ', dataType: 'string', dataIndx: 'SEQ', hidden:true},
            {title: '정비 작업종류', dataType: 'string', dataIndx: 'REPAIR_TYPE_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "REPAIR_TYPE_NM", id: "REPAIR_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1036'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = $historyGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["REPAIR_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: 'Description', dataType: 'string', dataIndx: 'REPAIR_DESC'},
            { title: "시작일시", dataIndx: "REPAIR_START_DT", dataType: 'string',
                editor: {
                    type: 'textbox',
                    init: dateEditor
                },
                render: function (ui) {
                    var cellData = ui.cellData;
                    if (cellData) {
                        //return $.datepicker.formatDate('yy-mm-dd HH:mm', new Date(cellData));
                        return cellData;
                    }
                    else {
                        return "";
                    }
                }
                // validations: [
                //     { type: 'regexp', value: '^[0-9]{2}/[0-9]{2}/[0-9]{4}$', msg: 'Not in mm/dd/yyyy format' }
                // ]
            },
            { title: "종료일시", dataIndx: "REPAIR_END_DT", dataType: 'string',
                editor: {
                    type: 'textbox',
                    init: dateEditor
                },
                render: function (ui) {
                    var cellData = ui.cellData;
                    if (cellData) {
                        return cellData;
                    }
                    else {
                        return "";
                    }
                }
            },
            // {
            //     title: "종료일시",  dataIndx: "REPAIR_END_DT", dataType: 'string',
            //     cls: 'pq-calendar pq-side-icon',
            //     editor: {
            //         type: 'textbox',
            //         init: dateEditor,
            //         getData: function (ui) {
            //             //convert from column format to native js date format "mm/dd/yy"
            //             var dt = $.datepicker.parseDate(ui.column.format, ui.$cell.find("input").val());
            //             return $.datepicker.formatDate("mm/dd/yy", dt);
            //         }
            //     }
            //     // validations: [
            //     //     { type: 'regexp', value: '^[0-9]{2}/[0-9]{2}/[0-9]{4}$', msg: 'Not in date format' }
            //     // ]
            // },
            {title: '소요시간', dataType: 'string', dataIndx: 'REPAIR_TIME', editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: '정비전', align: 'center', dataType: 'string', dataIndx: 'BEFORE_GFILE_SEQ', width: 20, minWidth: 20, editable: true,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    console.log(" render BEFORE_GFILE_SEQ")
                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>VIEW</i>";
                    return '+';
                    //return '<a href="#" id="gridSingleFileUpload">' +
                    //'   <span data-col="GRID_BEFORE_GFILE_SEQ" data-gridInfo="'+grid+'" data-val="'+rowIndx+'" data-type="'+'before'+'">+</span></a>';

                },
                postRender: function (ui) {
                    console.log(" postRender BEFORE_GFILE_SEQ")
                    let rowIndx = ui.rowIndx, grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.BEFORE_GFILE_SEQ);
                    });
                }
            },
            {title: '정비후', align: 'center', dataType: 'string', dataIndx: 'AFTER_GFILE_SEQ', width: 20, minWidth: 20, editable: true,
                render: function (ui) {
                    if (ui.rowData['AFTER_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>VIEW</i>";
                    return "+";
                },
                postRender: function (ui) {
                    console.log(" postRender AFTER_GFILE_SEQ")
                    let rowIndx = ui.rowIndx, grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.AFTER_GFILE_SEQ);
                    });
                }
            },
            {title: '', dataType: 'string', dataIndx: 'SEQ', minWidth: 80 , editable: true,
                render: function(ui){
                    return '<input type="button" value="사진삭제"/>';
                },
                postRender: function (ui) {
                    let rowIndx = ui.rowIndx;

                    //alert(ui.rowData.SEQ);
                }
            }
        ];
        historyObj = {
            width: 950,
            height: 170, collapsible: false, resizable: false, showTitle: false, // pageModel: {type: "remote"},
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            recIndx: 'SEQ',
            postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center'
            },
            colModel: historyColModel,
            toolbar: {},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: historyPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
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

                if (ui.dataIndx == 'AFTER_GFILE_SEQ') {
                    callGridSingleFileUpload($historyGrid, rowIndx, 'AFTER_GFILE_SEQ');
                    $historyGrid.pqGrid("refresh");
                    //callGridSingleFileUpload($historyGrid, rowIndx, 'AFTER_GFILE_SEQ');
                    return;
                }
                if (ui.dataIndx == 'BEFORE_GFILE_SEQ') {
                    callGridSingleFileUpload($historyGrid, rowIndx, 'BEFORE_GFILE_SEQ');
                    $historyGrid.pqGrid("refresh");
                    return;
                }
                if (ui.dataIndx == 'SEQ') {
                    $historyGrid.pqGrid("updateRow", { rowIndx: rowIndx , row: { "BEFORE_GFILE_SEQ": "" } });
                    $historyGrid.pqGrid("updateRow", { rowIndx: rowIndx , row: { "AFTER_GFILE_SEQ": "" } });
                    $historyGrid.pqGrid("refresh");
                    return;
                }



            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $historyGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        };

        $historyGrid = $('#' + historyGridId).pqGrid(historyObj);
        /**  정비이력 그리드 선언 끝 **/

/**  이벤트  **/

        $("#machine_manage_pop_form").find("#addHistoryBtn").click(function(event){

            let EQUIP_ID = $("#machine_manage_pop_form").find("#EQUIP_ID").val();
            if(EQUIP_ID == ""){
                alert("마스터 정보를 먼저 저장해 주십시오.");
                return;
            }else{
                $historyGrid.pqGrid('addNodes', [{"EQUIP_ID":EQUIP_ID}], 0);
            }

        });
        $("#machine_manage_pop_form").find("#deleteHistoryBtn").click(function(event){

            $historyGrid.pqGrid('deleteRow', {'rowIndx': SelectedRowIndex});//rowIndx
        });

        $newBtn.click(function(event){
            fnResetFrom("machine_manage_pop_form");
            $("#machine_manage_pop_form").find("#EQUIP_ID").val("");
            $('#CURRENT_POPUP').modal('show');
        });
        $saveBtn.click(function(event){

            if(confirm("저장 하시겠습니까?")){
                // 그리드 데이터 폼에 넣기 to-do
                let EQUIP_ID = $("#machine_manage_pop_form").find("#EQUIP_ID").val();
                if(EQUIP_ID != ""){
                    var gridInstance = $historyGrid.pqGrid('getInstance').grid;
                    var changes = gridInstance.getChanges({format: 'byVal'});
                    $("#machine_manage_pop_form").find("#historyGrid").val(JSON.stringify(changes));
                    console.log("change",JSON.stringify(changes));
                }else{
                    $("#machine_manage_pop_form").find("#historyGrid").val("");
                }
                // let data_history = $historyGrid.pqGrid('option', 'dataModel.data');
                // let total_history= data_history.length;
                // for(let tempI=0; tempI<total_history; tempI++){
                //
                //     let rowData3 = $historyGrid.pqGrid("getRowData", {rowIndx: tempI});
                //     console.log("rowData3",rowData3);
                // }
                // return;
                let parameters = {
                    'url': '/managerEquip',
                    'data': $('#machine_manage_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    alert('장비상세 정보가 저장되었습니다.');
                    $('#CURRENT_POPUP').modal('hide');
                    $searchBtn.trigger("click");
                }, parameters, '');

            }
        });
        $deleteBtn.click(function(event){
            if(confirm("삭제하시겠습니까?")){
                $("#machine_manage_pop_form").find("#queryId").val("machine.deleteMachineMaster");
                let parameters = {
                    'url': '/json-update',
                    'data': $('#machine_manage_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlertMessageAutoClose('remove');
                }, parameters, '');
            };
        });


        $('.pop_close').on('click', function(e) {
            $('#CURRENT_POPUP').modal('hide');
        });

        $('#SEL_TERM_DT_USE').on('click', function(e) {
            if ($(this).is(':checked')) {
                $(this).val('Y');
            }else {
                $(this).val('N');
            }
        });

        $searchBtn.on('click', function(e) {
            let targetTab = $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val();
            let SEL_TERM_DT_USE = $("#machine_manage_search_form").find("#SEL_TERM_DT_USE").val();
            let SEL_ST_DT = $("#machine_manage_search_form").find("#SEL_ST_DT").val();
            let SEL_END_DT = $("#machine_manage_search_form").find("#SEL_END_DT").val();

            if(SEL_TERM_DT_USE == "Y"){
                if(SEL_ST_DT == "" || SEL_END_DT == ""){
                    alert("날짜 검색을 선택하셨습니다.\n시작날짜와 종료날짜를 선택하여 주십시오.");
                    return;
                }
            }

            if(targetTab == "1"){
                $currentGrid = $('#' + currentGridId).pqGrid(currentObj);
                $currentGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_search_form');
                } );
                $currentGrid.pqGrid("refreshDataAndView");
            }else if(targetTab == "2"){
                $etcGrid = $('#' + etcGridId).pqGrid(etcObj);
                $etcGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_search_form');
                } );
                $etcGrid.pqGrid("refreshDataAndView");
            }else{
                alert("탭 선택이 잘못되었습니다.");
            }

        });

        $(".datepicker-input").each(function(){ $(this).datepicker();});
        // $('.dateTimePicker').each(function() {
        //     // var id = $(this).attr('id');
        //     let _this = $(this);
        //     _this.datetimepicker({
        //         "dateFormat" : 'yy-mm-dd',
        //         "timeFormat" : "HH:mm",
        //         "oneLine":true
        //     });
        //     _this.datetimepicker('setDate', 'today');
        //     _this.datetimepicker('setTime', new Date());
        // });
        /** SelectBox 초기화 **/
        let commonCodeBotGridId = 'dataSource.getUserList';
        let paramData = {"url":"/json-list", "data": {"queryId": commonCodeBotGridId}};
        // fnCommCodeDatasourceSelectBoxCreate($("#company_master_search_form").find("#SEL_STAFF_NM"), 'all', paramData);
        fnCommCodeDatasourceSelectBoxCreate($("#machine_manage_pop_form").find("#MAIN_USER_ID"), 'sel', paramData);
        fnCommCodeDatasourceSelectBoxCreate($("#machine_manage_pop_form").find("#SUB_USER_ID"), 'sel', paramData);


    });



    $("#div_tabs").tabs({
        activate: function(event, ui) {
            ui.newPanel.find('.pq-grid').pqGrid('refresh');
            let selTab = ui.newPanel.selector;
            if(selTab == "#_TAB1"){
                $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val("1");

            }else if(selTab == "#_TAB2"){
                $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val("2");
            }
            $searchBtn.trigger('click');

        }
    });
    $("#div_tabs2").tabs({
        activate: function(event, ui) {
            ui.newPanel.find('.pq-grid').pqGrid('refresh');
            let selTab = ui.newPanel.selector;
            $("#machine_manage_pop_form").find("#addHistoryBtn").hide();
            $("#machine_manage_pop_form").find("#deleteHistoryBtn").hide();

            if(selTab == "#_TAB3"){

                $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");

                $logGrid = $('#' + logGridId).pqGrid(logObj);
                $logGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_pop_form');
                } );
                $logGrid.pqGrid("refreshDataAndView");

            }else if(selTab == "#_TAB4"){

                $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");

                $historyGrid = $('#' + historyGridId).pqGrid(historyObj);
                $historyGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_pop_form');
                } );
                $historyGrid.pqGrid("refreshDataAndView");

                $("#machine_manage_pop_form").find("#addHistoryBtn").show();
                $("#machine_manage_pop_form").find("#deleteHistoryBtn").show();
            }


        }
    });
    $("#CURRENT_POPUP").on('hide.bs.modal', function(){

        fnResetFrom("machine_manage_pop_form");
        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineInfo");
        $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/999");


        $logGrid.pqGrid('destroy');
        $historyGrid.pqGrid('destroy');
        $searchBtn.trigger("click");
    });
    // 모달 open
    $("#CURRENT_POPUP").on('show.bs.modal', function(){
        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineInfo");
        let parameters = {
            'url': '/json-info',
            'data': $('#machine_manage_pop_form').serialize()
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;

            if(dataInfo == null ) {
                fnResetFrom("machine_manage_pop_form");
                $("#machine_manage_pop_form").find("#EQUIP_ID_NM").html("");
                $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val("");
                $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/999");
            }else{
                fnJsonDataToForm("machine_manage_pop_form", dataInfo);

                // 파일 정보 셋팅
                $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val(dataInfo.PHOTO_GFILE_SEQ);
                $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + dataInfo.PHOTO_GFILE_SEQ);

                $("#machine_manage_pop_form").find("#EQUIP_ID_NM").html(dataInfo.EQUIP_ID);
            }

            let equip_kind = $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val();

            if(equip_kind == "1"){
                $('a[href="#_TAB3"]').click();
                $("#machine_manage_pop_form").find("#EQUIP_KIND").val("1");
                $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("가공장비");
                $("#machine_manage_pop_form").find("#_TAB3_TITLE").show();

                // $("#machine_manage_pop_form").find("#_TAB3_TITLE").find("a").trigger("click");
            }else if(equip_kind == "2"){
                $('a[href="#_TAB4"]').click();
                $("#machine_manage_pop_form").find("#EQUIP_KIND").val("2");
                $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("기타장비");
                $("#machine_manage_pop_form").find("#_TAB3_TITLE").hide();

                // $("#machine_manage_pop_form").find("#_TAB4_TITLE").find("a").trigger("click");
            }

            $("#machine_manage_pop_form").find("#addHistoryBtn").hide();
            $("#machine_manage_pop_form").find("#deleteHistoryBtn").hide();

            $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineLogList");
            $logGrid = $('#' + logGridId).pqGrid(logObj);
            $logGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#machine_manage_pop_form');
            } );
            $logGrid.pqGrid("refreshDataAndView");

            $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");
            $historyGrid = $('#' + historyGridId).pqGrid(historyObj);
            $historyGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#machine_manage_pop_form');
            } );
            $historyGrid.pqGrid("refreshDataAndView");


        }, parameters, '');
    });

    function callGridSingleFileUpload($grid, rowIndx, rowTarget){

        let companyEtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
        companyEtcFile.trigger("click");
        companyEtcFile.change(function () {
            var input = $(this);
            var files = input.get(0).files;
            if (files.length > 0) {
                let formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append("file" + i, files[i]);
                }
                fnFormDataFileUploadAjax(function (data) {
                    let fileInfo = data.fileUploadList[0];
                    $grid.pqGrid("updateRow", { rowIndx: rowIndx , row: { [rowTarget]: fileInfo.GFILE_SEQ } });

                }, formData, '');
            }
        });
    };
    let EtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
    /** 업체 기타 파일 업로드 */
    $("#machine_manage_pop_form").find("#etc_attach_file").click(function (e) {

        console.log("EtcFile1", EtcFile);
        EtcFile.trigger("click");
        EtcFile.change(function () {
            var input = $(this);
            var files = input.get(0).files;
            console.log("files etc", input);
            if (files.length > 0) {
                let formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append("file" + i, files[i]);
                }
                fnFormDataFileUploadAjax(function (data) {
                    let fileInfo = data.fileUploadList[0];
                    alert(1);
                    $("#machine_manage_pop_form").find("#ETC_GFILE_SEQ_NM").val(fileInfo.ORGINAL_FILE_NM);
                    $("#machine_manage_pop_form").find("#ETC_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                }, formData, '');
            }
        });
        console.log("EtcFile2", EtcFile);
    });
    let photoFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
    /** 장비 파일 업로드 */
    $("#machine_manage_pop_form").find("#photo_upload").click(function (e) {

        console.log("photoFile1", photoFile);
        photoFile.trigger("click");
        photoFile.change(function () {
            var input = $(this);
            var files = input.get(0).files;
            console.log("files photo", input);
            if (files.length > 0) {
                let formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    formData.append("file" + i, files[i]);
                }
                fnFormDataFileUploadAjax(function (data) {
                    alert(2);
                    let fileInfo = data.fileUploadList[0];
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                }, formData, '');
            }
        });
        console.log("photoFile2", photoFile);
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