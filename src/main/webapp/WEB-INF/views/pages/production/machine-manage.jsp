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

    .layerPopup .list99 { height: 150px; -ms-filter: "progid:DXImageTransform.Microsoft.Shadow(Strength=10, Direction=0, Color=#000000)"; }
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
                    <button type="button" class="defaultBtn yelllowGra">신규등록</button>
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
-----
<!-- 품질실적 layer popup : S -->
<div class="popup_container" id="CURRENT_POPUP" style="display: none;">
    <form class="form-inline" id="machine_manage_pop_form" name="machine_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectMachineInfo">
        <input type="hidden" id="SEQ" name="SEQ" value="">
        <input type="hidden" id="EQUIP_KIND" name="EQUIP_KIND" value="">
        <input type="hidden" id="EQUIP_ID" name="EQUIP_ID" value="" >

        <div class="layerPopup">
            <h3>품질 실적 등록</h3>
            <button type="button" class="pop_close">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
					<span class="buttonWrap">
						<button type="button" class="onoff left on">SAVE</button>
						<button type="button" class="onoff right">DELETE</button>
					</span>

                </div>
                <div class="resultWrap99 list99">
                    <div class="leftWrap">
                        <img src="/resource/main/images/1.jpg" >
                        <div class="btnWrap">
                            <button type="button" class="defaultBtn">CLOSE</button>
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
                                <td id="EQUIP_NM">홍길동(abc@naver.com)</td>
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
                                <th scope="row">내용</th>
                                <td>
                                    <span>SM45C 70*20*15 4EA</span>
                                    <span>SM45C 70*20*15 4EA</span>
                                    <span>SM45C 70*20*15 4EA</span>
                                </td>
                                <th scope="row">내용</th>
                                <td><span>SM45C 70*20*15 4EA</span></td>
                            </tr>
                        </table>
                    </div>
                </div>


                <h4>공유사항</h4>
                <div class="list98">
                    <div id="div_tabs2">
                        <div class="">&nbsp;
                            <ul class="nav nav-tabs m-b-n-xxs">
                                <li class="active">
                                    <a href="#_TAB3" data-toggle="tab" aria-expanded="true">작동로그</a>
                                </li>
                                <li class="">
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
            <div class="btnWrap">
                <button type="button" class="defaultBtn">CLOSE</button>
            </div>
        </div>

</div>
<!-- 품질실적 layer popup : E -->


<script type="text/javascript">
    /**  선언 **/
    let $searchBtn = $("#searchBtn");

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
            {title: '사진', dataType: 'string', dataIndx: 'PHOTO_GFILE_SEQ_NM', minWidth: 80 ,
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
            rowClick: function( event, ui ) {
                console.log(ui) ;
                // let rowData = ui.rowData;
                // fnResetFrom("company_master_register_form");
                // $("#company_master_register_form").find("#COMP_CD").val(rowData.COMP_CD);
                // $('#system_company_popup').modal('show');
            }
        };
        $etcGrid = $('#' + etcGridId).pqGrid(etcObj);
/**  기타장비 그리드 선언 끝 **/

