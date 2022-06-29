<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2021-01-27
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
<%--<jsp:include page="/WEB-INF/views/attr/tabs/body-menu.jsp"/>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>게시판</title>
</head>
<body>
<div class="page onegrid nonYscroll">
    <div class="topWrap" style="margin-top: 1%;">
        <form class="form-inline" id="dash_board_search_form" name="dash_board_search_form" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="main.selectBoardList">
            <input type="hidden" name="PAGE_NUM" id="PAGE_NUM" value="">
            <input type="hidden" name="PAGE_SIZE" id="PAGE_SIZE" value="10">
            <div class="hWrap">
                <span class="ipu_wrap">
                    <label for="SEARCH_TITLE">제목</label>
                    <input type="text" name="SEARCH_TITLE" id="SEARCH_TITLE" placeholder="제목" class="pd-left5 wd_200 " title="제목">
                </span>
                <div class="rightSpan">
                    <span class="buttonWrap">
                        <button type="button" id="dashBoardSearchBtn" class="defaultBtn radius blue">검색</button>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <div class="bottomWrap" style="height: 88%;">
        <div class="table-responsive">
            <table class="table table-hover table-sm table-bordered" style="font-size: 15px;margin-bottom: 10px;">
                <thead>
                    <tr>
                        <th width="7%">#</th>
                        <th width="7%">분류</th>
                        <th width="65%">제목</th>
                        <th>작성자</th>
                        <th>작성일시</th>
                    </tr>
                </thead>
                <tbody class="board_tbody">
                </tbody>
            </table>
        </div>
        <div style="display: flex;justify-content: flex-end;align-content: flex-end;margin-right: 15px;">
            <button id="writeBoard_btn" class="defaultBtn radius green" type="button">작성하기</button>
        </div>
        <div id="pagination"></div>
        <nav aria-label="Page navigation" style="font-size: 14px;">
            <ul class="pagination" style="display: flex;height: 30px;justify-content: center;align-items: center;">
                <li id="first_page" class="page-item"><a class="page-link board_fontCol" href="#">Previous</a></li>
                <li id="last_page" class="page-item"><a class="page-link board_fontCol" href="#">Next</a></li>
            </ul>
        </nav>
    </div>
