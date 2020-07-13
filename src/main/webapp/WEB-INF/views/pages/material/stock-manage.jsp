<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" id="stock_manage_form" name="stock_manage_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockList">
            <input type="hidden" name="popType" id="popType" value="">
            <input type="hidden" name="V_INSIDE_STOCK_NUM" id="V_INSIDE_STOCK_NUM" value="">
            <div class="none_gubunWrap row3_topWrap" >
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
                    <li>
                        <div class="slt_wrap">
                            <label class="label_100" for="SEL_SIZE_TYPE">규격</label>
                            <select class="wd_100" class="two" name="SEL_SIZE_TYPE" id="SEL_SIZE_TYPE">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            <span class="nbsp"></span>
                            <select class="wd_100" class="two" name="SEL_SIZE_SEARCH_TYPE" id="SEL_SIZE_SEARCH_TYPE" style="display: none">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1056}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <span class="nbsp"> </span>
                        <%-- 원통@, 반원R, 육각H, 가로W, 세로H, 두께T, 지름D, 길이L --%>
                        <span id="SEL_SIZE_SEARCH_TYPE_E" style="display: none">
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_E_1" id="SEL_SIZE_SEARCH_TYPE_E_1">
                            <span class="nbsp">*</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_E_2" id="SEL_SIZE_SEARCH_TYPE_E_2">
                            <span class="nbsp" id="SEL_SIZE_SEARCH_TYPE_E_3_SPAN">*</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_E_3" id="SEL_SIZE_SEARCH_TYPE_E_3">
                        </span>
                        <span id="SEL_SIZE_SEARCH_TYPE_R" style="display: none">
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_1" id="SEL_SIZE_SEARCH_TYPE_R_1">
                                <span class="nbsp">~</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_2" id="SEL_SIZE_SEARCH_TYPE_R_2">
                            <span class="nbsp">*</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_3" id="SEL_SIZE_SEARCH_TYPE_R_3">
                                <span class="nbsp">~</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_4" id="SEL_SIZE_SEARCH_TYPE_R_4">
                            <span class="nbsp" id="SEL_SIZE_SEARCH_TYPE_R_5_SPAN">*</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_5" id="SEL_SIZE_SEARCH_TYPE_R_5">
                                <span class="nbsp" id="SEL_SIZE_SEARCH_TYPE_R_6_SPAN">~</span>
                            <input type="text" class="wd_50" name="SEL_SIZE_SEARCH_TYPE_R_6" id="SEL_SIZE_SEARCH_TYPE_R_6">
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="stock_manage_search_btn">검색</button>
                        <%--<span class="txt_span pd-right20">조회 Option</span>
                        <span class="chk_box"><input type="checkbox" name="DEADLINE" id="DEADLINE"><label for="DEADLINE">마감</label></span>
                        <span class="chk_box"><input type="checkbox" name="END" id="END"><label for="END">종료</label></span>
                        <span class="gubun"></span>
                        <span class="txt_span pd-right20">항목 Option</span>
                        <span class="chk_box"><input type="checkbox" name="PART_NUM" id="PART_NUM"><label for="PART_NUM">Part</label></span>
                        <span class="chk_box"><input type="checkbox" name="ORDER_NUM" id="ORDER_NUM"><label for="ORDER_NUM">발주번호</label></span>--%>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="bottomWrap row3_bottomWrap">
        <div class="hWrap">
            <div class="d-inline">
                <input type="text" id="stockManageFilterKeyword" placeholder="Enter your keyword">
                <select id="stockManageFilterColumn"></select>
                <select id="stockManageFilterCondition">
                    <c:forEach var="code" items="${HighCode.H_1083}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
                <label for="stockManageFrozen" class="label_50" style="font-size: 15px;">Fix</label>
                <select id="stockManageFrozen" name="stockManageFrozen">
                </select>
                <button type="button" class="defaultBtn" id="stock_manage_new_btn">재고 입고</button>
                <button type="button" class="defaultBtn" id="stock_manage_area_info_btn">위치정보관리</button>
                <div class="rightSpan">
                    <button type="button" class="defaultBtn radius" id="stock_manage_drawing_new_btn">도면 등록</button>
                    <button type="button" class="defaultBtn radius" id="stock_manage_drawing_view_btn">도면 View</button>
                    <button type="button" class="defaultBtn radius" id="stock_manage_add_btn">추가</button>
                    <button type="button" class="defaultBtn radius red" id="stock_manage_delete_btn">삭제</button>
                    <button type="button" class="defaultBtn radius green" id="stock_manage_save_btn">저장</button>
                </div>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="stock_manage_grid"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="stock_manage_grid_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 재고입고 mini popup : S -->
