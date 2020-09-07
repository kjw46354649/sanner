<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-13
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="page onegrid">
    <div class="topWrap">
        <form class="form-inline" id="authority_group_search_form" name="authority_group_search_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectAuthorityGroupList">
            <div class="hWrap">
                <span class="ipu_wrap">
                    <label for="sel_authority_group_nm">권한그룹 이름</label>
                    <input type="text" name="sel_authority_group_nm" id="sel_authority_group_nm" placeholder="권한그룹 이름" value="" class="pd-left5 wd_200 " title="권한그룹 이름">
                </span>
                <div class="rightSpan">
                    <span class="buttonWrap">
                        <button type="button" id="authorityGroupSearchBtn" class="defaultBtn radius blue">검색</button>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <div class="bottomWrap">
        <div class="tableWrap">
            <div class="buttonWrap right_sort">
                <button type="button" id="authorityGroupAddBtn" class="defaultBtn radius">추가</button>
<%--                <button type="button" id="authorityGroupDelBtn" class="defaultBtn radius red">삭제</button>--%>
                <button type="button" id="authorityGroupSaveBtn" class="defaultBtn radius green">저장</button>
            </div>
            <div class="conWrap">
                <div id="authority_group_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="authority_group_total_records" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let authorityGroupSearchTextId = 'authority-group-search';
    let $authorityGroupGrid;
    let authorityGroupGridId = 'authority_group_grid';
    let authorityGroupPostData = {queryId: 'selectAuthorityGroupList'};

    let $authorityGroupSearchBtn = $("#authorityGroupSearchBtn");
    let $authorityGroupAddBtn = $("#authorityGroupAddBtn");
    let $authorityGroupSaveBtn = $("#authorityGroupSaveBtn");

    $(function () {
        'use strict';
        let authorityGroupColModel = [
            {title: 'Access Code', dataType: 'string', dataIndx: 'ROLE_SEQ', editable: true},
            {title: 'Access Name', dataType: 'string', dataIndx: 'ROLE_NM'},
            {title: 'Del YN' 			, dataType: 'select', width: '7%'	, dataIndx: 'DEL_YN_NM',
                editor: {
                    type: 'select',
                    mapIndices: { name: "DEL_YN_NM", id: "DEL_YN" },
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function(ui) {
                        let clave = ui.$cell.find('select').val();
                        let rowData = $authorityGroupGrid.pqGrid('getRowData', {rowIndx: ui.rowIndx});
                        rowData['DEL_YN']=clave;
                        return ui.$cell.find("select option[value='"+clave+"']").text();
                    }
                }
            },
            {title: 'DXF File Download YN', dataType: 'select', width: '10%', dataIndx: 'DXF_FILE_DOWNLOAD_YN',
                editor: { type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')}
            },
            {title: '비고', dataType: 'string', dataIndx: 'NOTE'}
        ];
        // let authorityGroupToolbar = {
        //     cls: 'pq-toolbar-crud',
        //     items: [
        //         {
        //             type: 'textbox', label: 'Access Name', attr: 'id="authority-group-search"'
        //         },
        //         {
        //             type: 'button', label: 'Search', icon: 'ui-icon-search', listener: {
        //                 'click': function (evt, ui) {
        //                     authorityGroupPostData.ROLE_NM = $('#' + authorityGroupSearchTextId).val();
        //
        //                     fnRequestGridData($authorityGroupGrid, authorityGroupPostData);
        //                 }
        //             }
        //         },
        //         {
        //             type: 'button', label: 'Add', icon: 'ui-icon-plus', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     $authorityGroupGrid.pqGrid('addNodes', [{}], 0);
        //                 }
        //             }
        //         },
        //         {
        //             type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
        //                 'click': function (evt, ui) {
        //                     let insertQueryList = ['insertAuthorityGroup'];
        //                     let updateQueryList = ['updateAuthorityGroup'];
        //
        //                     fnModifyPQGrid($authorityGroupGrid, insertQueryList, updateQueryList);
        //                 }
        //             }
        //         }
        //     ]
        // };
        let authorityGroupObj = {
            minHeight: "auto",
            height: 770,
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
            columnTemplate: { align: 'center', hvalign: 'center', valign: 'center' }, //to vertically center align the header cells.
            toolbar: false,
            colModel: authorityGroupColModel,
            dataModel: {
                recIndx: 'ROLE_SEQ', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('authority_group_search_form'),
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $authorityGroupGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#authority_group_total_records').html(totalRecords);
            }
        };
        $authorityGroupGrid = $('#' + authorityGroupGridId).pqGrid(authorityGroupObj);

        /* 버튼 Action 처리 */
        $authorityGroupSearchBtn.click(function(event){
            $authorityGroupGrid.pqGrid("option", "dataModel.postData", function(ui){
                return fnFormToJsonArrayData('authority_group_search_form');
            } );
            $authorityGroupGrid.pqGrid("refreshDataAndView");
        });

        $authorityGroupAddBtn.click(function(event){
            $authorityGroupGrid.pqGrid('addNodes', [{}], 0);
        });

        $authorityGroupSaveBtn.click(function(event){
            let insertQueryList = ['insertAuthorityGroup'];
            let updateQueryList = ['updateAuthorityGroup'];
            fnModifyPQGrid($authorityGroupGrid, insertQueryList, updateQueryList);
        });
    });
</script>