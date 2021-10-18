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
    <title>장비 정보 관리</title>
</head>
<body>
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;border: none;margin: 0;">
        <h3><i class="xi-layout-o"></i>&nbsp;장비 정보 관리</h3>
        <form class="form-inline" id="stock_equip_info_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectStockEquipInfo">
            <div class="d-flex align-items-center" style="margin-top: 5px;">
                <div>
                    <span style="font-size: 1.5rem;font-family: 'NotoKrB';color: #535759;">장비 List</span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-50w" name="add_equip_info" id="add_equip_info">추가</button>
                    <button type="button" class="defaultBtn btn-50w red" name="delete_equip_info" id="delete_equip_info">삭제</button>
                    <button type="button" class="defaultBtn btn-50w green" id="save_equip_info">저장</button>
                </div>
            </div>
        </form>
        <hr style="margin-top: 5px;">
        <div>
            <div id="stock_equip_info_grid"></div>
        </div>
        <form class="form-inline" id="stock_equip_list_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="material.selectStockEquipList">
            <input type="hidden" name="STOCK_EQUIP_SEQ" id="STOCK_EQUIP_SEQ" value="">
            <div class="d-flex align-items-center mt-10">
                <div>
                    <span style="font-size: 1.5rem;font-family: 'NotoKrB';color: #535759;">재고 List</span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-50w red" name="delete_equip_list" id="delete_equip_list">삭제</button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="stock_equip_list_grid"></div>
        </div>
        <div class="text-center">
            <button class="defaultBtn grayPopGra stock_equip_popup_close">닫기</button>
        </div>
    </div>
