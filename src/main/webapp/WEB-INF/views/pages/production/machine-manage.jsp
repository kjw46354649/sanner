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
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="machine_manage_search_form" name="machine_manage_search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="machine.getMachineList">
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
<%-- modal --%>
<div class="modal" id="CURRENT_POPUP" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">신규 주문 등록</h4>
            </div>
            <div class="modal-body">
                <div id="ORDER_REGISTER_GRID"></div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
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
                if (ui.dataIndx === 'PHOTO_GFILE_SEQ' && ui.dataIndx === 'EQUIP_NM'){
                    let target = ui.rowData.EQUIP_ID;
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

            console.log("click-----------------");
            if(SEL_TERM_DT_USE == "Y"){
                if(SEL_ST_DT == "" || SEL_END_DT == ""){
                    alert("날짜 검색을 선택하셨습니다.\n시작날짜와 종료날짜를 선택하여 주십시오.");
                    return;
                }
            }
console.log($('#machine_manage_search_form').serialize());
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