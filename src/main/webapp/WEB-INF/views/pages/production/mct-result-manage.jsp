<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-05-11
  Time: 오후 3:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- cam 작업관리 popup -->
<div class="popup_container cam_work_manage_detail_pop" id="cam_work_manage_detail_pop" style="display: none;">
    <form class="form-inline" id="cam_work_manage_pop_form" name="cam_work_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectCamDetailInfo"/>
        <input type="hidden" id="actionType" name="actionType" value=""/>
        <input type="hidden" id="camWorkGrid" name="camWorkGrid" value=""/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
        <input type="hidden" id="CAM_SEQ" name="CAM_SEQ" value=""/>
        <input type="hidden" id="SEQ" name="SEQ" value=""/>
        <input type="hidden" id="CAM_GFILE_SEQ" name="CAM_GFILE_SEQ" value=""/>
        <input type="button" id="camWorkStepFileUploadBtn" style="display: none;">
        <div class="layerPopup">
            <div class="h_area">
                <h3>CAM 작업 관리</h3>
                <button type="button" class="pop_close cam_work_manage_detail_pop_close mg-top10 mg-right8">닫기</button>
            </div>
            <div class="qualityWrap">
                <h4>관리번호</h4>
                <div class="list1">
                    <table class="rowStyle">
                        <colgroup>
                            <col width="10%">
                            <col width="40%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="20%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td id="CONTROL_NUM" colspan="3"></td>
                            <th>진행상태</th>
                            <td id="PART_STATUS"></td>
                        </tr>
                        <tr>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM" colspan="3"></td>
                            <th >도면파일</th>
                            <td id="DXF_GFILE_SEQ"></td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td id="ITEM_NM" colspan="3"></td>
                            <th >주문수량</th>
                            <td id="ORDER_QTY" style="text-align: right; padding-right: 10px;"></td>
                        </tr>
                        <tr>
                            <th>규격</th>
                            <td id="STANDARD_SIZE"></td>
                            <th>소재종류</th>
                            <td id="MATERIAL_DETAIL_NM" colspan="3"></td>
                        </tr>
                    </table>
                </div>
