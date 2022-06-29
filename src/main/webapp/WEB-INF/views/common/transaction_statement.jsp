<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-06-30
  Time: 오후 7:37
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
    <title>거래 명세표</title>
</head>
<body>
<div class="popup_container" id="TRANSACTION_STATEMENT_POPUP">
    <div class="layerPopup">
        <h3 style="margin-bottom: 10px;">거래 명세표</h3>
        <hr>
        <form name="TRANSACTION_STATEMENT_FORM" id="TRANSACTION_STATEMENT_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlTransactionStatementList">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
            <input type="hidden" name="ORDER_SEQ_STR" id="ORDER_SEQ_STR">
            <input type="hidden" name="INVOICE_NUM" id="INVOICE_NUM_INPUT">
            <!-- 기본 정보 -->
            <div style="margin-bottom: 10px;">
                <div style="overflow: auto;">
                    <h5 class="d-inline-block">기본정보</h5>
                    <div class="d-inline-block right_float buttonWrap" style="overflow: hidden;">
                        <div>
                            <button class="popupBtn" id="SALES_DRAWING_PRINT">영업도면출력</button>
                            <button class="popupBtn" id="TRANSACTION_STATEMENT_LABEL_PRINT">라벨 출력</button>
                            <button class="popupBtn red" id="TRANSACTION_STATEMENT_DELETE">삭제</button>
                            <button class="popupBtn green" id="TRANSACTION_STATEMENT_SAVE">저장</button>
                            <button class="popupBtn blue" id="TRANSACTION_STATEMENT_EXPORT">엑셀 출력</button>
                        </div>
                    </div>
                </div>
                <!-- 버튼 -->

                <table class="tableL">
                    <colgroup>
                        <col span="3" style="width: 15%">
                        <col span="1" style="width: 55%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="headerDisable">발주사</td>
                        <td id="ORDER_COMP_NM"></td>
                        <td class="headerDisable">공급사</td>
                        <td id="COMP_NM"></td>
                    </tr>
                    <tr>
                        <td class="headerSelectChange">구매 담당자</td>
                        <td>
                            <label for="ORDER_STAFF_SEQ"></label><select name="ORDER_STAFF_SEQ" id="ORDER_STAFF_SEQ" style="width: 100%; border: 0; text-align: center;">
                                <option></option>
                            </select>
                        </td>
                        <td class="headerDisable">금액 합계</td>
                        <td name="TOTAL_AMT" id="TOTAL_AMT"></td>
                    </tr>
                    <tr>
                        <td class="headerDisable">INV No.</td>
                        <td ID="INVOICE_NUM"></td>
                        <td class="headerInputChange">제목</td>
                        <td>
                            <label for="INVOICE_TITLE"></label><input type="text" name="INVOICE_TITLE" id="INVOICE_TITLE" style="width: 100%; border: 0; text-align: center;" autocomplete="off">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- 상세 리스트 -->
            <div>
                <h5>상세 리스트</h5>
                <div id="TRANSACTION_STATEMENT_DETAIL_GRID"></div>
            </div>
        </form>
        <div class="btnWrap">
            <button type="button" class="defaultBtn grayPopGra" id="TRANSACTION_STATEMENT_POPUP_CLOSE_BUTTON">닫기</button>
        </div>
    </div>
</div>

<%-- 엑셀 다운로드 폼 --%>
<form id="transaction_statement_excel_download" method="POST">
    <input type="hidden" id="sqlId" name="sqlId" value="selectTransactionStatementInfoExcel:selectTransactionStatementListExcel"/>
    <input type="hidden" id="mapInputId" name="mapInputId" value="info:data"/>
    <input type="hidden" id="paramName" name="paramName" value="ORDER_SEQ_STR:COMP_CD:ORDER_COMP_CD:INVOICE_NUM"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="transaction_statement_template"/>
</form>

