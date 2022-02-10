<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-06
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>

<div class="modal" id="mail_template_record_popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 1064px !important;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Mail Box</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form" id="mail_template_record_popup_form" name="mail_template_record_popup_form" onsubmit="return false;">
                    <input type="hidden" id="queryId" name="queryId" value="systemMapper.insertUpdateMailTemplate">
                    <input type="hidden" id="TEMPLATE_SEQ" name="TEMPLATE_SEQ" value="">
                    <input type="hidden" id="TEMPLATE_CONTENT" name="TEMPLATE_CONTENT" value="">
                    <div class="panel-body line_tit portlet-body form bg-light">
                        <div class="panel panel-default">
                            <table class="templateStyle">
                                <tbody>
                                    <tr>
                                        <th scope="row">템플릿 제목</th>
                                        <td><input type="text" name="TEMPLATE_TITLE" id="TEMPLATE_TITLE" class="wd_450"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">템플릿 내용</th>
                                        <td><textarea id="TEMPLATE_CONTENT_E" name="TEMPLATE_CONTENT_E" style="height: 300px;"></textarea></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발신자</th>
                                        <td><input class="datepicker-input wd_500 hasDatepicker" type="text" name="SEND_NAME" id="SEND_NAME"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">발신이메일</th>
                                        <td><input type="text" name="SEND_EMAIL" id="SEND_EMAIL" title="Model No." class="wd_400"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">수신이메일</th>
                                        <td><input type="text" name="RECV_EMAIL" id="RECV_EMAIL" title="Model No." class="wd_350"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">참조이메일</th>
                                        <td><input type="text" name="CC_EMAIL" id="CC_EMAIL" title="Model No." class="wd_300"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="buttonWrap right_sort">
                    <button type="button" id="mailTemplatePopSaveBtn" class="defaultBtn radius">저장</button>
                    <button type="button" id="mailTemplatePopCancelBtn" class="defaultBtn radius red">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page onegrid">
    <div class="topWrap">
        <form class="form-inline" id="mail_template_search_form" name="mail_template_search_form" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectMailTemplateList">
            <input type="hidden" name="TEMPLATE_SEQ" id="TEMPLATE_SEQ" value="">
            <div class="hWrap">
                <span class="ipu_wrap">
                    <label for="SEARCH_TITLE">제목</label>
                    <input type="text" name="SEARCH_TITLE" id="SEARCH_TITLE" placeholder="제목"class="pd-left5 wd_200 " title="제목">
                </span>
                <div class="rightSpan">
                    <span class="buttonWrap">
                        <button type="button" id="mailTemplateSearchBtn" class="defaultBtn radius blue">검색</button>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap">
            <div class="buttonWrap right_sort">
                <button type="button" id="mailTemplateMasterAddBtn" class="defaultBtn radius">추가</button>
                <button type="button" id="mailTemplateMasterDelBtn" class="defaultBtn radius red">삭제</button>
            </div>
            <div class="conWrap">
                <div id="mail_template_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="user_master_total_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let mailTemplateSelectedRowIndex = [];
    let mailTemplateMasterGrid;
    let mailTemplateGridId = 'mail_template_grid';
    let mailTemplateMasterPostData = fnFormToJsonArrayData('mail_template_search_form');
    let $mailTemplateSearchBtn = $("#mailTemplateSearchBtn");
    let $mailTemplateMasterAddBtn = $("#mailTemplateMasterAddBtn");
    let $mailTemplateMasterDelBtn = $("#mailTemplateMasterDelBtn");

    let $mailTemplatePopSaveBtn = $("#mailTemplatePopSaveBtn");
    let $mailTemplatePopCancelBtn = $("#mailTemplatePopCancelBtn");

    $(function () {
        'use strict';

        let mailTempalteMasterColModel = [
            {title: 'SEQ', dataType: 'string', dataIndx: 'TEMPLATE_SEQ', width: 100},
            {title: '템플릿 제목', dataType: 'string', dataIndx: 'TEMPLATE_TITLE', width: 160},
            {title: '템플릿 내용', dataType: 'string', dataIndx: 'TEMPLATE_CONTENT', width: 350},
            {title: '발신자', dataType: 'string', dataIndx: 'SEND_NAME', width: 100},
            {title: '발신이메일', dataType: 'string', dataIndx: 'SEND_EMAIL', width: 100},
            {title: '수신이메일', dataType: 'string', dataIndx: 'RECV_EMAIL', width: 150},
            {title: '참조이메일', dataType: 'string', dataIndx: 'CC_EMAIL', width: 150},
        ];

        let mailTempalteMasterObj = {
            minHeight: "auto",
            height: 765,
            width: "auto",
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            editable: false,
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            colModel: mailTempalteMasterColModel,
            dataModel: {
                recIndx: 'USER_ID', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: mailTemplateMasterPostData,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = mailTemplateMasterGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#user_master_total_records').html(totalRecords);
            },
            toolbar: false,
            rowSelect: function (event, ui) {
                mailTemplateSelectedRowIndex[0] = ui.addList[0].rowIndx;
            },
            cellDblClick: function (event, ui) {
                let TEMPLATE_SEQ = ui.rowData.TEMPLATE_SEQ;
                $("#mail_template_search_form #TEMPLATE_SEQ").val(TEMPLATE_SEQ);
                $("#mail_template_record_popup").modal('show');
            }
        };

        mailTemplateMasterGrid = $('#' + mailTemplateGridId).pqGrid(mailTempalteMasterObj);

        function mailTemplateMasterSaveCallBack(){
            $("#mail_template_record_popup").modal('hide');
            $mailTemplateSearchBtn.trigger('click');
        }

        /* 버튼 Action 처리 */
        $('#mail_template_search_form input').on('keyup', function (e) {
            if(e.keyCode == 13) {
                searchMailTemplate();
            }
        });

        $mailTemplateSearchBtn.click(function(event){
            searchMailTemplate();
        });

        function searchMailTemplate() {
            mailTemplateMasterGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('mail_template_search_form');
            } );
            mailTemplateMasterGrid.pqGrid("refreshDataAndView");
        }

        $mailTemplateMasterAddBtn.click(function(event){
            $("#mail_template_record_popup_form #queryId").val('systemMapper.insertUpdateMailTemplate');
            $("#mail_template_record_popup_form #TEMPLATE_SEQ").val('');
            $("#mail_template_search_form #TEMPLATE_SEQ").val('');
            $("#mail_template_record_popup").modal('show');
        });

        $mailTemplateMasterDelBtn.click(function(event){
            let USER_MASTER_QUERY_ID = 'deleteMailTemplate';
            fnDeletePQGrid(mailTemplateMasterGrid, mailTemplateSelectedRowIndex, USER_MASTER_QUERY_ID, function () {
                mailTemplateMasterGrid.pqGrid("refreshDataAndView");
            });
        });

        $mailTemplatePopSaveBtn.click(function(event){
            $("#mail_template_record_popup #TEMPLATE_CONTENT").val(CKEDITOR.instances.TEMPLATE_CONTENT_E.getData());
            let parameters = {
                'url': '/json-create',
                'data': $("#mail_template_record_popup_form").serialize()
            };
            fnPostAjax(mailTemplateMasterSaveCallBack, parameters, '');
        });

        $mailTemplatePopCancelBtn.click(function(event){
            $("#mail_template_record_popup").modal('hide');
        });

        /* 버튼 Action 처리 */
        $('#mail_template_record_popup').on('hide.bs.modal', function() {
            fnResetForm('mail_template_record_popup_form');
            CKEDITOR.instances.TEMPLATE_CONTENT_E.setData('');
            $("#mail_template_search_form #TEMPLATE_SEQ").val('');
        });

        $('#mail_template_record_popup').on('show.bs.modal',function() {
            if($("#mail_template_search_form #TEMPLATE_SEQ").val() != '') {
                let parameters = {
                    'url': '/json-list',
                    'data': $("#mail_template_search_form").serialize()
                };
                fnPostAjax(function (data, callFunctionParam) {
                    let list = data.list[0];
                    // Form 입력
                    fnJsonDataToForm('mail_template_record_popup_form', list);
                    // EDITOR 입력
                    CKEDITOR.instances.TEMPLATE_CONTENT_E.setData(list.TEMPLATE_CONTENT);
                }, parameters, '');
            }
        });

        /* CKEDITOR 부분 */
        CKEDITOR.replace( 'TEMPLATE_CONTENT_E', { height: 300 });

    });
</script>
