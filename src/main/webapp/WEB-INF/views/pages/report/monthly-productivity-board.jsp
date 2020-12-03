<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-11-03
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page monthly-productivity-board">
    <div class="top-wrap">
        <form id="monthly_productivity_top_form" role="form" onsubmit="return false;">
            <span class="slt_wrap">
                <label class="label_100">조회년월</label>
                <select class="wd_100" name="YEAR" id="monthly_productivity_board_year"></select>
                <select class="wd_100" name="MONTH" id="monthly_productivity_board_month"></select>
            </span>
            <span class="gubun"></span>
            <span class="slt_wrap">
                <label class="label_100" for="ORDER_COMP_CD">발주처</label>
                <select class="wd_200" name="ORDER_COMP_CD" id="order_comp_cd" title="발주처">
                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                </select>
            </span>
            <span class="gubun"></span>
            <span class="slt_wrap">
                <label class="label_100" for="work_factory">공장구분</label>
                <select class="wd_200" name="WORK_FACTORY" id="work_factory" title="공장구분">
                    <option value=""><spring:message code="com.form.top.all.option"/></option>
                    <c:forEach var="code" items="${HighCode.H_1014}">
                        <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                    </c:forEach>
                </select>
            </span>
        </form>
    </div>

    <div class="middle-wrap left-wrap">
        <div><p class="title">가공률 및 가공납기 준수 현황</p></div>
        <div id="container-speed">가공납기 준수율</div>
        <div id="pieChart">가공실적 현황</div>
        <div id="months1">월간현황</div>
        <div>
            <table class="material-production-table" id="material_production_table">
                <caption>재질별 생산량(개수기준)</caption>
                <thead>
                <tr>
                    <th scope="col">재질</th>
                    <th scope="col">품수</th>
                    <th scope="col">개수(EA)</th>
                    <th scope="col">비율</th>
                    <th scope="col">시간</th>
                    <th scope="col">비율</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td scope="row">Steel</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">AL</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">SUS</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">기타</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td scope="row">합계</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="middle-wrap right-wrap">
        <div><p class="title">가공상세현황</p></div>
        <div>
            <table class="drawing-information-table" id="drawing_information_table">
                <tr>
                    <td class="header" colspan="5">관리번호</td>
                </tr>
                <tr>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">규격</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">소재종류</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">수량</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">CAM 설계</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">E/C</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">A/P</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">마진율</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="header" colspan="3">총 가공시간</td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2">밀링</td>
                    <td></td>
                    <td>NC</td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">선반</td>
                    <td></td>
                    <td>연마</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="header" colspan="5">기기별 가공기록</td>
                </tr>
                <tr id="processing_record_1">
                    <td>1</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="processing_record_2">
                    <td>2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="processing_record_3">
                    <td>3</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="processing_record_4">
                    <td>4</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="processing_record_5">
                    <td>5</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr id="processing_record_6">
                    <td>6</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="header" colspan="5">품질검사</td>
                </tr>
                <tr>
                    <td colspan="2">등급</td>
                    <td>A</td>
                    <td colspan="2">01. 평탄미흡</td>
                </tr>
                <tr>
                    <td colspan="3">도면판독불량</td>
                    <td colspan="2">재작업</td>
                </tr>
            </table>
        </div>
        <div>
            <img id="drawing_image" src="/image/20201224" alt="도면">
        </div>
    </div>

    <div class="bottom-wrap">
        <form id="monthly_productivity_bottom_form" role="form" onsubmit="return false;">
            <div>
                <span class="title">rank list 조회</span>
                <span>
                    <span class="sub-title">> 분석대상</span>
                    <span>
                        <label for="analysis_target"></label>
                        <select class="wd_100" name="ANALYSIS_TARGET" id="analysis_target">
                            <option value="PART_QTY">수량</option>
                            <option value="WORK_TIME">시간</option>
                            <option value="UNIT_AP_AMT">A/P</option>
                            <option value="MARGIN_RATIO" selected>마진율</option>
                        </select>
                    </span>
                    <span>
                        <input type="radio" name="SORT" id="asc" value="ASC"><label for="asc">오름차순</label>
                        <input type="radio" name="SORT" id="desc" value="DESC" checked><label for="desc">내림차순</label>
                    </span>
                </span>


                <span>
                    <span class="sub-title">> 필터조건</span>
                    <span>
                        <label for="yy1">주문수량</label>
                        <select class="wd_50" name="YY1" id="yy1">
                           <c:forEach var="i" begin="1" end="30">
                               <option value="<c:out value='${i}'/>"><c:out value='${i}'/></option>
                           </c:forEach>
                        </select>
                        <select class="wd_50" name="YY2" id="yy2">
                           <c:forEach var="i" begin="1" end="30">
                               <option value="<c:out value='${i}'/>"><c:out value='${i}'/></option>
                           </c:forEach>
                      </select>
                    </span>
                    <span>
                        <label for="INSPECT_GRADE">품질검사</label>
                        <input type="text" class="wd_100" name="INSPECT_GRADE" id="INSPECT_GRADE" placeholder="<spring:message code='com.form.top.all.option' />(복수개 선택)" title="품질검사" readonly>
                    </span>
                    <span>
                        <label for="SIZE_TYPE">규격</label>
                        <select class="wd_100" name="SIZE_TYPE" id="SIZE_TYPE" title="규격">
                            <option value=""><spring:message code="com.form.top.sel.option"/></option>
                            <c:forEach var="vlocale" items="${HighCode.H_1016}">
                                <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span id="SIZE_W">
                        <input class="wd_50" type="number" name="SIZE_W_F" id="SIZE_W_F">
                        <span>~</span>
                        <input class="wd_50" type="number" name="SIZE_W_T" id="SIZE_W_T">
                    </span>
                    <span id="SIZE_H">
                        <input class="wd_50" type="number" name="SIZE_H_F" id="SIZE_H_F">
                        <span>~</span>
                        <input class="wd_50" type="number" name="SIZE_H_T" id="SIZE_H_T">
                    </span>
                    <span id="SIZE_T">
                        <input class="wd_50" type="number" name="SIZE_T_F" id="SIZE_T_F">
                        <span>~</span>
                        <input class="wd_50" type="number" name="SIZE_T_T" id="SIZE_T_T">
                    </span>
                    <span id="SIZE_D">
                        <input class="wd_50" type="number" name="SIZE_D_F" id="SIZE_D_F">
                        <span>~</span>
                        <input class="wd_50" type="number" name="SIZE_D_T" id="SIZE_D_T">
                    </span>
                    <span id="SIZE_L">
                        <input class="wd_50" type="number" name="SIZE_L_F" id="SIZE_L_F">
                        <span>~</span>
                        <input class="wd_50" type="number" name="SIZE_L_T" id="SIZE_L_T">
                    </span>
                </span>
            </div>
        </form>
        <div class="material-information" id="steel_info">
            <div>Steel</div>
            <div>수량</div>
            <div>0</div>
            <div>가공시간</div>
            <div>0h 0m</div>
            <div>E/C</div>
            <div>0원</div>
            <div>마진율</div>
            <div>0.0%</div>
            <div>A/P</div>
            <div>0원</div>
        </div>
        <div>
            <div id="steel_grid"></div>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 30px;">--%>
