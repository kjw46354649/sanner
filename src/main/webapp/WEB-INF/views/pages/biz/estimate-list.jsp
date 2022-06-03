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
                        <span class="ipu_wrap"><label class="label_100" for="EST_TITLE">제목</label><input type="search" name="EST_TITLE" id="EST_TITLE" class="wd_200" title="제목"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">도면번호</label><input type="search" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="도면번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnEstimateListSearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="EST_NUM">견적번호</label><input type="search" name="EST_NUM" id="EST_NUM" class="wd_200" value="" title="견적번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="search" name="ITEM_NM" id="ITEM_NM" class="wd_200 " value="" title="품명"></span>
                        <span class="gubun"></span>
                    </li>
                    <li class="">
                        <span class="ipu_wrap"><label class="label_100">기간 조회</label></span>
                        <span class="d-inline-block wd_200">
                            <span class="chk_box"><input name="SHIPMENT_COMPLETED" id="SHIPMENT_COMPLETED" type="checkbox"><label for="SHIPMENT_COMPLETED"> 발송완료</label></span>
                            <span class="chk_box"><input name="LATEST_VER" id="LATEST_VER" type="checkbox"><label for="LATEST_VER"> 최신차수</label></span>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap trans_slt" style="width: 120px">
                            <select id="DATE_CONDITION" name="DATE_CONDITION" title="등록일시" style="width: inherit; text-align-last: center">
                                <c:forEach var="code" items="${HighCode.H_1044}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <div class="d-inline-block">
                            <span class="calendar_span">
                                <input type="text" name="ESTIMATE_LIST_START_DT" id="ESTIMATE_LIST_START_DT"><button type="button" id="dateOneIpButton">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="ESTIMATE_LIST_END_DT" id="ESTIMATE_LIST_END_DT"><button type="button" id="dateTwoIpButton">달력선택</button>
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <button type="button" class="defaultBtn" id="btnEstimateListNewEstimate">신규 작성</button>
                <button type="button" class="defaultBtn" id="btnEstimateListNewVersion">차수 생성</button>
                <%--<span class="chk_box ml-15"><input id="chkEstimateListDetail" type="checkbox"><label for="chkEstimateListDetail"> 견적상세요건</label></span>--%>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn radius red" id="btnEstimateListDelete">삭제</button>
                </div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="buttonWrap">
                <div class="d-inline">
                    <%--<button type="button" class="smallBtn yellow">견적정보</button>
                    <button type="button" class="smallBtn yellow">금액정보</button>--%>
                    <input type="search" id="estimateListFilterKeyword" placeholder="Enter your keyword">
                    <select id="estimateListFilterColumn"></select>
                    <select id="estimateListFilterCondition">
                        <c:forEach var="code" items="${HighCode.H_1083}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                    <label for="estimateListFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                    <select id="estimateListFrozen" name="estimateListFrozen">
                    </select>
                    <div class="slt_wrap namePlusSlt right_float">
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateCadPrint">견적도면 출력</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateListExcel">견적List 출력</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateExcel">견적서 출력</button>
                        <button type="button" class="defaultBtn grayGra" id="btnEstimateListDrawView">도면 보기</button>
                    </div>
                </div>
            </div>
            <div class="conMainWrap">
                <div id="estimate_master_top_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="estimate_master_top_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <br/>
            <div class="conWrap" style="height:384px;">
                <div id="estimate_master_bot_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="estimate_master_bot_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<form class="form-inline" id="estimate_master_hidden_form" name="estimate_master_hidden_form" role="form">
    <input type="hidden" id="queryId" name="queryId" value="insertEstimateVersion"/>
    <input type="hidden" id="EST_SEQ" name="EST_SEQ"/>
    <input type="hidden" id="EST_VER" name="EST_VER"/>
    <input type="hidden" id="N_EST_SEQ" name="N_EST_SEQ"/>
    <input type="hidden" id="VERSION_UP_YN" name="VERSION_UP_YN"/>
</form>
<input type="button" id="estimateListFileUpload" style="display: none;">

