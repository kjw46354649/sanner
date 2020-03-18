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
            <div id="authority-left-grid"></div>
        </div>
        <div class="col-md-9">
            <div id="authority-right-grid"></div>
        </div>
</div>

<script type="text/javascript">
    $(function () {
        'use strict';
        var click_seq;
        var leftGrid = $("#authority-left-grid");
        var rightGrid = $("#authority-right-grid");

        var leftColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', hidden: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM', editable: false}
        ];
        var rightColModel = [
            {title: '', dataType: 'string', dataIndx: 'MENU_SEQ', hidden: true},
            {title: '', dataType: 'string', dataIndx: 'PARNET_MENU_SEQ', hidden: true},
            {title: 'Top Menu', dataType: 'string', dataIndx: 'PARENT_MENU_NM', editable: false},
            {title: 'Menu', dataType: 'string', dataIndx: 'MENU_NM', editable: false},
            {title: 'Del YN' 	 , dataType: 'string', dataIndx: 'ACCESS_NM', width: '7%',
                editable: function(ui) {
                    var rowData = rightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if (rowData["PARENT_MENU_SEQ"] == 1) return false;

                    return true;
                },
                render: function(ui) {
                    var rowData = rightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                    if (rowData["PARENT_MENU_SEQ"] == 1) return "";

                    return rowData["ACCESS_NM"];
                },
                editor: {
                    type: 'select',
                    mapIndices: { name: "ACCESS_NM", id: "ACCESS_CD" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: g_selectBox('10001'),
                    getData: function(ui) {
                        var clave = ui.$cell.find("select").val();
                        var rowData = rightGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["ACCESS_CD"]=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            }
        ];

        var leftToolbar = {
            items: []
        };
        var rightToolbar = {
            cls: 'pq-leftToolbar-crud',
            items: [
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var grid = rightGrid.pqGrid('getInstance').grid;
                            //추가 또는 수정된 값이 있으면 true
                            if (grid.isDirty()) {
                                var changes = grid.getChanges({format: 'byVal'});
                                var QUERY_ID_ARRAY = {
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
                                        rightGrid.pqGrid("refreshDataAndView");
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

        leftGrid.pqGrid({
            width: "100%",
            //height: 350,
            scrollModel: {autoFit: true},
            dataModel: {
                location: "remote",
                dataType: "json",
                method: "GET",
                url: "/paramQueryGridSelect",
                postData: { 'queryId': 'selectAuthorityGroupList'},
                recIndx: 'ROLE_SEQ',
                getData: function (dataJSON) {
                    var data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            colModel: leftColModel,
            numberCell: {width: 30, title: "No", show: true },
            trackModel: {on: true},
            resizable: true,
            complete: function(event, ui) {
                leftGrid.pqGrid('setSelection', {rowIndx:0} );
            },
            rowSelect: function( event, ui ) {
                if(ui.addList.length > 0 ) {
                    var role_seq = ui.addList[0].rowData.ROLE_SEQ;
                    click_seq=role_seq;
                    selectRightList(role_seq);
                }
            },
            toolbar: leftToolbar
        });

        function selectRightList(ROLE_SEQ){
            rightGrid.pqGrid({
                width: "100%",
                //height: 400,
                scrollModel: {autoFit: true},
                dataModel: {
                    location: "remote",
                    dataType: "json",
                    method: "GET",
                    url: "/paramQueryGridSelect",
                    postData: { 'queryId': 'selectAuthorityMenuManagementList', 'ROLE_SEQ': ROLE_SEQ},
                    recIndx: 1,
                    getData: function (dataJSON) {
                        var data = dataJSON.data;
                        return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                    }
                },
                selectionModel: { type: 'row', mode: 'single'} ,
                //swipeModel: {on: false},
                colModel: rightColModel,
                numberCell: {width: 30, title: "No" , show: true},
                trackModel: {on: true},
                resizable: true,
                toolbar: rightToolbar
            });

            rightGrid.pqGrid("refreshDataAndView");
        };

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