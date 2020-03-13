<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
	<div class="wrapper">
		<div class="tit_box">
			<h5 class="title"><i class="i i-menu"></i><span> TOP Menu </span></h5>
			<div class="btnSaveCloseBox">
				<button class="btnDanger btnTopMenuAdd"><i class="fa fa-plus"></i> Add</button>
				<button class="btnDanger btnTopMenuSave"><i class="fa fa-save"></i> Save </button>
			</div>			
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
			{title: 'Menu ID'		, dataIndx: 'MENU_CD'	, hidden: true},
			{title: 'Menu Name(EN)' , width: '15%'	, dataIndx: 'MENU_NM_EN'},
			{title: 'Menu Name(ZH)' , width: '15%'	, dataIndx: 'MENU_NM_CH'},
			{title: 'Menu Name(VN)' , width: '15%'	, dataIndx: 'MENU_NM_VN'},
			{title: 'Menu Name(KR)' , width: '15%'	, dataIndx: 'MENU_NM_KR'},
			{title: 'URL' 			, width: '15%'	, dataIndx: 'URL'},
			{title: 'Icon' 			, width: '10%'	, dataIndx: 'ICON'},
			{title: 'Sort Num' 		, width: '5%'	, dataIndx: 'SORT_NUM'},
			{title: 'Use YN' 		, width: '5%'	, dataIndx: 'USE_YN_NM',
				editor: {
					type: 'select',
					/*init: function (ui) {
						ui.$cell.find("input");
					},*/
					mapIndices: { name: "USE_YN_NM", id: "USE_YN" },
					valueIndx: "value",
					labelIndx: "text",
					options: g_selectBox('10000')
				}
			}
		];

		$("#system_top_menu_grid").pqGrid({
			width: "100%",
			height: 350,
			scrollModel: {autoFit: true},
			dataModel: {
				location: "remote",
				dataType: "json",
				method: "GET",
				url: "/paramQueryGridSelect",
				postData: { "queryId" : "systemMapper.selectUserMenuList"}
			},
			selectionModel: { type: 'row' },
			colModel: colModel,
			numberCell: {width: 30, title: "No" },
			resizable: true,
			complete: function(event, ui) {
				$("#system_top_menu_grid").pqGrid('setSelection', {rowIndx:0} );
			},
			rowSelect: function( event, ui ) {
				if(ui.addList.length > 0 ) {
					selectSubList(ui.addList[0].rowData.MENU_CD);
				}
			}
		});

		function selectSubList(MENU_CD){
			$("#system_sub_menu_grid").pqGrid({
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

			$("#system_sub_menu_grid").pqGrid("refreshDataAndView");

		};

		$(".btnTopMenuAdd").on('click', function(){
			//$("#system_top_menu_grid").pqGrid('addNodes', [{}],0);
			$("#system_top_menu_grid").pqGrid('deleteRow', {rowIndx: 1});
			//$("#system_top_menu_grid").pqGrid('deleteNodes', [{}],0);

		});

		$(".btnSubMenuAdd").on('click', function(){
			$("#system_sub_menu_grid").pqGrid('addNodes', [{}],0);
		});

		$(".btnTopMenuSave").on('click', function(){
			var status = $("#system_top_menu_grid").pqGrid('getState');
			alert(status);
			console.log(status);

		});

		function g_selectBox(HIGH_CD){
			var selectBoxContents = [];
			for(var i=0; i < g_code.length; i++){
				if(g_code[i].HIGH_CD == HIGH_CD){
					selectBoxContents.push({'value':g_code[i].CODE_CD, 'text':g_code[i].CODE_NM})
				}
			}
			return selectBoxContents;
		}

	});
</script>    										    										