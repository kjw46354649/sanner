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
<jsp:include page="/WEB-INF/views/attr/tabs/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/attr/tabs/body-script.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>신규 주문 등록</title>
</head>
<body>
    <div style="padding: 10px;">
        <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">신규 주문 등록</h3>
        <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
        <div id="ORDER_REGISTER_GRID"></div>
        <div style="text-align: center; margin: 12px 0;">
            <button type="button" class="defaultBtn grayPopGra" id="CONTROL_MANGE_CLOSE_BUTTON">닫기</button>
        </div>
    </div>
<script>
    $(function () {
        'use strict';
        const BUSINESS_COMPANY = fnCommCodeDatasourceGridSelectBoxCreate({
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

            fnPostAjax(function (data, callFunctionParam) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];

                    list.push({value: obj.CODE_CD, text: obj.CODE_NM, compCd: obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();
        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupColModel = [
            {
                title: '단가확인', width: 70, dataType: 'string', dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1017')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let priceConfirm = fnGetCommCodeGridSelectBox('1017');
                        let index = priceConfirm.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = priceConfirm.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }
                        return (index < 0) ? cellData : priceConfirm[index].text;
                    }
                }
            },
            {
                title: '사업자<br>구분', width: 100, dataType: 'string', dataIndx: 'COMP_CD',  styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: BUSINESS_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = BUSINESS_COMPANY.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = BUSINESS_COMPANY.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : BUSINESS_COMPANY[index].text;
                    }
                }
            },
            {
                title: '발주업체', width: 100, dataType: 'string', dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
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
            {
                title: '구매<br>담당자', width: 70, dataType: 'string', dataIndx: 'ORDER_STAFF_SEQ', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        let companyStaffList = COMPANY_STAFF.filter(function (value, index, array) {
                            return value.compCd == ui.rowData.ORDER_COMP_CD;
                        });
                        return companyStaffList;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let index = COMPANY_STAFF.findIndex(function (element) {
                            return element.text == cellData;
                        });

                        if (index < 0) {
                            index = COMPANY_STAFF.findIndex(function (element) {
                                return element.value == cellData;
                            });
                        }

                        return (index < 0) ? cellData : COMPANY_STAFF[index].text;
                    }
                }
            },
            {title: '설계자', width: 70, dataType: 'string', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '비고', width: 200, dataType: 'string', dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '프로젝트', width: 200, dataType: 'string', dataIndx: 'PROJECT_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '모듈', width: 100, dataType: 'string', dataIndx: 'MODULE_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '납품처', width: 100, dataType: 'string', dataIndx: 'DELIVERY_COMP_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '비고(라벨)', width: 100, dataType: 'string', dataIndx: 'LABEL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '주요 검사품', width: 70, dataType: 'string', dataIndx: 'MAIN_INSPECTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1059')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let mainInspection = fnGetCommCodeGridSelectBox('1059');
                        let index = mainInspection.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = mainInspection.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : mainInspection[index].text;
                    }
                }
            },
            {
                title: '긴<br>급', dataType: 'string', dataIndx: 'EMERGENCY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '관리번호', width: 200, dataType: 'string', dataIndx: 'CONTROL_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '파<br>트', dataType: 'string', dataIndx: 'PART_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '도면번호', width: 200, dataType: 'string', dataIndx: 'DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '품명',  width: 200, dataType: 'string', dataIndx: 'ITEM_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '작업<br>형태', width: 70, dataType: 'string', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workType = fnGetCommCodeGridSelectBox('1033');
                        let index = workType.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workType.findIndex(function (element) {
                                return element.value === cellData;
                            });

                        }
                        return (index < 0) ? cellData : workType[index].text;
                    }
                }
            },
            {
                title: '외<br>주', dataType: 'string', dataIndx: 'OUTSIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let yesOrNo = fnGetCommCodeGridSelectBox('1042');
                        let index = yesOrNo.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = yesOrNo.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : yesOrNo[index].text;
                    }
                }
            },
            {
                title: '수행<br>공장', dataType: 'string', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1014')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let workFactory = fnGetCommCodeGridSelectBox('1014');
                        let index = workFactory.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = workFactory.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : workFactory[index].text;
                    }
                }
            },
            {
                title: '소재<br>사급', dataType: 'string', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {title: '가공납기', width: 70, dataType: 'string', dataIndx: 'INNER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
            {title: '규격', width: 100, dataType: 'string', dataIndx: 'SIZE_TXT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '소재<br>종류', width: 70, dataType: 'string', dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let materialDetail = fnGetCommCodeGridSelectBox('1027');
                        let index = materialDetail.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialDetail.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialDetail[index].text;
                    }
                }
            },
            {
                title: '소재<br>형태', width: 100, dataType: 'string', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1029')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
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
            {
                title: '표면<br>처리', width: 100, dataType: 'string', dataIndx: 'SURFACE_TREAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1039')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '') {
                        return '';
                    } else {
                        let surfaceTreat = fnGetCommCodeGridSelectBox('1039');
                        let index = surfaceTreat.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = surfaceTreat.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : surfaceTreat[index].text;
                    }
                }
            },
            {title: '소재비고', width: 200, dataType: 'string', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: 'Part<br>단위<br>수량', dataType: 'string', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '대칭', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}, colModel: [
                    {title: '원칭', datatype: 'string', dataIndx: 'ORIGINAL_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '대칭', datatype: 'string', dataIndx: 'OTHER_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
                ]
            },
            {
                title: '발주정보', align: 'center', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}, colModel: [
                    {title: '발주번호', width: 200, datatype: 'string', dataIndx: 'ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '수량', datatype: 'string', dataIndx: 'ORDER_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '납기', width: 70, datatype: 'string', dataIndx: 'ORDER_DUE_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}},
                    {title: '납품확인', width: 70, datatype: 'string', dataIndx: 'DELIVERY_DT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'}}
                ]
            },
            {title: '최종<br>견적단가', width: 100, dataType: 'string', dataIndx: 'UNIT_FINAL_EST_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '최종<br>공급단가', width: 100, dataType: 'string', dataIndx: 'UNIT_FINAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '변경전<br>도면번호', width: 150, dataType: 'string', dataIndx: 'PREV_DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}}
        ];
        const popupToolbar = {
            cls: 'pq-toolbar-crud',
            items: [
                {
                    type: 'button', label: 'Reset', icon: 'ui-icon-arrowrefresh-1-s', listener: {
                        'click': function () {
                            $orderRegisterGrid.pqGrid('refreshDataAndView');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save & 확정', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function () {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/createNewOrderConfirm',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $('#CONTROL_MANGE_POPUP').modal('hide');
                                // $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                },
                {
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function () {
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');
                            let parameters = {
                                'url': '/createNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            fnPostAjax(function () {
                                alert("<spring:message code='com.alert.default.save.success' />");
                                $('#CONTROL_MANGE_POPUP').modal('hide');
                                // $orderRegisterGrid.pqGrid('refreshDataAndView');
                                $orderManagementGrid.pqGrid('refreshDataAndView');
                            }, parameters, '');
                        }
                    }
                }
            ]
        };
        const popupObj = {
            height: 650,
            collapsible: false,
            resizable: false,
            showTitle: false,
            numberCell: {title: 'No.'},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center'},
            colModel: popupColModel,
            copyModel: {render: true},
            toolbar: popupToolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 20},
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            editModel: {clicksToEdit: 1},
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    const addListLength = ui.addList.length;
                    const priceConfirmList = fnGetCommCodeGridSelectBox('1017');
                    const mainInspectionList = fnGetCommCodeGridSelectBox('1059');
                    const workTypeList = fnGetCommCodeGridSelectBox('1033');
                    const workFactoryList = fnGetCommCodeGridSelectBox('1014');
                    const materialDetailList = fnGetCommCodeGridSelectBox('1027');
                    const materialKindList = fnGetCommCodeGridSelectBox('1029');
                    const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
                    let rowListConvert = [];

                    for (let i = 0; i < addListLength; i++) {
                        const newRowData = ui.addList[i].newRow;
                        const rowIndx = ui.addList[i].rowIndx;
                        let priceConfirm = null;
                        let compCd = null;
                        let orderCompCd = null;
                        let orderStaffSeq = null;
                        let mainInspection = null;
                        let workType = null;
                        let workFactory = null;
                        let materialDetail = null;
                        let materialKind = null;
                        let surfaceTreat = null;

                        // 단가확인
                        if (newRowData.PRICE_CONFIRM !== undefined) {
                            let index = priceConfirmList.findIndex(function (element) {
                                return element.text === newRowData.PRICE_CONFIRM;
                            });
                            if (index >= 0) priceConfirm = priceConfirmList[index].value;
                        }
                        // 사업자
                        if (newRowData.COMP_CD !== undefined) {
                            let index = BUSINESS_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index >= 0) compCd = BUSINESS_COMPANY[index].value;
                        }
                        // 발주업체
                        if (newRowData.ORDER_COMP_CD !== undefined) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index >= 0) orderCompCd = ORDER_COMPANY[index].value;
                        }
                        // 구매 담당자
                        if (newRowData.ORDER_STAFF_SEQ !== undefined) {
                            let index = COMPANY_STAFF.findIndex(function (element) {
                                return element.text === newRowData.ORDER_STAFF_SEQ;
                            });

                            if (index >= 0) orderStaffSeq = COMPANY_STAFF[index].value;
                        }
                        // 주요검사품
                        if (newRowData.MAIN_INSPECTION !== undefined) {
                            let index = mainInspectionList.findIndex(function (element) {
                                return element.text === newRowData.MAIN_INSPECTION;
                            });

                            if (index >= 0) mainInspection = mainInspectionList[index].value;
                        }
                        // 작업형태
                        if (newRowData.WORK_TYPE !== undefined) {
                            let index = workTypeList.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index >= 0) workType = workTypeList[index].value;
                        }
                        // 수행공장
                        if (newRowData.WORK_FACTORY !== undefined) {
                            let index = workFactoryList.findIndex(function (element) {
                                return element.text === newRowData.WORK_FACTORY;
                            });

                            if (index >= 0) workFactory = workFactoryList[index].value;
                        }
                        //소재 상세
                        if (newRowData.MATERIAL_DETAIL !== undefined) {
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index >= 0) materialDetail = materialDetailList[index].value;
                        }
                        // 소재형태
                        if (newRowData.MATERIAL_KIND !== undefined) {
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index >= 0) materialKind = materialKindList[index].value;
                        }
                        // 표면처리
                        if (newRowData.SURFACE_TREAT !== undefined) {
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index >= 0) surfaceTreat = surfaceTreatList[index].value;
                        }

                        let tempObject = {
                            rowIndx: rowIndx,
                            newRow: {
                                'PRICE_CONFIRM': priceConfirm,
                                'COMP_CD': compCd,
                                'ORDER_COMP_CD': orderCompCd,
                                'ORDER_STAFF_SEQ': orderStaffSeq,
                                'MAIN_INSPECTION': mainInspection,
                                'WORK_TYPE': workType,
                                'WORK_FACTORY': workFactory,
                                'MATERIAL_DETAIL': materialDetail,
                                'MATERIAL_KIND': materialKind,
                                'SURFACE_TREAT': surfaceTreat
                            }
                        };
                        rowListConvert.push(tempObject);
                    }
                    $orderRegisterGrid.pqGrid('updateRow', {rowList: rowListConvert});
                }
            }
        };

        $orderRegisterGrid = $('#' + popupGridId).pqGrid(popupObj);


        // Returns a function, that, as long as it continues to be invoked, will not
        // be triggered. The function will be called after it stops being called for
        // N milliseconds. If `immediate` is passed, trigger the function on the
        // leading edge, instead of the trailing.
        const debounce = function (func, wait, immediate) {
            let timeout, result;

            let later = function(context, args) {
                timeout = null;
                if (args) result = func.apply(context, args);
            };

            let debounced = restArguments(function(args) {
                if (timeout) clearTimeout(timeout);
                if (immediate) {
                    let callNow = !timeout;
                    timeout = setTimeout(later, wait);
                    if (callNow) result = func.apply(this, args);
                } else {
                    timeout = delay(later, wait, this, args);
                }

                return result;
            });

            debounced.cancel = function() {
                clearTimeout(timeout);
                timeout = null;
            };

            return debounced;
        };

        // Some functions take a letiable number of arguments, or a few expected
        // arguments at the beginning and then a letiable number of values to operate
        // on. This helper accumulates all remaining arguments past the function’s
        // argument length (or an explicit `startIndex`), into an array that becomes
        // the last argument. Similar to ES6’s "rest parameter".
        const restArguments = function (func, startIndex) {
            startIndex = startIndex == null ? func.length - 1 : +startIndex;
            return function() {
                let length = Math.max(arguments.length - startIndex, 0),
                    rest = Array(length),
                    index = 0;
                for (; index < length; index++) {
                    rest[index] = arguments[index + startIndex];
                }
                switch (startIndex) {
                    case 0: return func.call(this, rest);
                    case 1: return func.call(this, arguments[0], rest);
                    case 2: return func.call(this, arguments[0], arguments[1], rest);
                }
                let args = Array(startIndex + 1);
                for (index = 0; index < startIndex; index++) {
                    args[index] = arguments[index];
                }
                args[startIndex] = rest;
                return func.apply(this, args);
            };
        };

        // Delays a function for the given number of milliseconds, and then calls
        // it with the arguments supplied.
        const delay = restArguments(function(func, wait, args) {
            return setTimeout(function() {
                return func.apply(null, args);
            }, wait);
        });
        /* function */

        /* event */
        // TODO: 창크기가 변경 되면 그리드 높이를 조절한다.
        $(window).on('resize', debounce(function() {
            const padding = 20;
            const h3 = 28;
            const hr = 16;
            const button = 54;
            const fixSize = padding + h3 + hr + button;
            let size = window.innerHeight - fixSize;
            $orderRegisterGrid.pqGrid('option', 'height', size);
        }, 500));

        $('#CONTROL_MANGE_CLOSE_BUTTON').on('click', function () {
            const parentWindow = window.opener;
            let parentGridSearchButton = $(parentWindow.document).find('#CONTROL_MANAGE_SEARCH');
            parentGridSearchButton.click();
            window.close();
        });
        /* event */
    });
</script>
</body>
</html>
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"></jsp:include>
