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
					<option value="FCT010">진성정밀</option>
					<option value="FCT030">DMT</option>
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
		<input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
		<input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
	</form>
	<div id="popupWrap" class="popupWrap popupBackground in" style="display: none;">
		<!--팝업위치기준-->
		<div id="popupContainer" class="popupContainer">
			<!--팝업내용-->
			<div id="popup" class="popup">
				<h3><i class="xi-library-bookmark"></i>장비 가동 현황</h3>
				<div style="display: flex;padding: 10px;height: 94%;">
					<div style="width: 43%;margin-right: 2%;height: 100%;">
						<h4 style="text-align: left;">
							<i class="xi-tags mr-5"></i>가동장비 정보
						</h4>
						<table id="popHeadMid" class="popHeadMid popTable mt-10">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="10%">
								<tbody>
								<tr>
									<td class="th_color">장비번호</td>
									<td class="th_color">가동상태</td>
									<td class="th_color">장비종류</td>
									<td class="th_color">설치위치</td>
									<td class="th_color">I/F</td>
								</tr>
								<tr>
									<td class="EQUIP_NM"></td>
									<td class="EQUIP_STATUS"></td>
									<td class="EQUIP_TYPE_NM"></td>
									<td class="FACTORY_AREA_NM"></td>
									<td class="IF_USE_YN"></td>
								</tr>
							</tbody>
						</table>
						<h4 style="text-align: left;margin-top: 40px;">
							<i class="xi-tags mr-5"></i>작업수행 현황
						</h4>
						<table id="popHeadMid2" class="popHeadMid popTable mt-10">
							<colgroup>
								<col width="17%">
								<col width="10%">
								<col width="10%">
								<col width="33%">
								<col width="33%">
							</colgroup>
							<tbody>
								<tr>
									<td class="workStaffImg" rowspan="7">
										<div class="staffImgWrap">
											<img id="table2_worker_img" src="/resource/main/blank.jpg">
										</div>
										<p class="WORK_USER_NM mt-15"></p>
									</td>
									<td class="th_color" colspan="2">작업번호</td>
									<td class="text-red CONTROL_NUM" colspan="2"></td>
								</tr>
								<tr>
									<td class="th_color" colspan="2">도면번호</td>
									<td class="DRAWING_NUM machine_current_draw" colspan="2"></td>
								</tr>
								<tr>
									<td class="th_color">규격</td>
									<td class="th_color">형태</td>
									<td class="SIZE_TXT"></td>
									<td class="WORK_TYPE_NM"></td>
								</tr>
								<tr>
									<td class="th_color">소재종류</td>
									<td class="th_color">수량</td>
									<td class="MATERIAL_DETAIL_NM"></td>
									<td>
										<span class="text-red same_side_span" style="display: none;">대</span>
										<span class="QTY_FORMAT"></span>
									</td>
								</tr>
								<tr>
									<td class="th_color" colspan="2">작업수량</td>
									<td colspan="2">
										<span class="purple wd_50 d-inline-block radius">목표</span>
										<span class="wd_80 GOAL_QTY d-inline-block radius"></span>
										<span class="blue wd_50 d-inline-block radius">완료</span>
										<span class="wd_80 FINISH_QTY d-inline-block radius"></span>
										<span class="red wd_50 d-inline-block radius">불량</span>
										<span class="wd_80 ERROR_QTY d-inline-block radius"></span>
									</td>
								</tr>
								<tr>
									<td class="th_color" colspan="2">가공수행시간</td>
									<td colspan="2">
										<span class="green wd_50 d-inline-block radius">가동</span>
										<span class="wd_150 WORK_ACTIVE_TIME_FORMAT d-inline-block"></span>
										<span class="yellow wd_50 d-inline-block radius">비가동</span>
										<span class="wd_150 WORK_STOP_TIME_FORMAT d-inline-block"></span>
									</td>
								</tr>
								<tr>
									<td class="th_color" colspan="2">남은예상시간</td>
									<td class="LEFT_TIME_FORMAT" colspan="2"></td>
								</tr>
							</tbody>
						</table>
						<h4 style="text-align: left;margin-top: 20px;">
							<i class="xi-tags mr-5"></i>NC 수행 정보
						</h4>
						<table id="popHeadMid" class="popHeadMid popTable mt-15" >
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<tbody>
								<tr>
									<td class="th_color_green">Program No.</td>
									<td class="text-blue PROGRAM" colspan="3"></td>
								</tr>
								<tr>
									<td class="th_color_green">Running Time</td>
									<td class="text-blue WORK_ACTIVE_TIME_FORMAT"></td>
									<td class="th_color_green">Execution</td>
									<td class="EXECUTION"></td>
								</tr>
								<tr>
									<td class="th_color_green">1 Cycle Time</td>
									<td class="LATEST_CYCLE_TIME_FORMAT"></td>
									<td class="th_color_green">Cycle 완료수</td>
									<td class="COMPLETE_CYCLE_COUNT"></td>
								</tr>
								<tr>
									<td class="th_color_green">Message</td>
									<td colspan="3">
										<div class="MESSAGE ml-10" style="overflow-x: hidden;height: 30px;width: 500px;">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 55%;height: 100%;">
						<h4 style="text-align: left;">
							<i class="xi-tags mr-5"></i>도면정보
						</h4>
						<div class="d-flex mt-10" style="height: 68%;border: 1px solid gray;">
							<div class="mapImgWrap">
								<img id="mapImgWrap" src="/resource/main/blank.jpg" style="margin-right: 1%;">
							</div>
							<div style="width: 22%;">
								<table id="popHeadMid4" class="popHeadMid popTable" style="overflow: hidden;">
									<colgroup>
										<col width="100%">
									</colgroup>
									<tbody>
										<tr>
											<td class="th_color">작업번호</td>
										</tr>
										<tr>
											<td id="span_item_detail" class="bg-lightgray CONTROL_NUM" style="text-decoration: underline;cursor:pointer;"></td>
										</tr>
										<tr>
											<td class="th_color">규격/소재</td>
										</tr>
										<tr>
											<td class="bg-lightgray SIZE_MATERIAL"></td>
										</tr>
										<tr>
											<td class="th_color">수량/형태</td>
										</tr>
										<tr>
											<td class="bg-lightgray ">
												<span class="text-red same_side_span" style="display: none;">대</span>
												<span class="QTY_WORK_TYPE"></span>
											</td>
										</tr>
										<tr>
											<td class="th_color">가공납기</td>
										</tr>
										<tr>
											<td class="bg-lightgray INNER_DUE_DT"></td>
										</tr>
										<tr>
											<td class="th_color">진행상태</td>
										</tr>
										<tr>
											<td class="bg-lightgray PART_STATUS_NM"></td>
										</tr>
										<tr>
											<td class="th_color">현재위치</td>
										</tr>
										<tr>
											<td class="bg-lightgray CURR_POSITION"></td>
										</tr>
										<tr>
											<td class="th_color">비고</td>
										</tr>
										<tr>
											<td class="bg-lightgray" style="padding: 0;">
												<div class="CONTROL_NOTE" style="height: 30px;overflow-x: hidden;"></div>
											</td>
										</tr>
										<tr>
											<td class="blue">예상가공시간(수동입력)</td>
										</tr>
										<tr>
											<td style="height: 38px;" class="bg-lightgray PLAN_WORKING_TIME_FORMAT">
