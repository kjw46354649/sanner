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


<div class="page estimate machineWrap">
    <div class="topWrap">
        <form class="form-inline" id="company_master_search_form" name="company_master_search_form" role="form">
            <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterList">
            <div class="none_gubunWrap row2_topWrap">
                <ul>
                    <li>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_COMP_KIND">관계구분</label>
                            <select id="SEL_COMP_KIND" name="SEL_COMP_KIND" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1046}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                           <label class="label_100" for="SEL_COMP_TYPE">업체종류</label>
                            <select id="SEL_COMP_TYPE" name="SEL_COMP_TYPE" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                            </select>
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_COMP_NM">업체명</label>
                            <input type="text" class="wd_200 form-control" name="SEL_COMP_NM" id="SEL_COMP_NM" title="업체명" placeholder="업체명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_COMP_NUM">사업자번호</label>
                            <input type="text" class="wd_200 form-control" name="SEL_COMP_NUM" id="SEL_COMP_NUM" title="사업자번호" placeholder="사업자번호">
                        </span>
                        <span class="gubun"></span>

                    </li>
                    <li>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_STAFF_NM">담당자명</label>
                            <input type="text" class="wd_200" name="SEL_STAFF_NM" id="SEL_STAFF_NM" title="담당자명" placeholder="담당자명">
                        </span>
                        <span class="gubun"></span>
                        <span class="ipu_wrap">
                            <label class="label_100" for="SEL_CEO_NM">대표자명</label>
                            <input type="text" class="wd_200" name="SEL_CEO_NM" id="SEL_CEO_NM" title="대표자명" placeholder="대표자명">
                        </span>
                        <span class="gubun"></span>
                        <span class="slt_wrap">
                            <label class="label_100" for="SEL_ACTIVE_YN">활성여부</label>
                            <select id="SEL_ACTIVE_YN" name="SEL_ACTIVE_YN" data-required="true" class="wd_200">
                                <option value=""><spring:message code="com.form.top.all.option" /></option>
                                    <c:forEach var="vlocale" items="${HighCode.H_1042}">
                                        <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                                    </c:forEach>
                            </select>
                        </span>
                        <button type="button" class="right_float defaultBtn radius blue" id="companyMasterMainSearchBtn">검색</button>
                    </li>
                </ul>
            </div>
        </form>
        <%--<button type="button" class="topWrap_btn">펼치기 / 접기</button>--%>
    </div>
    <div class="bottomWrap row2_bottomWrap">
        <div class="hWrap">
            <div class="rightSpan">
                <button type="button" class="defaultBtn btn-120w" id="companyMasterMainNewBtn">신규등록</button>
            </div>
        </div>
        <div class="tableWrap" style="padding: 10px 0;">
            <div class="conWrap">
                <div id="system-company-master-grid" class="jqx-refresh"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="system-company-master-grid-total-records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="modal" id="system_company_popup" tabindex="-1" role="dialog" aria-hidden="true">--%>
