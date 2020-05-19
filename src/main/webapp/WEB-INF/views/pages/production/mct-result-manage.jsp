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

<div class="page estimate">
    <div class="topWrap">
        <form id="barcode_form" role="form">
            <input type="hidden" id="barcode_input">
        </form>
        <form class="form-inline" id="MCT_RESULT_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectResultManageList">
            <div class="gubunWrap row_two">
                <ul>
                    <li>
                        <span class="slt_wrap">
			<input type="text" id="justAnInputBox" placeholder="Select" autocomplete="off"/>

<%--                            <label class="label_100" for="COMP_CD">NC NO.</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>--%>
                        </span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">재질</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM">
                        </span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="MCT_RESULT_MANAGE_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="FACTORY_AREA">AREA 구분</label>
                            <select name="FACTORY_AREA" id="FACTORY_AREA">
                                <c:forEach var="code" items="${HighCode.H_1005}">
                                    <c:if test="${code.ETC1 == 'MCT_PROCESS_PLAN'}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="txt_span pd-right20">Option</span>
                        <span class="chk_box"><input id="option1" type="checkbox"><label for="option1"> 자재사급</label></span>
                        <span class="chk_box"><input id="option2" type="checkbox"><label for="option2"> 외주</label></span>
                        <span class="chk_box"><input id="option3" type="checkbox"><label for="option3"> 未단가</label></span>
                        <span class="chk_box"><input id="option4" type="checkbox"><label for="option4"> 긴급</label></span>
                        <span class="chk_box"><input id="option5" type="checkbox"><label for="option5"> part 숨기기</label></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="MCT_RESULT_DETAIL_VIEW" onclick="alert('개발중입니다')">상세정보 조회</button>
                <button type="button" class="defaultBtn btn-120w" id="MCT_RESULT_DRAWING_VIEW" onclick="alert('개발중입니다')">도면보기</button>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="MCT_RESULT_MANAGE_GRID"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let $mctResultManageGrid;
        const gridId = 'MCT_RESULT_MANAGE_GRID';
        let postData = fnFormToJsonArrayData('#MCT_RESULT_MANAGE_SEARCH_FORM');
        const colModel = [
            {title: 'ROWNUM', dataType: 'string', dataIndx: 'ROWNUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM<br>진행', dataType: 'string', dataIndx: 'camwlsgod'},
            {title: '납기', dataType: 'string', dataIndx: 'INNER_DUE_DT'},
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
            {title: '주요', dataType: 'string', dataIndx: 'MAIN_INSPECTION'},
            {title: '형태', dataType: 'string', dataIndx: 'WORK_NM'},
            {
                title: 'MCT Plan/Actual', align: 'center', colModel: [
                    {
                        title: 'Seq1', align: 'center', colModel: [
                            {title: '', datatype: 'string', dataIndx: 'EQUIP_ID_1',
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
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_1', editable: true,
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
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_1', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq2', align: 'center', colModel: [
                            {title: '', datatype: 'string', dataIndx: 'EQUIP_ID_2',
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
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_2', editable: true,
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
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_2', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq3', align: 'center', colModel: [
                            {title: '', datatype: 'string', dataIndx: 'EQUIP_ID_3',
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
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_3', editable: true,
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
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_3', hidden: true}
                        ]
                    },
                    {
                        title: 'Seq4', align: 'center', colModel: [
                            {title: '', datatype: 'string', dataIndx: 'EQUIP_ID_4',
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
                            {title: '', datatype: 'string', dataIndx: 'WORKING_TIME_4', editable: true,
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
                            {title: '', datatype: 'integer', dataIndx: 'MCT_PLAN_SEQ_4', hidden: true}
                        ]
                    },
                ]
            },
            {title: '현재위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS'},
            {
                title: '가공진행 현황', align: 'center', colModel: [
                    {title: 'NC', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY'},
                    {title: '밀링', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '선반', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                    {title: '연마', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY'},
                ]
            },
            {title: '', dataType: 'string',
                render: function (ui) {
                    return '<span class="ui-icon ui-icon-newwin" name="MCT_RESULT_DETAIL_VIEW" style="cursor: pointer;"></span>';
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('[name=MCT_RESULT_DETAIL_VIEW]').on('click', function () {
                        alert('개발중입니다.');
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM'},
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM'},
            {title: '소재종류상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '수량', dataType: 'integer', dataIndx: 'ORDER_QTY'},
            {title: '규격', dataType: 'string', dataIndx: 'STANDARD_SIZE'},
            {title: '소재 Size', dataType: 'string', dataIndx: 'MATERIAL_SIZE'},
            {title: '비고 기록사항', dataType: 'string', dataIndx: 'NOTE'},
            {title: '예상가공<br>시간(분)', dataType: 'integer', dataIndx: 'OUTSIDE_STATUS_DT'},
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
            {title: 'CAM 작업 수행', width: 150, dataType: 'string', dataIndx: 'zoawkrdjqtngod',
                render: function (ui) {
                    //TODO: cam 상태

                     console.log(ui);
                     const startBtn = '<button type="button" class="defaultBtn mct" name="MCT_WORK_ACTION" value="start">시작</button>';
                     const deleteBtn = '<button type="button" class="defaultBtn mct" name="MCT_WORK_ACTION" value="delete">삭제</button>';
                     const deleteDisabledBtn = '<button type="button" class="defaultBtn mct" disabled name="MCT_WORK_ACTION" value="delete">삭제</button>';
                     const finishBtn = '<button type="button" class="defaultBtn camFinishBtn" name="MCT_WORK_ACTION" value="finish">완료</button>';
                     const pauseBtn = '<button type="button" class="defaultBtn camPauseBtn" name="MCT_WORK_ACTION" value="pause">중지</button>';
                     const cancelBtn = '<button type="button" class="defaultBtn camCancelBtn" name="MCT_WORK_ACTION" value="cancel">취소</button>';

                    switch (status) {
                        case '진행중':
                            return finishBtn + pauseBtn + cancelBtn;
                            break;
                        case '대기':
                            return startBtn + deleteDisabledBtn;
                            break;
                        case '완료':
                            return startBtn + deleteBtn;
                            break;
                        default:
                            return startBtn + deleteDisabledBtn;
                    }
                },
                postRender: function (ui) {
                    // let rowIndx = ui.rowIndx;
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    $cell.find('[name=MCT_WORK_ACTION]').on('click', function () {
                        switch (this.value) {
                            case 'start':
                                // 상세정보 조회 open
                                break;
                            case 'delete':
                                break;
                            case 'finish':
                                break;
                            case 'pause':
                                break;
                            case 'cancel':
                                break;
                        }
                        alert('개발중입니다.');
                    });
                }
            },
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'step', datatype: 'integer', dataIndx: 'tmxpq'},
                    {title: '가공위치', datatype: 'string', dataIndx: 'rkrhddnlcl'},
                    {title: '작업내용', datatype: 'string', dataIndx: 'wkrdjqsodyd'},
                    {title: '작업자', datatype: 'string', dataIndx: 'wkrdjqwk'},
                    {title: '파일', datatype: 'string', dataIndx: 'vkdlf'},
                    {title: '비고 및 공유사항', datatype: 'string', dataIndx: 'qlrhalcrhddbtkgkd'},
                    {title: 'Update', datatype: 'string', dataIndx: 'djqepdlxm'}
                ]
            },
            {title: '이전<br>위치', dataType: 'string', dataIndx: 'POP_PREV_POSITION'},
            {
                title: '과거 경험(NC 기준)', align: 'center', colModel: [
                    {title: '1ea L/T', datatype: 'string', dataIndx: '1ea L/T'},
                    {title: '날짜', datatype: 'string', dataIndx: '날짜'},
                    {title: '수행자', datatype: 'string', dataIndx: '수행자'}
                ]
            },
            {
                title: '과거 경험(NC 기준)', align: 'center', colModel: [
                    {title: '1ea L/T', datatype: 'string', dataIndx: '1ea L/T'},
                    {title: '날짜', datatype: 'string', dataIndx: '날짜'},
                    {title: '수행자', datatype: 'string', dataIndx: '수행자'}
                ]
            },
            {title: '가공확정<br>일시', dataType: 'string', dataIndx: 'SATAUS_DT'},
            {title: '소재입고<br>일시', dataType: 'string', dataIndx: 'MATERIAL_INNER_DT'},
            {
                title: '품질현황', align: 'center', colModel: [
                    {title: 'Seq.', datatype: 'integer', dataIndx: 'seq11'},
                    {title: '판정', datatype: 'string', dataIndx: '날짜'},
                    {title: '불량Code', datatype: 'string', dataIndx: '불량code'},
                    {title: '원인', datatype: 'string', dataIndx: '원인'},
                    {title: '작성일자', datatype: 'string', dataIndx: '작성일자'}
                ]
            }
        ];

        const obj = {
            minHeight: '100%',
            height: 700,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: true,
            showTitle: false,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData, recIndx: 'ROWNUM',
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

        /* event */
        $('#MCT_RESULT_MANAGE_SEARCH').on('click', function () {
            $mctResultManageGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return (fnFormToJsonArrayData('#MCT_RESULT_MANAGE_SEARCH_FORM'));
            });
            $mctResultManageGrid.pqGrid('refreshDataAndView');
        });
        
        $('#MCT_RESULT_DETAIL_VIEW').on('click', function () {

        });
        /* event */

        /* init */
        /*
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_HISTORY_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        */
        $mctResultManageGrid = $('#' + gridId).pqGrid(obj);
        /* init */
    });
</script>
