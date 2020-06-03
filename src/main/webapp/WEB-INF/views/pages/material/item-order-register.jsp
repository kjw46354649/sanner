<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<div class="popup_container" id="item_order_register_popup" style="display: none;">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">소재 주문</h3>
        <button type="button" class="pop_close close">닫기</button>
        <div class="buttonWrap">
            <span class="d-inline">
                <span class="ipu_wrap"><label class="label_80" for="item_order_register_material_order_num">소재주문번호</label><input type="text" name="" id="item_order_register_material_order_num" class="wd_200" value="" title="소재주문업체"></span>
                <span class="right_float">
                    <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterPopAdd">추가</button>
                    <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterPopOrder">저장 & 제출</button>
                </span>
            </span>
        </div>
        <br/>
        <form class="form-inline" role="form" id="item_order_register_popup_form" name="item_order_register_popup_form">
            <input type="hidden" id="queryId" name="queryId" value="selectItemOrderRegisterPopList"/>
            <input type="hidden" id="CONCAT_SEQ" name="CONCAT_SEQ"/>
            <input type="hidden" id="MATERIAL_ORDER_SEQ" name="MATERIAL_ORDER_SEQ"/>
            <div class="tableWrap">
                <div id="item_order_register_popup_top_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="item_order_register_popup_top_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
            <br/>
            <div class="gridWrap popupTableDiv">
                <%--<div id="item_order_register_popup_bot_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="item_order_register_popup_bot_grid_records" style="color: #00b3ee">0</span>)
                </div>--%>
            </div>
        </form>
    </div>
