<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<div class="popup_container" id="item_order_register_popup" style="display: none;" data-backdrop="static">
    <div class="layerPopup" style="height: fit-content;">
        <h3>소재 주문</h3>
        <button type="button" class="pop_close mg-top10 mg-right8" data-dismiss="modal">닫기</button>
        <div class="t_area mg-top10">
            <div class="t_h">
                <span class="list_t" style="width: 192px;">소재주문번호</span>
                <span style="width: 203px;">
                    <input type="text" name="" id="item_order_register_material_order_num" value="" style="background: lightgrey;" readonly>
                    <input type="hidden" name="" id="item_order_register_material_order_num_temp" value="">
                </span>
                <div style="line-height: 45px; display: none; padding-right: 5px;" class="d-inline right_float" id="orderNotCompleteBtnBox">
                    <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterPopAdd">추가</button>
                    <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterPopSave">저장</button>
                    <button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterPopSubmit">제출</button>
                    <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterPopDelete">삭제</button>
                </div>
                <div style="line-height: 45px; display: none; padding-right: 5px;" class="d-inline right_float" id="orderCompleteBtnBox">
                    <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterPopPrint">Print</button>
                    <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterPopCancel">제출 취소</button>
                </div>
            </div>
        </div>
        <div class="h_area mg-bottom10">

        </div>
        <form class="form-inline" role="form" id="item_order_register_popup_form" name="item_order_register_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterPopList"/>
            <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
            <input type="hidden" id="MATERIAL_ORDER_NUM" name="MATERIAL_ORDER_NUM"/>
            <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
            <div class="tableWrap">
                <div id="item_order_register_popup_top_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="item_order_register_popup_top_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <br/>
            <div class="gridWrap popupTableDiv list1" style="overflow-x: auto;"></div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </form>
    </div>
</div>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_register_search_form" name="item_order_register_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectItemOrderRegisterList">
            <div class="none_gubunWrap row3_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label for="COMP_CD" class="label_100">사업자</label>
                            <select id="COMP_CD" name="COMP_CD" title="사업자" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="ORDER_COMP_CD" class="label_100">발주사</label>
                            <select id="ORDER_COMP_CD" name="ORDER_COMP_CD" title="발주사" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">도면번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="도면번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" class="wd_200" value="" title="품명"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterSearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="CONTROL_NUM">관리번호</label><input type="text" name="CONTROL_NUM" id="CONTROL_NUM" class="wd_200" value="" title="관리번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="MATERIAL_ORDER_NUM">소재주문번호</label><input type="text" name="MATERIAL_ORDER_NUM" id="MATERIAL_ORDER_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="M_COMP_CD">소재주문업체</label>
                            <select name="M_COMP_CD" id="M_COMP_CD" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value="">선택</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li class="">
                        <span class="slt_wrap trans_slt" style="width: 120px;">
                            <select name="ITEM_ORDER_REGISTER_CONDITION" id="ITEM_ORDER_REGISTER_CONDITION" style="width: inherit; text-align-last: center;">
                                <c:forEach var="code" items="${HighCode.H_1047}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <div class="calendar_wrap" style="width:542px; padding-left: 0">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_REGISTER_START_DATE" id="ITEM_ORDER_REGISTER_START_DATE"><button type="button">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" name="ITEM_ORDER_REGISTER_END_DATE" id="ITEM_ORDER_REGISTER_END_DATE" readonly><button type="button">달력선택</button>
                            </span>
                            <span class="chk_box" style="margin-left: 10px;"><input name="ITEM_ORDER_REGISTER_CHK_BOX" id="ITEM_ORDER_REGISTER_CHK_BOX" type="checkbox"><label for="ITEM_ORDER_REGISTER_CHK_BOX">선택</label></span>
                        </div>
                        <span class="gubun"></span>
                        <span>
                            <span class="ipu_wrap"><label class="label_100">Option</label></span>
                            <span class="chk_box"><input name="ORDER_WAIT_YN" id="ORDER_WAIT_YN" type="checkbox"><label for="ORDER_WAIT_YN"> 소재주문대기</label></span>
                            <span class="chk_box"><input name="ORDER_YN" id="ORDER_YN" type="checkbox"><label for="ORDER_YN"> 주문완료</label></span>
                            <span class="chk_box"><input name="IN_YN" id="IN_YN" type="checkbox"><label for="IN_YN"> 입고</label></span>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_60Wrap" id="dynamic_left_div"  style="width: 100%;">
                    <div class="buttonWrap">
                        <div class="d-inline">
                            <input type="text" id="itemOrderRegisterFilterKeyword" placeholder="Enter your keyword">
                            <select id="itemOrderRegisterFilterColumn"></select>
                            <select id="itemOrderRegisterFilterCondition">
                                <c:forEach var="code" items="${HighCode.H_1083}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>

                            <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterOrder">소재주문</button>
                            <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterCancel">주문취소</button>
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterCurrentStock">보유소재 전체현황</button>
                            <span class="chk_box"><input id="chkItemOrderRegisterAutoMatching" type="checkbox"/><label for="chkItemOrderRegisterAutoMatching">보유소재 자동매칭</label></span>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterDrawView">도면 보기</button>
                                <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterSave">저장</button>
                            </span>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_left_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_register_left_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
                <div class="right_30Wrap" id="dynamic_right_div" style="width: 0%; display: none">
                    <div class="buttonWrap">
                        <div class="d-inline">
                            <select id="itemOrderRegisterWarehouseSelectBox" name="itemOrderRegisterWarehouseSelectBox" title="창고">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1049}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <select id="itemOrderRegisterMaterialDetailSelectBox" name="itemOrderRegisterMaterialDetailSelectBox" title="소재종류">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <select id="itemOrderRegisterAreaSelectBox" name="itemOrderRegisterAreaSelectBox" title="넓이조건">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1050}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <select id="itemOrderRegisterTconditionSelectBox" name="itemOrderRegisterTconditionSelectBox" title="T 조건">
                                <option value="">All</option>
                                <c:forEach var="code" items="${HighCode.H_1050}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterOutSave">저장</button>
                            </span>
                        </div>
                    </div>
                    <div class="conMainWrap">
                        <div id="item_order_register_right_grid" class="jqx-refresh"></div>
                        <div class="right_sort">
                            전체 조회 건수 (Total : <span id="item_order_register_right_grid_records" style="color: #00b3ee">0</span>)
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form id="item_order_register_hidden_form" name="item_order_register_hidden_form">
    <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterDetail"/>
    <input type="hidden" id="AUTO_SEARCH" name="AUTO_SEARCH" value="N"/>
    <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ"/>
    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ"/>
    <input type="hidden" id="WAREHOUSE_CD" name="WAREHOUSE_CD"/>
    <input type="hidden" id="MATERIAL_DETAIL" name="MATERIAL_DETAIL"/>
    <input type="hidden" id="AREA" name="AREA"/>
    <input type="hidden" id="CONDITION" name="CONDITION"/>
