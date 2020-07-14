<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-29
  Time: 오전 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page mct">
    <div class="topWrap">
        <form id="MCT_PLAN_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectEquipId">
            <div class="hWrap">
                <h2 style="height: 42px; line-height: 42px;">MCT 가공 계획 현황</h2>
                <span class="slt_wrap namePlusSlt mg-left20">
                        <label for="FACTORY_AREA">MCT 센터</label>
                        <select name="FACTORY_AREA" id="FACTORY_AREA">
                        <c:forEach var="code" items="${HighCode.H_1005}">
                            <c:if test="${code.ETC1 == 'MCT_PROCESS_PLAN'}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:if>
                        </c:forEach>
                        </select>
                </span>
                <span class="refresh mg-left10"><button type="button" id="MCT_PLAN_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
                <span class="buttonWrap" style="padding: 8px 0px 0px 0px;">
                    <button type="button" class="defaultBtn black" id="MCT_PLAN_MANAGE_DRAWING_VIEW">도면보기</button>
                    <!-- <button type="button" class="defaultBtn sky">레이아웃관리</button> -->
                </span>
            </div>
        </form>
        <div class="conWrap">
            <div class="tableWrap">
                <ul>
                    <li id="layout_1_1" style="min-width: 500px;"></li>
                    <li id="layout_1_2" style="min-width: 500px;"></li>
                    <li id="layout_1_3" style="min-width: 500px;"></li>
                    <li id="layout_1_4" style="min-width: 500px;"></li>
                    <li id="layout_1_5" style="min-width: 500px;"></li>
                    <li id="layout_1_6" style="min-width: 500px;"></li>
                </ul>
                <ul>
                    <li id="layout_2_1" style="min-width: 500px;"></li>
                    <li id="layout_2_2" style="min-width: 500px;"></li>
                    <li id="layout_2_3" style="min-width: 500px;"></li>
                    <li id="layout_2_4" style="min-width: 500px;"></li>
                    <li id="layout_2_5" style="min-width: 500px;"></li>
                    <li id="layout_2_6" style="min-width: 500px;"></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="bottomWrap">
        <div class="hWrap" style="padding: 0px;">
            <h2 style="height: 42px; line-height: 42px;">가공 대상 List</h2>
            <form id="MCT_PROCESS_TARGET_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="machine.selectWorkPlanGridList">
                <span class="slt_wrap mg-left20">
                    <label class="label_50" for="FACTORY_CLASSIFY">공장구분</label>
                    <select class="wd_70" name="FACTORY_CLASSIFY" id="FACTORY_CLASSIFY" title="공장구분">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1014}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="POP_POSITION">위치</label>
                    <select class="wd_100" id="POP_POSITION" name="POP_POSITION" title="위치">
                        <option value="">ALL</option>
                        <c:forEach var="code" items="${HighCode.H_1009}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MATERIAL_DETAIL">소재분류</label>
                    <select class="wd_100" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" title="소재분류">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1027}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="PART_STATUS">진행상태</label>
                    <select class="wd_100" name="PART_STATUS" id="PART_STATUS" title="진행상태">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1013}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="EQUIP_SEQ">MCT No.</label>
                    <select class="wd_100" name="EQUIP_SEQ" id="EQUIP_SEQ" title="MCT No.">
                        <option value="">ALL</option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MCT_WORK_TYPE">작업구분</label>
                    <select class="wd_50" name="MCT_WORK_TYPE" id="MCT_WORK_TYPE" title="작업구분">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1011}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <input type="checkbox" name="PLAN_ONLY" id="PLAN_ONLY">
                    <label class="label_100" for="PLAN_ONLY">계획단계 대상만 조회</label>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <input type="checkbox" name="INCLUDE_OUTSIDE" id="INCLUDE_OUTSIDE">
                    <label class="label_100" for="INCLUDE_OUTSIDE">외주 대상 포함 조회</label>
                </span>
                <span class="gubun"></span>
                <span class="refresh mg-left10"><button type="button" id="MCT_TARGET_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
            </form>
            <div style="display:flow-root; margin: 0 20px 10px 20px;">
