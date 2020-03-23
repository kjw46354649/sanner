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
                                <input type="text" class="form-control" id="SEL_COMP_CLASS" name="SEL_COMP_CLASS" value="" placeholder="대외구분">
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
                                <img src="/barcode/code128/123456" width="300px" height="150px">
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
                    <div id='company-master-grid' style='margin:5px auto;'></div>
                </div>
            </section>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        let companyMasterSelectedRowIndex = [];
        let $companyMasterGrid;
        let companyMasterGridId = 'company-master-grid';
        let companyMasterColModel = [
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
        let companyMasterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: '업체 리스트', style: 'float: left;font-size: 13px;padding: 4px; font-weight: bold;', attr: "id='title-hidden'"
                },
                {
                    type: 'button', label: 'NEW COMPANY', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            grid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                }
            ]
        };

        let obj = {
            // width: 700,
            height: 650, collapsible: false, resizable: true, showTitle: false, // pageModel: {type: "remote"},
            selectionModel : {type: 'row', mode: 'single'},
            numberCell: {title: '<br>No.', styleHead: {'vertical-align':'middle', 'padding-top':'10px'}}, scrollModel: {autoFit: true}, trackModel: {on: true},
            colModel: companyMasterColModel, toolbar: companyMasterToolbar,
            pageModel: { type: "local", rPP: 20, strRpp: "{0}", strDisplay: "{0} to {1} of {2}" },
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
        $companyMasterGrid = $('#' + companyMasterGridId).pqGrid(obj);
    });
</script>

