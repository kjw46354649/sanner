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
                    <input type="hidden" id="staffGrid" name="staffGrid" value="">
                    <input type="hidden" id="compType" name="compType" value="">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <section class="bg-light">
                            <div class="panel-body">
                                <div class="form-inline" role="form">
                                   <%-- <div class="checkbox m-l m-r-xs">
                                        <div class="col-sm-7">
                                            <label class="switch">
                                                <input type="checkbox" id="ACTIVE_YN" name="ACTIVE_YN" value="N">
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>--%>
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
                                                    <label class="col-md-4 col-sm-4 control-label">활성여부</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="checkbox" id="ACTIVE_YN" name="ACTIVE_YN" value="Y">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">본사 여부</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="checkbox" id="FAMILY_COMPANY_YN" name="FAMILY_COMPANY_YN" value="Y">
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">Company ID</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_CD" name="COMP_CD" data-notblank="true" class="form-control" placeholder="Company ID" readonly>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">생성 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="INSERT_DT" name="INSERT_DT" data-notblank="true" class="form-control" placeholder="생성일시" readonly>
                                                    </div>
                                                </div>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">최근거래 일시</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="LAST_ORDER_DT" name="LAST_ORDER_DT" data-notblank="true" class="form-control" placeholder="최근거래일시" readonly>
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

                                                <%-- 시작 --%>
                                                <div class="line line-dashed b-b pull-in"></div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">업체명</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="COMP_NM" name="COMP_NM" data-notblank="true" class="form-control" placeholder="업체명">
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
                                                    <label class="col-md-4 col-sm-4 control-label">업태</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="BUSINESS_TYPE" name="BUSINESS_TYPE" data-notblank="true" class="form-control" placeholder="업태">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="col-md-4 col-sm-4 control-label">종목</label>
                                                    <div class="col-md-8 col-sm-8">
                                                        <input type="text" id="BUSINESS_ITEM" name="BUSINESS_ITEM" data-notblank="true" class="form-control" placeholder="종목">
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
                                                <%-- 끝 --%>




<%--                                                <div class="line line-dashed b-b pull-in"></div>--%>
<%--                                                <div class="form-group col-md-6 col-sm-6">--%>
<%--                                                    <label class="col-md-4 col-sm-4 control-label">관계 구분</label>--%>
<%--                                                    <div class="col-md-8 col-sm-8">--%>
<%--                                                        <select id="COMP_KIND" name="COMP_KIND" data-required="true" class="form-control parsley-validated">--%>
<%--                                                            <option value=""><spring:message code="com.form.top.sel.option" /></option>--%>
<%--                                                            <c:forEach var="vlocale" items="${HighCode.H_1049}">--%>
<%--                                                                <option value="${vlocale.CODE_CD}" <c:if test="${fn:toUpperCase(LocalInfo) eq vlocale.CODE_CD}"> selected="selected"</c:if>>${vlocale.CODE_NM_KR}</option>--%>
<%--                                                            </c:forEach>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                   <div class="line line-dashed b-b pull-in"></div>--%>
<%--                                                <div class="form-group col-md-6 col-sm-6">--%>
<%--                                                    <label class="col-md-4 col-sm-4 control-label">업체종류</label>--%>
<%--                                                    <div class="col-md-8 col-sm-8">--%>
<%--                                                        <select id="COMP_TYPE" name="COMP_TYPE" data-required="true" class="form-control parsley-validated">--%>
<%--                                                            <option value=""><spring:message code="com.form.top.sel.option" /></option>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>




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
                                            <strong>담당자 정보</strong>
                                        </header>
                                        <%-- staff grid --%>
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

                        <%-- 발주업체 grid --%>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>발주업체 종류</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-type1-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <%-- 협력업체 가공 grid --%>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>협력업체 가공 종류</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-type2-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <%-- 협력업체 소재 grid --%>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>협력업체 소재 종류</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-type3-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <%-- 협력업체 표면처리 grid --%>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>협력업체 표면처리 종류</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-type4-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <%-- 협력업체 후가공 grid --%>
                        <section class="bg-light">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="panel panel-default">
                                        <header class="panel-heading">
                                            <strong>협력업체 후가공 종류</strong>
                                        </header>
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="gridWrap">
                                                    <div id="system-company-type5-popup-grid" class="jqx-refresh"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </form>
                <form class="" role="form" id="company_master_type1_form" name="company_master_type1_form">

                    <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterStaffList">
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
                                <label class="control-label" for="SEL_COMP_KIND">관계구분</label>
                                <select id="SEL_COMP_KIND" name="SEL_COMP_KIND" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1046}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="SEL_COMP_TYPE">업체종류</label>
                                <select id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" data-required="true" class="form-control parsley-validated">
                                    <option value=""><spring:message code="com.form.top.all.option" /></option>
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
                                    <c:forEach var="vlocale" items="${HighCode.H_1042}">
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