<%--                <input type="text" id="mctPlanManageFilterKeyword" placeholder="Enter your keyword">--%>
<%--                <select id="mctPlanManageFilterColumn"></select>--%>
<%--                <select id="mctPlanManageFilterCondition">--%>
<%--                    <c:forEach var="code" items="${HighCode.H_1083}">--%>
<%--                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--                <label for="mctPlanManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>--%>
<%--                <select id="mctPlanManageFrozen" name="mctPlanManageFrozen">--%>
<%--                </select>--%>
                <button type="button" class="right_float defaultBtn btn-100w green" id="MCT_TARGET_SAVE">저장</button>
            </div>
        </div>
        <div class="conWrap">
            <div class="tableWrap" style="background: #e1e1e1;">
                <div id="PROCESS_TARGET_GRID"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        const TWENTY_SECONDS = 20000;
        const NC_MACHINE = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'machine.selectNCMachineList'}
        });
        let selectedGrid = '';
        let selectedRowIndex = '';
        const insertQueryList = ['machine.insertMctPlan'];
        const updateQueryList = ['machine.updateMctPlan'];
        const deleteQueryList = ['machine.deleteMctPlan'];
        let $processPlanGrid1, $processPlanGrid2, $processPlanGrid3, $processPlanGrid4, $processPlanGrid5, $processPlanGrid6, $processPlanGrid7, $processPlanGrid8, $processPlanGrid9, $processPlanGrid10, $processPlanGrid11;
        const processPlanGrid1Id = 'PROCESS_PLAN_GRID1';
        const processPlanGrid2Id = 'PROCESS_PLAN_GRID2';
        const processPlanGrid3Id = 'PROCESS_PLAN_GRID3';
        const processPlanGrid4Id = 'PROCESS_PLAN_GRID4';
        const processPlanGrid5Id = 'PROCESS_PLAN_GRID5';
        const processPlanGrid6Id = 'PROCESS_PLAN_GRID6';
        const processPlanGrid7Id = 'PROCESS_PLAN_GRID7';
        const processPlanGrid8Id = 'PROCESS_PLAN_GRID8';
        const processPlanGrid9Id = 'PROCESS_PLAN_GRID9';
        const processPlanGrid10Id = 'PROCESS_PLAN_GRID10';
        const processPlanGrid11Id = 'PROCESS_PLAN_GRID11';

        let postData = fnFormToJsonArrayData('#MCT_PLAN_MANAGE_SEARCH_FORM');
        let parameters = {'url': '/json-list', 'data': postData};

        const createdynamicForm = function (row, col, order, equipSeq, equipNm) {
            let str = '';

            str += '<form id="MCT_NC' + order + '_PLAN_FORM" role="form">';
            str += '    <input type="hidden" name="queryId" id="queryId" value="machine.selectProcessPlanGridList">';
            str += '    <input type="hidden" name="EQUIP_SEQ" id="EQUIP_SEQ" value="' + equipSeq + '">';
            str += '    <div class="table">';
            str += '        <div class="titleWrap">';
            str += '            <span class="equipLabel">';
            str += '                <span>' + equipNm + '</span>';
            str += '                <span id="NC' + order + '_WORK_USER_ID"></span>';
            str += '            </span>';
            str += '            <p class="listTxt" style="display: none;">';
            str += '                <span id="NC' + order + '_CONTRO_NUM"></span>';
            str += '                <span id="NC' + order + '_MATERIAL_TYPE"></span>';
            str += '                <span id="NC' + order + '_PART_UNIT_QTY"></span>';
            str += '            </p>';
            str += '        </div>';
            str += '        <div class="listWrap">';
            str += '            <div class="miniLeft"><span>대기목록</span></div>';
            str += '            <div class="miniRight">';
            str += '                <div class="scrollWrap">';
            str += '                    <div id="PROCESS_PLAN_GRID' + order + '"></div>';
            str += '                </div>';
            str += '                <div class="footerWrap">';
            str += '                    <span>Total: <span id="NC' + order + '_TOTAL_RECORDS">0</span>rows <span id="NC' + order + '_TOTAL_WORKING_TIME">0</span>min</span>';
            str += '                </div>';
            str += '            </div>';
            str += '        </div>';
            str += '    </div>';
            str += '</form>';

            try {
                $('#layout_' + row + '_' + col)[0].innerHTML = str;
            } catch (e) {
                console.log(e);
            }
        };

        fnPostAjaxAsync(function (data) {
            for (let i = 0, listLength = data.list.length; i < listLength; i++) {
                let thisParameter = data.list[i];
                let row = thisParameter.LAYOUT_ROW;
                let col = thisParameter.LAYOUT_COL;
                let equipSeq = thisParameter.EQUIP_SEQ;
                let equipNm = thisParameter.EQUIP_NM;
                // $('#MCT_NC' + (i + 1) + '_PLAN_FORM > #EQUIP_SEQ').val(data.list[i].EQUIP_SEQ);
                createdynamicForm(row, col, i + 1, equipSeq, equipNm);
            }
        }, parameters, '');

        const EQUIP_LIST = (function () {
            let list = [];
            let parameters = ({'url':'/json-list', 'data': {'queryId': 'dataSource.getEquipList'}});

            fnPostAjax(function (data, callFunctionParam) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let thisParameter = data.list[i];

                    list.push({'value': thisParameter.CODE_CD, 'text': thisParameter.CODE_NM});
                }
            }, parameters, '');
            return list;
        })();

        let processPlanPostData1 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC1_PLAN_FORM')}};
        let processPlanPostData2 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC2_PLAN_FORM')}};
        let processPlanPostData3 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC3_PLAN_FORM')}};
        let processPlanPostData4 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC4_PLAN_FORM')}};
        let processPlanPostData5 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC5_PLAN_FORM')}};
        let processPlanPostData6 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC6_PLAN_FORM')}};
        let processPlanPostData7 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC7_PLAN_FORM')}};
        let processPlanPostData8 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC8_PLAN_FORM')}};
        let processPlanPostData9 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC9_PLAN_FORM')}};
        let processPlanPostData10 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC10_PLAN_FORM')}};
        let processPlanPostData11 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC11_PLAN_FORM')}};

        const processPlanColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: 'EQUIP_SEQ', dataType: 'string', dataIndx: 'EQUIP_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT_PLAN_SEQ', dataType: 'integer', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
            // {title: 'WORK_USER_ID', dataType: 'string', dataIndx: 'WORK_USER_ID', hidden: true},
            // {title: 'WORK_STATUS', dataType: 'string', dataIndx: 'WORK_STATUS', hidden: true},
            {title: 'SORT_NUM', dataType: 'integer', dataIndx: 'SORT_NUM', hidden: true},
            {title: '납기', width: 150, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '관리번호', minWidht: 300, width: 300, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '수량', dataType: 'string', dataIndx: 'CONTROL_PART_QTY'},
            {title: '재질', width: 70, dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', width: 70, dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM_SUBSTR'},
            {title: '규격', width: 50, dataType: 'string', dataIndx: 'SIZE_TXT'},
            {title: '예상', dataType: 'string', dataIndx: 'WORKING_TIME'},
            {
                title: '', dataType: 'string', dataIndx: 'DELETE_BUTTON', editable: false,
                render: function (ui) {
                    return '<span class="ui-icon ui-icon-circle-minus" name="MCT_PLAN_DELETE_BUTTON" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('[name=MCT_PLAN_DELETE_BUTTON]').on('click', function () {
                        let elementId = grid.element[0].id;

                        $('#' + elementId).pqGrid('deleteRow', {rowIndx: rowIndx});
                    });
                }
            },
        ];

        const planObj = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1,
            resizable: false,
            showHeader: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            editable: true,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center'},
            colModel: processPlanColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                },
            },
            dragModel: {
                on: true,
                diHelper: ['CONTROL_NUM'],
            },
            dropModel: {
                on: true,
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');
                let equipSeq = tableElement.closest('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_SEQ').val();
                let parameters = {'url': '/json-list', 'data': {'queryId': 'machine.selectProcessPlanGridInfo', 'EQUIP_SEQ': equipSeq}};

                fnPostAjax(function (data, callFunctionParam) {
                    if (data.list.length > 0) {
                        let rowData = data.list[0];
                        changeTitleColor(data.list[0].EQUIP_STATUS, tableElement);
                        showTitle(rowData, tableElement);
                    } else {
                        changeTitleColor(null, tableElement);
                        showTitle(null, tableElement);
                    }
                }, parameters, '');

                changeFooter(data, tableElement);
            },
            rowSelect: function (event, ui) {
                selectedGrid = $(this.element.context);
                selectedRowIndex = ui.addList[0].rowIndx;
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
                modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                gridChange(this, ui);
                setTimeout(function () {
                    refreshTargetGrid();
                }, 1000);
            },
        };
        const processPlanObj1 = $.extend(true, {}, planObj, processPlanPostData1);
        const processPlanObj2 = $.extend(true, {}, planObj, processPlanPostData2);
        const processPlanObj3 = $.extend(true, {}, planObj, processPlanPostData3);
        const processPlanObj4 = $.extend(true, {}, planObj, processPlanPostData4);
        const processPlanObj5 = $.extend(true, {}, planObj, processPlanPostData5);
        const processPlanObj6 = $.extend(true, {}, planObj, processPlanPostData6);
        const processPlanObj7 = $.extend(true, {}, planObj, processPlanPostData7);
        const processPlanObj8 = $.extend(true, {}, planObj, processPlanPostData8);
        const processPlanObj9 = $.extend(true, {}, planObj, processPlanPostData9);
        const processPlanObj10 = $.extend(true, {}, planObj, processPlanPostData10);
        const processPlanObj11 = $.extend(true, {}, planObj, processPlanPostData11);

        let $processTargetGrid;
        const processTargetGridId = 'PROCESS_TARGET_GRID';
        let processTargetGridPostData = fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM');
        const processTargetGridColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: '납기', minWidth: 50, width: 50, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', minWidth: 20, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', minWidth: 20, width: 20, dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형<br>태', minWidth: 20, width: 20, dataType: 'string', dataIndx: 'WORK_NM'},
            {title: 'NC Plan', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                colModel: [
                    {title: 'MCT_PLAN_SEQ', dataType: 'string', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
                    {title: 'NC No.', minWidth: 40, width: 60, datatype: 'string', dataIndx: 'EQUIP_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: NC_MACHINE},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let index = NC_MACHINE.findIndex(function (element) {
                                    return element.text === Number(cellData);
                                });

                                if (index < 0) {
                                    index = NC_MACHINE.findIndex(function (element) {
                                        return element.value === Number(cellData);
                                    });
                                }

                                return (index < 0) ? cellData : NC_MACHINE[index].text;
                            }
                        }
                    },
                    {title: 'W/T', minWidth: 40, width: 40, datatype: 'integer', dataIndx: 'WORKING_TIME', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
                ]
            },
            {title: 'MCT Actual', align: 'center',
                colModel: [
                    {title: '1', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'EQUIP_NM_1'},
                    {title: 'R/T', minWidth: 15, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORKING_TIME_1'},
                    {title: '2', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'EQUIP_NM_2'},
                    {title: 'R/T', minWidth: 15, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORKING_TIME_2'},
                    {title: '3', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'EQUIP_NM_3'},
                    {title: 'R/T', minWidth: 15, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORKING_TIME_3'},
                    {title: '4', minWidth: 15, width: 40, datatype: 'string', dataIndx: 'EQUIP_NM_4'},
                    {title: 'R/T', minWidth: 15, width: 40, datatype: 'integer', align: 'right', dataIndx: 'WORKING_TIME_4'},
                ]
            },
            {title: '총 가공<br>시간(분)', dataType: 'integer', align: 'right', dataIndx: 'MCT_WORK_TIME'},
            {title: '현재위치', minWidth: 40, width: 100, dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '진행상태', minWidth: 40, width: 100, dataType: 'string', dataIndx: 'PART_STATUS'},
            {title: '가공진행 현황', align: 'center',
                colModel: [
                    {title: 'NC', datatype: 'integer', align: 'right', dataIndx: 'PROCESS_PROGRESS_NC'},
                    {title: '밀링', datatype: 'integer', align: 'right', dataIndx: 'PROCESS_PROGRESS_MILLING'},
                    {title: '선반', datatype: 'integer', align: 'right', dataIndx: 'PROCESS_PROGRESS_RACK'},
                    {title: '연마', datatype: 'integer', align: 'right', dataIndx: 'PROCESS_PROGRESS_GRINDING'},
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
            {title: '관리번호', width: 120, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '소재종류<br>상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let materialDetail = fnGetCommCodeGridSelectBox('1027');
                        let index = materialDetail.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialDetail.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }

                        return (index < 0) ? cellData : materialDetail[index].text;
                    }
                }
            },
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '규격', width: 100, dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', width: 100, dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {title: '비고<br>기록사항', minWidth: 20, width: 100, dataType: 'string', dataIndx: 'NOTE'},
            {title: '가공계획<br>비고', minWidth: 20, width: 150, dataType: 'string', dataIndx: 'MCT_NOTE',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '작업구분', dataType: 'string', dataIndx: 'MCT_WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1011')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let mctWorkType = fnGetCommCodeGridSelectBox('1011');
                        let index = mctWorkType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = mctWorkType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : mctWorkType[index].text;
                    }
                }
            },
            // {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
            //     editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1033')},
            //     render: function (ui) {
            //         let cellData = ui.cellData;
            //
            //         if (cellData === '' || cellData === undefined) {
            //             return '';
            //         } else {
            //             let workType = fnGetCommCodeGridSelectBox('1033');
            //             let index = workType.findIndex(function (element) {
            //                 return element.text === cellData;
            //             });
            //
            //             if (index < 0) {
            //                 index = workType.findIndex(function (element) {
            //                     return element.value === cellData;
            //                 });
            //
            //             }
            //             return (index < 0) ? cellData : workType[index].text;
            //         }
            //     }
            // },
            {title: '이전위치', dataType: 'string', minWidth: 40, width: 100, dataIndx: 'POP_PREV_POSITION'},
            {
                title: '과거 경험', align: 'center', colModel: [
                    {title: '단위<br>소요', dataType: 'string', minWidth: 40, width: 100, dataIndx: 'LAST_UNIT_LEAD_TIME'},
                    {title: '실행일자', dataType: 'string', minWidth: 40, width: 100, dataIndx: 'LAST_MCT_START_DT'},
                    {title: '작업자', dataType: 'string', minWidth: 40, width: 100, dataIndx: 'LAST_MCT_WORK_USER'}
                ]
            },
            {title: '확정<br>일시', minWidth: 40, width: 50, dataType: 'string', dataIndx: 'CONTROL_STATUS_DT'},
            {title: '소재<br>입고일시', minWidth: 40, width: 50, dataType: 'string', dataIndx: 'MATERIAL_RECEIPT_DT'}
        ];
        const processTargetGridObj = {
            height: '100%',
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            selectionModel: {type: 'row', mode: 'single'},
            // scrollModel: {autoFit: true},
            editModel: {clicksToEdit: 1},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center'},
            filterModel: {mode: 'OR'},
            colModel: processTargetGridColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processTargetGridPostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                diHelper: ['CONTROL_NUM'],
                beforeDrop: function () {
                }
            },
            load: function (event, ui) {
                let filterOpts = '<option value=\"\">All Fields</option>';
                let frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function (column) {
                    let hiddenYn = column.hidden === undefined ? true : false;
                    if (hiddenYn && column.title) {
                        filterOpts += '<option value="' + column.dataIndx + '">' + column.title + '</option>';
                        frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
                    }
                });
                $("#mctPlanManageFilterColumn").empty();
                $("#mctPlanManageFilterColumn").html(filterOpts);
                $("#mctPlanManageFrozen").empty();
                $("#mctPlanManageFrozen").html(frozenOts);
            },
            // complete: function () {
            //     // this.flex();
            // },
            rowSelect: function (event, ui) {
                selectedGrid = $(this.element.context);
                selectedRowIndex = ui.addList[0].rowIndx;
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processTargetGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                } else {
                    fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget', 'machine.insertMctPlan']);
                    setTimeout(function () {
                        refreshMctPlanGrids();
                    }, 1000);
                }
            }
        };

        /* function */
        /*function mctPlanManageFilterRender(ui) {
            let val = ui.column.formatVal === undefined ? '' : ui.column.formatVal,
                filter = ui.column.filter,
                crules = (filter || {}).crules;

            if (val === '') {
                val = ui.cellData === undefined ? '' : ui.cellData;
            }

            // console.log(ui);
            if (filter && filter.on && crules && crules[0].value) {
                let condition = $('#mctPlanManageFilterCondition :selected').val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $('#mctPlanManageFilterKeyword').val(),
                    txtUpper = (txt === null) ? '' : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition === 'end') {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
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
                if (indx >= 0) {
                    let txt1 = val.toString().substring(0, indx);
                    let txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    let txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + '<span style="background:yellow;color:#333;">' + txt2 + '</span>' + txt3;
                } else {
                    return val;
                }
            } else {
                return val;
            }
        }*/

        const modifyPQGrid = function (grid, insertQueryList, updateQueryList, deleteQueryList) {
            let parameters;
            let gridInstance = grid.pqGrid('getInstance').grid;
            //추가 또는 수정된 값이 있으면 true
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let QUERY_ID_ARRAY = {
                    'insertQueryId': insertQueryList,
                    'updateQueryId': updateQueryList,
                    'deleteQueryId': deleteQueryList
                };
                changes.queryIdList = QUERY_ID_ARRAY;
                parameters = {'url': '/paramQueryCRUDGrid', 'data': {data: JSON.stringify(changes)}};
                fnPostAjax(function (data, callFunctionParam) {
                    grid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        };

        const refreshMctPlanGrids = function () {
            $processPlanGrid1.pqGrid('refreshDataAndView');
            $processPlanGrid2.pqGrid('refreshDataAndView');
            $processPlanGrid3.pqGrid('refreshDataAndView');
            $processPlanGrid4.pqGrid('refreshDataAndView');
            $processPlanGrid5.pqGrid('refreshDataAndView');
            $processPlanGrid6.pqGrid('refreshDataAndView');
            $processPlanGrid7.pqGrid('refreshDataAndView');
            $processPlanGrid8.pqGrid('refreshDataAndView');
            $processPlanGrid9.pqGrid('refreshDataAndView');
            $processPlanGrid10.pqGrid('refreshDataAndView');
            $processPlanGrid11.pqGrid('refreshDataAndView');
        };

        const refreshTargetGrid = function () {
            $processTargetGrid.pqGrid('refreshDataAndView');
        };

        const resetEquipId = function () {
            $('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_SEQ').val('');
        };

        const hideGrid = function () {
            $('[id^=MCT_NC][id$=PLAN_FORM]').hide();
        };
        const showGrid = function () {
            let postData = fnFormToJsonArrayData('#MCT_PLAN_MANAGE_SEARCH_FORM');
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                for (let i = 0, listLength = data.list.length; i < listLength; i++) {
                    $('#MCT_NC' + (i + 1) + '_PLAN_FORM').show();
                    $('#MCT_NC' + (i + 1) + '_PLAN_FORM > #EQUIP_SEQ').val(data.list[i].EQUIP_SEQ);
                    $('#MCT_NC' + (i + 1) + '_PLAN_FORM > #EQUIP_SEQ').val(data.list[i].EQUIP_SEQ);
                }
            }, parameters, '');
        };

        const resetGrid = function () {
            resetEquipId();
            hideGrid();
        };

        const changePostData = function () {
            $('[id^=MCT_NC][id$=PLAN_FORM]').each(function () {
                let formId = $(this).attr('id');

                $(this).find('[id^=PROCESS_PLAN_GRID]').pqGrid('option', 'dataModel.postData', function (ui) {
                    return (fnFormToJsonArrayData('#' + formId));
                });
            });
        };

        const changeMctPlanFromTarget = function (ui) {
            if (ui.dataIndx.includes('WORKING_TIME')) {
                let order = ui.dataIndx.slice(-1);
                let mctPlanSeqStr = 'MCT_PLAN_SEQ_' + order;
                let mctPlanSeq = ui.rowData[mctPlanSeqStr];
                let parameters;
                let gridInstance = $processTargetGrid.pqGrid('getInstance').grid;
                //추가 또는 수정된 값이 있으면 true
                if (gridInstance.isDirty()) {
                    let changes = gridInstance.getChanges({format: 'byVal'});
                    let QUERY_ID_ARRAY = {
                        'insertQueryId': [],
                        'updateQueryId': ['machine.updateMctPlanFromTarget']
                    };
                    changes.queryIdList = QUERY_ID_ARRAY;
                    changes.updateList[0].MCT_PLAN_SEQ = mctPlanSeq;
                    changes.updateList[0].WORKING_TIME = parseInt(ui.value);
                    parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
                    fnPostAjax(function (data, callFunctionParam) {
                        $processTargetGrid.pqGrid('refreshDataAndView');
                    }, parameters, '');
                }
                return false;
            }
        };

        /**
         * @description
         * @param {object | jQuery} grid
         */
        const changeSortNum = function (thisObject, grid) {
            let rowListConvert = [];
            let ids = thisObject.pageData().map(function (rd) {
                return rd.MCT_PLAN_SEQ;
            });

            for (let i = 0, length = ids.length; i < length; i++) {
                let tempObject = {rowIndx: i, newRow: {'SORT_NUM': (i + 1)}};
                rowListConvert.push(tempObject);
            }
            grid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});
        };

        const colorClassification = function (status) {
            let backgroundColor = '';
            switch (status) {
                // 가동중
                case 'PRO007':
                    backgroundColor = 'bg-green';
                    break;
                // 완료
                case 'PRO008':
                    backgroundColor = 'bg-skyblue';
                    break;
                // 비가동상태
                case '비가동상태':
                    backgroundColor = 'bg-yellow';
                    break;
                // 일시정지상태
                case '일시정지상태':
                    backgroundColor = 'bg-orange';
                    break;
            }

            return backgroundColor;
        };

        const showTitle = function (data, tableElement) {
            let controlNumElement = $(tableElement).find('.data_ipt');
            let listTxtElement = $(tableElement).find('.listTxt');

            if(data === null) {
                controlNumElement.hide();
                listTxtElement.hide();
            } else {
                let materialTypeElement = listTxtElement.children('[id$=MATERIAL_TYPE]');
                let partUnitQtyElement = listTxtElement.children('[id$=PART_UNIT_QTY]');
                let workUserIdElement = listTxtElement.children('[id$=WORK_USER_ID]');

                controlNumElement.html(data.CONTROL_NUM);
                materialTypeElement.html(data.MATERIAL_TYPE_NM_SUBSTR);
                partUnitQtyElement.html(data.CONTROL_PART_QTY);
                workUserIdElement.html(data.WORK_USER_NM);

                controlNumElement.show();
                listTxtElement.show();
            }
        };

        const changeTitleColor = function (equipStatus, tableElement) {
            let equipLabelElement = $(tableElement).find('.equipLabel');
            let labelColorId = 'bg-yellow';
            //TODO: default 색상 및 상태 필요
            switch (equipStatus) {
                case '진행중':
                    labelColorId = 'bg-green';
                    break;
                case '완료':
                    labelColorId = 'bg-skyblue';
                    break;
                case '취소':
                    labelColorId = 'bg-yellow';
                    break;
                case '임시중지':
                    labelColorId = 'bg-orange';
                    break;
            }
            equipLabelElement.removeClass();
            equipLabelElement.addClass('equipLabel');
            equipLabelElement.addClass(labelColorId);
        };

        const changeFooter = function (data, tableElement) {
            // let totalPartUnitQuantity = 0;
            let totalWorkingTime = 0;
            let totalRecords = data.length;
            let totalRecordsElement = $(tableElement).find('[id$=TOTAL_RECORDS]');
            // let totalPartUnitQuantityElement = $(tableElement).find('[id$=TOTAL_PART_UNIT_QUANTITY]');
            let totalWorkingTimeElement = $(tableElement).find('[id$=TOTAL_WORKING_TIME]');

            for (let i = 0; i < totalRecords; i++) {
                // totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
            }

            totalRecordsElement.html(totalRecords);
            // totalPartUnitQuantityElement.html(totalPartUnitQuantity);
            totalWorkingTimeElement.html(totalWorkingTime);
        };

        const gridChange = function (thisObject, ui) {
            if(ui.source === 'addNodes') {
                let $grid = $(thisObject.element.context);
                let ROWNUM = $grid.pqGrid('option', 'dataModel.data').length;
                let equipSeq = $grid.closest('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_SEQ').val();
                ui.addList[0].newRow.EQUIP_SEQ = equipSeq;
                ui.addList[0].newRow.ROWNUM = ROWNUM;
                // changeSortNum(thisObject, $grid);
                modifyPQGrid($(thisObject.element.context), insertQueryList, [], []);
            } else if (ui.source === 'edit' || ui.source === 'update') {
                modifyPQGrid($(thisObject.element.context), [], updateQueryList, []);
            } else if (ui.source === 'delete') {
                modifyPQGrid($(thisObject.element.context), [], [], deleteQueryList);
                changeSortNum(thisObject, $(thisObject.element.context));
            }
        };
        /* function */

        /* event */
        $('#MCT_PLAN_MANAGE_SEARCH_FORM').on('change', function () {
            resetGrid();
            showGrid();
            changePostData();
            refreshMctPlanGrids();
        });

        $('#MCT_PLAN_REFRESH').on('click', function () {
            refreshMctPlanGrids();
        });
        
        $('#MCT_TARGET_REFRESH').on('click', function () {
            refreshTargetGrid();
        });

        $('#MCT_PLAN_MANAGE_DRAWING_VIEW').on('click', function () {
            let rowData = selectedGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex});
            callWindowImageViewer(rowData.IMG_GFILE_SEQ);
        });

        $('#MCT_PROCESS_TARGET_FORM').on('change', function () {
            $processTargetGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM'));
            });
            $processTargetGrid.pqGrid('refreshDataAndView');
        });
        /* event */

        /* init */
        $processPlanGrid1 = $('#' + processPlanGrid1Id).pqGrid(processPlanObj1);
        $processPlanGrid2 = $('#' + processPlanGrid2Id).pqGrid(processPlanObj2);
        $processPlanGrid3 = $('#' + processPlanGrid3Id).pqGrid(processPlanObj3);
        $processPlanGrid4 = $('#' + processPlanGrid4Id).pqGrid(processPlanObj4);
        $processPlanGrid5 = $('#' + processPlanGrid5Id).pqGrid(processPlanObj5);
        $processPlanGrid6 = $('#' + processPlanGrid6Id).pqGrid(processPlanObj6);
        $processPlanGrid7 = $('#' + processPlanGrid7Id).pqGrid(processPlanObj7);
        $processPlanGrid8 = $('#' + processPlanGrid8Id).pqGrid(processPlanObj8);
        $processPlanGrid9 = $('#' + processPlanGrid9Id).pqGrid(processPlanObj9);
        $processPlanGrid10 = $('#' + processPlanGrid10Id).pqGrid(processPlanObj10);
        $processPlanGrid11 = $('#' + processPlanGrid11Id).pqGrid(processPlanObj11);
        $processTargetGrid = $('#' + processTargetGridId).pqGrid(processTargetGridObj);

        fnCommCodeDatasourceSelectBoxCreate($('#MCT_PROCESS_TARGET_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'machine.selectNCMachineList'}
        });

        $('#MCT_TARGET_SAVE').on('click', function () {
            console.count();
            fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget', 'machine.insertMctPlan']);
            setTimeout(function () {
                refreshMctPlanGrids();
            }, 1000);
        });

        /*$('#mctPlanManageFilterKeyword').on('keyup', function(e){
            fnFilterHandler($processTargetGrid, 'mctPlanManageFilterKeyword', 'mctPlanManageFilterCondition', 'mctPlanManageFilterColumn');
        });*/

        /*$('#mctPlanManageFrozen').on('change', function(e){
             fnFrozenHandler($processTargetGrid, $(this).val());
         });*/

        /*setInterval(function () {
            refreshMctPlanGrids();
            refreshTargetGrid();
        }, TWENTY_SECONDS);*/
        /* init */
    });
</script>
