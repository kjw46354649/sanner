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
                                <label class="control-label" for="CORPORATION">사업자</label>
                                <select class="form-control" id="CORPORATION">
                                    <option value="">- ALL -</option>
                                    <c:forEach var="code" items="${HIGHCD.H_1007}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="CLIENT">발주사</label>
                                <select class="form-control" id="CLIENT">
                                    <option value="">- ALL -</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="DRAWING_NUMBER">도면번호</label>
                                <input type="text" class="form-control" id="DRAWING_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="PRODUCT_NAME">품명</label>
                                <input type="text" class="form-control" id="PRODUCT_NAME">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="MANAGEMENT_NUMBER">관리번호</label>
                                <input type="text" class="form-control" id="MANAGEMENT_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="ORDER_NUMBER">발주번호</label>
                                <input type="text" class="form-control" id="ORDER_NUMBER">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="STANDARD">규격</label>
                                <select class="form-control" id="STANDARD">
                                    <option></option>
                                </select>
                                <label for="standard_1"></label><input type="text" class="form-control" id="STANDARD_1" size="3">
                                *
                                <label for="standard_2"></label><input type="text" class="form-control" id="STANDARD_2" size="3">
                                *
                                <label for="standard_3"></label><input type="text" class="form-control" id="STANDARD_3" size="3">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SHAPE">형태</label>
                                <select class="form-control" id="SHAPE">
                                    <option value="">- ALL -</option>
                                    <c:forEach var="code" items="${HIGHCD.H_1013}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="line line-dashed b-b line-xs"></div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for=""></label>
                                    <select class="form-control" id="">
                                        <option value="" selected>등록일시</option>
                                        <option value="" selected>변경일시</option>
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
                                    <label class="control-label" for="UNIT_CONST">단가</label>
                                    <select class="form-control" id="UNIT_CONST">
                                        <option></option>
                                    </select>
                                    <label for="UNIT_CONST_1"></label>
                                    <input type="text" class="form-control" id="UNIT_CONST_1">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label" for="WORK_CLASSIFICATION4">작업구분</label>
                                    <select class="form-control" id="WORK_CLASSIFICATION4">
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
                                    <label class="control-label" for="AMOUNT_SUM">금액합산</label>
                                    <input type="text" class="form-control" id="AMOUNT_SUM">
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
                    <a href="#modal-form" class="btn btn-s-md btn-default" id="NEW_ORDER_REGISTRATION" data-toggle="modal" style="text-decoration:none">신규 주문 등록</a>
                    <button id="DELETE">Delete</button>
                    <button id="DRAWING_REGISTRATION">도면 등록</button>
                    <button id="DRAWING_CHANGE">도면변경(Rev. up)</button>
                    <button id="CONFIRMATION">확정</button>
                    <button id="CANCEL">취소</button>
                    <button id="TERMINATION">종료</button>
                    <button id="DEADLINE">마감</button>
                    <button id="QUOTATION_REGISTRATION">견적등록</button>
                    <button id="SPECIFICATION_ON_TRANSACTION">거래명세표</button>
                    <button id="DRAWING_VIEW">도면 View</button>
                    <button id="DRAWING_PRINT">도면 출력</button>
                    <button id="BARCODE_DRAWING_PRINT">바코드도면 출력</button>
                    <button id="LABEL_PRINT">라벨 출력</button>
                    <button id="SAVE">save</button>
                </div>
                <div class="col-md-12">
                    <button id="MATERIAL">소재</button>
                    <button id="SURFACE_TREATMENT">표면처리</button>
                    <button id="PROCESSING_COST">가공비</button>
                    <button id="ESTIMATE_LIST_PRINT">견적List출력</button>
                    <label class="checkbox-inline i-checks">
                        <input type="checkbox" id="DETAIL_ESTIMATE_REQUIRE" value="option1"><i></i> 상세견적요건
                    </label>
                    <label class="control-label" for="SUPPLY_UNIT_COST_APPLY">공급단가적용</label>
                    <select id="SUPPLY_UNIT_COST_APPLY">
                        <option></option>
                    </select>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
<%--                    <i class="fa fa-plus-circle"></i>--%>
                    <div id="CONTROL_MANAGE_GRID"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<%-- modal --%>
