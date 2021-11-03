<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-03-05
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring' %>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/fmt' prefix='fmt' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn' %>

<script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
<!-- Bootstrap -->
<script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>
<script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/resource/asset/js/front.js"></script>
<!--jQuery dependencies-->
<script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resource/main/js/jquery-ui-timepicker-addon.js" ></script>
<script type="text/javascript" src="/resource/main/js/jquery.ui.datepicker-ko.js" ></script>

<!--ParamQuery Grid js files-->
<script type="text/javascript" src="/resource/plugins/paramquery/pqgrid.min.js" ></script>

<!--ParamQuery Grid localization file (necessary since v5.2.0)-->
<script type="text/javascript" src="/resource/plugins/paramquery/localize/pq-localize-en.js"></script>

<!--Include jsZip file to support xlsx and zip export (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/jsZip-2.5.0/jszip.min.js" ></script>
<!--Include jquery.resize to support auto height of detail views in hierarchy (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/resize/jquery.resize.js" ></script>
<!--Include pqTouch file to provide support for touch devices (optional)-->
<script type="text/javascript" src="/resource/plugins/paramquery/pqTouch/pqtouch.min.js" ></script>
<script type="text/javascript" src="/resource/plugins/paramquery/pqSelect/pqselect.min.js" ></script>
<%--<script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>--%>
<script type='text/javascript'>

    var g_code;
    var multiFileUploadBox = [];    // 임시 형태의 file upload 저장소
    var g_noData = '<div style="font-size:18px;margin-top:20px;">No Data</div>';
    var windowImageViewer;
    const TODAY = new Date();
    const CURRENT_YEAR = TODAY.getFullYear();
    const CURRENT_MONTH = TODAY.getMonth();

    $(document).ready(function() {

        $('.contentsWrap .addTapPage').hide();
        $('.tabMenuWrap ul').append("<li class='on'><a href='#a;' id='tab_999'>MAIN</a></li>");
        $.get("/static/main/main", function (data) {
            let containerDiv = "<span class='addTapPage' id='view_tab_999'>" + data + "</span>";
            $(".contentsWrap").append(containerDiv).trigger('create');
            tabMenuFn();
        });

        $(window).resize( function() {
            // addRoyalTabCallBackMethod();
            // console.log(parseInt($('#view-scroller').outerHeight(true)));
        } );

        $.ajax({
            url: '/json-list',
            cache: false,
            type: "POST",
            data: {'queryId': 'systemMapper.selectSessionCodeList'},
            dataType: "json",
            async: false,
            success: function(data) {
                g_code = data.list;
            },
            complete: function(){}
        });

    });

    /**
     * @description Ajax Post
     * @param {function} callFunction - 리텅 Function 처리
     * @param {object} params - 호출 URL에 Parameter 정보
     * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
     */
    let fnPostAjax = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    let fnPostAjaxAsync = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            async: false,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //console.log(textStatus);
                //console.log(jqXHR);
                //console.log(errorThrown);
                //console.log('error=[' + jqXHR + ' ' + "status" + ' ' + textStatus + ' ' + "errorThrown" + errorThrown+']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    /**
     * Normal File upload
     * */
    let fnFormDataFileUploadAjax = function (callFunction, formData, submitUrl) {
        'use strict';
        let actionUrl = (submitUrl) ? submitUrl : '/uploadNormalFile';
        let callback = $.Callbacks();
        $.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            url: actionUrl,
            contentType : false,
            processData: false,
            data: formData,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(jQuery.parseJSON(data));
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    // alert('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    /* form에 JsonData를 셋팅 한다.
		/* formid : form 아이디
		/* data : json return data
		*/
    let fnJsonDataToForm = function (formid, data) {
        fnResetForm(formid);
        if(formid.indexOf("#") == -1) formid = "#"+formid;
        $.each(data, function(key, value) {
            let $ctrl = $(formid).find('[name='+key+']');
            if ($ctrl.is('select')){
                $('option', $ctrl).each(function() {
                    if (this.value == value)
                        this.selected = true;
                });
            } else if ($ctrl.is('textarea')) {
                $ctrl.val(value);
            } else {
                switch($ctrl.attr("type")) {
                    case "text":
                    case "date":
                    case "password":
                    case "hidden":
                        $ctrl.val(value);
                        break;
                    case "checkbox":
                        if (value == '1' || $ctrl.val() == value)
                            $ctrl.prop('checked', true);
                        else
                            $ctrl.prop('checked', false);
                        break;
                    case 'radio':
                        $ctrl.filter('[value="' + value + '"]').attr('checked', 'checked');
                        break;
                }
            }
        });
    };

    /* form 값을 JsonData 값으로 변경하여 전달 한다.
		/* formid : form 아이디
		/* data : json return data
		*/
    let fnFormToJsonArrayData = function (formid) {
        if(formid.indexOf("#") == -1) formid = "#"+formid;
        let elementArray = {};
        let formArr = $(formid).serializeArray();
        for(let i=0; i < formArr.length; i++) {
            let tmp = formArr[i];
            let name = tmp.name;
            let value = "";
            if(name != null){
                let $ctrl = $(formid).find('[name='+name+']');
                if ($ctrl.is('select')){
                    value = $ctrl.val();
                } else if ($ctrl.is('textarea')) {
                    value = $ctrl.val();
                } else {
                    switch($ctrl.attr("type")) {
                        case "text":
                        case "date":
                        case "password":
                        case "hidden":
                            value = $ctrl.val();
                            break;
                        case "checkbox":
                            if($ctrl.prop('checked')) value = true;
                            else value = false;
                            break;
                        case 'radio':
                            value = $("input:radio[name=" + name + "]:checked").val();
                            break;
                    }
                }
                elementArray[name] = value;
            }
        }
        return elementArray;
    };

    /**
     *	Form reset 처리
     *	formId : form Id
     **/
    let fnResetForm = function (formid){
        if(formid.indexOf("#") == -1) formid = $("#"+formid);
        formid.find('input:text, input:password, input:file, textarea').val('');
        formid.find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
        // select box 첫번째 값이 공백이 아니면 첫번째 값으로 셋팅
        $('select', formid).each(function() {
            $(this).val($(this).prop('defaultSelected'));
            if($(this).find('option:first').val() == ''){
                $(this).val('');
            } else {
                $(this).val($(this).find('option:first').val());
            }
        });

        // hidden value가 queryId, url 제외 나머지 clear
        $('input:hidden', formid).each(function() {
            if($(this).attr("type") == "button" || $(this).attr("id") == "url" || $(this).attr("id") == "queryId"){
            }else{
                $(this).val('');
            }
        });
    }

    /**
     * @description 그리드 생성
     * @param {string} gridId
     * @param {object} postData
     * @param {object} colModel
     * @param {object} toolbar
     * @returns {object | jQuery} grid
     */
    let fnCreatePQGrid = function (gridId, postData, colModel, toolbar) {
        'use strict';
        let obj = {
            // width: 700,
            // height: 400,
            collapsible: false,
            resizable: true,
            // title: '',
            // pageModel: {type: 'remote'},
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: colModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'POST',
                url: '/paramQueryGridSelect',
                postData: postData,
                // recIndx: 'USER_ID',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                    // return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            toolbar: toolbar
        };
        return $('#' + gridId).pqGrid(obj);
    };
    /**
     * @description 그리드 검색조건 조회
     * @param {object | jQuery} grid
     * @param {object} postData
     */
    let fnRequestGridData = function (grid, postData) {
        'use strict';
        let parameter = {'url': '/json-list', 'data': postData}

        fnPostAjax(function (data, callFunctionParam) {
            grid.pqGrid('option', 'dataModel.data', data.list);
            grid.pqGrid('refreshView');
        }, parameter, '');
    };
    /**
     * @description 그리드 데이터 삽입/갱신
     * @param {object | jQuery} grid
     * @param {array} insertQueryList
     * @param {array} updateQueryList
     */
    let fnModifyPQGrid = function (grid, insertQueryList, updateQueryList) {
        'use strict';
        let parameters;
        let gridInstance = grid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            let changes = gridInstance.getChanges({format: 'byVal'});
            let QUERY_ID_ARRAY = {
                'insertQueryId': insertQueryList,
                'updateQueryId': updateQueryList,
            };
            changes.queryIdList = QUERY_ID_ARRAY;
            parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

            fnPostAjax(function (data, callFunctionParam) {
                grid.pqGrid('refreshDataAndView');
            }, parameters, '');
        }
    };
    /**
     * @description 그리드 데이터 삭제
     * @param {object | jQuery} grid
     * @param {array} selectedRowIndex
     * @param {string} QUERY_ID
     */
    let fnDeletePQGrid = function (grid, selectedRowIndex, QUERY_ID) {
        'use strict';
        let parameters;
        let rowDataArray = [];
        let selectedRowCount = selectedRowIndex.length;

        for (let i = 0; i < selectedRowCount; i++) {
            rowDataArray[i] = grid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]});
            rowDataArray[i].queryId = QUERY_ID;
        }
        parameters = {'url': '/paramQueryDeleteGrid', 'data': {data: JSON.stringify(rowDataArray)}}

        fnPostAjax(function (data, callFunctionParam) {
            if (selectedRowCount > 0) {
                let rowListConvert = [];

                for (let row of selectedRowIndex) {
                    rowListConvert.push({'rowIndx': row});
                }

                grid.pqGrid('deleteRow', {rowList: rowListConvert});
            }
        }, parameters, '');
    };

    let fnGetCommCodeGridSelectBox = function (highCd) {
        'use strict';
        let selectBoxContents = [];
        for(var i=0; i < g_code.length; i++){
            if(g_code[i].HIGH_CD == highCd){
                selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM_KR});
            }
        }
        return selectBoxContents;
    };

    let fnGetCommCodeGridToolbarSelectBox = function (highCd, selMode) {
        'use strict';
        let selectBoxContents = [];
        if(selMode == "A"){
            selectBoxContents.push({'':"-All-"});
        }else if(selMode == "S"){
            selectBoxContents.push({'':'-Select-'});
        }
        for(var i=0; i < g_code.length; i++){
            if(g_code[i].HIGH_CD == highCd){
                let toolbarValue = g_code[i].CODE_CD;
                let toolbarName = g_code[i].CODE_NM_KR;
                let item = {};
                item[toolbarValue] = toolbarName;
                selectBoxContents.push(item);
            }
        }
        return selectBoxContents;
    };

    let fnGetCommCodeBasicSelectBox = function (selectBox, highCd, refCd, selectType) {
        'use strict';
        let selectOptionHtml = '<option value=\"\">Select</option>';
        if(selectType == 'A'){
            selectOptionHtml = '<option value=\"\">All</option>';
        }

        if(refCd !='' || refCd != null){
            for(var i=0; i < g_code.length; i++){
                if(g_code[i].REF_CD == refCd){
                    selectOptionHtml += '<option value="'+g_code[i].CODE_CD+'">'+g_code[i].CODE_NM_KR+'</option>';
                }
            }
        }else{
            for(var i=0; i < g_code.length; i++){
                if(g_code[i].HIGH_CD == highCd){
                    selectOptionHtml += '<option value="'+g_code[i].CODE_CD+'">'+g_code[i].CODE_NM_KR+'</option>';
                }
            }
        }

        selectBox.empty();
        selectBox.html(selectOptionHtml);
    };

    /**
     * Common code to Select box create
     * @param $formId
     * @param highCd
     * @param selectType
     */
    let fnCommCodeDynamicSelectBoxCreate = function ($formId, highCd, selectType) {
        'use strict';
        $formId[0].options.length = 0;
        fnSelectBoxTopSetting($formId, selectType);
        for(let i=0; i < g_code.length; i++){
            if(g_code[i].HIGH_CD == highCd){
                $formId[0].add(new Option(g_code[i].CODE_NM_KR, g_code[i].CODE_CD));
            }
        }
    };



    /**
     * Data Query to Select box create
     * @param $formId
     * @param highCd
     * @param selectType
     * @param queryId
     */
    let fnCommCodeDatasourceSelectBoxCreate = function ($formId, selectType, parmamData) {
        'use strict';
        fnPostAjax(function (data, callFunctionParam) {
            $formId[0].options.length = 0;
            fnSelectBoxTopSetting($formId, selectType);
            for(let i=0; i < data.list.length; i++){
                $formId[0].add(new Option(data.list[i].CODE_NM, data.list[i].CODE_CD));
            }
        }, parmamData, '');
    };

    /**
     * Select box option setting
     * @param $formId
     * @param selectType
     */
    let fnSelectBoxTopSetting = function ($formId, selectType) {
        switch (selectType) {
            case 'all':
                $formId[0].add(new Option('<spring:message code="com.form.top.all.option" />', ''));
                break;
            case 'sel':
                $formId[0].add(new Option('<spring:message code="com.form.top.sel.option" />', ''));
                break;
        }
    };

    /**
     * Data Query to Select box create
     * @param $formId
     * @param highCd
     * @param selectType
     * @param queryId
     */
    let fnCommCodeDatasourceGridSelectBoxCreate = function (parmamData) {
        'use strict';
        let selectBoxContents = [];
        fnPostAjax(function (data, callFunctionParam) {
            for(let i=0; i < data.list.length; i++){
                selectBoxContents.push({'value':data.list[i].CODE_CD, 'text':data.list[i].CODE_NM});
            }
        }, parmamData, '');
        return selectBoxContents;
    };

    /**
     *	Hidden Action 처리
     *   actionURL : 서버 호출 URL
     *	param : 호출 URL에 Parameter 정보
     **/
    let fnReportFormToHiddenFormPageAction = function(sourceForm, targetAction) {
        let elem = document.getElementById('excelForm');
        if(elem != null && typeof(elem) !== undefined){
            $('#excelForm').remove()
        }
        let excelForm = document.createElement("form");
        excelForm.setAttribute("id", "excelForm");
        excelForm.setAttribute("name", "excelForm");
        excelForm.hidden=true;
        excelForm.name='excelForm';
        excelForm.method='POST';
        excelForm.target='_self';
        excelForm.action= targetAction;

        $("#" + sourceForm).find('input,select,textarea').each(function(){

            let $ctrl = $(this);
            let name = $ctrl.prop('name');
            let value = "";

            if(name != ""){

                if ($ctrl.is('select')){
                    value = $ctrl.val();
                } else if ($ctrl.is('textarea')) {
                    value = $ctrl.val();
                } else {
                    switch($ctrl.attr("type")) {
                        case "text":
                        case "date":
                        case "password":
                        case "hidden":
                            value = $ctrl.val();
                            break;
                        case "checkbox":
                            if($ctrl.prop('checked')) value = true;
                            else value = false;
                            break;
                        case 'radio':
                            value = $("input:radio[name=" + name + "]:checked").val();
                            break;
                    }
                }

                if(value != ""){
                    inputElement = document.createElement("input");
                    inputElement.value = value;
                    inputElement.name = name;
                    excelForm.appendChild(inputElement);
                }
            }
        });
        document.body.appendChild(excelForm);
        excelForm.submit();
    };

    /**
     * @description 레퍼런스 참조 없는 배열 복사
     * @param obj
     */
    let fnCloneObj = function (obj) {
        return {...obj}
    };

    /**
     * Message Windows Alert 처리
     * @param messageType
     */
    let fnAlertMessageAutoClose = function (messageType) {
        let windowMessageHtml = '<spring:message code="com.alert.default.save.success" javaScriptEscape="true"/>';
        if(messageType == 'del') windowMessageHtml = '<spring:message code="com.alert.default.remove.success" javaScriptEscape="true"/>';
        dhx.alert({
            header: "Message Box",
            text: windowMessageHtml,
            buttonsAlignment: "center",
            buttons: ["ok"],
        });
    };

    /**
     * @param {string} id
     * @param {number} severalYears
     */
    let fnAppendSelectboxYear = function (id, severalYears) {
        $('#' + id).empty();
        let date = new Date();
        date.setMonth(date.getMonth() + 1);
        let year = date.getFullYear();

        for (let i = year; i > year - severalYears; i--) {
            $('#' + id).append(new Option(i + '년', i));
        }

        $('#' + id).val(CURRENT_YEAR).prop('selected', true);
    };

    /**
     * @param {string} id
     * @param {number} selectedYear
     */
    let fnAppendSelectboxMonth = function (id, selectedYear = 0) {
        $('#' + id).empty();
        let date = new Date();
        // date.setMonth(date.getMonth() + 1);
        let year = date.getFullYear();
        let month;
        const JANUARY = 1;
        const DECEMBER = 12;

        month = year < selectedYear ? JANUARY : year == selectedYear ? date.getMonth() : DECEMBER;

        for (let i = month; i >= 1; i--) {
            $('#' + id).append(new Option(i + '월', i < 10 ? '0' + i : i));
        }
    };

    function callWindowImageViewer(imageSeq)
    {
        // 팝업창 열려 있는지 확인
        if(typeof(windowImageViewer)=='undefined' || windowImageViewer.closed) {
            windowImageViewer = window.open("/imageviewer", "jmesImageViewChildForm", "width=1024, height=768, resizable = no, scrollbars = no");
            windowImageViewer.onload = function () {
                setTimeout(function () {
                    $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
                    windowImageViewer.onImageViewStart();
                }, 500);
            };
        }else {
            windowImageViewer.focus();
            // console.log($(windowImageViewer.window.document).find("#image_seq").val(imageSeq));
            $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
            windowImageViewer.onImageViewStart();
        }
    }

    Date.prototype.yyyymmdd = function() {
        let yyyy = this.getFullYear().toString();
        let mm = (this.getMonth() + 1).toString();
        let dd = this.getDate().toString();
        return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
    }

    Date.prototype.yyyymmddhhmm = function () {
        let year = this.getFullYear();
        let month = this.getMonth() + 1;
        month = month < 10 ? '0' + month : month;
        let date = this.getDate();
        date = date < 10 ? '0' + date : date;
        let hour = this.getHours();
        hour = hour < 10 ? '0' + hour : hour;
        let minute = this.getMinutes();
        minute = minute < 10 ? '0' + minute : minute;

        return year + '-' + month + '-' + date + ' ' + hour + ':' + minute;
    }

</script>