<!-- layer popup : S -->
<div class="popup_container system_company_popup" id="system_company_popup" style="display: none;">
    <form class="form-inline" id="company_master_register_form" name="company_master_register_form" role="form">
        <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterStaffList">
        <input type="hidden" id="staffGrid" name="staffGrid" value="">
        <input type="hidden" id="compType" name="compType" value="">


        <div class="layerPopup sysCompPopup">
            <h3>업체상세정보</h3>
            <button type="button" class="pop_close mg-top10 mg-right8" id="system-company-pop-close2">닫기</button>
            <div class="qualityWrap">
                <div class="h_area">
                    <div class="right_sort ">
                        <button type="button" class="defaultBtn btn-120w red" id="companyMasterRegisterSaveBtn">저장</button>
                        <button type="button" class="defaultBtn btn-120w green" id="companyMasterRegisterDelBtn">삭제</button>
                    </div>

                </div>
                <div class="resultWrap99 list99" style="height: 440px;">
                    <div class="leftWrap mg-top15">
                        <input type="hidden" id="LOGO_GFILE_SEQ" name="LOGO_GFILE_SEQ" value="">
                        <img src="/image/999" id="LOGO_GFILE_SRC" width="388px" height="150px" alt="사진" style="border:1px solid #707070">
                        <div class="btnWrap">
                            <button type="button" id="company_logo_upload" class="defaultBtn">로고파일 업로드</button>
                        </div><br/>
                        <input type="hidden" id="SIGN_GFILE_SEQ" name="SIGN_GFILE_SEQ" value="">
                        <img src="/image/999" id="SIGN_GFILE_SRC" width="388px" height="150px" alt="사진" style="border:1px solid #707070">
                        <div class="btnWrap">
                            <button type="button" id="company_sign_upload" class="defaultBtn">직인파일 업로드</button>
                        </div>
                    </div>
                    <div class="rightWrap">
                        <table class="rowStyle">
                            <caption></caption>
                            <colgroup>
                                <col width="110px">
                                <col width="171px">
                                <col width="110px">
                                <col width="171px">
                            </colgroup>
                           <%-- <tr>
                                <th scope="row">Item ID</th>
                                <td id="EQUIP_ID_NM"></td>
                                <th scope="row">구분</th>
                                <td id="EQUIP_KIND_NM"></td>
                            </tr>--%>
                            <tr>
                                <th scope="row">활성여부</th>
                                <td><input type="checkbox" id="ACTIVE_YN" name="ACTIVE_YN" value="Y" class="wd_150"></td>
                                <th scope="row">본사여부</th>
                                <td><input type="checkbox" id="FAMILY_COMPANY_YN" name="FAMILY_COMPANY_YN" value="Y" class="wd_150"></td>
                            </tr>
                            <tr>
                                <th scope="row">업체ID</th>
                                <td>
                                    <input type="text" id="COMP_CD" name="COMP_CD" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="Company ID" readonly>
                                </td>
                                <th scope="row">생성일시</th>
                                <td>
                                    <input type="text" id="INSERT_DT" name="INSERT_DT" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="생성일시" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">최근거래일시</th>
                                <td>
                                    <input type="text" id="LAST_BUSINESS_DT" name="LAST_BUSINESS_DT" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="최근거래일시" readonly>
                                </td>
                                <th scope="row">영업담당자</th>
                                <td>
                                    <select id="CHARGE_USER_ID" name="CHARGE_USER_ID" data-required="true" class="wd_150">
                                        <option value=""><spring:message code="com.form.top.sel.option" /></option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">업체명</th>
                                <td>
                                    <input type="text" id="COMP_NM" name="COMP_NM" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="업체명">
                                </td>
                                <th scope="row">대표자</th>
                                <td>
                                    <input type="text" id="CEO_NM" name="CEO_NM" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="대표자">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">업태</th>
                                <td>
                                    <input type="text" id="BUSINESS_TYPE" name="BUSINESS_TYPE" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="업태">
                                </td>
                                <th scope="row">종목</th>
                                <td>
                                    <input type="text" id="BUSINESS_ITEM" name="BUSINESS_ITEM" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="종목">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">사업자번호</th>
                                <td>
                                    <input type="text" id="COMP_NUM" name="COMP_NUM" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="사업자번호">
                                </td>
                                <th scope="row">E-MAIL</th>
                                <td>
                                    <input type="text" id="COMP_EMAIL" name="COMP_EMAIL" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="E-MAIL">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">전화번호</th>
                                <td>
                                    <input type="text" id="COMP_TEL" name="COMP_TEL" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="전화번호">
                                </td>
                                <th scope="row">FAX</th>
                                <td>
                                    <input type="text" id="COMP_FAX" name="COMP_FAX" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="FAX">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">약어</th>
                                <td>
                                    <input type="text" id=" ABBR_NM" name=" ABBR_NM" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="약어">
                                </td>
                                <th scope="row">업체명2</th>
                                <td>
                                    <input type="text" id="COMP_NM2" name="COMP_NM2" value="" class="wd_150" data-notblank="true" class="form-control" placeholder="업체명2">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">사업장소재지</th>
                                <td colspan="3">
                                    <input type="text" id="COMP_ADDRESS" name="COMP_ADDRESS"  placeholder="사업장소재지" style="width:98%;">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비고</th>
                                <td colspan="3">
                                    <input type="text" id="NOTE" name="NOTE"  placeholder="비고" style="width:98%;">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td colspan="3">
                                    <input type="hidden" id="ETC_GFILE_SEQ" name="ETC_GFILE_SEQ" value="">
                                    <input type="text" id="ETC_GFILE_SEQ_NM" name="ETC_GFILE_SEQ_NM" placeholder="첨부파일" readonly style="width:71%;">
