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
            <input type="hidden" name="CONTROL_SEQ_STR" id="CONTROL_SEQ_STR">
            <input type="hidden" name="INVOICE_NUM" id="INVOICE_NUM_INPUT">
            <!-- 기본 정보 -->
            <div style="margin-bottom: 10px;">
                <div style="overflow: auto;">
                    <h5 class="d-inline-block">기본정보</h5>
                    <div class="d-inline-block right_float buttonWrap" style="overflow: hidden;">
                        <div>
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
    <input type="hidden" id="paramName" name="paramName" value="CONTROL_SEQ_STR:COMP_CD:ORDER_COMP_CD:INVOICE_NUM"/>
    <input type="hidden" id="paramData" name="paramData" value=""/>
    <input type="hidden" id="template" name="template" value="transaction_statement_template"/>
</form>

<script>
    $(function () {
        'use strict';
        let $transactionStatementGrid;
        const transactionStatementGridId = 'TRANSACTION_STATEMENT_DETAIL_GRID';
        const transactionStatementColModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ', hidden: true},
            {title: '주문상태', dataIndx: 'CONTROL_STATUS_NM'},
            {title: '', align: 'center', dataIndx: '', width: 25, minWidth: 25, editable: false, hidden: true,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="shareIcon" style="cursor: pointer"></span>';
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
            {title: '관리번호', dataIndx: 'CONTROL_NUM'},
            {title: '발주번호', dataIndx: 'ORDER_NUM'},
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
            {title: '도면번호', align: 'left', dataIndx: 'DRAWING_NUM'},
            {title: '규격', dataIndx: 'SIZE_TXT'},
            {title: '작업형태', dataIndx: 'WORK_TYPE_NM'},
            {title: '수량', dataType: 'integer', dataIndx: 'CONTROL_ORDER_QTY'},
            {title: '공급단가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '금액 계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {
                title: '포장수량', dataType: 'integer', format: '#,###', dataIndx: 'PACKING_CNT', editable: true,
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
            complete: function() {
                this.flex();
            }
        };

        let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
        let controlSeqList = [];
        let compCdList = [];
        let orderCompCdList = [];
        // let invoiceNumList = [];
        let controlSeqStr = '';

        for (let i = 0; i < selectedRowCount; i++) {
            let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

            controlSeqList.push(rowData.CONTROL_SEQ);
            compCdList.push(rowData.COMP_CD);
            orderCompCdList.push(rowData.ORDER_COMP_CD);
            // invoiceNumList.push(rowData.INVOICE_NUM);
        }
        // 중복제거
        controlSeqList = [...new Set(controlSeqList)];
        compCdList = [...new Set(compCdList)];
        orderCompCdList = [...new Set(orderCompCdList)];

        for (let i = 0; i < controlSeqList.length; i++) {
            controlSeqStr += controlSeqList[i];

            if (i < controlSeqList.length - 1) {
                controlSeqStr += ',';
            }
        }

        $('#TRANSACTION_STATEMENT_FORM > #COMP_CD').val(compCdList[0]);
        $('#TRANSACTION_STATEMENT_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);
        $('#TRANSACTION_STATEMENT_FORM > #CONTROL_SEQ_STR').val(controlSeqStr);

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
        // 라벨 출력
        $('#TRANSACTION_STATEMENT_LABEL_PRINT').on('click', function () {
            // console.log(1111);
            let barcodeList = [];
            let data = $transactionStatementGrid.pqGrid('option', 'dataModel.data');

            for (let i = 0, DATA_LENGTH = data.length; i < DATA_LENGTH; i++) {
                let rowData = data[i];
                let postData = {
                    'queryId': 'inspection.selectOutgoingLabelType2',
                    'CONTROL_SEQ': rowData.CONTROL_SEQ,
                    'CONTROL_DETAIL_SEQ': rowData.CONTROL_DETAIL_SEQ,
                    'ORDER_SEQ': rowData.ORDER_SEQ
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
        }, 500));
        // 엑셀 출력
        $('#TRANSACTION_STATEMENT_EXPORT').on('click', function () {
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let invoiceNumList = [];
            let controlSeqStr = '';
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
                controlSeqList[i] = data[i].CONTROL_SEQ;
            }

            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];

            for (let i = 0; i < controlSeqList.length; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < controlSeqList.length - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#transaction_statement_excel_download #paramData').val(controlSeqStr + ':' + compCdList[0] + ':' + orderCompCdList[0] + ':' + invoiceNumList[0]);
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
        /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
