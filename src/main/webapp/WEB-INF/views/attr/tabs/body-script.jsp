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

<%--<script type="text/javascript" src="/resource/plugins/jspPrint/zip.js"></script>--%>
<%--<script type="text/javascript" src="/resource/plugins/jspPrint/zip-ext.js"></script>--%>
<%--<script type="text/javascript" src="/resource/plugins/jspPrint/deflate.js"></script>--%>
<%--<script type="text/javascript" src="/resource/plugins/jspPrint/JSPrintManager.js"></script>--%>

<script type="text/javascript" src="/resource/plugins/bluebird.min.js"></script>
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

<!-- print -->
<script type="text/javascript" src="/resource/plugins/printThis/printThis.js"></script>

<script type="text/javascript" src="/resource/plugins/print.js/print.min.js"></script>

<script type="text/javascript" src='/resource/plugins/waitme/waitMe.js'></script>
<script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>

<!-- combotree -->
<script type="text/javascript" src="/resource/main/js/combotree/comboTreePlugin.js" ></script>
<script type="text/javascript" src="/resource/main/js/combotree/icontains.js" ></script>

<!-- barcode -->
<script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>

<!-- CK Editor -->
<script type="text/javascript" src="/resource/plugins/ckeditor/ckeditor.js" ></script>

<script type="text/javascript" src='/resource/plugins/fullcalendar/core/main.js'></script>
<script type="text/javascript" src='/resource/plugins/fullcalendar/interaction/main.js'></script>
<script type="text/javascript" src='/resource/plugins/fullcalendar/daygrid/main.js'></script>
<%--<script type="text/javascript" src='/resource/plugins/fullcalendar/moment/main.js'></script>--%>
<script type="text/javascript" class="cssdesk" src="/resource/plugins/moment-2.11.0/min/moment.min.js"></script>

<!-- alertify -->
<script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>
<!-- underscore -->
<script type="text/javascript" src='/resource/main/js/libs/underscore-min.js'></script>
<!-- paramquery export excel  -->
<script type="text/javascript" src='/resource/plugins/FileSaver/FileSaver.js'></script>
<!-- highcharts -->
<script type="text/javascript" src="/resource/plugins/Highcharts-8.2.2/js/highcharts.js"></script>
<script type="text/javascript" src="/resource/plugins/Highcharts-8.2.2/js/highcharts-more.js"></script>
<script type="text/javascript" src="/resource/plugins/Highcharts-8.2.2/modules/no-data-to-display.js"></script>
<script type="text/javascript" src="/resource/plugins/Highcharts-8.2.2/modules/solid-gauge.js"></script>
<!-- monthpicker -->
<script type="text/javascript" src="/resource/plugins/jquery.mtz.monthpicker/jquery.mtz.monthpicker.js"></script>