<div class="popup_container" id="stock_manage_pop" style="display: none;">
    <form class="form-inline" id="stock_manage_pop_form" name="stock_manage_pop_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="material.selectInsideStockPopInfo">
        <input type="hidden" id="IN_OUT_QTY" name="IN_OUT_QTY" value="0">
        <input type="hidden" id="ORIGINAL_ORDER_QTY" name="ORIGINAL_ORDER_QTY" value="0">
        <input type="hidden" id="ORIGINAL_POP_STOCK_QTY_AFTER" name="ORIGINAL_POP_STOCK_QTY_AFTER" value="0">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
        <input type="hidden" name="POP_TYPE" id="POP_TYPE" value="">

        <input type="hidden" name="MATERIAL_DETAIL" id="MATERIAL_DETAIL" value="">
        <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD" value="">
        <input type="hidden" name="ITEM_NM" id="ITEM_NM" value="">
        <input type="hidden" name="COMP_CD" id="COMP_CD" value="">

    <div class="miniPopup">
        <%--<div class="headWrap">
            <h4 id="pop_title">재고 입고</h4>
            <button class="closeBtn">닫기</button>
        </div>--%>
        <div class="contentWrap">
            <h3 id="pop_title">재고 입고</h3>
            <button type="button" class="pop_close" id="inside_stock_pop_close_btn2">닫기</button>
            <table>
                <caption></caption>
                <colgroup>
                    <col width="10%">
                    <col width="*">
                    <col width="5%">
                    <col width="5%">
                    <col width="5%">
                </colgroup>
                <tr>
                    <th>도면번호</th>
                    <td colspan="4"><input type="text" name="DRAWING_NUM" id="DRAWING_NUM"  value="" title="도면번호" class="wd_250" readonly></td>
<%--                    <th class="bg_green">Part</th>--%>
<%--                    <td>23</td>--%>
                </tr>
                <tr>
                    <th>재고번호</th>
                    <td colspan="4"><input type="text" name="INSIDE_STOCK_NUM" id="INSIDE_STOCK_NUM"  value="" title="재고번호" class="wd_250" readonly></td>
                </tr>
                <tr>
                    <th>규격</th>
                    <td colspan="4"><input type="text" name="SIZE_TXT" id="SIZE_TXT"  value="" title="규격" class="wd_250" readonly></td>
                </tr>
                <tr>
                    <th>창고</th>
                    <td class="nopadding bg_green">
				    	<span>
							<select id="WAREHOUSE_CD" name="WAREHOUSE_CD" title="창고" data-required="true">
								<option value=""><spring:message code="com.form.top.all.option" /></option>
                                <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                    <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                </c:forEach>
							</select>
						</span>
                    </td>
                    <th>위치</th>
                    <td colspan="2" class="nopadding bg_green">
				    	<span>
							 <select id="LOC_SEQ" name="LOC_SEQ" title="위치" data-required="true" >
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
						</span>
                    </td>
                </tr>
                <tr>
                    <th>현재수량</th>
                    <td><input type="text" name="POP_STOCK_QTY" id="POP_STOCK_QTY"  value="" title="현재수량" class="wd_50" readonly></td>
                    <th>변경후수량</th>
                    <td colspan="2"><input type="text" name="POP_STOCK_QTY_AFTER" id="POP_STOCK_QTY_AFTER"  value="" title="변경후수량" class="wd_50" readonly></td>
                </tr>
                <tr>
                    <th>수량</th>
                    <td colspan="4" class="bg_green">
                        <button type="button" class="btn_plus" id="inside_stock_qty_plus_btn">더하기</button>
                        <span class="text">
                            <input type="text" id="ORDER_QTY" value="0" style="border: none; outline: none; background: #e8f9ea; width: 70px; height: 33px; font-size: 19px; text-align: center;">
                        </span>
                        <button type="button" class="btn_minus" id="inside_stock_qty_minus_btn">빼기</button>
                        <button type="button" class="btn_allPlus" id="inside_stock_qty_all_btn">전량</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="footerWrap">
            <div class="barcode" id="footer_barcode">
                <span class="barCodeTxt"><input type="text" class="wd_240_barcode hg_35" name="BARCODE_NUM" id="BARCODE_NUM" placeholder="도면의 바코드를 스캔해 주세요" ></span>
                <span class="barCode" style="margin: 13px 15px 0 0;"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="stock_manage_pop_form_barcode_img" ></span>
            </div>
            <div class="process">
                <span class="pr_txt" id="footer_msg"></span>
<%--                <span class="pr_txt">재고를 <b>신규 생성</b>하시겠습니까?</span>--%>
<%--                <span class="pr_txt"><b class="block">입고가 완료되었습니다.</b>추가 진행하려면 바코드를 스캔해주세요</span>--%>
                <div class="btnWrap">
                    <button type="button" class="defaultBtn greenPopGra" id="inside_stock_pop_save_btn">저장</button>
                    <button type="button" class="defaultBtn grayPopGra" id="inside_stock_pop_close_btn">닫기</button>

                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<!-- 재고입고 mini popup : E -->