<%--												<input type="text" style="width: 90%;height: 100%;border: none;">--%>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<h4 class="mt-20">
							<i class="xi-tags mr-5"></i>가공계획
							<div class="right_float">
								<span id="total_cnt_qty" class="mr-10">0 품 0 EA</span>
								<span id="total_plan_time" class="mr-20">(0h 0m)</span>
								<button id="machineMctDetailBtn" type="button" class="defaultBtn green">도면상세보기</button>
							</div>
						</h4>
						<div class="planImgDiv mt-10">
						</div>
					</div>
				</div>
				<button id="detailCloseBtn" class="detailCloseBtn" style="position:absolute;left: 44%;">닫기</button>
			</div>
			<!--팝업내용끝-->
		</div>
		<!--팝업위치기준-->
	</div>

	<!-- 주문상세정보 layer popup : S -->
	<div class="popup_container g_item_detail_pop" id="g_item_detail_pop" style="display: none;">
		<div class="layerPopup">
			<h3>작업상세정보</h3>
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
		<input type="hidden" id="FACTORY_AREA" name="FACTORY_AREA" value="">
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
					callback.add(callFunction);
					callback.fire(data, callFunctionParam);
				} else {
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
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
					callback.add(callFunction);
					callback.fire(data, callFunctionParam);
				} else {
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
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

	function makeTimeStr(time) {
		let hours = 0;
		let minutes = 0;

		if(time > 0) {
			hours = Math.floor(time / 3600);
			minutes = Math.floor((time % 3600)/60);
		}
		return hours + "h " + minutes +"m ";
	}

	function makeTimeMin(time) {
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
		{title: '등급', dataType: 'string', dataIndx: 'Q_INSPECT_GRADE_NOTE', width: 95},
		{title: '불량코드', dataType: 'string', dataIndx: 'Q_INSPECT_RESULT_NM', width: 95},
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
				let stockText = "";
				if(!fnIsEmpty(dataInfo.OUT_REQUEST_SEQ)) {
					stockText = dataInfo.INSIDE_STOCK_NUM + " (요:" + dataInfo.REQUEST_QTY + ", 충:" + dataInfo.OUT_QTY + ")";
				}
				$itemDetailPopForm.find("#INSIDE_STOCK").html(stockText);
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

				if (fnIsEmpty(dataInfo.IMG_GFILE_SEQ)) {
					$("#ITEM_DRAWING_VIEW").attr('onClick', 'fnAlert(null, "도면파일이 없습니다.");');
				} else {
					$("#ITEM_DRAWING_VIEW").attr('onClick', 'callWindowImageViewer(' + dataInfo.IMG_GFILE_SEQ + ');');
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

	$("#span_item_detail").on('click',function() {
		let controlSeq = $("#mct_machine_form").find("#CONTROL_SEQ").val();
		let controlDetailSeq = $("#mct_machine_form").find("#CONTROL_DETAIL_SEQ").val();
		g_item_detail_pop_view(controlSeq, controlDetailSeq);
	});

	$(function () {

		$("#changeScreen").change(function(){
			if($("#changeScreen").val().toUpperCase() == "FCT030"){
				$("#contents01, #contents02").hide();
				$("#contents03").show();
			}else{
				$("#contents01, #contents02").show();
				$("#contents03").hide();
			}
			$("#mct_main_form").find("#FACTORY_AREA").val($("#changeScreen").val().toUpperCase());
			getReLoadTableData();
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
						}
						$.each(Item,function (idx2,Item2) {
							var html = '';
							if(Item2.EQUIP_NM == 'BLANK') {
								html = '<div class="mctInfo_'+idx2+' blank"></div>';
							}else {
								html = '<div id="EQUIP_'+ Item2.EQUIP_SEQ + '" class="mctInfo_'+idx2+' mct'+Item2.WORK_STATUS +'" data-seq="'+Item2.EQUIP_SEQ+'">';
								html += '<div class="mctInfoWrap">';
								html += '	<span class="mctName '+ Item2.WORK_STATUS + '">' + Item2.EQUIP_NM;
								if(Item2.IF_USE_YN == 'Y') {
									html += '<p class="text-blue">(I/F)</p>';
								}else {
									html += '<p class="text-indigo">(Manual)</p>';
								}
								html += '	</span>';
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
								html += '	</div>';
								html += '</div>';
								html += '<div class="mctInfoTopRight">';
								html += '	<div class="mctMapImg">';
								if(Item2.WORK_PLAN_TYPE == 1 && typeof Item2.IMG_GFILE_SEQ != 'undefined') {
									html += '		<img src="/qsimage/'+Item2.IMG_GFILE_SEQ +'" alt="도면">';
								}else {
									html += '		<img src="/resource/asset/images/tv/img_thumb_3.png" class="machineImg" alt="도면">';
								}
								let activeTime = Number(Item2.WORK_ACTIVE_TIME);
								if(Item2.WORK_STATUS == 'login') {
									activeTime += Number(Item2.CURRENT_STATUS_TIME);
								}
								html += '		<div class="mctMapTime">';
								html += '			<span>진행 : ' + makeTimeStr(activeTime) + '</span><br>예상 : ' + ((typeof Item2.PLAN_WORKING_TIME_FORMAT != 'undefined')?Item2.PLAN_WORKING_TIME_FORMAT:'');
								html += '		</div>';
								if(Item2.WORK_STATUS == 'pause') {
									html += '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									html += '<span>' + makeTimeStr(Item2.CURRENT_STATUS_TIME) + '</span>';
									html += '</div>';
								}
								html += '		<span class="progressPercent mctProgressPercent">'+ ((typeof Item2.PERCENT != 'undefined')?Item2.PERCENT:'') + '</span>';
								html += '	</div>';
								html += '</div>';
								html += '<div class="mctMapBtmInfo '+ Item2.WORK_STATUS + '">';
								html +=  ((typeof Item2.CUR_TEXT != 'undefined')?Item2.CUR_TEXT:'') + '&nbsp;' + ((typeof Item2.CONTROL_PART_INFO != 'undefined')?Item2.CONTROL_PART_INFO:'');
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
									let activeTime = Number(Item.WORK_ACTIVE_TIME);
									if(Item.WORK_STATUS == 'pause') {
										$("#EQUIP_"+ Item.EQUIP_SEQ).find(".pauseTime").find("span").text(makeTimeStr(Item.CURRENT_STATUS_TIME));
									}
									if(Item.WORK_STATUS == 'login') {
										activeTime += Number(Item.CURRENT_STATUS_TIME);
									}
									$("#EQUIP_"+ Item.EQUIP_SEQ).find(".mctMapTime").find("span").text('진행 : ' + makeTimeStr(activeTime));
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
			}
		};

		let getReLoadTableData = function () {
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
					createGrid1();	// 불량/반품

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
		let getReLoadDrawingData = function (equipSeq) {
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
								$target.find(".mctMapImg").find("img").attr("src","/qsimage/" + Item.IMG_GFILE_SEQ);
							}else {
								if(!$target.find(".mctMapImg").find("img").hasClass('machineImg')) {
									$target.find(".mctMapImg").find("img").addClass('machineImg');
								}
								$target.find(".mctMapImg").find("img").attr("src","/resource/asset/images/tv/img_thumb_3.png");
							}
							let activeTime = Number(Item.WORK_ACTIVE_TIME);
							if(Item.WORK_STATUS == 'login') {
								activeTime += Number(Item.CURRENT_STATUS_TIME);
							}

							var html = "<span> 진행 : " + makeTimeStr(activeTime) + "</span><br>예상 : " +  ((typeof Item.PLAN_WORKING_TIME_FORMAT != 'undefined')?Item.PLAN_WORKING_TIME_FORMAT:'');
							$target.find(".mctMapTime").html(html);

							if(Item.WORK_STATUS == 'pause') {
								if($target.find(".pauseTime").length > 0) {
									html = "일시중지<br>";
									html += "<span>" + makeTimeStr(Item.CURRENT_STATUS_TIME) + "</span>";
									$target.find(".pauseTime").html(html)
								}else {
									html = '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									html += '<span>' + makeTimeStr(Item.CURRENT_STATUS_TIME) + '</span>';
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

		let getReLoadDrawingDataForIF = function (list) {
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
								$target.find(".mctMapImg").find("img").attr("src","/qsimage/" + Item.IMG_GFILE_SEQ);
							}else {
								if(!$target.find(".mctMapImg").find("img").hasClass('machineImg')) {
									$target.find(".mctMapImg").find("img").addClass('machineImg');
								}
								$target.find(".mctMapImg").find("img").attr("src","/resource/asset/images/tv/img_thumb_3.png");
							}
							let activeTime = Number(Item.WORK_ACTIVE_TIME);
							if(Item.WORK_STATUS == 'login') {
								activeTime += Number(Item.CURRENT_STATUS_TIME);
							}

							var html = "<span> 진행 : " + makeTimeStr(activeTime) + "</span><br>예상 : " +  ((typeof Item.PLAN_WORKING_TIME_FORMAT != 'undefined')?Item.PLAN_WORKING_TIME_FORMAT:'');
							$target.find(".mctMapTime").html(html);

							if(Item.WORK_STATUS == 'pause') {
								if($target.find(".pauseTime").length > 0) {
									html = "일시중지<br>";
									html += "<span>" + makeTimeStr(Item.CURRENT_STATUS_TIME) + "</span>";
									$target.find(".pauseTime").html(html)
								}else {
									html = '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									html += '<span>' + makeTimeStr(Item.CURRENT_STATUS_TIME) + '</span>';
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

		$("#mct_main_form").find("#FACTORY_AREA").val($("#changeScreen").val().toUpperCase());

		let mctMainGrid = $("#mct_main_grid");
		let $mctMainGrid;
		let mctMainColModel = [
			{title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
			{title: 'CONTROL_DETAIL_SEQ', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
			{title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
			{title: 'RANK', dataIndx: 'RANK', hidden: true},
			{title: '구분', minWidth: 30, maxWidth: 80, width: 30, dataIndx: 'TITLE', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
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
			{title: '납기', minWidth: 40, maxWidth: 115, width: 40, dataIndx: 'INNER_DUE_DT', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'}},
			{title: '작업번호', align: 'center', minWidth: 135, maxWidth: 330, width: 135, dataIndx: 'CONTROL_PART_INFO', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
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
						g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
						// callWindowImageViewer(rowData.IMG_GFILE_SEQ);
					});
				}
			},
			{title: '수량', minWidth: 35, maxWidth: 80, width: 35, dataIndx: 'CONTROL_PART_QTY', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'}},
			{title: '위치',minWidth: 70, maxWidth: 190, width: 70, dataIndx: 'CURR_POS', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'}}
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
			$mctMainGrid.pqGrid("option", "dataModel.postData", function(ui){
				return fnFormToJsonArrayData('mct_main_form');
			} );
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
					getReLoadDrawingData(messageData.equipSeq);
				});
				stompClient.subscribe('/topic/worker', function (notificationMessage) { // 드로잉 보드 로그인, 로그아웃
					let messageData = JSON.parse(notificationMessage.body);
					workerMessageProcess(messageData);
				});
				stompClient.subscribe('/topic/notice', function (notificationMessage) { // 장비if
					let messageData = JSON.parse(notificationMessage.body);
					if(messageData.list.length > 0) {
						getReLoadDrawingDataForIF(messageData.list)
					}
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
			let selVal = 1;// 분
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
		function settingOngoingInfo(equipSeq) {
			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectMctOngoingInfoForDetailPop',
					'EQUIP_SEQ':equipSeq
				}
			};
			fnPostAjax(function (data) {
				if(data.info != null) {
					$(".same_side_span").hide();
					$("#mct_machine_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
					$("#mct_machine_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
					for(let key in data.info){
						let val = data.info[key];
						if(key == 'SAME_SIDE_YN' && val == 'Y') {
							$(".same_side_span").show();
						}else if(key == "PHOTO_GFILE_SEQ") {
							$("#popup").find("#table2_worker_img").attr('src', '/image/' + val);
						}else if(key == 'EQUIP_STATUS') {
							$("#popup").find("."+key).removeClass("green");
							$("#popup").find("."+key).removeClass("yellow");
							if(val == 'Active') {
								$("#popup").find("."+key).addClass("green");
							}else if(val == 'Stop') {
								$("#popup").find("."+key).addClass("yellow");
							}
						}
						$("#popup").find("."+key).text(val);
					}
					if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
						$("#mapImgWrap").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('alt', data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('data-value', data.info.IMG_GFILE_SEQ);
						$("#mct_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
					}else {
						$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
						$("#mct_machine_form").find("#GFILE_SEQ").val('');
					}
				}else {
					$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
					$("#mct_machine_form").find("#GFILE_SEQ").val('');
				}
			}, parameter2, '');
		}

		function settingRightTable(data) {
			if(data.info != null) {
				$("#mct_machine_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
				$("#mct_machine_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
				$("#popHeadMid4").find(".same_side_span").hide();
				for(let key in data.info){
					let val = data.info[key];
					if(key == 'SAME_SIDE_YN' && val == 'Y') {
						$("#popHeadMid4").find(".same_side_span").show();
					}
					$("#popHeadMid4").find("."+key).text(val);
				}
				if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
					$("#mapImgWrap").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
					$("#mapImgWrap").attr('alt', data.info.IMG_GFILE_SEQ);
					$("#mapImgWrap").attr('data-value', data.info.IMG_GFILE_SEQ);
					$("#mct_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
				}else {
					$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
					$("#mct_machine_form").find("#GFILE_SEQ").val('');
				}
			}
		}

		$(document).on("click",".mctlogin,.mctpause",function(event){
			var equipSeq = $(this).data('seq');
			$("#mct_machine_form").find("#EQUIP_SEQ").val(equipSeq);
			settingOngoingInfo(equipSeq);

			$('#popupWrap').modal('show');
		});

		$(document).on("click",".machine_plan_draw",function(e){
			$(".machine_plan_draw").removeClass("bg_mct_green");
			$(this).addClass("bg_mct_green");

			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectMctPlanListForDetailPop',
					'EQUIP_SEQ':$("#mct_machine_form").find("#EQUIP_SEQ").val(),
					'MCT_PLAN_SEQ':$(this).data('value')
				}
			};
			fnPostAjax(function (data) {
				settingRightTable(data);
			}, parameter2, '');
		})

		$(document).on("click",".machine_current_draw",function(e){
			$(".machine_plan_draw").removeClass("bg_mct_green");
			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectMctOngoingInfoForDetailPop',
					'EQUIP_SEQ':$("#mct_machine_form").find("#EQUIP_SEQ").val()
				}
			};
			fnPostAjax(function (data) {
				settingRightTable(data);
			}, parameter2, '');
		});

		$('#popupWrap').on({
			'show.bs.modal': function () {
				const parameter2 = {'url': '/tv/json-list', 'data': {
						'queryId':'tvMapper.selectMctPlanListForDetailPop',
						'EQUIP_SEQ':$("#mct_machine_form").find("#EQUIP_SEQ").val()
					}
				};
				fnPostAjax(function (data) {
					$(".planImgDiv").empty();
					let totalQty = 0;
					let totalTime = 0;
					if(data.list.length > 0) {
						$.each(data.list, function (idx, Item) {
							totalQty += Number(Item.SUM_QTY);
							totalTime += Number(Item.PLAN_WORKING_TIME);
							let html = '<div class="mctInfoWrap machine_plan_draw" data-value="'+Item.MCT_PLAN_SEQ+'">';
							html += '		<div class="mctMapImg">';
							html += '			<img src="/qsimage/'+ Item.IMG_GFILE_SEQ+'">';
							html += '			<div class="mctMapTime">';
							html += '				<span class="text-red left_float">'+Item.INNER_DUE_DT +'</span>'
							html += '				<span class="text-blue right_float">'+ Item.PLAN_WORKING_TIME_FORMAT +'</span>'
							html += '			</div>'
							html += '			<p>'+ Item.WORK_TYPE_MATERIAL + '</p>'
							html += '			<p>'+ Item.QTY + '</p>'
							html += '		</div>'
							html += '</div>'

							$(".planImgDiv").append(html);
						});
					}else {
						$(".planImgDiv").append('<div style="text-align: center;margin-top: 7%;">No Data</div>');
					}
					$("#total_cnt_qty").text(data.list.length + " 품 " + totalQty + " EA");
					$("#total_plan_time").text("( "+ makeTimeMin(totalTime) + " )");
				}, parameter2, '');
			},
			'hide.bs.modal': function () {
			}
		});
	});


</script>
</body>
</html>