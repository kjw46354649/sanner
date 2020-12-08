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
                <span class="slt_wrap namePlusSlt ml-20">
                        <label for="FACTORY_AREA">MCT 센터</label>
                        <select name="FACTORY_AREA" id="FACTORY_AREA">
                        <c:forEach var="code" items="${HighCode.H_1005}">
                            <c:if test="${code.ETC1 == 'MCT_PROCESS_PLAN'}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:if>
                        </c:forEach>
                        </select>
                </span>
                <span class="refresh ml-10"><button type="button" id="MCT_PLAN_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
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
                    <li id="layout_1_7" style="min-width: 500px;"></li>
                </ul>
                <ul>
                    <li id="layout_2_1" style="min-width: 500px;"></li>
                    <li id="layout_2_2" style="min-width: 500px;"></li>
                    <li id="layout_2_3" style="min-width: 500px;"></li>
                    <li id="layout_2_4" style="min-width: 500px;"></li>
                    <li id="layout_2_5" style="min-width: 500px;"></li>
                    <li id="layout_2_6" style="min-width: 500px;"></li>
                    <li id="layout_2_7" style="min-width: 500px;"></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="bottomWrap">
        <div class="hWrap" style="padding: 0;">
            <h2 style="height: 42px; line-height: 42px;">가공 대상 List</h2>
            <form id="MCT_PROCESS_TARGET_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="machine.selectWorkPlanGridList">

                <span class="slt_wrap ml-20">
                    <label class="label_50" for="FACTORY_CLASSIFY">공장구분</label>
                    <select class="wd_70" name="FACTORY_CLASSIFY" id="FACTORY_CLASSIFY" title="공장구분">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1014}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="POP_POSITION">위치</label>
                    <select class="wd_70" id="POP_POSITION" name="POP_POSITION" title="위치">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1009}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MATERIAL_DETAIL">소재분류</label>
                    <select class="wd_100" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" title="소재분류">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1027}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="PART_STATUS">진행상태</label>
                    <select class="wd_100" name="PART_STATUS" id="PART_STATUS" title="진행상태">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1013}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="EQUIP_SEQ">MCT No.</label>
                    <select class="wd_100" name="EQUIP_SEQ" id="EQUIP_SEQ" title="MCT No.">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                    <label class="label_50" for="MCT_WORK_TYPE">작업구분</label>
                    <select class="wd_100" name="MCT_WORK_TYPE" id="MCT_WORK_TYPE" title="작업구분">
                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                        <c:forEach var="code" items="${HighCode.H_1011}">
                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                        <input type="checkbox" name="PLAN_ONLY" id="PLAN_ONLY">
                        <label class="label_50" for="PLAN_ONLY">계획단계만</label>
                    </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                        <input type="checkbox" name="INCLUDE_OUTSIDE" id="INCLUDE_OUTSIDE">
                        <label class="label_50" for="INCLUDE_OUTSIDE">외주 포함</label>
                    </span>
                <span class="gubun"></span>
                <span class="slt_wrap">
                        <input type="checkbox" name="INCLUDE_PROCESSING" id="INCLUDE_PROCESSING">
                        <label class="label_80" for="INCLUDE_PROCESSING">가공 완료 포함</label>
                    </span>
                <span class="refresh ml-10"><button type="button" id="MCT_TARGET_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
<%--                <div style="margin: 0 0 10px 20px;">--%>

<%--                </div>--%>
            </form>
