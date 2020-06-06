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
<div class="popup_container cma_work_manage_detail_pop" id="cma_work_manage_detail_pop" style="display: none;">
    <form class="form-inline" id="cam_work_manage_pop_form" name="cam_work_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="machine.selectCommItemDetailInfo"/>
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
        <div class="layerPopup">
            <h3>CAM 작업 관리</h3>
            <button type="button" class="pop_close mg-top10 mg-right8" id="popClose2">닫기</button>
            <div class="qualityWrap">
                <h4>관리번호</h4>
                <div class="list1">
                    <table class="rowStyle">
                        <colgroup>
                            <col width="10%">
                            <col width="60%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td id="CONTROL_NUM" class="red"></td>
                            <th>도면번호</th>
                            <td id="DRAWING_NUM" class="red"></td>
                            <th colspan="2">주문수량</th>
                            <td colspan="2" id="INNER_DUE_DT"></td>
                        </tr>
                        <tr>
                            <th>도면번호</th>
                            <td id="ITEM_NM"></td>
                        </tr>
                    </table>
                </div>
                <div class="listdiv">
                    <div class="tableWrap" >
                        <ul class="conWrapPop60">
                            <h4>가공실적 및 기록사항</h4>
                            <div id="cam_work_manage_pop_grid" class=""></div>
                        </ul>
                    </div>
                </div>
                <div class="listdiv">
                    <table class="rowStyle conWrapPopLeft50">
                        <colgroup>
                            <col width="100%">
                        </colgroup>
                        <tr>
                            <th>경험 기록사항(Lessons Learned)</th>
                        </tr>
                        <tr>
                            <th><textarea id="HISTORY_NOTE" name="HISTORY_NOTE"></textarea></th>
                        </tr>
                    </table>
                    <table class="rowStyle conWrapPopRi50">
                        <colgroup>
                            <col width="100%">
                        </colgroup>
                        <tr>
                            <th>비고 및 공유사항</th>
                        </tr>
                        <tr>
                            <th><textarea id="NOTE" name="NOTE"></textarea></th>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="defaultBtn orange" id="camWorkTempSaveBtn">임시저장</button>
                <button type="button" class="defaultBtn green" id="camWorkSaveAndCompleteBtn">저장 & 완료</button>
                <button type="button" class="defaultBtn red" id="camWorkCancelBtn">취소</button>
                <button type="button" class="defaultBtn grayPopGra" id="camWorkManageCloseBtn">닫기</button>
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
                        <button type="button" class="right_float defaultBtn radius blue" id="CONTROL_SALES_CLOSING_HISTORY_SEARCH">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="mctResultDetailViewBtn" >상세정보 조회</button>
                <button type="button" class="defaultBtn btn-120w" id="mctResultDrawingViewBtn" >도면보기</button>
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

    let $mctResultDrawingViewBtn = $("#mctResultDrawingViewBtn");
    let $mctResultDetailViewBtn = $("#mctResultDetailViewBtn");

    $(function () {
        'use strict';
        machineResultManagecolModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM<br>진행', dataType: 'string', dataIndx: 'CAM_STATUS'},
            {title: 'CAM 작업 수행', minWidth: 100, width: 100, dataType: 'string', dataIndx: 'CAM_STATUS',
                render: function (ui) {
                    //TODO: cam 상태
                    const startBtn = '<button type="button" class="miniBtn orange" id="CAM_WORK_START_ACTION">시작</button>';
                    const startDisableBtn = '<button type="button" class="miniBtn black">시작</button>';
                    const finishBtn = '<button type="button" class="miniBtn blue" id="CAM_WORK_COMPLETE_ACTION">완료</button>';
                    const finishDisableBtn = '<button type="button" class="miniBtn black" >완료</button>';
                    // switch (status) {
                    //     case '진행중':
                    //         return finishBtn + pauseBtn + cancelBtn;
                    //         break;
                    //     case '대기':
                    //         return startBtn + deleteDisabledBtn;
                    //         break;
                    //     case '완료':
                    //         return startBtn + deleteBtn;
                    //         break;
                    //     default:
                    //         return startBtn + deleteDisabledBtn;
                    // }
                    return startBtn + '&nbsp;' + finishBtn;
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('#CAM_WORK_START_ACTION').bind('click', function () {
                        let rowData = ui.rowData;
                        let CONTROL_DETAIL_SEQ = rowData.CONTROL_DETAIL_SEQ;
                        let CONTROL_SEQ = rowData.CONTROL_SEQ;

                        console.log(CONTROL_DETAIL_SEQ);
                        console.log(CONTROL_SEQ);

                        g_item_detail_pop_view(CONTROL_SEQ, CONTROL_DETAIL_SEQ);
                    });
                    $cell.find('#CAM_WORK_COMPLETE_ACTION').bind('click', function () {

                        alert('개발중입니다.');
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
                                    return element.value === cellData;
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
                                    return element.value === cellData;
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
                                    return element.value === cellData;
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
                                    return element.value === cellData;
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
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', minWidth: 10, width: 30},
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
                    {title: '작업내용', datatype: 'string', dataIndx: 'WORK_DESC', minWidth: 30, width: 100},
                    {title: '작업자', datatype: 'string', dataIndx: 'WORK_USER_ID', minWidth: 30, width: 50},
                    {title: '파일', datatype: 'string', dataIndx: '', minWidth: 30, width: 60},
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
            minHeight: '100%', height: 700, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
            resizable: false, showTitle: false, strNoRows: g_noData, numberCell: {title: 'No.'},
            trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: machineResultManagecolModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: machineResultManagePostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
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
        /* function */
        /** 제품 시작 상세 표시 **/
        let cam_work_manage_pop = function(CONTROL_SEQ, CONTROL_DETAIL_SEQ) {
            // fnCommCodeDatasourceSelectBoxCreate($("#g_item_detail_pop_form").find("#CAM_WORK_USER_ID"), 'sel', {"url":"/json-list", "data": {"queryId": 'dataSource.getUserList'}});
            //
            // $("#cam_work_manage_pop_form").find("#CONTROL_SEQ").val(CONTROL_SEQ);
            // $("#cam_work_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);
            //
            // $('#cma_work_manage_detail_pop').modal('show');
            //
            // //기본정보
            // $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfo');
            // let parameters = {
            //     'url': '/json-info',
            //     'data': fnFormToJsonArrayData('g_item_detail_pop_form')
            // };
            // fnPostAjax(function (data, callFunctionParam) {
            //     let dataInfo = data.info;
            //     if(dataInfo == null ) {
            //         fnResetFrom("g_item_detail_pop_form");
            //     }else{
            //         //fnJsonDataToForm("stock_manage_pop_form", dataInfo);
            //         $("#g_item_detail_pop_form").find("#CONTROL_NUM").html(dataInfo.CONTROL_NUM);
            //         $("#g_item_detail_pop_form").find("#DRAWING_NUM").html(dataInfo.DRAWING_NUM);
            //         $("#g_item_detail_pop_form").find("#INNER_DUE_DT").html(dataInfo.INNER_DUE_DT);
            //     }
            //     $("#g_item_detail_pop_form").find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
            //     g_ItemDetailPopObj01.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
            //     g_ItemDetailPopGridId01.pqGrid(g_ItemDetailPopObj01);
            //
            // }, parameters, '');
            //
            // }
            // $("#cma_work_manage_detail_pop").on('hide.bs.modal', function(){
            //     fnResetFrom("cam_work_manage_pop_form");
            //     g_ItemDetailPopGridId01.pqGrid('destroy');
            // });
        }

        /* event */
        $('#MCT_RESULT_MANAGE_SEARCH').on('click', function () {
            // $mctResultManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
            //     return (fnFormToJsonArrayData('#MCT_RESULT_MANAGE_SEARCH_FORM'));
            // });
            // $mctResultManageGrid.pqGrid('refreshDataAndView');
        });

        /** 제품 상세 보기 */
        $mctResultDetailViewBtn.click(function(event) {
            g_item_detail_pop_view("", "");
        });

        /** 도면 보기 **/
        $mctResultDrawingViewBtn.click(function(event) {
            callWindowImageViewer(999);
        });

        /* event */
        $mctResultManageGrid = $('#' + machineResultManageGridId).pqGrid(machineResultManageObj);
    });
</script>
