<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-3">
            <div id="authority_left_grid"></div>
        </div>
        <div class="col-md-9">
            <div id="authority_right_grid"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        'use strict';
        let click_seq;
        let authorityLeftGrid = $("#authority_left_grid");
        let authorityRightGrid = $("#authority_right_grid");

        let authorityLeftColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', hidden: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM', editable: false}
        ];
        let authorityRightColModel = [
            {title: '', dataType: 'string', dataIndx: 'MENU_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'PARNET_MENU_SEQ', hidden: true},
            {title: 'Top Menu', dataType: 'string', dataIndx: 'PARENT_MENU_NM', editable: false},
            {title: 'Menu', dataType: 'string', dataIndx: 'MENU_NM', editable: false},
            {title: 'Del YN' 	 , dataType: 'string', dataIndx: 'ACCESS_NM', width: '7%',
                editable: function(ui) {
                    let rowData = authorityRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if(rowData["PARENT_MENU_SEQ"] == 0) return false;

                    return true;
                },
                render: function(ui) {
                    let rowData = authorityRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if(rowData["PARENT_MENU_SEQ"] == 0) return "";

                    return rowData["ACCESS_NM"];
                },
                editor: {
                    type: 'select',
                    mapIndices: { name: "ACCESS_NM", id: "ACCESS_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1043'),
                    getData: function(ui) {
                        let clave = ui.$cell.find("select").val();
                        let rowData = authorityRightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ACCESS_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            }
        ];

        let leftToolbar = {
            items: []
        };
        let rightToolbar = {
            cls: 'pq-leftToolbar-crud',
            items: [
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let grid = authorityRightGrid.pqGrid('getInstance').grid;
                            //추가 또는 수정된 값이 있으면 true
                            if (grid.isDirty()) {
                                let changes = grid.getChanges({format: 'byVal'});
                                let QUERY_ID_ARRAY = {
                                    'updateQueryId': ['insertAuthorityMenuManagement']
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
                                        authorityRightGrid.pqGrid("refreshDataAndView");
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
        };

        authorityLeftGrid.pqGrid({
            width: "100%",
            //height: 350,
            scrollModel: {autoFit: true},
            dataModel: {
                location: "remote",
                dataType: "json",
                method: "POST",
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectAuthorityGroupList'},
                recIndx: 'ROLE_SEQ',
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            colModel: authorityLeftColModel,
            numberCell: {width: 30, title: "No", show: true },
            trackModel: {on: true},
            //resizable: true,
            complete: function(event, ui) {
                authorityLeftGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            rowSelect: function( event, ui ) {
                if(ui.addList.length > 0 ) {
                    let role_seq = ui.addList[0].rowData.ROLE_SEQ;
                    click_seq=role_seq;
                    selectAuthorityRightList(role_seq);
                }
            },
            toolbar: leftToolbar
        });

        function selectAuthorityRightList(ROLE_SEQ){
            authorityRightGrid.pqGrid({
                width: "100%",
                //height: 400,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: "remote",
                    dataType: "json",
                    method: "POST",
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectAuthorityMenuManagementList', 'ROLE_SEQ': ROLE_SEQ},
                    recIndx: 1,
                    getData: function (dataJSON) {
                        let data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                selectionModel: { type: 'row', mode: 'single'} ,
                colModel: authorityRightColModel,
                numberCell: {width: 30, title: "No" , show: true},
                trackModel: {on: true},
                //resizable: true,
                toolbar: rightToolbar
            });

            authorityRightGrid.pqGrid("refreshDataAndView");
        };

    });

</script>