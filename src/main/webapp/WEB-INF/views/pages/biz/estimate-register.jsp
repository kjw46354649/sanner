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
                    <div class="btnSaveCloseBox">
                        <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_save">Save</div>
                        <div type="button" class="btn btn-success btn-sm btn-default" id="btn_estimate_register_submit">Submit</div>
                    </div>
                </header>
                <div class="panel-body">
                    <form class="form-inline" role="form" id="estimate_register_info_form" name="estimate_register_info_form">
                        <div class="panel-body line_tit portlet-body form bg-light">
                            <section class="bg-light">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <form class="form-horizontal" data-validate="parsley" action="#">
                                            <section class="panel panel-default">
                                                <header class="panel-heading">
                                                    <strong>기본 정보</strong>
                                                </header>
                                                <div class="panel-body">
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label" for="SEL_COMP_TYPE">발주사</label>
                                                        <select id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" data-required="true" class="form-control parsley-validated">
                                                            <option value="">Select</option>
                                                            <c:forEach var="code" items="${HighCode.H_1042}">
                                                                <option value="${code.CODE_CD}" >${code.CODE_NM_KR}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-8 col-sm-8">
                                                        <label class="col-md-2 col-sm-2 control-label">제목</label>
                                                        <div class="col-md-10 col-sm-10">
                                                            <input type="text" data-notblank="true" class="form-control" placeholder="Title">
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">구매 담당자</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="구매 담당자">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">사업자구분</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="사업자구분">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">견적 담당자</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="견적 담당자">
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">견적번호 (차수)</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">품수</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">경적금액 계</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="line line-dashed b-b pull-in"></div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">업데이트 일시</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-4 col-sm-4">
                                                        <label class="col-md-4 col-sm-4 control-label">회신일시</label>
                                                        <div class="col-md-8 col-sm-8">
                                                            <input type="text" class="form-control" placeholder="">
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
                                                        <div id="estimate_register_top_grid" class="jqx-refresh"></div>
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
                                                <div id="estimate_register_bot_grid" class="jqx-refresh"></div>
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
            </section>
        </div>
</div>

