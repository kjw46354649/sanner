<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-18
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page main">
    <div class="leftWrap">
        <div class="chartWrap">
            <div class="hWrap">
                <h2>주요 지표 현황</h2>
            </div>
            <div class="conWrap">
                <ul>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="/resource/asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="noticeWrap">
            <div class="hWrap">
                <h2>게시판</h2>
                <a href="#a;" class="view_all">전체보기&nbsp;&nbsp;&#62;</a>
            </div>
            <div class="conWrap list">
                <ul>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#a;">
                            <div class="rowList">
                                <span class="leftText list_title">[공지] 글테스트</span>
                                <span class="rightText list_date">2020-04-12 오전 10:06</span>
                            </div>
                            <div class="rowList">
                                <span class="leftText list_text ellipsis">고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행고3.중3부터 온라인개학 이르면 4월말부터 대면수업 병행</span>
                                <span class="rightText list_write">글쓴이 : <b>최고관리자</b></span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="rightWrap">
        <div class="tableWrap">
            <div class="hWrap">
                <form class="form-inline" id="main_master_search_form" name="main_master_search_form" role="form">
                    <input type="hidden" name="queryId" id="queryId" value="main.selectMainTodayMCTList">
                    <h2>금일 가공 대상 List</h2>
                    <span class="chk_box mg-left20"><input id="pr_ex" type="checkbox"><label for="pr_ex"> 가공완료제외</label></span>
                    <span class="slt_wrap mg-left10">
                        <select class="wd_150" name="ORDER_COMP_CD" id="ORDER_COMP_CD">
                            <option value="">All</option>
                        </select>
                        <select class="label_150 mg-left10" name="MATERIAL_TYPE" id="MATERIAL_TYPE" title="재질">
                            <option value="">All</option>
                            <c:forEach var="code" items="${HighCode.H_1035}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="ipu_wrap mg-left10"><label for="dateSltd">조회일자</label><input type="text" name="INNER_DUE_DT" id="INNER_DUE_DT" placeholder="" value="" class="wd_150" title="조회일자"></span>
                    <span class="refresh"><a href="#a;"><img src="/resource/asset/images/common/btn_refresh.png" alt="새로고침"></a></span>
                </form>
            </div>
            <div class="conWrap">
                <div id="main_manager_grid" style="margin:auto; height: auto; width: auto;" ></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="main_master_total_records" style="color: #00b3ee">0</span>)
                </div>
<%--                <img src="/resource/asset/images/common/img_table_sp.jpg" alt="테이블샘플">--%>
            </div>
        </div>
    </div>
</div>
<script>

    let $mainMasterGrid;
    let mainMasterGridId = 'main_manager_grid';
    let mainMasterPostData = fnFormToJsonArrayData('main_master_search_form');

    $(function () {
        'use strict';

        $('#main_master_search_form').find('#INNER_DUE_DT').datepicker();
        $('#main_master_search_form').find('#INNER_DUE_DT').datepicker('setDate', 'today');

        fnCommCodeDatasourceSelectBoxCreate($('#main_master_search_form').find('#ORDER_COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        let mainMasterColModel = [
            {title: '긴급', dataType: 'string', dataIndx: 'EMERGENCY_YN_NM', width: 100,},
            {title: '불량', dataType: 'string', dataIndx: 'FAIL_STATUS', width: 120},
            {title: '가공납기', dataType: 'string', dataIndx: 'INNER_DUE_DT', width: 80},
            {title: 'NC계획', dataType: 'string', dataIndx: 'LAST_MCT_PLAN', width: 120},
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_NM', width: 150},
            {title: '', align: 'center', dataType: 'string', dataIndx: '', width: 25, minWidth: 25, editable: false,
                render: function (ui) {
                    if (ui.rowData['CONTROL_SEQ'] > 0) return '<span id="detailView" class="doubleFilesIcon" style="cursor: pointer"></span>';
                    return '';
                },
                postRender: function(ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find("#detailView").bind("click", function () {
                        g_item_detail_pop_view(ui.rowData['CONTROL_SEQ'], ui.rowData['CONTROL_DETAIL_SEQ']);
                    });
                }
            },
            {title: '관리번호', dataType: 'string', dataIndx: 'CONTROL_NUM', width: 200},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', width: 70},
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM', width: 150},
            {title: '수량', dataType: 'string', dataIndx: 'ORDER_QTY', width: 150},
            {title: '가공완료', dataType: 'string', dataIndx: 'LAST_PRODUCT_COMPLETE_DT', width: 150},
            {title: '현재위치', dataType: 'string', dataIndx: 'LAST_POP_POSITION', width: 150},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS', width: 150},
            {title: '영업담당', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', width: 150}
        ];

        let mainMasterObj = {
            minHeight: "auto",
            height: 800,
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
            colModel: mainMasterColModel,
            dataModel: {
                recIndx: 'ROW_NUM', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: mainMasterPostData,
                getData: function (response, textStatus, jqXHR) {
                    return {data: response.data};
                }
            },
            dataReady: function (event, ui) {
                let data = $mainMasterGrid.pqGrid('option', 'dataModel.data');
                let totalRecords = data.length;
                $('#main_master_total_records').html(totalRecords);
            },
            toolbar: false,
        };
        $mainMasterGrid = $('#' + mainMasterGridId).pqGrid(mainMasterObj);
    });
</script>