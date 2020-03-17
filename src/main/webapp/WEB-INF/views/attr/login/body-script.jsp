<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!--<script src="/resources/js/jquery.min.js"></script>-->
<!-- <script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap -->
<!-- <script src="/resources/js/bootstrap.js"></script> -->
<!-- <script src="/resources/js/bootstrap.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- App -->
<script src="/resources/js/app.js?ver=1.0"></script>
<script src="/resources/js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/resources/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
<script src="/resources/js/charts/sparkline/jquery.sparkline.min.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.min.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.tooltip.min.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.spline.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.pie.min.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.resize.js"></script>
<script src="/resources/js/charts/flot/jquery.flot.grow.js"></script>
<!-- <script src="/resources/js/charts/flot/demo.js"></script> -->

<!--<script type="text/javascript" src="/resources/scripts/webcomponents-lite.min.js"></script>-->
<script type="text/javascript" src="/resources/jqwidgets/jqxcore.js?ver=1.0"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcore.elements.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxtabs.js?ver=1.1"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxscheduler.js?ver=0.3"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxscheduler.api.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxradiobutton.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxinput.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxpasswordinput.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdropdownlist.js?ver=1.0"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcombobox.js?ver=1.0"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcalendar.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdatetimeinput.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/globalization/globalize.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdata.export.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.export.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxvalidator.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxnotification.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxtooltip.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxwindow.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxform.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxtextarea.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdate.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxmaskedinput.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxnumberinput.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/globalization/globalize.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/globalization/globalize.culture.de-DE.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.aggregates.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxnotification.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxloader.js?ver=1.1"></script>
<script type="text/javascript" src="/resources/scripts/jquery-ui.min.js"></script>

<script type="text/javascript" src="/resources/scripts/generatedata.js"></script>

<script type="text/javascript" src="/resources/scripts/demos.js?ver=1.1"></script>

<script src="/resources/js/calendar/bootstrap_calendar.js"></script>
<script src="/resources/js/calendar/demo.js"></script>

<script src="/resources/js/sortable/jquery.sortable.js"></script>
<script src="/resources/js/app.plugin.js"></script>

