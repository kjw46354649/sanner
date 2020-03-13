<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-06
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>

<div id='user-manager-grid' style='margin:5px auto;'></div>

<script>
    $(function () {
        'use strict';
        /* global variable */
        var selectedRowIndex = [];
        var gridId = 'user-manager-grid';
        var g_code;
        /* global variable */
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
                            $('#' + gridId).pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var QUERY_ID = 'deleteUser';

                            fnDeletePQGrid(gridId, selectedRowIndex, QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var insertQueryList = ['insertUser'];
                            var updateQueryList = ['updateUser'];

//                            fnModifyPQGrid(gridId, insertQueryList, updateQueryList);
                            $('#' + gridId).pqGrid('refreshDataAndView');
                        }
                    }
                }
            ]
        };

        setTimeout(function () {
            $('#user-manager-grid').pqGrid('refreshDataAndView');
        }, 5000);

        fnCreatePQGrid(gridId, postData, colModel, toolbar);
        $('#' + gridId).pqGrid({
            dataModel: {
                recIndx: 'USER_ID',
            },
            selectChange: function (event, ui) {
                //FIXME: undefined?
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
        });
    });
</script>