<%--                                    <input type="button" id="compnay_etc_attach_file" name="compnay_etc_attach_file" value="fileUpload" class="miniBtn blue">--%>
                                    <button type="button" class="miniBtn blue" id="compnay_etc_attach_file" name="compnay_etc_attach_file">업로드</button>
                                    <button type="button" class="miniBtn orange" id="compnay_etc_attach_file_download" name="compnay_etc_attach_file_download">다운로드</button>
                                </td>
                            </tr>


                        </table>
                    </div>
                </div>
                <div class="list98_330">
                    <h4 style="position: absolute;">담당자정보</h4>

                    <div class="right_sort_pop">
                      <button type="button" id="addSystemCompRegiBtn" class="defaultBtn radius ">Add</button>
                      <button type="button" id="deleteSystemCompRegiBtn" class="defaultBtn radius green ">Delete</button>
                    </div>
                    <ul class="conWrap">
                      <div id="system-company-register-popup-grid" class="jqx-refresh"></div>
                    </ul><br/>
                    <div class="tableWrap" style="height: 160px; overflow-y: auto;">

                            <ul class="conWrapPop">
                                <div id="system-company-type1-popup-grid" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPop">
                                <div id="system-company-type2-popup-grid" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPop">
                                <div id="system-company-type3-popup-grid" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPop">
                                <div id="system-company-type4-popup-grid" class="jqx-refresh"></div>
                            </ul>
                            <ul class="conWrapPop">
                                <div id="system-company-type5-popup-grid" class="jqx-refresh"></div>
                            </ul>

                    </div>
                </div>

            </div>
            <div class="btnWrap">
                 <button type="button" class="defaultBtn grayPopGra" id="system-company-pop-close">닫기</button>
             </div>
        </div>

</div>
<form class="" role="form" id="company_master_type1_form" name="company_master_type1_form">

    <input type="hidden" id="queryId" name="queryId" value="systemMapper.getCompanyMasterStaffList">
