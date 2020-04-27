var chk = 0; // 예제를 위한 변수

$(document).ready(function(){

	if($('.contentsWrap .page').hasClass('estimate')){
		// table chart height값
		estimateH();
	}


	//console.log(pageHeight,tableConWrapY,tableConWrapH);

	$(document).on('click', '.sideWrap a', function (e) {
	// $('.sideWrap a').on('click' , function(e){
	// $('.sideWrap a').on('click' , function(e){
		e.preventDefault();
		if($(this).parents('div').hasClass('on')){
			sideMenuClose();
		}else{
			sideMenuOpen();
		}
	});

	// $('.gnbWrap .depth1 > a').on('click' , function(e){
	// 	e.preventDefault();
	// 	if($(this).parent('li').hasClass('on')){
	// 		$(this).next('.depth2').stop().slideUp( 300 , 'easeOutCubic' , function(){
	// 			$(this).parent('li').removeClass('on');
	// 		});
	// 	}else{
	// 		$(this).next('.depth2').stop().slideDown( 300 , 'easeOutCubic' , function(){
	// 			$(this).parent('li').addClass('on');
	// 		});
	//
	// 		$(this).parent('li').siblings('.on').children('.depth2').stop().slideUp(200 , 'easeOutCubic' , function(){
	// 			$('.gnbWrap .depth1').removeClass('on');
	// 		});
	// 	}
	// })

	$(document).on('click', '.gnbWrap .depth1 > a', function (e) {
		e.preventDefault();
		if ($(this).parent('li').hasClass('on')) {
			$(this).next('.depth2').stop().slideUp(300, 'easeOutCubic', function () {
				$(this).parent('li').removeClass('on');
			});
		} else {
			$(this).next('.depth2').stop().slideDown(300, 'easeOutCubic', function () {
				$(this).parent('li').addClass('on');
			});

			$(this).parent('li').siblings('.on').children('.depth2').stop().slideUp(200, 'easeOutCubic', function () {
				$('.gnbWrap .depth1').removeClass('on');
			});
		}
	})

	$(document).on('click', '.gnbWrap .depth2 li > a', function (e) {
		let pid = $(this).attr('pid');
		if ($('.addTapPage').length == 10) { // 최종 7개의 탭 메뉴만 열림
			alert("동시에 10개의 탭만 열수 있습니다. 작업완료 탭을 닫고 메뉴를 다시 클릭해 주세요.")
		}else if ($('.contentsWrap').find('#view_tab_' + pid).length > 0) {	// 같은 tab 이 열린 경우
			$("#tab_" + pid).trigger("click");
		} else {
			$('.contentsWrap .addTapPage').hide();
			$('.tabMenuWrap ul li').removeClass('on');
			$('.tabMenuWrap ul').append("<li class='on'><a href='#a;' id='tab_" + pid + "'>" + $(this).attr('tname') + "</a><button type='button' class='closeBtn' idx='tab_" + pid + "'>닫기</button></li>");
			$.get($(this).attr('url'), function (data) {
				let containerDiv = "<span class='addTapPage estimate page' id='view_tab_" + pid + "'>" + data + "</span>";
				$(".contentsWrap").append(containerDiv).trigger('create');
				tabMenuFn();
				estimateH();
			});
		}
	});

	// $('.gnbWrap .depth2 li > a').on('click' , function(){
	// 	var htmlTxt = "<div class='page addPage estimate'><div class='topWrap'><div class='gubunWrap'><ul><li><span class='slt_wrap'><label for='projectSltd'>사업자구분</label><select id='projectSltd'name='projectSltd'title='사업자구분'><option value='selected='selected'>-ALL-</option><option value='1'>-ALL-</option><option value='2'>-ALL-</option></select></span></li><li><span class='slt_wrap'><label for='customSltd'>발주사</label><select id='customSltd'name='customSltd'title='발주사'><option value='selected='selected'>-ALL-</option><option value='1'>-ALL-</option><option value='2'>-ALL-</option></select></span></li><li><span class='ipu_wrap'><label for='nameSltd'>제목</label><input type='text'name='nameSltd'id='nameSltd'placeholder='value='title='제목'></span></li><li><span class='ipu_wrap'><label for='numberSltd'>도면번호</label><input type='text'name='numberSltd'id='numberSltd'placeholder='value='title='도면번호'></span></li><li><span class='ipu_wrap'><label for='priceSltd'>견적번호</label><input type='text'name='priceSltd'id='priceSltd'placeholder='value='title='견적번호'></span></li><li><span class='ipu_wrap'><label for='numberSltd2'>도면번호</label><input type='text'name='numberSltd2'id='numberSltd2'placeholder='value='title='도면번호'></span></li><li><span class='ipu_wrap'><label for='m2Sltd'>품명</label><input type='text'name='m2Sltd'id='m2Sltd'placeholder='value='title='품명'></span></li><li><span class='ipu_wrap'><label for='nameSltd2'>제목</label><input type='text'name='nameSltd2'id='nameSltd2'placeholder='value='title='제목'></span></li></ul><div class='dateWrap'><div class='leftSpan'><span class='slt_wrap'><select id='daySltd'name='daySltd'title='등록일시'><option value='selected='selected'>등록일시</option><option value='1'>-ALL-</option><option value='2'>-ALL-</option></select></span><span class='radio_box'><input reqcd='R'type='radio'id='fr_1001_1'name='><label for='fr_1001_1'>오늘</label></span><span class='radio_box'><input reqcd='R'type='radio'id='fr_1001_2'name='><label for='fr_1001_2'>현재월</label></span><span class='radio_box'><input reqcd='R'type='radio'id='fr_1001_3'name='><label for='fr_1001_3'>3개월</label></span><div class='calendar_wrap'><span class='calendar_span'><input type='text'name='dateOneIp'id='dateOneIp'placeholder='value='title='달력정보'><button type='button'>달력선택</button></span><span class='nbsp'>~</span><span class='calendar_span'><input type='text'name='dateTwoIp'id='dateTwoIp'placeholder='value='title='달력정보'><button type='button'>달력선택</button></span><span class='chk_box no_txt'><input id='pr_ex'type='checkbox'><label for='pr_ex'>선택</label></span></div></div><div class='rightSpan'><span class='txt'>Option</span><span class='chk_box'><input id='pr_ex1'type='checkbox'><label for='pr_ex1'> 발송완료</label></span><span class='chk_box'><input id='pr_ex2'type='checkbox'><label for='pr_ex2'> 최신차수</label></span></div><button type='button'class='search_btn'>검색</button></div></div><button type='button'class='topWrap_btn'>펼치기 / 접기</button></div><div class='bottomWrap'><div class='hWrap'><span class='buttonWrap'><button type='button'class='defaultBtn'>견적서 신규 작성</button><button type='button'class='defaultBtn'>차수 생성</button></span><span class='chk_box'><input id='pr_a'type='checkbox'><label for='pr_a'> 견적상세요건</label></span><div class='rightSpan'><span class='slt_wrap namePlusSlt'><label for='prSltd'>견적서 추출</label><select id='prSltd'name='prSltd'title='견적서 추출'><option value='selected='selected'>견적서 추출1</option><option value='1'>견적서 추출2</option><option value='2'>견적서 추출3</option></select></span><span class='buttonWrap'><button type='button'class='defaultBtn grayGra'>도면 View</button><button type='button'class='defaultBtn yelllowGra'>Delete</button><button type='button'class='defaultBtn blueGra'>Save</button></span></div></div><div class='tableWrap'><span class='buttonWrap'><button type='button'class='smallBtn'>견적정보</button><button type='button'class='smallBtn blue'>금액정보</button></span><div class='conWrap'><img src='./asset/images/common/img_table_sp.jpg'alt='테이블샘플'></div></div></div></div>";
	// 	$('.contentsWrap .page').hide();
	// 	$('.contentsWrap').append(htmlTxt);
	// 	$('.tabMenuWrap ul li').removeClass('on');
	// 	$('.tabMenuWrap ul').append("<li class='on'><a href='#a;''>견적관리</a><button type='button' class='closeBtn'>닫기</button></li>");
	// 	tabMenuFn();
	// 	chk = chk+1; // 예제를 위한 처리
	// 	estimateH();
	// });

})

