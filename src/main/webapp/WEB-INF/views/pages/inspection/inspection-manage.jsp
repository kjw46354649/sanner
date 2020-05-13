<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="inspection_manage_form" name="inspection_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionList">
            <div class="gubunWrap row3_topWrap" >
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_CD">사업자</label>
                            <select class="wd_200" name="SEL_COMP_CD" id="SEL_COMP_CD" title="사업자">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ORDER_COMP_CD">발주사</label>
                            <select class="wd_200" name="SEL_ORDER_COMP_CD" id="SEL_ORDER_COMP_CD" title="발주사">
                                <option value="" selected="selected">ALL</option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_DRAWING_NUM">도면번호</label>
                            <input type="text" class="wd_200" name="SEL_DRAWING_NUM" id="SEL_DRAWING_NUM" title="도면번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_ITEM_NM">품명</label>
                            <input type="text" class="wd_200" name="SEL_ITEM_NM" id="SEL_ITEM_NM" title="품명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap right_float">
                            <button type="button" class="defaultBtn radius blue" id="inspection_manage_search_btn">검색</button>
                        </span>
                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CONTROL_NUM">관리번호</label>
                            <input type="text" class="wd_200" name="SEL_CONTROL_NUM" id="SEL_CONTROL_NUM" title="관리번호">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_MATERIAL_DETAIL">소재 Type</label>
                             <select id="SEL_MATERIAL_DETAIL" name="SEL_MATERIAL_DETAIL" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1027}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label for="SEL_WAREHOUSE_CD" class="label_100">창고</label>
                            <select id="SEL_WAREHOUSE_CD" name="SEL_WAREHOUSE_CD" title="창고" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap inspectionBWrap">
        <div class="hWrap">
            <div class="d-inline">
                <span class="barCode"><img src="/resource/asset/images/common/img_barcode.png" width="20px" height="20px" alt="바코드"></span>
                <span class="barCodeTxt">&nbsp;<input type="text" class="wd_270_barcode" name="INSPECTION_BARCODE_NUM" id="INSPECTION_BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요"></span>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn" id="inspection_manage_detail_btn">상세정보 조회</button>
                    &nbsp;
                    <input type="checkbox" id="chkInspectionTimer" />
                    <select class="wd_50" name="selectInspectionTimer" id="selectInspectionTimer" title="">
                        <option value="10">10초</option>
                        <option value="30">30초</option>
                        <option value="60">60초</option>
                    </select>&nbsp;마다 재조회
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="inspection_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="inspection_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 품질실적 layer popup : S -->
<div class="popup_container inspection" id="inspection_manage_pop" style="display: none;">
    <form class="form-inline" id="inspection_manage_pop_form" name="inspection_manage_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionPopInfoBasic">
    <div class="layerPopup">
        <h3>품질 실적 등록</h3>
        <%--<button type="button" class="pop_close">닫기</button>--%>
        <div class="qualityWrap">
            <div class="h_area">
					<span class="buttonWrap">
						<button type="button" class="onoff left on">Sampling</button>
						<button type="button" class="onoff right">전수검사</button>
					</span>
                <ul class="listWrap">
                    <li class="tit blue">Seq.</li>
                    <li>04</li>
                    <li class="tit bagic">작성자</li>
                    <li class="slt">
                        <select id="writesSltd" name="writeSltd" title="작성자">
                            <option value="" selected="selected">홍길동</option>
                            <option value="1">-ALL-</option>
                            <option value="2">-ALL-</option>
                        </select>
                    </li>
                </ul>
            </div>
            <div class="m_area">
                <div class="numWrap">
                    <span><b>&#9900; 수량 :</b><i>12</i></span>
                    <span><b>&#9900; 불량수량 :</b><i>0</i>
                        <button type="button" id="btnPlus" class="btn_plus" style="display: none">더하기</button>
                        <button type="button" class="btn_minus" style="display: none">빼기</button>
                    </span>
                </div>
                <div class="buttonWrap">
                    <button type="button" class="gradeBtn green"><span>A</span></button>
                    <button type="button" class="gradeBtn blue"><span>B</span></button>
                    <button type="button" class="gradeBtn yellow"><span>C</span></button>
                    <button type="button" class="gradeBtn red"><span>D</span></button>
                </div>
            </div>
            <div class="t_area">
                <div class="t_h">
                    <span class="list_t">검사코드</span>
                    <span>
							<select id="codeSltd" name="codeSltd" title="검사코드">
								<option value="" selected="selected">01 평탄도 미흡</option>
								<option value="1">-ALL-</option>
								<option value="2">-ALL-</option>
							</select>
						</span>
                    <span class="list_t">상세내용</span>
                    <span class="wide">약간의 오버플로우 발생</span>
                </div>
                <table class="colStyle">
                    <%--<caption></caption>--%>
                    <colgroup>
                        <col width="24%">
                        <col width="24%">
                        <col width="*">
                        <col width="24%">
                    </colgroup>
                    <tr>
                        <th scope="col">발생공정</th>
                        <th scope="col">원인</th>
                        <th scope="col">조치방안 및 비고</th>
                        <th scope="col">조치</th>

                    </tr>
                    <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                </table>
            </div>
            <h4>기본정보</h4>
            <div class="list1">
                <table class="rowStyle">
                 <%--   <caption></caption>--%>
                    <colgroup>
                        <col width="10%">
                        <col width="*">
                        <col width="10%">
                        <col width="*%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <tr>
                        <th>관리번호</th>
                        <td class="red">신진철강</td>
                        <th>도면번호</th>
                        <td class="red">하나알루</td>
                        <th>납기</th>
                        <td>10/21 (긴급)</td>
                    </tr>
                    <tr>
                        <th>품명</th>
                        <td>신진철강</td>
                        <th>소재종류</th>
                        <td>하나알루</td>
                        <th>수량(원칭,대칭)</th>
                        <td>12</td>
                    </tr>
                    <tr>
                        <th>규격</th>
                        <td>신진철강</td>
                        <th>후처리</th>
                        <td>하나알루</td>
                        <th>가공형태</th>
                        <td>수정가공</td>
                    </tr>
                    <tr>
                        <th>진행상태</th>
                        <td>검사대기</td>
                        <th>발주업체</th>
                        <td>삼성전자</td>
                        <th>외주업체</th>
                        <td>SJ테크</td>
                    </tr>
                </table>
            </div>
            <h4>공유사항</h4>
            <div class="list4">
                <div id="inspection_manage_grid_pop_01"></div>
            </div>
            <h4>공유사항</h4>
            <div class="list3">
                <div id="inspection_manage_grid_pop_02"></div>
            </div>
        </div>
        <div class="btnWrap">
            <button type="button" class="submit">submit</button>
            <button type="button" id="popClose" class="cancel">cancel</button>
        </div>
    </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->

