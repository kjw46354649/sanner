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
</form>
<!--팝업 시작-->
<div id="machinePopupWrap" class="popupWrap popupBackground" style="display: none;">
	<!--팝업위치기준-->
	<div id="machinePopupContainer" class="popupContainer">
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
						<td id="workStaff" class="workStaff th_color">작업자</td>
						<td id="workStatu" class="workStatu th_color">작업상세</td>
						<td id="workNum" class="workNum th_color">작업번호</td>
						<td id="mapNum" class="mapNum th_color">도면번호</td>
						<td id="productSize" class="productSize th_color">규격</td>
						<td id="workType" class="workType th_color">작업형태</td>
						<td id="material" class="material th_color">소재종류</td>
						<td id="orderNum" class="orderNum th_color">수량</td>
						<td id="processDelivery" class="processDelivery	th_color">가공납기</td>
						<td id="timeStop" class="timeStop th_color">정지시간</td>
						<td id="timeRunning" class="timeRunning th_color">진행시간</td>
						<td id="timeExpect" class="timeExpect th_color">예상시간(E/T)</td>
					</tr>
					<tr id="machine_popup_tbody">
						<td id="workStaffImg" class="workStaffImg ">
							<div id="staffImgWrap" class="staffImgWrap">
								<img src="/resource/pop/images/staff.jpg" alt="작업자사진">
							</div>

						</td>
						<td id="running" class="running"></td>
						<td id="numberWorking" class="numberWorking"></td>
						<td id="innerWork" class="innerWork"></td>
						<td id="mapNumInfo" class="mapNumInfo">
							<div class="tableScroll">
							</div>
						</td>
						<td id="sizeInfo" class="sizeInfo"></td>
						<td id="workTypeInfo" class="workTypeInfo"></td>
						<td id="materialInfo" class="materialInfo"></td>
						<td id="productAmount" class="productAmount">
							<span></span>
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
						<img id="mapImgWrap" src="/resource/main/blank.jpg" alt="도면">
					</div>
				</div>
				<!--왼쪽-->
				<!--오른쪽-->
				<div id="popBtmRight" class="popBtmRight">
					<div id="tableTop" class="tableTop">
						<h4>가공계획 List</h4>
						<table class="popHeadTopTable">
							<tr id="popBtmGridHead">
								<td>대기현황</td>
								<td></td>
								<td>예상시간 합계 :</td>
							</tr>
						</table>
					</div>
					<!--오른쪽 표 시작-->
					<div id="pop_machine_grid" class="popBtmTable">
						<!--표 삽입-->
					</div>
					<!--오른쪽 표 끝-->
				</div>
				<!--오른쪽 끝-->
			</div>
			<!--팝업 하단 끝-->
			<!--버튼-->
			<button id="machinePopDetailBtn" class="popMapDetailBtn">도면상세보기</button>
			<button id="machinePopCloseBtn" class="detailCloseBtn">닫기</button>
			<!--버튼 끝-->
		</div>
		<!--팝업내용끝-->
	</div>
	<!--팝업위치기준-->
</div>
<!--팝업 끝-->

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