function tabMenuFn() {
	$(document).on('click', '.tabMenuWrap .closeBtn', function (e) {
		if ($('.addTapPage').length == 1) return false;
		let idx = $(this).attr('idx');
		if ($(this).parent('li').hasClass('on')) {
			if ($('.tabMenuWrap ul li').length > 1) {
				$('#view_' + idx).prev().show();
				$('#view_' + idx).remove();
				$(this).parent('li').prev().addClass('on');
				$(this).parent('li').remove();
			} else {
				$('#view_' + idx).remove();
				$(this).parent('li').remove();
			}
		} else {
			$('#view_' + idx).remove();
			$(this).parent('li').remove();
		}
		noPage();
	});

	$(document).on('click', '.tabMenuWrap ul li > a', function (e) {
		let tabId = $(this).attr('id');
		$('.contentsWrap .addTapPage').hide();
		$('.tabMenuWrap ul li').removeClass('on');
		$(this).parents('li').addClass('on');
		$('.contentsWrap').find('#view_' + tabId).show();
	});
}

// function tabMenuFn(){
// 	var divIdName = 'paddPage' + chk; // 예제를 위한 처리
// 	var btnIdName = 'addPage' + chk;  // 예제를 위한 처리
// 	$('.contentsWrap .page').eq(chk+1).attr('id', divIdName); // 예제를 위한 처리
// 	$('.tabMenuWrap ul li').eq(chk).children('.closeBtn').attr('id', btnIdName); // 예제를 위한 처리
//
// 	$('.tabMenuWrap .closeBtn').on('click' , function(){
//
// 		var idx = $(this).attr('id');
// 		if($(this).parent('li').hasClass('on')){
// 			if($('.tabMenuWrap ul li').length > 1){
// 				//console.log('1개보다 많다');
// 				$('#p'+ idx).prev().show();
// 				$('#p'+ idx).remove();
// 				$(this).parent('li').prev().addClass('on');
// 				$(this).parent('li').remove();
// 			}else{
// 				$('#p'+ idx).remove();
// 				$(this).parent('li').remove();
// 			}
// 		}else{
// 			var loc = $(this).parent('li').index();
// 			$('#p'+ idx).remove();
// 			$(this).parent('li').remove();
// 		}
// 		noPage();
// 	});
//
// 	$('.tabMenuWrap ul li > a').on('click' , function(){
// 		var idx = $(this).parents('li').index();
// 		$('.contentsWrap .addPage').hide();
// 		$('.tabMenuWrap ul li').removeClass('on');
// 		$(this).parents('li').addClass('on');
// 		$('.contentsWrap .addPage').eq(idx).show();
// 	});
// }

