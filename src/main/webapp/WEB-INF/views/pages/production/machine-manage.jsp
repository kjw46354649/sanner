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

<div class="page estimate machineWrap">
    <div class="topWrap">
        <form class="form-inline" id="machine_manage_search_form" name="machine_manage_search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="machine.selectMachineList">
            <input type="hidden" id="SEL_EQUIP_KIND" name="SEL_EQUIP_KIND" value="1">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP_TYPE" class="label_100">장비종류</label>
                            <select id="SEL_EQUIP_TYPE" name="SEL_EQUIP_TYPE" title="장비종류" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1012}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_EQUIP_SIZE" class="label_100">장비규격</label>
                            <input type="search" name="SEL_EQUIP_SIZE" id="SEL_EQUIP_SIZE" placeholder="장비규격" value="" title="장비규격" class="wd_200">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="SEL_EQUIP_NM" class="label_100">장비명</label>
                            <select class="wd_200" name="SEL_EQUIP_NM" id="SEL_EQUIP_NM" title="장비명" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_FACTORY_AREA" class="label_100">설치위치</label>
                            <select id="SEL_FACTORY_AREA" name="SEL_FACTORY_AREA" title="설치위치" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1005}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>

                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="SEL_MAIN_USER_ID" class="label_100">담당자</label>
                            <select class="wd_200" name="SEL_MAIN_USER_ID" id="SEL_MAIN_USER_ID" title="담당자" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                             <label for="SEL_DAY_TYPE" class="label_100">날짜조회</label>
                            <select id="SEL_DAY_TYPE" name="SEL_DAY_TYPE" title="날짜조회" class="wd_100">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <option value="1">구입시기</option>
                            </select>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_MACHINE_MANAGE_ST_DT" title="시작날짜">
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_MACHINE_MANAGE_END_DT" title="종료날짜">
                            </span>
                        </div>
