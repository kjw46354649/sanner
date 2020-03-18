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
        var selectedRowIndex = [];
        var grid;
        var gridId = 'user-manager-grid';
        var postData = {queryId: 'selectUserManagerList'};
        var colModel = [
            {title: 'USER_ID', dataType: 'string', dataIndx: 'USER_ID', editable: true},
            {title: 'USER_NM', dataType: 'string', dataIndx: 'USER_NM'},
            {title: 'USER_PWD', dataType: 'string', dataIndx: 'USER_PWD'},
            {title: 'DEL_YN', dataType: 'string', dataIndx: 'DEL_YN'}
        ];
        var toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            grid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var QUERY_ID = 'deleteUser';

                            fnDeletePQGrid(grid, selectedRowIndex, QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var insertQueryList = ['insertUser'];
                            var updateQueryList = ['updateUser'];

                            fnModifyPQGrid(grid, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };
        /* hyoung seok 01 */
        /* hyoung seok 02 */


        var obj = {
            width: 700,
            height: 400,
            collapsible: false,
            resizable: true,
            // title: '',
            // pageModel: {type: "remote"},
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: colModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'GET',
                url: '/paramQueryGridSelect',
                postData: postData,
                // recIndx: 'USER_ID',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                    // return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            toolbar: toolbar,
            selectChange: function (event, ui) {
                if (ui.selection.iCells.ranges[0] !== undefined) {
                    selectedRowIndex = [];
                    var firstRow = ui.selection.iCells.ranges[0].r1;
                    var lastRow = ui.selection.iCells.ranges[0].r2;

                    if (firstRow === lastRow) {
                        selectedRowIndex[0] = firstRow;
                    } else {
                        for (var i = firstRow; i <= lastRow; i++) {
                            selectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        grid = $('#' + gridId).pqGrid(obj);
    });
</script>