<!-- 품질실적 layer popup : S -->
<div class="popup_container inspection" id="g_item_detail_pop" style="display: ;">
    <form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form">
        <input type="hidden" name="queryId" id="queryId" value="inspection.selectInspectionPopInfoBasic">
        <div class="layerPopup">
            <h3>제품상세정보</h3>
            <%--<button type="button" class="pop_close">닫기</button>--%>
            <div class="qualityWrap">
                <h4>기본정보</h4>
                <div class="list1">
                    <table class="rowStyle">
                        <%--   <caption></caption>--%>
                        <colgroup>
                            <col width="10%">
                            <col width="*">
                            <col width="10%">
                            <col width="*%">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
                        <tr>
                            <th>관리번호</th>
                            <td class="red">신진철강</td>
                            <th>도면번호</th>
                            <td class="red">하나알루</td>
                            <th>납기</th>
                            <td>10/21 (긴급)</td>
                        </tr>
                        <tr>
                            <th>품명</th>
                            <td>신진철강</td>
                            <th>소재종류</th>
                            <td>하나알루</td>
                            <th>수량(원칭,대칭)</th>
                            <td>12</td>
                        </tr>
                        <tr>
                            <th>규격</th>
                            <td>신진철강</td>
                            <th>후처리</th>
                            <td>하나알루</td>
                            <th>가공형태</th>
                            <td>수정가공</td>
                        </tr>
                        <tr>
                            <th>진행상태</th>
                            <td>검사대기</td>
                            <th>발주업체</th>
                            <td>삼성전자</td>
                            <th>외주업체</th>
                            <td>SJ테크</td>
                        </tr>
                    </table>
                </div>

                <h4>공유사항</h4>
                <div class="list98">
                    <div class="tableWrap" style="height: 240px; overflow-y: auto;">

                        <ul class="conWrapPop">
                            <div id="g_item_detail_pop_grid_01" class="jqx-refresh"></div>
                        </ul><br/>
                        <ul class="conWrapPop">
                            <div id="g_item_detail_pop_grid_02" class="jqx-refresh"></div>
                        </ul>


                    </div>


                </div>
                <h4>품질사항</h4>
                <div class="list4">
                    <div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>
                </div>
            </div>
            <div class="btnWrap">
                <button type="button" class="submit">submit</button>
                <button type="button" id="popClose" class="cancel">cancel</button>
            </div>
        </div>
    </form>
