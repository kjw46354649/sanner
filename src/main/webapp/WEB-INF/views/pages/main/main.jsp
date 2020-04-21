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
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
                    </li>
                    <li>
                        <div class="title">
                            <span class="t_text">MCT 가동률</span>
                            <span class="t_date">2019/12/17</span>
                        </div>
                        <div class="plugWrap"><img src="asset/images/common/img_char_sp.png" alt="차트 샘플"></div>
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
                <h2>금일 가공 대상 List</h2>
                <span class="chk_box"><input id="pr_ex" type="checkbox"><label for="pr_ex"> 가공완료제외</label></span>
                <span class="slt_wrap">
									<select id="customSltd" name="customSltd" title="발주처 선태">
										<option value="" selected="selected">-발주처-</option>
										<option value="1">-발주처-</option>
										<option value="2">-발주처-</option>
									</select>
									<select id="materSltd" name="materSltd" title="재질선택">
										<option value="" selected="selected">-재질-</option>
										<option value="1">-재질-</option>
										<option value="2">-재질-</option>
									</select>
								</span>
                <span class="ipu_wrap"><label for="dateSltd">조회일자</label><input type="text" name="dateSltd" id="dateSltd" placeholder="" value="2019/12/18" title="조회일자"></span>
                <span class="refresh"><a href="#a;"><img src="asset/images/common/btn_refresh.png" alt="새로고침"></a></span>
            </div>
            <div class="conWrap">
                <img src="asset/images/common/img_table_sp.jpg" alt="테이블샘플">
            </div>
        </div>
    </div>
</div>