<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-12
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="wrapper">
    <input type="text" id="common-group-code-search">
    <button id="common-group-code-search-btn">검색(임시)</button>
    <div id="common-group-code-grid" class="jqx-refresh"></div>
    <div id="common-code-grid" class="jqx-refresh"></div>
</div>

<script>
    $(function () {
        'use strict';
        var searchTextId = 'common-group-code-search';
        var searchBtnId = 'common-group-code-search-btn';
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
        /**
         * @param {string} gridId
         * @param {array} insertQueryList
         * @param {array} updateQueryList
         * @param {array} addNodes
         */
        //TODO: top,bottom toolbar 분리? 확인사항: addNodes
        var toolbar = function (gridId, insertQueryList, updateQueryList, addNodes) {
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
            {title: '그룹코드', dataType: 'string', dataIndx: 'HIGH_CD', hidden: false},
            {title: '코드', dataType: 'string', dataIndx: 'CODE_CD'},
            {title: '코드명(한글)', dataType: 'string', dataIndx: 'HIGH_NM_KR'},
            {title: '코드명(영문)', dataType: 'string', dataIndx: 'HIGH_NM_EN'},
            {title: '삭제여부', dataType: 'string', dataIndx: 'DEL_YN'},
            {title: 'Sort', dataType: 'int', dataIndx: 'SORT_NUM'},
            {title: 'ETC Code', dataType: 'string', dataIndx: 'REF_CD'},
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'},
        ];
        var bottomPostData = {queryId: 'selectCommonCodeList'};
        var bottomInsertQueryList = ['insertCommonCode'];
        var bottomUpdateQueryList = ['updateCommonCode'];


        fnCreatePQGrid(topGridId, topPostData, topColModel, toolbar(topGridId, topInsertQueryList, topUpdateQueryList, [{}]));
        //TODO: complete 됐을 때 서브 공통코드 출력하는 방법(rowSelect?)!
        $('#' + topGridId).pqGrid({
            title: '그룹코드',
            dataModel: {
                recIndx: 'HIGH_CD',
            },
            cellClick: function (event, ui) {
                bottomPostData.HIGH_CD = ui.rowData.HIGH_CD;

                fnRequestGidData(bottomGridId, bottomPostData);
            }
        });

        fnCreatePQGrid(bottomGridId, bottomPostData, bottomColModel, toolbar(bottomGridId, bottomInsertQueryList, bottomUpdateQueryList, [{}]));
        $('#' + bottomGridId).pqGrid({
            title: '공통코드',
            dataModel: {
                recIndx: 'CODE_CD',
            }
        });

        /**
         * @description 그룹코드 검색
         */
        $('#' + searchBtnId).on('click', function (event) {
            topPostData.HIGH_NM = $('#' + searchTextId).val();
            fnRequestGidData(topGridId, topPostData);
        });

        //TODO: 공통코드 add!
    });
</script>