<script type="text/javascript">
    'use strict';
    let estimateTopSelectedRowIndex = [];
    let estimateBotSelectedRowIndex = [];
    let estimateMasterTopGrid = $("#estimate_master_top_grid");
    let estimateMasterBotGrid = $("#estimate_master_bot_grid");

    $(function () {
        // $('#dateOneIp').datepicker({dateFormat: 'yy/mm/dd'});
        // $('#dateTwoIp').datepicker({dateFormat: 'yy/mm/dd'});
        // $('#dateOneIp').datepicker('setDate', 'today');
        // $('#dateTwoIp').datepicker('setDate', 'today');

        /** topWrap datepicker 처리 **/
        $('#ESTIMATE_LIST_START_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ESTIMATE_LIST_END_DT').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ESTIMATE_LIST_START_DT').datepicker('setDate', '-1M');
        $('#ESTIMATE_LIST_END_DT').datepicker('setDate', 'today');

        let estimateMasterTopColModel= [
            //{title: 'No.', dataType: 'string', dataIndx: 'EST_SEQ'},
            {title: '상태', dataType: 'string', dataIndx: 'EST_STATUS_NM', width: 60 },
            {title: '주문접수', dataType: 'date', dataIndx: '', width: 80 ,
                render: function(ui){
                    let ORDER_YN = ui.rowData.ORDER_YN;
                    let EST_SEQ = ui.rowData.EST_SEQ;
                    let EST_VER = ui.rowData.EST_VER;
                    let FINAL_VER = ui.rowData.FINAL_VER;

                    if(ORDER_YN == 'N') {
                        if(FINAL_VER == 'Y'){
                            return '<button type="button" id="estimateOrder" data-seq="'+EST_SEQ+'" data-ver="'+EST_VER+'" class="miniBtn blue">주문등록</button>'
                        }
                    } else {
                        return '<span class="miniBtn gray">등록완료</span>'
                    }
                }
            },
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 100 ,
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
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_NM', width: 70 },
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM', width: 100 ,
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
            {title: '견적번호', dataType: 'string', dataIndx: 'EST_NUM', width: 120 },
            {title: '차수', dataType: 'string', dataIndx: 'EST_VER', minWidth: 30},
            {title: '', dataType: 'string', dataIndx: '', width: 30 ,
                render: function(ui){
                    let EST_STATUS = ui.rowData.EST_STATUS;
                    let EST_SEQ = ui.rowData.EST_SEQ;

                    return '<button type="button" id="estimateRegisterPage" data-status="'+EST_STATUS+'" data-seq="'+EST_SEQ+'" class="miniBtn green">상세</button>'
                }
            },
            {title: '제목', dataType: 'string', dataIndx: 'EST_TITLE', width: 250 },
            {title: '품수', dataType: 'string', dataIndx: 'DTL_CNT', minWidth: 30},
            {title: '금액 계', dataType: 'string', dataIndx: 'DTL_AMOUNT', format: '#,###', width: 80},
            {title: '등록일시', dataType: 'date', dataIndx: 'INSERT_DT', width: 100 },
            {title: '견적담당', dataType: 'string', dataIndx: 'EST_USER', width: 100 ,
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
            {title: '첨부파일', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ', width: 50,
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadViewPopup" class="ui-icon ui-icon-folder-open" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadViewPopup").bind("click", function () {
                        let rowData = ui.rowData;
                        // 파일
                        if(rowData.EST_STATUS == 'EST020'){
                            $("#common_file_download_form #deleteYn").val(false);
                        }else{
                            $("#common_file_download_form #deleteYn").val(true);
                        }
                        commonFileDownUploadPopupCall(rowData.ETC_GFILE_SEQ, 'estimateListFileUpload');
                    });
                }
            },
            {title: '제출일시', dataType: 'string', dataIndx: 'SEND_DT', width: 100},
            {title: '메일여부', dataType: 'string', dataIndx: 'MAIL_SEND_YN', width: 60,
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '메일발송일시', dataType: 'string', dataIndx: 'MAIL_SEND_DT', width: 120}
        ];

        let estimateMasterBotColModel= [
            {title: '프로젝트', dataType: 'string', dataIndx: 'PROJECT_NM', width: 150, sortable: false } ,
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', width: 60, sortable: false } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', width: 150, sortable: false } ,
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, sortable: false, editable: false,
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
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', validations: [{ type: 'minLen', value: 1, msg: "Required"}], width: 100, sortable: false } ,
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 80, sortable: false } ,
            {title: 'Part<br>Unit',dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY', width: 50, sortable: false},
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', width: 50, sortable: false},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', sortable: false, editable: false,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

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
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

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
                }
            },
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1029'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

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
                }
            },
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', width: 80, sortable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1039'),
                },
                render: function (ui) {
                    let cellData = ui.cellData;

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
                }

            },
            {title: '소재 비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', sortable: false },
            {title: '소재마감', align: "center", colModel:[
                    {title: '연마비', dataType: 'string', dataIndx: 'MATERIAL_FINISH_GRIND', width: 70, sortable: false,
                        editor: {
                            type: 'select',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020'),
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;

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
                    {title: '열처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', width: 70, sortable: false,
                        editor: {
                            type: 'select',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030'),
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;

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
                    },
                ]},
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
                    {title: '합계', dataType: 'integer', dataIndx: 'UNIT_SUM_AUTO_AMT', format: '#,###', sortable: false},
                    {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AUTO_AMT', format: '#,###', sortable: false},
                    // {title: '소재비', dataType: 'integer', dataIndx: 'UNIT_MATERIAL_AMT', format: '#,###'},
                    // {title: '연마비', datatype: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT', format: '#,###', sortable: false},
                    // {title: '연마비', datatype: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AMT', format: '#,###'},
                    // {title: '열처리', datatype: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT', format: '#,###', sortable: false},
                    // {title: '열처리', datatype: 'integer', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AMT', format: '#,###'},
                    {title: '표면처리', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AUTO_AMT', format: '#,###', sortable: false},
                    // {title: '표면처리', dataType: 'integer', dataIndx: 'UNIT_SURFACE_AMT', format: '#,###'},
                    {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AUTO_AMT', format: '#,###', sortable: false},
                    // {title: '가공비', dataType: 'integer', dataIndx: 'UNIT_PROCESS_AMT', format: '#,###'},
                    {title: '기타추가', dataType: 'integer', dataIndx: 'UNIT_ETC_AMT', format: '#,###', sortable: false},
                    {title: '견적비고', dataType: 'integer', dataIndx: 'UNIT_AMT_NOTE', sortable: false}
            ]},
            {title: '최종견적단가', dataType: 'float', dataIndx: 'UNIT_FINAL_EST_AMT', format: '#,###', width: 80, sortable: false},
            {title: '금액 계', dataType: 'float', dataIndx: 'DTL_AMOUNT', format: '#,###', width: 80, sortable: false},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', sortable: false},
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

        estimateMasterTopGrid.pqGrid({
            width: '100%', height: 327,
            postRenderInterval: -1, //call postRender synchronously.
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#estimate_master_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            scrollModel: { autoFit: false },
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: estimateListFilterRender}, filterModel: { mode: 'OR' },
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            colModel: estimateMasterTopColModel,
            showTitle: false,
            strNoRows: g_noData,
            editable: false,
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
                $("#estimateListFilterColumn").empty();
                $("#estimateListFilterColumn").html(filterOpts);
                $("#estimateListFrozen").empty();
                $("#estimateListFrozen").html(frozenOts);
            },
            complete: function(event, ui) {
                //this.flex();
                let data = estimateMasterTopGrid.pqGrid('option', 'dataModel.data');

                $('#estimate_master_top_grid_records').html(data.length);

                if(data.length > 0){
                    estimateMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
                }else{
                    selectEstimateBotList('');
                }
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                console.log('top', ui.addList);
                let EST_STATUS = ui.addList[0].rowData.EST_STATUS;
                btnDisabled(EST_STATUS);
                estimateTopSelectedRowIndex = [ui.addList[0].rowIndx];
                estimateBotSelectedRowIndex = []; // 선택시 하단 그리드 초기화

                let EST_SEQ = ui.addList[0].rowData.EST_SEQ;
                let EST_VER = ui.addList[0].rowData.EST_VER;
                let VERSION_UP_YN = ui.addList[0].rowData.VERSION_UP_YN;

                $("#estimate_master_hidden_form #EST_SEQ").val(EST_SEQ);
                $("#estimate_master_hidden_form #EST_VER").val(EST_VER);
                $("#estimate_master_hidden_form #VERSION_UP_YN").val(VERSION_UP_YN);
                $("#common_excel_form #paramData").val(EST_SEQ);
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
                scrollModel: { autoFit: false },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                trackModel: {on: true},
                resizable: false,
                colModel: estimateMasterBotColModel,
                showTitle: false,
                strNoRows: g_noData,
                editable: false,
                copyModel: {render: true},
                complete: function (event, ui) {
                    // this.flex();
                    let data = estimateMasterBotGrid.pqGrid('option', 'dataModel.data');

                    $('#estimate_master_bot_grid_records').html(data.length);
                },
                rowSelect: function( event, ui ) {
                    console.log('bot', ui.addList);
                    estimateBotSelectedRowIndex = [ui.addList[0].rowIndx];
                },
                change: function( event, ui ) {
                    if(ui.source == 'edit'){
                        let rowIndx = ui.updateList[0].rowIndx;
                        let calculateEstimateAmt = 0;
                        let data = ui.updateList[0].rowData;
                        let UNIT_MATERIAL_AMT = data.UNIT_MATERIAL_AMT == null || data.UNIT_MATERIAL_AMT == '' ? 0 : parseFloat(data.UNIT_MATERIAL_AMT);
                        let UNIT_MATERIAL_FINISH_GRIND_AMT = data.UNIT_MATERIAL_FINISH_GRIND_AMT == null || data.UNIT_MATERIAL_FINISH_GRIND_AMT == '' ? 0 : parseFloat(data.UNIT_MATERIAL_FINISH_GRIND_AMT);
                        let UNIT_MATERIAL_FINISH_HEAT_AMT = data.UNIT_MATERIAL_FINISH_HEAT_AMT == null || data.UNIT_MATERIAL_FINISH_HEAT_AMT == '' ? 0 : parseFloat(data.UNIT_MATERIAL_FINISH_HEAT_AMT);
                        let UNIT_SURFACE_AMT = data.UNIT_SURFACE_AMT == null || data.UNIT_SURFACE_AMT == '' ? 0 : parseFloat(data.UNIT_SURFACE_AMT);
                        let UNIT_PROCESS_AMT = data.UNIT_PROCESS_AMT == null || data.UNIT_PROCESS_AMT == '' ? 0 : parseFloat(data.UNIT_PROCESS_AMT);
                        let UNIT_ETC_AMT = data.UNIT_ETC_AMT == null || data.UNIT_ETC_AMT == '' ? 0 : parseFloat(data.UNIT_ETC_AMT);
                        let ITEM_QTY = data.ITEM_QTY == null || data.ITEM_QTY == '' ? 0 : parseFloat(data.ITEM_QTY);

                        calculateEstimateAmt += UNIT_MATERIAL_AMT;
                        calculateEstimateAmt += UNIT_MATERIAL_FINISH_GRIND_AMT;
                        calculateEstimateAmt += UNIT_MATERIAL_FINISH_HEAT_AMT;
                        calculateEstimateAmt += UNIT_SURFACE_AMT;
                        calculateEstimateAmt += UNIT_PROCESS_AMT;
                        calculateEstimateAmt += UNIT_ETC_AMT;


                        let UNIT_FINAL_EST_AMT = ui.updateList[0].newRow.UNIT_FINAL_EST_AMT
                        if(UNIT_FINAL_EST_AMT != undefined){
                            calculateEstimateAmt = UNIT_FINAL_EST_AMT;
                        }
                        estimateMasterBotGrid.pqGrid("updateRow", { 'rowIndx': rowIndx , row: { 'UNIT_FINAL_EST_AMT': calculateEstimateAmt } });

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

        $('#estimate_master_search_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchEstimate();
            }
        });

        /** 버튼 처리 **/
        $("#btnEstimateListSearch").on('click', function(){
            searchEstimate();
        });

        function searchEstimate() {
            estimateMasterTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#estimate_master_search_form'));
            });
            estimateMasterTopGrid.pqGrid('refreshDataAndView');
        }

        $("#btnEstimateListDelete").on('click', function(){
            /*let ESTIMATE_MASTER_QUERY_ID = ['deleteEstimateMaster', 'deleteEstimateDetail'];
            fnDeletePQGrid(estimateMasterTopGrid, estimateMasterSelectedRowIndex, ESTIMATE_MASTER_QUERY_ID);*/

            let parameter = {
                'queryId': 'deleteEstimateReceiver',
                'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
            };
            let parameters = {'url': '/json-remove', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                parameter = {
                    'queryId': 'deleteEstimateDetail',
                    'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                };
                parameters = {'url': '/json-remove', 'data': parameter};
                fnPostAjax(function(data, callFunctionParam){
                    parameter = {
                        'queryId': 'deleteEstimateMaster',
                        'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                        'EST_VER': $("#estimate_master_hidden_form #EST_VER").val()
                    };
                    parameters = {'url': '/json-remove', 'data': parameter};
                    fnPostAjax(function(data, callFunctionParam){
                        estimateMasterTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                            return (fnFormToJsonArrayData('#estimate_master_search_form'));
                        });
                        estimateMasterTopGrid.pqGrid('refreshDataAndView');
                    }, parameters, '');
                }, parameters, '');
            }, parameters, '');
        });

        $("#btnEstimateExcel").on('click', function(){
            $("#common_excel_form #sqlId").val('selectEstimateDetailListExcel:selectEstimateMasterInfoExcel');
            $("#common_excel_form #mapInputId").val('data:info');
            $("#common_excel_form #paramName").val('EST_SEQ');
            $("#common_excel_form #template").val('estimate_template');

            fnReportFormToHiddenFormPageAction("common_excel_form", "/downloadExcel");
        });

        $("#btnEstimateListDrawView").on('click', function(){
            callWindowImageViewer(999);
        });

        $("#btnEstimateCadPrint").on('click', function(){
            if(estimateTopSelectedRowIndex.length <= 0) {
                fnAlert(null, "대상을 선택해주세요");
                return false;
            }

            let selectOrderList = '';
            let message = '';
            let count = 0;
            if(estimateBotSelectedRowIndex.length > 0) {
                for(let i =0;i<estimateBotSelectedRowIndex.length;i++) {
                    const rowData = estimateMasterBotGrid.pqGrid('getRowData', {rowIndx: estimateBotSelectedRowIndex[i]});
                    if (fnIsEmpty(rowData.IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    }
                    selectOrderList += (String(rowData.EST_SEQ) + '-' + String(rowData.SEQ)) + '|';
                    count++;
                }
            }else if(estimateTopSelectedRowIndex.length > 0) {
                const gridData = estimateMasterBotGrid.pqGrid('option', 'dataModel.data');

                for(let i =0;i<gridData.length;i++) {
                    const rowData = gridData[i];
                    if (fnIsEmpty(rowData.IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    }
                    selectOrderList += (String(rowData.EST_SEQ) + '-' + String(rowData.SEQ)) + '|';
                    count++;
                }
            }

            message =
                '<h4>' +
                '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '   <span>' + count + ' 건의 견적도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '</h4>';
            fnConfirm(null, message, function () {
                printJS({printable: '/makeEstimateDrawingPrint', properties: {selectOrderList:selectOrderList, flag:'N', TYPE:'estimate'}, type: 'pdf', showModal: true});
            });
        });

        $("#btnEstimateListExcel").on('click', function(){
            $("#common_excel_form #sqlId").val('selectEstimateDetailListExcel');
            $("#common_excel_form #mapInputId").val('data');
            $("#common_excel_form #paramName").val('EST_SEQ');
            $("#common_excel_form #template").val('estimate_list_template');

            fnReportFormToHiddenFormPageAction("common_excel_form", "/downloadExcel");
        });

        $("#btnEstimateListNewEstimate").on('click', function(e){
            e.preventDefault();

            $("#estimate_version_up_sequence_form #hidden_est_seq").val('');

            if($("#tab_"+$("#estimateNo").val()).length == 0) {
                $("a[pid='" + $("#estimateNo").val() + "']").trigger("click");
            }else {
                $("#tab_"+$("#estimateNo").val()).trigger("click");
            }
            setTimeout(function(){
                $("#estimateRegisterReloadBtn").trigger('click');
            }, 500)
        });

        $("#btnEstimateListNewVersion").on('click', function(e){
            e.preventDefault();

            let parameters = {'url': '/json-list', 'data': {'queryId':'selectEstimateNextSequence'}};
            let EST_SEQ = "";
            let VERSION_UP_YN = $("#estimate_master_hidden_form #VERSION_UP_YN").val();
            if(VERSION_UP_YN == 'N') {
                fnAlert(null, "이미 등록되어있습니다.");
                return false;
            }

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
                        'N_EST_SEQ': $("#estimate_master_hidden_form #N_EST_SEQ").val()
                    };
                    parameters = {'url': '/json-create', 'data': parameter};
                    fnPostAjax(function(data, callFunctionParam){
                        parameter = {
                            'queryId': 'insertEstimateReceiverVersion',
                            'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val(),
                            'N_EST_SEQ': $("#estimate_master_hidden_form #N_EST_SEQ").val()
                        };
                        parameters = {'url': '/json-create', 'data': parameter};
                        fnPostAjaxAsync('',parameters, '');

                        if($("#tab_"+$("#estimateNo").val()).length == 0) {
                            $("a[pid='" + $("#estimateNo").val() + "']").trigger("click");
                        }else {
                            $("#tab_"+$("#estimateNo").val()).trigger("click");
                        }
                        setTimeout(function(){
                            $("#btnEstimateListSearch").trigger('click');
                            $("#estimateRegisterReloadBtn").trigger('click');
                        }, 300)
                    }, parameters, '');
                }, parameters, '');
            }, parameters, '');
        });

        $("#estimateListFileUpload").on('click', function(){
            let GfileKey = $("#common_file_download_form").find("#GFILE_SEQ").val();
            if(!GfileKey) {
                let parameter = {
                    'queryId': 'estimate.updateEstimateMasterGfileSeq',
                    'EST_SEQ': $("#estimate_master_hidden_form #EST_SEQ").val()
                };
                let parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjaxAsync('', parameters, '');
            }
            $("#btnEstimateListSearch").trigger('click');
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

        $("#estimateListFilterKeyword").on({
            'keyup': function () {
                fnFilterHandler(estimateMasterTopGrid, 'estimateListFilterKeyword', 'estimateListFilterCondition', 'estimateListFilterColumn');

                let data = estimateMasterTopGrid.pqGrid('option', 'dataModel.data');
                $('#estimate_master_top_grid_records').html(data.length);
            },
            'search': function () {
                fnFilterHandler(estimateMasterTopGrid, 'estimateListFilterKeyword', 'estimateListFilterCondition', 'estimateListFilterColumn');

                let data = estimateMasterTopGrid.pqGrid('option', 'dataModel.data');
                $('#estimate_master_top_grid_records').html(data.length);
            }
        });

        $("#estimateListFrozen").on('change', function(e){
            fnFrozenHandler(estimateMasterTopGrid, $(this).val());
        });

        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#estimate_master_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});

        /** topWrap Open/ Close 처리 **/
        $('.topWrap_btn').on('click' , function(){
            if($(this).hasClass('on')){
                topMenuClose();
                $(this).removeClass('on');
            }else{
                topMenuOpen();
                $(this).addClass('on');
            }
        });

    });

    /** 그리드 버튼 처리 **/
    $(document).on('click', '#estimateOrder', function(event){
        let seq = event.target.dataset.seq;
        let parameters = {'url': '/json-list', 'data': { 'queryId': 'selectEstimateOrderControlData', 'EST_SEQ': seq}};
        $("#estimate_master_top_grid").pqGrid('showLoading');
        fnPostAjax(function (data, callFunctionParam) {

            let parameters = {
                'url': '/registerEstimateOrder',
                'data': {data: JSON.stringify(data.list)}
            };

            fnPostAjax(function () {
                fnAlert(null,"<spring:message code='com.alert.default.save.success'/>");
                $("#btnEstimateListSearch").trigger('click');
                $("#estimate_master_top_grid").pqGrid('hideLoading');
            }, parameters, '');

        }, parameters, '');
    });

    let estimateRegisterTimer;
    const clickEstimateRegisterReloadBtn = function (seq) {
        let estimateRegisterCount = 0;
        estimateRegisterTimer = setInterval(function () {
            // console.log(estimateRegisterCount);
            if ($('#view_tab_10000102').length > 0 || estimateRegisterCount > 3) {
                $("#estimate_version_up_sequence_form #hidden_est_seq").val(seq);
                $("#estimateRegisterReloadBtn").trigger('click');
                clearInterval(estimateRegisterTimer);
            }
            // else {
            //     clickEstimateRegisterReloadBtn();
            // }
            estimateRegisterCount++;
        }, 500);
    };

    /** 화면 이동 처리 **/
    $(document).on('click', '#estimateRegisterPage', function (event) {
        event.preventDefault();

        let seq = event.target.dataset.seq;
        // let status = event.target.dataset.status;
        if($("#tab_"+$("#estimateNo").val()).length == 0) {
            $("a[pid='" + $("#estimateNo").val() + "']").trigger("click");
        }else {
            $("#tab_"+$("#estimateNo").val()).trigger("click");
        }
        clickEstimateRegisterReloadBtn(seq);
    });


    let role_seq = '${authUserInfo.ROLE_SEQ}';
    // topWrap 확장 함수
    function topMenuOpen(){
        var top = $('#view_tab_'+ role_seq +'0101 .gubunWrap');
        var bottom = $('#view_tab_'+ role_seq +'0101 .bottomWrap');
        var con = $('#view_tab_'+ role_seq +'0101 .bottomWrap .tableWrap .conWrap');

        top.stop().animate({height:'100px'},300, 'easeOutCubic');
        bottom.stop().animate({height:'766px'},300, 'easeOutCubic');
        con.css({height:'321px'});

        estimateMasterBotGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
    }

    // topWrap 축소 함수
    function topMenuClose(){
        var top = $('#view_tab_'+ role_seq +'0101 .gubunWrap');
        var bottom = $('#view_tab_'+ role_seq +'0101 .bottomWrap');
        var con = $('#view_tab_'+ role_seq +'0101 .bottomWrap .tableWrap .conWrap');

        top.stop().animate({height:'37px'},300, 'easeOutCubic');
        bottom.stop().animate({height:'829px'},300, 'easeOutCubic');
        con.css({height:'384px'});

        estimateMasterBotGrid.pqGrid('option', 'height', '100%').pqGrid('refresh');
    }

    function btnDisabled(status) {
        if(status == 'EST020'){
            $("#btnEstimateListDelete").attr('disabled', true);

        }else {
            $("#btnEstimateListDelete").attr('disabled', false);
        }
    }

    function estimateListFilterRender(ui) {
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
            if (indx >= 0 && txt) {
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

    $('#dateOneIpButton').on('click', function () {
        $('#dateOneIp').focus();
    });
    $('#dateTwoIpButton').on('click', function () {
        $('#dateTwoIp').focus();
    });
</script>