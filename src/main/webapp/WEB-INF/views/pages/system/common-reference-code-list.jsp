<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-12
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <div id="common-group-code-grid" class="jqx-refresh"></div>
    <div id="common-code-grid" class="jqx-refresh"></div>
</div>

<script>
    $(function () {
        'use strict';
        var selectedGroupCode = null;
        var searchTextId = 'common-group-code-search';
        var topGrid;
        var topGridId = 'common-group-code-grid';
        var topColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', editable: true},
            {title: '그룹명', dataType: 'string', dataIndx: 'HIGH_NM'},
            {title: '삭제여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        var topPostData = {queryId: 'selectCommonGroupCodeList'};
        var topInsertQueryList = ['insertCommonGroupCode'];
        var topUpdateQueryList = ['updateCommonGroupCode'];
        var topToolbar = function (insertQueryList, updateQueryList) {
            return {
                cls: 'pq-toolbar-crud',
                items: [
                    {
                        type: 'textbox', label: '그룹명', attr: 'id="common-group-code-search"'
                    },
                    {
                        type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
                            'click': function (evt, ui) {
                                topPostData.HIGH_NM = $('#' + searchTextId).val();

                                fnRequestGidData(topGrid, topPostData);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                topGrid.pqGrid('addNodes', [{}], 0);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                fnModifyPQGrid(topGrid, insertQueryList, updateQueryList);
                            }
                        }
                    }
                ]
            };
        };
        var bottomGrid;
        var bottomGridId = 'common-code-grid';
        var bottomColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', hidden: false},
            {title: '코드', dataType: 'string', dataIndx: 'CODE_CD'},
            {title: '코드명(한글)', dataType: 'string', dataIndx: 'CODE_NM_KR'},
            {title: '코드명(영문)', dataType: 'string', dataIndx: 'CODE_NM_EN'},
            {title: '삭제여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: 'Sort', dataType: 'int', dataIndx: 'SORT_NUM'},
            {title: 'ETC Code', dataType: 'string', dataIndx: 'REF_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        var bottomPostData = {queryId: 'selectCommonCodeList'};
        var bottomInsertQueryList = ['insertCommonCode'];
        var bottomUpdateQueryList = ['updateCommonCode'];
        var bottomToolbar = function (insertQueryList, updateQueryList) {
            return {
                cls: 'pq-toolbar-crud',
                items: [
                    {
                        type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                bottomGrid.pqGrid('addNodes', [{'HIGH_CD': selectedGroupCode}], 0);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                fnModifyPQGrid(bottomGrid, insertQueryList, updateQueryList);
                            }
                        }
                    }
                ]
            };
        };

        topGrid = fnCreatePQGrid(topGridId, topPostData, topColModel, topToolbar(topInsertQueryList, topUpdateQueryList));
        topGrid.pqGrid({
            title: '그룹코드',
            dataModel: {
                recIndx: 'HIGH_CD',
            },
            cellClick: function (event, ui) {
                selectedGroupCode = bottomPostData.HIGH_CD = ui.rowData.HIGH_CD;

                fnRequestGidData(bottomGrid, bottomPostData);
                //TODO:
                /*
                $.ajax({
                    type: 'POST',
                    url: '/selectCommonCodeList',
                    async: true,
                    dataType: 'json',
                    data: bottomPostData.HIGH_CD,
                    success: function (dataJSON) {
                        bottomGrid.pqGrid("option", "dataModel.data", dataJSON.list);
                        bottomGrid.pqGrid('refreshDataAndView');
                    },
                    error: function (e) {
                        console.error(e);
                    }
                });
                 */
            }
        });

        bottomGrid = fnCreatePQGrid(bottomGridId, bottomPostData, bottomColModel, bottomToolbar(bottomInsertQueryList, bottomUpdateQueryList));
        bottomGrid.pqGrid({
            title: '공통코드',
            dataModel: {
                recIndx: 'CODE_CD'
            }
        });
    });
</script>