<div class="modal fade" id="modal-form">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div id="NEW_ORDER_REGISTRATION_GRID"></div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    $(function () {
        'use strict';
        let selectedRowIndex = [];
        let $orderManagementGrid;
        const gridId = 'CONTROL_MANAGE_GRID';
        let postData = {queryId: 'getCompanyMasterList'};
        let colModel = [
            {title: '주문상태', align: 'center', colModel: [
                {title: '상태', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                {title: '변경일시', datatype: 'string', dataIndx: 'COMP_CD', editable: false}
            ]},
            {title: '사업자<br>구분', dataType: 'string', dataIndx: 'COMP_CLASS', editable: false, colModel: []},
            {title: '발주업체', dataType: 'string', dataIndx: 'COMP_NM', editable: false, colModel: []},
            {title: '구매담당', dataType: 'string', dataIndx: 'CEO_NM', editable: false, colModel: []},
            {title: '설계자', dataType: 'string', dataIndx: 'COMP_NUM', colModel: []},
            {title: '비고', dataType: 'string', dataIndx: 'COMP_TYPE', colModel: []},
            {title: 'INV No.<br>(거래명세No.)', dataType: 'string', dataIndx: 'CHARGE_USER_ID', editable: false, colModel: []},
            {title: '관리번호', dataType: 'string', dataIndx: 'COMP_TEL', colModel: []},
            {title: 'Part', dataType: 'string', dataIndx: 'COMP_ADDRESS', colModel: [], render: function (ui) {
                // if(ui.data)
                return "<span class=\"glyphicon glyphicon-plus-sign\" aria-hidden=\"true\"></span>"
            }},
            {title: '도면번호', dataType: 'string', dataIndx: 'COMP_EMAIL', colModel: []},
            {title: '품명', dataType: 'string', dataIndx: 'LOGO_FILE_SEQ', colModel: []},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'SIGN_FILE_SEQ', editable: false, colModel: []},
            {title: '외주', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ', colModel: []},
            {title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'ACTIVE_YN', editable: false, colModel: []},
            {title: '발주번호', ataType: 'string', dataIndx: 'NOTE', editable: false, colModel: []},
            {title: '주문<br>수량', dataType: 'string', dataIndx: 'STAFF_NM', colModel: []},
            {title: '상세가공요건', align: 'center', hidden:true, colModel: [
                {title: '선반', datatype: 'string', dataIndx: 'COMP_CD'},
                {title: '가공면', datatype: 'string', dataIndx: 'COMP_CD'},
                {title: '클램핑', datatype: 'string', dataIndx: 'COMP_CD'},
                {title: '포켓', datatype: 'string', dataIndx: 'COMP_CD'},
                {title: '드릴', datatype: 'string', dataIndx: 'COMP_CD'},
                {title: '난도', datatype: 'string', dataIndx: 'COMP_CD'}
            ]},
            {title: '예상소재 Size', align: 'center', hidden:true, colModel: [
                {title: '가로', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                {title: '세로', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                {title: '높이', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                {title: '중량(KG)', datatype: 'string', dataIndx: 'COMP_CD', editable: false},
                {title: '부피(cm3)', datatype: 'string', dataIndx: 'COMP_CD', editable: false}
            ]},
            {title: '소재비', dataType: 'string', dataIndx: 'STAFF_EMAIL', colModel: []},
            {title: '표면<br>처리비', dataType: 'string', dataIndx: 'STAFF_EMAIL', colModel: []}
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
        $('#NEW_ORDER_REGISTRATION_GRID').pqGrid(obj);

        $('#DETAIL_ESTIMATE_REQUIRE').on('click', function () {
            let $orderManagementGridInstance = $orderManagementGrid.pqGrid('getInstance').grid;
            let Cols = $orderManagementGridInstance.Columns();
            let titles = ['상세가공요건', '예상소재 Size'];

            Cols.alter(function(){
                for(let i = 0; i < titles.length; i++) {
                    let col = Cols.find(function(col){
                        return col.title === titles[i];
                    });
                    col.hidden = !col.hidden;

                    for (let j = 0; j < col.colModel.length; j++) {
                        col.colModel[j].hidden = col.hidden;
                    }
                }
            })
        });
    });
</script>
