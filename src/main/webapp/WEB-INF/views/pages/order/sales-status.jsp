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

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-md-12">
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    주문 마감 이력
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectSalesClosingHistory">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CORPORATION">사업자</label>
                                <select class="form-control" name="CORPORATION" id="CORPORATION">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CLIENT">발주사</label>
                                <select class="form-control" name="CLIENT" id="CLIENT">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DEGREE">차수</label>
                                <select class="form-control" name="DEGREE" id="DEGREE">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="NOTE">비고</label>
                                <input type="text" class="form-control" name="NOTE" id="NOTE">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label" for="DEADLINE">마감년월</label>
                                <select>

                                </select>년
                                <select>

                                </select>월 ~
                                <select>

                                </select>년
                                <select>

                                </select>월
                                <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_SORT">
                                    <input type="checkbox" name="DESCENDING" id="CONFIRM_ORDER_SORT"><i></i> Range 검색
                                </label>
                            </div>
                            <div class="form-group col-md-6 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default" id="testSearch">
                                    Search
                                </div>
                            </div>
                        </div>
                    </form>
                    <form class="form-inline" id="MONTHLY_SALES_STATUS_SEARCH_FORM" role="form" style="display: none">
                        <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectSalesClosingHistory">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="COMP_CD">사업자</label>
                                <select class="form-control" name="COMP_CD" id="COMP_CD">
                                    <option value="">All</option>
                                    <c:forEach var="code" items="${HighCode.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_COMP_CD">발주사</label>
                                <select class="form-control" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DEGREE">차수</label>
                                <select class="form-control" name="DEGREE" id="DEGREE">
                                    <option value="">All</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="NOTE">비고</label>
                                <input type="text" class="form-control" name="NOTE" id="NOTE">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label" for="DEADLINE">마감년월</label>
                                <select>

                                </select>년
                                <select>

                                </select>월 ~
                                <select>

                                </select>년
                                <select>

                                </select>월
                                <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_SORT">
                                    <input type="checkbox" name="DESCENDING" id="CONFIRM_ORDER_SORT"><i></i> Range 검색
                                </label>
                            </div>
                            <div class="form-group col-md-6 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default" id="testSearch">
                                    Search
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
    <div id="tabs">
        <div class="row">&nbsp;
    <%--            <section>--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div id="CONTROL_MANAGE_GRID"></div>--%>
    <%--                </div>--%>
    <%--            </section>--%>
                <ul class="nav nav-tabs m-b-n-xxs">
                    <li class="active">
                        <a href="#CLOSING_HISTORY" data-toggle="tab" aria-expanded="true">마감이력</a>
                    </li>
                    <li class="">
                        <a href="#MONTHLY_SALES_STATUS" data-toggle="tab" aria-expanded="false">월별 매출현황</a>
                    </li>
                </ul>
                <div class="panel panel-default tab-content">
                    <ul class="list-group tab-pane active" id="CLOSING_HISTORY">
                        <div id="CLOSING_HISTORY_GRID"></div>
                    </ul>
                    <ul class="list-group tab-pane list-group-alt list-group-lg" id="MONTHLY_SALES_STATUS">
                        <div id="MONTHLY_SALES_STATUS_GRID"></div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* variable */
        let $closingHistoryGrid;
        const tab1GridId = 'CLOSING_HISTORY_GRID';
        let tab1PostData = fnFormToJsonArrayData('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM');
        let tab1ColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM'},
            {title: '년도', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '분기', dataType: 'string', dataIndx: 'QUATER'},
            {title: '마감월', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '품수', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
            {title: '최종 공급가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
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
            // width: 700,
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: tab1ColModel,
            toolbar: tab1Toolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab1PostData,
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        let $monthlySalesStatusGrid;
        const tab2GridId = 'MONTHLY_SALES_STATUS_GRID';
        let tab2PostData = fnFormToJsonArrayData('#MONTHLY_SALES_STATUS_SEARCH_FORM');
        let tab2ColModel = [
            {title: 'ROWNUM', dataType: 'integer', dataIndx: 'ROWNUM', hidden: true, colModel: []},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD', hidden: true, colModel: []},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_NM', colModel: []},
            {title: '년도', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true, colModel: []},
            {title: '분기', dataType: 'string', dataIndx: 'QUATER', colModel: []},
            {title: '마감월', dataType: 'string', dataIndx: 'FINISH_MONTH'},
            {title: '차수', dataType: 'string', dataIndx: 'CLOSE_VER'},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
            {title: '품수', dataType: 'string', dataIndx: 'ITEM_NUMBER'},
            {title: '최종 공급가', dataType: 'string', dataIndx: 'UNIT_FINAL_AMT'},
            {title: '부가세액', dataType: 'string', dataIndx: 'VAT_AMOUNT'},
            {title: '합계금액', dataType: 'string', dataIndx: 'TOTAL_AMOUNT'},
            {title: '비고', dataType: 'string', dataIndx: 'CONTROL_NUM'}
        ];
        let tab2Toolbar = {
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
        let tab2Obj = {
            // width: 700,
            // height: 600,
            collapsible: false,
            resizable: true,
            showTitle: false,
            numberCell: {title: 'No.'},
            // scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center', //to vertically center align the header cells.
                editable: false
            },
            colModel: tab2ColModel,
            toolbar: tab2Toolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: tab2PostData,
                recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };
        /* variable */



        /* init */
        /*fnCommCodeDatasourceSelectBoxCreate($('#CONTROL_MANAGE_SEARCH_FORM').find('#CLIENT'), 'CLOSING_HISTORY', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });*/
        $closingHistoryGrid = $('#' + tab1GridId).pqGrid(tab1Obj);
        $monthlySalesStatusGrid = $('#' + tab2GridId).pqGrid(tab2Obj);
        console.log($monthlySalesStatusGrid);

        $("#tabs").tabs({
            activate: function(event, ui) {
                ui.newPanel.find('.pq-grid').pqGrid('refresh');
                $('#SALES_CLOSING_HISTORY_MANAGE_SEARCH_FORM').toggle(); // show -> hide , hide -> show
                $('#MONTHLY_SALES_STATUS_SEARCH_FORM').toggle(); // show -> hide , hide -> show
            }
        });
        /* init */
    });
</script>
