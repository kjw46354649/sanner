<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
	<div class="tit_box">
		<h5 class="title"><i class="i i-menu"></i><span> TOP Menu </span></h5>
	</div>
	<div id="system_top_menu_grid" class="jqx-refresh"></div>
	<div class="tit_box">
		<h5 class="title sub"><i class="i i-menu"></i><span>SUB Menu </span></h5>
		<div class="btnSaveCloseBox">
			<div class="responsiveBtn">
				<button class="btnDanger btnSubMenuAdd"><i class="fa fa-plus"></i> Add </button>
				<button class="btnDanger btnSubMenuSave"><i class="fa fa-save"></i> Save </button>
			</div>
		</div>
	</div>
	<div id="system_sub_menu_grid" class="jqx-refresh"></div>
	<!--content-->
</div>

<script type="text/javascript">

	$(document).ready(function() {
		var selectedRowIndex = [];
		var menuTopGrid = $("#system_top_menu_grid");
		var menuSubGrid = $("#system_sub_menu_grid");

		var g_code;
		$.ajax({
			url: '/json-list',
			cache: false,
			type: "POST",
			data: {'queryId': 'systemMapper.selectSessionCodeList'},
			dataType: "json",
			async: false,
			success: function(data) {
				g_code = data.list;
			},
			complete: function(){}
		});
		var colModel= [
			{title: 'Menu ID'		, dataType: 'string',  dataIndx: 'MENU_SEQ'	, hidden: true},
			{title: 'Menu Name(EN)'	, dataType: 'string', width: '15%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(KR)'	, dataType: 'string', width: '15%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 			, dataType: 'string', width: '15%'	, dataIndx: 'MENU_LINK'},
			{title: 'Sort Num' 		, dataType: 'string', width: '5%'	, dataIndx: 'SORT_NUM'},
			{title: 'Use YN' 		, dataType: 'string', width: '5%'	, dataIndx: 'DEL_YN_NM',
				editor: {
					type: 'select',
					/*init: function (ui) {
						ui.$cell.find("input");
					},*/
					mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: g_selectBox('10000')
				}
			}
		];

		menuTopGrid.pqGrid({
			width: "100%",
			height: 350,
			scrollModel: {autoFit: true},
			dataModel: {
				location: "remote",
				dataType: "json",
				method: "GET",
				url: "/paramQueryGridSelect",
				postData: { "queryId" : "systemMapper.selectUserMenuList"},
				getData: function (dataJSON) {
					var data = dataJSON.data;
					return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
		}
			},
			selectionModel: { type: 'row' },
			colModel: colModel,
			numberCell: {width: 30, title: "No" },
            trackModel: {on: true},
			resizable: true,
			complete: function(event, ui) {
				menuTopGrid.pqGrid('setSelection', {rowIndx:0} );
			},
			rowSelect: function( event, ui ) {
				if(ui.addList.length > 0 ) {
					selectSubList(ui.addList[0].rowData.MENU_CD);
				}
			},
			toolbar: {
				items: [
					{
						type: 'button', label: 'add', listener: {
							'click': function (evt, ui) {
								menuTopGrid.pqGrid('addNodes', [{}], 0);
							}
						}
					},
					{
						type: 'button', label: 'save', listener: {
							'click': function (evt, ui) {
								var grid = menuTopGrid.pqGrid('getInstance').grid;

								alert(grid.isDirty());
								//추가 또는 수정된 값이 있으면 true
								if (grid.isDirty()) {
									var changes = grid.getChanges({format: 'byVal'});
									var QUERY_ID_ARRAY = {
										'insertQueryId': 'updateTopMenuList_I',
										'updateQueryId': 'updateTopMenuList_U'
									};
									changes.queryIdList = QUERY_ID_ARRAY;

									console.log(changes);

									$.ajax({
										type: 'POST',
										url: '/paramQueryModifyGrid',
										async: true,
										dataType: 'json',
										data: {'data': JSON.stringify(changes)},
										success: function (result) {
											console.log(result);
											menuTopGrid.pqGrid("refreshDataAndView");
										},
										error: function (e) {
											console.error(e);
										}
									});
								}
							}
						}
					}
				]
			}
		});

		function selectSubList(MENU_CD){
			menuSubGrid.pqGrid({
				width: "100%",
				height: 400,
				scrollModel: {autoFit: true},
				dataModel: {
					location: "remote",
					dataType: "json",
					method: "GET",
					url: "/paramQueryGridSelect",
					postData: { "queryId" : "systemMapper.getSystemSubMenuList", "PRT_MENU_CD": MENU_CD}
				},
				selectionModel: { type: 'row' },
				colModel: colModel,
				numberCell: {width: 30, title: "No" },
				resizable: true
			});

			menuSubGrid.pqGrid("refreshDataAndView");

		};

		$(".btnSubMenuAdd").on('click', function(){
			menuSubGrid.pqGrid('addNodes', [{}],0);
		});

		function g_selectBox(HIGH_CD){
			var selectBoxContents = [];
			/*
			for(var i=0; i < g_code.length; i++){
				if(g_code[i].HIGH_CD == HIGH_CD){
					selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM})
				}
			}
						*/
			selectBoxContents = [
				{'value':'1', 'text':'Y'},
				{'value':'0', 'text':'N'}
			]
			return selectBoxContents;
		}

	});
</script>    										    										