</form>
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
// styleHead: { 'text-align':'center','vertical-align':'middle','padding-top':'10px'}
        systemCompanyMasterPostData = fnFormToJsonArrayData('#company_master_search_form');
        systemCompanyMasterColModel = [
            {title: '업체명', dataType: 'string', dataIndx: 'COMP_NM', width: 92},
            {title: '발주업체YN', dataType: 'string', dataIndx: 'ORDER_COMPANY_YN', hidden:true},
            {title: '발주업체여부', dataType: 'string', dataIndx: 'ORDER_COMPANY_INFO', width: 92},
            {title: '협력업체YN', dataType: 'string', dataIndx: 'CO_COMPANY_YN', hidden:true},
            {title: '협력업체여부', dataType: 'string', dataIndx: 'CO_COMPANY_INFO', width: 162},
            {title: '사업자등록번호', align: 'center', dataType: 'string', dataIndx: 'COMP_NUM', width: 120},
            {title: '업태', align: 'center', dataType: 'string', dataIndx: 'BUSINESS_TYPE', width: 100},
            {title: '종목', align: 'center', dataType: 'string', dataIndx: 'BUSINESS_ITEM', width: 150},
            {title: '전화번호', align: 'center', dataType: 'string', dataIndx: 'COMP_TEL', width: 150},
            {title: '담당자(Email)', align: 'center', dataType: 'string', dataIndx: 'MAIN_STAFF_INFO',  width: 150},
            {title: '대표자', align: 'center', dataType: 'string', dataIndx: 'CEO_NM', width: 70},
            {title: '주소', align: 'center', dataType: 'string', dataIndx: 'COMP_ADDRESS', width: 350},
            {title: '비고', align: 'center', dataType: 'string', dataIndx: 'NOTE', width: 200},
            {title: '대표이메일', align: 'center', dataType: 'string', dataIndx: 'COMP_EMAIL', width: 150},
            {title: '로고', align: 'center', dataType: 'string', dataIndx: 'LOGO_GFILE_SEQ',
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if (ui.rowData['LOGO_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return '';
                }
            },
            {title: '직인', align: 'center', dataType: 'string', dataIndx: 'SIGN_GFILE_SEQ',
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if (ui.rowData['SIGN_GFILE_SEQ'] > 0) return "<i id='imageView' class='blueFileImageICon'></i>";
                    return '';
                }
            },
            {title: '기타', align: 'center', dataType: 'string', dataIndx: 'ETC_GFILE_SEQ', width: 40,
                render: function (ui) {
                    var rowData = ui.rowData, dataIndx = ui.dataIndx;
                    if(rowData.ETC_FILE_YN  == 'Y'){
                        return "<i id='imageView' class='blueFileImageICon'></i>";
                    }else{
                        return '';
                    }
                }
            },
            {title: '최근거래일시', align: 'center', dataType: 'string', dataIndx: 'LAST_BUSINESS_DT', width: 120},
            {title: '등록일시', align: 'center', ataType: 'string', dataIndx: 'INSERT_DT', width: 120},
            {title: '수정일시', align: 'center', dataType: 'string', dataIndx: 'UPDATE_DT', width: 120},
            {title: '활성여부', align: 'center', dataType: 'string', dataIndx: 'ACTIVE_YN', width: 50}
        ];
        // systemCompanyMasterToolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '업체 리스트', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         },
        //         {
        //             type: 'button', label: 'NEW COMPANY', icon: 'ui-icon-plus', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
        //                     $('#system_company_popup').modal('show');
        //                 }
        //             }
        //         }
        //     ]
        // };

        systemCompanyMasterObj = {
            width: '100%',
            height: 750, collapsible: false, resizable: false, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'}, editable : false,
            numberCell: {title: 'No.'}, dragColumns: {enabled: false},
            trackModel: {on: true},
            strNoRows: g_noData,
            columnTemplate: {
                align: 'center',
                valign: 'center' //to vertically center align the header cells.
            },
            colModel: systemCompanyMasterColModel,
            // toolbar: systemCompanyMasterToolbar,
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
            },
            cellClick: function (event, ui) {
                let rowIndx = ui.rowIndx, $grid = this;

                if (ui.dataIndx == 'LOGO_GFILE_SEQ') {
                    if (ui.rowData['LOGO_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.LOGO_GFILE_SEQ);
                    }
                    return;
                }
                if (ui.dataIndx == 'SIGN_GFILE_SEQ') {
                    if (ui.rowData['SIGN_GFILE_SEQ'] > 0) {
                        callWindowImageViewer(ui.rowData.SIGN_GFILE_SEQ);
                    }
                    return;
                }


            },
            complete: function () {
                let data = $systemCompanyMasterGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#system-company-master-grid-total-records').html(totalRecords);
            },
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
            height: 100, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single', fireSelectChange: true},
            //selectionModel: { type: 'cell', mode: 'multiple'} ,
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: systemCompanyRegisterColModel,
            //toolbar: systemCompanyRegisterToolbar,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect', recIndx: 'STAFF_SEQ',
                postData: systemCompanyRegisterPostData,
                getData: function (dataJSON) {
                    // console.log();
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
            {title: '적용여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
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
        // type1Toolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '발주업체 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         }
        //     ]
        // };

        type1Obj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type1ColModel,
           // toolbar: type1Toolbar,
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
                    /// console.log("beforeCheck");
                }

            },
            check: function (evt, ui) {
                // console.log("check");
            }

        };
/**  업체 타입 발주업체 그리드 선언 끝 **/