<script>
    $(function () {
        'use strict';
        let selectedTransactionStatementRowIndex = [];
        let $transactionStatementGrid;
        const transactionStatementGridId = 'TRANSACTION_STATEMENT_DETAIL_GRID';
        const transactionStatementColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: '주문<br>상태', dataIndx: 'ORDER_STATUS_NM', width: 30},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false, hidden: true,
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
            {title: '작업지시번호', dataIndx: 'CONTROL_NUM'},
            {title: '접수번호', dataIndx: 'REGIST_NUM', width: 160},
            {title: '발주번호', dataIndx: 'ORDER_NUM', width: 160},
            {title: '', dataIndx: 'IMG_GFILE_SEQ', minWidth: 30, width: 30, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="fileSearchIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', align: 'left', dataIndx: 'DRAWING_NUM', width: 140},
            {title: '규격', dataIndx: 'SIZE_TXT', width: 100},
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM', width: 60},
            {title: '수량', dataType: 'integer', dataIndx: 'CONTROL_ORDER_QTY', width: 40},
            {title: '공급단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '금액 계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {
                title: '포장수량', dataType: 'integer', format: '#,###', dataIndx: 'PACKING_CNT', editable: true, width: 40,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '비고',
                dataType: 'string',
                dataIndx: 'NOTE',
                editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {title: 'LABEL_BARCODE_NUM', dataIndx: 'LABEL_BARCODE_NUM', hidden: true},
        ];
        const transactionStatementObj = {
            height: 470,
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            resizable: false,
            showTitle: false,
            strNoRows: g_noData,
            scrollModel: {autoFit: true},
            rowHtHead: 15,
            // dragColumns: {enabled: false},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            editModel: {clicksToEdit: 1},
            colModel: transactionStatementColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'}, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            // complete: function() {
            //     this.flex();
            // },
            load: function() {
                autoMerge(this, true);
            },
            selectChange: function (event, ui) {
                selectedTransactionStatementRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedTransactionStatementRowIndex.push(i);
                }
            },
        };

        let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
        let orderSeqList = [];
        let compCdList = [];
        let orderCompCdList = [];
        // let invoiceNumList = [];
        let orderSeqStr = "";

        for (let i = 0; i < selectedRowCount; i++) {
            let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

            orderSeqList.push(rowData.ORDER_SEQ);
            compCdList.push(rowData.COMP_CD);
            orderCompCdList.push(rowData.ORDER_COMP_CD);
            // invoiceNumList.push(rowData.INVOICE_NUM);
        }
        // 중복제거
        orderSeqList = [...new Set(orderSeqList)];
        compCdList = [...new Set(compCdList)];
        orderCompCdList = [...new Set(orderCompCdList)];

        for (let i = 0; i < orderSeqList.length; i++) {
            // orderSeqStr += orderSeqList[i];
            orderSeqStr += "'" + orderSeqList[i]+ "',";

            if (i < orderSeqList.length - 1) {
                // orderSeqStr += ',';
            }
        }
        orderSeqStr = orderSeqStr.substr(0, orderSeqStr.length - 1);

        $('#TRANSACTION_STATEMENT_FORM > #COMP_CD').val(compCdList[0]);
        $('#TRANSACTION_STATEMENT_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);
        $('#TRANSACTION_STATEMENT_FORM > #ORDER_SEQ_STR').val(orderSeqStr);

        let postData = fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM');
        postData.queryId = 'orderMapper.selectControlTransactionStatementInfo';
        let parameters = {'url': '/json-info', 'data': postData};

        fnPostAjaxAsync(function (data) {
            let obj = data.info;

            $('#TRANSACTION_STATEMENT_FORM #COMP_NM').text(obj.COMP_NM);
            $('#TRANSACTION_STATEMENT_FORM #ORDER_COMP_NM').text(obj.ORDER_COMP_NM);
            $('#TRANSACTION_STATEMENT_FORM #TOTAL_AMT').text(obj.TOTAL_AMT);
            $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM').text(obj.INVOICE_NUM);
            $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM_INPUT').val(obj.INVOICE_NUM);
            $('#TRANSACTION_STATEMENT_FORM #INVOICE_TITLE').val(obj.INVOICE_TITLE);

            $transactionStatementGrid = $('#' + transactionStatementGridId).pqGrid(transactionStatementObj);
            $('#TRANSACTION_STATEMENT_FORM #queryId').val('orderMapper.selectControlTransactionStatementList');
            $transactionStatementGrid.pqGrid('option', 'dataModel.postData', function () {
                return (fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM'));
            });
            $transactionStatementGrid.pqGrid('refreshDataAndView');
        }, parameters, '');

        /* 구매 담당자 */
        let postDataA = fnCloneObj(postData);
        postDataA.queryId = 'dataSource.getCompanyStaffList';
        postDataA.COMP_CD = postDataA.ORDER_COMP_CD;
        parameters = {'url': '/json-list', 'data': postDataA};
        fnPostAjax(function (data) {
            $('#TRANSACTION_STATEMENT_FORM #ORDER_STAFF_SEQ').empty();

            for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                let obj = data.list[i];

                $('#TRANSACTION_STATEMENT_FORM #ORDER_STAFF_SEQ').append(new Option(obj.CODE_NM, obj.CODE_CD));
            }
        }, parameters, '');


        /* event */
        $('#SALES_DRAWING_PRINT').on('click', function () {
            if (selectedTransactionStatementRowIndex.length === 0) {
                fnAlert(null, '하나 이상 선택해주세요');
                return false;
            }

            let selectOrderList = '';

            for (let i = 0, selectedRowCount = selectedTransactionStatementRowIndex.length; i < selectedRowCount; i++) {
                const rowData = $transactionStatementGrid.pqGrid('getRowData', {rowIndx: selectedTransactionStatementRowIndex[i]});

                selectOrderList += String(rowData.ORDER_SEQ) + '|';
            }

            printJS({printable:'/makeSalesDrawingPrint', properties: {selectOrderList: selectOrderList}, type:'pdf', showModal:true});
        });
        // 라벨 출력
        $('#TRANSACTION_STATEMENT_LABEL_PRINT').on('click', function () {
            let barcodeList = [];
            let orderSeqList = [];
            let data = $transactionStatementGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, DATA_LENGTH = data.length; i < DATA_LENGTH; i++) {
                let rowData = data[i];
                orderSeqList.push(rowData.ORDER_SEQ);
            }
            orderSeqList = [...new Set(orderSeqList)];

            for (let i = 0; i < orderSeqList.length; i++) {
                let postData = {
                    'queryId': 'inspection.selectOutgoingLabelType4',
                    'ORDER_SEQ': orderSeqList[i]
                };
                let parameter = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    for (let i = 0, DATALIST_LENGTH = data.list.length; i < DATALIST_LENGTH; i++) {
                        barcodeList.push(data.list[i].BARCODE_NUM);
                    }
                }, parameter, '');
            }


            let bCodePrintLen = barcodeList.length;

            if (bCodePrintLen) {
                let message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>선택하신 ' + bCodePrintLen + '건을 처리합니다. \n진행하시겠습니까?</span>\n' +
                    '</h4>';
                fnConfirm(null, message, function () {
                    fnBarcodePrint(function (data) {
                        fnAlert(null, data.message);
                    }, barcodeList, '');
                });
            } else {
                fnAlert(null, "출력할 바코드가 존재 하지 않습니다.");
            }
        });

        // 삭제
        $('#TRANSACTION_STATEMENT_DELETE').on('click', function () {
            let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
            let invoiceNumList = [];
            let message;

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

                invoiceNumList.push(rowData.INVOICE_NUM);
            }
            // 중복제거
            invoiceNumList = [...new Set(invoiceNumList)];

            if (invoiceNumList[0] === undefined) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>삭제할 거래명세표가 없습니다</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }
            if (invoiceNumList.length > 1) {
                message =
                    '<h4>\n' +
                    '    <img alt="alert" src="/resource/asset/images/work/alert.png" style="width: 32px; height: 32px;" >\n' +
                    '    <span>선택된 대상들의 거래명세 번호는 동일해야 합니다.</span>\n' +
                    '</h4>';
                fnAlert(null, message);
                return false;
            }

            message =
                '<h4>\n' +
                '    <img alt="alert" src="/resource/asset/images/work/alert.png" style="width: 32px; height: 32px;" >\n' +
                '    <span>발주번호 ' + invoiceNumList[0] + ' 이 삭제됩니다. 진행하시겠습니까?</span>\n' +
                '</h4>';

            fnConfirm(null, message, function () {
                let parameters = {'url': '/removeInvoice', 'data': {INVOICE_NUM: invoiceNumList[0]}};

                fnPostAjax(function () {
                    fnAlert(null, "<spring:message code='com.alert.default.remove.success'/>", function () {
                        window.close();
                        opener.$orderManagementGrid.pqGrid('refreshDataAndView');
                    });
                }, parameters, '');
            });
        });
        // 저장
        $('#TRANSACTION_STATEMENT_SAVE').on('click', _.debounce(function () {
            let tempList = [];
            let infoPostData = fnFormToJsonArrayData('#TRANSACTION_STATEMENT_FORM');
            let listPostData = $transactionStatementGrid.pqGrid('option', 'dataModel.data');
            tempList.push(infoPostData);
            let postData = {
                'info-data': tempList,
                'list-data': listPostData
            };

            let parameters = {'url': '/createInvoice', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data) {
                $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM').text(data.info);
                $('#TRANSACTION_STATEMENT_FORM #INVOICE_NUM_INPUT').val(data.info);
                fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
                $transactionStatementGrid.pqGrid('refreshDataAndView');
                opener.$orderManagementGrid.pqGrid('refreshDataAndView');
            }, parameters, '');
        }, 1000));
        // 엑셀 출력
        $('#TRANSACTION_STATEMENT_EXPORT').on('click', function () {
            let orderSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let invoiceNumList = [];
            let orderSeqStr = '';
            let data = $transactionStatementGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, selectedRowCount = opener.selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

                compCdList[i] = rowData.COMP_CD;
                orderCompCdList[i] = rowData.ORDER_COMP_CD;
                invoiceNumList[i] = rowData.INVOICE_NUM;
            }

            invoiceNumList = invoiceNumList.filter(function (element, index, array) {
                return array.indexOf(element) === index;
            });

            if (fnIsEmpty(invoiceNumList[0])) {
                fnAlert(null, '저장 후 엑셀 출력해주세요.');
                return false;
            }

            for (let i = 0, DATA_LENGTH = data.length; i < DATA_LENGTH; i++) {
                orderSeqList[i] = data[i].ORDER_SEQ;
            }

            // 중복제거
            orderSeqList = [...new Set(orderSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];

            for (let i = 0; i < orderSeqList.length; i++) {
                orderSeqStr += orderSeqList[i];

                if (i < orderSeqList.length - 1) {
                    orderSeqStr += ',';
                }
            }

            $('#transaction_statement_excel_download #paramData').val(orderSeqStr + ':' + compCdList[0] + ':' + orderCompCdList[0] + ':' + invoiceNumList[0]);
            fnReportFormToHiddenFormPageAction('transaction_statement_excel_download', '/downloadExcel');
        });

        $('#TRANSACTION_STATEMENT_POPUP_CLOSE_BUTTON').on('click', function () {
            window.close();
        });

        $('#INVOICE_TITLE').on('keydown', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
            }
        });

        const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');
            const orderList = ['ORDER_STATUS_NM', 'REGIST_NUM', 'ORDER_NUM', 'IMG_GFILE_SEQ', 'DRAWING_NUM',
                'SIZE_TXT', 'WORK_TYPE_NM', 'CONTROL_ORDER_QTY', 'UNIT_FINAL_AMT', 'TOTAL_AMT', 'PACKING_CNT',
                'NOTE'
            ];
            const includeList = orderList;

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

                        if (orderList.includes(dataIndx)) {
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
                        }
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };
        /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
