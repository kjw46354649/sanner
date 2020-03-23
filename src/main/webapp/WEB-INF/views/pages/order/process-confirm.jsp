<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-23
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-context">
    <div class="col-md-6">
        <section class="panel panel-default">
            <header class="panel-heading font-bold">
                주문확정 List ( Total : <span id="CONFIRM_ORDER_TOTAL_RECORDS" style="color: #00b3ee">0</span> Rows <span
                    id="CONFIRM_ORDER_TOTAL_ORDER_QUANTITY" style="color: #00b3ee">0</span> EA )
            </header>
            <div class="panel-body">
                <form class="form-inline" id="CONFIRM_ORDER_SEARCH_FORM" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">&nbsp;
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CONFIRM_ORDER_CORPORATION">발주처</label>
                                <select class="form-control" name="CONFIRM_ORDER_CORPORATION"
                                        id="CONFIRM_ORDER_CORPORATION">
                                    <option value="">- ALL -</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CONFIRM_ORDER_SORT_BY">Sorting 기준</label>
                                <select class="form-control" name="CONFIRM_ORDER_SORT_BY"
                                        id="CONFIRM_ORDER_SORT_BY">
                                    <option value="">용망납기</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                                <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_SORT">
                                    <input type="checkbox" id="CONFIRM_ORDER_SORT"><i></i> 내림차순
                                </label>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CONFIRM_ORDER_MATERIAL">소재</label>
                                <select class="form-control" name="CONFIRM_ORDER_MATERIAL"
                                        id="CONFIRM_ORDER_MATERIAL">
                                    <option value=""> - ALL -</option>
                                    <c:forEach var="code" items="${HighCode.H_1001}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_EMERGENCY_PRIORITY">
                                    <input type="checkbox" name="CONFIRM_ORDER_EMERGENCY_PRIORITY"
                                           id="CONFIRM_ORDER_EMERGENCY_PRIORITY"><i></i> 긴급우선 Sorting
                                </label>
                                <label class="checkbox-inline i-checks" for="CONFIRM_ORDER_EXCLUDE_STOCK">
                                    <input type="checkbox" name="CONFIRM_ORDER_EXCLUDE_STOCK"
                                           id="CONFIRM_ORDER_EXCLUDE_STOCK"><i></i> 재고 제외
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <div class="row">
            <section>
                <div class="col-md-12">
                    <div id="CONFIRM_ORDER_GRID"></div>
                </div>
            </section>
        </div>
    </div>
    <div class="col-md-6">
        <section class="panel panel-default">
            <header class="panel-heading font-bold">
                가공확정 List ( Total : <span style="color: #00b3ee">16</span> Rows <span style="color: #00b3ee">103</span>
                EA )
            </header>
            <div class="panel-body">
                <form class="form-inline" id="CONTROL_MANAGE_SEARCH_FORM" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">&nbsp;
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="PROCESS_CONFIRM_CORPORATION">발주처</label>
                                <select class="form-control" name="PROCESS_CONFIRM_CORPORATION"
                                        id="PROCESS_CONFIRM_CORPORATION">
                                    <option value="">- ALL -</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="PROCESS_CONFIRM_SORT_BY">Sorting 기준</label>
                                <select class="form-control" name="PROCESS_CONFIRM_SORT_BY"
                                        id="PROCESS_CONFIRM_SORT_BY">
                                    <option value="">용망납기</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                                <label class="checkbox-inline i-checks" for="PROCESS_CONFIRM_SORT">
                                    <input type="checkbox" id="PROCESS_CONFIRM_SORT"><i></i> 내림차순
                                </label>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="PROCESS_CONFIRM_MATERIAL">소재</label>
                                <select class="form-control" name="PROCESS_CONFIRM_MATERIAL"
                                        id="PROCESS_CONFIRM_MATERIAL">
                                    <option value=""> - ALL -</option>
                                    <c:forEach var="code" items="${HighCode.H_1001}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="checkbox-inline i-checks" for="PROCESS_CONFIRM_EMERGENCY_PRIORITY">
                                    <input type="checkbox" name="PROCESS_CONFIRM_EMERGENCY_PRIORITY"
                                           id="PROCESS_CONFIRM_EMERGENCY_PRIORITY"><i></i> 긴급우선 Sorting
                                </label>
                                <label class="checkbox-inline i-checks" for="PROCESS_CONFIRM_EXCLUDE_STOCK">
                                    <input type="checkbox" name="PROCESS_CONFIRM_EXCLUDE_STOCK"
                                           id="PROCESS_CONFIRM_EXCLUDE_STOCK"><i></i> 재고 제외
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <div class="row">
            <section>
                <div class="col-md-12">
                    <div id="PROCESS_CONFIRM_GRID"></div>
                </div>
            </section>
        </div>
        <section class="panel panel-default">
            <header class="panel-heading font-bold">
                외주가공 List ( Total : <span style="color: #00b3ee">16</span> Rows <span style="color: #00b3ee">103</span>
                EA )
            </header>
            <div class="panel-body">
                <form class="form-inline" id="CONTROL_MANAGE_SEARCH_FORM" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="selectControlManageList">&nbsp;
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="OUTSOURCE_CORPORATION">발주처</label>
                                <select class="form-control" name="OUTSOURCE_CORPORATION" id="OUTSOURCE_CORPORATION">
                                    <option value="">- ALL -</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="OUTSOURCE_SUBCONTRACTOR">외주업체</label>
                                <select class="form-control" name="OUTSOURCE_SUBCONTRACTOR"
                                        id="OUTSOURCE_SUBCONTRACTOR">
                                    <option value="">- ALL -</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="OUTSOURCE_SORT_BY">Sorting 기준</label>
                                <select class="form-control" name="OUTSOURCE_SORT_BY" id="OUTSOURCE_SORT_BY">
                                    <option value="">용망납기</option>
                                    <%--                                <c:forEach var="code" items="${HighCode.H_1007}">--%>
                                    <%--                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>--%>
                                    <%--                                </c:forEach>--%>
                                </select>
                                <label class="checkbox-inline i-checks" for="OUTSOURCE_CONFIRM_SORT">
                                    <input type="checkbox" name="OUTSOURCE_CONFIRM_SORT"
                                           id="OUTSOURCE_CONFIRM_SORT"><i></i>
                                    내림차순
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <div class="row">
            <section>
                <div class="col-md-12">
                    <div id="PROCESS_GRID"></div>
                </div>
            </section>
        </div>
    </div>

