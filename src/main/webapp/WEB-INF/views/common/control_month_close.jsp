<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-06-29
  Time: 오후 7:41
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
    <title>월 마감 진행</title>
</head>
<body>
<div id="close_loading_bar" class="pq-loading" style="display: none;">
    <div class="pq-loading-bg" style="opacity: 0.2;"></div>
    <div class="pq-loading-mask ui-state-highlight">
        <div>Loading...</div>
    </div>
</div>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">월 마감 진행</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div class="buttonWrap" style="display: inline-block;">
        <form class="form-inline" id="CONTROL_MONTH_CLOSE_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId">
            <input type="hidden" name="ORDER_SEQ" id="ORDER_SEQ">
            <input type="hidden" name="COMP_CD" id="COMP_CD">
            <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
            <div class="leftbuttonWrap" style="width: 480px; text-align: right;">
                <div class="d-inline-block">
                    <label for="CONTROL_MONTH_CLOSE_YEAR"></label>
                    <select name="CONTROL_CLOSE_YEAR" id="CONTROL_MONTH_CLOSE_YEAR">
                        <option></option>
                    </select>
                </div>
                <div class="d-inline-block">
                    <label for="CONTROL_MONTH_CLOSE_MONTH"></label>
                    <select name="CONTROL_CLOSE_MONTH" id="CONTROL_MONTH_CLOSE_MONTH">
                        <option></option>
                    </select>
                </div>
                <div class="d-inline-block">
                    <select name="CLOSE_VER" id="CLOSE_VER">
                        <option value="1">1차</option>
                        <option value="2">2차</option>
                        <option value="3">3차</option>
                        <option value="4">4차</option>
                        <option value="5">5차</option>
                    </select>
                </div>
            </div>
        </form>
    </div>

    <div class="d-inline-block">
        <div style="width: 490px; float:left;">
            <div id="CONTROL_MONTH_CLOSE_LEFT_GRID"></div>
        </div>
        <div style="display: flex; float:left; align-items: center; justify-content: center; width: 60px; height: 300px;">
            <img src="${pageContext.request.contextPath}/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
        </div>
        <div style="width: 490px; float:left;">
            <div id="CONTROL_MONTH_CLOSE_RIGHT_GRID"></div>
        </div>
    </div>

    <div class="text-center" style="margin: 12px 0;">
        <button type="button" class="defaultBtn greenPopGra" id="CONTROL_MONTH_CLOSE_YES">저장</button>
        <button type="button" class="defaultBtn grayPopGra" id="CONTROL_MONTH_CLOSE_NO">닫기</button>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        const lastMonth = new Date((new Date()).setMonth(TODAY.getMonth() - 1));
        fnAppendSelectboxYear('CONTROL_MONTH_CLOSE_YEAR', 4);
        fnAppendSelectboxMonth('CONTROL_MONTH_CLOSE_MONTH');
        $('#CONTROL_MONTH_CLOSE_YEAR').val(lastMonth.getFullYear()).prop('selected', true);
        $('#CONTROL_MONTH_CLOSE_MONTH').val(String(lastMonth.getMonth() + 1).padStart(2, '0')).prop('selected', true);

        $('#CONTROL_MONTH_CLOSE_POPUP #CLOSE_VER');

        const controlMonthCloseLeftGridId = 'CONTROL_MONTH_CLOSE_LEFT_GRID';
        const controlMonthCloseLeftColModel = [
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
        const controlMonthCloseLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: controlMonthCloseLeftColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        const controlMonthCloseRightGridId = 'CONTROL_MONTH_CLOSE_RIGHT_GRID';
        const controlMonthCloseRightColModel = [
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주처', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataIndx: 'CNT'},
            {title: '수량', dataIndx: 'ORDER_QTY'},
            {title: '공급가', width: 70, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT'},
            {
                title: '마감금액', width: 70, align: 'right', dataType: 'integer', format: '#,###',
                dataIndx: 'FINAL_NEGO_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const controlMonthCloseRightObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            swipeModel: {on: false},
            rowHtHead: 15,
            copyModel: {render: true},
            trackModel: {on: true},
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: controlMonthCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect', recIndx: 'ROW_NUM',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            postRenderInterval: -1, //call postRender synchronously.
            beforePaste: function (evt, ui) {
                console.log('beforePaste')
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
                        if (dt === 'integer' || dt === 'float') {
                            row[j] = row[j].replace(/[^(\d|.)]/g, '');
                        }
                    }
                }
            }
        };
        const $controlMonthCloseLeftGrid = $('#' + controlMonthCloseLeftGridId).pqGrid(controlMonthCloseLeftObj);
        const $controlMonthCloseRightGrid = $('#' + controlMonthCloseRightGridId).pqGrid(controlMonthCloseRightObj);

        const loadDataControlClose = function (open) {
            let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
            let orderSeqList = new Set ();
            let compCdList = new Set();
            let orderCompCdList = new Set();
            let orderSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

                if (rowData.ORDER_SEQ) {
                    orderSeqList.add(rowData.ORDER_SEQ);
                }

                if (rowData.COMP_CD) {
                    compCdList.add(rowData.COMP_CD);
                }

                if (rowData.ORDER_COMP_CD) {
                    orderCompCdList.add(rowData.ORDER_COMP_CD);

                }
            }

            for (let item of orderSeqList) {
                orderSeqStr += item;
                orderSeqStr += ',';
            }
            orderSeqStr = orderSeqStr.substring(0, orderSeqStr.length - 1);

            $('#CONTROL_MONTH_CLOSE_FORM > #ORDER_SEQ').val(orderSeqStr);
            $('#CONTROL_MONTH_CLOSE_FORM > #COMP_CD').val(compCdList.values().next().value);
            $('#CONTROL_MONTH_CLOSE_FORM > #ORDER_COMP_CD').val(orderCompCdList.values().next().value);

            if (open) {
                // 마지막 마감 차수 가져오기
                let postData = fnFormToJsonArrayData('#CONTROL_MONTH_CLOSE_FORM');
                postData.queryId = 'orderMapper.selectControlCloseVer';
                let parameters = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    let closeVer = data.list.length > 0 && data.list[0] !== null ? data.list[0].MAX_CLOSE_VER : 1;
                    $('#CONTROL_MONTH_CLOSE_FORM #CLOSE_VER').val(closeVer).prop('selected', true);
                }, parameters, '');
            }

            let controlMonthCloseLeftPostData = fnFormToJsonArrayData('#CONTROL_MONTH_CLOSE_FORM');
            controlMonthCloseLeftPostData.queryId = 'orderMapper.selectControlCloseLeftList';
            $controlMonthCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                return controlMonthCloseLeftPostData;
            });
            $controlMonthCloseLeftGrid.pqGrid('refreshDataAndView');

            let controlMonthCloseRightPostData = fnFormToJsonArrayData('#CONTROL_MONTH_CLOSE_FORM');
            controlMonthCloseRightPostData.queryId = 'orderMapper.selectControlCloseRightList';
            $controlMonthCloseRightGrid.pqGrid('option', 'dataModel.postData', function () {
                return controlMonthCloseRightPostData;
            });
            $controlMonthCloseRightGrid.pqGrid('refreshDataAndView');
        };
        loadDataControlClose(true);


        /* event */
        $('#CONTROL_MONTH_CLOSE_FORM').on('change', function () {
            loadDataControlClose();
        });

        $('#CONTROL_MONTH_CLOSE_YES').on('click', function () {
            $("#close_loading_bar").show();
            let list = [];
            let CLOSE_VER = $('#CLOSE_VER').val();
            let CLOSE_MONTH = $('#CONTROL_MONTH_CLOSE_YEAR').val() + $('#CONTROL_MONTH_CLOSE_MONTH').val();

            for (let i = 0, selectedRowCount = opener.selectedOrderManagementRowIndex.length; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

                if (rowData.ORDER_SEQ) {
                    let tempObject = {
                        ORDER_STATUS: rowData.ORDER_STATUS,
                        CONTROL_SEQ: rowData.CONTROL_SEQ,
                        CONTROL_DETAIL_SEQ: rowData.CONTROL_DETAIL_SEQ,
                        ORDER_SEQ: rowData.ORDER_SEQ,
                        COMP_CD: rowData.COMP_CD,
                        CLOSE_MONTH: CLOSE_MONTH,
                        ORDER_COMP_CD: rowData.ORDER_COMP_CD,
                        CLOSE_VER: CLOSE_VER,
                        CLOSE_NOTE: rowData.CLOSE_NOTE,
                        CLOSE_CONTROL_AMT: rowData.CLOSE_CONTROL_AMT,
                        CLOSE_DETAIL_NOTE: rowData.CLOSE_DETAIL_NOTE,
                        FINAL_NEGO_AMT: rowData.FINAL_NEGO_AMT
                    };
                    list.push(tempObject);
                }
            }

            let rightData = $controlMonthCloseRightGrid.pqGrid('option', 'dataModel.data');
            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            // rightGrid
            let parameters = {'url': '/createMonthClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                $("#close_loading_bar").hide();
                fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                    opener.$orderManagementGrid.pqGrid('refreshDataAndView');
                    window.close();
                });
            }, parameters, '');
        });

        $('#CONTROL_MONTH_CLOSE_NO').on('click', function () {
            window.close();
        });
        /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
