// var chk = 0; // 예제를 위한 변수

$(document).ready(function(){

	$(document).on('click', '.sideWrap a', function(e){
		e.preventDefault();
		if($(this).parents('div').hasClass('on')){
			sideMenuClose();
		}else{
			sideMenuOpen();
		}
	});

	$(document).on('click', '.topWrap_btn', function(e){
		if($(this).hasClass('on')){
			topMenuClose();
			$(this).removeClass('on');
		}else{
			topMenuOpen();
			$(this).addClass('on');
		}
	});

	$(document).on('click', '.gnbWrap .depth2 li > a', function(e){
		var pid = $(this).attr('pid');
		if($('.contentsWrap').find('#view_tab_' + pid).length > 0){	// 같은 tab 이 열린 경우
			$("#tab_" + pid).trigger("click");
		}else{
			$('.contentsWrap .addTapPage').hide();
			$('.tabMenuWrap ul li').removeClass('on');
			$('.tabMenuWrap ul').append("<li class='on'><a href='#a;' id='tab_" + pid + "'>" + $(this).attr('tname') + "</a><button type='button' class='closeBtn' idx='tab_" + pid + "'>닫기</button></li>");
			$.get($(this).attr('url'),function(data){
				var containerDiv = "<span class='addTapPage' id='view_tab_" + pid + "'>" + data + "</span>";
				$(".contentsWrap").append(containerDiv).trigger('create');
				tabMenuFn();
			});
		}
	});

	$(document).on('click', '.gnbWrap .depth1 > a', function(e){
		e.preventDefault();
		if($(this).parent('li').hasClass('on')){
			$(this).next('.depth2').stop().slideUp( 300 , 'easeOutCubic' , function(){
				$(this).parent('li').removeClass('on');
			});
		}else{
			$(this).next('.depth2').stop().slideDown( 300 , 'easeOutCubic' , function(){
				$(this).parent('li').addClass('on');
			});

			$(this).parent('li').siblings('.on').children('.depth2').stop().slideUp(200 , 'easeOutCubic' , function(){
				$('.gnbWrap .depth1').removeClass('on');
			});
		}
	})

})

function tabMenuFn(){
	$(document).on('click', '.tabMenuWrap .closeBtn', function(e){
		if($('.addTapPage').length == 1) return false;
		var idx = $(this).attr('idx');
		if($(this).parent('li').hasClass('on')){
			if($('.tabMenuWrap ul li').length > 1){
				$('#view_'+ idx).prev().show();
				$('#view_'+ idx).remove();
				$(this).parent('li').prev().addClass('on');
				$(this).parent('li').remove();
			}else{
				$('#view_'+ idx).remove();
				$(this).parent('li').remove();
			}
		}else{
			$('#view_'+ idx).remove();
			$(this).parent('li').remove();
		}
		noPage();
	});

	$(document).on('click', '.tabMenuWrap ul li > a', function(e){
		var tabId = $(this).attr('id');
		$('.contentsWrap .addTapPage').hide();
		$('.tabMenuWrap ul li').removeClass('on');
		$(this).parents('li').addClass('on');
		$('.contentsWrap').find('#view_' + tabId).show();
	});
}

function noPage(){
	if(!$('.addTapPage').length){
		$('.addTapPage').show();
	}
}

//사이드 메뉴 오픈 함수
function sideMenuOpen(){
	var menu = $('.sidebarWrap');
	var con = $('.contentsWrap');
	var tm = $('.tabMenuWrap');
	menu.stop().animate({left:0},300, 'easeOutCubic').addClass('on');
	tm.stop().animate({left:284},300, 'easeOutCubic');
	con.stop().animate({'margin-left':'270px'},300, 'easeOutCubic');

}
//사이드 메뉴 클로즈 함수
function sideMenuClose(){
	var menu = $('.sidebarWrap');
	var con = $('.contentsWrap');
	var tm = $('.tabMenuWrap');
	menu.stop().animate({left:"-270px"}, 300, 'easeInCubic').removeClass('on');
	tm.stop().animate({left:"14px"}, 300, 'easeInCubic');
	con.stop().animate({'margin-left':'0px'},300, 'easeInCubic');
}