/**  업체 타입 협력업체 그리드 선언 시작 **/

        type2PostData = fnFormToJsonArrayData('#company_master_type1_form');
        type2ColModel = [
            {title: '적용여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,width:50,
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
            {title: '종류', datatype: 'string', dataIndx: 'COMP_TYPE_NM', editable: true,width:50,},
            {title: 'HIGH_TYPE', datatype: 'string', dataIndx: 'HIGH_TYPE', editable: true, hidden: true}
        ];
        // type2Toolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '협력업체 가공 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         }
        //     ]
        // };
        type2Obj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type2ColModel,
            // toolbar: type2Toolbar,
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
            {title: '적용여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
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
        // type3Toolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '협력업체 소재 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         }
        //     ]
        // };
        type3Obj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type3ColModel,
           // toolbar: type3Toolbar,
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
            {title: '적용여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
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
        // type4Toolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '협력업체 표면처리 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         }
        //     ]
        // };
        type4Obj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type4ColModel,
            // toolbar: type4Toolbar,
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
            {title: '적용여부', align: 'center', dataIndx: 'APPLY_YN', editable: true,
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
        // type5Toolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: '협력업체 후가공 종류', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
        //         }
        //     ]
        // };
        type5Obj = {
            height: 200, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            trackModel: {on: true}, scrollModel: {autoFit: true},
            numberCell: {title: 'No.', styleHead: {'vertical-align':'middle'}}, // scrollModel: {autoFit: true},
            colModel: type5ColModel,
            // toolbar: type5Toolbar,
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
            //fnAlertMessageAutoClose('save');
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

        $("#companyMasterMainNewBtn").click(function(event){
            $systemCompanyRegisterGrid = $('#' + systemCompanyRegisterGridId).pqGrid(systemCompanyRegisterObj);
            $('#system_company_popup').modal('show');
        });
        $("#addSystemCompRegiBtn").click(function(event){
            $systemCompanyRegisterGrid.pqGrid('addNodes', [{"COMP_CD":$("#company_master_register_form").find("#COMP_CD").val(), "MAIN_YN":'N'}], 0);
        });
        $("#deleteSystemCompRegiBtn").click(function(event){
            $systemCompanyRegisterGrid.pqGrid('deleteRow', {'rowIndx': companyRegisterSelectedRowIndex});//rowIndx
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
            if(confirm("업체정보가 저장 됩니다.\n저장 하시겠습니까?")) {
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
                // console.log($("#company_master_register_form").find("#compType").val());


                let parameters = {
                    'url': '/managerSystemCompany',
                    'data': $('#company_master_register_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    $('#system_company_popup').modal('hide');
                    $companyMasterMainSearchBtn.trigger("click");
                }, parameters, '');
            }

        });

        // 업체상세 모달 delete
        $systemCompanyRegisterDelBtn.click(function(event){
            if(confirm("업체정보가 삭제됩니다.\n삭제 하시겠습니까?")) {
                $("#company_master_register_form").find("#queryId").val("systemMapper.deleteCompanyMaster");
                let parameters = {
                    'url': '/json-update',
                    'data': $('#company_master_register_form').serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    $('#system_company_popup').modal('hide');
                    $companyMasterMainSearchBtn.trigger("click");
                    //fnAlertMessageAutoClose('remove');
                }, parameters, '');
            }
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
            companyEtcFile.unbind().change(function () {
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
            companyLogoFile.unbind().change(function () {
                var input = $(this);
                var files = input.get(0).files;
                console.log("------------ file ---------------------");
                console.log(input);
                console.log(files);
                console.log(files.length);

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
            companySignFile.unbind().change(function () {
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

        $("#company_master_register_form").find("#compnay_etc_attach_file_download").on('click', function () {
            let ETC_GFILE_SEQ = $("#company_master_register_form").find("#ETC_GFILE_SEQ").val();
            if(ETC_GFILE_SEQ == ""){
                alert("저장된 파일이 없습니다.");
            }else{
                fnFileDownloadFormPageAction(ETC_GFILE_SEQ);
            }
        });
        $('#company_master_register_form').find('#system-company-pop-close, #system-company-pop-close2').on('click', function () {
            $('#system_company_popup').modal('hide');
        });


    });
</script>

