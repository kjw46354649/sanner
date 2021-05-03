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
<jsp:include page="/WEB-INF/views/attr/common/body-script.jsp"/>
<%--<jsp:include page="/WEB-INF/views/attr/tabs/body-menu.jsp"/>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>게시판</title>
</head>
<body>
<div class="page onegrid nonYscroll">
    <div class="table-responsive" style="margin: 0 50px;">
        <div style="margin-top: 2%;">
            <div>
                <button type="button" id="move_before" class="defaultBtn radius btn-outline-secondary" onclick="window.history.back()">이전</button>
                <button type="button" id="move_list" class="defaultBtn radius btn-outline-secondary" style="float: right;">목록</button>
            </div>
            <table class="table table-sm table-bordered" style="font-size: 15px;margin-bottom: 10px;margin-top: 10px;">
                <colgroup></colgroup>
                <tbody class="board_tbody">
                    <tr class="board_bottomL">
                        <th style="width: 10%;">제목</th>
                        <td style="width: 55%;">${boardInfo.BOARD_TITLE}</td>
                        <th style="width: 6%;">작성자</th>
                        <td>${boardInfo.USER_NM}</td>
                        <th style="width: 7%;">작성일자</th>
                        <td>${boardInfo.INSERT_DT}</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="5">
                            <c:if test="${not empty boardInfo && not empty boardInfo.FILE_SEQ_1 && boardInfo.FILE_SEQ_1 ne ''}">
                                <span class="file_span">
                                    <a href="/downloadfile/${boardInfo.FILE_SEQ_1}" name="FILE" target="_blank">${boardInfo.FILE_NM_1}</a>
                                </span>
                            </c:if>
                            <c:if test="${not empty boardInfo && not empty boardInfo.FILE_SEQ_2 && boardInfo.FILE_SEQ_2 ne ''}">
                                <span class="file_span">
                                    <a href="/downloadfile/${boardInfo.FILE_SEQ_2}" name="FILE" target="_blank">${boardInfo.FILE_NM_2}</a>
                                </span>
                            </c:if>
                            <c:if test="${not empty boardInfo && not empty boardInfo.FILE_SEQ_3 && boardInfo.FILE_SEQ_3 ne ''}">
                                <span class="file_span">
                                    <a href="/downloadfile/${boardInfo.FILE_SEQ_3}" name="FILE" target="_blank">${boardInfo.FILE_NM_3}</a>
                                </span>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5" rowspan="5" style="height: 390px;">
                            <div style="height: 345px;overflow: scroll;">
                            <c:out value="${boardInfo.BOARD_CONTENTS}" escapeXml="false"></c:out>
                            </div>
                            <c:if test="${not empty boardInfo && boardInfo.INSERT_ID eq authUserInfo.USER_ID}">
                                <div align="right">
                                    <button type="button" id="delete_contents" class="defaultBtn radius red">삭제</button>
                                    <button type="button" id="modify_contents" class="defaultBtn radius green">수정</button>
                                </div>
                            </c:if>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div>
                <button type="button" id="boardReplyBtn" class="defaultBtn radius blue" style="float: right;">답글</button>
            </div>
        </div>
    </div>
    <div class="table-responsive" style="margin: 0 50px; display: none;">
        <form id="dash_board_comment_form">
            <table class="table table-sm table-bordered" style="font-size: 15px;margin-bottom: 10px;">
                <colgroup></colgroup>
                <tbody class="comment_tbody">
                    <tr>
                        <th style="width: 10%;">댓글</th>
                        <td></td>
                    </tr>
                    <c:if test="${fn:length(commentList) > 0}">
                        <c:forEach var="comment" items="${commentList}">
                            <tr class="comment_list_tr">
                                <th style="background:#f7f7f7;color:#3b3a3a;">${comment.USER_NM}</th>
                                <td>
                                    <div id="com_Div">
                                        <span id="span_${comment.COMMENT_SEQ}">${comment.COMMENT_CONTENTS}</span>
                                        <textarea rows="4" cols="200" class="font_size_14" name="text_area_${comment.COMMENT_SEQ}" id="text_area_${comment.COMMENT_SEQ}" style="width:100%; height: 100%; border: 0;display: none">${comment.COMMENT_CONTENTS}</textarea>
                                    </div>
                                    <c:if test="${not empty comment && comment.INSERT_ID eq authUserInfo.USER_ID}">
                                        <div align="right">
                                            <button type="button" class="defaultBtn radius red delete_comment" data-value="${comment.COMMENT_SEQ}">삭제</button>
                                            <button type="button" class="defaultBtn radius green modify_comment" data-value="${comment.COMMENT_SEQ}">수정</button>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                        <input type="hidden" id="BOARD_SEQ" name="BOARD_SEQ" value="${boardInfo.BOARD_SEQ}">
                        <tr>
                            <th>${authUserInfo.USER_NM}</th>
                            <td colspan="2">
                                <textarea rows="7" cols="200" class="font_size_14" name="COMMENT_CONTENTS" id="COMMENT_CONTENTS" style="width:100%; height: 100%; border: 0;"></textarea>
                                <p align="right"><button type="button" id="regist_comment" class="defaultBtn radius btn-outline-secondary">등록</button></p>
                            </td>
                        </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        'use strict';

        $("#move_list").on('click',function () {
            location.href = '/dashBoard';
        });
        $("#boardReplyBtn").on('click',function () {
            var url = '/newDashBoard?boardSeq=' + '${boardInfo.BOARD_SEQ}'
                url += '&groupSeq=' + '${boardInfo.GROUP_SEQ}' + '&depth=' + '${boardInfo.DEPTH}';
            location.href = url;
        });
    });
    $(document).ready(function(){
        let login_id = '${authUserInfo.USER_ID}';
        let userNm = '${authUserInfo.USER_NM}';
        let boardSeq = '${boardInfo.BOARD_SEQ}';

        // function resetCommentDiv(data) {
        //     $(".comment_tbody").empty();
        //     var commentTbody ='<tr><th style="width: 10%;">댓글</th><td></td></tr>';
        //     for(var i=0;i<data.list.length;i++) {
        //         commentTbody += '<tr><th style="background:#f7f7f7;color:#3b3a3a;">'+data.list[i].USER_NM+'</th>';
        //         commentTbody += '<td>';
        //         commentTbody += '<div id="com_Div"><span id="span_'+data.list[i].COMMENT_SEQ+'">'+data.list[i].COMMENT_CONTENTS+'</span>';
        //         commentTbody += '<textarea rows="4" cols="200" class="font_size_14" name="text_area_'+data.list[i].COMMENT_SEQ+'" id="text_area_'+data.list[i].COMMENT_SEQ+'" style="width:100%; height: 100%; border: 0;display: none">'+data.list[i].COMMENT_CONTENTS+'</textarea>';
        //         commentTbody += '</div>';
        //         if(data.list[i].INSERT_ID == login_id) {
        //             commentTbody += '<div align="right">';
        //             commentTbody += '<button type="button" class="defaultBtn radius red delete_comment" data-value="' + data.list[i].COMMENT_SEQ+'">삭제</button>';
        //             commentTbody += '<button type="button" class="defaultBtn radius green modify_comment" data-value="'+ data.list[i].COMMENT_SEQ +'">수정</button>';
        //             commentTbody += '</div>';
        //         }
        //         commentTbody += '</td>';
        //         commentTbody += '</tr>';
        //     }
        //     commentTbody += '<input type="hidden" id="BOARD_SEQ" name="BOARD_SEQ" value="'+boardSeq+'">';
        //     commentTbody += '<tr>'
        //     commentTbody += '<th>'+userNm+'</th>';
        //     commentTbody += '<td colspan="2">';
        //     commentTbody += '<textarea rows="7" cols="200" class="font_size_14" name="COMMENT_CONTENTS" id="COMMENT_CONTENTS" style="width:100%; height: 100%; border: 0;"></textarea>';
        //     commentTbody += '<p align="right"><button type="button" id="regist_comment" class="defaultBtn radius btn-outline-secondary">등록</button></p>';
        //     commentTbody += '</td></tr>';
        //
        //     $(".comment_tbody").append(commentTbody);
        // }

        // $(document).on("click","#regist_comment",function(event){
        //     let parameters = {'url': '/json-create',
        //         'data':{
        //             'queryId': 'main.insertComment',
        //             'BOARD_SEQ': boardSeq,
        //             'COMMENT_CONTENTS': $("#dash_board_comment_form").find("#COMMENT_CONTENTS").val(),
        //         }
        //     };
        //     fnPostAjax(function (data, callFunctionParam) {
        //         getCommentList();
        //     },parameters,'')
        // });

        // $(document).on("click",".delete_comment",function(event){
        //     var commentSeq = $(this).data("value");
        //     let parameter = {
        //         'queryId': 'main.deleteComment',
        //         'COMMENT_SEQ': commentSeq
        //     };
        //
        //     let parameters = {'url': '/json-remove', 'data': parameter};
        //     fnPostAjaxAsync(function (data) {
        //         getCommentList();
        //     }, parameters, '');
        // });
        $(document).on("click","#modify_contents",function(event){
            location.href = '/modifyBoard/' + boardSeq;
        })
        $(document).on("click","#delete_contents",function(event){
            let parameter = {
                'queryId': 'main.deleteBoard',
                'BOARD_SEQ': boardSeq
            };

            let parameters = {'url': '/json-remove', 'data': parameter};
            fnPostAjaxAsync(function (data) {
                fnAlert(null, "삭제되었습니다.");
                $("#move_before").trigger('click');
            }, parameters, '');
        })
        // function getCommentList() {
        //     let parameters2 = {'url': '/json-list', 'data': {'queryId': 'main.selectBoardComment', 'BOARD_SEQ':boardSeq}};
        //     fnPostAjaxAsync(function (data) {
        //         if(data.list.length > 0 ) {
        //             resetCommentDiv(data);
        //         }
        //     }, parameters2, '');
        // }
        // $(document).on("click",".modify_comment",function(event){
        //     var commentSeq = $(this).data("value");
        //     console.log($(this).hasClass('on'))
        //     if($(this).hasClass('on')) {
        //         let parameter = {
        //             'queryId': 'main.updateComment',
        //             'COMMENT_SEQ': commentSeq,
        //             'COMMENT_CONTENTS': $("#text_area_"+commentSeq).val()
        //         };
        //         let parameters = {'url': '/json-update', 'data': parameter};
        //         fnPostAjaxAsync(function (data) {
        //             $(this).removeClass('on');
        //             getCommentList();
        //         }, parameters, '');
        //
        //     }else {
        //         $(this).addClass('on');
        //         $("#span_"+commentSeq).css('display','none');
        //         $("#text_area_"+commentSeq).css('display','block');
        //     }
        // })
    });// end of ready()
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
