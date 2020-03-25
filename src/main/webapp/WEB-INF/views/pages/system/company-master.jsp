<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-03-17
  Time: 오후 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="modal" id="system_company_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">업체 상세 정보</h4>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="estimate_master_record_popup_search_form" name="estimate_master_record_popup_search_form">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <section class="bg-light">
                            <div class="panel-body">
                                <form class="form-inline" role="form">
                                    <div class="checkbox m-l m-r-xs">
                                        <div class="col-sm-7">
                                            <label class="switch">
                                                <input type="checkbox">
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <input type="button" class="btn btn-s-md btn-danger" value="SAVE">
                                    <input type="button" class="btn btn-s-md btn-dark" value="DELETE">
                                </form>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-sm-8">
                                    <div class="form-horizontal" data-validate="parsley" action="#">
                                        <section class="panel panel-default">
                                            <header class="panel-heading">
                                                <strong>기본 정보</strong>
                                            </header>
                                            <div class="panel-body">
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">회사 코드</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="회사코드" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">생성 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="생성일시" readonly>
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">최근거래 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="최근거래일시" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">영업담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="영업담당자">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">관계 구분</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="관계구분">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">업체명</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="업체명">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">업체종류</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="업체종류">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">대표자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="대표자">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">사업자 번호</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="사업자 번호">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">E-MAIL</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="E-MAIL">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">TEL.</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="TEL">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">FAX</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="FAX">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">사업장소재지</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="사업장소재지">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">비고</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" data-notblank="true" class="form-control" placeholder="비고">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">첨부파일</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="file" class="filestyle" data-icon="false" data-classButton="btn btn-default" data-classInput="form-control inline v-middle input-s">
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="hbox">
                                        <aside class="aside-md">
                                            <div class="text-center">
                                                <img src="/resource/main/images/p0.jpg" width="200px" alt="..." class="img-circle m-b">
                                                <div class="">
                                                    <button class="btn btn-default" id="company_logo_upload" href="#" >
                                                        <i class="fa fa-cloud-upload text"></i>
                                                        <span class="text">Upload</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                    <div>&nbsp;</div>
                                    <div class="hbox">
                                        <aside class="aside-md">
                                            <div class="text-center">
                                                <img src="/resource/main/images/p0.jpg" width="200px" alt="..." class="img-circle m-b">
                                                <div class="">
                                                    <button class="btn btn-default" id="company_stamp_upload" href="#" >
                                                        <i class="fa fa-cloud-upload text"></i>
                                                        <span class="text">Upload</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- grid table -->
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>당당자 정보</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-register-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
            </div>
        </div>
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
                    <form class="form-inline" id="company-master-search-form" name="company-master-search-form" role="form">
                        <input type="hidden" id="queryId" name="queryId" value="getCompanyMasterList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_CLASS">대외구분</label>
                                <select id="SEL_COMP_CLASS" name="SEL_COMP_CLASS" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1043}">
                                        <option value="${vlocale.CODE_CD}" <c:if test="${fn:toUpperCase(LocalInfo) eq vlocale.CODE_CD}"> selected="selected"</c:if>>${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_TYPE">업체종류</label>
                                <input type="text" class="form-control" id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" placeholder="업체종류">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_NM">업체명</label>
                                <input type="text" class="form-control" id="SEL_COMP_NM" name="SEL_COMP_NM" placeholder="업체명">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_NUM">사업자번호</label>
                                <input type="text" class="form-control" id="SEL_COMP_NUM" name="SEL_COMP_NUM" placeholder="사업자번호">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_STAFF_NM">담당자명</label>
                                <input type="text" class="form-control" id="SEL_STAFF_NM" name="SEL_STAFF_NM" placeholder="담당자명">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_CEO_NM">대표자명</label>
                                <input type="text" class="form-control" id="SEL_CEO_NM" name="SEL_CEO_NM" placeholder="대표자명">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_ACTIVE_YN">활성여부</label>
                                <input type="text" class="form-control" id="SEL_ACTIVE_YN" name="SEL_ACTIVE_YN" placeholder="활성여부">
                            </div>
                            <div class="form-group col-md-3 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default">SEARCH</div>
<%--                                <img src="/barcode/code128/123456" width="300px" height="150px">--%>
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
                    <div id='system-company-master-grid' style='margin:5px auto;'></div>
                </div>
            </section>

        </div>
    </div>
</div>
<script>

    let companyMasterSelectedRowIndex = [];
    let companyRegisterSelectedRowIndex = [];

    let systemCompanyMasterGridId = 'system-company-master-grid';
    let systemCompanyMasterColModel;
    let systemCompanyMasterToolbar;
    let systemCompanyMasterObj;
    let $systemCompanyMasterGrid;

    let systemCompanyRegisterGridId = 'system-company-register-popup-grid';
    let systemCompanyRegisterColModel;
    let systemCompanyRegisterToolbar;
    let systemCompanyRegisterObj;
    let $systemCompanyRegisterGrid;

    $(function () {
        'use strict';
        systemCompanyMasterColModel = [
            {title: '관계구분', datatype: 'string', dataIndx: 'COMP_CLASS_NM', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '업체명', dataType: 'string', dataIndx: 'COMP_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '사업자<br>등록번호', align: 'center', dataType: 'string', dataIndx: 'COMP_NUM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '업체종류', align: 'center', dataType: 'string', dataIndx: 'COMP_TYPE_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '대표 담당자', align: 'center', dataType: 'string', dataIndx: 'CHARGE_USER_ID',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '전화번호', align: 'center', dataType: 'string', dataIndx: 'COMP_TEL',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '담당자 Email', align: 'center', dataType: 'string', dataIndx: 'STAFF_EMAIL',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '대표자', align: 'center', dataType: 'string', dataIndx: 'CEO_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '주소', align: 'center', dataType: 'string', dataIndx: 'COMP_ADDRESS',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '비고', align: 'center', dataType: 'string', dataIndx: 'NOTE',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '대표이메일', align: 'center', dataType: 'string', dataIndx: 'COMP_EMAIL',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '로고', align: 'center', dataType: 'string', dataIndx: 'SIGN_FILE_SEQ',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '직인', align: 'center', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '최근거래<br>일시', align: 'center', dataType: 'string', dataIndx: 'INSERT_DT',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '등록일시', align: 'center', ataType: 'string', dataIndx: 'INSERT_DT',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '업데이트<br>일시', align: 'center', dataType: 'string', dataIndx: 'UPDATE_ID',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '활성<br>여부', align: 'center', dataType: 'string', dataIndx: 'ACTIVE_YN_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            }
        ];
        systemCompanyMasterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '업체 리스트', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                },
                {
                    type: 'button', label: 'NEW COMPANY', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
                            $('#system_company_popup').modal('show');
                        }
                    }
                }
            ]
        };

        systemCompanyMasterObj = {
            // width: 700,
            height: 650, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            numberCell: {title: '<br>No.', styleHead: {'vertical-align':'middle', 'padding-top':'10px'}}, scrollModel: {autoFit: true}, trackModel: {on: true},
            colModel: systemCompanyMasterColModel, toolbar: systemCompanyMasterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#company-master-search-form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    companyMasterSelectedRowIndex = [];
                    var firstRow = ui.selection.iCells.ranges[0].r1;
                    var lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) {
                        companyMasterSelectedRowIndex[0] = firstRow;
                    } else {
                        for (var i = firstRow; i <= lastRow; i++) {
                            companyMasterSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        $systemCompanyMasterGrid = $('#' + systemCompanyMasterGridId).pqGrid(systemCompanyMasterObj);

        systemCompanyRegisterColModel = [
            {title: '담당자명', datatype: 'string', dataIndx: 'COMP_CLASS_NM', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '직급', dataType: 'string', dataIndx: 'COMP_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '직책', align: 'center', dataType: 'string', dataIndx: 'COMP_NUM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '전화번호', align: 'center', dataType: 'string', dataIndx: 'COMP_TYPE_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: 'EMAIL', align: 'center', dataType: 'string', dataIndx: 'CHARGE_USER_ID',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '비고', align: 'center', dataType: 'string', dataIndx: 'COMP_TEL',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '담당자 여부', align: 'center', dataType: 'string', dataIndx: 'STAFF_EMAIL',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            }
        ];
        systemCompanyRegisterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '담당자 리스트', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                },
                {
                    type: 'button', label: 'ADD', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $('#system_company_popup').modal('show');
                        }
                    },
                },
                {
                    type: 'button', label: 'DLETE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $('#system_company_popup').modal('show');
                        }
                    },
                }
            ]
        };
        systemCompanyRegisterObj = {
            // width: 700,
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            numberCell: {title: '<br>No.', styleHead: {'vertical-align':'middle', 'padding-top':'10px'}}, scrollModel: {autoFit: true}, trackModel: {on: true},
            colModel: systemCompanyRegisterColModel, toolbar: systemCompanyRegisterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#company-master-search-form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    companyRegisterSelectedRowIndex = [];
                    var firstRow = ui.selection.iCells.ranges[0].r1;
                    var lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) {
                        companyRegisterSelectedRowIndex[0] = firstRow;
                    } else {
                        for (var i = firstRow; i <= lastRow; i++) {
                            companyRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
    });
</script>