<script>
    $(function () {
        'use strict';

        let SelectedRowIndex = [];

        let stockManageGridId01 = $("#stock_manage_grid");
        let stockManageColModel01;
        let stockManagePostData01;
        let stockManageObj01;

        let pop_msg_new = "재고를 <b>신규 생성</b>하시겠습니까?";
        let pop_msg_in = "<b>입고</b>를 진행하겠습니까?";
        let pop_msg_out = "<b>출고</b>를 진행하겠습니까?";
        let pop_msg_in_done = "<b class=\"block\">입고가 완료되었습니다.</b>추가 진행하려면 바코드를 스캔해주세요";
        let pop_msg_out_done = "<b class=\"block\">출고가 완료되었습니다.</b>";

        /**  리스트 그리드 선언 시작 **/
        $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
        stockManagePostData01 = fnFormToJsonArrayData('#stock_manage_form');
        stockManageColModel01 = [
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD',  minWidth: 110, width: 110,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({
                        "url" : '/json-list',
                        'data': {'queryId': 'dataSource.getOrderCompanyList'}
                    }),
                },
                editable: function (ui) {return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', minWidth: 25, width: 25, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="magnifyingGlassIcon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {title: '도면번호', dataType: 'string', dataIndx: 'DRAWING_NUM', minWidth: 150, width: 150,
                editable: function (ui) { return gridCellEditable(ui);},
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            },
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 200, width: 200,
                editable: function (ui) { return gridCellEditable(ui);},
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            },
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 150, width: 150, editable: false},
            {title: '사업자구분', dataType: 'string', dataIndx: 'COMP_CD', minWidth: 120, width: 120, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnCommCodeDatasourceGridSelectBoxCreate({"url":"/json-list", "data": {"queryId": 'dataSource.getBusinessCompanyList'}})
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ]
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', minWidth: 100, width: 100,
                editable: function (ui) { return gridCellEditable(ui);},
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {title: '소재Type', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',editable: function (ui) { return gridCellEditable(ui);},
                minWidth: 100, width: 100,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                validations: [
                    { type: 'minLen', value: 1, msg: "Required" }
                ], styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}
            },
            {title: '재고수량<br>(EA)', dataType: 'integer', dataIndx: 'INSIDE_STOCK_CURR_QTY', editable: function (ui) { return gridCellEditable(ui);}
                , styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}
                , format: '#,###'
            },
            // {
            //     title: '대칭', datatype: 'integer', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
            //         {title: '원칭', datatype: 'integer', dataIndx: 'ORIGINAL_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true},
            //         {title: '대칭', datatype: 'integer', dataIndx: 'OTHER_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, editable: true}
            //     ]
            // },
            {title: '창고명', dataType: 'string', dataIndx: 'WAREHOUSE_CD', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1049') }
            },
            {title: '재고위치', dataType: 'string', dataIndx: 'LOC_SEQ', editable: true, styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'block'},
                minWidth: 100, width: 100,
                editor: { type: 'select', valueIndx: "value", labelIndx: "text",
                    options: function(ui) {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                        };
                        let ajaxData = "";
                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');

                        return ajaxData;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        let WAREHOUSE_CD = rowData["WAREHOUSE_CD"];
                        let warehouseData = {
                            "url" : '/json-list',
                            'data' :{"queryId": 'dataSource.getLocationListWithWarehouse', "WAREHOUSE_CD" : WAREHOUSE_CD}
                        };
                        let ajaxData = "";

                        fnPostAjaxAsync(function (data, callFunctionParam) {
                            ajaxData = data.list;
                        }, warehouseData, '');

                        let index = ajaxData.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ajaxData.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : ajaxData[index].text;
                    }
                }
            },

            /*{title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return '+';
                }
            },
            {
                title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ', width: 40, minWidth: 40, editable: false,
                render: function (ui) {
                    let rowIndx = ui.rowIndx, grid = this;
                    if (ui.rowData['IMG_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return '+';
                }
            },*/
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="downloadView" class="blueFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#downloadView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'PDF', dataType: 'string', dataIndx: 'PDF_GFILE_SEQ', minWidth: 35, width: 35, editable: false,
                render: function (ui) {
                    if (ui.cellData) return '<span id="imageView" class="redFileImageICon" style="cursor: pointer"></span>'
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#imageView").bind("click", function () {
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: '생성일시', dataType: 'string', dataIndx: 'INSERT_TIME', minWidth: 100, width: 100, editable: false},
            {title: '수정일시', dataType: 'string', dataIndx: 'UPDATE_TIME', minWidth: 100, width: 100, editable: false},
            // {title: '입고', align: 'center', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN', width: 20, minWidth: 42, editable: false, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         console.log("ui.rowData['INSIDE_STOCK_NUM']", ui.rowData['INSIDE_STOCK_NUM']);
            //         if (ui.rowData['INSIDE_STOCK_NUM'] != undefined) return "[입고]";
            //         return '';
            //     }
            // },
            // {title: '출고', align: 'center', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_OUT', width: 20, minWidth: 42, editable: false, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
            //     render: function (ui) {
            //         let rowIndx = ui.rowIndx, grid = this;
            //         if (ui.rowData['INSIDE_STOCK_NUM'] != undefined) return "[출고]";
            //         return '';
            //     }
            // },
            {title: '입고/출고', dataType: 'string', dataIndx: 'INSIDE_STOCK_QTY_IN_OUT', minWidth: 100, width: 100,
                styleHead: {'font-weight': 'bold','background':'#aac8ed', 'color': 'black'}, editable: false,
                render: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    let rowData = ui.rowData;
                    let inBtn = '';
                    if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                        inBtn = '<button type="button" class="miniBtn orange" id="INSIDE_STOCK_QTY_IN_ACTION">입고</button>' + '&nbsp;';
                    }
                    let outBtn = '';
                    if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
                        outBtn = '<button type="button" class="miniBtn blue" id="INSIDE_STOCK_QTY_OUT_ACTION">출고</button>';
                    }
                    return inBtn + outBtn;
                },
                postRender: function (ui) {
                    let grid = this;
                    let $cell = grid.getCell(ui);
                    //let rowData = ui.rowData;
                    $cell.find('#INSIDE_STOCK_QTY_IN_ACTION').bind('click', function(e) {
                        e.preventDefault();
                       $("#stock_manage_form").find("#popType").val("GRID_IN");
                       $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                       $('#stock_manage_pop').modal('show');
                    });
                    $cell.find('#INSIDE_STOCK_QTY_OUT_ACTION').bind('click', function(e) {
                        e.preventDefault();
                        if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
                            alert("출고할 재고수량이 없습니다.");
                        }else{
                            $("#stock_manage_form").find("#popType").val("GRID_OUT");
                            $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
                            $('#stock_manage_pop').modal('show');
                        }
                    });
                }
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 250, width: 250, editable: true, styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
        ];
        stockManageGridId01.pqGrid({
            width: "100%", height: 710,
            postRenderInterval: -1, //call postRender synchronously.
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'INSIDE_STOCK_NUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('stock_manage_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            columnTemplate: {align: 'center', hvalign: 'center', render: stockManageFilterRender}, filterModel: { mode: 'OR' },
            //scrollModel: {autoFit: true},
            numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
            //selectionModel: { type: 'row', mode: 'single'} ,
            selectionModel: { type: 'cell', mode: 'multiple'} ,
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: stockManageColModel01,
            load: function( event, ui ) {
                var filterOpts = '<option value=\"\">All Fields</option>';
                var frozenOts = '<option value="0">Selected</option>';
                this.getColModel().forEach(function(column){
                    let hiddenYn = column.hidden == undefined ? true : false;
                    if(hiddenYn && column.title){
                        filterOpts +='<option value="'+column.dataIndx+'">'+column.title+'</option>';
                        frozenOts +='<option value="'+(column.leftPos+1)+'">'+column.title+'</option>';
                    }
                });
                $("#stockManageFilterColumn").empty();
                $("#stockManageFilterColumn").html(filterOpts);
                $("#stockManageFrozen").empty();
                $("#stockManageFrozen").html(frozenOts);
            },
            cellSave: function (evt, ui) {
                  if (ui.dataIndx == "WAREHOUSE_CD_NM" && ui.newVal !== ui.oldVal) {
                      stockManageGridId01.pqGrid("updateRow", { 'rowIndx': ui.rowIndx , row: { 'LOC_SEQ_NM': '' } });
                  }
              },
            complete: function () {
                let data = stockManageGridId01.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#stock_manage_grid_records').html(totalRecords);
            },
            /*rowSelect: function (event, ui) {
                SelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    SelectedRowIndex.push(selectList[i].rowIndx);
                }
            },*/
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    SelectedRowIndex = [];
                    let userMasterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let userMasterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (userMasterGridFirstRow === userMasterGridLastRow) {
                        SelectedRowIndex[0] = userMasterGridFirstRow;
                    } else {
                        for (let i = userMasterGridFirstRow; i <= userMasterGridLastRow; i++) {
                            SelectedRowIndex.push(i);
                        }
                    }
                }
            },
            change: function (evt, ui) {
                if(ui.source == "edit") {
                    let WAREHOUSE_CD = ui.updateList[0].newRow.WAREHOUSE_CD == undefined ? "" : ui.updateList[0].newRow.WAREHOUSE_CD;
                    if(WAREHOUSE_CD != "") {
                        let rowIndx = ui.updateList[0].rowIndx;
                        stockManageGridId01.pqGrid('updateRow', {rowIndx: rowIndx, row: {"LOC_SEQ": ""}});
                    }
                }
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                /*if (ui.dataIndx == 'DXF_GFILE_SEQ') {
                    if (ui.rowData['DXF_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.DXF_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockManageGridId01, rowIndx, 'DXF_GFILE_SEQ');
                    }

                    return;
                }
                if (ui.dataIndx == 'IMG_GFILE_SEQ') {

                    if (ui.rowData['IMG_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.IMG_GFILE_SEQ);
                    } else {
                        callGridSingleFileUpload(stockManageGridId01, rowIndx, 'IMG_GFILE_SEQ');
                    }

                    return;
                }*/
            }
            // ,cellClick: function (event, ui) {
            //     let rowIndx = ui.rowIndx, $grid = this;
            //     if (ui.rowData['INSIDE_STOCK_NUM'] != undefined){
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_IN') {//입고
            //             $("#stock_manage_form").find("#popType").val("GRID_IN");
            //             $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
            //             $('#stock_manage_pop').modal('show');
            //         }
            //         if (ui.dataIndx == 'INSIDE_STOCK_QTY_OUT') {//출고
            //
            //             if (ui.rowData['INSIDE_STOCK_CURR_QTY'] <= 0){
            //                 alert("출고할 재고수량이 없습니다.");
            //             }else{
            //                 $("#stock_manage_form").find("#popType").val("GRID_OUT");
            //                 $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val(ui.rowData['INSIDE_STOCK_NUM']);
            //                 $('#stock_manage_pop').modal('show');
            //             }
            //         }
            //     }
            // }
        });
        /**  현황관리(GRID01) 그리드 선언 끝 **/

        let gridCellEditable = function(ui){
            let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: ui.rowIndx});
            let INSIDE_STOCK_NUM = rowData["INSIDE_STOCK_NUM"];
            if (INSIDE_STOCK_NUM == null || INSIDE_STOCK_NUM == "" || INSIDE_STOCK_NUM== "undefined" || INSIDE_STOCK_NUM== undefined) {
                return true;
            }else{
                return false;
            }
        }


        $("#stock_manage_pop").on('hide.bs.modal', function(){
            fnResetFrom("stock_manage_pop_form");
            $("#stock_manage_form").find("#queryId").val("material.selectInsideStockList");
           $("#stock_manage_search_btn").trigger("click");
        });
        $("#stock_manage_pop").on('show.bs.modal', function(){
            //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
            let popType = $("#stock_manage_form").find("#popType").val();
            let V_INSIDE_STOCK_NUM = $("#stock_manage_form").find("#V_INSIDE_STOCK_NUM").val();

            $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").show();
            $("#stock_manage_pop_form").find("#footer_msg").hide();
            $("#stock_manage_pop_form").find("#footer_msg").html("");
            //$("#stock_manage_pop_form").find("#DRAWING_NUM").attr("readonly", true);

            let footer_msg = "";
            let pop_title = "재고 입고";
            let pop_data = null;

            if(popType == "BARCODE"){
                $("#stock_manage_pop_form").find("#queryId").val("material.selectInsideStockPopInfoBarcode");//바코드 sql 1
                //$("#stock_manage_form").find("#footer_barcode").show();
                //$("#stock_manage_pop_form").find("#DRAWING_NUM").attr("readonly", false);
                //$("#stock_manage_pop_form").find("#footer_barcode").show();

            }else if(popType == "GRID_IN"){
                pop_data = {"V_INSIDE_STOCK_NUM":V_INSIDE_STOCK_NUM,"queryId":"material.selectInsideStockPopInfo"};
                $("#stock_manage_pop_form").find("#footer_msg").show();
                footer_msg = pop_msg_in;
                $("#stock_manage_pop_form").find("#inside_stock_qty_all_btn").prop('disabled', true);

            }else if(popType == "GRID_OUT"){
                pop_data = {"V_INSIDE_STOCK_NUM":V_INSIDE_STOCK_NUM,"queryId":"material.selectInsideStockPopInfo"};
                footer_msg = pop_msg_out;
                pop_title = "재고 출고";
                $("#stock_manage_pop_form").find("#footer_msg").show();
                $("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", true);
                $("#stock_manage_pop_form").find("#LOC_SEQ").attr("disabled", true);
                $("#stock_manage_pop_form").find("#inside_stock_qty_all_btn").prop('disabled', false);
            }else{
                alert("error type");
                return;
            }
            $("#stock_manage_pop_form").find("#pop_title").html(pop_title);

            if( footer_msg != ""){
                let parameters = {
                    'url': '/json-info',
                    'data': pop_data
                };
                fnPostAjax(function (data, callFunctionParam) {
                    let dataInfo = data.info;
                    if(dataInfo == null ) {
                        fnResetFrom("stock_manage_pop_form");
                    }else{
                        fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                        $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                        $("#stock_manage_pop_form").find("#ORDER_QTY").val(dataInfo.ORDER_QTY);
                        $("#stock_manage_pop_form").find("#ORIGINAL_ORDER_QTY").val(dataInfo.ORDER_QTY);
                        $("#stock_manage_pop_form").find("#ORIGINAL_POP_STOCK_QTY_AFTER").val(dataInfo.POP_STOCK_QTY_AFTER);
                        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(dataInfo.WAREHOUSE_CD);
                        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change();
                        setTimeout(function() {
                            $("#stock_manage_pop_form").find("#LOC_SEQ").val(dataInfo.LOC_SEQ);
                        }, 1000);

                    }
                }, parameters, '');
            };

        });
        $("#stock_manage_search_btn").on('click', function () {
            let SEL_SIZE_SEARCH_TYPE = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE_E_1 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val();
            let SEL_SIZE_SEARCH_TYPE_E_2 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val();
            let SEL_SIZE_SEARCH_TYPE_E_3 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_1 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val();
            let SEL_SIZE_SEARCH_TYPE_R_2 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val();
            let SEL_SIZE_SEARCH_TYPE_R_3 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val();
            let SEL_SIZE_SEARCH_TYPE_R_4 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val();
            let SEL_SIZE_SEARCH_TYPE_R_5 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val();
            let SEL_SIZE_SEARCH_TYPE_R_6 = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val();

            if(SEL_SIZE_SEARCH_TYPE == "1") {//Range
                if (SEL_SIZE_SEARCH_TYPE_R_1 == "" || SEL_SIZE_SEARCH_TYPE_R_2 == "" || SEL_SIZE_SEARCH_TYPE_R_3 == ""
                    || SEL_SIZE_SEARCH_TYPE_R_4 == "" || SEL_SIZE_SEARCH_TYPE_R_5 == "" || SEL_SIZE_SEARCH_TYPE_R_6 == "") {
                    alert("Range 검색을 선택하셨습니다.\n구간 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                if (SEL_SIZE_SEARCH_TYPE_E_1 == "" || SEL_SIZE_SEARCH_TYPE_E_2 == "" || SEL_SIZE_SEARCH_TYPE_E_3 == "") {
                    alert("Equal 검색을 선택하셨습니다.\n각 입력값 모두를 입력하여 주십시오.");
                    return;
                }
            }


            stockManageGridId01.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#stock_manage_form');
            } );
            stockManageGridId01.pqGrid("refreshDataAndView");

        });

        $('#stock_manage_add_btn').on('click', function () {

            // stockManageGridId01.pqGrid('addRow', {
            //     newRow: {  },
            //     rowIndx: 0,
            //     checkEditable: true
            // });
            stockManageGridId01.pqGrid('addNodes', [{}], 0);

        });
        $("#stock_manage_delete_btn").click(function(event){
            if(SelectedRowIndex == "" || SelectedRowIndex == null){
                alert("삭제할 데이터를 선택해 주십시오.");
                return;
            }
            let rowCnt = "";
            let INSIDE_STOCK_NUM ="";
            for (let i = 0; i < SelectedRowIndex.length; i++) {
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: SelectedRowIndex[i]});
                INSIDE_STOCK_NUM += "'"+rowData["INSIDE_STOCK_NUM"]+"',";
            }
            INSIDE_STOCK_NUM = INSIDE_STOCK_NUM.substr(0 , INSIDE_STOCK_NUM.length-1);

            let deleteData = {
                "url" : '/json-info',
                'data' :
                    {
                        "queryId": 'material.selectInsideStockIn',
                        "INSIDE_STOCK_NUM" : INSIDE_STOCK_NUM
                    }
            };
            fnPostAjaxAsync(function (data, callFunctionParam) {
                rowCnt = data.info.CNT;
                console.log(rowCnt);
            }, deleteData, '');

            if(rowCnt > 0){
                alert("입고 이력이 존재 합니다.\n삭제를 위해서 관리자에게 문의 하십시오.");
                return;
            }else{
                if(confirm("선택한 대상의 모든 정보가 삭제됩니다.\n진행하시겠습니까?")){
                    fnDeletePQGrid(stockManageGridId01, SelectedRowIndex, "material.deleteInsideStock");
                    $("#stock_manage_search_btn").trigger("click");
                }
            }
        });

        $("#stock_manage_save_btn").click(function(event){

            if(!fnGridValidation("stock_manage_grid")){
                alert("그리드의 값이 올바르지 않습니다.");
                return;
            }
            if(false){
                //to-do 규격 validation
            }
            if(confirm("저장 하시겠습니까?")){

                /*//step 1 java 에서 처리
                let rowData = stockManageGridId01.pqGrid("getRowData", {rowIndx: SelectedRowIndex});
                let V_ABBR_NM = "";
                let MATERIAL_DETAIL = rowData["MATERIAL_DETAIL"];
                let selectData1 = {
                    "url" : '/json-info',
                    'data' :
                        {
                            "queryId": 'material.selectInsideStockAbbrNm',
                            "MATERIAL_DETAIL" : MATERIAL_DETAIL
                        }
                };
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    V_ABBR_NM = data.info.ABBR_NM;
                }, selectData1, '');
                if( V_ABBR_NM == null || "" == V_ABBR_NM ){
                    alert("잘못된 접근 입니다.[V_ABBR_NM null]");
                    return;
                }

                //step 2
                let V_INSIDE_STOCK_NUM = "";
                let ORDER_COMP_CD = rowData["ORDER_COMP_CD"];
                let selectData2 = {
                    "url" : '/json-info',
                    'data' :
                        {
                            "queryId": 'material.selectInsideStockAbbrNm',
                            "ORDER_COMP_CD" : ORDER_COMP_CD,
                            "ABBR_NM" : V_ABBR_NM
                        }
                };
                fnPostAjaxAsync(function (data, callFunctionParam) {
                    V_INSIDE_STOCK_NUM = data.info.ABBR_NM;
                }, selectData2, '');
                if( V_INSIDE_STOCK_NUM == null || "" == V_INSIDE_STOCK_NUM ){
                    alert("잘못된 접근 입니다.[V_INSIDE_STOCK_NUM null]");
                    return;
                }*/

                //step 3 save
                let gridInstance = stockManageGridId01.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});
console.log("change",JSON.stringify(changes));

                let parameters = {
                    'url': '/managerInsideStock',
                    'data': {"stockGrid": JSON.stringify(changes)}
                };
                fnPostAjax(function (data, callFunctionParam) {
                    alert('재고관리 정보가 저장되었습니다.');
                    $("#stock_manage_search_btn").trigger("click");
                }, parameters, '');

            }
        });
        $('#inside_stock_pop_save_btn').on('click', function () {
            //규격 validation

            $("#stock_manage_pop_form").find("#POP_TYPE").val($("#stock_manage_form").find("#popType").val());
            $("#stock_manage_pop_form").find("#IN_OUT_QTY").val($("#stock_manage_pop_form").find("#ORDER_QTY").val());

            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").attr("disabled", false);
            $("#stock_manage_pop_form").find("#LOC_SEQ").attr("disabled", false);

            let parameters = {
                'url': '/managerInsideStockPop',
                'data': $('#stock_manage_pop_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                console.log(data);
                let footer_msg ="";
                let popType = $("#stock_manage_pop_form").find("#POP_TYPE").val();
                if(popType == "BARCODE"){
                    footer_msg = pop_msg_in_done;
                    $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                    $("#stock_manage_pop_form").find("#INSIDE_STOCK_NUM").val(data.INSIDE_STOCK_NUM);
                    $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
                }else if(popType == "GRID_IN"){
                    footer_msg = pop_msg_in_done;
                    $("#stock_manage_pop_form").find("#footer_msg").html(footer_msg);
                    $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").hide();
                }else if(popType == "GRID_OUT"){
                    footer_msg = pop_msg_out_done;
                    $('#stock_manage_pop').modal('hide');
                }
            }, parameters, '');


        });
        $('#stock_manage_new_btn').on('click', function () {
            //$("#stock_manage_pop_form").find("#WAREHOUSE_CD").val("")
            //$("#pop_form").find("#queryId").val("material.selectConsumableList");
            $("#stock_manage_form").find("#popType").val("BARCODE");

            $('#stock_manage_pop').modal('show');

            $("#stock_manage_pop_form").find("#BARCODE_NUM").focus();


        });
        $('#stock_manage_pop_form').find('.closeBtn').on('click', function () {
            $('#stock_manage_pop').modal('hide');
        });
        $('#stock_manage_pop_form').find('#inside_stock_pop_close_btn').on('click', function () {
            $('#stock_manage_pop').modal('hide');
        });
        $('#stock_manage_pop_form').find('#inside_stock_pop_close_btn2').on('click', function () {
                    $('#stock_manage_pop').modal('hide');
        });
        $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change(function(){
            let WAREHOUSE_CD = this.value;
            let paramData = {"url":"/json-list", "data": {"WAREHOUSE_CD": WAREHOUSE_CD, "queryId": 'material.selectWarehouseLocationList'}};
            fnCommCodeDatasourceSelectBoxCreate($("#stock_manage_pop_form").find("#LOC_SEQ"), 'all', paramData);
        });
        $("#stock_manage_form").find("#SEL_SIZE_TYPE").change(function(){
            resetSelSizeVal("1");
            displaySelSize();
        });
        $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").change(function(){
            resetSelSizeVal("2");
            displaySelSize();
        });
        let displaySelSize = function(type){
            let SEL_SIZE_TYPE = $("#stock_manage_form").find("#SEL_SIZE_TYPE").val();
            let SEL_SIZE_SEARCH_TYPE = $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val();

            if(SEL_SIZE_TYPE == ""){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
            }else if(SEL_SIZE_TYPE =="MSS010"){//일반
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").show();
            }else if(SEL_SIZE_TYPE =="MSS020" || SEL_SIZE_TYPE =="MSS030" || SEL_SIZE_TYPE =="MSS040"){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3_SPAN").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5_SPAN").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6_SPAN").hide();
            }


            if(SEL_SIZE_SEARCH_TYPE == ""){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "1"){//Range
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").show();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").hide();
            }else if(SEL_SIZE_SEARCH_TYPE == "2") {//Equal
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R").hide();
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E").show();
            }
        }
        let resetSelSizeVal = function(type){
            if(type == "1"){
                $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE").val("");
            }
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_1").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_2").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_E_3").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_1").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_2").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_3").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_4").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_5").val("");
            $("#stock_manage_form").find("#SEL_SIZE_SEARCH_TYPE_R_6").val("");

        }
