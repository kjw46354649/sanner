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
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">업체 상세 정보</h4>
            </div>
            <div class="modal-body">
                <form class="" role="form" id="company_master_register_form" name="company_master_register_form">
                    <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterStaffList">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <section class="bg-light">
                            <div class="panel-body">
                                <div class="form-inline" role="form">
                                    <div class="checkbox m-l m-r-xs">
                                        <div class="col-sm-7">
                                            <label class="switch">
                                                <input type="checkbox" id="ACTIVE_YN" name="ACTIVE_YN" value="N">
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <input type="button" class="btn btn-s-md btn-danger" id="companyMasterRegisterSaveBtn" value="SAVE">
                                    <input type="button" class="btn btn-s-md btn-dark" id="companyMasterRegisterDelBtn" value="DELETE">
                                </div>
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
                                                        <input type="text" id="COMP_CD" name="COMP_CD" data-notblank="true" class="form-control" placeholder="회사코드" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">생성 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="INSERT_DT_NM" name="INSERT_DT" data-notblank="true" class="form-control" placeholder="생성일시" readonly>
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">최근거래 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="LAST_ORDER_DT_NM" name="LAST_ORDER_DT_NM" data-notblank="true" class="form-control" placeholder="최근거래일시" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">영업담당자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <select id="CHARGE_USER_ID" name="CHARGE_USER_ID" data-required="true" class="form-control parsley-validated">
                                                            <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">관계 구분</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <select id="COMP_KIND" name="COMP_KIND" data-required="true" class="form-control parsley-validated">
                                                            <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                                            <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                                                <option value="${vlocale.CODE_CD}" <c:if test="${fn:toUpperCase(LocalInfo) eq vlocale.CODE_CD}"> selected="selected"</c:if>>${vlocale.CODE_NM_KR}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">업체명</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_NM" name="COMP_NM" data-notblank="true" class="form-control" placeholder="업체명">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">업체종류</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <select id="COMP_TYPE" name="COMP_TYPE" data-required="true" class="form-control parsley-validated">
                                                            <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">대표자</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="CEO_NM" name="CEO_NM" data-notblank="true" class="form-control" placeholder="대표자">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">사업자 번호</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_NUM" name="COMP_NUM" data-notblank="true" class="form-control" placeholder="사업자 번호">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">E-MAIL</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_EMAIL" name="COMP_EMAIL" data-notblank="true" class="form-control" placeholder="E-MAIL">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">TEL.</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_TEL" name="COMP_TEL" data-notblank="true" class="form-control" placeholder="TEL">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">FAX</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_FAX" name="COMP_FAX" data-notblank="true" class="form-control" placeholder="FAX">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">사업장소재지</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" id="COMP_ADDRESS" name="COMP_ADDRESS" data-notblank="true" class="form-control" placeholder="사업장소재지">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">비고</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="text" id="NOTE" name="NOTE" class="form-control" placeholder="비고">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-12 col-sm-12">
                                                    <label class="col-md-2 col-sm-2 control-label">첨부파일</label>
                                                    <div class="col-md-10 col-sm-10">
                                                        <input type="hidden" id="ETC_GFILE_SEQ" name="ETC_GFILE_SEQ" value="">
                                                        <input type="text" id="ETC_GFILE_SEQ_NM" name="ETC_GFILE_SEQ_NM" class="form-control" placeholder="첨부파일" readonly>
                                                        <input type="button" id="compnay_etc_attach_file" name="compnay_etc_attach_file" value="fileUpload">
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
                                                <input type="hidden" id="LOGO_GFILE_SEQ" name="LOGO_GFILE_SEQ" value="">
                                                <img src="/image/999" id="LOGO_GFILE_SRC" width="200px" alt="..." class="img-circle m-b">
                                                <div class="">
                                                    <button type="button" class="btn btn-default" id="company_logo_upload" href="#" >
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
                                                <input type="hidden" id="SIGN_GFILE_SEQ" name="SIGN_GFILE_SEQ" value="">
                                                <img src="/image/999" id="SIGN_GFILE_SRC" width="200px" alt="..." class="img-circle m-b">
                                                <div class="">
                                                    <button type="button" class="btn btn-default" id="company_sign_upload" href="#" >
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
                    <form class="form-inline" id="company_master_search_form" name="company_master_search_form" role="form">
                        <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterList">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_KIND">대외구분</label>
                                <select id="SEL_COMP_KIND" name="SEL_COMP_KIND" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1049}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_TYPE">업체종류</label>
                                <select id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                </select>
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
                                <select id="SEL_ACTIVE_YN" name="SEL_ACTIVE_YN" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1045}">
                                        <option value="${vlocale.CODE_CD}" >${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3 text-right">
                                <div type="submit" id="companyMasterMainSearchBtn" class="btn btn-success btn-sm btn-default">SEARCH</div>
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
    let systemCompanyMasterPostData;
    let systemCompanyMasterToolbar;
    let systemCompanyMasterObj;
    let $systemCompanyMasterGrid;

    let systemCompanyRegisterGridId = 'system-company-register-popup-grid';
    let systemCompanyRegisterColModel;
    let systemCompanyRegisterPostData;
    let systemCompanyRegisterToolbar;
    let systemCompanyRegisterObj;
    let $systemCompanyRegisterGrid;

    let $systemCompanyRegisterSaveBtn = $("#companyMasterRegisterSaveBtn");
    let $systemCompanyRegisterDelBtn = $("#companyMasterRegisterDelBtn");
    let $companyMasterMainSearchBtn = $("#companyMasterMainSearchBtn");

    $(function () {
        'use strict';
        systemCompanyMasterPostData = fnFormToJsonArrayData('#company_master_search_form');
        systemCompanyMasterColModel = [
            {title: '관계구분', datatype: 'string', dataIndx: 'COMP_KIND_NM', editable: true,
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
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'},
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.SIGN_FILE_SEQ){
                        return '<i class="fa fa-image"></i>';
                    }else{
                        return '';
                    }
                }
            },
            {title: '직인', align: 'center', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'},
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.ETC_GFILE_SEQ){
                        return '<i class="fa fa-image"></i>';
                    }else{
                        return '';
                    }
                }
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
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            numberCell: {title: '<br>No.', styleHead: {'vertical-align':'middle', 'padding-top':'10px'}}, scrollModel: {autoFit: true}, trackModel: {on: true},
            colModel: systemCompanyMasterColModel, toolbar: systemCompanyMasterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: systemCompanyMasterPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowDblClick: function( event, ui ) {
                let rowData = ui.rowData;
                fnResetFrom("company_master_register_form");
                $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/999");
                $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/999");
                $("#company_master_register_form").find("#COMP_CD").val(rowData.COMP_CD);
                $('#system_company_popup').modal('show');
            }
        };
        $systemCompanyMasterGrid = $('#' + systemCompanyMasterGridId).pqGrid(systemCompanyMasterObj);

        $companyMasterMainSearchBtn.click(function(event){
            $systemCompanyMasterGrid = $('#' + systemCompanyMasterGridId).pqGrid(systemCompanyMasterObj);
            $systemCompanyMasterGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#company_master_search_form');
            } );
            $systemCompanyMasterGrid.pqGrid("refreshDataAndView");
        });

        systemCompanyRegisterPostData = fnFormToJsonArrayData('#company_master_register_form');
        systemCompanyRegisterColModel = [
            {title: '담당자명', datatype: 'string', dataIndx: 'STAFF_NM', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '직급', dataType: 'string', dataIndx: 'POSITION_NM', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '직책', align: 'center', dataType: 'string', dataIndx: 'JOB_TITLE', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '전화번호', align: 'center', dataType: 'string', dataIndx: 'STAFF_TEL', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: 'EMAIL', align: 'center', dataType: 'string', dataIndx: 'STAFF_EMAIL', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '비고', align: 'center', dataType: 'string', dataIndx: 'NOTE', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '담당자 여부', align: 'center', dataIndx: 'MAIN_YN', editable: true,
                styleHead: { 'text-align':'center','vertical-align':'middle'}, type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },

        ];

        systemCompanyRegisterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '담당자 리스트', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                },
                {
                    type: 'button', label: 'DELETE', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let staffDeleteQueryId = 'systemMapper.deleteCompanyMasterStaff';
                            fnDeletePQGrid($systemCompanyRegisterGrid, companyRegisterSelectedRowIndex, staffDeleteQueryId);
                        }
                    }
                },
                {
                    type: 'button', label: 'ADD', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $systemCompanyRegisterGrid.pqGrid('addNodes', [{"COMP_CD":$("#company_master_register_form").find("#COMP_CD").val(), "MAIN_YN":'N'}], 0);
                        }
                    }
                }
                ,
                {
                    type: 'button', label: 'SAVE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let systemCompanyRegisterInsertQueryList = ['systemMapper.insertCompanyMasterStaff'];
                            let systemCompanyRegisterUpdateQueryList = ['systemMapper.updateCompanyMasterStaff'];
                            fnModifyPQGrid($systemCompanyRegisterGrid, systemCompanyRegisterInsertQueryList, systemCompanyRegisterUpdateQueryList);
                        }
                    }
                }
            ]
        };
        systemCompanyRegisterObj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single', fireSelectChange: true},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: '<br>No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: systemCompanyRegisterColModel,
            toolbar: systemCompanyRegisterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect', recIndx: 'STAFF_SEQ',
                postData: systemCompanyRegisterPostData,
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                companyRegisterSelectedRowIndex = [];
                let selectList = ui.addList;
                for (let i = 0; i < selectList.length; i++) {
                    companyRegisterSelectedRowIndex.push(selectList[i].rowIndx);
                }
                // let rows = ui.rows;
                // if (rows && rows.length) {
                //     for (let i = 0; i < rows.length; i++) {
                //         companyRegisterSelectedRowIndex.push(rows[i].rowData.id);
                //     }
                //     console.log(ui.rows);
                // }
                // console.log(companyRegisterSelectedRowIndex);
                // Cell Selected
                // if (ui.selection.iCells.ranges[0] !== undefined) {
                //     companyRegisterSelectedRowIndex = [];
                //     let companyRegisterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                //     let companyRegisterGridLastRow = ui.selection.iCells.ranges[0].r2;
                //
                //     if (companyRegisterGridFirstRow === companyRegisterGridLastRow) {
                //         companyRegisterSelectedRowIndex[0] = companyRegisterGridFirstRow;
                //     } else {
                //         for (let i = companyRegisterGridFirstRow; i <= companyRegisterGridLastRow; i++) {
                //             companyRegisterSelectedRowIndex.push(i);
                //         }
                //     }
                // }
            }
        };

        $("#system_company_popup").on('show.bs.modal', function(){
            $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterInfo");
            let parameters = {
                'url': '/json-info',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;
                fnJsonDataToForm("company_master_register_form", dataInfo);
                // select 정보 셋팅
                $("#company_master_register_form").find("#COMP_KIND").trigger("change");
                $("#company_master_register_form").find("#COMP_TYPE").val(dataInfo.COMP_TYPE);
                $("#company_master_register_form").find("#ETC_GFILE_SEQ_NM").val(dataInfo.ETC_GFILE_SEQ_NM);
                $("#company_master_register_form").find("#ETC_GFILE_SEQ").val(dataInfo.ETC_GFILE_SEQ);
                $("#company_master_register_form").find("#LOGO_GFILE_SEQ").val(dataInfo.LOGO_GFILE_SEQ);
                $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/" + dataInfo.LOGO_GFILE_SEQ);
                $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(dataInfo.SIGN_GFILE_SEQ);
                $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + dataInfo.SIGN_GFILE_SEQ);

                $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterStaffList");
                if(dataInfo.ACTIVE_YN == "Y") $("#company_master_register_form").find("#ACTIVE_YN").trigger("click");
                $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
                $systemCompanyRegisterGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#company_master_register_form');
                } );
                $systemCompanyRegisterGrid.pqGrid("refreshDataAndView");
            }, parameters, '');
        });

        $("#system_company_popup").on('hide.bs.modal', function(){
            fnResetFrom("company_master_register_form");
            $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterInfo");
            $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/999");
            $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/999");
            $systemCompanyRegisterGrid.pqGrid('destroy');
            $companyMasterMainSearchBtn.trigger("click");
        });

        $systemCompanyRegisterSaveBtn.click(function(event){
            $("#company_master_register_form").find("#queryId").val("systemMapper.insertCompanyMaster");
            if($("#company_master_register_form").find("#COMP_CD").val() != ''){
                $("#company_master_register_form").find("#queryId").val("systemMapper.updateCompanyMaster");
            }
            let parameters = {
                'url': '/json-update',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                alert("저장이 완료 되었습니다.");
            }, parameters, '');
        });

        $systemCompanyRegisterDelBtn.click(function(event){
            $("#company_master_register_form").find("#queryId").val("systemMapper.deleteCompanyMaster");
            let parameters = {
                'url': '/json-update',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                alert(data);
            }, parameters, '');
        });

        $("#company_master_register_form").find("#ACTIVE_YN").click(function(event) {
            if ($(this).is(':checked')) {
                $(this).val('Y');
            }else {
                $(this).val('N');
            }
        });

        $("#company_master_search_form").find("#SEL_COMP_KIND").change(function(){
            let comptype = 0;
            if(this.value == "CLS010")
                comptype = '1042';
            else if(this.value == "CLS020")
                comptype = '1043';
            fnCommCodeDynamicSelectBoxCreate($("#company_master_search_form").find("#SEL_COMP_TYPE"), comptype, 'sel');
        });

        $("#company_master_register_form").find("#COMP_KIND").change(function(){
            let comptype = 0;
            if(this.value == "CLS010")
                comptype = '1042';
            else if(this.value == "CLS020")
                comptype = '1043';
            fnCommCodeDynamicSelectBoxCreate($("#company_master_register_form").find("#COMP_TYPE"), comptype, 'sel');
        });

        /** 공통 코드 이외의 처리 부분 **/
        let commonCodeBotGridId = 'dataSource.getUserList';
        let paramData = {"url":"/json-list", "data": {"queryId": commonCodeBotGridId}};
        // fnCommCodeDatasourceSelectBoxCreate($("#company_master_search_form").find("#SEL_STAFF_NM"), 'all', paramData);
        fnCommCodeDatasourceSelectBoxCreate($("#company_master_register_form").find("#CHARGE_USER_ID"), 'all', paramData);

        /** 업체 기타 파일 업로드 */
        $("#company_master_register_form").find("#compnay_etc_attach_file").click(function (e) {
            let companyEtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companyEtcFile.trigger("click");
            companyEtcFile.change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                        formData.append("file" + i, files[i]);
                    }
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        $("#company_master_register_form").find("#ETC_GFILE_SEQ_NM").val(fileInfo.ORGINAL_FILE_NM);
                        $("#company_master_register_form").find("#ETC_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData);
                }
            });
        });

        /** 로고 파일 파일 업로드 */
        $("#company_master_register_form").find("#company_logo_upload").click(function (e) {
            let companyEtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companyEtcFile.trigger("click");
            companyEtcFile.change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) formData.append("file" + i, files[i]);
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                        $("#company_master_register_form").find("#LOGO_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData);
                }
            });
        });

        /** 직인 파일 파일 업로드 */
        $("#company_master_register_form").find("#company_sign_upload").click(function (e) {
            let companyEtcFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companyEtcFile.trigger("click");
            companyEtcFile.change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) formData.append("file" + i, files[i]);
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                        $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData);
                }
            });
        });
    });
</script>

