<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="page-context">
    <div class="row m-b-md">
        <div class="col-sm-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    업체 정보 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="company-master-search-form" name="company-master-search-form" role="form">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_COMP_CLASS">사업자구분</label>
                                <select id="SEL_COMP_CLASS" name="SEL_COMP_CLASS" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HIGHCD.H_1007}">
                                        <option value="${code.CODE_CD}" >${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_COMP_TYPE">발주사</label>
                                <select id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HIGHCD.H_1042}">
                                        <option value="${code.CODE_CD}" >${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="MODULE_NM">견적번호</label>
                                <input type="password" class="form-control" id="MODULE_NM" placeholder="">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="TITLE">제목</label>
                                <input type="email" class="form-control" id="TITLE" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="DRAWING_NUM">도면번호</label>
                                <input type="password" class="form-control" id="DRAWING_NUM" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="ITEM_NM">품명</label>
                                <input type="password" class="form-control" id="ITEM_NM" placeholder="">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_STAFF_NM">Option</label>
                                <input type="email" class="form-control" id="SEL_STAFF_NM" placeholder="">
                            </div>
                            <div class="form-group col-md-4">
                                <select id="SEARCH_DATE" name="SEARCH_DATE" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HIGHCD.H_10002}">
                                        <option value="${code.CODE_CD}" >${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                                <input type="password" class="form-control" id="SEL_CEO_NM" placeholder="">
                            </div>
                            <div class="form-group col-md-4 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default">SEARCH</div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="estimate_master_top_grid" class="jqx-refresh"></div>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="estimate_master_bot_grid" class="jqx-refresh"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        'use strict';
        let click_seq;
        let estimateMasterTopGrid = $("#estimate_master_top_grid");
        let estimateMasterBotGrid = $("#estimate_master_bot_grid");

        let topColModel= [
            //{title: 'No.', dataType: 'string', dataIndx: 'EST_SEQ'},
            {title: 'Status', dataType: 'string', dataIndx: 'EST_STATUS'},
            {title: '발주사', dataType: 'string', dataIndx: 'ORDER_COMP_CD'},
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ'},
            {title: '사업자', dataType: 'string', dataIndx: 'COMP_CD'},
            {title: '견적번호', dataType: 'string', dataIndx: 'EST_NUM'},
            {title: '차수', dataType: 'string', dataIndx: 'EST_VER'},
            {title: '', dataType: 'string', dataIndx: ''},
            {title: '제목', dataType: 'string', dataIndx: 'EST_TITLE'},
            {title: '품수', dataType: 'string', dataIndx: 'DTL_CNT'},
            {title: '금액 계', dataType: 'string', dataIndx: 'DTL_AMOUNT'},
            {title: '등록일시', dataType: 'string', dataIndx: 'INSERT_DT'},
            {title: '견적담당', dataType: 'string', dataIndx: 'EST_USER_ID'},
            {title: '발송일시', dataType: 'string', dataIndx: 'SEND_DT'},
            {title: '', dataType: 'string', dataIndx: ''},
            {title: '주문접수', dataType: 'string', dataIndx: ''}
        ];

        let botColModel= [
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', styleHead: { 'text-align':'center','vertical-align':'middle'} } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', styleHead: { 'text-align':'center','vertical-align':'middle'} } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: { 'text-align':'center','vertical-align':'middle'} } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', styleHead: { 'text-align':'center','vertical-align':'middle'} } ,
            {title: '규격', align: "center", colModel: [
                {title: '타입', dataType: 'string', dataIndx: 'SIZE_TYPE'},
                {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                {title: '두꼐', dataType: 'string', dataIndx: 'SIZE_T'},
                {title: '지름', dataType: 'string', dataIndx: 'SIZE_D'},
                {title: '길이', dataType: 'string', dataIndx: 'SIZE_L'},
            ]},
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY'},
            {title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE'},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_TYPE'},
            {title: '소재상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL'},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT'},
            {title: '사급', dataType: 'string', dataIndx: 'COMP_SUPPLY_YN'},
            {title: '열처리', dataType: 'string', dataIndx: 'HEAT_TREAT_YN'},
            {title: '항목별 견적정보', align: "center", colModel: [
                {title: '소재비', dataType: 'string', dataIndx: 'MATERIAL_UNIT_COST'},
                {title: 'TM각비', dataType: 'string', dataIndx: 'TOUCH_UNIT_COST'},
                {title: '표면 처리비', dataType: 'string', dataIndx: 'SURFACE_UNIT_COST'},
                {title: '가공비', dataType: 'string', dataIndx: 'PROCESS_UNIT_COST'},
                {title: '기타추가', dataType: 'string', dataIndx: 'ETC_UNIT_COST'}
            ]},
            {title: '계산견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE'},
            {title: '최종견적가', dataType: 'string', dataIndx: ''},
            {title: '금액 계', dataType: 'string', dataIndx: ''},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'}
        ];

        let topToolbar = {
            items: [
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            estimateMasterTopGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let grid = estimateMasterTopGrid.pqGrid('getInstance').grid;
                            //추가 또는 수정된 값이 있으면 true
                            console.log(grid);
                            if (grid.isDirty()) {
                                let changes = grid.getChanges({format: 'byVal'});
                                let QUERY_ID_ARRAY = {
                                    'insertQueryId': ['insertTopMenuCode','insertTopMenuKr','insertTopMenuEn'],
                                    'updateQueryId': ['updateTopMenuCode','updateTopMenuKr','updateTopMenuEn']
                                };

                                changes.queryIdList = QUERY_ID_ARRAY;
                                console.log(changes);
                                $.ajax({
                                    type: 'POST',
                                    url: '/paramQueryModifyGrid',
                                    async: true,
                                    dataType: 'json',
                                    data: {'data': JSON.stringify(changes)},
                                    success: function (result) {
                                        estimateMasterTopGrid.pqGrid("refreshDataAndView");
                                    },
                                    error: function (e) {
                                        console.error(e);
                                    }
                                });

                            }
                        }
                    }
                }
            ]
        };
        let botToolbar = {
            items: []
        };

        estimateMasterTopGrid.pqGrid({
            width: "100%",
            height: 350,
            scrollModel: {autoFit: true},
            dataModel: {
                location: "remote",
                dataType: "json",
                method: "POST",
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectEstimateMasterList'},
                recIndx: 'EST_NUM',
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            colModel: topColModel,
            numberCell: {width: 30, title: "No", show: true },
            trackModel: {on: true},
            resizable: true,
            complete: function(event, ui) {
                estimateMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                    let EST_NUM = ui.addList[0].rowData.EST_NUM;
                    let EST_VER = ui.addList[0].rowData.EST_VER;
                    click_seq=EST_NUM;
                    selectEstimateBotList(EST_NUM, EST_VER);
                //}
            },
            toolbar: topToolbar
        });

        selectEstimateBotList('', '');

        function selectEstimateBotList(EST_NUM, EST_VER) {
            estimateMasterBotGrid.pqGrid({
                width: "100%",
                //height: 350,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: "remote",
                    dataType: "json",
                    method: "POST",
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_NUM': EST_NUM, 'EST_VER': EST_VER },
                    recIndx: 'EST_NUM',
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                colModel: botColModel,
                numberCell: {width: 30, title: "No", show: true },
                trackModel: {on: true},
                resizable: true,
                toolbar: botToolbar
            });

            estimateMasterBotGrid.pqGrid("refreshDataAndView");
        };
    });


</script>