<script type='text/javascript'>

    var g_code;
    var multiFileUploadBox = [];    // 임시 형태의 file upload 저장소
    var g_noData = 'Not Found Data.';
    var windowImageViewer;
    const TODAY = new Date();
    const CURRENT_YEAR = TODAY.getFullYear();
    const CURRENT_MONTH = TODAY.getMonth();
    var $waitMeMainContainer;

    $.fn.startWaitMe = function() {
        $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
    };

    $.fn.stopWaitMe = function() {
        $waitMeMainContainer.waitMe('hide');
    };

    $(document).ready(function() {

        $('.contentsWrap .addTapPage').hide();
        $('.tabMenuWrap ul').append("<li class='on'><a href='#a;' id='tab_999'>MAIN</a></li>");
        $.get("/static/main/main", function (data) {
            let containerDiv = "<span class='addTapPage' id='view_tab_999'>" + data + "</span>";
            $(".contentsWrap").append(containerDiv).trigger('create');
            tabMenuFn();
        });

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
     * @description 열려있는 탭 id 가져오기
     */
    let fnCurrentTabId = function () {
        return $('.tabMenu').children('li.on').children('a').attr('id');
    };

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
                // console.log(data);
                if (textStatus === 'success') {
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    fnAlert(null, '<srping:message key="error.common"/>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                var errorDatas = jqXHR.responseJSON;
                if(errorDatas){
                    if(errorDatas.code === -9000){
                        fnConfirm(null, errorDatas.msg, function() {
                            fnHiddenFormPageAction('/');
                        }, null, 3);
                    }else{
                        fnAlert(null,errorDatas.msg, function(){});
                    }
                }else{
                    fnAlert(null, errorThrown, function(){});
                }
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
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                var errorDatas = jqXHR.responseJSON;
                if(errorDatas){
                    if(errorDatas.code === -9000){
                        fnConfirm(null, errorDatas.msg, function() {
                            fnHiddenFormPageAction('/');
                        }, null, 3);
                    }else{
                        fnAlert(null,errorDatas.msg, function(){});
                    }
                }else{
                    fnAlert(null, errorThrown, function(){});
                }
            }
        });
    };

    /**
     * @description Ajax Post
     * @param {function} callFunction - 리텅 Function 처리
     * @param {object} params - 호출 URL에 Parameter 정보
     * @param {*} callFunctionParam - 리텅 Function 전달 Parameter
     */
    let fnPostAjaxSound = function (callFunction, params, callFunctionParam) {
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
                    successPlay();
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    failPlay();
                    fnAlert(null, '<srping:message key="error.common"/>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                failPlay();
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                var errorDatas = jqXHR.responseJSON;
                if(errorDatas){
                    if(errorDatas.code === -9000){
                        fnConfirm(null, errorDatas.msg, function() {
                            fnHiddenFormPageAction('/');
                        }, null, 3);
                    }else{
                        fnAlert(null,errorDatas.msg, function(){});
                    }
                }else{
                    fnAlert(null, errorThrown, function(){});
                }
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
            beforeSend: function (jqXHR, settings) {
              $(this).startWaitMe();
            },
            complete: function (jqXHR, textStatus) {
              $(this).stopWaitMe();
            },
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
                if ($waitMeMainContainer !== undefined) $(this).stopWaitMe();
                var errorDatas = jqXHR.responseJSON;
                if(errorDatas){
                    if(errorDatas.code === -9000){
                        fnConfirm(null, errorDatas.msg, function() {
                            fnHiddenFormPageAction('/');
                        }, null, 3);
                    }else{
                        fnAlert(null,errorDatas.msg, function(){});
                    }
                }else{
                    fnAlert(null, errorThrown, function(){});
                }
            }
        });
    };

    /* form에 JsonData를 셋팅 한다.
		/* formid : form 아이디
		/* data : json return data
		*/
    let fnJsonDataToForm = function (formid, data) {
        fnResetFrom(formid);
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
                    case "number":
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
                        case "number":
                        case "date":
                        case "password":
                        case "hidden":
                        case "search":
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
    let fnResetFrom = function (formid){
        if(formid.indexOf("#") == -1) formid = $("#"+formid);
        formid.find('input[type=text], input[type=number], input[type=password], input[type=file], textarea').val('');
        formid.find('input[type=radio], input[type=checkbox]').removeAttr('checked').removeAttr('selected');
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
            changes.queryIdList = {
                'insertQueryId': insertQueryList,
                'updateQueryId': updateQueryList,
            };
            parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};

            // const replacer = function (key, value) {
            //     return value === undefined ? null : value;
            // };
            //
            // parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes, replacer)}};

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
    let fnDeletePQGrid = function (grid, selectedRowIndex, QUERY_ID, callback) {
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
            if(typeof callback != 'undefined' && callback != null) {
                callback();
            }
        }, parameters, '');
    };

    let fnGetCommCodeGridSelectBox = function (highCd, topOption) {
        'use strict';
        let selectBoxContents = [];

        if (topOption === null) {
            selectBoxContents.push(new Option('', null));
        }

        for (let i = 0, LENGTH = g_code.length; i < LENGTH; i++) {
            if (g_code[i].HIGH_CD == highCd) {
                selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM_KR});
            }
        }
        return selectBoxContents;
    };

    let fnGetCommCodeGridSelectBoxEtc = function (highCd, refCd) {
        'use strict';
        let selectBoxContents = [];
        for(var i=0; i < g_code.length; i++){
            if(g_code[i].HIGH_CD == highCd){
                if(g_code[i].REF_CD == refCd){
                    selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM_KR});
                }
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
    let fnCommCodeDatasourceSelectBoxCreate = function ($formId, selectType, parmamData,callBack) {
        'use strict';
        fnPostAjaxAsync(function (data, callFunctionParam) {
            $formId[0].options.length = 0;
            fnSelectBoxTopSetting($formId, selectType);
            for(let i=0; i < data.list.length; i++){
                $formId[0].add(new Option(data.list[i].CODE_NM, data.list[i].CODE_CD));
            }
            if(typeof callBack != 'undefined') {
                callBack();
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
        fnPostAjaxAsync(function (data, callFunctionParam) {
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
     *	Download Hidden Action 처리
     *   actionURL : 서버 호출 URL
     *	param : 호출 URL에 Parameter 정보
     **/
    let fnFileDownloadFormPageAction = function(GfileSeq) {
        let elem = document.getElementById('downloadActionForm');
        if(elem != null && typeof(elem) !== undefined){
            $('#downloadActionForm').remove()
        }
        let downloadActionForm = document.createElement("form");
        downloadActionForm.setAttribute("id", "downloadActionForm");
        downloadActionForm.setAttribute("name", "downloadActionForm");
        downloadActionForm.hidden=true;
        downloadActionForm.name='downloadActionForm';
        downloadActionForm.method='POST';
        downloadActionForm.target='_self';
        downloadActionForm.action= '/downloadGfile/' + GfileSeq;

        document.body.appendChild(downloadActionForm);
        downloadActionForm.submit();
    };

    let fnSingleFileDownloadFormPageAction = function(fileSeq) {
        let elem = document.getElementById('downloadSingleActionForm');
        if(elem != null && typeof(elem) !== undefined){
            $('#downloadSingleActionForm').remove()
        }
        let downloadSingleActionForm = document.createElement("form");
        downloadSingleActionForm.setAttribute("id", "downloadSingleActionForm");
        downloadSingleActionForm.setAttribute("name", "downloadSingleActionForm");
        downloadSingleActionForm.hidden=true;
        downloadSingleActionForm.name='downloadSingleActionForm';
        downloadSingleActionForm.method='POST';
        downloadSingleActionForm.target='_self';
        downloadSingleActionForm.action= '/downloadfile/' + fileSeq;

        document.body.appendChild(downloadSingleActionForm);
        downloadSingleActionForm.submit();
    };

    function initExcelHiddenForm(theForm, key, value) {
        var elem = document.getElementById('excelForm');
        if(elem != null && typeof(elem) !== undefined){
            $('#excelForm').remove()
        }
        var excelform = document.createElement("form");
        excelform.setAttribute("id", "excelForm");
        excelform.name='excelForm';
        excelform.method='POST';
        excelform.action='/excel-download';
        return excelform;
    }

    /**
     * @description 레퍼런스 참조 없는 배열 복사(deep copy)
     * @param obj
     */
    const fnCloneObj = function (obj) {
        if (obj === null || typeof obj !== 'object') {
            return obj;
        }

        const result = Array.isArray(obj) ? [] : {};

        for (let key of Object.keys(obj)) {
            result[key] = fnCloneObj(obj[key])
        }

        return result;
    };

    /**
     * Message Windows Alert 처리
     * @param messageType
     */
    let fnAlertMessageAutoClose = function (messageType) {
        let windowMessageHtml = '<spring:message code="com.alert.default.save.success" javaScriptEscape="true"/>';
        if(messageType == 'del') windowMessageHtml = '<spring:message code="com.alert.default.remove.success" javaScriptEscape="true"/>';
        if(messageType == 'camstart') windowMessageHtml = '<spring:message code="com.alert.default.remove.success" javaScriptEscape="true"/>';
        // dhx.message({
        //     text: windowMessageHtml,
        //     expire: 3000,
        //     "icon": "dxi dxi-close",
        //     "position": "bottom-left"
        // });

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

    function callQuickDrawingImageViewer(imageSeq)
    {
        // 팝업창 열려 있는지 확인
        let isOpen = $("#common_quick_drawing_popup").dialog("isOpen");
        $("#common_quick_drawing_form").find("#gFileSeq").val(imageSeq);
        $("#common_quick_drawing_form").find("#drawingImage").attr("src", '/qimage/' + imageSeq);
        if(!isOpen) {
            $("#common_quick_drawing_popup").dialog("open");
        }
    }

    function callQuickRowChangeDrawingImageViewer(imageSeq)
    {
        // 팝업창이 열려 있는 경우만 처리
        let isOpen = $("#common_quick_drawing_popup").dialog("isOpen");
        if(isOpen) {
            $("#common_quick_drawing_form").find("#gFileSeq").val(imageSeq);
            $("#common_quick_drawing_form").find("#drawingImage").attr("src", '/qimage/' + imageSeq);
        }
    }

    function callWindowImageViewer(imageSeq)
    {
        // 팝업창 열려 있는지 확인
        if(typeof(windowImageViewer)=='undefined' || windowImageViewer.closed) {
            windowImageViewer = window.open("/imageViewer", "jmesImageViewChildForm", "width=1024, height=768, resizable = no, scrollbars = no");
            windowImageViewer.onload = function () {
                setTimeout(function () {
                    $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
                    windowImageViewer.onImageViewStart();
                }, 500);
            };
        }else {
            windowImageViewer.focus();
            setTimeout(function() {
                $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
                windowImageViewer.onImageViewStart();
            }, 500);
        }
    }

    /* 모달 Print 팝업 호출 */
    function callWindowModalDrawingPopup(){
        $(".cadDrawingPrint").printThis({
            debug: false,               // show the iframe for debugging
            importCSS: true,            // import parent page css
            importStyle: false,         // import style tags
            printContainer: true,       // print outer container/$.selector
            loadCSS: "",                // path to additional css file - use an array [] for multiple
            pageTitle: "진성 시스템",              // add title to print page
            removeInline: false,        // remove inline styles from print elements
            removeInlineSelector: "*",  // custom selectors to filter inline styles. removeInline must be true
            printDelay: 333,            // variable print delay
            header: null,               // prefix to html
            footer: null,               // postfix to html
            base: false,                // preserve the BASE tag or accept a string for the URL
            formValues: true,           // preserve input/form values
            canvas: false,              // copy canvas content
            doctypeString: '...',       // enter a different doctype for older markup
            removeScripts: false,       // remove script tags from print content
            copyTagClasses: false,      // copy classes from the html & body tag
            beforePrintEvent: null,     // function for printEvent in iframe
            beforePrint: null,          // function called before iframe is filled
            afterPrint: function(e){
                $(".cadDrawingPrint").html('').trigger('create');
                $(".cadDrawingPrint").css("display","none");
            },            // function called before iframe is removed
        });
    }

    Date.prototype.mmdd = function() {
        let mm = (this.getMonth() + 1).toString();
        let dd = this.getDate().toString();
        return  (mm[1] ? mm : "0" + mm[0]) + "/" + (dd[1] ? dd : "0" + dd[0]);
    };

    Date.prototype.yymmdd = function() {
        let yy = this.getFullYear().toString().substring(2);
        let mm = (this.getMonth() + 1).toString();
        let dd = this.getDate().toString();
        return  yy + "/" + (mm[1] ? mm : "0" + mm[0]) + "/" + (dd[1] ? dd : "0" + dd[0]);
    };

    Date.prototype.yyyymmdd = function() {
        let yyyy = this.getFullYear().toString();
        let mm = (this.getMonth() + 1).toString();
        let dd = this.getDate().toString();
        return  yyyy + "/" + (mm[1] ? mm : "0" + mm[0]) + "/" + (dd[1] ? dd : "0" + dd[0]);
    };

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

        return year + '/' + month + '/' + date + ' ' + hour + ':' + minute;
    };

    let fnGridValidation = function(targetGrid){
        var gridInstance = $("#" + targetGrid).pqGrid('getInstance').grid;
        var addList = gridInstance.getChanges().addList;
        var errCnt = 0;
        for (var i = 0; i < addList.length; i++) {
            var rowData = addList[i];
            var isValid = gridInstance.isValid({ "rowData": rowData }).valid;
            if (!isValid) {
                errCnt++;
            }
        }

        var updateList = gridInstance.getChanges().updateList;
        for (var i = 0; i < updateList.length; i++) {
            var rowData = updateList[i];
            var isValid = gridInstance.isValid({ "rowData": rowData }).valid;
            if (!isValid) {
                errCnt++;
            }
        }

        if(errCnt >0){
            return false;
        }else{
            return true;
        }

    };

    let numberWithCommas = function(numberVal) {
        if(numberVal)
            return numberVal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        else
            return numberVal;
    };

    let fnBarcodePrint = function (callFunction, formData, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();

        $.ajax({
            type: 'POST',
            url: '/barcodePrint',
            dataType: 'json',
            //data: {data : JSON.stringify({'data': formData})},
            data: {data : JSON.stringify(formData)},
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    // console.log('data=[' + data + ']111');
                    // console.log(data);
                    // if (data.exception === null) {
                    callback.add(callFunction);
                    //callback.fire(jQuery.parseJSON(data));
                    callback.fire(data);
                    // } else {
                    <%--alert('<spring:message code='com.alert.default.failText' />');--%>
                    // }
                } else {
                    console.log('fail=[' + json.msg + ']111');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log('error=[' + response.responseText + ' ' + status + ' ' + errorThrown + ']');
                // if (errorThrown == 'Forbidden') {
                //     $(this).fnHiddenFormPageAction('/');
                // }
            }
        });
    };

    let fnBarcodePrintCheck = function(callFunction, barcodeNumber, callFunctionParam){
        //메세지
        let queryId = "common.selectBarcodePrintControlCheck";
        let barcodeType = barcodeNumber.charAt(0).toUpperCase();
        let callback = $.Callbacks();

        if(barcodeType == "L") {//라벨
            queryId = "common.selectBarcodePrintOutCheck";
        }
        let postData = { 'queryId': queryId, 'BARCODE_NUM': barcodeNumber};
        $.ajax({
            type: 'POST',
            url: '/json-info',
            dataType: 'json',
            data: postData,
            async: false,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    if (data.info != null && data.info.USE_YN == 'Y') {
                        callback.add(callFunction);
                        callback.fire(true, callFunctionParam);
                        //callback(true);
                    } else {
                        let text = '조회대상이 없습니다.';
                        fnAlert(null, text);
                    }
                } else {
                    // alert('fail=[' + json.msg + ']');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
                console.log(jqXHR);
                console.log(errorThrown);
            }
        });
    };

    /**
     * @param grid
     * @returns {boolean}
     */
    let fnIsGridEditing = function (grid) {
        let gridInstance = grid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            fnAlert(null, '현재 수정중인 작업을 완료 후 다시 실행해 주세요.');
            return true;
        } else {
            return false;
        }
    };

    function fnFilterHandler(gridId, filterKeywordId, filterConditionId, filterColumnId) {
        var value = $("#"+filterKeywordId).val(),
            condition = $("#"+filterConditionId).val(),
            dataIndx = $("#"+filterColumnId).val(),
            filterRules;

        if (dataIndx == "") {//search through all fields when no field selected.
            filterRules = gridId.pqGrid('getInstance').grid.getColModel().map(function(column){
                return { dataIndx: column.dataIndx, condition: condition, value: value };
            })
        }
        else {//search through selected field.
            filterRules = [{ dataIndx: dataIndx, condition: condition, value: value}];
        }

        gridId.pqGrid('getInstance').grid.filter({
            oper: 'replace',
            rules: filterRules
        });
    }

    function fnFrozenHandler(gridId, value){
        gridId.pqGrid('getInstance').grid.option("freezeCols", value);
        gridId.pqGrid('getInstance').grid.refresh();
    }

    const fnDateEditor = function (ui) {
        let $inp = ui.$cell.find("input"), $grid = $(this);
        $inp.datepicker({
            changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yy/mm/dd',
            onSelect: function () { this.firstOpen = true; },
            beforeShow: function (input, inst) {return !this.firstOpen; },
            onClose: function () { this.focus(); }
        });
    };

    const fnDateEditor_custom = function (ui) {
        let $inp = ui.$cell.find("input"), $grid = $(this);
        $inp.datepicker({
            changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yy-mm-dd',
            onSelect: function () { this.firstOpen = true; },
            beforeShow: function (input, inst) {return !this.firstOpen; },
            onClose: function () { this.focus(); }
        });
    };

    /**
     * @description 바코드 첫글자 영문 변환
     * @param {string} text
     * @returns {string} text
     */
    const fnBarcodeKo2En = function (text) {
        let char = text.substring(0, 1);

        switch (char) {
            case 'ㅊ':
                char = 'C';
                break;
            case 'ㅣ':
                char = 'L';
                break;
        }

        return (char + text.substring(1)).toUpperCase();
    };

    /**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button or closes the dialog.
     *
     * fnAlert(null,"<h1>안녕하세요</h1>", function () {alert('확인 클릭')});
     *
     */
    const fnAlert = function (title, message, onok) {
        alertify.alert()
            .setting({
                'title': title,
                'message': message,
                'onok': onok,
                'movable': false,
                'transitionOff': true
            }).show();
    };

    /**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button.
     * @oncancel {Function} Invoked when the user clicks Cancel button or closes the dialog.
     * @autoOk {number} Automatically confirms the dialog after n seconds.
     *
     * fnConfirm(null, 'message', function() {alert('확인 클릭')}, function() {alert('취소 클릭')}, 5);
     *
     */
    const fnConfirm = function (title, message, onok, oncancel, autoOk) {
        if (autoOk == undefined || autoOk == null) {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show();
        } else {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show().autoOk(autoOk);
        }
    };


    /**
     * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
     * @param str {String} 체크할 문자열
     */
    const fnIsEmpty =  function(str){
        return str === undefined || str === null || str === '';
    };

    /**
     * @description 속성으로 객체 분류하기
     * @param objectArray
     * @param property
     * @returns {*}
     */
    const fnGroupBy = function (objectArray, property) {
        return objectArray.reduce(function (acc, obj) {
            var key = obj[property];
            if (!acc[key]) {
                acc[key] = [];
            }
            acc[key].push(obj);
            return acc;
        }, {});
    };

    /**
     * @description 객체 내의 값 인스턴스 개수 세기
     * @param {array} array
     */
    const fnCountInstance = function (array) {
        return array.reduce(function (acc, obj) {
            if (obj in acc) {
                acc[obj]++;
            } else {
                acc[obj] = 1;
            }

            return acc;
        }, {});
    };

    /**
     * actinon 처리
     * @param actionUrl
     */
    const fnHiddenFormPageAction = function(actionUrl) {
        $('form[name="hidden_action_frm"]').attr("action",actionUrl);
        $('form[name="hidden_action_frm"]').submit();
    };

    $(document).on('click', '#DETAIL_VIEW', function () {
        g_item_detail_pop_view();
    });

</script>