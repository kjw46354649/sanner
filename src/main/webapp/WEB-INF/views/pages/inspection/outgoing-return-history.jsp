<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="outgoing_history_form" name="outgoing_history_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectOutgoingHistoryList">
            <div class="none_gubunWrap row2_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주업체</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주업체">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ORDER_NUM">발주번호</label>
                            <input type="text" class="wd_200" name="SEL_ORDER_NUM" id="SEL_ORDER_NUM" title="발주번호">
                        </span>
                        <span class="gubun"></span>

                    </li>
                    <li>
                        <span class="slt_wrap mg-right10">
                            <label class="label_100" for="SEL_OUTGOING_DATE_TYPE">구분</label>
                            <select class="wd_200" name="SEL_OUTGOING_DATE_TYPE" id="SEL_OUTGOING_DATE_TYPE">
                               <option value="1">등록일시</option>
                            </select>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_1" value="0" ><label for="SEL_OUTGOING_TERM_1">오늘</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_2" value="3"><label for="SEL_OUTGOING_TERM_2">~3일</label>
                        </span>
                        <span class="radio_box">
                            <input reqcd="R" type="radio" name="SEL_OUTGOING_TERM" id="SEL_OUTGOING_TERM_3" value="7"><label for="SEL_OUTGOING_TERM_3">~1주일</label>
                        </span>
                        <div class="calendar_wrap">
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_ST_DT" id="SEL_ST_DT" placeholder="" value="" title="시작날짜" readonly>
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                            <span class="nbsp">~</span>
                            <span class="calendar_span">
                                <input class="datepicker-input" type="text" name="SEL_END_DT" id="SEL_END_DT" placeholder="" value="" title="종료날짜" readonly>
<%--                                <button type="button">달력선택</button>--%>
                            </span>
                        </div>
                        <span class="gubun"></span>
                        <button type="button" class="right_float defaultBtn radius blue" id="outgoing_history_search_btn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <div class="rightSpan">
                    <button type="button" class="defaultBtn" id="outgoing_history_detail_btn">상세정보 조회</button>
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="outgoing_history_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="outgoing_history_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<style>

</style>
<script>

    $(function () {
        'use strict';

        $(".datepicker-input").each(function(){ $(this).datepicker();});
        $(".datepicker-input").each(function(){ $(this).datepicker('setDate', 'today');});
        $("#outgoing_history_form").find("#SEL_OUTGOING_TERM_1").trigger("click");

        let outgoingHistoryGridId01 = $("#outgoing_history_grid");
        let outgoingHistoryColModel01;

        /**  리스트 그리드 선언 시작 **/
        $("#outgoing_history_form").find("#queryId").val("inspection.selectOutgoingHistoryList");
        outgoingHistoryColModel01 = [
            {title: 'KEY_SEQ', dataType: 'string', dataIndx: 'KEY_SEQ', hidden:true},
            {title: '구분', dataType: 'string', dataIndx: 'OUT_RETURN_TYPE_NM', minWidth: 60, width: 60, editable: false,
                render: function (ui) {
                   let cellData = ui.cellData;
                   //let status = ui.rowData.STATUS_1;
                   if (cellData == "출고") {
                   }else{
                       outgoingHistoryGridId01.pqGrid('addClass', {
                           rowIndx: ui.rowIndx,
                           dataIndx: ui.dataIndx,
                           cls: 'gridBg-Red'
                       });
                       //return (index < 0) ? cellData : EQUIP_LIST[index].text;
                   }
                    //return cellData;
               }
            },
            {title: '외주가공', dataType: 'string', dataIndx: 'OUTSIDE_COMP_NM', minWidth: 80, width: 80, editable: false},
            {title: '발주번호', dataType: 'string', dataIndx: 'ORDER_NUM', minWidth: 120, width: 120, editable: false},
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', minWidth: 200, width: 200, editable: false},
            {title: '도면번호', dataType: 'integer', dataIndx: 'DRAWING_NUM', minWidth: 120, width: 120, editable: true},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 120, width: 120, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 120, width: 120, editable: false},
            {title: '주문수량', dataType: 'integer', dataIndx: 'ORDER_QTY', minWidth: 40, width: 40, editable: false, format: '#,###'},
            {title: '출고', dataType: 'string', dataIndx: 'OUT_QTY', minWidth: 60, width: 60, editable: false},
            {
                title: '포장단위', datatype: 'string', align: 'center', colModel: [
                    {title: '포장수', datatype: 'string', dataIndx: 'PACKING_CNT', minWidth: 60, width: 60, editable: false, format: '#,###'},
                    {title: '출고', datatype: 'string', dataIndx: 'OUT_PACKING_INFO', minWidth: 60, width: 60, editable: false}
                ]
            },
            {title: '반품', dataType: 'string', dataIndx: 'RETURN_QTY', minWidth: 100, width: 100, editable: false},
            {title: '등록일시', dataType: 'string', dataIndx: 'INSERT_DT', minWidth: 100, width: 100, editable: false},
            {title: '', align: 'center', dataType: 'string', dataIndx: 'RETURN_SETTLEMENT_DT', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['RETURN_QTY'] > 0) return "<button type=\"button\" class=\"miniBtn black\">취소</button>";
                    return '';
                }
            },
        ];
        outgoingHistoryGridId01.pqGrid({
            width: "100%", height: 700,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ORDER_SEQ',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('outgoing_history_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: outgoingHistoryColModel01,
            complete: function () {
                let data = outgoingHistoryGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#outgoing_history_grid_records').html(totalRecords);
            },
            cellClick: function (event, ui)
            {
                let rowIndx = ui.rowIndx, $grid = this;
                if (ui.rowData['RETURN_QTY'] != undefined && ui.rowData['RETURN_QTY'] > 0)
                {
                    if (ui.dataIndx == 'RETURN_SETTLEMENT_DT') {
                        let data = {
                            'queryId': 'inspection.updateOutgoingReturnHistory',
                            'KEY_SEQ': ui.rowData['KEY_SEQ']
                        };
                        let parameters = {'url': '/json-create', 'data': data };
                        fnPostAjax(function (data, callFunctionParam) {
                            alert("취소가 완료되었습니다.");
                            $("#outgoing_history_form").find("#queryId").val("inspection.selectOutgoingHistoryList");
                            $("#outgoing_history_search_btn").trigger("click");
                        }, parameters, '');

                    }
                }
            }
        });
        /**  리스트 그리드 선언 끝 **/

         $("#outgoing_history_search_btn").on('click', function () {
            outgoingHistoryGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#outgoing_history_form');
            } );
            outgoingHistoryGridId01.pqGrid("refreshDataAndView");
        });

        $('[name=SEL_OUTGOING_TERM]').change(function () {
            let value = $(this).val(), today = new Date(), newDate = new Date();

            newDate.setDate(newDate.getDate() - value);
            $('#SEL_ST_DT').val(newDate.yyyymmdd());
            $('#SEL_END_DT').val(today.yyyymmdd());
            // outgoingChangeDate(newDate, today);

        });




        fnCommCodeDatasourceSelectBoxCreate($('#outgoing_history_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        $("#outgoing_history_detail_btn").on('click', function () {
              g_item_detail_pop_view('','');
        });


    });
</script>