<script type="text/javascript">
    $(function () {
        'use strict';
        let estimateRegisterSelectedRowIndex;

        let estimateRegisterTopGrid = $("#estimate_register_top_grid");
        let estimateRegisterBotGrid = $("#estimate_register_bot_grid");

        let estimateRegisterTopColModel= [
            {title: '모듈명', dataType: 'string', dataIndx: 'MODULE_NM' } ,
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM' } ,
            {title: '', dataType: 'string', dataIndx: 'DRAWING_YN' } ,
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM' } ,
            {title: 'Part', dataType: 'string', dataIndx: 'PART_NUM' } ,
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
            {title: '상세 가공요건', align: "center", colModel:[
                {title:'선반', dataType: 'string', dataIndx: '1'},
                {title:'가공면', dataType: 'string', dataIndx: '2'},
                {title:'클램핑', dataType: 'string', dataIndx: '3'},
                {title:'포켓', dataType: 'string', dataIndx: '4'},
                {title:'공차', dataType: 'string', dataIndx: '5'},
                {title:'드릴', dataType: 'string', dataIndx: '6'},
                {title:'난도', dataType: 'string', dataIndx: '7'}
            ]},
            {title: '예상소재 Size', align: "center", colModel:[
                {title:'가로', dataType: 'string', dataIndx: '8'},
                {title:'세로', dataType: 'string', dataIndx: '9'},
                {title:'높이', dataType: 'string', dataIndx: '10'},
                {title:'중량(KG)', dataType: 'string', dataIndx: '11'},
                {title:'부피(cm3)', dataType: 'string', dataIndx: '12'}
            ], hidden: true},
            {title: '항목별 견적정보', align: "center", colModel: [
                {title: '소재비', dataType: 'string', dataIndx: 'MATERIAL_UNIT_COST'},
                {title: 'TM각비', dataType: 'string', dataIndx: 'TOUCH_UNIT_COST'},
                {title: '표면 처리비', dataType: 'string', dataIndx: 'SURFACE_UNIT_COST'},
                {title: '가공비', dataType: 'string', dataIndx: 'PROCESS_UNIT_COST'},
                {title: '기타추가', dataType: 'string', dataIndx: 'ETC_UNIT_COST'}
            ], hidden: true},
            {title: '계산견적단가', dataType: 'string', dataIndx: 'FINAL_EST_UNIT_PRICE'},
            {title: '최종견적가', dataType: 'string', dataIndx: '13'},
            {title: '금액 계', dataType: 'string', dataIndx: '14'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
            {title: 'DWG', dataType: 'string', dataIndx: 'DWG_GFILE_SEQ'},
            {title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ'}
        ];

        let estimateRegisterBotColModel= [
            {title: '성함', dataType: 'string', dataIndx: 'ITEM_NM' },
            {title: '메일주소', dataType: 'string', dataIndx: 'DRAWING_NUM' },
            {title: '전화번호', dataType: 'string', dataIndx: 'ITEM_QTY' }
        ];

        let estimateRegisterTopToolbar = {
            items: [
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let USER_MASTER_QUERY_ID = 'deleteUser';

                            fnDeletePQGrid(estimateRegisterTopGrid, estimateRegisterSelectedRowIndex, USER_MASTER_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            estimateRegisterTopGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'checkbox', label: '상세견적요건', style: 'float: right;', listener: {
                        'change': function (evt, ui) {
                            let colM = estimateRegisterTopGrid.pqGrid("option", "colModel");
                            let listM = [14,15];
                            let hiddenYn = evt.target.checked == true ? false : true;
                            for(let tmpI = 0; tmpI < listM.length; tmpI++) {
                                for(let colCnt = 0; colCnt < colM[listM[tmpI]].colModel.length; colCnt++){
                                    colM[listM[tmpI]].colModel[colCnt].hidden = hiddenYn;
                                }
                                colM[listM[tmpI]].hidden = hiddenYn;
                            }
                            estimateRegisterTopGrid.pqGrid("option", "colModel", colM);
                            estimateRegisterTopGrid.pqGrid( "refresh" );
                        }
                    }
                }

            ]
        };
        let estimateRegisterBotToolbar = {
            items: [{ type: 'checkbox', label: '자동메일 발송', style: 'float: right;' }]
        };

        estimateRegisterTopGrid.pqGrid({
            width: "100%", height: 200,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectEstimateMasterList'},
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true },
            selectionModel: { type: 'row', mode: 'single'} ,
            //swipeModel: {on: false},
            collapsible: false,
            resizable: false,
            //trackModel: {on: true},
            //resizable: true,
            colModel: estimateRegisterTopColModel,
            toolbar: estimateRegisterTopToolbar,
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    estimateRegisterSelectedRowIndex = [];
                    let estimateRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let estimateRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (estimateRegisterGridFirstRow === estimateRegisterGridLastRow) {
                        estimateRegisterSelectedRowIndex[0] = estimateRegisterGridFirstRow;
                    } else {
                        for (let i = estimateRegisterGridFirstRow; i <= estimateRegisterGridLastRow; i++) {
                            estimateRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        });

        selectEstimateBotList('', '');

        function selectEstimateBotList(EST_SEQ, EST_VER) {
            estimateRegisterBotGrid.pqGrid({
                width: "100%", height: 200,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'EST_SEQ',
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectEstimateDetailList', 'EST_SEQ': EST_SEQ, 'EST_VER': EST_VER },
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                scrollModel: {autoFit: true},
                numberCell: {width: 30, title: "No", show: true },
                selectionModel: { type: 'row', mode: 'single'} ,
                collapsible: false,
                swipeModel: {on: false},
                resizable: false,
                //trackModel: {on: true},
                //resizable: true,
                colModel: estimateRegisterBotColModel,
                toolbar: estimateRegisterBotToolbar
            });

            estimateRegisterBotGrid.pqGrid("refreshDataAndView");
        };

        $("#SEL_COMP_CLASS").on("change", function(){
            //fnGetCommCodeBasicSelectBox( $("#SEL_COMP_TYPE"), '', $(this).val(), 'A');
        });

        $("#btn_estimate_register_save").on("click", function(){
            console.log($("#estimate_register_info_form").serialize());
        });

    });


</script>