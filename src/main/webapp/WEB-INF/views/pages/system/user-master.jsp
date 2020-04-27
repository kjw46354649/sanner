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
        <form class="form-inline" id="user_master_search_form" name="user_master_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectUserMasterList">
            <input type="hidden" name="" id="" value="">
            <div class="hWrap">
                <span class="ipu_wrap">
                    <label for="sel_user_nm">사용자 이름</label>
                    <input type="text" name="sel_user_nm" id="sel_user_nm" placeholder="사용자 이름" value="" class="pd-left5 wd_200 " title="사용자 이름">
                </span>
                <div class="rightSpan">
                    <span class="buttonWrap">
                        <button type="button" id="userMasterSearchBtn" class="defaultBtn radius blue">검색</button>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap">
            <div class="buttonWrap right_sort">
                <button type="button" id="userMasterAddBtn" class="defaultBtn radius">추가</button>
                <button type="button" id="userMasterDelBtn" class="defaultBtn radius red">삭제</button>
                <button type="button" id="userMasterSaveBtn" class="defaultBtn radius green">저장</button>
            </div>
            <div class="conWrap">
                <div id="user_manager_grid" style="margin:auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CONFIRM_ORDER_TOTAL_RECORDS" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let userMasterSelectedRowIndex = [];
    let $userMasterGrid;
    let userMasterGridId = 'user_manager_grid';
    let userMasterPostData = fnFormToJsonArrayData('user_master_search_form');
    let $userMasterSearchBtn = $("#userMasterSearchBtn");
    let $userMasterAddBtn = $("#userMasterAddBtn");
    let $userMasterDelBtn = $("#userMasterDelBtn");
    let $userMasterSaveBtn = $("#userMasterSaveBtn");

    $(function () {
        'use strict';
        let userMasterColModel = [
            {title: 'USER_ID', dataType: 'string', dataIndx: 'USER_ID', editable: true},
            {title: 'USER_NM', dataType: 'string', dataIndx: 'USER_NM', width: "30%"},
            {title: 'USER_PWD', dataType: 'string', dataIndx: 'USER_PWD', width: "30%"},
            {
                title: 'Use YN', dataType: 'select', dataIndx: 'DEL_YN_NM', width: "10%",
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                }
            }
        ];
        let userMasterObj = {
            minHeight: 750,
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
                recIndx: 'USER_ID', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: userMasterPostData,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            complete: function () {
                let data = $confirmOrderGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                let totalOrderQuantity = 0;
                $('#CONFIRM_ORDER_TOTAL_RECORDS').html(totalRecords);
            },
            // toolbar: userMasterToolbar,
            toolbar: false,
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

        /* 버튼 Action 처리 */
        $userMasterSearchBtn.click(function(event){
            $userMasterGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('user_master_search_form');
            } );
            $userMasterGrid.pqGrid("refreshDataAndView");
        });

        $userMasterAddBtn.click(function(event){
            $userMasterGrid.pqGrid('addNodes', [{}], 0);
        });

        $userMasterDelBtn.click(function(event){
            let USER_MASTER_QUERY_ID = 'deleteUser';
            fnDeletePQGrid($userMasterGrid, userMasterSelectedRowIndex, USER_MASTER_QUERY_ID);
        });

        $userMasterSaveBtn.click(function(event){
            let userMasterInsertQueryList = ['insertUser'];
            let userMasterUpdateQueryList = ['updateUser'];

            fnModifyPQGrid($userMasterGrid, userMasterInsertQueryList, userMasterUpdateQueryList);
        });
    });
</script>
