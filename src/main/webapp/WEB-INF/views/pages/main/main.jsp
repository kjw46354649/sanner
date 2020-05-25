<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-03-18
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
                    <h2>금일 가공 대상 List</h2>
                    <span class="chk_box mg-left20"><input id="pr_ex" type="checkbox"><label for="pr_ex"> 가공완료제외</label></span>
                    <span class="slt_wrap mg-left10">
                        <select id="customSltd" name="customSltd" title="발주처 선태">
                            <option value="" selected="selected">-발주처-</option>
                            <option value="1">-발주처-</option>
                            <option value="2">-발주처-</option>
                        </select>
                        <select id="materSltd" class="mg-left5" name="materSltd" title="재질선택">
                            <option value="" selected="selected">-재질-</option>
                            <option value="1">-재질-</option>
                            <option value="2">-재질-</option>
                        </select>
                    </span>
                    <span class="ipu_wrap mg-left10"><label for="dateSltd">조회일자</label><input type="text" name="dateSltd" id="dateSltd" placeholder="" value="2019/12/18" title="조회일자"></span>
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

    // $(function () {
    //     'use strict';
    //     let mainMasterColModel = [
    //         {title: '아이디', dataType: 'string', dataIndx: 'USER_ID', width: 100,// editable: true,
    //             editable: function (ui) {
    //                 if (ui.rowData.INSERT_DT) {
    //                     return false;
    //                 }else {
    //                     return true;
    //                 }
    //             },
    //         },
    //         {title: '이름', dataType: 'string', dataIndx: 'USER_NM', width: 120},
    //         {title: '패스워드', dataType: 'string', dataIndx: 'USER_PWD', width: 80},
    //         {title: '연락처', dataType: 'string', dataIndx: 'USER_TEL', width: 120},
    //         {title: '이메일', dataType: 'string', dataIndx: 'USER_EMAIL', width: 150},
    //         {title: '직급', dataType: 'string', dataIndx: 'POSITION_NM', width: 150},
    //         {title: '직책', dataType: 'string', dataIndx: 'JOB_TITLE', width: 150},
    //         {title: '권한부서', dataType: 'string', dataIndx: 'ROLE_SEQ', width: 150}
    //     ];
    //
    //     let mainMasterObj = {
    //         minHeight: "auto",
    //         height: 765,
    //         width: "auto",
    //         selectionModel: { type: 'row', mode: 'single'} ,
    //         swipeModel: {on: false},
    //         collapsible: false,
    //         trackModel: {on: true},
    //         resizable: false,
    //         flexWidth: false,
    //         scrollModel: { autoFit: true },
    //         showTitle: false,
    //         numberCell: {title: 'No.'},
    //         columnTemplate: { align: 'center', hvalign: 'center' }, //to vertically center align the header cells.
    //         colModel: mainMasterColModel,
    //         dataModel: {
    //             recIndx: 'USER_ID', location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
    //             postData: mainMasterPostData,
    //             getData: function (response, textStatus, jqXHR) {
    //                 return {data: response.data};
    //             }
    //         },
    //         dataReady: function (event, ui) {
    //             let data = $mainMasterGrid.pqGrid('option', 'dataModel.data');
    //             let totalRecords = data.length;
    //             $('#main_master_total_records').html(totalRecords);
    //         },
    //         toolbar: false,
    //     };
    //     $mainMasterGrid = $('#' + mainMasterGridId).pqGrid(mainMasterObj);
    // });
</script>