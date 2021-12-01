<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J-MES MCT 가공현황</title>
	<!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
	<link rel="shortcut icon" href="/favicon.ico">
	<!-- Chrome, Safari, IE -->
	<link rel="icon" href="/favicon.ico">
	<link rel="stylesheet" href="/resource/pop/css/index2.css">
	<link rel="stylesheet" href="/resource/mct/css/mct.css">
	<link rel="stylesheet" href="/resource/pop/XEIcon/xeicon.min.css">
	<link rel="stylesheet" href="/resource/plugins/jquery-ui-1.11.4/themes/smoothness/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/reset.css" />
	<!-- alertify -->
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/resource/asset/js/front.js"></script>
	<script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resource/plugins/bluebird.min.js"></script>
	<!-- alertify -->
	<script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>
	<script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>

	<script type="text/javascript" src="/resource/plugins/paramquery/pqgrid.min.js" ></script>
	<script type="text/javascript" src="/resource/plugins/paramquery/localize/pq-localize-en.js"></script>
	<script type="text/javascript" src="/resource/plugins/paramquery/jsZip-2.5.0/jszip.min.js" ></script>
	<script type="text/javascript" src="/resource/plugins/paramquery/resize/jquery.resize.js" ></script
	<script type="text/javascript" src="/resource/plugins/paramquery/pqTouch/pqtouch.min.js" ></script>
	<script type="text/javascript" src="/resource/plugins/paramquery/pqSelect/pqselect.min.js" ></script>

	<!-- socket -->
	<script type="text/javascript" src='/resource/plugins/socket/sockjs.min.js'></script>
	<script type="text/javascript" src='/resource/plugins/stomp/stomp.min.js'></script>
	<style>
		*{margin: 0; padding: 0; box-sizing: border-box;}
		a{text-decoration: none; color: black;}
		ul,dl,ol { list-style: none;}
		div.pq-grid * {font-size: 1.4rem;}
		#mct_machine_grid .pq-grid-header-table>.pq-grid-row>.pq-grid-number-cell {background: #d8edf0;}
		body {
			font-family: 'notoM' !important;
			color: black;
			font-size: inherit;
		}

		.ui-widget {
			font-family: 'notoM';
			font-size: 1.1em
		}
		.g_item_detail_pop .layerPopup {
			width: 75%;
			height: 85%;
		}
	</style>
</head>
<body>
	<section id="containerWrap" class="containerWrap">
		<!--왼쪽 구역 시작-->
		<div id="leftContainer" class="leftContainer">
			<h1 id="mctTitle" class="mctTitle"><i class="xi-bookmark"></i>MCT 가공 현황</h1>

			<!--DMT화면용-->
			<div id="contents03" class="contents03">
				<div id="smallMct contentsWrap" class="smallMct contentsWrap">
					<div id="titleTag" class="titleTag">DMT</div>
					<div id="infoWrap" class="infoWrap">
						<div id="ARE06_1"class="rowWrap">
						</div>
						<!--row끝-->
						<div id="ARE06_2" class="rowWrap">
						</div>
						<!--row끝-->
						<div id="ARE06_3" class="rowWrap">
						</div>
						<!--row끝-->
						<div id="ARE06_4" class="rowWrap">
						</div>
						<!--row끝-->
					</div>
				</div>
			</div>

			<!--첫번째 줄 시작-->
			<div id="contents01" class="contents01">
				<!--소형MCT-->
				<div id="smallMct contentsWrap" class="smallMct contentsWrap">
					<div id="titleTag" class="titleTag">소형 MCT</div>
					<div id="infoWrap" class="infoWrap">
						<div id="ARE01_1" class="rowWrap">
						</div>
						<!--row 끝-->
						<div id="ARE01_2" class="rowWrap">
						</div>
						<!--row 끝-->

					</div>
				</div>
				<!--소형 MCT 끝-->
			</div>
			<!--첫번쨰 줄 끝-->

			<!--두번째 줄 시작-->
			<div id="contents02" class="contents02">
				<!--대형 MCT시작-->
				<div id="bigMct contentsWrap" class="bigMct contentsWrap">
					<div id="titleTag" class="titleTag">대형 MCT</div>
					<div id="infoWrap" class="infoWrap">
						<!--대형 MCT 첫번째 줄 시작-->
						<div id="ARE02_1" class="rowWrap">
						</div>
						<!--대형 MCT 첫번째 줄 끝-->
						<!--대형 MCT 두번째 줄 시작-->
						<div id="ARE02_2" class="rowWrap">
						</div>
						<!--row 끝-->
					</div>
					<!--대형 MCT두번째 줄 끝-->
				</div>
				<!--대형 MCT끝-->

				<!--정밀 MCT 시작-->
				<div id="detailMct contentsWrap" class="detailMct contentsWrap">
					<div id="titleTag" class="titleTag">정밀 MCT</div>
					<div id="infoWrap" class="infoWrap">
						<div id="ARE11_1" class="rowWrap">
						</div>
						<!--row 끝-->
						<div id="ARE11_2" class="rowWrap">
						</div>
						<!--row 끝-->
					</div>
				</div>
				<!--정밀 MCT 끝-->

				<!--JST 시작-->
				<div id="detailMct contentsWrap" class="detailMct contentsWrap">
					<div id="titleTag" class="titleTag">JST</div>
					<div id="infoWrap" class="infoWrap">
						<div id="ARE05_1" class="rowWrap">
						</div>
						<!--row 끝-->
						<div id="ARE05_2"  class="rowWrap">
						</div>
						<!--row 끝-->
					</div>
				</div>
				<!--JST 끝-->

			</div>
			<!--두번째 줄 끝-->
		</div>
		<!--왼쪽 구역 끝-->
		<!--오른쪽 구역 시작-->
		<div id="rightContainer" class="rightContainer">
			<div class="rightBtnWrap">
				<select id="changeScreen">
					<option value="JINSUNG">진성정밀</option>
					<option value="DMT">DMT</option>
				</select>
				<div id="changeBtn" class="changeBtn">
					<a href="/tv/pop">화면전환</a>
				</div>
			</div>
			<div class="rightSectionWrap">
				<div class="rightSection">
					<!--오른쪽 상단 테이블 시작-->
					<table class="rightSectionTop">
						<tr>
							<th colspan="3">가동률 : <span id="NOW_RATE" class="tdColor1"></span></th>
						</tr>
						<tr>
							<td>가동</td>
							<td>정지</td>
							<td>미가동</td>
						</tr>
						<tr>
							<td id="RUN" class="tdColor1">0대</td>
							<td id="STOP" class="tdColor2">0대</td>
							<td id="NOT_RUN">0대</td>
						</tr>
					</table>
					<!--오른쪽 상단 테이블 끝-->
					<!--오른쪽 중단 테이블 시작-->
					<table class="rightSectionMid">
						<tr>
							<th class="tdColor2">불량/반품</th>
							<th class="tdColor2">긴급</th>
							<th>가공지연</th>
						</tr>
						<tr>
							<td id="totalReturn" class="tdColor2"></td>
							<td id="totalEmergency" class="tdColor2"></td>
							<td id="totalLate"></td>
						</tr>
					</table>
					<!--오른쪽 중단 테이블 끝-->
					<!--오른쪽 하단 그리드 시작-->
					<div id="mct_main_grid" class="rightSectionBtm">

					</div>
					<!--오른쪽 하단 그리드 끝-->
				</div>
			</div>
		</div>
		<!--오른쪽 구역 끝-->
	</section>

	<form class="form-inline" id="mct_machine_form" name="mct_machine_form" role="form" onsubmit="return false;">
		<input type="hidden" id="queryId" name="queryId" value="machine.selectPlanListForDetailPop">
		<input type="hidden" id="EQUIP_SEQ" name="EQUIP_SEQ" value="">
		<input type="hidden" id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" value="">
		<input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
	</form>
	<!--팝업 시작-->
	<div id="popupWrap" class="popupWrap popupBackground" style="display: none;">
		<!--팝업위치기준-->
		<div id="popupContainer" class="popupContainer">
			<!--팝업내용-->
			<div id="popup" class="popup">
				<h3><i class="xi-library-bookmark"></i>장비 상세화면</h3>
				<div id="tableTop" class="tableTop">
					<h4>가공진행현황</h4>
					<table id="popHeadTopTable" class="popHeadTopTable">
						<tr>
							<td>장비번호 : </td>
							<td>장비종류 : </td>
							<td>설치위치 : </td>
							<td>관리장(정) : </td>
							<td>관리자(부) : </td>
						</tr>
					</table>
				</div>

				<!--상단 메인 테이블-->
				<table id="popHeadMid" class="popHeadMid popTable">
					<colgroup>
						<col width="4%">
						<col width="4%">
						<col width="12.5%">
						<col width="12.5%">
						<col width="9.5%">
						<col width="6%">
						<col width="6%">
						<col width="6%">
						<col width="6%">
						<col width="8.5%">
						<col width="8.5%">
						<col width="8.5%">
					</colgroup>
					<tbody>
						<tr>
							<td id="workStaff" class="th_color">작업자</td>
							<td id="workStatu" class="th_color">작업상세</td>
							<td id="workNum" class="th_color">작업번호</td>
							<td id="mapNum" class="th_color">도면번호</td>
							<td id="productSize" class="th_color">규격</td>
							<td id="workType" class="th_color">작업형태</td>
							<td id="material" class="th_color">소재종류</td>
							<td id="orderNum" class="th_color">수량</td>
							<td id="processDelivery" class="th_color">가공납기</td>
							<td id="timeStop" class="th_color">정지시간</td>
							<td id="timeRunning" class="th_color">진행시간</td>
							<td id="timeExpect" class="th_color">예상시간(E/T)</td>
						</tr>

						<tr id="machine_popup_tbody">
							<td id="workStaffImg" class="workStaffImg ">
								<div id="staffImgWrap" class="staffImgWrap">
									<img src="resource/pop/images/staff.jpg" alt="작업자사진">
								</div>
							</td>
							<td id="running" class="running"></td>
							<td id="numberWorking" class="numberWorking"></td>
							<td id="mapNumInfo" class="mapNumInfo">
								<div class="tableScroll">
								</div>
							</td>
							<td id="sizeInfo" class="sizeInfo"></td>
							<td id="workTypeInfo" class="workTypeInfo"></td>
							<td id="materialInfo" class="materialInfo"></td>
							<td id="productAmount" class="productAmount">
							</td>
							<td id="deliveryDate" class="deliveryDate"></td>
							<td id="runningStop" class="runningStop"></td>
							<td id="runningTime" class="runningTime"></td>
							<td id="expectTime" class="expectTime"></td>
						</tr>
					</tbody>
				</table>
				<!--상단 메인 테이블 끝-->
				<!--팝업 하단-->
				<div id="popBtm" class="popBtm">
					<!--왼쪽-->
					<div id="popBtmLeft" class="popBtmLeft">
						<div class="mapImgWrap">
							<img id="mapImgWrap" src="resource/pop/images/map.jpg" alt="도면">
						</div>
					</div>
					<!--왼쪽-->
					<!--오른쪽-->
					<div id="popBtmRight" class="popBtmRight">
						<div id="tableTop" class="tableTop">
							<h4>가공계획 List</h4>
							<table id="popHeadTopTable" class="popHeadTopTable">
								<tr id="popBtmGridHead">
									<td>대기현황</td>
									<td></td>
									<td>예상시간 합계 :</td>
								</tr>
							</table>
						</div>
						<!--오른쪽 표 시작-->
						<div id="mct_machine_grid" class="popBtmTable">
							<!--표 삽입-->
						</div>
						<!--오른쪽 표 끝-->
					</div>
					<!--오른쪽 끝-->
				</div>
				<!--팝업 하단 끝-->
				<!--버튼-->
				<button id="machineMctDetailBtn" class="popMapDetailBtn">도면상세보기</button>
				<button id="detailCloseBtn" class="detailCloseBtn">닫기</button>
				<!--버튼 끝-->
			</div>
			<!--팝업내용끝-->
		</div>
		<!--팝업위치기준-->
	</div>
	<!--팝업 끝-->

	<!-- 주문상세정보 layer popup : S -->
	<div class="popup_container g_item_detail_pop" id="g_item_detail_pop" style="display: none;">
		<div class="layerPopup">
			<h3>작업상세정보</h3>
			<span class="right_float" style="margin-right: 100px;">
            <span class="barCodeTxt" style="margin-right: 5px;opacity: 0;">&nbsp;<input type="text" class="wd_270_barcode hg_30" name="g_item_detail_pop_barcode_num" id="g_item_detail_pop_barcode_num" placeholder="도면의 바코드를 스캔해 주세요"></span>
            <span class="barCode" id="g_item_detail_pop_barcode_span"><img src="/resource/asset/images/common/img_barcode_long.png" alt="바코드" id="g_item_detail_pop_barcode_img"></span>
        </span>
			<button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close" style="float: right;right: 12px;position: absolute;">닫기</button>
			<%--        <button type="button" class="pop_close mt-10 mr-8" id="popClose2">닫기</button>--%>
			<div class="h_area"></div>
			<div class="qualityWrap" style="display: flex;">
				<div style="width: 51%;">
					<form class="form-inline" id="g_item_detail_pop_form" name="g_item_detail_pop_form" role="form" onsubmit="return false;" onkeypress="return event.keyCode != 13;">
						<input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInfo"/>
						<input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
						<input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
						<input type="hidden" id="ASSEMBLY_CONTROL_DETAIL_SEQ" name="ASSEMBLY_CONTROL_DETAIL_SEQ"/>
						<input type="hidden" id="FIRST_PART_CONTROL_DETAIL_SEQ" name="FIRST_PART_CONTROL_DETAIL_SEQ"/>
						<input type="hidden" id="PREV_PART_CONTROL_DETAIL_SEQ" name="PREV_PART_CONTROL_DETAIL_SEQ" value=""/>
						<input type="hidden" id="NEXT_PART_CONTROL_DETAIL_SEQ" name="NEXT_PART_CONTROL_DETAIL_SEQ" value=""/>
						<div class="d-flex align-items-center" style="width:100%;height: 6%;">
							<h4>기본정보</h4>
							<div id="view_part_wrap" style="margin-left: 95px;">
								<button class="defaultBtn" name="view_assembly_or_part" id="WTP020" value="WTP020">조립</button>
								<button class="defaultBtn" name="view_assembly_or_part" id="WTP050" value="WTP050">파트</button>
								<span name="view_part" id="view_part_prev" style="cursor: pointer;">
                                <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표">
                            </span>
								<span name="view_part" id="view_part_next" style="cursor: pointer;">
                                <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
                            </span>
							</div>
							<div style="margin-left: auto;">
								<input id="item_detail_pop_input" name="item_detail_pop_input" type="text" placeholder="작업번호를 입력해주세요" value="">
							</div>
						</div>
						<div class="list1">
							<table class="rowStyle" style="table-layout: fixed;">
								<colgroup>
									<col width="13%">
									<col width="20%">
									<col width="10%">
									<col width="20%">
								</colgroup>
								<tr>
									<th>
                                <span name="control_num_arrow" id="left_arrow" data-value="-1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_left_arrow.png" alt="왼쪽 화살표">
                                </span>
										<span>작업지시번호</span>
										<span name="control_num_arrow" id="right_arrow" data-value="1" style="cursor: pointer;">
                                    <img src="/resource/asset/images/common/img_right_arrow.png" alt="오른쪽 화살표">
                                </span>
									</th>
									<td id="CONTROL_NUM" class="red"></td>
									<th class="lightGreen">도면번호</th>
									<td id="DRAWING_NUM" class="red"></td>
								</tr>
								<tr>
									<th>가공납기</th>
									<td id="INNER_DUE_DT"></td>
									<th class="lightGreen">품명</th>
									<td id="ITEM_NM"></td>
								</tr>
								<tr>
									<th>작업형태</th>
									<td id="WORK_TYPE_NM"></td>
									<th class="lightGreen">모듈</th>
									<td id="MODULE_NM" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"></td>
								</tr>
								<tr>
									<th>수량(원,대)</th>
									<td id="ORDER_QTY_INFO"></td>
									<th class="lightGreen">프로젝트</th>
									<td id="PROJECT_NM"></td>
									<%--<th>소재주문상태</th>--%>
									<%--<td id="MATERIAL_ORDER_STATUS_NM"></td>--%>
								</tr>
								<tr>
									<th>규격</th>
									<td id="SIZE_TXT"></td>
									<th class="lightGreen">발주처</th>
									<td id="ORDER_COMP_NM"></td>
									<%--<th>도면수정Rev.</th>--%>
									<%--<td id="DRAWING_VER"></td>--%>
									<%--<th>도면파일</th>--%>
									<%--<td id="DXF_GFILE_SEQ"></td>--%>
								</tr>
								<tr>
									<th>소재</th>
									<td id="MATERIAL_DETAIL_NM"></td>
									<th class="lightGreen">구매담당/설계자</th>
									<td id="ORDER_STAFF_NM_DESIGNER_NM"></td>
								</tr>
								<tr>
									<th>표면처리</th>
									<td id="SURFACE_TREAT_NM"></td>
									<th class="lightGreen">주요검사</th>
									<td id="MAIN_INSPECTION_NM"></td>
								</tr>
								<tr>
									<th>작업확정 일시</th>
									<td id="CONTROL_CONFIRM_DT"></td>
									<th class="palegoldenrod">외주확정 일시</th>
									<td id="OUTSIDE_CONFIRM_DT"></td>
									<%--<th>유사주문수행기록</th>--%>
									<%--<td id="WORK_HISTORY_INFO"></td>--%>
								</tr>
								<tr>
									<th class="redText">가공확정 일시</th>
									<td id="PROCESS_CONFIRM_DT"></td>
									<th class="palegoldenrod">외주업체명</th>
									<td id="OUTSIDE_COMP_NM"></td>
								</tr>
								<tr>
									<th>소재주문 일시</th>
									<td id="MATERIAL_ORDER_DT"></td>
									<th class="palegoldenrod">외주요청 일시</th>
									<td id="OUTSIDE_PROCESS_CONFIRM_DT"></td>
								</tr>
								<tr>
									<th>소재입고 일시</th>
									<td id="MATERIAL_IN_DT"></td>
									<th class="palegoldenrod">외주입고 일시</th>
									<td id="OUTSIDE_IN_DT"></td>
								</tr>
								<tr>
									<th class="blueviolet">가공완료 일시</th>
									<td id="PROCESS_FINISH_DT" class="blueviolet"></td>
									<th>재고번호</th>
									<td id="INSIDE_STOCK"></td>
								</tr>
								<tr>
									<th class="blueviolet">출고완료 일시</th>
									<td id="OUT_FINISH_DT"></td>
									<th>진행상태</th>
									<td id="PART_STATUS_NM"></td>
								</tr>

							</table>
						</div>
						<div class="listdiv">
								<ul class="conWrapPopLeft">
									<h4>주문접수번호</h4>
									<div id="g_item_detail_pop_grid_06" class="jqx-refresh"></div>
								</ul>
								<ul class="conWrapPopRight">
									<h4>위치변동이력</h4>
									<div id="g_item_detail_pop_grid_02" class="jqx-refresh"></div>
								</ul>
						</div>
						<div class="listdiv">
								<ul class="conWrapPopLeft">
									<h4>공유사항</h4>
									<div id="g_item_detail_pop_grid_03" class="jqx-refresh"></div>
								</ul>
								<ul class="conWrapPopRight">
									<h4>품질검사 이력</h4>
									<span class="slt_wrap namePlusSlt rightName">
                                    <label id="search_inspection_detail" class="inspectBtn">검색</label>
                                </span>
									<div id="g_item_detail_pop_grid_05" class="jqx-refresh"></div>
								</ul>
						</div>
					</form>
				</div>
				<div style="width: 50%;margin-left: 2%;">
					<div class="d-flex align-items-center">
						<h4></h4>
						<div class="btnWrap ml-auto mb-10">
