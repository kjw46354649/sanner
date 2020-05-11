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
    <div id="ahah_test"></div>
    <div class="topWrap">
        <form id="MCT_PLAN_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectEquipId">
            <div class="hWrap">
                <h2>MCT 가공 계획 현황</h2>
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
                <span class="buttonWrap">
                                    <button type="button" class="defaultBtn black">도면보기</button>
                                    <button type="button" class="defaultBtn sky">레이아웃관리</button>
                                </span>
            </div>
        </form>
        <div class="conWrap">
            <div class="tableWrap">
                <ul>
                    <li id="layout_1_1">

                    </li>
                    <li id="layout_1_2">

                    </li>
                    <li id="layout_1_3">

                    </li>
                    <li id="layout_1_4">

                    </li>
                </ul>
                <ul>
                    <li id="layout_2_1">

                    </li>
                    <li id="layout_2_2">

                    </li>
                    <li id="layout_2_3">
                    </li>
                    <li id="layout_2_4">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="bottomWrap">
        <form id="MCT_PROCESS_TARGET_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectProcessTargetList">
            <div class="hWrap">
                <h2>가공 대상 List</h2>
                <span class="slt_wrap mg-left20">
                    <label class="label_50" for="FACTORY_CLASSIFY">공장구분</label>
                    <select class="wd_100" name="FACTORY_CLASSIFY" id="FACTORY_CLASSIFY" title="공장구분">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1014}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="LOCATION">위치</label>
                    <select class="wd_100" id="LOCATION" name="LOCATION" title="위치">
                        <option value="">ALL</option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MATERIAL_CLASSIFY">소재분류</label>
                    <select class="wd_100" name="MATERIAL_CLASSIFY" id="MATERIAL_CLASSIFY" title="소재분류">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1027}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="PROGRESS">진행상태</label>
                    <select class="wd_100" name="PROGRESS" id="PROGRESS" title="진행상태">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1013}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MCT_NO">MCT No.</label>
                    <select class="wd_100" name="MCT_NO" id="MCT_NO" title="MCT No.">
                        <option value="">ALL</option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="WORK_CLASSIFY">작업구분</label>
                    <select class="wd_100" name="WORK_CLASSIFY" id="WORK_CLASSIFY" title="작업구분">
                        <option value="">All</option>
                        <c:forEach var="code" items="${HighCode.H_1011}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="refresh mg-left10"><button type="button" id="MCT_TARGET_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
            </div>
            <div class="conWrap">
                <div class="tableWrap" style="background: #e1e1e1;">
                    <div id="PROCESS_TARGET_GRID"></div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        const insertQueryList = ['machine.insertMctPlan'];
        const updateQueryList = ['machine.updateMctPlan'];
        const deleteQueryList = ['machine.deleteMctPlan'];
        let $processPlanGrid1, $processPlanGrid2, $processPlanGrid3, $processPlanGrid4;
        const processPlanGrid1Id = 'PROCESS_PLAN_GRID1';
        const processPlanGrid2Id = 'PROCESS_PLAN_GRID2';
        const processPlanGrid3Id = 'PROCESS_PLAN_GRID3';
        const processPlanGrid4Id = 'PROCESS_PLAN_GRID4';

        let postData = fnFormToJsonArrayData('#MCT_PLAN_MANAGE_SEARCH_FORM');
        let parameters = {'url': '/json-list', 'data': postData};

        const createdynamicForm = function (row, col, order, equipId) {
            let str = '';

            str += '<form id="MCT_NC' + order + '_PLAN_FORM" role="form">';
            str += '    <input type="hidden" name="queryId" id="queryId" value="machine.selectProcessPlanGridList">';
            str += '    <input type="hidden" name="EQUIP_ID" id="EQUIP_ID" value="' + equipId + '">';
            str += '    <div class="table">';
            str += '        <div class="titleWrap">';
            str += '            <span class="tableLabel">NC' + order +'</span>';
            str += '            <span class="data_ipt" id="NC' + order + '_CONTROL_NUM">C19-625-0799-0order#1</span>';
            str += '            <p class="listTxt">';
            str += '                <span id="NC' + order + '_MATERIAL_DETAIL">SMorder5C</span>';
            str += '                <span id="NC' + order + '_PART_UNIT_QTY">20EA</span>';
            str += '                <span id="NC' + order + '_WORK_USER_ID">홍길동</span>';
            str += '            </p>';
            str += '        </div>';
            str += '        <div class="listWrap">';
            str += '            <div class="miniLeft"><span>대기목록</span></div>';
            str += '            <div class="miniRight">';
            str += '                <div class="scrollWrap">';
            str += '                    <div id="PROCESS_PLAN_GRID' + order + '"></div>';
            str += '                </div>';
            str += '                <div class="footerWrap">';
            str += '                    <span>Total <span id="NC' + order + '_TOTAL_RECORDS">13</span>rows <span id="NC' + order + '_TOTAL_PART_UNIT_QUANTITY">1</span>ea <span id="NC' + order + '_TOTAL_WORKING_TIME">583</span>min</span>';
            str += '                </div>';
            str += '            </div>';
            str += '        </div>';
            str += '    </div>';
            str += '</form>';

            $('#layout_' + row + '_' + col)[0].innerHTML = str;
        };

        fnPostAjaxAsync(function (data) {
            for (let i = 0, listLength = data.list.length; i < listLength; i++) {
                console.log(data.list[i]);
                let thisParameter = data.list[i];
                let row = thisParameter.LAYOUT_ROW;
                let col = thisParameter.LAYOUT_COL;
                let equipId = thisParameter.EQUIP_ID;
                // $('#MCT_NC' + (i + 1) + '_PLAN_FORM > #EQUIP_ID').val(data.list[i].EQUIP_ID);
                createdynamicForm(row, col, i + 1, equipId);
            }
        }, parameters, '');

        let processPlanPostData1 = fnFormToJsonArrayData('#MCT_NC1_PLAN_FORM');
        let processPlanPostData2 = fnFormToJsonArrayData('#MCT_NC2_PLAN_FORM');
        let processPlanPostData3 = fnFormToJsonArrayData('#MCT_NC3_PLAN_FORM');
        let processPlanPostData4 = fnFormToJsonArrayData('#MCT_NC4_PLAN_FORM');

        const processPlanColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'EQUIP_ID', dataType: 'string', dataIndx: 'EQUIP_ID', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT_PLAN_SEQ', dataType: 'integer', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
            {title: 'WORK_USER_ID', dataType: 'string', dataIndx: 'WORK_USER_ID', hidden: true},
            {title: 'SORT_NUM', dataType: 'integer', dataIndx: 'SORT_NUM', hidden: true},
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '관리번호', width: 70, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part 수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY'},
            {title: '소재', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '예상', dataType: 'string', dataIndx: 'WORKING_TIME'},
            {
                title: '', width: 50, dataType: 'string', dataIndx: 'DELETE_BUTTON', editable: false,
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
        const processPlanObj1 = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: true},
            colModel: processPlanColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processPlanPostData1, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd1',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .dnd4, .master'
            },
            complete: function () {
                this.flex();
                let data = $processPlanGrid1.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalPartUnitQuantity = 0;
                let totalWorkingTime = 0;

                if (totalRecords) {
                    $('#NC1_CONTROL_NUM').html(data[0].CONTROL_NUM);
                    $('#NC1_MATERIAL_DETAIL').html(data[0].CONTROL_NUM);
                    $('#NC1_PART_UNIT_QTY').html(data[0].PART_UNIT_QTY);
                    $('#NC1_WORK_USER_ID').html(data[0].WORK_USER_ID);
                }

                for (let i = 0; i < totalRecords; i++) {
                    totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                    totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
                }

                $('#NC1_TOTAL_RECORDS').html(totalRecords);
                $('#NC1_TOTAL_PART_UNIT_QUANTITY').html(totalPartUnitQuantity);
                $('#NC1_TOTAL_WORKING_TIME').html(totalWorkingTime);
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $processPlanGrid1);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processPlanGrid1.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                if (ui.source === 'addNodes' && ui.addList.length > 0) {
                    let equipId = $('#MCT_NC1_PLAN_FORM > #EQUIP_ID').val();

                    changeSortNum(this, $processPlanGrid1);

                    //TODO: rowIndx 0
                    $processPlanGrid1.pqGrid('updateRow', {rowIndx: 0, row: {EQUIP_ID: equipId}});
                }

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($processPlanGrid1, insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $processPlanGrid1);
                }
            }
        };
        const processPlanObj2 = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: true},
            colModel: processPlanColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processPlanPostData2, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd2',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd3, .dnd4, .master',
            },
            complete: function () {
                this.flex();
                let data = $processPlanGrid2.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalPartUnitQuantity = 0;
                let totalWorkingTime = 0;

                if (totalRecords) {
                    $('#NC2_CONTROL_NUM').html(data[0].CONTROL_NUM);
                    $('#NC2_MATERIAL_DETAIL').html(data[0].CONTROL_NUM);
                    $('#NC2_PART_UNIT_QTY').html(data[0].PART_UNIT_QTY);
                    $('#NC2_WORK_USER_ID').html(data[0].WORK_USER_ID);
                }

                for (let i = 0; i < totalRecords; i++) {
                    totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                    totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
                }

                $('#NC2_TOTAL_RECORDS').html(totalRecords);
                $('#NC2_TOTAL_PART_UNIT_QUANTITY').html(totalPartUnitQuantity);
                $('#NC2_TOTAL_WORKING_TIME').html(totalWorkingTime);
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $processPlanGrid2);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processPlanGrid2.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                if (ui.source === 'addNodes' && ui.addList.length > 0) {
                    let equipId = $('#MCT_NC2_PLAN_FORM > #EQUIP_ID').val();

                    changeSortNum(this, $processPlanGrid1);

                    //TODO: rowIndx 0
                    $processPlanGrid2.pqGrid('updateRow', {rowIndx: 0, row: {EQUIP_ID: equipId}});
                }

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($processPlanGrid2, insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $processPlanGrid1);
                }
            }
        };
        const processPlanObj3 = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: true},
            colModel: processPlanColModel,
            strNoRows: g_noData,
            dataModel: {
                // location: 'remote', dataType: 'json', method: 'POST', url: '/dataSource.emptyGrid',
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processPlanPostData3, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd3',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd4, .master'
            },
            complete: function () {
                this.flex();
                let data = $processPlanGrid3.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalPartUnitQuantity = 0;
                let totalWorkingTime = 0;

                if (totalRecords) {
                    $('#NC3_CONTROL_NUM').html(data[0].CONTROL_NUM);
                    $('#NC3_MATERIAL_DETAIL').html(data[0].CONTROL_NUM);
                    $('#NC3_PART_UNIT_QTY').html(data[0].PART_UNIT_QTY);
                    $('#NC3_WORK_USER_ID').html(data[0].WORK_USER_ID);
                }

                for (let i = 0; i < totalRecords; i++) {
                    totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                    totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
                }

                $('#NC3_TOTAL_RECORDS').html(totalRecords);
                $('#NC3_TOTAL_PART_UNIT_QUANTITY').html(totalPartUnitQuantity);
                $('#NC3_TOTAL_WORKING_TIME').html(totalWorkingTime);
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $processPlanGrid3);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processPlanGrid3.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                if (ui.source === 'addNodes' && ui.addList.length > 0) {
                    let equipId = $('#MCT_NC3_PLAN_FORM > #EQUIP_ID').val();

                    changeSortNum(this, $processPlanGrid1);

                    //TODO: rowIndx 0
                    $processPlanGrid3.pqGrid('updateRow', {rowIndx: 0, row: {EQUIP_ID: equipId}});
                }

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($processPlanGrid3, insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $processPlanGrid1);
                }
            }
        };
        const processPlanObj4 = {
            height: '100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: true},
            colModel: processPlanColModel,
            strNoRows: g_noData,
            dataModel: {
                // location: 'remote', dataType: 'json', method: 'POST', url: '/dataSource.emptyGrid',
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processPlanPostData4, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd4',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .master'
            },
            complete: function () {
                this.flex();
                let data = $processPlanGrid4.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalPartUnitQuantity = 0;
                let totalWorkingTime = 0;

                if (totalRecords) {
                    $('#NC4_CONTROL_NUM').html(data[0].CONTROL_NUM);
                    $('#NC4_MATERIAL_DETAIL').html(data[0].CONTROL_NUM);
                    $('#NC4_PART_UNIT_QTY').html(data[0].PART_UNIT_QTY);
                    $('#NC4_WORK_USER_ID').html(data[0].WORK_USER_ID);
                }

                for (let i = 0; i < totalRecords; i++) {
                    totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                    totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
                }

                $('#NC4_TOTAL_RECORDS').html(totalRecords);
                $('#NC4_TOTAL_PART_UNIT_QUANTITY').html(totalPartUnitQuantity);
                $('#NC4_TOTAL_WORKING_TIME').html(totalWorkingTime);
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $processPlanGrid4);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processPlanGrid4.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                if (ui.source === 'addNodes' && ui.addList.length > 0) {
                    let equipId = $('#MCT_NC4_PLAN_FORM > #EQUIP_ID').val();

                    changeSortNum(this, $processPlanGrid1);

                    //TODO: rowIndx 0
                    $processPlanGrid4.pqGrid('updateRow', {rowIndx: 0, row: {EQUIP_ID: equipId}});
                }

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($processPlanGrid4, insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $processPlanGrid1);
                }
            }
        };

        let $processTargetGrid;
        const processTargetGridId = 'PROCESS_TARGET_GRID';
        let processTargetGridPostData = fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM');
        const processTargetGridColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ'},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ'},
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주요', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_NM'},
            {
                title: 'MCT Plan/Actual', align: 'center', colModel: [
                    {
                        title: 'Seq1', align: 'center', colModel: [
                            {title: 'Seq1', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq1', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq2', align: 'center', colModel: [
                            {title: 'Seq2', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq2', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq3', align: 'center', colModel: [
                            {title: 'Seq3', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq3', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                    {
                        title: 'Seq4', align: 'center', colModel: [
                            {title: 'Seq4', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                            {title: 'Seq4', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                        ]
                    },
                ]
            },
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM'},
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '밀링', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '선반', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '연마', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '소재종류상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {title: '비고 기록사항', dataType: 'string', dataIndx: 'NOTE'},
            {title: '예상가공<br>시간(분)', dataType: 'integer', dataIndx: 'OUTSIDE_STATUS_DT'},
            {title: '가공계획<br>비고', dataType: 'string', dataIndx: 'MCT_NOTE', editable: true},
            {
                title: '작업<br>구분', dataType: 'string', dataIndx: 'MCT_WORK_TYPE',
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
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
            {title: '이전위치', dataType: 'string', dataIndx: 'POP_PREV_POSITION'},
            {
                title: '과거 경험<br>(NC설계기준)', align: 'center', colModel: [
                    {title: '동그라미', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '이름', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {title: '확정 일시', dataType: 'string', dataIndx: 'SATAUS_DT'},
            {title: '소재입고<br>일시', dataType: 'string', dataIndx: 'MATERIAL_INNER_DT'}
        ];
        const processTargetGridObj = {
            height: '100%',
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
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
                clsDnD: 'master',
                diHelper: ['CONTROL_NUM'],
                // FIXME:
                beforeDrop: function (evt, uiDrop) {
                    console.log(evt);
                    console.log(uiDrop);
                }
            },
            complete: function () {
                this.flex();
            },
            cellSave: function () {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processTargetGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        };

        /* 함수 */
        let modifyPQGrid = function (grid, insertQueryList, updateQueryList, deleteQueryList) {
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
        };
        const refreshTargetGrid = function () {
            $processTargetGrid.pqGrid('refreshDataAndView');
        };

        const resetEquipId = function () {
            $('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_ID').val('');
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
                    $('#MCT_NC' + (i + 1) + '_PLAN_FORM > #EQUIP_ID').val(data.list[i].EQUIP_ID);
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

        /**
         * @description
         * @param {object | jQuery} grid
         */
        const changeSortNum = function (kk, grid) {
            debugger;
            let rowListConvert = [];
            let ids = kk.pageData().map(function (rd) {
                return rd.MCT_PLAN_SEQ;
            });

            for (let i = 0, length = ids.length; i < length; i++) {
                let tempObject = {rowIndx: i, newRow: {'SORT_NUM': (i + 1)}};
                rowListConvert.push(tempObject);
            }
            grid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});
        };
        /* 함수 */

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
        /* event */

        /* init */
        $processPlanGrid1 = $('#' + processPlanGrid1Id).pqGrid(processPlanObj1);
        $processPlanGrid2 = $('#' + processPlanGrid2Id).pqGrid(processPlanObj2);
        $processPlanGrid3 = $('#' + processPlanGrid3Id).pqGrid(processPlanObj3);
        $processPlanGrid4 = $('#' + processPlanGrid4Id).pqGrid(processPlanObj4);
        $processTargetGrid = $('#' + processTargetGridId).pqGrid(processTargetGridObj);
        /* init */
    });
</script>
