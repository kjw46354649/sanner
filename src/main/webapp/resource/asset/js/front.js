// let chk = 0; // 예제를 위한 변수

$(document).ready(function () {

    $(document).on('click', '.sideWrap a', function (e) {
        e.preventDefault();
        if ($(this).parents('div').hasClass('on')) {
            sideMenuClose();
        } else {
            sideMenuOpen();
        }
    });

    $(document).on('click', '.topWrap_btn', function (e) {
        if ($(this).hasClass('on')) {
            topMenuClose(this);
            $(this).removeClass('on');
        } else {
            topMenuOpen(this);
            $(this).addClass('on');
        }
    });

    $(document).on('click', '.gnbWrap .depth2 li > a', function (e) {
        let pid = $(this).attr('pid');
        if ($('.contentsWrap').find('#view_tab_' + pid).length > 0) {	// 같은 tab 이 열린 경우
            $("#tab_" + pid).trigger("click");
        } else {
            $('.contentsWrap .addTapPage').hide();
            $('.tabMenuWrap ul li').removeClass('on');
            $('.tabMenuWrap ul').append("<li class='on'><a href='#a;' id='tab_" + pid + "'>" + $(this).attr('tname') + "</a><button type='button' class='closeBtn' idx='tab_" + pid + "'>닫기</button></li>");
            $.get($(this).attr('url'), function (data) {
                let containerDiv = "<span class='addTapPage' id='view_tab_" + pid + "'>" + data + "</span>";
                $(".contentsWrap").append(containerDiv).trigger('create');
                tabMenuFn();
            });
        }
    });

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

// topWrap 확장 함수
function topMenuOpen(element) {
    let top = $(element).parents('.topWrap').find('.gubunWrap');
    let con = $('.bottomWrap .tableWrap .conWrap');
    let con2 = $('.bottomWrap .tableWrap .conSubWrap');
    let topHeight = top.css('height', 'auto').height();
    let _h = con.height() - 100;
    let _h2 = con2.height() - 100;

    top.stop().animate({height: topHeight}, 300, 'easeOutCubic');
    con.stop().animate({height: _h}, 300, 'easeOutCubic');
    con2.stop().animate({height: _h2}, 300, 'easeOutCubic');
}

// topWrap 축소 함수
function topMenuClose(element) {
    let top = $(element).parents('.topWrap').find('.gubunWrap');
    let con = $('.bottomWrap .tableWrap .conWrap');
    let con2 = $('.bottomWrap .tableWrap .conSubWrap');
    let _h = con.height() + 100;
    let _h2 = con2.height() + 100;

    top.stop().animate({height: '36px'}, 300, 'easeInCubic');
    con.stop().animate({height: _h}, 300, 'easeInCubic');
    con2.stop().animate({height: _h2}, 300, 'easeInCubic');
}

function noPage() {
    if (!$('.addTapPage').length) {
        $('.addTapPage').show();
    }
}

//사이드 메뉴 오픈 함수
function sideMenuOpen() {
    let menu = $('.sidebarWrap');
    let con = $('.contentsWrap');
    let tm = $('.tabMenuWrap');
    menu.stop().animate({left: 0}, 300, 'easeOutCubic').addClass('on');
    tm.stop().animate({left: 284}, 300, 'easeOutCubic');
    con.stop().animate({'margin-left': '270px'}, 300, 'easeOutCubic');

}

//사이드 메뉴 클로즈 함수
function sideMenuClose() {
    let menu = $('.sidebarWrap');
    let con = $('.contentsWrap');
    let tm = $('.tabMenuWrap');
    menu.stop().animate({left: "-270px"}, 300, 'easeInCubic').removeClass('on');
    tm.stop().animate({left: "14px"}, 300, 'easeInCubic');
    con.stop().animate({'margin-left': '0px'}, 300, 'easeInCubic');
}
