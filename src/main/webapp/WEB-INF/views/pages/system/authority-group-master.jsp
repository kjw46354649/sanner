<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="container-fluid wrapper">
    <div class="row">
        <div class="col-md-12">
            <div id="authority_group_grid"></div>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        let authorityGroupSearchTextId = 'authority-group-search';
        let authorityGroupGrid;
        let authorityGroupGridId = 'authority_group_grid';
        let authorityGroupPostData = {queryId: 'selectAuthorityGroupList'};
        let authorityGroupColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', editable: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'},
            {title: '삭제여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'}
        ];
        let authorityGroupToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'textbox', label: 'Access Name', attr: 'id="authority-group-search"'
                },
                {
                    type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                        'click': function (evt, ui) {
                            authorityGroupPostData.ROLE_NM = $('#' + authorityGroupSearchTextId).val();

                            fnRequestGidData(authorityGroupGrid, authorityGroupPostData);
                        }
                    }
                },
                {
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            authorityGroupGrid.pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            let insertQueryList = ['insertAuthorityGroup'];
                            let updateQueryList = ['updateAuthorityGroup'];

                            fnModifyPQGrid(authorityGroupGrid, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };
        let authorityGroupObj = {
            collapsible: false,
            resizable: true,
            title: '권한 그룹 마스터',
            numberCell: {title: 'No.'},
            scrollModel: {autoFit: true},
            trackModel: {on: true}, //to turn on the track changes.
            colModel: authorityGroupColModel,
            dataModel: {
                location: 'remote',
                dataType: 'json',
                method: 'POST',
                url: '/paramQueryGridSelect',
                postData: authorityGroupPostData,
                recIndx: 'ROLE_SEQ',
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            toolbar: authorityGroupToolbar
        };
        authorityGroupGrid = $('#' + authorityGroupGridId).pqGrid(authorityGroupObj);
    });
</script>