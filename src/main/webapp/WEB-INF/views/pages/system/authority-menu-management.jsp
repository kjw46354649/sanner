<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-6">
            <div id="authority-role-grid"></div>
        </div>
        <div class="col-md-6">
            <div id="authority-menu-grid"></div>
        </div>
</div>

<script>
    $(function () {
        'use strict';
        var searchTextId = 'authority-menu-management-search';
        var leftGrid;
        var leftGridId = 'authority-role-grid';
        var leftPostData = {queryId: 'selectAuthorityGroupList'};
        var leftColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ'},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'}
        ];
        var leftToolbar = {
            items: [
                {
                    type: 'textbox', label: 'Access Name', attr: 'id="authority-menu-management-search"'
                },
                {
                    type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                        'click': function (evt, ui) {
                            leftPostData.ROLE_NM = $('#' + searchTextId).val();

                            fnRequestGidData(leftGrid, leftPostData);
                        }
                    }
                }
            ]
        };
        var rightGrid;
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

                            fnModifyPQGrid(leftGrid, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };

        leftGrid = fnCreatePQGrid(leftGridId, leftPostData, leftColModel, leftToolbar);
        leftGrid.pqGrid({
            title: '권한',
            numberCell: {
                show: false
            },
            dataModel: {
                recIndx: 'ROLE_SEQ',
            }
        });
        rightGrid = fnCreatePQGrid(rightGridId, rightPostData, rightColModel, rightToolbar);
        rightGrid.pqGrid({
            title: '권한 & 메뉴',
            dataModel: {
                recIndx: '',
            }
        });
    });
</script>