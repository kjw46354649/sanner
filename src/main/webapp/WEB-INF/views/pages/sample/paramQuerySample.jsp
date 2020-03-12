<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-06
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>

<div id='grid_jsonp' style='margin:5px auto;'></div>

<script>
    $(function () {
        'use strict';
        /* global variable */
        var selectedRowIndex = [];
        var userGrid = $('#grid_jsonp');
        var g_code;
        /* global variable */

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

        function g_selectBox(HIGH_CD) {
            var selectBoxContents = [];
            for (var i = 0; i < g_code.length; i++) {
                if (g_code[i].HIGH_CD == HIGH_CD) {
                    selectBoxContents.push({'value': g_code[i].CODE_CD, 'text': g_code[i].CODE_NM})
                }
            }
            return selectBoxContents;
        }

        userGrid.pqGrid({
            height: 450,
            showTop: true,
            scrollModel: {autoFit: true},
            // pageModel: {type: true},
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'GET',
                url: '/paramQueryGridSelect',
                postData: {
                    queryId: 'test1'
                    // user_id: $('#user_id').val()
                },
                recIndx: 'USER_ID',
                getData: function (dataJSON) {
                    var data = dataJSON.data;
                    return {curPage: dataJSON.curPage, totalRecords: dataJSON.totalRecords, data: data};
                }
            },
            colModel: [
                {title: 'USER_ID', dataType: 'string', dataIndx: 'USER_ID', editable: true, width: 80},
                {title: 'USER_NM', width: 165, dataType: 'string', dataIndx: 'USER_NM'},
                {title: 'USER_PWD', width: 140, dataType: 'string', dataIndx: 'USER_PWD'},
                {title: 'DEL_YN', width: 140, dataType: 'string', dataIndx: 'DEL_YN',
                    editor: {
                        type: 'select',
                        /*init: function (ui) {
                            ui.$cell.find("input");
                        },*/
                        mapIndices: { name: "USE_YN_NM", id: "USE_YN" },
                        valueIndx: "value",
                        labelIndx: "text",
                        options: g_selectBox('10000')
                    }},
            ],
            numberCell: {resizable: true, width: 30, title: '#'},
            trackModel: {on: true}, //to turn on the track changes.
            title: 'Products',
            // selectionModel: { type: 'row'},
            resizable: true,
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
            },
            toolbar: {
                items: [
                    {
                        type: 'button', label: 'add', listener: {
                            'click': function (evt, ui) {
                                userGrid.pqGrid('addNodes', [{}], 0);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'delete', listener: {
                            'click': function (evt, ui) {
                                var rowDataArray = [];
                                var QUERY_ID = 'deleteGridTest';
                                var selectedRowCount = selectedRowIndex.length;

                                for (var i = 0; i < selectedRowCount; i++) {
                                    rowDataArray[i] = (userGrid.pqGrid('getRowData', {rowIndx: selectedRowIndex[i]}));
                                    rowDataArray[i].queryId = QUERY_ID;
                                }

                                $.ajax({
                                    type: 'POST',
                                    url: '/paramQueryDeleteGrid',
                                    async: true,
                                    dataType: 'json',
                                    data: {'data': JSON.stringify(rowDataArray)},
                                    success: function (result) {
                                        console.log(result);
                                        if (selectedRowCount > 0) {
                                            var rowListConvert = [];

                                            for (var row of selectedRowIndex) {
                                                rowListConvert.push({'rowIndx': row});
                                            }

                                            userGrid.pqGrid('deleteRow', {rowList: rowListConvert});
                                        }
                                    },
                                    error: function (e) {
                                        console.error(e);
                                    }
                                });
                            }
                        }
                    },
                    {
                        type: 'button', label: 'save', listener: {
                            'click': function (evt, ui) {
                                var grid = userGrid.pqGrid('getInstance').grid;
                                //추가 또는 수정된 값이 있으면 true
                                alert(grid.getEditCellData({rowIndx: 0}));
                                return false;
                                if (grid.isDirty()) {
                                    var changes = grid.getChanges({format: 'byVal'});
                                    var QUERY_ID_ARRAY = {
                                        'insertQueryId': 'insertGridTest',
                                        'updateQueryId': 'updateGridTest'
                                    };
                                    changes.queryIdList = QUERY_ID_ARRAY;

                                    $.ajax({
                                        type: 'POST',
                                        url: '/paramQueryModifyGrid',
                                        async: true,
                                        dataType: 'json',
                                        data: {'data': JSON.stringify(changes)},
                                        success: function (result) {
                                            console.log(result);
                                            $("#grid_jsonp").pqGrid("refreshDataAndView");
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
    });
    //getEditCellData() 현재 편집중인 셀이 있는지 확인
</script>