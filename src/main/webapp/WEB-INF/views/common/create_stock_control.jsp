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
    <title>재고 작업지시 생성</title>
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        .slider:before {
            left: 10px;
            height: 17px;
            width: 16px;
        }

    </style>
</head>
<body>
<div class="page estimate">
    <div style="height: 90%;padding: 10px;">
        <form class="form-inline" name="CREATE_STOCK_CONTROL_SEARCH_FORM" id="CREATE_STOCK_CONTROL_SEARCH_FORM" role="form" onsubmit="return false;">
            <input type="hidden" name="queryId" id="queryId" value="material.selectInsideStockList">
            <input type="hidden" id="GFILE_SEQ" name="GFILE_SEQ" value="">
            <input type="hidden" id="INSIDE_STOCK_SEQ" name="INSIDE_STOCK_SEQ" value="${INSIDE_STOCK_SEQ}">
            <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;"><i class="xi-desktop"></i>&nbsp;재고 작업지시 생성</h3>
            <label class="switch ml-20" style="height: 25px;">
                <input type="checkbox" id="toggleImageView">
                <span class="slider round"></span>
            </label>
            <label style="font-size: 17px;font-weight: bold;color: black;margin-left: 5px;">도면 View 모드</label>
            <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
            <div class="hWrap mb-10">
                <div class="mt-10">
                    <div style="float: right;display: inline-block;margin-bottom: 10px;">
                        <span style="margin-right: 100px;">
                            <span class="chk_box"><input name="MAIN_COLUMN" id="MAIN_COLUMN" type="checkbox"><label for="MAIN_COLUMN"> 주요컬럼</label></span>
                        </span>
                        <button type="button" class="defaultBtn btn-100w" id="RESET_GRID">
                            <i class="xi-refresh" style="margin-right: 4px;"></i>
                            Reset
                        </button>
                        <button type="button" class="defaultBtn btn-100w red" id="DELETE_ROW">제거</button>
                        <button type="button" class="defaultBtn btn-100w green" id="CREATE_STOCK_CONTROL">작업생성</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="tableWrap">
            <div class="conWrap" style="display: flex;width: 100%;height: 90%;">
                <div id="main_column_draw_div" style="width: 54%;height: auto;margin-right: 15px;display: none;">
                    <!--도면삽입-->
                    <img id="create_stock_control_img" src="/resource/main/blank.jpg" style="width: 100%;height: 100%;max-height: inherit;max-width: inherit;">
                </div>
                <div id="grid_top_div" style="width: 100%;">
                    <div id="CREATE_STOCK_CONTROL_GRID"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    /* init */
    var $createStockControlGrid;
    var selectedCreateControlRowIndex = [];
    const $orderManageStartDate = $('#CREATE_CONTROL_START_DATE');
    const $orderManageEndDate = $('#CREATE_CONTROL_END_DATE');
    $orderManageStartDate.datepicker({dateFormat: 'yy/mm/dd'});
    $orderManageEndDate.datepicker({dateFormat: 'yy/mm/dd'});
    $orderManageStartDate.datepicker('setDate', 'today');
    $orderManageEndDate.datepicker('setDate', 'today');
    let isActiveDrawingView = false;

    $(function () {
        'use strict';
        /* variable */
        const FAMILY_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
        const ORDER_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });
        const COMPANY_STAFF = (function () {
            let list = [];
            let parameters = {'url': '/json-list', 'data': {'queryId': 'dataSource.getCompanyStaffList'}};

            fnPostAjax(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, compCd: obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();

        const gridId = 'CREATE_STOCK_CONTROL_GRID';
        const colModel = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 80, width: 80, editable: false},
            {title: '발주업체', width: 80, dataIndx: 'ORDER_COMP_CD_NM', editable: false},
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE_NM', minWidth: 60, width: 60, editable: false},
            {
                title: '대칭', maxWidth: 40, minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1042')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT', width: 90},
            {title: '소재종류', dataType: 'string', dataIndx: 'MATERIAL_DETAIL',
                width: 80,
                editor: {
                    type: 'select',
                    valueIndx: "value",
                    labelIndx: "text",
                    options: fnGetCommCodeGridSelectBox('1027')
                }
            },
            {
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND',
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text',options: fnGetCommCodeGridSelectBox('1029')},
            },
            {
                title: '표면<br>처리', width: 60, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1039')
                }
            },
            {
                title: '특수<br>처리', align: 'center', dataIndx: 'SPECIAL_TREATMENT', width: 60,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editable: true,
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: [
                        {'value':'MATERIAL_FINISH_GRIND_YN', 'text':'연마'},
                        {'value':'MATERIAL_FINISH_HEAT_YN', 'text':'열처리'}
                    ]
                }
            },
            {
                title: '작업지시번호', align: 'left', width: 160, dataIndx: 'CONTROL_NUM',
                editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
            },
            {title: 'INNER_DUE_DT_COPY', dataType: 'String', dataIndx: 'INNER_DUE_DT_COPY', hidden: true},
            {title: '가공<br>납기', width: 70, dataIndx: 'INNER_DUE_DT', dataType: 'date', format: 'mm/dd',
                editor: {type: 'textbox', init: fnDateEditor},
                editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                render: function (ui) {
                    let rowData = ui.rowData;
                    rowData.INNER_DUE_DT_COPY = ui.cellData;
                }
            },
            {
                title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY', width: 60,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editable: true,
            },
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                        editable: true
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                        editable: true
                    }
                ]
            },
            {title: '재질', dataIndx: 'MATERIAL_TYPE', hidden: true}
        ];
        const obj = {
            minHeight: '100%',
            width: '100%',
            height: '100%',
            collapsible: false,
            postRenderInterval: -1, //call postRender synchronously.
            showTitle: false,
            strNoRows: g_noData,
            rowHtHead: 15,
            copyModel: {render: true},
            numberCell: {show:false},
            trackModel: {on: true},
            scrollModel: {autoFit: true},
            editable: false,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', render: controlManageFilterRender},
            filterModel: {mode: 'OR'},
            colModel: colModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('#CREATE_STOCK_CONTROL_SEARCH_FORM'),
                recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            sortModel: {on: false},
            selectChange: function (event, ui) {
                selectedCreateControlRowIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;
                    for (let i = firstRow; i <= lastRow; i++) selectedCreateControlRowIndex.push(i);
                    if (firstRow === lastRow) {
                        let selRowData = $createStockControlGrid.pqGrid("getRowData", {rowIndx: firstRow});
                        $("#CREATE_STOCK_CONTROL_SEARCH_FORM").find("#GFILE_SEQ").val(selRowData.IMG_GFILE_SEQ);
                        if(isActiveDrawingView) {
                            $("#create_stock_control_img").attr("src", '/qimage/' + selRowData.IMG_GFILE_SEQ);
                            // callQuickRowChangeDrawingImageViewer(selRowData.IMG_GFILE_SEQ,selRowData);  // 셀 선택 시 도면 View 실행 중인경우 이미지 표시 하기
                        }
                    }
                }
            },
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let updateListLength = ui.updateList.length;

                    for (let i = 0; i < updateListLength; i++) {
                        let newRowData = ui.updateList[i].newRow;
                        let rowIndx = ui.updateList[i].rowIndx;

                        // 사업자 구분
                        if (newRowData.hasOwnProperty('COMP_CD')) {
                            let index = FAMILY_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index < 0) {
                                index = FAMILY_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.COMP_CD;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'COMP_CD': FAMILY_COMPANY[index].value}
                            });
                        }
                        // 발주업체
                        if (newRowData.hasOwnProperty('ORDER_COMP_CD')) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index < 0) {
                                index = ORDER_COMPANY.findIndex(function (element) {
                                    return element.value === newRowData.ORDER_COMP_CD;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'ORDER_COMP_CD': ORDER_COMPANY[index].value}
                            });
                        }

                        // 작업형태
                        if (newRowData.hasOwnProperty('WORK_TYPE')) {
                            let workType = fnGetCommCodeGridSelectBox('1033');
                            let index = workType.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index < 0) {
                                index = workType.findIndex(function (element) {
                                    return element.value === newRowData.WORK_TYPE;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'WORK_TYPE': workType[index].value}
                            });
                        }
                        // 소재종류
                        if (newRowData.hasOwnProperty('MATERIAL_DETAIL')) {
                            let materialDetailList = fnGetCommCodeGridSelectBox('1027');
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index < 0) {
                                index = materialDetailList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_DETAIL;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_DETAIL': materialDetailList[index].value}
                            });
                        }
                        // 소재형태
                        if (newRowData.hasOwnProperty('MATERIAL_KIND')) {
                            let materialKindList = fnGetCommCodeGridSelectBox('1029');
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index < 0) {
                                index = materialKindList.findIndex(function (element) {
                                    return element.value === newRowData.MATERIAL_KIND;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'MATERIAL_KIND': materialKindList[index].value}
                            });
                        }
                        // 표면처리
                        if (newRowData.hasOwnProperty('SURFACE_TREAT')) {
                            let surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index < 0) {
                                index = surfaceTreatList.findIndex(function (element) {
                                    return element.value === newRowData.SURFACE_TREAT;
                                });
                            }
                            $createStockControlGrid.pqGrid('updateRow', {
                                rowIndx: rowIndx,
                                row: {'SURFACE_TREAT': surfaceTreatList[index].value}
                            });
                        }
                    }
                }
            },
            cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $createStockControlGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },
            beforePaste: function (evt, ui) {
                let CM = this.getColModel(),
                    rows = ui.rows,
                    area = ui.areas[0],
                    //r1 = area.r1,
                    c1 = area.c1;
                for (let i = 0; i < rows.length; i++) {
                    let row = rows[i];
                    for (let j = 0; j < row.length; j++) {
                        let column = CM[j + c1],
                            dt = column.dataType;
                        if (dt === 'integer' || dt === 'float') {
                            row[j] = row[j].replace(/[^(\d|.)]/g, '');
                        }else if(dt === 'date') {
                            let dateCopy = $createStockControlGrid.pqGrid("getRowData", {rowIndx: area.r1}).INNER_DUE_DT_COPY;
                            row[j] = dateCopy;
                        }
                    }
                }
            }
        };
        /* variable */

        /* function */
        const changeViewColumn = function (elementId) {
            let $createStockControlGridInstance = $createStockControlGrid.pqGrid('getInstance').grid;
            let Cols = $createStockControlGridInstance.Columns();
            let array = [];
            const mainArray = [
                'INSIDE_STOCK_NUM', 'SAME_SIDE_YN', 'SIZE_TXT', 'CONTROL_NUM', 'INNER_DUE_DT',
                'ORDER_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY'
            ];
            const allArray = [
                'INSIDE_STOCK_NUM', 'ORDER_COMP_CD_NM', 'WORK_TYPE_NM', 'SAME_SIDE_YN', 'SIZE_TXT', 'MATERIAL_DETAIL',
                'MATERIAL_KIND', 'SURFACE_TREAT', 'SPECIAL_TREATMENT', 'CONTROL_NUM', 'INNER_DUE_DT',
                'ORDER_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY'
            ];

            switch (elementId) {
                case 'ALL':
                    array = allArray
                    break;
                case 'MAIN':
                    array = mainArray;
                    break;
            }

            Cols.alter(function () {
                Cols.each(function (col) {
                    let flag = array.includes(col.dataIndx);
                    flag = !flag;
                    col.hidden = flag;
                    if (flag === false && col.parent !== undefined) {
                        col.parent.hidden = flag;
                    }
                });
            });
        };

        const noSelectedRowAlert = function () {
            if (selectedCreateControlRowIndex.length > 0) {
                return false;
            } else {
                fnAlert(null, '하나 이상 선택해주세요');
                return true;
            }
        };

        function controlManageFilterRender(ui) {
            let val = ui.cellData === undefined ? '' : ui.cellData,
                options = ui.column.editor === undefined ? '' : ui.column.editor.options;
            let index = -1;
            if (options) {
                index = options.findIndex(function (element) {
                    return element.value === val;
                });
                if (index > -1) val = options[index].text;
            }
            if (val) {
                if (ui.column.dataType === 'integer') {
                    val = numberWithCommas(val);
                } else if (ui.column.dataType === 'date' && ui.column.format !== undefined) {
                    let o = new Date(val);
                    val = o && !isNaN(o.getTime()) && $.datepicker.formatDate(ui.column.format, o);
                }

                return val;

            } else {
                return val;
            }
        }

        const autoMerge = function (grid, refresh) {
            let mergeCellList = [],
                colModelList = grid.getColModel(),
                i = colModelList.length,
                data = grid.option('dataModel.data');

            const controlList = [
                'ORDER_STATUS_DT', 'ORDER_COMP_NM', 'REGIST_NUM',
                'ORDER_NUM', 'NOTE', 'ORDER_QTY', 'ORIGINAL_SIDE_QTY', 'OTHER_SIDE_QTY', 'ORDER_DUE_DT',
                'WORK_TYPE_NM', 'MATERIAL_SUPPLY_YN', 'MAIN_INSPECTION', 'SAME_SIDE_YN', 'SIZE_TXT',
                'MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'SPECIAL_TREATMENT'
            ];
            const includeList = controlList;

            while (i--) {
                let dataIndx = colModelList[i].dataIndx,
                    rc = 1,
                    j = data.length;

                if (includeList.includes(dataIndx)) {
                    while (j--) {
                        let controlNum = data[j]['REGIST_NUM'],
                            controlNumPrev = data[j - 1] ? data[j - 1]['REGIST_NUM'] : undefined,
                            cellData = data[j][dataIndx] || '',
                            cellDataPrev = data[j - 1] ? data[j - 1][dataIndx] || '' : undefined;

                        if (controlList.includes(dataIndx)) {
                            if (controlNum === controlNumPrev) {
                                // 이전데이터가 있고 cellData와 cellDataPrev가 같으면 rc증감
                                if (cellDataPrev !== undefined && cellData == cellDataPrev) {
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

        const validationCheck = function (dataList) {
            controlNumCheck(dataList)

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];
                if(typeof rowData.CONTROL_SEQ == 'undefined' || rowData.CONTROL_SEQ == null || rowData.CONTROL_SEQ == '') {
                    if (Object.keys(rowData).length > 2) {
                        requiredCheck(rowData);
                        badCodeCheck(rowData);
                        sideQtyCheck(rowData);
                    }
                }
            }
        };
        const controlNumCheck = function (dataList) {
            $.each(dataList, function (idx,Item) {
                if(typeof Item.CONTROL_SEQ == 'undefined' || Item.CONTROL_SEQ == null || Item.CONTROL_SEQ == '') {
                    var regexpSpec = /[^A-Za-z0-9\-]/gi;
                    if(regexpSpec.test(Item.CONTROL_NUM)) {
                        addErrorList(Item.pq_ri, 'CONTROL_NUM');
                    }
                }
            })
        }

        // required 체크
        const requiredCheck = function (rowData) {
            let list = ['CONTROL_NUM','INNER_DUE_DT','ORDER_QTY'];

            for (let i in list) {
                if (rowData[list[i]] === undefined || rowData[list[i]] == null || rowData[list[i]] === '' || (rowData[list[i]] != null && typeof rowData[list[i]] == 'object' && !Object.keys(rowData[list[i]]).length)) {
                    addErrorList(rowData.pq_ri, list[i]);
                }
            }
        };
        // 잘못된 데이터(코드) 체크
        const badCodeCheck = function (rowData) {
            const rowIndex = rowData.pq_ri;
            const workTypeList = fnGetCommCodeGridSelectBox('1033');
            const materialDetailList = fnGetCommCodeGridSelectBox('1027');
            const materialKindList = fnGetCommCodeGridSelectBox('1029');
            const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');

            // 사업자
            if (rowData.COMP_CD !== undefined && rowData.COMP_CD !== null && rowData.COMP_CD !== '') {
                let index = FAMILY_COMPANY.findIndex(function (element) {
                    return element.value === rowData.COMP_CD;
                });

                if (index < 0) addErrorList(rowIndex, 'COMP_CD');
            }
            // 발주업체
            if (rowData.ORDER_COMP_CD !== undefined && rowData.ORDER_COMP_CD !== null && rowData.ORDER_COMP_CD !== '') {
                let index = ORDER_COMPANY.findIndex(function (element) {
                    return element.value === rowData.ORDER_COMP_CD;
                });

                if (index < 0) addErrorList(rowIndex, 'ORDER_COMP_CD');
            }

            // 작업형태
            if (rowData.WORK_TYPE !== undefined && rowData.WORK_TYPE !== null && rowData.WORK_TYPE !== '') {
                let index = workTypeList.findIndex(function (element) {
                    return element.value === rowData.WORK_TYPE;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_TYPE');
            }
            //소재 상세
            if (rowData.MATERIAL_DETAIL !== undefined && rowData.MATERIAL_DETAIL !== null && rowData.MATERIAL_DETAIL !== '') {
                let index = materialDetailList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_DETAIL;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_DETAIL');
            }
            // 소재형태
            if (rowData.MATERIAL_KIND !== undefined && rowData.MATERIAL_KIND !== null && rowData.MATERIAL_KIND !== '') {
                let index = materialKindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_KIND;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_KIND');
            }
            // 표면처리
            if (rowData.SURFACE_TREAT !== undefined && rowData.SURFACE_TREAT !== null && rowData.SURFACE_TREAT !== '') {
                let index = surfaceTreatList.findIndex(function (element) {
                    return element.value === rowData.SURFACE_TREAT;
                });

                if (index < 0) addErrorList(rowIndex, 'SURFACE_TREAT');
            }
        };

        const sideQtyCheck = function(rowData) {
            if(!fnIsEmpty(rowData.ORIGINAL_SIDE_QTY) || !fnIsEmpty(rowData.OTHER_SIDE_QTY)) {
                if(Number(rowData.ORDER_QTY) !== (Number(rowData.ORIGINAL_SIDE_QTY) + Number(rowData.OTHER_SIDE_QTY))) {
                    addErrorList(rowData.pq_ri, 'ORIGINAL_SIDE_QTY');
                    addErrorList(rowData.pq_ri, 'OTHER_SIDE_QTY');
                }
            }
        }

        // error
        let errorList = [];
        let prevErrorList = [];
        const addErrorList = function (rowIndex, dataIndex) {
            let tempObject = {};
            tempObject.rowIndx = rowIndex;
            tempObject.dataIndx = dataIndex;
            errorList.push(tempObject);
        };

        // cell 색 변경
        const changeCellColor = function (list, prevList) {
            for(let i in prevList) {
                if (prevList.hasOwnProperty(i)) {
                    $createStockControlGrid.pqGrid('removeClass', {rowIndx: prevList[i].rowIndx, dataIndx: prevList[i].dataIndx, cls: 'bg-lightcoral'} );
                }
            }

            if (list.length > 0) {
                for(let i in list) {
                    if (list.hasOwnProperty(i)) {
                        $createStockControlGrid.pqGrid('addClass', {rowIndx: list[i].rowIndx, dataIndx: list[i].dataIndx, cls: 'bg-lightcoral'} );
                    }
                }
            }
        };
        /* function */


        if (!alertify.barcodeDrawingConfirm) {
            alertify.dialog('barcodeDrawingConfirm', function () {
                return {
                    setup: function () {
                        let settings = alertify.confirm().settings;
                        for (let prop in settings)
                            this.settings[prop] = settings[prop];
                        let setup = alertify.confirm().setup();
                        setup.buttons[1].invokeOnClose = false; // indicate if closing the dialog should trigger this button action
                        setup.buttons.push({
                            text: '취소',
                            scope: 'primary'
                        });
                        return setup;
                    },
                    settings: {
                        oncontinue: null
                    },
                    callback: function (closeEvent) {
                        if (closeEvent.index == 2) {
                            if (typeof this.get('oncontinue') === 'function') {
                                let returnValue;
                                returnValue = this.get('oncontinue').call(this, closeEvent);
                                if (typeof returnValue !== 'undefined') {
                                    closeEvent.cancel = !returnValue;
                                }
                            }
                        } else {
                            alertify.confirm().callback.call(this, closeEvent);
                        }
                    }
                };
            }, false, 'confirm');
        }

        $('#toggleImageView').on('click', function () {
            isActiveDrawingView = !isActiveDrawingView;
            if(isActiveDrawingView) {
                $("#grid_top_div").css({width:'46%'});
                if(!$('#MAIN_COLUMN').prop('checked')) {
                    $('#MAIN_COLUMN').trigger('click');
                }
                $("#main_column_draw_div").show();
                $createStockControlGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
                $createStockControlGrid.pqGrid('option', 'scrollModel', {autoFit: false});
            }else {
                $("#grid_top_div").css({width:'100%'});
                if($('#MAIN_COLUMN').prop('checked')) {
                    $('#MAIN_COLUMN').trigger('click');
                }
                $("#main_column_draw_div").hide();
                $createStockControlGrid.pqGrid('option', 'width', '100%').pqGrid('refresh');
                $createStockControlGrid.pqGrid('option', 'scrollModel', {autoFit: true});
            }
            $createStockControlGrid.pqGrid('refreshView');
        });

        function resetInput(form, idArr) {
            $.each(idArr,function (idx,Item) {
                form.find("#"+Item).val('');
            });
        }

        $createStockControlGrid = $('#' + gridId).pqGrid(obj);

        $('#RESET_GRID').on('click', function () {
            $createStockControlGrid.pqGrid('refreshDataAndView');
        });

        $('#DELETE_ROW').on('click', function () {
            if(!noSelectedRowAlert()) {
                let data = $createStockControlGrid.pqGrid('option', 'dataModel.data');

                for(var i=0;i<selectedCreateControlRowIndex.length;i++) {
                    let rowData = $createStockControlGrid.pqGrid('getRowData', {rowIndx: selectedCreateControlRowIndex[i]});

                    $createStockControlGrid.pqGrid('deleteRow', {'rowIndx': selectedCreateControlRowIndex[i]});//rowIndx
                }
            }
        });

        $('#CREATE_STOCK_CONTROL').on('click', _.debounce(function () {
            prevErrorList = errorList;
            errorList = [];

            let data = $createStockControlGrid.pqGrid('option', 'dataModel.data');

            validationCheck(data);
            changeCellColor(errorList, prevErrorList);

            if (errorList.length) {
                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                return false;
            }

            let parameters = {
                'url': '/createNewStockControl',
                'data': {data: JSON.stringify(data)}
            };

            fnPostAjaxAsync(function (data) {
                if(fnIsEmpty(data.list)) {
                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                        window.close();
                    });
                }else {
                    let controlNumStr = '';
                    for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                        controlNumStr += data.list[i].CONTROL_NUM;
                        if (i < LENGTH - 1) {
                            controlNumStr += ', ';
                        }
                    }
                    fnAlert(null, controlNumStr + '<br>이미 등록된 주문입니다.');
                }
            }, parameters, '');
        },1000));


        $('#MAIN_COLUMN').on('change', function () {
            if($(this).prop('checked')) {
                changeViewColumn('MAIN')
            }else {
                changeViewColumn('ALL');
            }
            $createStockControlGrid.pqGrid('refreshView');
        });

        $(document).on({
            mouseenter: function () {
                if (isActiveDrawingView) {
                    const id = $(this).attr('id');
                    const splits = id.split('-');
                    const rowIndx = splits[4];
                    const rowData = $(this).closest('.pq-grid').pqGrid('getRowData', {rowIndx: rowIndx});

                    if (rowData.IMG_GFILE_SEQ) {
                        $("#create_stock_control_img").attr("src", '/qimage/' + rowData.IMG_GFILE_SEQ);
                        $("#CREATE_STOCK_CONTROL_SEARCH_FORM").find("#GFILE_SEQ").val(rowData.IMG_GFILE_SEQ);
                    }else {
                        $("#create_stock_control_img").attr("src", '/resource/main/blank.jpg');
                        $("#CREATE_STOCK_CONTROL_SEARCH_FORM").find("#GFILE_SEQ").val("");
                    }
                }
            }
        }, '#CREATE_STOCK_CONTROL_GRID .pq-grid-row');


        $(window).on('resize', function() {
            console.log("resize");
            $createStockControlGrid.pqGrid('refreshView');
        });
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>