<script>
    $(function () {
        'use strict';

        const ORDER_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getOrderCompanyList'}
        });

        let selectedRowInfoIndex = [];
        let selectedRowListIndex = [];

        let stockEquipInfoGrid = $("#stock_equip_info_grid"); // 재고 장비 정보 그리드
        let stockEquipListGrid = $("#stock_equip_list_grid"); // 재고 장비 리스트 그리드
        let stockEquipInfoColModel = [
            {title: 'STOCK_EQUIP_SEQ', dataType: 'integer', dataIndx: 'STOCK_EQUIP_SEQ', hidden: true},
            {title: '장비명', dataType: 'string', dataIndx: 'STOCK_EQUIP_NM', minWidth: 100, width: 100, editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
            },
            {title: '내용', dataType: 'string', dataIndx: 'NOTE', minWidth: 120, width: 120, editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
            },
            {title: '발주처', dataType: 'string', dataIndx: 'ORDER_COMP_CD', minWidth: 80, width: 80, editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY,
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let index = ORDER_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = ORDER_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : ORDER_COMPANY[index].text;
                    }
                }
            },
            {title: '편성재고', dataType: 'string', dataIndx: 'PLAN_STOCK_QTY',minWidth: 60, width: 60, editable: true,
                styleHead: {'font-weight': 'bold', 'background': '#aac8ed'}
            },
            {title: '생성일시', dataType: 'string', dataIndx: 'INSERT_DT', minWidth: 80, width: 80, editable: false}
        ];
        let stockEquipListColModel = [
            {title: 'STOCK_EQUIP_SEQ', dataType: 'integer', dataIndx: 'STOCK_EQUIP_SEQ', hidden: true},
            {title: 'INSIDE_STOCK_SEQ', dataType: 'integer', dataIndx: 'INSIDE_STOCK_SEQ', hidden: true},
            {title: '그룹명', dataType: 'string', dataIndx: 'STOCK_EQUIP_NM', minWidth: 100, width: 100, editable: false},
            {title: '재고번호', dataType: 'string', dataIndx: 'INSIDE_STOCK_NUM', minWidth: 100, width: 100, editable: false},
            {title: '규격', dataType: 'string', dataIndx: 'SIZE_TXT',minWidth: 110, width: 110},
            {title: '소재', dataType: 'string', dataIndx: 'MATERIAL_DETAIL_NM', minWidth: 90, width: 90, editable: false},
            {title: '대칭', dataType: 'string', dataIndx: 'SAME_SIDE_YN', minWidth: 50, width: 50, editable: false},
            {title: '품명', dataType: 'string', dataIndx: 'ITEM_NM', minWidth: 120, width: 120, editable: false},
            {title: '편성일시', dataType: 'string', dataIndx: 'INSERT_DT', minWidth: 80, width: 80, editable: false}
        ];
        let stockEquipInfoObj = {
            height: 150,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            selectionModel: { type: 'row', mode: 'single'} ,
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: stockEquipInfoColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('stock_equip_info_form'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            complete: function (event, ui) {
                setTimeout(function (){
                    if(stockEquipListGrid.hasClass('pq-grid')){
                        stockEquipInfoGrid.pqGrid('setSelection', {rowIndx: 0});
                    }
                },300);
            },
            rowSelect: function (event, ui) {
                selectedRowInfoIndex = [ui.addList[0].rowData.pq_ri];
                let STOCK_EQUIP_SEQ = ui.addList[0].rowData.STOCK_EQUIP_SEQ;
                $("#stock_equip_list_form #STOCK_EQUIP_SEQ").val(STOCK_EQUIP_SEQ);

                stockEquipListGrid.pqGrid("option", "dataModel.postData", function(ui){
                    return fnFormToJsonArrayData('#stock_equip_list_form');
                } );
                if(stockEquipListGrid.hasClass('pq-grid')){
                    stockEquipListGrid.pqGrid('refreshDataAndView');
                }
            }
        };
        let stockEquipListObj = {
            height: 250,
            collapsible: false,
            resizable: false,
            showTitle: false,
            rowHtHead: 15,
            numberCell: {title: 'No.', show: false},
            scrollModel: {autoFit: true},
            trackModel: {on: true},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
            colModel: stockEquipListColModel,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: fnFormToJsonArrayData('stock_equip_list_form'), recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            selectChange: function (event, ui) {
                selectedRowListIndex = [];
                for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                    let firstRow = ui.selection._areas[i].r1;
                    let lastRow = ui.selection._areas[i].r2;

                    for (let i = firstRow; i <= lastRow; i++) selectedRowListIndex.push(i);
                }
            }
        };
        stockEquipInfoGrid.pqGrid(stockEquipInfoObj);
        stockEquipListGrid.pqGrid(stockEquipListObj);

        $('#add_equip_info').on('click', function (e) {
            var totalRecords = stockEquipInfoGrid.pqGrid('option', 'dataModel.data').length;
            stockEquipInfoGrid.pqGrid('addNodes', [{}], totalRecords + 1);
        })

        $('#delete_equip_info').on('click', function (e) {
            if (selectedRowInfoIndex.length <= 0) {
                fnAlert(null, "삭제할 데이터를 선택해 주십시오.");
                return;
            }
            fnConfirm(null, "선택하신 장비 정보가 삭제됩니다.<br>진행하시겠습니까?", function () {
                fnDeletePQGrid(stockEquipInfoGrid, selectedRowInfoIndex, "material.deleteStockEquipInfo", function () {
                    if(stockEquipInfoGrid.hasClass('pq-grid')){
                        stockEquipInfoGrid.pqGrid('refreshDataAndView');
                    }
                });
            });
        })

        $('#save_equip_info').on('click', function (e) {
            const insertQueryList = ['material.insertStockEquipInfo'];
            const updateQueryList = ['material.updateStockEquipInfo'];

            fnModifyPQGrid(stockEquipInfoGrid, insertQueryList, updateQueryList);
        })

        $('#delete_equip_list').on('click', function (e) {
            if (selectedRowListIndex.length <= 0) {
                fnAlert(null, "삭제할 데이터를 선택해 주십시오.");
                return;
            }
            fnConfirm(null, "선택하신 정보가 삭제됩니다.<br>진행하시겠습니까?", function () {
                fnDeletePQGrid(stockEquipListGrid, selectedRowListIndex, "material.deleteStockEquipList", function () {
                    if(stockEquipListGrid.hasClass('pq-grid')){
                        stockEquipListGrid.pqGrid('refreshDataAndView');
                    }
                });
            });
        })

        $('.stock_equip_popup_close').on('click', function () {
            window.close();
        });

    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
