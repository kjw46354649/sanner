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

</style>

<div class="page mct mct-mange-page">
    <div class="topWrap">
        <form id="MCT_PLAN_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectEquipId">
            <div class="hWrap">
                <h2 style="height: 42px; line-height: 42px;">MCT가공계획 관리</h2>
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
                <label class="switch ml-10" style="height: 25px;">
                    <input type="checkbox" id="toggleImageView">
                    <span class="slider round"></span>
                </label>
                <span class="refresh ml-10"><button type="button" id="MCT_PLAN_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
            </div>
        </form>
        <div class="conWrap">
            <div class="tableWrap">
                <ul>
                    <li id="layout_1_1" style="min-width: 400px;"></li>
                    <li id="layout_1_2" style="min-width: 400px;"></li>
                    <li id="layout_1_3" style="min-width: 400px;"></li>
                    <li id="layout_1_4" style="min-width: 400px;"></li>
                    <li id="layout_1_5" style="min-width: 400px;"></li>
                    <li id="layout_1_6" style="min-width: 400px;"></li>
                    <li id="layout_1_7" style="min-width: 400px;"></li>
                    <li id="layout_1_8" style="min-width: 400px;"></li>
                </ul>
                <ul>
                    <li id="layout_2_1" style="min-width: 400px;"></li>
                    <li id="layout_2_2" style="min-width: 400px;"></li>
                    <li id="layout_2_3" style="min-width: 400px;"></li>
                    <li id="layout_2_4" style="min-width: 400px;"></li>
                    <li id="layout_2_5" style="min-width: 400px;"></li>
                    <li id="layout_2_6" style="min-width: 400px;"></li>
                    <li id="layout_2_7" style="min-width: 400px;"></li>
                    <li id="layout_2_8" style="min-width: 400px;"></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="bottomWrap">
        <div class="hWrap" style="padding: 0;">
            <form id="MCT_PROCESS_TARGET_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="machine.selectWorkPlanGridList">
                <div class="d-flex align-items-center" style="padding: 0 20px;">
                    <div>
                        <h2 style="height: 42px; line-height: 42px;">가공 대상 List</h2>
                        <span class="slt_wrap ml-20">
                            <label class="label_50" for="COMP_CD">공장구분</label>
                            <select class="wd_70" name="COMP_CD" id="COMP_CD" title="공장구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1014}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" for="POP_POSITION">현재위치</label>
                            <select class="wd_70" id="POP_POSITION" name="POP_POSITION" title="현재위치">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1009}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_30" for="MATERIAL_TYPE">재질</label>
                            <select class="wd_70" name="MATERIAL_TYPE" id="MATERIAL_TYPE" title="재질">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1035}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="chk_box"><input id="ALLOCATION_COMPLETED_EXCLUDED" name="ALLOCATION_COMPLETED_EXCLUDED" type="checkbox"><label for="ALLOCATION_COMPLETED_EXCLUDED">배정완료제외</label></span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_80" for="CONTROL_NUM_OR_DRAWING_NUM">관리/도면번호</label>
                            <input type="search" class="wd_100" name="CONTROL_NUM_OR_DRAWING_NUM" id="CONTROL_NUM_OR_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" for="OPTION">Option</label>
                            <select class="wd_100" name="OPTION" id="OPTION">
                                <option value=""><spring:message code="com.form.top.sel.option"/></option>
                                <option value="OUTSOURCING_PROCESSING">외주가공</option>
                                <option value="NC_COMPLETE">NC완료</option>
                                <option value="FINISHED_PROCESSING">가공완료</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" for="MATERIAL_KIND">소재형태</label>
                            <select class="wd_100" name="MATERIAL_KIND" id="MATERIAL_KIND" title="소재형태">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1029}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_50" for="">소재 Size</label>
                            <select class="wd_100" name="" id="" title="소재 Size">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </div>
                    <div class="ml-auto">
                        <button class="defaultBtn btn-50w green" type="button" id="MCT_TARGET_SAVE">저장</button>
                        <span class="refresh "><button type="button" id="MCT_TARGET_REFRESH"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></button></span>
                    </div>
                </div>
            </form>
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
        const NC_MACHINE = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'machine.selectNCMachineList'}
        });
        let isActiveDrawingView = false;
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
            str += '            <span class="equipLabel" onclick="g_mct_plan_detail_pop_view('+equipSeq+')">';
            str += '                <span class="ellipsis" id="NC' + order + '_EQUIP_NM" style="width: 32px;">' + equipNm + '</span>';
            str += '                <span class="ellipsis" id="NC' + order + '_WORK_USER_ID" style="width: 42px;"></span>';
            str += '            </span>';
            str += '            <p class="listTxt" style="display: none;">';
            str += '                <span class="ellipsis" id="NC' + order + '_CONTROL_NUM" style="width: 125px; text-decoration: underline; cursor: pointer;"></span>';
            str += '                <span class="ellipsis" id="NC' + order + '_PART_UNIT_QTY" style="width: 17px;"></span>';
            str += '                <span class="ellipsis" id="NC' + order + '_MATERIAL_TYPE" style="width: 37px;"></span>';
            str += '                <span class="ellipsis" id="NC' + order + '_WORK_TIME" style="width: 77px;"></span>';
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

        const processPlanColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
            {title: 'EQUIP_SEQ', dataIndx: 'EQUIP_SEQ', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'MCT_PLAN_SEQ', dataType: 'integer', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
            // {title: 'WORK_USER_ID', dataIndx: 'WORK_USER_ID', hidden: true},
            // {title: 'WORK_STATUS', dataIndx: 'WORK_STATUS', hidden: true},
            {title: 'SORT_NUM', dataType: 'integer', dataIndx: 'SORT_NUM', hidden: true},
            {title: '납기', minWidth: 40, dataIndx: 'INNER_DUE_DT'},
            {
                title: '작업지시번호', width: 200, dataIndx: 'CONTROL_NUM',
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.bind('click', function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '수량', minWidth: 30, width: 30, dataIndx: 'CONTROL_PART_QTY'},
            {title: '재질', width: 50, dataIndx: 'MATERIAL_TYPE', hidden: true},
            {title: '재질', width: 50, dataIndx: 'MATERIAL_TYPE_NM_SUBSTR'},
            {title: '예상', width: 50, dataIndx: 'WORKING_TIME'},
            {
                title: '', minWidth: 30, dataIndx: 'DELETE_BUTTON', editable: false,
                render: function () {
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
            width: 380,
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
                // let totalRecords = data.length;
                let tableElement = this.element.closest('.table');
                let equipSeq = tableElement.closest('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_SEQ').val();
                let parameters = {'url': '/json-list', 'data': {'queryId': 'machine.selectProcessPlanGridInfo', 'EQUIP_SEQ': equipSeq}};

                fnPostAjax(function (data) {
                    let rowData = data.list[0];
                    changeTitleColor(rowData.EQUIP_STATUS, tableElement);
                    rowData.EQUIP_STATUS === undefined ? showTitle(null, tableElement) : showTitle(rowData, tableElement);
                }, parameters, '');

                changeFooter(data, tableElement);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $(this.element.context).pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            change: function (event, ui) {
                gridChange(this, ui);
            }
        };
        $('.mct-mange-page').dblclick(function(e) {
            if($(e.target).hasClass("pq-cont-inner pq-cont-right")) {
                if(!$(e.target).hasClass("pq-table-right pq-table")){
                    var parentLi = $(e.target).parents('li');
                    var equipSeq = parentLi.find("#EQUIP_SEQ").val();
                    g_mct_plan_detail_pop_view(equipSeq)
                }
            }
        });

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
                    {title: '공정', dataIndx: 'RECENTLY_WORK_TYPE'},
                    {title: '기기명', width: 60, dataIndx: 'RECENTLY_EQUIP_NM'},
                    {title: '작업자', width: 80, dataIndx: 'RECENTLY_WORK_USER_NM'},
                    {title: 'R/T', width: 55, datatype: 'integer', align: 'right', dataIndx: 'RECENTLY_WORKING_TIME'},
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
            {title: '작업지시번호', align: 'left', width: 160, dataIndx: 'CONTROL_NUM_PART_NUM'},
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
            {title: '수량<br>추가', dataType: 'integer', dataIndx: 'ADDITIONAL_QTY'},
            {title: '발주<br>수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY'},
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
            load: function () {
                if ($('#ALLOCATION_COMPLETED_EXCLUDED').prop('checked')) {
                    $('#ALLOCATION_COMPLETED_EXCLUDED').click();
                    $('#ALLOCATION_COMPLETED_EXCLUDED').click();
                }
            },
            rowSelect: function (event, ui) {
                const rowData = ui.addList[0].rowData;

                setPlanSelection(rowData);
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $processTargetGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            }
        };

        /* function */
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

        const refreshTargetGrid1 = function (actionType, data) {
            const processTargetGridData = $processTargetGrid.pqGrid('option', 'dataModel.data');
            const rowIndx = processTargetGridData.findIndex(function (element) {
                return element.CONTROL_DETAIL_SEQ === data.CONTROL_DETAIL_SEQ;
            });

            $processTargetGrid.pqGrid('updateRow', {
                'rowIndx': rowIndx,
                row: {
                    'MCT_PLAN_SEQ': actionType !== 'delete' ? data.MCT_PLAN_SEQ : null,
                    'EQUIP_SEQ': actionType !== 'delete' ? data.EQUIP_SEQ : null,
                    'WORKING_TIME': actionType !== 'delete' ? data.WORKING_TIME : null,
                },
                track: false,
                checkEditable: false
            });

            $processTargetGrid.pqGrid('refreshRow', {rowIndx: rowIndx});
        };

        const destroyForm = function () {
            $('[id^=layout]').empty();
        };

        /**
         * @description
         * @param thisObject
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
                equipNmElement.prop('title', data.EQUIP_NM);
                workUserIdElement.html(data.WORK_USER_NM);
                workUserIdElement.prop('title', data.WORK_USER_NM);
                controlNumElement.html(data.CONTROL_NUM);
                controlNumElement.prop('title', data.CONTROL_NUM);
                controlNumElement.removeAttr('onClick');
                if (data.CONTROL_SEQ && data.CONTROL_DETAIL_SEQ) {
                    controlNumElement.attr('onClick', 'g_item_detail_pop_view(' + data.CONTROL_SEQ + ',' + data.CONTROL_DETAIL_SEQ + ');');
                }
                materialTypeElement.html(data.MATERIAL_TYPE_NM_SUBSTR);
                materialTypeElement.prop('title', data.MATERIAL_TYPE_NM_SUBSTR);
                partUnitQtyElement.html(data.CONTROL_PART_QTY);
                partUnitQtyElement.prop('title', data.CONTROL_PART_QTY);
                workTimeElement.html(data.WORK_TIME);
                workTimeElement.prop('title', data.WORK_TIME);

                listTxtElement.show();
            }
        };

        const changeTitleColor = function (equipStatus, tableElement) {
            let labelColorId;
            let equipLabelElement = $(tableElement).find('.equipLabel');

            switch (equipStatus) {
                case '진행중':
                    // labelColorId = 'bg-green';
                    labelColorId = 'bg-real-green';
                    break;
                case '완료':
                    labelColorId = 'bg-lightgray';
                    // labelColorId = 'bg-real-green';
                    // labelColorId = 'bg-skyblue';
                    break;
                case '취소':
                    labelColorId = 'bg-yellow';
                    break;
                case '임시중지':
                    // labelColorId = 'bg-orange';
                    labelColorId = 'bg-real-yellow';
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
            let actionType;
            let obj = {};

            switch (ui.source) {
                case 'addNodes':
                    actionType = 'add';
                    let $grid = $(thisObject.element.context);
                    ui.addList[0].newRow.EQUIP_SEQ = $grid.closest('[id^=MCT_NC][id$=PLAN_FORM]').children('#EQUIP_SEQ').val();
                    ui.addList[0].newRow.ROWNUM = $grid.pqGrid('option', 'dataModel.data').length;
                    obj = ui.addList[0].newRow;
                    break;
                case 'edit':
                case 'update':
                    actionType = 'update';
                    obj = ui.updateList[0].rowData;
                    break;
                case 'delete':
                case 'deleteNodes':
                    actionType = 'delete';
                    obj = ui.deleteList[0].rowData; //FIXME: ????

                    changeSortNum(thisObject, $(thisObject.element.context));
                    break;
            }

            let parameters = {
                'url': '/modifyMctPlan',
                'data': {actionType: actionType, data: JSON.stringify(obj)}
            };
            fnPostAjax(function (data) {
                const flag = data.flag;

                if (flag) {
                    fnAlert(null, '<spring:message code="error.common"/>');
                    return false;
                }

                refreshMctPlanGrids();
                refreshTargetGrid1(actionType, data.data);
            }, parameters, '');
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

        const setPlanSelection = function (rowData) {
            for (let i = 1; i <= 14; i++) {
                if ($('#PROCESS_PLAN_GRID' + i).hasClass('pq-grid')) {
                    //deselect everything.
                    $('#PROCESS_PLAN_GRID' + i).pqGrid('setSelection', null);
                    const data = $('#PROCESS_PLAN_GRID' + i).pqGrid('option', 'dataModel.data');
                    const found = data.findIndex(element => Number(element.MCT_PLAN_SEQ) === Number(rowData.MCT_PLAN_SEQ));

                    if (found !== -1){
                        $('#PROCESS_PLAN_GRID' + i).pqGrid('setSelection', {rowIndx: found});
                    }
                }
            }
        };
        /* function */

        /* event */
        $('#MCT_PLAN_MANAGE_SEARCH_FORM #FACTORY_AREA').on('change', function () {
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

        $('#MCT_PROCESS_TARGET_FORM #COMP_CD,#MCT_PROCESS_TARGET_FORM #POP_POSITION,#MCT_PROCESS_TARGET_FORM #MATERIAL_TYPE,#MCT_PROCESS_TARGET_FORM #CONTROL_NUM_OR_DRAWING_NUM, #MCT_PROCESS_TARGET_FORM #OPTION, #MCT_PROCESS_TARGET_FORM #MATERIAL_KIND').on('change', function () {
            $processTargetGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#MCT_PROCESS_TARGET_FORM'));
            });
            $processTargetGrid.pqGrid('refreshDataAndView');
        });

        $('#MCT_TARGET_SAVE').on('click', function () {
            fnModifyPQGrid($processTargetGrid, [], ['machine.updateMctTarget', 'machine.insertMctPlanFromTarget']);
            setTimeout(refreshMctPlanGrids, 1000);
        });

        $('#ALLOCATION_COMPLETED_EXCLUDED').on('click', function () {
            const checked = this.checked;
            const data = $processTargetGrid.pqGrid('option', 'dataModel').data;

            for (let i = 0, LENGTH = data.length; i < LENGTH; i++) {
                let rowData = data[i];
                if (checked) {
                    if (rowData.EQUIP_SEQ) {
                        rowData.pq_hidden = true;
                    }
                } else {
                    rowData.pq_hidden = false;
                }
            }
            $processTargetGrid.pqGrid("refreshView");
        });

        $('#toggleImageView').on('click', function () {
            isActiveDrawingView = !isActiveDrawingView;
        });

        $('#mct_plan_detail_pop').on({
            'hide.bs.modal': function () {
                refreshMctPlanGrids();
                refreshTargetGrid();
            }
        });
        $(document).on({
            mouseenter: function () {
                if (isActiveDrawingView) {
                    const id = $(this).attr('id');
                    const splits = id.split('-');
                    const rowIndx = splits[4];
                    const rowData = $(this).closest('.pq-grid').pqGrid('getRowData', {rowIndx: rowIndx});

                    if (rowData.IMG_GFILE_SEQ) {
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    }
                }
            }
        }, '[id^=PROCESS_PLAN_GRID] .pq-grid-row');

        $(document).on({
            mouseenter: function () {
                if (isActiveDrawingView) {
                    const id = $(this).attr('id');
                    const splits = id.split('-');
                    const rowIndx = splits[4];
                    const rowData = $(this).closest('.pq-grid').pqGrid('getRowData', {rowIndx: rowIndx});

                    if (rowData.IMG_GFILE_SEQ) {
                        callQuickDrawingImageViewer(rowData.IMG_GFILE_SEQ);
                    }
                }
            }
        }, '#PROCESS_TARGET_GRID .pq-grid-row');
        /* event */

        /* init */
        createPlanGrid();
        $processTargetGrid = $('#' + processTargetGridId).pqGrid(processTargetGridObj);
        /* init */
    });
</script>
