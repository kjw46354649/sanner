<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-06
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>
<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-12">
            <div id='user-manager-grid' style='margin:5px auto;'></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        var g_code;
        $.ajax({
            url: '/json-list',
            cache: false,
            type: "POST",
            data: {'queryId': 'systemMapper.selectSessionCodeList'},
            dataType: "json",
            async: false,
            success: function (data) {
                g_code = data.list;
                console.log(g_code);
            },
            complete: function () {
            }
        });

        function g_selectBox(HIGH_CD) {
            var selectBoxContents = [];

            for (var i = 0; i < g_code.length; i++) {
                if (g_code[i].HIGH_CD == HIGH_CD) {
                    selectBoxContents.push({'value': g_code[i].CODE_CD, 'text': g_code[i].CODE_NM_EN});
                }
            }

            return selectBoxContents;
        }

        var userMasterSelectedRowIndex = [];
        var userMasterGrid;
        var userMasterGridId = 'user-manager-grid';
        var userMasterPostData = {queryId: 'selectUserMasterList'};
        var userMasterColModel = [
            {title: 'USER_ID', dataType: 'string', dataIndx: 'USER_ID', editable: true},
            {title: 'USER_NM', dataType: 'string', dataIndx: 'USER_NM'},
            {title: 'USER_PWD', dataType: 'string', dataIndx: 'USER_PWD'},
            {
                title: 'Use YN', dataType: 'select', width: '7%', dataIndx: 'DEL_YN_NM',
                editor: {
                    type: 'select',
                    mapIndices: {name: "DEL_YN_NM", id: "DEL_YN"},
                    valueIndx: "value",
                    labelIndx: "text",
                    options: g_selectBox('10000'),
                    getData: function (ui) {
                        var clave = ui.$cell.find("select").val();
                        var rowData = userMasterGrid.pqGrid("getRowData", {rowIndx: ui.rowIndx});
                        rowData["DEL_YN"] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            }
        ];
        var userMasterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            userMasterGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var USER_MASTER_QUERY_ID = 'deleteUser';

                            fnDeletePQGrid(userMasterGrid, userMasterSelectedRowIndex, USER_MASTER_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var userMasterInsertQueryList = ['insertUser'];
                            var userMasterUpdateQueryList = ['updateUser'];

                            fnModifyPQGrid(userMasterGrid, userMasterInsertQueryList, userMasterUpdateQueryList);
                        }
                    }
                }
            ]
        };
        var userMasterObj = {
            collapsible: false,
            resizable: true,
            title: '사용자 관리',
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: userMasterColModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'GET',
                url: '/paramQueryGridSelect',
                postData: userMasterPostData,
                recIndx: 'USER_ID',
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            toolbar: userMasterToolbar,
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    userMasterSelectedRowIndex = [];
                    var userMasterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    var userMasterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (userMasterGridFirstRow === userMasterGridLastRow) {
                        userMasterSelectedRowIndex[0] = userMasterGridFirstRow;
                    } else {
                        for (var i = userMasterGridFirstRow; i <= userMasterGridLastRow; i++) {
                            userMasterSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        userMasterGrid = $('#' + userMasterGridId).pqGrid(userMasterObj);
    });
</script>
