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
	<title>J-MES POP(Point Of Production)</title>
	<!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
	<link rel="shortcut icon" href="/favicon.ico">
	<!-- Chrome, Safari, IE -->
	<link rel="stylesheet" type="text/css" href="/resource/pop/XEIcon/xeicon.min.css">
	<link rel="stylesheet" href="/resource/pop/css/index2.css">
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />
	<link rel="icon" href="/favicon.ico">
	<!-- alertify -->
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />

	<link rel="stylesheet" type="text/css" href="/resource/plugins/animate-css/animate.css" />

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
	<style type="text/css">
		*{margin: 0; padding: 0; box-sizing: border-box;}
		a{text-decoration: none; color: black;}
		ul,dl,ol { list-style: none;}
		div.pq-grid * {font-size: 1.4rem;}
		.pq-grid-header-table>.pq-grid-row>.pq-grid-number-cell {background: #d8edf0;}

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

	</style>
</head>

<body>
<section id="containerWrap" class="containerWrap">
	<div id="leftContainer" class="leftContainer">
		<h1 id="mctTitle" class="mctTitle"><i class="xi-bookmark"></i>Point Of Production</h1>
		<!--첫번째 줄 시작-->
		<div id="contents01" class="contents01">
			<!--대형 MCT 시작-->
			<div id="mctBig contentsWrap" class="mctBig contentsWrap">
				<!--네임 태그-->
				<div class="titleTag">대형 MCT</div>
				<!--진행,대기 상황-->
				<div class="progressTag">
					<span id="ARE02_WORK" class="progress"><span>진행</span></span>
					<span id="ARE02_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--대형 MCT 내용 시작-->
				<div id="ARE02" class="infoWrap">
				</div>
				<!--대형 MCT 내용 끝-->
			</div>
			<!--대형 MCT 끝-->


			<!--소형 MCT1 시작-->
			<div id="contentsWrap" class="mctSmall contentsWrap">
				<!--네임 태그-->
				<div class="titleTag">소형 MCT</div>
				<!--진행,대기 상황-->
				<div class="progressTag">
					<span id="ARE01_WORK" class="progress"><span>진행</span></span>
					<span id="ARE01_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--소형 MCT1 내용 시작-->
				<div id="ARE01" class="infoWrap">
				</div>
				<!--소형 MCT1 내용 끝-->
			</div>
			<!--소형 MCT1 끝-->
		</div>
		<!--첫번째 줄 끝-->

		<!--두번째 줄 시작-->
		<div id="contents02" class="contents02">

			<!--밀링 -->
			<div id="milling contentsWrap" class="milling contentsWrap">
				<!--네임 태그-->
				<div id="titleTag" class="titleTag">밀링</div>
				<!--진행,대기 상황-->
				<div class="progressTag">
					<span id="ARE03_WORK" class="progress"><span>진행</span></span>
					<span id="ARE03_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--밀링 내용 시작-->
				<div id="ARE03" class="infoWrap">
				</div>
				<!--밀링 내용 끝-->
			</div>
			<!--밀링 끝-->
			<!--선반/연마 -->
			<div id="grind contentsWrap" class="grind contentsWrap">
				<!--네임 태그-->
				<div id="titleTag" class="titleTag">선반/연마</div>
				<!--진행,대기 상황-->
				<div class="progressTag">
					<span id="ARE04_WORK" class="progress"><span>진행</span></span>
					<span id="ARE04_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--선반/연마 내용 시작-->
				<div id="ARE04" class="infoWrap">
				</div>
				<!--선반/연마 내용 끝-->
			</div>
			<!--선반/연마 끝-->

		</div>
		<!--두번째 줄 끝-->

		<!--세번째 줄 시작-->
		<div id="contents03" class="contents03">
			<!--정밀 mct-->
			<div id="mctDetail contentsWrap" class="mctDetail contentsWrap">
				<!--네임 태그-->
				<div id="titleTag" class="titleTag">정밀 MCT</div>
				<!--진행,대기 상황-->
				<div class="progressTag">
					<span id="ARE11_WORK" class="progress"><span>진행</span></span>
					<span id="ARE11_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--정밀 MCT 내용 시작-->
				<div id="ARE11" class="infoWrap">
				</div>
				<!--정밀 MCT 내용 끝-->
			</div>
			<!--정밀 mct 끝-->

			<!--알람 시작-->
			<div id="alarmWrap" class="alarmWrap">
				<h3>Event Alarm</h3>
				<div id="alarm_list" class="alarm">
				</div>
			</div>
			<!--알람 끝-->

			<!--DMT 시작-->
			<div id="dmt contentsWrap" class="dmt contentsWrap">
				<!--네임 태그-->
				<div id="titleTag" class="titleTag">DMT</div>
				<!--진행,대기 상황-->
				<div id="progressTag" class="progressTag">
					<span id="ARE06_WORK" class="progress"><span>진행</span></span>
					<span id="ARE06_WAIT" class="standby"><span>대기</span></span>
				</div>

				<!--DMT 내용 시작-->
				<div id="ARE06" class="infoWrap">

				</div>
				<!--DMT 내용 끝-->
			</div>
			<!--DMT 끝-->

		</div>
		<!--세번째 줄 끝-->
	</div>

	<!--오른쪽 섹션 시작-->
	<div id="rightContainer" class="rightContainer">
		<div id="changeBtnWrap" class="changeBtnWrap">
			<div id="changeBtn" class="changeBtn">
				<a href="/tv/mct">화면전환</a>
			</div>
		</div>

		<!--오른쪽 표 시작-->
		<div id="tableWrap" class="tableWrap">
			<table id="rightTable" class="rightTable">
				<tr id="tableTitle" class="tableTitle">
					<th colspan="3">진행현황</th>
				</tr>
				<tr>
					<th class="tableSubTitle1">소재대기</th>
					<td id="PRO004_CNT" class="pumm"></td>
					<td id="PRO004_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle2 tableSubTitle4">가공대기</th>
					<td id="PRO002_CNT" class="pumm"></td>
					<td id="PRO002_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle2">가공중</th>
					<td id="PRO007_CNT" class="pumm"></td>
					<td id="PRO007_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle2">가공완료</th>
					<td id="PRO009_CNT" class="pumm"></td>
					<td id="PRO009_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle1">표면/후가공</th>
					<td id="PRO01214_CNT" class="pumm"></td>
					<td id="PRO01214_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle1">출하대기</th>
					<td id="PRO01315_CNT" class="pumm"></td>
					<td id="PRO01315_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle3">반품</th>
					<td id="RETURN_CNT" class="pumm"></td>
					<td id="RETURN_QTY" class="amount"></td>
				</tr>
				<tr>
					<th class="tableSubTitle3">보류</th>
					<td id="PENDING_CNT" class="pumm"></td>
					<td id="PENDING_QTY" class="amount"></td>
				</tr>
			</table>
		</div>
		<!--오른쪽 표 끝-->

		<!--JST-->
		<div id="jst contentsWrap" class="jst contentsWrap">
			<!--네임 태그-->
			<div id="titleTag" class="titleTag">JST</div>
			<!--진행,대기 상황-->
			<div class="progressTag">
				<span id="ARE05_WORK" class="progress"><span>진행</span></span>
				<span id="ARE05_WAIT" class="standby"><span>대기</span></span>
			</div>

			<!--JST 내용 시작-->
			<div id="ARE05" class="infoWrap">

			</div>
			<!--JST 내용 끝-->

		</div>
		<!--JST끝-->

		<!--POP-->
		<div id="pop contentsWrap" class="pop contentsWrap">
			<!--네임 태그-->
			<div id="titleTag" class="titleTag">POP</div>

			<!--POP 내용 시작-->
			<div id="infoWrap" class="infoWrap">
				<!--사상 시작-->
				<div id="infoRight1" data-seq="POP050" class="infoRight1">
					<h3>사상</h3>
					<div id="POP050" class="infoSection1">
						0품<br>0EA
					</div>
				</div>
				<!--사상 끝-->

				<!--검사실 시작-->
				<div id="infoRight2" data-seq="POP100" class="infoRight2">
					<h3>검사실</h3>
					<div id="POP100" class="infoSection2">
						0품<br>0EA
					</div>
				</div>
				<!--검사실 끝-->

				<!--바이브레이터실 시작-->
				<div id="infoRight3" data-seq="POP140" class="infoRight3">
					<h3>바이브레이터실</h3>
					<div id="POP140" class="infoSection3">
						0품<br>0EA
					</div>
				</div>
				<!--바이브레이터실 끝-->

				<!--교정/마감실 시작-->
				<div id="infoRight4" data-seq="POP130" class="infoRight4">
					<h3>교정/마감실</h3>
					<div id="POP130" class="infoSection4">
						0품<br>0EA
					</div>
				</div>
				<!--교정/마감실 끝-->

				<!--출하대기장1 시작-->
				<div id="infoRight5" data-seq="POP110" class="infoRight5">
					<h3>출하대기장1</h3>
					<div id="POP110" class="infoSection5">
						0품<br>0EA
					</div>
				</div>
				<!--출하대기장1 끝-->

				<!--출하대기장2 시작-->
				<div id="infoRight6" data-seq="POP120" class="infoRight6">
					<h3>출하대기장2</h3>
					<div id="POP120" class="infoSection6">
						0품<br>0EA
					</div>
				</div>
				<!--출하대기장2 끝-->

			</div>
			<!--POP 내용 끝-->

		</div>
		<!--POP끝-->

		<!--오른쪽 섹션 끝-->
</section>

<form class="form-inline" id="pop_machine_form" name="pop_machine_form" role="form" onsubmit="return false;">
	<input type="hidden" id="queryId" name="queryId" value="machine.selectPlanListForDetailPop">
	<input type="hidden" id="EQUIP_SEQ" name="EQUIP_SEQ" value="">
	<input type="hidden" id="MCT_WORK_SEQ" name="MCT_WORK_SEQ" value="">
	<input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
	<input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="">
	<input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="">
</form>

<div id="machinePopupWrap" class="popupWrap popupBackground in" style="display: none;">
	<!--팝업위치기준-->
	<div id="popupContainer" class="popupContainer">
		<!--팝업내용-->
		<div id="popup" class="popup">
			<h3><i class="xi-library-bookmark"></i>장비 가동 현황</h3>
			<div style="display: flex;padding: 20px;height: 94%;">
				<div style="width: 43%;margin-right: 2%;height: 100%;">
					<h4>
						<i class="xi-tags mr-10"></i>가동장비 정보
					</h4>
					<table id="popHeadMid" class="popHeadMid popTable mt-10">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<td class="th_color">장비번호</td>
								<td class="th_color">가동상태</td>
								<td class="th_color">장비종류</td>
								<td class="th_color">설치위치</td>
							</tr>
							<tr>
								<td class="EQUIP_NM"></td>
								<td class="EQUIP_STATUS"></td>
								<td class="EQUIP_TYPE_NM"></td>
								<td class="FACTORY_AREA_NM"></td>
							</tr>
						</tbody>
					</table>
					<h4 class="mt-60">
						<i class="xi-tags mr-10"></i>작업수행 현황
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
									<span class="purple d-inline-block radius" style="width: 10%;">목표</span>
									<span class="GOAL_QTY d-inline-block radius" style="width: 20%;"></span>
									<span class="blue d-inline-block radius" style="width: 10%;">완료</span>
									<span class="FINISH_QTY d-inline-block radius" style="width: 20%;"></span>
									<span class="red d-inline-block radius" style="width: 10%;">불량</span>
									<span class="ERROR_QTY d-inline-block radius" style="width: 20%;"></span>
								</td>
							</tr>
							<tr>
								<td class="th_color" colspan="2">가공수행시간</td>
								<td colspan="2">
									<span class="green d-inline-block radius" style="width: 12%;">가동</span>
									<span class="WORK_ACTIVE_TIME_FORMAT d-inline-block" style="width: 34%;"></span>
									<span class="yellow d-inline-block radius" style="width: 12%;">비가동</span>
									<span class="WORK_STOP_TIME_FORMAT d-inline-block" style="width: 34%;"></span>
								</td>
							</tr>
							<tr>
								<td class="th_color" colspan="2">남은예상시간</td>
								<td class="LEFT_TIME_FORMAT" colspan="2"></td>
							</tr>
						</tbody>
					</table>
					<h4 class="mt-30">
						<i class="xi-tags mr-10"></i>NC 수행 정보
					</h4>
					<table id="popHeadMid" class="popHeadMid popTable mt-15">
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
								<td class="MESSAGE" colspan="3"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="width: 55%;height: 100%;">
					<h4>
						<i class="xi-tags mr-10"></i>도면정보
					</h4>
					<div class="d-flex" style="margin-top: 11px;height: 67%;border: 1px solid gray;">
						<div class="mapImgWrap">
							<img id="mapImgWrap" src="/qimage/739396" alt="513045" data-value="513045" style="margin-right: 1%;">
						</div>
						<div style="width: 22%;">
							<table id="popHeadMid4" class="popHeadMid popTable" style="">
								<colgroup>
									<col width="100%">
								</colgroup>
								<tbody>
									<tr>
										<td class="th_color">작업번호</td>
									</tr>
									<tr>
										<td id="span_item_detail" class="bg-lightgray CONTROL_NUM"></td>
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
										<td style="height: 60px;" class="bg-lightgray PLAN_WORKING_TIME_FORMAT">현재위치</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<h4 class="mt-30">
						<i class="xi-tags mr-10"></i>가공계획
						<div class="right_float">
							<span id="total_cnt_qty" class="mr-10">0 품 0 EA</span>
							<span id="total_plan_time" class="mr-20">(0h 0m)</span>
							<button type="button" class="popMapDetailBtn green" style="margin: 0;">도면상세보기</button>
						</div>
					</h4>
					<div class="planImgDiv mt-15">
					</div>
				</div>
			</div>
			<button id="machinePopCloseBtn" class="detailCloseBtn">닫기</button>
		</div>
		<!--팝업내용끝-->
	</div>
	<!--팝업위치기준-->
</div>

<form class="form-inline" id="pop_search_form" name="pop_search_form" role="form" onsubmit="return false;">
	<input type="hidden" id="queryId" name="queryId" value="tvMapper.selectTvPopList">
	<input type="hidden" id="POP_POSITION" name="POP_POSITION" value="">
	<input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
</form>
<!--pop 팝업 시작-->
<div id="popPopupWrap" class="popPopupWrap popupBackground" style="display:none;">
	<div id="popPopupContainer" class="popupContainer">
		<div id="popPopup" class="popPopup">
			<h3><i class="xi-library-bookmark"></i>POP 상세 조회</h3>
			<div id="popRightTop" class="popRightTop">
				<span>조회대상 : </span>
				<span id="popSearchType"></span>
				<span id="popSearchCnt" style="text-align: right;"></span>
			</div>
			<div id="popSectionWrap" class="popSectionWrap">
				<div id="popSectionLeft" class="popSectionLeft">
					<div class="popMap">
						<img id="popMapImg" src="/resource/main/blank.jpg" alt="도면">
					</div>
				</div>
				<div id="popSectionRight" class="popSectionRight">
					<div id="popPopGrid" class="popRightTable">
						<!--표 삽입-->
					</div>
				</div>
			</div>
			<button id="popMapDetailBtn" class="popMapDetailBtn">도면상세보기</button>
			<button id="popPopCloseBtn" class="detailCloseBtn">닫기</button>
			<!--버튼 끝-->
		</div>
	</div>
</div>
<!--pop 팝업 끝-->

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
							</tr>
							<tr>
								<th>규격</th>
								<td id="SIZE_TXT"></td>
								<th class="lightGreen">발주처</th>
								<td id="ORDER_COMP_NM"></td>
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

<script>
	$("#machinePopupWrap").on("click",function(e){
		if($(e.target).hasClass('popupContainer')) {
			$("#machinePopupWrap").modal('hide');
		}
	});
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
				if (textStatus !== 'success' || data == null) {
					fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
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
				fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
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
				fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
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

	function makeTimeStr(time) {
		let hours = 0;
		let minutes = 0;

		if(time > 0) {
			hours = Math.floor(time / 3600);
			minutes = Math.floor((time % 3600)/60);
		}
		return hours + "h " + minutes +"m ";
	}

	let windowImageViewer;
	let machineListData;
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
							if (cellData == cellDataPrev) {
								rc++;
							}
						} else if (rc > 1) {
							mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
							rc = 1;
						}
					} else if (partList.includes(dataIndx)) {
						let cellData = data[j][dataIndx],
								cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

						if (controlNum === controlNumPrev) {
							if (cellData == cellDataPrev) {
								rc++;
							}
						} else if (rc > 1) {
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

		let getInitData = function () {
			const parameter = {'url': '/tv/pop/data', 'data': {}};
			fnPostAjax(function (data) {
				// console.log('getInitData',data);
				let pop_list1 = data.pop_list1;//pop
				let pop_list2 = data.pop_list2;//진행현황
				let m_list = data.m_list;//장비

				if (pop_list1 != '') {//pop
					for (let i = 0; i < pop_list1.length; i++) {
						let pop_position = pop_list1[i].POP_POSITION;
						let total_cnt = pop_list1[i].TOTAL_CNT;
						let total_qty = pop_list1[i].TOTAL_QTY;

						setPopData(pop_position, total_cnt, total_qty);
					}
				}
				if (pop_list2 != '') {//진행현황 (소재대기, 가공대기, 가공중, 가공완료, 표면/후가공)
					setStatusData(pop_list2);
				}

				if (m_list != '') {//장비
					// console.log('m_list',m_list);
					m_list.splice(9,0,{BLANK:'Y', FACTORY_AREA:'ARE01'});
					for (let i = 0; i < m_list.length; i++) {
						if(m_list[i].BLANK == 'Y') {
							$("#"+m_list[i].FACTORY_AREA).append('<div class="info_" style="background: none;"></div>');
						}else {
							let factory_area = m_list[i].FACTORY_AREA;
							let layout_sort = m_list[i].LAYOUT_SORT;
							let equip_nm = m_list[i].EQUIP_NM;
							let img_gfile_seq = m_list[i].IMG_GFILE_SEQ;
							let material_type = ((m_list[i].MATERIAL_TYPE_NM != undefined && m_list[i].MATERIAL_TYPE_NM != '') ?m_list[i].MATERIAL_TYPE_NM:'');
							let work_type_nm = ((m_list[i].WORK_TYPE_NM != undefined && m_list[i].WORK_TYPE_NM != '') ?m_list[i].WORK_TYPE_NM:'');
							let part_qty = ((m_list[i].PART_QTY != undefined && m_list[i].PART_QTY != '') ?m_list[i].PART_QTY:'');

							let user_nm = m_list[i].USER_NM;
							let user_photo_gfile_seq = m_list[i].USER_PHOTO_GFILE_SEQ;

							$("#"+factory_area + '_WORK').html('<span>진행</span> ' + m_list[i].WORK_TOTAL);
							$("#"+factory_area + '_WAIT').html('<span>대기</span> ' + m_list[i].WAIT_TOTAL);

							let $target = $("#" + factory_area);
							if($target.length > 0){
								let mHtml = '<div id="' + (factory_area + '_' + layout_sort) + '" class="info_0'+ i +' '+ m_list[i].WORK_STATUS + '" data-seq="'+m_list[i].EQUIP_SEQ +'">';
								mHtml += '<div class="nameWrap">';
								mHtml += '<p class="machineName">' + ((equip_nm != undefined)? equip_nm:'') + '</p>';
								mHtml += '<p class="staffName">' + ((user_nm != undefined)? user_nm:'') + '</p>';
								mHtml += '<p class="productName">'+ material_type+'&nbsp;'+work_type_nm+'&nbsp;'+part_qty + '</p>';
								mHtml += '</div>';

								if(img_gfile_seq != undefined && img_gfile_seq != '') {
									mHtml += '<div id="img_'+(factory_area + '_' + layout_sort)+'" class="backImg ' + m_list[i].MACHINE_ICON + '" style="background:url(/qsimage/' + img_gfile_seq + ');background-repeat:no-repeat;background-position:center;background-size: cover;">';
								}else {
									mHtml += '<div id="img_'+(factory_area + '_' + layout_sort)+'" class="backImg '+ m_list[i].MACHINE_ICON+'">';
								}

								mHtml += '<span class="progressPercent '+((m_list[i].WORK_STATUS == 'pause')?'pausePercent':'') + '">'+ ((m_list[i].PERCENT != undefined)?m_list[i].PERCENT:'') + '</span>';

								if(m_list[i].WORK_STATUS == 'pause') {
									mHtml += '<div id="pauseTime" class="pauseTime">';
									mHtml += '일시중지<br>';
									var startStopDt = new Date(m_list[i].WORK_TEMP_STOP_DT);
									var today = new Date();
									var diff = today - startStopDt;
									var minute = Math.floor((diff) / (1000 * 60));
									mHtml += '<span>('+minute +'\')</span>';
									mHtml += '</div>';
								}
								if(user_photo_gfile_seq != undefined && user_photo_gfile_seq != ''){
									mHtml += '<div class="staffImg">';
									mHtml += '<img src="/image/'+user_photo_gfile_seq +'" alt="직원사진">';
								}else {
									mHtml += '<div class="staffImg staffIcon">';
									mHtml += '<img src="/resource/pop/images/user.svg" alt="직원사진">';
								}
								mHtml += '</div>';
								if(m_list[i].WORKING_TIME != undefined && m_list[i].WORKING_TIME != '') {
									mHtml += '<div class="progressTime">';
									mHtml += '<span>'+ m_list[i].WORKING_TIME + '</span>';
									if(m_list[i].PLAN_WORKING_TIME != undefined && m_list[i].PLAN_WORKING_TIME != ''){
										mHtml += (' / ' + m_list[i].PLAN_WORKING_TIME)
									}
									mHtml += '</div>';
								}
								mHtml += '</div>';
								mHtml += '</div>';

								$target.append(mHtml);
							}
						}
					}
				}
			}, parameter, '');
		};

		let getWorkDrawingData = function () {
			const parameter = {'url': '/tv/pop/schedulerPopDrawingData', 'data': {}};

			fnPostAjax(function (data) {
				// console.log('getWorkDrawingData',data);
				let m_list = data.m_list;//장비
				let pop_list2 = data.pop_list2;//장비

				if (pop_list2 != '') {//진행현황 (소재대기, 가공대기, 가공중, 가공완료, 표면/후가공)
					for (let i = 0; i < pop_list2.length; i++) {
						let partStatus = pop_list2[i].PART_STATUS;
						$('#'+partStatus+'_CNT').html(pop_list2[i].TOTAL_CNT + ' 품')
						$('#'+partStatus+'_QTY').html(pop_list2[i].TOTAL_QTY + ' EA')

					}
				}

				if (m_list != '') {//장비
					for (let i = 0; i < m_list.length; i++) {
						let factory_area = m_list[i].FACTORY_AREA;
						let layout_sort = m_list[i].LAYOUT_SORT;
						let equip_nm = m_list[i].EQUIP_NM;
						let img_gfile_seq = m_list[i].IMG_GFILE_SEQ;
						let material_type = ((typeof m_list[i].MATERIAL_TYPE_NM != 'undefined') ?m_list[i].MATERIAL_TYPE_NM:'');
						let work_type_nm = ((typeof m_list[i].WORK_TYPE_NM != 'undefined') ?m_list[i].WORK_TYPE_NM:'');
						let part_qty = ((typeof m_list[i].PART_QTY != 'undefined') ?m_list[i].PART_QTY:'');

						let user_nm = m_list[i].USER_NM;
						let user_photo_gfile_seq = m_list[i].USER_PHOTO_GFILE_SEQ;

						$("#"+factory_area + '_WORK').html('<span>진행</span> ' + m_list[i].WORK_TOTAL);
						$("#"+factory_area + '_WAIT').html('<span>대기</span> ' + m_list[i].WAIT_TOTAL);

						let $target = $("#" + factory_area+"_"+layout_sort);
						if($target.length > 0){
							$target.removeClass("login")
							$target.removeClass("pause")

							$target.addClass(m_list[i].WORK_STATUS);

							$target.find(".machineName").text(((typeof equip_nm != 'undefined')? equip_nm:''));
							$target.find(".staffName").text(((typeof user_nm != 'undefined')? user_nm:''));
							$target.find(".productName").html(material_type+'&nbsp;'+work_type_nm+'&nbsp;'+part_qty);


							if(typeof img_gfile_seq != 'undefined') {
								$("#img_"+factory_area+"_"+layout_sort).css(
										{
											'background':'url(/qsimage/'+img_gfile_seq +')',
											'background-repeat':'no-repeat',
											'background-size':'cover',
											'background-position':'center'
										}
								);
							}else {
								$("#img_"+factory_area+"_"+layout_sort).css({'background':''});
								if(!$("#img_"+factory_area+"_"+layout_sort).hasClass(m_list[i].MACHINE_ICON)) {
									$("#img_"+factory_area+"_"+layout_sort).addClass(m_list[i].MACHINE_ICON);
								}
							}
							$target.find(".progressPercent").text(((m_list[i].PERCENT != undefined)?m_list[i].PERCENT:''));

							if(m_list[i].WORK_STATUS == 'pause') {
								if(!$target.find(".progressPercent").hasClass("pausePercent")) {
									$target.find(".progressPercent").addClass("pausePercent");
								}
								var startStopDt = new Date(m_list[i].WORK_TEMP_STOP_DT);
								var today = new Date();
								var diff = today - startStopDt;
								var minute = Math.floor((diff) / (1000 * 60));
								var html = '';
								if($target.find(".pauseTime").length > 0) {
									html = '일시중지<br>';
									html += '<span>(' + minute + '\')</span>';
									$target.find(".pauseTime").html(html)
								}else {
									html = '<div id="pauseTime" class="pauseTime">';
									html += '	일시중지<br>';
									html += '<span>(' + minute + '\')</span>';
									html += '</div>';
									$target.find(".progressPercent").after(html);
								}
							}else {
								$target.find(".progressPercent").removeClass("pausePercent");
								$target.find(".pauseTime").remove();
							}

							if(typeof user_photo_gfile_seq != 'undefined'){
								$target.find(".staffImg").removeClass("staffIcon");
								$target.find(".staffImg").find("img").attr("src","/image/"+user_photo_gfile_seq);
							}else {
								if(!$target.find(".staffImg").hasClass("staffIcon")) {
									$target.find(".staffImg").addClass("staffIcon");
								}
								$target.find(".staffImg").find("img").attr("src","/resource/pop/images/user.svg");
							}
							if(typeof m_list[i].WORKING_TIME != 'undefined' && m_list[i].WORKING_TIME != '') {
								var timeHtml = '';
								if($target.find(".progressTime").length > 0) {
									timeHtml = '<span>' + m_list[i].WORKING_TIME + '</span>';
									if(m_list[i].PLAN_WORKING_TIME != undefined && m_list[i].PLAN_WORKING_TIME != '') {
										timeHtml += ' / ' + m_list[i].PLAN_WORKING_TIME;
									}
									$target.find(".progressTime").html(timeHtml);
								}else {
									timeHtml = '<div class="progressTime">';
									timeHtml += '	<span>' + m_list[i].WORKING_TIME + '</span>';
									if(m_list[i].PLAN_WORKING_TIME != undefined && m_list[i].PLAN_WORKING_TIME != '') {
										timeHtml += ' / ' + m_list[i].PLAN_WORKING_TIME;
									}
									timeHtml += '</div>';
									$target.find(".staffImg").after(timeHtml);
								}
							}

						}
					}
				}
			}, parameter, '');
		};

		let getPopLocationData = function () {
			const parameter = {'url': '/tv/pop/popLocationData', 'data': {}};
			fnPostAjax(function (data) {
				let pop_list = data.pop_list; //pop

				if (pop_list != '') {//pop
					for (let i = 0; i < pop_list.length; i++) {
						let pop_position = pop_list[i].POP_POSITION;
						let total_cnt = pop_list[i].TOTAL_CNT;
						let total_qty = pop_list[i].TOTAL_QTY;

						setPopData(pop_position, total_cnt, total_qty);
					}
				}
			}, parameter, '');
		};

		let getStatusData = function () {
			const parameter = {'url': '/tv/pop/statusData', 'data': {}};
			fnPostAjax(function (data) {
				// console.log('getStatusData',data);
				if(data.pop_list2 != '') {
					setStatusData(data.pop_list2);
				}
			}, parameter, '');
		}

		let setPopData = function (popPosition, totalCnt, total_qty) {
			if (popPosition != "") {
				var html = totalCnt + '품<br>' + total_qty + 'EA';
				$("#" + popPosition).html(html);
			}
		};

		let setStatusData = function (list) {
			for (let i = 0; i < list.length; i++) {
				let partStatus = list[i].PART_STATUS;
				$('#'+partStatus+'_CNT').html(list[i].TOTAL_CNT + ' 품')
				$('#'+partStatus+'_QTY').html(list[i].TOTAL_QTY + ' EA')
			}
		}

		/** 일반 알람 처리 **/
		let alarmMessageProcess = function(messageData){
			let maxCnt = 9;
			if (messageData) {
				let messageKey = randomKey();
				let messBody = messageData.content03 + " : " + messageData.content02;
				// if(messageData.content04) messBody += "     (" + messageData.content04 + ")";
				if($(".alarmList").length > maxCnt) $(".alarmList").last().remove();
				let alarmMsg  = '<p id=' + messageKey + ' class="alarmList">';
				alarmMsg += messageData.content01;
				alarmMsg += messBody;
				alarmMsg += '</p>';
				alarmMsg += '<span id="new_'+messageKey + '">[New]</span>';
				// $("#alarm_list").prepend($(alarmMsg).fadeIn(2000));
				$("#alarm_list").prepend($(alarmMsg));

				setTimeout(function() {
					$("#new_" + messageKey).remove();
				}, 30000);
			}
		};

		/** POP 알람을 정보 실시간 처리 **/
		let popMessageProcess = function(messageData){
			alarmMessageProcess(messageData);

			getPopLocationData();
		};
		let getSectionCnt = function (equipSeq) {
			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectTvMachineList',
					'EQUIP_SEQ':equipSeq
				}
			};
			fnPostAjax(function (data) {
				$("#"+data.info.FACTORY_AREA + '_WORK').html('<span>진행</span> ' + data.info.WORK_TOTAL);
				$("#"+data.info.FACTORY_AREA + '_WAIT').html('<span>대기</span> ' + data.info.WAIT_TOTAL);
			}, parameter2, '');
		}

		/** DRAWING BOARD 정보 실시간 처리 **/
		let drawingMessageProcess = function(messageData){
			alarmMessageProcess(messageData);
			getStatusData();
			getSectionCnt(messageData.equipSeq);

			let actionType = messageData.actionType;
			let $target = $("#" + messageData.factoryArea + "_" + messageData.equipPosition);
			switch (actionType){
				case 'DB_CANCEL' :
				case 'DB_COMPLETE' :
					$target.find(".productName").html('');
					$target.find(".proNum").html('');
					$target.find(".progressTime").remove();
					$target.removeClass("login");
					$target.removeClass("pause");
					$("#img_"+messageData.factoryArea+"_"+messageData.equipPosition).css({'background':''});
					break;
				case 'DB_PAUSE' :
					$target.removeClass("login");
					$target.addClass("pause");
					if($target.find(".pauseTime").length <= 0) {
						var html = '<div id="pauseTime" class="pauseTime">';
						html += '일시중지<br>';
						html += '<span>(0\')</span>';
						html += '</div>';

						$target.find(".progressPercent").after(html);
					}
					break;
				case 'DB_START' :
					const parameter2 = {'url': '/tv/json-info', 'data': {
							'queryId':'tvMapper.selectTvMachineList',
							'EQUIP_SEQ':messageData.equipSeq
						}
					};
					fnPostAjax(function (data) {
						if(data.info.IMG_GFILE_SEQ != undefined && data.info.IMG_GFILE_SEQ != '') {
							$("#img_"+messageData.factoryArea + "_" + messageData.equipPosition).css({
								'background':'url(/qsimage/' + data.info.IMG_GFILE_SEQ + ')',
								'background-repeat':'no-repeat',
								'background-size':'cover',
								'background-position':'center'
							})
						}
						var pName = ((data.info.MATERIAL_TYPE_NM != undefined)?data.info.MATERIAL_TYPE_NM:'') + '&nbsp;';
						pName += ((data.info.WORK_TYPE_NM != undefined)?data.info.WORK_TYPE_NM:'') + '&nbsp;';
						pName += ((data.info.PART_QTY != undefined)?data.info.PART_QTY:'');
						$target.find(".productName").html(pName);

						if(data.info.WORKING_TIME != undefined && data.info.WORKING_TIME != '') {
							var html = '';
							if($target.find(".progressTime") > 0) {
								html = '<span>' + data.info.WORKING_TIME + '</span>';
								if(data.info.PLAN_WORKING_TIME != undefined && data.info.PLAN_WORKING_TIME != '') {
									html += ' / ' + data.info.PLAN_WORKING_TIME;
								}
								$target.find(".progressTime").html(html);
							}else {
								html = '<div class="progressTime">';
								html += '	<span>' + data.info.WORKING_TIME + '</span>';
								if(data.info.PLAN_WORKING_TIME != undefined && data.info.PLAN_WORKING_TIME != '') {
									html += ' / ' + data.info.PLAN_WORKING_TIME;
								}
								html += '</div>';
								$target.find(".staffImg").after(html);
							}
						}
						$target.addClass("login");
						$target.removeClass("pause");

					}, parameter2, '');
				case 'DB_RESTART' :
					$target.addClass("login");
					$target.removeClass("pause");
					$target.removeClass("pausePercent");
					$target.find(".pauseTime").remove();
					break;
			}
			if(!$target.hasClass("blink")) {
				$target.addClass("blink");
				setTimeout(function() {
					$target.removeClass("blink");
				},4000)
			}
		};

		/** 작업자 로그인 정보 실시간 처리 **/
		let workerMessageProcess = function(messageData){
			if(messageData){
				let actionType = messageData.actionType;
				let $target = $("#" + messageData.factoryArea + "_" + messageData.equipPosition);
				if(actionType === 'WK_LOGIN') {
					$target.find(".staffImg").removeClass("staffIcon");
					if (messageData.userNm != undefined) $target.find(".nameWrap").find(".staffName").html(messageData.userNm);
					if (messageData.userImageSeq != undefined) $target.find(".staffImg").find("img").attr("src", "/image/" + messageData.userImageSeq);
				}else{
					if(!$target.hasClass("login")) {
						if (messageData.userNm != undefined) $target.find(".nameWrap").find(".staffName").html('');
						if (messageData.userImageSeq != undefined) $target.find(".staffImg").find("img").attr("src", "/resource/pop/images/user.svg");
						if(!$target.find(".staffImg").hasClass("staffIcon")) {
							$target.find(".staffImg").addClass("staffIcon");
						}
					}
				}
				var today = new Date();
				var content01 = '[' +('00'+(today.getMonth()+1)).substr(-2) + '/' + today.getDate() + '&nbsp;'+ ('00'+today.getHours()).substr(-2) + ':'+('00'+today.getMinutes()).substr(-2)+':'+('00'+today.getSeconds()).substr(-2)+']&nbsp;';

				var messageTemp = {
					'content01':content01,
					'content02':((actionType === 'WK_LOGIN')?'Log On':'Log Off'),
					'content03':messageData.equipNm + ' (' + messageData.userNm +')',
					'content04':messageData.userNm
				}
				alarmMessageProcess(messageTemp);
			}
		};

		let iConnectCount = 0;
		function jmesConnect() {
			let socket = new SockJS('/jmes-ws');
			stompClient = Stomp.over(socket);
			stompClient.connect({}, (frame) => {
				stompClient.subscribe('/topic/pop', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					console.log('/topic/pop',messageData)
					popMessageProcess(messageData);
				});
				stompClient.subscribe('/topic/drawing', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					console.log('/topic/drawing',messageData)
					drawingMessageProcess(messageData);
				});
				stompClient.subscribe('/topic/worker', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					console.log('/topic/worker',messageData)
					workerMessageProcess(messageData);
				});
				stompClient.subscribe('/topic/alarm', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					console.log('/topic/alarm',messageData)
					alarmMessageProcess(messageData);
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

		function randomKey() {
			var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
			var string_length = 10;
			var randomstring = '';
			for (var i=0; i<string_length; i++) {
				var rnum = Math.floor(Math.random() * chars.length);
				randomstring += chars.substring(rnum,rnum+1);
			}
			return randomstring;
		}

		let setIntervalTimer;
		let timer = function(){
			let selVal = 60;//1분
			let timesec = 1000;//1초
			setIntervalTimer = setInterval(function() {
				getWorkDrawingData();
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
		// reloadTimer();
		timer();
	});
	$("#machinePopCloseBtn").on("click",function(){
		$("#machinePopupWrap").modal('hide');
	});

	$("#popPopupContainer").on("click",function(e){
		if($(e.target).hasClass('popupContainer')) {
			$("#popPopupWrap").modal('hide');
		}
	});
	$("#machinePopupContainer").on("click",function(e){
		if($(e.target).hasClass('popupContainer')) {
			$("#machinePopupWrap").modal('hide');
		}
	});
	$(".pop .infoWrap").children("div").on("click",function(){
		$("#pop_search_form").find("#POP_POSITION").val($(this).data('seq'));
		$("#popPopupWrap").modal('show');
	});
	$("#popPopCloseBtn").on("click",function(){
		$("#popPopupWrap").modal('hide');
	});

	let popPopGrid = $("#popPopGrid");
	let $popPopGrid;
	let popPopColModel = [
		{title: 'ROWNUM', dataIndx: 'ROWNUM', hidden: true},
		{title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
		{title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
		{title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
		{title: '가공 납기', minWidth: 50, width: 50, dataIndx: 'INNER_DUE_DT', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
			render: function (ui) {
				const rowData = ui.rowData
				if (rowData.DELAY_YN === 'Y') {
					return {style: 'background-color: #ffff00;'};
				}
			}
		},
		{title: '진행상태', width: 70, dataIndx: 'PART_STATUS_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}},
		{title: '작업번호 / 규격', align: 'center', minWidth: 330, width: 330, dataIndx: 'CONTROL_NUM_PART_NUM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
			render: function (ui) {
				const cellData = ui.cellData;
				if (cellData) {
					return cellData.replace(/&lt;/g, '<');
				}
			}
		},
		{title: '작업형태 / 소재', dataType: 'string', dataIndx: 'WORK_TYPE_MATERIAL', maxWidth:180, minWidth: 100, width: 100, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
			render: function (ui) {
				const cellData = ui.cellData;
				if (cellData) {
					return cellData.replace(/&lt;/g, '<');
				}
			}
		},
		{title: '수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY', maxWidth:100, minWidth: 40, width: 40, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
			render: function (ui) {
				const rowData = ui.rowData
				if (rowData.ORDER_QTY_INFO != 'N') {
					return '<span><span style="color: red;font-weight: bold">'+ rowData.ORDER_QTY_INFO +'&nbsp;</span>'+rowData.CONTROL_PART_QTY+'</span>';
				}
			}
		},
		{title: '최근가공현황', align: 'center', styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
			colModel: [
				{title: '공정', minWidth: 60, width: 65, datatype: 'string', dataIndx: 'RECENTLY_PROCESS_TYPE_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}},
				{title: '작업자', minWidth: 60, width: 65, datatype: 'string', dataIndx: 'RECENTLY_WORK_USER_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}},
				{
					title: 'RT',
					minWidth: 55,
					width: 55,
					dataIndx: 'RECENTLY_WORKING_TIME',
					editable: false,
					styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}
				}
			]
		},
		{title: '외주가공', width: 70, dataIndx: 'OUTSIDE_COMP_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}}
	];
	let popPopObj;

	$('#popPopupWrap').on({
		'show.bs.modal': function () {
			popPopObj = {
				width: 'auto', height: 'auto',
				dataModel: {
					location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
					url: "/tv/paramQueryGridSelect",
					postData: fnFormToJsonArrayData('pop_search_form'),
					getData: function (dataJSON) {
						return {data: dataJSON.data};
					}
				},
				strNoRows: '<div style="font-size:35px;margin-top:10px;">No Data</div>',
				columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
				scrollModel: {autoFit: true},
				numberCell: {width: 60, title: "No. ", show: true},
				selectionModel: { type: 'row', mode: 'single'} ,
				swipeModel: {on: false},
				showTitle: false,
				collapsible: false,
				resizable: true,
				trackModel: {on: true},
				colModel: popPopColModel,
				rowSelect: function (evt, ui) {
					$.each(ui.addList, function (idx,Item) {
						if(idx === 0) {
							// let imgUrl = '/resource/asset/images/common/'+Item.rowData.IMG_GFILE_SEQ + '.png';
							let imgUrl = '/qimage/'+Item.rowData.IMG_GFILE_SEQ;
							$("#popMapImg").attr('src',imgUrl);
							$("#popMapImg").attr('alt',Item.rowData.IMG_GFILE_SEQ);
							$("#popMapImg").attr('data-value', Item.rowData.IMG_GFILE_SEQ);

							$("#pop_search_form").find("#GFILE_SEQ").val(Item.rowData.IMG_GFILE_SEQ);
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
					$("#popMapImg").attr('src',imgUrl);
					$("#popMapImg").attr('alt',selRowData.IMG_GFILE_SEQ);
					$("#popMapImg").attr('data-value', selRowData.IMG_GFILE_SEQ);
					$("#pop_search_form").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
				},
				refresh : function (evt, ui) {
					data = popPopGrid.pqGrid('option', 'dataModel.data');
					var totalQty = 0;
					for (var i = 0; i < data.length; i++) {
						var row = data[i];
						totalQty += parseInt(row.CONTROL_PART_QTY)
					}

					var text = data.length +' Rows  ' + totalQty + ' EA';
					$("#popSearchCnt").text(text);
				},
				complete: function (event, ui) {
					setTimeout(function (){
						popPopGrid.pqGrid('setSelection', {rowIndx: 0});
					},300);
				},
			};

			var pop = $("#pop_search_form").find("#POP_POSITION").val();
			$("#popSearchType").html($("#" + pop).parent().find("h3").text());
			$popPopGrid = popPopGrid.pqGrid(popPopObj);
		},'hide.bs.modal': function () {
			if ($('#popPopGrid').pqGrid('instance')) {
				$popPopGrid.pqGrid('destroy');
			}
		}
	});

	$("#machinePopDetailBtn").on("click",function(){
		let gFileSeq = $("#pop_machine_form").find("#GFILE_SEQ").val();
		if(gFileSeq != '') {
			callWindowImageViewer(gFileSeq);
		}
	});
	$("#popMapDetailBtn").on("click",function(){
		let gFileSeq = $("#pop_search_form").find("#GFILE_SEQ").val();
		if(gFileSeq != '') {
			callWindowImageViewer(gFileSeq);
		}
	});

	$(document).ready(function(){

		function settingRightTable(data) {
			if(data.info != null) {
				$("#pop_machine_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
				$("#pop_machine_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
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
					$("#pop_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
				}else {
					$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
					$("#pop_machine_form").find("#GFILE_SEQ").val('');
				}
			}
		}

		$(document).on("click",".machine_plan_draw",function(e){
			$(".machine_plan_draw").removeClass("bg_mct_green");
			$(this).addClass("bg_mct_green");

			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectMctPlanListForDetailPop',
					'EQUIP_SEQ':$("#pop_machine_form").find("#EQUIP_SEQ").val(),
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
					'EQUIP_SEQ':$("#pop_machine_form").find("#EQUIP_SEQ").val()
				}
			};
			fnPostAjax(function (data) {
				settingRightTable(data);
			}, parameter2, '');
		});

		function settingOngoingInfo(equipSeq) {
			const parameter2 = {'url': '/tv/json-info', 'data': {
					'queryId':'tvMapper.selectMctOngoingInfoForDetailPop',
					'EQUIP_SEQ':equipSeq
				}
			};
			fnPostAjax(function (data) {
				var tempHtml = '';
				console.log('settingOngoingInfo',data);
				if(data.info != null) {
					$(".same_side_span").hide();
					$("#pop_machine_form").find("#CONTROL_SEQ").val(data.info.CONTROL_SEQ);
					$("#pop_machine_form").find("#CONTROL_DETAIL_SEQ").val(data.info.CONTROL_DETAIL_SEQ);
					for(let key in data.info){
						let val = data.info[key];
						if(key == 'SAME_SIDE_YN' && val == 'Y') {
							$(".same_side_span").show();
						}else if(key == "PHOTO_GFILE_SEQ") {
							$("#machinePopupWrap").find("#table2_worker_img").attr('src', '/image/' + val);
						}else if(key == 'EQUIP_STATUS') {
							$("#machinePopupWrap").find("."+key).removeClass("green");
							$("#machinePopupWrap").find("."+key).removeClass("yellow");
							if(val == 'Active') {
								$("#machinePopupWrap").find("."+key).addClass("green");
							}else if(val == 'Stop') {
								$("#machinePopupWrap").find("."+key).addClass("yellow");
							}
						}
						$("#machinePopupWrap").find("."+key).text(val);
					}
					if(typeof data.info.IMG_GFILE_SEQ != 'undefined' && data.info.IMG_GFILE_SEQ != '' && data.info.IMG_GFILE_SEQ != null) {
						$("#mapImgWrap").attr('src', '/qimage/'+data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('alt', data.info.IMG_GFILE_SEQ);
						$("#mapImgWrap").attr('data-value', data.info.IMG_GFILE_SEQ);
						$("#pop_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
					}else {
						$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
						$("#pop_machine_form").find("#GFILE_SEQ").val('');
					}
				}else {
					$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
					$("#pop_machine_form").find("#GFILE_SEQ").val('');
				}

			}, parameter2, '');
		}

		$(document).on("click",".login,.pause",function(event){
			var equipSeq = $(this).data('seq');
			$("#pop_machine_form").find("#EQUIP_SEQ").val(equipSeq);
			settingOngoingInfo(equipSeq);

			$('#machinePopupWrap').modal('show');
		})

		$('#machinePopupWrap').on({
			'show.bs.modal': function () {
				const parameter2 = {'url': '/tv/json-list', 'data': {
						'queryId':'tvMapper.selectMctPlanListForDetailPop',
						'EQUIP_SEQ':$("#pop_machine_form").find("#EQUIP_SEQ").val()
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
						$(".planImgDiv").append('<div style="text-align: center;margin-top: 7%;font-size: 2rem;">No Data</div>');
					}
					$("#total_cnt_qty").text(data.list.length + " 품 " + totalQty + " EA");
					$("#total_plan_time").text("( "+ makeTimeStr(totalTime) + " )");
				}, parameter2, '');

			},
			'hide.bs.modal': function () {

			}
		});
	});
</script>
</body>
</html>