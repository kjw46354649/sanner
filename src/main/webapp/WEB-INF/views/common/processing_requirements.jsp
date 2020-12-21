<%--
  Created by IntelliJ IDEA.
  User: seongjun-innodale
  Date: 2020-12-17
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>상세 List 조회</title>
    <jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"/>
    <jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"/>
</head>
<style>
    table {
        width: 100%;
        height: 100%;
        border: 1px solid;
        border-collapse: collapse;
    }

    table th, table td {
        border: 1px solid black;
        text-align: center;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        padding: 5px;
        font-size: small;
    }

    table td input {
        width: 100% !important;
        border: 0 !important;
        box-sizing: border-box;
        background-color: unset;
        text-align: center;
    }

    table.basic_information > thead > tr > td {
        background-color: rgb(155, 194, 230);
        font-weight: bold;
    }

    table.basic_information > tbody > tr > td:first-child {
        background-color: rgb(221, 235, 247);
        font-weight: bold;
    }

    table.basic_information > tbody > tr > td:last-child {
        background-color: rgb(219, 219, 219);
    }

    table.processing_requirements_information > thead > tr > th {
        background-color: rgb(255, 217, 102);
        font-weight: bold;
    }

    table.processing_requirements_information > tbody > tr > td:last-child {
        background-color: rgb(219, 219, 219);
    }

    table.processing_requirements_information > tfoot > tr > td:first-child {
        background-color: rgb(255, 217, 102);
        font-weight: bold;
    }

    table.processing_requirements_information > tfoot > tr > td:last-child {
        background-color: rgb(237, 237, 237);
        font-weight: bold;
    }

    .ta-l {
        text-align: left;
    }

    .fw-bold {
        font-weight: bold;
    }

    .e {
        background-color: rgb(255, 242, 204);
    }