<%--                    <col style="width: 150px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                </colgroup>--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th scope="col">No</th>--%>
<%--                    <th scope="col">관리번호</th>--%>
<%--                    <th scope="col">수량</th>--%>
<%--                    <th scope="col">시간</th>--%>
<%--                    <th scope="col">P/H</th>--%>
<%--                    <th scope="col">C/H</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>1</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>2</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>3</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>4</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>5</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
        </div>
        <div class="material-information" id="al_info">
            <div>AL</div>
            <div>수량</div>
            <div>0</div>
            <div>가공시간</div>
            <div>0h 0m</div>
            <div>E/C</div>
            <div>0원</div>
            <div>마진율</div>
            <div>0.0%</div>
            <div>A/P</div>
            <div>0원</div>
        </div>
        <div>
            <div id="al_grid"></div>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 30px;">--%>
<%--                    <col style="width: 150px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                </colgroup>--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th scope="col">No</th>--%>
<%--                    <th scope="col">관리번호</th>--%>
<%--                    <th scope="col">수량</th>--%>
<%--                    <th scope="col">시간</th>--%>
<%--                    <th scope="col">P/H</th>--%>
<%--                    <th scope="col">C/H</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>1</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>2</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>3</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>4</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>5</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
        </div>
        <div class="material-information" id="sus_info">
            <div>SUS</div>
            <div>수량</div>
            <div>0</div>
            <div>가공시간</div>
            <div>0h 0m</div>
            <div>E/C</div>
            <div>0원</div>
            <div>마진율</div>
            <div>0.0%</div>
            <div>A/P</div>
            <div>0원</div>
        </div>
        <div>
            <div id="sus_grid"></div>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 30px;">--%>
<%--                    <col style="width: 150px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                </colgroup>--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th scope="col">No</th>--%>
<%--                    <th scope="col">관리번호</th>--%>
<%--                    <th scope="col">수량</th>--%>
<%--                    <th scope="col">시간</th>--%>
<%--                    <th scope="col">P/H</th>--%>
<%--                    <th scope="col">C/H</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>1</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>2</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>3</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>4</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>5</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
        </div>
        <div class="material-information" id="etc_info">
            <div>기타</div>
            <div>수량</div>
            <div>0</div>
            <div>가공시간</div>
            <div>0h 0m</div>
            <div>E/C</div>
            <div>0원</div>
            <div>마진율</div>
            <div>0.0%</div>
            <div>A/P</div>
            <div>0원</div>
        </div>
        <div>
            <div id="etc_grid"></div>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 30px;">--%>
