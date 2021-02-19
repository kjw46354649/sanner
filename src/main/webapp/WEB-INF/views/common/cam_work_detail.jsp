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
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>CAM 작업 상세 조회</title>
</head>
<body>
<div style="padding: 10px;">
    <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">CAM 작업 관리</h3>
    <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">

    <div class="d-flex align-items-center">
        <div>
            <form class="form-inline" id="cam_work_detail_form" name="cam_work_detail_form" role="form">
                <input type="hidden" id="queryId" name="queryId" value="inspection.selectCamWorkDetail"/>
                <input type="hidden" id="CONTROL_SEQ" name="CONTROL_SEQ" value=""/>
                <input type="hidden" id="CONTROL_DETAIL_SEQ" name="CONTROL_DETAIL_SEQ" value=""/>

                <input type="hidden" id="ORDER_COMP_CD" name="ORDER_COMP_CD" value=""/>
                <input type="hidden" id="SIZE_TXT" name="SIZE_TXT" value=""/>
                <input type="hidden" id="DRAWING_NUM" name="DRAWING_NUM" value=""/>
                <input type="hidden" id="MATERIAL_TYPE" name="MATERIAL_TYPE" value=""/>
                <input type="hidden" id="CAD_FILE_SIZE" name="CAD_FILE_SIZE" value=""/>
            </form>
        </div>
        <div class="ml-auto">
        </div>
    </div>
    <div>
        <div id="cam_work_detail_grid"></div>
    </div>
    <div style="text-align: center; margin: 12px 0;">
        <button type="button" class="defaultBtn grayPopGra" id="cam_work_detail_close">닫기</button>
    </div>
</div>

