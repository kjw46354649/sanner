<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<div class="modal fade" id="estimate_master_record_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">견적 상세 정보</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline gridmenu" role="form" id="estimate_master_record_popup_search_form" name="estimate_master_record_popup_search_form">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <section class="bg-light topmenu">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <form class="form-horizontal" data-validate="parsley" action="#">
                                        <section class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>기본 정보</strong>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">발주사</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="발주사">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-8 col-sm-8">
                                                    <label class="col-md-2 col-sm-2 control-label">제목</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="Title">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b line-lg pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">구매 담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="구매 담당자">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="품수">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">등록일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="등록일시">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b line-lg pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적번호</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="min = 6">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">차수</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="min = 6">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적 담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="min = 6">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b line-lg pull-in"></div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">견적금액 계</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="min = 6">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label"></label>
                                                    <div class="col-md-8 col-sm-8">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-4">
                                                    <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" class="form-control" placeholder="min = 6">
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </form>
                                </div>
                            </div>
                        </section>

                        <!-- grid table -->
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>상세 리스트</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="estimate_master_popup_top_grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>메일 내용</strong>
                                        </header>
                                        <div class="row">
                                            <div class="gridWrap">
                                                <textarea class="col-md-12 col-sm-12">
                                                    Text Test
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>메인 수신처</strong>
                                        </header>
                                        <div class="gridWrap">
                                            <div id="estimate_master_popup_bot_grid" class="jqx-refresh"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>첨부파일</strong>
                                        </header>
                                        <div class="gridWrap">
                                            <input type="file">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
</div>
</div>