function noPage(){
	if(!$('.addPage').length){
		$('.page').show();
	}
}

//사이드 메뉴 오픈 함수
function sideMenuOpen(){
	var menu = $('.sidebarWrap');
	var con = $('.contentsWrap');
	var tm = $('.tabMenuWrap');
	menu.stop().animate({left:0},300, 'easeOutCubic').addClass('on');
	tm.stop().animate({'margin-left':'270px'},300, 'easeOutCubic');
	con.stop().animate({'margin-left':'270px'},300, 'easeOutCubic');

}
//사이드 메뉴 클로즈 함수
function sideMenuClose(){
	var menu = $('.sidebarWrap');
	var con = $('.contentsWrap');
	var tm = $('.tabMenuWrap');
	menu.stop().animate({left:"-270px"}, 300, 'easeInCubic').removeClass('on');
	tm.stop().animate({'margin-left':'0px'}, 300, 'easeInCubic');
	con.stop().animate({'margin-left':'0px'},300, 'easeInCubic');
}

// topWrap 확장 함수
function topMenuOpen(){
	var top = $('.gubunWrap');
	var con = $('.bottomWrap .tableWrap .conWrap');
	var t_h = $('.gubunWrap ul').height()+10;
	var c_h = con.height() - t_h + top.height() + 10;
	top.stop().animate({height:t_h},300, 'easeOutCubic');
	con.stop().animate({height: c_h },300, 'easeOutCubic');

}
// topWrap 축소 함수
function topMenuClose(){
	var top = $('.gubunWrap');
	var con = $('.bottomWrap .tableWrap .conWrap');
	var t_h = $('.gubunWrap ul li').outerHeight() + 10;
	var c_h = con.height() + top.height() - t_h + 10;
	top.stop().animate({height:t_h}, 300, 'easeInCubic');
	con.stop().animate({height: c_h},300, 'easeInCubic');
}

// 견적관리 페이지 불러올때 꼭 호출해줘야하는 함수!!
function estimateH(){
	// var tableCon = $('.estimate .bottomWrap .tableWrap .conWrap');
	var tableCon = $('.estimate .bottomWrap .tableWrap .conWrap');
	var pageHeight = $(window).height();
	var tableConWrapY = tableCon.offset().top;
	var tableConWrapH = pageHeight - tableConWrapY - 16;

	tableCon.css({'height' : tableConWrapH});
	$('.topWrap_btn').on('click' , function(){
		if($(this).hasClass('on')){
			topMenuClose();
			$(this).removeClass('on');
		}else{
			topMenuOpen();
			$(this).addClass('on');
		}
	});
}