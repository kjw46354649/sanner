<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP</title>
    <!--jQueryUI version >= 1.11.4 only -->
    <link rel="stylesheet" href="/resource/plugins/jquery-ui-1.11.4/themes/smoothness/jquery-ui.min.css" />
    <!--ParamQuery Grid css files-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.min.css" />
    <!--add pqgrid.ui.css for jQueryUI theme support-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
    <!--Bootstrap dependencies-->
    <link rel="stylesheet" href="/resource/main/css/bootstrap.css" />
    <!--add pqgrid.bootstrap.css for bootstrap related classes-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <link rel="stylesheet" href="/resource/plugins/dhtmlx/suite.css" />
    <!-- print -->
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/webFont.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/style.css" />

    <link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
    <link rel="stylesheet" type="text/css"href="/resource/plugins/waitme/waitMe.css" />

    <link rel="stylesheet" type="text/css" href="/resource/main/js/jquery-ui-timepicker-addon.css" />
    <link rel="stylesheet" type="text/css" href="/resource/main/js/combotree/style.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/pop.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <!--jQuery dependencies-->
    <script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
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

    <script type="text/javascript" src='/resource/plugins/waitme/waitMe.js'></script>
    <script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>
    <!-- barcode -->
    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>
    <style type="text/css">
        .dhx_message__icon{
            color:#ffffff !important;
        }
        .dhx_message__text{
            color: #ffffff !important;
        }
        .dhx_message {
            width: 100%;
            background-color: #0469fd !important;
        }
        .dhx_message-container--top-right {
            top: 300px;
            right: 380px;
            text-align: center;
        }
        div.pq-grid *
        {
            font-size: 20px;
        }
        .pq-grid-cell > .pq-td-div{
        	max-height: 35px;
        }
        .pq-grid-number-cell {
            text-align: center !important;
        }
        /*div.pq-header-outer **/
        /*{*/
        /*    height: 50px;*/
        /*}*/
        /*div.pq-grid-col **/
        /*{*/
        /*    height: 50px;*/
        /*}*/
    </style>
</head>
<%--<body>--%>
<body onresize="parent.resizeTo(1620,1080)" onload="parent.resizeTo(1620,1080)" id="scannerbarcodeDiv">
    <div class="page estimate waitMeContainerDiv">
        <div class="topWrap">
            <div class="conWrap">
                <div class="titWrap">
                    <div class="left_float">
                        <form id="pop_search_form" name="pop_search_form" method="POST">
                            <input type="hidden" id="queryId" name="queryId" value="popMapper.selectPopList"/>
                            <input type="hidden" id="PART_STATUS" name="PART_STATUS" value=""/>
                            <input type="hidden" id="RECEIVE_YN" name="RECEIVE_YN" value=""/>
                            <span class="slt_wrap">
