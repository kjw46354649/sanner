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
<div class="page onegrid nonYscroll" style="min-height: 99%;">
    <div class="table-responsive" style="margin: 0 50px;">
        <div style="margin-top: 1%;">
            <div>
                <button type="button" id="move_before" class="defaultBtn radius btn-outline-secondary" onclick="window.history.back()">이전</button>
                <button type="button" id="move_list" class="defaultBtn radius btn-outline-secondary" style="float: right;">목록</button>
            </div>
            <form class="form-inline" id="dash_board_new_form" name="dash_board_new_form" role="form">
                <input type="hidden" id="queryId" name="queryId" value=""/>
                <input type="hidden" id="BOARD_SEQ" name="BOARD_SEQ" value=""/>
                <input type="hidden" id="GROUP_SEQ" name="GROUP_SEQ" value=""/>
                <input type="hidden" id="GROUP_IN_NO" name="GROUP_IN_NO" value="1"/>
                <input type="hidden" id="DEPTH" name="DEPTH" value="1"/>
                <input type="hidden" id="IS_REPLY" name="IS_REPLY" value="N"/>
                <input type="hidden" id="FILE_SEQ_1" name="FILE_SEQ_1" value="${boardInfo.FILE_SEQ_1}"/>
                <input type="hidden" id="FILE_SEQ_2" name="FILE_SEQ_2" value="${boardInfo.FILE_SEQ_2}"/>
                <input type="hidden" id="FILE_SEQ_3" name="FILE_SEQ_3" value="${boardInfo.FILE_SEQ_3}"/>
                <input type="hidden" id="BOARD_CONTENTS" name="BOARD_CONTENTS" value=""/>
                <table class="table table-sm table-bordered" style="font-size: 15px;margin-bottom: 10px;margin-top: 10px;">
                    <colgroup></colgroup>
                    <tbody class="board_tbody">
                        <tr class="board_bottomL">
                            <th style="width: 10%;">제목</th>
                            <td style="width: 55%;">
                                <c:choose>
                                    <c:when test="${not empty parentBoard && parentBoard.BOARD_SEQ ne ''}">
                                        <span>┖ RE :</span>
                                        <input type="text" value="${boardInfo.BOARD_TITLE}" name="BOARD_TITLE" id="BOARD_TITLE" style="width:90%; height: 100%; border: 0; font-size: 15px;"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" value="${boardInfo.BOARD_TITLE}" name="BOARD_TITLE" id="BOARD_TITLE" style="width:100%; height: 100%; border: 0; font-size: 15px;"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <th style="width: 6%;">분류</th>
                            <td>
                                <select class="wd_70" title="분류" name="BOARD_TYPE" id="BOARD_TYPE" style="font-size: 14px;">
                                    <option value="1">공지</option>
                                    <option value="2">일반</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="5">
                                <input type="file" id="FILE_UPLOAD" value="" >
                                <div id="file_list_div">
                                    <c:if test="${not empty boardInfo.FILE_SEQ_1 && boardInfo.FILE_SEQ_1 ne ''}">
                                        <span id="file_div_${boardInfo.FILE_SEQ_1}" class="file_span"  data-value="${boardInfo.FILE_SEQ_1}">${boardInfo.FILE_NM_1}
                                            <button id="delete_file_1" class="del_file_btn" type="button" data-value="${boardInfo.FILE_SEQ_1}">
                                                <span style="font-size: 15px;">×</span>
                                            </button>
                                       </span>
                                    </c:if>
                                    <c:if test="${not empty boardInfo.FILE_SEQ_2 && boardInfo.FILE_SEQ_2 ne ''}">
                                        <span id="file_div_${boardInfo.FILE_SEQ_2}" class="file_span" data-value="${boardInfo.FILE_SEQ_2}">${boardInfo.FILE_NM_2}
                                            <button id="delete_file_2" class="del_file_btn" type="button" data-value="${boardInfo.FILE_SEQ_2}">
                                                <span style="font-size: 15px;">×</span>
                                            </button>
                                       </span>
                                    </c:if>
                                    <c:if test="${not empty boardInfo.FILE_SEQ_3 && boardInfo.FILE_SEQ_3 ne ''}">
                                        <span id="file_div_${boardInfo.FILE_SEQ_3}" class="file_span" data-value="${boardInfo.FILE_SEQ_3}">${boardInfo.FILE_NM_3}
                                            <button id="delete_file_3" class="del_file_btn" type="button" data-value="${boardInfo.FILE_SEQ_3}">
                                                <span style="font-size: 15px;">×</span>
                                            </button>
                                       </span>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="5" rowspan="5" style="height: 300px;">
                                <textarea name="editor1" id="editor1" rows="10" cols="80">
                                    <c:if test="${not empty boardInfo}">
                                        ${boardInfo.BOARD_CONTENTS}
                                    </c:if>
                                </textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <div align="right">
                <c:choose>
                    <c:when test="${not empty boardInfo}">
                        <button type="button" id="modify_contents" class="defaultBtn radius green">수정</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" id="regist_contents" class="defaultBtn radius green">등록</button>
                    </c:otherwise>
                </c:choose>