/**  선언 **/
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

    //발주업체 그리드
    let type1GridId = 'system-company-type1-popup-grid';
    let type1ColModel;
    let type1PostData;
    let type1Toolbar;
    let type1Obj;
    let $type1Grid;

    //협력업체 가공 그리드
    let type2GridId = 'system-company-type2-popup-grid';
    let type2ColModel;
    let type2PostData;
    let type2Toolbar;
    let type2Obj;
    let $type2Grid;

    //협력업체 소재 그리드
    let type3GridId = 'system-company-type3-popup-grid';
    let type3ColModel;
    let type3PostData;
    let type3Toolbar;
    let type3Obj;
    let $type3Grid;

    //협력업체 표면처리 그리드
    let type4GridId = 'system-company-type4-popup-grid';
    let type4ColModel;
    let type4PostData;
    let type4Toolbar;
    let type4Obj;
    let $type4Grid;

    //협력업체 후가공 그리드
    let type5GridId = 'system-company-type5-popup-grid';
    let type5ColModel;
    let type5PostData;
    let type5Toolbar;
    let type5Obj;
    let $type5Grid;



    let $systemCompanyRegisterSaveBtn = $("#companyMasterRegisterSaveBtn");
    let $systemCompanyRegisterDelBtn = $("#companyMasterRegisterDelBtn");
    let $companyMasterMainSearchBtn = $("#companyMasterMainSearchBtn");

    $(function () {
        'use strict';

/**  업체리스트 그리드 선언 시작 **/

        systemCompanyMasterPostData = fnFormToJsonArrayData('#company_master_search_form');
        systemCompanyMasterColModel = [
            {title: '업체명', dataType: 'string', dataIndx: 'COMP_NM',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '발주업체YN', dataType: 'string', dataIndx: 'ORDER_COMPANY_YN', hidden:true},
            {title: '발주업체<br>여부', dataType: 'string', dataIndx: 'ORDER_COMPANY_INFO',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '협력업체YN', dataType: 'string', dataIndx: 'CO_COMPANY_YN', hidden:true},
            {title: '협력업체<br>여부', dataType: 'string', dataIndx: 'CO_COMPANY_INFO',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '사업자<br>등록번호', align: 'center', dataType: 'string', dataIndx: 'COMP_NUM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '업태', align: 'center', dataType: 'string', dataIndx: 'BUSINESS_TYPE',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '종목', align: 'center', dataType: 'string', dataIndx: 'BUSINESS_ITEM',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '전화번호', align: 'center', dataType: 'string', dataIndx: 'COMP_TEL',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '담당자<br>(Email)', align: 'center', dataType: 'string', dataIndx: 'MAIN_STAFF_INFO',
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
            {title: '로고', align: 'center', dataType: 'string', dataIndx: 'LOGO_FILE_YN',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'},
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.LOGO_FILE_YN == 'Y'){
                        return '<i class="fa fa-image"></i>';
                    }else{
                        return '';
                    }
                }
            },
            {title: '직인', align: 'center', dataType: 'string', dataIndx: 'SIGN_FILE_YN',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'},
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.SIGN_FILE_YN  == 'Y'){
                        return '<i class="fa fa-image"></i>';
                    }else{
                        return '';
                    }
                }
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: 'ETC_FILE_YN',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'},
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.ETC_FILE_YN  == 'Y'){
                        return '#';
                    }else{
                        return '';
                    }
                }
            },
            {title: '최근거래<br>일시', align: 'center', dataType: 'string', dataIndx: 'LAST_BUSINESS_DT',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '등록일시', align: 'center', ataType: 'string', dataIndx: 'INSERT_DT',
                styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
            },
            {title: '업데이트<br>일시', align: 'center', dataType: 'string', dataIndx: 'UPDATE_DT',
                styleHead: { 'text-align':'center','vertical-align':'middle'}
            },
            {title: '활성<br>여부', align: 'center', dataType: 'string', dataIndx: 'ACTIVE_YN',
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
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            scrollModel: {autoFit: true}, trackModel: {on: true},
            columnTemplate: {
                align: 'center',
                halign: 'center',
                hvalign: 'center' //to vertically center align the header cells.
            },
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

/**  업체리스트 그리드 선언 종료 **/

/**  업체상세 그리드 선언 시작 **/

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
                            $systemCompanyRegisterGrid.pqGrid('deleteRow', {'rowIndx': companyRegisterSelectedRowIndex});//rowIndx
                            //$systemCompanyRegisterGrid.pqGrid('deleteRow', {rowList: companyRegisterSelectedRowIndex});//rowIndx
                            // $systemCompanyRegisterGrid.setSelection({ rowList: companyRegisterSelectedRowIndex });
                            /*let staffDeleteQueryId = 'systemMapper.deleteCompanyMasterStaff';
                            fnDeletePQGrid($systemCompanyRegisterGrid, companyRegisterSelectedRowIndex, staffDeleteQueryId);
                            fnAlertMessageAutoClose('remove');*/
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
                /*,
                {
                    type: 'button', label: 'SAVE', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let systemCompanyRegisterInsertQueryList = ['systemMapper.insertCompanyMasterStaff'];
                            let systemCompanyRegisterUpdateQueryList = ['systemMapper.updateCompanyMasterStaff'];

                            /!*let dataColumn = ['STAFF_NM', 'POSITION_NM'];
                            let data = $systemCompanyRegisterGrid.pqGrid("getData", {dataIndx: dataColumn});*!/
                            return;
                            //추가 또는 수정된 값이 있으면 true
                            /!*if (gridInstance.isDirty()) {
                                var changes = gridInstance.getChanges({format: 'byVal'});
                                var QUERY_ID_ARRAY = {
                                    'insertQueryId': insertQueryList,
                                    'updateQueryId': updateQueryList,
                                };
                                changes.queryIdList = QUERY_ID_ARRAY;
                                parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}}

                                fnPostAjax(function (data, callFunctionParam) {
                                    grid.pqGrid('refreshDataAndView');
                                }, parameters, '');
                            }*!/



                            // fnModifyPQGrid($systemCompanyRegisterGrid, systemCompanyRegisterInsertQueryList, systemCompanyRegisterUpdateQueryList);
                            // fnAlertMessageAutoClose('save');
                        }
                    }
                }*/
            ]
        };
        systemCompanyRegisterObj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single', fireSelectChange: true},
            //selectionModel: { type: 'cell', mode: 'multiple'} ,
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: systemCompanyRegisterColModel,
            toolbar: systemCompanyRegisterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect', recIndx: 'STAFF_SEQ',
                postData: systemCompanyRegisterPostData,
                getData: function (dataJSON) {
                    console.log();
                    return {data: dataJSON.data};
                }
            },
           /* selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    companyRegisterSelectedRowIndex = [];
                    let firstRow = ui.selection.iCells.ranges[0].r1;
                    let lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) {
                        companyRegisterSelectedRowIndex[0] = firstRow;
                    } else {
                        for (let i = firstRow; i <= lastRow; i++) {
                            companyRegisterSelectedRowIndex.push(i);
                        }
                    }
                }
            }*/
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

