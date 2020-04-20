/* Korean initialisation for the jQuery calendar extension. */
/* Written by DaeKwon Kang (ncrash.dk@gmail.com), Edited by Genie. */
jQuery(function($) {
	$.datepicker.regional['ko'] = {
		closeText : '닫기',
		prevText : '이전달',
		nextText : '다음달',
		currentText : '오늘',
		// showButtonPanel: true,
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		weekHeader : 'Wk',
		dateFormat : 'yy-mm-dd',
		firstDay : 0, // 주의 시작일을 일요일로 하려면 0, 월요일은 1 (기본값 0)
		isRTL : false,
		showMonthAfterYear : true,
		// changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		// changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		// yearRange : '1990:' + (new Date().getFullYear() + 10),
		yearSuffix: '년'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
});