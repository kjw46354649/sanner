<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-01
  Time: 오전 10:42
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
        <form class="form-inline" id="CLOSE_HISTORY_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseHistoryList">
            <div class="none_gubunWrap row4_topWrap">
                <ul>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CONTROL_NUM">관리번호</label>
                            <input type="search" class="wd_200" name="CONTROL_NUM" id="CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주사">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUM">발주번호</label>
                            <input type="search" class="wd_200" name="ORDER_NUM" id="ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="DRAWING_NUM">도면번호</label>
                            <input type="search" class="wd_200" name="DRAWING_NUM" id="DRAWING_NUM" title="도면번호">
                        </span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자구분</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD" title="사업자구분">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="ITEM_NM">품명</label>
                            <input type="search" class="wd_200" name="ITEM_NM" id="ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <div class="ipu_wrap">
                            <label class="label_100" for="PROJECT_NM_OR_MODULE_NM">프로젝트/모듈</label>
                            <input type="search" class="wd_200" name="PROJECT_NM_OR_MODULE_NM" id="PROJECT_NM_OR_MODULE_NM">
                        </div>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="RBRUR">규격</label>
                            <select class="wd_200" name="RBRUR" id="RBRUR" title="규격">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <div class="ipu_wrap">
                            <label class="label_100" for="ORDER_NUMBER">INV No.</label>
                            <input type="search" class="wd_200" name="ORDER_NUMBER" id="ORDER_NUMBER">
                        </div>
                        <span class="gubun"></span>
                        <div class="slt_wrap">
                            <label class="label_100" for="UNIT_PRICE">단가</label>
                            <select class="wd_200" id="UNIT_PRICE">
                                <option></option>
                            </select>
                        </div>
                        <span class="gubun"></span>
                        <div class="ipu_wrap">
                            <label class="label_100" for="AMOUNT_SUM">금액합산</label>
                            <input type="search" class="wd_200" name="AMOUNT_SUM" id="AMOUNT_SUM" readonly>
                        </div>
                    </li>
                    <li>
                        <div class="ipu_wrap d-inline-block" style="width:662px">
                            <label class="label_100">마감/종료 월</label>
                            <span class="calendar_span">
                                <input type="text" name="CONTROL_CLOSE_HISTORY_START_DATE" id="CONTROL_CLOSE_HISTORY_START_DATE"><button type="button" id="CONTROL_CLOSE_HISTORY_START_DATE_BUTTON">달력선택</button>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input type="text" name="CONTROL_CLOSE_HISTORY_END_DATE" id="CONTROL_CLOSE_HISTORY_END_DATE"><button type="button" id="CONTROL_CLOSE_HISTORY_END_DATE_BUTTON">달력선택</button>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100">Option</label></span>
                        <span class="wd_200" style="display: inline-block;">
                            <span class="chk_box"><input type="checkbox" name="VISIBLE_PART" id="VISIBLE_PART"><label for="VISIBLE_PART">Part</label></span>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CLOSE_HISTORY_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="CLOSE_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row4_bottomWrap">
        <div class="tableWrap jmestabs" id="CONTROL_CLOSE_HISTORY_TABS" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CONTROL_CLOSE_HISTORY" data-toggle="tab" aria-expanded="true">마감이력</a>
                </li>
                <li>
                    <a href="#END_HISTORY" data-toggle="tab" aria-expanded="false">종료이력</a>
                </li>
                <div class="right_float">
                    <button type="button" class="defaultBtn btn-100w" data-toggle="modal" data-target="#CONTROL_CLOSE_CANCEL_POPUP" style="font-weight:normal;">마감 취소</button>
                    <button type="button" class="defaultBtn btn-100w" id="CONTROL_FINISH_CANCEL" style="font-weight:normal;">종료 취소</button>
                    <button type="button" class="defaultBtn btn-100w" id="CLOSE_HISTORY_DRAWING_PRINT" style="font-weight:normal;">도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w" id="CLOSE_HISTORY_BARCODE_DRAWING_PRINT" style="font-weight:normal;">바코드도면 출력</button>
                    <button type="button" class="defaultBtn btn-100w green" id="CONTROL_CLOSE_HISTORY_SAVE" style="font-weight:normal;">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="CONTROL_CLOSE_HISTORY">
                    <div id="CONTROL_CLOSE_HISTORY_GRID"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="CONTROL_CLOSE_HISTORY_RECORDS" style="color: #00b3ee">0</span>)
                    </div>
                </ul>
                <ul class="conWrap" id="END_HISTORY">
                    <div id="CONTROL_END_HISTORY_GRID"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="CONTROL_END_HISTORY_RECORDS" style="color: #00b3ee">0</span>)
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="popup_container" id="CONTROL_CLOSE_CANCEL_POPUP" style="display: none;">
    <div class="controlCloseLayerPopup">
        <h3>월 마감 취소 진행</h3>
        <hr>
        <button type="button" class="pop_close" name="CONTROL_CLOSE_CANCEL_NO">닫기</button>
        <div class="d-inline-block">
            <form class="form-inline" id="CONTROL_CLOSE_CANCEL_FORM" role="form">
                <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlCloseCancelLeftList">
                <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
                <input type="hidden" name="ORDER_SEQ" id="ORDER_SEQ">
                <div style="width: 450px; float:left;">
                    <div id="CONTROL_CLOSE_CANCEL_LEFT_GRID"></div>
                </div>
                <div style="display: flex; float:left; align-items: center; justify-content: center; width: 70px; height: 250px;">
                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
                </div>
                <div style="width: 450px; float:left;">
                    <div id="CONTROL_CLOSE_CANCEL_RIGHT_GRID"></div>
                </div>
            </form>
        </div>

        <div class="text-center">
            <button type="button" class="defaultBtn greenPopGra" id="CONTROL_CLOSE_CANCEL_YES">저장</button>
            <button type="button" class="defaultBtn grayPopGra" name="CONTROL_CLOSE_CANCEL_NO">닫기</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        fnCommCodeDatasourceSelectBoxCreate($('#CLOSE_HISTORY_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#CLOSE_HISTORY_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        (function () {
            const dateOfLastMonth = new Date((new Date()).setMonth(TODAY.getMonth() - 1));
            const yearOfLastMonth = dateOfLastMonth.getFullYear();
            const monthOfLastMonth = String(dateOfLastMonth.getMonth() + 1).padStart(2, '0');
            const value = yearOfLastMonth + '/' + monthOfLastMonth;
            const options = {
                selectedYear: yearOfLastMonth,
                selectedMonth: monthOfLastMonth,
                finalYear: CURRENT_YEAR,
            };
            $('#CONTROL_CLOSE_HISTORY_START_DATE').monthpicker(options);
            $('#CONTROL_CLOSE_HISTORY_END_DATE').monthpicker(options);
            $('#CONTROL_CLOSE_HISTORY_START_DATE').val(value);
            $('#CONTROL_CLOSE_HISTORY_END_DATE').val(value);
        })();
        /* variable */
        let selectedRowIndex = [];

        let $controlCloseHistoryGrid;
        const controlCloseHistoryGridId = 'CONTROL_CLOSE_HISTORY_GRID';
        const controlCloseHistoryColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {title: 'CLOSE_MONTH', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: 'CLOSE_VER', dataIndx: 'CLOSE_VER', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {
                        title: '상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM',
                        render: function (ui) {
                            if (ui.cellData === '보류') {
                                return {style: 'color: #ff0000'};
                            }
                        }
                    },
                    {title: '', minWidth: 20, dataType: 'integer', dataIndx: 'CONTROL_VER'},
                    {title: '변경일', dataIndx: 'CONTROL_STATUS_DT',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData.substring(0, 5);
                        }
                    }
                ]
            },
            {
                title: '마감차수', align: 'center', colModel: [
                    {
                        title: '마감월', minWidth: 55, dataIndx: 'CLOSE_MONTH',
                        render: function (ui) {
                            const cellData = ui.cellData;

                            return cellData.substring(0, 4) + '.' + cellData.substring(4);
                        }
                    },
                    {title: '차수', dataIndx: 'CLOSE_VER'},
                ]
            },
            {title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM_NM'},
            {title: '사업자<br>구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', width: 75, dataIndx: 'COMP_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_NM'},
            {title: '비고', align: 'left', width: 100, dataIndx: 'CONTROL_NOTE'},
            {title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION_NM'},
            {
                title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '대<br>칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '총<br>장', minWidth: 30, dataType: 'integer', dataIndx: 'TOTAL_SHEET'},
            {title: '관리번호', dataIndx: 'CONTROL_NUM', hidden: true},
            {title: '관리번호', align: 'left', width: 180, dataIndx: 'CONTROL_PART_NUM'},
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
            {
                title: '참<br>조', minWidth: 30, dataIndx: 'ETC_GFILE_SEQ',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = cellData ? 'floppyDiskAble' : 'floppyDiskDisable';
                    let text = '<span class="' + cls + '" name="attachment" style="cursor: pointer"></span>';

                    return {text: text};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowData = ui.rowData;

                    $cell.find('[name=attachment]').bind('click', function () {
                        if (fnIsGridEditing($orderManagementGrid)) {
                            return false;
                        }

                        let GfileKey = ui.rowData.ETC_GFILE_SEQ;
                        $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
                        const $attachmentButton = $('#ATTACHMENT_BUTTON');
                        $attachmentButton.data('rowIndx', ui.rowIndx);
                        $attachmentButton.data('GfileKey', GfileKey);
                        if (rowData.ETC_GFILE_SEQ) {
                            $("#common_file_download_form #deleteYn").val(true);
                        } else {
                            $("#common_file_download_form #deleteYn").val(false);
                        }
                        commonFileDownUploadPopupCall(GfileKey, 'ATTACHMENT_BUTTON');
                    });
                }
            },
            {title: '가공<br>납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'INNER_DUE_DT', formatRaw: 'yy/mm/dd'},
            {
                title: '외<br>주', minWidth: 30, dataIndx: 'OUTSIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '발주정보', align: 'center',
                colModel: [
                    {
                        title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '도면번호', align: 'left', width: 150, dataIndx: 'ORDER_DRAWING_NUM'},
                    {
                        title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                        render: function (ui) {
                            if (ui.rowData.ORDER_IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                            else return '';
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find('#imageView').bind('click', function () {
                                let rowData = ui.rowData;
                                callQuickDrawingImageViewer(rowData.ORDER_IMG_GFILE_SEQ);
                            });
                        }
                    },
                    {
                        title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '원', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '대', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '발주납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'ORDER_DUE_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '출고', dataIndx: 'OUT_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '출고일자', dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_OUT_FINISH_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: 'INV No.', width: 100, dataIndx: 'INVOICE_NUM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '마감일자', dataType: 'date', format: 'mm/dd', dataIndx: 'CLOSE_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '납품확인', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'DELIVERY_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '계산견적', width: 55, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {
                        title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_TOTAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '종전가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '모듈', align: 'left', width: 70, dataIndx: 'MODULE_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '납품처', align: 'left', dataIndx: 'DELIVERY_COMP_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
                    {title: '구매담당', dataIndx: 'ORDER_STAFF_NM'},
                    {
                        title: '설계자', dataIndx: 'DESIGNER_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {
                title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {title: '소재<br>형태', dataIndx: 'MATERIAL_KIND', hidden: true},
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT', hidden: true},
            {
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '후가공', align: 'center',
                colModel: [
                    {
                        title: '연마', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {
                title: '소재비고', dataIndx: 'MATERIAL_NOTE',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '가공요건', width: 85, dataIndx: 'DETAIL_MACHINE_REQUIREMENT',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    let text = '';
                    let isDisabled = rowData.WORK_TYPE === 'WTP020' ? 'disabled' : '';

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    text = '<button class="miniBtn" name="processing_requirements"' + isDisabled + ' style="background-color: #ffffd1">가공요건</button>';

                    return {cls: cls, text: text};
                },
                postRender(ui) {
                    const grid = this,
                        $cell = grid.getCell(ui);

                    $cell.find("[name=processing_requirements]").bind("click", function () {
                        processingRequirementsPop('CONTROL');
                    });
                }
            },
            {
                title: '변경전 도면번호', align: 'left', width: 120, dataIndx: 'PREV_DRAWING_NUM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '자동 계산견적 단가', align: 'center',
                colModel: [
                    {title: '합계', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {title: '소재비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_AUTO_AMT'},
                    {title: '연마비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT'},
                    {title: '열처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT'},
                    {title: '표면처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SURFACE_AUTO_AMT'},
                    {title: '가공비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_PROCESS_AUTO_AMT'},
                    {
                        title: '기타추가', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_ETC_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '견적비고', align: 'left', dataIndx: 'UNIT_AMT_NOTE',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {
                title: 'DXF', minWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'PDF', minWidth: 35, dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: 'Rev.', dataIndx: 'DRAWING_VER'},
            {title: 'Rev. 일시', width: 120, dataIndx: 'DRAWING_UP_DT'},
            {
                title: '외주현황', align: 'center', colModel: [
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '소재제공', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                    {title: '외주단가', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_FINAL_AMT'},
                    {title: '외주납기', dataType: 'date', format: 'mm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고일시', dataIndx: 'OUTSIDE_IN_DT_F'},
                    {title: '비고', dataIndx: 'OUTSIDE_NOTE', hidden: true},
                ]
            },
            {title: 'Note', minWidth: 100, dataIndx: 'CLOSE_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const controlCloseHistoryObj = {
            height: 670,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            // selectionModel: {type: 'row', mode: 'single'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false ,render: closeHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: controlCloseHistoryColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                const data = this.option('dataModel.data');

                $('#CONTROL_CLOSE_HISTORY_RECORDS').html(data.length);
            },
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                    if(firstRow === lastRow){
                        let selRowData = $('#' + controlCloseHistoryGridId).pqGrid("getRowData", {rowIndx: firstRow});
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
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
                        if (dt == "integer" || dt == "float") {
                            row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                        }
                    }
                }
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});
                let nextRowData = "";
                let nextImgUrl = selRowData.IMG_GFILE_SEQ;
                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx +1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx -1});
                }
                if(typeof nextRowData != 'undefined' && nextRowData != "") {
                    nextImgUrl = nextRowData.IMG_GFILE_SEQ;
                }
                callQuickRowChangeDrawingImageViewer(nextImgUrl);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };

        let $controlEndHistoryGrid;
        const controlEndHistoryGridId = 'CONTROL_END_HISTORY_GRID';
        const controlEndHistoryColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ', hidden: true},
            {title: 'ORDER_STATUS', dataType: 'integer', dataIndx: 'ORDER_STATUS', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ', hidden: true},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS', hidden: true},
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', dataIndx: 'CONTROL_STATUS', hidden: true},
                    {
                        title: '상태', minWidth: 30, dataIndx: 'CONTROL_STATUS_NM',
                        render: function (ui) {
                            if (ui.cellData === '보류') {
                                return {style: 'color: #ff0000'};
                            }
                        }
                    },
                    {title: '', minWidth: 20, dataType: 'integer', dataIndx: 'CONTROL_VER'},
                    {title: '변경일', dataIndx: 'CONTROL_STATUS_DT',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData.substring(0, 5);
                        }
                    }
                ]
            },
            {title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM_NM'},
            {title: '사업자<br>구분', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자<br>구분', width: 75, dataIndx: 'COMP_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_NM'},
            {title: '비고', align: 'left', width: 100, dataIndx: 'CONTROL_NOTE'},
            {title: '주요<br>검사', dataIndx: 'MAIN_INSPECTION_NM'},
            {
                title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '대<br>칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '총<br>장', minWidth: 30, dataType: 'integer', dataIndx: 'TOTAL_SHEET'},
            {title: '관리번호', align: 'left', width: 180, dataIndx: 'CONTROL_PART_NUM'},
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE', hidden: true},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
            {
                title: '참<br>조', minWidth: 30, dataIndx: 'ETC_GFILE_SEQ',
                render: function (ui) {
                    let cellData = ui.cellData;
                    let cls = cellData ? 'floppyDiskAble' : 'floppyDiskDisable';
                    let text = '<span class="' + cls + '" name="attachment" style="cursor: pointer"></span>';

                    return {text: text};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowData = ui.rowData;

                    $cell.find('[name=attachment]').bind('click', function () {
                        if (fnIsGridEditing($orderManagementGrid)) {
                            return false;
                        }

                        let GfileKey = ui.rowData.ETC_GFILE_SEQ;
                        $('#common_file_download_form').find('#GFILE_SEQ').val(GfileKey);
                        const $attachmentButton = $('#ATTACHMENT_BUTTON');
                        $attachmentButton.data('rowIndx', ui.rowIndx);
                        $attachmentButton.data('GfileKey', GfileKey);
                        if (rowData.ETC_GFILE_SEQ) {
                            $("#common_file_download_form #deleteYn").val(true);
                        } else {
                            $("#common_file_download_form #deleteYn").val(false);
                        }
                        commonFileDownUploadPopupCall(GfileKey, 'ATTACHMENT_BUTTON');
                    });
                }
            },
            {title: '가공<br>납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'INNER_DUE_DT', formatRaw: 'yy/mm/dd'},
            {
                title: '외<br>주', minWidth: 30, dataIndx: 'OUTSIDE_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY', hidden: true},
            {title: '수행<br>공장', dataIndx: 'WORK_FACTORY_NM'},
            {
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN',
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '발주정보', align: 'center',
                colModel: [
                    {
                        title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '도면번호', align: 'left', width: 150, dataIndx: 'ORDER_DRAWING_NUM'},
                    {
                        title: '', minWidth: 25, dataIndx: 'DRAWING_NUM_BUTTON',
                        render: function (ui) {
                            if (ui.rowData.ORDER_IMG_GFILE_SEQ) return '<span class="fileSearchIcon" id="imageView" style="cursor: pointer"></span>';
                            else return '';
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find('#imageView').bind('click', function () {
                                let rowData = ui.rowData;
                                callQuickDrawingImageViewer(rowData.ORDER_IMG_GFILE_SEQ);
                            });
                        }
                    },
                    {
                        title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '원', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '대', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '발주납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'ORDER_DUE_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '출고', dataIndx: 'OUT_QTY',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '출고일자', dataType: 'date', format: 'mm/dd', dataIndx: 'ORDER_OUT_FINISH_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: 'INV No.', width: 100, dataIndx: 'INVOICE_NUM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '마감일자', dataType: 'date', format: 'mm/dd', dataIndx: 'CLOSE_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '납품확인', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'DELIVERY_DT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '계산견적', width: 55, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {
                        title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '합계금액', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'FINAL_TOTAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '종전가', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'PREV_UNIT_FINAL_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '모듈', align: 'left', width: 70, dataIndx: 'MODULE_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '납품처', align: 'left', dataIndx: 'DELIVERY_COMP_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ', hidden: true},
                    {title: '구매담당', dataIndx: 'ORDER_STAFF_NM'},
                    {
                        title: '설계자', dataIndx: 'DESIGNER_NM',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP040' || rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT'},
            {title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL', hidden: true},
            {
                title: '소재<br>종류', width: 80, dataIndx: 'MATERIAL_DETAIL_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {title: '소재<br>형태', dataIndx: 'MATERIAL_KIND', hidden: true},
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {title: '표면<br>처리', dataIndx: 'SURFACE_TREAT', hidden: true},
            {
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT_NM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '후가공', align: 'center',
                colModel: [
                    {
                        title: '연마', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP020' || rowData.WORK_TYPE === 'WTP040') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {
                title: '소재비고', dataIndx: 'MATERIAL_NOTE',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '가공요건', width: 85, dataIndx: 'DETAIL_MACHINE_REQUIREMENT',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;
                    let text = '';
                    let isDisabled = rowData.WORK_TYPE === 'WTP020' ? 'disabled' : '';

                    if (rowData.WORK_TYPE === 'WTP020') {
                        cls = 'bg-lightgray';
                    }

                    text = '<button class="miniBtn" name="processing_requirements"' + isDisabled + ' style="background-color: #ffffd1">가공요건</button>';

                    return {cls: cls, text: text};
                },
                postRender(ui) {
                    const grid = this,
                        $cell = grid.getCell(ui);

                    $cell.find("[name=processing_requirements]").bind("click", function () {
                        processingRequirementsPop('CONTROL');
                    });
                }
            },
            {
                title: '변경전 도면번호', align: 'left', width: 120, dataIndx: 'PREV_DRAWING_NUM',
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cls = null;

                    if (rowData.WORK_TYPE === 'WTP040') {
                        cls = 'bg-lightgray';
                    }

                    return {cls: cls};
                }
            },
            {
                title: '자동 계산견적 단가', align: 'center',
                colModel: [
                    {title: '합계', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SUM_AUTO_AMT'},
                    {title: '소재비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_AUTO_AMT'},
                    {title: '연마비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_GRIND_AUTO_AMT'},
                    {title: '열처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_MATERIAL_FINISH_HEAT_AUTO_AMT'},
                    {title: '표면처리', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_SURFACE_AUTO_AMT'},
                    {title: '가공비', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_PROCESS_AUTO_AMT'},
                    {
                        title: '기타추가', dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'UNIT_ETC_AMT',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    },
                    {
                        title: '견적비고', align: 'left', dataIndx: 'UNIT_AMT_NOTE',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let cls = null;

                            if (rowData.WORK_TYPE === 'WTP050') {
                                cls = 'bg-lightgray';
                            }

                            return {cls: cls};
                        }
                    }
                ]
            },
            {
                title: 'DXF', minWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'PDF', minWidth: 35, dataIndx: 'PDF_GFILE_SEQ',
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadView').bind('click', function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: 'Rev.', dataIndx: 'DRAWING_VER'},
            {title: 'Rev. 일시', width: 120, dataIndx: 'DRAWING_UP_DT'},
            {
                title: '외주현황', align: 'center', colModel: [
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
                    {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
                    {title: '소재제공', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN',
                        render: function (ui) {
                            let cellData = ui.cellData;

                            return cellData === 'Y' ? cellData : '';
                        }
                    },
                    {title: '외주단가', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_UNIT_AMT'},
                    {title: '합계금액', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_FINAL_AMT'},
                    {title: '외주납기', dataType: 'date', format: 'mm/dd', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                    {title: '입고일시', dataIndx: 'OUTSIDE_IN_DT_F'},
                    {title: '비고', dataIndx: 'OUTSIDE_NOTE', hidden: true},
                ]
            },
            {title: 'Note', minWidth: 100, dataIndx: 'CLOSE_NOTE'}
        ];
        const controlEndHistoryObj = {
            height: 670,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            // selectionModel: {type: 'row', mode: 'single'},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false ,render: closeHistoryFilterRender}, filterModel: { mode: 'OR' },
            colModel: controlEndHistoryColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: $.extend(true, {}, fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM'), {queryId: 'orderMapper.selectControlEndHistoryList'}),
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                const data = this.option('dataModel.data');

                $('#CONTROL_END_HISTORY_RECORDS').html(data.length);
            },
            selectChange: function (event, ui) {
                selectedRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowIndex.push(i);
                    if(firstRow === lastRow){
                        let selRowData = $('#' + controlEndHistoryGridId).pqGrid("getRowData", {rowIndx: firstRow});
                        callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                    }
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
                        if (dt == "integer" || dt == "float") {
                            row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                        }
                    }
                }
            },
            cellKeyDown: function (event, ui) {
                const rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const selRowData = this.getRowData({rowIndx: rowIndx});
                let nextRowData = "";
                let nextImgUrl = selRowData.IMG_GFILE_SEQ;
                if (event.keyCode == $.ui.keyCode.DOWN) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx + 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx +1});
                } else if (event.keyCode == $.ui.keyCode.UP) {
                    sr.removeAll();
                    sr.add({rowIndx: rowIndx - 1});
                    nextRowData = this.getRowData({rowIndx: rowIndx -1});
                }
                if(typeof nextRowData != 'undefined' && nextRowData != "") {
                    nextImgUrl = nextRowData.IMG_GFILE_SEQ;
                }
                callQuickRowChangeDrawingImageViewer(nextImgUrl);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            }
        };

        let $controlCloseCancelLeftGrid;
        const controlCloseCancelLeftGridId = 'CONTROL_CLOSE_CANCEL_LEFT_GRID';
        const controlCloseCancelLeftColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER'},
            {title: '품수', dataType: 'integer', format: '#,###', dataIndx: 'CNT'},
            {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, align: 'right', dataIndx: 'FINAL_NEGO_AMT'}
        ];
        const controlCloseCancelLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: controlCloseCancelLeftColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function (event, ui) {
                let gridInstance = $controlCloseCancelRightGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };
        let $controlCloseCancelRightGrid;
        const controlCloseCancelRightGridId = 'CONTROL_CLOSE_CANCEL_RIGHT_GRID';
        const controlCloseCancelRightColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataType: 'integer', format: '#,###', dataIndx: 'CNT'},
            {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, dataType: 'integer', format: '#,###', align: 'right', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const controlCloseCancelRightObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // scrollModel: {autoFit: true},
            rowHtHead: 15,
            // dragColumns: {enabled: false},
            editable: false,
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: controlCloseCancelRightColModel,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            scroll: function (event, ui) {
                let gridInstance = $controlCloseCancelLeftGrid.pqGrid('getInstance').grid;
                gridInstance.scrollXY(this.scrollX(), this.scrollY());
            }
        };

        /* variable */

        /* function */
        const updateControlStatus = function () {
            let selectedRowCount = selectedRowIndex.length;
            let rowListConvert = [];
            let date = new Date().yyyymmddhhmm();

            for (let i = 0; i < selectedRowCount; i++) {
                let tempObject = {
                    rowIndx: selectedRowIndex[i],
                    newRow: {
                        'CONTROL_STATUS': null,
                        'CONTROL_STATUS_NM': null,
                        'CONTROL_STATUS_DT': date
                    }
                };
                rowListConvert.push(tempObject);
            }
            $controlEndHistoryGrid.pqGrid('updateRow', {rowList: rowListConvert, checkEditable: false});
            const updateQueryList = ['orderMapper.createControlProgress', 'orderMapper.updateControlStatus'];

            fnModifyPQGrid($controlEndHistoryGrid, [], updateQueryList);
        };

        const noSelectedRowAlert = function () {
            if (selectedRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        const loadDataControlCloseCancel = function () {
            let controlSeqList = new Set();
            let orderSeqList = new Set ();
            let controlSeqStr = '';
            let orderSeqStr = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $controlCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                if (rowData.ORDER_SEQ) {
                    orderSeqList.add(rowData.ORDER_SEQ);
                }
                if (rowData.ORDER_SEQ) {
                    controlSeqList.add(rowData.CONTROL_SEQ);
                }
            }

            for (let item of controlSeqList) {
                controlSeqStr += item;
                controlSeqStr += ',';
            }
            for (let item of orderSeqList) {
                orderSeqStr += item;
                orderSeqStr += ',';
            }

            controlSeqStr = controlSeqStr.substring(0, controlSeqStr.length - 1);
            orderSeqStr = orderSeqStr.substring(0, orderSeqStr.length - 1);

            $('#CONTROL_CLOSE_CANCEL_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CONTROL_CLOSE_CANCEL_FORM > #ORDER_SEQ').val(orderSeqStr);

            let postData = fnFormToJsonArrayData('#CONTROL_CLOSE_CANCEL_FORM');
            postData.queryId = 'orderMapper.selectControlCloseCancelLeftList';
            $controlCloseCancelLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $controlCloseCancelLeftGrid.pqGrid('refreshDataAndView');

            postData.queryId = 'orderMapper.selectControlCloseCancelRightList';
            $controlCloseCancelRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $controlCloseCancelRightGrid.pqGrid('refreshDataAndView');
        };

        // status ORD003 마감, ORD004 종료
        let isDifferentStatus = function (status) {
            const active = $("#CONTROL_CLOSE_HISTORY_TABS").tabs('option', 'active');
            let grid;
            let controlStatusList = new Set();

            switch (active) {
                case 0:
                    grid = $controlCloseHistoryGrid;
                    break;
                case 1:
                    grid = $controlEndHistoryGrid;
                    break;
            }

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = grid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlStatusList.add(rowData.CONTROL_STATUS);
            }

            const iterator = controlStatusList.values();

            if (controlStatusList.size > 1 || iterator.next().value !== status) {
                fnAlert(null, '주문 상태가 다릅니다.');
                return true;
            }

            return false;
        };

        function closeHistoryFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;

            if (options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
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
            } else {
                return val;
            }
        }

        /* function */

        /* event */
        $('#CLOSE_HISTORY_SEARCH').on('click', function () {
            const active = $("#CONTROL_CLOSE_HISTORY_TABS").tabs('option', 'active');
            const postData = fnFormToJsonArrayData('#CLOSE_HISTORY_SEARCH_FORM');
            let grid;

            switch (active) {
                case 0:
                    grid = $controlCloseHistoryGrid;
                    postData.queryId = 'orderMapper.selectControlCloseHistoryList';
                    break;
                case 1:
                    grid = $controlEndHistoryGrid;
                    postData.queryId = 'orderMapper.selectControlEndHistoryList';
                    break;
            }

            grid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            grid.pqGrid('refreshDataAndView');
        });
        // TODO: 삭제예정
        // $('#CONTROL_CLOSE_HISTORY_SEARCH_CONDITION').on('change', function () {
        //     const $controlCloseHistoryDates = $('[id^=CONTROL_CLOSE_HISTORY][id$=DATE]');
        //
        //     $(this).val() === '' ? $controlCloseHistoryDates.prop('disabled', true) : $controlCloseHistoryDates.prop('disabled', false);
        // });

        $("#CONTROL_CLOSE_HISTORY_TABS").tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
            }
        });

        $('#CONTROL_CLOSE_CANCEL_POPUP').on({
            'show.bs.modal': function () {
                if (noSelectedRowAlert()) {
                    return false;
                }

                if (isDifferentStatus('ORD003')) {
                    return false;
                }

                let compCdList = new Set();
                let orderCompCdList = new Set();

                for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                    const rowData = $controlCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                    if (rowData.COMP_CD) {
                        compCdList.add(rowData.COMP_CD);
                    }

                    if (rowData.ORDER_COMP_CD) {
                        orderCompCdList.add(rowData.ORDER_COMP_CD);
                    }
                }

                if (compCdList.size > 1) {
                    fnAlert(null, '선택된 대상들의 발주사는 동일해야 합니다.');
                    return false;
                }

                if (orderCompCdList.size > 1) {
                    fnAlert(null, '선택된 대상들의 공급사는 동일해야 합니다.');
                    return false;
                }

                $controlCloseCancelLeftGrid = $('#' + controlCloseCancelLeftGridId).pqGrid(controlCloseCancelLeftObj);
                $controlCloseCancelRightGrid = $('#' + controlCloseCancelRightGridId).pqGrid(controlCloseCancelRightObj);

                loadDataControlCloseCancel();
            },
            'hide.bs.modal': function () {
                $controlCloseCancelLeftGrid.pqGrid('destroy');
                $controlCloseCancelRightGrid.pqGrid('destroy');
            }
        });

        $('#CONTROL_CLOSE_HISTORY_SAVE').on('click', function () {
            const active = $('#CONTROL_CLOSE_HISTORY_TABS').tabs('option', 'active');
            let grid;
            let updateQueryList;

            switch (active) {
                case 0:
                    grid = $controlCloseHistoryGrid;
                    updateQueryList = ['orderMapper.updateControlPartFromCloseHistory', 'orderMapper.updateMonthCloseDetailNote'];
                    break;
                case 1:
                    grid = $controlEndHistoryGrid;
                    updateQueryList = ['orderMapper.updateControlPartFromCloseHistory'];
                    break;
            }

            fnModifyPQGrid(grid, [], updateQueryList);
        });

        $('[name=CONTROL_CLOSE_CANCEL_NO]').on('click', function () {
            $('#CONTROL_CLOSE_CANCEL_POPUP').modal('hide');
        });

        $('#CONTROL_CLOSE_CANCEL_YES').on('click', function () {
            let list = [];

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                let rowData = $controlCloseHistoryGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                list.push(rowData);
            }

            let rightData = $controlCloseCancelRightGrid.pqGrid('option', 'dataModel.data');
            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            let parameters = {'url': '/removeMonthClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $('#CONTROL_CLOSE_CANCEL_POPUP').modal('hide');
                $controlCloseHistoryGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        });

        $('#CONTROL_FINISH_CANCEL').on('click', function () {
            if (noSelectedRowAlert()) {
                return false;
            }
            if (isDifferentStatus('ORD004')) {
                return false;
            }

            updateControlStatus();
        });

        $("#closeHistoryFrozen").on('change', function(e){
            fnFrozenHandler($controlCloseHistoryGrid, $(this).val());
        });
        // 도면출력
        $('#CLOSE_HISTORY_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;

            const active = $("#CONTROL_CLOSE_HISTORY_TABS").tabs('option', 'active');
            let $grid;

            switch (active) {
                case 0:
                    $grid = $controlCloseHistoryGrid;
                    break;
                case 1:
                    $grid = $controlEndHistoryGrid;
                    break;
            }
            
            const gridData = $grid.pqGrid('option', 'dataModel.data');
            const groupedControlSeq = fnGroupBy(gridData, 'CONTROL_SEQ');
            let controlSeqList = new Set(); // 선택 된 row 관리번호
            let drawingNumList = new Set();
            let selectControlList = '';
            let count = 0;

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $grid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlSeqList.add(rowData.CONTROL_SEQ);
            }
            // 관리번호
            for (let controlSeq of controlSeqList) {
                // 발주 개수 + 파트 개수
                for (let j = 0, GROUPED_CONTROL_SEQ_LENGTH = groupedControlSeq[controlSeq].length; j < GROUPED_CONTROL_SEQ_LENGTH; j++) {
                    const rowData = groupedControlSeq[controlSeq][j];
                    if (fnIsEmpty(rowData.ORDER_IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    } else {
                        selectControlList += String(rowData.CONTROL_SEQ) + String(rowData.CONTROL_DETAIL_SEQ) + '|';
                        drawingNumList.add(rowData.ORDER_DRAWING_NUM);
                    }
                }
            }

            const message =
                '<h4>' +
                '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                '   <span>' + drawingNumList.size + ' 건의 도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                '</h4>';
            fnConfirm(null, message, function () {
                printJS({printable: '/makeCadPrint?selectControlList=' + encodeURI(selectControlList), type: 'pdf', showModal: true});
            });
        });

        if (!alertify.barcodeDrawingConfirm) {
            alertify.dialog('barcodeDrawingConfirm', function () {
                return {
                    setup: function () {
                        let settings = alertify.confirm().settings;
                        for (let prop in settings)
                            this.settings[prop] = settings[prop];
                        let setup = alertify.confirm().setup();
                        setup.buttons.push({
                            text: '취소',
                            scope: 'primary'
                        });
                        return setup;
                    },
                    settings: {
                        oncontinue: null
                    },
                    callback: function (closeEvent) {
                        if (closeEvent.index == 2) {
                            if (typeof this.get('oncontinue') === 'function') {
                                let returnValue;
                                returnValue = this.get('oncontinue').call(this, closeEvent);
                                if (typeof returnValue !== 'undefined') {
                                    closeEvent.cancel = !returnValue;
                                }
                            }
                        } else {
                            alertify.confirm().callback.call(this, closeEvent);
                        }
                    }
                };
            }, false, 'confirm');
        }

        // 바코드도면출력
        $('#CLOSE_HISTORY_BARCODE_DRAWING_PRINT').on('click', function () {
            if (noSelectedRowAlert()) return false;
            
            const active = $("#CONTROL_CLOSE_HISTORY_TABS").tabs('option', 'active');
            let $grid;

            switch (active) {
                case 0:
                    $grid = $controlCloseHistoryGrid;
                    break;
                case 1:
                    $grid = $controlEndHistoryGrid;
                    break;
            }
            
            const gridData = $grid.pqGrid('option', 'dataModel.data');
            const groupedControlSeq = fnGroupBy(gridData, 'CONTROL_SEQ');
            let controlSeqList = new Set(); // 선택 된 row 관리번호
            let controlDetailList = new Set();
            let multiOrderControlNumList = new Set();
            let selectControlList = '';
            let message = '';

            for (let i = 0, selectedRowCount = selectedRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $grid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                controlSeqList.add(rowData.CONTROL_SEQ);
            }

            // 관리번호
            for(let controlSeq of controlSeqList) {
                // 발주 개수 + 파트 개수
                for (let j = 0, GROUPED_CONTROL_SEQ_LENGTH =  groupedControlSeq[controlSeq].length; j < GROUPED_CONTROL_SEQ_LENGTH; j++) {
                    const rowData = groupedControlSeq[controlSeq][j];
                    const rowDataNext = groupedControlSeq[controlSeq][j + 1] ? groupedControlSeq[controlSeq][j + 1] : undefined;

                    if (fnIsEmpty(rowData.ORDER_IMG_GFILE_SEQ)) {
                        fnAlert(null, '이미지 파일이 없습니다. 확인 후 재 실행해 주십시오.');
                        return;
                    } else {
                        let controlDetailSeq = rowData.CONTROL_DETAIL_SEQ;
                        let controlDetailSeqNext = rowDataNext ? rowDataNext.CONTROL_DETAIL_SEQ : undefined;

                        if (controlDetailSeq === controlDetailSeqNext) {
                            if (rowData.ORDER_DRAWING_NUM !== rowDataNext.ORDER_DRAWING_NUM) {
                                multiOrderControlNumList.add(rowData.CONTROL_NUM);
                            }
                        }
                        controlDetailList.add(controlDetailSeq);
                        selectControlList += String(rowData.CONTROL_SEQ) + String(controlDetailSeq) + '|';
                    }
                }
            }

            if (multiOrderControlNumList.size > 0) {
                // 중복제거
                message = '동일 관리번호에 도면번호가 다른 대상이 있습니다. 포함하여 출력할까요?<br>';
                message += '<span class="text-blue">대상관리번호</span><br>';
                for (let value of multiOrderControlNumList) {
                    message += '<span class="text-blue">' + value + '</span><br>';
                }

                // invoke the custom dialog
                alertify.barcodeDrawingConfirm(message).set({
                    'onok': function () {
                        printJS({printable: '/makeCadBarcodePrint?selectControlList=' + encodeURI(selectControlList) + '&flag=Y', type: 'pdf', showModal: true});
                    },
                    'oncancel': function () {
                        printJS({printable: '/makeCadBarcodePrint?selectControlList=' + encodeURI(selectControlList) + '&flag=N', type: 'pdf', showModal: true});
                    },
                    'oncontinue': function () {

                    },
                    'labels': {
                        'ok': '포함',
                        'cancel': '미포함'
                    }
                });
            } else {
                message =
                    '<h4>' +
                    '   <img alt="print" style=\'width: 32px; height: 32px;\' src=\'/resource/main/images/print.png\'>&nbsp;&nbsp;' +
                    '   <span>' + controlDetailList.size + ' 건의 바코드도면이 출력 됩니다.</span> 진행하시겠습니까?' +
                    '</h4>';
                fnConfirm(null, message, function () {
                    printJS({printable: '/makeCadBarcodePrint?selectControlList=' + encodeURI(selectControlList) + '&flag=N', type: 'pdf', showModal: true});
                });
            }
        });

        $('#CLOSE_HISTORY_EXCEL_EXPORT').on('click', function () {
            const active = $("#CONTROL_CLOSE_HISTORY_TABS").tabs('option', 'active');
            let grid;
            let text;

            switch (active) {
                case 0:
                    grid = $controlCloseHistoryGrid;
                    text = '마감이력.xlsx';
                    break;
                case 1:
                    grid = $controlEndHistoryGrid;
                    text = '종료이력.xlsx';
                    break;
            }

            const blob = grid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, text);
        });

        $('#CONTROL_CLOSE_HISTORY_START_DATE_BUTTON').on('click', function () {
            $('#CONTROL_CLOSE_HISTORY_START_DATE').monthpicker('show');
        });
        $('#CONTROL_CLOSE_HISTORY_END_DATE_BUTTON').on('click', function () {
            $('#CONTROL_CLOSE_HISTORY_END_DATE').monthpicker('show');
        });
        /* event */

        /* init */
        $controlCloseHistoryGrid = $('#' + controlCloseHistoryGridId).pqGrid(controlCloseHistoryObj);
        $controlEndHistoryGrid = $('#' + controlEndHistoryGridId).pqGrid(controlEndHistoryObj);
        /* init */
    });
</script>
