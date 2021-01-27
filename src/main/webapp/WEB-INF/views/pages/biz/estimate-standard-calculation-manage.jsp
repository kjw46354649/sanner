<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-11-13
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page estimate">
    <!-- 소재비 -->
    <div id="escm0">
        <div class="topWrap">
            <form id="material_cost_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="estimate.selectMaterialCostList">
                <div class="none_gubunWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="estimate_standard">견적 표준계산 관리</label>
                                <select class="wd_200" name="estimate_standard" id="estimate_standard">
                                    <option value="0">소재비</option>
                                    <option value="1">소재비추가로직</option>
                                    <option value="2">후가공</option>
                                    <option value="3">표면처리비</option>
                                    <option value="4">가공비</option>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_TYPE">소재형태</label>
                                <select class="wd_200" name="MATERIAL_KIND" id="material_kind" title="소재형태">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1029}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="gubun"></span>
                            <span class="slt_wrap">
                                <label class="label_100" for="material_type">재질</label>
                                <select class="wd_200" name="MATERIAL_TYPE" id="material_type" title="재질">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1035}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="gubun"></span>
                            <span class="slt_wrap">
                                <label class="label_100" for="material_detail">소재종류</label>
                                <select class="wd_200" name="MATERIAL_DETAIL" id="material_detail" title="소재종류">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1027}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
                                <button type="button" class="defaultBtn radius blue" id="material_cost_search">검색</button>
                            </span>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="bottomWrap row1_bottomWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w" id="material_cost_add">Add</button>
                                <button class="defaultBtn btn-100w red" id="material_cost_delete">Delete</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="material_cost_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conWrap">
                    <div id="material_cost_grid"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 소재비추가로직 -->
    <div id="escm1" style="display: none;">
        <div class="topWrap">
            <form id="material_add_logic_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="estimate.selectMaterialAddLogicList">
                <div class="none_gubunWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="estimate_standard">견적 표준계산 관리</label>
                                <select class="wd_200" name="estimate_standard" id="estimate_standard">
                                    <option value="0">소재비</option>
                                    <option value="1">소재비추가로직</option>
                                    <option value="2">후가공</option>
                                    <option value="3">표면처리비</option>
                                    <option value="4">가공비</option>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
                                <button type="button" class="defaultBtn radius blue" id="material_add_logic_search">검색</button>
                            </span>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="bottomWrap row1_bottomWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w" id="material_add_logic_add">Add</button>
                                <button class="defaultBtn btn-100w red" id="material_add_logic_delete">Delete</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="material_add_logic_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conWrap">
                    <div id="material_add_logic_grid"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 후가공 -->
    <div id="escm2" style="display: none;">
        <div class="topWrap">
            <form id="post_processing_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="estimate.selectPostProcessingList">
                <div class="none_gubunWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="estimate_standard">견적 표준계산 관리</label>
                                <select class="wd_200" name="estimate_standard" id="estimate_standard">
                                    <option value="0">소재비</option>
                                    <option value="1">소재비추가로직</option>
                                    <option value="2">후가공</option>
                                    <option value="3">표면처리비</option>
                                    <option value="4">가공비</option>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="finish_type_1">반영항목</label>
                                <select class="wd_200" name="FINISH_TYPE_1" id="finish_type_1" title="반영항목">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1057}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
                                <button type="button" class="defaultBtn radius blue" id="post_processing_search">검색</button>
                            </span>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="bottomWrap row1_bottomWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w" id="post_processing_add">Add</button>
                                <button class="defaultBtn btn-100w red" id="post_processing_delete">Delete</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="post_processing_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conWrap">
                    <div id="post_processing_grid"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 표면처리비 -->
    <div id="escm3" style="display: none;">
        <div class="topWrap">
            <form id="surface_treatment_cost_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="estimate.selectSurfaceTreatmentCostList">
                <div class="none_gubunWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="estimate_standard">견적 표준계산 관리</label>
                                <select class="wd_200" name="estimate_standard" id="estimate_standard">
                                    <option value="0">소재비</option>
                                    <option value="1">소재비추가로직</option>
                                    <option value="2">후가공</option>
                                    <option value="3">표면처리비</option>
                                    <option value="4">가공비</option>
                                </select>
                            </span>
                            <span class="slt_wrap">
                            <label class="label_100" for="MATERIAL_TYPE">재질</label>
                            <select class="wd_200" name="MATERIAL_TYPE" id="MATERIAL_TYPE" title="재질">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                                <c:forEach var="code" items="${HighCode.H_1035}">
                                    <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                </c:forEach>
                            </select>
                            </span>
                            <%--<span class="slt_wrap">
                                <label class="label_100" for="MATERIAL_DETAIL">소재종류</label>
                                <select id="MATERIAL_DETAIL" name="MATERIAL_DETAIL" title="소재종류" class="wd_200">
                                  <option value=""><spring:message code="com.form.top.all.option"/></option>
                                  <c:forEach var="vlocale" items="${HighCode.H_1027}">
                                      <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                  </c:forEach>
                                </select>
                            </span>--%>
                            <span class="ipu_wrap right_float">
                                <button type="button" class="defaultBtn radius blue" id="surface_treatment_cost_search">검색</button>
                            </span>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="bottomWrap row1_bottomWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w" id="surface_treatment_cost_add">Add</button>
                                <button class="defaultBtn btn-100w red" id="surface_treatment_cost_delete">Delete</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="surface_treatment_cost_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conWrap">
                    <div id="surface_treatment_cost_grid"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 가공비 -->
    <div id="escm4" style="display: none;">
        <div class="topWrap">
            <form id="process_cost_form" role="form" onsubmit="return false;">
                <input type="hidden" name="queryId" id="queryId" value="estimate.selectProcessCostList">
                <input type="hidden" name="CALC_SEQ" id="CALC_SEQ">
                <div class="none_gubunWrap">
                    <ul>
                        <li>
                            <span class="slt_wrap">
                                <label class="label_100" for="estimate_standard">견적 표준계산 관리</label>
                                <select class="wd_200" name="estimate_standard" id="estimate_standard">
                                    <option value="0">소재비</option>
                                    <option value="1">소재비추가로직</option>
                                    <option value="2">후가공</option>
                                    <option value="3">표면처리비</option>
                                    <option value="4">가공비</option>
                                </select>
                            </span>
                            <span class="slt_wrap">
                                <label class="label_100" for="material_kind">소재형태</label>
                                <select class="wd_200" name="MATERIAL_KIND" id="material_kind" title="소재형태">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1029}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="gubun"></span>
                            <span class="slt_wrap">
                                <label class="label_100" for="material_type">재질</label>
                                <select class="wd_200" name="MATERIAL_TYPE" id="material_type" title="재질">
                                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                                    <c:forEach var="code" items="${HighCode.H_1035}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="ipu_wrap right_float">
                                <button type="button" class="defaultBtn radius blue" id="process_cost_search">검색</button>
                            </span>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="bottomWrap row1_bottomWrap">
            <div class="tableWrap">
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w" id="process_cost_add">Add</button>
                                <button class="defaultBtn btn-100w red" id="process_cost_delete">Delete</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="process_cost_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conMainWrap">
                    <div id="process_cost_grid"></div>
                </div>
                <div class="hWrap">
                    <div class="buttonWrap">
                        <div class="d-flex align-items-center">
                            <div>
                                <button class="defaultBtn btn-100w orange" data-toggle="modal" data-target="#outsourcingConversionModal">견적 가공 Factor 상세설정</button>
                            </div>
                            <div class="ml-auto">
                                <button class="defaultBtn btn-100w green" id="process_cost_factor_save">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="conWrap">
                    <div id="process_cost_factor_grid"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="outsourcingConversionModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content" <%--style="width: 500px"--%>>
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: large; font-weight: bold">견적 가공 Factor 상세설정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -21.5px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <div class="d-flex align-items-center">
                        <div>
                            <button class="defaultBtn btn-100w" id="process_cost_factor_detail_add">Add</button>
                            <button class="defaultBtn btn-100w red" id="process_cost_factor_detail_delete">Delete</button>
                        </div>
                        <div class="ml-auto">
                            <button class="defaultBtn btn-100w green" id="process_cost_factor_detail_save">Save</button>
                        </div>
                    </div>
                    <div class="mt-10">
                        <div id="process_cost_factor_detail_grid"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center !important">
                <button type="button" class="defaultBtn grayPopGra" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        let ADD_LOGIC_LIST = (function () {
            let list = [];
            let parameters = {
                'url': '/json-list',
                'data': {'queryId': 'estimate.selectMaterialAddLogicList'}
            };

            fnPostAjaxAsync(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.ADD_SEQ, text: obj.ADD_NM});
                }
            }, parameters, '');

            return list;
        })();
        /* init */

        /* function */
        /* function */

        /* event */
        $('[name=estimate_standard]').on('change', function () {
            $('#view_tab_10000103 > div.page > div').hide();
            $('[name=estimate_standard]').val($(this).val()).prop('selected', true);

            switch (Number($(this).val())) {
                case 0:
                    $('#escm0').show();
                    $materialCostGrid.pqGrid('refreshDataAndView');
                    ADD_LOGIC_LIST = (function () {
                        let list = [];
                        let parameters = {
                            'url': '/json-list',
                            'data': {'queryId': 'estimate.selectMaterialAddLogicList'}
                        };

                        fnPostAjaxAsync(function (data) {
                            for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                                let obj = data.list[i];

                                list.push({value: obj.ADD_SEQ, text: obj.ADD_NM});
                            }
                        }, parameters, '');

                        return list;
                    })();
                    break;
                case 1: // 소재 마감
                    $('#escm1').show();
                    $materialAddLogicGrid.pqGrid('refreshDataAndView');
                    break;
                case 2: // 후가공
                    $('#escm2').show();
                    $postProcessingGrid.pqGrid('refreshDataAndView');
                    break;
                case 3: // 표면처리비
                    $('#escm3').show();
                    $surfaceTreatmentCostGrid.pqGrid('refreshDataAndView');
                    break;
                case 4: // 가공비
                    $('#escm4').show();
                    $processCostGrid.pqGrid('refreshDataAndView');
                    $processCostFactorGrid.pqGrid('refreshDataAndView');
                    break;
            }
        });
        /* event */


        /* init */

        const materialCostGridId = 'material_cost_grid';
        const materialCostColModel = [
            {title: 'GROUP_KEY', dataIndx: 'GROUP_KEY', hidden: true, editable: false},
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'CALC_SEQ', maxWidth: 55, hidden: false, editable: false},
            {
                title: '소재형태', dataIndx: 'MATERIAL_KIND', maxWidth: 60, styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE', maxWidth: 50, styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1035')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1035');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '소재종류', dataIndx: 'MATERIAL_DETAIL', maxWidth: 100, styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let rowData = ui.rowData;

                        return fnGetCommCodeGridSelectBoxEtc('1027', rowData.MATERIAL_TYPE);
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1027');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '비중', dataType: 'float', format: '#,###.0', dataIndx: 'SPECIFIC_GRAVITY', maxWidth: 50},
            {
                title: '계산방식', dataIndx: 'CALC_METHOD', maxWidth: 80, styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1087')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1087');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '단가(원)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT', maxWidth: 70},
            {title: '최소금액(원)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MIN_AMT', maxWidth: 70},
            {
                title: '규격요소', dataIndx: 'RANGE_TYPE', maxWidth: 50, editable: false,
                styleHead: {'font-weight': 'bold', 'background': '#D8D8D8'},
            },
            {
                title: 'Calcul1', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {title: 'Ranage', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'RANGE_1'},
                    {title: 'loss', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'LOSS_1'}
                ]
            },
            {
                title: 'Calcul2', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {title: 'Ranage', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'RANGE_2'},
                    {title: 'loss', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'LOSS_2'}
                ]
            },
            {
                title: 'Calcul3', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {title: 'Ranage', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'RANGE_3'},
                    {title: 'loss', maxWidth: 55, /*align: 'right',*/ dataType: 'integer', /*format: '#,###',*/ dataIndx: 'LOSS_3'}
                ]
            },
            {
                title: '규격<br>소재<br>여부', dataIndx: 'RANGE_SIZE_YN', maxWidth: 50,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')}
            },
            {title: '규격 Size', align: 'left', dataIndx: 'SIZE_NUM'},
            {
                title: '추가로직', dataType: 'integer', dataIndx: 'ADD_SEQ',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ADD_LOGIC_LIST},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (fnIsEmpty(cellData)) {
                        return '';
                    } else {
                        let data = ADD_LOGIC_LIST;

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '비고',/* align: 'left',*/ dataIndx: 'NOTE'}
        ];
        const materialCostObj = {
            height: 760,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            // editable: false,
            columnTemplate: {
                align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            colModel: materialCostColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'estimate.selectMaterialCostList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            load: function (event, ui) {
                autoMerge(this, true);
            },
            rowSelect: function (event, ui) {
                materialCostSelectedRowIndex[0] = ui.addList[0].rowIndx;
            }
        };
        const $materialCostGrid = $('#' + materialCostGridId).pqGrid(materialCostObj);
        let materialCostSelectedRowIndex = [];
        /* init */

        /* function */
        const autoMerge = function (grid, refresh) {
            const includeList = [
                'MATERIAL_KIND', 'MATERIAL_TYPE', 'MATERIAL_DETAIL', 'SPECIFIC_GRAVITY',
                'CALC_METHOD', 'UNIT_AMT', 'UNIT_MIN_AMT', 'NOTE', 'ADD_SEQ'
            ];

            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let groupKey = data[j]['GROUP_KEY'],
                            groupKeyPrev = data[j - 1] ? data[j - 1]['GROUP_KEY'] : undefined,
                            cd = data[j][dataIndx] || '',
                            cdPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;
                        if (groupKey === groupKeyPrev) {
                            if (cdPrev !== undefined && cd == cdPrev) {
                                rc++;
                            }
                        } else if (rc > 1) {
                            mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                            rc = 1;
                        }
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };


        /* function */

        /* event */
        $('#material_cost_search').on('click', function () {
            $materialCostGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#material_cost_form');
            });
            $materialCostGrid.pqGrid('refreshDataAndView');
        });

        $('#material_cost_add').on('click', function () {
            const totalRecords = $materialCostGrid.pqGrid('option', 'dataModel.data').length;

            let rowList = [
                {newRow: {GROUP_KEY: totalRecords + 1, RANGE_TYPE: 'W'}, rowIndx: totalRecords + 1},
                {newRow: {GROUP_KEY: totalRecords + 1, RANGE_TYPE: 'H'}, rowIndx: totalRecords + 2},
                {newRow: {GROUP_KEY: totalRecords + 1, RANGE_TYPE: 'T'}, rowIndx: totalRecords + 3},
                {newRow: {GROUP_KEY: totalRecords + 1, RANGE_TYPE: 'D'}, rowIndx: totalRecords + 4},
                {newRow: {GROUP_KEY: totalRecords + 1, RANGE_TYPE: 'L'}, rowIndx: totalRecords + 5}
            ];
            $materialCostGrid.pqGrid('addRow', {
                rowList: rowList,
                checkEditable: false
            });
            autoMerge($materialCostGrid.pqGrid('getInstance').grid, true);
        });

        $('#material_cost_delete').on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                let parameters;
                let rowDataArray = [];
                let selectedRowCount = materialCostSelectedRowIndex.length;

                for (let i = 0; i < selectedRowCount; i++) {
                    rowDataArray[i] = $materialCostGrid.pqGrid('getRowData', {rowIndx: materialCostSelectedRowIndex[i]});
                }
                parameters = {'url': '/deleteMaterialCost', 'data': {data: JSON.stringify(rowDataArray)}}

                fnPostAjax(function (data, callFunctionParam) {
                    $materialCostGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            });
        });

        $('#material_cost_save').on('click', function () {
            let gridInstance = $materialCostGrid.pqGrid('getInstance').grid;
            //추가 또는 수정된 값이 있으면 true
            if (gridInstance.isDirty()) {
                let changes = gridInstance.getChanges({format: 'byVal'});
                let parameters = {'url': '/insertMaterialCost', 'data': {data: JSON.stringify(changes)}};

                fnPostAjax(function (data, callFunctionParam) {
                    $materialCostGrid.pqGrid('refreshDataAndView');
                }, parameters, '');
            }
        })
        /* event */
        
        
        /* init */
        const materialAddLogicGridId = 'material_add_logic_grid';
        const materialAddLogicColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'ADD_SEQ', maxWidth: 55, hidden: false, editable: false},
            {title: '반영항목', dataIndx: 'ADD_NM'},
            {
                title: '단가단위A<br>(cm기준)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'AMT_FACTOR_1',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '단가단위B<br>(cm기준)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'AMT_FACTOR_2',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '최소금액', dataIndx: 'UNIT_MIN_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '단가금액 계산식 (제품 규격 기준)', align: 'left', dataIndx: 'CALC_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '삭제<br>여부', dataIndx: 'DEL_YN', type: 'checkbox',
                cb: {check: 'Y', uncheck: 'N'},
                render: function (ui) {
                    if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                    return '<input type="checkbox">';
                }
            },
            {title: '비고', dataIndx: 'NOTE'}
        ];
        const materialAddLogicObj = {
            height: 760,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            // editable: false,
            columnTemplate: {
                align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#000000'}
            },
            colModel: materialAddLogicColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'estimate.selectMaterialAddLogicList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                materialAddLogicSelectedRowIndex[0] = ui.addList[0].rowIndx;
            }
        };
        const $materialAddLogicGrid = $('#' + materialAddLogicGridId).pqGrid(materialAddLogicObj);
        let materialAddLogicSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        $('#material_add_logic_search').on('click', function () {
            $materialAddLogicGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#material_add_logic_form');
            });
            $materialAddLogicGrid.pqGrid('refreshDataAndView');
        });

        $("#material_add_logic_add").on('click', function () {
            const totalRecords = $materialAddLogicGrid.pqGrid('option', 'dataModel.data').length;

            $materialAddLogicGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $("#material_add_logic_delete").on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deleteMaterialAddLogic'

                fnDeletePQGrid($materialAddLogicGrid, materialAddLogicSelectedRowIndex, deleteQuery);
            });
        });

        $('#material_add_logic_save').on('click', function () {
            const insertQueryList = ['estimate.insertMaterialAddLogic'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($materialAddLogicGrid, insertQueryList, updateQueryList);
        })
        /* event */
        
        /* init */
        const postProcessingReflectedItems = fnGetCommCodeGridSelectBox('1057').filter(function (element, index) {
           return element.value === 'MFN020' || element.value === 'MFN030';
        });
        const postProcessingGridId = 'post_processing_grid';
        const postProcessingColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'CALC_SEQ', maxWidth: 55, hidden: false, editable: false},
            {
                title: '반영항목', dataIndx: 'FINISH_TYPE_1',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: postProcessingReflectedItems},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = postProcessingReflectedItems;

                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '소재마감<br>항목', dataIndx: 'FINISH_TYPE_2',
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let rowData = ui.rowData;

                        return fnGetCommCodeGridSelectBoxEtc('1058', rowData.FINISH_TYPE_1);
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1058');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1035')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1035');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '단가단위A<br>(cm기준)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'AMT_FACTOR_1',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '단가단위B<br>(cm기준)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'AMT_FACTOR_2',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '최소금액', dataIndx: 'UNIT_MIN_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '단가금액 계산식 (제품 규격 기준)', align: 'left', dataIndx: 'CALC_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
            },
            {
                title: '삭제<br>여부', dataIndx: 'DEL_YN', type: 'checkbox',
                cb: {check: 'Y', uncheck: 'N'},
                render: function (ui) {
                    if (ui.cellData === 'Y') return '<input type="checkbox" checked>';
                    return '<input type="checkbox">';
                }
            },
            {title: '비고', dataIndx: 'NOTE'}
        ];
        const postProcessingObj = {
            height: 760,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            // editable: false,
            columnTemplate: {
                align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#000000'}
            },
            colModel: postProcessingColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'estimate.selectPostProcessingList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                postProcessingSelectedRowIndex[0] = ui.addList[0].rowIndx;
            }
        };
        const $postProcessingGrid = $('#' + postProcessingGridId).pqGrid(postProcessingObj);
        let postProcessingSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        $('#post_processing_search').on('click', function () {
            $postProcessingGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#post_processing_form');
            });
            $postProcessingGrid.pqGrid('refreshDataAndView');
        });

        $("#post_processing_add").on('click', function () {
            const totalRecords = $postProcessingGrid.pqGrid('option', 'dataModel.data').length;

            $postProcessingGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $("#post_processing_delete").on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deletePostProcessing'

                fnDeletePQGrid($postProcessingGrid, postProcessingSelectedRowIndex, deleteQuery);
            });
        });

        $('#post_processing_save').on('click', function () {
            const insertQueryList = ['estimate.insertPostProcessing'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($postProcessingGrid, insertQueryList, updateQueryList);
        });
        /* event */        
        
        
        /* init */
        const surfaceTreatmentCostGridId = 'surface_treatment_cost_grid';
        const surfaceTreatmentCostColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'CALC_SEQ', maxWidth: 55, hidden: false, editable: false},
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1035')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1035');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '표면처리 종류', align: 'left', dataIndx: 'SURFACE_TREAT',
                editor: {type: 'select',valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1039')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1039');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '비중', dataType: 'float', format: '#,###.0', dataIndx: 'SPECIFIC_GRAVITY'},
            {
                title: '계산방식', dataIndx: 'CALC_METHOD',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1087')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1087');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '단가(원)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT'},
            {title: '최소금액(원)', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MIN_AMT'},
            {title: '비고',/* align: 'left',*/ dataIndx: 'NOTE'}
        ];
        const surfaceTreatmentCostObj = {
            height: 760,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            // editable: false,
            columnTemplate: {
                align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5'}
            },
            colModel: surfaceTreatmentCostColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'estimate.selectSurfaceTreatmentCostList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                surfaceTreatmentSelectedRowIndex[0] = ui.addList[0].rowIndx;
            }
        };
        const $surfaceTreatmentCostGrid = $('#' + surfaceTreatmentCostGridId).pqGrid(surfaceTreatmentCostObj);
        let surfaceTreatmentSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        $('#surface_treatment_cost_search').on('click', function () {
            $surfaceTreatmentCostGrid.pqGrid('option', 'dataModel.postData', function () {
                return fnFormToJsonArrayData('#surface_treatment_cost_form');
            });
            $surfaceTreatmentCostGrid.pqGrid('refreshDataAndView');
        });

        $("#surface_treatment_cost_add").on('click', function () {
            const totalRecords = $surfaceTreatmentCostGrid.pqGrid('option', 'dataModel.data').length;

            $surfaceTreatmentCostGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $("#surface_treatment_cost_delete").on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deleteSurfaceTreatmentCost'

                fnDeletePQGrid($surfaceTreatmentCostGrid, surfaceTreatmentSelectedRowIndex, deleteQuery);
            });
        });

        $('#surface_treatment_cost_save').on('click', function () {
            const insertQueryList = ['estimate.insertSurfaceTreatmentCost'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($surfaceTreatmentCostGrid, insertQueryList, updateQueryList);
        })
        /* event */


        /* init */
        const processCostGridId = 'process_cost_grid';
        let processCostPostData = fnFormToJsonArrayData('#process_cost_form');
        const processCostColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'CALC_SEQ', maxWidth: 55, hidden: false, editable: false},
            {
                title: '소재형태', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1029');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1035')},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let data = fnGetCommCodeGridSelectBox('1035');
                        let index = data.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = data.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : data[index].text;
                    }
                }
            },
            {title: '가로', /*align: 'right',*/ dataType: 'float', /*format: '#,###.##',*/ dataIndx: 'SIZE_W'},
            {title: '세로', /*align: 'right',*/ dataType: 'float', /*format: '#,###.##',*/ dataIndx: 'SIZE_H'},
            {title: '두께', /*align: 'right',*/ dataType: 'float', /*format: '#,###.##',*/ dataIndx: 'SIZE_T'},
            {title: '길이', /*align: 'right',*/ dataType: 'float', /*format: '#,###.##',*/ dataIndx: 'SIZE_D'},
            {title: '지름', /*align: 'right',*/ dataType: 'float', /*format: '#,###.##',*/ dataIndx: 'SIZE_L'},
            {title: '규격레벨', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'SIZE_LEVEL'},
            {title: '기본가공비', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_BASIC_AMT'},
        ];
        const processCostObj = {
            height: 350,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            // editable: false,
            columnTemplate: {
                align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#000000'}
            },
            colModel: processCostColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: processCostPostData,
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                const grid = this;
                const data = grid.option('dataModel.data');

                if (data.length > 0) {
                    grid.setSelection({rowIndx: 0});
                }
            },
            rowSelect: function (event, ui) {
                const rowData = ui.addList[0].rowData;

                $('#process_cost_form').find('#CALC_SEQ').val(rowData.CALC_SEQ);
                processCostSelectedRowIndex[0] = ui.addList[0].rowIndx;
                processCostPostData = fnFormToJsonArrayData('#process_cost_form');
                processCostPostData.queryId = 'estimate.selectProcessCostFactorList';
                processCostPostData.CALC_SEQ = rowData.CALC_SEQ;
                $processCostFactorGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                    return processCostPostData;
                });
                $processCostFactorGrid.pqGrid('refreshDataAndView');
            }
        };
        const $processCostGrid = $('#' + processCostGridId).pqGrid(processCostObj);
        let processCostSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        $('#process_cost_search').on('click', function () {
            let postData = fnFormToJsonArrayData('#process_cost_form');
            postData.queryId = 'estimate.selectProcessCostList';

            $processCostGrid.pqGrid('option', 'dataModel.postData', function () {
                return postData;
            });
            $processCostGrid.pqGrid('refreshDataAndView');
        });

        $('#process_cost_add').on('click', function () {
            const totalRecords = $processCostGrid.pqGrid('option', 'dataModel.data').length;

            $processCostGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $('#process_cost_delete').on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deleteProcessCost'

                fnDeletePQGrid($processCostGrid, processCostSelectedRowIndex, deleteQuery);
            });
        });

        $('#process_cost_save').on('click', function () {
            const insertQueryList = ['estimate.insertProcessCost'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($processCostGrid, insertQueryList, updateQueryList);
        });
        /* event */

        /* init */
        const processCostFactorGridId = 'process_cost_factor_grid';
        const processCostFactorColModel = [
            {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
            {title: 'SEQ', dataIndx: 'CALC_SEQ', maxWidth: 55, hidden: false},
            {title: 'Code', dataIndx: 'FACTOR_CD'},
            {title: 'Level1', dataIndx: 'LEVEL_1'},
            {title: 'Level2', dataIndx: 'LEVEL_2'},
            {
                title: '단가', /*align: 'right',*/ dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#000000'}, editable: true
            }
        ];
        const processCostFactorObj = {
            height: 350,
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: processCostFactorColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'estimate.selectProcessCostFactorList'},
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                processCostFactorSelectedRowIndex[0] = ui.addList[0].rowIndx;
            }
        };
        const $processCostFactorGrid = $('#' + processCostFactorGridId).pqGrid(processCostFactorObj);
        let processCostFactorSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        /*$("#process_cost_factor_add").on('click', function () {
            const totalRecords = $processCostFactorGrid.pqGrid('option', 'dataModel.data').length;

            $processCostFactorGrid.pqGrid('addNodes', [{'CALC_SEQ': $('#process_cost_form').find('#CALC_SEQ').val()}], totalRecords + 1);
        });

        $("#process_cost_factor_delete").on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deleteProcessCostFactor'

                fnDeletePQGrid($processCostFactorGrid, processCostFactorSelectedRowIndex, deleteQuery);
            });
        });*/

        $('#process_cost_factor_save').on('click', function () {
            const insertQueryList = ['estimate.insertProcessCostFactor'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($processCostFactorGrid, insertQueryList, updateQueryList);
        })
        /* event */





        /* init */
        let $processCostFactorDetailGrid;
        let processCostFactorDetailSelectedRowIndex = [];
        /* init */

        /* function */
        /* function */

        /* event */
        $('#outsourcingConversionModal').on({
            'show.bs.modal': function () {
                const processCostFactorDetailGridId = 'process_cost_factor_detail_grid';
                const processCostFactorDetailColModel = [
                    {title: 'ROW_NUM', dataIndx: 'ROW_NUM', hidden: true, editable: false},
                    {title: 'Code', dataIndx: 'FACTOR_CD'},
                    {title: 'Level1', dataIndx: 'LEVEL_1'},
                    {title: 'Level2', dataIndx: 'LEVEL_2'},
                    {title: '비고', dataIndx: 'NOTE'}
                ];
                const processCostFactorDetailObj = {
                    height: 350,
                    collapsible: false,
                    resizable: false,
                    showTitle: false,
                    // rowHtHead: 15,
                    numberCell: {show: false},
                    scrollModel: {autoFit: true},
                    trackModel: {on: true},
                    selectionModel: {type: 'row', mode: 'single'},
                    // editable: false,
                    columnTemplate: {
                        align: 'center', halign: 'center', hvalign: 'center', valign: 'center',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#000000'}
                    },
                    colModel: processCostFactorDetailColModel,
                    dataModel: {
                        location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                        postData: {'queryId': 'estimate.selectProcessCostFactorDetailList'},
                        recIndx: 'ROW_NUM',
                        getData: function (dataJSON) {
                            return {data: dataJSON.data};
                        }
                    },
                    rowSelect: function (event, ui) {
                        processCostFactorDetailSelectedRowIndex[0] = ui.addList[0].rowIndx;
                    }
                };
                $processCostFactorDetailGrid = $('#' + processCostFactorDetailGridId).pqGrid(processCostFactorDetailObj);
            },
            'hide.bs.modal': function () {
                $processCostFactorDetailGrid.pqGrid('destroy');
            }
        });

        $("#process_cost_factor_detail_add").on('click', function () {
            const totalRecords = $processCostFactorDetailGrid.pqGrid('option', 'dataModel.data').length;

            $processCostFactorDetailGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        });

        $("#process_cost_factor_detail_delete").on('click', function () {
            fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
                const deleteQuery = 'estimate.deleteProcessCostFactorDetail'

                fnDeletePQGrid($processCostFactorDetailGrid, processCostFactorDetailSelectedRowIndex, deleteQuery);
            });
        });

        $('#process_cost_factor_detail_save').on('click', function () {
            const insertQueryList = ['estimate.insertProcessCostFactorDetail'];
            const updateQueryList = insertQueryList;

            fnModifyPQGrid($processCostFactorDetailGrid, insertQueryList, updateQueryList);
        });
        /* event */
    });
</script>