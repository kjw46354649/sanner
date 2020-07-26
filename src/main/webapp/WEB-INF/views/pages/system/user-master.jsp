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
                <button type="button" id="userMasterNewBtn" class="defaultBtn yelllowGra">신규등록</button>
<%--                <button type="button" id="userMasterAddBtn" class="defaultBtn radius">추가</button>--%>
<%--                <button type="button" id="userMasterDelBtn" class="defaultBtn radius red">삭제</button>--%>
<%--                <button type="button" id="userMasterSaveBtn" class="defaultBtn radius green">저장</button>--%>
            </div>
            <div class="conWrap">
                <div id="user_manager_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="user_master_total_records" style="color: #00b3ee">0</span>)
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

    let $userMasterNewBtn = $("#userMasterNewBtn");

    $(function () {
        'use strict';

        $userMasterNewBtn .click(function(event){
            fnResetFrom("user_info_pop_form");
            fnCommCodeDatasourceSelectBoxCreate($('#user_info_pop_form').find('#ROLE_SEQ'), 'all', {
                'url': '/json-list', 'data': {'queryId': 'dataSource.selectRoleCommonCode'}
            });
            $("#user_info_pop").modal("show");
        });

        const ROLE_SEQ_OPTION = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.selectRoleCommonCode'}
        });

        let userMasterColModel = [
            {title: 'ROW_NUM', clsHead: 'display_none', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '사진', dataType: 'string', dataIndx: 'PHOTO_GFILE_SEQ', minWidth: 80 ,
                render: function(ui){
                    let CELL_PHOTO_GFILE_SEQ = ui.rowData['PHOTO_GFILE_SEQ'];
                    if (CELL_PHOTO_GFILE_SEQ > 0) return "<img src='/image/" + CELL_PHOTO_GFILE_SEQ + "' width='100px' height='100px'>";
                    return "<img src='/image/999' width='100px' height='100px'>";
                }
            },
            {title: '아이디', dataType: 'string', dataIndx: 'USER_ID', width: 100},
            {title: '이름', dataType: 'string', dataIndx: 'USER_NM', width: 80},
            {title: '패스워드', dataType: 'string', dataIndx: 'USER_PWD', width: 80},
            {title: '연락처', dataType: 'string', dataIndx: 'USER_TEL', width: 120},
            {title: '이메일', dataType: 'string', dataIndx: 'USER_EMAIL', width: 150},
            {title: '사용 프린터', dataType: 'string', dataIndx: 'USER_PRINTER', width: 150},
            {title: '직급', dataType: 'string', dataIndx: 'POSITION_NM', width: 150},
            {title: '직책', dataType: 'string', dataIndx: 'JOB_TITLE', width: 150},
            {title: '부서', dataType: 'string', dataIndx: 'DEPARTMENT_NM', width: 150},
            {title: '권한그룹', dataType: 'integer', dataIndx: 'ROLE_SEQ_NM'},
            {title: '사용여부', dataType: 'select', dataIndx: 'DEL_YN_NM', width: 70}
        ];

        let userMasterObj = {
            minHeight: "auto",
            height: 765,
            rowHt: 100,
            width: "auto",
            strNoRows: g_noData,
            // selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center', editable: false}, //to vertically center align the header cells.
            colModel: userMasterColModel,
            // sortModel: { type: 'local', sorter: [{ dataIndx: 'USER_NM', dir: 'up'}] },
            dataModel: {
                recIndx: 'ROWNUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: userMasterPostData,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $userMasterGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#user_master_total_records').html(totalRecords);
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
            },
            cellDblClick: function (event, ui) {
                let rowData = ui.rowData;
                fnResetFrom("user_info_pop_form");
                fnCommCodeDatasourceSelectBoxCreate($('#user_info_pop_form').find('#ROLE_SEQ'), 'all', {
                    'url': '/json-list', 'data': {'queryId': 'dataSource.selectRoleCommonCode'}
                });
                $("#user_info_pop_form").find("#selUserId").val(rowData.USER_ID);
                $("#user_info_pop_form").find("#USER_ID").val(rowData.USER_ID);
                $("#user_info_pop_form").find("#USER_NM").val(rowData.USER_NM);
                $("#user_info_pop_form").find("#USER_PWD").val(rowData.USER_PWD);
                $("#user_info_pop_form").find("#USER_PRINTER").val(rowData.USER_PRINTER);
                $("#user_info_pop_form").find("#USER_TEL").val(rowData.USER_TEL);
                $("#user_info_pop_form").find("#USER_EMAIL").val(rowData.USER_EMAIL);
                $("#user_info_pop_form").find("#POSITION_NM").val(rowData.POSITION_NM);
                $("#user_info_pop_form").find("#JOB_TITLE").val(rowData.JOB_TITLE);
                $("#user_info_pop_form").find("#DEPARTMENT").val(rowData.DEPARTMENT);
                $("#user_info_pop_form").find("#ROLE_SEQ").val(rowData.ROLE_SEQ);
                $("#user_info_pop_form").find("#DEL_YN").val(rowData.DEL_YN);
                $("#user_info_pop_form").find("#PHOTO_GFILE_SEQ").val(rowData.PHOTO_GFILE_SEQ);
                $("#user_info_pop_form").find("#PHOTO_GFILE_SRC").attr("src", "/image/" + rowData.PHOTO_GFILE_SEQ);
                $("#user_info_pop").modal("show");
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
