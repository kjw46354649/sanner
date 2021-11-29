<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>J-MES</title>
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- Chrome, Safari, IE -->
    <link rel="stylesheet" type="text/css" href="/resource/pop/XEIcon/xeicon.min.css">
    <link rel="stylesheet" href="/resource/process/css/common2.css">
    <link rel="stylesheet" type="text/css" href="/resource/process/bootstrap-3.3.2-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
    <link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />

    <style type="text/css">
        *{margin: 0; padding: 0; box-sizing: border-box;}
        a{text-decoration: none; color: black;}
        ul,dl,ol { list-style: none;}
        #process_dash_board_main_grid {font-size: 1.2rem;color:black;}
        #process_complete_grid {font-size: 1.2rem;}
        label {margin-bottom: 0;}
        #g_item_detail_pop_grid_01 {font-size: 1rem;}
        #g_item_detail_pop_grid_02 {font-size: 1rem;}
        #g_item_detail_pop_grid_03 {font-size: 1rem;}
        #g_item_detail_pop_grid_04 {font-size: 1rem; height: 110px;}
        #g_item_detail_pop_grid_05 {font-size: 1rem;}
        #g_item_detail_pop_grid_06 {font-size: 1rem;}
        #processPop_grid {font-size: 1rem;}

        #g_item_detail_pop table.rowStyle th, #g_item_detail_pop table.rowStyle td {font-size: 14px;height: 36px;}

        @-webkit-keyframes blink {
            0% { background: #9be15d;}
            50% { background: #ffd200;}
            100% { background: #9be15d;}
        }

        @keyframes blink {
            0% { background: #9be15d;}
            50% { background: #ffd200;}
            100% { background: #9be15d;}
        }
        #process_complete_grid .pq-grid-row, #process_dash_board_main_grid .pq-grid-row {
            background: #f5fbff;
            color: #333;
        }
        #process_complete_grid .pq-grid-row.pq-striped, #process_dash_board_main_grid .pq-grid-row.pq-striped {
            background: #eaf1fd;
        }
        /*#process_dash_board_main_grid .pq-grid-cell {
            height: 40px !important;
        }*/
        .pq-grid {
            font-family: 'notoM'
        }

        .header_inside {
            font-size: 12px !important;
            line-height: 23px !important;
            font-weight: 500;
        }
        .lineH15 {
            line-height: 15px !important;
        }
        .column_inside {
            font-size: 12px !important;
            line-height: 11px !important;
            font-weight: 500;
            color: #2d5785;
        }
        .column_hover:hover {
            cursor: pointer;
            text-decoration: underline;
        }
        #processPopup .pq-grid-header-table>.pq-grid-row>.pq-grid-number-cell {background: #aedcff;}

        .dash_bg_yellow {
            background-color: #faf7c0 !important;
        }

        .pq-grid-header-table .pq-title-span {
            text-decoration : none !important;
        }
    </style>
</head>

<body>
<section class="w100 h100 p-2">
    <h1 class="main_title mb-2 pl-2" style="padding: 4px;"><i class="xi-presentation font-weight-bold pr-2"></i>가공진행현황</h1>
    <div class="display_f h94v">
        <!-- 왼쪽구역 -->
        <div class="w70 h100 pl-2 pr-1">
            <!-- 주문가공 진행현황 -->
            <div class="w100 h60 shadow rounded mb-2">
                <div class="sub_title">
                    <p>주문가공 진행현황</p>
                </div>
                <form class="form-inline" name="PROCESS_DASH_MAIN_FORM" id="PROCESS_DASH_MAIN_FORM" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="process.selectProcessMainGrid">
                    <div id="process_dash_board_main_grid" class="border_color h90 m-2 box-scroll grid_wrap1">
                    </div>
                </form>
            </div>

            <!-- 왼쪽 아래 구역 -->
            <div class="display_f h40 mt-1">
                <!-- 재고가공 진행현황 -->
                <div class="w60 h100 shadow rounded mr-2">
                    <div class="sub_title">
                        <p>재고가공 진행현황</p>
                    </div>
                    <div class="border_color h80 m-2 grid_wrap4 display_f">
                        <div id="stockProcessCompDiv" class="w10 h100 box-scroll border_color_R p-1">
                        </div>
                        <div id="stockProcessListDiv" class="w90 h100 box-scroll">
                        </div>
                    </div>
                </div>
                <!-- 외주가공 진행현황 -->
                <div class="w40 h100 shadow rounded">
                    <div class="sub_title">
                        <p>외주가공 진행현황</p>
                    </div>
                    <div id="outsideProcessDiv" class="border_color h80 m-2 box-scroll grid_wrap4">
                    </div>
                </div>
            </div>
        </div>

        <!-- 오른쪽 구역 -->
        <div class="w30 h100 pr-2 pl-1">
            <!-- 오른쪽 위 구역-->
            <div class="h60 pb-2 mb-2">
                <!--가공 중 현황-->
                <div class="h40 shadow rounded mb-2">
                    <div class="sub_title">
                        <p>가공 중 현황</p>
                        <span class="sub_title2">집계대상 : <span class="text-primary">가공중</span></span>
                    </div>
                    <div class="display_f p-2 h80 grid_wrap2">
                        <div class="w33 h100 display_f">
                            <div class="w40 h100">
                                <div class="position_R" style="height: 45%;margin-top: 50%;">
                                    <img src="./resource/process/images/process_1.png" alt="주문가공" class="w100 process_img">
                                </div>
                                <div class="h20 pt-2">
                                    <p class="font-weight-bold text-center font14">주문가공</p>
                                </div>
                            </div>
                            <div class="w60 h100">
                                <div class="position_R" style="height: 35%;margin-top: 45%;">
                                    <span class="text-primary process_percent" id="ORDER_PROCESSING_PERCENT"></span>
                                </div>
                                <div class="h20" style="text-align: center">
                                    <span class="font-weight-bold text-center" id="ORDER_PROCESSING_CNT"></span>
                                    <span class="text-light2" id="ORDER_PROCESSING_QTY">()</span>
                                </div>
                            </div>
                        </div>
                        <div class="w33 h100 display_f">
                            <div class="w40 h100">
                                <div class="position_R" style="height: 45%;margin-top: 50%;">
                                    <img src="./resource/process/images/process_2.png" alt="재고가공" class="w100 process_img">
                                </div>
                                <div class="h20 pt-2">
                                    <p class="font-weight-bold text-center font14">재고가공</p>
                                </div>
                            </div>
                            <div class="w60 h100">
                                <div class="position_R" style="height: 35%;margin-top: 45%;">
                                    <span class="text-primary process_percent" id="STOCK_PROCESSING_PERCENT"></span>
                                </div>
                                <div class="h20" style="text-align: center">
                                    <span class="font-weight-bold text-center" id="STOCK_PROCESSING_CNT"></span>
                                    <span class="text-light2" id="STOCK_PROCESSING_QTY"></span>
                                </div>
                            </div>
                        </div>
                        <div class="w33 h100 display_f">
                            <div class="w40 h100">
                                <div class="position_R" style="height: 45%;margin-top: 50%;">
                                    <img src="./resource/process/images/process_3.png" alt="외주가공" class="w100 process_img">
                                </div>
                                <div class="h20 pt-2">
                                    <p class="font-weight-bold text-center font14">외주가공</p>
                                </div>
                            </div>
                            <div class="w60 h100">
                                <div class="position_R" style="height: 35%;margin-top: 45%;">
                                    <span class="text-primary process_percent" id="OUTSIDE_PROCESSING_PERCENT"></span>
                                </div>
                                <div class="h20" style="text-align: center">
                                    <span class="font-weight-bold text-center" id="OUTSIDE_PROCESSING_CNT"></span>
                                    <span class="text-light2" id="OUTSIDE_PROCESSING_QTY"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--가공 완료 현황-->
                <div class="h60 shadow rounded">
                    <div class="sub_title">
                        <p>가공 완료 현황</p>
                    </div>
                    <form class="form-inline" name="PROCESS_DASH_SUB_FORM" id="PROCESS_DASH_SUB_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="process.selectProcessCompleteList">
                        <div id="process_complete_grid" class="border_color h80 m-2 box-scroll grid_wrap3">

                        </div>
                    </form>
                </div>
            </div>

            <!-- 오른쪽 아래 구역-->
            <div class="h40 shadow rounded">
                <div class="sub_title">
                    <p>가공 대기 현황</p>
                    <span class="sub_title2">집계대상 : <span class="text-primary">가공확정 - 소재입고</span></span>
                </div>
                <div class="border_color h80 m-2 box-scroll grid_wrap4 display_f">
                    <div class="w10 h100 border_color_R">
                        <div class="h100 border_color_B p-1">
                            <div class="block_box block_box_small back_purple">
                                <p class="small">재질별</p>
                            </div>
                        </div>
<%--                        <div class="h75 p-1">--%> <!-- 21.11.01 이후에 추가 개발될 영역. 현재는 숨김 -->
<%--                            <div class="block_box block_box_small back_gray">--%>
<%--                                <p class="small">기타</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                    <div class="w90 h100">
                        <div id="waitMaterialDiv" class="h100 border_color_B box-scroll">
                        </div>
<%--                        <div class="h75 box-scroll">--%> <!-- 21.11.01 이후에 추가 개발될 영역. 현재는 숨김 -->
<%--                            <div class="block_box back_gray pt-3">--%>
<%--                                <p>대형</p>--%>
<%--                                <p>14 (24)</p>--%>
<%--                            </div>--%>
<%--                            <div class="block_box back_gray pt-3">--%>
<%--                                <p>대형</p>--%>
<%--                                <p>14 (24)</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<!--팝업 시작-->
<div id="processPopup" class="popupWrap popupBackground">
    <!--팝업위치기준-->
    <div class="popupContainer">
        <!--팝업내용-->
        <div class="popup">
            <h3><i class="xi-library-bookmark"></i>작업 목록 조회</h3>
            <div class="display_f h90 my-2" style="height: 95%;">
                <div class="left_wrap h100 w50 mx-1 position_R" style="width: 46%;">
                    <div class="left_top_wrap">
                        <span class="from_main_grid">주문가공 진행현황</span>
                        <span class="from_outside">외주가공 진행현황</span>
                        <span class="from_non_complete">미완료 현황</span>
                        <span class="from_material" style="display: none;">가공대기현황 (<span class="text-primary">재질별</span>)</span>
                        <span class="text-primary from_main_grid" id="processPop_comp_nm"></span>
                    </div>
                    <form class="form-inline" name="PROCESS_POP_FORM" id="PROCESS_POP_FORM" role="form">
                        <input type="hidden" name="queryId" id="queryId" value="process.selectProcessPop_company">
                        <input type="hidden" name="IMG_GFILE_SEQ" id="IMG_GFILE_SEQ" value="">
                        <input type="hidden" name="ORDER_COMP_CD" id="ORDER_COMP_CD" value="">
                        <input type="hidden" name="MATERIAL_TYPE" id="MATERIAL_TYPE" value="">
                        <input type="hidden" name="PART_STATUS" id="PART_STATUS" value="">
                        <input type="hidden" name="INNER_DUE_DT" id="INNER_DUE_DT" value="">
                    </form>
                    <div id="processPopOutsideDiv" class="h10 w100 box-scroll-x left_wrap1 from_outside" style="display: none;height: 13.5%;">
                    </div>
                    <div id="processPopMaterialDiv" class="h10 w100 box-scroll-x left_wrap1 from_material" style="display: none;">
                    </div>
                    <div id="processPopNonCompleteDiv" class="h10 w100 box-scroll-x left_wrap1 from_non_complete" style="display: none;">
                    </div>
                    <div id="processPopMainGridDiv" class="h10 w100 box-scroll-x left_wrap1 display_f text-center p-1 from_main_grid" style="display: none;">
                        <div id="DIV_TOTAL" class="w10 h100 status1 pt-3">
                            <p>계</p>
                            <p id="TOTAL_CNT"></p>
                            <span class="lineH15">(<span id="TOTAL_QTY"></span>)</span>
                        </div>
                        <div id="DIV_PROCESS_CONFIRM" class="w10 h100 status2 pt-3">
                            <p>가공확정</p>
                            <p id="PROCESS_CONFIRM_CNT"></p>
                            <span class="lineH15">(<span id="PROCESS_CONFIRM_QTY"></span>)</span>
                        </div>
                        <div id="DIV_MATCH_STOCK" class="w10 h100 status3 pt-3">
                            <p>재고충당대기</p>
                            <p id="MATCH_STOCK_CNT"></p>
                            <span class="lineH15">(<span id="MATCH_STOCK_QTY"></span>)</span>
                        </div>
                        <div id="DIV_WAIT_MATERIAL" class="w10 h100 status4 pt-3">
                            <p>소재입고대기</p>
                            <p id="WAIT_MATERIAL_CNT"></p>
                            <span class="lineH15">(<span id="WAIT_MATERIAL_QTY"></span>)</span>
                        </div>
                        <div id="DIV_IN_MATERIAL" class="w10 h100 status5 pt-3">
                            <p>소재입고</p>
                            <p id="IN_MATERIAL_CNT"></p>
                            <span class="lineH15">(<span id="IN_MATERIAL_QTY"></span>)</span>
                        </div>
                        <div id="DIV_PROCESSING" class="w10 h100 status6 pt-3">
                            <p>가공중</p>
                            <p id="PROCESSING_CNT"></p>
                            <span class="lineH15">(<span id="PROCESSING_QTY"></span>)</span>
                        </div>
                        <div id="DIV_PROCESS_COMPLETE"  class="w10 h100 status7 pt-3">
                            <p>가공완료</p>
                            <p id="PROCESS_COMPLETE_CNT"></p>
                            <span class="lineH15">(<span id="PROCESS_COMPLETE_QTY"></span>)</span>
                        </div>
                        <div id="DIV_AFTER_PROCESS" class="w10 h100 status8 pt-3">
                            <p>후가공</p>
                            <p id="AFTER_PROCESS_CNT"></p>
                            <span class="lineH15">(<span id="AFTER_PROCESS_QTY"></span>)</span>
                        </div>
                        <div id="DIV_SURFACE_TREAT"  class="w10 h100 status9 pt-3">
                            <p>표면처리</p>
                            <p id="SURFACE_TREAT_CNT"></p>
                            <span class="lineH15">(<span id="SURFACE_TREAT_QTY"></span>)</span>
                        </div>
                        <div id="DIV_OUTSIDE" class="w10 h100 status10 pt-3">
                            <p>외주가공</p>
                            <p id="OUTSIDE_CNT"></p>
                            <span class="lineH15">(<span id="OUTSIDE_QTY"></span>)</span>
                        </div>
                        <div id="DIV_ASSEMBLE" class="w10 h100 status11 pt-3">
                            <p>조립</p>
                            <p id="ASSEMBLE_CNT"></p>
                            <span class="lineH15">(<span id="ASSEMBLE_QTY"></span>)</span>
                        </div>
                    </div>
                    <div id="processPop_grid" class="h90 w100 border_color left_wrap2">
                    </div>
                </div>
                <div class="right_wrap map_image_wrap h100 text-center" style="width: 53%;margin-left: 1%;">
                    <img id="processPop_img" src="/resource/main/blank.jpg" alt="">
                    <div class="btn_wrap">
                        <button id="processPopMapBtn">도면상세보기</button>
                        <button id="detailCloseBtn" class="detailCloseBtn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>



<script>

    const fnConfirmForDashBoard = function (title, message) {
        alertify.confirm().setting({
            'title': title,
            'message': message,
            'onok': function(){ location.reload(); },
            'oncancel': null,
            'movable': false,
            'transitionOff': true
        }).show().autoOk(60);
    };
    let fnPostAjaxForDashBoard = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus !== 'success' || data == null) {
                    fnConfirmForDashBoard(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
                    return;
                }
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
                fnConfirmForDashBoard(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
            }
        });
    };

    let settingDataUseId = function (target, data) {
        if(target.indexOf("#") == -1) target = "#"+target;
        $.each(data, function(key, value) {
            $(target).find("#"+key).text(value);
        });
    }

    let openProcessPopup = function(type,rowData) {
        if(!fnIsEmpty(rowData)) {
            fnResetForm("PROCESS_POP_FORM");
            if(type == 'OUTSIDE_PROCESS_DIV') {
                $("#processPopup").find(".from_main_grid").hide();
                $("#processPopup").find(".from_material").hide();
                $("#processPopup").find(".from_non_complete").hide();
                $("#processPopup").find(".from_outside").show();

                $(".from_outside > .pop_outside_div").removeClass("onClickStatus2");
                $(".from_outside").find("#POP_OUTSIDE_"+rowData).addClass("onClickStatus2");

                $("#PROCESS_POP_FORM").find("#ORDER_COMP_CD").val(rowData);
                $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_outside");
            }else if(type == 'WAIT_MATERIAL_DIV') {
                $("#processPopup").find(".from_main_grid").hide();
                $("#processPopup").find(".from_material").show();
                $("#processPopup").find(".from_outside").hide();
                $("#processPopup").find(".from_non_complete").hide();

                $(".from_material > .pop_material_div").removeClass("onClickStatus3");
                $(".from_material").find("#POP_MATERIAL_"+rowData).addClass("onClickStatus3");

                $("#PROCESS_POP_FORM").find("#MATERIAL_TYPE").val(rowData);
                $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_material");
            }else if(type == 'NON_COMPLETE') {
                $("#processPopup").find(".from_main_grid").hide();
                $("#processPopup").find(".from_material").hide();
                $("#processPopup").find(".from_outside").hide();
                $("#processPopup").find(".from_non_complete").show();

                $(".from_non_complete > .non_complete_div").removeClass("onClickStatus4");
                $(".from_non_complete").find("#NON_COMPLETE_"+rowData).addClass("onClickStatus4");

                $("#PROCESS_POP_FORM").find("#INNER_DUE_DT").val(rowData);
                $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_nonComplete");

            }else {
                $("#processPopup").find(".from_outside").hide();
                $("#processPopup").find(".from_material").hide();
                $("#processPopup").find(".from_non_complete").hide();
                $("#processPopup").find(".from_main_grid").show();

                $("#processPopup").find("#processPop_comp_nm").text("(" + rowData.ORDER_COMP_NM + ")");
                $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_company");
                $(".from_main_grid > .pt-3").removeClass("onClickStatus");
                $(".from_main_grid").find("#DIV_"+type).addClass("onClickStatus");

                $("#PROCESS_POP_FORM").find("#ORDER_COMP_CD").val(rowData.ORDER_COMP_CD);
                $("#PROCESS_POP_FORM").find("#PART_STATUS").val(getPartStatus(type));

                settingDataUseId('processPopup',rowData);
            }

            $("#processPop_grid").pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('PROCESS_POP_FORM');
            } );
            $("#processPop_grid").pqGrid("refreshDataAndView");

            $("#processPopup").show();
        }
    }

    let getPartStatus = function(type) {
        let processListJson = {
            'TOTAL':'',
            'PROCESS_CONFIRM':'PRO002',
            'MATCH_STOCK':'MATCH_STOCK',
            'WAIT_MATERIAL':'PRO004',
            'IN_MATERIAL':'"PRO005","PRO021","PRO022"',
            'PROCESSING':'"PRO006","PRO007","PRO008"',
            'PROCESS_COMPLETE':'PROCESS_COMPLETE',
            'AFTER_PROCESS':'"PRO012","PRO013"',
            'SURFACE_TREAT':'"PRO014","PRO015"',
            'OUTSIDE':'OUTSIDE',
            'ASSEMBLE':'ASSEMBLE'
        }
        return processListJson[type];
    }

    $(function () {
        var g_noData = '<div>Not Found Data.</div>';
        let setIntervalTimer;
        let timer = function(){
            let selVal = 30;//1분
            let timesec = 1000;//1초
            setIntervalTimer = setInterval(function() {
                getStockProcessList();
                getOutsideProcessData();
                getProcessWaitingList('material');
                getProcessingMainInfo();

                if ($("#process_dash_board_main_grid").hasClass('pq-grid')) {
                    settingNewDataForGrid('process_dash_board_main_grid','PROCESS_DASH_MAIN_FORM','ORDER_COMP_CD')

                }
                if ($("#process_complete_grid").hasClass('pq-grid')) {
                    settingNewDataForGrid('process_complete_grid','PROCESS_DASH_SUB_FORM','INNER_DUE_DT')
                }

            }, timesec*selVal);
        };

        let settingNewDataForGrid = function(gridId, formId, checkValue) {
            let orgData = $("#" + gridId).pqGrid('option', 'dataModel.data');
            let checkList = $("#" + gridId).pqGrid("getData",{dataIndx:[checkValue]});
            let popCompCd = $("#PROCESS_POP_FORM").find("#ORDER_COMP_CD").val();
            let popRowData = null;
            let checkArr = [];
            let checkArrCopy = [];
            $.each(checkList, function(idx,Item) {
                checkArr.push(Item[checkValue]);
                checkArrCopy.push(Item[checkValue]);
            })

            const parameter = {'url': '/tv/paramQueryGridSelect', 'data': fnFormToJsonArrayData(formId)};
            fnPostAjaxForDashBoard(function (data) {
                let newData = data.data;
                if(gridId == 'process_complete_grid') {
                    settingNonCompletePop(newData);
                }
                $.each(newData,function(idx,Item) {
                    let chk = Item[checkValue];
                    let rowIdx = checkArr.indexOf(chk);
                    if(checkArrCopy.indexOf(chk) >= 0){
                        let copyIdx = checkArrCopy.indexOf(chk);
                        checkArrCopy.splice(copyIdx,1);
                    }
                    if(rowIdx >= 0) {
                        $("#" + gridId).pqGrid('updateRow', {
                            'rowIndx': rowIdx,
                            'newRow': Item,
                            checkEditable: false
                        });
                    }else {
                        $("#" + gridId).pqGrid('addRow', {
                            newRow: Item,
                            rowIndx: idx,
                            checkEditable: false
                        });
                        checkArr.splice(idx,0,chk);
                    }
                    if(gridId == 'process_dash_board_main_grid') {
                        if(chk == popCompCd) {
                            popRowData = Item;
                        }
                    }
                })

                try {
                    if(checkArrCopy.length > 0) {
                        for(var i=0;i<checkArrCopy.length;i++) {
                            $.each(orgData, function (idx,Item) {
                                let compCd = Item.ORDER_COMP_CD;
                                if(compCd == checkArrCopy[i]) {
                                    $("#" + gridId).pqGrid('deleteRow', {'rowIndx': Item.pq_ri});//rowIndx
                                }
                            });
                        }
                    }
                }catch (e) {
                }

                $("#" + gridId).pqGrid('option', 'dataModel.postData', function (ui) {
                    return fnFormToJsonArrayData(formId);
                });

                if(gridId == 'process_dash_board_main_grid') {
                    displayTotalHeader();

                    if($("#processPopup").find("#processPopMainGridDiv").css('display') != 'none') {
                        if(popRowData != null) {
                            settingDataUseId('processPopup',popRowData);
                        }else {
                            resetPopCnt();
                        }
                        $("#processPop_grid").pqGrid("option", "dataModel.postData", function(ui){
                            return fnFormToJsonArrayData('PROCESS_POP_FORM');
                        } );
                        $("#processPop_grid").pqGrid("refreshDataAndView");
                    }
                }
            },parameter,'');

        }
        let resetPopCnt = function () {
            let arr = ['TOTAL_CNT','TOTAL_QTY','PROCESS_CONFIRM_CNT','PROCESS_CONFIRM_QTY','MATCH_STOCK_CNT','MATCH_STOCK_QTY',
                'WAIT_MATERIAL_CNT', 'WAIT_MATERIAL_QTY', 'IN_MATERIAL_CNT', 'IN_MATERIAL_QTY', 'PROCESSING_CNT', 'PROCESSING_QTY',
                'PROCESS_COMPLETE_CNT', 'PROCESS_COMPLETE_QTY', 'AFTER_PROCESS_CNT', 'AFTER_PROCESS_QTY', 'SURFACE_TREAT_CNT',
                'SURFACE_TREAT_QTY', 'OUTSIDE_CNT', 'OUTSIDE_QTY'
            ]
            for(var i=0;i<arr.length;i++) {
                $("#"+arr[i]).text("0");
            }
        }
        let getStockProcessList = function (type) {
            const parameter = {'url': '/tv/json-list', 'data': {
                    'queryId':'process.selectStockProcessList'
                }
            };
            fnPostAjaxForDashBoard(function (data) {
                let processListJson = {'BEFORE_PROCESS':[], 'PROCESSING':[], 'COMPLETE':[]}
                let partStatus1 = ['PRO002','PRO004','PRO005','PRO021','PRO022','PRO017'];
                let partStatus2 = ['PRO006','PRO007','PRO008'];
                let partStatus3 = ['PRO009','PRO012','PRO013','PRO014','PRO015'];
                // if(type == 'init') {
                $("#stockProcessCompDiv").empty();
                $.each(data.list, function (idx,Item) {
                    let compId = "STOCK_" + Item.ORDER_COMP_CD;
                    if($("#"+compId).length == 0) {
                        let html = '<div id="'+compId +'" class="block_box block_box_small" style="background-color:'+ Item.COLOR+';">';
                        html += '<p class="small">'+ Item.ORDER_COMP_NM + '</p>'
                        html += '</div>';
                        $("#stockProcessCompDiv").append(html);
                    }else {
                        $("#"+compId).css("background-color", Item.COLOR);
                    }
                    if(partStatus1.indexOf(Item.PART_STATUS) >=0){
                        processListJson.BEFORE_PROCESS.push(Item);
                    }else if(partStatus2.indexOf(Item.PART_STATUS) >=0){
                        processListJson.PROCESSING.push(Item)
                    }else if(partStatus3.indexOf(Item.PART_STATUS) >=0){
                        processListJson.COMPLETE.push(Item);
                    }

                });

                $("#stockProcessListDiv").empty();
                $.each(processListJson,function (idx,Item) {
                    $.each(Item, function (idx2,Item2) {
                        let listId = "STOCK_" + Item2.CONTROL_SEQ + "_" + Item2.CONTROL_DETAIL_SEQ;
                        if($("#"+listId).length == 0) {
                            let html = '<div id="'+listId +'" class="block_box block_box_middle" style="background-color:'+Item2.COLOR + ';" onclick="g_item_detail_pop_view('+Item2.CONTROL_SEQ+','+Item2.CONTROL_DETAIL_SEQ +')">';
                            html += '<p>' + Item2.INSIDE_STOCK_NUM + '</p>';
                            html += '<p><span>' + Item2.QTY + '</span> EA</p>';
                            html += '<p class="'+Item2.STATUS + '">'+Item2.PART_STATUS_NM + '</p>';
                            html += '</div>';
                            $("#stockProcessListDiv").append(html);
                        }
                    });
                    if(idx != 'COMPLETE'){
                        $("#stockProcessListDiv").append('<br>');
                    }
                });
            },parameter,'');
        }
        let getOutsideProcessData = function () {
            const parameter = {'url': '/tv/json-list', 'data': {
                    'queryId':'process.selectOutsideProcessList'
                }
            };
            fnPostAjaxForDashBoard(function (data) {
                $("#outsideProcessDiv").empty();
                $("#processPopOutsideDiv").empty();
                $.each(data.list, function (idx,Item) {
                    let compId = "OUTSIDE_" + Item.OUTSIDE_COMP_CD;
                    if($("#"+compId).length == 0) {
                        let html = '<div id="'+compId+'" class="block_box back_sky outside_process_div" data-target="'+Item.OUTSIDE_COMP_CD +'">';
                        html += '<p>' + Item.OUTSIDE_COMP_NM + '</p>';
                        html += '<p class="small">' + Item.CNT + ' (' + Item.QTY + ')</p>';
                        html += '<p class="text-primary">' + Item.OUTSIDE_HOPE_DUE_DT + '</p>';
                        html += '</div>';
                        $("#outsideProcessDiv").append(html);
                    }

                    let compId2 = "POP_OUTSIDE_" + Item.OUTSIDE_COMP_CD;
                    if($("#"+compId2).length == 0) {
                        let html = '<div id="'+compId2+'" class="block_box block_box_middle back_sky pop_outside_div" data-target="'+Item.OUTSIDE_COMP_CD +'">';
                        html += '<p>' + Item.OUTSIDE_COMP_NM + '</p>';
                        html += '<p class="small">' + Item.CNT + ' (' + Item.QTY + ')</p>';
                        html += '<p class="text-primary">' + Item.OUTSIDE_HOPE_DUE_DT + '</p>';
                        html += '</div>';

                        $("#processPopOutsideDiv").append(html);
                    }
                });
            },parameter,'');
        }
        function calculatePercent(l, target) {
            var off = target - _.reduce(l, function(acc, x) { return acc + Math.round(x) }, 0);
            return _.chain(l).
            map(function(x, i) { return Math.round(x) + (off > i) - (i >= (l.length + off)) }).
            value();
        }

        let getProcessingMainInfo = function () {
            const parameter2 = {'url': '/tv/json-list', 'data': {
                    'queryId':'process.selectProcessingInfo_main'
                }
            };

            let totalCnt = 0;
            fnPostAjaxForDashBoard(function (data2) {
                let arr = [];
                $.each(data2.list, function (idx,Item) {
                    totalCnt += Number(Item.CNT);

                    $("#"+Item.TYPE + "_CNT").text(Item.CNT)
                    $("#"+Item.TYPE + "_QTY").text("("+Item.QTY+")");
                });
                $.each(data2.list, function (idx,Item) {
                    arr.push((Item.CNT / totalCnt) * 100);
                });
                let result = calculatePercent(arr,100);
                console.log(result);
                $.each(data2.list, function (idx,Item) {
                    $("#"+Item.TYPE + "_PERCENT").text(result[idx] +'%');
                });
            },parameter2,'');
        }
        let getProcessWaitingList = function (type) {
            const parameter = {'url': '/tv/json-list', 'data': {
                    'queryId':'process.selectProcessWatingList_material'
                }
            };
            fnPostAjaxForDashBoard(function (data) {
                $("#waitMaterialDiv").empty();
                $("#processPopMaterialDiv").empty();
                $.each(data.list, function (idx,Item) {
                    let materialId = "MATERIAL_" + Item.MATERIAL_TYPE;
                    if($("#"+materialId).length == 0) {
                        let html = '<div id="'+materialId+'" class="block_box back_purple pt-3 wait_material_div" data-target="'+Item.MATERIAL_TYPE+'">';
                        html += '<p>' + Item.MATERIAL_TYPE_NM + '</p>';
                        html += '<p class="small">' + Item.CNT + ' (' + Item.QTY + ')</p>';
                        html += '</div>';
                        $("#waitMaterialDiv").append(html);
                    }
                    let materialId2 = "POP_MATERIAL_"+ Item.MATERIAL_TYPE;
                    if($("#"+materialId2).length == 0) {
                        let html = '<div id="'+materialId2+'" class="block_box block_box_middle back_purple pt-3 pop_material_div" data-target="'+Item.MATERIAL_TYPE+'">';
                        html += '<p>' + Item.MATERIAL_TYPE_NM + '</p>';
                        html += '<p class="small">' + Item.CNT + ' (' + Item.QTY + ')</p>';
                        html += '</div>';
                        $("#processPopMaterialDiv").append(html);

                    }
                });
            },parameter,'');
        }

        let displayTotalHeader = function () {
            let dataIndxList = [
                'TOTAL', 'PROCESS_CONFIRM', 'MATCH_STOCK', 'WAIT_MATERIAL', 'IN_MATERIAL', 'PROCESSING',
                'PROCESS_COMPLETE', 'AFTER_PROCESS', 'SURFACE_TREAT', 'OUTSIDE', 'ASSEMBLE'
            ]
            let gridData = $("#process_dash_board_main_grid").pqGrid('option', 'dataModel.data');
            $.each(dataIndxList, function (idx, Item) {
                let totalCnt = 0;
                let totalQty = 0;
                $.each(gridData, function (idx2, rowData) {
                    if(!fnIsEmpty(rowData[Item + '_CNT'])) {
                        totalCnt += Number(rowData[Item + '_CNT'])
                    }
                    if(!fnIsEmpty(rowData[Item + '_QTY'])) {
                        totalQty += Number(rowData[Item + '_QTY'])
                    }
                });

                if($("#pq-head-cell-u3-0-"+(idx+14) +"-right .pq-title-span .header_inside").length == 0) {
                    let html = '<br><span class="header_inside">' + totalCnt + " (" + totalQty + ")" + '</span>';
                    $("#pq-head-cell-u3-0-"+(idx+14) +"-right .pq-title-span").append(html)
                }else {
                    $("#pq-head-cell-u3-0-"+(idx+14) +"-right .pq-title-span .header_inside").text(totalCnt + " (" + totalQty + ")");
                }
            });
        }
        const processDashBoardMainGrid = $("#process_dash_board_main_grid");
        const processDashBoardMainColModel = [
            {title: 'ORDER_COMP_CD', dataIndx: 'ORDER_COMP_CD', hidden: true},
            {title: 'TOTAL_QTY', dataIndx: 'TOTAL_QTY', hidden: true},
            {title: 'PROCESS_CONFIRM_QTY', dataIndx: 'PROCESS_CONFIRM_QTY', hidden: true},
            {title: 'MATCH_STOCK_QTY', dataIndx: 'MATCH_STOCK_QTY', hidden: true},
            {title: 'WAIT_MATERIAL_QTY', dataIndx: 'WAIT_MATERIAL_QTY', hidden: true},
            {title: 'IN_MATERIAL_QTY', dataIndx: 'IN_MATERIAL_QTY', hidden: true},
            {title: 'PROCESSING_QTY', dataIndx: 'PROCESSING_QTY', hidden: true},
            {title: 'PROCESS_COMPLETE_QTY', dataIndx: 'PROCESS_COMPLETE_QTY', hidden: true},
            {title: 'AFTER_PROCESS_QTY', dataIndx: 'AFTER_PROCESS_QTY', hidden: true},
            {title: 'SURFACE_TREAT_QTY', dataIndx: 'SURFACE_TREAT_QTY', hidden: true},
            {title: 'OUTSIDE_QTY', dataIndx: 'OUTSIDE_QTY', hidden: true},
            {title: 'ASSEMBLE_QTY', dataIndx: 'ASSEMBLE_QTY', hidden: true},
            {title: 'DELAY_PROCESS_QTY', dataIndx: 'DELAY_PROCESS_QTY', hidden: true},
            {title: 'DELAY_QTY', dataIndx: 'DELAY_QTY', hidden: true},
            {title: '발주처', width: 125, dataIndx: 'ORDER_COMP_NM', editable: false, sortable:false,
                styleHead: {'background-color':'#aedcff'},
                render: function (ui) {
                    return {style: 'font-style:italic;'};
                }
            },
            {title: '계', width: 85, dataIndx: 'TOTAL_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#aedcff','color':'blue'},
                render: function (ui) {
                    let html = '<span class="column_hover" style="color: blue;">' + ui.cellData + ' <span class="column_inside" style="color: #2190ff;">(' + ui.rowData.TOTAL_QTY +')</span></span>';
                    return html;
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('TOTAL',rowData);
                    });
                }
            },
            {title: '가공확정', width: 85, dataIndx: 'PROCESS_CONFIRM_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#9bd4ff'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.PROCESS_CONFIRM_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('PROCESS_CONFIRM',rowData);
                    });
                }
            },
            {title: '재고충당대기', width: 90, dataIndx: 'MATCH_STOCK_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#7cc6ff'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.MATCH_STOCK_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('MATCH_STOCK',rowData);
                    });
                }
            },
            {title: '소재입고대기', width: 93, dataIndx: 'WAIT_MATERIAL_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#69bdfd'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.WAIT_MATERIAL_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('WAIT_MATERIAL',rowData);
                    });
                }
            },
            {title: '소재입고', width: 88, dataIndx: 'IN_MATERIAL_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#5fb4f5'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.IN_MATERIAL_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text:""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('IN_MATERIAL',rowData);
                    });
                }
            },
            {title: '가공중', width: 88, dataIndx: 'PROCESSING_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#4dadf7'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.PROCESSING_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text:""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('PROCESSING',rowData);
                    });
                }
            },
            {title: '가공완료', width: 88, dataIndx: 'PROCESS_COMPLETE_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#39a4f7'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.PROCESS_COMPLETE_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('PROCESS_COMPLETE',rowData);
                    });
                }
            },
            {title: '후가공', width: 80, dataIndx: 'AFTER_PROCESS_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#1893f1'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.AFTER_PROCESS_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text:""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('AFTER_PROCESS',rowData);
                    });
                }
            },
            {title: '표면처리', width: 85, dataIndx: 'SURFACE_TREAT_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#0188ef'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.SURFACE_TREAT_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text:""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('SURFACE_TREAT',rowData);
                    });
                }
            },
            {title: '외주가공', width: 80, dataIndx: 'OUTSIDE_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#006dc0','color':'white'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.OUTSIDE_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('OUTSIDE',rowData);
                    });
                }
            },
            {title: '조립', width: 80, dataIndx: 'ASSEMBLE_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#1156a0','color':'white'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="column_inside">(' + ui.rowData.ASSEMBLE_QTY +')</span></span>';
                        return html;
                    }else {
                        return {text: ""};
                    }
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        openProcessPopup('ASSEMBLE',rowData);
                    });
                }
            },
            {title: '당면<br>납기', width: 82, dataType: 'date', format: 'mm/dd', dataIndx: 'APPROACH_DUE_DT', editable: false, sortable:false,
                styleHead: {'background-color':'#0c4888', 'color':'white'},
                render: function (ui) {
                    let cellData = ui.cellData;
                    let date = new Date(cellData);
                    let today = new Date();

                    if(date < today) {
                        return {style: 'background-color:#e0e9f9;color:#f81414;'};
                    }else {
                        return {style: 'background-color:#e0e9f9;'};
                    }
                }
            },
            {title: '가공<br>지연', width: 82, dataIndx: 'DELAY_PROCESS_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#ffc372'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span>' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.DELAY_PROCESS_QTY +')</span></span>';
                        return {style: 'background-color:#fdebd2;', text:html};
                    }else {
                        return {style: 'background-color:#fdebd2;', text:""};
                    }
                }
            },
            {title: '납기<br>지연', width: 82, dataIndx: 'DELAY_CNT', editable: false, sortable:false,
                styleHead: {'background-color':'#fff54c', 'color':'red'},
                render: function (ui) {
                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span>' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.DELAY_QTY +')</span></span>';
                        return {style: 'color: red; background-color:#faf7c0;', text:html};
                    }else {
                        return {style: 'color: red; background-color:#faf7c0;', text:""};
                    }
                }
            }
        ]
        const processDashBoardMainObj = {
            height:550,
            width:'100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            resizable: false,
            rowHtHead: 35,
            strNoRows: g_noData,
            numberCell: {show:false},
            // trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            filterModel: {mode: 'OR'},
            colModel: processDashBoardMainColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST',
                url: '/tv/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('PROCESS_DASH_MAIN_FORM'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                displayTotalHeader();
            },
            sortModel: {on: false}
        }
        processDashBoardMainGrid.pqGrid(processDashBoardMainObj);


        const processCompleteGrid = $("#process_complete_grid");
        const processCompleteColModel = [
            {title: 'TYPE', dataIndx: 'TYPE', hidden: true},
            {title: 'GOAL_QTY', dataIndx: 'GOAL_QTY', hidden: true},
            {title: 'COMPLETE_QTY', dataIndx: 'COMPLETE_QTY', hidden: true},
            {title: 'OUTSIDE_QTY', dataIndx: 'OUTSIDE_QTY', hidden: true},
            {title: 'NON_COMPLETE_QTY', dataIndx: 'NON_COMPLETE_QTY', hidden: true},
            {title: '가공납기', width: 75, dataType: 'date', format: 'mm/dd', dataIndx: 'INNER_DUE_DT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    if(rowData.TYPE == 'BEFORE') {
                        cellData = '이전';
                        cls = 'bg-lightgray';
                        return {cls: cls, text:cellData, style: 'font-weight:bold;'};
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }

                    let date = new Date(cellData);
                    if(date.getDay() > 0) {
                        return {cls: cls, style: 'font-weight:bold;'};
                    }else {
                        return {cls: cls, style: 'color:red;font-weight:bold;'};
                    }
                }
            },
            {title: '대상수량', width: 100, dataIndx: 'GOAL_CNT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    if(rowData.TYPE == 'BEFORE') {
                        cls = 'bg-lightgray';
                        cellData = '';
                        return {cls: cls, text:cellData};
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }

                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span>' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.GOAL_QTY +')</span></span>';
                        return {cls: cls, text:html, style:'font-weight:bold;'};
                    }else {
                        cellData = "-";
                    }
                    return {cls: cls, text:cellData, style:'font-weight:bold;'};
                }
            },
            {title: '가공완료', width: 95, dataIndx: 'COMPLETE_CNT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    let style = 'color:#367fae;font-weight:bold;';
                    if(rowData.TYPE == 'BEFORE') {
                        cls = 'bg-lightgray';
                        cellData = '';
                        return {cls: cls, text:cellData};
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }

                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span>' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.COMPLETE_QTY +')</span></span>';
                        return {cls: cls, text: html, style: style};
                    }else {
                        cellData = "-";
                    }
                    return {cls: cls, text: cellData};
                }
            },
            {title: '외주진행', width: 95, dataIndx: 'OUTSIDE_CNT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    if(rowData.TYPE == 'BEFORE') {
                        cls = 'bg-lightgray';
                        cellData = '';
                        return {cls: cls, text:cellData};
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }

                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span>' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.OUTSIDE_QTY +')</span></span>';
                        return {cls: cls, text:html};
                    }else {
                        cellData = "-";
                    }
                    return {cls: cls, text:cellData};
                }
            },
            {title: '미완료', width: 100, dataIndx: 'NON_COMPLETE_CNT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    let style = '';
                    if(rowData.TYPE == 'BEFORE') {
                        cls = 'bg-lightgray';
                        style = 'color:#f81414;';
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                        style = 'color:#f81414;';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }

                    if(!fnIsEmpty(ui.cellData) && ui.cellData > 0) {
                        let html = '<span class="column_hover">' + ui.cellData + ' <span class="header_inside">(' + ui.rowData.NON_COMPLETE_QTY +')</span></span>';
                        return {cls: cls, text:html, style:style};
                    }else {
                        cellData = "-";
                    }
                    return {cls: cls, text:cellData};
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('.column_hover').bind('click', function () {
                        let rowData = ui.rowData;
                        let dt = "";
                        if(rowData.TYPE == 'BEFORE') {
                            dt = "BEFORE";
                        }else {
                            dt = rowData.INNER_DUE_DT.replaceAll("/","");
                        }
                        openProcessPopup('NON_COMPLETE',dt);
                    });
                }
            },
            {title: '완료율', width: 65, dataIndx: 'PERCENT',editable: false,
                styleHead: {'background-color':'#b5ddfb'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    let cellData = ui.cellData;
                    let cls = '';
                    let style = '';
                    if(rowData.TYPE == 'BEFORE') {
                        cls = 'bg-lightgray';
                        cellData = '';
                        return {cls: cls, text:cellData};
                    }else if(rowData.TYPE == 'AFEW') {
                        cls = 'bg-lightgray';
                        style = 'color:#f81414;';
                    }else if(rowData.TYPE == 'TODAY') {
                        cls = 'dash_bg_yellow';
                    }else {
                        style = 'color:#367fae;'
                    }
                    if(fnIsEmpty(cellData)) {
                        cellData = '';
                    }else {
                        cellData += '%';
                    }
                    return {cls: cls, text:cellData, style:style};
                }
            }
        ]
        const processCompleteObj = {
            height:295,
            width:'100%',
            collapsible: false,
            resizable: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            rowHtHead: 25,
            strNoRows: g_noData,
            numberCell: {show:false},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            filterModel: {mode: 'OR'},
            colModel: processCompleteColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST',
                url: '/tv/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('PROCESS_DASH_SUB_FORM'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function () {
                let html = '<br><span class="header_inside">'+ "(수량기준)" + '</span>';
                $("#pq-head-cell-u5-0-10-right .pq-title-span").append(html);

                const data = this.option('dataModel.data');
                settingNonCompletePop(data);

            },
            sortModel: {on: false}
        }
        processCompleteGrid.pqGrid(processCompleteObj);
        getStockProcessList();
        getOutsideProcessData();
        getProcessWaitingList('material');
        getProcessingMainInfo();
        timer();

        let settingNonCompletePop = function (data) {
            $("#processPopNonCompleteDiv").empty();
            $.each(data, function (idx,Item) {
                if(Item.NON_COMPLETE_CNT > 0) {
                    let innerDueDt = Item.INNER_DUE_DT.replaceAll("/","");
                    let target = Item.INNER_DUE_DT.replaceAll("/","");
                    let id = "NON_COMPLETE_"
                    let title = Item.INNER_DUE_DT.substring(5,Item.INNER_DUE_DT.length);
                    if(Item.TYPE == 'BEFORE') {
                        title = "이전";
                        target = "BEFORE";
                        id += target;
                    }else {
                        id += innerDueDt;
                    }
                    let html = '<div id="'+id+'" class="block_box block_box_middle back_sky2 pt-3 non_complete_div" style="height: 70px;" data-target="'+target+'">';
                    html += '<p>' + title + '</p>';
                    html += '<p class="small">' + Item.NON_COMPLETE_CNT + ' (' + Item.NON_COMPLETE_QTY + ')</p>';
                    html += '</div>';
                    $("#processPopNonCompleteDiv").append(html);
                }
            })
        }

        const processPopGrid = $("#processPop_grid");
        const processPopColModel = [
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '가공납기', width: 60, dataIndx: 'INNER_DUE_DT',editable: false,
                styleHead: {'background-color':'#aedcff'}
            },
            {title: '진행상태', width: 90, dataIndx: 'PART_STATUS_NM',editable: false,
                styleHead: {'background-color':'#aedcff'}
            },
            {title: '작업번호<br>/ 규격', width: 140, dataIndx: 'CONTROL_SIZE',editable: false,
                styleHead: {'background-color':'#aedcff'},
                render: function (ui) {
                    const cellData = ui.cellData;
                    if (cellData) {
                        return cellData.replace(/&lt;/g, '<');
                    }
                }
            },
            {title: '작업형태<br>/ 소재', width: 80, dataIndx: 'WORK_TYPE_MATERIAL',editable: false,
                styleHead: {'background-color':'#aedcff'},
                render: function (ui) {
                    const cellData = ui.cellData;
                    if (cellData) {
                        return cellData.replace(/&lt;/g, '<');
                    }
                }
            },
            {title: '수량', width: 50, dataIndx: 'QTY',editable: false,
                styleHead: {'background-color':'#aedcff'}
            },
            {title: '', align: 'center', dataType: 'string', dataIndx: 'DETAIL_INFO', width: 30, minWidth: 30, editable: false,
                styleHead: {'background-color':'#aedcff'},
                render: function (ui) {
                    if (ui.rowData.CONTROL_SEQ > 0) return '<span id="detailView" class="shareIcon"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData.CONTROL_SEQ, ui.rowData.CONTROL_DETAIL_SEQ);
                    });
                }
            },
            {title: '현재위치', width: 90, dataIndx: 'POP_POSITION',editable: false,
                styleHead: {'background-color':'#aedcff'}
            },
            {title: '가공진행 현황', align: 'center',
                styleHead: {'background-color':'#aedcff'},
                colModel: [
                    {title: '공정', dataIndx: 'PROCESS_TYPE_NM', width: 50,
                        styleHead: {'background-color':'#aedcff'},
                        editable: false,
                    },
                    {title: '작업자', dataIndx: 'WORK_USER_NM', width: 70,
                        styleHead: {'background-color':'#aedcff'},
                        editable: false,
                    },
                    {title: 'RT', dataIndx: 'WORKING_TIME', width: 80,
                        styleHead: {'background-color':'#aedcff'},
                        editable: false,
                    }
                ]
            },
            {title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true}
        ]
        const processPopObj = {
            height:'86.5%',
            width:'100%',
            collapsible: false,
            resizable: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            rowHtHead: 25,
            strNoRows: g_noData,
            numberCell: {title: 'No.'},
            trackModel: {on: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            filterModel: {mode: 'OR'},
            colModel: processPopColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', recIndx: 'RNUM',
                url: '/tv/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('PROCESS_POP_FORM'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectionModel: { type: 'row', mode: 'single'},
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        var rowData = ui.addList[0].rowData;

                        if(typeof rowData.IMG_GFILE_SEQ != 'undefined' && rowData.IMG_GFILE_SEQ != ''){
                            $("#processPop_img").attr("src", '/qimage/' + rowData.IMG_GFILE_SEQ);
                                $("#PROCESS_POP_FORM").find("#IMG_GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
                        }else {
                            $("#processPop_img").attr("src", '/resource/main/blank.jpg');
                            $("#PROCESS_POP_FORM").find("#IMG_GFILE_SEQ").val("");
                        }
                    }
                })
            },
            complete: function (event, ui) {
                setTimeout(function (){
                    if(processPopGrid.hasClass('pq-grid')){
                        processPopGrid.pqGrid('setSelection', {rowIndx: 0});
                    }
                },300);
            },
            sortModel: {on: false}
        }
        processPopGrid.pqGrid(processPopObj);

        $("#detailCloseBtn").on("click",function(){
            $(".popupBackground").hide();
            if (processPopGrid.hasClass('pq-grid')) {
                // processPopGrid.pqGrid('destroy');
                fnResetForm("PROCESS_POP_FORM");
            }
        });
        $(".from_main_grid > .pt-3").on("click",function (e) {
            let type = e.currentTarget.id.substring(4);
            $(".from_main_grid > .pt-3").removeClass("onClickStatus");
            $(".from_main_grid").find("#"+e.currentTarget.id).addClass("onClickStatus");

            $("#PROCESS_POP_FORM").find("#PART_STATUS").val(getPartStatus(type));
            $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_company");
            processPopGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('PROCESS_POP_FORM');
            } );
            processPopGrid.pqGrid("refreshDataAndView");
        })
        $("#processPopMapBtn").on("click",function(){
            let gFileSeq = $("#PROCESS_POP_FORM").find("#IMG_GFILE_SEQ").val();
            if(gFileSeq != '') {
                callWindowImageViewer(gFileSeq);
            }
        });
    });
    $(document).ready(function(){

        $(document).on("click",".outside_process_div",function(e){
            openProcessPopup('OUTSIDE_PROCESS_DIV',$(this).data('target'))
        });
        $(document).on("click",".wait_material_div",function(e){
            openProcessPopup('WAIT_MATERIAL_DIV',$(this).data('target'))
        });
        $(document).on("click",".non_complete_div",function(e){
            openProcessPopup('NON_COMPLETE',$(this).data('target'))
        });

        $(document).on("click",".pop_outside_div",function(e){
            $(".from_outside > .pop_outside_div").removeClass("onClickStatus2");
            $(".from_outside").find("#"+e.currentTarget.id).addClass("onClickStatus2");

            $("#PROCESS_POP_FORM").find("#ORDER_COMP_CD").val($(this).data('target'));
            $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_outside");

            $("#processPop_grid").pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('PROCESS_POP_FORM');
            } );
            $("#processPop_grid").pqGrid("refreshDataAndView");

        });
        $(document).on("click",".pop_material_div",function(e){
            $(".from_material > .pop_material_div").removeClass("onClickStatus3");
            $(".from_material").find("#"+e.currentTarget.id).addClass("onClickStatus3");

            $("#PROCESS_POP_FORM").find("#MATERIAL_TYPE").val($(this).data('target'));
            $("#PROCESS_POP_FORM").find("#queryId").val("process.selectProcessPop_material");


            $("#processPop_grid").pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('PROCESS_POP_FORM');
            } );
            $("#processPop_grid").pqGrid("refreshDataAndView");
        });
    });
</script>
</body>
</html>