/**  작동로그 그리드 선언 시작 선언만 해놓고 작업은 업무 협의 되면 진행. **/
        logPostData = fnFormToJsonArrayData('#machine_manage_search_form');
        logColModel = [
            {title: '정비 작업종류', dataType: 'string', dataIndx: 'REPAIR_TYPE',
                editor: {
                    type: 'select',
                    mapIndices: { name: "REPAIR_TYPE", id: "REPAIR_TYPE" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1036'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = estimateMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["REPAIR_TYPE"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: 'Description', dataType: 'string', dataIndx: 'REPAIR_DESC'},
            {title: '시작일시', dataType: 'string', dataIndx: 'REPAIR_START_DT'},
            {title: '종료일시', dataType: 'string', dataIndx: 'REPAIR_END_DT'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: '정비전', align: 'center', dataType: 'string', dataIndx: 'BEFORE_GFILE_SEQ', width: 70, minWidth: 70,
                render: function (ui) {
                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>&nbsp;</i>";
                    return "";
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.BEFORE_GFILE_SEQ);
                    });
                }
            },
            {title: '정비후', align: 'center', dataType: 'string', dataIndx: 'AFTER_GFILE_SEQ', width: 70, minWidth: 70,
                render: function (ui) {
                    if (ui.rowData['AFTER_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>&nbsp;</i>";
                    return "";
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.AFTER_GFILE_SEQ);
                    });
                }
            },
            {title: '', dataType: 'string', dataIndx: 'SEQ', minWidth: 80 ,
                render: function(ui){
                    return '<input type="button" value="사진삭제"/>';
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    alert(ui.rowData.SEQ);
                }
            }
        ];
        logObj = {
            width: 950,
            height: 350, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
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
            $grid = $(this),
            validate = function (that) {
                let valid = $grid.pqGrid("isValid", {
                    dataIndx: ui.dataIndx,
                    value: $inp.val(),
                    rowIndx: ui.rowIndx
                }).valid;
                if (!valid) {
                    that.firstOpen = false;
                }
            };

        //initialize the editor
        $inp
            .on("input", function (evt) {
                validate(this);
            })
            .datepicker({
                changeMonth: true,
                changeYear: true,
                showAnim: '',
                onSelect: function () {
                    this.firstOpen = true;
                    validate(this);
                },
                beforeShow: function (input, inst) {
                    return !this.firstOpen;
                },
                onClose: function () {
                    this.focus();
                }
            });
    }
        historyPostData = fnFormToJsonArrayData('#machine_manage_pop_form');
        historyColModel = [
            {title: '정비 작업종류', dataType: 'string', dataIndx: 'REPAIR_TYPE_SEL',
                editor: {
                    type: 'select',
                    mapIndices: { name: "REPAIR_TYPE_SEL", id: "REPAIR_TYPE" },
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
            { title: "시작일시", dataIndx: "REPAIR_START_DT", dataType: 'date',
                editor: {
                    type: 'textbox',
                    init: dateEditor
                },
                render: function (ui) {
                    //return "hello";
                    //var cellData = ui.cellData;
                    var cellData = "01/01/2001";
                    if (cellData) {
                        return $.datepicker.formatDate('yy-mm-dd', new Date(cellData));
                    }
                    else {
                        return "";
                    }
                },
                validations: [
                    { type: 'regexp', value: '^[0-9]{2}/[0-9]{2}/[0-9]{4}$', msg: 'Not in mm/dd/yyyy format' }
                ]
            },
            {title: '종료일시', dataType: 'string', dataIndx: 'REPAIR_END_DT'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: '정비전', align: 'center', dataType: 'string', dataIndx: 'BEFORE_GFILE_SEQ', width: 70, minWidth: 70,
                render: function (ui) {
                    if (ui.rowData['BEFORE_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>&nbsp;</i>";
                    return "";
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.BEFORE_GFILE_SEQ);
                    });
                }
            },
            {title: '정비후', align: 'center', dataType: 'string', dataIndx: 'AFTER_GFILE_SEQ', width: 70, minWidth: 70,
                render: function (ui) {
                    if (ui.rowData['AFTER_GFILE_SEQ'] > 0) return "<i id='imageView' class='fa fa-file-image-o fa-2x'>&nbsp;</i>";
                    return "";
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        callWindowImageViewer(ui.rowData.AFTER_GFILE_SEQ);
                    });
                }
            },
            {title: '', dataType: 'string', dataIndx: 'SEQ', minWidth: 80 , editable: false,
                render: function(ui){
                    return '<input type="button" value="사진삭제"/>';
                },
                postRender: function (ui) {
                    let grid = this, $cell = grid.getCell(ui);
                    alert(ui.rowData.SEQ);
                }
            }
        ];
        historyObj = {
            width: 950,
            height: 350, collapsible: false, resizable: false, showTitle: false, // pageModel: {type: "remote"},
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
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
            }
        };

        $historyGrid = $('#' + historyGridId).pqGrid(historyObj);
        /**  정비이력 그리드 선언 끝 **/




        $('.pop_close').on('click', function(e) {
            $('#CURRENT_POPUP').modal('hide');
        });
/**  이벤트  **/
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
            }


        }
    });
    // 업체상세 모달 open
    $("#CURRENT_POPUP").on('show.bs.modal', function(){
        $("#machine_manage_pop_form").find("#queryId").val("machine.selectMachineInfo");
        let parameters = {
            'url': '/json-info',
            'data': $('#machine_manage_pop_form').serialize()
        };
        fnPostAjax(function (data, callFunctionParam) {
            let dataInfo = data.info;

            console.log("fnJsonDataToForm 1");
            if(dataInfo == null || "" == dataInfo.EQUIP_ID) {
                fnResetFrom("machine_manage_pop_form");
            }else{
                fnJsonDataToForm("machine_manage_pop_form", dataInfo);

                console.log("fnJsonDataToForm 2");

                // // select 정보 셋팅
                // // $("#company_master_register_form").find("#COMP_KIND").trigger("change");
                // // $("#company_master_register_form").find("#COMP_TYPE").val(dataInfo.COMP_TYPE);
                // $("#company_master_register_form").find("#ETC_GFILE_SEQ_NM").val(dataInfo.ETC_GFILE_SEQ_NM);
                // $("#company_master_register_form").find("#ETC_GFILE_SEQ").val(dataInfo.ETC_GFILE_SEQ);
                // $("#company_master_register_form").find("#LOGO_GFILE_SEQ").val(dataInfo.LOGO_GFILE_SEQ);
                // $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/" + dataInfo.LOGO_GFILE_SEQ);
                // $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(dataInfo.SIGN_GFILE_SEQ);
                // $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + dataInfo.SIGN_GFILE_SEQ);
                // if(dataInfo.ACTIVE_YN == "Y") {
                //     $("#company_master_register_form").find("#ACTIVE_YN").trigger("click");
                // }
                // if(dataInfo.FAMILY_COMPANY_YN == "Y") {
                //     $("#company_master_register_form").find("#FAMILY_COMPANY_YN").prop('checked', true);
                // }
            }
            let equip_kind = $("#machine_manage_search_form").find("#SEL_EQUIP_KIND").val();

            if(equip_kind == "1"){
                $("#machine_manage_pop_form").find("#EQUIP_KIND").val("1");
                $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("가공장비");
            }else if(equip_kind == "2"){
                $("#machine_manage_pop_form").find("#EQUIP_KIND").val("2");
                $("#machine_manage_pop_form").find("#EQUIP_KIND_NM").html("기타장비");
            }
            $("#machine_manage_pop_form").find("#EQUIP_ID_NM").html(dataInfo.EQUIP_ID);
            $("#machine_manage_pop_form").find("#EQUIP_NM").html(dataInfo.EQUIP_NM);


            // $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterStaffList");
            // $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
            // $systemCompanyRegisterGrid.pqGrid("option", "dataModel.postData", function(ui){
            //     return fnFormToJsonArrayData('#company_master_register_form');
            // } );
            // $systemCompanyRegisterGrid.pqGrid("refreshDataAndView");


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