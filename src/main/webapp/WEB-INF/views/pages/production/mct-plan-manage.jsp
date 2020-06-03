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
                    <button type="button" class="defaultBtn black" id="MCT_PLAN_MANAGE_DRAWING_VIEW">도면보기</button>
                    <button type="button" class="defaultBtn sky">레이아웃관리</button>
                </span>
            </div>
        </form>
        <div class="conWrap">
            <div class="tableWrap">
                <ul>
                    <li id="layout_1_1" style="min-width: 506px;"></li>
                    <li id="layout_1_2" style="min-width: 506px;"></li>
                    <li id="layout_1_3" style="min-width: 506px;"></li>
                    <li id="layout_1_4"></li>
                </ul>
                <ul>
                    <li id="layout_2_1" style="min-width: 506px;"></li>
                    <li id="layout_2_2" style="min-width: 506px;"></li>
                    <li id="layout_2_3" style="min-width: 506px;"></li>
                    <li id="layout_2_4"></li>
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
        const TWENTY_SECONDS = 20000;
        const insertQueryList = ['machine.insertMctPlan'];
        const updateQueryList = ['machine.updateMctPlan'];
        const deleteQueryList = ['machine.deleteMctPlan', 'machine.deleteMctWork'];
        let $processPlanGrid1, $processPlanGrid2, $processPlanGrid3, $processPlanGrid4, $processPlanGrid5, $processPlanGrid6, $processPlanGrid7, $processPlanGrid8;
        const processPlanGrid1Id = 'PROCESS_PLAN_GRID1';
        const processPlanGrid2Id = 'PROCESS_PLAN_GRID2';
        const processPlanGrid3Id = 'PROCESS_PLAN_GRID3';
        const processPlanGrid4Id = 'PROCESS_PLAN_GRID4';
        const processPlanGrid5Id = 'PROCESS_PLAN_GRID5';
        const processPlanGrid6Id = 'PROCESS_PLAN_GRID6';
        const processPlanGrid7Id = 'PROCESS_PLAN_GRID7';
        const processPlanGrid8Id = 'PROCESS_PLAN_GRID8';

        let postData = fnFormToJsonArrayData('#MCT_PLAN_MANAGE_SEARCH_FORM');
        let parameters = {'url': '/json-list', 'data': postData};

        const createdynamicForm = function (row, col, order, equipSeq, equipNm) {
            let str = '';

            str += '<form id="MCT_NC' + order + '_PLAN_FORM" role="form">';
            str += '    <input type="hidden" name="queryId" id="queryId" value="machine.selectProcessPlanGridList">';
            str += '    <input type="hidden" name="EQUIP_SEQ" id="EQUIP_SEQ" value="' + equipSeq + '">';
            str += '    <div class="table">';
            str += '        <div class="titleWrap">';
            str += '            <span class="tableLabel">' + equipNm +'</span>';
            str += '            <span class="data_ipt" id="NC' + order + '_CONTROL_NUM" style="display: none;"></span>';
            str += '            <p class="listTxt" style="display: none;">';
            str += '                <span id="NC' + order + '_MATERIAL_DETAIL"></span>';
            str += '                <span id="NC' + order + '_PART_UNIT_QTY"></span>';
            str += '                <span id="NC' + order + '_WORK_USER_ID"></span>';
            str += '            </p>';
            str += '        </div>';
            str += '        <div class="listWrap">';
            str += '            <div class="miniLeft"><span>대기목록</span></div>';
            str += '            <div class="miniRight">';
            str += '                <div class="scrollWrap">';
            str += '                    <div id="PROCESS_PLAN_GRID' + order + '"></div>';
            str += '                </div>';
            str += '                <div class="footerWrap">';
            str += '                    <span>Total <span id="NC' + order + '_TOTAL_RECORDS">0</span>rows <span id="NC' + order + '_TOTAL_PART_UNIT_QUANTITY">0</span>ea <span id="NC' + order + '_TOTAL_WORKING_TIME">0</span>min</span>';
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

        let processPlanPostData1 = fnFormToJsonArrayData('#MCT_NC1_PLAN_FORM');
        let processPlanPostData2 = fnFormToJsonArrayData('#MCT_NC2_PLAN_FORM');
        let processPlanPostData3 = fnFormToJsonArrayData('#MCT_NC3_PLAN_FORM');
        let processPlanPostData4 = fnFormToJsonArrayData('#MCT_NC4_PLAN_FORM');
        let processPlanPostData5 = fnFormToJsonArrayData('#MCT_NC5_PLAN_FORM');
        let processPlanPostData6 = fnFormToJsonArrayData('#MCT_NC6_PLAN_FORM');
        let processPlanPostData7 = fnFormToJsonArrayData('#MCT_NC7_PLAN_FORM');
        let processPlanPostData8 = fnFormToJsonArrayData('#MCT_NC8_PLAN_FORM');

        const processPlanColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: 'EQUIP_SEQ', dataType: 'string', dataIndx: 'EQUIP_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT_PLAN_SEQ', dataType: 'integer', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
            {title: 'WORK_USER_ID', dataType: 'string', dataIndx: 'WORK_USER_ID', hidden: true},
            {title: 'WORK_STATUS', dataType: 'string', dataIndx: 'WORK_STATUS', hidden: true},
            {title: 'SORT_NUM', dataType: 'integer', dataIndx: 'SORT_NUM', hidden: true},
            {title: '납기', width: 110, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '관리번호', width: 120, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part 수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY'},
            {title: '소재', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
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
                        let workType = fnGetCommCodeGridSelectBox('1027');
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
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '현재위치', width: 80, dataType: 'string', dataIndx: 'POP_POSITION',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let position = fnGetCommCodeGridSelectBox('1009');
                        let index = position.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = position.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }

                        return (index < 0) ? cellData : position[index].text;
                    }
                }
            },
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
                diHelper: ['CONTROL_NUM'],
            },
            dropModel: {
                on: true,
                accept: '.dnd2, .dnd3, .dnd4, .dnd5, .dnd6, .dnd7, .dnd8, .master',
                drop: function (evt, ui) {
                    let Drag = ui.helper.data('Drag');
                    let uiDrag = Drag.getUI();
                    let equipSeq = $('#MCT_NC1_PLAN_FORM > #EQUIP_SEQ').val();
                    uiDrag.rowData.EQUIP_SEQ = equipSeq;

                    let rowIndx = uiDrag.rowIndx > 0 ? uiDrag.rowIndx : $processPlanGrid1.pqGrid('option', 'dataModel.data').length;
                    $processPlanGrid1.pqGrid('addRow', {newRow: uiDrag.rowData, rowIndx: rowIndx, checkEditable: false});

                    changeSortNum(this, $processPlanGrid1);
                }
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
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
                accept: '.dnd1, .dnd3, .dnd4, .dnd5, .dnd6, .dnd7, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
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
                accept: '.dnd1, .dnd2, .dnd4, .dnd5, .dnd6, .dnd7, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
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
                accept: '.dnd1, .dnd2, .dnd3, .dnd5, .dnd6, .dnd7, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
                }
            }
        };
        const processPlanObj5 = {
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
                postData: processPlanPostData5, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd5',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .dnd4, .dnd6, .dnd7, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
                }
            }
        };
        const processPlanObj6 = {
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
                postData: processPlanPostData6, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd6',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .dnd4, .dnd5, .dnd7, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
                }
            }
        };
        const processPlanObj7 = {
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
                postData: processPlanPostData7, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd7',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .dnd4, .dnd5, .dnd6, .dnd8, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
                }
            }
        };
        const processPlanObj8 = {
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
                postData: processPlanPostData8, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            dragModel: {
                on: true,
                clsDnD: 'dnd8',
                diHelper: ['CONTROL_NUM']
            },
            dropModel: {
                on: true,
                accept: '.dnd1, .dnd2, .dnd3, .dnd4, .dnd5, .dnd6, .dnd7, .master'
            },
            complete: function () {
                let data = this.options.dataModel.data;
                let totalRecords = data.length;
                let tableElement = this.element.closest('.table');

                changeTitleColor(data, tableElement);

                if (totalRecords) {
                    showTitle(data, tableElement);
                    changeFooter(data, tableElement);
                }
            },
            moveNode: function (event, ui) {
                changeSortNum(this, $(this.element.context));
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {

                if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                    modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                    refreshTargetGrid();
                }

                if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                    changeSortNum(this, $(this.element.context));
                }
            }
        };

        let $processTargetGrid;
        const processTargetGridId = 'PROCESS_TARGET_GRID';
        let processTargetGridPostData = fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM');
        const processTargetGridColModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: false},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: false},
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: false},
            {title: '납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주요', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_NM'},
            {
                title: 'MCT Plan/Actual', align: 'center', colModel: [
                    {
                        title: 'Seq1', align: 'center', colModel: [
                            {title: '', datatype: 'integer', dataIndx: 'EQUIP_SEQ_1',
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_1;
                                    let backgroundColor = colorClassification(status);

/*
                                    if (status) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                                    }
*/

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        let index = EQUIP_LIST.findIndex(function (element) {
                                            return element.value === Number(cellData);
                                        });
                                        return (index < 0) ? cellData : EQUIP_LIST[index].text;
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_1', editable: true,
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_1;
                                    let backgroundColor = colorClassification(status);

                                    /*if (status) {
                                        return $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                                    }*/

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        return cellData + '분';
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'STATUS_1', hidden: true},
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_1', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq2', align: 'center', colModel: [
                            {title: '', datatype: 'integer', dataIndx: 'EQUIP_SEQ_2',
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_2;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        let index = EQUIP_LIST.findIndex(function (element) {
                                            return element.value === Number(cellData);
                                        });
                                        return (index < 0) ? cellData : EQUIP_LIST[index].text;
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_2', editable: true,
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_2;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        return cellData + '분';
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'STATUS_2', hidden: true},
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_2', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq3', align: 'center', colModel: [
                            {title: '', datatype: 'integer', dataIndx: 'EQUIP_SEQ_3',
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_3;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        let index = EQUIP_LIST.findIndex(function (element) {
                                            return element.value === Number(cellData);
                                        });
                                        return (index < 0) ? cellData : EQUIP_LIST[index].text;
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_3', editable: true,
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_3;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        return cellData + '분';
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'STATUS_3', hidden: true},
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_3', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq4', align: 'center', colModel: [
                            {title: '', datatype: 'integer', dataIndx: 'EQUIP_SEQ_4',
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_4;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        let index = EQUIP_LIST.findIndex(function (element) {
                                            return element.value === Number(cellData);
                                        });
                                        return (index < 0) ? cellData : EQUIP_LIST[index].text;
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_4', editable: true,
                                render: function (ui) {
                                    let cellData = ui.cellData;
                                    let status = ui.rowData.STATUS_4;
                                    let backgroundColor = colorClassification(status);

                                    if (cellData) {
                                        $processTargetGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});

                                        return cellData + '분';
                                    }
                                }
                            },
                            {title: '', datatype: 'string', dataIndx: 'STATUS_4', hidden: true},
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_4', hidden: true}
                        ]
                    },
                ]
            },
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let position = fnGetCommCodeGridSelectBox('1009');
                        let index = position.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = position.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }

                        return (index < 0) ? cellData : position[index].text;
                    }
                }
            },
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS'},
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_NC'},
                    {title: '밀링', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_MILLING'},
                    {title: '선반', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_RACK'},
                    {title: '연마', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_GRINDING'},
                ]
            },
            {title: '관리번호', width: 120, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '소재종류<br>상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
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
            {title: '규격', width: 120, dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', width: 120, dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {title: '비고 기록사항', dataType: 'string', dataIndx: 'NOTE'},
            {title: '예상가공<br>시간(분)', dataType: 'integer', dataIndx: 'WORKING_TIME_TOTAL'},
            {title: '가공계획<br>비고', dataType: 'string', dataIndx: 'MCT_NOTE', editable: true},
            {
                title: '작업<br>구분', dataType: 'string', dataIndx: 'MCT_WORK_TYPE', editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1011')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1011');
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
            {title: '이전위치', dataType: 'string', dataIndx: 'POP_PREV_POSITION',
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let position = fnGetCommCodeGridSelectBox('1009');
                        let index = position.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = position.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }

                        return (index < 0) ? cellData : position[index].text;
                    }
                }
            },
            {
                title: '과거 경험<br>(NC설계기준)', align: 'center', colModel: [
                    {title: '', datatype: 'string', dataIndx: 'PAST_WORKER_BOOL',
                        render: function (ui) {
                            if (ui.cellData) {
                                return '<span>○</span>';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'PAST_WORKER'},
                ]
            },
            {title: '확정 일시', width: 110, dataType: 'string', dataIndx: 'SATAUS_DT'},
            {title: '소재입고<br>일시', width: 110, dataType: 'string', dataIndx: 'MATERIAL_INNER_DT'}
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
                beforeDrop: function () {

                }
            },
            complete: function () {
                // this.flex();
            },
            cellSave: function (event, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processTargetGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                } else {
                    changeMctPlanFromTarget(ui);
                    fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget']);
                }
            }
        };

        /* 함수 */
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
        const changeSortNum = function (kk, grid) {
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

        const colorClassification = function (status) {
            let backgroundColor = '';

            switch (status) {
                // 가동중
                case 'PRO007':
                    backgroundColor = 'bg-green';
                    break;
                // 완료
                case 'PRO008':
                    backgroundColor = 'bg-light_blue';
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
            let firstData = data[0];
            let controlNumElement = $(tableElement).find('.data_ipt');
            let listTxtElement = $(tableElement).find('.listTxt');
            let materialDetailElement = listTxtElement.children('[id$=MATERIAL_DETAIL]');
            let partUnitQtyElement = listTxtElement.children('[id$=PART_UNIT_QTY]');
            let workUserIdElement = listTxtElement.children('[id$=WORK_USER_ID]');

            controlNumElement.show();
            listTxtElement.show();

            controlNumElement.html(firstData.CONTROL_NUM);
            materialDetailElement.html(firstData.MATERIAL_DETAIL);
            partUnitQtyElement.html(firstData.PART_UNIT_QTY);
            workUserIdElement.html(firstData.WORK_USER_ID);
        };

        const changeTitleColor = function (data, tableElement) {
            let firstData = data[0];
            let tableLabelElement = $(tableElement).find('.tableLabel');
            let labelColorId = 'bg-yellow';

            if (firstData !== undefined && firstData.hasOwnProperty('WORK_STATUS')) {
                switch (firstData.WORK_STATUS) {
                    case '가동중':
                        labelColorId = 'bg-green';
                        break;
                    case '완료':
                        labelColorId = 'bg-light_blue';
                        break;
                    case '비가동상태':
                        labelColorId = 'bg-yellow';
                        break;
                    case '일시정지상태':
                        labelColorId = 'bg-orange';
                        break;
                }
            }

            tableLabelElement.removeClass();
            tableLabelElement.addClass('tableLabel');
            tableLabelElement.addClass(labelColorId);
        };

        const changeFooter = function (data, tableElement) {
            let totalPartUnitQuantity = 0;
            let totalWorkingTime = 0;
            let totalRecords = data.length;
            let totalRecordsElement = $(tableElement).find('[id$=TOTAL_RECORDS]');
            let totalPartUnitQuantityElement = $(tableElement).find('[id$=TOTAL_PART_UNIT_QUANTITY]');
            let totalWorkingTimeElement = $(tableElement).find('[id$=TOTAL_WORKING_TIME]');

            for (let i = 0; i < totalRecords; i++) {
                totalPartUnitQuantity += data[i].PART_UNIT_QTY ? parseInt(data[i].PART_UNIT_QTY) : 0;
                totalWorkingTime += data[i].WORKING_TIME ? parseInt(data[i].WORKING_TIME) : 0;
            }

            totalRecordsElement.html(totalRecords);
            totalPartUnitQuantityElement.html(totalPartUnitQuantity);
            totalWorkingTimeElement.html(totalWorkingTime);
        };

        const createPQGrid = function (gridId, postData) {
            let obj = {
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
                    postData: postData, recIndx: 'ROWNUM',
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                complete: function () {
                    let data = this.options.dataModel.data;
                    let totalRecords = data.length;
                    let tableElement = this.element.closest('.table');

                    changeTitleColor(data, tableElement);

                    if (totalRecords) {
                        showTitle(data, tableElement);
                        changeFooter(data, tableElement);
                    }
                },
                moveNode: function (event, ui) {
                    changeSortNum(this, $(this.element.context));
                },
                cellSave: function (evt, ui) {
                    if (ui.oldVal === undefined && ui.newVal === null) {
                        $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                    }
                },
                change: function (event, ui) {
                    
                    if (ui.source === 'edit' || ui.source === 'update' || ui.source === 'delete' || ui.source === 'deleteNodes') {
                        modifyPQGrid($(this.element.context), insertQueryList, updateQueryList, deleteQueryList);
                        refreshTargetGrid();
                    }

                    if (ui.source === 'delete' || ui.source === 'deleteNodes') {
                        changeSortNum(this, $(this.element.context));
                    }
                }
            };
            return $('#' + gridId).pqGrid(obj);
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

        $('#MCT_PLAN_MANAGE_DRAWING_VIEW').on('click', function () {
            callWindowImageViewer(999);
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
        $processTargetGrid = $('#' + processTargetGridId).pqGrid(processTargetGridObj);

        /*setInterval(function () {
            refreshMctPlanGrids();
            refreshTargetGrid();
        }, TWENTY_SECONDS);*/
        /* init */
    });
</script>
