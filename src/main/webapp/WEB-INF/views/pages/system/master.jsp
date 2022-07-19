<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page onegrid">
    <div class="bottomWrap" style="margin-top: 20px;">
        <div class="col-sm-3">
            <section class="panel panel-success portlet-item">
                <header class="panel-heading">
                    <a data-toggle="modal" href="#production_target_amount_register_popup">Production Target Amount Setting</a>
                </header>
                <ul class="list-group alt">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-body">
                                <div>V 공장별 작업 생산 목표금액을 설정 한다.</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
        <div class="col-sm-3">
            <section class="panel panel-success portlet-item">
                <header class="panel-heading">
                    <a data-toggle="modal" href="#sales_target_amount_register_popup">Sales Target Amount Setting</a>
                </header>
                <ul class="list-group alt">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-body">
                                <div>V 공장별 영업 목표금액을 설정 한다.</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
        <div class="col-sm-3">
            <section class="panel panel-success portlet-item">
                <header class="panel-heading">
                    <a data-toggle="modal" href="#working_time_setting_popup">Working Time Setting</a>
                </header>
                <ul class="list-group alt">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-body">
                                <div>V 공장별 작업시간 관리</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
        <div class="col-sm-3">
            <section class="panel panel-success portlet-item">
                <header class="panel-heading">
                    <a data-toggle="modal" href="#material_size_inquiry_setting_popup">Material Size Inquiry Setting</a>
                </header>
                <ul class="list-group alt">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-body">
                                <div>V 자재 사이즈 범위 조건 설정</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
        <div class="col-sm-3">
            <section class="panel panel-success portlet-item">
                <header class="panel-heading">
                    <a data-toggle="modal" href="#equipment_report_operate_setting_popup">Report Equipment Setting</a>
                </header>
                <ul class="list-group alt">
                    <li class="list-group-item">
                        <div class="media">
                            <div class="media-body">
                                <div>V 가동률 Report 장비 설정</div>
                            </div>
                        </div>
                    </li>
                </ul>
            </section>
        </div>
        <c:if test="${authUserInfo.USER_ID eq 'manager1'}">
<%--            <button type="button" class="defaultBtn btn-100w" id="DRAWING_FILE_MAKE" style="background-color: #5b9bd5">누락도면생성</button>--%>
            <button type="button" class="defaultBtn btn-100w" id="DRAWING_FILE_MAKE" style="background-color: #5b9bd5">재고도면화질개선</button>
        </c:if>
    </div>
