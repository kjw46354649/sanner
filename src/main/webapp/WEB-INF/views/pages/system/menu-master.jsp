<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="page onegrid">
	<div class="bottomWrap">
		<div class="tableTopWrap">
			<div class="buttonWrap right_sort">
				<button type="button" id="menuMasterAddBtn" class="defaultBtn radius">추가</button>
				<button type="button" id="menuMasterSaveBtn" class="defaultBtn radius green">저장</button>
			</div>
			<div class="conWrap">
				<div id="menu_master_top_grid" style="margin:auto; height: auto; width: auto;" ></div>
				<div class="right_sort">
					전체 조회 건수 (Total : <span id="menu_master_total_records" style="color: #00b3ee">0</span>)
				</div>
			</div>
		</div>
		<div class="tableBottomWrap">
			<div class="buttonWrap right_sort">
				<button type="button" id="menuDetailAddBtn" class="defaultBtn radius">추가</button>
				<button type="button" id="menuDetailSaveBtn" class="defaultBtn radius green">저장</button>
			</div>
			<div class="conWrap">
				<div id="menu_master_bot_grid" style="margin:auto; height: auto; width: auto;" ></div>
				<div class="right_sort">
					전체 조회 건수 (Total : <span id="menu_detail_total_records" style="color: #00b3ee">0</span>)
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	let $menuMasterAddBtn = $("#menuMasterAddBtn");
	let $menuMasterSaveBtn = $("#menuMasterSaveBtn");

	let $menuDetailAddBtn = $("#menuDetailAddBtn");
	let $menuDetailSaveBtn = $("#menuDetailSaveBtn");

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
					options: fnGetCommCodeGridSelectBox('1042'),
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
					options: fnGetCommCodeGridSelectBox('1042'),
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
			minHeight: "auto",
			height: 480,
			width: "auto",
			selectionModel: { type: 'row', mode: 'single'} ,
			swipeModel: {on: false},
			collapsible: false,
			trackModel: {on: true},
			resizable: false,
			flexWidth: false,
			scrollModel: { autoFit: true },
			showTitle: false,
			numberCell: {title: 'No.'},
			columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
			colModel: topColModel,
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
			dataReady: function (event, ui) {
				let data = menuMasterTopGrid.pqGrid('option', 'dataModel.data');
				let totalRecords = data.length;
				$('#menu_master_total_records').html(totalRecords);
			},
			complete: function(event, ui) {
				menuMasterTopGrid.pqGrid('setSelection', {rowIndx:0} );
			},
			rowSelect: function( event, ui ) {
				if(ui.addList.length > 0 ) {
					let menu_seq = ui.addList[0].rowData.MENU_SEQ;
					click_seq=menu_seq;
					selectSubList(menu_seq);
				}
			}
		});

		$menuMasterAddBtn.click(function(){
			menuMasterTopGrid.pqGrid('addNodes', [{}], 0);
		});

		$menuMasterSaveBtn.click(function(){
			let grid = menuMasterTopGrid.pqGrid('getInstance').grid;
			//추가 또는 수정된 값이 있으면 true
			if (grid.isDirty()) {
				let changes = grid.getChanges({format: 'byVal'});
				let QUERY_ID_ARRAY = {
					'insertQueryId': ['insertTopMenuCode','insertTopMenuKr','insertTopMenuEn'],
					'updateQueryId': ['updateTopMenuCode','updateTopMenuKr','updateTopMenuEn']
				};
				changes.queryIdList = QUERY_ID_ARRAY;
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
		});

		function selectSubList(MENU_SEQ){
			menuMasterBotGrid.pqGrid({
				minHeight: "auto",
				height: 280,
				width: "auto",
				selectionModel: { type: 'row', mode: 'single'} ,
				swipeModel: {on: false},
				collapsible: false,
				trackModel: {on: true},
				resizable: false,
				flexWidth: false,
				scrollModel: { autoFit: true },
				showTitle: false,
				numberCell: {title: 'No.'},
				columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
				colModel: botColModel,
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
				dataReady: function (event, ui) {
					let data = menuMasterBotGrid.pqGrid('option', 'dataModel.data');
					let totalRecords = data.length;
					$('#menu_detail_total_records').html(totalRecords);
				}
			});
			menuMasterBotGrid.pqGrid("refreshDataAndView");

			$menuDetailAddBtn.click(function(){
				menuMasterBotGrid.pqGrid('addNodes', [{"PARENT_MENU_SEQ": click_seq}], 0);
			});

			$menuDetailSaveBtn.click(function(){
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
			});
		}

	});
</script>