<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="page onegrid">
    <div class="bottomWrap">
        <form class="form-inline" id="authority_access_group_search_form" name="authority_access_group_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectAuthorityGroupList">
        </form>
        <form class="form-inline" id="authority_access_menu_search_form" name="authority_access_menu_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectAuthorityMenuManagementList">
            <input type="hidden" name="ROLE_SEQ" id="ROLE_SEQ" value="">
        </form>
        <div class="tableNotSearchOneGridWrap">
            <div class="conWrap">
                <div class="left-30Warp">
                    <div style="line-height: 37px;">&nbsp;</div>
                    <div id="authority_access_group_grid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="authority_access_group_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
                <div class="right-70Warp">
                    <div class="buttonWrap right_sort">
                        <button type="button" id="authorityAccessMenuSaveBtn" class="defaultBtn radius green">저장</button>
                    </div>
                    <div id="authority_access_menu_grid"></div>
                    <div class="right_sort">
                        전체 조회 건수 (Total : <span id="authority_access_menu_total_records" style="color: #00b3ee">0</span>)
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<div class="container-fluid wrapper">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-3">--%>
<%--            <div id="authority_left_grid"></div>--%>
<%--        </div>--%>
<%--        <div class="col-md-9">--%>
<%--            <div id="authority_right_grid"></div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script type="text/javascript">

    let click_seq;
    let $authorityAccessGroupGrid = $("#authority_access_group_grid");
    let $authorityAccessMenuGrid = $("#authority_access_menu_grid");

    let $authorityAccessMenuSaveBtn = $("#authorityAccessMenuSaveBtn");

    $(function () {
        'use strict';

        let authorityLeftColModel = [
            {title: '권한그룹 코드', dataType: 'string', align: "center", width: '20%', dataIndx: 'ROLE_SEQ', editable: false},
            {title: '권한그룹 이름', dataType: 'string', dataIndx: 'ROLE_NM', editable: false}
        ];

        $authorityAccessGroupGrid.pqGrid({
            height: 825,
            width: 472,
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'left', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            toolbar: false,
            colModel: authorityLeftColModel,
            dataModel: {
                recIndx: 'ROLE_SEQ', location: "remote", dataType: "json", method: "POST", url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('authority_access_group_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $authorityAccessGroupGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#authority_access_group_total_records').html(totalRecords);
            },
            complete: function(event, ui) {
                $authorityAccessGroupGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            rowSelect: function( event, ui ) {
                let role_seq = ui.addList[0].rowData.ROLE_SEQ;
                $("#authority_access_menu_search_form").find("#ROLE_SEQ").val(role_seq);
                $authorityAccessMenuGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('authority_access_menu_search_form');
                } );
                $authorityAccessMenuGrid.pqGrid("refreshDataAndView");
            }
        });

        let authorityRightColModel = [
            {title: '', dataType: 'string', dataIndx: 'MENU_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'PARNET_MENU_SEQ', hidden: true},
            {title: '대메뉴', dataType: 'string', dataIndx: 'PARENT_MENU_NM', width: '20%', editable: false},
            {title: '메뉴', dataType: 'string', dataIndx: 'MENU_NM', align: "left", editable: false},
            {title: '메뉴 사용유무' 	 , dataType: 'string', dataIndx: 'ACCESS_NM', width: '10%',
                editable: function(ui) {
                    let rowData = $authorityAccessMenuGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if(rowData["PARENT_MENU_SEQ"] == 0) return false;
                    return true;
                },
                render: function(ui) {
                    let rowData = $authorityAccessMenuGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if(rowData["PARENT_MENU_SEQ"] == 0) return "";
                    return rowData["ACCESS_NM"];
                },
                editor: {
                    type: 'select',
                    mapIndices: { name: "ACCESS_NM", id: "ACCESS_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = $authorityAccessMenuGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ACCESS_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            }
        ];

        // let rightToolbar = {
        //     cls: 'pq-leftToolbar-crud',
        //     items: [
        //         {
        //             type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     let grid = $authorityAccessMenuGrid.pqGrid('getInstance').grid;
        //                     //추가 또는 수정된 값이 있으면 true
        //                     if (grid.isDirty()) {
        //                         let changes = grid.getChanges({format: 'byVal'});
        //                         let QUERY_ID_ARRAY = {
        //                             'updateQueryId': ['insertAuthorityMenuManagement']
        //                         };
        //
        //                         changes.queryIdList = QUERY_ID_ARRAY;
        //                         console.log(changes);
        //                         $.ajax({
        //                             type: 'POST',
        //                             url: '/paramQueryModifyGrid',
        //                             async: true,
        //                             dataType: 'json',
        //                             data: {'data': JSON.stringify(changes)},
        //                             success: function (result) {
        //                                 $authorityAccessMenuGrid.pqGrid("refreshDataAndView");
        //                             },
        //                             error: function (e) {
        //                                 console.error(e);
        //                             }
        //                         });
        //
        //                     }
        //                 }
        //             }
        //         }
        //     ]
        // };

        $authorityAccessMenuGrid.pqGrid({
            height: 825,
            width: "100%",
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            toolbar: false,
            colModel: authorityRightColModel,
            dataModel: {
                recIndx: "MENU_SEQ", location: "remote", dataType: "json", method: "POST", url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('authority_access_menu_search_form'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            dataReady: function (event, ui) {
                let data = $authorityAccessMenuGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#authority_access_menu_total_records').html(totalRecords);
            }
        });

        // function selectAuthorityRightList(ROLE_SEQ){
        //     $authorityAccessMenuGrid.pqGrid({
        //         width: "100%",
        //         //height: 400,
        //         scrollModel: {autoFit: true},
        //         dataModel: {
        //             location: "remote",
        //             dataType: "json",
        //             method: "POST",
        //             url: "/paramQueryGridSelect",
        //             postData: { 'queryId': 'selectAuthorityMenuManagementList', 'ROLE_SEQ': ROLE_SEQ},
        //             recIndx: 1,
        //             getData: function (dataJSON) {
        //                 let data = dataJSON.data;
        //                 return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
        //             }
        //         },
        //         selectionModel: { type: 'row', mode: 'single'} ,
        //         colModel: authorityRightColModel,
        //         numberCell: {width: 30, title: "No" , show: true},
        //         trackModel: {on: true},
        //         //resizable: true,
        //         toolbar: rightToolbar
        //     });
        //
        //     $authorityAccessGroupGrid.pqGrid("refreshDataAndView");
        // };

        $authorityAccessMenuSaveBtn.click(function(){
            let grid = $authorityAccessMenuGrid.pqGrid('getInstance').grid;
            //추가 또는 수정된 값이 있으면 true
            // console.log(grid.isDirty());


            if (grid.isDirty()) {


                let changes = grid.getChanges({format: 'byVal'});
                let QUERY_ID_ARRAY = {
                    'updateQueryId': ['insertAuthorityMenuManagement']
                };
                changes.queryIdList = QUERY_ID_ARRAY;
                $.ajax({
                    type: 'POST',
                    url: '/paramQueryModifyGrid',
                    async: true,
                    dataType: 'json',
                    data: {'data': JSON.stringify(changes)},
                    success: function (result) {
                        $authorityAccessMenuGrid.pqGrid("refreshDataAndView");
                    },
                    error: function (e) {
                        console.error(e);
                    }
                });

            }
        });

    });

</script>