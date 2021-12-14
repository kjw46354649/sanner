<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2021-02-15
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>검사 성적서</title>
    <style type="text/css">
        #drawing_touch_div {
            width: 100%;
            height:100%;
            display: grid;
            position: absolute;
        }
        #layer_img_grid_div{
            width: 1300px;
            height: 920px;
            display: grid;
            position: absolute;
        }
        .item2 {
            display: flex;
            border-bottom: 3px solid rgb(255 198 58 / 60%);
            border-right: 3px solid rgb(255 198 58 / 60%);
        }
        .item {
            display: flex;
            border-bottom: 2px solid rgb(255 198 58 / 50%);
            border-right: 2px solid rgb(255 198 58 / 50%);
        }
        /*.item:nth-child(8n){*/
        /*    border-right: none;*/
        /*}*/
        /*.item:nth-child(n+41){*/
        /*    border-bottom: none;*/
        /*}*/

        .spanPosition {
            position: absolute;
            background-color: rgb(195 241 255 / 85%);
            width: 50px;
            height: 50px;
            font-size: 35px;
            text-align: center;
            border-radius: 45px;
            /*border: 1px solid #545050;*/
            z-index: 15;
        }
        .spanPositionPop {
            position: absolute;
            background-color: rgb(195 241 255 / 85%);
            width: 16px;
            height: 16px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            border-radius: 16px;
            /*border: 1px solid #545050;*/
            z-index: 15;
        }
        #myWindow {
            cursor: grab;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #myContent {
            position: relative;
            display: flex;
            align-items: center;
            border: 1px solid black;
        }

        #myContent img {
            display: block;
            width: auto;
            height: auto;
            margin: auto;
            align-self: center;
            flex-shrink: 0;
        }
        .buttonDiv {
            width: 8%;
            text-align: center;
            margin-top: 2.5%;
        }
        .buttonDiv button {
            width: 55%;
            height: 11%;
            margin-bottom: 13%;
            color: #0d0d0d;
            text-align: center;
            line-height: 52px;
            font-size: 28px;
            background: #abc3e9;
            border-radius: 4px;
            border: 2px outset #afceeb;
            box-shadow: 1px 2px 0 #617699;
        }
        .buttonDiv .on {
            background: #336fca;
            border: 2px inset #cdd0d2;
        }
        
        .naBtn {
            white-space:nowrap;
            width:60% !important;
            height: 4% !important;
            line-height:18px;
            display: inline-block;
            zoom: 1;
            color: #fff;
            text-align: center;
            position:relative;
            -webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
            transition: border .25s linear, color .25s linear, background-color .25s linear;
        }
        .naBtn.btn-concrete{
            background-color: #d5d5d6;
            border-color: #c6c9c9;
            -webkit-box-shadow: 0 3px 0 #919191;
            box-shadow: 0 3px 0 #919191;}
        .naBtn.btn-concrete:hover{background-color:#acacad;}
        .naBtn.btn-concrete:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

        .buttonDiv .bottomDiv {
            margin-top: 10%;
        }
        .buttonDiv .bottomDiv p {
            font-size: 18px;
        }
        .buttonDiv .bottomDiv button {
            height: 4%;
            font-size: 18px;
            line-height: 20px;
        }
        table.rowStyle th {
            padding: 0;
            text-align: center;
            background: #abc3e9;
            color: black;
            border: 1px solid #92979a;
            height: 30px;
        }
        .table-bg-gray {
            background: #e4e4e4;
        }
        table.rowStyle td {
            text-align: center;
            padding: 10px 10px;
        }
        .video-item > h2{
            text-align: center;
        }
        .video-item > video{
            border: 1px solid red;
            width: 250px;
            height: 188px;
        }
        h3  {
            font-size: 25px;
            font-family: 'NotoKrB';
            color: #000;
            display: inline-block;
        }
        .center-mt12 {
            text-align: center;
            margin-top: 12%;
            font-size: 17px;
            width: 90%;
        }
        #layer_setting_popup select {
            font-size: 15px;
        }
        .blueWhiteBtn {
            background-color: #336fca;
            color: white;
            border-color: #1a5a91;
            width: 60px;
            font-size: 16px;
            height: 33px;
        }
        .table-bg-gray input {
            background-color: #e4e4e4;
        }

        #inspect_point_grid .pq-grid-col, .pq-grid-row > .pq-grid-number-cell {
            text-align:center;
        }
        .layerPopup .t_area .t_h span select {
            vertical-align: inherit;
        }
        .pq-title-span:hover{
             text-decoration: none !important;
             cursor: default !important;
         }
        #veritcal_change_btn {
            width: 25% !important;
            height: 9% !important;
            margin-top: 2%;
        }
    </style>
</head>
<body style="overflow: hidden;padding: 1%;">
    <div>
        <h3><i class="xi-library-bookmark"></i>검사 성적서 입력</h3>
    </div>
    <div class="d-flex" style="padding:0% 1% 0% 1%;height: 85%;">
        <div class="buttonDiv">
            <div class="topDiv" style="height: 80%;">
                <button class="layerBtn" data-target="A" type="button"><span>A</span></button>
                <button class="layerBtn" data-target="B" type="button"><span>B</span></button>
                <button class="layerBtn" data-target="C" type="button"><span>C</span></button>
                <button class="layerBtn" data-target="D" type="button"><span>D</span></button>
                <button class="layerBtn" data-target="E" type="button"><span>E</span></button>
                <button class="layerBtn" data-target="F" type="button"><span>F</span></button>
                <button class="layerBtn" data-target="NO" type="button" class="naBtn"><span>N/A</span></button>
            </div>
            <div class="bottomDiv">
                <p>Horizontal</p>
                <button id="horizon_change_btn" type="button" class="naBtn btn-concrete">ABC
<%--                    <span id="horizon_type_text">ABC</span>--%>
                </button>
                <p>Vertical</p>
                <button id="veritcal_change_btn" type="button" class="naBtn btn-concrete">1<br>2<br>3
<%--                    <span id="vertical_type_text">123</span>--%>
                </button>
            </div>
        </div>
        <div id="main_img_div" style="width: 1300px;height: 920px;margin-top: 1%;">
            <div class="embed-responsive embed-responsive-4by3">
                <div id="myWindow" class="embed-responsive-item">
                    <div id="myContent">
                        <img id="img_div" src="/resource/main/blank.jpg" alt="image"/>
                        <div id="drawing_touch_div">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 20%;margin-left: 1%;">
            <button type="button" class="radius ml-5 blueWhiteBtn wd_70" id="layerSettingBtn" style="float: right;margin-top: -6%;">구역설정</button>
            <div class="rightTopDiv" style="width: 35%;float: right;margin-bottom: 2%;padding: 1px 0 1px 0;margin-top: -6%;">
                <span class="barCode" id="inspectionResultSpan">
                    <img src="/resource/asset/images/common/Code128code.png" alt="바코드" id="inspectionResultPopBarcodeImg" style="width: 100%;height: 27px;">
                </span>
                <input type="text" id="input_main_layer_barcode" style="width: 0;opacity: 0;height: 0;padding: 0;">
            </div>
            <div style="margin-top: 3%;">
                <div>
                    <table class="rowStyle">
                        <colgroup>
                            <col style="width: 60%">
                            <col style="width: 10%">
                            <col style="width: 5%">
                            <col style="width: 20%">
                        </colgroup>
                        <tr>
                            <th scope="col">작업번호</th>
                            <th scope="col">수량</th>
                            <th scope="col">형태</th>
                            <th scope="col">제품 No.</th>
                        </tr>
                        <tbody>
                            <tr>
                                <td id="CONTROL_NUM_DIV" class="table-bg-gray" style="text-decoration: underline;cursor: pointer;"></td>
                                <td id="QTY_DIV" class="table-bg-gray"></td>
                                <td id="WORK_TYPE_DIV" class="table-bg-gray"></td>
                                <td class="table-bg-gray">
                                    <input id="INSPECT_RESULT_NO" type="text" style="border: none;width: 50px;text-align: center;" disabled>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style="margin-top: 3%;">
                    <button type="button" id="focusGridBtn" class="defaultBtn blueWhiteBtn radius mr-5" style="font-size: 16px;width: 90px;height: 30px;">Focus</button>
                    <button type="button" id="openInspectBtn" class="defaultBtn radius" style="background: #ffc63a;border: 1px solid #ffc63a;font-size: 20px;height: 30px;margin-right: 7px;">
                        <i class="xi-folder-open"></i>
                    </button>
                    <div style="float: right;">
                        <button type="button" id="prevProdNum" class="defaultBtn radius" style="font-size: 20px;height: 30px;">
                            <i class="xi-angle-left"></i>
                        </button>
                        <button type="button" id="nextProdNum" class="defaultBtn radius" style="font-size: 20px;height: 30px;">
                            <i class="xi-angle-right"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div style="height: 84%;margin-top: 3%;">
                <form id="inspection_result_pop_form">
                    <input type="hidden" id="queryId" name="queryId" value="inspection.selectInspectionResult"/>
                    <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="${CONTROL_SEQ}"/>
                    <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="${CONTROL_DETAIL_SEQ}"/>
                    <input type="hidden" id="QTY" name="QTY"/>
                    <input type="hidden" id="PRODUCT_NUM" name="PRODUCT_NUM"/>
                    <input type="hidden" id="LAYER_AREA_NAME" name="LAYER_AREA_NAME"/>
                    <input type="hidden" id="INSPECT_RESULT_SEQ" name="INSPECT_RESULT_SEQ"/>
                    <input type="hidden" id="SIZE_TXT" name="SIZE_TXT"/>
                    <input type="hidden" id="LAST_PRODUCT_NUM" name="LAST_PRODUCT_NUM"/>
                    <input type="hidden" id="INSPECT_RESULT_CNT" name="INSPECT_RESULT_CNT"/>
                </form>
                <div id="inspection_result_pop_grid"></div>
            </div>
            <div style="margin-top: 3%;text-align: center">
                <button type="button" id="newInspectBtn" class="defaultBtn btn-110w radius green left_float" style="font-size: 16px;height: 65px;">신규 작성</button>
                <button type="button" id="startInspectBtn" class="defaultBtn btn-110w radius orange left_float" style="font-size: 16px;height: 30px;">수 정</button>
                <button type="button" id="saveInspectBtn" class="defaultBtn btn-110w radius green" style="font-size: 16px;height: 30px;display: none;">저 장</button>
                <button type="button" id="gradeInspectBtn" class="defaultBtn btn-110w radius purple" style="font-size: 16px;height: 30px;">등급 입력</button>