<%--							<button id="ITEM_CAD_DOWNLOAD" class="d-none defaultBtn">캐드파일</button>--%>
							<button id="ITEM_DRAWING_VIEW" class="defaultBtn" style="background-color: #ecf6de;">도면상세보기</button>
							<button id="ITEM_WORK_HISTORY_INFO" class="defaultBtn">가공상세수행 기록</button>
						</div>
					</div>
					<div class="detailPopImgDiv">
						<img id="item_detail_pop_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
					</div>
					<div class="listdiv">
							<ul class="conWrapPop60" style="width: 100%;">
								<h4>가공이력</h4>
								<span class="slt_wrap namePlusSlt rightName">
                                <label for="g_item_detail_pop_grid_01_info_1">총시간</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_1" class="detailPop_info_input" style="text-align: right; padding: 0 5px;" title="총시간">
                                <label for="g_item_detail_pop_grid_01_info_2">선반</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_2" class="detailPop_info_input" style="text-align: right; padding: 0 5px;" title="선반">
                                <label for="g_item_detail_pop_grid_01_info_3">NC</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_3" class="detailPop_info_input" style="text-align: right; padding: 0 5px;" title="NC">
                                <label for="g_item_detail_pop_grid_01_info_4">밀링</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_4" class="detailPop_info_input" style="text-align: right; padding: 0 5px;" title="밀링">
                                <label for="g_item_detail_pop_grid_01_info_5">연마</label>
                                <input type="text" id="g_item_detail_pop_grid_01_info_5" class="detailPop_info_input" style="text-align: right; padding: 0 5px;" title="연마">
                            </span>
								<div id="g_item_detail_pop_grid_01" class="jqx-refresh"></div>
							</ul>
					</div>
					<div class="listdiv">
							<ul class="conWrapPop60" style="width: 100%;">
								<h4>CAM작업이력 <span style="color:#7d1919" id="g_item_detail_pop_grid_04_info1"></span></h4>
								<span class="slt_wrap namePlusSlt rightName">
                                <label id="g_item_detail_pop_grid_04_info2">Update </label>
                            </span>
								<div id="g_item_detail_pop_grid_04" class="jqx-refresh"></div>
							</ul>
					</div>
				</div>
			</div>
			<%--        <div class="btnWrap">--%>
			<%--            &lt;%&ndash;                <button type="button" class="defaultBtn purple work_info_area" id="g_item_cam_work_start_btn" style="display: none;">CAM 작업시작</button>&ndash;%&gt;--%>
			<%--            <button type="button" class="defaultBtn grayPopGra" id="g_item_detail_pop_grid_05_pop_close">닫기</button>--%>
			<%--        </div>--%>
		</div>
	</div>
	<!-- 주문상세정보 layer popup : E -->

	<div class="popup_container" id="cam_work_detail_popup" style="display: none;">
		<div class="layerPopup" style="width: 60%;height: 65%;">
			<h3>유사형태 수행기록</h3>
			<div class="right_float" style="margin-right:50px;">
				<span class="chk_box">
					<input type="checkbox" name="ORDER_COMP_CHECK" id="ORDER_COMP_CHECK" checked>
					<label for="ORDER_COMP_CHECK">발주처 매칭 여부</label>
				</span>
			</div>
			<button type="button" class="pop_close mt-10 mr-8 close_cam_work_detail">닫기</button>
			<hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
			<div class="qualityWrap">
				<div class="h_area"></div>
				<form class="form-inline" id="cam_work_detail_form" name="cam_work_detail_form" role="form">
					<input type="hidden" id="queryId" name="queryId" value="inspection.selectCamWorkDetail"/>
					<input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
					<input type="hidden" id="ORDER_COMP_YN" name="ORDER_COMP_YN" value=""/>
					<input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>

					<input type="hidden" id="ORDER_COMP_CD" name="ORDER_COMP_CD" value=""/>
					<input type="hidden" id="SIZE_TXT" name="SIZE_TXT" value=""/>
					<input type="hidden" id="DRAWING_NUM" name="DRAWING_NUM" value=""/>
					<input type="hidden" id="MATERIAL_TYPE" name="MATERIAL_TYPE" value=""/>
					<input type="hidden" id="CAD_FILE_SIZE" name="CAD_FILE_SIZE" value=""/>
				</form>
				<div id="cam_work_detail_grid"></div>
			</div>
			<div class="btnWrap" style="padding-top: 3%;">
				<button type="button" class="defaultBtn grayPopGra close_cam_work_detail">닫기</button>
			</div>
		</div>
	</div>

	<div class="popup_container" id="inspection_detail_popup" style="display: none;">
		<div class="layerPopup" style="width: 40%;height: 40%;">
			<h3>품질검사이력</h3>
			<hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
			<div class="qualityWrap">
				<form class="form-inline" id="inspection_detail_form" name="inspection_detail_form" role="form">
					<input type="hidden" id="queryId" name="queryId" value="inspection.selectCommItemDetailInspectionList"/>
					<input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
					<input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>
				</form>
				<div id="inspection_detail_grid"></div>
			</div>
			<div class="btnWrap" style="padding-top: 1%;">
				<button type="button" class="defaultBtn grayPopGra close_inspection_detail">닫기</button>
			</div>
		</div>
	</div>


	<form class="form-inline" id="mct_main_form" name="mct_main_form" role="form" onsubmit="return false;">
		<input type="hidden" id="queryId" name="queryId" value="tvMapper.selectMctGridList">
		<input type="hidden" id="EQUIP_SEQ" name="EQUIP_SEQ" value="">
		<input type="hidden" id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" value="">
		<input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
	</form>