</form>

<script type="text/javascript">
    let itemOrderRegisterSelectedRowIndex;
    let itemOrderRegisterLeftGrid = $("#item_order_register_left_grid");
    let itemOrderRegisterRightGrid = $("#item_order_register_right_grid");

    let itemOrderRegisterPopTopGrid = $("#item_order_register_popup #item_order_register_popup_top_grid");
    let itemOrderRegisterPopBotGrid = $("#item_order_register_popup #item_order_register_popup_bot_grid");

    $(function () {
        'use strict';
        let dateEditor = function (ui) {
            let $inp = ui.$cell.find("input"), $grid = $(this);
            $inp.datepicker({
                changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yy-mm-dd',
                onSelect: function () { this.firstOpen = true; },
                beforeShow: function (input, inst) {return !this.firstOpen; },
                onClose: function () { this.focus(); }
            });
        };

        let itemOrderRegisterLeftColModel= [
            {title: '가공 확정일시', dataType: 'date', dataIndx: 'STATUS_DT', width: 75, editable: false},
            {title: '소재주문<br>상태', dataType: 'string', dataIndx: 'M_STATUS_NM', width: 60, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 140, editable: false,
                render: function(ui){
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if(WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 25, width: 25, editable: false},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', minWidth: 50, width: 50, editable: false,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')}
            },
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', width: 50, editable: false},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 60, editable: false,
                editor: {
                    type: 'select',
                    mapIndices: { name: "ORDER_COMP_NM", id: "ORDER_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    //options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}}),
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ORDER_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 90, width: 90, editable: false } ,
            {title: '발주량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 50, width: 50, editable: false},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', minWidth: 60, width: 60, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', minWidth: 70, width: 70, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);},
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', minWidth: 90, width: 90, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 120,
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 50, width: 50, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 70, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}),
                },
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '요청 사항', align: "center", colModel: [
                    {title: '요청 사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, minWidth: 150,
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function(ui) {
                                $('.item_order_register_material_order_note').multiSelect();
                            },
                            getData: function(ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal= "", concatCd = "";

                                if(clave == null){
                                    return concatVal;
                                }

                                for(let iTmp=0; iTmp<clave.length; iTmp++){
                                    concatVal += ui.$cell.find("select option[value='"+clave[iTmp]+"']").text()+",";
                                    concatCd += clave[iTmp]+",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length-1);
                                return concatVal.substring(0, concatVal.length-1);
                            }
                        },
                        editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
                    },
                    {title: '비고', dataType: 'string', dataIndx: 'M_ORDER_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, minWidth: 120,
                        editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, minWidth: 120,
                editable: function (ui) {return itemOrderRegisterGridCellEditable(ui);}
            },
            {title: '보유소재 충당수량', align: "center", colModel: [
                    {title: '소재 Size', dataType: 'string', dataIndx: 'OUT_SIZE_TXT', editable: false},
                    {title: '수량', dataType: 'string', dataIndx: 'OUT_QTY', editable: false},
                    {title: '불출완료수량', dataType: 'string', dataIndx: 'COMPLETE_OUT_QTY', editable: false},
                    {title: '', dataType: 'string', dataIndx: '', editable: false,
                        render: function(ui){
                            let ORDER_STATUS = ui.rowData.M_STATUS == undefined ? '' : ui.rowData.M_STATUS;
                            let returnVal = '<button type="button" id="itemOrderRegisterOutReset" class="miniBtn gray">Reset</button>';
                            if(ORDER_STATUS == 'MST002' || ORDER_STATUS == 'MST004') {
                                returnVal = '';
                            }
                            return returnVal;
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find("#itemOrderRegisterOutReset").bind("click", function () {
                                let parameter = {
                                    'queryId': 'deleteItemOrderRegisterOut',
                                    'MY_MAT_OUT_SEQ': ui.rowData.MY_MAT_OUT_SEQ
                                };

                                let parameters = {'url': '/json-remove', 'data': parameter};
                                fnPostAjax(function(data, callFunctionParam){
                                    itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                        return (fnFormToJsonArrayData('#item_order_register_search_form'));
                                    });
                                    itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');

                                    itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                                        return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
                                    });
                                    itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');

                                }, parameters, '');
                            });
                        }
                    },
                    {title: '불출', dataType: 'string', dataIndx: 'OUT_YN', editable: false,
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                ]
            },
            {title: '소재 주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, editable: false,
                render: function (ui) {
                    let cls = null;
                    if (ui.cellData) cls = 'underlinePoint';
                    return {cls: cls, text: itemOrderRegisterFilterRender(ui)};
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    if($cell.hasClass("underlinePoint")){
                        $cell.bind("click", function () {
                            itemOrder();
                        });
                    }
                }
            },
            {title: '주문<br>요청 일시', dataType: 'date', dataIndx: 'M_ORDER_DT',  width: 120, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            /*{title: '주문 발주 상태', align: "center", colModel: [
                    {title: '상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', width: 70, editable: false},
                    {title: '확정/취소 일시', dataType: 'date', dataIndx: 'STATUS_DT', width: 120, editable: false}
                ]},
            {title: '도면Rev.', dataType: 'string', dataIndx: 'DRAWING_VER ', editable: false},
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
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
            }*/
        ];

        let itemOrderRegisterRightColModel= [
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM' , editable: false, minWidth: 80} ,
            {title: '상세위치', dataType: 'string', dataIndx: 'LOC_NM', minWidth: 80},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , editable: false, minWidth: 80} ,
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' , editable: false, minWidth: 50} ,
            {title: 'Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT' , editable: false, minWidth: 100} ,
            {title: '재고', dataType: 'integer', dataIndx: 'STOCK_QTY' , editable: false, minWidth: 40} ,
            {title: '요청', dataType: 'integer', dataIndx: 'OUT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'} , minWidth: 40} ,
            {title: 'MY_MAT_STOCK_SEQ', dataType: 'string', dataIndx: 'MY_MAT_STOCK_SEQ', hidden: true } ,
            {title: 'MY_MAT_OUT_SEQ', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', hidden: true } ,
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true } ,
            {title: 'MATERIAL_ORDER_SEQ', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true } ,
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true }
        ];

        let itemOrderRegisterPopTopColModel= [
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 80, editable: false},
            {title: '발주량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, width: 80, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 35, width: 35, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 95, validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: { type: 'select', valueIndx: "value", labelIndx: "text", options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}), },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '보유소재 충당수량', align: "center", colModel: [
                    {   title: '요청사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 150,
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_pop_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                $('.item_order_register_pop_material_order_note').multiSelect();
                            },
                            getData: function (ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal = "", concatCd = "";

                                if (clave == null) {
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length - 1);
                                return concatVal.substring(0, concatVal.length - 1);
                            }
                        }
                    },
                    {   title: '비고사항',
                        dataType: 'string',
                        dataIndx: 'M_ORDER_NOTE',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                        minWidth: 120
                    },
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false, styleHead: {'font-weight': 'bold','color': 'red'},
                render: function(ui){
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if(WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, editable: false, styleHead: {'font-weight': 'bold','color': 'red'} },
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '', dataType: 'string', dataIndx: '', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    let ORDER_STATUS = ui.rowData.ORDER_STATUS;
                    if(ORDER_STATUS == 'MST002' || ORDER_STATUS == 'MST004') return '';
                    else return '<span id="deleteItem" class="circleMinusIcon" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    let rowIndex = ui.rowIndx;
                    $cell.find("#deleteItem").bind("click", function () {
                        let rowData = ui.rowData;
                        let parameters = {
                            'url': '/json-list',
                            'data': {
                                'queryId': 'deleteItemOrderRegisterCancelOrderManual',
                                'MATERIAL_ORDER_SEQ': rowData.MATERIAL_ORDER_SEQ
                            }
                        };
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            parameters = {'url': '/json-remove', 'data': {'queryId': 'deleteItemOrderRegisterCancelOrder'}};
                            fnPostAjax(function(data, callFunctionParam){
                                alert("삭제 되었습니다.");
                                itemOrderRegisterPopTopGrid.pqGrid('deleteRow', { rowIndx: rowIndex });
                                let rowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
                                if(rowCount == 0) $("#item_order_register_popup").modal('hide');

                                makeInnerTable();
                            }, parameters, '');
                        }, parameters, '');
                    });
                }
            },
            /*{title: '납기', dataType: 'string', dataIndx: 'HOPE_DUE_DT', width: 150,
                editable: true, editor: { type: 'textbox', init: dateEditor }, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },*/
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true}
        ];

        let itemOrderRegisterPopTopColModel_enabled= [
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 80, editable: false},
            {title: '발주량', dataType: 'string', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , editable: false,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , editable: false,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1027') },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', editable: false, width: 80 },
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY', minWidth: 35, width: 35, editable: false },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 95, editable: false,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}}),
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '보유소재 충당수량', align: "center", colModel: [
                    {   title: '요청사항', dataType: 'string', dataIndx: 'REQUEST_NOTE', minWidth: 150, width: 150, editable: false,
                        editor: {
                            type: 'select',
                            cls: 'item_order_register_pop_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            attr: 'multiple',
                            init: function (ui) {
                                $('.item_order_register_pop_material_order_note').multiSelect();
                            },
                            getData: function (ui) {
                                let clave = ui.$cell.find("select").val();
                                let concatVal = "", concatCd = "";

                                if (clave == null) {
                                    return concatVal;
                                }

                                for (let iTmp = 0; iTmp < clave.length; iTmp++) {
                                    concatVal += ui.$cell.find("select option[value='" + clave[iTmp] + "']").text() + ",";
                                    concatCd += clave[iTmp] + ",";
                                }
                                let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                                rowData["REQUEST_NOTE"] = concatCd.substring(0, concatCd.length - 1);
                                return concatVal.substring(0, concatVal.length - 1);
                            }
                        }
                    },
                    {title: '비고사항', dataType: 'string', dataIndx: 'M_ORDER_NOTE', minWidth: 120, width: 120, editable: false}
                ]
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false,
                render: function(ui){
                    let WORK_TYPE = ui.rowData.WORK_TYPE == undefined ? '' : ui.rowData.WORK_TYPE;
                    let returnVal = ui.cellData;
                    if(WORK_TYPE == 'WTP020') {
                        returnVal = '';
                    }
                    return returnVal;
                }
            },
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 30, width: 30, editable: false, styleHead: {'font-weight': 'bold','color': 'red'}},
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '', dataType: 'string', dataIndx: '', minWidth: 25, width: 25, editable: false,
                render: function (ui) { return ''; }
            },
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true}
        ];

        itemOrderRegisterLeftGrid.pqGrid({
            height: '100%',
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'CONTROL_DETAIL_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#item_order_register_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            postRenderInterval: -1,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center', render: itemOrderRegisterFilterRender}, filterModel: { mode: 'OR' },
            scrollModel: {autoFit: false},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: itemOrderRegisterLeftColModel,
            showTitle: false,
            title: false,
            strNoRows: g_noData,
            editModel: {clicksToEdit: 1},
            load: function( event, ui ) {
                var opts = '<option value=\"\">All Fields</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        opts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                    }
                });
                $("#itemOrderRegisterFilterColumn").empty();
                $("#itemOrderRegisterFilterColumn").html(opts);
            },
            complete: function(event, ui) {
                //this.flex();
                let data = itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.data');

                $('#item_order_register_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    itemOrderRegisterSelectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) itemOrderRegisterSelectedRowIndex[0] = firstRow;
                    else for (let i = firstRow; i <= lastRow; i++) itemOrderRegisterSelectedRowIndex.push(i);
                }
            },
            cellClick: function( event, ui) {
                itemOrderRegisterSelectedRowIndex = [];
                itemOrderRegisterSelectedRowIndex.push(ui.rowIndx);
                let MATERIAL_ORDER_SEQ = ui.rowData.MATERIAL_ORDER_SEQ == undefined ? '' : ui.rowData.MATERIAL_ORDER_SEQ;
                let ORDER_STATUS = ui.rowData.M_STATUS == undefined ? '' : ui.rowData.M_STATUS;

                // 소재 입고 상태
                if(ORDER_STATUS == 'MST002' || ORDER_STATUS == 'MST004') {
                    $("#btnItemOrderRegisterOutSave").attr('disabled', true);
                }else{
                    if(MATERIAL_ORDER_SEQ == '') {
                        $("#btnItemOrderRegisterOutSave").attr('disabled', true);
                    } else {
                        $("#btnItemOrderRegisterOutSave").attr('disabled', false);
                    }
                }

                $("#item_order_register_hidden_form #MATERIAL_ORDER_SEQ").val(MATERIAL_ORDER_SEQ);
                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.rowData.CONTROL_DETAIL_SEQ);

                let hiddenYn = $("#item_order_register_hidden_form #AUTO_SEARCH").val();
                if(hiddenYn == 'Y') {
                    $("#itemOrderRegisterMaterialDetailSelectBox").val(ui.rowData.MATERIAL_DETAIL);
                    $("#item_order_register_hidden_form #MATERIAL_DETAIL").val(ui.rowData.MATERIAL_DETAIL);
                    itemOrderRegisterRightGrid.pqGrid( "destroy" );
                    selectItemOrderRegisterRightList();
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    itemOrderRegisterLeftGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        });

        selectItemOrderRegisterRightList();

        function selectItemOrderRegisterRightList() {
            itemOrderRegisterRightGrid.pqGrid({
                height: '100%',
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'MY_MAT_STOCK_SEQ',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('#item_order_register_hidden_form'),
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                trackModel: {on: true},
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                colModel: itemOrderRegisterRightColModel,
                showTitle: false,
                title: false,
                strNoRows: g_noData,
                complete: function(event, ui) {
                    //this.flex();
                    let data = itemOrderRegisterRightGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_register_right_grid_records').html(data.length);
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        itemOrderRegisterRightGrid.pqGrid('updateRow', {
                            rowIndx: ui.rowIndx,
                            row: {[ui.dataIndx]: ui.oldVal}
                        });
                    }
                },
                change: function (evt, ui) {
                    let MATERIAL_ORDER_SEQ = $("#item_order_register_hidden_form #MATERIAL_ORDER_SEQ").val();
                    let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
                    let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
                    if( (CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !='') || MATERIAL_ORDER_SEQ != '' ) {
                        itemOrderRegisterRightGrid.pqGrid("updateRow", {'rowIndx': ui.updateList[0].rowIndx,
                            row: {'CONTROL_SEQ': CONTROL_SEQ, 'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ, 'MATERIAL_ORDER_SEQ': MATERIAL_ORDER_SEQ} });
                    }
                }
            });
        };

        let itemOrderRegisterGridCellEditable = function(ui){
            let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let M_STATUS = rowData.M_STATUS;
            if(M_STATUS == 'MST002') {
                return false;
            }else{
                return true;
            }
        }

        $('#item_order_register_popup').on('hide.bs.modal', function() {
            if(itemOrderRegisterPopTopGrid.hasClass('pq-grid')){
                itemOrderRegisterPopTopGrid.pqGrid( "destroy" );
            }
            if(itemOrderRegisterPopBotGrid.hasClass('pq-grid')){
                itemOrderRegisterPopBotGrid.pqGrid( "destroy" );
            }

            $("#item_order_register_material_order_num").val('');
            $("#item_order_register_material_order_num_temp").val('');

            $(".popupTableDiv").html('');

            $("#btnItemOrderRegisterSearch").trigger('click');
        });

        $('#item_order_register_popup').on('show.bs.modal',function() {
            itemOrderRegisterPopTopGrid.pqGrid({
                width: "100%", height: 500,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('item_order_register_popup_form'),
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'cell', mode: 'multiple'} ,
                swipeModel: {on: false},
                collapsible: false,
                postRenderInterval: -1,
                resizable: false,
                trackModel: {on: true},
                colModel: itemOrderRegisterPopTopColModel,
                showTitle: false,
                title: false,
                editModel: {clicksToEdit: 1},
                complete: function (event, ui) {
                    //this.flex();
                    let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
                    $('#item_order_register_popup_top_grid_records').html(data.length);

                    let MATERIAL_ORDER_NUM = data[0].MATERIAL_ORDER_NUM === undefined ? "" : data[0].MATERIAL_ORDER_NUM;
                    setTimeout(function(){
                        let parameters = {'url': '/json-list', 'data': {'queryId': 'selectItemOrderRegisterNextMaterialOrderNum'}};
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            let list = data.list[0];
                            if(MATERIAL_ORDER_NUM == '' || MATERIAL_ORDER_NUM == undefined){
                                MATERIAL_ORDER_NUM = list.MATERIAL_ORDER_NUM
                                $("#item_order_register_material_order_num_temp").val(MATERIAL_ORDER_NUM);
                            }else{
                                $("#item_order_register_material_order_num_temp").val(MATERIAL_ORDER_NUM);
                                $("#item_order_register_material_order_num").val(MATERIAL_ORDER_NUM);
                            };

                            makeInnerTable();
                        }, parameters, '');
                    }, 900);

                    btnDisabled();
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        itemOrderRegisterPopTopGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                    }
                },
                change: function(evt, ui) {
                    $("#btnItemOrderRegisterPopSubmit").attr("disabled", true);
                },
            });
        });

        /** 버튼 처리 **/
        $("#btnItemOrderRegisterSearch").on('click', function(){
            itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_search_form'));
            });
            itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
        });

        $("#btnItemOrderRegisterOrder").on('click', function(){
            itemOrder();
        });

        $("#btnItemOrderRegisterCancel").on('click', function(){
            orderCancel('grid');
        });

        $("#btnItemOrderRegisterCurrentStock").on('click', function(){
            let role_seq = '${authUserInfo.ROLE_SEQ}';
            $("a[pid='"+ $("#stockNo").val() +"']").trigger("click");
        });

        $("#chkItemOrderRegisterAutoMatching").on('change', function(evt){
            let hiddenYn = evt.target.checked == true ? 'Y' : 'N';
            $("#item_order_register_hidden_form #AUTO_SEARCH").val(hiddenYn);

            if(hiddenYn == 'Y') {
                divClose();
            }else {
                divOpen();
            }
        });

        $("#btnItemOrderRegisterDrawView").on('click', function(){

        });

        $("#btnItemOrderRegisterSave").on('click', function(){
            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegister'];
            fnModifyPQGrid(itemOrderRegisterLeftGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);
        });

        $("#btnItemOrderRegisterOutSave").on('click', function(){
            let MATERIAL_ORDER_SEQ = $("#item_order_register_hidden_form #MATERIAL_ORDER_SEQ").val();
            let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
            let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
            if( (CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !='') || MATERIAL_ORDER_SEQ != '' ){
                let itemOrderRegisterOutInsertUpdateQueryList = ['insertItemOrderRegisterOut'];
                fnModifyPQGrid(itemOrderRegisterRightGrid, itemOrderRegisterOutInsertUpdateQueryList, itemOrderRegisterOutInsertUpdateQueryList);

                setTimeout(function(){
                    $("#btnItemOrderRegisterSearch").trigger('click');
                }, 1500);

            }else{
                alert("You must be select item.");
                return;
            }

        });

        /**
         * fnFilterHandler
         * @Parameter
         * */
        $("#itemOrderRegisterFilterKeyword").on("keyup", function(e){
            fnFilterHandler(itemOrderRegisterLeftGrid, 'itemOrderRegisterFilterKeyword', 'itemOrderRegisterFilterCondition', 'itemOrderRegisterFilterColumn');
        });

        $("#itemOrderRegisterFilterCondition").on('change', function(e){
            fnFilterHandler(itemOrderRegisterLeftGrid, 'itemOrderRegisterFilterKeyword', 'itemOrderRegisterFilterCondition', 'itemOrderRegisterFilterColumn');
        });

        $("#itemOrderRegisterWarehouseSelectBox").on('change', function(){
            let text = $(this).val();
            $("#item_order_register_hidden_form #WAREHOUSE_CD").val(text);

            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $("#itemOrderRegisterMaterialDetailSelectBox").on('change', function(){
            let text = $(this).val();
            $("#item_order_register_hidden_form #MATERIAL_DETAIL").val(text);

            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $("#itemOrderRegisterAreaSelectBox").on('change', function(){
            let text = $(this).val();
            $("#item_order_register_hidden_form #AREA").val(text);

            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        $("#itemOrderRegisterTconditionSelectBox").on('change', function(){
            let text = $(this).val();
            $("#item_order_register_hidden_form #CONDITION").val(text);

            itemOrderRegisterRightGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_hidden_form'));
            });
            itemOrderRegisterRightGrid.pqGrid('refreshDataAndView');
        });

        /** 팝업 버튼 처리 **/
        $("#btnItemOrderRegisterPopAdd").on('click', function(){
            let date = new Date();
            let rowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
            date = date.getFullYear() +"-"+ ("0"+(date.getMonth()+1)).slice(-2) +"-"+ ("0"+(date.getDate()+1)).slice(-2);
            itemOrderRegisterPopTopGrid.pqGrid('addNodes', [{ "HOPE_DUE_DT": date}], rowCount+1);

            $("#btnItemOrderRegisterPopSubmit").attr("disabled", true);
        });

        $("#btnItemOrderRegisterPopSave").on('click', function(){
            $("#item_order_register_popup_form #queryId").val("selectItemOrderRegisterPopListNum");

            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num_temp").val();
            let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            for(let tempI=0; tempI<totalRecords; tempI++){
                itemOrderRegisterPopTopGrid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM } });
            }
            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegisterPopSave'];

            let gridInstance = itemOrderRegisterPopTopGrid.pqGrid('getInstance').grid;
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let QUERY_ID_ARRAY = {
                    'insertQueryId': itemOrderRegisterInsertUpdateQueryList,
                    'updateQueryId': itemOrderRegisterInsertUpdateQueryList,
                };
                changes.queryIdList = QUERY_ID_ARRAY;
                let parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    $("#item_order_register_material_order_num").val(MATERIAL_ORDER_NUM);
                    $("#item_order_register_popup_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
                    itemOrderRegisterPopTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                        return (fnFormToJsonArrayData('#item_order_register_popup_form'));
                    });
                    itemOrderRegisterPopTopGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }

            setTimeout(function(){
                btnDisabled();
                //Popup table 생성
                makeInnerTable();
            }, 900)
        });

        $("#btnItemOrderRegisterPopSubmit").on('click', function(){
            //메일 여부
            itemOrderRegisterPopMail();
        });

        $("#btnItemOrderRegisterPopDelete").on('click', function() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            //Confirm Box
            let headHtml = "Information", bodyHtml = "", yseBtn = "예", noBtn = "아니오";
            bodyHtml =
                '<h4>\n' +
                '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                '<span>주문서를 삭제하시겠습니까?</span>' +
                '</h4>';

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let itemOrderRegisterPopDeleteConfirm = function (callback) {
                commonConfirmPopup.show();
                commonConfirmPopup.css("z-index", 99999999);
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            itemOrderRegisterPopDeleteConfirm(function (confirm) {
                if (confirm) {
                    let parameter = {
                        'queryId': 'deleteItemOrderRegisterDeleteOrderManual',
                        'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                    };
                    let parameters = {'url': '/json-remove', 'data': parameter};
                    fnPostAjax(function(data, callFunctionParam){

                        parameters = {'url': '/json-remove', 'data': {'queryId': 'deleteItemOrderRegisterCancelOrder'}};
                        fnPostAjax(function(data, callFunctionParam){
                            alert("취소 완료되었습니다.");
                            if($("#item_order_register_popup").hasClass("in")){
                                $("#item_order_register_popup").modal('hide');
                            }
                        }, parameters, '');
                    }, parameters, '');
                }
            });
        });

        $("#btnItemOrderRegisterPopPrint").on('click', function(){
            itemOrderRegisterPopOrderSheet('N');
        });

        $("#btnItemOrderRegisterPopCancel").on('click', function(){
            orderCancel('pop');
        });

        function itemOrder() {
            let rowDataArray = "";
            let selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
            let orderList = [];
            let MATERIAL_ORDER_NUM = "";
            for (let i = 0; i < selectedRowCount; i++) {
                let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                rowDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";

                MATERIAL_ORDER_NUM = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).MATERIAL_ORDER_NUM;
                orderList.push(MATERIAL_ORDER_NUM);

            }
            let CONCAT_SEQ = rowDataArray.substr(0 , rowDataArray.length-1);

            // 중복제거
            orderList = [...new Set(orderList)];

            if (orderList.length > 1) {
                alert('주문번호를 확인 해 주세요.');
                return false;
            }

            if(MATERIAL_ORDER_NUM == '' || MATERIAL_ORDER_NUM == undefined) {
                $("#item_order_register_popup_form #queryId").val("selectItemOrderRegisterPopListSeq");
                $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
                $("#item_order_register_popup_form #MATERIAL_ORDER_NUM").val("");
            }else{
                $("#item_order_register_popup_form #queryId").val("selectItemOrderRegisterPopListNum");
                $("#item_order_register_popup_form #CONCAT_SEQ").val("");
                $("#item_order_register_popup_form #MATERIAL_ORDER_NUM").val(MATERIAL_ORDER_NUM);
            }
            $("#item_order_register_popup").modal('toggle');
        }

        function orderCancel(type) {
            let concatSeqDataArray = "";
            let orderSeqDataArray = "";
            let selectedRowCount = "";
            let availableCancel = true;
            let includeOrder = true;

            if(type == "pop") {
                selectedRowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
                for (let i = 0; i < selectedRowCount; i++) {
                    let CONTROL_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).CONTROL_SEQ;
                    let CONTROL_DETAIL_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).CONTROL_DETAIL_SEQ;
                    let MATERIAL_ORDER_SEQ = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).MATERIAL_ORDER_SEQ;
                    let ORDER_STATUS = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i}).M_STATUS;
                    CONTROL_SEQ = CONTROL_SEQ === undefined ? "0" : CONTROL_SEQ;
                    CONTROL_DETAIL_SEQ = CONTROL_DETAIL_SEQ === undefined ? "0" : CONTROL_DETAIL_SEQ;

                    concatSeqDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
                    orderSeqDataArray += "'"+MATERIAL_ORDER_SEQ+"',";

                    // 소재 입고 상태
                    if(ORDER_STATUS == 'MST003' || ORDER_STATUS == 'MST004') {
                        availableCancel = false;
                        continue;
                    }

                    // 소재 주문 상태
                    if(ORDER_STATUS == 'MST002') {
                        includeOrder = false;
                        continue;
                    }
                }

            } else if('grid') {
                selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
                for (let i = 0; i < selectedRowCount; i++) {
                    let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                    let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                    let MATERIAL_ORDER_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).MATERIAL_ORDER_SEQ;
                    let ORDER_STATUS = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).M_STATUS;
                    CONTROL_SEQ = CONTROL_SEQ === undefined ? "0" : CONTROL_SEQ;
                    CONTROL_DETAIL_SEQ = CONTROL_DETAIL_SEQ === undefined ? "0" : CONTROL_DETAIL_SEQ;

                    concatSeqDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
                    orderSeqDataArray += "'"+MATERIAL_ORDER_SEQ+"',";

                    // 소재 입고 상태
                    if(ORDER_STATUS == 'MST003' || ORDER_STATUS == 'MST004') {
                        availableCancel = false;
                        continue;
                    }

                    // 소재 주문 상태
                    if(ORDER_STATUS == 'MST002') {
                        includeOrder = false;
                        continue;
                    }
                }
            }

            if( !availableCancel ) {
                alert("소재주문상태를 확인 해 주세요.");
                return false;
            }

            let headHtml = "Information", bodyHtml ="", yseBtn="예", noBtn="아니오";
            if(!includeOrder){
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>이미 주문서가 발송된 대상도 포함되어 있습니다.</span><br>' +
                    '<span style="position: relative; left: 41px"> 업체에 반드시 확인바랍니다.<br><br> 취소를 진행하시겠습니까?</span>' +
                    '</h4>';
            }else{
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>주문을 취소하시겠습니까?</span>' +
                    '</h4>';
            }

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let itemOrderRegisterPopSubmitConfirm = function(callback) {
                commonConfirmPopup.show();
                commonConfirmPopup.css("z-index", 99999999);
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm) {
                if (confirm) {
                    let CONCAT_SEQ = concatSeqDataArray.substr(0 , concatSeqDataArray.length-1);
                    let ORDER_SEQ = orderSeqDataArray.substr(0 , orderSeqDataArray.length-1);

                    $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
                    $("#item_order_register_popup_form #MATERIAL_ORDER_SEQ").val(ORDER_SEQ);

                    let parameter = {
                        'queryId': 'insertItemOrderRegisterMasterOrderHistory',
                        'MATERIAL_ORDER_SEQ': ORDER_SEQ,
                    };
                    let parameters = {'url': '/json-create', 'data': parameter};
                    fnPostAjax(function(data, callFunctionParam){
                        parameter = {
                            'queryId': 'updateItemOrderRegisterMaterialOrderCancel',
                            'MATERIAL_ORDER_SEQ': ORDER_SEQ,
                        };
                        parameters = {'url': '/json-remove', 'data': parameter};
                        fnPostAjax(function(data, callFunctionParam){
                            parameter = {
                                'queryId': 'updateItemOrderRegisterControlPartCancel',
                                'CONCAT_SEQ': CONCAT_SEQ,
                            };
                            parameters = {'url': '/json-remove', 'data': parameter};
                            fnPostAjax(function(data, callFunctionParam){
                                parameters = {'url': '/json-remove', 'data': {'queryId': 'deleteItemOrderRegisterCancelOrder'}};
                                fnPostAjax(function(data, callFunctionParam){
                                    alert("취소 완료되었습니다.");
                                    $("#item_order_register_popup").modal('hide');
                                }, parameters, '');
                            }, parameters, '');
                        }, parameters, '');
                    }, parameters, '');
                }
            });
        }

        function makeMailInnerTable(list) {
            var ref_key="";
            var table="";

            var font_header =" background:lightgray; font-weight:600;";
            var st_center="border:1px solid #d0d0d0; text-align:center; padding:0px 15px 0px 15px;";

            table += "<table style='border-spacing:0; min-width:50%;'><tr>";
            table += "<td style='"+ st_center + font_header +"'>발주업체</td>";
            table += "<td style='"+ st_center + font_header +"'>공급업체</td>";
            table += "<td style='"+ st_center + font_header +"'>형태</td>";
            table += "<td style='"+ st_center + font_header +"'>상세종류</td>";
            table += "<td style='"+ st_center + font_header +"'>소재Size</td>";
            table += "<td style='"+ st_center + font_header +"'>주문</td>";
            table += "<td style='"+ st_center + font_header +"'>비고</td>";
            table += "<td style='"+ st_center + font_header +"'>납기</td>" + "</tr>";

            for(var i=0; i<list.length; i++)
            {
                var material_order_seq = list[i].MATERIAL_ORDER_SEQ;

                table += "<tr>";
                table += "<td style='"+ st_center	+"'>"	+ list[i].MATERIAL_COMP_NM +"</td>";
                table += "<td style='"+ st_center 	+"'>"	+ list[i].COMP_NM+"</td>";
                table += "<td style='"+ st_center 	+"'>"	+ list[i].MATERIAL_KIND_NM+"</td>";
                table += "<td style='"+ st_center	+"'>"	+ list[i].MATERIAL_DETAIL_NM+"</td>";
                table += "<td style='"+ st_center 	+"'>"	+ list[i].SIZE_TXT+"</td>";
                table += "<td style='"+ st_center 	+"'>"	+ list[i].ORDER_QTY +"</td>";
                table += "<td style='"+ st_center 	+"'>"	+ list[i].ORDER_NOTE +"</td>";
                table += "<td style='"+ st_center	+"'>" 	+ list[i].ORDER_DT +"</td>";
                table += "</tr>";

                ref_key += "'"+material_order_seq+"',";

            }

            table += "</table>";
            return table;
        }

        function makeInnerTable() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            let table="";
            var row_span1 ="rowspan='1'";
            var row_span2 ="rowspan='2'";

            let parameter = {
                'queryId': 'selectItemOrderRegisterPopTable',
                'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
            };
            let parameters = {'url': '/json-list', 'data': parameter};
            fnPostAjaxAsync(function (data, callFunctionParam) {
                let list = data.list;
                if(list.length > 0 ){
                    table += "<table class='rowStyle' style='border-spacing:0; width:100%;'><tr>";
                    table += "<th>업체</th>";
                    for(var i=0; i<list.length; i++) {
                        if(list[i].MATERIAL_COMP_CD == 'CMP0076'){
                            table += "<th "+row_span2+">"	+ list[i].MATERIAL_COMP_NM +"</th>";
                        }else{
                            table += "<th>"	+ list[i].MATERIAL_COMP_NM +"</th>";
                        }
                    }
                    table += "</tr>";
                    table += "<tr>";
                    table += "<th>담당자</th>";
                    for(var j=0; j<list.length; j++) {
                        if(list[j].MATERIAL_COMP_CD == 'CMP0076'){
                            table += "";
                        }else{
                            table += "<th>"	+ list[j].MATERIAL_COMP_EMAIL +"</th>";
                        }
                    }
                    table += "</tr>";
                    table += "<tr>";
                    table += "<td>내용</td>";
                    for(var h=0; h<list.length; h++){
                        table += "<td>" 	+ list[h].CONTENTS +"</td>";
                    }
                    table += "</tr></table>";
                }else{
                    table = "<table class='rowStyle' style='border-spacing:0; width:100%;'>";
                    table += "<tr><th>업체</th>";
                    table += "<th></th><th></th><th></th></tr>";
                    table += "<tr><th>담당자</th>";
                    table += "<th></th><th></th><th></th></tr>";
                    table += "<tr><td>내용</td>";
                    table += "<td></td><td></td>";
                    table += "<td></td></tr>";
                    table += "</table>";
                }

                $(".popupTableDiv").html(table);
            }, parameters, '');
        }

        function itemOrderRegisterPopMail() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            //Confirm Box
            let headHtml = "Information", bodyHtml ="", yseBtn="예", noBtn="아니오";
            bodyHtml =
                '<h4>\n' +
                '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                '<span>주문서를 발송하시겠습니까?</span>' +
                '</h4>';

            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let itemOrderRegisterPopSubmitConfirm = function(callback) {
                commonConfirmPopup.show();
                commonConfirmPopup.css("z-index", 99999999);
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm){
                if(confirm) {
                    let list = new Array() ;
                    let rowCount = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data').length;
                    for (let i = 0; i < rowCount; i++) {
                        let rowData = itemOrderRegisterPopTopGrid.pqGrid('getRowData', {rowIndx: i});
                        list.push(rowData);
                    }

                    let changes = {
                        'addList': list,
                        'updateList': list
                    };
                    let QUERY_ID_ARRAY = {
                        'insertQueryId': ['material.insertUpdateItemOrderRegisterPopStatus','material.insertItemOrderRegisterControlPartProgress'],
                        'updateQueryId': ['material.updateItemOrderRegisterPartStatus','material.insertItemOrderRegisterControlPartProgress'],
                    };
                    changes.queryIdList = QUERY_ID_ARRAY;
                    let parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
                    fnPostAjax(function (data, callFunctionParam) {
                        let parameter = {
                            'queryId': 'selectItemOrderRegisterPopMailTable',
                            'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
                        };
                        let parameters = {'url': '/json-list', 'data': parameter};
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            let list = data.list;
                            let compareCd = list[0].MATERIAL_COMP_CD;
                            let compCd = "";
                            let tableList = [];
                            let innerTable = "";

                            for(var i=0; i<list.length; i++) {
                                compCd = list[i].MATERIAL_COMP_CD;
                                if(compareCd != compCd) {
                                    innerTable = makeMailInnerTable(tableList);
                                    let parameter = {
                                        'queryId': 'insertItemOrderRegisterPopSubmitMail',
                                        'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                        'MATERIAL_COMP_CD': compareCd,
                                        'INNER_TABLE': innerTable
                                    };
                                    let parameters = {'url': '/json-create', 'data': parameter};

                                    tableList = [];
                                    fnPostAjaxAsync(function (data, callFunctionParam) {
                                    }, parameters, '');

                                    compareCd = compCd;
                                }
                                tableList.push(list[i]);
                            }

                            innerTable = makeMailInnerTable(tableList);
                            let parameter = {
                                'queryId': 'insertItemOrderRegisterPopSubmitMail',
                                'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                'MATERIAL_COMP_CD': compareCd,
                                'INNER_TABLE': innerTable
                            };
                            let parameters = {'url': '/json-create', 'data': parameter};
                            fnPostAjaxAsync(function (data, callFunctionParam) {
                                let parameter = {
                                    'queryId': 'updateItemOrderRegisterOrderStatus',
                                    'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM,
                                };
                                let parameters = {'url': '/json-update', 'data': parameter};
                                fnPostAjaxAsync(function (data, callFunctionParam) {
                                    itemOrderRegisterPopOrderSheet('Y');
                                }, parameters, '');
                            }, parameters, '');
                        }, parameters, '');
                    }, parameters, '');
                }
            });
        }

        function itemOrderRegisterPopOrderSheet(mailYn) {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            //Confirm Box
            let headHtml = "Information", bodyHtml ="", yseBtn="예", noBtn="아니오";

            if(mailYn == 'Y') {
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>성공적으로 발송되었습니다. 주문서를 출력하시겠습니까?</span>' +
                    '</h4>';
            } else {
                bodyHtml =
                    '<h4>\n' +
                    '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                    '<span>주문서를 출력하시겠습니까?</span>' +
                    '</h4>';
            }


            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let itemOrderRegisterPopSubmitConfirm = function(callback) {
                commonConfirmPopup.show();
                $("#commonConfirmYesBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    callback(true);
                    return;
                });
                $(".commonConfirmCloseBtn").unbind().click(function (e) {
                    e.stopPropagation();
                    commonConfirmPopup.hide();
                    $("#item_order_register_popup").modal('toggle');
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm){
                if(confirm) {
                    printJS({printable:'/makeItemOrderSheetPrint?MATERIAL_ORDER_NUM='+encodeURI(MATERIAL_ORDER_NUM), type:'pdf', showModal:true});

                    itemOrderRegisterPopTopGrid.pqGrid('option', "dataModel.postData", function (ui) {
                        return (fnFormToJsonArrayData('#item_order_register_popup_form'));
                    });
                    itemOrderRegisterPopTopGrid.pqGrid('refreshDataAndView');

                    btnDisabled();
                }
            });
        }

        function btnDisabled() {
            let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
            $('#item_order_register_popup_top_grid_records').html(data.length);

            let MATERIAL_ORDER_NUM = data[0].MATERIAL_ORDER_NUM === undefined ? "" : data[0].MATERIAL_ORDER_NUM;
            let ORDER_STATUS = data[0].ORDER_STATUS === undefined ? "" : data[0].ORDER_STATUS;

            $("#orderNotCompleteBtnBox").css('display', 'none');
            $("#orderCompleteBtnBox").css('display', 'none');

            if(MATERIAL_ORDER_NUM == ""){
                $("#btnItemOrderRegisterPopAdd").attr('disabled', false);
                $("#btnItemOrderRegisterPopSave").attr('disabled', false);
                $("#btnItemOrderRegisterPopSubmit").attr('disabled', true);

                $("#btnItemOrderRegisterPopDelete").css('display', 'none');
                $("#orderNotCompleteBtnBox").css('display', 'block');
            }else{
                if(ORDER_STATUS == 'MST002' || ORDER_STATUS == 'MST004') {
                    $("#btnItemOrderRegisterPopAdd").attr('disabled', true);
                    $("#btnItemOrderRegisterPopSave").attr('disabled', true);
                    $("#btnItemOrderRegisterPopSubmit").attr('disabled', true);

                    $("#orderCompleteBtnBox").css('display', 'block');
                }else{
                    $("#btnItemOrderRegisterPopAdd").attr('disabled', false);
                    $("#btnItemOrderRegisterPopSave").attr('disabled', false);
                    $("#btnItemOrderRegisterPopSubmit").attr('disabled', false);

                    $("#orderNotCompleteBtnBox").css('display', 'block');
                }
                $("#btnItemOrderRegisterPopDelete").css('display', 'inline');
            }

            if(ORDER_STATUS == 'MST002' || ORDER_STATUS == 'MST004'){
                itemOrderRegisterPopTopGrid.pqGrid('option', 'colModel', itemOrderRegisterPopTopColModel_enabled);
            }else{
                itemOrderRegisterPopTopGrid.pqGrid('option', 'colModel', itemOrderRegisterPopTopColModel);
            }
            itemOrderRegisterPopTopGrid.pqGrid('refresh');
        }

        /**
         * fnFilterHandler
         * @Parameter
         * */
        function itemOrderRegisterFilterRender(ui) {
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
                var condition = $("#itemOrderRegisterFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#itemOrderRegisterFilterKeyword").val(),
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

        $('#ITEM_ORDER_REGISTER_START_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ITEM_ORDER_REGISTER_END_DATE').datepicker({dateFormat: 'yy/mm/dd'});
        $('#ITEM_ORDER_REGISTER_START_DATE').datepicker('setDate', 'today');
        $('#ITEM_ORDER_REGISTER_END_DATE').datepicker('setDate', 'today');
        
        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#M_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceMaterialCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}});
    });

    // topWrap 확장 함수
    function divOpen(){
        var leftDiv = $('#dynamic_left_div');
        var rightDiv = $('#dynamic_right_div');

        rightDiv.css('display', 'none');
        leftDiv.stop().animate({width:'100%'},100, 'easeOutCubic');
        rightDiv.stop().animate({width:'0%'},100, 'easeOutCubic');

        setTimeout(function(){
            itemOrderRegisterLeftGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
            itemOrderRegisterRightGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
        }, 100);

    }

    // topWrap 축소 함수
    function divClose(){
        var leftDiv = $('#dynamic_left_div');
        var rightDiv = $('#dynamic_right_div');

        leftDiv.stop().animate({width:'64.5%'},100, 'easeOutCubic');
        rightDiv.stop().animate({width:'32.5%'},100, 'easeOutCubic');
        rightDiv.css('display', 'block');
        setTimeout(function(){
            itemOrderRegisterLeftGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
            itemOrderRegisterRightGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
        }, 100);
    }

</script>