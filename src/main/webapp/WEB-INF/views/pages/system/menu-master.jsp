<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid wrapper">
	<div class="col-md-3">
		<div class="row">
			<h5 class="title"><i class="i i-menu"></i><span> 견적관리 </span></h5>
		</div>
	</div>
	<div class="col-md-12">
		<div id="menu_master_top_grid" class="jqx-refresh"></div>
	</div>
	<div class="col-md-12">
		<div id="menu_master_bot_grid" class="jqx-refresh"></div>
	</div>
	<!--content-->
</div>

<script type="text/javascript">

	$(document).ready(function() {
		'use strict';
		let click_seq;
		let menuMasterTopGrid = $("#menu_master_top_grid");
		let menuMasterBotGrid = $("#menu_master_bot_grid");

		let topColModel= [
			{title: 'MENU_SEQ'			, dataType: 'string',  dataIndx: 'MENU_SEQ'			, hidden: true},
			{title: 'PARENT_MENU_SEQ'	, dataType: 'string',  dataIndx: 'PARENT_MENU_SEQ'	, hidden: true},
			{title: 'Menu Name(EN)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(KR)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 				, dataType: 'string', width: '25%'	, dataIndx: 'MENU_LINK'},
			{title: 'Sort Num' 			, dataType: 'string', width: '7%'	, dataIndx: 'SORT_NUM'},
			{title: 'Del YN' 			, dataType: 'select', width: '7%'	, dataIndx: 'DEL_YN_NM',
				editor: {
					type: 'select',
					mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: fnGetCommCodeSelectBox('10000'),
					getData: function(ui) {
						let clave = ui.$cell.find("select").val();
						let rowData = menuMasterTopGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
						rowData["DEL_YN"]=clave;
						return ui.$cell.find("select option[value='"+clave+"']").text();
					}
				}
			}
		];

		let botColModel= [
			{title: 'MENU_SEQ'			, dataType: 'string',  dataIndx: 'MENU_SEQ'			, hidden: true},
			{title: 'MENU_SUB_SEQ'		, dataType: 'string',  dataIndx: 'MENU_SUB_SEQ'		, hidden: true},
			{title: 'PARENT_MENU_SEQ'	, dataType: 'string',  dataIndx: 'PARENT_MENU_SEQ'	, hidden: true},
			{title: 'Menu Name(EN)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(KR)'		, dataType: 'string', width: '25%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 				, dataType: 'string', width: '25%'	, dataIndx: 'MENU_LINK'},
			{title: 'Sort Num' 			, dataType: 'string', width: '7%'	, dataIndx: 'SORT_NUM'},
			{title: 'Del YN' 			, dataType: 'string', width: '7%'	, dataIndx: 'DEL_YN_NM',
				editor: {
					type: 'select',
					mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: fnGetCommCodeSelectBox('10000'),
					getData: function(ui) {
						let clave = ui.$cell.find("select").val();
						let rowData = menuMasterBotGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
						rowData["DEL_YN"]=clave;
						return ui.$cell.find("select option[value='"+clave+"']").text();
					}
				}
			}
		];

		menuMasterTopGrid.pqGrid({
			width: "100%",
			height: 350,
			scrollModel: {autoFit: true},
			dataModel: {
				location: "remote",
				dataType: "json",
				method: "POST",
				url: "/paramQueryGridSelect",
				postData: { "queryId" : "systemMapper.selectUserTopMenuList"},
				recIndx: 'MENU_SEQ',
				getData: function (dataJSON) {
					let data = dataJSON.data;
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
				menuMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
			},
			rowSelect: function( event, ui ) {
				if(ui.addList.length > 0 ) {
					let menu_seq = ui.addList[0].rowData.MENU_SEQ;
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
								menuMasterTopGrid.pqGrid('addNodes', [{}], 0);
							}
						}
					},
					{
						type: 'button', label: 'save', listener: {
							'click': function (evt, ui) {
								let grid = menuMasterTopGrid.pqGrid('getInstance').grid;
								//추가 또는 수정된 값이 있으면 true
								console.log(grid);
								if (grid.isDirty()) {
									let changes = grid.getChanges({format: 'byVal'});
									let QUERY_ID_ARRAY = {
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
											menuMasterTopGrid.pqGrid("refreshDataAndView");
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
			menuMasterBotGrid.pqGrid({
				width: "100%",
				height: 400,
				scrollModel: {autoFit: true},
				dataModel: {
					location: "remote",
					dataType: "json",
					method: "POST",
					url: "/paramQueryGridSelect",
					postData: { "queryId" : "systemMapper.selectUserSubMenuList", "PARENT_MENU_SEQ": MENU_SEQ},
					recIndx: 'MENU_SUB_SEQ',
					getData: function (dataJSON) {
						let data = dataJSON.data;
						return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
					}
				},
				selectionModel: { type: 'row', mode: 'single'} ,
				//swipeModel: {on: false},
				colModel: botColModel,
				numberCell: {width: 30, title: "No" , show: true},
				trackModel: {on: true},
				resizable: true,
				toolbar: {
					items: [
						{
							type: 'button', label: 'add', listener: {
								'click': function (evt, ui) {
									menuMasterBotGrid.pqGrid('addNodes', [{"PARENT_MENU_SEQ": click_seq}], 0);
								}
							}
						},
						{
							type: 'button', label: 'save', listener: {
								'click': function (evt, ui) {
									let grid = menuMasterBotGrid.pqGrid('getInstance').grid;
									//추가 또는 수정된 값이 있으면 true
									if (grid.isDirty()) {
										let changes = grid.getChanges();
										let QUERY_ID_ARRAY = {
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
												menuMasterTopGrid.pqGrid("refreshDataAndView");
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
			menuMasterBotGrid.pqGrid("refreshDataAndView");
		}

	});
</script>