<script>
	$("#detailCloseBtn").on("click",function(){
		$("#popupWrap").modal('hide');
	});
	$("#popupWrap").on("click",function(e){
		if($(e.target).hasClass('popupContainer')) {
			$("#popupWrap").modal('hide');
		}
	});
	$("#machineMctDetailBtn").on("click",function(){
		let gFileSeq = $("#mct_machine_form").find("#GFILE_SEQ").val();
		if(gFileSeq != '') {
			callWindowImageViewer(gFileSeq);
		}
	});

	/**
	 * @title {String or DOMElement} The dialog title.
	 * @message {String or DOMElement} The dialog contents.
	 * @onok {Function} Invoked when the user clicks OK button or closes the dialog.
	 *
	 * fnAlert(null,"<h1>안녕하세요</h1>", function () {alert('확인 클릭')});
	 *
	 */
	const fnAlert = function (title, message, onok) {
		alertify.alert().setting({
			'title': title,
			'message': message,
			'onok': onok,
			'movable': false,
			'transitionOff': true
		}).show();
	};
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
	 *	Form reset 처리
	 *	formId : form Id
	 **/
	let fnResetForm = function (formid){
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
	let fnRequestGridData = function (grid, postData) {
		'use strict';
		let parameter = {'url': '/json-list', 'data': postData}

		fnPostAjax(function (data, callFunctionParam) {
			grid.pqGrid('option', 'dataModel.data', data.list);
			grid.pqGrid('refreshView');
		}, parameter, '');
	};
	const fnConfirm = function (title, message) {
		alertify.confirm().setting({
			'title': title,
			'message': message,
			'onok': function(){ location.reload(); },
			'oncancel': null,
			'movable': false,
			'transitionOff': true
		}).show().autoOk(60);
	};
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
	const fnIsEmpty =  function(str){
		return str === undefined || str === null || str === '';
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
			url: '/tv/json-info',
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


	let windowImageViewer;
	let machineListData;
	let machineAreListData;
	var g_noData = 'Not Found Data.';

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


	/** 공통 제품상세 정보 */

	let g_ItemDetailPopGridId01 =  $("#g_item_detail_pop_grid_01");
	let g_ItemDetailPopColModel01 = [
		{title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
		{title: '공정', dataType: 'string', dataIndx: 'PROCESS_TYPE_NM', width: 60},
		{title: '기기명', dataType: 'string', dataIndx: 'EQUIP_NM', width: 95},
		{title: '상태', dataType: 'string', dataIndx: 'WORK_STATUS', width: 60},
		{title: '시작', dataType: 'string', dataIndx: 'WORK_START_DT', minWidth: 75, width: 100},
		{title: '종료', dataType: 'string', dataIndx: 'WORK_FINISH_DT', minWidth: 75, width: 100},
		{title: '소요시간', dataType: 'string', dataIndx: 'WORKING_TIME', width: 95},
		{title: '작업자', dataType: 'string', dataIndx: 'WORK_USER', width: 95},
		{title: '수량', dataType: 'string', dataIndx: 'FINISH_QTY', width: 95},
		{title: '불량', dataType: 'string', dataIndx: 'ERROR_QTY', width: 95}
	];
	//g_ItemDetailPopGridId01.pqGrid({
	let g_ItemDetailPopObj01 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
			url: "/tv/paramQueryGridSelect",
			//postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			postData: {queryId: 'inspection.selectCommItemDetailInfo', 'V_PARAM': ''},
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		editable: false,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel01
	};


	let g_ItemDetailPopGridId02 =  $("#g_item_detail_pop_grid_02");
	let g_ItemDetailPopColModel02 = [
		{title: 'POP_SEQ', dataType: 'string', dataIndx: 'POP_SEQ', hidden:true},
		{title: '상태/위치', dataType: 'string', dataIndx: 'POP_POSITION_NM', width: 150, editable: false},
		{title: '이벤트일시', dataType: 'string', dataIndx: 'POP_DT', minWidth: 95, width: 150, editable: false}
	];
	let g_ItemDetailPopObj02 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'POP_SEQ',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel02
	};

	let g_ItemDetailPopGridId03 =  $("#g_item_detail_pop_grid_03");
	let g_ItemDetailPopColModel03 = [
		{title: '입력구분', dataType: 'string', dataIndx: 'NOTE_TYPE_NM', width: 150, editable: false},
		{title: '비고', dataType: 'string', dataIndx: 'NOTE', minWidth: 95, width: 150, editable: false}
	];
	let g_ItemDetailPopObj03 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'NOTE_TYPE_NM',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel03
	};

	let g_ItemDetailPopGridId04 =  $("#g_item_detail_pop_grid_04");
	let g_ItemDetailPopColModel04 = [
		{title: 'RNUM', dataType: 'string', dataIndx: 'RNUM', hidden:true},
		{title: 'STATUS_INFO', dataType: 'string', dataIndx: 'STATUS_INFO', hidden:true},
		{title: 'UPDATE_TIME_INFO', dataType: 'string', dataIndx: 'UPDATE_TIME_INFO', hidden:true},
		{title: 'Step', dataType: 'string', dataIndx: 'CAM_SEQ', width: 10, editable: false},
		{title: '작업위치', dataType: 'string', dataIndx: 'WORK_DIRECTION', width: 95, editable: false},
		{title: '작업내용', dataType: 'string', dataIndx: 'WORK_DESC', width: 200, editable: false},
		{title: '작업자', dataType: 'string', dataIndx: 'WORK_USER_NM', width: 60, editable: false},
		{title: '파일', datatype: 'string', dataIndx: '', minWidth: 30, width: 60,
			render: function (ui) {
				let rowData = ui.rowData;
				let iconFiles = '';
				if(rowData.CAM_FILE_SEQ) iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="cursor: pointer; margin-left:3px;"></span>&nbsp;&nbsp;';
				if(rowData.NC_FILE_SEQ) iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="cursor: pointer; margin-left:25px;"></span>';
				return iconFiles;
			},
			postRender: function (ui) {
				let grid = this;
				let $cell = grid.getCell(ui);
				let rowData = ui.rowData;
				$cell.find('#downloadCAMFIle').bind('click', function(e) {
					e.preventDefault();
					fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
				});
				$cell.find('#downloadNCFile').bind('click', function(e) {
					e.preventDefault();
					fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
				});
			}
		}
	];
	let g_ItemDetailPopObj04 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'RNUM',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		postRenderInterval: -1,
		strNoRows: g_noData,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel04,
		dataReady: function (event, ui) {
			let data = g_ItemDetailPopGrid04.pqGrid('option', 'dataModel.data');
			// let totalRecords = data.length;
			// let rowDataArray = g_ItemDetailPopGrid04.pqGrid('getRowData', {rowIndx: 0});
			if(data[0]){
				$("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html(data[0].STATUS_INFO);
				$("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("Update : " + data[0].UPDATE_TIME_INFO);
			}else{
				$("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info1").html("");
				$("#g_item_detail_pop_form").find("#g_item_detail_pop_grid_04_info2").html("");
			}
		}
	};

	let g_ItemDetailPopGridId05 =  $("#g_item_detail_pop_grid_05");
	let g_ItemDetailPopColModel05 = [
		{title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
		// {title: '작성자', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 95},
		// {title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', width: 95},
		// {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 90, width: 95},
		{title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 95},
		// {title: '부적합 수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY', width: 95},
		{title: '불량코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95},
		// {title: '상세 및 비고', dataType: 'string', dataIndx: 'Q_INSPECT_DESC', width: 95},
		// {title: '원인', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM', width: 95},
		// {title: '조치', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM', width: 95},
		// {title: '조치방안', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', width: 95},
		{title: '작성일시', dataType: 'string', dataIndx: 'Q_DT', minWidth: 90, width: 95}
	];
	let g_ItemDetailPopObj05 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		editable: false,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel05
	};

	let g_ItemDetailPopGridId06 =  $("#g_item_detail_pop_grid_06");
	let g_ItemDetailPopColModel06 = [
		{title: 'ORDER_SEQ', dataType: 'string', dataIndx: 'ORDER_SEQ', hidden:true},
		{title: '주문접수번호', dataType: 'string', dataIndx: 'REGIST_NUM', width: 180},
		{title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 65},
		{title: '납기', dataType: 'string', dataIndx: 'ORDER_DUE_DT', width: 65}
	];
	let g_ItemDetailPopObj06 = {
		width: "100%", height: "80%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('g_item_detail_pop_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		editable: false,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: true , styleHead: {'vertical-align':'middle'}},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: g_ItemDetailPopColModel06
	};


	let orderDetailGrid;
	let orderDetailRowIndx;
	const g_item_detail_pop_view = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ, grid, rowIndx) {
		orderDetailGrid = grid;
		orderDetailRowIndx = rowIndx;
		const $itemDetailPop = $('#g_item_detail_pop');
		const $itemDetailPopForm = $("#g_item_detail_pop_form");
		(function () {
			let grid;
			let rowDataPrev;
			let rowDataNext;

			if (!(fnIsEmpty(orderDetailGrid) && fnIsEmpty(orderDetailRowIndx))) {
				grid = orderDetailGrid.getInstance().grid;
				rowDataPrev = grid.getRowData({rowIndx: orderDetailRowIndx + -1});
				rowDataNext = grid.getRowData({rowIndx: orderDetailRowIndx + 1});
			}

			rowDataPrev === undefined ? $itemDetailPopForm.find('#left_arrow').css('visibility', 'hidden') : $itemDetailPopForm.find('#left_arrow').css('visibility', 'visible');
			rowDataNext === undefined ? $itemDetailPopForm.find('#right_arrow').css('visibility', 'hidden') : $itemDetailPopForm.find('#right_arrow').css('visibility', 'visible');
		})();



		$itemDetailPopForm.find("#CONTROL_SEQ").val(CONTROL_SEQ);
		$itemDetailPopForm.find("#CONTROL_DETAIL_SEQ").val(CONTROL_DETAIL_SEQ);

		let workZindex = ($("#cam_work_detail_popup").css('display') !== 'none')?Number($("#cam_work_detail_popup").css('z-index')):0;

		if($("#cam_work_detail_popup").css('display') !== 'none') {
			$('#cam_work_detail_popup').css('z-index','1050');
			$('#g_item_detail_pop').css('z-index','1055');
		}else {
			$('#g_item_detail_pop').css('z-index','1050');
		}
		if ($itemDetailPop.css('display') === 'none') {
			$itemDetailPop.modal('show');
		}

		//기본정보
		$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfo');
		let parameters = {
			'url': '/tv/json-info',
			'data': fnFormToJsonArrayData('g_item_detail_pop_form')
		};
		fnPostAjaxAsync(function (data, callFunctionParam) {
			const dataInfo = data.info;
			let dxfFileDownloadYn = '${authUserInfo.DXF_FILE_DOWNLOAD_YN}';
			fnJsonDataToForm('g_item_detail_pop_form', dataInfo);

			$("#ITEM_CAD_DOWNLOAD").addClass('d-none');
			$("#ITEM_CAD_DOWNLOAD").removeAttr('onClick');
			$("#ITEM_DRAWING_VIEW").removeAttr('onClick');
			$("#ITEM_WORK_HISTORY_INFO").removeAttr('onClick');
			$itemDetailPopForm.find(".list1").find(".rowStyle").find("td").html('');
			$itemDetailPopForm.find("[name=view_assembly_or_part]").siblings().removeClass('bg-moccasin');

			if (dataInfo) {
				if (dataInfo.WORK_TYPE === 'WTP020' || dataInfo.WORK_TYPE === 'WTP050') {
					$itemDetailPopForm.find("#" + dataInfo.WORK_TYPE).addClass('bg-moccasin');
				}
				dataInfo.ASSEMBLY_YN === 'Y' ? $('#view_part_wrap').show() : $('#view_part_wrap').hide();
				fnIsEmpty(dataInfo.PREV_PART_CONTROL_DETAIL_SEQ) ? $itemDetailPopForm.find('#view_part_prev').css('visibility', 'hidden') : $itemDetailPopForm.find('#view_part_prev').css('visibility', 'visible');
				fnIsEmpty(dataInfo.NEXT_PART_CONTROL_DETAIL_SEQ) ? $itemDetailPopForm.find('#view_part_next').css('visibility', 'hidden') : $itemDetailPopForm.find('#view_part_next').css('visibility', 'visible');
				const emergencySpanElement = dataInfo.EMERGENCY_YN === 'Y' ? '<span class="mark">긴급</span>' : '';
				const materialFinishHeatSpanElement = dataInfo.MATERIAL_FINISH_HEAT === '열처리' ? '<span class="mark">열처리</span>' : '';
				const controlStatusHoldSpanElement = dataInfo.CONTROL_STATUS === 'ORD005' ? '<span class="mark" style="background-color: #ff0000; color: #ffffff">보류</span>' : '';

				$("#item_detail_pop_img").attr("src", '/qimage/' + dataInfo.IMG_GFILE_SEQ);
				$itemDetailPopForm.find("#CONTROL_NUM").html(dataInfo.CONTROL_NUM);
				$itemDetailPopForm.find("#ORDER_QTY_INFO").html(dataInfo.ORDER_QTY_INFO);
				$itemDetailPopForm.find("#SIZE_TXT").html(dataInfo.SIZE_TXT);
				$itemDetailPopForm.find("#WORK_TYPE_NM").html(dataInfo.WORK_TYPE_NM);
				$itemDetailPopForm.find("#ORDER_COMP_NM").html(dataInfo.ORDER_COMP_NM);
				$itemDetailPopForm.find("#INNER_DUE_DT").html(dataInfo.INNER_DUE_DT + emergencySpanElement);

				$itemDetailPopForm.find("#DRAWING_NUM").attr('title', dataInfo.DRAWING_NUM);
				$itemDetailPopForm.find("#DRAWING_NUM").html(dataInfo.DRAWING_NUM);
				$itemDetailPopForm.find("#INSIDE_STOCK").html(dataInfo.STOCK_TXT);
				$itemDetailPopForm.find("#PART_STATUS_NM").html(dataInfo.PART_STATUS_NM);

				$itemDetailPopForm.find("#ITEM_NM").attr('title', dataInfo.ITEM_NM);
				$itemDetailPopForm.find("#ITEM_NM").html(dataInfo.ITEM_NM);
				$itemDetailPopForm.find("#MATERIAL_DETAIL_NM").html((dataInfo.MATERIAL_DETAIL_NM || '' + materialFinishHeatSpanElement)  + ((dataInfo.MATERIAL_DETAIL_NM == null && materialFinishHeatSpanElement == '')? '':''));
				$itemDetailPopForm.find("#POP_POSITION_NM").html(dataInfo.POP_POSITION_NM);

				$itemDetailPopForm.find("#MODULE_NM").attr('title', dataInfo.MODULE_NM);
				$itemDetailPopForm.find("#MODULE_NM").html(dataInfo.MODULE_NM);
				$itemDetailPopForm.find("#SURFACE_TREAT_NM").html(dataInfo.SURFACE_TREAT_NM);
				$itemDetailPopForm.find("#PROCESS_CONFIRM_DT").html(dataInfo.PROCESS_CONFIRM_DT);

				$itemDetailPopForm.find("#PROJECT_NM").attr('title', dataInfo.PROJECT_NM);
				$itemDetailPopForm.find("#PROJECT_NM").html(dataInfo.PROJECT_NM);

				$itemDetailPopForm.find("#OUTSIDE_CONFIRM_DT").html(dataInfo.OUTSIDE_CONFIRM_DT);
				$itemDetailPopForm.find("#MATERIAL_ORDER_DT").html(dataInfo.MATERIAL_ORDER_DT);

				$itemDetailPopForm.find("#ORDER_STAFF_NM_DESIGNER_NM").html(dataInfo.ORDER_STAFF_NM_DESIGNER_NM);
				$itemDetailPopForm.find("#OUTSIDE_COMP_NM").html(dataInfo.OUTSIDE_COMP_NM);
				$itemDetailPopForm.find("#MATERIAL_IN_DT").html(dataInfo.MATERIAL_IN_DT);

				$itemDetailPopForm.find("#CONTROL_CONFIRM_DT").html(dataInfo.CONTROL_CONFIRM_DT);
				if (!fnIsEmpty(controlStatusHoldSpanElement)) {
					$itemDetailPopForm.find("#CONTROL_CONFIRM_DT").append(controlStatusHoldSpanElement);
				}
				$itemDetailPopForm.find("#OUTSIDE_PROCESS_CONFIRM_DT").html(dataInfo.OUTSIDE_PROCESS_CONFIRM_DT);
				$itemDetailPopForm.find("#PROCESS_FINISH_DT").html(dataInfo.PROCESS_FINISH_DT);

				$itemDetailPopForm.find("#MAIN_INSPECTION_NM").html(dataInfo.MAIN_INSPECTION_NM);
				$itemDetailPopForm.find("#OUTSIDE_IN_DT").html(dataInfo.OUTSIDE_IN_DT);
				$itemDetailPopForm.find("#OUT_FINISH_DT").html(dataInfo.OUT_FINISH_DT);

				if (dxfFileDownloadYn === 'Y') {
					if (fnIsEmpty(dataInfo.DXF_GFILE_SEQ)) {
						$("#ITEM_CAD_DOWNLOAD").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
						$("#ITEM_CAD_DOWNLOAD").removeClass('d-none');
					} else {
						let str = dataInfo.DRAWING_NUM;
						let arr = str.split(',');

						if (arr.length === 1) {
							$("#ITEM_CAD_DOWNLOAD").attr('onClick', 'fnFileDownloadFormPageAction(' + dataInfo.DXF_GFILE_SEQ + ');');
						} else if (arr.length > 1) {
							$('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(dataInfo.IMG_GFILE_SEQ);
							$("#ITEM_CAD_DOWNLOAD").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
						}

						$("#ITEM_CAD_DOWNLOAD").removeClass('d-none');
					}
				}

				if (fnIsEmpty(dataInfo.IMG_GFILE_SEQ)) {
					$("#ITEM_DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
				} else {
					if(dataInfo.REGIST_CNT >= 2) {
						$('#common_multi_download_pop_form').find('#MAIN_IMG_SEQ').val(dataInfo.IMG_GFILE_SEQ);
						$("#ITEM_DRAWING_VIEW").attr('onClick', 'commonMultiDownloadPop(' + dataInfo.CONTROL_SEQ + ',' + dataInfo.CONTROL_DETAIL_SEQ + ');');
					}else {
						$("#ITEM_DRAWING_VIEW").attr('onClick', 'callWindowImageViewer(' + dataInfo.IMG_GFILE_SEQ + ');');
					}
				}

				if (fnIsEmpty(dataInfo.WORK_HISTORY_INFO)) {
					$("#ITEM_WORK_HISTORY_INFO").attr('disabled', true);
					$("#ITEM_WORK_HISTORY_INFO").removeClass('bg-lightyellow');
					$("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사X)");
				} else {
					$("#ITEM_WORK_HISTORY_INFO").attr('disabled', false);
					$("#ITEM_WORK_HISTORY_INFO").addClass('bg-lightyellow');
					$("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사O)");
					$("#ITEM_WORK_HISTORY_INFO").attr('onClick', "g_item_detail_pop_cam_pop('" + dataInfo.CONTROL_SEQ + "','" + dataInfo.CONTROL_DETAIL_SEQ + "');");
				}

				/** CAM 작업 여부에 따른 버튼 표시 **/
				// if(dataInfo.CAM_STATUS == "CWS010" || dataInfo.CAM_STATUS == "CWS030"){ <!-- 대기 중일때 처리 -->
				//     $('.work_info_area').show();
				// }else{
				//     $('.work_info_area').hide();
				// }
			}else {
				$("#item_detail_pop_img").attr("src", "/resource/main/blank.jpg");
				$("#ITEM_WORK_HISTORY_INFO").attr('disabled', true);
				$("#ITEM_WORK_HISTORY_INFO").removeClass('bg-lightyellow');
				$("#ITEM_WORK_HISTORY_INFO").text("가공상세수행 기록 (유사X)");
				$("#ITEM_DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
			}
		}, parameters, '');

		//가공이력 정보
		$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfo2');
		let parameters2 = {
			'url': '/tv/json-info',
			'data': fnFormToJsonArrayData('g_item_detail_pop_form')
		};
		fnPostAjaxAsync(function (data, callFunctionParam) {
			let dataInfo = data.info;

			if (dataInfo == null) {
				$("#g_item_detail_pop_grid_01_info_1").val('');
				$("#g_item_detail_pop_grid_01_info_2").val('');
				$("#g_item_detail_pop_grid_01_info_3").val('');
				$("#g_item_detail_pop_grid_01_info_4").val('');
				$("#g_item_detail_pop_grid_01_info_5").val('');
			} else {
				//fnJsonDataToForm("stock_manage_pop_form", dataInfo);
				$("#g_item_detail_pop_grid_01_info_1").val(dataInfo.WORK_TIME_TOTAL);
				$("#g_item_detail_pop_grid_01_info_2").val(dataInfo.WORK_TIME_MPR040);
				$("#g_item_detail_pop_grid_01_info_3").val(dataInfo.WORK_TIME_MPR010);
				$("#g_item_detail_pop_grid_01_info_4").val(dataInfo.WORK_TIME_MPR020);
				$("#g_item_detail_pop_grid_01_info_5").val(dataInfo.WORK_TIME_MPR030);
			}
		}, parameters2, '');

		if ($("#g_item_detail_pop_grid_01").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
			g_ItemDetailPopGridId01.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId01.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid1');
			g_ItemDetailPopObj01.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGridId01.pqGrid(g_ItemDetailPopObj01);
		}

		if ($("#g_item_detail_pop_grid_02").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid2');
			g_ItemDetailPopGridId02.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId02.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid2');
			g_ItemDetailPopObj02.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGridId02.pqGrid(g_ItemDetailPopObj02);
		}

		if ($("#g_item_detail_pop_grid_03").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid3');
			g_ItemDetailPopGridId03.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId03.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid3');
			g_ItemDetailPopObj03.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGridId03.pqGrid(g_ItemDetailPopObj03);
		}


		if ($("#g_item_detail_pop_grid_04").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid4');
			g_ItemDetailPopGridId04.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId04.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid4');
			g_ItemDetailPopObj04.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGrid04 = g_ItemDetailPopGridId04.pqGrid(g_ItemDetailPopObj04);
		}


		if ($("#g_item_detail_pop_grid_05").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid5');
			g_ItemDetailPopGridId05.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId05.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid5');
			g_ItemDetailPopObj05.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGridId05.pqGrid(g_ItemDetailPopObj05);
		}

		if ($("#g_item_detail_pop_grid_06").hasClass('pq-grid')) {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid6');
			g_ItemDetailPopGridId06.pqGrid('option', 'dataModel.postData', function (ui) {
				return (fnFormToJsonArrayData('#g_item_detail_pop_form'));
			});
			g_ItemDetailPopGridId06.pqGrid('refreshDataAndView');
		} else {
			$itemDetailPopForm.find("#queryId").val('inspection.selectCommItemDetailInfoGrid6');
			g_ItemDetailPopObj06.dataModel.postData = fnFormToJsonArrayData('g_item_detail_pop_form');
			g_ItemDetailPopGridId06.pqGrid(g_ItemDetailPopObj06);
		}
		$itemDetailPop.find("#g_item_detail_pop_barcode_num").focus();
	};

	let camWorkDetailPopup;

	const g_item_detail_pop_cam_pop = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ) {
		$('#ORDER_COMP_CHECK').prop("checked", true);
		$('#cam_work_detail_form').find('#queryId').val('inspection.selectCommItemDetailGridCamPopBefore');
		$('#cam_work_detail_form').find('#CONTROL_SEQ').val(CONTROL_SEQ);
		$('#cam_work_detail_form').find('#CONTROL_DETAIL_SEQ').val(CONTROL_DETAIL_SEQ);


		let parameters = {
			'url': '/tv/json-info',
			'data': fnFormToJsonArrayData('cam_work_detail_form')
		};

		fnPostAjaxAsync(function (data) {
			let dataInfo = data.info;
			if (fnIsEmpty(dataInfo)) {
				fnResetForm('cam_work_detail_form');
			} else {
				fnJsonDataToForm('cam_work_detail_form', dataInfo);
			}

			if($("#g_item_detail_pop").css('display') !== 'none') {
				$('#g_item_detail_pop').css('z-index','1050');
				$('#cam_work_detail_popup').css('z-index','1055');
			}else {
				$('#cam_work_detail_popup').css('z-index','1050');
			}
			if($("#cam_work_detail_popup").css('display') === 'none') {
				$("#cam_work_detail_popup").modal('show');
			}
		}, parameters, '');
	}


	const $camWorkDetailGrid =  $('#cam_work_detail_grid');
	const camWorkDetailColModel = [
		{title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
		{title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
		{title: 'CAM_SEQ', dataType: 'integer', dataIndx: 'CAM_SEQ', hidden: true},
		{title: '주문확정<br>일자', dataIndx: 'ORDER_CONFIRM_DT'},
		{title: '외<br>주', minWidth: 30, maxWidth: 30, dataIndx: 'OUTSIDE_YN'},
		{title: '작업지시번호', width: 180, halign: 'center', align: 'left', dataIndx: 'CONTROL_NUM'},
		{
			title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
			render: function (ui) {
				if (ui.rowData.CONTROL_NUM)
					return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
			},
			postRender: function (ui) {
				let grid = this,
						$cell = grid.getCell(ui),
						rowIndx = ui.rowIndx,
						rowData = ui.rowData;

				$cell.find('[name=detailView]').bind('click', function () {
					g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
				});
			}
		},
		{title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
		{
			title: '발주처', dataIndx: 'ORDER_COMP_NM',
			styleHead: {'background': '#ffe699'},
			render: function (ui) {
				const firstRowData = this.getRowData({rowIndx: 0});

				if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
					return {style: 'color: #0000ff'};
				}
			}
		},
		{
			title: '규격', dataIndx: 'SIZE_TXT',
			styleHead: {'background': '#ffe699'},
			render: function (ui) {
				const firstRowData = this.getRowData({rowIndx: 0});

				if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
					return {style: 'color: #0000ff'};
				}
			}
		},
		{
			title: '재질', dataIndx: 'MATERIAL_TYPE_NM',
			styleHead: {'background': '#ffe699'},
			render: function (ui) {
				const firstRowData = this.getRowData({rowIndx: 0});

				if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
					return {style: 'color: #0000ff'};
				}
			}
		},
		{
			title: '도면번호', width: 150, halign: 'center', align: 'left', dataIndx: 'DRAWING_NUM',
			styleHead: {'background': '#ffe699'},
			render: function (ui) {
				const firstRowData = this.getRowData({rowIndx: 0});

				if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
					return {style: 'color: #0000ff'};
				}
			}
		},
		{
			title: '', minWidth: 25, maxWidth: 25, dataIndx: 'IMG_GFILE_SEQ',
			styleHead: {'background': '#ffe699'},
			render: function (ui) {
				if (ui.cellData)
					return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>';
			},
			postRender: function (ui) {
				let grid = this,
						$cell = grid.getCell(ui);
				$cell.find('[name=imageView]').bind('click', function () {
					let rowData = ui.rowData;
					callWindowImageViewer(rowData.IMG_GFILE_SEQ);
				});
			}
		},
		{
			title: 'CAD 파일', align: 'center',
			styleHead: {'background': '#ffe699'},
			colModel: [
				{
					title: 'Size', dataIndx: 'CAD_FILE_SIZE',
					styleHead: {'background': '#ffe699'},
					render: function (ui) {
						const firstRowData = this.getRowData({rowIndx: 0});

						if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
							return {style: 'color: #0000ff'};
						}
					}
				},
				{
					title: '', minWidth: 35, maxWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
					styleHead: {'background': '#ffe699'},
					render: function (ui) {
						if (ui.cellData)
							return '<span class="blueFileImageICon" name="downloadView" style="cursor: pointer"></span>';
					},
					postRender: function (ui) {
						let grid = this,
								$cell = grid.getCell(ui);
						$cell.find('[name=downloadView]').bind('click', function () {
							let rowData = ui.rowData;
							fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
						});
					}
				},
			]
		},
		{title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM'},
		{title: '수량', dataIndx: 'CONTROL_PART_QTY'},
		{
			title: '1EA 가공시간', align: 'center',
			colModel: [
				{title: '전공정', dataIndx: 'UNIT_TOTAL_WORK_TIME'},
				{title: 'NC', dataIndx: 'UNIT_NC_WORK_TIME'}
			]
		},
		{
			title: '가공시간', align: 'center',
			colModel: [
				{title: 'Total', dataIndx: 'TOTAL_WORK_TIME'},
				{title: '선반', dataIndx: 'LATHE_WORK_TIME'},
				{title: 'NC', dataIndx: 'NC_WORK_TIME'},
				{title: '밀링', dataIndx: 'MILLING_WORK_TIME'},
				{title: '연마', dataIndx: 'GRINDING_WORK_TIME'}
			]
		},
		{
			title: 'CAM 작업 실적', align: 'center', colModel: [
				{title: 'Steps', width: 50, datatype: 'integer', dataIndx: 'CAM_STEP'},
				{title: '위치', dataIndx: 'WORK_DIRECTION'},
				{title: '작업내용', width: 70, dataIndx: 'WORK_DESC'},
				{title: '단위수량', width: 50, datatype: 'integer', dataIndx: 'DESIGN_QTY'},
				{
					title: 'File', width: 70, dataIndx: '',
					render: function (ui) {
						let rowData = ui.rowData;
						let camVisibility = fnIsEmpty(rowData.CAM_FILE_SEQ) ? 'hidden' : 'visible';
						let ncVisibility = fnIsEmpty(rowData.NC_FILE_SEQ) ? 'hidden' : 'visible';
						let iconFiles = '';
						iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="visibility: ' + camVisibility + '; cursor: pointer;"></span>&nbsp;&nbsp;';
						iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="visibility: ' + ncVisibility + '; cursor: pointer; margin-left: 10px;"></span>';

						return iconFiles;
					},
					postRender: function (ui) {
						let grid = this;
						let $cell = grid.getCell(ui);
						let rowData = ui.rowData;

						$cell.find('#downloadCAMFIle').bind('click', function(e) {
							// console.log(rowData.CAM_FILE_SEQ);
							e.preventDefault();
							fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
						});
						$cell.find('#downloadNCFile').bind('click', function(e) {
							// console.log(rowData.NC_FILE_SEQ);
							e.preventDefault();
							fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
						});
					}
				},
				{title: '작업자', width: 80, dataIndx: 'WORK_USER_NM'},
				{title: '실적등록일시', width: 90, dataIndx: 'CAM_INSERT_DT'},
				{title: '경험 기록사항',  width: 150, dataIndx: 'CAM_EXPERIENCE_NOTE'},
				{title: '비고 및 공유사항',  width: 150, dataIndx: 'CAM_WORK_NOTE'},
			]
		}
	];

	/* function */
	const camCellMerge = function (grid, refresh) {
		let mergeCellList = [],
				colModelList = grid.getColModel(),
				i = colModelList.length,
				data = grid.option('dataModel.data');

		const controlList = [
			'ORDER_COMP_NM'
		];
		const partList = [
			'ORDER_CONFIRM_DT', 'OUTSIDE_YN', 'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'WORK_TYPE_NM', 'SIZE_TXT',
			'MATERIAL_TYPE_NM', 'DRAWING_NUM', 'IMG_GFILE_SEQ', 'CAD_FILE_SIZE', 'DXF_GFILE_SEQ',
			'MATERIAL_DETAIL_NM', 'CONTROL_PART_QTY', 'UNIT_TOTAL_WORK_TIME', 'UNIT_NC_WORK_TIME',
			'TOTAL_WORK_TIME', 'NC_WORK_TIME', 'MILLING_WORK_TIME', 'GRINDING_WORK_TIME', 'LATHE_WORK_TIME'
		];
		const includeList = controlList.concat(partList);

		while (i--) {
			let dataIndx = colModelList[i].dataIndx,
					rc = 1,
					j = data.length;

			if (includeList.includes(dataIndx)) {
				while (j--) {
					let controlNum = data[j]['CONTROL_NUM'],
							controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_NUM'] : undefined,
							cellData = data[j][dataIndx],
							cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

					if (controlList.includes(dataIndx)) {
						if (controlNum === controlNumPrev) {
							// 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
							if (cellData == cellDataPrev) {
								rc++;
							}
						} else if (rc > 1) {
							/**
							 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
							 * c1: colIndx of first column. 첫 번째 열의 colIndx.
							 * rc: number of rows in the range. 범위 내 행 수.
							 * cc: number of columns in the range. 범위 내 열 수.
							 */
							mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
							rc = 1;
						}
					} else if (partList.includes(dataIndx)) {
						let cellData = data[j][dataIndx],
								cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

						if (controlNum === controlNumPrev) {
							// 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
							if (cellData == cellDataPrev) {
								rc++;
							}
						} else if (rc > 1) {
							/**
							 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
							 * c1: colIndx of first column. 첫 번째 열의 colIndx.
							 * rc: number of rows in the range. 범위 내 행 수.
							 * cc: number of columns in the range. 범위 내 열 수.
							 */
							mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
							rc = 1;
						}
					}
				}
			}
		}

		grid.option('mergeCells', mergeCellList);
		if (refresh) {
			grid.refreshView();
		}
	};
	$(".close_cam_work_detail").on('click',function () {
		$("#cam_work_detail_popup").modal('hide');
	})

	$('[name=ORDER_COMP_CHECK]').on('change', function () {
		if($('#ORDER_COMP_CHECK').is(":checked")) {
			$("#cam_work_detail_form #ORDER_COMP_YN").val("");
		}else {
			$("#cam_work_detail_form #ORDER_COMP_YN").val("N");
		}

		$('#cam_work_detail_form').find('#queryId').val('inspection.selectCamWorkDetail');
		let postData = fnFormToJsonArrayData('cam_work_detail_form');
		fnRequestGridData($('#cam_work_detail_grid'), postData);
	});


	$("#g_item_detail_pop").find('#g_item_detail_pop_grid_05_pop_close, #popClose2').on('click', function () {
		$('#g_item_detail_pop').modal('hide');
	});

	$("#g_item_detail_pop_barcode_span").on('click', function (e) {
		$("#g_item_detail_pop_barcode_num").focus();
	});

	$("#item_detail_pop_input").on({
		keyup: function (e) {
			if (e.keyCode == 13) {
				let controlNum = this.value;
				let data = {'queryId': "inspection.selectCommItemDetailInfo", 'CONTROL_NUM': controlNum};
				let parameters = {'url': '/tv/json-info', 'data': data};

				fnPostAjax(function (data) {
					let dataInfo = data.info;
					if (dataInfo == null) {
						fnAlert(null, "작업번호 정보가 존재하지 않습니다.");
						return;
					} else {
						let CONTROL_SEQ = dataInfo.CONTROL_SEQ;
						let CONTROL_DETAIL_SEQ = dataInfo.CONTROL_DETAIL_SEQ;
						g_ItemDetailPopGridId01.pqGrid('destroy');
						g_ItemDetailPopGridId02.pqGrid('destroy');
						g_ItemDetailPopGridId03.pqGrid('destroy');
						g_ItemDetailPopGridId04.pqGrid('destroy');
						g_ItemDetailPopGridId05.pqGrid('destroy');
						g_item_detail_pop_view(CONTROL_SEQ, CONTROL_DETAIL_SEQ);
					}
				}, parameters, '');
			}
		}
	});

	$('#g_item_detail_pop_form').find('[name=view_assembly_or_part]').on('click', function () {
		$(this).siblings().removeClass('bg-moccasin');
		$(this).addClass("bg-moccasin");

		const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
		let controlDetailSeq;

		switch (this.value) {
			case 'WTP020':
				controlDetailSeq = $('#g_item_detail_pop_form > #ASSEMBLY_CONTROL_DETAIL_SEQ').val();
				break;
			case 'WTP050':
				controlDetailSeq = $('#g_item_detail_pop_form > #FIRST_PART_CONTROL_DETAIL_SEQ').val();
				break;
		}

		g_item_detail_pop_view(controlSeq, controlDetailSeq, orderDetailGrid, orderDetailRowIndx);
	});

	$('#g_item_detail_pop_form').find('[name=view_part]').on('click', function () {
		const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
		let controlDetailSeq;

		switch ($(this).attr('id')) {
			case 'view_part_prev':
				controlDetailSeq = $('#g_item_detail_pop_form > #PREV_PART_CONTROL_DETAIL_SEQ').val();
				break;
			case 'view_part_next':
				controlDetailSeq = $('#g_item_detail_pop_form > #NEXT_PART_CONTROL_DETAIL_SEQ').val();
				break;
		}

		g_item_detail_pop_view(controlSeq, controlDetailSeq, orderDetailGrid, orderDetailRowIndx);
	});

	$("#g_item_detail_pop_barcode_num").on({
		focus: function () {
			this.value = '';
			$("#g_item_detail_pop_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long_on.png");
		},
		blur: function () {
			$("#g_item_detail_pop_barcode_img").attr("src", "/resource/asset/images/common/img_barcode_long.png");
		},
		keyup: function (e) {
			if (e.keyCode == 13) {
				fnBarcodePrintCheck(function (confirm, callFunctionParam) {
					let barcodeN = callFunctionParam;
					if (confirm) {
						//0. 바코드 정보 가져오기
						let data = {'queryId': "common.selectControlBarcodeInfo", 'BARCODE_NUM': barcodeN};
						let parameters = {'url': '/tv/json-info', 'data': data};
						fnPostAjax(function (data, callFunctionParam) {
							let dataInfo = data.info;
							if (dataInfo == null) {
								fnAlert(null, "해당 바코드가 존재하지 않습니다.");
								return;
							} else {
								let CONTROL_SEQ = dataInfo.CONTROL_SEQ;
								let CONTROL_DETAIL_SEQ = dataInfo.CONTROL_DETAIL_SEQ;
								g_ItemDetailPopGridId01.pqGrid('destroy');
								g_ItemDetailPopGridId02.pqGrid('destroy');
								g_ItemDetailPopGridId03.pqGrid('destroy');
								g_ItemDetailPopGridId04.pqGrid('destroy');
								g_ItemDetailPopGridId05.pqGrid('destroy');
								g_item_detail_pop_view(CONTROL_SEQ, CONTROL_DETAIL_SEQ);
							}
						}, parameters, '');
					}
				}, fnBarcodeKo2En(this.value), fnBarcodeKo2En(this.value));
				this.value = '';
			}
		}
	});

	$("#cam_work_detail_popup").on({
		'show.bs.modal': function () {
			const camWorkDetailObj = {
				height: "100%",
				dataModel: {
					location: 'remote', dataType: 'json', method: 'POST', recIndx: 'RNUM',
					url: '/tv/paramQueryGridSelect',
					postData: fnFormToJsonArrayData('cam_work_detail_form'),
					getData: function (dataJSON) {
						return {data: dataJSON.data};
					}
				},
				strNoRows: g_noData,
				editable: false,
				postRenderInterval: -1,
				columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
				// scrollModel: {autoFit: true},
				numberCell: {title: 'No'},
				selectionModel: {type: 'row', mode: 'single'},
				swipeModel: {on: false},
				showTitle: false,
				collapsible: false,
				resizable: false,
				trackModel: {on: true},
				colModel: camWorkDetailColModel,
				rowInit: function (ui) {
					// console.log(ui);
					if (ui.rowIndx === 0) {
						return {style: {'background': '#FFFF00'}};
					}
				},
				complete: function () {
					this.flex();
				},
				load: function () {
					camCellMerge(this, true);
				}
			};
			$('#cam_work_detail_form').find('#queryId').val('inspection.selectCamWorkDetail');
			camWorkDetailObj.dataModel.postData = fnFormToJsonArrayData('cam_work_detail_form');
			$camWorkDetailGrid.pqGrid(camWorkDetailObj);
		},
		'hide.bs.modal': function () {
			$camWorkDetailGrid.pqGrid('destroy');
		}
	})

	let inspectionDetailGrid =  $("#inspection_detail_grid");
	let inspectionDetailColModel = [
		{title: 'Q_SEQ', dataType: 'string', dataIndx: 'Q_SEQ', hidden:true},
		{title: 'Seq.', datatype: 'string', dataIndx: 'Q_INSPECT_NUM', minWidth: 30, width: 30},
		{title: '작성자', dataType: 'string', dataIndx: 'Q_INSPECT_USER_NM', width: 80},
		{title: '측정방법', dataType: 'string', dataIndx: 'Q_INSPECT_METHOD_NM', width: 85},
		// {title: '반품일', dataType: 'string', dataIndx: 'Q_RETURN_DT', minWidth: 90, width: 95},
		{title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 60},
		{title: '수량', dataType: 'string', dataIndx: 'Q_ERROR_QTY', maxWidth: 40, width: 40},
		{title: '검사코드', align: 'center', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95, colModel: [
				{title: '', dataType: 'string', dataIndx: 'Q_INSPECT_DESC', minWidth: 95, styleHead: {'border-right-width': '0'}}
			]
		},
		{title: '원인', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_REASON_NM', width: 95, colModel: [
				{title: '상세내용', dataType: 'string', dataIndx: 'Q_INSPECT_DESC1', minWidth: 95, styleHead: {'border-right-width': '0'}}
			]
		},
		{title: '발생공정', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_PROCESS_NM', width: 95, colModel: [
				{title: '', dataType: 'string', dataIndx: 'Q_INSPECT_DESC2', minWidth: 95}
			]
		},
		{title: '조치', align: 'center', dataType: 'string', dataIndx: 'Q_ERROR_ACTION_NM', width: 95,  colModel: [
				{title: '비고', dataType: 'string', dataIndx: 'Q_ERROR_NOTE', minWidth: 95}
			]
		},
		{title: '작성일시', dataType: 'string', dataIndx: 'Q_DT', minWidth: 90, width: 95}
	];
	let inspectionDetailObj = {
		width: "100%", height: "100%",
		dataModel: {
			location: "remote", dataType: "json", method: "POST", recIndx: 'Q_SEQ',
			url: "/tv/paramQueryGridSelect",
			postData: fnFormToJsonArrayData('inspection_detail_form'),
			getData: function (dataJSON) {
				return {data: dataJSON.data};
			}
		},
		strNoRows: g_noData,
		editable: false,
		columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
		scrollModel: {autoFit: true},
		numberCell: {width: 30, title: "No", show: false},
		selectionModel: { type: 'row', mode: 'single'} ,
		swipeModel: {on: false},
		showTitle: false,
		collapsible: false,
		resizable: false,
		trackModel: {on: true},
		colModel: inspectionDetailColModel,
		complete: function () {
			inspectionAutoMerge(this, true);
			const groupData = fnGroupBy(this.option('dataModel.data'),'Q_SEQ');
			$.each(groupData, function(idx,Item) {
				if (Item.length >= 2) {
					var cellId1 = '-' + Item[0].pq_ri + '-6-right'
					var cellId2 = '-' + Item[0].pq_ri + '-7-right'
					var cellId3 = '-' + Item[0].pq_ri + '-8-right'
					var cellId4 = '-' + Item[0].pq_ri + '-9-right'

					$("#"+cellId1 + " > div").text(Item[0].Q_INSPECT_RESULT_NM);
					$("#"+cellId2 + " > div").text(Item[0].Q_ERROR_REASON_NM);
					$("#"+cellId3 + " > div").text(Item[0].Q_ERROR_PROCESS_NM);
					$("#"+cellId4 + " > div").text(Item[0].Q_ERROR_ACTION_NM);
					$("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId1 + "']").each(function() {
						$(this).find("div").text(Item[0].Q_INSPECT_RESULT_NM)
					});
					$("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId2 + "']").each(function() {
						$(this).find("div").text(Item[0].Q_ERROR_REASON_NM)
					});
					$("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId3 + "']").each(function() {
						$(this).find("div").text(Item[0].Q_ERROR_PROCESS_NM)
					});
					$("#inspection_detail_popup").find("div[id^='pq-body-cell-'][id$='"+ cellId4 + "']").each(function() {
						$(this).find("div").text(Item[0].Q_ERROR_ACTION_NM)
					});
				}
			})
		}
	};

	const inspectionAutoMerge = function (grid, refresh) {
		let mergeCellList = [],
				colModelList = grid.getColModel(),
				i = colModelList.length,
				data = grid.option('dataModel.data');
		const orderList = [
			'Q_INSPECT_NUM', 'Q_INSPECT_USER_NM', 'Q_INSPECT_METHOD_NM', 'Q_INSPECT_GRADE', 'Q_INSPECT_GRADE_NOTE',
			'Q_ERROR_QTY', 'Q_DT'
		];
		const includeList = orderList;

		while (i--) {
			let dataIndx = colModelList[i].dataIndx,
					rc = 1,
					j = data.length;

			if (includeList.includes(dataIndx)) {
				while (j--) {
					let controlNum = data[j]['Q_SEQ'],
							controlNumPrev = data[j - 1] ? data[j - 1]['Q_SEQ'] : undefined,
							cellData = data[j][dataIndx] || '',
							cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;
					if (orderList.includes(dataIndx)) {
						if (controlNum === controlNumPrev) {
							// 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
							if (cellDataPrev !== undefined && cellData == cellDataPrev) {
								rc++;
							}
						} else if (rc > 1) {
							/**
							 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
							 * c1: colIndx of first column. 첫 번째 열의 colIndx.
							 * rc: number of rows in the range. 범위 내 행 수.
							 * cc: number of columns in the range. 범위 내 열 수.
							 */
							mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
							rc = 1;
						}
					}
				}
			}
		}
		const groupData = fnGroupBy(data,'Q_SEQ');
		$.each(groupData, function(idx,Item) {
			if(Item.length >= 2) {
				mergeCellList.push({r1: Item[1].pq_ri, c1: 6, rc: 1, cc: 3});
			}
		});

		grid.option('mergeCells', mergeCellList);
		if (refresh) {
			grid.refreshView();
		}
	}
	$("#inspection_detail_popup").on({
		'show.bs.modal': function () {
			inspectionDetailObj.dataModel.postData = fnFormToJsonArrayData('inspection_detail_form');
			inspectionDetailGrid.pqGrid(inspectionDetailObj);
		},'hide.bs.modal':function() {
			if ($("#inspection_detail_grid").hasClass('pq-grid')) {
				$("#inspection_detail_grid").pqGrid('destroy');
			}
		}
	})
	const g_item_detail_pop_inspection_pop = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ) {

		$('#inspection_detail_form').find('#CONTROL_SEQ').val(CONTROL_SEQ);
		$('#inspection_detail_form').find('#CONTROL_DETAIL_SEQ').val(CONTROL_DETAIL_SEQ);
		$('#inspection_detail_popup').modal('show');
	}

	$("#search_inspection_detail").on('click',function() {
		const controlSeq = $('#g_item_detail_pop_form > #CONTROL_SEQ').val();
		let controlDetailSeq = $('#g_item_detail_pop_form > #CONTROL_DETAIL_SEQ').val();
		g_item_detail_pop_inspection_pop(controlSeq, controlDetailSeq)
	});


	$(".close_inspection_detail").on("click", function() {
		$("#inspection_detail_popup").modal("hide");
	});

	$(function () {

		$("#changeScreen").change(function(){
			if($("#changeScreen").val().toUpperCase() == "DMT"){
				$("#contents01, #contents02").hide();
				$("#contents03").show();
			}else{
				$("#contents01, #contents02").show();
				$("#contents03").hide();
			}
			getReLoadTableData(true);
		});

		let getInitData = function () {
			'use strict';

			let type = {
				'FACTORY_TYPE': $("#changeScreen").val()
			}
			$.ajax({
				type: 'POST', url: "/tv/mct/data", dataType: 'json',
				data: {'data': JSON.stringify(type)},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}

					machineListData = data.mct_info_list;//mct info
					machineAreListData = data.mct_list;
					// let mct_list = data.mct_list;//mct

					//mct info
					getReLoadWorkData('init');

					var rateInfo = data.mct_rate;
					$('#NOW_RATE').html(rateInfo.NOW_RATE);
					$('#RUN').html(rateInfo.RUN + '대');
					$('#STOP').html(rateInfo.STOP + '대');
					$('#NOT_RUN').html(rateInfo.NOT_RUN + '대');
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		let getReLoadWorkData = function (sType) {
			'use strict';
			if (machineListData != '') {
				let groups = fnGroupBy(machineListData,'FACTORY_AREA');

				if(sType === 'init') {
					$.each(groups,function (idx,Item) {
						if(idx == 'ARE06' || idx == 'ARE01') {
							var sort_arr = [4,9,10,15,16,17,22,23];
							if(idx == 'ARE01') {
								sort_arr = [9];
							}
							var json = {
								EQUIP_NM : 'BLANK',
								FACTORY_AREA : Item[0].FACTORY_AREA
							};
							for(var i=0;i<sort_arr.length;i++) {
								groups[idx].splice(sort_arr[i],0,json);
							}
							// if(Item.length % 6 != 0) {
							// 	var first = Math.ceil(Item.length / 6);
							// 	var add = (parseInt(first) * 6) - Item.length;
							// 	for(var i=0;i<add;i++) {
							// 		var json = {
							// 			EQUIP_NM : 'BLANK',
							// 			FACTORY_AREA : Item[0].FACTORY_AREA
							// 		};
							// 		groups[idx].push(json);
							// 	}
							// }
						}
						$.each(Item,function (idx2,Item2) {
							var html = '';
							if(Item2.EQUIP_NM == 'BLANK') {
								html = '<div class="mctInfo_'+idx2+' blank"></div>';
							}else {
								html = '<div id="EQUIP_'+ Item2.EQUIP_SEQ + '" class="mctInfo_'+idx2+' mct'+Item2.WORK_STATUS +'" data-seq="'+Item2.EQUIP_SEQ+'">';
								html += '<div class="mctInfoWrap">';
								html += '<span class="mctName '+ Item2.WORK_STATUS + '">' + Item2.EQUIP_NM + '</span>';
								html += '<div class="mctInfoTopLeft">';
								if(typeof Item2.PHOTO_GFILE_SEQ != 'undefined') {
									html += '	<div class="staffImg mctStaffImg">';
									html += '		<img src="/image/'+Item2.PHOTO_GFILE_SEQ + '" alt="직원사진">';
								}else {
									html += '	<div class="staffImg mctStaffImg staffIcon">';
									html += '		<img src="/resource/pop/images/user.svg" alt="직원사진">';
								}
								html += '	</div>';
								html += '	<div class="staffInfoWrap">';
								html += '		<p class="mctStaffName">'+((typeof Item2.USER_NM != 'undefined')? Item2.USER_NM : '-') +'</p>';
								html += '		<p class="mctTime">남은시간';
								html += '		<br>' + Item2.REMAIN_TIME;
								html += '		</p>';
								html += '	</div>';
								html += '</div>';
								html += '<div class="mctInfoTopRight">';
								html += '	<div class="mctMapImg">';
								if(Item2.WORK_PLAN_TYPE == 1 && typeof Item2.IMG_GFILE_SEQ != 'undefined') {
									html += '		<img src="/qimage/'+Item2.IMG_GFILE_SEQ +'" alt="도면">';
								}else {
									html += '		<img src="/resource/asset/images/tv/img_thumb_3.png" class="machineImg" alt="도면">';
								}
								html += '		<div class="mctMapTime">';
								html += '			<span>진행 : '+Item2.WORKING_TIME_FORMAT + '</span><br>예상 : ' + ((typeof Item2.PLAN_WORKING_TIME_FORMAT != 'undefined')?Item2.PLAN_WORKING_TIME_FORMAT:'');
								html += '		</div>';
								if(Item2.WORK_STATUS == 'pause') {
									html += '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									var startStopDt = new Date(Item2.WORK_TEMP_STOP_DT);
									var today = new Date();
									var diff = today - startStopDt;
									var hour = Math.floor((diff) / (1000 * 60 * 60));
									var minute = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
									html += '<span>' + hour + 'h ' + minute + 'm' + '</span>';
									html += '</div>';
								}
								html += '		<span class="progressPercent mctProgressPercent">'+ ((typeof Item2.PERCENT != 'undefined')?Item2.PERCENT:'') + '</span>';
								html += '	</div>';
								html += '	<div class="mctMapBtmInfo '+ Item2.WORK_STATUS + '">';
								html +=  ((typeof Item2.CUR_TEXT != 'undefined')?Item2.CUR_TEXT:'') + '<br>' + ((typeof Item2.CONTROL_PART_INFO != 'undefined')?Item2.CONTROL_PART_INFO:'');
								html += '	</div>';
								html += '</div>';
								html += '<div class="mctInfoBtm">';
								html += '	<table id="EQUIP_PLAN_'+ Item2.EQUIP_SEQ + '">';
								html += '	<colgroup>';
								html += '		<col width="58%">';
								html += '		<col width="42%">';
								html += '	</colgroup>';
								html += '		<tr>';
								html += '			<th>계획 List</th>';
								html += '			<th>'+Item2.TOTAL_CNT +'품 '+Item2.TOTAL_PART_QTY +' EA (<span>'+Item2.TOTAL_PLAN_WORKING_TIME_FORMAT +'</span>)</th>';
								html += '		</tr>';
								html += '		<tr>';
								html += '			<td>&nbsp;</td>';
								html += '			<td>&nbsp;</td>';
								html += '		</tr>';
								html += '		<tr>';
								html += '			<td>&nbsp;</td>';
								html += '			<td>&nbsp;</td>';
								html += '		</tr>';
								html += '		<tr>';
								html += '			<td>&nbsp;</td>';
								html += '			<td>&nbsp;</td>';
								html += '		</tr>';
								html += '		<tr>';
								html += '			<td>&nbsp;</td>';
								html += '			<td>&nbsp;</td>';
								html += '		</tr>';
								html += '	</table>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
							}

							if(Item2.FACTORY_AREA == 'ARE01' || Item2.FACTORY_AREA == 'ARE06') {
								if(idx2 < 6) {
									$("#"+Item2.FACTORY_AREA + '_1').append(html);
								}else if(idx2 < 12) {
									$("#"+Item2.FACTORY_AREA + '_2').append(html);
								}else if(idx2 < 18) {
									$("#"+Item2.FACTORY_AREA + '_3').append(html);
								}else {
									$("#"+Item2.FACTORY_AREA + '_4').append(html);
								}
							}else {
								$("#"+Item2.FACTORY_AREA + '_' + Item2.LAYOUT_ROW).append(html);
							}
						})
					})
					let groups2 = fnGroupBy(machineAreListData,'EQUIP_SEQ');
					$.each(groups2,function (idx,Item) {
						$.each(Item,function (idx2,Item2) {
							$("#EQUIP_PLAN_"+Item2.EQUIP_SEQ).find('tr').eq(Item2.ROWNUM).find('td').eq(0).text(Item2.CONTROL_PART_INFO);
							$("#EQUIP_PLAN_"+Item2.EQUIP_SEQ).find('tr').eq(Item2.ROWNUM).find('td').eq(1).html(Item2.MATERIAL_TYPE_NM +'&nbsp;'+ Item2.WORK_TYPE_NM + '&nbsp;'+ Item2.PART_QTY + ' EA');
						})
					})
				}else {

					$.ajax({
						type: 'POST', url: "/tv/mct/mctAreInfo", dataType: 'json', data: {},
						success: function (data, textStatus, jqXHR) {
							if (textStatus !== 'success' || data == null) {
								fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
								return;
							}
							if(data.mct_info_list.length > 0) {
								$.each(data.mct_info_list, function (idx,Item) {
									if(Item.WORK_STATUS == 'pause') {
										var startStopDt = new Date(Item.WORK_TEMP_STOP_DT);
										var today = new Date();
										var diff = today - startStopDt;
										var hour = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
										var minute = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
										$("#EQUIP_"+ Item.EQUIP_SEQ).find(".pauseTime").find("span").text(hour + 'h ' + minute + 'm');
									}
									$("#EQUIP_"+ Item.EQUIP_SEQ).find(".mctMapTime").find("span").text('진행 : ' + Item.WORKING_TIME_FORMAT);
									var html = "남은시간<br>" + Item.REMAIN_TIME;
									$("#EQUIP_"+ Item.EQUIP_SEQ).find(".mctTime").html(html);
								})
							}
							if(data.mct_list.length > 0) {
								$.each(data.mct_list, function (idx,Item) {
									$("#EQUIP_PLAN_"+Item.EQUIP_SEQ).find('tr').eq(Item.ROWNUM).find('td').eq(0).text(Item.CONTROL_PART_INFO)
									$("#EQUIP_PLAN_"+Item.EQUIP_SEQ).find('tr').eq(Item.ROWNUM).find('td').eq(1).html(Item.MATERIAL_TYPE_NM +'&nbsp;'+ Item.WORK_TYPE_NM + '&nbsp;'+ Item.PART_QTY + ' EA')
								});
							}
						},
						error: function (jqXHR, textStatus, errorThrown) {
							fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						}
					});

				}

				for (let i = 0; i < machineListData.length; i++) {

					let equip_seq = machineListData[i].EQUIP_SEQ;
					let equip_nm = machineListData[i].EQUIP_NM;
					let factory_area = machineListData[i].FACTORY_AREA;
					let layout_row = machineListData[i].LAYOUT_ROW;
					let layout_col = machineListData[i].LAYOUT_COL;
					let user_nm = machineListData[i].USER_NM;

					// 장비의 작업 정보 조회
					// getReLoadDrawingData(equip_seq, factory_area, layout_row, layout_col);

				}
			}
		};

		let getReLoadTableData = function (selectChange) {
			'use strict';
			let type = {
				'FACTORY_TYPE': $("#changeScreen").val()
			}
			$.ajax({
				type: 'POST', url: "/tv/mct/gridDataList", dataType: 'json', data: {'data': JSON.stringify(type)},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}
					if(!selectChange) {
						createGrid1();	// 불량/반품
					}

					var rateInfo = data.mct_rate;
					$('#NOW_RATE').html(rateInfo.NOW_RATE);
					$('#RUN').html(rateInfo.RUN + '대');
					$('#STOP').html(rateInfo.STOP + '대');
					$('#NOT_RUN').html(rateInfo.NOT_RUN + '대');
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		/** DRAWING BOARD 정보 실시간 처리 **/
		let getReLoadDrawingData = function (equipSeq, factoryArea, equipRow, equipCol) {
			'use strict';
			$.ajax({
				type: 'POST', url: "/tv/mct/machineDrawingData", dataType: 'json',
				data: {"EQUIP_SEQ": equipSeq},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}
					let $target = $("#EQUIP_" + equipSeq);
					let mct_list = data.mct_drawing_list; //mct
					if (mct_list != '') {
						$.each(mct_list,function (idx,Item) {
							if($target.hasClass('mctlogin')) {
								$target.find(".mctName").removeClass("login");
								$target.find(".mctMapBtmInfo").removeClass("login");
								$target.removeClass('mctlogin');
							}
							if($target.hasClass('mctpause')){
								$target.find(".mctName").removeClass("pause");
								$target.find(".mctMapBtmInfo").removeClass("pause");
								$target.removeClass('mctpause');
							}
							$target.addClass('mct'+Item.WORK_STATUS);
							$target.find(".mctName").addClass(Item.WORK_STATUS);
							$target.find(".mctMapBtmInfo").addClass(Item.WORK_STATUS);

							if(typeof Item.PHOTO_GFILE_SEQ != 'undefined') {
								$target.find(".mctStaffImg").removeClass("staffIcon");
								$target.find(".mctStaffImg").find("img").attr("src","/image/" + Item.PHOTO_GFILE_SEQ);
							}else {
								if(!$target.find(".mctStaffImg").hasClass("staffIcon")) {
									$target.find(".mctStaffImg").addClass("staffIcon");
								}
								$target.find(".mctStaffImg").find("img").attr("src","/resource/pop/images/user.svg");
							}

							if(typeof Item.IMG_GFILE_SEQ != 'undefined') {
								$target.find(".mctStaffName").text(Item.USER_NM);
							}else {
								$target.find(".mctStaffName").text("-");
							}

							if(Item.WORK_PLAN_TYPE == 1 && typeof Item.IMG_GFILE_SEQ != 'undefined') {
								$target.find(".mctMapImg").find("img").removeClass('machineImg');
								$target.find(".mctMapImg").find("img").attr("src","/qimage/" + Item.IMG_GFILE_SEQ);
							}else {
								if(!$target.find(".mctMapImg").find("img").hasClass('machineImg')) {
									$target.find(".mctMapImg").find("img").addClass('machineImg');
								}
								$target.find(".mctMapImg").find("img").attr("src","/resource/asset/images/tv/img_thumb_3.png");
							}
							var html = "<span> 진행 : " + Item.WORKING_TIME_FORMAT + "</span><br>예상 : " +  ((typeof Item.PLAN_WORKING_TIME_FORMAT != 'undefined')?Item.PLAN_WORKING_TIME_FORMAT:'');
							$target.find(".mctMapTime").html(html);

							if(Item.WORK_STATUS == 'pause') {
								var startStopDt = new Date(Item.WORK_TEMP_STOP_DT);
								var today = new Date();
								var diff = today - startStopDt;
								var hour = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
								var minute = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

								if($target.find(".pauseTime").length > 0) {
									html = "일시중지<br>";
									html += "<span>" + hour + "h " + minute + "m" + "</span>";
									$target.find(".pauseTime").html(html)
								}else {
									html = '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									html += '<span>' + hour + 'h ' + minute + 'm' + '</span>';
									html += '</div>';
									$target.find(".mctMapTime").after(html);
								}
							}else {
								if($target.find(".pauseTime").length > 0) {
									$target.find(".pauseTime").remove();
								}
							}
							$target.find(".mctProgressPercent").text(((typeof Item.PERCENT != 'undefined')?Item.PERCENT:''));
							html = ((typeof Item.CUR_TEXT != 'undefined')?Item.CUR_TEXT:'') + '<br>' + ((typeof Item.CONTROL_PART_INFO != 'undefined')?Item.CONTROL_PART_INFO:'');
							$target.find(".mctMapBtmInfo").html(html);

						})
					}
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		let mctMainGrid = $("#mct_main_grid");
		let $mctMainGrid;
		let mctMainColModel = [
			{title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
			{title: 'CONTROL_DETAIL_SEQ', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
			{title: 'CURR_POS', dataIndx: 'CURR_POS', hidden: true},
			{title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
			{title: 'RANK', dataIndx: 'RANK', hidden: true},
			{title: '구분', minWidth: 35, maxWidth: 80, width: 35, dataIndx: 'TITLE', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
				render: function (ui) {
					const rowData = ui.rowData
					if (rowData.RANK == 1 || rowData.RANK == 2) {
						return {style: 'background-color: #ae301f; color:white;'};
					}else if(rowData.RANK == 3) {
						return {style: 'background-color: #ffff00; color:#be1600;'};
					}else {
						return {style: 'background-color: #f5e397; color:#be1600;'};
					}
				}
			},
			{title: '납기', minWidth: 45, maxWidth: 115, width: 45, dataIndx: 'INNER_DUE_DT', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'}},
			{title: '작업번호', align: 'center', minWidth: 140, maxWidth: 330, width: 140, dataIndx: 'CONTROL_TEXT', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return {text:cellData.replace(/&lt;/g, '<'), style: {'text-decoration':'underline', 'cursor':'pointer'}};
					}
				},
				postRender: function (ui) {
					let grid = this,
							$cell = grid.getCell(ui);
					$cell.bind('click', function () {
						let rowData = ui.rowData;
						console.log(rowData);
						g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
						// callWindowImageViewer(rowData.IMG_GFILE_SEQ);
					});
				}
			},
			{title: '진행상태',minWidth: 85, maxWidth: 190, width: 85, dataIndx: 'PART_STATUS_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
				render:function (ui) {
					const cellData = ui.cellData;
					let partStatus = ui.rowData.PART_STATUS;
					var text = "";
					var style = "";
					if(typeof partStatus != 'undefined' && partStatus != null && (partStatus == 'PRO002' || partStatus == 'PRO005')) {
						style = "color:red; font-weight:bold;";
					}
					if(typeof cellData != 'undefined' && typeof ui.rowData.CURR_POS != 'undefined' && ui.rowData.CURR_POS != null && ui.rowData.CURR_POS != '') {
						text = cellData + '<br>(' + ui.rowData.CURR_POS +')';
					}
					return {text:((text != "")?text:cellData),style: style};
				}
			}
		];
		let mctMainObj= {
			width: '100%', height: 'auto',
			dataModel: {
				location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
				url: "/tv/paramQueryGridSelect",
				postData: fnFormToJsonArrayData('mct_main_form'),
				getData: function (dataJSON) {
					return {data: dataJSON.data};
				}
			},
			strNoRows: '<div style="font-size:1.4rem;">No Data</div>',
			columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
			scrollModel: {autoFit: true},
			numberCell: {width: 30, title: "No. ", show: false},
			selectionModel: { type: 'row', mode: 'single'} ,
			postRenderInterval: -1, //call postRender synchronously.
			swipeModel: {on: false},
			showTitle: false,
			collapsible: false,
			resizable: true,
			trackModel: {on: true},
			colModel: mctMainColModel,
			refresh : function (evt, ui) {
				var data = mctMainGrid.pqGrid('option', 'dataModel.data');
				var totalReturn = 0;
				var totalEmergency = 0;
				var totalLate = 0;
				for (var i = 0; i < data.length; i++) {
					var row = data[i];
					if(row.RANK == 1 || row.RANK == 2) {
						totalReturn++;
					}else if(row.RANK == 3) {
						totalEmergency++;
					}else if(row.RANK == 4) {
						totalLate++;
					}
				}
				$("#totalReturn").html(totalReturn);
				$("#totalEmergency").html(totalEmergency);
				$("#totalLate").html(totalLate);
			}
		};
		$mctMainGrid = mctMainGrid.pqGrid(mctMainObj);

		let createGrid1 = function(){
			$mctMainGrid.pqGrid('refreshDataAndView');
		};

		/** 작업자 로그인 정보 실시간 처리 **/
		let workerMessageProcess = function(messageData){
			if(messageData){
				let actionType = messageData.actionType;
				let $target = $("#EQUIP_" + messageData.equipSeq);
				if(actionType === 'WK_LOGIN') {
					$("#EQUIP_"+ messageData.equipSeq).find(".mctStaffName").text(messageData.userNm);
				}else{
					if(!$("#EQUIP_"+ messageData.equipSeq).hasClass("mctlogin")) {
						$("#EQUIP_"+ messageData.equipSeq).find(".mctStaffName").text("-");
					}
				}
			}
		};
		let iConnectCount = 0;
		function jmesConnect() {
		    let socket = new SockJS('/jmes-ws');
		    stompClient = Stomp.over(socket);
			stompClient.connect({}, (frame) => {
				stompClient.subscribe('/topic/drawing', function (notificationMessage) { // 드로잉 보드 가공시작, 일시정지, 작업재개, 작업완료, 작업취소
					let messageData = JSON.parse(notificationMessage.body);
					getReLoadDrawingData(messageData.equipSeq, messageData.factoryArea, messageData.equipRow, messageData.equipCol);
				});
				stompClient.subscribe('/topic/worker', function (notificationMessage) { // 드로잉 보드 로그인, 로그아웃
					let messageData = JSON.parse(notificationMessage.body);
					workerMessageProcess(messageData);
				});
		    }, () => {
			  	setTimeout(() => {
					if(iConnectCount == 6) {
						fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}else if(iConnectCount <= 5){
						jmesConnect();
					}
					iConnectCount++
			  	}, 5000);
			});
		}

		let setGridSchedulerIntervalTimer;
		let gridSchedulerTimer = function(){
			// let selVal = 60;//1분
			let selVal = 5;// 분
			let timesec = 60000;//60초
			setGridSchedulerIntervalTimer = setInterval(function() {
				getReLoadTableData();
			}, timesec*selVal);
		};

		let setWorkSchedulerIntervalTimer;
		let workSchedulerTimer = function(){
			let selVal = 1;// 분
			let timesec = 60000;//60초
			setWorkSchedulerIntervalTimer = setInterval(function() {
				getReLoadWorkData('scheduler');
			}, timesec*selVal);
		};

		let setIntervalReloadTimer;
		let reloadTimer = function(){
			let reloadTimeMinute = 20; // 30분
			let reloadTimeSecond = 1000 * 60;// 1분
			setIntervalReloadTimer = setInterval(function() {
				location.reload();
			}, reloadTimeSecond*reloadTimeMinute);
		};

		getInitData();
		jmesConnect();
		gridSchedulerTimer();
		workSchedulerTimer();
		// reloadTimer();
	});
	$(document).ready(function(){
		function timeFormat(time) {
			var text = "";
			if(typeof time != 'undefined' && time != "" && time != null) {
				if(time >= 60) {
					if(time % 60 == 0) {
						text = parseInt(time / 60) + 'h';
					}else {
						text = Math.floor(time / 60) + 'h  ' + parseInt(time % 60) + 'm';
					}
				}else {
					text = time + 'm';
				}
			}
			return text;
		}

		let mctMachineGrid = $("#mct_machine_grid");
		let $mctMachineGrid;
		let mctMachineColModel = [
			{title: 'ROWNUM', dataIndx: 'ROWNUM', hidden: true},
			{title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
			{title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
			{title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
			{title: '가공 납기', minWidth: 50, width: 50, dataIndx: 'INNER_DUE_DT', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
				render: function (ui) {
					const rowData = ui.rowData
					if (rowData.DELAY_YN === 'Y') {
						return {style: 'background-color: #ffff00;'};
					}
				}
			},
			{title: '진행상태', width: 70, dataIndx: 'PART_STATUS', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'}},
			{title: '작업번호 / 규격', align: 'center', minWidth: 165, width: 165, dataIndx: 'CONTROL_NUM_PART_NUM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return cellData.replace(/&lt;/g, '<');
					}
				}
			},
			{title: '작업형태 / 소재', dataType: 'string', dataIndx: 'WORK_TYPE_MATERIAL', minWidth: 80, width:120, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return cellData.replace(/&lt;/g, '<');
					}
				}
			},
			{title: '수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY', minWidth: 40, width: 40, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
				render: function (ui) {
					const rowData = ui.rowData
					if (rowData.ORDER_QTY_INFO != 'N') {
						return '<span><span style="color: red;font-weight: bold">'+ rowData.ORDER_QTY_INFO +'&nbsp;</span>'+rowData.CONTROL_PART_QTY+'</span>';
					}
				}
			},
			{title: '예상시간<br>(E/T,분)', dataType: 'string', dataIndx: 'WORKING_TIME', minWidth: 55, width: 65, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'blue'},
				format: function(val){
					return (typeof val != 'undefined')?(val+"'"):"";
				},
			},
			{title: '과거수행기록(NC)', align: 'center', styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
				colModel: [
					{title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
					{
						title: '1EA L/T',
						minWidth: 55,
						width: 55,
						dataIndx: 'LAST_UNIT_LEAD_TIME',
						editable: false,
						styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'}
					},
					{title: '작업자', minWidth: 60, width: 65, datatype: 'string', dataIndx: 'LAST_MCT_WORK_USER', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'}}
				]
			}
		];
		let mctMachineObj;


		function settingOngoingInfo(equipSeq) {
			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'machine.selectOngoingInfoForDetailPop',
					'EQUIP_SEQ':equipSeq
				}
			};
			fnPostAjax(function (data) {
				var tempHtml = '';
				if(data.info != null) {
					if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
						$("#mapImgWrap").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('alt', data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('data-value', data.info.IMG_GFILE_SEQ);
						$("#mct_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
					}else {
						$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
						$("#mct_machine_form").find("#GFILE_SEQ").val('');
					}
					var stopTime = ((typeof data.info.TEMP_STOP != 'undefined' && data.info.TEMP_STOP != null)?data.info.TEMP_STOP:'');
					var onGoingTime = ((typeof data.info.ON_GOING != 'undefined' && data.info.ON_GOING != null)?data.info.ON_GOING:'');
					var planWorkingTime = ((typeof data.info.PLAN_WORKING_TIME != 'undefined' && data.info.PLAN_WORKING_TIME != null)?data.info.PLAN_WORKING_TIME:'');
					var arr = data.info.DRAWING_NUM.split(",");
					var arr2 = data.info.DRAWING_SEQ.split(",");
					tempHtml = '<td class="workStaffImg"><div class="staffImgWrap"><img src="/image/' + data.info.PHOTO_GFILE_SEQ + '"></div>'+ data.info.WORK_USER_NM + '</td>';
					tempHtml += '<td>' + data.info.WORK_STATUS_NM + '</td>';
					tempHtml += '<td class="numberWorking">' + data.info.CONTROL_NUM + '</td>';
					tempHtml += '<td><div class="tableScroll"><div class="tableScrollCell">';
					for(var i=0;i<arr.length;i++){
						if(i>0) {
							tempHtml += '<br>';
						}
						tempHtml += '<span class="machine_ongoing_draw" data-value="'+ arr2[i]+'">' + arr[i] + '</span>';
					}
					tempHtml += '</div></div></td>';
					tempHtml += '<td class="sizeInfo">' + data.info.SIZE_TXT + '</td>';
					tempHtml += '<td class="workTypeInfo">' + data.info.WORK_TYPE_NM + '</td>';
					tempHtml += '<td class="materialInfo">' + data.info.MATERIAL_DETAIL_NM + '</td>';
					tempHtml += '<td class="productAmount">';
					if(data.info.ORDER_QTY_INFO != 'N') {
						tempHtml += '<span>' + data.info.ORDER_QTY_INFO + '&nbsp;</span>';
					}
					tempHtml += data.info.CONTROL_PART_QTY + '</td>';
					tempHtml += '<td class="deliveryDate">' + data.info.INNER_DUE_DT + '</td>';
					tempHtml += '<td class="runningStop"">' + stopTime + '</td>';
					tempHtml += '<td class="runningTime">' + onGoingTime + '</td>';
					tempHtml += '<td class="expectTime">' + planWorkingTime+ '</td>';
				}else {
					tempHtml = '<td colspan="12" style="font-size: 35px;height: 141px;">Not Found Data</td>';
					$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
					$("#mct_machine_form").find("#GFILE_SEQ").val('');
				}
				$("#machine_popup_tbody").html(tempHtml);
			}, parameter2, '');
		}

		$(document).on("click",".mctlogin,.mctpause",function(event){
			var equipSeq = $(this).data('seq');
			$("#mct_machine_form").find("#EQUIP_SEQ").val(equipSeq);
			const parameter = {'url': '/tv/json-info', 'data': {
					'queryId':'machine.selectMachineInfoForDetailPop',
					'EQUIP_SEQ':equipSeq
				}
			};
			fnPostAjax(function (data) {
				var tempHtml = '<tr>'
				tempHtml += '<td>장비번호 : ' + data.info.EQUIP_NM + '</td>';
				tempHtml += '<td>장비종류 : ' + data.info.EQUIP_TYPE_NM + '</td>';
				tempHtml += '<td>설치위치 : ' + data.info.FACTORY_AREA_NM + '</td>';
				tempHtml += '<td>관리장(정) : ' + data.info.MAIN_USER_NM + '</td>';
				tempHtml += '<td>관리장(부) : ' + data.info.SUB_USER_NM + '</td>';
				tempHtml += '</tr>';
				$("#popHeadTopTable").html(tempHtml);
			}, parameter, '');

			settingOngoingInfo(equipSeq);

			$('#popupWrap').modal('show');
		});
		$(document).on("click",".machine_ongoing_draw",function(e){
			var grid = $("#mct_machine_grid").pqGrid('getInstance').grid;
			var sr = grid.SelectRow();
			sr.removeAll();
			var imgSeq = $(this).data('value');
			if(typeof imgSeq != 'undefined' && imgSeq != '') {
				$("#mapImgWrap").attr('src','/qimage/'+imgSeq);
				$("#mapImgWrap").attr('alt',imgSeq);
				$("#mapImgWrap").attr('data-value', imgSeq);

				$("#mct_machine_form").find("#GFILE_SEQ").val(imgSeq);
			}
		})


		$('#popupWrap').on({
			'show.bs.modal': function () {
				mctMachineObj = {
					width: 'auto', height: 'auto',
					dataModel: {
						location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
						url: "/tv/paramQueryGridSelect",
						postData: fnFormToJsonArrayData('mct_machine_form'),
						getData: function (dataJSON) {
							return {data: dataJSON.data};
						}
					},
					strNoRows: '<div style="font-size:1.4rem;">No Data</div>',
					columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
					scrollModel: {autoFit: true},
					numberCell: {width: 35, title: "No. ", show: true},
					selectionModel: { type: 'row', mode: 'single'} ,
					swipeModel: {on: false},
					showTitle: false,
					collapsible: false,
					resizable: false,
					trackModel: {on: true},
					editModel: {clicksToEdit: 1},
					colModel: mctMachineColModel,
					rowSelect: function (evt, ui) {
						$.each(ui.addList, function (idx,Item) {
							if(idx === 0) {
								// let imgUrl = '/resource/asset/images/common/'+Item.rowData.IMG_GFILE_SEQ + '.png';
								let imgUrl = '/qimage/'+Item.rowData.IMG_GFILE_SEQ;
								$("#mapImgWrap").attr('src',imgUrl);
								$("#mapImgWrap").attr('alt',Item.rowData.IMG_GFILE_SEQ);
								$("#mapImgWrap").attr('data-value', Item.rowData.IMG_GFILE_SEQ);

								$("#mct_machine_form").find("#GFILE_SEQ").val(Item.rowData.IMG_GFILE_SEQ);
							}
						})
					},
					cellKeyDown: function (event, ui) {
						const rowIndx = ui.rowIndx;
						const sr = this.SelectRow();
						const selRowData = this.getRowData({rowIndx: rowIndx});
						let nextRowData = "";
						if (event.keyCode == $.ui.keyCode.DOWN) {
							sr.removeAll();
							sr.add({rowIndx: rowIndx + 1});
							nextRowData = this.getRowData({rowIndx: rowIndx +1});
						} else if (event.keyCode == $.ui.keyCode.UP) {
							sr.removeAll();
							sr.add({rowIndx: rowIndx - 1});
							nextRowData = this.getRowData({rowIndx: rowIndx -1});
						}
						let imgUrl = '/qimage/';
						imgUrl += (typeof nextRowData != 'undefined' && nextRowData != "")?nextRowData.IMG_GFILE_SEQ:selRowData.IMG_GFILE_SEQ;
						$("#mapImgWrap").attr('src',imgUrl);
						$("#mapImgWrap").attr('alt',selRowData.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('data-value', selRowData.IMG_GFILE_SEQ);
						$("#mct_machine_form").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
					},
					refresh : function (evt, ui) {
						data = mctMachineGrid.pqGrid('option', 'dataModel.data');
						var totalQty = 0;
						var totalTime = 0;
						for (var i = 0; i < data.length; i++) {
							var row = data[i];
							totalQty += parseInt(row.CONTROL_PART_QTY)
							if(typeof row.WORKING_TIME != 'undefined' && row.WORKING_TIME != '') {
								totalTime += parseInt(row.WORKING_TIME);
							}
						}

						var html = '<td>대기현황</td><td>' + data.length +' Rows  ' + totalQty + ' EA</td>';
						html += '<td>예상시간합계 : ' + timeFormat(totalTime) + '</td>';
						$("#popBtmGridHead").html(html);
					}
				};
				$mctMachineGrid = mctMachineGrid.pqGrid(mctMachineObj);
			},
			'hide.bs.modal': function () {
				if ($('#mct_machine_grid').pqGrid('instance')) {
					$mctMachineGrid.pqGrid('destroy');
				}
			}
		});
	});


</script>
</body>
</html>