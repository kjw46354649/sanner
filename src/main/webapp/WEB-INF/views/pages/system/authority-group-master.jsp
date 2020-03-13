<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <input type="text" id="authority-group-search">
    <button id="authority-group-search-btn">검색(임시)</button>
    <div id="authority-group-grid"></div>
</div>

<script>
    $(function () {
        'use strict';
        var searchTextId = 'authority-group-search';
        var searchBtnId = 'authority-group-search-btn';
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
                    type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            $('#' + gridId).pqGrid('addNodes', [{}], 0);
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function (evt, ui) {
                            var insertQueryList = ['insertAuthorityGroup'];
                            var updateQueryList = ['updateAuthorityGroup'];

                            fnModifyPQGrid(gridId, insertQueryList, updateQueryList);
                        }
                    }
                }
            ]
        };

        fnCreatePQGrid(gridId, postData, colModel, toolbar);
        $('#' + gridId).pqGrid({
            title: '권한 그룹 마스터',
            dataModel: {
                recIndx: 'ROLE_SEQ',
            }
        });

        /**
         * @description Access Name 검색
         */
        $('#' + searchBtnId).on('click', function (event) {
            postData.ROLE_NM = $('#' + searchTextId).val();
            fnRequestGidData(gridId, postData);
        });

    });
</script>