<%--                <div class="listdiv griddiv">--%>
<%--                    <div class="tableWrap" >--%>
<%--                        <ul class="conWrapPop60">--%>
<%--                            <h4>가공실적 및 기록사항</h4>--%>
<%--                            <div id="cam_work_manage_pop_grid" class=""></div>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="griddiv">
                    <h4>가공실적 및 기록사항</h4>
                    <div class="buttonWrap" style="margin-top: 15px; float: right;">
                        <button type="button" id="camWorkManagePopAddBtn" class="miniBtn">추가</button>
                        <button type="button" id="camWorkManagePopDelBtn" class="miniBtn red" style="margin-left: 5px;">삭제</button>
                    </div>
                    <div id="cam_work_manage_pop_grid" class=""></div>
                </div>
                <div class="listdiv">
                    <div class="conWrapLeftPop50">
                        <table class="rowStyle">
                            <colgroup>
                                <col width="100%">
                            </colgroup>
                            <tr>
                                <th style="color:#162f2f; text-align: center;">경험 기록사항(Lessons Learned)</th>
                            </tr>
                            <tr>
                                <td><textarea id="HISTORY_NOTE" name="HISTORY_NOTE" rows="3" cols="60" style="resize: none;"></textarea></td>
                            </tr>
                        </table>
                    </div>
                    <div class="conWrapRightPop50">
                        <table class="rowStyle">
                            <colgroup>
                                <col width="100%">
                            </colgroup>
                            <tr>
                                <th style="color:#162f2f; text-align: center;">비고 및 공유사항</th>
                            </tr>
                            <tr>
                                <td><textarea id="NOTE" name="NOTE" rows="3" cols="60" style="resize: none;"></textarea></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="btnWrap">
                    <button type="button" class="defaultBtn orange afterStart" id="camWorkTempSaveBtn">임시저장</button>
                    <button type="button" class="defaultBtn green afterStart" id="camWorkSaveAndCompleteBtn">저장 & 완료</button>
                    <button type="button" class="defaultBtn purple beforeStart" id="camWorkStartBtn" >작업시작</button>
                    <button type="button" class="defaultBtn red afterStart" id="camWorkCancelBtn">작업 취소</button>
                    <button type="button" class="defaultBtn grayPopGra cam_work_manage_detail_pop_close">닫기</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- cam 작업 관리 popup -->
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="mct_result_manage_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectResultManageList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_ID">NC NO.</label>
                            <select class="wd_200" name="EQUIP_ID" id="EQUIP_ID">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">재질</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">관리번호</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="NOTE">도면번호</label>
                            <input type="text" class="wd_200" name="NOTE" id="NOTE">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="EQUIP_ID">AREA 구분</label>
                            <select class="wd_200" name="EQUIP_ID" id="EQUIP_ID">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="txt_span"><label class="label_100" for="SEL_INSPECT_GRADE">Option</label></span>
                        <span class="chk_box"><input id="SEL_INSPECT_GRADE" name="SEL_INSPECT_GRADE" type="checkbox"><label for="SEL_INSPECT_GRADE">PLAN 미배정 제외</label></span>
                        <span class="chk_box"><input id="SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox"><label for="SEL_OUTSIDE_YN">선택 NC 완료 대상 제외</label></span>
                        <span class="chk_box"><input id="SEL_OUTSIDE_YN" name="SEL_OUTSIDE_YN" type="checkbox"><label for="SEL_OUTSIDE_YN">가공완료 상태 제외</label></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="mctCamManageSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="text" id="mctResultManageFilterKeyword" placeholder="Enter your keyword">
                <select id="mctResultManageFilterColumn"></select>
                <select id="mctResultManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="mctResultManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="mctResultManageFrozen" name="mctResultManageFrozen">
                </select>
                <span class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w" id="mctResultDetailViewBtn" >상세정보 조회</button>
                    <button type="button" class="defaultBtn btn-120w" id="mctResultDrawingViewBtn" >도면보기</button>
                </span>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="machine_result_manage_grid" class="jqx-refresh"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="machine_result_manage_grid-total-records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    let $mctResultManageGrid;
    let machineResultManageGridId = 'machine_result_manage_grid';
    let machineResultManagePostData = fnFormToJsonArrayData('#mct_result_manage_search_form');
    let machineResultManagecolModel;

    let $camWorkManagePopGrid;
    let camWorkManagePopGridId = 'cam_work_manage_pop_grid';
    let camWorkManagePopPostData = fnFormToJsonArrayData('#cam_work_manage_pop_form');
    let camWorkManagePopColModel;
    let camWorkManagePopSelectedRowIndex = [];

    let $camWorkManagePopAddBtn = $("#camWorkManagePopAddBtn");
    let $camWorkManagePopDelBtn = $("#camWorkManagePopDelBtn");

    let $camWorkStartBtn = $("#camWorkStartBtn");
    let $camWorkTempSaveBtn = $("#camWorkTempSaveBtn");
    let $camWorkSaveAndCompleteBtn = $("#camWorkSaveAndCompleteBtn");
    let $camWorkCancelBtn = $("#camWorkCancelBtn");

    let $mctResultDrawingViewBtn = $("#mctResultDrawingViewBtn");
    let $mctResultDetailViewBtn = $("#mctResultDetailViewBtn");

    let $mctCamManageSearchBtn = $("#mctCamManageSearchBtn");

    $(function () {
        'use strict';
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
        machineResultManagecolModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM<br>진행', dataType: 'string', dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    switch (rowData.CAM_STATUS) {
                        case 'CWS030':  // 완료
                            return '완료';
                            break;
                        case 'CWS020':  // 진행중
                            return '진행중';
                            break;
                        case 'CWS010':     // 대기
                            return '대기';
                            break;
                    }
                },
            },
            {title: 'CAM 작업 수행', minWidth: 100, width: 100, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataType: 'string', dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    const startBtn = '<button type="button" class="miniBtn orange" id="CAM_WORK_START_ACTION">시작</button>';
                    const startDisableBtn = '<button type="button" class="miniBtn gray">시작</button>';
                    const finishBtn = '<button type="button" class="miniBtn blue" id="CAM_WORK_COMPLETE_ACTION">완료</button>';
                    const finishDisableBtn = '<button type="button" class="miniBtn gray" >완료</button>';
                    switch (rowData.CAM_STATUS) {
                        case 'CWS030':  // 완료
                            return startBtn + '&nbsp;' + finishDisableBtn;
                            break;
                        case 'CWS020':  // 진행중
                            return startDisableBtn + '&nbsp;' + finishBtn;
                            break;
                        case 'CWS010':     // 대기
                            return startBtn + '&nbsp;' + finishDisableBtn;
                            break;
                    }
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#CAM_WORK_START_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        camWorkManagePop(rowData);
                    });
                    $cell.find('#CAM_WORK_COMPLETE_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        camWorkManagePop(rowData);
                    });
                }
            },
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', minWidth: 15, width: 40},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN', minWidth: 15, width: 20},
            {title: '주<br>요', dataType: 'string', dataIndx: 'MAIN_INSPECTION', minWidth: 15, width: 20},
            {title: '형<br>태', dataType: 'string', dataIndx: 'WORK_NM', minWidth: 15, width: 20},
            {
                title: 'MCT Plan/Actual', align: 'center', colModel: [
                    {title: 'Seq.1', datatype: 'string', dataIndx: 'EQUIP_SEQ_1', minWidth: 15, width: 40,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_1;
                            let backgroundColor = colorClassification(status);

                            if (status) {
                                $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (cellData) {
                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', datatype: 'string', dataIndx: 'WORKING_TIME_1', editable: true, minWidth: 15, width: 40,
                        render: function (ui) {
                            let status = ui.rowData.STATUS_1;
                            let backgroundColor = colorClassification(status);

                            if (status) {
                                return $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (ui.cellData) {
                                return ui.cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_1', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_1', hidden: true},
                    {title: 'Seq.2', datatype: 'string', dataIndx: 'EQUIP_ID_2', minWidth: 15, width: 40,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_2;
                            let backgroundColor = colorClassification(status);

                            if (status) {
                                $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (cellData) {
                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', datatype: 'string', dataIndx: 'WORKING_TIME_2', editable: true, minWidth: 15, width: 40,
                        render: function (ui) {
                            let status = ui.rowData.STATUS_2;
                            let backgroundColor = colorClassification(status);

                            if (status) {
                                return $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }

                            if (ui.cellData) {
                                return ui.cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_2', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_2', hidden: true},
                    {title: 'Seq.3', datatype: 'string', dataIndx: 'EQUIP_ID_3', minWidth: 15, width: 40,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_3;
                            let backgroundColor = colorClassification(status);
                            if (status) {
                                $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (cellData) {
                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', datatype: 'string', dataIndx: 'WORKING_TIME_3', editable: true, minWidth: 15, width: 40,
                        render: function (ui) {
                            let status = ui.rowData.STATUS_3;
                            let backgroundColor = colorClassification(status);
                            if (status) {
                                return $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (ui.cellData) {
                                return ui.cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_3', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_3', hidden: true},
                    {title: 'Seq.4', datatype: 'string', dataIndx: 'EQUIP_ID_4', minWidth: 15, width: 40,
                        render: function (ui) {
                            let cellData = ui.cellData;
                            let status = ui.rowData.STATUS_4;
                            let backgroundColor = colorClassification(status);
                            if (status) {
                                $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }
                            if (cellData) {
                                let index = EQUIP_LIST.findIndex(function (element) {
                                    return element.value === Number(cellData);
                                });
                                return (index < 0) ? cellData : EQUIP_LIST[index].text;
                            }
                        }
                    },
                    {title: 'W/T', datatype: 'string', dataIndx: 'WORKING_TIME_4', editable: true, minWidth: 15, width: 40,
                        render: function (ui) {
                            let status = ui.rowData.STATUS_4;
                            let backgroundColor = colorClassification(status);

                            if (status) {
                                return $mctResultManageGrid.pqGrid('addClass', {rowIndx: ui.rowIndx, dataIndx: ui.dataIndx, cls: backgroundColor});
                            }

                            if (ui.cellData) {
                                return ui.cellData + '분';
                            }
                        }
                    },
                    {title: '', datatype: 'string', dataIndx: 'STATUS_4', hidden: true},
                    {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_4', hidden: true},
                ]
            },
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION', minWidth: 20, width: 80},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', minWidth: 20, width: 80},
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'PROCESS_NC', minWidth: 20, width: 30},
                    {title: '밀링', datatype: 'integer', dataIndx: 'PROCESS_MILLING', minWidth: 20, width: 30},
                    {title: '선반', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_RACK', minWidth: 20, width: 30},
                    {title: '연마', datatype: 'integer', dataIndx: 'PROCESS_PROGRESS_GRINDING', minWidth: 20, width: 30},
                ]
            },
            {title: '', dataType: 'string', minWidth: 20, width: 30,
                render: function (ui) {
                    return '<span class="ui-icon ui-icon-newwin" name="MCT_RESULT_DETAIL_VIEW" style="cursor: pointer;"></span>';
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('[name=MCT_RESULT_DETAIL_VIEW]').on('click', function () {
                        let rowData = ui.rowData;
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 50, width: 160},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 10, width: 30},
            {title: '소재종류상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 40, width: 80},
            {title: '수량', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE', minWidth: 40, width: 80},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERAIL_ORDER_SIZE', minWidth: 40, width: 80},
            {title: '비고 기록사항', dataType: 'string', dataIndx: 'CONTROL_NOTE', minWidth: 40, width: 100},
            {title: '예상가공<br>시간(M)', dataType: 'integer', dataIndx: 'MCT_WORK_TIME', minWidth: 15, width: 50},
            {title: '작업<br>구분', dataType: 'string', dataIndx: 'MCT_WORK_TYPE_NM', minWidth: 15, width: 50},
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'step', datatype: 'integer', dataIndx: 'CAM_STEP', minWidth: 30, width: 35},
                    {title: '가공위치', datatype: 'string', dataIndx: 'WORK_DIRECTION', minWidth: 30, width: 50},
                    {title: '작업내용', datatype: 'string', dataIndx: 'WORK_DESC', minWidth: 30, width: 80},
                    {title: '작업자', datatype: 'string', dataIndx: 'WORK_USER_ID', minWidth: 30, width: 100},
                    {title: '파일', datatype: 'string', dataIndx: '', minWidth: 30, width: 60,
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let iconFiles = '';
                            if(rowData.CAM_FILE_SEQ) iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="cursor: pointer; margin-left:3px;"></span>&nbsp;&nbsp;';
                            if(rowData.NC_FILE_SEQ) iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="cursor: pointer; margin-left:25px;"></span>';
                            return iconFiles;
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('#downloadCAMFIle').bind('click', function(e) {
                                console.log(rowData.CAM_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                console.log(rowData.NC_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },
                    {title: '비고 및 공유사항', datatype: 'string', dataIndx: 'NOTE', minWidth: 100, width: 150},
                    {title: '업데이트', datatype: 'string', dataIndx: 'CAM_FINISH_DT', minWidth: 75, width: 75}
                ]
            },
            {title: '이전<br>위치', dataType: 'string', dataIndx: 'POP_PREV_POSITION', minWidth: 70, width: 70},
            {
                title: '과거 경험(NC 기준)', align: 'center', colModel: [
                    {title: '1ea L/T', datatype: 'string', dataIndx: '1ea L/T', minWidth: 60, width: 60},
                    {title: '날짜', datatype: 'string', dataIndx: '날짜', minWidth: 75, width: 75},
                    {title: '수행자', datatype: 'string', dataIndx: '수행자', minWidth: 50, width: 50}
                ]
            },
            {title: '가공확정<br>일시', dataType: 'string', dataIndx: 'SATAUS_DT', minWidth: 75, width: 75},
            {title: '소재입고<br>일시', dataType: 'string', dataIndx: 'MATERIAL_RECEIPT_DT', minWidth: 75, width: 75},
            {
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'integer', dataIndx: 'INSPECT_STEP', minWidth: 30, width: 35},
                    {title: '판정', datatype: 'string', dataIndx: 'INSPECT_GRADE', minWidth: 30, width: 35},
                    {title: '불량코드', datatype: 'string', dataIndx: 'INSPECT_RESULT', minWidth: 30, width: 70},
                    {title: '불량수량', datatype: 'string', dataIndx: 'ERROR_QTY', minWidth: 20, width: 55},
                    {title: '불량원인', datatype: 'string', dataIndx: 'ERROR_REASON', minWidth: 30, width: 70},
                    {title: '조치방안', datatype: 'string', dataIndx: 'ERROR_NOTE', minWidth: 30, width: 70},
                    {title: '작성일자', datatype: 'string', dataIndx: 'INSPECT_DT', minWidth: 75, width: 75}
                ]
            }
        ];

        let machineResultManageObj = {
            minHeight: '100%', height: 750, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, numberCell: {title: 'No.'},
            trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false, render: mctResultManageFilterRender}, filterModel: { mode: 'OR' },
            colModel: machineResultManagecolModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: machineResultManagePostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
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
                $("#mctResultManageFilterColumn").empty();
                $("#mctResultManageFilterColumn").html(filterOpts);
                $("#mctResultManageFrozen").empty();
                $("#mctResultManageFrozen").html(frozenOts);
            }
        };

        camWorkManagePopColModel = [
            // {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CAM_SEQ', hidden: true},
            {title: 'Step', minWidth: 30, width: 35, dataType: 'integer', dataIndx: 'SEQ'},
            {title: '가공위치', minWidth: 70, width: 70, editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataType: 'string', dataIndx: 'WORK_DIRECTION',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1080')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let departmentOption = fnGetCommCodeGridSelectBox('1080');
                    if (cellData === '') {
                        return '';
                    } else {
                        let index = departmentOption.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = departmentOption.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }
                        return (index < 0) ? cellData : departmentOption[index].text;
                    }
                }
            },
            {title: '작업내용', minWidth: 300, width: 350, editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataType: 'string', dataIndx: 'WORK_DESC'},
            {title: '작업자', minWidth: 70, width: 70, editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'}, dataType: 'string', dataIndx: 'WORK_USER_ID',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}})
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let departmentOption = fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
                    if (cellData === '') {
                        return '';
                    } else {
                        let index = departmentOption.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = departmentOption.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }
                        return (index < 0) ? cellData : departmentOption[index].text;
                    }
                }
            },
            {title: '단위수량', dataType: 'string', editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataIndx: 'DESIGN_QTY', minWidth: 40, width: 60},
            // {title: '계산시간', dataType: 'string', dataIndx: 'WORK_TIME', minWidth: 40, width: 70},
            {title: '대상파일', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editor: false, dataIndx: 'CAM_GFILE_SEQ', minWidth: 250, width: 330,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(rowData.CAM_FILE_NM && rowData.NC_FILE_NM)
                        return rowData.CAM_FILE_NM + ', &nbsp;' + rowData.NC_FILE_NM;
                    else if(rowData.CAM_FILE_NM && !rowData.NC_FILE_NM)
                        return rowData.CAM_FILE_NM;
                    else if(!rowData.CAM_FILE_NM && rowData.NC_FILE_NM)
                        return rowData.NC_FILE_NM;
                    else
                        return "";
                },
            },
            {title: '', dataType: 'string', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, dataIndx: '', minWidth: 50, width: 50,
                render: function (ui) {
                    let rowData = ui.rowData;
                    if(rowData.SEQ) {
                        return '<button type="button" class="miniBtn blue" id="CAM_WORK_FILE_ACTION">파일</button>';
                    }else{
                        return '';
                    }
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    $cell.find('#CAM_WORK_FILE_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        $("#cam_work_manage_pop_form").find("#SEQ").val(rowData.SEQ);
                        $("#common_file_download_form").find("#deleteYn").val("true");
                        commonFileDownUploadPopupCall(rowData.CAM_GFILE_SEQ, 'camWorkStepFileUploadBtn');
                    });
                }
            }
        ];

        $("#camWorkStepFileUploadBtn").on('click', function(){
            let GfileKey = $("#common_file_download_form").find("#GFILE_SEQ").val();
            if(GfileKey > 0) {
                let parameter = {
                    'queryId': 'machine.updateMctCamDetailGfile',
                    'CAM_GFILE_SEQ': GfileKey,
                    'CAM_SEQ': $("#cam_work_manage_pop_form").find("#CAM_SEQ").val(),
                    'SEQ': $("#cam_work_manage_pop_form").find("#SEQ").val()
                };
                let parameters = {'url': '/json-update', 'data': parameter};
                fnPostAjax(function (data, callFunctionParam) {
                    popCamWorkReload();
                }, parameters, '');
            }else{
                popCamWorkReload();
            }
        });

        let camWorkManagePopObj = {
            minHeight: '100%', height: 150, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, rowHtHead: 15, trackModel: {on: true}, numberCell: {show: false }, // numberCell: {title: 'No.'}, trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: true},
            colModel: camWorkManagePopColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: camWorkManagePopPostData, recIndx: 'SEQ',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    camWorkManagePopSelectedRowIndex = [];
                    let userMasterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let userMasterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (userMasterGridFirstRow === userMasterGridLastRow) {
                        camWorkManagePopSelectedRowIndex[0] = userMasterGridFirstRow;
                    } else {
                        for (let i = userMasterGridFirstRow; i <= userMasterGridLastRow; i++) {
                            camWorkManagePopSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        /* variable */



        /* function */
        const colorClassification = function (status) {
            let backgroundColor = '';
            switch (status) {
                case '가동중':
                    backgroundColor = 'bg-green';
                    break;
                case '완료':
                    backgroundColor = 'bg-light_blue';
                    break;
                case '비가동상태':
                    backgroundColor = 'bg-yellow';
                    break;
                case '일시정지상태':
                    backgroundColor = 'bg-orange';
                    break;
            }
            return backgroundColor;
        };

        /** 제품 시작 상세 표시 **/
        let camWorkManagePop = function(rowData) {
            fnResetFrom('cam_work_manage_pop_form');
            $("#cam_work_manage_pop_form").find("#CONTROL_SEQ").val(rowData.CONTROL_SEQ);
            $("#cam_work_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(rowData.CONTROL_DETAIL_SEQ);
            $("#cam_work_manage_pop_form").find("#CAM_SEQ").val(rowData.CAM_SEQ);
            $("#cam_work_manage_pop_form").find("#CONTROL_NUM").html(rowData.CONTROL_NUM);
            $("#cam_work_manage_pop_form").find("#DRAWING_NUM").html(rowData.DRAWING_NUM);
            $("#cam_work_manage_pop_form").find("#ORDER_QTY").html(numberWithCommas(rowData.ORDER_QTY));
            $("#cam_work_manage_pop_form").find("#PART_STATUS").html(numberWithCommas(rowData.PART_STATUS));
            $("#cam_work_manage_pop_form").find("#ITEM_NM").html(numberWithCommas(rowData.ITEM_NM));
            $("#cam_work_manage_pop_form").find("#STANDARD_SIZE").html(numberWithCommas(rowData.STANDARD_SIZE));
            $("#cam_work_manage_pop_form").find("#MATERIAL_DETAIL_NM").html(numberWithCommas(rowData.MATERIAL_DETAIL_NM));
            $("#cam_work_manage_pop_form").find("#HISTORY_NOTE").val(numberWithCommas(rowData.HISTORY_NOTE));
            $("#cam_work_manage_pop_form").find("#NOTE").val(numberWithCommas(rowData.NOTE));

            switch (rowData.CAM_STATUS) {
                case 'CWS010':     // 대기
                case 'CWS030':     // 완료
                    $('#cam_work_manage_detail_pop').find(".beforeStart").show();
                    $('#cam_work_manage_detail_pop').find(".afterStart").hide();
                    break;
                default:
                    $('#cam_work_manage_detail_pop').find(".beforeStart").hide();
                    $('#cam_work_manage_detail_pop').find(".afterStart").show();
                    break;
            }
            $('#cam_work_manage_detail_pop').modal('show');

            $camWorkManagePopGrid = $('#' + camWorkManagePopGridId).pqGrid(camWorkManagePopObj);
            popCamWorkReload();
        };

        function mctResultManageFilterRender(ui) {
            var val = ui.cellData == undefined ? "" : ui.cellData,
                filter = ui.column.filter,
                crules = (filter || {}).crules;

            if (filter && filter.on && crules && crules[0].value) {
                var condition = $("#mctResultManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#mctResultManageFilterKeyword").val(),
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

        $("#cam_work_manage_detail_pop").find('.cam_work_manage_detail_pop_close').on('click', function () {
            $camWorkManagePopGrid.pqGrid('destroy');
            $('#cam_work_manage_detail_pop').modal('hide');
            $mctCamManageSearchBtn.trigger("click");
        });

        /* event */
        $camWorkManagePopAddBtn.click(function(event) {
            $camWorkManagePopGrid.pqGrid('addNodes', [{"CAM_SEQ":$("#cam_work_manage_pop_form").find("#CAM_SEQ").val(), "DESIGN_QTY":1}], 0);
        });

        $camWorkManagePopDelBtn.click(function(event) {
            $camWorkManagePopGrid.pqGrid('deleteRow', {'rowIndx': camWorkManagePopSelectedRowIndex});//rowIndx
            // let camWorkMasterQueryList = 'deleteMctCamDetailWork';
            // fnDeletePQGrid($camWorkManagePopGrid, camWorkManagePopSelectedRowIndex, camWorkMasterQueryList);
            // popCamWorkReload();
        });

        $camWorkStartBtn.click(function(event) {
            let headHtml = "CAM 작업 정보", yseBtn="예", noBtn="아니오";
            let bodyHtml = "<h4><img style='width: 32px; height: 32px;' src='/resource/main/images/print.png'>&nbsp;&nbsp;<span>CAM 작업을 시작 하시겠습니까?</span></h4>";
            fnCommonConfirmBoxCreate(headHtml, bodyHtml, yseBtn, noBtn);
            let camWorkStartSubmitConfirm = function(callback) {
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
            camWorkStartSubmitConfirm(function(confirm){
                if(confirm) {
                    $("#cam_work_manage_pop_form").find("#actionType").val("start");
                    var gridInstance = $camWorkManagePopGrid.pqGrid('getInstance').grid;
                    var changes = gridInstance.getChanges({format: 'byVal'});
                    $("#cam_work_manage_pop_form").find("#camWorkGrid").val(JSON.stringify(changes));
                    let parameters = {
                        'url': '/managerCamWork',
                        'data': $('#cam_work_manage_pop_form').serialize()
                    };
                    fnPostAjax(function (data, callFunctionParam) {
                        $('#cam_work_manage_detail_pop').modal('hide');
                        $mctCamManageSearchBtn.trigger("click");
                    }, parameters, '');
                }
            });
        });

        $camWorkTempSaveBtn.click(function(event) {
            $("#cam_work_manage_pop_form").find("#actionType").val("temp");
            var gridInstance = $camWorkManagePopGrid.pqGrid('getInstance').grid;
            var changes = gridInstance.getChanges({format: 'byVal'});
            $("#cam_work_manage_pop_form").find("#camWorkGrid").val(JSON.stringify(changes));
            let parameters = {
                'url': '/managerCamWork',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            $camWorkTempSaveBtn.focus();
            fnPostAjax(function (data, callFunctionParam) {
                popCamWorkReload();
            }, parameters, '');
        });

        $camWorkSaveAndCompleteBtn.click(function(event) {
            $("#cam_work_manage_pop_form").find("#actionType").val("complete");
            var gridInstance = $camWorkManagePopGrid.pqGrid('getInstance').grid;
            var changes = gridInstance.getChanges({format: 'byVal'});
            $("#cam_work_manage_pop_form").find("#camWorkGrid").val(JSON.stringify(changes));
            let parameters = {
                'url': '/managerCamWork',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            $camWorkSaveAndCompleteBtn.focus();
            fnPostAjax(function (data, callFunctionParam) {
                $('#cam_work_manage_detail_pop').modal('hide');
                $mctCamManageSearchBtn.trigger("click");
            }, parameters, '');
        });

        $camWorkCancelBtn.click(function(event) {
            $("#cam_work_manage_pop_form").find("#actionType").val("cancel");
            var gridInstance = $camWorkManagePopGrid.pqGrid('getInstance').grid;
            var changes = gridInstance.getChanges({format: 'byVal'});
            $("#cam_work_manage_pop_form").find("#camWorkGrid").val(JSON.stringify(changes));
            let parameters = {
                'url': '/managerCamWork',
                'data': $('#cam_work_manage_pop_form').serialize()
            };
            $camWorkCancelBtn.focus();
            fnPostAjax(function (data, callFunctionParam) {
                $('#cam_work_manage_detail_pop').modal('hide');
                $mctCamManageSearchBtn.trigger("click");
            }, parameters, '');
        });

        $mctCamManageSearchBtn.click(function(event) {
            $mctResultManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#mct_result_manage_search_form'));
            });
            $mctResultManageGrid.pqGrid('refreshDataAndView');
        });

        $("#mctResultManageFilterKeyword").on("keyup", function(e){
            fnFilterHandler($mctResultManageGrid, 'mctResultManageFilterKeyword', 'mctResultManageFilterCondition', 'mctResultManageFilterColumn');
        });

        $("#mctResultManageFrozen").on('change', function(e){
            fnFrozenHandler($mctResultManageGrid, $(this).val());
        });

        /** 제품 상세 보기 */
        $mctResultDetailViewBtn.click(function(event) {
            g_item_detail_pop_view("", "");
        });

        /** 도면 보기 **/
        $mctResultDrawingViewBtn.click(function(event) {
            callWindowImageViewer(999);
        });

        let popCamWorkReload = function(){
            $camWorkManagePopGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#cam_work_manage_pop_form');
            } );
            $camWorkManagePopGrid.pqGrid("refreshDataAndView");
        };

        /* function */

        /* event */
        $mctResultManageGrid = $('#' + machineResultManageGridId).pqGrid(machineResultManageObj);

    });


</script>
