<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-12
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <div class="tit_box">
        <h5 class="title"><i class="i i-menu"></i><span> TOP Menu </span></h5>
    </div>
    <div id="common-group-code-grid" class="jqx-refresh"></div>
    <div class="tit_box">
        <h5 class="title sub"><i class="i i-menu"></i><span>SUB Menu </span></h5>
    </div>
    <div id="common-code-grid" class="jqx-refresh"></div>
</div>

<script>
    $(function () {
        'use strict';
        var topGridId = 'common-group-code-grid';
        var topColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', editable: true},
            {title: '그룹명', dataType: 'string', dataIndx: 'HIGH_NM'},
            {title: '사용여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        var topPostData = {queryId: 'selectCommonGroupCodeList'};
        var topInsertQueryList = ['insertCommonGroupCode'];
        var topUpdateQueryList = ['updateCommonGroupCode'];
        var toolbar = function (gridId, insertQueryList, updateQueryList) {
            return {
                cls: 'pq-toolbar-crud',
                items: [
                    {
                        type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                //TODO: 컬럼 추가
                                $('#' + gridId).pqGrid('addNodes', [{}], 0);
                            }
                        }
                    },
                    {
                        type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                            'click': function (evt, ui) {
                                fnModifyPQGrid(gridId, insertQueryList, updateQueryList);
                            }
                        }
                    }
                ]
            };
        };
        var bottomGridId = 'common-code-grid';
        var bottomColModel = [
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', editable: false},
            {title: '코드', dataType: 'string', dataIndx: 'CODE_CD'},
            {title: '코드명(한글)', dataType: 'string', dataIndx: 'HIGH_NM_KR'},
            {title: '코드명(영문)', dataType: 'string', dataIndx: 'HIGH_NM_EN'},
            {title: '사용여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: 'Sort', dataType: 'int', dataIndx: 'SORT_NUM'},
            {title: 'ETC Code', dataType: 'string', dataIndx: 'REF_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        var bottomPostData = {queryId: 'selectCommonCodeList'};
        var bottomInsertQueryList = ['insertCommonCode'];
        var bottomUpdateQueryList = ['updateCommonCode'];

        fnCreatePQGrid(topGridId, topPostData, topColModel, toolbar(topGridId, topInsertQueryList, topUpdateQueryList));
        $('#' + topGridId).pqGrid({
            dataModel: {
                recIndx: 'HIGH_CD',
            },
            complete: function (event, ui) {
                $('#' + topGridId).pqGrid('setSelection', {rowIndx: 0});
            },
            rowSelect: function (event, ui) {
                if (ui.addList.length > 0) {
                    //TODO: 그리드생성 말고 값 변경으로
                    bottomPostData.HIGH_CD = ui.addList[0].rowData.HIGH_CD;

                    fnCreatePQGrid(bottomGridId, bottomPostData, bottomColModel, toolbar(bottomGridId, bottomInsertQueryList, bottomUpdateQueryList));
                    $('#' + bottomGridId).pqGrid({
                        dataModel: {
                            recIndx: 'CODE_CD',
                        }
                    });
                }
            },
        });

        fnCreatePQGrid(bottomGridId, bottomPostData, bottomColModel, toolbar(bottomGridId, bottomInsertQueryList, bottomUpdateQueryList));
        // $('#' + bottomGridId).pqGrid({
        //     dataModel: {
        //         recIndx: 'CODE_CD',
        //     }
        // });

    });
</script>