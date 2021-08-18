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
        <div class="none_gubunWrap">
            <div class="hWrap">
                <div class="d-inline">
                    <div class="right_sort">
                        <button type="button" class="defaultBtn" id="btnEstimateRegisterNew">신규 등록</button>
                        <button type="button" class="defaultBtn" id="btnEstimateRegisterEstimateExcel">견적서 출력</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateRegisterDrawAdd">도면 등록</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateRegisterDrawView">도면 보기</button>
                        <button type="button" class="defaultBtn radius green authorizedBtn" id="btn_estimate_register_save">저장</button>
                        <button type="button" class="defaultBtn radius blue authorizedBtn" id="btn_estimate_register_submit">제출</button>
                    </div>
                </div>
                <%--<span class="chk_box ml-15"><input id="chkEstimateRegisterDetail" type="checkbox"><label for="chkEstimateRegisterDetail"> 견적상세요건</label></span>--%>
            </div>
        </div>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <form class="form-inline" id="estimate_register_info_form" name="estimate_register_info_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="">
            <input type="hidden" id="EST_SEQ" name="EST_SEQ" value="">
            <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
            <input type="hidden" id="MAIL_BOX_SEQ" name="MAIL_BOX_SEQ" value="">
            <input type="hidden" id="EST_STATUS" name="EST_STATUS" value="">
            <div class="basicWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_65">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="EST_TITLE" class="label_65">제목</label>
<%--                            <input type="text" name="EST_TITLE" id="EST_TITLE" class="wd_542" value="" title="제목">--%>
                            <input type="search" name="EST_TITLE" id="EST_TITLE" class="wd_200" value="" title="제목">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="ORDER_STAFF_SEQ" class="label_65">구매 담당자 </label>
                            <select id="ORDER_STAFF_SEQ" name="ORDER_STAFF_SEQ" title="구매 담당자" class="wd_200">
                            </select>
                        </span>
                        <span class="slt_wrap">
                        <span class="gubun"></span>
                            <label for="COMP_CD" class="label_65">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="EST_USER_ID" class="label_65">견적 담당자</label>
                            <select id="EST_USER_ID" name="EST_USER_ID" title="견적 담당자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label for="EST_NUM" class="label_65">견적번호</label><input type="text" name="EST_NUM" id="EST_NUM" class="wd_200" value="" title="견적번호 (차수)" style="background: lightgrey;" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="DTL_AMOUNT" class="label_65">견적금액</label><input type="text" name="DTL_AMOUNT" id="DTL_AMOUNT" class="wd_200" value="" title="견적금액 계" style="background: lightgrey;" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="INSERT_DT" class="label_65">수정일시</label><input type="text" name="INSERT_DT" id="INSERT_DT" class="wd_200" value="" title="업데이트 일시" style="background: lightgrey;" readonly></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label for="SEND_DT" class="label_65">회신일시</label><input type="text" name="SEND_DT" id="SEND_DT" class="wd_200" value="" title="회신일시" style="background: lightgrey;" readonly></span>
                        <span class="gubun"></span>
                    </li>
                </ul>
                <input type="hidden" id="ESTIMATE_DETAIL_DATA" name="ESTIMATE_DETAIL_DATA">
                <input type="hidden" id="ESTIMATE_RECEIVER_DATA" name="ESTIMATE_RECEIVER_DATA">
                <input type="hidden" id="EMAIL_CONTENT" name="EMAIL_CONTENT">
            </div>
        </form>
        <div class="tableWrap">
            <div class="buttonWrap d-inline right_sort">
                <%--<button type="button" class="smallBtn yellow">견적정보</button>
                <button type="button" class="smallBtn yellow">금액정보</button>--%>
                <div class="slt_wrap namePlusSlt">
                    <label for="selEstimateRegisterCalculateApply">계산견적적용</label>
                    <select id="selEstimateRegisterCalculateApply" name="selEstimateRegisterCalculateApply" title="계산견적적용">
                        <option value="0"><spring:message code="com.form.top.sel.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1088}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <button type="button" class="defaultBtn radius authorizedBtn" id="btnEstimateRegisterAdd">추가</button>
                    <button type="button" class="defaultBtn radius red authorizedBtn" id="btnEstimateRegisterDelete">삭제</button>
                </div>
            </div>
            <div class="conMainWrap">
                <div id="custom_loading" class="custom-loading" style="display: none;">
                    <div class="custom-loading-bg"></div>
                    <div class="custom-loading-mask ui-state-highlight">
                        <div>Loading...</div>
                    </div>
                </div>
                <div id="estimate_register_top_grid" class="jqx-refresh"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="estimate_register_top_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <br>
            <div class="conWrap">
                <div class="popup">
                    <div class="resultWrap">
                        <div class="float_left col-md-5 col-sm-5" style="width: 48% !important; padding: 0px !important; padding-right: 30px !important;">
                            <div class="">
                                <h3>메일내용
                                    <%--<div class="right_float">
                                        <input type="checkbox" id="estimateRegisterAutoEmailSend"><label for="estimateRegisterAutoEmailSend"> 자동메일발송 사용</label>
                                    </div>--%>
                                </h3>
                                <textarea class="col-md-12 col-sm-12" id="EMAIL_CONTENT_TXT" name="EMAIL_CONTENT_TXT" style="height: 300px;">
                                </textarea>
                            </div>
                        </div>
                        <div class="float_right col-md-6 col-sm-6" style="padding: 0px !important;">
                            <h3 style="text-align: left;">메일수신처</h3>
                            <div class="conMainWrap">
                                <div id="estimate_register_bot_grid"></div>
                                <div class="right_sort">
                                    전체 조회 건수 (Total : <span id="estimate_register_bot_grid_records" style="color: #00b3ee">0</span>)
                                </div>
                            </div>
                            <h3 style="text-align: left;">첨부파일
                                <div class="right_float">
                                    <button type="button" class="defaultBtn radius authorizedBtn" id="btnEstimateRegisterFileUpload">추가</button>
                                </div>
                            </h3>
                            <div class="conMainWrap" id="estimateFileUpdate">
                                <div id="estimate_register_file_grid"></div>
                                <div class="right_sort">
                                    전체 조회 건수 (Total : <span id="estimate_register_file_grid_records" style="color: #00b3ee">0</span>)
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="button" id="estimateRegisterReloadBtn" style="display: none;">
<input type="button" id="updateFromControl" style="display: none;">
<input type="button" id="estimateRegisterFileUpload" style="display: none;">
<form id="estimate_register_hidden_form" method="POST">
    <input type="hidden" id="queryId" name="queryId" value="selectEstimateDetailList"/>
    <input type="hidden" id="EST_SEQ" name="EST_SEQ" value=""/>
