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

<div class="page estimate">
    <div class="topWrap">
        <form class="form-inline" name="CONTROL_MANAGE_SEARCH_FORM_test" id="CONTROL_MANAGE_SEARCH_FORM_test" role="form">
            <input type="hidden" name="queryId" id="queryId" value="orderMapper.selectControlManageList">
        </form>
    </div>
    <div class="bottomWrap row1_bottomWrap">
        <div class="tableWrap">
            <div class="conWrap">
                <div id="CONTROL_MANAGE_GRID_test"></div>
                <div class="right_sort">
                    전체 조회 건수 (Total : <span id="CONTROL_MANAGE_RECORDS_test" style="color: #00b3ee">0</span>)
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        /* variable */
        let $orderManagementGrid_test;
        const gridId_test = 'CONTROL_MANAGE_GRID_test';
        let postData_test = fnFormToJsonArrayData('#CONTROL_MANAGE_SEARCH_FORM_test');
        const colModel_test = [
            {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM'},
            {title: 'CONTROL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_SEQ'},
            {title: 'CONTROL_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'CONTROL_PROGRESS_SEQ'},
            {title: 'ORDER_STATUS', dataType: 'integer',dataIndx: 'ORDER_STATUS'},
            {title: 'ORDER_SEQ', dataType: 'integer', dataIndx: 'ORDER_SEQ'},
            {title: 'CONTROL_DETAIL_SEQ', dataType: 'integer', dataIndx: 'CONTROL_DETAIL_SEQ'},
            {title: 'PART_PROGRESS_SEQ', dataType: 'integer', dataIndx: 'PART_PROGRESS_SEQ'},
            {title: 'PART_STATUS', dataType: 'integer', dataIndx: 'PART_STATUS'},

            {
                title: '주문상태', align: 'center', colModel: [
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_ORIGINAL'},
                    {title: '상태', dataIndx: 'CONTROL_STATUS'},
                    {title: '상태', datatype: 'string', dataIndx: 'CONTROL_STATUS_NM'},
                    {title: '', minWidth:15, width:20, dataType: 'integer', dataIndx: 'CONTROL_VER'},
                    {title: '변경일시', width: 95, datatype: 'date', dataIndx: 'CONTROL_STATUS_DT'}
                ]
            },
            {title: '단가확인', width: 70, dataType: 'string', dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
            },
            {title: '발주업체', dataType: 'string', dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},

            },
            {title: '구매담당', dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},

            },
            {title: '설계자', dataType: 'string', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '비고', dataType: 'string', dataIndx: 'CONTROL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: 'INV No.<br>(거래명세No.)', width: 100, dataType: 'string', dataIndx: 'INVOICE_NUM'},
            {title: '프로젝트', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '모듈', width: 70, dataType: 'string', dataIndx: 'MODULE_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '납품처', dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '비고(라벨)', width: 100, dataType: 'string', dataIndx: 'LABEL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '주요<br>검사품', dataType: 'string', dataIndx: 'MAIN_INSPECTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '긴<br>급', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'EMERGENCY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '', minWidth: 30, width: 30, dataType: 'string', dataIndx: 'CONTROL_NUM_BUTTON'},
            {title: '관리번호', width: 150, dataType: 'string', dataIndx: 'CONTROL_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', },
            {title: '도면번호버전', dataType: 'string', dataIndx: 'DRAWING_VER'},
            {title: '도면번호', width: 150, dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '품명', width: 150, dataType: 'string', dataIndx: 'ITEM_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '규격', width: 110, dataType: 'string', dataIndx: 'SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '작업<br>형태', dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '외<br>주', minWidth: 15, width: 20, dataType: 'string', dataIndx: 'OUTSIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '재질', dataType: 'string', dataIndx: 'MATERIAL_TYPE_NM'},
            {title: '소재<br>형태', dataType: 'string', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '표면<br>처리', dataType: 'string', dataIndx: 'SURFACE_TREAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {title: '소재비고', dataType: 'string', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: 'Part<br>단위<br>수량', align: 'right', dataType: 'integer', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, },
            {title: '주문<br>수량', align: 'right', dataType: 'integer', dataIndx: 'CONTROL_ORDER_QTY'},
            {
                title: '', datatype: 'string', dataIndx: 'ORDER_NUM_PLUS_BUTTON'
            },
            {title: '발주번호', width: 90, datatype: 'string', dataIndx: 'ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '납기', width: 70, datatype: 'string', dataIndx: 'ORDER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '출고', datatype: 'string', dataIndx: 'OUT_QTY'},
            {title: '출고일자', datatype: 'string', dataIndx: 'ORDER_OUT_FINISH_DT'},
            {title: '납품확인', width: 70, datatype: 'string', dataIndx: 'DELIVERY_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {
                title: '상세가공요건', dataIndx: 'DETAIL_MACHINE_REQUIREMENT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},

            },
            {
                title: 'TM각비', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_TM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
            },
            {
                title: '연마비', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_GRIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {
                title: '열처리', width: 70, dataType: 'string', dataIndx: 'MATERIAL_FINISH_HEAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {title: '@', datatype: 'string', dataIndx: 'RKFH'},
            {title: '가로', datatype: 'string', dataIndx: 'SIZE_W_M'},
            {title: '세로', datatype: 'string', dataIndx: 'SIZE_H_M'},
            {title: '높이', datatype: 'string', dataIndx: 'SIZE_T_M'},
            {title: '중량', datatype: 'string', dataIndx: 'SIZE_D_M'},
            {title: '부피', datatype: 'string', dataIndx: 'SIZE_L_M'},
            {title: '소재비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_MATERIAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: 'TM각비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_TM_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '연마비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_GRIND_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '열처리', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_HEAT_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '표면처리', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_SURFACE_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '가공비', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_PROCESS_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '기타추가', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_ETC_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '견적비고', align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_AMT_NOTE',styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},  },
            {title: '계산<br>견적단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'CALCUL_EST_UNIT_COST'},
            {title: '최종<br>견적단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '견적<br>합계금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'EST_TOTAL_AMOUNT'},
            {title: '최종<br>공급단가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '합계금액', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'FINAL_AMT'},
            {title: '종전가', width: 90, align: 'right', dataType: 'integer', format: '#,###', dataIndx: 'WHDWJSRK'},
            {title: '변경전<br>도면번호', width: 120, dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, },
            {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH'},
            {title: '마감월', datatype: 'string', dataIndx: 'CLOSE_MONTH_TRAN'},
            {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER'},
            {title: '차수', datatype: 'string', dataIndx: 'CLOSE_VER_TRAN'},
            {title: '작성자', datatype: 'string', dataIndx: 'CLOSE_USER_ID'},
            {title: '일시', width: 120, datatype: 'string', dataIndx: 'CLOSE_DT'},
            {title: '현재 위치', dataType: 'string', dataIndx: 'POP_POSITION'},
            {title: '현재 위치', dataType: 'string', dataIndx: 'POP_POSITION_NM'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS'},
            {title: '현재 위치', dataType: 'string', dataIndx: 'POP_POSITION_NM'},
            {title: '진행상태', dataType: 'string', dataIndx: 'PART_STATUS_NM'},
            {title: 'DXF', dataType: 'string', dataIndx: 'DXF_GFILE_SEQ'},
            {title: 'IMG', dataType: 'string', dataIndx: 'IMG_GFILE_SEQ'},
            {title: 'Rev.', dataType: 'string', dataIndx: 'REVD.'},
            {title: 'Rev. 일시', width: 120, dataType: 'string', dataIndx: 'REVDLFTL.'},
            {title: 'Seq.', minWidth: 30, width: 35, datatype: 'integer', dataIndx: 'INSPECT_SEQ'},
           {title: '등급', minWidth: 30, width: 35, datatype: 'string', dataIndx: 'INSPECT_GRADE_NM'},
           {title: '불량/반품', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'INSPECT_TYPE_NM'},
           {title: '불량코드', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'INSPECT_RESULT_NM'},
           {title: '비고', minWidth: 20, width: 55, datatype: 'string', dataIndx: 'INSPECT_DESC'},
           {title: '조치', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'ERROR_ACTION_NM'},
           {title: '조치방안', minWidth: 30, width: 70, datatype: 'string', dataIndx: 'ERROR_NOTE'},
            {title: '외주업체', datatype: 'string', dataIndx: 'OUTSIDE_COMP_CD'},
            {title: '외주업체', datatype: 'string', dataIndx: 'OUTSIDE_COMP_NM'},
            {title: '자재사급', datatype: 'string', dataIndx: 'OUTSIDE_MATERIAL_SUPPLY_YN'},
            {title: '외주단가', align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_UNIT_AMT'},
            {title: '합계금액', align: 'right', dataType: 'integer', dataIndx: 'OUTSIDE_FINAL_AMT'},
            {title: '요망납기', datatype: 'string', dataIndx: 'OUTSIDE_HOPE_DUE_DT'},
            {title: '입고날짜', datatype: 'string', dataIndx: 'dhlwndlqrhskfWk'},
            {title: '비고', datatype: 'string', dataIndx: 'OUTSIDE_NOTE'},
            {title: '불량Code', datatype: 'string', dataIndx: 'dhlwnqnffidcode'},
            {title: '조치방안', datatype: 'string', dataIndx: 'dhlwnwhclqkddks'},
            {title: '등록/업데이트<br>일시', width: 120, dataType: 'string', dataIndx: 'STATUS_DT'},
            {title: 'CONTROL_BARCODE_NUM', dataType: 'string', dataIndx: 'CONTROL_BARCODE_NUM'},
            {title: 'LABEL_BARCODE_NUM', dataType: 'string', dataIndx: 'LABEL_BARCODE_NUM'},
            {title: 'DEL_YN', dataType: 'string', dataIndx: 'DEL_YN'}
        ];
        const obj_test = {
            minHeight: '100%',
            height: 710,
            virtualX: true,
            virtualY: true,
            resizable: true,
            colModel: colModel_test,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: postData_test, recIndx: 'ROW_NUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            }
        };

        $orderManagementGrid_test = $('#' + gridId_test).pqGrid(obj_test);

    });
</script>