<%--                <button type="button" id="saveHtmlImgBtn" class="defaultBtn btn-120w radius" style="font-size: 16px;height: 30px;">이미지 저장</button>--%>
                <button type="button" id="deleteInspectBtn" class="defaultBtn btn-110w radius red mt-05 left_float" style="font-size: 16px;height: 30px;">삭 제</button>
                <button type="button" id="cancelInsepctBtn" class="defaultBtn btn-110w radius darkBlue mt-05 left_float" style="font-size: 16px;height: 30px;display: none;">취 소</button>
                <button type="button" id="closeInspectBtn" class="defaultBtn btn-110w radius black mt-05" style="font-size: 16px;height: 30px;">닫 기</button>
<%--                <button type="button" class="defaultBtn radius black mt-05" style="font-size: 16px;height: 30px;" id="startRecordBtn">동영상 녹화 시작</button>--%>
<%--                <button type="button" class="defaultBtn radius black mt-05" style="font-size: 16px;height: 30px;" id="stopRecordBtn">정지</button>--%>
<%--                <button type="button" class="defaultBtn radius black mt-05" style="font-size: 16px;height: 30px;" id="playRecordBtn">미리보기</button>--%>
<%--                <a class="defaultBtn radius black mt-05"  style="font-size: 16px;height: 30px;" id="downloadRecordBtn">다운로드</a>--%>
            </div>
        </div>
    </div>
    <div class="popup_container" id="layer_setting_popup" style="display: none;">
        <div class="layerPopup" style="width: 95%; height: 98%;">
            <h3><i class="xi-drag-vertical"></i>Layer 구역 설정</h3>
            <div style="height: 5%;margin-bottom: 1%;margin-top: -1%;margin-left: -0.1;">
                <div class="step-state step1">
                    <ul>
                        <li><p>0</p></li>
                        <li><p>100</p></li>
                        <li><p>200</p></li>
                        <li><p>300</p></li>
                        <li><p>400</p></li>
                        <li><p>500</p></li>
                        <li><p>600</p></li>
                        <li><p>700</p></li>
                        <li><p>800</p></li>
                        <li><p>900</p></li>
                        <li><p>1000</p></li>
                        <li><p>1100</p></li>
                        <li><p>1200</p></li>
                        <li><p>1300</p></li>
                    </ul>
                </div>
            </div>
            <div class="d-flex" style="height: 85%;">
                <div style="width: 5.5%;margin-top: -3.23%;">
                    <div class="step-state-vertical step1">
                        <ul>
                            <li><p>0</p></li>
                            <li><p>100</p></li>
                            <li><p>200</p></li>
                            <li><p>300</p></li>
                            <li><p>400</p></li>
                            <li><p>500</p></li>
                            <li><p>600</p></li>
                            <li><p>700</p></li>
                            <li><p>800</p></li>
                            <li><p>900</p></li>
                        </ul>
                    </div>
                </div>
                <div style="width: 73%;display: flex;">
                    <img style="width: 1300px;height: 920px;border: 1px solid gray;" id="layer_setting_img" src="/resource/main/blank.jpg" alt="image"/>
                    <div id="layer_img_grid_div"></div>
                </div>
                <div style="width: 23%;">
                    <div class="rightTopDiv" style="width: 70%;margin-left: 17%;">
                        <button type="button" id="changeDraw" class="wd_100 radius blueWhiteBtn">샘플도면</button>
                        <button type="button" id="changeDraw1" class="wd_30 radius blueWhiteBtn" style="display: none;">1</button>
                        <button type="button" id="changeDraw2" class="wd_30 radius blueWhiteBtn" style="display: none;">2</button>
                        <button type="button" id="changeDraw3" class="wd_30 radius blueWhiteBtn" style="display: none;">3</button>
                        <span class="barCode ml-5">
                            <img id="layer_setting_barocde" src="/resource/asset/images/common/Code128code.png" alt="바코드" style="width: 59%;height: 30px;">
                        </span>
                        <input type="text" id="input_layer_barcode" style="width: 0;opacity: 0;height: 0;">
                    </div>
                    <div class="center-mt12" style="margin-top: 5%;">
                        <label class="wd_130">설정번호</label>
                        <select id="select_layer_name" class="wd_100">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                            <option value="E">E</option>
                            <option value="F">F</option>
                        </select>
                    </div>
                    <div class="d-flex">
                        <div class="ml-05p" style="width: 45%;">
                            <div class="center-mt12 ml-05p">
                                <label class="wd_130">Horizontal (<i class="xi-arrows-h"></i>) </label>
                            </div>
                            <div class="center-mt12">
                                <label class="wd_80">영역수</label>
                                <select class="wd_50" id="horizontal_div_num">
                                    <c:forEach var="i" begin="3" end="10">
                                        <option value="<c:out value='${i}'/>"><c:out value='${i}'/></option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="center-mt12">
                                <label class="wd_70">표기</label>
                                <select class="wd_65" id="horizontal_mark_type">
                                    <c:forEach var="code" items="${HighCode.H_1101}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="center-mt12" style="width: 100%;">
                                <table id="horizon_table" class="rowStyle">
                                    <colgroup>
                                        <col style="width: 40%">
                                        <col style="width: 60%">
                                    </colgroup>
                                    <tr>
                                        <th>구역</th>
                                        <th>좌표</th>
                                    </tr>
                                    <tbody>
                                        <c:forEach var="i" begin="1" end="10">
                                            <tr id="horizon_tr_<c:out value='${i}'/>" class="horizon_tr">
                                                <td>
                                                    <input class="wd_50 horizontal_name" type="text">
                                                </td>
                                                <td>
                                                    <input class="wd_80 horizontal_coord" type="text">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="center-mt12" style="width: 100%;">
                                <label class="wd_50">간격</label>
                                <input type="text" class="wd_65" id="horizontal_batch_num" style="border: 1px solid #cdcfd0;">
                                <button type="button" id="horizontal_batch_btn" class="wd_30 radius blueWhiteBtn" style="font-size: 17px;height: 21px;margin-left: 2px;">
                                    <i class="xi-check"></i>
                                </button>
                            </div>
                        </div>
                        <div class="ml-05p" style="width: 45%;">
                            <div class="center-mt12 ml-05p">
                                <label class="wd_130">Vertical (<i class="xi-arrows-v"></i>) </label>
                            </div>
                            <div class="center-mt12">
                                <label class="wd_80">영역수</label>
                                <select class="wd_50" id="vertical_div_num">
                                    <c:forEach var="i" begin="3" end="10">
                                        <option value="<c:out value='${i}'/>"><c:out value='${i}'/></option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="center-mt12">
                                <label class="wd_70">표기</label>
                                <select class="wd_65" id="vertical_mark_type">
                                    <c:forEach var="code" items="${HighCode.H_1101}">
                                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="center-mt12" style="width: 100%;">
                                <table id="vertical_table" class="rowStyle">
                                    <colgroup>
                                        <col style="width: 40%">
                                        <col style="width: 60%">
                                    </colgroup>
                                    <tr>
                                        <th>구역</th>
                                        <th>좌표</th>
                                    </tr>
                                    <tbody>
                                        <c:forEach var="i" begin="1" end="10">
                                            <tr id="vertical_tr_<c:out value='${i}'/>" class="vertical_tr">
                                                <td>
                                                    <input class="wd_50 vertical_name" type="text">
                                                </td>
                                                <td>
                                                    <input class="wd_80 vertical_coord" type="text">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="center-mt12" style="width: 100%;">
                                <label class="wd_50">간격</label>
                                <input type="text" class="wd_65" id="vertical_batch_num" style="border: 1px solid #cdcfd0;">
                                <button type="button" id="vertical_batch_btn" class="wd_30 radius blueWhiteBtn" style="font-size: 17px;height: 21px;margin-left: 2px;">
                                    <i class="xi-check"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="center-mt12" style="margin-left: 8%;">
                        <button type="button" id="saveAreaBtn" class="defaultBtn btn-120w radius green" style="font-size: 16px;height: 30px;">저 장</button>
                        <button type="button" id="closeAreaBtn" class="defaultBtn btn-120w radius black" style="font-size: 16px;height: 30px;">닫 기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="popup_container" id="inspectResult_list_popup" style="display: none;">
        <div class="layerPopup" style="width: 88%; height: 68%;">
            <h3><i class="xi-drag-vertical"></i> 성적서 Point 저장 기록 조회</h3>
            <div class="d-flex" style="height: 85%;">
                <div style="width: 45%;margin-right: 1%;">
                    <div class="d-inline-block" style="width: 100%;">
                        <form id="inspect_point_pop_form">
                            <input type="hidden" id="queryId" name="queryId" value="inspection.selectInspectPointList"/>
                            <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                            <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
                            <div style="margin-top: 3%;">
                                <span class="ipu_wrap">
                                    <label class="label_80" for="SIZE_TXT">규격</label>
                                    <input type="search" class="wd_150" name="SIZE_TXT" id="SIZE_TXT" title="규격">
                                </span>
                                <span class="slt_wrap">
                                    <label class="label_80" for="material_type">재질</label>
                                    <select class="wd_150" name="MATERIAL_TYPE" id="material_type" title="재질">
                                        <option value=""><spring:message code="com.form.top.all.option"/></option>
                                        <c:forEach var="code" items="${HighCode.H_1035}">
                                            <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <span class="refresh ml-05p">
                                    <button type="button" id="inspect_point_refresh">
                                        <img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침">
                                    </button>
                                </span>
                            </div>
                        </form>
                        <div style="margin-top: 2%;height: 92%;">
                            <div id="inspect_point_grid"></div>
                        </div>
                    </div>
                </div>
                <div id="div_point_pop" style="width: 55%;">
                    <img id="inspect_point_img" style="width: 890.21px;height: 630px;" src="/resource/main/blank.jpg" alt="image"/>
                </div>
            </div>
            <div style="text-align: center;margin-top: 3%;">
                <button type="button" id="applyPointBtn" class="defaultBtn btn-120w radius green" style="font-size: 16px;height: 30px;">적 용</button>
                <button type="button" data-dismiss="modal" class="defaultBtn btn-120w radius black" style="font-size: 16px;height: 30px;">닫 기</button>
            </div>
        </div>
    </div>

    <!-- 동영상 녹화 테스트용 코드 -->
    <div class="popup_container" id="stock_process_popup" style="display: none;">
        <div class="layerPopup" style="width: 760px; height: 500px;">
            <h3>재고 가공현황</h3>
            <hr>
            <button type="button" class="pop_close stock_process_popup_close">닫기</button>
            <div class="video-item">
                <h2>녹화중</h2>
                <video autoplay muted id="preview"></video>
            </div>
            <div class="video-item">
                <h2>미리보기</h2>
                <video id="recording"></video>
            </div>
        </div>
    </div>
