<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <input type="text" id="authority-menu-management-search">
    <button id="authority-menu-management-search-btn">검색(임시)</button>
    <div id="authority-role-grid"></div>
    <div id="authority-menu-grid"></div>
</div>

<script>
    $(function () {
        'use strict';
        var searchTextId = 'authority-menu-management-search';
        var searchBtnId = 'authority-menu-management-search-btn';
        var leftGridId = 'authority-role-grid';
        var leftPostData = {queryId: 'selectAuthorityMenuManagementList'};
        var leftColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', editable: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'}
        ];
        var rightGridId = 'authority-menu-grid';
        var rightPostData = {queryId: 'selectAuthorityMenuManagementList'};
        var rightColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', editable: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'}
        ];
        var rightToolbar = {
            cls: 'pq-leftToolbar-crud',
            items: [
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var insertQueryList = ['insertAuthorityMenuManagement'];
                            var updateQueryList = ['updateAuthorityMenuManagement'];

                            fnModifyPQGrid(leftGridId, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };

        fnCreatePQGrid(leftGridId, leftPostData, leftColModel, '');
        $('#' + leftGridId).pqGrid({
            title: '권한',
            dataModel: {
                recIndx: 'ROLE_SEQ',
            }
        });
        fnCreatePQGrid(rightGridId, rightPostData, rightColModel, rightToolbar);
        $('#' + rightGridId).pqGrid({
            title: '권한 & 메뉴',
            dataModel: {
                recIndx: '',
            }
        });

        /**
         * @description Access Name 검색
         */
        $('#' + searchBtnId).on('click', function (event) {
            leftPostData.ROLE_NM = $('#' + searchTextId).val();
            fnRequestGidData(leftGridId, leftPostData);
        });

    });
</script>