</div>
<!-- 생산 목표금액 설정 -->
<div class="popup_container" id="production_target_amount_register_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>생산 목표금액 설정</h3>
        <hr>
        <button type="button" class="pop_close" name="production_target_amount_register_close">닫기</button>
        <form class="form-inline" id="production_target_amount_register_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectProductionTargetAmountRegisterList">
            <div class="d-flex align-items-center">

                <div>
                    <span class="slt_wrap">
                        <label class="label_100">조회년월</label>
                        <select class="wd_100" class="two" name="YEAR" id="production_target_amount_register_year"></select>
                    </span>
                    <span class="slt_wrap">
                        <label class="label_100" for="WORK_FACTORY">대상공장</label>
                        <select class="wd_200" name="WORK_FACTORY" id="work_factory" title="대상공장">
                            <option value=""><spring:message code="com.form.top.all.option"/></option>
                            <c:forEach var="code" items="${HighCode.H_1014}">
                                <option value="${code.CODE_CD}">${code.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w green" id="production_target_amount_save">
                        저장
                    </button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="production_target_amount_register_grid"></div>
        </div>

        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="production_target_amount_register_close">닫기</button>
        </div>
    </div>
</div>
<!-- 영업 목표금액 설정 -->
<div class="popup_container" id="sales_target_amount_register_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>영업 목표금액 설정</h3>
        <hr>
        <button type="button" class="pop_close" name="sales_target_amount_register_close">닫기</button>
        <form class="form-inline" id="sales_target_amount_register_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectSalesTargetAmountRegisterList">
            <div class="d-flex align-items-center">
                <div>
                    <span class="slt_wrap">
                        <label class="label_100">조회년월</label>
                        <select class="wd_100" class="two" name="YEAR" id="sales_target_amount_register_year"></select>
                    </span>
                    <span class="slt_wrap">
                        <span class="slt_wrap">
                            <label class="label_100" for="COMP_CD">사업자</label>
                            <select class="wd_200" name="COMP_CD" id="COMP_CD">
                                <option value=""><spring:message code="com.form.top.all.option"/></option>
                            </select>
                        </span>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w green" id="sales_target_amount_save">
                        저장
                    </button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="sales_target_amount_register_grid"></div>
        </div>

        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="sales_target_amount_register_close">닫기</button>
        </div>
    </div>
</div>
<!-- Working Time 설정 -->
<div class="popup_container" id="working_time_setting_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>요일별 Working Time 설정 (분단위)</h3>
        <hr>
        <button type="button" class="pop_close" name="working_time_setting_pop_close">닫기</button>
        <form class="form-inline" id="working_time_setting_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectWorkingWeekTimeList">
            <div class="d-flex align-items-center">
                <div></div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w green" id="working_time_save">저장</button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="working_time_setting_grid"></div>
        </div>
        <form class="form-inline" id="working_day_time_setting_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectWorkingDayTimeList">
            <div class="d-flex align-items-center mt-10">
                <div>
                    <span class="slt_wrap">
                        <label class="label_65" style="text-align: left;">조회년월</label>
                        <select class="wd_100" name="WORKING_DAY_TIME_SEARCH_YEAR" id="WORKING_DAY_TIME_SEARCH_YEAR">
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-50w" name="add_day_time" id="add_day_time">추가</button>
                    <button type="button" class="defaultBtn btn-50w red" name="delete_day_time" id="delete_day_time">삭제</button>
                    <button type="button" class="defaultBtn btn-50w green" id="working_day_time_save">저장</button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="working_day_time_setting_grid"></div>
        </div>
        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="working_time_setting_pop_close">닫기</button>
        </div>
    </div>
</div>
<!-- 자재 검색 사이즈 범위 설정 -->
<div class="popup_container" id="material_size_inquiry_setting_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>자재 검색 사이즈 범위 설정</h3>
        <hr>
        <button type="button" class="pop_close" name="material_size_inquiry_setting_pop_close">닫기</button>
        <form class="form-inline" id="material_size_inquiry_setting_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="systemMapper.selectMaterialSizeSearchList">
            <div class="d-flex align-items-center">
                <div></div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w" id="material_size_inquiry_add">추가</button>
                    <button type="button" class="defaultBtn btn-100w red" id="material_size_inquiry_delete">삭제</button>
                    <button type="button" class="defaultBtn btn-100w green" id="material_size_inquiry_save">저장</button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="material_size_inquiry_setting_grid"></div>
        </div>
        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="material_size_inquiry_setting_pop_close">닫기</button>
        </div>
    </div>
</div>
<!-- 가동률 레포트 장비 설정 -->
<div class="popup_container" id="equipment_report_operate_setting_popup" style="display: none;">
    <div class="controlCloseLayerPopup" style="width: 768px; height: 540px;">
        <h3>가동률 레포트 장비 설정</h3>
        <hr>
        <button type="button" class="pop_close" name="equipment_report_operate_setting_pop_close">닫기</button>
        <form class="form-inline" id="equipment_report_operate_setting_form" role="form">
            <input type="hidden" name="queryId" id="queryId" value="machine.selectMachineList">
            <div class="d-flex align-items-center">
                <div>
                    <span class="slt_wrap">
                        <label class="label_100">설치위치</label>
                        <select class="wd_100" name="SEL_FACTORY_AREA" id="SEL_FACTORY_AREA">
                            <option value=""><spring:message code="com.form.top.all.option" /></option>
                            <c:forEach var="vlocale" items="${HighCode.H_1005}">
                                <option value="${vlocale.CODE_CD}">${vlocale.CODE_NM_KR}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
                <div class="ml-auto">
                    <button type="button" class="defaultBtn btn-100w" id="equipment_report_operate_setting_search">조회</button>
                    <button type="button" class="defaultBtn btn-100w green" id="equipment_report_operate_setting_save">저장</button>
                </div>
            </div>
        </form>
        <hr>
        <div>
            <div id="equipment_report_operate_setting_grid"></div>
        </div>
        <div class="text-center">
            <button class="defaultBtn grayPopGra" name="equipment_report_operate_setting_pop_close">닫기</button>
        </div>
    </div>
</div>
<script>
    // 생산 목표금액 설정
    (function (id, severalYears) {
        $('#' + id).empty();
        let date = new Date();
        date.setMonth(date.getMonth() + 1);
        let year = date.getFullYear();

        for (let i = year - 2; i < year + severalYears; i++) {
            $('#' + id).append(new Option(i + '년', i));
        }
        $('#' + id).val(year).prop('selected', true);
    })('production_target_amount_register_year', 3);

    (function (id, severalYears) {
        $('#' + id).empty();
        let date = new Date();
        date.setMonth(date.getMonth() + 1);
        let year = date.getFullYear();

        for (let i = year - 3; i < year + severalYears; i++) {
            $('#' + id).append(new Option(i + '년', i));
        }
        $('#' + id).val(year).prop('selected', true);
    })('WORKING_DAY_TIME_SEARCH_YEAR', 2);

    let $productionTargetAmountRegisterGrid;
    const productionTargetAmountRegisterGridId = 'production_target_amount_register_grid';
    const productionTargetAmountRegisterPostData = fnFormToJsonArrayData('#production_target_amount_register_form');
    const productionTargetAmountRegisterColModel = [
        {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
        {title: '대상년월', dataIndx: 'YYYYMM'},
        {title: '대상공장', dataIndx: 'WORK_FACTORY', hidden: true},
        {title: '대상공장', dataIndx: 'WORK_FACTORY_NM'},
        {
            title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'GOAL_AMT', editable: true,
            styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
        }
    ];
    const productionTargetAmountRegisterObj = {
        height: 365,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        scrollModel: {autoFit: true},
        trackModel: {on: true},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
        colModel: productionTargetAmountRegisterColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: productionTargetAmountRegisterPostData, recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        beforeValidate(event, ui) {
            ui.addList = [];
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
                    if (dt == "integer" || dt == "float") {
                        row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                    }
                }
            }
        }
    };

    $('#production_target_amount_register_popup').on({
        'show.bs.modal': function () {
            $productionTargetAmountRegisterGrid = $('#' + productionTargetAmountRegisterGridId).pqGrid(productionTargetAmountRegisterObj);
        },
        'hide.bs.modal': function () {
            $productionTargetAmountRegisterGrid.pqGrid('destroy');
        }
    });

    // 22.07.18 운영서버 누락도면 파일 생성을 위한 기능. 현재는 필요없을듯하여 주석
    $('#DRAWING_FILE_MAKE').on('click', function () {
        var parameters = {
            // 'url': '/checkDrawing',
            'url': '/makeThumbnail',
            'data': {}
        };
        fnPostAjax(function (data) {
            console.log(data);
        }, parameters, '');
    });

    $('[name=production_target_amount_register_close]').on('click', function () {
        $('#production_target_amount_register_popup').modal('hide');
    });
    
    $('#production_target_amount_register_form').on('change', function () {
        $productionTargetAmountRegisterGrid.pqGrid('option', 'dataModel.postData', function () {
            return fnFormToJsonArrayData('#production_target_amount_register_form');
        });
        $productionTargetAmountRegisterGrid.pqGrid('refreshDataAndView');
    });

    $('#production_target_amount_save').on('click', function () {
        const insertQueryList = ['systemMapper.createProductionTargetAmount'];
        const updateQueryList = insertQueryList;

        fnModifyPQGrid($productionTargetAmountRegisterGrid, insertQueryList, updateQueryList);
    });
    // 영업 목표금액 설정
    (function (id, severalYears) {
        $('#' + id).empty();
        let date = new Date();
        date.setMonth(date.getMonth() + 1);
        let year = date.getFullYear();

        for (let i = year - 2; i < year + severalYears; i++) {
            $('#' + id).append(new Option(i + '년', i));
        }
        $('#' + id).val(year).prop('selected', true);
    })('sales_target_amount_register_year', 3);
    (function () {
        fnCommCodeDatasourceSelectBoxCreate($('#sales_target_amount_register_form').find('#COMP_CD'), 'all', {
            'url': '/json-list',
            'data': {'queryId': 'dataSource.getBusinessCompanyList'}
        });
    })();

    let $salesTargetAmountRegisterGrid;
    const salesTargetAmountRegisterGridId = 'sales_target_amount_register_grid';
    const salesTargetAmountRegisterPostData = fnFormToJsonArrayData('#sales_target_amount_register_form');
    const salesTargetAmountRegisterColModel = [
        {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
        {title: '대상년월', dataIndx: 'YYYYMM'},
        {title: '사업자', dataIndx: 'COMP_CD', hidden: true},
        {title: '사업자', dataIndx: 'COMP_NM'},
        {
            title: '목표금액', dataType: 'integer', format: '#,###', dataIndx: 'GOAL_AMT', editable: true,
            styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
        }
    ];
    const salesTargetAmountRegisterObj = {
        height: 365,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        scrollModel: {autoFit: true},
        trackModel: {on: true},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center', editable: false},
        colModel: salesTargetAmountRegisterColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: salesTargetAmountRegisterPostData, recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        beforeValidate(event, ui) {
            ui.addList = [];
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
                    if (dt == "integer" || dt == "float") {
                        row[j] = row[j].replace(/[^(\d|\.)]/g, "");
                    }
                }
            }
        }
    };
    // Working Time 설정
    let $workingTimeSettingGrid;
    const workingTimeSettingId = 'working_time_setting_grid';
    const workingTimeSettingPostData = fnFormToJsonArrayData('#working_time_setting_form');
    const workingTimeSettingColModel = [
        {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
        {title: '위치', dataIndx: 'WORK_FACTORY', hidden: true},
        {title: '위치', dataIndx: 'WORK_FACTORY_NM', editable: false},
        {
            title: '월', dataType: 'integer', dataIndx: 'MON', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '화', dataType: 'integer', dataIndx: 'TUE', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '수', dataType: 'integer', dataIndx: 'WED', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '목', dataType: 'integer', dataIndx: 'THU', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '금', dataType: 'integer', dataIndx: 'FRI', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '토', dataType: 'integer', dataIndx: 'SAT', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
        },
        {
            title: '일', dataType: 'integer', dataIndx: 'SUN', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef',
                render: function (ui) {
                const cellData = ui.cellData;
                const hour = Math.trunc(cellData / 60);
                const minute = cellData % 60;

                return cellData >= 60 ? hour + 'h ' + minute + 'm' : minute + 'm';
            }
            }
        }
    ];
    const workingTimeSettingObj = {
        height: 140,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        scrollModel: {autoFit: true},
        trackModel: {on: true},
        selectionModel: {type: 'row', mode: 'single'},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
        colModel: workingTimeSettingColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: workingTimeSettingPostData,
            recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        }
    };

    // Working Day Time 설정

    const FAMILY_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
        'url': '/json-list',
        'data': {'queryId': 'dataSource.getFctList'}
    });

    let $workingDayTimeSettingGrid;
    const workingDayTimeSettingId = 'working_day_time_setting_grid';
    const workingDayTimeSettingPostData = fnFormToJsonArrayData('#working_day_time_setting_form');
    let selectedRowIndex = [];

    const workingDayTimeSettingColModel = [
        {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
        {
            title: '날짜', dataType: 'date', format: 'yy/mm/dd', dataIndx: 'WORKING_DT',
            styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
            editor: {
                type: 'textbox', init: fnDateEditor,
                getData: function (ui) {
                    let val = ui.$cell.find('.pq-cell-editor').val();
                    return fnIsEmpty(val) ? undefined : val;
                }
            }
        },
        {title: '위치', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
            editor: {
                type: 'select', valueIndx: 'value', labelIndx: 'text', options: FAMILY_COMPANY,
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
                    let index = FAMILY_COMPANY.findIndex(function (element) {
                        return element.text === cellData;
                    });

                    if (index < 0) {
                        index = FAMILY_COMPANY.findIndex(function (element) {
                            return element.value === cellData;
                        });
                    }
                    return (index < 0) ? cellData : FAMILY_COMPANY[index].text;
                }
            }
        },
        {
            title: 'WORKING TIME', dataType: 'integer', dataIndx: 'WORKING_TIME', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
            render: function (ui) {
                const cellData = ui.cellData;
                var value = "";
                if(typeof ui.cellData != 'undefined') {
                    const hour = Math.trunc(cellData / 60);
                    const minute = cellData % 60;
                    value = ((cellData >= 60) ? hour + 'h ' + minute + 'm' : minute + 'm');
                }
                return value;
            }
        }
    ];
    const workingDayTimeSettingObj = {
        height: 180,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        scrollModel: {autoFit: true},
        trackModel: {on: true},
        selectionModel: {type: 'row', mode: 'single'},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
        colModel: workingDayTimeSettingColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: workingDayTimeSettingPostData,
            recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        rowSelect: function (event, ui) {
            selectedRowIndex = [];
            if(ui.addList.length > 0 ) {
                selectedRowIndex.push(ui.addList[0].rowIndx);
            }
        }
    };

    $("#add_day_time").on('click',function (e) {
        let data = $workingDayTimeSettingGrid.pqGrid('option', 'dataModel.data');
        $workingDayTimeSettingGrid.pqGrid('addRow', {newRow: {}, rowIndx: data.length});
    })
    $("#delete_day_time").on('click',function (e) {
        //추가 또는 수정된 값이 있으면 true
        if(selectedRowIndex.length > 0 ) {
            let delJson = {'deleteList':[],'addList':[],'updateList':[]}
            for (let i = 0; i < selectedRowIndex.length; i++) {
                let rowData = $workingDayTimeSettingGrid.pqGrid("getRowData", {rowIndx: selectedRowIndex[i]});
                delJson.deleteList.push(rowData);
            }
            const parameters = {'url': '/updateWorkingDayTime', 'data': {data: JSON.stringify(delJson)}}

            fnPostAjax(function () {
                fnAlert(null, '삭제되었습니다.', function () {
                    $workingDayTimeSettingGrid.pqGrid('refreshDataAndView');
                });
            }, parameters, '');
        }
    })
    $("#working_day_time_save").on('click',function (e) {
        const gridInstance = $workingDayTimeSettingGrid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            const changes = gridInstance.getChanges({format: 'byVal'});
            const parameters = {'url': '/updateWorkingDayTime', 'data': {data: JSON.stringify(changes)}}

            fnPostAjax(function () {
                fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                    $workingDayTimeSettingGrid.pqGrid('refreshDataAndView');
                });
            }, parameters, '');
        }

    })

    // 자재 검색 사이즈 범위 설정
    let $materialSizeInquirySettingGrid;
    let selectedMaterialSizeInquirySettingRowIndex = [];
    const materialSizeInquirySettingId = 'material_size_inquiry_setting_grid';
    const materialSizeInquirySettingPostData = fnFormToJsonArrayData('#material_size_inquiry_setting_form');
    const materialSizeInquirySettingColModel = [
        {title: 'ROW_NUM', dataType: 'integer', dataIndx: 'ROW_NUM', hidden: true},
        {title: 'SEARCH_SEQ', dataType: 'integer', dataIndx: 'SEARCH_SEQ', hidden: true},
        {
            title: '형태', dataIndx: 'MATERIAL_KIND',
            styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
            editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029')},
            render: function (ui) {
                let cellData = ui.cellData;

                if (!fnIsEmpty(cellData)) {
                    let materialKind = fnGetCommCodeGridSelectBox('1029');

                    let index = materialKind.findIndex(function (element) {
                        return element.text === cellData;
                    });

                    if (index < 0) {
                        index = materialKind.findIndex(function (element) {
                            return element.value === cellData;
                        });
                    }

                    return (index < 0) ? cellData : materialKind[index].text;
                }
            }
        },
        {title: '구분', dataIndx: 'SEARCH_NM', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
        {title: 'Text', width: 125, dataIndx: 'SEARCH_TEXT'},
        {
            title: 'W', align: 'center', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, colModel: [
                {title: 'Min', dataType: 'float', dataIndx: 'SIZE_W_START', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                {title: 'Max', dataType: 'float', dataIndx: 'SIZE_W_END', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            ]
        },
        {
            title: 'D', align: 'center', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, colModel: [
                {title: 'Min', dataType: 'float', dataIndx: 'SIZE_D_START', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                {title: 'Max', dataType: 'float', dataIndx: 'SIZE_D_END', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            ]
        },
        {
            title: 'L', align: 'center', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, colModel: [
                {title: 'Min', dataType: 'float', dataIndx: 'SIZE_L_START', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                {title: 'Max', dataType: 'float', dataIndx: 'SIZE_L_END', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            ]
        },
        {
            title: 'H', align: 'center', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, colModel: [
                {title: 'Min', dataType: 'float', dataIndx: 'SIZE_H_START', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                {title: 'Max', dataType: 'float', dataIndx: 'SIZE_H_END', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            ]
        },
        {
            title: 'T', align: 'center', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, colModel: [
                {title: 'Min', dataType: 'float', dataIndx: 'SIZE_T_START', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                {title: 'Max', dataType: 'float', dataIndx: 'SIZE_T_END', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            ]
        }
    ];
    const materialSizeInquirySettingObj = {
        height: 365,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        // scrollModel: {autoFit: true},
        trackModel: {on: true},
        // selectionModel: {type: 'row', mode: 'single'},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
        colModel: materialSizeInquirySettingColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: materialSizeInquirySettingPostData,
            recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        },
        selectChange: function (event, ui) {
            selectedMaterialSizeInquirySettingRowIndex = [];

            for (let i = 0, AREAS_LENGTH = ui.selection._areas.length; i < AREAS_LENGTH; i++) {
                let firstRow = ui.selection._areas[i].r1;
                let lastRow = ui.selection._areas[i].r2;
                for (let i = firstRow; i <= lastRow; i++) selectedMaterialSizeInquirySettingRowIndex.push(i);
                if (firstRow === lastRow) {
                    const selRowData = this.getRowData({rowIndx: firstRow});
                }
            }
        },
    };
    // 가동률 레포트 장비 설정
    let $equipmentReportOperateSettingGrid;
    // const selectedMaterialSizeInquirySettingRowIndex = [];
    const equipmentReportOperateSettingId = 'equipment_report_operate_setting_grid';
    const equipmentReportOperateSettingPostData = fnFormToJsonArrayData('#equipment_report_operate_setting_form');
    const equipmentReportOperateSettingColModel = [
        {
            title: '선택',
            // datatype: 'bool',
            dataIndx: 'REPORT_SHOW_YN',
            styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
            editable: true,
            type: 'checkbox',
            cb: {check: 'Y', uncheck: 'N'}
        },
        {title: 'EQUIP_SEQ', dataType: 'integer', dataIndx: 'EQUIP_SEQ', hidden: true},
        {title: 'ITEM ID', dataIndx: 'EQUIP_ID'},
        {title: '장비명', dataIndx: 'EQUIP_NM'},
        {title: '장비종류', dataIndx: 'PROCESS_TYPE_NM'},
        {title: '공정', dataIndx: 'EQUIP_TYPE_NM'},
        {title: '설치위치', dataIndx: 'FACTORY_AREA_NM'},
        {title: '비고', dataIndx: 'NOTE'},
    ];
    const equipmentReportOperateSettingObj = {
        height: 365,
        collapsible: false,
        resizable: false,
        showTitle: false,
        rowHtHead: 15,
        numberCell: {title: 'No.', show: false},
        scrollModel: {autoFit: true},
        trackModel: {on: true},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
        colModel: equipmentReportOperateSettingColModel,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
            postData: equipmentReportOperateSettingPostData,
            recIndx: 'EQUIP_SEQ',
            getData: function (dataJSON) {
                return {data: dataJSON.data};
            }
        }
    };

    const getSearchText = function (rowData) {
        const SIZE_W_START = rowData.SIZE_W_START;
        const SIZE_W_END = rowData.SIZE_W_END;
        const SIZE_D_START = rowData.SIZE_D_START;
        const SIZE_D_END = rowData.SIZE_D_END;
        const SIZE_L_START = rowData.SIZE_L_START;
        const SIZE_L_END = rowData.SIZE_L_END;
        const SIZE_H_START = rowData.SIZE_H_START;
        const SIZE_H_END = rowData.SIZE_H_END;
        const SIZE_T_START = rowData.SIZE_T_START;
        const SIZE_T_END = rowData.SIZE_T_END;
        const W = SIZE_W_START && SIZE_W_END ? 'W : ' + SIZE_W_START + ' ~ ' + SIZE_W_END : '';
        const D = SIZE_D_START && SIZE_D_END ? 'D : ' + SIZE_D_START + ' ~ ' + SIZE_D_END : '';
        const L = SIZE_L_START && SIZE_L_END ? 'L : ' + SIZE_L_START + ' ~ ' + SIZE_L_END : '';
        const H = SIZE_H_START && SIZE_H_END ? 'H : ' + SIZE_H_START + ' ~ ' + SIZE_H_END : '';
        const T = SIZE_T_START && SIZE_T_END ? 'T : ' + SIZE_T_START + ' ~ ' + SIZE_T_END : '';
        const SEARCH_TXT = [W, D, L, H, T].filter(function (value) {
            return !fnIsEmpty(value);
        }).join(', ');

        return SEARCH_TXT;
    };

    $('#sales_target_amount_register_popup').on({
        'show.bs.modal': function () {
            $salesTargetAmountRegisterGrid = $('#' + salesTargetAmountRegisterGridId).pqGrid(salesTargetAmountRegisterObj);
        },
        'hide.bs.modal': function () {
            $salesTargetAmountRegisterGrid.pqGrid('destroy');
        }
    });

    $('[name=sales_target_amount_register_close]').on('click', function () {
        $('#sales_target_amount_register_popup').modal('hide');
    });

    $('#sales_target_amount_register_form').on('change', function () {
        $salesTargetAmountRegisterGrid.pqGrid('option', 'dataModel.postData', function () {
            return fnFormToJsonArrayData('#sales_target_amount_register_form');
        });
        $salesTargetAmountRegisterGrid.pqGrid('refreshDataAndView');
    });

    $('#sales_target_amount_save').on('click', function () {
        const insertQueryList = ['systemMapper.createSalesTargetAmount'];
        const updateQueryList = insertQueryList;

        fnModifyPQGrid($salesTargetAmountRegisterGrid, insertQueryList, updateQueryList);
    });

    $('#working_time_setting_popup').on({
        'show.bs.modal': function () {
            let date = new Date();
            date.setMonth(date.getMonth() + 1);
            let year = date.getFullYear();
            $('#WORKING_DAY_TIME_SEARCH_YEAR').val(year).prop('selected', true);
            $workingTimeSettingGrid = $('#' + workingTimeSettingId).pqGrid(workingTimeSettingObj);
            $workingDayTimeSettingGrid = $('#' + workingDayTimeSettingId).pqGrid(workingDayTimeSettingObj);
        },
        'hide.bs.modal': function () {
            $workingTimeSettingGrid.pqGrid('destroy');
            $workingDayTimeSettingGrid.pqGrid('destroy');
        }
    });

    $('#working_time_save').on('click', function () {
        const gridInstance = $workingTimeSettingGrid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            const changes = gridInstance.getChanges({format: 'byVal'});
            const parameters = {'url': '/updateWorkingTime', 'data': {data: JSON.stringify(changes)}}

            fnPostAjax(function () {
                fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                    $workingTimeSettingGrid.pqGrid('refreshDataAndView');
                });
            }, parameters, '');
        }
    });

    $('[name=working_time_setting_pop_close]').on('click', function () {
        $('#working_time_setting_popup').modal('hide');
    });

    $('#material_size_inquiry_setting_popup').on({
        'show.bs.modal': function () {
            $materialSizeInquirySettingGrid = $('#' + materialSizeInquirySettingId).pqGrid(materialSizeInquirySettingObj);
        },
        'hide.bs.modal': function () {
            $materialSizeInquirySettingGrid.pqGrid('destroy');
        }
    });

    $('#material_size_inquiry_add').on('click', function () {
        $materialSizeInquirySettingGrid.pqGrid('addNodes', [{}], 0);
    });

    $('#material_size_inquiry_delete').on('click', function () {
        fnConfirm(null, '<spring:message code="com.alert.default.removeText"/>', function () {
            const deleteQuery = 'systemMapper.deleteMaterialSizeSearch'

            fnDeletePQGrid($materialSizeInquirySettingGrid, selectedMaterialSizeInquirySettingRowIndex, deleteQuery);
        });
    });

    $('#material_size_inquiry_save').on('click', function () {
        const gridInstance = $materialSizeInquirySettingGrid.pqGrid('getInstance').grid;
        //추가 또는 수정된 값이 있으면 true
        if (gridInstance.isDirty()) {
            const changes = gridInstance.getChanges({format: 'byVal'});

            for (let i = 0, LENGTH = changes.addList.length; i < LENGTH; i++) {
                changes.addList[i].SEARCH_TEXT = getSearchText(changes.addList[i]);
            }
            for (let i = 0, LENGTH = changes.updateList.length; i < LENGTH; i++) {
                changes.updateList[i].SEARCH_TEXT = getSearchText(changes.updateList[i]);
            }

            changes.queryIdList = {
                'insertQueryId': ['systemMapper.insertMaterialSizeSearch'],
                'updateQueryId': ['systemMapper.updateMaterialSizeSearch']
            };
            const parameters = {'url': '/paramQueryModifyGrid', 'data': {data: JSON.stringify(changes)}};
            fnPostAjax(function () {
                fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                    $materialSizeInquirySettingGrid.pqGrid('refreshDataAndView');
                });
            }, parameters, '');
        }
    });

    $('[name=material_size_inquiry_setting_pop_close]').on('click', function () {
        $('#material_size_inquiry_setting_popup').modal('hide');
    });



    $('#equipment_report_operate_setting_popup').on({
        'show.bs.modal': function () {
            $equipmentReportOperateSettingGrid = $('#' + equipmentReportOperateSettingId).pqGrid(equipmentReportOperateSettingObj);
        },
        'hide.bs.modal': function () {
            $equipmentReportOperateSettingGrid.pqGrid('destroy');
        }
    });

    $('#equipment_report_operate_setting_search').on('click', function () {
        $equipmentReportOperateSettingGrid.pqGrid('option', 'dataModel.postData', function (ui) {
            return fnFormToJsonArrayData('#equipment_report_operate_setting_form');
        });
        $equipmentReportOperateSettingGrid.pqGrid("refreshDataAndView");
    });

    $('#equipment_report_operate_setting_save').on('click', function () {
        const updateQueryList = ['systemMapper.updateReportEquipShowYn'];

        fnModifyPQGrid($equipmentReportOperateSettingGrid, [], updateQueryList);
    });

    $('[name=equipment_report_operate_setting_pop_close]').on('click', function () {
        $('#equipment_report_operate_setting_popup').modal('hide');
    });
    $("#WORKING_DAY_TIME_SEARCH_YEAR").on('change',function (e) {
        $workingDayTimeSettingGrid.pqGrid('option', 'dataModel.postData', function (ui) {
            return fnFormToJsonArrayData('#working_day_time_setting_form');
        });
        $workingDayTimeSettingGrid.pqGrid("refreshDataAndView");
    })

</script>