<form class="form-inline" id="layer_setting_form" name="layer_setting_form" role="form" onsubmit="return false;">
</form>
    <script type="text/javascript" src='/resource/plugins/vanilla-js-wheel-zoom-master/dist/wheel-zoom.js'></script>
    <script type="text/javascript" src='/resource/plugins/html2canvas-1.3.3/html2canvas.js'></script>
    <script type='text/javascript'>
        const startBtn = document.getElementById('startRecordBtn');
        const stopBtn = document.getElementById('stopRecordBtn');
        const playBtn = document.getElementById('playRecordBtn');
        const download = document.getElementById('downloadRecordBtn');

        let wzoom = null;

        const previewPlayer = document.getElementById("preview");
        const recordingPlayer = document.getElementById("recording");

        let recorder;
        let recordedChunks;

        //functions
        function videoStart() {
            // navigator.mediaDevices.getUserMedia({ video:true,audio:true }) //웹캠 버전
            //     .then(stream => {
            //         previewPlayer.srcObject = stream;
            //         startRecording(previewPlayer.captureStream())
            //     })

            navigator.mediaDevices.getDisplayMedia({ video: { width: 640 , height: 480 },audio:true }) //웹캠 버전
                .then(stream => {
                    previewPlayer.srcObject = stream;
                    startRecording(previewPlayer.captureStream())
                })
        }
        function startRecording(stream) {
            recordedChunks=[];
            recorder = new MediaRecorder(stream);
            recorder.ondataavailable = (e)=>{
                recordedChunks.push(e.data)
                console.log(e.data);
            }
            recorder.start();
        }
        function stopRecording() {
            previewPlayer.srcObject.getTracks().forEach(track => track.stop());
            recorder.stop();
        }
        function playRecording() {
            const recordedBlob = new Blob(recordedChunks, {type:"video/webm"});
            recordingPlayer.src=URL.createObjectURL(recordedBlob);
            recordingPlayer.play();
            let today = new Date();
            download.href=recordingPlayer.src;
            download.download ='recording_'+ today+'.webm';
            console.log(recordedChunks);
            console.log(recordingPlayer.src);
        }
        //event
        // startBtn.addEventListener("click",videoStart);
        // stopBtn.addEventListener("click",stopRecording);
        // playBtn.addEventListener("click",playRecording);


        document.addEventListener('DOMContentLoaded', function () {
            var imageElement = document.getElementById('myContent').querySelector('img');

            if (imageElement.complete) {
                init();
            } else {
                imageElement.onload = init;
            }

            function init() {

                wzoom = WZoom.create('#myContent', {
                    type: 'html',
                    width: imageElement.naturalWidth,
                    height: imageElement.naturalHeight,
                    zoomOnClick : false
                });

                window.addEventListener('resize', function () {
                    wzoom.prepare();
                });
            }
        });

        $(function () {
            let inspectionResultPopGrid = $("#inspection_result_pop_grid");
            let inspectionResultPopColModel = [
                {title: 'INSPECT_RESULT_SEQ', dataIndx: 'INSPECT_RESULT_SEQ', hidden: true},
                {title: 'INSPECT_RESULT_DETAIL_SEQ', dataIndx: 'INSPECT_RESULT_DETAIL_SEQ', hidden: true},
                {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
                {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
                {title: 'COORDINATE_X', dataIndx: 'COORDINATE_X', hidden: true},
                {title: 'COORDINATE_Y', dataIndx: 'COORDINATE_Y', hidden: true},
                {title: 'No.', minWidth: 60, dataIndx: 'RESULT_NUM', sortable:false, editable:false,
                    styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
                },
                {title: '<i class="xi-eye-o" style="cursor: pointer;"></i>', minWidth: 60, dataIndx: 'EYE_VIEW', sortable:false,
                    styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'25px'}, editable:false,
                    render: function (ui) {
                        const cellData = ui.cellData;
                        if(cellData){
                            return '<i class="xi-eye-o clickEye" style="font-size: 20px;cursor:pointer;"></i>';
                        }
                    },
                    postRender: function (ui) {
                        let grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find(".clickEye").bind("click", function () {
                            let rowData = ui.rowData;
                            if(ui.rowData.EYE_VIEW == 1) {
                                ui.rowData.EYE_VIEW = 2;
                                $cell.find(".clickEye").removeClass('xi-eye-o');
                                $cell.find(".clickEye").addClass('xi-eye-off-o');
                                $("#code_" + rowData.RESULT_NUM).hide();
                            }else {
                                ui.rowData.EYE_VIEW = 1;
                                $("#code_" + rowData.RESULT_NUM).show();
                                $cell.find(".clickEye").removeClass('xi-eye-off-o');
                                $cell.find(".clickEye").addClass('xi-eye-o');
                            }
                        });
                    }
                },
                {title: 'POS', minWidth: 60, dataIndx: 'RESULT_POSITION', sortable:false, editable:false,
                    styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'}
                },
                {title: '<i id="header_reset" class="xi-undo" style="font-size: 16px;float: left;cursor: pointer;"></i> Value', minWidth: 100, dataIndx: 'RESULT_VALUE', sortable:false,
                    styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'12px'},
                    render: function (ui) {
                        const cellData = ui.cellData;
                        if(cellData){
                            return '<i class="xi-undo resetValue" style="font-size: 18px;float: left;cursor: pointer;"></i><span>' + cellData + '</span>';
                        }
                    },
                    postRender: function (ui) {
                        let grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find(".resetValue").bind("click", function () {
                            let rowData = ui.rowData;
                            ui.rowData.RESULT_VALUE = "";
                        });
                    }
                },
                {title: '<span id="header_delete" style="cursor: pointer;"><i class="xi-trash"></i></span>', minWidth: 60, dataIndx: 'DELETE_BTN', sortable:false,
                    styleHead: {'font-weight': 'bold', 'background': '#abc3e9','font-size':'20px'}, editable:false,
                    render: function (ui) {
                        const cellData = ui.cellData;
                        if(cellData){
                            return '<i class="xi-trash removeRow" style="font-size: 20px;cursor: pointer;"></i>';
                        }
                    },
                    postRender: function (ui) {
                        let grid = this,
                            $cell = grid.getCell(ui);
                        $cell.find(".removeRow").bind("click", function () {
                            if(inspectionResultPopGrid.pqGrid('option', 'editable')) {
                                let rowData = ui.rowData;
                                $("#code_" + rowData.RESULT_NUM).remove()
                                inspectionResultPopGrid.pqGrid('deleteRow', {rowIndx: rowData.pq_ri});

                                reCalculateNum(rowData.RESULT_NUM);
                            }
                        });
                    }
                }
            ];
            let inspectionResultPopObj = {
                height: '100%',
                width: "auto",
                selectionModel: { type: 'row', mode: 'single'},
                rowHtHead: 30,
                numberCell: {title: 'No.',show:false},
                sortModel: {on: false},
                swipeModel: {on: false}, trackModel: {on: true},
                strNoRows: '',
                editable: false,
                collapsible: false, resizable: false, flexWidth: false, showTitle: false,
                postRenderInterval: -1, //call postRender synchronously.
                columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
                colModel: inspectionResultPopColModel,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST", recIndx: 'RESULT_NUM',
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('inspection_result_pop_form'),
                    // postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 20}, recIndx: 'ROWNUM',
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                complete: function () {
                    let data = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');
                    let totalRecords = data.length;
                    // console.log('complete',data);
                    loadCoordinate(data);
                },
                editorKeyDown: function(evt, ui){
                    // console.log('editorKeyDown')
                    if(evt.keyCode == 13) {
                        $("#inspection_result_pop_grid").pqGrid('setSelection', null);
                        setTimeout(function () {
                            let instance = inspectionResultPopGrid.pqGrid('getInstance').grid.colIndxs;

                            inspectionResultPopGrid.pqGrid('setSelection', {rowIndx: (ui.rowData.pq_ri +1)});
                            // inspectionResultPopGrid.pqGrid('focus',{rowIndxPage:(ui.rowData.pq_ri +1), colIndx:instance['RESULT_VALUE']});
                            inspectionResultPopGrid.pqGrid('editCell',{rowIndx:(ui.rowData.pq_ri +1), dataIndx:'RESULT_VALUE'});
                        },150);

                    }
                }
                toolbar: false,
            };
            inspectionResultPopGrid.pqGrid(inspectionResultPopObj);


            function loadCoordinate(data) {
                $(".spanPosition").remove();
                $.each(data,function (idx,Item) {
                    let id = "code_" + Item.RESULT_NUM;
                    let html = '<span id="'+id+ '" class="spanPosition" style="top:'+Item.COORDINATE_Y+'px;left: '+Item.COORDINATE_X+'px;" data-target="'+Item.RESULT_NUM+'">'+ Item.RESULT_NUM +'</span>';
                    $("#img_div").after(html);
                    document.getElementById(id).addEventListener('touchend',clickNumber);
                    document.getElementById(id).addEventListener('touchstart',touchStartPoint);
                    document.getElementById(id).addEventListener('touchmove',dragPoint);
                })
            }
            function reCalculateNum(deleteNum) {
                let data = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');

                for(let i=0;i<data.length;i++) {
                    let rowData = inspectionResultPopGrid.pqGrid('getRowData', {rowIndx: i});
                    if(Number(rowData.RESULT_NUM) >= Number(deleteNum)) {
                        let newNum = rowData.RESULT_NUM
                        if(i>0 && data.length > 1) {
                            let beforeData = inspectionResultPopGrid.pqGrid('getRowData', {rowIndx: i-1});
                            newNum = Number(beforeData.RESULT_NUM) +1;
                        }else if(i == 0) {
                            newNum = 1;
                        }

                        $("#code_" + rowData.RESULT_NUM).remove();
                        inspectionResultPopGrid.pqGrid('updateRow', {
                            rowIndx: i,
                            row: {'RESULT_NUM': newNum},
                            checkEditable: false
                        });

                        let html = '<span id="code_'+newNum+ '" class="spanPosition" style="top:'+rowData.COORDINATE_Y+'px;left: '+rowData.COORDINATE_X+'px;">'+ newNum +'</span>';
                        $("#img_div").after(html);

                    }
                }
            }

            let targetX = 0;
            let targetY = 0;
            let gridDivData = {
                'gridDivX':[],
                'gridDivY':[]
            }

            function addNewCoordinate(x,y) {
                let pos1 = "";
                let pos2 = "";
                $.each(gridDivData.gridDivX,function (idx,Item) {
                    if(x < Item.AREA_COORDINATE && pos1 == "") {
                        pos1 = Item.AREA_NAME;
                    }
                })
                $.each(gridDivData.gridDivY,function (idx,Item) {
                    if(y < Item.AREA_COORDINATE && pos2 == "") {
                        pos2 = Item.AREA_NAME;
                    }
                })
                let newIdx = $("#inspection_result_pop_grid").pqGrid('option', 'dataModel.data').length
                inspectionResultPopGrid.pqGrid('addRow', {
                    newRow: {
                        'CONTROL_SEQ':$("#inspection_result_pop_form").find("#CONTROL_SEQ").val(),
                        'CONTROL_DETAIL_SEQ':$("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val(),
                        'RESULT_NUM':$(".spanPosition").length,
                        'EYE_VIEW':1,
                        'RESULT_POSITION':pos1 + pos2,
                        'RESULT_VALUE':'',
                        'DELETE_BTN':1,
                        'COORDINATE_X':x,
                        'COORDINATE_Y':y
                    },
                    rowIndx: newIdx,
                    checkEditable: false
                });

                setTimeout(function () {
                    let instance = inspectionResultPopGrid.pqGrid('getInstance').grid.colIndxs;
                    inspectionResultPopGrid.pqGrid('focus',{rowIndxPage:newIdx, colIndx:instance['RESULT_VALUE']});
                    inspectionResultPopGrid.pqGrid('editCell',{rowIndx:newIdx, dataIndx:'RESULT_VALUE'});
                },100)
            }
            function calculateCoord(data) {
                $.each(data, function (idx,rowData) {
                    let pos1 = "";
                    let pos2 = "";
                    $.each(gridDivData.gridDivX,function (idx2,Item) {
                        if(rowData.COORDINATE_X < Item.AREA_COORDINATE && pos1 == "") {
                            pos1 = Item.AREA_NAME;
                        }
                    })
                    $.each(gridDivData.gridDivY,function (idx2,Item) {
                        if(rowData.COORDINATE_Y < Item.AREA_COORDINATE && pos2 == "") {
                            pos2 = Item.AREA_NAME;
                        }
                    })
                    inspectionResultPopGrid.pqGrid("updateRow", {
                        'rowIndx': rowData.pq_ri ,
                        row: { 'RESULT_POSITION': pos1+""+pos2 },
                        checkEditable: false
                    });
                })
            }
            function calculateCoordPoint(x, y) {
                let pos1 = "";
                let pos2 = "";
                $.each(gridDivData.gridDivX,function (idx2,Item) {
                    if(x < Item.AREA_COORDINATE && pos1 == "") {
                        pos1 = Item.AREA_NAME;
                    }
                })
                $.each(gridDivData.gridDivY,function (idx2,Item) {
                    if(y < Item.AREA_COORDINATE && pos2 == "") {
                        pos2 = Item.AREA_NAME;
                    }
                })
                return pos1+""+pos2;
            }


            function clickNumber(e) {
                $("#inspection_result_pop_grid").pqGrid('setSelection', null);

                // console.log($(this).data('target'));
                let num = $(this).data('target');
                let data = $("#inspection_result_pop_grid").pqGrid("getData",{dataIndx:['RESULT_NUM']});
                let targetIdx = -1;
                $.each(data,function (idx,Item) {
                    if(Item.RESULT_NUM == num) {
                        targetIdx = idx;
                    }
                });

                if(targetIdx >= 0) {
                    $("#inspection_result_pop_grid").pqGrid('setSelection', {rowIndx: targetIdx});

                    var rect = document.getElementById('drawing_touch_div').getBoundingClientRect();
                    var x = e.changedTouches[0].pageX - rect.left;
                    var y = e.changedTouches[0].pageY - rect.top;

                    let endX = Math.floor(($("#drawing_touch_div").width()/Math.floor(rect.width)) * x);
                    let endY = Math.floor(($("#drawing_touch_div").height()/Math.floor(rect.height)) * y);


                    $("#inspection_result_pop_grid").pqGrid('updateRow', {
                        rowIndx: targetIdx,
                        row: {
                            "COORDINATE_X":endX,
                            "COORDINATE_Y":endY,
                            "RESULT_POSITION":calculateCoordPoint(endX,endY)
                        },
                        checkEditable: false
                    });
                }

                wzoom.dragScrollable.isTouch = true;
            }

            function touchStartPoint(e) {
                wzoom.dragScrollable.isTouch = false;
            }

            function dragPoint(e) {
                e.preventDefault();
                if($("#startInspectBtn").css( "display" ) == "none") {
                    wzoom.dragScrollable.isTouch = false;

                    var rect = document.getElementById('drawing_touch_div').getBoundingClientRect();
                    var x = e.changedTouches[0].pageX - rect.left;
                    var y = e.changedTouches[0].pageY - rect.top;

                    let boxX = Math.floor(($("#drawing_touch_div").width()/Math.floor(rect.width)) * x);
                    let boxY = Math.floor(($("#drawing_touch_div").height()/Math.floor(rect.height)) * y);
                    $("#"+e.target.id).css({
                        'top':boxY,
                        'left':boxX
                    })
                }
            }

            // 터치 포인트 관련 기능
            let startTime = 0;
            let moveTime = 0;
            let endTime = 0;

            function checkTouchTime(e) {
                if($("#startInspectBtn").css( "display" ) == "none") {
                    if(endTime - startTime <= 200) {
                        var rect = document.getElementById('drawing_touch_div').getBoundingClientRect();
                        var x = e.originalEvent.changedTouches[0].pageX - rect.left;
                        var y = e.originalEvent.changedTouches[0].pageY - rect.top;

                        targetX = Math.floor(($("#drawing_touch_div").width()/Math.floor(rect.width)) * x);
                        targetY = Math.floor(($("#drawing_touch_div").height()/Math.floor(rect.height)) * y);

                        let id = "code_" + ($(".spanPosition").length+1)
                        let html = '<span id="'+id+ '" class="spanPosition" style="top:'+targetY+'px;left: '+targetX+'px;" data-target="'+ ($(".spanPosition").length+1)+'">'+($(".spanPosition").length+1) +'</span>';
                        $("#img_div").after(html);
                        document.getElementById(id).addEventListener('touchend',clickNumber);
                        document.getElementById(id).addEventListener('touchstart',touchStartPoint);
                        document.getElementById(id).addEventListener('touchmove',dragPoint);
                        addNewCoordinate(targetX,targetY);

                    }
                }
            }

            $("#drawing_touch_div").on("touchstart", function (e) {
                e.preventDefault();

                startTime = new Date().getTime();
            });

            $("#drawing_touch_div").on("touchmove", function (e) {
                e.preventDefault();

                moveTime = new Date().getTime()
            })
            $("#drawing_touch_div").on("touchend", function (e) {
                e.preventDefault();

                endTime = new Date().getTime();

                checkTouchTime(e);
            })



            $(".layerBtn").on("click", function (e) {
                if($("#startInspectBtn").css( "display") != "none") {
                    let layer = $(this).data('target');
                    $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val(layer);

                    if($(this).hasClass("on")) {
                        $(".layerBtn").removeClass("on");
                        $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val("");
                        layer = "";
                    }else {
                        $(".layerBtn").removeClass("on");
                        $(this).addClass("on");
                    }

                    let parameter = {
                        'queryId': 'inspection.selectLayerInfo',
                        'LAYER_AREA_NAME': layer
                    };
                    let parameters = {'url': '/json-list', 'data': parameter};
                    fnPostAjaxAsync(function(data, callFunctionParam){
                        setTimeout(function () {
                            settingLayerGrid(data,'main');
                        },400);
                    }, parameters, '');
                }else {
                // 성적서 입력중에는 레이어 선택불가~
                }
            })

            $("#inspectionResultSpan").on("click", function () {
                $("#inspectionResultPopBarcodeImg").attr("src", "/resource/asset/images/common/Code128code_on.png");
                $("#input_main_layer_barcode").focus();
            });
            $("#input_main_layer_barcode").on({
                'focus': function () {
                    $("#inspectionResultPopBarcodeImg").attr("src","/resource/asset/images/common/Code128code_on.png");
                },
                'blur': function () {
                    $('#inspectionResultPopBarcodeImg').prop('src','/resource/asset/images/common/Code128code.png');
                },
                'keyup': function (e) {
                    if(e.keyCode == 13) {
                        let barcodeNum = fnBarcodeKo2En($(this).val());
                        settingPopData(barcodeNum);

                        $(this).val('');
                    }
                }
            })
            $("#inspectionResultPopBarcodeImg").on('click', function (){
                $("#input_main_layer_barcode").focus();
            })

            // 시작
            $("#startInspectBtn").on("click", function () {
                let prodNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();
                let layer = $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val();

                if(!fnIsEmpty(prodNum)) {
                    let gridData = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');
                    if(gridData.length > 0) {
                        let orgLayer = (typeof gridData[0].LAYER_AREA_NAME != 'undefined')?gridData[0].LAYER_AREA_NAME : "";

                        if(orgLayer != layer) {
                            fnConfirm(null, "해당 레이어로 적용하시겠습니까?", function () {
                                calculateCoord(gridData);
                            }, function () {
                                if(fnIsEmpty(orgLayer)){
                                    resetLayer();
                                }else {
                                    $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val(orgLayer);

                                    $(".layerBtn").removeClass("on");
                                    $("button[data-target='"+orgLayer +"']").addClass("on");

                                    let parameter = {
                                        'queryId': 'inspection.selectLayerInfo',
                                        'LAYER_AREA_NAME': orgLayer
                                    };
                                    let parameters = {'url': '/json-list', 'data': parameter};
                                    fnPostAjaxAsync(function(data, callFunctionParam){
                                        setTimeout(function () {
                                            settingLayerGrid(data,'main');
                                        },400);
                                    }, parameters, '');
                                }
                            });
                        }
                    }
                    inspectionResultPopGrid.pqGrid('option', 'editable', true);
                }else {
                    inspectionResultPopGrid.pqGrid('option', 'editable', true);
                    inspectionResultPopGrid.pqGrid('option' , 'dataModel.data',[]);
                    inspectionResultPopGrid.pqGrid('refreshDataAndView');
                }
                settingBtn('start');
                settingProdNumDiv('edit')
            });

            function settingBtn(type) {
                if(type == 'cancel' || type == 'save' || type == 'delete') {
                    $("#deleteInspectBtn").attr('disabled',false);
                    $("#gradeInspectBtn").attr('disabled',false);
                    $("#newInspectBtn").attr('disabled',false);
                    $("#prevProdNum").attr('disabled',false);
                    $("#nextProdNum").attr('disabled',false);
                    $("#startInspectBtn").show();
                    $("#deleteInspectBtn").show();
                    $("#cancelInsepctBtn").hide();
                    $("#saveInspectBtn").hide();

                    let inspectResultSeq = $("#inspection_result_pop_form").find("#INSPECT_RESULT_SEQ").val();
                    if(fnIsEmpty(inspectResultSeq)) {
                        $("#deleteInspectBtn").attr('disabled',true);
                        $("#startInspectBtn").attr('disabled',true);
                    }else {
                        $("#startInspectBtn").attr('disabled',false);
                    }

                    let prodNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();
                    let lastProdNum = $("#inspection_result_pop_form").find("#LAST_PRODUCT_NUM").val();
                    if(Number(lastProdNum) <= Number(prodNum)) {
                        $("#nextProdNum").attr('disabled',true);
                    }
                    if(fnIsEmpty(prodNum) || Number(prodNum) == 1) {
                        $("#prevProdNum").attr('disabled',true);
                    }
                }else if(type == 'start' || type == 'new') {
                    $("#deleteInspectBtn").hide();
                    $("#startInspectBtn").hide();
                    $("#saveInspectBtn").show();
                    $("#cancelInsepctBtn").show();
                    $("#gradeInspectBtn").attr('disabled',true);
                    $("#deleteInspectBtn").attr('disabled',true);
                    $("#newInspectBtn").attr('disabled',true);
                    $("#prevProdNum").attr('disabled',true);
                    $("#nextProdNum").attr('disabled',true);
                }
            }
            function settingProdNumDiv(type) {
                let resultCnt = $("#inspection_result_pop_form").find("#INSPECT_RESULT_CNT").val();
                let currProdNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();
                if(fnIsEmpty(currProdNum)) {
                    currProdNum = "";
                }
                if(fnIsEmpty(resultCnt)) {
                    resultCnt = 0;
                }

                if(type == 'edit' || Number(resultCnt) <= 0 || fnIsEmpty(currProdNum)) {
                    $("#INSPECT_RESULT_NO").val(currProdNum);
                }else {
                    $("#INSPECT_RESULT_NO").val(currProdNum + " / " + resultCnt)
                }
            }

            $("#cancelInsepctBtn").on("click", function () {
                fnConfirm(null, "취소 하시겠습니까?", function () {
                    settingBtn('cancel');
                    settingProdNumDiv('cancel');

                    inspectionResultPopGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('inspection_result_pop_form');
                    } );
                    inspectionResultPopGrid.pqGrid("refreshDataAndView");
                });
            });

            $("#newInspectBtn").on("click", function () {
                let layer = $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val();
                // console.log(layer);
                if(fnIsEmpty(layer)) {
                    fnAlert(null,"레이어를 선택해주세요.");
                    return false;
                }
                let qty = $("#inspection_result_pop_form").find("#QTY").val();
                let latestProdNum = $("#inspection_result_pop_form").find("#LAST_PRODUCT_NUM").val();

                if(!fnIsEmpty(latestProdNum)) {
                    let nextNum = Number(latestProdNum) +1;
                    if(nextNum > qty) {
                        fnAlert(null,"검사 성적서는 수량 갯수만큼만 작성 가능합니다.");
                        return;ㅊ
                    }else {
                        latestProdNum = nextNum;
                    }
                }else {
                    latestProdNum = 1;
                }

                $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(latestProdNum);
                settingPopData('newInspect');
                settingBtn('new');
                settingProdNumDiv('edit')
            });

            // 저장
            $("#saveInspectBtn").on("click", function () {
                let prodNo = $("#INSPECT_RESULT_NO").val();
                if(fnIsEmpty(prodNo)) {
                    fnAlert(null,"제품 번호를 입력하세요.");
                    return;
                }
                let data = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');
                let gridInstance = inspectionResultPopGrid.pqGrid('getInstance').grid;
                let changes = gridInstance.getChanges({format: 'byVal'});

                changes.PRODUCT_NUM = prodNo;
                changes.CONTROL_SEQ = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
                changes.CONTROL_DETAIL_SEQ = $("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val();
                changes.LAYER_AREA_NAME = $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val();

                let parameters = {'url': '/modifyInspectResult', 'data': {data: JSON.stringify(changes)}};

                fnPostAjax(function (data) {
                    // console.log('data',data);
                    fnAlert(null,"저장되었습니다.");
                    setTimeout(function () {
                        alertify.alert().close();
                    },1000);

                    inspectionResultPopGrid.pqGrid('option', 'editable', false);

                    inspectionResultPopGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('inspection_result_pop_form');
                    } );
                    inspectionResultPopGrid.pqGrid("refreshDataAndView");

                    let result = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');

                    if(!fnIsEmpty(prodNo)) {
                        $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(prodNo);
                    }
                    if(!fnIsEmpty(data.result.INSPECT_RESULT_SEQ)) {
                        $("#inspection_result_pop_form").find("#INSPECT_RESULT_SEQ").val(data.result.INSPECT_RESULT_SEQ);
                    }
                    if(!fnIsEmpty(data.result.LAST_PRODUCT_NUM)) {
                        $("#inspection_result_pop_form").find("#LAST_PRODUCT_NUM").val(data.result.LAST_PRODUCT_NUM);
                    }
                    if(!fnIsEmpty(data.result.INSPECT_RESULT_CNT)) {
                        $("#inspection_result_pop_form").find("#INSPECT_RESULT_CNT").val(data.result.INSPECT_RESULT_CNT);
                    }

                    settingProdNumDiv('new')
                    settingBtn('save');
                }, parameters, '');
            });

            $("#CONTROL_NUM_DIV").on("click", function () {
                let controlSeq = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
                let controlDetailSeq = $("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val();
                g_item_detail_pop_view(controlSeq, controlDetailSeq);
            });

            $("#focusGridBtn").on("click", function () {
                if($("#startInspectBtn").css( "display" ) == "none") {
                    $("#inspection_result_pop_grid").pqGrid('setSelection', null);
                    let data = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');

                    $.each(data,function (idx,Item) {
                        if(fnIsEmpty(Item.RESULT_VALUE)) {
                            inspectionResultPopGrid.pqGrid('editCell',{rowIndx:Item.pq_ri, dataIndx:'RESULT_VALUE'});
                            return false;
                        }
                    })
                }
            });

            $("#openInspectBtn").on("click", function () {
                $("#inspectResult_list_popup").modal('show')
            });

            $("#prevProdNum").on("click", function () {
                let currProdNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();
                let qty = $("#inspection_result_pop_form").find("#QTY").val();
                if(!fnIsEmpty(currProdNum)) {
                    let prevNum = Number(currProdNum) -1;
                    if(prevNum > 0) {
                        $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(prevNum);
                        settingPopData();
                    }
                }
            });

            $("#nextProdNum").on("click", function () {
                let currProdNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();
                let qty = $("#inspection_result_pop_form").find("#QTY").val();

                if(!fnIsEmpty(currProdNum)) {
                    let nextNum = Number(currProdNum) +1;
                    if(nextNum > qty) {
                        fnAlert(null,"검사 성적서는 수량 갯수만큼만 작성 가능합니다.");
                        return;
                    }else {
                        $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(nextNum);
                        settingPopData();
                    }
                }
            });

            $("#saveHtmlImgBtn").on("click",function () {
                html2canvas(document.querySelector("#myWindow")).then(
                    function(canvas) {
                        // return Canvas2Image.saveAsPNG(canvas);
                        saveAs(canvas.toDataURL(),  'myWindow_Media.jpg');
                });
            });
            function saveAs(uri, filename) {
                var link = document.createElement('a');
                if (typeof link.download === 'string') {
                    link.href = uri;
                    link.download = filename;

                    //Firefox requires the link to be in the body
                    document.body.appendChild(link);

                    //simulate click
                    link.click();

                    //remove the link when done
                    document.body.removeChild(link);
                } else {
                    window.open(uri);
                }
            }

            $("#gradeInspectBtn").on("click",function () {
                let controlSeq = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
                let controlDetailSeq = $("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val();
                if(!fnIsEmpty(controlSeq) && !fnIsEmpty(controlDetailSeq)) {
                    fnResetForm("inspection_manage_pop_form");
                    $("#inspection_manage_pop_form").find("#CONTROL_SEQ").val(controlSeq);
                    $("#inspection_manage_pop_form").find("#CONTROL_DETAIL_SEQ").val(controlDetailSeq);
                    $('#inspection_manage_pop').modal('show');
                }
            });

            $("#deleteInspectBtn").on("click",function () {
                fnConfirm(null, "삭제하시겠습니까?", function () {
                    let controlSeq = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
                    let controlDetailSeq = $("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val();
                    let data = {
                        'queryId': "inspection.deleteInspectionResultProdNum,inspection.deleteInspectionResultDetailProdNum",
                        'CONTROL_SEQ': controlSeq,
                        'CONTROL_DETAIL_SEQ':controlDetailSeq,
                        'INSPECT_RESULT_SEQ':$("#inspection_result_pop_form").find("#INSPECT_RESULT_SEQ").val(),
                        'PRODUCT_NUM':$("#inspection_result_pop_form").find("#PRODUCT_NUM").val()
                    };
                    let parameters = {'url': '/json-manager', 'data': data};
                    fnPostAjax(function (data) {
                        fnAlert(null, "삭제되었습니다.");
                        $("#inspection_result_pop_form").find("#PRODUCT_NUM").val('');
                        $("#inspection_result_pop_form").find("#INSPECT_RESULT_SEQ").val('');
                        $("#inspection_result_pop_form").find("#INSPECT_RESULT_CNT").val(0);
                        $("#inspection_result_pop_form").find("#LAST_PRODUCT_NUM").val('');
                        $("#INSPECT_RESULT_NO").val('')

                        settingPopData();
                        settingBtn('delete');
                    }, parameters, '');
                })
            });

            $("#closeInspectBtn").on("click",function () {
                if($("#startInspectBtn").css( "display" ) == "none") {
                    fnConfirm(null, "저장하지 않고 종료 하시겠습니까?<br>(저장하지 않은 데이터는 삭제됩니다.)", function () {
                        window.close();
                    });
                }else {
                    window.close();
                }
            });

            $("#layerSettingBtn").on("click",function () {
                $("#layer_setting_popup").modal('show');
            })
            $("#changeDraw").on("click",function () {
                $("#layer_setting_barocde").attr("src", "/resource/asset/images/common/Code128code_on.png");
                $("#input_layer_barcode").focus();
            });
            $("#input_layer_barcode").on({
                'keyup': function (e) {
                    if(e.keyCode == 13) {
                        let barcodeNum = fnBarcodeKo2En($(this).val());

                        let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeNum};
                        let parameters = {'url': '/json-info', 'data': data};
                        fnPostAjax(function (data) {
                            let dataInfo = data.info;
                            if(dataInfo != null && !fnIsEmpty(dataInfo.IMG_GFILE_SEQ)) {
                                $("#layer_setting_img").attr("src", "/image/"+dataInfo.IMG_GFILE_SEQ);
                            }
                        }, parameters, '');
                        $(this).val('');
                    }
                },
                'focus': function () {
                    $('#layer_setting_barocde').prop('src','/resource/asset/images/common/Code128code_on.png');
                },
                'blur': function () {
                    $('#layer_setting_barocde').prop('src','/resource/asset/images/common/Code128code.png');
                }
            })
            $("#layer_setting_barocde").on('click',function (){
                $("#input_layer_barcode").focus();
            })




            $("#changeDraw1").on("click",function () {
                $("#layer_setting_img").attr("src", "/resource/asset/images/common/drawing_1.png");
            });
            $("#changeDraw2").on("click",function () {
                $("#layer_setting_img").attr("src", "/resource/asset/images/common/drawing_2.png");
            });
            $("#changeDraw3").on("click",function () {
                $("#layer_setting_img").attr("src", "/resource/asset/images/common/drawing_3.png");
            });

            $("#horizontal_batch_btn").on("click",function () {
                let batchNum = $("#horizontal_batch_num").val();
                let divNum = $("#horizontal_div_num").val();
                let markType = $("#horizontal_mark_type").val();
                let asciiNum = 65;
                if(!fnIsEmpty(batchNum)) {
                    $(".horizontal_coord").val("");
                    $(".horizontal_name").val("");
                    $(".horizontal_coord").each(function(i,e){
                        if(i < divNum) {
                            $(this).val(batchNum * (i+1));
                        }
                    })
                    $(".horizontal_name").each(function(i,e){
                        if(i < divNum) {
                            if(markType == 'M1') {
                                $(this).val(i+1);
                            }else {
                                let text = String.fromCharCode(asciiNum + i);
                                $(this).val(text);
                            }
                        }
                    })
                    $("#horizontal_batch_num").val("");
                }
            });
            $("#vertical_batch_btn").on("click",function () {
                let batchNum = $("#vertical_batch_num").val();
                let divNum = $("#vertical_div_num").val();
                let markType = $("#vertical_mark_type").val();
                let asciiNum = 65;
                if(!fnIsEmpty(batchNum)) {
                    $(".vertical_coord").val("");
                    $(".vertical_name").val("");
                    $(".vertical_coord").each(function(i,e){
                        if(i < divNum) {
                            $(this).val(batchNum * (i+1));
                        }
                    })
                    $(".vertical_name").each(function(i,e){
                        if(i < divNum) {
                            if(markType == 'M1') {
                                $(this).val(i+1);
                            }else {
                                let text = String.fromCharCode(asciiNum + i);
                                $(this).val(text);
                            }
                        }
                    })
                    $("#vertical_batch_num").val("");
                }
            });
            $("#select_layer_name").on('change',function () {
                let parameter = {
                    'queryId': 'inspection.selectLayerInfo',
                    'LAYER_AREA_NAME': $(this).val()
                };
                let parameters = {'url': '/json-list', 'data': parameter};
                fnPostAjaxAsync(function(data, callFunctionParam){
                    // console.log(data);
                    settingLayerGrid(data);
                }, parameters, '');
            });

            // $("#horizontal_div_num").on('change',function () {
            //     $(".horizon_tr").removeClass("table-bg-gray");
            //     $(".horizon_tr").find("input").prop("disabled",false);
            //     let num = Number($(this).val());
            //     let totalLength = $(".horizon_tr").length;
            //     for(let i=num;i<=totalLength;i++) {
            //         $(".horizon_tr").eq(i).addClass("table-bg-gray");
            //         $(".horizon_tr").eq(i).find("input").prop("disabled",true);
            //     }
            // });
            // $("#vertical_div_num").on('change',function () {
            //     $(".vertical_tr").removeClass("table-bg-gray");
            //     $(".vertical_tr").find("input").prop("disabled",false);
            //     let num = Number($(this).val());
            //     let totalLength = $(".vertical_tr").length;
            //     for(let i=num;i<=totalLength;i++) {
            //         $(".vertical_tr").eq(i).addClass("table-bg-gray");
            //         $(".vertical_tr").eq(i).find("input").prop("disabled",true);
            //     }
            // });

            function changeHorizonVertical(btnId) {
                let text = $("#" + btnId).text();
                let divName = (btnId.indexOf("horizon") >= 0) ? 'gridDivX' : 'gridDivY';

                if(text.toUpperCase() == "ABC") {
                    $("#" + btnId).text("123");
                    for(var i=0;i<gridDivData[divName].length;i++) {
                        gridDivData[divName][i].AREA_NAME = (i+1);
                    }
                }else {
                    $("#" + btnId).text("ABC");
                    let asciiNum = 65;
                    for(var i=0;i<gridDivData[divName].length;i++) {
                        gridDivData[divName][i].AREA_NAME = String.fromCharCode(asciiNum + i);
                    }
                }

                let gridData = inspectionResultPopGrid.pqGrid('option', 'dataModel.data');
                calculateCoord(gridData)
            }

            $("#horizon_change_btn").on("click",function () {
                if($("#startInspectBtn").css( "display" ) == "none") {
                    changeHorizonVertical('horizon_change_btn');
                }
            });
            $("#veritcal_change_btn").on("click",function () {
                if($("#startInspectBtn").css( "display" ) == "none") {
                    changeHorizonVertical('veritcal_change_btn');
                }
            });

            $("#closeAreaBtn").on("click",function () {
                $("#layer_setting_popup").modal('hide');
            })
            $("#saveAreaBtn").on("click",function () {
                let arr = [];
                let layerAreaName = $("#select_layer_name").val();
                $(".horizontal_name").each(function(i,e){
                    if(!fnIsEmpty($(this).val())) {
                        let json = {
                            'LAYER_AREA_NAME':layerAreaName,
                            'AREA_TYPE':'H',
                            'MARK_TYPE':$("#horizontal_mark_type").val(),
                            'AREA_NAME':$(this).val(),
                            'AREA_COORDINATE':$(this).parent().next().children(".horizontal_coord").val()
                        }
                        arr.push(json)
                    }
                });
                $(".vertical_name").each(function(i,e){
                    if(!fnIsEmpty($(this).val())) {
                        let json = {
                            'LAYER_AREA_NAME':layerAreaName,
                            'AREA_TYPE':'V',
                            'MARK_TYPE':$("#vertical_mark_type").val(),
                            'AREA_NAME':$(this).val(),
                            'AREA_COORDINATE':$(this).parent().next().children(".vertical_coord").val()
                        }
                        arr.push(json)
                    }
                });

                let parameters = {'url': '/saveLayer', 'data': {data: JSON.stringify(arr)}};
                fnPostAjaxAsync(function(data, callFunctionParam){
                    let parameter = {
                        'queryId': 'inspection.selectLayerInfo',
                        'LAYER_AREA_NAME': layerAreaName
                    };
                    let parameters2 = {'url': '/json-list', 'data': parameter};
                    fnPostAjaxAsync(function(data, callFunctionParam){
                        fnAlert(null,"저장되었습니다.");
                        settingLayerGrid(data);
                    }, parameters2, '');
                }, parameters, '');
            });

            function resetLayer() {
                $("#drawing_touch_div").empty();
                $("#inspection_result_pop_form").find("#LAYER_AREA_NAME").val('');
                $(".layerBtn").removeClass("on");
                gridDivData.gridDivX = [];
                gridDivData.gridDivY = [];
            }
            function settingLayerGrid(data,type) {
                gridDivData.gridDivX = [];
                gridDivData.gridDivY = [];
                let targetId = '';
                let rowRatio = 1;
                let colRatio = 1;
                if(type == 'main') {
                    targetId = 'drawing_touch_div';
                    $("#drawing_touch_div").empty();
                    rowRatio = ($("#myContent").height() / $("#main_img_div").height());
                    colRatio = ($("#myContent").width() / $("#main_img_div").width());
                }else {
                    targetId = 'layer_img_grid_div';
                    $("#layer_img_grid_div").empty();
                    $(".vertical_name").val("");
                    $(".vertical_coord").val("");
                    $(".horizontal_name").val("");
                    $(".horizontal_coord").val("");
                }

                if(data.list.length > 0) {
                    let rowCss = '';
                    let colCss = '';
                    let rowCoord = 0;
                    let colCoord = 0;
                    let groups = fnGroupBy(data.list,'AREA_TYPE');
                    let spanCnt = 0;
                    $.each(groups, function(idx,Item) {
                        if(spanCnt == 0) {
                            spanCnt = Item.length;
                        }else {
                            spanCnt = spanCnt * Item.length;
                        }
                        $.each(Item, function(idx2,Item2) {
                            if(idx == 'V') {
                                if(colCoord == 0) {
                                    if(type != 'main') {
                                        $('#vertical_mark_type').val(Item2.MARK_TYPE).prop("selected",true);
                                        $('#vertical_div_num').val(Item.length).prop("selected",true);
                                        // $('#vertical_div_num').trigger('change');
                                    }else {
                                        $("#veritcal_change_btn").text(Item2.MARK_TYPE_NM)
                                    }
                                    colCoord = (Item2.AREA_COORDINATE * colRatio);
                                    colCss += (Item2.AREA_COORDINATE * colRatio) + 'px ';
                                }else {
                                    colCss += ((Item2.AREA_COORDINATE * colRatio) - colCoord)  + 'px ';
                                    colCoord = (Item2.AREA_COORDINATE * colRatio);
                                }
                                if(type == 'main') {
                                    gridDivData.gridDivY.push({'AREA_NAME':Item2.AREA_NAME, 'AREA_COORDINATE' : colCoord});
                                }else {
                                    $(".vertical_name").eq(idx2).val(Item2.AREA_NAME)
                                    $(".vertical_coord").eq(idx2).val(Item2.AREA_COORDINATE)
                                }
                            }else {
                                if(rowCoord == 0) {
                                    if(type != 'main') {
                                        $('#horizontal_mark_type').val(Item2.MARK_TYPE).prop("selected",true);
                                        $('#horizontal_div_num').val(Item.length).prop("selected",true);
                                        // $('#horizontal_div_num').trigger('change');
                                    }else {
                                        $("#horizon_change_btn").text(Item2.MARK_TYPE_NM)
                                    }
                                    rowCoord = (Item2.AREA_COORDINATE * rowRatio);
                                    rowCss += (Item2.AREA_COORDINATE * rowRatio) + 'px ';
                                }else {
                                    rowCss += ((Item2.AREA_COORDINATE * rowRatio) - rowCoord) + 'px ';
                                    rowCoord = (Item2.AREA_COORDINATE * rowRatio);
                                }
                                if(type == 'main') {
                                    gridDivData.gridDivX.push({'AREA_NAME':Item2.AREA_NAME, 'AREA_COORDINATE' : rowCoord});
                                }else {
                                    $(".horizontal_name").eq(idx2).val(Item2.AREA_NAME)
                                    $(".horizontal_coord").eq(idx2).val(Item2.AREA_COORDINATE)
                                }
                            }
                        });
                    });
                    for(var i=0;i<spanCnt;i++) {
                        let className = "item";
                        if(type == 'main') {
                            className = "item2";
                        }
                        $("#"+ targetId).append('<div class="'+ className +'"></div>');
                    }
                    $("#"+targetId).css({
                        'grid-template-rows':colCss,
                        'grid-template-columns':rowCss
                    })
                }

            }
            $("#layer_setting_popup").on({
                'show.bs.modal' :  function() {
                    let parameter = {
                        'queryId': 'inspection.selectLayerInfo',
                        'LAYER_AREA_NAME': 'A'
                    };
                    let parameters = {'url': '/json-list', 'data': parameter};
                    fnPostAjaxAsync(function(data, callFunctionParam){

                        settingLayerGrid(data);
                    }, parameters, '');
                }, 'hide.bs.modal' : function () {

                }
            });

            function settingPopData(barcodeNum) {
                let controlSeq = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
                let controlDetailSeq = $("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val();
                let prodNum = $("#inspection_result_pop_form").find("#PRODUCT_NUM").val();

                let parameter = {
                    'queryId': 'inspection.selectInspectionResultControlInfo',
                    'CONTROL_SEQ' : controlSeq,
                    'CONTROL_DETAIL_SEQ':controlDetailSeq
                };
                if(!fnIsEmpty(barcodeNum) && barcodeNum != 'newInspect') {
                    parameter = {
                        'queryId': 'inspection.selectInspectionResultControlInfoBarcode',
                        'BARCODE_NUM':barcodeNum
                    }
                }else if(!fnIsEmpty(prodNum)) {
                    parameter.PRODUCT_NUM = prodNum;
                }

                let params = {
                    'url': '/json-info',
                    'data':parameter
                }

                fnPostAjaxAsync(function(data, callFunctionParam){
                    // console.log('settingPopData', data);
                    if(data.info != null) {
                        let prodNum = (fnIsEmpty(data.info.PRODUCT_NUM)?"":Number(data.info.PRODUCT_NUM));
                        $("#CONTROL_NUM_DIV").text(data.info.CONTROL_NUM)
                        $("#QTY_DIV").text(data.info.QTY)
                        $("#WORK_TYPE_DIV").text(data.info.WORK_TYPE_NM)

                        $("#inspection_result_pop_form").find("#QTY").val(data.info.QTY);
                        $("#inspection_result_pop_form").find("#SIZE_TXT").val(data.info.SIZE_TXT);
                        $("#inspection_result_pop_form").find("#LAST_PRODUCT_NUM").val(data.info.LAST_PRODUCT_NUM);
                        $("#inspection_result_pop_form").find("#INSPECT_RESULT_CNT").val(data.info.INSPECT_RESULT_CNT);

                        if(!fnIsEmpty(data.info.IMG_GFILE_SEQ)) {
                            let orgImg = $("#img_div").attr("src");
                            if(wzoom != null) {
                                wzoom.destroy();
                            }
                            $("#img_div").attr("src", "/image/"+data.info.IMG_GFILE_SEQ);
                            $("#layer_setting_img").attr("src", "/image/"+data.info.IMG_GFILE_SEQ);
                        }

                        if(!fnIsEmpty(data.info.PRODUCT_NUM)) {
                            $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(prodNum);
                            $("#inspection_result_pop_form").find("#INSPECT_RESULT_SEQ").val(data.info.INSPECT_RESULT_SEQ);

                            if(barcodeNum != 'newInspect') {
                                $("#startInspectBtn").attr('disabled',false);
                                $("#deleteInspectBtn").attr('disabled',false);
                                $("#nextProdNum").attr('disabled',false);
                                $("#prevProdNum").attr('disabled',false);
                                if(Number(data.info.LAST_PRODUCT_NUM) <= prodNum) {
                                    $("#nextProdNum").attr('disabled',true);
                                }
                                if(prodNum == 1) {
                                    $("#prevProdNum").attr('disabled',true);
                                }
                            }
                            settingProdNumDiv('new');

                        }else {
                            settingProdNumDiv('edit');
                            $("#inspection_result_pop_form").find("#PRODUCT_NUM").val(prodNum);
                            $("#startInspectBtn").attr('disabled',true);
                            $("#deleteInspectBtn").attr('disabled',true);
                            $("#nextProdNum").attr('disabled',true);
                            $("#prevProdNum").attr('disabled',true);
                        }


                        if(!fnIsEmpty(data.info.LAYER_AREA_NAME)) {
                            $("#inspection_result_pop_form").find("#LAYER_AREA_NAM1E").val(data.info.LAYER_AREA_NAME);
                            $("button[data-target='"+data.info.LAYER_AREA_NAME +"']").trigger('click');
                        }else {
                            resetLayer();
                        }


                        inspectionResultPopGrid.pqGrid("option", "dataModel.postData", function(ui){
                            return fnFormToJsonArrayData('inspection_result_pop_form');
                        } );
                        inspectionResultPopGrid.pqGrid("refreshDataAndView");

                        $(".spanPosition").remove();
                    }

                },params,'');
            }

            let inspectPointData = null;
            let inspectPointGrid = $("#inspect_point_grid");
            let inspectPointColModel = [
                {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
                {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
                {title: 'LATEST_PRODUCT_NUM', dataType: 'integer', dataIndx: 'LATEST_PRODUCT_NUM', hidden: true},
                {title: 'IMG_GFILE_SEQ', dataType: 'integer', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
                {title: '작업지시번호', minWidth: 180, dataIndx: 'CONTROL_NUM'},
                {title: '규격', minWidth: 130, dataIndx: 'SIZE_TXT'},
                {title: '재질', minWidth: 80, dataIndx: 'MATERIAL_TYPE_NM'},
                {title: 'Point<br>개수', minWidth: 60, dataIndx: 'POINT_CNT'},
                {title: '검사 성적서', align: 'center', colModel: [
                        {title: '업데이트 일시', datatype: 'string', dataIndx: 'LATEST_UPDATE_DT', minWidth: 130, width: 130, editable: false},
                        {title: 'Qty.', datatype: 'string', dataIndx: 'INSPECT_RESULT_CNT', minWidth: 50, width: 50, editable: false},
                        {title: 'Area', datatype: 'string', dataIndx: 'LAYER_AREA_NAME', minWidth: 50, width: 50, editable: false},
                    ]
                }
            ];
            let inspectPointObj = {
                height: '100%',
                width: "auto",
                selectionModel: { type: 'row', mode: 'single'},
                rowHtHead: 25,
                numberCell: {width: 40, title: "No", align: 'center', show: true },
                swipeModel: {on: false},
                trackModel: {on: true},
                scrollModel: {autoFit: true},
                strNoRows: g_noData,
                showTitle: false,
                editable: false,
                collapsible: false,
                postRenderInterval: -1, //call postRender synchronously.
                columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
                colModel: inspectPointColModel,
                dataModel: {
                    location: "remote", dataType: "json", method: "POST",
                    url: "/paramQueryGridSelect",
                    postData: fnFormToJsonArrayData('inspect_point_pop_form'),
                    // postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 20}, recIndx: 'ROWNUM',
                    getData: function (dataJSON) {
                        return {data: dataJSON.data};
                    }
                },
                complete: function () {
                    const data = this.option('dataModel.data');
                    if(data.length > 0) {
                        this.setSelection({rowIndx:0});
                    }
                },
                rowSelect: function (evt, ui) {
                    const rowData = ui.addList[0].rowData;
                    if(!fnIsEmpty(rowData.IMG_GFILE_SEQ)) {
                        $("#inspect_point_img").attr('src', '/image/' + rowData.IMG_GFILE_SEQ);
                    }
                    if(rowData.POINT_CNT > 0) {
                        settingCoordPop(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, rowData.LATEST_PRODUCT_NUM)
                    }else {
                        inspectPointData = null;
                    }
                },
                toolbar: false
            };
            inspectPointGrid.pqGrid(inspectPointObj);

            function settingCoordPop(controlSeq, controlDetailSeq, latestProductNum) {
                let parameter = {
                    'queryId': 'inspection.selectInspectionResult',
                    'CONTROL_SEQ': controlSeq,
                    'CONTROL_DETAIL_SEQ':controlDetailSeq,
                    'PRODUCT_NUM':latestProductNum
                };
                let parameters = {'url': '/json-list', 'data': parameter};
                fnPostAjaxAsync(function(data, callFunctionParam){
                    // console.log(data);
                    inspectPointData = data.list;
                    $(".spanPositionPop").remove();
                    $.each(data.list, function (idx,Item) {
                        let id = "code_" + Item.RESULT_NUM;
                        let widthRatio =  $("#inspect_point_img").width() / $("#img_div").width();
                        let heightRatio = $("#inspect_point_img").height() / $("#img_div").height();


                        var rect = document.getElementById('inspect_point_img').getBoundingClientRect();

                        let x = Math.floor(Item.COORDINATE_X * widthRatio) + document.getElementById('div_point_pop').offsetLeft;
                        let y = Math.floor(Item.COORDINATE_Y * heightRatio) + document.getElementById('div_point_pop').offsetTop;

                        let html = '<span id="'+id+ '" class="spanPositionPop" style="top:'+y+'px;left: '+x+'px;" data-target="'+Item.RESULT_NUM+'">'+ Item.RESULT_NUM +'</span>';
                        $("#inspect_point_img").after(html);
                    })
                }, parameters, '');
            }

            $("#inspectResult_list_popup").on({
                'show.bs.modal' :  function() {
                    $("#inspect_point_pop_form").find("#SIZE_TXT").val($("#inspection_result_pop_form").find("#SIZE_TXT").val());

                    inspectPointGrid.pqGrid("option", "dataModel.postData", function(ui){
                        return fnFormToJsonArrayData('inspect_point_pop_form');
                    } );
                    inspectPointGrid.pqGrid("refreshDataAndView");
                }, 'hide.bs.modal' : function () {

                }
            })

            $("#inspect_point_refresh").on("click", function () {
                inspectPointGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('inspect_point_pop_form');
                } );
                inspectPointGrid.pqGrid("refreshDataAndView");
            })

            function settingNewPointData() {

                loadCoordinate(inspectPointData);

                let deleteIdx = [];
                let totalLength = inspectionResultPopGrid.pqGrid('option', 'dataModel.data').length;
                for(let i=0;i<totalLength;i++) {
                    let rowData = inspectionResultPopGrid.pqGrid('getRowData', {rowIndx: i});
                    deleteIdx.push({rowIndx:rowData.pq_ri});
                }
                inspectionResultPopGrid.pqGrid('deleteRow', {rowList: deleteIdx});

                let newDataList = [];
                $.each(inspectPointData, function (idx,Item) {
                    newDataList.push({
                        newRow: {
                            'CONTROL_SEQ':$("#inspection_result_pop_form").find("#CONTROL_SEQ").val(),
                            'CONTROL_DETAIL_SEQ':$("#inspection_result_pop_form").find("#CONTROL_DETAIL_SEQ").val(),
                            'RESULT_NUM':Item.RESULT_NUM,
                            'EYE_VIEW':1,
                            'RESULT_POSITION':'',
                            'DELETE_BTN':1,
                            'COORDINATE_X':Item.COORDINATE_X,
                            'COORDINATE_Y':Item.COORDINATE_Y,
                            'RESULT_VALUE':Item.RESULT_VALUE
                        },
                        rowIndx :idx,
                        checkEditable: false
                    })
                })
                inspectionResultPopGrid.pqGrid('addRow', {rowList: newDataList});

            }

            $("#applyPointBtn").on("click", function () {
                // console.log(inspectPointData);

                if(inspectionResultPopGrid.pqGrid('option', 'editable')) {
                    settingNewPointData();
                    $("#inspectResult_list_popup").modal("hide");
                }else {
                    fnAlert(null,"point 불러오기는 성적서 입력중에만 가능합니다.");
                    return;
                }
            })






            let contorlSeq = $("#inspection_result_pop_form").find("#CONTROL_SEQ").val();
            if(!fnIsEmpty(contorlSeq)) {
                settingPopData()
            }

            $(window).on('resize', _.debounce(function() {
                inspectionResultPopGrid.pqGrid('refreshView');
            }, 200));
        });

        $(document).ready(function(){
            let inspectionResultPopGrid = $("#inspection_result_pop_grid");

            $(document).on("click","#header_delete",function(e){
                let deleteList = [];
                if(inspectionResultPopGrid.pqGrid('option', 'editable')) {
                    let totalLength = inspectionResultPopGrid.pqGrid('option', 'dataModel.data').length;
                    for(let i=0;i<totalLength;i++) {
                        let rowData = inspectionResultPopGrid.pqGrid('getRowData', {rowIndx: i});
                        deleteList.push({rowIndx:rowData.pq_ri});
                    }
                    inspectionResultPopGrid.pqGrid('deleteRow', {rowList: deleteList});

                    $(".spanPosition").remove();
                }
            });
            $(document).on("click","#header_reset",function(e){
                let updateList = [];
                if(inspectionResultPopGrid.pqGrid('option', 'editable')) {
                    let totalLength = inspectionResultPopGrid.pqGrid('option', 'dataModel.data').length;
                    for(let i=0;i<totalLength;i++) {
                        let rowData = inspectionResultPopGrid.pqGrid('getRowData', {rowIndx: i});
                        updateList.push({rowIndx:rowData.pq_ri, newRow:{'RESULT_VALUE':''}, checkEditable: false});
                    }
                    inspectionResultPopGrid.pqGrid('updateRow', {rowList: updateList});
                }
            });
        });
    </script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
