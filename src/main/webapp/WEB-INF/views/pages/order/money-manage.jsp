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
        <form class="form-inline" id="money_manage_status_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.moneyReceiveStatusList">
            <div class="none_gubunWrap row2_topWrap">
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
                            <label class="label_100" for="OUTSIDE_COMP_CD">발주처</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="CLOSE_VER">조회 년도</label>
                            <select class="wd_200" name="CLOSE_VER" id="CLOSE_VER">
                                <option value="">All</option>
                                <option value="1">1차</option>
                                <option value="2">2차</option>
                                <option value="3">3차</option>
                                <option value="4">4차</option>
                                <option value="5">5차</option>
                            </select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="moneyManageStatusSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="topWrap" style="display: none;">
        <form class="form-inline" id="money_receive_manage_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectOutsideYearCloseStatusList">
            <div class="none_gubunWrap row2_topWrap">
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
                            <label class="label_100" for="OUTSIDE_COMP_CD">발주사</label>
                            <select class="wd_200" name="OUTSIDE_COMP_CD" id="OUTSIDE_COMP_CD">
                                <option value="">All</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="DEGREE">차수</label>
                            <select class="wd_200" name="DEGREE" id="DEGREE">
                                <option value="">All</option>
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
                        <span class="ipu_wrap">
                            <label class="label_100">마감년월</label>
                        </span>
                        <span class="chk_box"><select name="CLOSE_YEAR_LEFT" id="CLOSE_YEAR_LEFT"></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_LEFT" id="CLOSE_MONTH_LEFT"></select><span style="margin: 10px 0; vertical-align: middle; font-size: 1.4rem;"> &nbsp;&nbsp;~</span></span>
                        <span class="chk_box"><select name="CLOSE_YEAR_RIGHT" id="CLOSE_YEAR_RIGHT" disabled></select></span>
                        <span class="chk_box"><select name="CLOSE_MONTH_RIGHT" id="CLOSE_MONTH_RIGHT" disabled></select></span>
                        <%--<span class="chk_box" style="margin-left: 10px;"><input type="checkbox" name="RANGE_SEARCH" id="RANGE_SEARCH">
                        <label for="RANGE_SEARCH"> Range 검색</label></span>--%>
                        <button type="button" class="right_float defaultBtn radius blue" id="moneyStatusSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap jmestabs" id="moneyManageTabs" style="padding: 10px 0;">
            <ul class="smallTabMenuTabs">
                <li class="active">
                    <a href="#money_manage_status_tab" data-toggle="tab" aria-expanded="true">전체현황</a>
                </li>
                <li>
                    <a href="#money_receive_manage_tab" data-toggle="tab" aria-expanded="false">상세 수금현황</a>
                </li>
                <div class="right_float money_receive_save_id">
                    <button type="button" class="defaultBtn green" style="font-weight:normal; display: none;" id="moneyReceiveSaveBtn">저장</button>
                </div>
            </ul>
            <div class="tab-content">
                <ul class="active conWrap" id="money_manage_status_tab">
                    <div id="moneyManageStatusGrid"></div>
                </ul>
                <ul class="conWrap" id="money_receive_manage_tab">
                    <div id="moneyReceiveManageGrid"></div>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>

    let moneyManageStatusGridID = "#moneyManageStatusGrid";
    let moneySalesMonthGridID = "moneyManageStatusGrid";
    let moneyReceiveStatusGridID = "#moneyManageStatusGrid";
    // moneyReceiveYearTotalGridID = "#moneyManageStatusGrid";

    let $moneyManageStatusGrid;
    let $moneySalesMonthGrid;
    let $moneyReceiveStatusGrid;

    $(function () {
        'use strict';
        let moneyManageStatusModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '매출현황', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '만기전 어음', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '미수금(어음제외)', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '현금', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '어음', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
            {title: '합계', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '총만기전 어음', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
            {title: '총미수금 현황(어음제외)', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];

        let moneySalesMonthModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '매출년월', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '매출금액', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];

        let moneyReceiveStatusModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '발주처', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '입금월일', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '입금액', dataType: 'string', dataIndx: 'QUARTER'},
            {title: '종류', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true},
            {title: '만기', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true},
            {title: '만기어음/지급여부', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true},
            {title: '어음지급액', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true},
            {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        ];

        // let moneyReceiveYearTotalModel = [
        //     {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
        //     {title: '발주처', dataType: 'string', dataIndx: 'COMP_NM'},
        //     {title: '년도', dataType: 'string', dataIndx: 'COMP_NM'},
        //     {title: '총매출현황', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
        //     {title: '만기전 어음', dataType: 'string', dataIndx: 'QUARTER'},
        //     {title: '미수금(어음제외)', dataType: 'string', dataIndx: 'FINISH_MONTH'},
        //     {title: '현금', dataType: 'string', dataIndx: 'CLOSE_VER'},
        //     {title: '어음', dataType: 'string', dataIndx: 'OUTSIDE_COMP_CD', hidden: true},
        //     {title: '합계', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
        //     {title: '총 만기전 어음', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
        //     {title: '총 미수금 현황(어음제외)', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
        //     {title: '비고', dataType: 'string', dataIndx: 'CLOSE_NOTE', editable: true}
        // ];

        let moneyManageStatusObj = {
            height: 750,
            collapsible: false,
            resizable: true,
            showTitle: false,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center',  editable: false},
            colModel: moneyManageStatusModel,
            toolbar: false,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('money_manage_status_search_form'), recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        $moneyManageStatusGrid = $('#' + moneySalesMonthGridID).pqGrid(moneyManageStatusObj);


        /* variable */

        $('#moneyManageStatusSearchBtn').on('click', function () {
            $moneyManageStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return fnFormToJsonArrayData('money_manage_status_search_form');
            });
            $moneyManageStatusGrid.pqGrid('refreshDataAndView');
        });

        // $('#moneyStatusSearchBtn').on('click', function () {
        //     $monthlyOutsideStatusGrid.pqGrid('option', 'dataModel.postData', function (ui) {
        //         return tab2PostData;
        //     });
        //     $monthlyOutsideStatusGrid.pqGrid('refreshDataAndView');
        // });

        $('#moneyManageTabs').tabs({
            activate: function (event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('.topWrap').toggle();
                $('.money_receive_save_id').toggle();

            }
        });
        /* init */
    });
</script>