<%--            <div style="display:flow-root; margin: 0 20px 10px 20px;">--%>
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
<%--                <button type="button" class="right_float defaultBtn btn-100w green" id="MCT_TARGET_SAVE">저장</button>--%>
<%--            </div>--%>
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
        let $processPlanGrid1, $processPlanGrid2, $processPlanGrid3, $processPlanGrid4, $processPlanGrid5,
            $processPlanGrid6, $processPlanGrid7, $processPlanGrid8, $processPlanGrid9, $processPlanGrid10,
            $processPlanGrid11, $processPlanGrid12, $processPlanGrid13, $processPlanGrid14;
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
        const processPlanGrid12Id = 'PROCESS_PLAN_GRID12';
        const processPlanGrid13Id = 'PROCESS_PLAN_GRID13';
        const processPlanGrid14Id = 'PROCESS_PLAN_GRID14';

        const createDynamicForm = function (row, col, order, equipSeq, equipNm) {
            let str = '';

            str += '<form id="MCT_NC' + order + '_PLAN_FORM" role="form">';
            str += '    <input type="hidden" name="queryId" id="queryId" value="machine.selectProcessPlanGridList">';
            str += '    <input type="hidden" name="EQUIP_SEQ" id="EQUIP_SEQ" value="' + equipSeq + '">';
            str += '    <div class="table">';
            str += '        <div class="titleWrap">';
            str += '            <span class="equipLabel">';
            str += '                <span id="NC' + order + '_EQUIP_NM">' + equipNm + '</span>';
            str += '                <span id="NC' + order + '_WORK_USER_ID"></span>';
            str += '            </span>';
            str += '            <p class="listTxt" style="display: none;">';
            str += '                <span id="NC' + order + '_CONTROL_NUM"></span>';
            str += '                <span id="NC' + order + '_PART_UNIT_QTY"></span>';
            str += '                <span id="NC' + order + '_MATERIAL_TYPE"></span>';
            str += '                <span id="NC' + order + '_WORK_TIME"></span>';
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

        const loadMctInfo = function () {
            let postData = fnFormToJsonArrayData('#MCT_PLAN_MANAGE_SEARCH_FORM');
            let parameters = {'url': '/json-list', 'data': postData};

            fnPostAjaxAsync(function (data) {
                for (let i = 0, listLength = data.list.length; i < listLength; i++) {
                    let thisParameter = data.list[i];
                    let row = thisParameter.LAYOUT_ROW;
                    let col = thisParameter.LAYOUT_COL;
                    let equipSeq = thisParameter.EQUIP_SEQ;
                    let equipNm = thisParameter.EQUIP_NM;

                    createDynamicForm(row, col, i + 1, equipSeq, equipNm);
                }
            }, parameters, '');
        };
        loadMctInfo();

        /*const EQUIP_LIST = (function () {
            let list = [];
            let parameters = ({'url':'/json-list', 'data': {'queryId': 'dataSource.getEquipList'}});

            fnPostAjax(function (data, callFunctionParam) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let thisParameter = data.list[i];

                    list.push({'value': thisParameter.CODE_CD, 'text': thisParameter.CODE_NM});
                }
            }, parameters, '');
            return list;
        })();*/

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
            {title: '납기', width: 50, dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '관리번호', width: 175, dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: '수량', width: 75, dataType: 'string', dataIndx: 'CONTROL_PART_QTY'},
            {title: '재질', width: 75, dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', width: 75, dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM_SUBSTR'},
            {title: '예상', width: 75, dataType: 'string', dataIndx: 'WORKING_TIME'},
            {
                title: '', minWidth: 30, dataType: 'string', dataIndx: 'DELETE_BUTTON', editable: false,
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
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
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
                    let rowData = data.list[0];
                    changeTitleColor(rowData.EQUIP_STATUS, tableElement);
                    rowData.EQUIP_STATUS === undefined ? showTitle(null, tableElement) : showTitle(rowData, tableElement);
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

        let $processTargetGrid;
        const processTargetGridId = 'PROCESS_TARGET_GRID';
        let processTargetGridPostData = fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM');
        const processTargetGridColModel = [
            {title: 'ROWNUM', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: '납기', minWidth: 50, width: 50, dataIndx: 'INNER_DUE_DT'},
            {title: '긴<br>급', minWidth: 20, width: 20, dataIndx: 'EMERGENCY_YN'},
            {title: '주<br>요', minWidth: 20, width: 20, dataIndx: 'MAIN_INSPECTION'},
            {title: '형<br>태', minWidth: 20, width: 20, dataIndx: 'WORK_NM'},
            {title: 'NC Plan', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                colModel: [
                    {title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
                    {title: 'NC No.', minWidth: 40, width: 60, dataIndx: 'EQUIP_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
                    {title: 'E/T', minWidth: 50, width: 55, datatype: 'integer', dataIndx: 'WORKING_TIME', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
                ]
            },
            {title: '현재위치', width: 80, dataIndx: 'POP_POSITION'},
            {title: '진행상태', width: 80, dataIndx: 'PART_STATUS'},
            {title: '최근 가공현황', align: 'center',
                colModel: [
                    {title: '공정', dataIndx: 'NC_WORK_TYPE'},
                    {title: '기기명', width: 60, dataIndx: 'NC_EQUIP_NM'},
                    {title: '작업자', width: 80, dataIndx: 'NC_WORK_USER_NM'},
                    {title: 'R/T', width: 55, datatype: 'integer', align: 'right', dataIndx: 'NC_WORKING_TIME'},
                ]
            },
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '관리번호', align: 'left', width: 160, dataIndx: 'CONTROL_NUM_PART_NUM'},
            {title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM'},
            {
                title: '', minWidth: 25, width: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                    else return '';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#imageView').bind('click', function () {
                        let rowData = ui.rowData;
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '소재종류', dataIndx: 'MATERIAL_DETAIL',
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
            {title: '수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY'},
            {title: '규격', width: 100, dataIndx: 'STANDARD_SIZE'},
            {title: '주문소재 Size', width: 100, dataIndx: 'MATERAIL_ORDER_SIZE'},
            {title: '비고<br>기록사항', minWidth: 20, width: 100, dataIndx: 'CONTROL_NOTE_AND_MATERIAL_NOTE'},
            {title: '가공계획<br>비고', minWidth: 20, width: 150, dataIndx: 'MCT_NOTE',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            {title: '작업구분', dataIndx: 'MCT_WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, editable: true,
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
            {
                title: '과거유사 최근기록', align: 'center', colModel: [
                    {title: 'L/T', width: 50, dataIndx: 'LAST_UNIT_LEAD_TIME'},
                    {title: '실행일자', width: 60, dataIndx: 'LAST_MCT_START_DT'},
                    {title: '작업자', width: 65, dataIndx: 'LAST_MCT_WORK_USER'}
                ]
            },
            {title: '가공확정', minWidth: 40, width: 60, dataIndx: 'PROCESS_CONFIRM_DT'},
            {title: '소재<br>입고일시', width: 75, dataIndx: 'MATERIAL_RECEIPT_DT'}
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
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            // filterModel: {mode: 'OR'},
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
                beforeDrop: function () {},
                afterDrop: function (evt, uiDrop) {}
            },
            // load: function () {
            //     let filterOpts = '<option value=\"\">All Fields</option>';
            //     let frozenOts = '<option value="0">Selected</option>';
            //     this.getColModel().forEach(function (column) {
            //         let hiddenYn = column.hidden === undefined;
            //         if (hiddenYn && column.title) {
            //             filterOpts += '<option value="' + column.dataIndx + '">' + column.title + '</option>';
            //             frozenOts += '<option value="' + (column.leftPos + 1) + '">' + column.title + '</option>';
            //         }
            //     });
            //     $("#mctPlanManageFilterColumn").empty();
            //     $("#mctPlanManageFilterColumn").html(filterOpts);
            //     $("#mctPlanManageFrozen").empty();
            //     $("#mctPlanManageFrozen").html(frozenOts);
            // },
            // complete: function () {
            //     // this.flex();
            // },
            selectChange: function (event, ui) {
                selectedGrid = $(this.element.context);

                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) selectedRowIndex[0] = firstRow;
                    else for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                }
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
                    return txt1 + '<span style="background: #FFFF00; color: #333;">' + txt2 + '</span>' + txt3;
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
            $processPlanGrid12.pqGrid('refreshDataAndView');
            $processPlanGrid13.pqGrid('refreshDataAndView');
            $processPlanGrid14.pqGrid('refreshDataAndView');
        };

        const refreshTargetGrid = function () {
            $processTargetGrid.pqGrid('refreshDataAndView');
        };

        const destroyForm = function () {
            $('[id^=layout]').empty();
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
            let equipLabelElement = $(tableElement).find('.equipLabel');
            let listTxtElement = $(tableElement).find('.listTxt');

            if(data === null) {
                listTxtElement.hide();
            } else {
                let equipNmElement = equipLabelElement.children('[id$=EQUIP_NM]');
                let workUserIdElement = equipLabelElement.children('[id$=WORK_USER_ID]');
                let controlNumElement = listTxtElement.children('[id$=CONTROL_NUM]');
                let materialTypeElement = listTxtElement.children('[id$=MATERIAL_TYPE]');
                let partUnitQtyElement = listTxtElement.children('[id$=PART_UNIT_QTY]');
                let workTimeElement = listTxtElement.children('[id$=WORK_TIME]');

                equipNmElement.html(data.EQUIP_NM);
                workUserIdElement.html(data.WORK_USER_NM);
                controlNumElement.html(data.CONTROL_NUM);
                materialTypeElement.html(data.MATERIAL_TYPE_NM_SUBSTR);
                partUnitQtyElement.html(data.CONTROL_PART_QTY);
                workTimeElement.html(data.WORK_TIME);

                listTxtElement.show();
            }
        };

        const changeTitleColor = function (equipStatus, tableElement) {
            let labelColorId;
            let equipLabelElement = $(tableElement).find('.equipLabel');

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
                default:
                    labelColorId = 'bg-yellow';
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

        let createPlanGrid = function () {
            const processPlanPostData1 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC1_PLAN_FORM')}};
            const processPlanPostData2 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC2_PLAN_FORM')}};
            const processPlanPostData3 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC3_PLAN_FORM')}};
            const processPlanPostData4 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC4_PLAN_FORM')}};
            const processPlanPostData5 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC5_PLAN_FORM')}};
            const processPlanPostData6 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC6_PLAN_FORM')}};
            const processPlanPostData7 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC7_PLAN_FORM')}};
            const processPlanPostData8 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC8_PLAN_FORM')}};
            const processPlanPostData9 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC9_PLAN_FORM')}};
            const processPlanPostData10 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC10_PLAN_FORM')}};
            const processPlanPostData11 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC11_PLAN_FORM')}};
            const processPlanPostData12 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC12_PLAN_FORM')}};
            const processPlanPostData13 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC13_PLAN_FORM')}};
            const processPlanPostData14 = {dataModel: {postData: fnFormToJsonArrayData('#MCT_NC14_PLAN_FORM')}};

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
            const processPlanObj12 = $.extend(true, {}, planObj, processPlanPostData12);
            const processPlanObj13 = $.extend(true, {}, planObj, processPlanPostData13);
            const processPlanObj14 = $.extend(true, {}, planObj, processPlanPostData14);

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
            $processPlanGrid12 = $('#' + processPlanGrid12Id).pqGrid(processPlanObj12);
            $processPlanGrid13 = $('#' + processPlanGrid13Id).pqGrid(processPlanObj13);
            $processPlanGrid14 = $('#' + processPlanGrid14Id).pqGrid(processPlanObj14);
        };
        /* function */

        /* event */
        $('#MCT_PLAN_MANAGE_SEARCH_FORM').on('change', function () {
            destroyForm();
            loadMctInfo();
            createPlanGrid();
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

        $('#MCT_TARGET_SAVE').on('click', function () {
            // console.count();
            fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget', 'machine.insertMctPlanFromTarget']);
            setTimeout(refreshMctPlanGrids, 1000);
        });

        $('#MCT_PROCESS_TARGET_FORM').find('#OPTION').on('change', function () {
           const str = this.value;
           const outsourcingProcessing = str.includes('외주가공');
           const NcComplete = str.includes('NC완료');
           const finishedProcessing = str.includes('가공완료');
           const $MCT_PROCESS_TARGET_FORM = $('#MCT_PROCESS_TARGET_FORM');

           $MCT_PROCESS_TARGET_FORM.find('#OUTSOURCING_PROCESSING').val(outsourcingProcessing);
           $MCT_PROCESS_TARGET_FORM.find('#NC_COMPLETE').val(NcComplete);
           $MCT_PROCESS_TARGET_FORM.find('#FINISHED_PROCESSING').val(finishedProcessing);
        });
        /* event */

        /* init */
        createPlanGrid();
        $processTargetGrid = $('#' + processTargetGridId).pqGrid(processTargetGridObj);

        fnCommCodeDatasourceSelectBoxCreate($('#MCT_PROCESS_TARGET_FORM').find('#EQUIP_SEQ'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'machine.selectNCMachineList'}
        });

        $('#MCT_TARGET_SAVE').on('click', function () {
            // console.count();
            fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget', 'machine.insertMctPlan']);
            setTimeout(refreshMctPlanGrids, 1000);
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
