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

</script>