<%--                        <span class="chk_box ml-20">&nbsp;&nbsp;<input id="SEL_TERM_DT_USE" name="SEL_TERM_DT_USE" type="checkbox"><label for="SEL_TERM_DT_USE">선택</label></span>--%>
                        <button type="button" class="right_float defaultBtn radius blue" id="machine_searchBtn">검색</button>
                    </li>
                </ul>

            </div>
        </form>
    </div>

    <div class="bottomWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">

                <div class="rightSpan">
                    <button type="button" id="newBtn" class="defaultBtn yelllowGra">신규등록</button>
                </div>
            </div>
        </div>
        <div class="tableWrap jmestabs" id="div_tabs_machine_01">
            <ul class="smallTabMenuTabs">
                <li class="active"><a href="#_TAB1" data-toggle="tab" aria-expanded="true">가공장비</a></li>
                <li><a href="#_TAB2" data-toggle="tab" aria-expanded="false">기타장비</a></li>
                <div class="d-inline right_float" id="MACHINE_MANAGE_CURRENT_BOX" style="font-weight: normal;">
                    <input type="text" id="machineManageCurrentFilterKeyword" placeholder="Enter your keyword">
                    <select id="machineManageCurrentFilterColumn"></select>
                    <select id="machineManageCurrentFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="machineManageCurrentFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="machineManageCurrentFrozen" name="machineManageCurrentFrozen">
                    </select>
                </div>
                <div class="d-inline right_float" id="MACHINE_MANAGE_ETC_BOX" style="display: none; font-weight: normal;">
                    <input type="text" id="machineManageEtcFilterKeyword" placeholder="Enter your keyword">
                    <select id="machineManageEtcFilterColumn"></select>
                    <select id="machineManageEtcFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="machineManageEtcFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="machineManageEtcFrozen" name="machineManageEtcFrozen">
                    </select>
                </div>
            </ul>
             <div class="tab-content">
                 <ul class="active conWrap" id="_TAB1">
                     <div id="machine_manage_current_grid"></div>
                     <div class="right_sort">
                         전체 조회 건수 (Total : <span id="MACHINE_MANAGE_CURRENT_GRID_TOTAL_RECORDS" style="color: #00b3ee">0</span>)
                     </div>
                 </ul>
                 <ul class="conWrap" id="_TAB2">
                     <div id="machine_manage_etc_grid"></div>
                     <div class="right_sort">
                         전체 조회 건수 (Total : <span id="MACHINE_MANAGE_ETC_GRID_TOTAL_RECORDS" style="color: #00b3ee">0</span>)
                     </div>
                 </ul>
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
        <input type="hidden" id="EQUIP_SEQ" name="EQUIP_SEQ" value="" >
        <input type="hidden" id="historyGrid" name="historyGrid" value="" >
        <input type="hidden" id="IF_USE_YN" name="IF_USE_YN" value="" >
        <div class="layerPopup">
            <h3>장비상세정보</h3>
            <button type="button" class="pop_close mt-10 mr-8" id="machine_manage_pop-close2">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
					<div class="right_sort ">
                        <span class="chk_box mr-10">
                            <input name="CHECK_IF_USE_YN" id="CHECK_IF_USE_YN" type="checkbox">
                            <label for="CHECK_IF_USE_YN">IF 사용 여부</label>
                        </span>
                        <button type="button" class="defaultBtn btn-120w red" id="saveBtn">저장</button>
                        <button type="button" class="defaultBtn btn-120w green" id="deleteBtn">삭제</button>
					</div>

                </div>
                <div class="resultWrap99 list99">
                    <div class="leftWrap" style="margin-top: 16px;">
                        <input type="hidden" id="PHOTO_GFILE_SEQ" name="PHOTO_GFILE_SEQ" value="">
                        <img src="/image/999" id="PHOTO_GFILE_SRC" width="400px" alt="장비사진" style="width: 400px;height: 302px;border:1px solid #707070">
                        <div class="btnWrap">
                            <button type="button" id="photo_upload" class="defaultBtn">사진변경하기</button>
                        </div>
                    </div>
                    <div class="rightWrap">
                        <table class="rowStyle">
                            <caption></caption>
                            <colgroup>
                                <col width="110px">
                                <col width="171px">
                                <col width="110px">
                                <col width="171px">
                            </colgroup>
                            <tr>
                                <th scope="row">Item ID</th>
                                <td><input type="text" name="EQUIP_ID" id="EQUIP_ID" placeholder="Item ID" value="" title="Item ID" class="wd_150"></td>
                                <th scope="row">구분</th>
                                <td id="EQUIP_KIND_NM"></td>
                            </tr>
                            <tr>
                                <th scope="row">장비명</th>
                                <td><input type="text" name="EQUIP_NM" id="EQUIP_NM" placeholder="장비명" value="" title="장비명" class="wd_150"></td>
                                <th scope="row">공정</th>
                                <td>
                                    <select id="PROCESS_TYPE" name="PROCESS_TYPE" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1010}">
                                            <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">장비종류</th>
                                <td>
                                    <select id="EQUIP_TYPE" name="EQUIP_TYPE" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1012}">
                                            <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">장비규격</th>
                                <td>
                                    <input type="text" name="EQUIP_SIZE" id="EQUIP_SIZE" placeholder="장비규격" value="" title="장비규격" class="wd_150">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">제조사</th>
                                <td>
                                    <select id="EQUIP_COMP_CD" name="EQUIP_COMP_CD" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1037}">
                                            <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <th scope="row">설치위치</th>
                                <td>
                                    <select id="FACTORY_AREA" name="FACTORY_AREA" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1005}">
                                            <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">담당자(정)</th>
                                <td>
                                    <select id="MAIN_USER_ID" name="MAIN_USER_ID" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                    </select>
                                </td>
                                <th scope="row">담당자(부)</th>
                                <td>
                                    <select id="SUB_USER_ID" name="SUB_USER_ID" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">구입시기</th>
                                <td>
                                    <input class="datepicker-input wd_150" type="text" name="PURCHASE_DT" id="PURCHASE_DT" placeholder="" value="" title="구입시기" readonly>
                                </td>
                                <th scope="row">리셀러/AS</th>
                                <td>
                                    <select id="RESELLER_CD" name="RESELLER_CD" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                        <c:forEach var="vlocale" items="${HighCode.H_1022}">
                                            <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">Model No.</th>
                                <td>
                                    <input type="text" name="MODEL_NUM" id="MODEL_NUM" placeholder="Model No." value="" title="Model No." class="wd_150">
                                </td>
                                <th scope="row">제조번호</th>
                                <td>
                                    <input type="text" name="SERIAL_NUM" id="SERIAL_NUM" placeholder="제조번호" value="" title="제조번호" class="wd_150">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">시간당 임률</th>
                                <td>
                                    <input type="number" name="COST_PER_HOUR" id="COST_PER_HOUR" placeholder="시간당 원가" value="" title="시간당 원가" class="wd_150">
                                </td>
                                <th scope="row">Order</th>
                                <td>
                                    <input type="number" name="COMBO_BOX_SORT_NUM" id="COMBO_BOX_SORT_NUM" placeholder="Order" value="" title="Order" class="wd_150">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td colspan="3">
                                    <input type="hidden" id="ETC_GFILE_SEQ" name="ETC_GFILE_SEQ" value="">
                                    <input type="text" id="ETC_GFILE_SEQ_NM" name="ETC_GFILE_SEQ_NM" placeholder="첨부파일" readonly style="width:75%;">
                                    <input type="button" id="etc_attach_file" name="etc_attach_file" value="fileUpload" class="smallBtn blue">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비고</th>
                                <td colspan="3">
                                    <input type="text" id="NOTE" name="NOTE" placeholder="비고" style="width:98%;">
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

                <div class="list98_280">
                    <div class="tableWrap jmestabs" id="div_tabs_machine_02">
                        <ul class="smallTabMenuTabs">
                            <li class="active" id="_TAB3_TITLE"><a href="#_TAB3" data-toggle="tab" aria-expanded="true">작업기록</a></li>
                            <li id="_TAB5_TITLE"><a href="#_TAB5" data-toggle="tab" aria-expanded="false">장비로그</a></li>
                            <li id="_TAB4_TITLE"><a href="#_TAB4" data-toggle="tab" aria-expanded="false">정비이력</a></li>
                            <div class="right_sort">
                                <div id="pop_calendar_wrap" class="calendar_wrap">
                                    <span style="font-size: 12px;height: 12px;" class="calendar_span mr-10">발생일자</span>
                                    <span class="calendar_span" style="height: 20px;">
                                        <input class="wd_130" type="text" title="달력정보" style="font-size: 10px;" name="MACHINE_MANAGE_POP_ST_DT" id="MACHINE_MANAGE_POP_ST_DT" readonly>
                                        <button type="button" id="MACHINE_MANAGE_POP_ST_DT_BUTTON">달력선택</button>
                                    </span>
                                    <span class="nbsp">~</span>
                                    <span class="calendar_span" style="height: 20px;">
                                        <input class="wd_130" type="text" title="달력정보" style="font-size: 10px;" name="MACHINE_MANAGE_POP_END_DT" id="MACHINE_MANAGE_POP_END_DT" readonly>
                                        <button type="button" id="MACHINE_MANAGE_POP_END_DT_BUTTON">달력선택</button>
                                    </span>
                                    <span class="refresh ml-10">
                                        <button type="button" id="machine_pop_refresh">
                                            <img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침">
                                        </button>
                                    </span>
                                </div>
                                <button type="button" id="addHistoryBtn" class="defaultBtn radius ">Add</button>
                                <button type="button" id="deleteHistoryBtn" class="defaultBtn radius green ">Delete</button>
                            </div>
                        </ul>

                        <div class="tab-content">
                            <ul class="active conWrap" id="_TAB3">
                                <div id="machine_manage_log_grid"></div>
                            </ul>
                            <ul class="conWrap" id="_TAB5">
                                <div id="machine_manage_equip_log_grid"></div>
                            </ul>
                            <ul class="conWrap" id="_TAB4">
                                <div id="machine_manage_history_grid"></div>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btnWrap">
                 <button type="button" class="defaultBtn grayPopGra" id="machine_manage_pop-close">닫기</button>
             </div>
        </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->


