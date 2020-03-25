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
            <div id='user_manager_grid' style='margin:5px auto;'></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let userMasterSelectedRowIndex = [];
        let $userMasterGrid;
        let userMasterGridId = 'user_manager_grid';
        let userMasterPostData = {queryId: 'selectUserMasterList'};
        let userMasterColModel = [
            {title: 'USER_ID', dataType: 'string', dataIndx: 'USER_ID', editable: true},
            {title: 'USER_NM', dataType: 'string', dataIndx: 'USER_NM'},
            {title: 'USER_PWD', dataType: 'string', dataIndx: 'USER_PWD'},
            {
                title: 'Use YN', dataType: 'select', width: '7%', dataIndx: 'DEL_YN_NM',
                editor: {
                    type: 'select',
                    mapIndices: {name: 'DEL_YN_NM', id: 'DEL_YN'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1045'),
                    getData: function (ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $userMasterGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['DEL_YN'] = clave;
                        return ui.$cell.find("select option[value='" + clave + "']").text();
                    }
                }
            }
        ];
        let userMasterToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $userMasterGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Delete', icon: 'ui-icon-minus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let USER_MASTER_QUERY_ID = 'deleteUser';

                            fnDeletePQGrid($userMasterGrid, userMasterSelectedRowIndex, USER_MASTER_QUERY_ID);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let userMasterInsertQueryList = ['insertUser'];
                            let userMasterUpdateQueryList = ['updateUser'];

                            fnModifyPQGrid($userMasterGrid, userMasterInsertQueryList, userMasterUpdateQueryList);
                        }
                    }
                }
            ]
        };
        let userMasterObj = {
            collapsible: false,
            resizable: true,
            title: '사용자 관리',
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            columnTemplate: {
                align: 'center',
                hvalign: 'center' //to vertically center align the header cells.
            },
            colModel: userMasterColModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'POST',
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
                    let userMasterGridFirstRow = ui.selection.iCells.ranges[0].r1;
                    let userMasterGridLastRow = ui.selection.iCells.ranges[0].r2;

                    if (userMasterGridFirstRow === userMasterGridLastRow) {
                        userMasterSelectedRowIndex[0] = userMasterGridFirstRow;
                    } else {
                        for (let i = userMasterGridFirstRow; i <= userMasterGridLastRow; i++) {
                            userMasterSelectedRowIndex.push(i);
                        }
                    }
                }
            }
        };
        $userMasterGrid = $('#' + userMasterGridId).pqGrid(userMasterObj);
    });
</script>
