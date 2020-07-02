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
                <button type="button" id="userMasterAddBtn" class="defaultBtn radius">추가</button>
                <button type="button" id="userMasterDelBtn" class="defaultBtn radius red">삭제</button>
                <button type="button" id="userMasterSaveBtn" class="defaultBtn radius green">저장</button>
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

    $(function () {
        'use strict';

        const ROLE_SEQ_OPTION = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.selectRoleCommonCode'}
        });

        let userMasterColModel = [
            {title: 'ROW_NUM', clsHead: 'display_none', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '아이디', dataType: 'string', dataIndx: 'USER_ID', width: 100,// editable: true,
                editable: function (ui) {
                    if (ui.rowData.INSERT_DT) {
                        return false;
                    }else {
                        return true;
                    }
                },
            },
            {title: '이름', dataType: 'string', dataIndx: 'USER_NM', width: 120},
            {title: '패스워드', dataType: 'string', dataIndx: 'USER_PWD', width: 80},
            {title: '연락처', dataType: 'string', dataIndx: 'USER_TEL', width: 120},
            {title: '이메일', dataType: 'string', dataIndx: 'USER_EMAIL', width: 150},
            {title: '직급', dataType: 'string', dataIndx: 'POSITION_NM', width: 150},
            {title: '직책', dataType: 'string', dataIndx: 'JOB_TITLE', width: 150},
            {title: '부서', dataType: 'string', dataIndx: 'DEPARTMENT', width: 150,
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1061')
                },
                render: function (ui) {
                    let cellData = ui.cellData;
                    let departmentOption = fnGetCommCodeGridSelectBox('1061');
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let index = departmentOption.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = departmentOption.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }
                        return (index < 0) ? cellData : departmentOption[index].text;
                    }
                }
            },
            {title: '권한그룹', dataType: 'integer', dataIndx: 'ROLE_SEQ', editable: true,
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ROLE_SEQ_OPTION},
                render: function (ui) {
                    let cellData = ui.cellData;
                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let index = ROLE_SEQ_OPTION.findIndex(function (element) {
                            return element.text === cellData;
                        });
                        if (index < 0) {
                            index = ROLE_SEQ_OPTION.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        return (index < 0) ? cellData : ROLE_SEQ_OPTION[index].text;
                    }
                }
            },
            {
                title: '사용여부', dataType: 'select', dataIndx: 'DEL_YN_NM', width: 70,
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                }
            }
        ];

        let userMasterObj = {
            minHeight: "auto",
            height: 765,
            width: "auto",
            selectionModel: { type: 'row', mode: 'single'} ,
            swipeModel: {on: false},
            collapsible: false,
            trackModel: {on: true},
            resizable: false,
            flexWidth: false,
            scrollModel: { autoFit: true },
            showTitle: false,
            numberCell: {title: 'No.'},
            columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
            colModel: userMasterColModel,
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