<div class="page-context">
    <div class="row m-b-md">
        <div class="col-sm-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    업체 정보 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="estimate_master_search_form" name="estimate_master_search_form" role="form">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_COMP_CLASS">사업자구분</label>
                                <select id="SEL_COMP_CLASS" name="SEL_COMP_CLASS" data-required="true" class="form-control parsley-validated">
                                    <option value="">Select</option>
                                    <c:forEach var="code" items="${HIGHCD.H_1001}">
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
        <div class="row">
            <a href="#estimate_master_record_popup" class="" id="" data-target="" data-toggle="modal" data-refform="estimate_master_record_popup">
                <input type="button" value="POP">
            </a>
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

        let estimateMaterPopTopGrid = $("#estimate_master_popup_top_grid");
        let estimateMaterPopBotGrid = $("#estimate_master_popup_bot_grid");

        let basicHeaderStyle = { 'text-align':'center','vertical-align':'middle', 'padding-top':'28px'};

        let estimateMasterTopColModel= [
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

        let estimateMasterBotColModel= [
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM', styleHead: basicHeaderStyle } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', styleHead: basicHeaderStyle } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: basicHeaderStyle } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM', styleHead: basicHeaderStyle } ,
            {title: '규격', align: "center", colModel: [
                {title: '타입', dataType: 'string', dataIndx: 'SIZE_TYPE'},
                {title: '가로', dataType: 'string', dataIndx: 'SIZE_W'},
                {title: '세로', dataType: 'string', dataIndx: 'SIZE_H'},
                {title: '두꼐', dataType: 'string', dataIndx: 'SIZE_T'},
                {title: '지름', dataType: 'string', dataIndx: 'SIZE_D'},
                {title: '길이', dataType: 'string', dataIndx: 'SIZE_L'},
            ]},
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY', styleHead: basicHeaderStyle},
            {title: '작업구분', dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: basicHeaderStyle},
            {title: '소재형태', dataType: 'string', dataIndx: 'MATERIAL_TYPE', styleHead: basicHeaderStyle},
            {title: '소재상세', dataType: 'string', dataIndx: 'MATERIAL_DETAIL', styleHead: basicHeaderStyle},
            {title: '표면처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', styleHead: basicHeaderStyle},
            {title: '사급', dataType: 'string', dataIndx: 'COMP_SUPPLY_YN', styleHead: basicHeaderStyle},
            {title: '열처리', dataType: 'string', dataIndx: 'HEAT_TREAT_YN', styleHead: basicHeaderStyle},
            {title: '항목별 견적정보', align: "center", colModel: [
                {title: '소재비', dataType: 'string', dataIndx: 'MATERIAL_UNIT_COST'},
                {title: 'TM각비', dataType: 'string', dataIndx: 'TOUCH_UNIT_COST'},
                {title: '표면 처리비', dataType: 'string', dataIndx: 'SURFACE_UNIT_COST'},
                {title: '가공비', dataType: 'string', dataIndx: 'PROCESS_UNIT_COST'},
                {title: '기타추가', dataType: 'string', dataIndx: 'ETC_UNIT_COST'}
            ]},
            {title: '계산견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE', styleHead: basicHeaderStyle},
            {title: '최종견적가', dataType: 'string', dataIndx: '', styleHead: basicHeaderStyle},
            {title: '금액 계', dataType: 'string', dataIndx: '', styleHead: basicHeaderStyle},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', styleHead: basicHeaderStyle},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ', styleHead: basicHeaderStyle},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', styleHead: basicHeaderStyle}
        ];

        let estimateMaterPopTopColModel= [
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY' },
            {title: '견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE' },
            {title: '최종단가', dataType: 'string', dataIndx: '' },
            {title: '최종금액 계', dataType: 'string', dataIndx: '' },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE' },
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ' },
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ' }
        ];

        let estimateMaterPopBotColModel= [
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '수량', dataType: 'string', dataIndx: 'ITEM_QTY' },
            {title: '견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE' },
            {title: '최종단가', dataType: 'string', dataIndx: '' },
            {title: '최종금액 계', dataType: 'string', dataIndx: '' },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE' },
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ' },
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ' }
        ];

        let estimateMasterTopToolbar = {
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
        let estimateMasterBotToolbar = {
            items: []
        };

        let estimateMaterPopTopToolbar = {
            items: []
        };

        let estimateMaterPopBotToolbar = {
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
            colModel: estimateMasterTopColModel,
            numberCell: {width: 30, title: "No", show: true },
            //trackModel: {on: true},
            //resizable: true,
            complete: function(event, ui) {
                estimateMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            rowSelect: function( event, ui ) {
                //if(ui.addList.length > 0 ) {
                    let EST_SEQ = ui.addList[0].rowData.EST_SEQ;
                    let EST_VER = ui.addList[0].rowData.EST_VER;
                    click_seq=EST_SEQ;
                    selectEstimateBotList(EST_SEQ, EST_VER);
                //}
            },
            toolbar: estimateMasterTopToolbar
        });

        selectEstimateBotList('', '');

        function selectEstimateBotList(EST_SEQ, EST_VER) {
            estimateMasterBotGrid.pqGrid({
                width: "100%",
                height: 200,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: "remote",
                    dataType: "json",
                    method: "POST",
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_NUM': EST_SEQ, 'EST_VER': EST_VER },
                    recIndx: 'EST_NUM',
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                colModel: estimateMasterBotColModel,
                numberCell: {width: 30, title: "No", show: true },
                //trackModel: {on: true},
                //resizable: true,
                toolbar: estimateMasterBotToolbar
            });

            estimateMasterBotGrid.pqGrid("refreshDataAndView");
        };


        $('#estimate_master_record_popup').on('show.bs.modal',function(evt) {
            alert("OPEN");
            estimateMaterPopTopGrid.pqGrid({
                width: "100%",
                height: 200,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: "remote",
                    dataType: "json",
                    method: "POST",
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateMasterList' },
                    recIndx: 'EST_NUM',
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                selectionModel: { type: 'row', mode: 'single'} ,
                swipeModel: {on: false},
                colModel: estimateMaterPopTopColModel,
                numberCell: {width: 30, title: "No", show: true },
                //trackModel: {on: true},
                //resizable: true,
                toolbar: estimateMaterPopTopToolbar
            });

            estimateMaterPopBotGrid.pqGrid({
                width: "100%",
                //height: 350,
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
                colModel: estimateMaterPopBotColModel,
                numberCell: {width: 30, title: "No", show: true },
                //trackModel: {on: true},
                //resizable: true,
                toolbar: estimateMaterPopBotToolbar
            });
        });


        $("#SEL_COMP_CLASS").on("change", function(){
            fnGetCommCodeBasicSelectBox( $("#SEL_COMP_TYPE"), '', $(this).val(), 'A');
        });

    });


</script>