<%--                <button type="button" id="delete_contents" class="defaultBtn radius red" >삭제</button>--%>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(function () {
        'use strict';
    });
    $(document).ready(function(){
        var fileSeqList = [];
        let editor;
        var pBoardSeq = '${parentBoard.BOARD_SEQ}';
        var pGroupSeq = '${parentBoard.GROUP_SEQ}';
        var pDepth = '${parentBoard.DEPTH}';
        fileSeqList.push(${boardInfo.FILE_SEQ_1})
        fileSeqList.push(${boardInfo.FILE_SEQ_2})
        fileSeqList.push(${boardInfo.FILE_SEQ_3})
        console.log(fileSeqList)
        CKEDITOR.replace( 'editor1', {
            customConfig: '/resource/plugins/ckeditor/ckeditor_custom_config.js',
            uploadUrl: "/uploadFileEditor",
            // filebrowserUploadUrl: "/image"
            // filebrowserBrowseUrl: '/browseFileEditor',
            // filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images',
            filebrowserUploadUrl: '/uploadFileEditor',
            // filebrowserImageUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images'
        } );

        $("#regist_contents").on('click',function () {
            var data = CKEDITOR.instances.editor1.getData();
            var title = $("#dash_board_new_form #BOARD_TITLE").val();
            if(typeof title == 'undefined' || title == '' || title == null) {
                fnAlert("","제목을 입력해주세요.");
                return;
            }
            if(typeof data == 'undefined' || data == '' || data == null) {
                fnAlert("","내용을 입력해주세요.");
                return;
            }

            $("#dash_board_new_form #BOARD_CONTENTS").val(data);
            if(pBoardSeq != '' && pBoardSeq != null) {
                $("#dash_board_new_form #BOARD_TITLE").val('┖ RE :' + $("#dash_board_new_form #BOARD_TITLE").val());
                $("#dash_board_new_form #IS_REPLY").val('Y');

                $("#dash_board_new_form #BOARD_SEQ").val(pBoardSeq);;
            }
            if(pGroupSeq != '' && pGroupSeq != null) {
                $("#dash_board_new_form #GROUP_SEQ").val(pGroupSeq);
            }
            if(pDepth != '' && pDepth != null) {
                $("#dash_board_new_form #DEPTH").val(pDepth);
            }

            let parameters = {'url': '/registBoard', 'data': $("#dash_board_new_form").serialize()};

            fnPostAjaxAsync(function (data, callFunctionParam) {
                fnAlert("","게시글이 작성되었습니다.");
                location.href = '/dashBoard';
            }, parameters, '');
        });
        $("#modify_contents").on('click',function () {
            var data = CKEDITOR.instances.editor1.getData();
            var title = $("#dash_board_new_form #BOARD_TITLE").val();
            if(typeof title == 'undefined' || title == '' || title == null) {
                fnAlert("","제목을 입력해주세요.");
                return;
            }
            if(typeof data == 'undefined' || data == '' || data == null) {
                fnAlert("","내용을 입력해주세요.");
                return;
            }

            var oriBoardSeq = '${boardInfo.BOARD_SEQ}'
            $("#dash_board_new_form #BOARD_CONTENTS").val(data);
            $("#dash_board_new_form #BOARD_SEQ").val(oriBoardSeq);
            $("#dash_board_new_form #queryId").val("main.updateBoard");
            $("#dash_board_new_form #FILE_SEQ_1").val("");
            $("#dash_board_new_form #FILE_SEQ_2").val("");
            $("#dash_board_new_form #FILE_SEQ_3").val("");
            for(var i=0;i<fileSeqList.length;i++) {
                $("#dash_board_new_form #FILE_SEQ_"+(i+1)).val(fileSeqList[i]);
            }
            let parameters = {'url': '/json-update', 'data': $("#dash_board_new_form").serialize()};

            fnPostAjaxAsync(function (data, callFunctionParam) {
                fnAlert("","수정되었습니다.");
                location.href = '/dashBoard/' + oriBoardSeq;
            }, parameters, '');

        });

        $("#move_list").on('click',function () {
            location.href = '/dashBoard';
        });

        $("#dash_board_new_form").find("#FILE_UPLOAD").change(function () {
            var input = $(this);
            var files = input.get(0).files;
            console.log('files',files)
            if(fileSeqList.length >= 3) {
                fnAlert('','파일은 최대 3개까지 등록하실수 있습니다.');
                input.val('');
                return false;
            }
            if (files.length > 0) {
                let formData = new FormData();
                // $("#file_list_div").empty();
                for (var i = 0; i < files.length; i++) {
                    var fileName = files[i].name;
                    if(fileName.length > 30) {
                        fileName = fileName.substr(0,30) +'...';
                    }
                    var fileDiv = '<span id="file_div_' + (fileSeqList.length +1 ) + '" class="file_span">'+fileName;
                    fileDiv += '<button id="delete_file_' + (fileSeqList.length +1) + '" class="del_file_btn" type="button" style="margin-left: 5px;"><span style="font-size: 15px;">×</span></button>';
                    fileDiv += '</span>';
                    $("#file_list_div").append(fileDiv)
                    formData.append("file" + i, files[i]);
                }
                fnFormDataFileUploadAjax(function (data) {
                    input.val('');
                    let fileInfo = data.fileUploadList[0];
                    fileSeqList.push(fileInfo.GFILE_SEQ);
                    var id = 'FILE_SEQ_' + fileSeqList.length;
                    $("#dash_board_new_form").find("#" + id).val(fileInfo.GFILE_SEQ);
                    $("#dash_board_new_form").find("#delete_file_"+fileSeqList.length).attr('data-value',fileInfo.GFILE_SEQ);
                    $("#dash_board_new_form").find("#file_div_"+fileSeqList.length).attr('data-value',fileInfo.GFILE_SEQ);
                    var active = document.getElementById("file_div_"+fileSeqList.length);
                    active.id = 'file_div_' + fileInfo.GFILE_SEQ;
                }, formData, '');
            }
        });

        $(document).on("click",".del_file_btn",function(event){
            var gFileSeq = $(this).data("value");
            $("input[value='"+gFileSeq+"']").val("");
            $("#file_div_"+gFileSeq).remove();
            if(fileSeqList.length <= 1) {
                fileSeqList = [];
            }else {
                var idx = fileSeqList.indexOf(gFileSeq);
                fileSeqList.splice(idx,1);
            }
        });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
