<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-06-26
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>작업지시생성</title>
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        .slider:before {
            left: 10px;
            height: 17px;
            width: 16px;
        }

        .div_bg {
            height: 100%;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0.2;
            display: none;
        }
    </style>
</head>
<body>
<div id="order_manage_div" class="page estimate">
    <div class="div_bg"></div>
    <div style="height: 740px;padding: 10px;">
        <form class="form-inline" name="CREATE_CONTROL_SEARCH_FORM" id="CREATE_CONTROL_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectCreateControlList">
            <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
            <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;"><i class="xi-desktop"></i>&nbsp;작업지시 생성</h3>
            <label class="switch ml-20" style="height: 25px;">
                <input type="checkbox" id="toggleImageView">
                <span class="slider round"></span>
            </label>
            <label style="font-size: 17px;font-weight: bold;color: black;margin-left: 5px;">도면 View 모드</label>
            <div style="float: right;display: inline-block;">
                <button id="create_control_draw_detail" class="defaultBtn btn-100w green">도면상세보기</button>
                <button id="create_control_close" class="defaultBtn btn-100w" style="background: #999;color: white;">닫기</button>
            </div>
            <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
            <div class="hWrap mb-10">
                <div class="mt-10">
                    <div class="d-inline">
                        <span class="slt_wrap">
                            <label class="label_65" for="ORDER_COMP_CD">발주사</label>
                            <input type="text" class="wd_150" name="ORDER_COMP_CD" id="ORDER_COMP_CD" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="발주사" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_80" for="REGIST_NUM">접수번호</label>
                            <input type="search" class="wd_150" name="REGIST_NUM" id="REGIST_NUM" title="작업지시번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_80" for="WORK_TYPE">작업형태</label>
                            <input type="text" class="wd_150" name="WORK_TYPE" id="WORK_TYPE" placeholder="<spring:message code='com.form.top.all.option'/>(복수개 선택)" title="작업형태" readonly>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_65" for="MATERIAL_TYPE">재질</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="MATERIAL_TYPE" title="재질">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1035}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap trans_slt" style="width: 120px;">
                            <label for="CREATE_CONTROL_SEARCH_CONDITION"></label>
                            <select name="CREATE_CONTROL_SEARCH_CONDITION" id="CREATE_CONTROL_SEARCH_CONDITION" style="width: inherit; text-align-last: center;">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1092}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <div class="d-inline-block" style="width:275px">
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="CREATE_CONTROL_START_DATE" id="CREATE_CONTROL_START_DATE" readonly><button type="button" id="CREATE_CONTROL_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" title="달력정보" style="width: 120px;" name="CREATE_CONTROL_END_DATE" id="CREATE_CONTROL_END_DATE" readonly><button type="button" id="CREATE_CONTROL_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="refresh ml-10"><button type="button" id="CREATE_CONTROL_REFRESH"><img src="<c:url value="/resource/asset/images/common/btn_refresh.png"/>" alt="새로고침"></button></span>
                    </div>
                </div>
                <div class="mt-10">
                    <div class="d-inline">
                        <button type="button" class="defaultBtn btn-80w blue" id="SELECT_ALL">일괄선택</button>
                        <button type="button" class="defaultBtn btn-80w" id="CLEAR_SELECT" style="margin: 0;">선택해제</button>
                        <label for="createControlFilterKeyword"></label>
                        <input type="search" id="createControlFilterKeyword" class="wd_150 ml-75" placeholder="Enter your keyword">
                        <label for="createControlFrozen" class="label_30" style="font-size: 15px;">Fix</label>
                        <select id="createControlFrozen" name="createControlFrozen">
                        </select>
                        <label for="createControlFilterColumn" style="display: none;"></label>
                        <select id="createControlFilterColumn" style="display: none;"></select>
                        <label for="createControlFilterCondition" style="display: none;"></label>
                        <select id="createControlFilterCondition" style="display: none;">
                            <option value="contain">Contains</option>
                        </select>
                        <input type="text" class="wd_130 ml-75" name="BATCH_CONTROL_NUM" id="BATCH_CONTROL_NUM" title="일괄입력">
                        <select id="CONTROL_NUM_NUMBER" class="wd_70">
                            <option value="" selected>자리수</option>
                            <c:forEach var="i" begin="1" end="5">
                                <option value="<c:out value='${i}'/>"><c:out value='${i}'/></option>
                            </c:forEach>
                        </select>
                        <select id="DUE_DT_NUMBER" class="wd_70">
                            <option value="" selected>일자</option>
                            <c:forEach var="i" begin="1" end="30">
                                <option value="<c:out value='${i}'/>">-<c:out value='${i}'/></option>
                            </c:forEach>
                        </select>
                        <button type="button" class="defaultBtn btn-80w" id="INPUT_BATCH">일괄입력</button>
                    </div>
                    <div style="float: right;display: inline-block;">
                        <span style="margin-right: 50px;">
                            <span class="chk_box"><input name="HIDE_CONTROL_NUM" id="HIDE_CONTROL_NUM" type="checkbox" checked><label for="HIDE_CONTROL_NUM"> 생성완료 제외</label></span>
<%--                            <span class="chk_box"><input name="MAIN_COLUMN" id="MAIN_COLUMN" type="checkbox"><label for="MAIN_COLUMN"> 주요컬럼</label></span>--%>
                        </span>
                        <button type="button" class="defaultBtn btn-80w" id="RESET_GRID">
                            <i class="xi-refresh" style="margin-right: 4px;"></i>
                            Reset
                        </button>
                        <button type="button" class="defaultBtn btn-80w" id="ADD_ROW">Row 삽입</button>
                        <button type="button" class="defaultBtn btn-80w red" id="DELETE_ROW">제거</button>
                        <button type="button" class="defaultBtn btn-100w" style="background-color: #ffd966;" id="VALIDATION_GRID">Validation</button>
                        <button type="button" class="defaultBtn btn-100w green" id="CREATE_CONTROL">작업생성</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="tableWrap">
            <div class="conWrap" style="display: flex;width: 100%;">
                <div id="main_column_draw_div" style="width: 54%;height: 630px;margin-right: 15px;display: none;">
                    <!--도면삽입-->
                    <img id="create_control_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
                </div>
                <div id="CREATE_CONTROL_GRID"></div>
            </div>
        </div>
    </div>
