<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-18
  Time: 오후 2:37
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
        <div class="col-md-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    주문 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="company-master-search-form" name="company-master-search-form"
                          role="form">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="corporation">사업자</label>
                                <select class="form-control" id="corporation">
                                    <option></option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="client">발주사</label>
                                <select class="form-control" id="client">
                                    <option></option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="drawing_number">도면번호</label>
                                <input type="text" class="form-control" id="drawing_number">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="product_name">품명</label>
                                <input type="text" class="form-control" id="product_name">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="management_number">관리번호</label>
                                <input type="text" class="form-control" id="management_number">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="order_number">발주번호</label>
                                <input type="text" class="form-control" id="order_number">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="standard">규격</label>
                                <select class="form-control" id="standard">
                                    <option></option>
                                </select>
                                <label for="standard_1"></label><input type="text" class="form-control" id="standard_1" size="3">
                                *
                                <label for="standard_2"></label><input type="text" class="form-control" id="standard_2" size="3">
                                *
                                <label for="standard_3"></label><input type="text" class="form-control" id="standard_3" size="3">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="shape">형태</label>
                                <select class="form-control" id="shape">
                                    <option></option>
                                </select>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for=""></label>
                                    <select class="form-control" id="" data-placeholder="등록일시">
                                        <%--                                        <option disabled selected>등록일시</option>--%>
                                    </select>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="a" value="option1">
                                            <i></i>
                                            오늘
                                        </label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="a" value="option1">
                                            <i></i>
                                            현재월
                                        </label>
                                    </div>
                                    <div class="radio i-checks">
                                        <label>
                                            <input type="radio" name="a" value="option1">
                                            <i></i>
                                            3개월
                                        </label>
                                    </div>
                                    <label>
                                        <input class="input-sm input-s datepicker-input form-control" size="16" type="text"
                                               value="12-02-2013" data-date-format="dd-mm-yyyy">
                                    </label> ~ <label>
                                    <input
                                 class="input-sm input-s datepicker-input form-control" size="16" type="text"
                                 value="12-02-2013" data-date-format="dd-mm-yyyy">
                                </label>
                                    <%--                                    <input type="date" name="" id=""> ~ <input type="date" name="" id="">--%>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i>
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="unit_const">단가</label>
                                    <select class="form-control" id="unit_const">
                                        <option></option>
                                    </select>
                                    <label for="unit_const_1"></label>
                                    <input type="text" class="form-control" id="unit_const_1">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="work_classification4">작업구분</label>
                                    <select class="form-control" id="work_classification4">
                                        <option></option>
                                    </select>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label" for="option">option</label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 자재사급
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 외주
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 未단가
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 긴급
                                    </label>
                                    <label class="checkbox-inline i-checks">
                                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> part 숨기기
                                    </label>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="amount_sum">금액합산</label>
                                    <input type="text" class="form-control" id="amount_sum">
                                </div>
                                <div class="form-group col-md-3 text-right">
                                    <div type="submit" class="btn btn-success btn-sm btn-default">search</div>
                                </div>
                            </div>

                            <%--<div class="form-group col-md-4">
                                <button type="submit" class="btn btn-sm btn-default">Submit</button>
                            </div>--%>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <button id="new_order_registration">신규 주문 등록</button>
                    <button id="delete">Delete</button>
                    <button id="drawing_registration">도면 등록</button>
                    <button id="drawing_change">도면변경(Rev. up)</button>
                    <button id="confirmation">확정</button>
                    <button id="cancle">취소</button>
                    <button id="termination">종료</button>
                    <button id="deadline">마감</button>
                    <button id="quotation_registration">견적등록</button>
                    <button id="specification_on_transaction">거래명세표</button>
                    <button id="drawing_view">도면 View</button>
                    <button id="drawing_print">도면 출력</button>
                    <button id="barcode_drawing_print">바코드도면 출력</button>
                    <button id="label_print">라벨 출력</button>
                    <button id="">save</button>
                </div>
                <div class="col-md-12">
                    <button id="material">소재</button>
                    <button id="surface_treatment">표면처리</button>
                    <button id="processing_cost">가공비</button>
                    <button id="estimate_list_print">견적List출력</button>
                    <label class="checkbox-inline i-checks">
                        <input type="checkbox" id="inlinecheckbox1" value="option1"><i></i> 상세자격요건
                    </label>
                    <label class="control-label" for="supply_unit_cost_apply">공급단가적용</label>
                    <select id="supply_unit_cost_apply">
                        <option></option>
                    </select>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="control_manage_grid"></div>
                </div>
            </section>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        let selectedRowIndex = [];
        let $orderManagementGrid;
        let gridId = 'control_manage_grid';
        let postData = {queryId: 'getCompanyMasterList'};
        let colModel = [
            {
                title: '주문상태', align: "center",
                colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                    {title: '변경일시', datatype: 'string', dataIndx: 'COMP_CD', editable: false}
                ]
            },
            {
                title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CLASS', editable: false,
                colModel: []
            },
            {
                title: '발주업체', dataType: 'string', dataIndx: 'COMP_NM', editable: false,
                colModel: []
            },
            {
                title: '구매담당', dataType: 'string', dataIndx: 'CEO_NM', editable: false,
                colModel: []
            },
            {
                title: '설계자', dataType: 'string', dataIndx: 'COMP_NUM',
                colModel: []
            },
            {
                title: '비고', dataType: 'string', dataIndx: 'COMP_TYPE',
                colModel: []
            },
            {
                title: 'INV No.<br>(거래명세No.)', dataType: 'string', dataIndx: 'CHARGE_USER_ID', editable: false,
                colModel: []
            },
            {
                title: '관리번호', dataType: 'string', dataIndx: 'COMP_TEL',
                colModel: []
            },
            {
                title: 'Part', dataType: 'string', dataIndx: 'COMP_ADDRESS',
                colModel: []
            },
            {
                title: '도면번호', dataType: 'string', dataIndx: 'COMP_EMAIL',
                colModel: []
            },
            {
                title: '품명', dataType: 'string', dataIndx: 'LOGO_FILE_SEQ',
                colModel: []
            },
            {
                title: '작업<br>형태', dataType: 'string', dataIndx: 'SIGN_FILE_SEQ', editable: false,
                colModel: []
            },
            {
                title: '외주', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ',
                colModel: []
            },
            {
                title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'ACTIVE_YN', editable: false,
                colModel: []
            },
            {
                title: '발주번호', ataType: 'string', dataIndx: 'NOTE', editable: false,
                colModel: []
            },
            {
                title: '주문<br>수량', dataType: 'string', dataIndx: 'STAFF_NM',
                colModel: []
            },
            {
                title: '소재비', dataType: 'string', dataIndx: 'STAFF_EMAIL',
                colModel: []
            },
            {
                title: '표면<br>처리비', dataType: 'string', dataIndx: 'STAFF_EMAIL',
                colModel: []
            }
        ];
        let toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                // {
                //     cls: 'title-hidden',
                //     type: 'textbox',
                //     label: '업체 리스트',
                //     style: 'font-size: 1.3rem;padding: 4px;font-weight: bold;'
                // },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const DELETE_QUERY_ID = '';
                            let selectedRowCount = selectedRowIndex.length;

                            /*
                            selectedRowIndex 중에 확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능
                             */
                            for (let i = 0; i < selectedRowCount; i++) {
                                let thisRowData = $orderManagementGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});

                                if(thisRowData.상태컬럼 === '' && thisRowData.상태컬럼 === '확정취소') {
                                    alert('확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능');
                                    return false;
                                }
                            }

                            fnDeletePQGrid($orderManagementGrid, selectedRowIndex, DELETE_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            const insertQueryList = ['insertUser'];
                            const updateQueryList = ['updateUser'];

                            fnModifyPQGrid($orderManagementGrid, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };
        let obj = {
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
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: colModel,
            toolbar: toolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) {
                        selectedRowIndex[0] = firstRow;
                    } else {
                        for (let i = firstRow; i <= lastRow; i++) {
                            selectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        $orderManagementGrid = $('#' + gridId).pqGrid(obj);
    });
</script>
