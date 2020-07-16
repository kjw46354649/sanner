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
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>월 마감 진행</title>
</head>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">월 마감 진행</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div class="buttonWrap" style="display: inline-block;">
        <form class="form-inline" id="CONTROL_MONTH_CLOSE_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId">
            <input type="hidden" name="CONTROL_SEQ" id="CONTROL_SEQ">
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
    // console.log(opener.$orderManagementGrid);
    $(function () {
        'use strict';
        // console.log(window);
        // console.log(opener);
        // console.log(opener.$orderManagementGrid);
        // console.log(opener.selectedOrderManagementRowIndex);

        fnAppendSelectboxYear('CONTROL_MONTH_CLOSE_YEAR', 3);
        fnAppendSelectboxMonth('CONTROL_MONTH_CLOSE_MONTH');
        $('#CONTROL_MONTH_CLOSE_MONTH').val(CURRENT_MONTH < 9 ? '0' + CURRENT_MONTH : CURRENT_MONTH).prop('selected', true);

        $('#CONTROL_MONTH_CLOSE_POPUP #CLOSE_VER');

        const controlMonthCloseLeftGridId = 'CONTROL_MONTH_CLOSE_LEFT_GRID';
        const controlMonthCloseLeftColModel = [
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '품수', dataType: 'string', dataIndx: 'CNT'},
            {title: '수량', dataType: 'string', dataIndx: 'CONTROL_PART_QTY'},
            {title: '공급가', width: 70, align: 'right', dataType: 'string', dataIndx: 'TOTAL_AMT'},
            {title: '마감금액', width: 70, align: 'right', dataType: 'string', dataIndx: 'FINAL_NEGO_AMT'}
        ];
        const controlMonthCloseLeftObj = {
            height: 300,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
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
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '마감월', dataType: 'string', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: '마감월', width: 70, dataType: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '품수', dataType: 'string', dataIndx: 'CNT'},
            {title: '수량', dataType: 'string', dataIndx: 'CONTROL_PART_QTY'},
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
            rowHtHead: 15,
            scrollModel: {autoFit: true},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: controlMonthCloseRightColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        const $controlMonthCloseLeftGrid = $('#' + controlMonthCloseLeftGridId).pqGrid(controlMonthCloseLeftObj);
        const $controlMonthCloseRightGrid = $('#' + controlMonthCloseRightGridId).pqGrid(controlMonthCloseRightObj);

        const loadDataControlClose = function (open) {
            let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
            let controlSeqList = [];
            let compCdList = [];
            let orderCompCdList = [];
            let controlSeqStr = '';

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});

                controlSeqList.push(rowData.CONTROL_SEQ);
                compCdList.push(rowData.COMP_CD);
                orderCompCdList.push(rowData.ORDER_COMP_CD);
            }
            // 중복제거
            controlSeqList = [...new Set(controlSeqList)];
            compCdList = [...new Set(compCdList)];
            orderCompCdList = [...new Set(orderCompCdList)];

            for (let i = 0, CONTROL_SEQ_LIST_LENGTH = controlSeqList.length; i < CONTROL_SEQ_LIST_LENGTH; i++) {
                controlSeqStr += controlSeqList[i];

                if (i < CONTROL_SEQ_LIST_LENGTH - 1) {
                    controlSeqStr += ',';
                }
            }

            $('#CONTROL_MONTH_CLOSE_FORM > #CONTROL_SEQ').val(controlSeqStr);
            $('#CONTROL_MONTH_CLOSE_FORM > #COMP_CD').val(compCdList[0]);
            $('#CONTROL_MONTH_CLOSE_FORM > #ORDER_COMP_CD').val(orderCompCdList[0]);

            if (open) {
                // 마지막 마감 차수 가져오기
                let postData = fnFormToJsonArrayData('#CONTROL_MONTH_CLOSE_FORM');
                postData.queryId = 'orderMapper.selectControlCloseVer';
                let parameters = {'url': '/json-list', 'data': postData};
                fnPostAjaxAsync(function (data) {
                    let closeVer = data.list.length > 0 && data.list[0] !== null ? data.list[0].MAX_CLOSE_VER : 1;
                    $('#CONTROL_MONTH_CLOSE_FORM #CLOSE_VER').val(closeVer).prop('selected', true);
                }, parameters, '');

                let controlMonthCloseLeftPostData = fnFormToJsonArrayData('#CONTROL_MONTH_CLOSE_FORM');
                controlMonthCloseLeftPostData.queryId = 'orderMapper.selectControlCloseLeftList';
                $controlMonthCloseLeftGrid.pqGrid('option', 'dataModel.postData', function () {
                    return controlMonthCloseLeftPostData;
                });
                $controlMonthCloseLeftGrid.pqGrid('refreshDataAndView');
            }

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
            let selectedRowCount = opener.selectedOrderManagementRowIndex.length;
            let list = [];

            for (let i = 0; i < selectedRowCount; i++) {
                let rowData = opener.$orderManagementGrid.pqGrid('getRowData', {rowIndx: opener.selectedOrderManagementRowIndex[i]});
                rowData.CLOSE_VER = $('#CLOSE_VER').val();
                rowData.CLOSE_MONTH = $('#CONTROL_MONTH_CLOSE_YEAR').val() + $('#CONTROL_MONTH_CLOSE_MONTH').val();
                list.push(rowData);
            }

            let rightData = $controlMonthCloseRightGrid.pqGrid('option', 'dataModel.data');
            let postData = {
                'info-data': rightData,
                'list-data': list
            };

            // rightGrid
            let parameters = {'url': '/createMonthClose', 'data': {data: JSON.stringify(postData)}};
            fnPostAjax(function (data, callFunctionParam) {
                let headHtml = 'messsage', bodyHtml = '', yseBtn = '확인';
                bodyHtml =
                    '<h4>\n' +
                    '    <img style=\'width: 32px; height: 32px;\' src="/resource/asset/images/work/alert.png">\n' +
                    '    <span>' + "<spring:message code='com.alert.default.save.success' />" + '</span>\n' +
                    '</h4>';

                fnCommonAlertBoxCreate(headHtml, bodyHtml, yseBtn);

                const controlMonthCloseSubmitConfirm = function (callback) {
                    $("#commonAlertYesBtn").unbind().click(function (e) {
                        e.stopPropagation();
                        callback(true);
                        return;
                    });
                };
                controlMonthCloseSubmitConfirm(function (confirm) {
                    if (confirm) {
                        opener.$orderManagementGrid.pqGrid('refreshDataAndView');
                        window.close();
                    }
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
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"></jsp:include>
