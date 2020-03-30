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


<script src='/resource/main/js/jquery.min.js'></script>
<!-- Bootstrap -->
<script src='/resource/main/js/bootstrap.js'></script>
<!-- royal tab -->
<script src='/resource/plugins/royal_tab/js/royal_tab.js'></script>
<!-- App -->
<script src='/resource/main/js/app.js'></script>
<script src='/resource/main/js/slimscroll/jquery.slimscroll.min.js'></script>
<script src='/resource/main/js/charts/easypiechart/jquery.easy-pie-chart.js'></script>
<script src='/resource/main/js/charts/sparkline/jquery.sparkline.min.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.min.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.tooltip.min.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.spline.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.pie.min.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.resize.js'></script>
<script src='/resource/main/js/charts/flot/jquery.flot.grow.js'></script>
<script src='/resource/main/js/charts/flot/demo.js'></script>

<script src='/resource/main/js/calendar/bootstrap_calendar.js'></script>
<script src='/resource/main/js/calendar/demo.js'></script>

<script src='/resource/main/js/sortable/jquery.sortable.js'></script>
<script src='/resource/main/js/app.plugin.js'></script>
<!-- paramQuery Grid -->
<script src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js'></script>
<script src='/resource/plugins/paramquery/pqgrid.min.js'></script>

<script type='text/javascript'>
    var g_code;
    var royal_tab_api = null;
    var multiFileUploadBox = [];    // 임시 형태의 file upload 저장소

    $(document).ready(function() {

        royal_tab_api = new Royal_Tab_Api($('div.royal_tab'));
        royal_tab_api.add(0, true, 'MAIN', '/static/main/main', true, '01', addRoyalTabCallBackMethod);
        // royal_tab_api.add(0, true, '${authUserFMenu.MENUNM}', '${authUserFMenu.PATHFILE}', true, '${authUserFMenu.MENUID}');

        $('#royal_tab_more').delegate('i', 'click', function(){
            royal_tab_api.remove($('#royal_tab_more > li > i').index(this));
        });

        $('#left_menu_wide_list').find('.tabMenuClick').on('click', function() {
            royal_tab_api.add(0, true, $(this).attr('tname'), $(this).attr('url'), true, $(this).attr('pid'), addRoyalTabCallBackMethod);
        });

        function addRoyalTabCallBackMethod(){
            let windows
            let viewScrollerHeight = parseInt($('#view-scroller').outerHeight(true));
            let activeViewItemHeight = parseInt($('.active_view_item').outerHeight(true));

            if(activeViewItemHeight > 905) {
                $('.active_view_item').height(activeViewItemHeight + (905 - activeViewItemHeight));
            }
            //$('#view-scroller').height(activeViewItemHeight);
            //$('.active_view_item').height(activeViewItemHeight);
        }

        $(window).resize( function() {
            addRoyalTabCallBackMethod();

            console.log(parseInt($('#view-scroller').outerHeight(true)));
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

    let fnFormDataFileUploadAjax = function (callFunction, formData) {
        'use strict';
        let callback = $.Callbacks();
        $.ajax({
            type: 'POST',
            url: '/uploadNormalFile',
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
    let fnResetFrom = function (formid){
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
            if($(this).attr("id") == "url" || $(this).attr("id") == "queryId"){
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
    let fnRequestGidData = function (grid, postData) {
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
            parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}}

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
</script>