<%--                    <col style="width: 150px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                    <col style="width: 50px;">--%>
<%--                </colgroup>--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th scope="col">No</th>--%>
<%--                    <th scope="col">관리번호</th>--%>
<%--                    <th scope="col">수량</th>--%>
<%--                    <th scope="col">시간</th>--%>
<%--                    <th scope="col">P/H</th>--%>
<%--                    <th scope="col">C/H</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>1</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>2</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>3</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>4</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>5</td>--%>
<%--                    <td>관리번호</td>--%>
<%--                    <td>수량</td>--%>
<%--                    <td>시간</td>--%>
<%--                    <td>P/H</td>--%>
<%--                    <td>C/H</td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
        </div>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        fnAppendSelectboxYear('monthly_productivity_board_year', 10);
        fnAppendSelectboxMonth('monthly_productivity_board_month');
        $('#monthly_productivity_board_month').val(CURRENT_MONTH < 9 ? '0' + (CURRENT_MONTH + 1) : CURRENT_MONTH + 1).prop('selected', true);
        fnCommCodeDatasourceSelectBoxCreate($('#monthly_productivity_top_form').find('#order_comp_cd'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        // (function () {
        //     let comboData = [
        //             {title: '수량', id: 'tnfid'},
        //             {title: '시간', id: 'tlrks'},
        //             {title: 'a/p', id: 'ap'},
        //             {title: '마진율', id: 'akwlsdbf'}
        //         ];
        //
        //     $('#monthly_productivity_bottom_form #analysis_target').comboTree({
        //         source: comboData,
        //         isMultiple: true,
        //         cascadeSelect: false
        //     });
        // })();
        (function () {
            let comboData = [];

            <c:forEach var="vlocale" items="${HighCode.H_1040}">
            comboData.push({title: '${vlocale.CODE_NM_KR}', id: '${vlocale.CODE_CD}'});
            </c:forEach>

            $('#monthly_productivity_bottom_form #INSPECT_GRADE').comboTree({
                source: comboData,
                isMultiple: true,
                cascadeSelect: false
            });
        })();
        // 주문수량
        // (function () {
        //     for (let i = 1; i <= 20; i++) {
        //         $('#yy1').append('<option value="' + i + '">' + i + '</option>');
        //         $('#yy2').append('<option value="' + i + '">' + i + '</option>');
        //     }
        // }());

        /* 가공납기 준수율 */
        let gaugeOptions = {
            chart: {
                type: 'solidgauge'
            },
            pane: {
                center: ['50%', '85%'],
                size: '170%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor:
                        Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },
            exporting: {
                enabled: false
            },
            tooltip: {
                enabled: false
            },

            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#55BF3B'], // green
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#DF5353'] // red
                ],
                lineWidth: 0,
                tickWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };

        // The speed gauge
        let chartSpeed = Highcharts.chart('container-speed', Highcharts.merge(gaugeOptions, {
            title: {
                text: '가공납기 준수율',
                align: 'left'
            },
            subtitle: {
                text: '대상품수: 123품<br>달성품수: 100품',
                align: 'left'
            },
            yAxis: {
                min: 0,
                max: 100,
                title: {
                    text: '전월대비 ↓ 4%'
                },

            },

            credits: {
                enabled: false
            },

            series: [{
                name: 'compliance rate',
                data: [0],
                dataLabels: {
                    format:
                        '<div style="text-align:center">' +
                        '<span style="font-size:25px">{y}</span>' +
                        '<span style="font-size:25px">%</span>' +
                        '</div>'
                },
                tooltip: {
                    valueSuffix: ' %'
                }
            }]

        }));
        /* 가공납기 준수율 */
        /* 가공실적 현황 */
        // let colors = Highcharts.getOptions().colors,
        //     data = [
        //         {
        //             name: '내부가공',
        //             y: 0,
        //             color: colors[0]
        //         },
        //         {
        //             name: '외주가공',
        //             y: 0,
        //             color: colors[1]
        //         },
        //     ];

        // Create the chart
        let pieChart = Highcharts.chart('pieChart', {
            chart: {
                type: 'pie'
            },
            title: {
                text: '가공실적 현황',
                align: 'left'
            },
            subtitle: {
                text: '0억',
                align: 'center',
                verticalAlign: 'middle',
            },
            plotOptions: {
                pie: {
                    size: 100,
                    shadow: false,
                    center: ['50%', '50%'],
                    showInLegend: true,
                    dataLabels: {
                        enabled: true,
                        format: '{point.percentage:.0f} %'
                        // format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            tooltip: {
                enabled: false,
                // valueSuffix: '%'
            },
            series: [{
                data: [],
                // size: '100%',
                innerSize: '50%',
                // dataLabels: {
                //     formatter: function () {
                //         // display only if larger than 1
                //         return this.y > 1 ? '<b>' + this.point.name + ':</b> ' +
                //             this.y + '%' : null;
                //     }
                // },
                // id: 'versions'
            }],
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 400
                    },
                    chartOptions: {
                        series: [{}, {
                            id: 'versions',
                            dataLabels: {
                                enabled: false
                            }
                        }]
                    }
                }]
            }
        });
        /* 가공실적 현황 */
        /* 월간현황 */
        let monthlyStatus = Highcharts.chart('months1', {
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: '월간현황',
                align: 'left'
            },
            xAxis: [{
                categories: ['1月', '2月', '3月', '4月', '5月', '6月',
                    '7月', '8月', '9月', '10月', '11月', '12月'],
                crosshair: true,
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}',
                    // format: '{value} mm',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                tickAmount: 5,
                title: {
                    enabled: false
                },
            }, { // Secondary yAxis
                labels: {
                    enabled: false,
                    format: '{value}',
                    // format: '{value} mm',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                tickAmount: 5,
                title: {
                    enabled: false
                },
            }, { // Tertiary yAxis
                labels: {
                    enabled: false,
                    format: '{value}%',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                tickAmount: 5,
                title: {
                    enabled: false
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                align: 'center',
                // x: 120,
                verticalAlign: 'top',
                y: 15,
                floating: true,
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || // theme
                    'rgba(255,255,255,0.25)'
            },
            series: [{
                name: '매출목표',
                type: 'column',
                data: [],
                tooltip: {
                    valueDecimals: 1,
                    valueSuffix: ' 억원'
                },
            }, {
                name: '매출현황',
                type: 'column',
                yAxis: 1,
                data: [],
                tooltip: {
                    valueDecimals: 1,
                    valueSuffix: ' 억원'
                },
            }, {
                name: '가공납기 준수율',
                type: 'spline',
                yAxis: 2,
                data: [],
                tooltip: {
                    valueSuffix: ' %'
                }
            }]
        });
        /* 월간현황 */
        const steelGridId = 'steel_grid';
        const alGridId = 'al_grid';
        const susGridId = 'sus_grid';
        const etcGridId = 'etc_grid';
        let topFrom = fnFormToJsonArrayData('#monthly_productivity_top_form');
        let bottomFrom = fnFormToJsonArrayData('#monthly_productivity_bottom_form');
        let test = $.extend(true, {}, topFrom, bottomFrom);
        let steelPostData = $.extend(true, {}, test, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP010', 'FLAG': 1});
        let alPostData = $.extend(true, {}, test, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP020', 'FLAG': 1});
        let susPostData = $.extend(true, {}, test, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP030', 'FLAG': 1});
        let etcPostData = $.extend(true, {}, test, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': "'MTP010','MTP020','MTP030'", 'FLAG': 0});
        steelPostData = {dataModel: {postData: steelPostData}};
        alPostData = {dataModel: {postData: alPostData}};
        susPostData = {dataModel: {postData: susPostData}};
        etcPostData = {dataModel: {postData: etcPostData}};

        const materialColModel = [
            {title: '관리번호', width: 180, dataIndx: 'CONTROL_NUM'},
            {title: '수량', dataIndx: 'PART_QTY'},
            {title: '가공시간', minWidth:60, dataIndx: 'WORK_TIME'},
            {title: 'E/C', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_EC_AMT'},
            {
                title: '마진율', dataIndx: 'MARGIN_RATIO',
                render: function (ui) {
                    if (ui.cellData) {
                        return ui.cellData + '%';
                    }
                }
            },
            {title: 'CONTROL_SEQ', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: '관리번호', dataIndx: 'CONTROL_NUM', hidden: true},
            {title: '규격', dataIndx: 'SIZE_TXT', hidden: true},
            {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM', hidden: true},
            // {title: '수량', dataIndx: 'PART_QTY', hidden: true},
            {title: 'CAM 설계', dataIndx: 'CAM_USER_NM', hidden: true},
            {title: 'E/C', dataIndx: 'UNIT_EC_AMT_FMT', hidden: true},
            {title: 'A/P', dataIndx: 'UNIT_AP_AMT_FMT', hidden: true},
            // {title: '마진율', dataIndx: 'MARGIN_RATIO', hidden: true},
            {title: 'WORK_TIME_NC', dataIndx: 'WORK_TIME_NC', hidden: true},
            {title: 'WORK_TIME_MILLING', dataIndx: 'WORK_TIME_MILLING', hidden: true},
            {title: 'WORK_TIME_GRINDING', dataIndx: 'WORK_TIME_GRINDING', hidden: true},
            {title: 'WORK_TIME_TURNNING', dataIndx: 'WORK_TIME_TURNNING', hidden: true},
            {title: '등급', dataIndx: 'INSPECT_GRADE_NM', hidden: true},
            {title: 'INSPECT_RESULT_NM', dataIndx: 'INSPECT_RESULT_NM', hidden: true},
            {title: 'ERROR_REASON_NM', dataIndx: 'ERROR_REASON_NM', hidden: true},
            {title: 'ERROR_ACTION_NM', dataIndx: 'ERROR_ACTION_NM', hidden: true},
            {title: 'IMG_GFILE_SEQ', dataIndx: 'IMG_GFILE_SEQ', hidden: true},
        ];
        const materialObj = {
            height: '100%',
            collapsible: false,
            resizable: false,
            showTitle: false,
            // rowHtHead: 15,
            numberCell: {title: 'No'},
            // scrollModel: {autoFit: true},
            // trackModel: {on: true},
            selectionModel: {type: 'row', mode: 'single'},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: materialColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {'queryId': 'dataSource.emptyGrid'},
                // recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            rowSelect: function (event, ui) {
                const rowData = ui.addList[0].rowData;

                changeDrawingInformationTable(rowData);
                changedrawingImage(rowData.IMG_GFILE_SEQ);
                changeProcessingRecordByDevice(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ);
            }
        };
        const $steelGrid = $('#' + steelGridId).pqGrid(materialObj);
        const $alGrid = $('#' + alGridId).pqGrid(materialObj);
        const $susGrid = $('#' + susGridId).pqGrid(materialObj);
        const $etcGrid = $('#' + etcGridId).pqGrid(materialObj);
        /* init */

        /* function */
        // 가공납기 준수율
        const changeInnerDueDtComplianceRate = function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            postData.queryId = 'reportMapper.selectInnerDueDtComplianceRate';
            let parameters = {
                'url': '/json-info',
                'data': postData
            };

            fnPostAjax(function (data) {
                if (data.info) {
                    console.group('가공납기 준수율');
                    console.log(data.info)
                    chartSpeed.setTitle(null, {text: '대상품수: ' + data.info.PART_CNT + '품<br>달성품수: ' + data.info.OK_CNT + '품'}); // subTitle
                    let point = chartSpeed.series[0].points[0];
                    point.update(data.info.OK_RATIO);
                    let arrow = '';
                    switch (data.info.RATIO_SIGN) {
                        case '+':
                            arrow = '↑';
                            break;
                        case '-':
                            arrow = '↓';
                            break;
                        default:
                            arrow = '';
                    }
                    chartSpeed.yAxis[0].setTitle({text: '전월 대비 ' + arrow + ' ' + data.info.RATIO_GAP + '%'});
                    console.groupEnd();
                    // changeMaterialProductionTable(data.info);
                } else {

                }
            }, parameters, '');
        };

        const changeProcessingPerformance = function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            postData.queryId = 'reportMapper.selectProcessingPerformance';
            let parameters = {
                'url': '/json-info',
                'data': postData
            };

            fnPostAjax(function (data) {
                if (data.info) {
                    console.group('가공실적 현황');
                    console.log(data.info)
                    console.log(pieChart);
                    let colors = Highcharts.getOptions().colors;

                    pieChart.setTitle(null, {text: data.info.SALES_AMT + '억'}); // subTitle
                    pieChart.series[0].setData([
                        {
                            name: '내부가공',
                            y: data.info.INSIDE_CNT,
                            color: colors[0]
                        },
                        {
                            name: '외주가공',
                            y: data.info.OUTSIDE_CNT,
                            color: colors[1]
                        }
                    ]);
                    console.groupEnd();
                } else {

                }
            }, parameters, '');
        }

        const changeMonthlyStatus = function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            postData.queryId = 'reportMapper.selectMonthlyStatusList';
            let parameters = {
                'url': '/json-list',
                'data': postData
            };

            fnPostAjax(function (data) {
                console.group('월간현황');

                let goalAmtList = [];
                let salesAmtList = [];
                let okRatioList = [];

                if (data.list) {
                    for (let i = 0; i < data.list.length; i++) {
                        goalAmtList[i] = data.list[i].GOAL_AMT;
                        salesAmtList[i] = data.list[i].SALES_AMT;
                        okRatioList[i] = data.list[i].OK_RATIO;
                    }
                    monthlyStatus.series[0].setData(goalAmtList);
                    monthlyStatus.series[1].setData(salesAmtList);
                    monthlyStatus.series[2].setData(okRatioList);
                } else {

                }
                console.groupEnd();

            }, parameters, '');
        };

        const changeMaterialProduction = function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            postData.queryId = 'reportMapper.selectMaterialProductionTableList';
            let parameters = {
                'url': '/json-list',
                'data': postData
            };

            fnPostAjax(function (data) {
                if (data.list) {
                    changeMaterialProductionTable(data.list);
                } else {

                }
            }, parameters, '');
        };

        const changeMaterialRankInfo = function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            postData.queryId = 'reportMapper.selectMaterialRankInfo';
            let parameters = {
                'url': '/json-list',
                'data': postData
            };

            fnPostAjax(function (data) {
                changeMaterialInformation(data.list);
            }, parameters, '');
        };

        const changeMaterialRankList = function () {
            const topFrom = fnFormToJsonArrayData('#monthly_productivity_top_form');
            const bottomFrom = fnFormToJsonArrayData('#monthly_productivity_bottom_form');
            const mergeForm = $.extend(true, {}, topFrom, bottomFrom);
            const steelPostData = $.extend(true, {}, mergeForm, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP010', 'FLAG': 1});
            const alPostData = $.extend(true, {}, mergeForm, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP020', 'FLAG': 1});
            const susPostData = $.extend(true, {}, mergeForm, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': 'MTP030', 'FLAG': 1});
            const etcPostData = $.extend(true, {}, mergeForm, {'queryId': 'reportMapper.selectMaterialRankList', 'MATERIAL_TYPE': "'MTP010','MTP020','MTP030'", 'FLAG': 0});

            $steelGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return steelPostData;
            });
            $steelGrid.pqGrid('refreshDataAndView');

            $alGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return alPostData;
            });
            $alGrid.pqGrid('refreshDataAndView');

            $susGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return susPostData;
            });
            $susGrid.pqGrid('refreshDataAndView');

            $etcGrid.pqGrid('option', 'dataModel.postData', function (ui) {
                return etcPostData;
            });
            $etcGrid.pqGrid('refreshDataAndView');
        };

        const changeMaterialProductionTable = function (data) {
            let tbodyHtmlString = '';
            let tfootHtmlString = '';

            if (data) {
                for (let i = 0; i < data.length; i++) {
                    if (i < data.length - 1) {
                        tbodyHtmlString += '<tr>';
                        tbodyHtmlString += '    <td scope="row">' + data[i].MATERIAL_TYPE_NM + '</td>';
                        tbodyHtmlString += '    <td>' + data[i].PART_CNT + '</td>';
                        tbodyHtmlString += '    <td>' + data[i].PART_QTY + '</td>';
                        tbodyHtmlString += '    <td>' + data[i].PART_QTY_RATIO + '%</td>';
                        tbodyHtmlString += '    <td>' + data[i].WORK_TIME + '</td>';
                        tbodyHtmlString += '    <td>' + data[i].WORK_TIME_RATIO + '%</td>';
                        tbodyHtmlString += '</tr>';
                    } else {
                        tfootHtmlString += '<tr>';
                        tfootHtmlString += '    <td scope="row">' + data[i].MATERIAL_TYPE_NM + '</td>';
                        tfootHtmlString += '    <td>' + data[i].PART_CNT + '</td>';
                        tfootHtmlString += '    <td>' + data[i].PART_QTY + '</td>';
                        tfootHtmlString += '    <td>' + data[i].PART_QTY_RATIO + '%</td>';
                        tfootHtmlString += '    <td>' + data[i].WORK_TIME + '</td>';
                        tfootHtmlString += '    <td>' + data[i].WORK_TIME_RATIO + '%</td>';
                        tfootHtmlString += '</tr>';
                    }
                }
            } else {

            }

            $('#material_production_table > tbody').html(tbodyHtmlString);
            $('#material_production_table > tfoot').html(tfootHtmlString);
        };

        const changeMaterialInformation = function (data) {
            if (data) {
                for (let i = 0; i < data.length; i++) {
                    let htmlString = '';
                    let material = '';
                    let id = '';

                    switch (data[i].MATERIAL_TYPE) {
                        case 'MTP010':
                            material = 'Steel';
                            id = 'steel_info';
                            break;
                        case 'MTP020':
                            material = 'AL';
                            id = 'al_info';
                            break;
                        case 'MTP030':
                            material = 'SUS';
                            id = 'sus_info';
                            break;
                        case 'MTP999':
                            material = '기타';
                            id = 'etc_info';
                            break;
                    }

                    htmlString += '<div>' + material + '</div>';
                    htmlString += '<div>수량</div>';
                    htmlString += '<div>' + data[i].PART_QTY + '</div>';
                    htmlString += '<div>가공시간</div>';
                    htmlString += '<div>' + data[i].WORK_TIME + '</div>';
                    htmlString += '<div>E/C</div>';
                    htmlString += '<div>' + data[i].TOTAL_EC_AMT + '원</div>';
                    htmlString += '<div>마진율</div>';
                    htmlString += '<div>' + data[i].MARGIN_RATIO + '%</div>';
                    htmlString += '<div>A/P</div>';
                    htmlString += '<div>' + data[i].TOTAL_AP_AMT + '원</div>';

                    $('#' + id).html(htmlString);
                }
            } else {
                const materialList = ['Steel', 'AL', 'SUS', '기타'];
                const idList = ['steel_info', 'al_info', 'sus_info', 'etc_info'];

                for (let i = 0; i < 4; i++) {
                    let htmlString = '';

                    htmlString += '<div>' + materialList[i] + '</div>';
                    htmlString += '<div>수량</div>';
                    htmlString += '<div>0</div>';
                    htmlString += '<div>가공시간</div>';
                    htmlString += '<div>0h 00m</div>';
                    htmlString += '<div>E/C</div>';
                    htmlString += '<div>0원</div>';
                    htmlString += '<div>마진율</div>';
                    htmlString += '<div>0.0%</div>';
                    htmlString += '<div>A/P</div>';
                    htmlString += '<div>0원</div>';

                    $('#' + idList[i]).html(htmlString);
                }
            }

        };

        /*const changeMaterialList = function (id, data) {
            let htmlString = '';

            if (data) {
                for (let i = 0; i < data.length; i++) {
                    htmlString += '<tr>';
                    htmlString += '    <td>' + 'data[i].1' + '</td>';
                    htmlString += '    <td>' + 'data[i].관리번호' + '</td>';
                    htmlString += '    <td>' + 'data[i].수량' + '</td>';
                    htmlString += '    <td>' + 'data[i].시간' + '</td>';
                    htmlString += '    <td>' + 'data[i].p' + '/h</td>';
                    htmlString += '    <td>' + 'data[i].c' + '/h</td>';
                    htmlString += '</tr>';
                }
            } else {
                htmlString += '<tr>';
                htmlString += '    <td colspan="6">no data.</td>';
                htmlString += '</tr>';
            }

            $('#' + id).html(htmlString);
        };*/

        const changeDrawingInformationTable = function (data) {
            let htmlString = '';

            if (data) {
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="5">관리번호</td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += data.CONTROL_NUM ? '<td colspan="5">' + data.CONTROL_NUM + '</td>' : '<td colspan="5"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">규격</td>';
                htmlString += data.SIZE_TXT ? '<td colspan="2">' + data.SIZE_TXT + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">소재종류</td>';
                htmlString += data.MATERIAL_DETAIL_NM ? '<td colspan="2">' + data.MATERIAL_DETAIL_NM + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">수량</td>';
                htmlString += data.PART_QTY ? '<td colspan="2">' + data.PART_QTY + 'EA</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">CAM 설계</td>';
                htmlString += data.CAM_USER_NM ? '<td colspan="2">' + data.CAM_USER_NM + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">E/C</td>';
                htmlString += data.UNIT_EC_AMT_FMT ? '<td colspan="2">' + data.UNIT_EC_AMT_FMT + ' 원</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">A/P</td>';
                htmlString += data.UNIT_AP_AMT_FMT ? '<td colspan="2">' + data.UNIT_AP_AMT_FMT + ' 원</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">마진율</td>';
                htmlString += data.MARGIN_RATIO ? '<td colspan="2">' + data.MARGIN_RATIO + '%</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="3">총 가공시간</td>';
                htmlString += data.WORK_TIME ? '<td colspan="2">' + data.WORK_TIME + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td colspan="2">밀링</td>';
                htmlString += data.WORK_TIME_MILLING ? '<td>' + data.WORK_TIME_MILLING + '</td>' : '<td></td>';
                htmlString += '    <td>NC</td>';
                htmlString += data.WORK_TIME_NC ? '<td>' + data.WORK_TIME_NC + '</td>' : '<td></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td colspan="2">선반</td>';
                htmlString += data.WORK_TIME_TURNNING ? '<td>' + data.WORK_TIME_TURNNING + '</td>' : '<td></td>';
                htmlString += '    <td>연마</td>';
                htmlString += data.WORK_TIME_GRINDING ? '<td>' + data.WORK_TIME_GRINDING + '</td>' : '<td></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="5">기기별 가공기록</td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_1">';
                htmlString += '    <td>1</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_2">';
                htmlString += '    <td>2</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_3">';
                htmlString += '    <td>3</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_4">';
                htmlString += '    <td>4</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_5">';
                htmlString += '    <td>5</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr id="processing_record_6">';
                htmlString += '    <td>6</td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '    <td></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td class="header" colspan="5">품질검사</td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += '    <td colspan="2">등급</td>';
                htmlString += data.INSPECT_GRADE_NM ? '<td>' + data.INSPECT_GRADE_NM + '</td>' : '<td></td>';
                htmlString += data.INSPECT_RESULT_NM ? '<td colspan="2">' + data.INSPECT_RESULT_NM + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
                htmlString += '<tr>';
                htmlString += data.ERROR_REASON_NM ? '<td colspan="3">' + data.ERROR_REASON_NM + '</td>' : '<td colspan="3"></td>';
                htmlString += data.ERROR_ACTION_NM ? '<td colspan="2">' + data.ERROR_ACTION_NM + '</td>' : '<td colspan="2"></td>';
                htmlString += '</tr>';
            }

            $('#drawing_information_table').html(htmlString);
        };

        const changedrawingImage = function (IMG_GFILE_SEQ) {
            $("#drawing_image").attr('src', /image/ + IMG_GFILE_SEQ);
        };

        const changeProcessingRecordByDevice = function (CONTROL_SEQ, CONTROL_DETAIL_SEQ) {
            let postData = {
             'queryId': 'reportMapper.selectProcessingRecordByDeviceList',
             'CONTROL_SEQ': CONTROL_SEQ,
             'CONTROL_DETAIL_SEQ': CONTROL_DETAIL_SEQ
            }
            let parameters = {
                'url': '/json-list',
                'data': postData
            };

            fnPostAjax(function (data) {
                if (data.list) {
                    for (let i = 0; i < data.list.length; i++) {
                        let htmlString ='';

                        htmlString += '    <td>' + data.list[i].RNUM + '</td>';
                        htmlString += '    <td>' + data.list[i].EQUIP_NM + '</td>';
                        htmlString += '    <td>' + data.list[i].WORK_USER_NM + '</td>';
                        if (fnIsEmpty(data.list[i].ERROR_QTY)) {
                            htmlString += '<td>' + data.list[i].FINISH_QTY + '</td>';
                        } else {
                            htmlString += '<td>' + data.list[i].FINISH_QTY + '(' + data.list[i].ERROR_QTY + ')</td>';
                        }
                        htmlString += '    <td>' + data.list[i].WORK_TIME + '</td>';

                        $('#processing_record_' + data.list[i].RNUM).html(htmlString);
                    }
                }
            }, parameters, '');
        };
        /* function */

        /* event */
        $('#monthly_productivity_top_form').on('change', function () {
            changeInnerDueDtComplianceRate();
            changeProcessingPerformance();
            changeMonthlyStatus();
            changeMaterialProduction();
            changeMaterialRankInfo();
            changeMaterialRankList();
        });

        $('#monthly_productivity_bottom_form').on('change', function () {
            changeMaterialRankInfo();
            changeMaterialRankList();
        });

        $('#monthly_productivity_bottom_form').find('#SIZE_TYPE').on('change', function () {
            const $monthlyProductivityBottomForm = $('#monthly_productivity_bottom_form');

            switch (this.value) {
                case 'XYZ010':
                    $monthlyProductivityBottomForm.find('#SIZE_W').show();
                    $monthlyProductivityBottomForm.find('#SIZE_H').show();
                    $monthlyProductivityBottomForm.find('#SIZE_T').show();
                    $monthlyProductivityBottomForm.find('#SIZE_D').hide();
                    $monthlyProductivityBottomForm.find('#SIZE_L').hide();
                    $monthlyProductivityBottomForm.find('#SIZE_D_F').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_D_T').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_L_F').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_L_T').val('');
                    break;
                case 'XYZ020':
                case 'XYZ030':
                case 'XYZ040':
                case 'XYZ050':
                    $monthlyProductivityBottomForm.find('#SIZE_W').hide();
                    $monthlyProductivityBottomForm.find('#SIZE_H').hide();
                    $monthlyProductivityBottomForm.find('#SIZE_T').hide();
                    $monthlyProductivityBottomForm.find('#SIZE_W_F').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_W_T').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_H_F').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_H_T').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_T_F').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_T_T').val('');
                    $monthlyProductivityBottomForm.find('#SIZE_D').show();
                    $monthlyProductivityBottomForm.find('#SIZE_L').show();
                    break;
                default:
                    $monthlyProductivityBottomForm.find('#SIZE_W').show();
                    $monthlyProductivityBottomForm.find('#SIZE_H').show();
                    $monthlyProductivityBottomForm.find('#SIZE_T').show();
                    $monthlyProductivityBottomForm.find('#SIZE_D').show();
                    $monthlyProductivityBottomForm.find('#SIZE_L').show();
            }
        });

        /*$(document).on('click', '.page.monthly-productivity-board .bottom-wrap div table tr', function(){
            let tr = $(this);
            let td = tr.children();
            let controlNum = td.eq(1).text();
            $('.bottom-wrap .selected').removeClass('selected');
            $(this).addClass('selected');

            (function () {
                let parameters = {
                    'url': '/json-info',
                    'data': {'queryId': 'reportMapper.getCompanyStaffList', 'CONTROL_NUM': controlNum}
                };

                fnPostAjax(function (data) {
                    changeDrawingInformationTable(data.info);
                }, parameters, '');
            })();

            (function () {
                let parameters = {
                    'url': '/json-info',
                    'data': {'queryId': 'reportMapper.getCompanyStaffList', 'CONTROL_NUM': controlNum}
                };

                fnPostAjax(function (data) {
                    if (data.info) {
                        $('#drawing_image').prop('src', '/resource/asset/images/common/img_barcode_long_on.png');
                    } else {

                    }
                }, parameters, '');
            })();
        });*/

        /*$('#drawing_image').on('click', function () {
            window.open(this.src);
        });*/

        $('.sideWrap a').on('click', function (e) {
            setTimeout(function(){
                chartSpeed.reflow();
                pieChart.reflow();
                monthlyStatus.reflow();
            }, 300);
        });

        /* init */
        changeInnerDueDtComplianceRate();
        changeProcessingPerformance();
        changeMonthlyStatus();
        changeMaterialProduction();
        changeMaterialRankInfo();
        changeMaterialRankList();
        /* init */
    });
</script>