</div>

<script>
    /* init */
    var $createControlGrid;
    var selectedCreateControlRowIndex = [];
    const $createControlStartDate = $('#CREATE_CONTROL_START_DATE');
    const $createControlEndDate = $('#CREATE_CONTROL_END_DATE');
    $createControlStartDate.datepicker({dateFormat: 'yy/mm/dd'});
    $createControlEndDate.datepicker({dateFormat: 'yy/mm/dd'});
    $createControlStartDate.datepicker('setDate', 'today');
    $createControlEndDate.datepicker('setDate', 'today');
    let isActiveDrawingView = false;
    $('#CREATE_CONTROL_SEARCH_CONDITION').val('ROM002').prop("selected",true);

    $(function () {
        'use strict';
        /* variable */
        const FAMILY_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        const ORDER_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        const COMPANY_STAFF = (function () {
            let list = [];
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getCompanyStaffList'}};

            fnPostAjax(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, compCd: obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();

        const gridId = 'CREATE_CONTROL_GRID';
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'MERGE_CONTROL_SEQ', dataType: 'integer', dataIndx: 'MERGE_CONTROL_SEQ', hidden: true},
            {title: 'MERGE_CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'MERGE_CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {
                title: '접수번호', align: 'left', width: 160, dataIndx: 'REGIST_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', width: 40,
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: (cellData === 'Y' ? cellData : '')};
                }
            },
            {title: '주문<br>확정', dataIndx: 'ORDER_STATUS_DT', maxWidth: 40,
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData.substring(0, 5)};
                }
            },
            {
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN', maxWidth: 30,
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: (cellData === 'Y' ? cellData : '')};
                }
            },
            {
                title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1059')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';
                    let index = -1;
                    let options = fnGetCommCodeGridSelectBox('1059');

                    index = options.findIndex(function (element) {
                        return element.value === cellData;
                    });
                    if (index > -1) cellData = options[index].text;

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {
                title: '표면<br>처리', width: 60, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1039')
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {
                title: '특수<br>처리', align: 'center', dataIndx: 'SPECIAL_TREATMENT', width: 60,
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: [
                        {'value':'MATERIAL_FINISH_GRIND_YN', 'text':'연마'},
                        {'value':'MATERIAL_FINISH_HEAT_YN', 'text':'열처리'}
                    ]
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';
                    let text = '';
                    if(cellData == 'MATERIAL_FINISH_GRIND_YN') {
                        text = '연마'
                    }else if(cellData == 'MATERIAL_FINISH_HEAT_YN') {
                        text = '열처리'
                    }

                    return {cls: cls, text: text};
                }
            },
            {
                title: '비고', align: 'left', width: 80, dataIndx: 'NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '발주업체', width: 80, dataIndx: 'ORDER_COMP_NM',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {
                title: '도면번호', align: 'left', width: 140, dataIndx: 'DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#c3dda5'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON', styleHead: {'background':'#c3dda5'},
                render: function (ui) {
                    let text = '';
                    let cls = 'bg-lightgray';
                    if (ui.rowData.IMG_GFILE_SEQ) text = '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';

                    return {cls: cls, text: text};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL',
                styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';
                    let index = -1;
                    let options = fnGetCommCodeGridSelectBox('1027');

                    index = options.findIndex(function (element) {
                        return element.value === cellData;
                    });
                    if (index > -1) cellData = options[index].text;

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY', maxWidth: 30,
                styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY', maxWidth: 30,
                        styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                        editable: false,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let cls = 'bg-lightgray';

                            return {cls: cls, text: cellData};
                        }
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY', maxWidth: 30,
                        styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                        editable: false,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let cls = 'bg-lightgray';

                            return {cls: cls, text: cellData};
                        }
                    }
                ]
            },
            {
                title: '발주<br>납기', width: 50, dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_DUE_DT',
                styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                editable: false,
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#fff2a0'},
                editable: false,
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = 'bg-lightgray';

                    return {cls: cls, text: cellData};
                }
            },
            {
                title: '작업지시번호', align: 'left', width: 140, dataIndx: 'CONTROL_NUM',
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '');
                },
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = '';
                    if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {title: '파트<br>개수', width: 40, dataIndx: 'PART_NUM', dataType: 'integer',
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '') && rowData.WORK_TYPE == 'WTP020';
                },
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    if(rowData.WORK_TYPE != 'WTP020') {
                        cls = 'bg-lightgray';
                    }
                    if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                        cls = 'bg-lightgray';
                    }
                    return {cls: cls, text: createControlFilterRender(ui)};
                }
            },
            {title: 'INNER_DUE_DT_COPY', dataType: 'String', dataIndx: 'INNER_DUE_DT_COPY', hidden: true},
            {title: '가공<br>납기', width: 50, dataIndx: 'INNER_DUE_DT', dataType: 'date', format: 'mm/dd',
                editor: {type: 'textbox', init: fnDateEditor},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '');
                },
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    rowData.INNER_DUE_DT_COPY = ui.cellData;
                    let cls = '';
                    if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_ORDER_QTY', maxWidth: 30,
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                editable: function (ui) {
                    let rowData = ui.rowData;

                    return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '');
                },
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = '';
                    if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_ORIGINAL_SIDE_QTY', maxWidth: 30,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = '';
                            if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_OTHER_SIDE_QTY', maxWidth: 30,
                        styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#2777ef'},
                        editable: function (ui) {
                            let rowData = ui.rowData;

                            return (typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '');
                        },
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = '';
                            if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {title: 'Validation', width: 90, dataIndx: 'VALIDATION',
                render: function (ui) {
                    let rowData = ui.rowData;
                    const cellData = ui.cellData;
                    let text = cellData;
                    let cls = '';
                    if(typeof rowData.CONTROL_SEQ != 'undefined' && rowData.CONTROL_SEQ != null ) {
                        text = '생성완료';
                        cls = 'bg-lightgray';
                    }
                    switch (text) {
                        case 'SUCCESS':
                            text = '생성가능';
                            cls = 'bg-light-green';
                            break;
                        case 'RS_EXISTS':
                            text = '번호존재 Merge 불가';
                            cls = 'bg-light-red';
                            break;
                        case 'RS_EXISTS2':
                            text = '번호존재 Merge 불가';
                            cls = 'bg-light-red';
                            break;
                        case 'RS_MERGE':
                            text = '번호존재. Merge 가능';
                            cls = 'bg-light-yellow2';
                            break;
                        case 'FAIL':
                            text = '생성불가';
                            cls = 'bg-light-red';
                            break;
                    }
                    $createControlGrid.pqGrid('removeClass', {rowIndx: ui.rowData.pq_ri, dataIndx: 'VALIDATION', cls: 'pq-cell-dirty'} );

                    return {cls: cls, text: text};
                }
            },
            {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true},
        ];
        const obj = {
            minHeight: '100%',
            width: '100%',
            height: 630,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            copyModel: {render: true},
            numberCell: {width: 30, title: "No"},
            trackModel: {on: true},
            // scrollModel: {autoFit: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: createControlFilterRender},
            filterModel: {mode: 'OR'},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#CREATE_CONTROL_SEARCH_FORM'),
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                diHelper: ['ROW_NUM'],
            },
            dropModel: {
                on: true,
            },
            sortModel: {on: true},
            load: function () {
                if($('#createControlFilterKeyword').val() !== '')
                    fnFilterHandler($createControlGrid, 'createControlFilterKeyword', 'createControlFilterCondition', 'createControlFilterColumn');
                autoMerge(this, true);
            },
            selectChange: function (event, ui) {
                selectedCreateControlRowIndex = [];
                let rowList = [];
                const sr = $createControlGrid.pqGrid('SelectRow');
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;
                    for (let i = firstRow; i <= lastRow; i++)  {
                        let rowData = $createControlGrid.pqGrid("getRowData", {rowIndx: i});
                        if(fnIsEmpty(rowData.CONTROL_SEQ)) {
                            selectedCreateControlRowIndex.push(i);
                            rowList.push({rowIndx: i});
                        }
                    }
                    sr.removeAll();
                    sr.add({rows:rowList});

                    if (firstRow === lastRow) {
                        let selRowData = $createControlGrid.pqGrid("getRowData", {rowIndx: firstRow});
                        $("#CREATE_CONTROL_SEARCH_FORM").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
                        if(isActiveDrawingView) {
                            $("#create_control_img").attr("src", '/qimage/' + selRowData.IMG_GFILE_SEQ);
                            // callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                        }
                    }
                }
            },
            render: function () {
                this.option('freezeCols', 8);
                // 필터 옵션 생성
                let filterOpts = '<option value=\"\">All Fields</option>';
                let frozenOts = '<option value="0">Selected</option>';

                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === false || column.hidden === undefined;
                    if (hiddenYn && column.title) {
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $('#createControlFilterColumn').html(filterOpts);
                $('#createControlFrozen').html(frozenOts);
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let updateListLength = ui.updateList.length;

                    for (let i = 0; i < updateListLength; i++) {
                        let newRowData = ui.updateList[i].newRow;
                        let rowIndx = ui.updateList[i].rowIndx;

                        // 사업자 구분
                        if (newRowData.hasOwnProperty('COMP_CD')) {
                            let index = FAMILY_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index < 0) {
                                index = FAMILY_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.COMP_CD;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'COMP_CD': FAMILY_COMPANY[index].value}
                            });
                        }
                        // 발주업체
                        if (newRowData.hasOwnProperty('ORDER_COMP_CD')) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index < 0) {
                                index = ORDER_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.ORDER_COMP_CD;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'ORDER_COMP_CD': ORDER_COMPANY[index].value}
                            });
                        }
                        // 주요검사
                        if (newRowData.hasOwnProperty('MAIN_INSPECTION')) {
                            let mainInspectionList = fnGetCommCodeGridSelectBox('1059');
                            let index = mainInspectionList.findIndex(function (element) {
                                return element.text === newRowData.MAIN_INSPECTION;
                            });

                            if (index < 0) {
                                index = mainInspectionList.findIndex(function (element) {
                                    return element.value === newRowData.MAIN_INSPECTION;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MAIN_INSPECTION': mainInspectionList[index].value}
                            });
                        }
                        // 작업형태
                        if (newRowData.hasOwnProperty('WORK_TYPE')) {
                            let workType = fnGetCommCodeGridSelectBox('1033');
                            let index = workType.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index < 0) {
                                index = workType.findIndex(function (element) {
                                    return element.value === newRowData.WORK_TYPE;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'WORK_TYPE': workType[index].value}
                            });
                        }
                        // 소재종류
                        if (newRowData.hasOwnProperty('MATERIAL_DETAIL')) {
                            let materialDetailList = fnGetCommCodeGridSelectBox('1027');
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index < 0) {
                                index = materialDetailList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_DETAIL;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_DETAIL': materialDetailList[index].value}
                            });
                        }
                        // 소재형태
                        if (newRowData.hasOwnProperty('MATERIAL_KIND')) {
                            let materialKindList = fnGetCommCodeGridSelectBox('1029');
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index < 0) {
                                index = materialKindList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_KIND;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_KIND': materialKindList[index].value}
                            });
                        }
                        // 표면처리
                        if (newRowData.hasOwnProperty('SURFACE_TREAT')) {
                            let surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index < 0) {
                                index = surfaceTreatList.findIndex(function (element) {
                                    return element.value === newRowData.SURFACE_TREAT;
                                });
                            }
                            $createControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'SURFACE_TREAT': surfaceTreatList[index].value}
                            });
                        }
                    }
                }

                if (ui.source === 'edit' || ui.source === 'clear') {
                    let rowIndx = ui.updateList[0].rowIndx;
                    let data = ui.updateList[0].rowData;
                    let newRow = ui.updateList[0].newRow;
                    let row;

                    const estimateArray = ['ORDER_QTY', 'UNIT_FINAL_AMT'];
                    let estimateFlag = false;
                    for (let value of estimateArray) {
                        if (newRow.hasOwnProperty(value)) {
                            estimateFlag = true;
                            break;
                        }
                    }

                    if (estimateFlag) {
                        const ORDER_QTY = data.ORDER_QTY == null || data.ORDER_QTY === '' ? 0 : Number(data.ORDER_QTY); //발주 수량
                        let unitFinalAmount = ui.updateList[0].newRow.UNIT_FINAL_AMT || 0; // 최종 공급단가
                        let finalAmount = unitFinalAmount * ORDER_QTY;// 합계 금액

                        if (ui.updateList[0].newRow.UNIT_FINAL_AMT) {
                            row = {
                                'UNIT_FINAL_AMT': unitFinalAmount, // 최종 공급단가
                                'FINAL_TOTAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                            };
                        } else {
                            // 파트
                            if (data.WORK_TYPE !== 'WTP050') {
                                row = {
                                    'UNIT_FINAL_AMT': ui.updateList[0].newRow.UNIT_FINAL_AMT, // 최종 공급단가
                                    'FINAL_TOTAL_AMT': finalAmount // 합계 금액 = 최종 공급단가 * 발주수량
                                };
                            }
                        }

                        $createControlGrid.pqGrid('updateRow', {
                            rowIndx: rowIndx,
                            row: row,
                            checkEditable: false
                        });
                    }
                    $createControlGrid.pqGrid('refreshView');
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $createControlGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
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
                        }else if(dt === 'date') {
                            let dateCopy = $createControlGrid.pqGrid("getRowData", {rowIndx: area.r1}).INNER_DUE_DT_COPY;
                            if(typeof dateCopy != 'undefined' && dateCopy != null && dateCopy != '') {
                                row[j] = dateCopy;
                            }
                            if(row[j].indexOf("-") >= 0 ) {
                                row[j] = row[j].replace(/-/gi,"/");
                            }
                        }
                    }
                }
            }
        };
        /* variable */

        /* function */
        const changeViewColumn = function (elementId) {
            let $createControlGridInstance = $createControlGrid.pqGrid('getInstance').grid;
            let Cols = $createControlGridInstance.Columns();
            let array = [];
            const mainArray = [
                'SIZE_TXT', 'WORK_TYPE_NM', 'MATERIAL_DETAIL', 'ORDER_QTY', 'ORDER_DUE_DT', 'CONTROL_NUM', 'INNER_DUE_DT',
                'PART_NUM', 'VALIDATION', 'ORDER_STATUS_DT', 'REGIST_NUM', 'DRAWING_NUM', 'CONTROL_ORDER_QTY',
                'CONTROL_ORIGINAL_SIDE_QTY', 'CONTROL_OTHER_SIDE_QTY'
            ];
            const allArray = [
                'ORDER_STATUS_DT', 'ORDER_COMP_NM', 'REGIST_NUM', 'DRAWING_NUM', 'DRAWING_NUM_BUTTON', 'ORDER_NUM',
                'NOTE', 'ORDER_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ORDER_DUE_DT', 'WORK_TYPE_NM', 'MATERIAL_SUPPLY_YN',
                'MAIN_INSPECTION', 'SAME_SIDE_YN', 'SIZE_TXT', 'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT',
                'SPECIAL_TREATMENT', 'CONTROL_NUM', 'INNER_DUE_DT', 'PART_NUM', 'CONTROL_ORDER_QTY', 'CONTROL_ORIGINAL_SIDE_QTY',
                'CONTROL_OTHER_SIDE_QTY', 'VALIDATION'
            ];

            switch (elementId) {
                case 'ALL':
                    array = allArray
                    break;
                case 'MAIN':
                    array = mainArray;
                    break;
            }

            Cols.alter(function () {
                Cols.each(function (col) {
                    let flag = array.includes(col.dataIndx);
                    flag = !flag;
                    col.hidden = flag;
                    if (flag === false && col.parent !== undefined) {
                        col.parent.hidden = flag;
                    }
                });
            });
        };


        const noSelectedRowAlert = function () {
            if (selectedCreateControlRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        function createControlFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value === val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                if (ui.column.dataType === 'integer') {
                    val = numberWithCommas(val);
                } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                    let o = new Date(val);
                    val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
                }

                let condition = $('#createControlFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#createControlFilterKeyword').val(),
                    txtUpper = (txt == null) ? '' : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === 'end') {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length !== valUpper.length) {
                        indx = -1;
                    }
                } else if (condition === 'contain') {
                    indx = valUpper.indexOf(txtUpper);
                } else if (condition === 'begin') {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }

                if (indx >= 0 && txt) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background: #FFFF00; color: #333;'>" + txt2 + "</span>" + txt3;
                    // return val;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }

        const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');

            const controlList = [
                'ORDER_STATUS_DT', 'ORDER_COMP_NM', 'REGIST_NUM', 'DRAWING_NUM', 'DRAWING_NUM_BUTTON',
                'ORDER_NUM', 'NOTE', 'ORDER_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ORDER_DUE_DT',
                'WORK_TYPE_NM', 'MATERIAL_SUPPLY_YN', 'MAIN_INSPECTION', 'SAME_SIDE_YN', 'SIZE_TXT',
                'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'SPECIAL_TREATMENT'
            ];
            const includeList = controlList;

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['REGIST_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['REGIST_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (controlList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        } /*else if (partList.includes(dataIndx)) {
                            let controlDetailSeq = data[j]['CONTROL_DETAIL_SEQ'],
                                controlDetailSeqPrev = data[j - 1] ? data[j - 1]['CONTROL_DETAIL_SEQ'] : undefined;

                            if (controlNum === controlNumPrev && controlDetailSeq === controlDetailSeqPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /!**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 *!/
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }*/
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };

        const validationCheck = function (dataList) {
            // workTypeCheck(dataList);
            controlNumCheck(dataList)
            orderQtyCheck(dataList);
            dateCheck(dataList);

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];
                if(typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '') {
                    if (Object.keys(rowData).length > 2) {
                        requiredCheck(rowData);
                        inputErrorCheck(rowData);
                        sideQtyCheck(rowData);
                    }
                }
            }
        };
        const controlNumCheck = function (dataList) {
            $.each(dataList, function (idx,Item) {
                if(typeof Item.CONTROL_SEQ == 'undefined' || Item.CONTROL_SEQ == null || Item.CONTROL_SEQ == '') {
                    var regexpSpec = /[^A-Za-z0-9\-]/gi;
                    if(regexpSpec.test(Item.CONTROL_NUM)) {
                        addErrorList(Item.pq_ri, 'CONTROL_NUM');
                    }
                }
            })
        }
        const registNumCheck = function (dataList) {
            // const groupedOrderSeq = fnGroupBy(dataList, 'ORDER_SEQ');
            const groupedRegistNum = fnGroupBy(dataList, 'REGIST_NUM');
            $.each(groupedRegistNum, function (idx,Item) {
                if(idx !== 'undefined' && idx != 'null' && idx != '') {
                    $.each(Item, function (idx2,Item2) {
                        // if(Item.length > 1) {
                        //     addErrorList(Item2.pq_ri, 'REGIST_NUM');
                        // }else {
                        var regexpSpec = /[^A-Za-z0-9\-\_]/gi;
                        if(regexpSpec.test(Item2.REGIST_NUM)) {
                            addErrorList(Item2.pq_ri, 'REGIST_NUM');
                        }
                        // }
                    })
                }
            })
        }
        const dateCheck = function (dataList) {
            $.each(dataList, function (idx, Item) {
                var dt = new Date(Item.INNER_DUE_DT);
                var today = new Date();

                if((fnIsEmpty(Item.CONTROL_SEQ)) && dt < today) {
                    addErrorList(Item.pq_ri, 'INNER_DUE_DT');
                }
            })
        }
        const workTypeCheck = function (dataList) {
            let groupedControlNum = fnGroupBy(dataList, 'CONTROL_NUM');

            for (let controlNum in groupedControlNum) {
                if (groupedControlNum.hasOwnProperty(controlNum)) {
                    let groupedWorkType = fnGroupBy(groupedControlNum[controlNum], 'WORK_TYPE');

                    if (groupedWorkType.hasOwnProperty('WTP020')) {
                        if (groupedWorkType.hasOwnProperty('WTP010') || groupedWorkType.hasOwnProperty('WTP040')) {
                            for (let i = 0; i < groupedControlNum[controlNum].length; i++) {
                                addErrorList(groupedControlNum[controlNum][i].pq_ri, 'WORK_TYPE');
                            }
                        }
                    }
                }
            }
        };

        const drawingNumCheck = function (dataList) {
            const groupedControlNum = fnGroupBy(dataList, 'CONTROL_NUM');

            for (let controlNum in groupedControlNum) {
                const orderNum = fnGroupBy(groupedControlNum[controlNum], 'ORDER_NUM');

                for (let i in orderNum) {
                    if (!fnIsEmpty(i) && i !== 'undefined') {
                        const ORDER_DRAWING_NUM = fnGroupBy(orderNum[i], 'ORDER_DRAWING_NUM');

                        for (let j in ORDER_DRAWING_NUM) {
                            if (ORDER_DRAWING_NUM[j].length > 1) {
                                for (let k in ORDER_DRAWING_NUM[j]) {
                                    addErrorList(ORDER_DRAWING_NUM[j][k].pq_ri, 'ORDER_DRAWING_NUM');
                                }
                            }
                        }
                    }
                }
            }
        };
        // required 체크
        const requiredCheck = function (rowData) {
            let list;
            // 21.09.09 개선 버전에서는 주문관리화면에서 작업형태 - 단품, 조립, 수정만 생성가능함
            const commonRequiredList = ['CONTROL_NUM','INNER_DUE_DT','CONTROL_ORDER_QTY'];
            const modifiedList = ['PART_NUM']; // 수정

            if(rowData.WORK_TYPE == 'WTP020') {
                list = commonRequiredList.concat(modifiedList);
            }else {
                list = commonRequiredList;
            }

            for (let i in list) {
                if (rowData[list[i]] === undefined || rowData[list[i]] == null || rowData[list[i]] === '' || (rowData[list[i]] != null && typeof rowData[list[i]] == 'object' && !Object.keys(rowData[list[i]]).length)) {
                    addErrorList(rowData.pq_ri, list[i]);
                }
            }
        };

        // 잘못 입력된 데이터 체크
        const inputErrorCheck = function (rowData) {
            let list = [];
            const singleList = ['PART_NUM']; // 단품
            // const assemblyList = ['MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY']; // 조립
            const modifiedList = ['PART_NUM']; // 수정
            // const stockList = ['PART_UNIT_QTY', 'ORDER_NUM', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'REGIST_NUM']; // 재고
            // const partList = ['ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT', 'REGIST_NUM']; // 파트

            switch (rowData.WORK_TYPE) {
                case 'WTP010':
                    list = singleList;
                    break;
                // case 'WTP020':
                //     list = assemblyList;
                //     break;
                case 'WTP030':
                    list = modifiedList;
                    break;
                // case 'WTP040':
                //     list = stockList;
                //     break;
                // case 'WTP050':
                //     list = partList;
                //     break;
            }

            for (let i in list) {
                if (list.hasOwnProperty(i)) {
                    if (rowData[list[i]] !== undefined && rowData[list[i]] != null && rowData[list[i]] !== '') {
                        addErrorList(rowData.pq_ri, list[i]);
                    }
                }
            }
        };
        const sideQtyCheck = function(rowData) {
            let tmpOther = (fnIsEmpty(rowData.CONTROL_OTHER_SIDE_QTY))?0:rowData.CONTROL_OTHER_SIDE_QTY;
            let tmpOrg = (fnIsEmpty(rowData.CONTROL_ORIGINAL_SIDE_QTY))?0:rowData.CONTROL_ORIGINAL_SIDE_QTY;
            let tmpOrd = (fnIsEmpty(rowData.CONTROL_ORDER_QTY))?0:rowData.CONTROL_ORDER_QTY;
            if(rowData.SAME_SIDE_YN == 'Y') {
                if(fnIsEmpty(rowData.CONTROL_ORIGINAL_SIDE_QTY) && fnIsEmpty(rowData.CONTROL_OTHER_SIDE_QTY)) {
                    addErrorList(rowData.pq_ri, 'CONTROL_ORIGINAL_SIDE_QTY');
                    addErrorList(rowData.pq_ri, 'CONTROL_OTHER_SIDE_QTY');
                }else if(Number(tmpOrd) !== (Number(tmpOrg) + Number(tmpOther))) {
                    addErrorList(rowData.pq_ri, 'CONTROL_ORIGINAL_SIDE_QTY');
                    addErrorList(rowData.pq_ri, 'CONTROL_OTHER_SIDE_QTY');
                }
            }else if(!fnIsEmpty(rowData.CONTROL_ORIGINAL_SIDE_QTY) || !fnIsEmpty(rowData.CONTROL_OTHER_SIDE_QTY)) {
                if(Number(rowData.CONTROL_ORDER_QTY) !== (Number(rowData.CONTROL_ORIGINAL_SIDE_QTY) + Number(rowData.CONTROL_OTHER_SIDE_QTY))) {
                    addErrorList(rowData.pq_ri, 'CONTROL_ORIGINAL_SIDE_QTY');
                    addErrorList(rowData.pq_ri, 'CONTROL_OTHER_SIDE_QTY');
                }
            }
        }
        const orderQtyCheck = function(dataList) {
            const groupedRegistNum = fnGroupBy(dataList, 'REGIST_NUM');
            $.each(groupedRegistNum, function (idx,Item) {
                if(idx !== 'undefined' && idx != 'null' && idx != '') {
                    let controlTotalQty = 0;
                    let idxArr = [];
                    $.each(Item, function (idx2,Item2) {
                        idxArr.push(Item2.pq_ri);
                        controlTotalQty += Item2.CONTROL_ORDER_QTY;
                    })
                    if(Item[0].ORDER_QTY < controlTotalQty) {
                        for(var i=0;i<idxArr.length;i++) {
                            addErrorList(idxArr[i], 'CONTROL_ORDER_QTY');
                        }
                    }
                }
            })
        }

        // error
        let errorList = [];
        let prevErrorList = [];
        const addErrorList = function (rowIndex, dataIndex) {
            let tempObject = {};
            tempObject.rowIndx = rowIndex;
            tempObject.dataIndx = dataIndex;
            errorList.push(tempObject);
            $createControlGrid.pqGrid('updateRow', {rowIndx: rowIndex, row: {'VALIDATION':'FAIL'}, checkEditable: false});
        };

        // cell 색 변경
        const changeCellColor = function (list, prevList) {
            for(let i in prevList) {
                if (prevList.hasOwnProperty(i)) {
                    $createControlGrid.pqGrid('removeClass', {rowIndx: prevList[i].rowIndx, dataIndx: prevList[i].dataIndx, cls: 'bg-lightcoral'} );
                }
            }

            if (list.length > 0) {
                for(let i in list) {
                    if (list.hasOwnProperty(i)) {
                        $createControlGrid.pqGrid('addClass', {rowIndx: list[i].rowIndx, dataIndx: list[i].dataIndx, cls: 'bg-lightcoral'} );
                    }
                }
            }
        };
        /* function */

        /** 도면 보기 팝업 호출 */
        $('#create_control_draw_detail').on('click', function () {
            // let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: selectedCreateControlRowIndex[0]});
            if(!noSelectedRowAlert()) {
                callWindowImageViewer($("#CREATE_CONTROL_SEARCH_FORM").find("#GFILE_SEQ").val());
            }
        });

        $("#SELECT_ALL").on('click',function () {
            selectedCreateControlRowIndex = [];
            let data = $createControlGrid.pqGrid('option', 'dataModel.data');
            const sr = $createControlGrid.pqGrid('SelectRow');
            let rowList = [];
            $.each(data, function (idx,Item) {
                if(fnIsEmpty(Item.CONTROL_SEQ)) {
                    rowList.push({rowIndx: Item.pq_ri});
                    selectedCreateControlRowIndex.push(Item.pq_ri);
                }
            })
            sr.removeAll();
            sr.add({rows:rowList});
        });

        $("#CLEAR_SELECT").on('click',function () {
            selectedCreateControlRowIndex = [];
            $createControlGrid.pqGrid('setSelection', null);
        });


        /* event */

        // 발주사
        (function () {
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getOrderCompanyList'}};

            fnPostAjax(function (data) {
                let comboData = [];

                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    comboData.push({title: obj.text, id: obj.value, value: obj.value});
                }

                $('#CREATE_CONTROL_SEARCH_FORM #ORDER_COMP_CD').comboTree({
                    source : comboData,
                    isMultiple: true,
                    cascadeSelect: false
                });
            }, parameters, '');
        })();
        // 사업자
        let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getBusinessCompanyList'}};

        fnPostAjax(function (data) {
            let comboData = [];

            for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                let obj = data.list[i];
                comboData.push({title: obj.text, id: obj.value});
            }

            $('#CREATE_CONTROL_SEARCH_FORM #COMP_CD').comboTree({
                source : comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        }, parameters, '');

        let comboData = [];
        <c:forEach var="vlocale" items="${HighCode.H_1091}">
        comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
        </c:forEach>

        $('#CREATE_CONTROL_SEARCH_FORM #ORDER_STATUS').comboTree({
            source: comboData,
            isMultiple: true,
            cascadeSelect: false
        });

        // 작업형태
        let comboData2 = [];

        <c:forEach var="vlocale" items="${HighCode.H_1033}">
        comboData2.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
        </c:forEach>

        $('#CREATE_CONTROL_SEARCH_FORM #WORK_TYPE').comboTree({
            source: comboData2,
            isMultiple: true,
            cascadeSelect: false
        });

        $('#createControlFilterKeyword').on({
            'keyup': function () {
                fnFilterHandler($createControlGrid, 'createControlFilterKeyword', 'createControlFilterCondition', 'createControlFilterColumn');
                autoMerge($createControlGrid.pqGrid('getInstance').grid, true);

                let data = $createControlGrid.pqGrid('option', 'dataModel.data');
                $('#ORDER_MANAGE_RECORDS').html(data.length);
            },
            'search': function () {
                fnFilterHandler($createControlGrid, 'createControlFilterKeyword', 'createControlFilterCondition', 'createControlFilterColumn');
                autoMerge($createControlGrid.pqGrid('getInstance').grid, true);

                let data = $createControlGrid.pqGrid('option', 'dataModel.data');
                $('#ORDER_MANAGE_RECORDS').html(data.length);
            }
        });

        $('#createControlFrozen').on('change', function(){
            fnFrozenHandler($createControlGrid, $(this).val());
        });

        $('#CREATE_CONTROL_START_DATE_BUTTON').on('click', function () {
            $('#CREATE_CONTROL_START_DATE').focus();
        });
        $('#CREATE_CONTROL_END_DATE_BUTTON').on('click', function () {
            $('#CREATE_CONTROL_END_DATE').focus();
        });

        $('#CREATE_CONTROL_SEARCH_CONDITION').on('change', function () {
            const $createControlDates = $('[id^=CREATE_CONTROL][id$=DATE]');
            $(this).val() === '' ? $createControlDates.prop('disabled', true) : $createControlDates.prop('disabled', false);
        });

        $('#toggleImageView').on('click', function () {
            isActiveDrawingView = !isActiveDrawingView;
            if(isActiveDrawingView) {
                // if(!$('#MAIN_COLUMN').prop('checked')) {
                //     $('#MAIN_COLUMN').trigger('click');
                // }
                var width = document.getElementsByClassName("pq-cont-right")[1].scrollWidth

                $("#main_column_draw_div").show();
                $createControlGrid.pqGrid('option', 'width', 'auto').pqGrid('refresh');
                setTimeout(function () {
                    $("#CREATE_CONTROL_GRID").find(".pq-body-outer").find(".pq-cont-right").scrollLeft(width);
                }, 300);
            }else {
                // if($('#MAIN_COLUMN').prop('checked')) {
                //     $('#MAIN_COLUMN').trigger('click');
                // }
                $("#main_column_draw_div").hide();
                $createControlGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
            }
            $createControlGrid.pqGrid('refreshView');
        });

        $('#INPUT_BATCH').on('click', function () {
            let data = $createControlGrid.pqGrid('option', 'dataModel.data');
            if($("#BATCH_CONTROL_NUM").val() != '' && $("#CONTROL_NUM_NUMBER").val() != '') {
                let mainControlNum = $("#BATCH_CONTROL_NUM").val();
                let num = Number($("#CONTROL_NUM_NUMBER").val());
                for(let i=0; i<data.length; i++){
                    let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: i});
                    let str = (i+1) + '';
                    let conNum = mainControlNum + str.padStart(num,'0');
                    $createControlGrid.pqGrid("updateRow", { 'rowIndx': i , row: { 'CONTROL_NUM': conNum } });
                }
            }
            if($("#DUE_DT_NUMBER").val() != '') {
                let dateCnt = Number($("#DUE_DT_NUMBER").val());
                for(let i=0; i<data.length; i++){
                    let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: i});
                    let date = new Date(rowData.ORDER_DUE_DT);
                    // let today = new Date();
                    // date.setFullYear(today.getFullYear())
                    date.setDate(date.getDate() - dateCnt);
                    let newData = {'INNER_DUE_DT':date.getFullYear()+"/"+("0" + (date.getMonth()+1)).substr(-2)+"/"+("0"+date.getDate()).substr(-2)};
                    $createControlGrid.pqGrid("updateRow", { 'rowIndx': i , row: newData });
                }
            }
            for(let i=0; i<data.length; i++){
                let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: i});
                let newData = {'CONTROL_ORDER_QTY':rowData.ORDER_QTY};
                if(rowData.ORIGINAL_SIDE_QTY > 0) {
                    newData.CONTROL_ORIGINAL_SIDE_QTY = rowData.ORIGINAL_SIDE_QTY;
                }
                if(rowData.OTHER_SIDE_QTY > 0) {
                    newData.CONTROL_OTHER_SIDE_QTY = rowData.OTHER_SIDE_QTY;
                }
                $createControlGrid.pqGrid("updateRow", { 'rowIndx': i , row: newData });
            }
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }

        $createControlGrid = $('#' + gridId).pqGrid(obj);

        $('#CREATE_CONTROL_REFRESH').on('click', function () {
            $createControlGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#CREATE_CONTROL_SEARCH_FORM'));
            });
            $createControlGrid.pqGrid('refreshDataAndView');
        });

        $('#ADD_ROW').on('click', function () {
            if(!noSelectedRowAlert()) {
                let totalRecords = $createControlGrid.pqGrid('option', 'dataModel.data').length;
                for(var i=0;i<selectedCreateControlRowIndex.length;i++) {
                    let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: selectedCreateControlRowIndex[i]});
                    let newRowData = fnCloneObj(rowData);
                    newRowData.ROW_NUM = totalRecords + 1;
                    newRowData.CONTROL_NUM = null;
                    newRowData.INNER_DUE_DT = null;
                    newRowData.PART_NUM = null;
                    newRowData.CONTROL_ORDER_QTY = null;
                    newRowData.CONTROL_ORIGINAL_SIDE_QTY = null;
                    newRowData.CONTROL_OTHER_SIDE_QTY = null;
                    newRowData.VALIDATION = null;
                    newRowData.ADD_ROW = true;

                    if(typeof rowData.CONTROL_SEQ != 'undefined') {
                        fnAlert(null, '이미 작업번호가 연계된 건 입니다.');
                        return false;
                    }

                    $createControlGrid.pqGrid('addRow', {
                        newRow: newRowData,
                        rowIndx: selectedCreateControlRowIndex[i] + 1,
                        checkEditable: false
                    });
                }
                let gridInstance = $createControlGrid.pqGrid('getInstance').grid;
                autoMerge(gridInstance,true);
            }
        });

        $('#RESET_GRID').on('click', function () {
            $createControlGrid.pqGrid('refreshDataAndView');
        });

        $('#VALIDATION_GRID').on('click', function () {
            if(!noSelectedRowAlert()) {
                $(".pq-loading").show();
                validationAndCreateControl('VALIDATION_GRID');
            }
        });

        $('#DELETE_ROW').on('click', function () {
            if(!noSelectedRowAlert()) {
                let data = $createControlGrid.pqGrid('option', 'dataModel.data');
                const groupedRegistNum = fnGroupBy(data, 'REGIST_NUM');
                let list = [];
                let tempList = [];

                for(var i=0;i<selectedCreateControlRowIndex.length;i++) {
                    let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: selectedCreateControlRowIndex[i]});

                    if(typeof rowData.ADD_ROW == 'undefined' && typeof rowData.CONTROL_SEQ == 'undefined') {
                        fnAlert(null, '새로 추가하거나, 작업이 생성된 건만 삭제가능합니다.');
                        return false;
                    }

                    if(typeof rowData.CONTROL_SEQ != 'undefined') {
                        list.push(rowData)
                    }else if(typeof rowData.ADD_ROW != 'undefined') {
                        tempList.push(rowData);
                    }
                    let message =
                        '<h4>\n' +
                        '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                        '    <span>' + (selectedCreateControlRowIndex.length) + ' 건이 삭제됩니다. 진행하시겠습니까?</span>\n' +
                        '</h4>';
                    fnConfirm(null, message, function () {

                        $createControlGrid.pqGrid('deleteRow', {rowList: tempList});//rowIndx

                        let parameters = {'url': '/removeControl', 'data': {data: JSON.stringify(list)}};
                        fnPostAjax(function () {
                            fnAlert(null, "<spring:message code='com.alert.default.remove.success' />");
                            $createControlGrid.pqGrid('refreshDataAndView');
                        }, parameters, '');
                    });
                }
            }
        });

        $('#CREATE_CONTROL').on('click', _.debounce(function () {
            let data = $createControlGrid.pqGrid('option', 'dataModel.data');
            if(!noSelectedRowAlert()) {
                let msg = '선택주문건수 : ' + selectedCreateControlRowIndex.length + ' 건<br>';
                msg += '작업지시 생성을 진행하시겠습니까?';

                fnConfirm(null, msg, function () {
                    $(".pq-loading").show();
                    $(".div_bg").show();
                    validationAndCreateControl('CREATE_CONTROL');
                    setTimeout(function () {
                        $(".div_bg").hide();
                    },500);
                })
            }
        },1000));

        const validationAndCreateControl = function(type) {
            prevErrorList = errorList;
            errorList = [];
            let data = $createControlGrid.pqGrid('option', 'dataModel.data');
            let dataList = [];
            $.each(data, function (idx,Item) {
               if(selectedCreateControlRowIndex.indexOf(Item.pq_ri) >= 0) {
                   dataList.push(Item);
               }
            });

            validationCheck(dataList);
            changeCellColor(errorList, prevErrorList);

            if (errorList.length) {
                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                $(".pq-loading").hide();
                return false;
            }
            let rowNumList = [];
            for(let i=0;i<selectedCreateControlRowIndex.length;i++) {
                let rowData = $createControlGrid.pqGrid('getRowData', {rowIndx: selectedCreateControlRowIndex[i]})
                rowNumList.push(rowData.ROW_NUM);
            }

            let gridInstance = $createControlGrid.pqGrid('getInstance').grid;
            let changes = gridInstance.getChanges({format: 'byVal'});
            // changes.updateList = changes.updateList.concat(changes.addList);

            let select = [];
            $.each(changes.updateList, function (idx,Item) {
                if(rowNumList.indexOf(Item.ROW_NUM) >= 0) {
                    select.push(Item);
                }
            })
            changes.updateList = select;

            let controlNumArr = [];
            for(var i=0;i<changes.updateList.length;i++) {
                controlNumArr.push(changes.updateList[i].CONTROL_NUM);
            }
            controlNumArr = [...new Set(controlNumArr)];

            changes.controlNumArr = controlNumArr;

            let parameters = {'url': '/validationCheckBeforeCreateControl', 'data': {data: JSON.stringify(changes)}};
            let flag = false;

            fnPostAjaxAsync(function (data) {
                let gridData = $createControlGrid.pqGrid('option', 'dataModel.data');
                flag = data.flag;

                $.each(data.resultList, function (idx,Item) {
                    $.each(gridData, function (idx2,Item2) {
                        if(Item.ROW_NUM == Item2.ROW_NUM) {
                            let updateRow = {
                                "VALIDATION": Item.VALIDATION_RESULT
                            };
                            if(typeof Item.MERGE_CONTROL_SEQ != 'undefined' && Item.MERGE_CONTROL_SEQ != null && Item.MERGE_CONTROL_SEQ != '') {
                                updateRow.MERGE_CONTROL_SEQ = Item.MERGE_CONTROL_SEQ
                            }
                            if(typeof Item.MERGE_CONTROL_DETAIL_SEQ != 'undefined' && Item.MERGE_CONTROL_DETAIL_SEQ != null && Item.MERGE_CONTROL_DETAIL_SEQ != '') {
                                updateRow.MERGE_CONTROL_DETAIL_SEQ = Item.MERGE_CONTROL_DETAIL_SEQ
                            }
                            $createControlGrid.pqGrid('updateRow', {rowIndx: Item2.pq_ri, row: updateRow, checkEditable: false});
                        }
                    })
                })
                if(type == 'CREATE_CONTROL') {
                    if(flag) {
                        fnAlert(null, "생성 불가한 작업지시건이 있습니다.");
                    }else {
                        let gridInstance2 = $createControlGrid.pqGrid('getInstance').grid;
                        let changes2 = gridInstance.getChanges({format: 'byVal'});

                        let select2 = [];
                        $.each(changes2.updateList, function (idx,Item) {
                            if(rowNumList.indexOf(Item.ROW_NUM) >= 0) {
                                select2.push(Item);
                            }
                        })
                        changes2.updateList = select2;

                        parameters = {'url': '/createNewControl', 'data': {data: JSON.stringify(changes2)}};

                        fnPostAjaxAsync(function (data) {
                            if(!data.flag) {
                                fnAlert(null, '작업지시가 생성되었습니다.');
                                // $("#CREATE_CONTROL_REFRESH").trigger('click');
                                setTimeout(function () {
                                    const parentWindow = window.opener;
                                    let parentGridSearchButton = $(parentWindow.document).find('#CONTROL_MANAGE_SEARCH');
                                    parentGridSearchButton.click();
                                    window.close();
                                },500);
                            }else {
                                fnAlert(null, data.message);
                            }
                        }, parameters, '');
                    }
                }
                $(".pq-loading").hide();
            }, parameters, '');
        }


        $('#MAIN_COLUMN').on('change', function () {
            if($(this).prop('checked')) {
                changeViewColumn('MAIN')
            }else {
                changeViewColumn('ALL');
            }
            $createControlGrid.pqGrid('refreshView');
        });

        $('#create_control_close').on('click', function () {
            const parentWindow = window.opener;
            let parentGridSearchButton = $(parentWindow.document).find('#CONTROL_MANAGE_SEARCH');
            parentGridSearchButton.click();
            window.close();
        });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>