/**  업체상세 그리드 선언 끝 **/

/**  업체 타입 발주업체 그리드 선언 시작 **/

        type1PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type1ColModel = [
            {title: '적용 여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: 'COMP_TYPE', datatype: 'string', dataIndx: 'COMP_TYPE', editable: true, hidden: true},
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        type1Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '발주업체 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                }
            ]
        };

        type1Obj = {
            height: 230, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type1ColModel,
            toolbar: type1Toolbar,
            beforeCheck:function (evt, ui) {
                var rowIndx = ui.rowIndx, grid = this;
                //var cb = grid.Checkbox('APPLY_YN');
                //cb.unCheckAll();
                let data = $type1Grid.pqGrid('option', 'dataModel.data');
                if(data != null){
                    let totalRecords = data.length;
                    for(let tempI=0; tempI<totalRecords; tempI++){
                        $type1Grid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'APPLY_YN': 'N' } });
                    }
                    console.log("beforeCheck");
                }

            },
            check: function (evt, ui) {
                console.log("check");
            }

        };
/**  업체 타입 발주업체 그리드 선언 끝 **/

/**  업체 타입 협력업체 그리드 선언 시작 **/

        type2PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type2ColModel = [
            {title: '적용 여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '업체코드', datatype: 'string', dataIndx: 'COMP_CD', editable: true, hidden: true},
            {title: 'COMP_TYPE', datatype: 'string', dataIndx: 'COMP_TYPE', editable: true, hidden: true},
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        type2Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '협력업체 가공 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                }
            ]
        };
        type2Obj = {
            height: 230, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type2ColModel,
            toolbar: type2Toolbar,
            dataModel: {dataType: 'json', data: {}},
            beforeCheck:function (evt, ui) {
                var rowIndx = ui.rowIndx, grid = this;
                let data = $type2Grid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let tempI=0; tempI<totalRecords; tempI++){
                    $type2Grid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'APPLY_YN': 'N' } });
                }
            }
        };

        type3PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type3ColModel = [
            {title: '적용 여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '업체코드', datatype: 'string', dataIndx: 'COMP_CD', editable: true, hidden: true},
            {title: 'COMP_TYPE', datatype: 'string', dataIndx: 'COMP_TYPE', editable: true, hidden: true},
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        type3Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '협력업체 소재 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                }
            ]
        };
        type3Obj = {
            height: 230, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type3ColModel,
            toolbar: type3Toolbar,
            dataModel: {dataType: 'json', data: {}},
            beforeCheck:function (evt, ui) {
                var rowIndx = ui.rowIndx, grid = this;
                let data = $type3Grid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let tempI=0; tempI<totalRecords; tempI++){
                    $type3Grid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'APPLY_YN': 'N' } });
                }
            }
        };

        type4PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type4ColModel = [
            {title: '적용 여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '업체코드', datatype: 'string', dataIndx: 'COMP_CD', editable: true, hidden: true},
            {title: 'COMP_TYPE', datatype: 'string', dataIndx: 'COMP_TYPE', editable: true, hidden: true},
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        type4Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '협력업체 표면처리 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                }
            ]
        };
        type4Obj = {
            height: 230, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type4ColModel,
            toolbar: type4Toolbar,
            dataModel: {dataType: 'json', data: {}},
            beforeCheck:function (evt, ui) {
                var rowIndx = ui.rowIndx, grid = this;
                let data = $type4Grid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let tempI=0; tempI<totalRecords; tempI++){
                    $type4Grid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'APPLY_YN': 'N' } });
                }
            }
        };

        type5PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type5ColModel = [
            {title: '적용 여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
                type: 'checkbox',
                cb: {
                    all: false, //header checkbox to affect checkboxes on all pages.
                    header: false, //for header checkbox.
                    check: "Y", //check the checkbox when cell value is "YES".
                    uncheck: "N" //uncheck when "NO".
                }
            },
            {title: '업체코드', datatype: 'string', dataIndx: 'COMP_CD', editable: true, hidden: true},
            {title: 'COMP_TYPE', datatype: 'string', dataIndx: 'COMP_TYPE', editable: true, hidden: true},
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        type5Toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '협력업체 후가공 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                }
            ]
        };
        type5Obj = {
            height: 230, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type5ColModel,
            toolbar: type5Toolbar,
            dataModel: {dataType: 'json', data: {}},
            beforeCheck:function (evt, ui) {
                var rowIndx = ui.rowIndx, grid = this;
                let data = $type4Grid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                for(let tempI=0; tempI<totalRecords; tempI++){
                    $type5Grid.pqGrid("updateRow", { 'rowIndx': tempI , row: { 'APPLY_YN': 'N' } });
                }
            }
        };
        /**  업체 타입 발주업체 그리드 선언 끝 **/



        // 업체리스트 검색
        $companyMasterMainSearchBtn.click(function(event){
            $systemCompanyMasterGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('#company_master_search_form');
            } );
            $systemCompanyMasterGrid.pqGrid("refreshDataAndView");
            fnAlertMessageAutoClose('save');
        });