<%--                                <label for="popLocation">위치정보</label>--%>
                                <select id="popLocation" name="popLocation" title="위치정보" class="wd_200">
                                    <c:forEach var="code" items="${HighCode.H_1009}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="wd_200">&nbsp;</span>
                            <span class="ipu_wrap"><img id="barCodeImg" class="barCodeImg" src="/resource/asset/images/common/img_barcode_long.png"  style="height: 50px;" alt="바코드"></span>
                            <span class="ipu_wrap" style="padding-left: 10px;"><input type="text" name="popBarcode" id="popBarcode" class="popBarcode" placeholder="읽기 불가능 모드" value="" title="바코드번호"></span>
                        </form>
                    </div>
                    <div class="right_float">
                        <span class="ipu_wrap">
                            <span class="refresh" id="popRefresh"><a href="#a;"><img src="/resource/asset/images/common/btn_refresh.png" style="width: 45px;" alt="새로고침"></a></span>
                            <span class="rowCodeTxt">Total :
                                <span class="rowCodeTxtColor" id="popTotalRows">0</span> Rows
                                <span class="rowCodeTxtColor" id="popTotalQty">0</span> EA
                            </span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="basicWrap" style="display: none;">
            <span class="barCodeTxt">바코드 이미지를 클릭하고 읽기가능 모드에서 출력물의 바코드를 스캔해 주세요.</span>
        </div>
        <div class="popBottomWrap">
            <div class="tableWrap">
                <div class="conWrap">
                    <div id="control_parts_pop_grid"></div>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>

        var g_code;
        var $popMasterGrid;
        var g_noData = '<div style="font-size:14px;margin-top:20px;">Not Found Data.</div>';
        var popMasterGridId = 'control_parts_pop_grid';

        var $waitMeMainContainer;

        $(function () {
            'use strict';

            $.fn.startWaitMe = function() {
                $waitMeMainContainer = $('#waitMeContainerDiv').waitMe({});
            };

            $.fn.stopWaitMe = function() {
                $waitMeMainContainer.waitMe('hide');
            };

            onScan.attachTo(document.getElementById("popBarcode"), {
                onScan: function(barcodeNum, iQty) {
                    $(this).startWaitMe();
                    sendDrawingNum(barcodeNum);
                }
            });

            var popMasterColModel = [
                {title: '긴급', minWidth: 30, width: 45, dataType: 'string', aligin: 'center', dataIndx: 'EMERGENCY_YN'},
                {title: '요망납기', minWidth: 30, width: 85, datatype: 'string', dataIndx: 'INNER_DUE_DT'},
                {title: '발주업체', minWidth: 30, width: 150, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
                {title: '관리번호', minWidth: 30, width: 300, dataType: 'string', dataIndx: 'CONTROL_NUM', },
                {
                    title: 'Part', minWidth: 30, width: 50, dataType: 'integer', dataIndx: 'PART_NUM',
                    render: function (ui) {
                        if (ui.rowData.WORK_TYPE === 'WTP020') {
                            return "<span></span>";
                        }
                    }
                },
                // {title: '도면번호', minWidth: 30, width: 160, dataType: 'string', dataIndx: 'DRAWING_NUM', },
                {title: '규격', minWidth: 30, width: 120, dataType: 'string', dataIndx: 'SIZE_TXT', },
                // {title: '표면 처리', minWidth: 30, width: 100, dataType: 'string', dataIndx: 'SURFACE_TREAT'},
                {title: '수량', minWidth: 30, width: 70, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY'},
                {title: '현재위치', minWidth: 30, width: 150, dataType: 'string', dataIndx: 'POP_POSITION' },
                {title: '이전위치', minWidth: 30, width: 150, dataType: 'string', dataIndx: 'POP_PREV_POSITION'},
                {title: '위치일시', minWidth: 30, width: 150, dataType: 'string', dataIndx: 'POP_DT'},
                {title: '비고', minWidth: 30, width: 300, dataType: 'string', dataIndx: ''}
            ];

            var popMasterObj = {
                width: "100%", height: 1720, collapsible: false, postRenderInterval: -1, //call postRender synchronously.
                resizable: false, showTitle: false, strNoRows: g_noData, numberCell: {width:50, title: 'No.'}, editable: false, scrollModel: { autoFit: false },
                trackModel: {on: true}, columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
                colModel: popMasterColModel,
                dataModel: {
                    recIndx: 'ROWNUM', location: 'remote', dataType: 'json', method: 'POST', url: '/popParamQueryGridSelect',
                    postData: fnFormToJsonArrayData('#pop_search_form'),
                    getData: function (response, textStatus, jqXHR) {
                        return {data: response.data};
                    }
                },
                toolbar: false,
                complete : function(ui, event){
                    var data = $popMasterGrid.pqGrid('option', 'dataModel.data');
                    var totalRows = data.length;
                    var totalQty = 0;
                    for(var i=0; i<totalRows; i++) {
                        var ORDER_QTY = data[i].ORDER_QTY == undefined ? 0 : data[i].ORDER_QTY;
                        totalQty += parseInt(ORDER_QTY);
                    }
                    $("#popTotalRows").html(totalRows);
                    $("#popTotalQty").html(totalQty);
                }
            };
            $popMasterGrid = $('#' + popMasterGridId).pqGrid(popMasterObj);

            var sendDrawingNum = function(barcodeNum){
                'use strict';
                var message = "";
                $.ajax({
                    type: 'POST', url: "/popScanningBarcodePop", dataType: 'json',
                    data: $("#pop_search_form").serialize(),
                    success: function (data, textStatus, jqXHR) {
                        $(this).stopWaitMe();
                        $("#pop_search_form").find("#popBarcode").val('');
                        var returnCode = data.returnCode;
                        if (textStatus === 'success') {
                            if(returnCode == "RET00"){
                                message = data.controlInfo + '\n' + data.locationInfo;
                            }else{
                                message = data.message;
                            }
                            showMessage(message);
                            $("#pop_search_form").find("#popBarcode").val('');
                            refreshData();
                        }else{
                            $("#pop_search_form").find("#popBarcode").val('');
                            message = "시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.";
                            showMessage(message);
                            refreshData();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (!($waitMeMainContainer === undefined)) $(this).stopWaitMe();
                        $("#pop_search_form").find("#popBarcode").val('');
                        message = "시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.";
                        showMessage(message);
                        refreshData();
                    }
                });
            };

            $("#popLocation").on('change', function(){
                refreshData();
            });

            $("#popBarcode").on('change', function(){
                var barcode = $(this).val();
                if( barcode.length == 10) {
                    scanningBarcode();
                }
            });

            $("#popBarcode").on('focus', function(){
                $(this).attr('placeholder', '');
                $(".basicWrap").hide();
                $("#barCodeImg").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
                $popMasterGrid.pqGrid('option', 'height', 1850).pqGrid('refresh');
            });

            $("#popBarcode").on('focusout', function(){
                $(this).attr('placeholder', '읽기 불가능 모드');
                $(".basicWrap").show();
                $("#barCodeImg").attr("src", "/resource/asset/images/common/img_barcode_long.png");
                $popMasterGrid.pqGrid('option', 'height', 1810).pqGrid('refresh');
            });

            $("#barCodeImg").on('click', function(){
                $("#popBarcode").focus();
            });

            $("#popRefresh").on('click', function(){
                refreshData();
            });

            var refreshData = function(){
                $("#pop_search_form").find("#queryId").val("popMapper.selectPopList");
                $("#pop_search_form").find("#popBarcode").val('');
                $("#pop_search_form").find("#popBarcode").focus();
                $popMasterGrid.pqGrid('option', "dataModel.postData", function (ui) {
                    return (fnFormToJsonArrayData('#pop_search_form'));
                });
                $popMasterGrid.pqGrid('refreshDataAndView');
            };

            var showMessage = function(message){
                dhx.message({
                   text: message, icon: "dxi-close", "expire": 2000, "position": "top-right", type:"myCss"
                });
            }

            /** 30초마다 그리드 재조회 **/
            setInterval(function() {
                refreshData();
            }, 1000 * 30);

            $("#popBarcode").focus();

        });

        var fnFormToJsonArrayData = function (formid) {
            if(formid.indexOf("#") == -1) formid = "#"+formid;
            var elementArray = {};
            var formArr = $(formid).serializeArray();
            for(var i=0; i < formArr.length; i++) {
                var tmp = formArr[i];
                var name = tmp.name;
                var value = "";
                if(name != null){
                    var $ctrl = $(formid).find('[name='+name+']');
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
    </script>
</body>
</html>