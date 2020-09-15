<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-09-14
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page">
    <div class="topWrap">
        <form class="form-inline" id="MONTHLY_DETAIL_STATUS_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="reportMapper.selectMonthlyDetailStatusList">
            <div class="none_gubunWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100">조회년월</label>
                            <select class="wd_100" class="two" name="CLOSE_YEAR" id="CLOSE_HISTORY_CLOSE_YEAR"></select>
                            <select class="wd_100" class="two" name="CLOSE_MONTH" id="CLOSE_HISTORY_CLOSE_MONTH"></select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                            <select class="wd_200" name="ORDER_COMP_CD" id="ORDER_COMP_CD" title="발주처">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                        <button type="button" class="defaultBtn radius blue" id="CLOSE_HISTORY_SEARCH">발주처별 현황</button>
                        <button type="button" class="defaultBtn radius blue" id="PROCESS_TARGET_LIST">가공대상 List</button>
                        <button type="button" class="right_float defaultBtn radius green" id="CLOSE_HISTORY_SEARCH">저장</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="<%--hWrap --%>mb-10">
            <div>
            </div>
        </div>
        <div class="tableWrap">
            <div class="conWrap">
                <div id="MONTHLY_DETAIL_STATUS_GRID"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CONTROL_MANAGE_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        let monthReportDetailPopup;
        //TODO: change element id
        fnAppendSelectboxYear('CLOSE_HISTORY_CLOSE_YEAR', 10);
        fnAppendSelectboxMonth('CLOSE_HISTORY_CLOSE_MONTH');
        fnCommCodeDatasourceSelectBoxCreate($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#MONTHLY_DETAIL_STATUS_SEARCH_FORM').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        
        const gridId = 'MONTHLY_DETAIL_STATUS_GRID';
        let postData = fnFormToJsonArrayData('#MONTHLY_DETAIL_STATUS_SEARCH_FORM');
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '날짜', dataIndx: 'ROW_NUM'},
            {title: '요일', dataIndx: 'ROW_NUM'},
            {
                title: '납품대상', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS'},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS_NM', style: {'background': '#D6DCE4'}}
                ]
            },
            {
                title: '외주지정', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS'},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS_NM', style: {'background': '#D6DCE4'}}
                ]
            },
            {
                title: '가공완료', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS'},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'profits', style: {'background': '#D6DCE4', 'text-decoration': 'underline'}}
                ]
            },
            {
                title: '지연현황', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS'},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS_NM', style: {'background': '#D6DCE4'}}
                ]
            },
            {title: '지연율', dataIndx: 'ROW_NUM', style: {'background': '#FFD966'}},
            {title: '외주율<br>(수량)', dataIndx: 'ROW_NUM', style: {'background': '#FFD966'}},
            {title: '매출<br>예상금액', dataType: 'integer', format: '#,###', dataIndx: 'ROW_NUM'},
            {title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'ROW_NUM'},
            {title: '달성율', dataIndx: 'ROW_NUM', style: {'background': '#D9E1F2'}},
            {title: '기존<br>근무', dataType: 'integer', format: '#,###', dataIndx: 'ROW_NUM'},
            {
                title: '부적합', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS', style: {'background': '#FFF2CC'}},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS_NM', style: {'background': '#D6DCE4'}}
                ]
            },
            {
                title: '반품건수', align: 'center', colModel: [
                    {title: '품', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS', style: {'background': '#FFF2CC'}},
                    {title: 'EA', dataType: 'integer', format: '#,###', dataIndx: 'CONTROL_STATUS_NM', style: {'background': '#D6DCE4'}}
                ]
            },
            {
                title: '비고', dataIndx: 'ROW_NUM', editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            }
        ];
        const obj = {
            height: 800,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: colModel,
            // dataModel: {
            //     location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            //     postData: postData,
            //     recIndx: 'ROW_NUM',
            //     getData: function (dataJSON) {
            //         return {data: dataJSON.data};
            //     }
            // },
            dataModel: { data:  [
            { rank: 1, company: 'Exxon Mobil', revenues: 339938.0, profits: 36130.0 },
            { rank: 2, company: 'Wal-Mart Stores', revenues: 315654.0, profits: 11231.0 },
            { rank: 3, company: 'Royal Dutch Shell', revenues: 306731.0, profits: 25311.0 },
            { rank: 4, company: 'BP', revenues: 267600.0, profits: 22341.0 },
            { rank: 5, company: 'General Motors', revenues: 192604.0, profits: -10567.0 },
            { rank: 6, company: 'Chevron', revenues: 189481.0, profits: 14099.0 },
            { rank: 7, company: 'DaimlerChrysler', revenues: 186106.3, profits: 3536.3 },
            { rank: 8, company: 'Toyota Motor', revenues: 185805.0, profits: 12119.6 },
            { rank: 9, company: 'Ford Motor', revenues: 177210.0, profits: 2024.0 },
            { rank: 10, company: 'ConocoPhillips', revenues: 166683.0, profits: 13529.0 },
            { rank: 11, company: 'General Electric', revenues: 157153.0, profits: 16353.0 },
            { rank: 12, company: 'Total', revenues: 152360.7, profits: 15250.0 },
            { rank: 13, company: 'ING Group', revenues: 138235.3, profits: 8958.9 },
            { rank: 14, company: 'Citigroup', revenues: 131045.0, profits: 24589.0 },
            { rank: 15, company: 'AXA', revenues: 129839.2, profits: 5186.5 },
            { rank: 16, company: 'Allianz', revenues: 121406.0, profits: 5442.4 },
            { rank: 17, company: 'Volkswagen', revenues: 118376.6, profits: 1391.7 },
            { rank: 18, company: 'Fortis', revenues: 112351.4, profits: 4896.3 },
            { rank: 19, company: 'Crédit Agricole', revenues: 110764.6, profits: 7434.3 },
            { rank: 20, company: 'American Intl. Group', revenues: 108905.0, profits: 10477.0 }
        ]},
            // load: function (event, ui) {
            //     if (ui.dataModel.data.length > 0) {
            //         $dailyProcessStatusLeftGrid.pqGrid('setSelection', {rowIndx: 0});
            //     }
            // },
            rowInit: function (ui) {
                switch (ui.rowData.rank) {
                    // 합계
                    case 1:
                        return {style: {'background': 'yellow'}};
                    // 총계
                    case 2:
                        return {style: {'background': '#FFEF99'}};
                }
            }
        };
        const $dailyProcessStatusRightGrid = $('#' + gridId).pqGrid(obj);
        /* init */

        /* function */
        const openNewWindowMonthReportDetail = function (rowData) {
            let url = '/monthReportDetail';
            // 팝업 사이즈
            let nWidth = 1440;
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
            if (monthReportDetailPopup === undefined || monthReportDetailPopup.closed) {
                monthReportDetailPopup = window.open(url, '', strOption);
            } else {
                monthReportDetailPopup.focus();
                //TODO: research
            }
        };
        /* function */

        /* evnet */
        $('#PROCESS_TARGET_LIST').on('click', function () {

        });

        $('#PROCESS_TARGET_LIST').on('click', function () {
           console.count();
           openNewWindowMonthReportDetail();
        });
        /* evnet */
    });
</script>