</div>
<script type="text/javascript">

    $(function () {
        'use strict';
    });
    $(document).ready(function(){
        let pageSize = 10;
        let perPage = 5; // 하단에 디스플레이할 페이지 갯수
        let pageCount = 0;
        let currPageNo = 1;
        // let first = (currPageNo -1) * perPage;
        // let last = first + perPage;
        let totalCount = Number('${TotalCount.TOTAL_COUNT}');

        pageCount = parseInt(totalCount / pageSize);
        if((totalCount % pageSize) != 0) {
            pageCount++;
        }
        let last = parseInt(Math.ceil(currPageNo/perPage) * perPage);
        let first = (last - perPage) + 1 ;
        if(first <= 0) first = 1;

        if(last > pageCount) {
            last = pageCount;
        }

        for(var i=last;i>=first;i--) {
            var temp = '<li class="page-item page_numbers';
            if(currPageNo == i) {
                temp += ' active';
            }
            temp += '" data-value="'+i +'"><a class="page-link board_fontCol" href="#">'+(i)+'</a></li>';
            $("#first_page").after(temp).trigger("create");
        }
        $("#dash_board_search_form").find("#PAGE_NUM").val(currPageNo-1);

        $("#SEARCH_TITLE").on('keyup', function(e) {
            if(e.keyCode == 13) {
                $("#dashBoardSearchBtn").trigger('click');
            }
        });

        const getBoardList = function (pageNo) {
            const parameter = {'url': '/json-list', 'data': {
                    'queryId':'main.selectBoardList',
                    'PAGE_NUM':pageNo,
                    'PAGE_SIZE':pageSize
                }
            };

            fnPostAjax(function (data) {
                if(data.list.length > 0) {
                    setBoardList(data);
                }else {
                    var noData = '<tr class="faq_title"><td colspan="5" style="text-align: center;height: 200px;vertical-align: middle;">게시글이 존재하지 않습니다.</td></tr>';
                    $(".board_tbody").append(noData);
                }
            }, parameter, '');
        }
        getBoardList(currPageNo-1);

        $("#writeBoard_btn").on('click',function () {
            location.href = '/newDashBoard';
        })
        $("#dashBoardSearchBtn").on('click',function () {
            var parameter = {
                'url': '/json-list',
                'data': $("#dash_board_search_form").serialize()
            };
            fnPostAjax(function (data) {
                if(data.list.length > 0) {
                    $(".board_tbody").empty();
                    setBoardList(data);
                }
            }, parameter, '');
        });
        function setBoardList(data) {
            $.each(data.list, function (idx,Item) {
                var board = '<tr class="faq_title">';
                board += '<td>' + Item.BOARD_SEQ + '</td>';
                board += '<td>' + Item.BOARD_TYPE + '</td>';
                board += '<td><a href=/dashBoard/'+Item.BOARD_SEQ+'>'
                if(Item.DEPTH > 2) {
                    for(var i=2;i<Item.DEPTH;i++) {
                        board += '&emsp;'
                    }
                }
                board += Item.BOARD_TITLE + '</a></td>';
                board += '<td>' + Item.INSERT_ID + '</td>';
                board += '<td>' + Item.INSERT_DT + '</td>';
                board += '</tr>';

                $(".board_tbody").append(board);
            })
        }
        $(document).on("click",".page-item",function(event){
            var curNo = currPageNo;
            if(event.currentTarget.id == 'first_page') {

                if(curNo > 1) {
                    curNo = curNo -1;
                }else {
                    curNo = 1;
                }
                last = parseInt(Math.ceil(curNo/perPage) * perPage);
                first = (last - perPage) + 1 ;
                if(first <= 0) first = 1;

                if(last > pageCount) {
                    last = pageCount;
                }
                $(".page_numbers").remove();
                for(var i=last;i>=first;i--) {
                    var temp = '<li class="page-item page_numbers';
                    if(curNo == i) {
                        temp += ' active';
                    }
                    temp += '" data-value="'+i +'"><a class="page-link board_fontCol" href="#">'+(i)+'</a></li>';
                    $("#first_page").after(temp).trigger("create");
                }
            }else if(event.currentTarget.id == 'last_page') {
                if(curNo < pageCount) {
                    curNo = curNo +1;
                }else if(curNo == pageCount) {
                    curNo = pageCount;
                    return;
                }else {
                    curNo = (pageCount-1);
                }
                last = parseInt(Math.ceil(curNo/perPage) * perPage);
                first = (last - perPage) + 1 ;
                if(first <= 0) first = 1;

                if(last > pageCount) {
                    last = pageCount;
                }
                $(".page_numbers").remove();
                for(var i=last;i>=first;i--) {
                    var temp = '<li class="page-item page_numbers';
                    if(curNo == i) {
                        temp += ' active';
                    }
                    temp += '" data-value="'+i +'"><a class="page-link board_fontCol" href="#">'+(i)+'</a></li>';
                    $("#first_page").after(temp).trigger("create");
                }
            }else {
                curNo = $(this).data('value');
                $(".page_numbers").removeClass('active');
            }
            currPageNo = curNo;
            var tempPageNum = 0;
            if(curNo > 1) {
                tempPageNum = (curNo - 1) * pageSize;
            }else {
                tempPageNum = (0) * pageSize;
            }
            $("#dash_board_search_form").find("#PAGE_NUM").val(tempPageNum);
            var parameter = {
                'url': '/json-list',
                'data': $("#dash_board_search_form").serialize()
            };
            fnPostAjax(function (data) {
                if(data.list.length > 0) {
                    $(".board_tbody").empty();
                    setBoardList(data);
                }
            }, parameter, '');
        });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