<script>
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

	let windowImageViewer;
	let machineListData;

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
									mHtml += '<div id="img_'+(factory_area + '_' + layout_sort)+'" class="backImg ' + m_list[i].MACHINE_ICON + '" style="background:url(/qimage/' + img_gfile_seq + ');background-repeat:no-repeat;background-position:center;background-size: cover;">';
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
											'background':'url(/qimage/'+img_gfile_seq +')',
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
								'background':'url(/qimage/' + data.info.IMG_GFILE_SEQ + ')',
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
		$(document).on("click",".machine_ongoing_draw",function(e){
			var grid = $("#pop_machine_grid").pqGrid('getInstance').grid;
			var sr = grid.SelectRow();
			sr.removeAll();
			var imgSeq = $(this).data('value');
			if(typeof imgSeq != 'undefined' && imgSeq != '') {
				$("#mapImgWrap").attr('src','/qimage/'+imgSeq);
				$("#mapImgWrap").attr('alt',imgSeq);
				$("#mapImgWrap").attr('data-value', imgSeq);

				$("#pop_machine_form").find("#GFILE_SEQ").val(imgSeq);
			}
		})

		let popMachineGrid = $("#pop_machine_grid");
		let $popMachineGrid;
		let popMachineColModel = [
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
			{title: '진행상태', width: 70, dataIndx: 'PART_STATUS', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}},
			{title: '작업번호 / 규격', align: 'center', minWidth: 165, width: 185, dataIndx: 'CONTROL_NUM_PART_NUM', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return cellData.replace(/&lt;/g, '<');
					}
				}
			},
			{title: '작업형태 / 소재', dataType: 'string', dataIndx: 'WORK_TYPE_MATERIAL', minWidth: 80, width: 160, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return cellData.replace(/&lt;/g, '<');
					}
				}
			},
			{title: '수량', dataType: 'integer', dataIndx: 'CONTROL_PART_QTY', minWidth: 40, width: 40, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
				render: function (ui) {
					const rowData = ui.rowData
					if (rowData.ORDER_QTY_INFO != 'N') {
						return '<span><span style="color: red;font-weight: bold">'+ rowData.ORDER_QTY_INFO +'&nbsp;</span>'+rowData.CONTROL_PART_QTY+'</span>';
					}
				}
			},
			{title: '예상시간<br>(E/T,분)', dataType: 'string', dataIndx: 'WORKING_TIME', minWidth: 55, width: 55, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'blue', 'font-size':'1.4rem'},
				format: function(val){
					return (typeof val != 'undefined')?(val+"'"):"";
				},
			},
			{title: '과거수행기록(NC)', align: 'center', styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'},
				colModel: [
					{title: 'MCT_PLAN_SEQ', dataIndx: 'MCT_PLAN_SEQ', hidden: true},
					{
						title: '1EA L/T',
						minWidth: 55,
						width: 55,
						dataIndx: 'LAST_UNIT_LEAD_TIME',
						editable: false,
						styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}
					},
					{title: '작업자', minWidth: 60, width: 65, datatype: 'string', dataIndx: 'LAST_MCT_WORK_USER', editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black', 'font-size':'1.4rem'}}
				]
			}
		];
		let popMachineObj;

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
						$("#pop_machine_form").find("#GFILE_SEQ").val(data.info.IMG_GFILE_SEQ);
					}else {
						$("#mapImgWrap").attr('src', '/resource/main/blank.jpg');
						$("#pop_machine_form").find("#GFILE_SEQ").val('');
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
					$("#pop_machine_form").find("#GFILE_SEQ").val('');
				}
				$("#machine_popup_tbody").html(tempHtml);
			}, parameter2, '');
		}

		$(document).on("click",".login,.pause",function(event){
			var equipSeq = $(this).data('seq');
			$("#pop_machine_form").find("#EQUIP_SEQ").val(equipSeq);
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

			$('#machinePopupWrap').modal('show');
		})
		$('#machinePopupWrap').on({
			'show.bs.modal': function () {
				popMachineObj = {
					width: 'auto', height: 'auto',
					dataModel: {
						location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
						url: "/tv/paramQueryGridSelect",
						postData: fnFormToJsonArrayData('pop_machine_form'),
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
					resizable: false,
					trackModel: {on: true},
					editModel: {clicksToEdit: 1},
					colModel: popMachineColModel,
					rowSelect: function (evt, ui) {
						$.each(ui.addList, function (idx,Item) {
							if(idx === 0) {
								// let imgUrl = '/resource/asset/images/common/'+Item.rowData.IMG_GFILE_SEQ + '.png';
								let imgUrl = '/qimage/'+Item.rowData.IMG_GFILE_SEQ;
								$("#mapImgWrap").attr('src',imgUrl);
								$("#mapImgWrap").attr('alt',Item.rowData.IMG_GFILE_SEQ);
								$("#mapImgWrap").attr('data-value', Item.rowData.IMG_GFILE_SEQ);

								$("#pop_machine_form").find("#GFILE_SEQ").val(Item.rowData.IMG_GFILE_SEQ);
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
						$("#pop_machine_form").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
					},
					refresh : function (evt, ui) {
						data = popMachineGrid.pqGrid('option', 'dataModel.data');
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
				$popMachineGrid = popMachineGrid.pqGrid(popMachineObj);
			},
			'hide.bs.modal': function () {
				$popMachineGrid.pqGrid('destroy');
			}
		});
	});
</script>
</body>
</html>