</style>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">가공요건 입력 / 가공비 계산</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
    <div class="d-flex align-items-center">
        <div>
            <button id="prev">이전</button>
            <button id="next">다음</button>
        </div>
        <div class="ml-auto">
            <button type="button" class="defaultBtn btn-100w green" id="processing_requirements_save">저장</button>
        </div>
    </div>
    <hr style="display: block; border: 1px solid #e2e2e2; margin: 7px;">
    <div>
        <table class="basic_information">
            <colgroup>
                <col width="15">
                <col width="85">
            </colgroup>
            <thead>
                <tr>
                    <td colspan="2">기본정보</td>
                </tr>
            </thead>
            <tbody>
                <tr style="display: none;">
                    <td id="seq1"></td>
                    <td id="seq2"></td>
                </tr>
                <tr>
                    <td scope="row">관리번호</td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">도면번호</td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">재질</td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">규격</td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">규격 Level</td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">기본가공비</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div>
        <form id="monthly_productivity_top_form" role="form" onsubmit="return false;">
            <table class="processing_requirements_information">
                <thead>
                <tr>
                    <th colspan="4">가공요건정보</th>
                </tr>
                <tr>
                    <th colspan="2">항목</th>
                    <th>Count</th>
                    <th>Cost</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="e fw-bold" colspan="2">밀링가공 면수</td>
                    <td><input type="number" name="PROCESS_CNT_CST010" id="PROCESS_CNT_CST010"></td>
                    <td><input type="number" name="UNIT_AMT_CST010" id="UNIT_AMT_CST010" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">TAP 면수</td>
                    <td><input type="number" name="PROCESS_CNT_CST020" id="PROCESS_CNT_CST020"></td>
                    <td><input type="number" name="UNIT_AMT_CST020" id="UNIT_AMT_CST020" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" rowspan="2">치수 공차</td>
                    <td class="e ta-l">일반</td>
                    <td><input type="number" name="PROCESS_CNT_CST030" id="PROCESS_CNT_CST030"></td>
                    <td><input type="number" name="UNIT_AMT_CST030" id="UNIT_AMT_CST030" readonly></td>
                </tr>
                <tr>
                    <td class="e ta-l">정밀(~0.02)</td>
                    <td><input type="number" name="PROCESS_CNT_CST040" id="PROCESS_CNT_CST040"></td>
                    <td><input type="number" name="UNIT_AMT_CST040" id="UNIT_AMT_CST040" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" rowspan="2">외곽가공</td>
                    <td class="e ta-l">15T 이하</td>
                    <td><input type="number" name="PROCESS_CNT_CST050" id="PROCESS_CNT_CST050"></td>
                    <td><input type="number" name="UNIT_AMT_CST050" id="UNIT_AMT_CST050" readonly></td>
                </tr>
                <tr>
                    <td class="e ta-l">15T 초과</td>
                    <td><input type="number" name="PROCESS_CNT_CST060" id="PROCESS_CNT_CST060"></td>
                    <td><input type="number" name="UNIT_AMT_CST060" id="UNIT_AMT_CST060" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" rowspan="2">일반포켓</td>
                    <td class="e ta-l">15T 이하</td>
                    <td><input type="number" name="PROCESS_CNT_CST070" id="PROCESS_CNT_CST070"></td>
                    <td><input type="number" name="UNIT_AMT_CST070" id="UNIT_AMT_CST070" readonly></td>
                </tr>
                <tr>
                    <td class="e ta-l">15T 초과</td>
                    <td><input type="number" name="PROCESS_CNT_CST080" id="PROCESS_CNT_CST080"></td>
                    <td><input type="number" name="UNIT_AMT_CST080" id="UNIT_AMT_CST080" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" rowspan="2">관통포켓</td>
                    <td class="e ta-l">15T 이하</td>
                    <td><input type="number" name="PROCESS_CNT_CST090" id="PROCESS_CNT_CST090"></td>
                    <td><input type="number" name="UNIT_AMT_CST090" id="UNIT_AMT_CST090" readonly></td>
                </tr>
                <tr>
                    <td class="e ta-l">15T 초과</td>
                    <td><input type="number" name="PROCESS_CNT_CST100" id="PROCESS_CNT_CST100"></td>
                    <td><input type="number" name="UNIT_AMT_CST100" id="UNIT_AMT_CST100" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">Hole</td>
                    <td><input type="number" name="PROCESS_CNT_CST110" id="PROCESS_CNT_CST110"></td>
                    <td><input type="number" name="UNIT_AMT_CST110" id="UNIT_AMT_CST110" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">TAP</td>
                    <td><input type="number" name="PROCESS_CNT_CST120" id="PROCESS_CNT_CST120"></td>
                    <td><input type="number" name="UNIT_AMT_CST120" id="UNIT_AMT_CST120" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">공차 Hole</td>
                    <td><input type="number" name="PROCESS_CNT_CST130" id="PROCESS_CNT_CST130"></td>
                    <td><input type="number" name="UNIT_AMT_CST130" id="UNIT_AMT_CST130" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">특수 Hole</td>
                    <td><input type="number" name="PROCESS_CNT_CST140" id="PROCESS_CNT_CST140"></td>
                    <td><input type="number" name="UNIT_AMT_CST140" id="UNIT_AMT_CST140" readonly></td>
                </tr>
                <tr>
                    <td class="e fw-bold" colspan="2">C/B</td>
                    <td><input type="number" name="PROCESS_CNT_CST150" id="PROCESS_CNT_CST150"></td>
                    <td><input type="number" name="UNIT_AMT_CST150" id="UNIT_AMT_CST150" readonly></td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="3">Total</td>
                    <td><input type="number" id="TOTAL"></td>
                </tr>
                </tfoot>
            </table>
        </form>
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="processing_requirements_close_button">닫기</button>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        /* init */
        let isDirty = Boolean(false);
        const path = '${path}' || '';
        const type = path.toUpperCase();
        let grid;
        let rowIndex;

        if (path === 'estimate') {
            grid = opener.estimateRegisterTopGrid;
            rowIndex = Number(opener.estimateRegisterSelectedRowIndex);
        } else if (path === 'control') {
            grid = opener.$orderManagementGrid;
            rowIndex = Number(opener.selectedOrderManagementRowIndex[0]);
        }
        /* init */

        /* function */
        const changeProcessingRequirementsBasicInformation = function (rowData) {
            let queryId = '';

            if (path === 'estimate') {
                queryId = 'estimate.selectProcessingRequirementsBasicInfo';
            } else if (path === 'control') {
                queryId = 'orderMapper.selectProcessingRequirementsBasicInfo';
            }

            let postData = $.extend({queryId: queryId}, rowData);
            postData.TYPE = type;
            postData.SEQ1 = $('.basic_information').find('#seq1').html();
            postData.SEQ2 = $('.basic_information').find('#seq2').html();
            let parameter = {'url': '/json-info', 'data': postData};

            fnPostAjax(function (data) {
                createTopTable(data);
            }, parameter, '');
        };

        const changeProcessingRequirementsInformation = function (rowData) {
            let queryId = '';

            if (path === 'estimate') {
                queryId = 'estimate.selectProcessingRequirementsInfo';
            } else if (path === 'control') {
                queryId = 'orderMapper.selectProcessingRequirementsInfo';
            }

            let postData = $.extend({queryId: queryId}, rowData);
            postData.TYPE = type;
            postData.SEQ1 = $('.basic_information').find('#seq1').html();
            postData.SEQ2 = $('.basic_information').find('#seq2').html();
            let parameter = {'url': '/json-info', 'data': postData};

            fnPostAjax(function (data) {
                createBotTable(data);
            }, parameter, '');
        };

        const createTopTable = function (data) {
            let seq1 = '';
            let seq2 = '';
            let controlNum = '';
            let drawingNum = '';
            let materialTypeNm = '';
            let sizeTxt = '';
            let level = '';
            let unitBasicAmt = '';
            let htmlString = '';

            if (data) {
                const info = data.info;
                seq1 = info.SEQ1 || '';
                seq2 = info.SEQ2 || '';
                controlNum = info.EST_NUM || info.CONTROL_NUM || '';
                drawingNum = info.DRAWING_NUM || '';
                materialTypeNm = info.MATERIAL_TYPE_NM || '';
                sizeTxt = info.SIZE_TXT || '';
                level = info.LEVEL || '';
                unitBasicAmt = info.UNIT_BASIC_AMT || '';
            }

            htmlString += '<tr style="display: none;">';
            htmlString += '    <td id="seq1">' + seq1 + '</td>';
            htmlString += '    <td id="seq2">' + seq2 + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">관리번호</td>';
            htmlString += '    <td>' + controlNum + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">도면번호</td>';
            htmlString += '    <td>' + drawingNum + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">재질</td>';
            htmlString += '    <td>' + materialTypeNm + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">규격</td>';
            htmlString += '    <td>' + sizeTxt + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">규격 Level</td>';
            htmlString += '    <td>' + level + '</td>';
            htmlString += '</tr>';
            htmlString += '<tr>';
            htmlString += '    <td scope="row">기본가공비</td>';
            htmlString += '    <td>' + unitBasicAmt + '</td>';
            htmlString += '</tr>';

            $('.basic_information > tbody').html(htmlString);
        };

        const createBotTable = function (data) {
            // TODO: undefined 처리
            if (data) {
                const info = data.info;
                for (let i = 1; i <= 15; i++) {
                    let str = String(i).padStart(2, '0') + '0';

                    $('#PROCESS_CNT_CST' + str).val(info['PROCESS_CNT_CST' + str] || ''); // TODO: input type number일 떄 undefined 들어가면 ?
                    $('#UNIT_AMT_CST' + str).val(info['UNIT_AMT_CST' + str] || '');
                }

                $('#TOTAL').val(info.TOTAL || '');
            } else {
                for (let i = 1; i <= 15; i++) {
                    let str = String(i).padStart(2, '0') + '0';

                    $('#PROCESS_CNT_CST' + str).val('');
                    $('#UNIT_AMT_CST' + str).val('');
                }
            }
        };

        const visibilityButton = function () {
            let gridInstance;
            let rowDataPrev;
            let rowDataNext;

            if (!(fnIsEmpty(grid) && fnIsEmpty(rowIndex))) {
                gridInstance = grid.pqGrid('getInstance').grid;
                rowDataPrev = gridInstance.getRowData({rowIndx: rowIndex + -1});
                rowDataNext = gridInstance.getRowData({rowIndx: rowIndex + 1});
            }

            rowDataPrev === undefined ? $('#prev').css('visibility', 'hidden') : $('#prev').css('visibility', 'visible');
            rowDataNext === undefined ? $('#next').css('visibility', 'hidden') : $('#next').css('visibility', 'visible');
        };

        //TODO: 함수명 변경
        const changeData = function () {
            const rowData = grid.pqGrid("getRowData", {rowIndx: rowIndex});

            fnResetFrom('monthly_productivity_top_form');
            visibilityButton();
            changeProcessingRequirementsBasicInformation(rowData);
            changeProcessingRequirementsInformation(rowData);
        };
        /* function */

        /* event */
        $('#prev').on('click', function () {
            if (isDirty) {
                fnAlert(null, '현재 수정중인 작업을 완료 후 다시 실행해 주세요.');
                return
            }

            rowIndex--;
            changeData();
        });

        $('#next').on('click', function () {
            if (isDirty) {
                fnAlert(null, '현재 수정중인 작업을 완료 후 다시 실행해 주세요.');
                return
            }

            rowIndex++;
            changeData();
        });

        $('#processing_requirements_save').on('click', function () {
            let postData = fnFormToJsonArrayData('#monthly_productivity_top_form');
            let url = '';

            if (path === 'estimate') {
                url = 'processingRequirementsEstimateSave';
            } else if (path === 'control') {
                url = 'processingRequirementsControlSave';
            }

            postData.TYPE = type;
            postData.SEQ1 = $('.basic_information').find('#seq1').html();
            postData.SEQ2 = $('.basic_information').find('#seq2').html();

            let parameter = {'url': '/' + url, 'data': {data: JSON.stringify(postData)}};

             fnPostAjax(function (data) {
                 const flag = data.flag;

                 if (flag) {
                     fnAlert(null, '<srping:message code="error.common"/>');
                     return;
                 }

                 fnAlert(null, "<spring:message code='com.alert.default.save.success' />");
                 isDirty = false;
             }, parameter, '');
        });

        $('#monthly_productivity_top_form').on('change', function () {
            isDirty = true;
        });

        $('#processing_requirements_close_button').on('click', function () {
            window.close();
        });
        /* event */

        changeData();
    });
</script>
</body>
</html>