</div>

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="item_order_register_search_form" name="item_order_register_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="selectItemOrderRegisterList">
            <div class="gubunWrap row3_topWrap">
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
                        <span class="ipu_wrap"><label class="label_100" for="MODULE_NM">견적번호</label><input type="text" name="MODULE_NM" id="MODULE_NM" class="wd_200" value="" title="견적번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="ITEM_NM">품명</label><input type="text" name="ITEM_NM" id="ITEM_NM" class="wd_200" value="" title="품명"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float"><button type="button" class="defaultBtn radius blue" id="btnItemOrderRegisterSearch">검색</button></span>
                    </li>
                    <li>
                        <span class="ipu_wrap"><label class="label_100" for="MANAGE_NUM">관리번호</label><input type="text" name="MANAGE_NUM" id="MANAGE_NUM" class="wd_200" value="" title="관리번호"></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100" for="DRAWING_NUM">소재주문번호</label><input type="text" name="DRAWING_NUM" id="DRAWING_NUM" class="wd_200" value="" title="소재주문번호"></span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="M_ORDER_COMP_CD">소재주문업체</label>
                            <select type="text" name="M_ORDER_COMP_CD" id="M_ORDER_COMP_CD" class="wd_200">
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                            <select type="text" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" class="wd_200">
                                <option value="">Select</option>
                                <c:forEach var="code" items="${HighCode.H_1027}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                    </li>
                    <li class="">
                        <span class="txt_span pd-right20"><label class="label_100" for="MODULE_NM">기간 조회</label></span>
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
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div class="left_60Wrap" id="dynamic_left_div"  style="width: 100%;">
                    <div class="buttonWrap">
                        <span class="d-inline">
                            <button type="button" class="defaultBtn " id="btnItemOrderRegisterOrder">소재주문</button>
                            <button type="button" class="defaultBtn radius red" id="btnItemOrderRegisterCancel">주문취소</button>
                            <button type="button" class="defaultBtn btn-120w" id="btnItemOrderRegisterCurrentStock">보유소재 전체현황</button>
                            <span class="chk_box"><input id="chkItemOrderRegisterAutoMatching" type="checkbox"/><label for="chkItemOrderRegisterAutoMatching">보유소개 자동매칭</label></span>
                            <span class="slt_wrap namePlusSlt right_float">
                                <button type="button" class="defaultBtn radius" id="btnItemOrderRegisterDrawView">도면 보기</button>
                                <button type="button" class="defaultBtn radius green" id="btnItemOrderRegisterSave">저장</button>
                            </span>
                        </span>
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
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '.', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '주문 발주 상태', align: "center", colModel: [
                    {title: '상태', dataType: 'string', dataIndx: 'PART_STATUS_NM', width: 70, editable: false},
                    {title: '확정/취소 일시', dataType: 'date', dataIndx: 'STATUS_DT', width: 120, editable: false}
                ]},
            {title: '소재주문<br>상태', dataType: 'string', dataIndx: 'M_STATUS_NM', width: 70, editable: false},
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 80, editable: false,
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
            {title: '소재 주문번호', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', width: 120, editable: false},
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_NM', width: 80,
                editor: {
                    type: 'select',
                    mapIndices: { name: "M_COMP_NM", id: "M_COMP_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceCompanyList'}}),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["M_COMP_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', width: 120, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: false},
            {title: '도면Rev.', dataType: 'string', dataIndx: 'DRAWING_VER ', editable: false},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ', editable: false},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', editable: false},
            {title: '요망<br>납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 80, editable: false},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
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
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', width: 70,
                editor: {
                    type: 'select',
                    mapIndices: { name: "MATERIAL_DETAIL_NM", id: "MATERIAL_DETAIL" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = itemOrderRegisterLeftGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["MATERIAL_DETAIL"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120 } ,
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', width: 120},
            {title: '요청 사항', align: "center", colModel: [
                    {title: '요청<br>사항', dataType: 'string', dataIndx: 'REQUEST_CD', width: 120,
                        editor: {
                            type: 'select',
                            mapIndices: { name: "REQUEST_CD", id: "REQUEST_CD" },
                            cls: 'item_order_register_material_order_note',
                            valueIndx: "value",
                            labelIndx: "text",
                            options: fnGetCommCodeGridSelectBox('1026'),
                            //attr: 'multiple',
                            init: function(ui) {
                                ui.$cell.find("select").pqSelect();
                                ui.$cell.find("select").pqSelect('open');
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
                                rowData["REQUEST_CD"] = concatCd.substring(0, concatCd.length-1);
                                return concatVal.substring(0, concatVal.length-1);
                            }
                        }
                    },
                    {title: '비고', dataType: 'string', dataIndx: 'M_ORDER_NOTE', width: 120},
                ]},
            {title: '원<br>발주량', dataType: 'string', dataIndx: 'ORDER_QTY', editable: false},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY' },
            {title: '보유소재 충당수량', align: "center", colModel: [
                    {title: '소재<br>Size', dataType: 'string', dataIndx: 'OUT_SIZE_TXT'},
                    {title: '수량', dataType: 'string', dataIndx: 'OUT_QTY'},
                    {title: '', dataType: 'string', dataIndx: '',
                        render: function(ui){
                            return '<input type="button" id="itemOrderRegisterOutReset" value="reset"/>';
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
                    {title: '불출', dataType: 'string', dataIndx: 'OUT_YN'},
                ]},
            {title: '비고', dataType: 'string', dataIndx: 'DTL_AMOUNT'},
            {title: '주문<br>요청 일시', dataType: 'date', dataIndx: 'M_ORDER_DT',  width: 120, editable: false}
        ];

        let itemOrderRegisterRightColModel= [
            {title: 'MY_MAT_STOCK_SEQ', dataType: 'string', dataIndx: 'MY_MAT_STOCK_SEQ', hidden: true } ,
            {title: 'MY_MAT_OUT_SEQ', dataType: 'string', dataIndx: 'MY_MAT_OUT_SEQ', hidden: true } ,
            {title: 'CONTROL_SEQ', dataType: 'string', dataIndx: 'CONTROL_SEQ', hidden: true } ,
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'string', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true } ,
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_NM' , editable: false} ,
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM' , editable: false} ,
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true } ,
            {title: '형태', dataType: 'string', dataIndx: 'MATERIAL_KIND_NM' , editable: false} ,
            {title: 'Size(mm)', dataType: 'string', dataIndx: 'SIZE_TXT' , editable: false} ,
            {title: '재고', dataType: 'integer', dataIndx: 'STOCK_QTY' , editable: false} ,
            {title: '요청', dataType: 'integer', dataIndx: 'OUT_QTY' } ,
            {title: '', dataType: 'string', dataIndx: 'OUT_YN', editable: false,
                render: function(ui){
                    let returnVal = "";
                    if(ui.rowData.OUT_YN == 'Y') {
                        returnVal = '<a href="#"><span class="ui-icon ui-icon-arrowthick-1-e"></span></a>';
                    }
                    return returnVal;
                }
            }
        ];

        let itemOrderRegisterPopTopColModel= [
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_KIND' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
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
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
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
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE' , validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1035')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1035');
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
            {title: '요청소재<br>Size(mm)', dataType: 'string', dataIndx: 'M_SIZE_TXT', width: 80, validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '요청<br>사항', dataType: 'string', dataIndx: 'REQUEST_CD', width: 120},
            {title: '비고', dataType: 'string', dataIndx: 'M_ORDER_NOTE'},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'M_ORDER_QTY' , validations: [{ type: 'minLen', value: 1, msg: "Required"}] },
            {title: '주문업체', dataType: 'string', dataIndx: 'M_COMP_CD', width: 120, validations: [{ type: 'minLen', value: 1, msg: "Required"}],
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceCompanyList'}}),
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '') {
                        return '';
                    } else {
                        let data = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceCompanyList'}});
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
            {title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 80,
                editable: true, editor: { type: 'textbox', init: dateEditor } },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 120, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 120, editable: false},
            {title: '원<br>발주량', dataType: 'string', dataIndx: 'ORDER_QTY ', editable: false},
            {title: '', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'MATERIAL_ORDER_NUM', hidden: true}
        ];

        let itemOrderRegisterPopBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '전화번호', dataType: 'string', dataIndx: 'ITEM_QTY' }
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
            columnTemplate: {align: 'center', hvalign: 'center'},
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
            complete: function(event, ui) {
                this.flex();
                let data = itemOrderRegisterLeftGrid.pqGrid('option', 'dataModel.data');

                $('#item_order_register_left_grid_records').html(data.length);
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    itemOrderRegisterSelectedRowIndex = [];
                    let itemOrderRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let itemOrderRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (itemOrderRegisterGridFirstRow === itemOrderRegisterGridLastRow) {
                        itemOrderRegisterSelectedRowIndex[0] = itemOrderRegisterGridFirstRow;
                    } else {
                        for (let i = itemOrderRegisterGridFirstRow; i <= itemOrderRegisterGridLastRow; i++) {
                            itemOrderRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            },
            rowSelect: function( event, ui) {
                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.addList[0].rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.addList[0].rowData.CONTROL_DETAIL_SEQ);
            },
            cellClick: function( event, ui) {
                itemOrderRegisterSelectedRowIndex = [];
                itemOrderRegisterSelectedRowIndex.push(ui.rowIndx);

                $("#item_order_register_hidden_form #CONTROL_SEQ").val(ui.rowData.CONTROL_SEQ);
                $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val(ui.rowData.CONTROL_DETAIL_SEQ);

                let hiddenYn = $("#item_order_register_hidden_form #AUTO_SEARCH").val();
                if(hiddenYn == 'Y') {
                    $(".itemOrderRegisterMaterialDetailSelectBox").val(ui.rowData.MATERIAL_DETAIL);
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
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: true},
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
                    this.flex();
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
                    let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
                    let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
                    if(CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !='') {
                        itemOrderRegisterRightGrid.pqGrid("updateRow", {'rowIndx': ui.updateList[0].rowIndx, row: {'CONTROL_SEQ': CONTROL_SEQ, 'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ} });
                    }
                }
            });

            //itemOrderRegisterRightGrid.pqGrid("refreshDataAndView");
        };

        $('#item_order_register_popup').on('hide.bs.modal', function() {
            itemOrderRegisterPopTopGrid.pqGrid( "destroy" );
            itemOrderRegisterPopBotGrid.pqGrid( "destroy" );
        });

        $('#item_order_register_popup').on('show.bs.modal',function() {
            let CONCAT_SEQ = $("#item_order_register_popup_form #CONCAT_SEQ").val();

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
                columnTemplate: {align: 'center', hvalign: 'center'},
                scrollModel: {autoFit: false},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                trackModel: {on: true},
                colModel: itemOrderRegisterPopTopColModel,
                showTitle: false,
                title: false,
                complete: function (event, ui) {
                    this.flex();
                    let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_register_popup_top_grid_records').html(data.length);
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        itemOrderRegisterPopTopGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                    }
                }
            });

            itemOrderRegisterPopBotGrid.pqGrid({
                width: "100%", height: 150,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList'},
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                virtualX: true, virtualY: true,
                scrollModel: {autoFit: false},
                selectionModel: { type: 'row', mode: 'single', column: true } ,
                swipeModel: {on: false},
                collapsible: false,
                resizable: false,
                colModel: itemOrderRegisterPopBotColModel,
                showTitle: false,
                title: false,
                complete: function (event, ui) {
                    this.flex();
                    let data = itemOrderRegisterPopBotGrid.pqGrid('option', 'dataModel.data');

                    $('#item_order_register_popup_bot_grid_records').html(data.length);
                }
            });

            let parameters = {'url': '/json-list', 'data': {'queryId': 'selectItemOrderRegisterNextMaterialOrderNum'}};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list[0];
                $("#item_order_register_material_order_num").val(list.MATERIAL_ORDER_NUM);

                itemOrderRegisterPopOrderSheet();
            }, parameters, '');
        });

        /** 버튼 처리 **/
        $("#btnItemOrderRegisterSearch").on('click', function(){
            itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                return (fnFormToJsonArrayData('#item_order_register_search_form'));
            });
            itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
        });

        $("#btnItemOrderRegisterOrder").on('click', function(){
            let rowDataArray = "";
            let selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                rowDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
            }
            let CONCAT_SEQ = rowDataArray.substr(0 , rowDataArray.length-1);
            $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
            $("#item_order_register_popup").modal('toggle');
        });

        $("#btnItemOrderRegisterCancel").on('click', function(){
            let concatSeqDataArray = "";
            let orderSeqDataArray = "";
            let selectedRowCount = itemOrderRegisterSelectedRowIndex.length;
            for (let i = 0; i < selectedRowCount; i++) {
                let CONTROL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_SEQ;
                let CONTROL_DETAIL_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).CONTROL_DETAIL_SEQ;
                let MATERIAL_ORDER_SEQ = itemOrderRegisterLeftGrid.pqGrid('getRowData', {rowIndx: itemOrderRegisterSelectedRowIndex[i]}).MATERIAL_ORDER_SEQ;

                concatSeqDataArray += "'"+CONTROL_SEQ+""+CONTROL_DETAIL_SEQ+"',";
                orderSeqDataArray += "'"+MATERIAL_ORDER_SEQ+"',";
            }
            let CONCAT_SEQ = concatSeqDataArray.substr(0 , concatSeqDataArray.length-1);
            let ORDER_SEQ = orderSeqDataArray.substr(0 , orderSeqDataArray.length-1);

            $("#item_order_register_popup_form #CONCAT_SEQ").val(CONCAT_SEQ);
            $("#item_order_register_popup_form #MATERIAL_ORDER_SEQ").val(ORDER_SEQ);

            let parameter = {
                'queryId': 'updateItemOrderRegisterMaterialOrderCancel',
                'MATERIAL_ORDER_SEQ': $("#item_order_register_popup_form #MATERIAL_ORDER_SEQ").val(),
            };
            let parameters = {'url': '/json-remove', 'data': parameter};
            fnPostAjax(function(data, callFunctionParam){
                parameter = {
                    'queryId': 'updateItemOrderRegisterControlPartCancel',
                    'CONCAT_SEQ': $("#item_order_register_popup_form #CONCAT_SEQ").val(),
                };
                parameters = {'url': '/json-remove', 'data': parameter};
                fnPostAjax(function(data, callFunctionParam){
                    $("#btnItemOrderRegisterSearch").trigger('click');
                }, parameters, '');
            }, parameters, '');
        });

        $("#btnItemOrderRegisterCurrentStock").on('click', function(){
            $("a[pid='100043']").trigger("click");
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
            let CONTROL_SEQ = $("#item_order_register_hidden_form #CONTROL_SEQ").val();
            let CONTROL_DETAIL_SEQ = $("#item_order_register_hidden_form #CONTROL_DETAIL_SEQ").val();
            if(CONTROL_SEQ != '' && CONTROL_DETAIL_SEQ !=''){
                let itemOrderRegisterOutInsertUpdateQueryList = ['insertUpdateItemOrderRegisterOut'];
                fnModifyPQGrid(itemOrderRegisterRightGrid, itemOrderRegisterOutInsertUpdateQueryList, itemOrderRegisterOutInsertUpdateQueryList);

                setTimeout(function(){
                    itemOrderRegisterLeftGrid.pqGrid('option', "dataModel.postData", function (ui) {
                        return (fnFormToJsonArrayData('#item_order_register_search_form'));
                    });
                    itemOrderRegisterLeftGrid.pqGrid('refreshDataAndView');
                }, 1500);

            }else{
                alert("You must be select item.");
                return;
            }

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
            itemOrderRegisterPopTopGrid.pqGrid('addNodes', [{}], 0);
        });

        $("#btnItemOrderRegisterPopOrder").on('click', function(){
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();
            let data = itemOrderRegisterPopTopGrid.pqGrid('option', 'dataModel.data');
            let totalRecords = data.length;
            for(let tempI=0; tempI<totalRecords; tempI++){
                itemOrderRegisterPopTopGrid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM } });
            }
            let itemOrderRegisterInsertUpdateQueryList = ['insertUpdateItemOrderRegisterPopSave','updateItemOrderRegister'];
            fnModifyPQGrid(itemOrderRegisterPopTopGrid, itemOrderRegisterInsertUpdateQueryList, itemOrderRegisterInsertUpdateQueryList);

            //Popup table 생성
            makeInnerTable();
            //메일 여부
            itemOrderRegisterPopMail();

        });

        function makeMailInnerTable(list)
        {
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
        }
        function makeInnerTable(list)
        {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            let table="";
            var font_header =" background:lightblue; font-weight:500; font-size: 15px;";
            var font_context ="font-size: 15px;";
            var st_center="border:1px solid #a8a8a8; text-align:center; padding:0px 15px 0px 15px;";
            var row_span ="rowspan='2'";

            let parameter = {
                'queryId': 'selectItemOrderRegisterPopTable',
                'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
            };
            let parameters = {'url': '/json-list', 'data': parameter};
            fnPostAjax(function (data, callFunctionParam) {
                let list = data.list;

                console.log(list);
                table += "<table style='border-spacing:0; width:100%;'><tr>";
                table += "<td style='"+ st_center + font_header +"'>업체</td>";
                for(var i=0; i<list.length; i++) {
                    table += "<td style='"+ st_center + font_header +"'>"	+ list[i].MATERIAL_COMP_NM +"</td>";
                }
                table += "</tr>";
                table += "<tr>";
                table += "<td style='"+ st_center + font_header +"'>담당자</td>";
                for(var j=0; j<list.length; j++) {
                    table += "<td style='"+ st_center + font_header +"'>"	+ list[j].MATERIAL_COMP_EMAIL +"</td>";
                }
                table += "</tr>";
                table += "<tr>";
                table += "<td style='"+ st_center + font_context +"'>내용</td>";
                for(var h=0; h<list.length; h++){
                    table += "<td style='"+ st_center + font_context +"'>" 	+ list[h].CONTENTS +"</td>";
                }
                table += "</tr></table>";

                console.log(table);
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
                    itemOrderRegisterPopOrderSheet();
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm){
                if(confirm) {
                    let parameter = {
                        'queryId': 'selectItemOrderRegisterPopMailTable',
                        'MATERIAL_ORDER_NUM': MATERIAL_ORDER_NUM
                    };
                    let parameters = {'url': '/json-list', 'data': parameter};
                    fnPostAjax(function (data, callFunctionParam) {
                        let list = data.list;
                        let compareCd = list[0].MATERIAL_COMP_CD;
                        let compCd = "";
                        let tableList = [];
                        let innerTable = "";

                        for(var i=0; i<list.length; i++) {
                            compCd = list[i].MATERIAL_COMP_CD;
                            if(i == list.length-1 || compareCd != compCd) {
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
                            itemOrderRegisterPopOrderSheet();
                        }, parameters, '');
                    }, parameters, '');

                }
            });
        }

        function itemOrderRegisterPopOrderSheet() {
            let MATERIAL_ORDER_NUM = $("#item_order_register_material_order_num").val();

            //Confirm Box
            let headHtml = "Information", bodyHtml ="", yseBtn="예", noBtn="아니오";
            bodyHtml =
                '<h4>\n' +
                '<img style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;\n' +
                '<span>성공적으로 발송되었습니다.</br>주문서를 출력하시겠습니까?</span>' +
                '</h4>';

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
                });
            };
            itemOrderRegisterPopSubmitConfirm(function(confirm){
                if(confirm) {
                    $("#common_excel_form #sqlId").val('selectItemOrderRegisterPopTable:selectItemOrderRegisterOrderSheetListExcel');
                    $("#common_excel_form #mapInputId").val('data');
                    $("#common_excel_form #paramName").val('MATERIAL_ORDER_NUM');
                    $("#common_excel_form #paramData").val(MATERIAL_ORDER_NUM);
                    $("#common_excel_form #template").val('item_order_sheet_template');
                    fnReportFormToHiddenFormPageAction("common_excel_form", "/itemOrderRegisterOrderSheetPrint");
                }
            });
        }


        /** 공통 코드 이외의 처리 부분 **/
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOrderCompanyList'}});
        fnCommCodeDatasourceSelectBoxCreate($("#item_order_register_search_form").find("#M_ORDER_COMP_CD"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getOutsourceCompanyList'}});
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