</div>
<!-- 품질실적 layer popup : E -->




<script>
    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let inspectionManageGridId01 = $("#inspection_manage_grid");
        let inspectionManageColModel01;
        let inspectionManagePostData01;

        let inspectionManageGridIdPop01 = $("#inspection_manage_grid_pop_01");
        let inspectionManageColModelPop01;
        let inspectionManagePostDataPop01;

        let inspectionManageGridIdPop02 = $("#inspection_manage_grid_pop_02");
        let inspectionManageColModelPop02;
        let inspectionManagePostDataPop02;
        

        /**  리스트 그리드 선언 시작 **/
        $("#inspection_manage_form").find("#queryId").val("inspection.selectInspectionList");
        inspectionManagePostData01 = fnFormToJsonArrayData('#inspection_manage_form');
        inspectionManageColModel01 = [
            {title: '납기', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 95, width: 95, editable: false},
            {title: '현재위치', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '외주가공', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '진행상태', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '카드', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[카]";
                    return '';
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 200, width: 200, editable: false},
            {title: 'Part', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 40, width: 40, editable: false},
            {title: '도면번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 200, width: 200, editable: false},
            {title: '눈', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[눈]";
                    return '';
                }
            },
            {title: '소재종류', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '작업형태', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '소재분류', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {title: '수량', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 40, width: 40, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {
                title: '최근 MCT 실적', datatype: 'string', align: 'center', colModel: [
                    {title: '날짜', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '작업자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 100, width: 100, editable: false},
                    {title: 'NC No.', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '비고', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 300, width: 300, editable: false}
                ]
            },
            {title: '주문사항 비고', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 120, width: 120, editable: false},
            {
                title: '최근 품질 실적', datatype: 'string', align: 'center', colModel: [
                    {title: 'seq', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', minWidth: 40, width: 40, editable: false},
                    {title: '담당관', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 100, width: 100, editable: false},
                    {title: '측정방법', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '발주량', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '등급', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '합/불', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '수량', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '반품일시', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '검사코드', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '상세내용 및 비고', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 300, width: 300, editable: false},
                    {title: '발생공정', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '원인', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '조치', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 80, width: 80, editable: false},
                    {title: '조치방안', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: '작성일자', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', minWidth: 120, width: 120, editable: false},
                    {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                        render: function (ui) {
                            let rowIndx = ui.rowIndx, grid = this;
                            if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[결과등록]";
                            return '';
                        }
                    },
                    {title: 'PDF', align: 'center', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ2', width: 40, minWidth: 40, editable: false,
                        render: function (ui) {
                            let rowIndx = ui.rowIndx, grid = this;
                            if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "[실적삭제]";
                            return '';
                        }
                    }
                ]
            }


        ];
        inspectionManageGridId01.pqGrid({
            width: "100%", height: 700,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModel01,
            complete: function () {
                let data = inspectionManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#inspection_manage_grid_records').html(totalRecords);
            },
            rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;
                //if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                    if (ui.dataIndx == 'INSIDE_STOCK_QTY_IN') {//입고
                        fnResetFrom("inspection_manage_pop_form");
                        $("#inspection_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                        $('#inspection_manage_pop').modal('show');
                    }
                    if (ui.dataIndx == 'INSIDE_STOCK_QTY_OUT') {//출고

                        if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
                            alert("출고할 재고수량이 없습니다.");
                        }else{
                            fnResetFrom("inspection_manage_pop_form");
                            $("#inspection_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                            $('#inspection_manage_pop').modal('show');
                        }
                    }
                //}
            }
        });
        /**  리스트 그리드 선언 끝 **/

        /**  팝업 그리드 1 선언 끝 **/
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionList");
        inspectionManagePostDataPop01 = fnFormToJsonArrayData('#inspection_manage_pop_form');
        inspectionManageColModelPop01 = [
            {title: '항목', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', maxWidth: 150, width: 150, editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 95, width: 95, editable: false}
        ];
        inspectionManageGridIdPop01.pqGrid({
            width: "100%", height: 90,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModelPop01
        });
        /**  팝업 그리드 1 선언 끝 **/

        /**  팝업 그리드 2 선언 끝 **/
        $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionList");
        inspectionManagePostDataPop02 = fnFormToJsonArrayData('#inspection_manage_pop_form');
        inspectionManageColModelPop02 = [
            {title: '작성자', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', width: 120, editable: false},
            {title: '측정방법', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '반품일', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '합/불', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '양품', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '불량/반품', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '불량코드', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '상세및비고', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '원인', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '조치', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '조치방안', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false},
            {title: '작성일자', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM',  width: 95, editable: false}
        ];
        inspectionManageGridIdPop02.pqGrid({
            width: "100%", height: 115,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('inspection_manage_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: inspectionManageColModelPop02
        });
        /**  팝업 그리드 2 선언 끝 **/



        $("#inspection_manage_pop").on('hide.bs.modal', function(){
           // fnResetFrom("inspection_manage_pop_form");
           // $("#inspection_manage_form").find("#queryId").val("inspection.selectInsideStockList");
           // $("#inspection_manage_search_btn").trigger("click");
        });
        $("#inspection_manage_pop").on('show.bs.modal', function(){
            //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
        //     let popType = $("#inspection_manage_form").find("#popType").val();
        //     let V_INSIDE_inspection_NUM = $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val();
        //
        //     $("#inspection_manage_pop_form").find("#inside_stock_pop_save_btn").show();
        //     $("#inspection_manage_pop_form").find("#footer_msg").hide();
        //     $("#stock_manage_pop_form").find("#footer_msg").html("");
        //     //$("#stock_manage_pop_form").find("#DRAWING_NUM").attr("readonly", true);
        //$("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", true);

            fnResetFrom("inspection_manage_pop_form");

            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoBasic");
            let parameters = {
                'url': '/json-info',
                'data': $('#inspection_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                if(dataInfo == null ) {
                    fnResetFrom("inspection_manage_pop_form");
                }else{
                    fnJsonDataToForm("inspection_manage_pop_form", dataInfo);
                    // $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                    // $("#stock_manage_pop_form").find("#ORDER_QTY").html(dataInfo.ORDER_QTY);
                    // $("#stock_manage_pop_form").find("#ORIGINAL_ORDER_QTY").val(dataInfo.ORDER_QTY);
                    // $("#stock_manage_pop_form").find("#ORIGINAL_POP_STOCK_QTY_AFTER").val(dataInfo.POP_STOCK_QTY_AFTER);
                    // $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(dataInfo.WAREHOUSE_CD);
                    // $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change();
                    // setTimeout(function() {
                    //     $("#stock_manage_pop_form").find("#LOC_SEQ").val(dataInfo.LOC_SEQ);
                    // }, 1000);

                }
            }, parameters, '');

            //그리드 1
            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoGrid01");
            inspectionManageGridIdPop01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_pop_form');
            } );
            inspectionManageGridIdPop01.pqGrid("refreshDataAndView");


            //그리드 2
            $("#inspection_manage_pop_form").find("#queryId").val("inspection.selectInspectionPopInfoGrid01");
            inspectionManageGridIdPop02.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_pop_form');
            } );
            inspectionManageGridIdPop02.pqGrid("refreshDataAndView");

         })
         $("#inspection_manage_search_btn").on('click', function () {
            console.log("inspection_manage_search_btn 11111111");
            return;
            inspectionManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#inspection_manage_form');
            } );
            inspectionManageGridId01.pqGrid("refreshDataAndView");

        });





        $('#inside_stock_pop_save_btn').on('click', function () {
            //규격 validation

            // $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            // $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").html());
            //
            // $("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", false);
            // $("#stock_manage_pop_form").find("#LOC_SEQ").attr("disabled", false);
            //
            // let parameters = {
            //     'url': '/managerInsideStockPop',
            //     'data': $('#stock_manage_pop_form').serialize()
            // };
            // fnPostAjax(function (data, callFunctionParam) {
            //     console.log(data);
            //     let footer_msg ="";
            //     let popType = $("#stock_manage_pop_form").find("#POP_TYPE").val();
            //     if(popType == "BARCODE"){
            //         footer_msg = pop_msg_in_done;
            //         $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
            //         $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val(data.INSIDE_STOCK_NUM);
            //         $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
            //     }else if(popType == "GRID_IN"){
            //         footer_msg = pop_msg_in_done;
            //         $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
            //         $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
            //     }else if(popType == "GRID_OUT"){
            //         footer_msg = pop_msg_out_done;
            //         $('#stock_manage_pop').modal('hide');
            //     }
            // }, parameters, '');


        });

        $('#inspection_manage_pop_form').find('#popClose').on('click', function () {
            $('#inspection_manage_pop').modal('hide');
        });

        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            // let WAREHOUSE_CD = this.value;
            // let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'inspection.selectWarehouseLocationList'}};
            // fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });

        // fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        // });
        // fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
        //     'url': '/json-list',
        //     'data': {'queryId': 'dataSource.getOrderCompanyList'}
        // });

        $("#INSPECTION_BARCODE_NUM").on('keyup', function(e) {
            if (e.keyCode == 13) {
                fnResetFrom("inspection_manage_pop_form");
                $('#inspection_manage_pop').modal('show');
            }
        });
    });

    $("#chkInspectionTimer").on('click', function(e){
        inspectionTimer();
    });
    $("#selectInspectionTimer").on('change', function(e){
        inspectionTimer();
    });
    let inspectionsetIntervalTimer;
    let inspectionTimer = function(){
        let isinspectonChk = $("#chkInspectionTimer").is(":checked");
        let selVal = $("#selectInspectionTimer").val();
        let timesec = 1000;
        if(isinspectonChk){
            inspectionsetIntervalTimer = setInterval(function() {
                $("#inspection_manage_search_btn").trigger('click');
            }, timesec*selVal);
        }else{
            clearInterval(inspectionsetIntervalTimer);
        }
    }

    $(function () {
        /** 공통 제품상세 정보 */
        $("#g_item_detail_pop_form").find("#queryId").val("inspection.selectInspectionList");


        let g_ItemDetailPopGridId01 = $("#g_item_detail_pop_grid_01");
        let g_ItemDetailPopColModel01 = [
            {title: '항목', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', maxWidth: 150, width: 150, editable: false},
            {title: '비고', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 95, width: 95, editable: false}
        ];
        g_ItemDetailPopGridId01.pqGrid({
            width: "100%", height: 90,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center'},
            scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: g_ItemDetailPopColModel01
        });
    });
    /**  공통 제품상세 정보  끝 **/

</script>