// sdfsd
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        fnCommCodeDatasourceSelectBoxCreate($('#stock_manage_form').find('#SEL_ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        $("#stock_manage_pop_form #ORDER_QTY").on("keyup", function(e) {
            $(this).val($(this).val().replace(/[^0-9]/g,""));

            let compareQty = $('#stock_manage_pop_form').find('#POP_STOCK_QTY').val();//현재수량
            let outQty = $(this).val();
            let stockQty='';

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN") {//입고
                stockQty = Number(compareQty) + Number(outQty);

            } else {
                if(Number(compareQty) < Number(outQty)){
                    alert("불출 수량을 확인 해 주세요.");
                    $(this).val(outQty.substring(0, outQty.length-1));
                    outQty = $(this).val();
                }
                stockQty = Number(compareQty) - Number(outQty);
            }

            $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val(stockQty);

        });
        $('#inside_stock_qty_plus_btn').on('click', function(e) {
            calcQty("PLUS");
        });
        $('#inside_stock_qty_minus_btn').on('click', function(e) {
            calcQty("MINUS");
        });
        $('#inside_stock_qty_all_btn').on('click', function(e) {
            let ORIGINAL_POP_STOCK_QTY_AFTER = $('#stock_manage_pop_form').find('#ORIGINAL_POP_STOCK_QTY_AFTER').val();
            //let ORIGINAL_ORDER_QTY =  $('#stock_manage_pop_form').find('#ORIGINAL_ORDER_QTY').val();

            $('#stock_manage_pop_form').find('#ORDER_QTY').val(ORIGINAL_POP_STOCK_QTY_AFTER);
            $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(0);

        });
        let calcQty = function(type){

            let POP_STOCK_QTY = $('#stock_manage_pop_form').find('#POP_STOCK_QTY').val();//현재수량
            let POP_ORDER_QTY = $('#stock_manage_pop_form').find('#ORDER_QTY').val();//입고수량
            let POP_STOCK_QTY_AFTER = $("#stock_manage_pop_form").find("#POP_STOCK_QTY_AFTER").val();//변경후수량

            let popType = $("#stock_manage_form").find("#popType").val();
            if(popType == "BARCODE" || popType == "GRID_IN"){//입고
                if(type == "PLUS"){
                    POP_ORDER_QTY = parseInt(POP_ORDER_QTY)+1;
                    POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                }else if(type == "MINUS"){
                    console.log("MINUS POP_ORDER_QTY",parseInt(POP_ORDER_QTY));
                    if(parseInt(POP_ORDER_QTY) > 0){
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)-1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) + POP_ORDER_QTY;
                    }
                }
            }else{
                if(type == "PLUS"){
                    if(parseInt(POP_STOCK_QTY_AFTER) > 0){
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY)+1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) - POP_ORDER_QTY;
                    }
                }else if(type == "MINUS"){
                    //console.log("MINUS POP_ORDER_QTY",parseInt(POP_ORDER_QTY));
                    if(parseInt(POP_ORDER_QTY) > 0 && parseInt(POP_STOCK_QTY) >= parseInt(POP_ORDER_QTY)) {
                        POP_ORDER_QTY = parseInt(POP_ORDER_QTY) - 1;
                        POP_STOCK_QTY_AFTER = parseInt(POP_STOCK_QTY) - POP_ORDER_QTY;
                    }
                }
            }


            $('#stock_manage_pop_form').find('#ORDER_QTY').val(POP_ORDER_QTY);
            $('#stock_manage_pop_form').find('#POP_STOCK_QTY_AFTER').val(POP_STOCK_QTY_AFTER);
            console.log("POP_ORDER_QTY",POP_ORDER_QTY);
            console.log("POP_STOCK_QTY_AFTER",POP_STOCK_QTY_AFTER);

        }
        $("#stock_manage_pop_form").find("#BARCODE_NUM").on({
            focus: function () {
                $("#stock_manage_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
            },
            blur: function () {
                $("#stock_manage_pop_form_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
            },
            keyup: function (e) {
                if (e.keyCode == 13) {
                    let BARCODE_NUM = $("#stock_manage_pop_form").find("#BARCODE_NUM").val();
                    let parameters = {
                        'url': '/json-info',
                        'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcode"}
                    };
                    $("#stock_manage_pop_form").find("#footer_msg").show();
                    $("#stock_manage_pop_form").find("#inside_stock_pop_save_btn").show();
                    fnPostAjax(function (data, callFunctionParam) {
                        let dataInfo = data.info;
                        if(dataInfo == null ) {
                            let parameters2 = {
                                'url': '/json-info',
                                'data': {"BARCODE_NUM":BARCODE_NUM,"queryId":"material.selectInsideStockPopInfoBarcodeNew"}
                            };
                            fnPostAjax(function (data2, callFunctionParam) {
                                let dataInfo2 = data2.info;
                                if(dataInfo2 == null ) {
                                    alert("도면번호가 존재하지 않습니다.");
                                    fnResetFrom("stock_manage_pop_form");
                                    $('#stock_manage_pop').modal('hide');
                                }else{
                                    fnJsonDataToForm("stock_manage_pop_form", dataInfo2);
                                    $("#stock_manage_pop_form").find("#footer_msg").html(pop_msg_new);
                                    $("#stock_manage_pop_form").find("#ORDER_QTY").val(dataInfo2.ORDER_QTY);
                                    $("#stock_manage_pop_form").find("#ORIGINAL_ORDER_QTY").val(dataInfo2.ORDER_QTY);
                                    $("#stock_manage_pop_form").find("#ORIGINAL_POP_STOCK_QTY_AFTER").val(dataInfo2.POP_STOCK_QTY_AFTER);
                                    $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(dataInfo2.WAREHOUSE_CD);
                                    $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change();
                                    setTimeout(function() {
                                        $("#stock_manage_pop_form").find("#LOC_SEQ").val(dataInfo2.LOC_SEQ);
                                    }, 1000);

                                }
                            }, parameters2, '');

                        }else{
                            fnJsonDataToForm("stock_manage_pop_form", dataInfo);
                            $("#stock_manage_pop_form").find("#footer_msg").html(pop_msg_in);
                            $("#stock_manage_pop_form").find("#ORDER_QTY").val(dataInfo.ORDER_QTY);
                            $("#stock_manage_pop_form").find("#ORIGINAL_ORDER_QTY").val(dataInfo.ORDER_QTY);
                            $("#stock_manage_pop_form").find("#ORIGINAL_POP_STOCK_QTY_AFTER").val(dataInfo.POP_STOCK_QTY_AFTER);
                            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").val(dataInfo.WAREHOUSE_CD);
                            $("#stock_manage_pop_form").find("#WAREHOUSE_CD").change();
                            setTimeout(function() {
                                $("#stock_manage_pop_form").find("#LOC_SEQ").val(dataInfo.LOC_SEQ);
                            }, 1000);

                        }
                    }, parameters, '');
                }
            }
        });

        /** 도면 등록 처리 **/
        $('#stock_manage_drawing_new_btn').on('click', function () {
            callCadDrawingUploadPopup('inside', 'material.manageStockCadFiles');
        });

        /** 도면 보기 팝업 호출 */
        $('#stock_manage_drawing_view_btn').on('click', function () {
            callWindowImageViewer(999);
        });
        /** 위치정보관리 팝업 호출 */
        $('#stock_manage_area_info_btn').on('click', function () {
            fnCommonWarehouse();
        });

        /** 그리드 필터 **/
        $("#stockManageFilterKeyword").on("keyup", function(e){
            fnFilterHandler(stockManageGridId01, 'stockManageFilterKeyword', 'stockManageFilterCondition', 'stockManageFilterColumn');
        });

        $("#stockManageFrozen").on('change', function(e){
            fnFrozenHandler(stockManageGridId01, $(this).val());
        });

        function stockManageFilterRender(ui) {
            let val = ui.cellData == undefined ? "" : ui.cellData,
                options = ui.column.editor == undefined ? "" : ui.column.editor.options;
            let index = -1;
            if(options) {
                index = options.findIndex(function (element) {
                    return element.value == val;
                });
                if(index > -1) val = options[index].text;
            }
            if (val) {
                var condition = $("#stockManageFilterCondition :selected").val(),
                    valUpper = val.toString().toUpperCase(),
                    txt = $("#stockManageFilterKeyword").val(),
                    txtUpper = (txt == null) ? "" : txt.toString().toUpperCase(),
                    indx = -1;

                if (condition == "end") {
                    indx = valUpper.lastIndexOf(txtUpper);
                    if (indx + txtUpper.length != valUpper.length) {
                        indx = -1;
                    }
                }
                else if (condition == "contain") {
                    indx = valUpper.indexOf(txtUpper);
                }
                else if (condition == "begin") {
                    indx = valUpper.indexOf(txtUpper);
                    if (indx > 0) {
                        indx = -1;
                    }
                }

                if (indx >= 0) {
                    var txt1 = val.toString().substring(0, indx);
                    var txt2 = val.toString().substring(indx, indx + txtUpper.length);
                    var txt3 = val.toString().substring(indx + txtUpper.length);
                    return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
                }
                else {
                    return val;
                }
            }
            else {
                return val;
            }
        }
    });
</script>
