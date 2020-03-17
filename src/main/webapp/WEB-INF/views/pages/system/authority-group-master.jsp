<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <div id="authority-group-grid"></div>
</div>

<script>
    $(function () {
        'use strict';
        var searchTextId = 'authority-group-search';
        var grid;
        var gridId = 'authority-group-grid';
        var postData = {queryId: 'selectAuthorityGroupList'};
        var colModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', editable: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'},
            {title: '삭제여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'}
        ];
        var toolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: 'Access Name', attr: 'id="authority-group-search"'
                },
                {
                    type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                        'click': function (evt, ui) {
                            postData.ROLE_NM = $('#' + searchTextId).val();

                            fnRequestGidData(grid, postData);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            grid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var insertQueryList = ['insertAuthorityGroup'];
                            var updateQueryList = ['updateAuthorityGroup'];

                            fnModifyPQGrid(grid, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };

        grid = fnCreatePQGrid(gridId, postData, colModel, toolbar);
        grid.pqGrid({
            title: '권한 그룹 마스터',
            dataModel: {
                recIndx: 'ROLE_SEQ',
            }
        });
    });
</script>