/**  EVENT **/
        // 업체상세 모달 open
        $("#SEL_COMP_NM, #SEL_COMP_NUM, #SEL_STAFF_NM, #SEL_CEO_NM").on('keydown', function(key){
            if (key.keyCode == 13) {
                $companyMasterMainSearchBtn.trigger("click");
            }
        });


        // 업체상세 모달 open
        $("#system_company_popup").on('show.bs.modal', function(){
            $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterInfo");
            let parameters = {
                'url': '/json-info',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                let dataInfo = data.info;

                //if(dataInfo == null || "" == dataInfo.COMP_CD) {
                if(false) {
                }else{
                    console.log("fnJsonDataToForm 1");
                    if(dataInfo == null || "" == dataInfo.COMP_CD) {
                        fnResetFrom("company_master_register_form");
                    }else{
                        fnJsonDataToForm("company_master_register_form", dataInfo);

                        console.log("fnJsonDataToForm 2");
                        //READONLY
                        $("#company_master_register_form").find("#COMP_CD").attr("readonly", true);

                        // select 정보 셋팅
                        // $("#company_master_register_form").find("#COMP_KIND").trigger("change");
                        // $("#company_master_register_form").find("#COMP_TYPE").val(dataInfo.COMP_TYPE);
                        $("#company_master_register_form").find("#ETC_GFILE_SEQ_NM").val(dataInfo.ETC_GFILE_SEQ_NM);
                        $("#company_master_register_form").find("#ETC_GFILE_SEQ").val(dataInfo.ETC_GFILE_SEQ);
                        $("#company_master_register_form").find("#LOGO_GFILE_SEQ").val(dataInfo.LOGO_GFILE_SEQ);
                        $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/" + dataInfo.LOGO_GFILE_SEQ);
                        $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(dataInfo.SIGN_GFILE_SEQ);
                        $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + dataInfo.SIGN_GFILE_SEQ);
                        if(dataInfo.ACTIVE_YN == "Y") {
                            $("#company_master_register_form").find("#ACTIVE_YN").trigger("click");
                        }
                        if(dataInfo.FAMILY_COMPANY_YN == "Y") {
                            $("#company_master_register_form").find("#FAMILY_COMPANY_YN").prop('checked', true);
                        }
                    }


                    $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterStaffList");
                    $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
                    $systemCompanyRegisterGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('#company_master_register_form');
                    } );
                    $systemCompanyRegisterGrid.pqGrid("refreshDataAndView");


                    //발주업체
                    $type1Grid = $('#' + type1GridId).pqGrid(type1Obj);
                    let type1List = new Array() ;
                    <c:forEach var="vlocale" items="${HighCode.H_1024}">
                        var data1 = new Object() ;
                        data1.COMP_TYPE = '${vlocale.CODE_CD}' ;
                        data1.HIGH_TYPE = '${vlocale.HIGH_CD}' ;
                        data1.COMP_TYPE_NM = '${vlocale.CODE_NM_KR}' ;
                            // console.log("dataInfo.H_VAL_1024==" + dataInfo.H_VAL_1024);
                        if(dataInfo != null && dataInfo.H_VAL_1024 == data1.COMP_TYPE ){
                            data1.APPLY_YN = 'Y' ;
                        }else{
                            data1.APPLY_YN = 'N' ;
                        }

                        type1List.push(data1) ;
                    </c:forEach>
                    //console.log(JSON.stringify(type1List));
                    $type1Grid.pqGrid( "option", "dataModel.data",  type1List );
                    $type1Grid.pqGrid("refreshDataAndView");

                    //협력업체 가공 그리드
                    $type2Grid = $('#' + type2GridId).pqGrid(type2Obj);
                    let type2List = new Array() ;
                    <c:forEach var="vlocale" items="${HighCode.H_1001}">
                    var data2 = new Object() ;
                    //data2.COMP_CD = dataInfo.COMP_CD ;
                    data2.COMP_TYPE = '${vlocale.CODE_CD}' ;
                    data2.HIGH_TYPE = '${vlocale.HIGH_CD}' ;
                    data2.COMP_TYPE_NM = '${vlocale.CODE_NM_KR}' ;
                    if(dataInfo != null && dataInfo.H_VAL_1001 == data2.COMP_TYPE ){
                        data2.APPLY_YN = 'Y' ;
                    }else{
                        data2.APPLY_YN = 'N' ;
                    }
                    type2List.push(data2) ;
                    </c:forEach>
                    $type2Grid.pqGrid( "option", "dataModel.data",  type2List );
                    $type2Grid.pqGrid("refreshDataAndView");

                    //협력업체 소재 그리드
                    $type3Grid = $('#' + type3GridId).pqGrid(type3Obj);
                    let type3List = new Array() ;
                    <c:forEach var="vlocale" items="${HighCode.H_1002}">
                    var data3 = new Object() ;
                   // data3.COMP_CD = dataInfo.COMP_CD ;
                    data3.COMP_TYPE = '${vlocale.CODE_CD}' ;
                    data3.HIGH_TYPE = '${vlocale.HIGH_CD}' ;
                    data3.COMP_TYPE_NM = '${vlocale.CODE_NM_KR}' ;
                    if(dataInfo != null && dataInfo.H_VAL_1002 == data3.COMP_TYPE ){
                        data3.APPLY_YN = 'Y' ;
                    }else{
                        data3.APPLY_YN = 'N' ;
                    }

                    type3List.push(data3) ;
                    </c:forEach>
                    $type3Grid.pqGrid( "option", "dataModel.data",  type3List );
                    $type3Grid.pqGrid("refreshDataAndView");


                    //협력업체 표면처리 그리드
                    $type4Grid = $('#' + type4GridId).pqGrid(type4Obj);
                    let type4List = new Array() ;
                    <c:forEach var="vlocale" items="${HighCode.H_1003}">
                    var data4 = new Object() ;
                   // data4.COMP_CD = dataInfo.COMP_CD ;
                    data4.COMP_TYPE = '${vlocale.CODE_CD}' ;
                    data4.HIGH_TYPE = '${vlocale.HIGH_CD}' ;
                    data4.COMP_TYPE_NM = '${vlocale.CODE_NM_KR}' ;
                    if(dataInfo != null && dataInfo.H_VAL_1003 == data4.COMP_TYPE ){
                        data4.APPLY_YN = 'Y' ;
                    }else{
                        data4.APPLY_YN = 'N' ;
                    }

                    type4List.push(data4) ;
                    </c:forEach>
                    $type4Grid.pqGrid( "option", "dataModel.data",  type4List );
                    $type4Grid.pqGrid("refreshDataAndView");

                    //협력업체 후가공 그리드
                    $type5Grid = $('#' + type5GridId).pqGrid(type5Obj);
                    let type5List = new Array() ;
                    <c:forEach var="vlocale" items="${HighCode.H_1004}">
                    var data5 = new Object() ;
                    //data5.COMP_CD = dataInfo.COMP_CD ;
                    data5.COMP_TYPE = '${vlocale.CODE_CD}' ;
                    data5.HIGH_TYPE = '${vlocale.HIGH_CD}' ;
                    data5.COMP_TYPE_NM = '${vlocale.CODE_NM_KR}' ;
                    if(dataInfo != null && dataInfo.H_VAL_1004 == data5.COMP_TYPE ){
                        data5.APPLY_YN = 'Y' ;
                    }else{
                        data5.APPLY_YN = 'N' ;
                    }

                    type5List.push(data5) ;
                    </c:forEach>
                    $type5Grid.pqGrid( "option", "dataModel.data",  type5List );
                    $type5Grid.pqGrid("refreshDataAndView");


                }
            }, parameters, '');
        });

        // 업체상세 모달 hide
        $("#system_company_popup").on('hide.bs.modal', function(){
            fnResetFrom("company_master_register_form");
            $("#company_master_register_form").find("#queryId").val("systemMapper.getCompanyMasterInfo");
            $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/999");
            $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/999");

            $systemCompanyRegisterGrid.pqGrid('destroy');

            $type1Grid.pqGrid('destroy');

            $type2Grid.pqGrid('destroy');

            $type3Grid.pqGrid('destroy');

            $type4Grid.pqGrid('destroy');

            $type5Grid.pqGrid('destroy');

            // $companyMasterMainSearchBtn.trigger("click");
        });

        // 업체상세 모달 save
        $systemCompanyRegisterSaveBtn.click(function(event){

            /*$("#company_master_register_form").find("#queryId").val("systemMapper.insertCompanyMaster");
            if($("#company_master_register_form").find("#COMP_CD").val() != ''){
                $("#company_master_register_form").find("#queryId").val("systemMapper.updateCompanyMaster");
            }
            let parameters = {
                'url': '/json-update',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnAlertMessageAutoClose('save');
            }, parameters, '');
            */

            // 그리드 데이터 폼에 넣기 to-do
            var gridInstance = $systemCompanyRegisterGrid.pqGrid('getInstance').grid;
            var changes = gridInstance.getChanges({format: 'byVal'});
            $("#company_master_register_form").find("#staffGrid").val(JSON.stringify(changes));

            let result =  "";

            // 업체종류 하나에 담기
            let data_1 = $type1Grid.pqGrid('option', 'dataModel.data');
            let totalRecords_1 = data_1.length;

            for(let tempI=0; tempI<totalRecords_1; tempI++){

                let rowData1 = $type1Grid.pqGrid("getRowData", {rowIndx: tempI});
                let APPLY_YN1 = rowData1["APPLY_YN"];
                let COMP_TYPE1 = rowData1["COMP_TYPE"];
                let HIGH_TYPE1 = rowData1["HIGH_TYPE"];

                if(APPLY_YN1 == 'Y'){
                    result +=  COMP_TYPE1 + "|" + HIGH_TYPE1 +",";
                }
            }
            //협력업체 가공 그리드
            let data2 = $type2Grid.pqGrid('option', 'dataModel.data');
            let totalRecords2= data2.length;
            for(let tempI=0; tempI<totalRecords2; tempI++){

                let rowData2 = $type2Grid.pqGrid("getRowData", {rowIndx: tempI});
                let APPLY_YN2 = rowData2["APPLY_YN"];
                let COMP_TYPE2 = rowData2["COMP_TYPE"];
                let HIGH_TYPE2 = rowData2["HIGH_TYPE"];

                if(APPLY_YN2 == 'Y'){
                    result +=  COMP_TYPE2 + "|" + HIGH_TYPE2 +",";
                }
            }

            //협력업체 소재 그리드
            let data3 = $type3Grid.pqGrid('option', 'dataModel.data');
            let totalRecords3= data3.length;
            for(let tempI=0; tempI<totalRecords3; tempI++){

                let rowData3 = $type3Grid.pqGrid("getRowData", {rowIndx: tempI});
                let APPLY_YN3 = rowData3["APPLY_YN"];
                let COMP_TYPE3 = rowData3["COMP_TYPE"];
                let HIGH_TYPE3 = rowData3["HIGH_TYPE"];

                if(APPLY_YN3 == 'Y'){
                    result +=  COMP_TYPE3 + "|" + HIGH_TYPE3 +",";
                }
            }

            //협력업체 표면처리 그리드
            let data4 = $type4Grid.pqGrid('option', 'dataModel.data');
            let totalRecords4= data4.length;
            for(let tempI=0; tempI<totalRecords4; tempI++){

                let rowData4 = $type4Grid.pqGrid("getRowData", {rowIndx: tempI});
                let APPLY_YN4 = rowData4["APPLY_YN"];
                let COMP_TYPE4 = rowData4["COMP_TYPE"];
                let HIGH_TYPE4 = rowData4["HIGH_TYPE"];

                if(APPLY_YN4 == 'Y'){
                    result +=  COMP_TYPE4 + "|" + HIGH_TYPE4 +",";
                }
            }

            //협력업체 후가공 그리드
            let data5 = $type5Grid.pqGrid('option', 'dataModel.data');
            let totalRecords5= data5.length;
            for(let tempI=0; tempI<totalRecords5; tempI++){

                let rowData5 = $type5Grid.pqGrid("getRowData", {rowIndx: tempI});
                let APPLY_YN5 = rowData5["APPLY_YN"];
                let COMP_TYPE5 = rowData5["COMP_TYPE"];
                let HIGH_TYPE5 = rowData5["HIGH_TYPE"];

                if(APPLY_YN5 == 'Y'){
                    result +=  COMP_TYPE5 + "|" + HIGH_TYPE5 +",";
                }
            }




            result = result.substring(0, result.length-1);

            $("#company_master_register_form").find("#compType").val(result);
            console.log($("#company_master_register_form").find("#compType").val());


            let parameters = {
                'url': '/managerSystemCompany',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                alert('이제 처리하자. 성공메세지는 공통에서 처리한다더라.');
                $('#system_company_popup').modal('hide');
                $companyMasterMainSearchBtn.trigger("click");
            }, parameters, '');
        });

        // 업체상세 모달 delete
        $systemCompanyRegisterDelBtn.click(function(event){
            $("#company_master_register_form").find("#queryId").val("systemMapper.deleteCompanyMaster");
            let parameters = {
                'url': '/json-update',
                'data': $('#company_master_register_form').serialize()
            };
            fnPostAjax(function (data, callFunctionParam) {
                fnAlertMessageAutoClose('remove');
            }, parameters, '');
            alert("스태프랑 종류도 다 지워?");
        });

        // 업체상세 모달 활성여부
        $("#company_master_register_form").find("#ACTIVE_YN").click(function(event) {
            if ($(this).is(':checked')) {
                $(this).val('Y');
            }else {
                $(this).val('N');
            }
        });
        $("#company_master_register_form").find("#FAMILY_COMPANY_YN").click(function(event) {
            if ($(this).is(':checked')) {
                $(this).val('Y');
            }else {
                $(this).val('N');
            }
        });

        //검색조건 관계구분 수정시
        $("#company_master_search_form").find("#SEL_COMP_KIND").change(function(){
            let comptype = 0;
            if(this.value == "CLS010"){
                comptype = '1024';
            }else if(this.value == "CLS020"){
                comptype = '1041';
            }
            fnCommCodeDynamicSelectBoxCreate($("#company_master_search_form").find("#SEL_COMP_TYPE"), comptype, 'all');
        });


        /*$("#company_master_register_form").find("#COMP_KIND").change(function(){
            let comptype = 0;
            if(this.value == "CLS010")
                comptype = '1024';
            else if(this.value == "CLS020")
                comptype = '1041';
            fnCommCodeDynamicSelectBoxCreate($("#company_master_register_form").find("#COMP_TYPE"), comptype, 'all');
        });*/

        /** SelectBox 초기화 **/
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
                    }, formData, '');
                }
            });
        });

        /** 로고 파일 파일 업로드 */
        $("#company_master_register_form").find("#company_logo_upload").click(function (e) {
            let companyLogoFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companyLogoFile.trigger("click");
            companyLogoFile.change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) formData.append("file" + i, files[i]);
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        $("#company_master_register_form").find("#LOGO_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                        $("#company_master_register_form").find("#LOGO_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData, '');
                }
            });
        });

        /** 직인 파일 파일 업로드 */
        $("#company_master_register_form").find("#company_sign_upload").click(function (e) {
            let companySignFile = $("#common_formdata_multi_upload_form").find("#click_singfile_chose_btn");
            companySignFile.trigger("click");
            companySignFile.change(function () {
                var input = $(this);
                var files = input.get(0).files;
                if (files.length > 0) {
                    let formData = new FormData();
                    for (var i = 0; i < files.length; i++) formData.append("file" + i, files[i]);
                    fnFormDataFileUploadAjax(function (data) {
                        let fileInfo = data.fileUploadList[0];
                        $("#company_master_register_form").find("#SIGN_GFILE_SRC").attr("src", "/image/" + fileInfo.GFILE_SEQ);
                        $("#company_master_register_form").find("#SIGN_GFILE_SEQ").val(fileInfo.GFILE_SEQ);
                    }, formData, '');
                }
            });
        });




    });
</script>

