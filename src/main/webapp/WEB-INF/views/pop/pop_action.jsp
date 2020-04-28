<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP</title>
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
    <!-- <link rel="shortcut icon" href="/asset/images/common/favicon-32.png"> -->
    <!-- Chrome, Safari, IE -->
    <!-- <link rel="icon" href="/asset/images/common/favicon.ico"> -->
    <!-- Android&IOS Touch Icon -->
    <!-- <link rel="apple-touch-icon-precomposed" href="/asset/images/common/favicon-152.png"> -->
    <!--jQueryUI version >= 1.11.4 only -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" />
    <!--ParamQuery Grid css files-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.min.css" />
    <!--add pqgrid.ui.css for jQueryUI theme support-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
    <!--Bootstrap dependencies-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <!--add pqgrid.bootstrap.css for bootstrap related classes-->
    <link rel="stylesheet" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <link href="/resource/asset/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/webFont.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/customer.css" rel="stylesheet" type="text/css" />
    <link href="/resource/main/js/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css" />

    <link href="/resource/asset/css/pop.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <script src='/resource/main/js/bootstrap.js'></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <!--jQuery dependencies-->
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resource/main/js/jquery-ui-timepicker-addon.js" ></script>
    <script type="text/javascript" src="/resource/main/js/jquery.ui.datepicker-ko.js" ></script>
    <!--ParamQuery Grid js files-->
    <script type="text/javascript" src="/resource/plugins/paramquery/pqgrid.min.js" ></script>
    <!--ParamQuery Grid localization file (necessary since v5.2.0)-->
    <script src="/resource/plugins/paramquery/localize/pq-localize-en.js"></script>
    <!--Include jsZip file to support xlsx and zip export (optional)-->
    <script type="text/javascript" src="/resource/plugins/paramquery/jsZip-2.5.0/jszip.min.js" ></script>
    <!--Include jquery.resize to support auto height of detail views in hierarchy (optional)-->
    <script type="text/javascript" src="/resource/plugins/paramquery/resize/jquery.resize.js" ></script>
    <!--Include pqTouch file to provide support for touch devices (optional)-->
    <script type="text/javascript" src="/resource/plugins/paramquery/pqTouch/pqtouch.min.js" ></script>
    <script type="text/javascript" src="/resource/plugins/paramquery/pqSelect/pqselect.min.js" ></script>
    <%--<script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>--%>
</head>
<body>

    <div class="page estimate">
        <div class="topWrap">
            <div class="conWrap">
                <div class="titWrap">
                    <div class="left_float">
                        <span class="slt_wrap">
						    <label for="projectSltd">위치정보</label>
                            <select id="projectSltd" name="projectSltd" title="사업자구분" class="wd_200">
                                <option value="" selected="selected">검사실</option>
                                <option value="1">1 공장</option>
                                <option value="2">2 공장</option>
                            </select>
                        </span>
                        <span class="wd_200">&nbsp;</span>
                        <span class="barCode"><img src="/resource/asset/images/common/img_barcode.png" alt="바코드"></span>
                        <span class="ipu_wrap"><input type="text" name="priceSltd" id="priceSltd" placeholder="읽기 불가능 모드" value="" title="바코드번호"></span>
                        <span class="barCodeTxt">(바코드 이미지를 클릭하고 읽기가능 모드에서 출력물의 바코드를 스캔해 주세요.)</span>
                    </div>
                    <div class="right_float">
                        <span class="refresh"><a href="#a;"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></a></span>
                        <span class="rowCodeTxt">Total :   <span class="rowCodeTxtColor"> 27</span> Rows   <span class="rowCodeTxtColor">103</span> EA</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottomWrap">
            <div class="tableWrap">
                <div class="conWrap">
                    <div id="control_parts_pop_grid"></div>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>

        var g_code;
        let $userMasterGrid;
        let userMasterGridId = 'control_parts_pop_grid';

        $(function () {
            'use strict';

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

            let userMasterColModel = [
                {title: '긴급', clsHead: 'control_manage_view_quality', dataType: 'string', dataIndx: 'EMERGENCY_YN'},
                {title: '요망납기', width: 100, datatype: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
                {title: '발주업체', clsHead: 'display_none', dataType: 'string', dataIndx: 'ORDER_COMP_CD', hidden: true},
                {title: '발주업체', width: 150, dataType: 'string', dataIndx: 'ORDER_COMP_NM'},
                {title: '관리번호', clsHead: 'control_manage_view_estimate', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM', },
                {
                    title: 'Part', dataType: 'integer', dataIndx: 'PART_NUM',
                    render: function (ui) {
                        if (ui.rowData.WORK_TYPE === 'WTP020') {
                            return "<span></span>";
                        }
                    }
                },
                {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER', hidden: true},
                {title: '도면번호', width: 120, dataType: 'string', dataIndx: 'DRAWING_NUM', },
                {title: '규격', width: 110, dataType: 'string', dataIndx: 'SIZE_TXT', },
                {title: '소재 종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', hidden: true},
                {title: '소재 종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM'},
                {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE', hidden: true},
                {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM'},
                {title: '소재 형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', hidden: true},
                {title: '소재 형태', width: 100, dataType: 'string', dataIndx: 'MATERIAL_KIND_NM'},
                {title: '표면 처리', width: 80, dataType: 'string', dataIndx: 'SURFACE_TREAT'},
                {title: '열 처리', dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT'},
                {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', },
                {title: 'Part 단위 수량', width: 120, dataType: 'integer', dataIndx: 'PART_UNIT_QTY'},
                {title: '등록/업데이트 일시', width: 120, dataType: 'string', dataIndx: 'STATUS_DT'}
            ];
            let userMasterObj = {
                minHeight: "100%",
                height: 800,
                width: "100%",
                editable: false,
                flexWidth: false,
                collapsible: false,
                resizable: true,
                showTitle: false,
                numberCell: {title: 'No.'},
                trackModel: {on: true},
                scrollModel: { autoFit: true },
                columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', editable: false},
                colModel: userMasterColModel,
                dataModel: {
                    recIndx: 'ROWNUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                    postData: { "queryId" : "orderMapper.selectControlManageList"},
                    getData: function (response, textStatus, jqXHR) {
                        return {data: response.data};
                    }
                },
                toolbar: false
            };
            $userMasterGrid = $('#' + userMasterGridId).pqGrid(userMasterObj);
        });

    </script>
</body>
</html>