</div>

<script>
    $(function () {
        'use strict';
        let $confirmOrderGrid;
        const leftGridId = 'CONFIRM_ORDER_GRID';
        let leftPostData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let leftColModel = [
            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                    {title: '변경일시', datatype: 'string', dataIndx: 'COMP_CD', editable: false}
                ]
            },
            {title: '발주업체', dataType: 'string', dataIndx: 'COMP_NM', editable: false, colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CEO_NM', editable: false, colModel: []},
            {
                title: 'Part', dataType: 'string', dataIndx: 'COMP_ADDRESS', colModel: [], render: function (ui) {
                    // if(ui.data)
                    return "<span class=\"glyphicon glyphicon-plus-sign\" aria-hidden=\"true\"></span>"
                }
            },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '요망<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주<br>요', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '형<br>태', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '규<br>격', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '후처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'COMP_TYPE', colModel: []},
            {title: '', dataType: 'string', dataIndx: 'COMP_TYPE', colModel: []}
        ];
        // let leftToolbar = {
        //     // cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             cls: 'title-hidden', type: 'textbox', label: '주문확정 List',
        //             style: 'font-size: 1.3rem;padding: 4px;font-weight: bold;'
        //         }
        //     ]
        // };
        let leftObj = {
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
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: leftColModel,
            // toolbar: leftToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: leftPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function (event, ui) {
                // FIXME:
                let data = $confirmOrderGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;

                for (let i = 0; i < totalRecords; i++) {
                    // total += data[i].colNm;
                }
                console.log(totalRecords);

                $('#CONFIRM_ORDER_TOTAL_RECORDS').html(totalRecords);
                $('#CONFIRM_ORDER_TOTAL_RECORDS').html(totalOrderQuantity);
            },
        };
        let $processConfirmGrid;
        const rightTopGridId = 'PROCESS_CONFIRM_GRID';
        let rightTopPostData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let rightTopColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'COMP_NM', editable: false, colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CEO_NM', editable: false, colModel: []},
            {
                title: 'Part', dataType: 'string', dataIndx: 'COMP_ADDRESS', colModel: [], render: function (ui) {
                    // if(ui.data)
                    return "<span class=\"glyphicon glyphicon-plus-sign\" aria-hidden=\"true\"></span>"
                }
            },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '요망<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주<br>요', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '형<br>태', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '규<br>격', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '후처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '발생일시', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '소재주문', dataType: 'string', dataIndx: 'COMP_TYPE', colModel: []},
            {title: '', dataType: 'string', dataIndx: 'COMP_TYPE', colModel: []}
        ];
        // let rightTopToolbar = {
        //     // cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             cls: 'title-hidden', type: 'textbox', label: '가공확정 List',
        //             style: 'font-size: 1.3rem;padding: 4px;font-weight: bold;'
        //         }
        //     ]
        // };
        let rightTopObj = {
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
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: rightTopColModel,
            // toolbar: rightTopToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: rightTopPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
        };
        let $processGrid;
        const rightBotGridId = 'PROCESS_GRID';
        let rightBotPostData = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM');
        let rightBotColModel = [
            {title: '발주업체', dataType: 'string', dataIndx: 'COMP_NM', editable: false, colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'CEO_NM', editable: false, colModel: []},
            {
                title: 'Part', dataType: 'string', dataIndx: 'COMP_ADDRESS', colModel: [], render: function (ui) {
                    // if(ui.data)
                    return "<span class=\"glyphicon glyphicon-plus-sign\" aria-hidden=\"true\"></span>"
                }
            },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '자재<br>사급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '요망<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '가공<br>납기', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '긴<br>급', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주<br>요', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '형<br>태', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '규<br>격', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '소재<br>종류', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '후처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '열<br>처리', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '발생일시', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []}
        ];
        // let rightBotToolbar = {
        //     // cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             cls: 'title-hidden', type: 'textbox', label: '외주가공 List',
        //             style: 'font-size: 1.3rem;padding: 4px;font-weight: bold;'
        //         }
        //     ]
        // };
        let rightBotObj = {
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
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: rightBotColModel,
            // toolbar: rightBotToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: rightBotPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
        };

        $confirmOrderGrid = $('#' + leftGridId).pqGrid(leftObj);
        $processConfirmGrid = $('#' + rightTopGridId).pqGrid(rightTopObj);
        $confirmOrderGrid = $('#' + rightBotGridId).pqGrid(rightBotObj);

    });
</script>