<script type="text/javascript">

    $(function() {


        $.fn.fnButtonOnload = function(){

            $(".btnPrimary").jqxButton({ template: "primary" });
            $(".btnDanger").jqxButton({ template: "danger" });
            $(".btnSuccess").jqxButton({ template: "success" });
            $(".btnBasic").jqxButton({ template: "basic" });

            /* input box placeholder */
            $("input.input-text").each(function(){
                var placeholder = $(this).data("placeholder");
                if(placeholder == "" || placeholder == undefined){
                    placeholder = "";
                }
                $(this).jqxInput({placeHolder : placeholder});
            });

        };

        $.fn.fnPostAsyncAjaxGridRecord = function(callMethod, params, callMethodParam){
            var callbacks = $.Callbacks();
            var callFunction =callMethod;
            var param = $.extend({url : null, data : '' },params||{});

            $('#jqxLoader').jqxLoader('open');

            $.ajax({
                type: "POST", url: param.url, dataType :'json', data :param.data, async : false,
                success: function(response, status){

                    $('#jqxLoader').jqxLoader('close');

                    if(status == 'success'){
                        if(response.exception == null){
                            callbacks.add(callFunction);
                            callbacks.fire(response, callMethodParam);
                        }else{
                            alert("<spring:message code='com.alert.default.failText' />");
                        }

                    }else{
                        alert("fail=[" + json.msg + "]111");
                        // $(this).fnHiddenFormPageAction("/", "");
                    }
                },
                error: function(response, status, errorThrown) {
                    //loading end
                    $('#jqxLoader').jqxLoader('close');
                    // $(".bg_dark").hide();
                    alert("error=[" + response.responseText+' '+status+' '+errorThrown + "]");
                    //$(this).fnHiddenFormPageAction("/", "");
                    if(errorThrown == "Forbidden") {
                        $(this).fnHiddenFormPageAction("/");
                    }
                }
            });
        }

        /**
         *	Ajax 공통 처리
         *	param : 호출 URL에 Parameter 정보
         *   callMethod : 리텅 Function 처리
         *   callMethodParam : 리텅 Function 전달 Parameter
         **/
        $.fn.fnPostAjaxGridRecord = function(callMethod, params, callMethodParam, async){
            var callbacks = $.Callbacks();
            var callFunction =callMethod;
            var param = $.extend({url : null, data : '' },params||{});

            $('#jqxLoader').jqxLoader('open');

            $.ajax({
                type: "POST", url: param.url, dataType :'json', data :param.data,
                success: function(response, status){

                    $('#jqxLoader').jqxLoader('close');

                    if(status == 'success'){
                        if(response.exception == null){
                            callbacks.add(callFunction);
                            callbacks.fire(response, callMethodParam);
                        }else{
                            alert("<spring:message code='com.alert.default.failText' />");
                        }

                    }else{
                        alert("fail=[" + json.msg + "]111");
                        // $(this).fnHiddenFormPageAction("/", "");
                    }
                },
                error: function(response, status, errorThrown) {
                    //loading end
                    $('#jqxLoader').jqxLoader('close');
                    alert("error=[" + response.responseText+' '+status+' '+errorThrown + "]");
                    if(errorThrown == "Forbidden") {
                        $(this).fnHiddenFormPageAction("/");
                    }
                }
            });
        };

        /**
         *	Form reset 처리
         *	formId : form Id
         **/
        $.fn.fnResetForm= function($form){
            $form.find('input:text, input:password, input:file, textarea').val('');
            $form.find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
            var rows = $form.find('.gridWrap').find('div:eq(0)').jqxGrid('selectedrowindexes');
            if(rows.length>0){
                $form.find('.gridWrap').find('div:eq(0)').jqxGrid('clearselection');
            }
            // select box 첫번째 값이 공백이 아니면 첫번째 값으로 셋팅
            $('select', $form).each(function() {
                $(this).val($(this).prop('defaultSelected'));
                if($(this).find('option:first').val() == ''){
                    $(this).val('');
                } else {
                    $(this).val($(this).find('option:first').val());
                }
            });

            // hidden value가 queryId, url 제외 나머지 clear
            $('input:hidden', $form).each(function() {
                if($(this).attr("id") == "url" || $(this).attr("id") == "queryId"){
                }else{
                    $(this).val('');
                }
            });
        };

        /**
         *	Form reset 처리
         *	formId : form Id
         **/
        $.fn.fnResetNotGridForm= function($form){
            $form.find('input:text, input:password, input:file, textarea').val('');
            $form.find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
            // select box 첫번째 값이 공백이 아니면 첫번째 값으로 셋팅
            $('select', $form).each(function() {
                $(this).val($(this).prop('defaultSelected'));
                if($(this).find('option:first').val() == ''){
                    $(this).val('');
                } else {
                    $(this).val($(this).find('option:first').val());
                }
            });

            // hidden value가 queryId, url 제외 나머지 clear
            $('input:hidden', $form).each(function() {
                if($(this).attr("id") == "url" || $(this).attr("id") == "queryId"){
                }else{
                    $(this).val('');
                }
            });
        };

        /* common validation check */
        $.fn.fnValid = function(inFormId) {
            if( $("#" + inFormId).validationEngine('validate', {focusFirstField : true}) == false ){
                return false;
            }else{
                return true;
            }
        };

        /* init page load selectbox setting
        /* 1. top = all, sel, none
        /* 2. where = key|value;key|value
        /* 3. inFormIds = formid|inFormId
        /* 3. queryId
        */
        $.fn.fnInitSelectBox = function(tops, where, inFormIds, queryId) {
            var default_url = '/json-list';
            var default_queryId = queryId != "" ? queryId : 'SqlCommonMapper.selectCodeList';
            var featureData = {'queryId': default_queryId};
            var selVals = where.split(";");
            $.each(selVals, function(index, value) {
                var keyVal = value.split("|");
                featureData[keyVal[0]] = keyVal[1];
            });
            $.ajax({
                url: default_url,
                cache: false,
                type: "POST",
                data: featureData,
                dataType: "json",
                async: false,
                success: function(data) {
                    var setFormDivIds = inFormIds.split("|");
                    var setTops = tops.split("|");
                    $.each(setFormDivIds, function(index, formId) {
                        $("#" + formId).addItems(data.list, setTops[index]);
                    });
                },
                complete: function(){}
            });
        };

        $.fn.addItems = function(data, top) {
            return this.each(function() {
                var list = this;
                if(this.length > 0) this.options.length = 0;
                switch (top) {
                    case 'all':
                        var option = new Option('<spring:message code="com.form.top.all.option" />', '');
                        list.add(option);
                        break;
                    case 'sel':
                        var option = new Option('<spring:message code="com.form.top.sel.option" />', '');
                        list.add(option);
                        break;
                }
                $.each(data, function(index, itemData) {
                    var option = new Option(itemData.NAME, itemData.CODE);
                    list.add(option);
                });
            });
        };

        /* form에 JsonData를 셋팅 한다.
        /* formid : form 아이디
        /* data : json return data
        */
        $.fn.fnJsonPopulateForm = function($form, data) {
            this.fnResetNotGridForm($form);
            $.each(data, function(key, value) {
                var $ctrl = $form.find('[name='+key+']');

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

        /* form에 grid의 값들을 지정한다.
        /* formid : form 아이디
        /* dataObj : grid의 data
        */
        $.fn.fnFillFields = function(formid, dataObj) {
            if(formid.indexOf("#") == -1) formid = "#"+formid;
            var formArr = $(formid).serializeArray();
            for(var i=0; i<formArr.length; i++){
                var tmp = formArr[i];
                var name = tmp.name;
                var value = dataObj[tmp.name];
                if(value == undefined) value = null;
                if(name != null){
                    var $ctrl = $(formid).find('[name='+name+']');
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
                                if (value == '1')
                                    $ctrl.prop('checked', true);
                                else
                                    $ctrl.prop('checked', false);
                                break;
                            case 'radio':
                                $ctrl.filter('[value="' + value + '"]').attr('checked', 'checked');
                                break;
                        }
                    }
                }
            }
        };

        /* Parameter 값을 병합하는 과정
        /* formid : form
        /* addParam : 추가 Param
        */
        $.fn.fnJqxGridCommonParmaData = function(formid) {
            return $(this).fnJqxGridCommonParmaData(formid, null, null);
        };

        $.fn.fnJqxGridCommonParmaData = function(formid, sortObj) {
            return $(this).fnJqxGridCommonParmaData(formid, sortObj, null);
        };

        $.fn.fnJqxGridCommonParmaData = function(formid, sortObj, pageObj) {
            if(formid.indexOf("#") == -1) formid = "#"+formid;
            var formdata = $(formid).serializeArray();
            var data = {};
            $(formdata).each(function(index, obj){
                data[obj.name] = obj.value;
            });
            $(sortObj).each(function(index, obj){
                data[obj.name] = obj.value;
            });
            return $.extend({}, data, pageObj);
        };


        /**
         *	Hidden Action 처리
         *   actionURL : 서버 호출 URL
         *	param : 호출 URL에 Parameter 정보
         **/
        $.fn.fnReportFormToHiddenFormPageAction = function(sourceForm, targetAction) {
            var elem = document.getElementById('excelForm');
            if(elem != null && typeof(elem) !== undefined){
                $('#excelForm').remove()
            }
            var excelform = document.createElement("form");
            excelform.setAttribute("id", "excelForm");
            excelform.setAttribute("name", "excelForm");
            excelform.hidden=true;
            excelform.name='excelForm';
            excelform.method='POST';
            excelform.target='_self';
            excelform.action= targetAction;

            $("#" + sourceForm).find('input,select,textarea').each(function(){

                var $ctrl = $(this);
                var name = $ctrl.prop('name');
                var value = "";

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
                        excelform.appendChild(inputElement);
                    }
                }
            });

            document.body.appendChild(excelform);
            excelform.submit();
        };

        /*
        /*Hidden Action 처리
        /* actionURL : 서버 호출 URL
        /* param : 호출 URL에 Parameter 정보
        */
        $.fn.fnReportHiddenFormPageAction = function(actionUrl, param) {
            if(param != ""){
                $('form[name="report_frm"]').find("#arrData").val(param);
            }
            $('form[name="report_frm"]').attr("action",actionUrl);
            $('form[name="report_frm"]').submit();
        }


        /*
        /*Hidden Action 처리
        /* actionURL : 서버 호출 URL
        /* param : 호출 URL에 Parameter 정보
        */
        $.fn.fnHiddenFormPageAction = function(actionUrl) {
            $('form[name="hidden_action_frm"]').attr("action",actionUrl);
            $('form[name="hidden_action_frm"]').submit();
        }

        /* Grid Data Convert Json Data
        /* gridId : grid Id값
        */
        $.fn.fnJqxGridDatas = function(gridId){
            var elementData = [];
            var totalRow = $("#" + gridId).jqxGrid('getrows').length;
            var gridColumNames = $("#" + gridId).jqxGrid("columns");
            for(var rowCount=0; rowCount<totalRow; rowCount++){
                var isCRUD = $('#' + gridId).jqxGrid('getcellvalue', rowCount, "CRUD");
                var newRowDatas = {};
//         		if(isCRUD == "U" || isCRUD == "I" || isCRUD == "D"){
                for(var j = 0; j < gridColumNames.records.length ; j++){
                    var recordsDataCell = gridColumNames.records[j];
                    if(recordsDataCell.datafield != null && recordsDataCell.datafield != ""){
                        var elementArray = {};
                        var cellData = $("#" + gridId).jqxGrid("getcellvalue", rowCount, recordsDataCell.datafield);
                        elementArray[recordsDataCell.datafield] = cellData;
                        $.extend(true, newRowDatas, elementArray);
                    }
                }
                elementData.push(newRowDatas);
//         		}
            }
            return {"gridData":JSON.stringify(elementData)};
        };

        $.fn.fnJqxGridArrDatas = function(gridId){
            var elementData = [];
            var totalRow = $("#" + gridId).jqxGrid('getrows').length;
            var gridColumNames = $("#" + gridId).jqxGrid("columns");
            for(var i = 0; i < totalRow; i++)
            {
                var newRowDatas = {};
                for(var j = 0; j < gridColumNames.records.length ; j++){
                    var recordsDataCell = gridColumNames.records[j];
                    if(recordsDataCell.datafield != null && recordsDataCell.datafield != ""){
                        var elementArray = {};
                        var cellData = $("#" + gridId).jqxGrid("getcellvalue", i, recordsDataCell.datafield);
                        elementArray[recordsDataCell.datafield] = cellData;
                        $.extend(true, newRowDatas, elementArray);
                    }
                }
                elementData.push(newRowDatas);
            }
            return JSON.stringify(elementData);
        };

        $.fn.fnJqxGridSelectDatas = function(gridId){
            var elementData = [];
            var rows = $("#" + gridId).jqxGrid('selectedrowindexes');
            var rowdatas = $("#" + gridId).jqxGrid('getboundrows');
            var gridColumNames = $("#" + gridId).jqxGrid("columns");

            console.log(gridColumNames);

            for(var i = 0; i < rows.length; i++)
            {
                var newRowDatas = {};
                var rowdata = rowdatas[rows[i]];

                for(var j = 0; j < gridColumNames.records.length ; j++){
                    var recordsDataCell = gridColumNames.records[j];
                    if(recordsDataCell.datafield != null && recordsDataCell.datafield != ""){
                        var elementArray = {};
                        elementArray[recordsDataCell.datafield] = eval("rowdata." + recordsDataCell.datafield);

                        console.log("rowdata." + recordsDataCell.datafield);
                        console.log(newRowDatas);
                        console.log(elementArray);

                        $.extend(true, newRowDatas, elementArray);
                    }
                }
                elementData.push(newRowDatas);
            }
            return {"gridData":JSON.stringify(elementData)};
        };

        $.fn.fnJqxGridSelectArrDatas = function(gridId){
            var elementData = [];
            var rows = $("#" + gridId).jqxGrid('selectedrowindexes');
            var rowdatas = $("#" + gridId).jqxGrid('getboundrows');
            var gridColumNames = $("#" + gridId).jqxGrid("columns");
            for(var i = 0; i < rows.length; i++)
            {
                var newRowDatas = {};
                var rowdata = rowdatas[rows[i]];

                for(var j = 0; j < gridColumNames.records.length ; j++){
                    var recordsDataCell = gridColumNames.records[j];
                    if(recordsDataCell.datafield != null && recordsDataCell.datafield != ""){
                        var elementArray = {};
                        elementArray[recordsDataCell.datafield] = eval("rowdata." + recordsDataCell.datafield);
                        $.extend(true, newRowDatas, elementArray);
                    }
                }
                elementData.push(newRowDatas);
            }
            return JSON.stringify(elementData);
        };


        $.fn.serializeObject = function() {
            "use strict"
            var result = {}
            var extend = function(i, element) {
                var node = result[element.name]
                if ("undefined" !== typeof node && node !== null) {
                    if ($.isArray(node)) {
                        node.push(element.value)
                    } else {
                        result[element.name] = [node, element.value]
                    }
                } else {
                    result[element.name] = element.value
                }
            }

            $.each(this.serializeArray(), extend)
            return result
        };

        /* DropDownList Ajax Data
        *  orgStr : 공통코드 값
        */
        $.fn.fnDropDownListCommCode = function(orgStr){
            orgStr = orgStr.substr(1, orgStr.length-2);
            orgStr = orgStr.replace(/}, {/gi, "}-{");
            var data =orgStr.split("-");
            var arr=[];
            for(var i =0; i<data.length; i++){
                var splitStr = data[i].replace(/}/gi,"");
                splitStr = splitStr.replace(/{/gi,"");
                var splitData = splitStr.split(", ");
                var newRowDatas = {};
                for(var j=0; j<splitData.length; j++){
                    var keyValue = splitData[j].split("=");
                    var pushData ={};
                    pushData[keyValue[0]] = keyValue[1];
                    $.extend(true, newRowDatas, pushData);
                }
                arr.push(newRowDatas);
            }
            var chkSource = {
                localdata : arr, datatype : 'arr',
                datafields: [{ name: 'CODE_NM'	, type: 'string' },
                    { name: 'CODE_CD'	, type: 'string' }]
            };

            return new $.jqx.dataAdapter(chkSource,{autoBind : true});
        }
    });

    function gridHeaderWriteChangeColor(header) {
        header.css('font-style', 'italic');
        header.css('background-color', '#dbdbff');
    };

    function commonOZReportExport(ozrName, args){
        var reportForm = document.oz_report_frm;
        window.open("" ,"reportForm", "toolbar=no, width=1000, height=620, left=0, top=-150");
        $("#oz_report_frm").find("#ozrName").val(ozrName);
        $("#oz_report_frm").find("#ozrParamVal").val("url=" + args);
        reportForm.action = "/barcodeMakePrint";
        reportForm.method = "post";
        reportForm.target = "reportForm";
        reportForm.submit();
    }

    function commonOZReportExportJs(ozrName, args){
        var reportForm = document.oz_report_frm;
        window.open("" ,"reportForm", "toolbar=no, width=1000, height=620, left=0, top=-150");
        $("#oz_report_frm").find("#ozrName").val(ozrName);
        $("#oz_report_frm").find("#ozrParamVal").val("url=" + args);
        reportForm.action = "/barcodeMakePrintJs";
        reportForm.method = "post";
        reportForm.target = "reportForm";
        reportForm.submit();
    }

    var gridBackgroudColor = function (row, column, value, data) {
        var color ="";
        if(column == "PO_ISSUED_DT"){
            if(value !="" && value!=null) color = "CELL08";
        }else if(column == "RECEIVE_DT"){
            if(value !="" && value!=null) color = "CELL07";
        }else if(column == "PACKING_MAKE_DT"){
            if(value !="" && value!=null) color = "CELL06";
        }else if(column == "PACKING_UPLOAD_DT"){
            if(value !="" && value!=null) color = "CELL05";
        }else if(column == "COMPLETE_DT"){
            if(value !="" && value!=null) color = "CELL04";
        }else if(column == "ETD"){
            if(value !="" && value!=null) color = "CELL03";
        }else if(column == "ETA"){
            if(value !="" && value!=null) color = "CELL03";
        }else if(column == "SEDO_RECEIVE_DT"){
            if(value !="" && value!=null) color = "CELL01";
        }
        return color;
    };

    var gridCancelStyle = function (row, column, value, data) {
        var style ="";
        var theStatus = data.PO_CANCEL_DT;

        if(theStatus != "" && theStatus != null) style = "jqx_grid_cancel"

        return style;
    };

    var gridSchedulerPackingBalanceStatusStyle = function (row, column, value, data) {
        var style ="";

        var packingBalance = parseInt(data.PACKING_BALANCE);

        if(packingBalance == 0) style = "jqx_grid_blue_status"
        else if(packingBalance > 0) style = "jqx_grid_yellow_status"
        else if(packingBalance < 0) style = "jqx_grid_red_status"
        return style;
    };

    var gridSchedulerDeliveryBalanceStatusStyle = function (row, column, value, data) {
        var style ="";

        var invoiceBalance = parseInt(data.DELIVERY_BALANCE);

        if(invoiceBalance == 0) style = "jqx_grid_blue_status"
        else if(invoiceBalance > 0) style = "jqx_grid_yellow_status"
        else if(invoiceBalance < 0) style = "jqx_grid_red_status"

        return style;
    };

    var gridBarcodePackingMakeStyle = function (row, column, value, data) {
        var style ="";

        var mappingSeq = data.BARCODE_BASIC_SEQ;
        var makeYn = parseInt(data.MAKE_YN);
        var printYn = parseInt(data.PRINT_YN);
        var cancelYn = data.CANCEL_YN;


        var id = $('#make_to_shipping_mark_grid01').jqxGrid('getrowid', row)
        var rD = $('#make_to_shipping_mark_grid01').jqxGrid('getrowdatabyid', id);

        $("#contentmake_to_shipping_mark_grid01 > .jqx-grid-column-header > .jqx-checkbox").remove();

        if(cancelYn != 'CANCEL') {
            if(column == 'FILE_NO_CD' || column == 'MATERIAL_CD' || column == 'MATERIAL_NM' || column == 'SPEC_NM' || column == 'COLOR' || column == 'REMARK_SCODE' ) {
                if(mappingSeq == undefined || mappingSeq == "") style = "jqx_grid_green_status"		// 바코드 매핑이 안된것
                else if(makeYn == 0) style = "jqx_grid_red_status"		// 바코드 생성 안 한것
                else if(printYn == 0) style = "jqx_grid_yellow_status"	// 바코드 출력을 안 한것
                else style = "jqx_grid_blue_status"					// 완료 대기 처리
            }
        }else {
            style = "jqx_grid_cancel"
            //	$("#row"+row+"make_to_shipping_mark_grid01 > .jqx-grid-cell > .jqx-checkbox").remove();
            //	$("#row"+row+"make_to_shipping_mark_grid01").addClass("isCancel");
        }

        return style;
    };

    var gridBarcodePackingPrintStyle = function (row, column, value, data) {
        var style ="";

        var printYn = data.PRINT_YN;
        var batchYn = data.BATCH_PRINT_YN;

        if(batchYn == '1') style = "jqx_grid_blue_font" // 일괄출력 처리한것
        if(printYn == 'Y') style = "jqx_grid_blue_status"	// 바코드 출력을 한것
        return style;
    };

    var gridNetGrossCbmStyle = function (row, column, value, data) {
        var style= "";

        var nw = data.NET_WEIGHT;
        var gw = data.GROSS_WEIGHT;
        var cbm = data.CBM;

        if(nw == undefined || gw == undefined || cbm == undefined) {
            style = "jqx_grid_green_status"
        }

        return style;
    };

    var gridFileNoTotalStatusStyle = function (row, column, value, data) {
        var style ="";
        var poRateBalance = parseFloat(data.RATE);

        if(poRateBalance == 100) style = "jqx_grid_blue_status"
        else if(poRateBalance > 100) style = "jqx_grid_yellow_status"
        else if(poRateBalance < 100) style = "jqx_grid_red_status"

        return style;
    };
    var gridMaterialProgressStyle = function (row, column, value, data) {
        var style ="";
        var cancel_po_yn = data.CANCEL_PO_YN;
        if(cancel_po_yn == 'Y') {
            style = "jqx_grid_cancel";
        }
        return style;
    }
    var gridPoCloseStyle = function (row, column, value, data) {
        /*	var style ="";
            var po_close_yn = data.PO_CLOSE_YN;
            if(po_close_yn == 'Y') {
                style = "jqx_grid_blue_status";
            }
            return style;  */

        var style ="";
        var status = data.STATUS;
        if(status == 'QTY_COMPLETE') {
            style = "jqx_grid_red_status";
        }else if(status == 'INVOICE') {
            style = "jqx_grid_blue_status";
        }
        return style;
    }
    var gridPoCloseNotMappingIncludeStyle = function (row, column, value, data) {
        // alert('test');
        /*	var style ="";
            var po_close_yn = data.PO_CLOSE_YN;
            if(po_close_yn == 'Y') {
                style = "jqx_grid_blue_status";
            }
            return style;  */

        var style ="";
        var status = data.STATUS;
        if(status == 'QTY_COMPLETE') {
            style = "jqx_grid_red_status";
        }else if(status == 'INVOICE') {
            style = "jqx_grid_blue_status";
        }else if(status == 'NOTMAPPING') {
            style = "jqx_grid_green_status";
        }
        return style;
    }
    var gridReceiptCompleteStyle = function (row, column, value, data) {
        var style ="";
        var status = data.COMPLETE_YN;
        if(status == 'N') {
            style = "jqx_grid_red_status";
        }else if(status == 'Y') {
            style = "jqx_grid_blue_status";
        }
        return style;
    }
    var gridWmsReceiptBarcodeStyle  = function (row, column, value, data) {
        var style ="";
        var status = data.DEL_USE_YN;
        if(status == 'N') {
            style = "jqx_grid_red_status";
        }else if(status == 'Y') {
            style = "";
        }
        return style;
    }
    function modalConfirm(message,callback ){

        $("#modal_confirm_message").html(message);
        $("#confirm-modal").modal('show');

        $("#modal-btn-yes").unbind('click');

        $("#modal-btn-yes").on("click", function(){
            callback(true);
            $("#confirm-modal").modal('hide');
        });

        $("#modal-btn-no").unbind('click');

        $("#modal-btn-no").on("click", function(){
            callback(false);
            $("#confirm-modal").modal('hide');
        });

        $("#confirm-modal").on('keydown',function(e) {
            if(e.keyCode == 13) {
                $("#modal-btn-yes").trigger('click');
            }else if(e.keyCode == 27) {
                $("#modal-btn-close").trigger('click');
            }
        })
    };

    function modalAlert(message) {

        $("#modal_alert_message").html(message);
        $("#alert-modal").modal('show');

        $("#modal-btn-close").unbind('click');
        $("#modal-btn-close").on("click", function(){
            $("#alert-modal").modal('hide');
        });

        $("#alert-modal").on('keydown',function(e) {
            if(e.keyCode == 13 || e.keyCode == 27) {
                $("#modal-btn-close").trigger('click');
            }
        })
    }

    var remarkVendor = [
        'SEDO0040', 'SEDO0041','SEDO0046','SEDO0051','SEDO0079','SEDO0096','SEDO0098','SEDO0099','SEDO0100','SEDO0101','SEDO0114','SEDO0117','SEDO0131','SEDO0132'
    ];

    // 숫자 포맷맞추기
    function pad(n, width) {
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }

</script>