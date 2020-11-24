<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-01
  Time: 오후 4:34
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
        <form class="form-inline" id="SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectSalesClosingHistoryList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">차수</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="NOTE">비고</label>
                            <input type="text" class="wd_200" name="NOTE" id="NOTE">
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span class="chk_box"><select name="CLOSE_YEAR_LEFT" id="CLOSE_YEAR_LEFT"></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_LEFT" id="CLOSE_MONTH_LEFT"></select><span style="margin: 0 5px; vertical-align: middle; font-size: 1.4rem;">&nbsp;~&nbsp;</span></span>
                        <span class="chk_box"><select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled></select></span>
                        <span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH">
                        <label for="RANGE_SEARCH"> Range 검색</label></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CONTROL_SALES_CLOSING_HISTORY_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_SALES_CLOSING_HISTORY_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="topWrap" style="display: none">
        <form class="form-inline" id="MONTH_SALE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectMonthSaleStatusList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">차수</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="NOTE">비고</label>
                            <input type="text" class="wd_200" name="NOTE" id="NOTE">
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="MONTH_SALE_YEAR">조회년도</label>
                            <select class="wd_200" name="MONTH_SALE_YEAR" id="MONTH_SALE_YEAR">
                                <option></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap"><label class="label_100">Option</label></span>
                        <span class="wd_200" style="display: inline-block;">
                            <span class="chk_box"><input type="checkbox" name="DEPOSIT_STATUS_DISPLAY" id="DEPOSIT_STATUS_DISPLAY"><label for="DEPOSIT_STATUS_DISPLAY">입금현황 표시</label></span>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="CONTROL_MONTH_SALE_STATUS_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                            <button type="button" class="defaultBtn radius blue" id="CONTROL_MONTH_SALE_STATUS_SEARCH">검색</button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="tableWrap jmestabs" id="CONTROL_SALES_STATUS_TABS" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#CLOSING_HISTORY" data-toggle="tab" aria-expanded="true">마감이력</a>
                </li>
                <li>
                    <a href="#MONTHLY_SALES_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                </li>
                <div class="right_float" id="sales_status_save_id">
                    <button type="button" class="defaultBtn btn-100w green" style="font-weight:normal;" id="CLOSING_HISTORY_SAVE">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="CLOSING_HISTORY">
                    <div id="CLOSING_HISTORY_GRID"></div>
                </ul>
                <ul class="conWrap" id="MONTHLY_SALES_STATUS">
                    <div id="MONTHLY_SALES_STATUS_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    var $closingHistoryGrid;
    var salesClosingHistoryRowIndex = [];
    $(function () {
        'use strict';
        fnCommCodeDatasourceSelectBoxCreate($('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_SALE_STATUS_SEARCH_FORM ').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_SALE_STATUS_SEARCH_FORM ').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        $('#CLOSE_MONTH_LEFT').val('01').prop('selected', true);
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('MONTH_SALE_YEAR', 10);

        /* variable */
        // let $closingHistoryGrid;
        const tab1GridId = 'CLOSING_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
        const tab1ColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '년도', dataIndx: 'YEAR'},
            {title: '분기', dataIndx: 'QUARTER'},
            {title: '마감월', dataIndx: 'FINISH_MONTH'},
            {title: '발주사', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주사', dataIndx: 'ORDER_COMP_NM'},
            {title: '차수', dataIndx: 'CLOSE_VER', hidden: true},
            {title: '차수', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '품수', dataIndx: 'ITEM_NUMBER', summary: {type: 'sum', edit: true},
                render: function (ui) {
                    if(ui.rowData.pq_grandsummary) {
                        return ui.cellData;
                    } else {
                        return ('<button name="SALES_STATUS_CONTROL_DETAIL_VIEW"><u>' + ui.cellData + '</u></button>');
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=SALES_STATUS_CONTROL_DETAIL_VIEW]').bind('click', function () {
                        let rowData = ui.rowData;
                        openNewWindowControlDetail(rowData);
                    });
                }
            },
            {title: '공급가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT', summary: {type: 'sum'}},
            {title: '마감금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, summary: {type: 'sum'}, editable: true},
            {title: '부가세액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'VAT_AMOUNT', summary: {type: 'sum'}},
            {title: '합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMOUNT', summary: {type: 'sum'}},
            {title: '비고', dataIndx: 'CLOSE_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
        ];
        const tab1GroupModel = {
            on: true,
            header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const tab1Obj = {
            height: 745,
            collapsible: false,
            resizable: false,
            postRenderInterval: -1,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {show: false},
            selectionModel: {type: 'row', mode: 'single'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: tab1ColModel,
            groupModel: tab1GroupModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            summaryTitle: {sum: '{0}'},
            rowSelect: function (event, ui) {
                salesClosingHistoryRowIndex = ui.addList[0].rowIndx;
            },
        };

        let $monthlySalesStatusGrid;
        const tab2GridId = 'MONTHLY_SALES_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTH_SALE_STATUS_SEARCH_FORM');
        tab2PostData.MONTH_SALE_YEAR = CURRENT_YEAR;
        const tab2ColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주업체', dataIndx: 'ORDER_COMP_NM'},
            {title: '구분', dataIndx: 'STATUS_TYPE',},
            {
                title: '1분기', align: 'center', colModel: [
                    {title: '1월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '01_AMT', summary: {type: 'sum'}},
                    {title: '2월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '02_AMT', summary: {type: 'sum'}},
                    {title: '3월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_SUM_AMT', summary: {type: 'sum'}, style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '2분기', align: 'center', colModel: [
                    {title: '4월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '04_AMT', summary: {type: 'sum'}},
                    {title: '5월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '05_AMT', summary: {type: 'sum'}},
                    {title: '6월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_SUM_AMT', summary: {type: 'sum'}, style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '3분기', align: 'center', colModel: [
                    {title: '7월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '07_AMT', summary: {type: 'sum'}},
                    {title: '8월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '08_AMT', summary: {type: 'sum'}},
                    {title: '9월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_SUM_AMT', summary: {type: 'sum'}, style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '4분기', align: 'center', colModel: [
                    {title: '10월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '10_AMT', summary: {type: 'sum'}},
                    {title: '11월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '11_AMT', summary: {type: 'sum'}},
                    {title: '12월', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_AMT', summary: {type: 'sum'}},
                    {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_SUM_AMT', summary: {type: 'sum'}, style: {'font-weight': 'bold'}}
                ]
            },
            {title: '합계', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT', summary: {type: 'sum'}, style: {'font-weight': 'bold'}}
        ];
        const tab2GroupModel = {
            on: true, header:false,
            headerMenu: false,
            indent: 10,
            dataIndx: ['GROUP_KEY'],
            summaryInTitleRow: '',
            summaryEdit: false,
            // showSummary: [true], //to display summary at end of every group.
            collapsed: [false],
            grandSummary: true,
            merge: true,
            nodeClose: false,
        };
        const tab2Obj = {
            height: 745,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: tab2ColModel,
            groupModel: tab2GroupModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            summaryTitle: {sum: '{0}'}
        };
        
        let controlDetailPopup;
        /* variable */

        /* function */
        const openNewWindowControlDetail = function (rowData) {
            let url = '/controlDetail';
            // 팝업 사이즈
            let nWidth = 1400;
            let nHeight = 770;
            let winWidth = document.body.clientWidth;
            let winHeight = document.body.clientHeight;
            let winX = window.screenX || window.screenLeft || 0;
            let winY = window.screenY || window.screenTop || 0;
            let nLeft = winX + (winWidth - nWidth) / 2;
            let nTop = winY + (winHeight - nHeight) / 2;

            let strOption = '';
            strOption += 'left=' + nLeft + 'px,';
            strOption += 'top=' + nTop + 'px,';
            strOption += 'width=' + nWidth + 'px,';
            strOption += 'height=' + nHeight + 'px,';
            strOption += 'toolbar=no,menubar=no,location=no,resizable=no,status=yes';

            // 최초 클릭이면 팝업을 띄운다.
            if (controlDetailPopup === undefined || controlDetailPopup.closed) {
                controlDetailPopup = window.open(url, '', strOption);
            } else {
                controlDetailPopup.focus();
            }
        };
        /* function */

        $('#CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_LEFT', this.value);
        });
        $('#CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT', this.value);
        });
        $('#RANGE_SEARCH').on('change', function (event) {
            if ($(this).prop('checked')) {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });

        $('#CLOSING_HISTORY_SAVE').on('click', function (event) {
            const updateQueryList = ['orderMapper.updateMonthCloseNegoAndNote'];

            fnModifyPQGrid($closingHistoryGrid, [], updateQueryList);
        });

        $("#CONTROL_SALES_STATUS_TABS").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#view_tab_10000205 .topWrap').toggle();
                $('#sales_status_save_id').toggle();
            }
        });

        $('#CONTROL_SALES_CLOSING_HISTORY_SEARCH').on('click', function () {
            $closingHistoryGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
            });
            $closingHistoryGrid.pqGrid('refreshDataAndView');
        });

        $('#CONTROL_MONTH_SALE_STATUS_SEARCH').on('click', function () {
            $monthlySalesStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('#MONTH_SALE_STATUS_SEARCH_FORM');
            });
            $monthlySalesStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#CONTROL_SALES_CLOSING_HISTORY_EXCEL_EXPORT').on('click', function () {
            const blob = $closingHistoryGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '마감이력.xlsx');
        });

        $('#CONTROL_MONTH_SALE_STATUS_EXCEL_EXPORT').on('click', function () {
            const blob = $monthlySalesStatusGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '월별 매출현황.xlsx');
        });

        /* init */
        $closingHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlySalesStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);
        /* init */
    });
</script>