<script>
    $(function () {
        'use strict';
        const controlSeq = ${controlSeq};
        const controlDetailSeq = ${controlDetailSeq};
        const $camWorkDetailGrid =  $('#cam_work_detail_grid');
        const camWorkDetailColModel = [
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ', hidden: true},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ', hidden: true},
            {title: 'CAM_SEQ', dataType: 'integer', dataIndx: 'CAM_SEQ', hidden: true},
            {title: '주문확정<br>일자', dataIndx: 'ORDER_CONFIRM_DT'},
            {title: '외<br>주', minWidth: 30, maxWidth: 30, dataIndx: 'OUTSIDE_YN'},
            {title: '관리번호', width: 180, halign: 'center', align: 'left', dataIndx: 'CONTROL_NUM'},
            {
                title: '', minWidth: 30, width: 30, dataIndx: 'CONTROL_NUM_BUTTON',
                render: function (ui) {
                    if (ui.rowData.CONTROL_NUM)
                        return '<span  class="shareIcon" name="detailView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui),
                        rowIndx = ui.rowIndx,
                        rowData = ui.rowData;

                    $cell.find('[name=detailView]').bind('click', function () {
                        g_item_detail_pop_view(rowData.CONTROL_SEQ, rowData.CONTROL_DETAIL_SEQ, grid, rowIndx);
                    });
                }
            },
            {title: '작업<br>형태', dataIndx: 'WORK_TYPE_NM'},
            {
                title: '발주처', dataIndx: 'ORDER_COMP_NM',
                styleHead: {'background': '#ffe699'},
                render: function (ui) {
                    const firstRowData = this.getRowData({rowIndx: 0});

                    if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                        return {style: 'color: #0000ff'};
                    }
                }
            },
            {
                title: '규격', dataIndx: 'SIZE_TXT',
                styleHead: {'background': '#ffe699'},
                render: function (ui) {
                    const firstRowData = this.getRowData({rowIndx: 0});

                    if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                        return {style: 'color: #0000ff'};
                    }
                }
            },
            {
                title: '재질', dataIndx: 'MATERIAL_TYPE_NM',
                styleHead: {'background': '#ffe699'},
                render: function (ui) {
                    const firstRowData = this.getRowData({rowIndx: 0});

                    if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                        return {style: 'color: #0000ff'};
                    }
                }
            },
            {
                title: '도면번호', width: 150, halign: 'center', align: 'left', dataIndx: 'DRAWING_NUM',
                styleHead: {'background': '#ffe699'},
                render: function (ui) {
                    const firstRowData = this.getRowData({rowIndx: 0});

                    if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                        return {style: 'color: #0000ff'};
                    }
                }
            },
            {
                title: '', minWidth: 25, maxWidth: 25, dataIndx: 'IMG_GFILE_SEQ',
                styleHead: {'background': '#ffe699'},
                render: function (ui) {
                    if (ui.cellData)
                        return '<span class="fileSearchIcon" name="imageView" style="cursor: pointer"></span>';
                },
                postRender: function (ui) {
                    let grid = this,
                        $cell = grid.getCell(ui);
                    $cell.find('[name=imageView]').bind('click', function () {
                        let rowData = ui.rowData;
                        callWindowImageViewer(rowData.IMG_GFILE_SEQ);
                    });
                }
            },
            {
                title: 'CAD 파일', align: 'center',
                styleHead: {'background': '#ffe699'},
                colModel: [
                    {
                        title: 'Size', dataIndx: 'CAD_FILE_SIZE',
                        styleHead: {'background': '#ffe699'},
                        render: function (ui) {
                            const firstRowData = this.getRowData({rowIndx: 0});

                            if (ui.rowIndx !== 0 && ui.cellData === firstRowData[ui.dataIndx]) {
                                return {style: 'color: #0000ff'};
                            }
                        }
                    },
                    {
                        title: '', minWidth: 35, maxWidth: 35, dataIndx: 'DXF_GFILE_SEQ',
                        styleHead: {'background': '#ffe699'},
                        render: function (ui) {
                            if (ui.cellData)
                                return '<span class="blueFileImageICon" name="downloadView" style="cursor: pointer"></span>';
                        },
                        postRender: function (ui) {
                            let grid = this,
                                $cell = grid.getCell(ui);
                            $cell.find('[name=downloadView]').bind('click', function () {
                                let rowData = ui.rowData;
                                fnFileDownloadFormPageAction(rowData.DXF_GFILE_SEQ);
                            });
                        }
                    },
                ]
            },
            {title: '소재종류', dataIndx: 'MATERIAL_DETAIL_NM'},
            {title: '수량', dataIndx: 'CONTROL_PART_QTY'},
            {
                title: '1EA 가공시간', align: 'center',
                colModel: [
                    {title: '전공정', dataIndx: 'UNIT_TOTAL_WORK_TIME'},
                    {title: 'NC', dataIndx: 'UNIT_NC_WORK_TIME'}
                ]
            },
            {
                title: '가공시간', align: 'center',
                colModel: [
                    {title: 'Total', dataIndx: 'TOTAL_WORK_TIME'},
                    {title: '선반', dataIndx: 'NC_WORK_TIME'},
                    {title: 'NC', dataIndx: 'MILLING_WORK_TIME'},
                    {title: '밀링', dataIndx: 'GRINDING_WORK_TIME'},
                    {title: '연마', dataIndx: 'LATHE_WORK_TIME'}
                ]
            },
            {
                title: 'CAM 작업 실적', align: 'center', colModel: [
                    {title: 'Steps', width: 50, datatype: 'integer', dataIndx: 'CAM_STEP'},
                    {title: '위치', dataIndx: 'WORK_DIRECTION'},
                    {title: '작업내용', width: 70, dataIndx: 'WORK_DESC'},
                    {title: '단위수량', width: 50, datatype: 'integer', dataIndx: 'DESIGN_QTY'},
                    {
                        title: 'File', width: 70, dataIndx: '',
                        render: function (ui) {
                            let rowData = ui.rowData;
                            let camVisibility = fnIsEmpty(rowData.CAM_FILE_SEQ) ? 'hidden' : 'visible';
                            let ncVisibility = fnIsEmpty(rowData.NC_FILE_SEQ) ? 'hidden' : 'visible';
                            let iconFiles = '';
                            iconFiles += '<span id="downloadCAMFIle" class="greenFileImageICon" style="visibility: ' + camVisibility + '; cursor: pointer;"></span>&nbsp;&nbsp;';
                            iconFiles += '<span id="downloadNCFile" class="purpleFileImageICon" style="visibility: ' + ncVisibility + '; cursor: pointer; margin-left: 10px;"></span>';

                            return iconFiles;
                        },
                        postRender: function (ui) {
                            let grid = this;
                            let $cell = grid.getCell(ui);
                            let rowData = ui.rowData;

                            $cell.find('#downloadCAMFIle').bind('click', function(e) {
                                // console.log(rowData.CAM_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.CAM_FILE_SEQ);
                            });
                            $cell.find('#downloadNCFile').bind('click', function(e) {
                                // console.log(rowData.NC_FILE_SEQ);
                                e.preventDefault();
                                fnSingleFileDownloadFormPageAction(rowData.NC_FILE_SEQ);
                            });
                        }
                    },
                    {title: '작업자', width: 80, dataIndx: 'WORK_USER_NM'},
                    {title: '실적등록일시', width: 90, dataIndx: 'CAM_INSERT_DT'},
                    {title: '경험 기록사항',  width: 150, dataIndx: 'CAM_EXPERIENCE_NOTE'},
                    {title: '비고 및 공유사항',  width: 150, dataIndx: 'CAM_WORK_NOTE'},
                ]
            }
        ];
        const camWorkDetailObj = {
            height: 528,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', recIndx: 'RNUM',
                url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('cam_work_detail_form'),
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            strNoRows: g_noData,
            editable: false,
            postRenderInterval: -1,
            columnTemplate: {align: 'center', hvalign: 'center', valign: 'center'},
            // scrollModel: {autoFit: true},
            numberCell: {title: 'No'},
            selectionModel: {type: 'row', mode: 'single'},
            swipeModel: {on: false},
            showTitle: false,
            collapsible: false,
            resizable: false,
            trackModel: {on: true},
            colModel: camWorkDetailColModel,
            rowInit: function (ui) {
                console.log(ui);
                if (ui.rowIndx === 0) {
                    return {style: {'background': '#FFFF00'}};
                }
            },
            complete: function () {
                this.flex();
            },
            load: function () {
                cellMerge(this, true);
            }
        };

        /* function */
        const cellMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');

            const controlList = [
                'ORDER_COMP_NM'
            ];
            const partList = [
                'ORDER_CONFIRM_DT', 'OUTSIDE_YN', 'CONTROL_NUM', 'CONTROL_NUM_BUTTON', 'WORK_TYPE_NM', 'SIZE_TXT',
                'MATERIAL_TYPE_NM', 'DRAWING_NUM', 'IMG_GFILE_SEQ', 'CAD_FILE_SIZE', 'DXF_GFILE_SEQ',
                'MATERIAL_DETAIL_NM', 'CONTROL_PART_QTY', 'UNIT_TOTAL_WORK_TIME', 'UNIT_NC_WORK_TIME',
                'TOTAL_WORK_TIME', 'NC_WORK_TIME', 'MILLING_WORK_TIME', 'GRINDING_WORK_TIME', 'LATHE_WORK_TIME'
            ];
            const includeList = controlList.concat(partList);

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['CONTROL_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['CONTROL_NUM'] : undefined,
                            cellData = data[j][dataIndx],
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                        if (controlList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        } else if (partList.includes(dataIndx)) {
                            let cellData = data[j][dataIndx],
                                cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] : undefined;

                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellData == cellDataPrev) {
                                    rc++;
                                }
                            } else if (rc > 1) {
                                /**
                                 * r1: rowIndx of first row. 첫 번째 행의 rowIndx.
                                 * c1: colIndx of first column. 첫 번째 열의 colIndx.
                                 * rc: number of rows in the range. 범위 내 행 수.
                                 * cc: number of columns in the range. 범위 내 열 수.
                                 */
                                mergeCellList.push({r1: j, c1: i, rc: rc, cc: 1});
                                rc = 1;
                            }
                        }
                    }
                }
            }

            grid.option('mergeCells', mergeCellList);
            if (refresh) {
                grid.refreshView();
            }
        };
        const g_item_detail_pop_cam_pop = function (controlSeq, controlDetailSeq) {
            $('#cam_work_detail_form').find('#queryId').val('inspection.selectCommItemDetailGridCamPopBefore');
            $('#cam_work_detail_form').find('#CONTROL_SEQ').val(controlSeq);
            $('#cam_work_detail_form').find('#CONTROL_DETAIL_SEQ').val(controlDetailSeq);
            let parameters = {
                'url': '/json-info',
                'data': fnFormToJsonArrayData('cam_work_detail_form')
            };

            fnPostAjaxAsync(function (data) {
                let dataInfo = data.info;
                if (fnIsEmpty(dataInfo)) {
                    fnResetFrom('cam_work_detail_form');
                } else {
                    fnJsonDataToForm('cam_work_detail_form', dataInfo);
                }
            }, parameters, '');

            $('#cam_work_detail_form').find('#queryId').val('inspection.selectCamWorkDetail');
            camWorkDetailObj.dataModel.postData = fnFormToJsonArrayData('cam_work_detail_form');
            $camWorkDetailGrid.pqGrid(camWorkDetailObj);
        };
        /* function */

        /* event */
        $(window).on('resize', _.debounce(function () {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $camWorkDetailGrid.pqGrid('option', 'width', 'auto').pqGrid('option', 'height', size).pqGrid('refresh');
        }, 200));

        $('#cam_work_detail_close').on('click', function () {
            window.close();
        });
        /* event */

        g_item_detail_pop_cam_pop(controlSeq, controlDetailSeq);
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