</form>

<script type="text/javascript">
    let estimateRegisterFileGrid;
    window.estimateRegisterTopGrid = $("#estimate_register_top_grid");
    window.estimateRegisterSelectedRowIndex = [];

    $(function () {
        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#EST_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList'}});

        let context = "<p style=\"text-align:left\"><strong><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;맑은 고딕&quot;\"><span style=\"color:black\">견적번호 </span></span></span><span style=\"font-size:11.0pt\"><span style=\"font-family:Calibri\"><span style=\"color:black\">:&nbsp;&nbsp;</span></span></span></strong></p>\n" +
            "\n" +
            "<p style=\"text-align:left\"><strong><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;맑은 고딕&quot;\"><span style=\"color:black\">제목 </span></span></span><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Segoe UI&quot;\"><span style=\"color:black\">:&nbsp;&nbsp;</span></span></span></strong></p>\n" +
            "\n" +
            "<p style=\"text-align:left\"><strong><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;맑은 고딕&quot;\"><span style=\"color:black\">수신처</span></span></span> <span style=\"font-size:11.0pt\"><span style=\"font-family:Calibri\"><span style=\"color:black\">:&nbsp;</span></span></span></strong></p>\n";

        'use strict';
        estimateRegisterFileGrid = $("#estimate_register_file_grid");
        let estimateRegisterBotGrid = $("#estimate_register_bot_grid");
        let $btnEstimateRegisterDrawView = $("#btnEstimateRegisterDrawView");
        let $btnEstimateRegisterDrawAdd = $("#btnEstimateRegisterDrawAdd");

        let estimateRegisterTopColModel= [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'EST_SEQ', dataType: 'integer', dataIndx: 'EST_SEQ', hidden: true},
            {title: 'SEQ', dataType: 'integer', dataIndx: 'SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true}, // 주문 -> 견적
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true}, // 주문 -> 견적
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM', width: 150, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData == 'undefined' || typeof rowData.WORK_TYPE == 'undefined' || rowData.WORK_TYPE != 'WTP050');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050') {
                        let cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.PROJECT_NM = "";
                        return {cls: cls, text:ui.cellData};
                    }
                }
            } ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', width: 80, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData == 'undefined' || typeof rowData.WORK_TYPE == 'undefined' || rowData.WORK_TYPE != 'WTP050');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050') {
                        let cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.MODULE_NM = "";
                        return {cls: cls, text:ui.cellData};
                    }
                }
            } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', width: 170, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData == 'undefined' || typeof rowData.WORK_TYPE == 'undefined' || rowData.WORK_TYPE != 'WTP050');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050') {
                        let cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.ITEM_NM = "";
                        return {cls: cls, text:ui.cellData};
                    }
                }
            } ,
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false, sortable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ,rowData);
                    });
                }
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 100, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 100, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false } ,
            {title: 'Part<br>Unit', dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    // grid.addClass( {rowIndx: 2, dataIndx: 'profits', cls: 'pq-delete'} );
                    return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                    if (typeof rowData == 'undefined' || typeof rowData.WORK_TYPE == 'undefined' || rowData.WORK_TYPE != 'WTP050') {
                        let cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.PART_UNIT_QTY = "";
                        return {cls: cls, text:ui.cellData};
                    }
                }
            },
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData == 'undefined' || typeof rowData.WORK_TYPE == 'undefined' || rowData.WORK_TYPE != 'WTP050');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {

                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050') {
                        let cls = 'bg-lightgray';
                        if(typeof rowData.EST_SEQ == 'undefined') {
                            ui.cellData = "";
                            ui.rowData.ITEM_QTY = "";
                        }
                        return {cls: cls, text:ui.cellData};
                    }
                }
            },
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', editable: true, sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1033');
                        let index = workType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : workType[index].text;
                    }
                },
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', sortable: false,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text", options: fnGetCommCodeGridSelectBox('1027') },
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    let rowData = ui.rowData;
                    // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP020') {
                        ui.rowData.MATERIAL_DETAIL = "";
                        ui.cellData = ""
                        $("#estimate_register_top_grid").pqGrid('addClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_DETAIL', cls: 'bg-lightgray'} );
                    }else {
                        $("#estimate_register_top_grid").pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_DETAIL', cls: 'bg-lightgray'} );
                    }
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1027');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    let rowData = ui.rowData;
                    // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP020') {
                        ui.rowData.MATERIAL_KIND = "";
                        ui.cellData = ""
                        $("#estimate_register_top_grid").pqGrid('addClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_KIND', cls: 'bg-lightgray'} );
                    }else {
                        $("#estimate_register_top_grid").pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_KIND', cls: 'bg-lightgray'} );
                    }
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1029');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', width: 80, sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1039'),
                },
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    let rowData = ui.rowData;
                    // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP020') {
                        ui.rowData.SURFACE_TREAT = "";
                        ui.cellData = ""
                        $("#estimate_register_top_grid").pqGrid('addClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'SURFACE_TREAT', cls: 'bg-lightgray'} );
                    }else {
                        $("#estimate_register_top_grid").pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'SURFACE_TREAT', cls: 'bg-lightgray'} );
                    }

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1039');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false,
                editable: function (ui) {
                    let rowData = ui.rowData;
                    return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP050') {
                        let cls = 'bg-lightgray';
                        ui.cellData = "";
                        ui.rowData.MATERIAL_NOTE = "";
                        return {cls: cls, text:ui.cellData};
                    }
                }
            },
            {
                title: '후가공', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                colModel: [
                    {
                        title: '연마', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND', sortable: false,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020')},
                        editable: function (ui) {
                            let rowData = ui.rowData;
                            return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;

                            let rowData = ui.rowData;
                            // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                            if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP020') {
                                ui.rowData.MATERIAL_FINISH_GRIND = "";
                                ui.cellData = ""
                                $("#estimate_register_top_grid").pqGrid('addClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_FINISH_GRIND', cls: 'bg-lightgray'} );
                            }else {
                                $("#estimate_register_top_grid").pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_FINISH_GRIND', cls: 'bg-lightgray'} );
                            }
                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let workFactory = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
                                let index = workFactory.findIndex(function (element) {
                                    return element.text === cellData;
                                });

                                if (index < 0) {
                                    index = workFactory.findIndex(function (element) {
                                        return element.value === cellData;
                                    });
                                }

                                return (index < 0) ? cellData : workFactory[index].text;
                            }
                        }
                    },
                    {
                        title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT', sortable: false,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030')},
                        editable: function (ui) {
                            let rowData = ui.rowData;
                            return (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP020');
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;

                            let rowData = ui.rowData;
                            // if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE != 'WTP050') {
                            if (typeof rowData != 'undefined' && typeof rowData.WORK_TYPE != 'undefined' && rowData.WORK_TYPE == 'WTP020') {
                                ui.rowData.MATERIAL_FINISH_HEAT = "";
                                ui.cellData = ""
                                $("#estimate_register_top_grid").pqGrid('addClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_FINISH_HEAT', cls: 'bg-lightgray'} );
                            }else {
                                $("#estimate_register_top_grid").pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'MATERIAL_FINISH_HEAT', cls: 'bg-lightgray'} );
                            }

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let workFactory = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
                                let index = workFactory.findIndex(function (element) {
                                    return element.text === cellData;
                                });

                                if (index < 0) {
                                    index = workFactory.findIndex(function (element) {
                                        return element.value === cellData;
                                    });
                                }

                                return (index < 0) ? cellData : workFactory[index].text;
                            }
                        }
                    }
                ]
            },
            {
                title: '상세 가공요건', width: 85, sortable: false,
                // hidden: true, // 20210331 임시 hidden 처리
                render: function (ui) {
                    const rowData = ui.rowData;

                    if (rowData.EST_SEQ && rowData.SEQ) {
                        return '<button class="miniBtn" name="processing_requirements" style="background-color: #ffffd1">가공요건</button>';
                    }
                },
                postRender(ui) {
                    const grid = this,
                        $cell = grid.getCell(ui);
                    const rowData = ui.rowData;

                    $cell.find("[name=processing_requirements]").bind("click", function () {
                        processingRequirementsPop('ESTIMATE');
                    });
                }
            },
            {title: '소재사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', sortable: false,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_SUPPLY_YN", id: "MATERIAL_SUPPLY_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1042'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '예상소재 Size', align: "center", colModel:[
                    {title:'가로', dataType: 'float', dataIndx: 'SIZE_W_M', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
                    {title:'세로', dataType: 'float', dataIndx: 'SIZE_H_M', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
                    {title:'두께', dataType: 'float', dataIndx: 'SIZE_T_M', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
                    {title:'지름', dataType: 'float', dataIndx: 'SIZE_D_M', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} },
                    {title:'길이', dataType: 'float', dataIndx: 'SIZE_L_M', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} }
                ], hidden: true},
            {title: '자동 계산견적 단가', align: "center", colModel: [
                    {title: '합계', dataType: 'integer', dataIndx: 'UNIT_SUM_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '연마비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '열처리', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '표면처리', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AUTO_AMT', format: '#,###', align: 'right', editable: false, sortable: false},
                    {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_AMT', format: '#,###', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, align: 'right', sortable: false},
                    {title: '견적비고', dataType: 'string', dataIndx: 'UNIT_AMT_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, align: 'left', sortable: false}
                ]
            },
            {title: '최종견적단가', dataType: 'float', dataIndx: 'UNIT_FINAL_EST_AMT', format: '#,###', width: 80, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false },
            {title: '금액 계', dataType: 'float', dataIndx: 'DTL_AMOUNT', format: '#,###', width: 80, editable: false, sortable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, sortable: false },
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false, sortable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false, sortable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            }
        ];

        let estimateRegisterBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'RECEIVER_NM', minWidth: "30%"},
            {title: '메일주소', dataType: 'string', dataIndx: 'RECEIVER_EMAIL', minWidth: "30%"},
            {title: '전화번호', dataType: 'string', dataIndx: 'RECEIVER_TEL', minWidth: "30%"},
            {title: '', dataType: 'string', dataIndx: 'SEQ', editable: false, width: 30 ,
                render: function (ui) {
                    return '<button id="receiverRemove" class="miniBtn red">삭제</button>'
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowIndex = ui.rowIndx;
                    $cell.find('#receiverRemove').on('click', function (event) {
                        let parameter = {
                            'queryId': 'deleteEstimateEachReceiver',
                            'SEQ': ui.rowData.SEQ
                        };
                        let parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjax(function(data, callFunctionParam){
                            estimateRegisterBotGrid.pqGrid('deleteRow', { rowIndx: rowIndex });
                        }, parameters, '');
                    });
                }
            }
        ];

        let estimateRegisterFileModel =  [
            {title: 'GFILE_SEQ', dataType: 'string', dataIndx: 'GFILE_SEQ', hidden: true},
            {title: '파일명', dataType: 'string', dataIndx: 'ORGINAL_FILE_NM', width: 300, minWidth: 70},
            {title: '용량', dataType: 'string', dataIndx: 'FILE_SIZE',  width: 100, minWidth: 100,
                render: function(ui) {
                    return fn_getFileSize(ui.cellData);
                }

            },
            {title: '업로드 일시', dataType: 'string', dataIndx: 'INSERT_DT',  width: 110, minWidth: 70},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'FILE_SEQ', width: 80, minWidth: 80,
                render: function (ui) {
                    let returnVal = "";
                    if (ui.cellData) returnVal = '<button id="downloadSingleFile" class="miniBtn green">다운로드</button>'
                    return returnVal;
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadSingleFile").bind("click", function () {
                        let rowData = ui.rowData;
                        fnSingleFileDownloadFormPageAction(rowData.FILE_SEQ);
                    });
                }
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: 'FILE_SEQ', width: 70, minWidth: 70,
                render: function (ui) {
                    let EST_STATUS = $("#estimate_register_info_form #EST_STATUS").val();
                    let returnVal = "";
                    if (ui.cellData) {
                        if(EST_STATUS != 'EST020') returnVal = '<button id="deleteSingleFile" class="miniBtn red">삭제</button>'
                        return returnVal;
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#deleteSingleFile').on('click', function (event) {
                        let rowData = ui.rowData;
                        let parameter = {
                            'queryId': 'common.deleteFileKey',
                            'FILE_SEQ': rowData.FILE_SEQ
                        };
                        let parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjaxAsync(function(data, callFunctionParam){
                            let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': rowData.GFILE_SEQ };
                            fnRequestGridData(estimateRegisterFileGrid, postData);
                        }, parameters, '');
                    });
                }
            }
        ];

        let estimateRegisterFileObj = {
            height: 125, collapsible: false, resizable: false, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            editable : false,
            scrollModel: {autoFit: false}, trackModel: {on: true}, showBottom : true, postRenderInterval: -1, //call postRender synchronously.
            columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: estimateRegisterFilterRender},
            colModel: estimateRegisterFileModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'common.selectGfileFileListInfo', 'GFILE_SEQ': $("#estimate_register_info_form").find("#GFILE_SEQ").val()},
                recIndx: 'FILE_SEQ',
                getData: function (dataJSON) {
                    return {data: dataJSON.data || []};
                }
            },
            dataReady: function (event, ui) {
                if(estimateRegisterFileGrid == undefined){
                    estimateRegisterFileGrid.pqGrid(estimateRegisterFileObj);
                    estimateRegisterFileGrid.pqGrid('refresh');
                }
                if($("#estimate_register_file_grid").hasClass('pq-grid')) {
                    let data = estimateRegisterFileGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;
                    $('#estimate_register_file_grid_records').html(totalRecords);
                }
            },
        };

        let estimateRegisterTopObj = {
            height: 383,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROW_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#estimate_register_hidden_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            postRenderInterval: -1, //call postRender synchronously.
            scrollModel: { autoFit: false },
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            numberCell: {width: 30, title: "No", show: true },
            //selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: true,
            colModel: estimateRegisterTopColModel,
            showTitle: false,
            title: false,
            strNoRows: '',
            copyModel: {render: true},
            complete: function (event, ui) {
                // this.flex();
                // console.log('complete')
                let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
                $('#estimate_register_top_grid_records').html(data.length);
                var time = 800;
                if(data.length == 0) {
                    $("#estimate_register_top_grid").find(".pq-grid-norows").html("Not Found Data");
                    time = 500;
                }
                setTimeout(function (){
                    $("#custom_loading").hide();
                },time);
            },
            beforePaste: function (evt, ui) {
                let CM = this.getColModel(),
                    rows = ui.rows,
                    area = ui.areas[0],
                    //r1 = area.r1,
                    c1 = area.c1;
                for (let i = 0; i < rows.length; i++) {
                    let row = rows[i];
                    for (let j = 0; j < row.length; j++) {
                        let column = CM[j + c1],
                            dt = column.dataType;
                        if (dt === 'integer' || dt === 'float') {
                            row[j] = row[j].replace(/[^(\d|.)]/g, '');
                        }
                    }
                }
            },
            selectChange: function (event, ui) {
                estimateRegisterSelectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;
                    for (let i = firstRow; i <= lastRow; i++) estimateRegisterSelectedRowIndex.push(i);
                    if(firstRow === lastRow){
                        let selRowData = estimateRegisterTopGrid.pqGrid("getRowData", {rowIndx: firstRow});
                        $("#estimate_register_info_form").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
                }
            },
            change: function( event, ui ) {
                if (ui.source === 'paste') {
                    let addListLength = ui.addList.length;
                    let updateListLength = ui.updateList.length;

                    let rowListConvert = [];

                    const workTypeList = fnGetCommCodeGridSelectBox('1033');
                    const materialDetailList = fnGetCommCodeGridSelectBox('1027');
                    const materialKindList = fnGetCommCodeGridSelectBox('1029');
                    const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                    const materialFinishGrindList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
                    const materialFinishHeatList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');

                    for (let i = 0; i < addListLength; i++) {
                        const newRowData = ui.addList[i].newRow;
                        const rowIndx = ui.addList[i].rowIndx;
                        let workType = null;
                        let materialDetail = null;
                        let materialKind = null;
                        let surfaceTreat = null;
                        let materialFinishGrind = null;
                        let materialFinishHeat = null;

                        // 작업형태
                        if (newRowData.WORK_TYPE !== undefined) {
                            let index = workTypeList.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if(index >= 0) workType = workTypeList[index].value;
                        }
                        //소재 상세
                        if (newRowData.MATERIAL_DETAIL !== undefined) {
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if(index >= 0) materialDetail = materialDetailList[index].value;
                        }
                        // 소재형태
                        if (newRowData.MATERIAL_KIND !== undefined) {
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if(index >= 0) materialKind = materialKindList[index].value;
                        }
                        // 표면처리
                        if (newRowData.SURFACE_TREAT !== undefined) {
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if(index >= 0) surfaceTreat = surfaceTreatList[index].value;
                        }
                        // 연마비
                        if (newRowData.MATERIAL_FINISH_GRIND !== undefined) {
                            let index = materialFinishGrindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_GRIND;
                            });

                            if(index >= 0) materialFinishGrind = materialFinishGrindList[index].value;
                        }
                        // 열처리
                        if (newRowData.MATERIAL_FINISH_HEAT !== undefined) {
                            let index = materialFinishHeatList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_HEAT;
                            });

                            if(index >= 0) materialFinishHeat = materialFinishHeatList[index].value;
                        }

                        ui.addList[i].newRow.WORK_TYPE = workType ;
                        ui.addList[i].newRow.MATERIAL_DETAIL = materialDetail ;
                        ui.addList[i].newRow.MATERIAL_KIND = materialKind ;
                        ui.addList[i].newRow.SURFACE_TREAT = surfaceTreat ;
                        ui.addList[i].newRow.MATERIAL_FINISH_GRIND = materialFinishGrind ;
                        ui.addList[i].newRow.MATERIAL_FINISH_HEAT = materialFinishHeat ;
                    }

                    for (let i = 0; i < updateListLength; i++) {
                        const newRowData = ui.updateList[i].newRow;
                        const rowIndx = ui.updateList[i].rowIndx;
                        let tempNewRow = {};

                        // 작업형태
                        if (newRowData.WORK_TYPE !== undefined) {
                            let index = workTypeList.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index >= 0) tempNewRow.WORK_TYPE = workTypeList[index].value;

                            estimateRegisterTopGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'WORK_TYPE': workTypeList[index].value}
                            });
                        }
                        //소재 상세
                        if (newRowData.MATERIAL_DETAIL !== undefined) {
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index >= 0) tempNewRow.MATERIAL_DETAIL = materialDetailList[index].value;
                        }
                        // 소재형태
                        if (newRowData.MATERIAL_KIND !== undefined) {
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index >= 0) tempNewRow.MATERIAL_KIND = materialKindList[index].value;
                        }
                        // 표면처리
                        if (newRowData.SURFACE_TREAT !== undefined) {
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index >= 0) tempNewRow.SURFACE_TREAT = surfaceTreatList[index].value;
                        }
                        // 연마비
                        if (newRowData.MATERIAL_FINISH_GRIND !== undefined) {
                            let index = materialFinishGrindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_GRIND;
                            });

                            if (index >= 0) tempNewRow.MATERIAL_FINISH_GRIND = materialFinishGrindList[index].value;
                        }
                        // 열처리
                        if (newRowData.MATERIAL_FINISH_HEAT !== undefined) {
                            let index = materialFinishHeatList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_HEAT;
                            });

                            if (index >= 0) tempNewRow.MATERIAL_FINISH_HEAT = materialFinishHeatList[index].value;
                        }

                        let tempObject = {
                            rowIndx: rowIndx,
                            newRow: tempNewRow
                        };
                        rowListConvert.push(tempObject);
                    }

                    estimateRegisterTopGrid.pqGrid('updateRow', {rowList: rowListConvert});
                }

                if (ui.source === 'edit' || ui.source === 'paste') {
                    for (let i = 0; i < ui.updateList.length; i++) {
                        const rowIndx = ui.updateList[i].rowIndx;
                        const data = ui.updateList[i].rowData;
                        const ITEM_QTY = parseFloat(data.ITEM_QTY) || 0;
                        let calculateEstimateAmt = data.UNIT_FINAL_EST_AMT || data.UNIT_SUM_AUTO_AMT || 0;
                        calculateEstimateAmt *= ITEM_QTY;
                        if (calculateEstimateAmt > 0) {
                            estimateRegisterTopGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'DTL_AMOUNT': calculateEstimateAmt }, checkEditable: false });
                        }
                    }
                }
                $("#estimate_register_top_grid").pqGrid('refreshView');
            },
            // cellClick: function (event, ui) {
            //     if(ui.rowData.IMG_GFILE_SEQ && typeof(windowImageViewer) != 'undefined' && !windowImageViewer.closed) callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            // },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    estimateRegisterTopGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        }
        estimateRegisterTopGrid.pqGrid(estimateRegisterTopObj);

        selectEstimateBotList('');
        btnDisabled('');

        function selectEstimateBotList(COMP_CD) {
            if(estimateRegisterBotGrid.hasClass('pq-grid')){
                estimateRegisterBotGrid.pqGrid('destroy');
            }
            estimateRegisterBotGrid.pqGrid({
                height: 111,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateStaffEmailList', 'COMP_CD': COMP_CD},
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                postRenderInterval: -1,
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                //selectionModel: { type: 'row', mode: 'single'} ,
                collapsible: false,
                columnTemplate: { align: 'center', halign: 'center', hvalign: 'center', valign: 'center' },
                swipeModel: {on: false},
                trackModel: {on: true},
                resizable: false,
                colModel: estimateRegisterBotColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData,
                editable: false,
                complete: function (event, ui) {
                    this.flex();
                    let data = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data');

                    $('#estimate_register_bot_grid_records').html(data.length);
                },
            });

            estimateRegisterBotGrid.pqGrid("refreshDataAndView");

            // 파일 업로드
            estimateRegisterFileGrid.pqGrid(estimateRegisterFileObj);
            if($("#estimate_register_bot_grid").hasClass('pq-grid')) {
                estimateRegisterFileGrid.pqGrid('option', 'colModel', estimateRegisterFileModel);
                estimateRegisterFileGrid.pqGrid('option', 'height', '111').pqGrid('refresh');
            }
        };


        $("#estimate_register_info_form #ORDER_COMP_CD").on('change', function(){
            let compCd = $(this).val();

            fnCommCodeDatasourceSelectBoxCreate($("#estimate_register_info_form").find("#ORDER_STAFF_SEQ"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getCompanyStaffList', 'COMP_CD': compCd }});
            selectEstimateBotList(compCd);
        });

        function estimateRegisterSaveCallBack(response, callMethodParam){
            estimateRegisterReloadPageData();
        }

        function estimateRegisterReloadPageData(){

            let EST_SEQ = $("#estimate_version_up_sequence_form #hidden_est_seq").val();
            let postData = { 'queryId': 'estimate.selectEstimateRegisterMaster', 'EST_SEQ': EST_SEQ };

            let parameter = {'url': '/json-list', 'data': postData};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                let contextVal = context;
                let GfileKey = "";
                let status = "";
                fnResetFrom('estimate_register_info_form');
                $("#estimate_register_info_form #EST_TITLE").val('');
                if(list){
                    contextVal = list.EMAIL_CONTENT;
                    status = list.EST_STATUS;
                    GfileKey = list.ETC_GFILE_SEQ;

                    $("#estimate_register_info_form #EST_STATUS").val(status);
                    $("#estimate_register_info_form #ORDER_COMP_CD").val(list.ORDER_COMP_CD);
                    $("#estimate_register_info_form #EST_TITLE").val(list.EST_TITLE);
                    $("#estimate_register_info_form #ORDER_STAFF_SEQ").val(list.ORDER_STAFF_SEQ);
                    $("#estimate_register_info_form #COMP_CD").val(list.COMP_CD);
                    $("#estimate_register_info_form #EST_USER_ID").val(list.EST_USER_ID);
                    $("#estimate_register_info_form #EST_NUM").val(list.EST_NUM + ' (' + list.EST_VER + ')');
                    $("#estimate_register_info_form #DTL_CNT").val(list.DTL_CNT);
                    $("#estimate_register_info_form #DTL_AMOUNT").val(numberWithCommas(list.DTL_AMOUNT));
                    $("#estimate_register_info_form #INSERT_DT").val(list.INSERT_DT);
                    $("#estimate_register_info_form #SEND_DT").val(list.SEND_DT);
                    $("#estimate_register_info_form #GFILE_SEQ").val(GfileKey);
                }

                if($('#estimate_register_top_grid').hasClass('pq-grid')){
                    $("#estimate_register_top_grid").pqGrid('option', 'dataModel.postData', function () {
                        return { 'queryId': 'estimate.selectEstimateDetailList', 'EST_SEQ': EST_SEQ };
                    });
                    $("#estimate_register_top_grid").pqGrid('refreshDataAndView');
                }

                if($('#estimate_register_bot_grid').hasClass('pq-grid')) {
                    postData = { 'queryId': 'estimate.selectEstimateReceiverList', 'EST_SEQ': EST_SEQ };
                    fnRequestGridData(estimateRegisterBotGrid, postData);
                }

                if(typeof GfileKey != 'undefined' && GfileKey != '') {
                    if($('#estimate_register_file_grid').hasClass('pq-grid')) {
                        postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GfileKey };
                        fnRequestGridData(estimateRegisterFileGrid, postData);
                    }
                }

                CKEDITOR.instances.EMAIL_CONTENT_TXT.setData(contextVal);
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);

                //파일
                $("#common_file_download_form").find("#GFILE_SEQ").val(GfileKey);
                //Excel
                $("#common_excel_form #paramData").val(EST_SEQ);

                btnDisabled(status);
            }, parameter, '');
        }

        $(document).on('click', '#estimateRegisterReloadBtn', function(){
            $("#estimate_register_top_grid").find(".pq-grid-norows").html("");
            $("#custom_loading").show();
            estimateRegisterReloadPageData();
        });

        let errorList = [];
        let prevErrorList = [];
        let checkWorkType = [];
        function fnEstimateRegisterSave(alertYn) {
            prevErrorList = errorList;
            errorList = [];
            let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');

            validationCheck(data);
            workTypeCheck(data)
            if(checkWorkType.length) {
                fnAlert("","조립건은 최소 1개 이상의 파트를 등록하셔야합니다.");
                return false;
            }
            changeCellColor(errorList, prevErrorList);
            if (errorList.length) {
                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                return false;
            }

            $("#estimate_register_info_form #queryId").val('selectEstimateNextSequence');
            let parameters = {'url': '/json-list', 'data': $("#estimate_register_info_form").serialize()};
            let EST_SEQ = $("#estimate_register_info_form #EST_SEQ").val();
            fnPostAjaxAsync(function (data, callFunctionParam) {
                let list = data.list[0];
                if (EST_SEQ == '' || EST_SEQ == null) {
                    EST_SEQ = list.EST_SEQ;
                }

                $("#estimate_register_info_form #queryId").val('insertEstimateMaster');
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                let detail_data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
                //let mail_data = $("#EMAIL_CONTENT_TXT").val();
                let mail_data = CKEDITOR.instances.EMAIL_CONTENT_TXT.getData();
                let receiver_data = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data');
                $("#estimate_register_info_form #ESTIMATE_DETAIL_DATA").val(JSON.stringify(detail_data));
                $("#estimate_register_info_form #ESTIMATE_RECEIVER_DATA").val(JSON.stringify(receiver_data));
                $("#estimate_register_info_form #EMAIL_CONTENT").val(mail_data);

                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);
                $("#common_excel_form #paramData").val(EST_SEQ);

                $.ajax({
                    type: 'POST',
                    url: '/registerEstimateSave',
                    dataType: 'json',
                    data: $("#estimate_register_info_form").serialize(),
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                        if (textStatus === 'success') {
                            estimateRegisterSaveCallBack();
                            if (alertYn == 'Y') {
                                fnAlert(null, "저장 되었습니다.");
                            }
                        } else {
                            // alert('fail=[' + json.msg + ']111');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        fnAlert(null, '저장중 에러가 발생하였습니다.');
                    }
                });
            }, parameters, '');
        }

        const saveFromControlToEstimate = function (alertYn) {
            prevErrorList = errorList;
            errorList = [];
            let data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');

            validationCheck(data);
            changeCellColor(errorList, prevErrorList);
            if (errorList.length) {
                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                return false;
            }

            $("#estimate_register_info_form #queryId").val('selectEstimateNextSequence');
            let parameters = {'url': '/json-list', 'data': $("#estimate_register_info_form").serialize()};
            let EST_SEQ = $("#estimate_register_info_form #EST_SEQ").val();
            fnPostAjaxAsync(function (data, callFunctionParam) {
                let list = data.list[0];
                if (EST_SEQ == '' || EST_SEQ == null) {
                    EST_SEQ = list.EST_SEQ;
                }

                $("#estimate_register_info_form #queryId").val('insertEstimateMaster');
                $("#estimate_register_info_form #EST_SEQ").val(EST_SEQ);
                let detail_data = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data');
                //let mail_data = $("#EMAIL_CONTENT_TXT").val();
                let mail_data = CKEDITOR.instances.EMAIL_CONTENT_TXT.getData();
                let receiver_data = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data');
                $("#estimate_register_info_form #ESTIMATE_DETAIL_DATA").val(JSON.stringify(detail_data));
                $("#estimate_register_info_form #ESTIMATE_RECEIVER_DATA").val(JSON.stringify(receiver_data));
                $("#estimate_register_info_form #EMAIL_CONTENT").val(mail_data);

                $("#estimate_version_up_sequence_form #hidden_est_seq").val(EST_SEQ);
                $("#common_excel_form #paramData").val(EST_SEQ);

                $.ajax({
                    type: 'POST',
                    url: '/saveFromControlToEstimate',
                    dataType: 'json',
                    data: $("#estimate_register_info_form").serialize(),
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                        if (textStatus === 'success') {
                            estimateRegisterSaveCallBack();
                            if (alertYn == 'Y') {
                                fnAlert(null, "저장 되었습니다.");
                            }
                        } else {
                            // alert('fail=[' + json.msg + ']');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        fnAlert(null, '저장중 에러가 발생하였습니다.');
                    }
                });
            }, parameters, '');
        };

        const validationCheck = function (dataList) {
            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];

                if (Object.keys(rowData).length > 5) {
                    // requiredCheck(rowData);
                    badCodeCheck(rowData);
                    standardCheck(rowData);
                    // inputErrorCheck(rowData);
                }
            }
        }
        function workTypeCheck(dataList) {
            const groupedDrawingNum = fnGroupBy(dataList, 'DRAWING_NUM');
            const groupedWorkType = fnGroupBy(dataList, 'WORK_TYPE');
            if(typeof groupedWorkType['WTP020'] != 'undefined') {
                $.each(groupedWorkType['WTP020'], function(idx,Item) {
                    if(groupedDrawingNum[Item.DRAWING_NUM].length < 2) {
                        // fnAlert("","조립건은 최소 1개 이상의 파트를 등록하셔야합니다.");
                        checkWorkType.push("ERROR");
                    }else {
                        let flag = true;
                        $.each(groupedDrawingNum[Item.DRAWING_NUM], function (idx2,Item2) {
                            if(Item2.WORK_TYPE == 'WTP050') {
                                flag = false;
                            }
                        })
                        if(flag) {
                            // fnAlert("","조립건은 최소 1개 이상의 파트를 등록하셔야합니다.");
                            checkWorkType.push("ERROR");
                        }
                    }
                })
            }
        }

        // 잘못된 데이터(코드) 체크
        const badCodeCheck = function (rowData) {
            const workTypeList = fnGetCommCodeGridSelectBox('1033');
            const materialDetailList = fnGetCommCodeGridSelectBox('1027');
            const materialKindList = fnGetCommCodeGridSelectBox('1029');
            const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
            const materialFinishGrindList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
            const materialFinishHeatList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
            let rowIndex = rowData.pq_ri;

            // 작업형태
            if (!fnIsEmpty(rowData.WORK_TYPE)) {
                let index = workTypeList.findIndex(function (element) {
                    return element.value === rowData.WORK_TYPE;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_TYPE');
            }
            //소재 상세
            if (!fnIsEmpty(rowData.MATERIAL_DETAIL)) {
                let index = materialDetailList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_DETAIL;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_DETAIL');
            }
            // 소재형태
            if (!fnIsEmpty(rowData.MATERIAL_KIND)) {
                let index = materialKindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_KIND;
                });

                if (index < 0) addErrorList(rowIndex, 'ORDER_COMP_CD');
            }
            // 표면처리
            if (!fnIsEmpty(rowData.SURFACE_TREAT)) {
                let index = surfaceTreatList.findIndex(function (element) {
                    return element.value === rowData.SURFACE_TREAT;
                });

                if (index < 0) addErrorList(rowIndex, 'SURFACE_TREAT');
            }
            // 연마비
            if (!fnIsEmpty(rowData.MATERIAL_FINISH_GRIND)) {
                let index = materialFinishGrindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_GRIND;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_GRIND');
            }
            // 열처리
            if (!fnIsEmpty(rowData.MATERIAL_FINISH_HEAT)) {
                let index = materialFinishHeatList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_HEAT;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_HEAT');
            }
        };

        const standardCheck = function (rowData) {
            if (!fnIsEmpty(rowData.SIZE_TXT)) {
                const sizeTxt = String(rowData.SIZE_TXT).toUpperCase();
                let expression;

                if (sizeTxt.includes('@')) {
                    expression = /^@\d+(\.\d+)?\*\d+(\.\d+)?$/;
                } else if (sizeTxt.includes('R')) {
                    expression = /^R\d+(\.\d+)?\*\d+(\.\d+)?$/;
                } else if (sizeTxt.includes('H')) {
                    expression = /^H\d+(\.\d+)?\*\d+(\.\d+)?$/;
                } else if (sizeTxt.includes('M')) {
                    expression = /^M\d+(\.\d+)?\*\d+(\.\d+)?$/;
                } else {
                    expression = /^(\d+(\.\d+)?\*\d+(\.\d+)?\*\d+(\.\d+)?)$/;
                }

                const regex = new RegExp(expression, 'gm');

                if (!regex.test(sizeTxt)) {
                    const rowIndex = rowData.pq_ri;

                    addErrorList(rowIndex, 'SIZE_TXT');
                }
            }
        };

        const addErrorList = function (rowIndex, dataIndex) {
            let tempObject = {};
            tempObject.rowIndx = rowIndex;
            tempObject.dataIndx = dataIndex;
            errorList.push(tempObject);
        };

        // cell 색 변경
        const changeCellColor = function (list, prevList) {
            for(let i in prevList) {
                if (prevList.hasOwnProperty(i)) {
                    estimateRegisterTopGrid.pqGrid('removeClass', {rowIndx: prevList[i].rowIndx, dataIndx: prevList[i].dataIndx, cls: 'bg-lightcoral'} );
                }
            }

            if (list.length > 0) {
                for(let i in list) {
                    if (list.hasOwnProperty(i)) {
                        estimateRegisterTopGrid.pqGrid('addClass', {rowIndx: list[i].rowIndx, dataIndx: list[i].dataIndx, cls: 'bg-lightcoral'} );
                    }
                }
            }
        };

        const noSelectedRowAlert = function () {
            if (estimateRegisterSelectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        /** 버튼 처리 **/
        $("#btnEstimateRegisterNew").on('click', function(){
            $("#estimate_version_up_sequence_form #hidden_est_seq").val('');
            fnResetFrom("estimate_register_info_form");
            fnResetFrom("estimate_register_hidden_form");
            estimateRegisterReloadPageData();
        });

        $("#btn_estimate_register_submit").on("click", function () {
            fnEstimateRegisterSave('N');

            let autoEmailYn = estimateRegisterBotGrid.pqGrid('option', 'dataModel.data').length > 0 ? true : false;
            let message = autoEmailYn ? '메일을 송신합니다. 계속 진행하시겠습니까?' : '메일 송신 없이 완료처리만 진행합니다.<br>진행하시겠습니까?';

            fnConfirm(null, message, function () {
                if (autoEmailYn) {
                    let parameter = {'queryId': 'estimate.selectEstimateMailNextSequence'};
                    let parameters = {'url': '/json-list', 'data': parameter};
                    fnPostAjaxAsync(function (data, callFunctionParam) {
                        let list = data.list[0];
                        let MAIL_BOX_SEQ = list.MAIL_BOX_SEQ;
                        $("#estimate_register_info_form #MAIL_BOX_SEQ").val(MAIL_BOX_SEQ);
                        $("#estimate_register_info_form #queryId").val('mail.insertEstimateSubmitMail');
                        parameters = {
                            'url': '/json-update',
                            'data': $("#estimate_register_info_form").serialize()
                        };
                        fnPostAjaxAsync(function () {
                            $("#estimate_register_info_form #queryId").val('estimate.updateEstimateMasterFinishWithMail');
                            parameters = {
                                'url': '/json-update',
                                'data': $("#estimate_register_info_form").serialize()
                            };
                            fnPostAjaxAsync(estimateRegisterSaveCallBack, parameters, '');
                            fnAlert(null, "제출 완료하였습니다.");
                        }, parameters, '');

                    }, parameters, '');
                } else {
                    $("#estimate_register_info_form #queryId").val('estimate.updateEstimateMasterFinish');
                    let parameters = {
                        'url': '/json-update',
                        'data': $("#estimate_register_info_form").serialize()
                    };
                    fnPostAjaxAsync(estimateRegisterSaveCallBack, parameters, '');
                    fnAlert(null, "완료처리 되었습니다.");
                }
            });
        });

        $("#btn_estimate_register_save").on("click", function(){
            fnEstimateRegisterSave('Y');
        });

        $("#btnEstimateRegisterAdd").on('click', function(){
            let totalRecords = estimateRegisterTopGrid.pqGrid('option', 'dataModel.data').length;
            estimateRegisterTopGrid.pqGrid('addNodes', [{}], totalRecords+1);
        });

        $("#btnEstimateRegisterDelete").on('click', function(){
            let USER_MASTER_QUERY_ID = 'deleteEstimateDetail';
            fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
        });

        $("#btnEstimateRegisterEstimateExcel").on('click', function(){
            $("#common_excel_form #sqlId").val('selectEstimateDetailListExcel:selectEstimateMasterInfoExcel');
            $("#common_excel_form #mapInputId").val('data:info');
            $("#common_excel_form #paramName").val('EST_SEQ');
            $("#common_excel_form #template").val('estimate_template');

            fnReportFormToHiddenFormPageAction("common_excel_form", "/downloadExcel");
        });

        $("#chkEstimateRegisterDetail").on('click', function(){

        });

        $("#selEstimateRegisterCalculateApply").on('change', function () {
            if (noSelectedRowAlert()) return false;

            let number = Number($('#selEstimateRegisterCalculateApply option:selected').val());

            for (let i = 0, selectedRowCount = estimateRegisterSelectedRowIndex.length; i < selectedRowCount; i++) {
                const rowData = estimateRegisterTopGrid.pqGrid('getRowData', {rowIndx: estimateRegisterSelectedRowIndex[i]});
                let UNIT_FINAL_EST_AMT = rowData.UNIT_FINAL_EST_AMT || rowData.UNIT_SUM_AUTO_AMT || null;
                UNIT_FINAL_EST_AMT = (Math.ceil(UNIT_FINAL_EST_AMT * (number / 100) / 100) * 100).toFixed(0) || null;

                estimateRegisterTopGrid.pqGrid('updateRow', {
                    rowIndx: estimateRegisterSelectedRowIndex[i],
                    row: {UNIT_FINAL_EST_AMT: UNIT_FINAL_EST_AMT},
                    checkEditable: false
                });
            }
        });

        $("#estimateRegisterFileUpload").on('click', function(){
            let GfileKey = $("#common_file_download_form").find("#GFILE_SEQ").val();
            if(!GfileKey) {
                $("#estimate_register_info_form #GFILE_SEQ").val('');
                let parameter = {
                    'queryId': 'estimate.updateEstimateMasterGfileSeq',
                    'EST_SEQ': $("#estimate_register_info_form #EST_SEQ").val()
                };
                let parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjaxAsync('', parameters, '');
            }

            $("#estimate_register_info_form #GFILE_SEQ").val(GfileKey);
            let postData = { 'queryId': 'common.selectGfileFileListInfo', 'GFILE_SEQ': GfileKey };
            estimateRegisterFileGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            estimateRegisterFileGrid.pqGrid('refreshDataAndView');
        });

        $("#btnEstimateRegisterFileUpload").on('click', function(){
            let GfileKey = $("#estimate_register_info_form #GFILE_SEQ").val();
            $("#common_file_download_form").find("#GFILE_SEQ").val(GfileKey);
            $("#common_file_download_form #deleteYn").val(true);
            commonFileDownUploadPopupCall(GfileKey, 'estimateRegisterFileUpload');
        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawAdd.click(function () {
            const gridInstance = estimateRegisterTopGrid.pqGrid('getInstance').grid;
            if (gridInstance.isDirty()) {
                fnAlert(null,"변경된 사항이 존재합니다. 저장 후 등록 해 주세요.");
                return false;
            }

            drawingUploadPopupWindow('estimate', 'estimate.manageEstimateCadFiles', '');
        });

        /* 도면 등록 팝업 호출 */
        $btnEstimateRegisterDrawView.click(function () {
            callWindowImageViewer($("#estimate_register_info_form").find("#GFILE_SEQ").val());
        });

        /* CKEDITOR 부분 */
        CKEDITOR.replace( 'EMAIL_CONTENT_TXT', { height: 195 });
        CKEDITOR.instances.EMAIL_CONTENT_TXT.setData(context);

        $('#updateFromControl').on('click', function () {
            let CONTROL_SEQ = $("#estimate_version_up_sequence_form #hidden_control_seq").val();
            let postData = { 'queryId': 'estimate.selectEstimateInfoFromControl', 'CONTROL_SEQ': CONTROL_SEQ };
            let parameter = {'url': '/json-info', 'data': postData};

            fnPostAjax(function (data, callFunctionParam) {
                let info = data.info;

                $("#estimate_register_info_form #ORDER_COMP_CD").val(info.ORDER_COMP_CD);
                $("#estimate_register_info_form #ORDER_STAFF_SEQ").val(info.ORDER_STAFF_SEQ);
                $("#estimate_register_info_form #COMP_CD").val(info.COMP_CD);
                $("#estimate_register_info_form #DTL_CNT").val(info.DTL_CNT);
                $("#estimate_register_info_form #DTL_AMOUNT").val(info.DTL_AMOUNT);
                $("#estimate_register_info_form #INSERT_DT").val(info.INSERT_DT);
                context = info.EMAIL_CONTENT;
                CKEDITOR.instances.EMAIL_CONTENT_TXT.setData(info.EMAIL_CONTENT);
                btnDisabled();
            }, parameter, '');

            postData = { 'queryId': 'estimate.selectEstimateListFromControl', 'CONTROL_SEQ': CONTROL_SEQ };
            fnRequestGridData(estimateRegisterTopGrid, postData);

            postData = { 'queryId': 'estimate.selectEstimateReceiverListFromControl', 'CONTROL_SEQ': CONTROL_SEQ };
            fnRequestGridData(estimateRegisterBotGrid, postData);

            setTimeout(function () {
                saveFromControlToEstimate('N');
            }, 1000);
        });
    });

    function btnDisabled(status) {
        if(status == 'EST020'){
            $(".authorizedBtn").attr('disabled', true);

        }else {
            $(".authorizedBtn").attr('disabled', false);
        }
    }

    function estimateRegisterFilterRender(ui) {
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
            if($.isNumeric(val)) val = numberWithCommas(val);
            var condition = $("#estimateListFilterCondition :selected").val(),
                valUpper = val.toString().toUpperCase(),
                txt = $("#estimateListFilterKeyword").val(),
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
            if (indx >= 0) {
                var txt1 = val.toString().substring(0, indx);
                var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                var txt3 = val.toString().substring(indx + txtUpper.length);
                return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
            }
            else {
                return val;
            }
        }
        else {
            return val;
        }
    }
</script>