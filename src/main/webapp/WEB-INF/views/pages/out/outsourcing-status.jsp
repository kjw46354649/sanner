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
    <div class="topWrap">
        <form class="form-inline" id="OUTSIDE_CLOSE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectOutsideCloseStatusList">
            <div class="gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">차수</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
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
                            <input type="text" class="wd_200" name="CLOSE_NOTE" id="CLOSE_NOTE">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="TAB1_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <select name="CLOSE_YEAR_LEFT" id="CLOSE_YEAR_LEFT" style="width: 100px;"></select>
                        <select name="CLOSE_MONTH_LEFT" id="CLOSE_MONTH_LEFT" style="width: 100px; margin-right: 10px;"></select><span style="margin: 10px 0; vertical-align: middle; font-size: 1.4rem;">~</span>
                        <select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled style="width:100px; margin-left: 10px;" ></select>
                        <select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled style="width:100px;"</select>
                        <span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH"><label for="RANGE_SEARCH"> Range 검색</label></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="MONTH_OUTSIDE_STATUS_SEARCH_FORM" role="form">
            <input type="hidden" name="queryId" id="queryId" value="outMapper.selectMonthCloseStatusList">
            <div class="gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="OUTSIDE_COMP_CD">외주업체</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="YEAR">조회년도</label>
                            <select class="wd_200" name="YEAR" id="YEAR">
                                <option></option>
                            </select>
                        </span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="TAB2_SEARCH">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100">Option</label>
                        </span>
                        <span class="chk_box"><input type="checkbox" name="ORIGINAL_ORDER_AMOUNT" id="ORIGINAL_ORDER_AMOUNT"><label for="ORIGINAL_ORDER_AMOUNT">원 발주 금액</label></span>
                    </li>
                </ul>
            </div>
        </form>
        <button type="button" class="topWrap_btn">펼치기 / 접기</button>
    </div>
    <div class="bottomWrap">
        <div class="hWrap">
            <div>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn btn-120w green" id="OUTSIDE_CLOSE_STATUS_SAVE">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap jmestabs" id="OUTSOURCING_STATUS_TABS" style="padding: 10px 0;">
        <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#OUTSIDE_CLOSE_STATUS" data-toggle="tab" aria-expanded="true">마감현황</a>
                </li>
                <li>
                    <a href="#MONTHLY_OUTSIDE_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                </li>
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
    $(function () {
        'use strict';
        /* variable */
        const TODAY = new Date();
        const YEAR = TODAY.getFullYear();
        const MONTH = TODAY.getMonth() + 1;

        let $outsideCloseStatusGrid;
        const tab1GridId = 'OUTSIDE_CLOSE_STATUS_GRID';
        let tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM');
        tab1PostData.CLOSE_YEAR_LEFT = YEAR;
        tab1PostData.CLOSE_MONTH_LEFT = MONTH;
        let tab1ColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자 구분', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자 구분', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '년도', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '분기', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '마감월', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '외주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '품수', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
            {title: '외주 발주 금액', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '부가세액', dataType: 'string', dataIndx: 'VAT_AMOUNT'},
            {title: '합계금액', dataType: 'string', dataIndx: 'TOTAL_AMOUNT'},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];
        let tab1Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const updateQueryList = ['orderMapper.updateControlMaster', 'orderMapper.updateControlPart'];

                            fnModifyPQGrid($orderManagementGrid, [], updateQueryList);
                        }
                    }
                }
            ]
        };
        let tab1Obj = {
            height: 700,
            collapsible: false,
            resizable: true,
            showTitle: false,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center',  editable: false},
            colModel: tab1ColModel,
            toolbar: tab1Toolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $monthlyOutsideStatusGrid;
        const tab2GridId = 'MONTHLY_OUTSIDE_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM');
        tab2PostData.YEAR = YEAR;
        const tab2ColModel = [
            {title: 'Group', tpHide: true, menuInHide: true, dataIndx: 'grp'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '발주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true/*, filter:{groupIndx: 'COMP_CD'}*/},
            {title: '발주업체', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'/*, filter:{groupIndx: 'COMP_NM'}*/},
            {title: '년도', dataType: 'string', dataIndx: 'YYYY', hidden: true},
            {title: '월', dataType: 'string', dataIndx: 'MM'},
            {title: '분기', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '매출', dataType: 'string', dataIndx: 'OUTPUT_AMT'/*, summary: {type: 'sum'}*/},
            {title: '입금', dataType: 'string', dataIndx: 'DEPOSIT_AMT'/*, summary: {type: 'sum'}*/}
        ];
        const tab2GroupModel = {
            on: true, //grouping mode.
            titleIndx: 'grp',
            indent: 20,
            fixCols: false,
            pivot: true, //pivotMode
            groupCols: ['YYYY', 'QUARTER', 'MM'],
            agg: {OUTPUT_AMT: 'sum', DEPOSIT_AMT: 'sum'},
            header: false, //hide grouping toolbar.
            grandSummary: true, //show grand summary row.
            dataIndx: ['COMP_NM', 'OUTSIDE_COMP_NM'],
            collapsed: [false, false],
            summaryEdit: false
        };
        const tab2Obj = {
            height: 750,
            collapsible: false,
            resizable: true,
            showTitle: false,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
            colModel: tab2ColModel,
            groupModel: tab2GroupModel,
            toolPanel: {show: false},
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */

        $('#TAB1_SEARCH').on('click', function () {
            tab1PostData = fnFormToJsonArrayData('#OUTSIDE_CLOSE_STATUS_SEARCH_FORM')
            $outsideCloseStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return tab1PostData;
            });
            $outsideCloseStatusGrid.pqGrid('refreshDataAndView');
        });

        $('#TAB2_SEARCH').on('click', function () {
            tab2PostData = fnFormToJsonArrayData('#MONTH_OUTSIDE_STATUS_SEARCH_FORM')
            $monthlyOutsideStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return tab2PostData;
            });
            $monthlyOutsideStatusGrid.pqGrid('refreshDataAndView');
        });

        /* init */
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
        $outsideCloseStatusGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlyOutsideStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);

        fnAppendSelectboxYear('CLOSE_YEAR_LEFT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_LEFT');
        fnAppendSelectboxYear('CLOSE_YEAR_RIGHT', 10);
        fnAppendSelectboxMonth('CLOSE_MONTH_RIGHT');
        fnAppendSelectboxYear('YEAR', 10);

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

        $('#OUTSIDE_CLOSE_STATUS_SAVE').on('click', function () {
            const updateQueryList = ['orderMapper.updateControlMaster', 'orderMapper.updateControlPart'];

            fnModifyPQGrid($outsideCloseStatusGrid, [], updateQueryList);

        });

        $('#OUTSOURCING_STATUS_TABS').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('.topWrap').toggle();
                $('.hWrap').toggle();

            }
        });
        /* init */
    });
</script>
