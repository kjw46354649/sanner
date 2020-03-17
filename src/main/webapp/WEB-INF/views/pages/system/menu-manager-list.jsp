<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
	<div class="tit_box">
		<h5 class="title"><i class="i i-menu"></i><span> TOP Menu </span></h5>
	</div>
	<div id="system_top_menu_grid" class="jqx-refresh"></div>
	<div class="tit_box">
		<h5 class="title sub"><i class="i i-menu"></i><span>SUB Menu </span></h5>
	</div>
	<div id="system_sub_menu_grid" class="jqx-refresh"></div>
	<!--content-->
</div>

<script type="text/javascript">

	$(document).ready(function() {
		var click_seq;

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
				console.log(g_code);
			},
			complete: function(){}
		});

		var topColModel= [
			{title: 'MENU_SEQ'			, dataType: 'string',  dataIndx: 'MENU_SEQ'			, hidden: true},
			{title: 'PARENT_MENU_SEQ'	, dataType: 'string',  dataIndx: 'PARENT_MENU_SEQ'	, hidden: true},
			{title: 'Menu Name(EN)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(KR)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 				, dataType: 'string', width: '25%'	, dataIndx: 'MENU_LINK'},
			{title: 'Sort Num' 			, dataType: 'string', width: '7%'	, dataIndx: 'SORT_NUM'},
			{title: 'Use YN' 			, dataType: 'select', width: '7%'	, dataIndx: 'DEL_YN_NM',
				editor: {
					type: 'select',
					mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: g_selectBox('10000'),
					getData: function(ui) {
						var clave = ui.$cell.find("select").val();
						var rowData = menuTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
						rowData["DEL_YN"]=clave;
						return ui.$cell.find("select option[value='"+clave+"']").text();
					}
				}
			}
		];
		var subColModel= [
			{title: 'MENU_SEQ'			, dataType: 'string',  dataIndx: 'MENU_SEQ'			, hidden: true},
			{title: 'MENU_SUB_SEQ'		, dataType: 'string',  dataIndx: 'MENU_SUB_SEQ'		, hidden: true},
			{title: 'PARENT_MENU_SEQ'	, dataType: 'string',  dataIndx: 'PARENT_MENU_SEQ'	, hidden: true},
			{title: 'Menu Name(EN)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(KR)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 				, dataType: 'string', width: '25%'	, dataIndx: 'MENU_LINK'},
			{title: 'Sort Num' 			, dataType: 'string', width: '7%'	, dataIndx: 'SORT_NUM'},
			{title: 'Use YN' 			, dataType: 'string', width: '7%'	, dataIndx: 'DEL_YN_NM',
				editor: {
					type: 'select',
					mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: g_selectBox('10000'),
					getData: function(ui) {
						var clave = ui.$cell.find("select").val();
						var rowData = menuSubGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
						rowData["DEL_YN"]=clave;
						return ui.$cell.find("select option[value='"+clave+"']").text();
					}
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
				postData: { "queryId" : "systemMapper.selectUserTopMenuList"},
				recIndx: 'MENU_SEQ',
				getData: function (dataJSON) {
					var data = dataJSON.data;
					return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
				}
			},
			selectionModel: { type: 'row', mode: 'single'} ,
			swipeModel: {on: false},
			colModel: topColModel,
			numberCell: {width: 30, title: "No", show: true },
			trackModel: {on: true},
			resizable: true,
			complete: function(event, ui) {
				menuTopGrid.pqGrid('setSelection', {rowIndx:0} );
			},
			rowSelect: function( event, ui ) {
				if(ui.addList.length > 0 ) {
					var menu_seq = ui.addList[0].rowData.MENU_SEQ;
					click_seq=menu_seq;
					selectSubList(menu_seq);
				}
			},
			toolbar: {
				cls: 'pq-toolbar-crud',
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
								//추가 또는 수정된 값이 있으면 true
								console.log(grid);
								if (grid.isDirty()) {
									var changes = grid.getChanges({format: 'byVal'});
									var QUERY_ID_ARRAY = {
										'insertQueryId': ['insertTopMenuCode','insertTopMenuKr','insertTopMenuEn'],
										'updateQueryId': ['updateTopMenuCode','updateTopMenuKr','updateTopMenuEn']
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

		function selectSubList(MENU_SEQ){
			menuSubGrid.pqGrid({
				width: "100%",
				height: 400,
				scrollModel: {autoFit: true},
				dataModel: {
					location: "remote",
					dataType: "json",
					method: "GET",
					url: "/paramQueryGridSelect",
					postData: { "queryId" : "systemMapper.selectUserSubMenuList", "PARENT_MENU_SEQ": MENU_SEQ},
					recIndx: 'MENU_SUB_SEQ',
					getData: function (dataJSON) {
						var data = dataJSON.data;
						return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
					}
				},
				selectionModel: { type: 'row', mode: 'single'} ,
				//swipeModel: {on: false},
				colModel: subColModel,
				numberCell: {width: 30, title: "No" , show: true},
				trackModel: {on: true},
				resizable: true,
				toolbar: {
					items: [
						{
							type: 'button', label: 'add', listener: {
								'click': function (evt, ui) {
									menuSubGrid.pqGrid('addNodes', [{"PARENT_MENU_SEQ": click_seq}], 0);
								}
							}
						},
						{
							type: 'button', label: 'save', listener: {
								'click': function (evt, ui) {
									var grid = menuSubGrid.pqGrid('getInstance').grid;
									//추가 또는 수정된 값이 있으면 true
									if (grid.isDirty()) {
										var changes = grid.getChanges();
										var QUERY_ID_ARRAY = {
											'insertQueryId': ['insertSubMenuCode','insertTopMenuKr','insertTopMenuEn'],
											'updateQueryId': ['updateSubMenuCode','updateTopMenuKr','updateTopMenuEn']
										};
										changes.queryIdList = QUERY_ID_ARRAY;
										console.log(JSON.stringify(changes));
										$.ajax({
											type: 'POST',
											url: '/paramQueryModifyGrid',
											async: true,
											dataType: 'json',
											data: {'data': JSON.stringify(changes)},
											success: function (result) {
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

			menuSubGrid.pqGrid("refreshDataAndView");

		}

		function g_selectBox(HIGH_CD){
			var selectBoxContents = [];

			for(var i=0; i < g_code.length; i++){
				if(g_code[i].HIGH_CD == HIGH_CD){
					selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM_EN});
				}
			}

			return selectBoxContents;
		}

	});
</script>