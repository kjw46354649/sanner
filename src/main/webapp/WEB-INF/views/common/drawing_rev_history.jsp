<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-06-26
  Time: 오후 2:04
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
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>리비전 도면 비교</title>
</head>
<body>
<div class="revisionPopup">
    <form class="form-inline" name="DRAWING_REVISION_FORM" id="DRAWING_REVISION_FORM" role="form" onsubmit="return false;">
        <input type="hidden" id="queryId" name="queryId" value="orderMapper.selectRevisionList">
        <input type="hidden" id="ORDER_SEQ" name="ORDER_SEQ" value="${ORDER_SEQ}">
        <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value="${CONTROL_SEQ}">
        <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value="${CONTROL_DETAIL_SEQ}">
        <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
        <h3><i class="xi-file-check-o"></i>&nbsp;리비전 도면 비교</h3>
        <div class="searchPopupWrap">
            <div class="revisionMapLeft">
                <!--도면삽입-->
                <img id="drawing_rev_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
            </div>
            <div class="revisionPopupRight">
                <div class="searchPopupRightTop">
                    <table>
                        <tr>
                            <th>접수번호</th>
                            <td class="tdWeight" id="pop_regist_num"></td>
                        </tr>
                        <tr>
                            <th>작업지시번호</th>
                            <td id="pop_control_num"></td>
                        </tr>
                        <tr>
                            <th>도면번호</th>
                            <td class="tdColor" id="pop_drawing_num"></td>
                        </tr>
                    </table>
                </div>
                <div id="drawing_rev_grid" class="listTable">
                    <!--gird삽입-->
                </div>
                <div class="stockPopupBtnWrap">
                    <button id="drawingRevDetailBtn" class="stockBtnSave">도면상세보기</button>
                    <button id="drawingRevCloseBtn" class="stockBtnClose">닫기</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    $(function () {
        'use strict';

        let $drawingRevGrid;
        const popupGridId = 'drawing_rev_grid';
        const popupColModel = [
            {title: 'Rev.', dataIndx: 'DRAWING_VER', editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#3b7ec5', 'color': 'white'}
            },
            {title: '파일명', width: 140, dataIndx: 'FILE_NM', editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#3b7ec5', 'color': 'white'},
                render: function (ui) {
                    const cellData = ui.cellData;
                    if (cellData) {
                        return cellData.replace(/&lt;/g, '<');
                    }
                }
            },
            {title: '파일', width: 75, dataIndx: 'PDF_GFILE_SEQ', editable:false,
                styleHead: {'font-weight': 'bold', 'background': '#3b7ec5', 'color': 'white'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    var html = '';
                    if(rowData.DXF_GFILE_SEQ) {
                        html = '<span id="downloadViewCad" class="blueFileImageICon" style="cursor: pointer"></span>';
                    }
                    if(rowData.PDF_GFILE_SEQ) {
                        if(html != '') {
                            html += '<br>';
                        }
                        html += '<span id="downloadViewPdf" class="redFileImageICon" style="cursor: pointer"></span>'
                    }
                    return html;
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('#downloadViewCad').bind('click', function () {
                        console.log("!!!!!!!")
                        let rowData = ui.rowData;
                        fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                    });
                    $cell.find('#downloadViewPdf').bind('click', function () {
                        let rowData = ui.rowData;
                        console.log("??????")
                        fnFileDownloadFormPageAction(rowData.PDF_GFILE_SEQ);
                    });
                }
            },
            {title: '파일', width: 75, dataIndx: 'DXF_GFILE_SEQ',hidden:true},
            {title: '파일', width: 75, dataIndx: 'IMG_GFILE_SEQ',hidden:true}
        ];
        const popupObj = {
            height: 440,
            collapsible: false,
            resizable: false,
            showTitle: false,
            editable: false,
            // trackModel: {on: true},
            numberCell: {show: false},
            scrollModel: {autoFit: true},
            postRenderInterval: -1, //call postRender synchronously.
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: popupColModel,
            copyModel: {render: true},
            strNoRows: g_noData,
            dataModel: {
                location: "remote", dataType: "json", method: "POST", recIndx: 'ROWNUM',
                url: "/paramQueryGridSelect",
                postData: fnFormToJsonArrayData('#DRAWING_REVISION_FORM'),
                getData: function (dataJSON) {
                    let data = dataJSON.data;
                    return {totalRecords: data.length, data: data};
                }
            },
            selectionModel: { type: 'row', mode: 'single'},
            rowSelect: function (evt, ui) {
                $.each(ui.addList, function (idx,Item) {
                    if(idx === 0) {
                        var rowData = ui.addList[0].rowData;

                        if(typeof rowData.IMG_GFILE_SEQ != 'undefined' && rowData.IMG_GFILE_SEQ != ''){
                            $("#drawing_rev_img").attr("src", '/qimage/' + rowData.IMG_GFILE_SEQ);
                            $("#DRAWING_REVISION_FORM").find("#GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
                        }else {
                            $("#drawing_rev_img").attr("src", '/resource/main/blank.jpg');
                            $("#DRAWING_REVISION_FORM").find("#GFILE_SEQ").val("");
                        }
                    }
                })
            },
            cellKeyDown: function (event, ui) {
                let rowIndx = ui.rowIndx;
                const sr = this.SelectRow();
                const totalRecords = this.option('dataModel.data').length;
                if (event.keyCode == $.ui.keyCode.DOWN && rowIndx < totalRecords) {
                    rowIndx++;
                } else if (event.keyCode == $.ui.keyCode.UP && rowIndx > 0) {
                    rowIndx--;
                }
                sr.removeAll();
                sr.add({rowIndx: rowIndx});
                const selRowData = this.getRowData({rowIndx: rowIndx});
                callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
            },
        };
        $drawingRevGrid = $('#' + popupGridId).pqGrid(popupObj);

        let data = {
            'queryId': "orderMapper.selectRevisionInfo",
            'ORDER_SEQ': $("#DRAWING_REVISION_FORM").find("#ORDER_SEQ").val(),
            'CONTROL_SEQ': $("#DRAWING_REVISION_FORM").find("#CONTROL_SEQ").val(),
            'CONTROL_DETAIL_SEQ': $("#DRAWING_REVISION_FORM").find("#CONTROL_DETAIL_SEQ").val()
        };
        let parameters = {'url': '/json-info', 'data': data};
        fnPostAjax(function (data) {
            let dataInfo = data.info;
            if(dataInfo != null && dataInfo != '') {
                $("#pop_regist_num").text(dataInfo.REGIST_NUM)
                $("#pop_control_num").text(dataInfo.CONTROL_NUM)
                $("#pop_drawing_num").text(dataInfo.DRAWING_NUM)
            }
        }, parameters, '');


        $('#drawingRevDetailBtn').on('click', function (e) {
            let gFileSeq = $("#DRAWING_REVISION_FORM").find("#GFILE_SEQ").val();
            // console.log(gFileSeq)
            if(gFileSeq != '') {
                callWindowImageViewer(gFileSeq);
            }
        })
        $('#drawingRevCloseBtn').on('click', function () {
            window.close();
        });

        /* function */

        /* event */
        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', _.debounce(function() {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $drawingRevGrid.pqGrid('option', 'height', size);
        }, 500));
        /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
