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
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/customer.css" />
	<link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />
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
		.pq-grid-header-table>.pq-grid-row>.pq-grid-number-cell {background: #d8edf0;}
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
					<option value="jinsung">진성정밀</option>
					<option value="dmt">DMT</option>
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

	$("#changeScreen").change(function(){
		if($("#changeScreen").val() == "dmt"){
			$("#contents01, #contents02").hide();
			$("#contents03").show();
		}else{
			$("#contents01, #contents02").show();
			$("#contents03").hide();
		}
	});

	let windowImageViewer;
	let machineListData;
	let machineAreListData;

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

	$(function () {

		let getInitData = function () {
			'use strict';

			$.ajax({
				type: 'POST', url: "/tv/mct/data", dataType: 'json',
				data: {},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}

					machineListData = data.mct_info_list;//mct info
					machineAreListData = data.mct_list;
					// let mct_list = data.mct_list;//mct

					//init
					$('[id^=ARE]').each(function () {
						// $(this).find(".inBox:nth-child(1)").html('&nbsp;');
						// $(this).find(".inBox:nth-child(2)").html('&nbsp;');
						// $(this).find(".inBox:nth-child(3)").find('div:nth-child(1)').html('&nbsp;');
						// $(this).find(".inBox:nth-child(3)").find('div:nth-child(2)').html('&nbsp;');
						// $(this).find(".statusWrap").hide();
						// $(this).find(".statusConts").empty();
					});

					//mct info
					getReLoadWorkData('init');

					// createGrid1(data.grid_list1);	//오른쪽 통합그리드

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
						if(idx == 'ARE01' || idx == 'ARE06') {
							if(Item.length % 6 != 0) {
								var first = Math.ceil(Item.length / 6);
								var add = (parseInt(first) * 6) - Item.length;
								for(var i=0;i<add;i++) {
									var json = {
										EQUIP_NM : 'BLANK',
										FACTORY_AREA : Item[0].FACTORY_AREA
									};
									groups[idx].push(json);
								}
							}
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
								html += '	<div class="staffImg mctStaffImg">';
								if(typeof Item2.PHOTO_GFILE_SEQ != 'undefined') {
									html += '		<img src="/image/'+Item2.PHOTO_GFILE_SEQ + '" alt="직원사진">';
								}else {
									html += '		<img src="/resource/pop/images/user.svg" class="mctNonLogin" alt="직원사진">';
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
									html += '		<img src="/resource/pop/images/machine.png" alt="도면">';
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
									var hour = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
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
								}else {
									$("#"+Item2.FACTORY_AREA + '_3').append(html);
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

		let getReLoadTableData = function () {
			'use strict';

			$.ajax({
				type: 'POST', url: "/tv/mct/gridDataList", dataType: 'json', data: {},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}
					createGrid1();	//불량/반품

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
								$target.find(".mctStaffImg").find("img").removeClass("mctNonLogin");
								$target.find(".mctStaffImg").find("img").attr("src","/image/" + Item.PHOTO_GFILE_SEQ);
							}else {
								if(!$target.find(".mctStaffImg").find("img").hasClass("mctNonLogin")) {
									$target.find(".mctStaffImg").find("img").addClass("mctNonLogin");
								}
								$target.find(".mctStaffImg").find("img").attr("src","/resource/pop/images/user.svg");
							}

							if(typeof Item.IMG_GFILE_SEQ != 'undefined') {
								$target.find(".mctStaffName").text(Item.USER_NM);
							}else {
								$target.find(".mctStaffName").text("-");
							}

							if(Item.WORK_PLAN_TYPE == 1 && typeof Item.IMG_GFILE_SEQ != 'undefined') {
								$target.find(".mctMapImg").find("img").attr("src","/qimage/" + Item.IMG_GFILE_SEQ);
							}else {
								$target.find(".mctMapImg").find("img").attr("src","/resource/pop/images/machine.png");
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
			{title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
			{title: 'RANK', dataIndx: 'RANK', hidden: true},
			{title: '구분', minWidth: 35, width: 35, dataIndx: 'TITLE', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
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
			{title: '납기', minWidth: 45, width: 45, dataIndx: 'INNER_DUE_DT', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'}},
			{title: '작업번호', align: 'center', minWidth: 165, width: 165, dataIndx: 'CONTROL_TEXT', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
				render: function (ui) {
					const cellData = ui.cellData;
					if (cellData) {
						return cellData.replace(/&lt;/g, '<');
					}
				}
			},
			{title: '진행상태',minWidth: 60, width: 60, dataIndx: 'PART_STATUS_NM', editable: false, styleHead: {'font-weight': 'bold','background':'#214062', 'color': 'white'},
				render:function (ui) {
					const cellData = ui.cellData;
					let partStatus = ui.rowData.PART_STATUS;
					var text = "";
					var style = "";
					if(typeof partStatus != 'undefined' && partStatus != null && (partStatus == 'PRO002' || partStatus == 'PRO005')) {
						style = "color:red; font-weight:bold;";
					}
					if(typeof cellData != 'undefined' && cellData.length > 4) {
						text = cellData.substring(0,4) + '<br>' + cellData.substring(4,cellData.length);
					}
					return {text:((text != "")?text:cellData),style: style};
				}
			}
		];
		let mctMainObj= {
			width: 'auto', height: 'auto',
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
			swipeModel: {on: false},
			showTitle: false,
			collapsible: false,
			resizable: true,
			trackModel: {on: true},
			colModel: mctMainColModel,
			rowSelect: function (evt, ui) {
				$.each(ui.addList, function (idx,Item) {
					if(idx === 0) {
						callWindowImageViewer(Item.rowData.IMG_GFILE_SEQ);
					}
				})
			},
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
					$("#EQUIP_"+ messageData.equipSeq).find(".mctStaffName").text("-");
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
			{title: '작업형태 / 소재', dataType: 'string', dataIndx: 'WORK_TYPE_MATERIAL', minWidth: 80, maxWidth:120, editable: false, styleHead: {'font-weight': 'bold','background':'#d8edf0', 'color': 'black'},
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
					var stopTime = timeFormat(data.info.TEMP_STOP);
					var onGoingTime = timeFormat(data.info.ON_GOING);
					var planWorkingTime = timeFormat(data.info.PLAN_WORKING_TIME);
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