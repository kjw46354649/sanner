<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-04-10
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page estimate">
    <div class="topWrap out_close_tab">
        <form class="form-inline" id="OUTSIDE_CLOSE_STATUS_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseStatusList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">매입 사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">차수</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <option value="1">1차</option>
                                <option value="2">2차</option>
                                <option value="3">3차</option>
                                <option value="4">4차</option>
                                <option value="5">5차</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="CLOSE_NOTE">비고</label>
                            <input type="search" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                        <span class="gubun"></span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <select name="CLOSE_YEAR_LEFT" id="OUTSIDE_CLOSE_YEAR_LEFT"></select>
                        <select name="CLOSE_MONTH_LEFT" id="OUTSIDE_CLOSE_MONTH_LEFT"></select>
                        <span style="margin: 0 5px; vertical-align: middle; font-size: 1.4rem;">&nbsp;~&nbsp;</span>
                        <select name="CLOSE_YEAR_RIGHT" id="OUTSIDE_CLOSE_YEAR_RIGHT" disabled></select>
                        <select name="CLOSE_MONTH_RIGHT" id="OUTSIDE_CLOSE_MONTH_RIGHT" disabled></select>
                        <span class="chk_box" style="margin-left: 10px;">
                            <input type="checkbox" name="RANGE_SEARCH" id="OUTSIDE_CLOSE_STATUS_RANGE_SEARCH">
                            <label for="OUTSIDE_CLOSE_STATUS_RANGE_SEARCH"> Range 검색</label>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="OUTSIDE_CLOSE_STATUS_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="topWrap out_month_tab" style="display: none;">
        <form class="form-inline" id="MONTH_OUTSIDE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideYearCloseStatusList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">매입 사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="YEAR">조회년도</label>
                            <select class="wd_200" name="YEAR" id="YEAR">
                                <option></option>
                            </select>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">Option</label>
                        </span>
                        <span class="chk_box"><input type="checkbox" name="ORIGINAL_ORDER_AMOUNT" id="ORIGINAL_ORDER_AMOUNT"><label for="ORIGINAL_ORDER_AMOUNT">원 발주 금액</label></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" id="MONTH_OUTSIDE_STATUS_EXCEL_EXPORT"><img src="/resource/asset/images/common/export_excel.png" alt="엑셀 이미지"></button>
                        </span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="OUTSOURCING_STATUS_TABS" style="padding: 10px 0;">
        <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#OUTSIDE_CLOSE_STATUS" data-toggle="tab" aria-expanded="true">마감현황</a>
                </li>
                <li>
                    <a href="#MONTHLY_OUTSIDE_STATUS" data-toggle="tab" aria-expanded="false">월별 현황</a>
                </li>
                <div class="right_float" id="out_status_save_id">
                    <button type="button" class="defaultBtn green" style="font-weight:normal;" id="OUTSIDE_CLOSE_STATUS_SAVE">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="OUTSIDE_CLOSE_STATUS">
                    <div id="OUTSIDE_CLOSE_STATUS_GRID"></div>
                </ul>
                <ul class="conWrap" id="MONTHLY_OUTSIDE_STATUS">
                    <div id="MONTHLY_OUTSIDE_STATUS_GRID"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    var $outsideCloseStatusGrid;
    var outsideCloseStatusRowIndex = [];
    $(function () {
        'use strict';
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').find('#OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').find('#OUTSIDE_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOutsourceCompanyList'}
        });
        fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_LEFT');
        $('#OUTSIDE_CLOSE_MONTH_LEFT').val('01').prop('selected', true);
        fnAppendSelectboxYear('OUTSIDE_CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('YEAR', 10);

        /* variable */
        const tab1GridId = 'OUTSIDE_CLOSE_STATUS_GRID';
        let tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = CURRENT_YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = '01';
        const tab1ColModel = [
            {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'CLOSE_MONTH', dataIndx: 'CLOSE_MONTH', hidden: true},
            {title: 'CLOSE_VER', dataType: 'integer', dataIndx: 'CLOSE_VER', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '매입 사업자', width: 75, dataIndx: 'COMP_CD', hidden: true},
            {title: '매입 사업자', width:75, dataIndx: 'COMP_NM'},
            {title: '년도', dataIndx: 'YEAR'},
            {title: '분기', dataIndx: 'QUARTER'},
            {title: '마감월', dataIndx: 'FINISH_MONTH'},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '차수', dataIndx: 'VIEW_CLOSE_VER'},
            {title: '품수', dataIndx: 'ITEM_NUMBER', summary: {type: 'sum'},
                render: function (ui) {
                    if (ui.rowData.pq_grandsummary) {
                        return ui.cellData;
                    } else {
                        return ('<button name="SALES_STATUS_OUTSIDE_DETAIL_VIEW"><u>' + ui.cellData + '</u></button>');
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=SALES_STATUS_OUTSIDE_DETAIL_VIEW]').bind('click', function () {
                        let rowData = ui.rowData;
                        openNewWindowControlDetail(rowData);
                    });
                }
            },
            {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_PART_QTY', summary: {type: 'sum'}},
            {title: '원 발주<br>금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_ORDER_AMT', summary: {type: 'sum'}},
            {title: '외주<br>발주 금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'OUTSIDE_ORDER_AMT', summary: {type: 'sum'}},
            {
                title: '외주<br>마감 금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_NEGO_AMT', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                summary: {type: 'sum'}
            },
            {title: '부가세', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'VAT_AMOUNT', summary: {type: 'sum'}},
            {title: '부가세<br>합계금액', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMOUNT', summary: {type: 'sum'}},
            {title: '업데이트<br>일시', dataIndx: 'OUTISDE_CLOSE_NOTE_INSERT_UPDATE_DT'},
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
            showTitle: false,
            postRenderInterval: -1,
            rowHtHead: 15,
            numberCell: {show: false},
            selectionModel: {type: 'row', mode: 'single'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center',  editable: false},
            colModel: tab1ColModel,
            groupModel: tab1GroupModel,
            toolbar: false,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            summaryTitle: {sum: '{0}'},
            rowSelect: function (event, ui) {
                outsideCloseStatusRowIndex = ui.addList[0].rowIndx;
            },
        };
        let $monthlyOutsideStatusGrid;
        const tab2GridId = 'MONTHLY_OUTSIDE_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
        tab2PostData.YEAR = CURRENT_YEAR;
        const tab2ColModel = [
            // {title: 'GROUP_KEY', dataType: 'integer', dataIndx: 'GROUP_KEY', hidden: true},
            {title: 'No.', minWidth: 30, width: 30, maxWidth: 30, dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: '매입 사업자', width: 75, dataIndx: 'COMP_CD', hidden: true},
            {title: '매입 사업자', width:75, dataIndx: 'COMP_NM'},
            {title: '발주업체', width: 75, dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '대상외주업체', width: 75, dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '구분', width: 75, dataIndx: 'STATUS_TYPE'},
            {
                title: '1분기', align: 'center', colModel: [
                    {title: '1월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '01_AMT'},
                    {title: '2월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '02_AMT'},
                    {title: '3월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_AMT'},
                    {title: '합계', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '03_SUM_AMT', style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '2분기', align: 'center', colModel: [
                    {title: '4월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '04_AMT'},
                    {title: '5월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '05_AMT'},
                    {title: '6월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_AMT'},
                    {title: '합계', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '06_SUM_AMT', style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '3분기', align: 'center', colModel: [
                    {title: '7월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '07_AMT'},
                    {title: '8월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '08_AMT'},
                    {title: '9월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_AMT'},
                    {title: '합계', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '09_SUM_AMT', style: {'font-weight': 'bold'}}
                ]
            },
            {
                title: '4분기', align: 'center', colModel: [
                    {title: '10월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '10_AMT'},
                    {title: '11월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '11_AMT'},
                    {title: '12월', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_AMT'},
                    {title: '합계', width: 75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: '12_SUM_AMT', style: {'font-weight': 'bold'}}
                ]
            },
            {title: '합계', width:75, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'TOTAL_AMT', style: {'font-weight': 'bold'}}
        ];
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
            // groupModel: tab2GroupModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            summaryTitle: {sum: '{0}'},
            load: function() {
                const merge = function (grid, refresh) {
                    let mc = [],
                        CM = ['COMP_NM', 'OUTSIDE_COMP_NM'],
                        i = CM.length,
                        data = grid.option('dataModel.data');

                    while (i--) {
                        let dataIndx = CM[i],
                            rc = 1,
                            j = data.length,
                            k = grid.getColIndx({dataIndx: CM[i]});

                        while (j--) {
                            let outsideComp = data[j]['OUTSIDE_COMP_NM'],
                                outsideCompPrev = data[j - 1] ? data[j - 1]['OUTSIDE_COMP_NM'] : undefined,
                                cd = data[j][dataIndx],
                                cd_prev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                            if (cd_prev !== undefined && outsideComp === outsideCompPrev && cd === cd_prev) {
                                rc++;
                            } else if (rc > 1) {
                                mc.push({r1: j, c1: k, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }
                    }
                    grid.option('mergeCells', mc);
                    if (refresh) {
                        grid.refreshView();
                    }
                };

                merge(this, true);
                this.option('summaryData', getSummary());
            }
        };

        let outsideDetailPopup;
        /* variable */

        /* funciton */
        const openNewWindowControlDetail = function () {
            let url = '/outsideDetail';
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
            if (outsideDetailPopup === undefined || outsideDetailPopup.closed) {
                outsideDetailPopup = window.open(url, '', strOption);
            } else {
                outsideDetailPopup.focus();
            }
        };

        const getSummary = function () {
            let postData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
            postData.queryId = 'outMapper.selectOutsideYearCloseStatusSummary';
            let parameters = {'url': '/json-list', 'data': postData};
            let dataList = [];

            fnPostAjaxAsync(function (data) {
                dataList = data.list;
            }, parameters, '');

            return dataList;
        };
        /* funciton */

        /* event */
        $('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').on('change', function () {
            $outsideCloseStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM');
            });
            $outsideCloseStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#MONTH_OUTSIDE_STATUS_SEARCH_FORM').on('change', function () {
            $monthlyOutsideStatusGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
            });
            $monthlyOutsideStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#OUTSIDE_CLOSE_YEAR_LEFT').on('change', function () {
            fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_LEFT', this.value);
        });
        $('#OUTSIDE_CLOSE_YEAR_RIGHT').on('change', function () {
            fnAppendSelectboxMonth('OUTSIDE_CLOSE_MONTH_RIGHT', this.value);
        });
        $('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM').find('#OUTSIDE_CLOSE_STATUS_RANGE_SEARCH').on('change', function () {
            if ($(this).prop('checked')) {
                $('#OUTSIDE_CLOSE_YEAR_RIGHT').prop('disabled', false);
                $('#OUTSIDE_CLOSE_MONTH_RIGHT').prop('disabled', false);
            } else {
                $('#OUTSIDE_CLOSE_YEAR_RIGHT').prop('disabled', true);
                $('#OUTSIDE_CLOSE_MONTH_RIGHT').prop('disabled', true);
            }
        });

        $('#OUTSIDE_CLOSE_STATUS_SAVE').on('click', function () {
            const updateQueryList = ['outMapper.updateOutsideCloseNote'];

            fnModifyPQGrid($outsideCloseStatusGrid, [], updateQueryList);
        });

        $('#OUTSOURCING_STATUS_TABS').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                // $('#view_tab_10000303 .topWrap').toggle();
                // $('#out_status_save_id').toggle();
                if(ui.newPanel.selector == "#OUTSIDE_CLOSE_STATUS") {
                    $(".out_month_tab").hide();
                    $('#out_status_save_id').show();
                    $(".out_close_tab").show();
                }else {
                    $(".out_close_tab").hide();
                    $('#out_status_save_id').hide();
                    $(".out_month_tab").show();
                }
            }
        });

        $('#OUTSIDE_CLOSE_STATUS_EXCEL_EXPORT').on('click', function () {
            const blob = $outsideCloseStatusGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '외주마감 현황.xlsx');
        });

        $('#MONTH_OUTSIDE_STATUS_EXCEL_EXPORT').on('click', function () {
            const blob = $monthlyOutsideStatusGrid.pqGrid('getInstance').grid.exportData({
                format: 'xlsx',
                render: true,
                type: 'blob'
            });

            saveAs(blob, '외주 월별 현황.xlsx');
        });
        /* event */

        /* init */
        $outsideCloseStatusGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlyOutsideStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);
        /* init */
    });
</script>