<script type="text/javascript">
    /**  선언 **/
    let $machineSearchBtn = $("#machine_searchBtn");
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
    let logObj;
    let $logGrid;

    let historyGridId = 'machine_manage_history_grid';
    let historyColModel;
    let historyObj;
    let $historyGrid;

    let manageEquipLogGrid = 'machine_manage_equip_log_grid';
    let manageEquipLogColModel;
    let manageEquipLogObj;
    let $manageEquipLogGrid;

    $(function () {
        'use strict';
        fnCommCodeDatasourceSelectBoxCreate($('#machine_manage_search_form').find('#SEL_MAIN_USER_ID'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getUserList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#machine_manage_search_form').find('#SEL_EQUIP_NM'), 'all', {
            'url': '/json-list', 'data': {'queryId': 'dataSource.getEquipList'}
        });

        let $machineManagePopStDt = $('#MACHINE_MANAGE_POP_ST_DT');
        let $machineManagePopEndDt = $('#MACHINE_MANAGE_POP_END_DT');

        $("#MACHINE_MANAGE_POP_ST_DT").datepicker();
        $("#MACHINE_MANAGE_POP_END_DT").datepicker();

        $("#MACHINE_MANAGE_POP_ST_DT").datepicker({dateFormat: 'yy/mm/dd'});
        $("#MACHINE_MANAGE_POP_END_DT").datepicker({dateFormat: 'yy/mm/dd'});
        console.log("??")

        /**  가공장비 그리드 선언 시작 **/
        currentPostData = fnFormToJsonArrayData('#machine_manage_search_form');
        currentColModel = [
            {title: '사진', dataType: 'string', dataIndx: 'PHOTO_GFILE_SEQ', minWidth: 80 ,
                render: function(ui){
                    let CELL_PHOTO_GFILE_SEQ = ui.rowData['PHOTO_GFILE_SEQ'];
                    if (CELL_PHOTO_GFILE_SEQ > 0) return "<img src='/image/" + CELL_PHOTO_GFILE_SEQ + "' width='100px' height='100px'>";
                    return "<img src='/image/999' width='100px' height='100px'>";
                }
            },
            {title: 'EQUIP_SEQ', dataType: 'string', dataIndx: 'EQUIP_SEQ', hidden:true},
            {title: 'Item ID', dataType: 'string', dataIndx: 'EQUIP_ID'},
            {title: '장비명', dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM',width: 70},
            {title: '장비종류', dataType: 'string', dataIndx: 'EQUIP_TYPE_NM',width: 70},
            {title: '장비규격', dataType: 'string', dataIndx: 'EQUIP_SIZE',width: 70},
            {title: '제조사', dataType: 'string', dataIndx: 'EQUIP_COMP_NM'},
            {title: '리셀러', dataType: 'string', dataIndx: 'RESELLER_NM'},
            {title: '설치위치', dataType: 'string', dataIndx: 'FACTORY_AREA_NM'},
            {title: '공장구분', dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: '구입시기', dataType: 'string', dataIndx: 'PURCHASE_DT'},
            {title: '담당(정)', dataType: 'string', dataIndx: 'MAIN_USER_NM'},
            {title: '담당(부)', dataType: 'string', dataIndx: 'SUB_USER_NM'},
            {title: '작동시간(누적)', dataType: 'string', dataIndx: 'WORKING_TIME'},
            //{title: '최근<br>정비일시', dataType: 'string', dataIndx: ''},
            {title: '최근종료일시', dataType: 'string', dataIndx: 'LAST_REPAIR_DT'},
            {title: '최근수행번호', dataType: 'string', dataIndx: 'LAST_CONTROL_NUM'},
            {title: 'Order', dataType: 'integer', dataIndx: 'COMBO_BOX_SORT_NUM'}
        ];
        currentObj = {
            width: "100%",
            height: 700, collapsible: false, resizable: true, showTitle: false, rowHtHead: 25,// pageModel: {type: "remote"},
            editable : false,
            autoRow: false,
            rowHt: 100,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                valign: 'center', //to vertically center align the header cells.
                editable: false,
                render: machineManageCurrentFilterRender
            },
            filterModel: { mode: 'OR' },
            colModel: currentColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: currentPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
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
                $("#machineManageCurrentFilterColumn").empty();
                $("#machineManageCurrentFilterColumn").html(filterOpts);
                $("#machineManageCurrentFrozen").empty();
                $("#machineManageCurrentFrozen").html(frozenOts);
            },
            complete: function () {
                let data = $currentGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#MACHINE_MANAGE_CURRENT_GRID_TOTAL_RECORDS').html(totalRecords);
            },
            cellDblClick: function (event, ui) {
                if (ui.dataIndx === 'PHOTO_GFILE_SEQ' || ui.dataIndx === 'EQUIP_NM'){
                    let target = ui.rowData.EQUIP_SEQ;
                    // console.log(ui.rowData.EQUIP_SEQ);
                    fnResetForm("machine_manage_pop_form");
                    $("#machine_manage_pop_form").find("#EQUIP_SEQ").val(target);
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
                    if (CELL_PHOTO_GFILE_SEQ > 0) return "<img src='/image/" + CELL_PHOTO_GFILE_SEQ + "' width='100px' height='100px'>";
                    return "<img src='/image/999' width='100px' height='100px'>";
                }
            },
            {title: 'EQUIP_SEQ', dataType: 'string', dataIndx: 'EQUIP_SEQ', hidden:true},
            {title: 'Item ID', dataType: 'string', dataIndx: 'EQUIP_ID'},
            {title: '장비명', dataType: 'string', dataIndx: 'EQUIP_NM'},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM'},
            {title: '장비종류', dataType: 'string', dataIndx: 'EQUIP_TYPE_NM'},
            {title: '장비규격', dataType: 'string', dataIndx: 'EQUIP_SIZE'},
            {title: '제조사', dataType: 'string', dataIndx: 'EQUIP_COMP_NM'},
            {title: '리셀러', dataType: 'string', dataIndx: 'RESELLER_NM'},
            {title: '설치위치', dataType: 'string', dataIndx: 'FACTORY_AREA_NM'},
            {title: '공장구분', dataType: 'string', dataIndx: 'FACTORY_NM'},
            {title: '구입시기', dataType: 'string', dataIndx: 'PURCHASE_DT'},
            {title: '담당(정)', dataType: 'string', dataIndx: 'MAIN_USER_NM'},
            {title: '담당(부)', dataType: 'string', dataIndx: 'SUB_USER_NM'},
            {title: '작동시간(누적)', dataType: 'string', dataIndx: 'WORKING_TIME'},
            //{title: '최근<br>정비일시', dataType: 'string', dataIndx: ''},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'}
        ];
        etcObj = {
            width: "100%",
            height: 700, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            rowHtHead: 25, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            autoRow: false,
            rowHt: 100,
            columnTemplate: {
                align: 'center',
                valign: 'center', //to vertically center align the header cells.
                editable: false,
                render: machineManageEtcFilterRender
            },
            filterModel: { mode: 'OR' },
            colModel: etcColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: etcPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
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
                $("#machineManageEtcFilterColumn").empty();
                $("#machineManageEtcFilterColumn").html(filterOpts);
                $("#machineManageEtcFrozen").empty();
                $("#machineManageEtcFrozen").html(frozenOts);
            },
            complete: function () {
                let data = $etcGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#MACHINE_MANAGE_ETC_GRID_TOTAL_RECORDS').html(totalRecords);
            },
            cellClick: function (event, ui) {
                if (ui.dataIndx === 'PHOTO_GFILE_SEQ' || ui.dataIndx === 'EQUIP_NM'){
                    let target = ui.rowData.EQUIP_SEQ;

                    fnResetForm("machine_manage_pop_form");
                    $("#machine_manage_pop_form").find("#EQUIP_SEQ").val(target);
                    $('#CURRENT_POPUP').modal('show');
                }
            }
        };
        $etcGrid = $('#' + etcGridId).pqGrid(etcObj);
        /**  기타장비 그리드 선언 끝 **/

        /**  작동로그 그리드 선언 시작 선언만 해놓고 작업은 업무 협의 되면 진행. **/
        logColModel = [
            {title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM', width: 60, editable: false},
            {title: '기기명', dataType: 'string', dataIndx: 'EQUIP_NM', width: 65, editable: false},
            {title: '상태', dataType: 'string', dataIndx: 'WORK_STATUS', width: 60, editable: false},
            {title: '시작', dataType: 'string', dataIndx: 'WORK_START_DT', width: 105, editable: false},
            {title: '종료', dataType: 'string', dataIndx: 'WORK_FINISH_DT', width: 105, editable: false},
            {title: '가동시간', dataType: 'string', dataIndx: 'WORKING_TIME', width: 105, editable: false,
                render: function (ui) {
                    const cellData = ui.cellData;
                    const min = Math.floor(cellData % 3600 / 60);

                    if (Math.abs(cellData) > 3600) {
                        const hour = Math.floor(cellData / 3600);

                        return hour + 'h ' + min + 'm';
                    } else {
                        return min + 'm';
                    }
                }
            },
            {title: '정지시간', dataType: 'string', dataIndx: 'STOP_TIME', width: 105, editable: false,
                render: function (ui) {
                    const cellData = ui.cellData;
                    const min = Math.floor(cellData % 3600 / 60);

                    if (Math.abs(cellData) > 3600) {
                        const hour = Math.floor(cellData / 3600);

                        return hour + 'h ' + min + 'm';
                    } else {
                        return min + 'm';
                    }
                }
            },
            {title: 'I/F', dataType: 'string', dataIndx: 'IF_USE_YN', width: 60, editable: false,
                render: function (ui) {
                    if (ui.cellData == 'Y') return 'V'
                }
            },
            {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 85, editable: false},
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 140, editable: false},
            {title: '수량', dataType: 'string', dataIndx: 'FINISH_QTY', width: 70, editable: false},
            {title: '불량', dataType: 'string', dataIndx: 'ERROR_QTY', width: 70, editable: false},
            {title: '불량원인', dataType: 'string', dataIndx: 'ERROR_REASON_NM', width: 110, editable: false}
        ];
        logObj = {
            width: "100%", height: 250,
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: logColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#machine_manage_search_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        $logGrid = $('#' + logGridId).pqGrid(logObj);
        /**  작동로그 그리드 선언 끝 **/

        /**  정비이력 그리드 선언 시작 **/
        let dateEditor = function (ui) {
            let $inp = ui.$cell.find("input"),
                grid = this,
                format = ui.column.format || "yy/mm/dd",
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

        historyColModel = [
            {title: 'EQUIP_SEQ', dataType: 'string', dataIndx: 'EQUIP_SEQ', hidden:true},
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
            {title: '소요시간', dataType: 'string', dataIndx: 'REPAIR_TIME', editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', editable: true},
            {title: '정비전', align: 'center', dataType: 'string', dataIndx: 'BEFORE_GFILE_SEQ', width: 20, minWidth: 20, editable: true,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return '+';
                }
            },
            {title: '정비후', align: 'center', dataType: 'string', dataIndx: 'AFTER_GFILE_SEQ', width: 20, minWidth: 20, editable: true,
                render: function (ui) {
                    if (ui.rowData['AFTER_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return "+";
                }
            },
            {title: '', dataType: 'string', dataIndx: 'SEQ', minWidth: 80 , editable: true,
                render: function(ui){
                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0 || ui.rowData['AFTER_GFILE_SEQ'] > 0) {
                        return '<button type="button" class="miniBtn blue" >사진삭제</button>';
                    }else{return '';}

                }
            }
        ];
        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");
        historyObj = {
            width: "100%", height: 250,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('machine_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: historyColModel,
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
                    if (ui.rowData['AFTER_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.AFTER_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload($historyGrid, rowIndx, 'AFTER_GFILE_SEQ');
                    }
                    return;
                }
                if (ui.dataIndx == 'BEFORE_GFILE_SEQ') {

                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.BEFORE_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload($historyGrid, rowIndx, 'BEFORE_GFILE_SEQ');
                    }
                    return;
                }
                if (ui.dataIndx == 'SEQ') {

                    $historyGrid.pqGrid("updateRow", {rowIndx: rowIndx, row: {"BEFORE_GFILE_SEQ": ""}});
                    $historyGrid.pqGrid("updateRow", {rowIndx: rowIndx, row: {"AFTER_GFILE_SEQ": ""}});

                    var gridInstance = $historyGrid.pqGrid('getInstance').grid;
                    var changes = gridInstance.getChanges({format: 'byVal'});
                    $historyGrid.pqGrid("refresh");

                    return;
                }
            }
        };
        $historyGrid = $('#' + historyGridId).pqGrid(historyObj);

        manageEquipLogColModel = [
            {title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
            {title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM', width: 60, editable: false},
            {title: '기기명', dataType: 'string', dataIndx: 'EQUIP_NM', width: 60, editable: false},
            {title: '가동상태', dataType: 'string', dataIndx: 'EXECUTION', width: 60, editable: false},
            {title: '상태변경일시', dataType: 'string', dataIndx: 'EVENT_DT', width: 105, editable: false},
            {title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 65, editable: false},
            {title: '작업지시번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 140, editable: false},
            {title: '프로그램 명', dataType: 'string', dataIndx: 'PROGRAM', width: 95, editable: false}
        ];
        manageEquipLogObj = {
            width: "100%", height: 250,
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: manageEquipLogColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('machine_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        $manageEquipLogGrid = $('#' + manageEquipLogGrid).pqGrid(manageEquipLogObj);



        /**  정비이력 그리드 선언 끝 **/

        /**  이벤트  **/

        $("#machine_manage_pop_form").find("#addHistoryBtn").click(function(event){
            let EQUIP_SEQ = $("#machine_manage_pop_form").find("#EQUIP_SEQ").val();
            if(EQUIP_SEQ == ""){
                fnAlert(null, "마스터 정보를 먼저 저장해 주십시오.");
                return;
            }else{
                $historyGrid.pqGrid('addNodes', [{"EQUIP_SEQ":EQUIP_SEQ}], 0);
            }

        });

        $("#machine_manage_pop_form").find("#deleteHistoryBtn").click(function(event){
            $historyGrid.pqGrid('deleteRow', {'rowIndx': SelectedRowIndex});//rowIndx
        });

        $('#MACHINE_MANAGE_POP_ST_DT_BUTTON').on('click', function () {
            $('#MACHINE_MANAGE_POP_ST_DT').focus();
        });
        $('#MACHINE_MANAGE_POP_END_DT_BUTTON').on('click', function () {
            $('#MACHINE_MANAGE_POP_END_DT').focus();
        });

        $newBtn.click(function(event){
            fnResetForm("machine_manage_pop_form");
            $("#machine_manage_pop_form").find("#EQUIP_SEQ").val("");
            $('#CURRENT_POPUP').modal('show');
        });
        $saveBtn.click(function(event){
            fnConfirm(null, "저장 하시겠습니까?", function () {
                // 그리드 데이터 폼에 넣기 to-do
                let EQUIP_SEQ = $("#machine_manage_pop_form").find("#EQUIP_SEQ").val();
                if (EQUIP_SEQ != "") {
                    var gridInstance = $historyGrid.pqGrid('getInstance').grid;
                    var changes = gridInstance.getChanges({format: 'byVal'});
                    $("#machine_manage_pop_form").find("#historyGrid").val(JSON.stringify(changes));
                    // console.log("change",JSON.stringify(changes));
                } else {
                    $("#machine_manage_pop_form").find("#historyGrid").val("");
                }

                let parameters = {
                    'url': '/managerEquip',
                    'data': $('#machine_manage_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlert(null, '장비상세 정보가 저장되었습니다.');
                    $('#CURRENT_POPUP').modal('hide');
                    $machineSearchBtn.trigger("click");
                }, parameters, '');
            });
        });
        $deleteBtn.click(function (event) {
            fnConfirm(null, "삭제하시겠습니까?", function () {
                $("#machine_manage_pop_form").find("#queryId").val("machine.deleteMachineMaster");
                let parameters = {
                    'url': '/json-update',
                    'data': $('#machine_manage_pop_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    fnAlertMessageAutoClose('remove');
                }, parameters, '');
            });
        });

        $('#machine_manage_pop_form').find('#machine_manage_pop-close, #machine_manage_pop-close2').on('click', function () {
            $('#CURRENT_POPUP').modal('hide');
        });

        $('#machine_manage_search_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                $machineSearchBtn.trigger('click');
            }
        });

        $machineSearchBtn.on('click', function(e) {
            let targetTab = $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val();

            if(targetTab == "1"){
                //$currentGrid = $('#' + currentGridId).pqGrid(currentObj);
                $currentGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_search_form');
                } );
                $currentGrid.pqGrid("refreshDataAndView");
            }else if(targetTab == "2"){
                //$etcGrid = $('#' + etcGridId).pqGrid(etcObj);
                $etcGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_search_form');
                } );
                $etcGrid.pqGrid("refreshDataAndView");
            }else{
                fnAlert(null, "탭 선택이 잘못되었습니다.");
            }

        });

        $("#machineManageCurrentFilterKeyword").on("keyup", function(e){
            fnFilterHandler($currentGrid, 'machineManageCurrentFilterKeyword', 'machineManageCurrentFilterCondition', 'machineManageCurrentFilterColumn');
        });

        $("#machineManageCurrentFrozen").on('change', function(e){
            fnFrozenHandler($currentGrid, $(this).val());
        });

        $("#machineManageEtcFilterKeyword").on("keyup", function(e){
            fnFilterHandler($etcGrid, 'machineManageEtcFilterKeyword', 'machineManageEtcFilterCondition', 'machineManageEtcFilterColumn');
        });

        $("#machineManageEtcFrozen").on('change', function(e){
            fnFrozenHandler($etcGrid, $(this).val());
        });

        /** SelectBox 초기화 **/
        let commonCodeBotGridId = 'dataSource.getUserList';
        let paramData = {"url":"/json-list", "data": {"queryId": commonCodeBotGridId}};
        fnCommCodeDatasourceSelectBoxCreate($("#machine_manage_pop_form").find("#MAIN_USER_ID"), 'sel', paramData);
        fnCommCodeDatasourceSelectBoxCreate($("#machine_manage_pop_form").find("#SUB_USER_ID"), 'sel', paramData);


        $("#div_tabs_machine_01").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');

                $("#MACHINE_MANAGE_CURRENT_BOX").toggle();
                $("#MACHINE_MANAGE_ETC_BOX").toggle();

                let selTab = ui.newPanel.selector;

                if(selTab == "#_TAB1"){
                    $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val("1");

                }else if(selTab == "#_TAB2"){
                    $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val("2");
                }
                $("#machine_manage_pop_form").find("#addHistoryBtn").show();
                $("#machine_manage_pop_form").find("#deleteHistoryBtn").show();

                $machineSearchBtn.trigger('click');

            }
        });
        $("#div_tabs_machine_02").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                let selTab = ui.newPanel.selector;

                if(selTab == "#_TAB3"){
                    $("#pop_calendar_wrap").show();

                    if($("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val() === '1'){
                        $("#machine_manage_pop_form").find("#addHistoryBtn").hide();
                        $("#machine_manage_pop_form").find("#deleteHistoryBtn").hide();

                        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineLogList");
                    }else{
                        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");
                    }

                    $logGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('#machine_manage_pop_form');
                    } );
                    $logGrid.pqGrid("refreshDataAndView");

                }else if(selTab == "#_TAB4"){
                    $("#machine_manage_pop_form").find("#addHistoryBtn").show();
                    $("#machine_manage_pop_form").find("#deleteHistoryBtn").show();
                    $("#pop_calendar_wrap").hide();

                    $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");

                    $historyGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('#machine_manage_pop_form');
                    } );
                    $historyGrid.pqGrid("refreshDataAndView");

                }else if(selTab == '#_TAB5') {
                    $("#machine_manage_pop_form").find("#addHistoryBtn").hide();
                    $("#machine_manage_pop_form").find("#deleteHistoryBtn").hide();

                    $("#pop_calendar_wrap").show();

                    $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineEquipLogList");

                    $manageEquipLogGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('#machine_manage_pop_form');
                    } );
                    $manageEquipLogGrid.pqGrid("refreshDataAndView");

                }
            }
        });
        $("#CURRENT_POPUP").on('hide.bs.modal', function(){

            fnResetForm("machine_manage_pop_form");
            $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineInfo");
            $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/999");

            $machineSearchBtn.trigger("click");
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
                    fnResetForm("machine_manage_pop_form");
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val("");
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/999");
                }else{
                    fnJsonDataToForm("machine_manage_pop_form", dataInfo);

                    if(dataInfo.IF_USE_YN == 'Y') {
                        $("#CHECK_IF_USE_YN").prop("checked",true);
                    }

                    // 파일 정보 셋팅
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val(dataInfo.PHOTO_GFILE_SEQ);
                    $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + dataInfo.PHOTO_GFILE_SEQ);
                }

                let equip_kind = $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val();

                if(equip_kind == "1"){
                    $('a[href="#_TAB3"]').click();
                    $("#machine_manage_pop_form").find("#EQUIP_KIND").val("1");
                    $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("가공장비");
                    $("#machine_manage_pop_form").find("#_TAB3_TITLE").show();
                    $("#pop_calendar_wrap").show();

                    $("#machine_manage_pop_form").find("#addHistoryBtn").hide();
                    $("#machine_manage_pop_form").find("#deleteHistoryBtn").hide();

                }else if(equip_kind == "2"){
                    $('a[href="#_TAB4"]').click();
                    $("#machine_manage_pop_form").find("#EQUIP_KIND").val("2");
                    $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("기타장비");
                    $("#machine_manage_pop_form").find("#_TAB3_TITLE").hide();
                    $("#pop_calendar_wrap").hide();

                    $("#machine_manage_pop_form").find("#addHistoryBtn").show();
                    $("#machine_manage_pop_form").find("#deleteHistoryBtn").show();
                }

                let today = new Date();
                let startDay = new Date();
                startDay.setDate(today.getDate() - 7);

                $("#MACHINE_MANAGE_POP_ST_DT").datepicker('setDate', startDay);
                $("#MACHINE_MANAGE_POP_END_DT").datepicker('setDate', 'today');

                $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineLogList");
                $logGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_pop_form');
                } );
                $logGrid.pqGrid("refreshDataAndView");

                $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineHistoryList");
                $historyGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_pop_form');
                } );
                $historyGrid.pqGrid("refreshDataAndView");

                $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineEquipLogList");
                $manageEquipLogGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#machine_manage_pop_form');
                } );
                $manageEquipLogGrid.pqGrid("refreshDataAndView");


            }, parameters, '');
        });

        $("#machine_pop_refresh").on('click', function () {
            $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineLogList");
            $logGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#machine_manage_pop_form');
            } );
            $logGrid.pqGrid("refreshDataAndView");

            $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineEquipLogList");
            $manageEquipLogGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#machine_manage_pop_form');
            } );
            $manageEquipLogGrid.pqGrid("refreshDataAndView");
        })


        function callGridSingleFileUpload($grid, rowIndx, rowTarget){

            let companyEtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companyEtcFile.trigger("click");
            companyEtcFile.unbind().change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append("file" + i, files[i]);
                    }
                    fnFormDataFileUploadAjax(function (data) {
                        input.val('');
                        let fileInfo = data.fileUploadList[0];
                        $grid.pqGrid("updateRow", { rowIndx: rowIndx , row: { [rowTarget]: fileInfo.GFILE_SEQ } });

                    }, formData, '');
                }
            });
        };

        function machineManageCurrentFilterRender(ui) {
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
                var condition = $("#machineManageCurrentFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#machineManageCurrentFilterKeyword").val(),
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

        function machineManageEtcFilterRender(ui) {
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
                var condition = $("#machineManageEtcFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#machineManageEtcFilterKeyword").val(),
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

        /** 업체 기타 파일 업로드 */
        $("#machine_manage_pop_form").find("#etc_attach_file").click(function (e) {
            let EtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            EtcFile.trigger("click");
            EtcFile.unbind().change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append("file" + i, files[i]);
                    }
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        input.val('');
                        $("#machine_manage_pop_form").find("#ETC_GFILE_SEQ_NM").val(fileInfo.ORGINAL_FILE_NM);
                        $("#machine_manage_pop_form").find("#ETC_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData, '');
                }
            });
        });

        /** 장비 파일 업로드 */
        $("#machine_manage_pop_form").find("#photo_upload").click(function (e) {
            let photoFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");

            photoFile.trigger("click");
            photoFile.unbind().change(function () {
                var input = $(this);
                var files = input.get(0).files;

                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append("file" + i, files[i]);
                    }
                    fnFormDataFileUploadAjax(function (data) {
                        input.val('');
                        let fileInfo = data.fileUploadList[0];
                        $("#machine_manage_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                        $("#machine_manage_pop_form").find("#PHOTO_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData, '');
                }
            });
        });

        $("#CHECK_IF_USE_YN").on('change', function () {
            if($(this).prop('checked')) {
                $("#machine_manage_pop_form").find("#IF_USE_YN").val("Y");
            }else {
                $("#machine_manage_pop_form").find("#IF_USE_YN").val("N");
            }
        });

    });



</script>
