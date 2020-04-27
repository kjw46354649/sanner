<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-06
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding='UTF-8' contentType='text/html; charset=UTF-8' %>
<div class="page onegrid">
    <div class="topWrap">
        <form class="form-inline" id="estimate_master_search_form" name="estimate_master_search_form" role="form">
            <div class="hWrap">
                <span class="ipu_wrap"><label for="projectSltd">사용자 이름</label><input type="text" name="nameSltd" id="nameSltd" placeholder="" value="" title="사용자 이름"></span>
                <div class="rightSpan">
                    <span class="buttonWrap"><button type="button" class="defaultBtn radius blue">검색</button></span>
                </div>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div id="user_manager_grid" style="margin:auto;" ></div>
            </div>
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
            {title: 'USER_NM', dataType: 'string', dataIndx: 'USER_NM', width: "30%"},
            {title: 'USER_PWD', dataType: 'string', dataIndx: 'USER_PWD', width: "30%"},
            {
                title: 'Use YN', dataType: 'select', dataIndx: 'DEL_YN_NM', width: "10%",
                editor: {
                    type: 'select',
                    // mapIndices: {name: 'DEL_YN_NM', id: 'DEL_YN'},
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                    // getData: function (ui) {
                    //     console.log(ui);
                    //     let clave = ui.$cell.find('select').val();
                    //     console.log(clave);
                    //     let rowData = $userMasterGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                    //     console.log(rowData);
                    //     rowData['DEL_YN'] = clave;
                    //     console.log(rowData.DEL_YN);
                    //     return ui.$cell.find("select option[value='" + clave + "']").text();
                    // }
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
            height: '100%',
            minWidth: 500,
            flexWidth: false,
            resizable: true,
            scrollModel: { autoFit: true },
            collapsible: { on: true, collapsed: false },
            title: '사용자 관리',
            numberCell: {title: 'No.'},
            trackModel: {on: true}, //to turn on the track changes.
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
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
