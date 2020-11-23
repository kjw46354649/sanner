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
    <title>신규 주문 등록</title>
</head>
<body>
<div id="waitMeContainerDiv">
    <div style="padding: 10px;">
        <h3 style="font-size: 20px; font-family: 'NotoKrB'; color: #000; display: inline-block;">신규 주문 등록</h3>
        <hr style="display: block; border: 1px solid #e0e2e6; margin: 7px;">
        <div id="ORDER_REGISTER_GRID"></div>
        <div style="text-align: center; margin: 12px 0;">
            <button type="button" class="defaultBtn grayPopGra" id="CONTROL_MANGE_CLOSE_BUTTON">닫기</button>
        </div>
    </div>
</div>
<script>
    $(function () {
        'use strict';
        const priceConfirmList = fnGetCommCodeGridSelectBox('1017');
        const mainInspectionList = fnGetCommCodeGridSelectBox('1059');
        const workTypeList = fnGetCommCodeGridSelectBox('1033');
        const workFactoryList = fnGetCommCodeGridSelectBox('1014');
        const materialDetailList = fnGetCommCodeGridSelectBox('1027');
        const materialKindList = fnGetCommCodeGridSelectBox('1029');
        const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
        const materialFinishHeatList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
        const materialFinishTmList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010');
        const materialFinishGrindList = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
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
            fnPostAjaxAsync(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    list.push({'value': obj.CODE_CD, 'text': obj.CODE_NM, 'compCd': obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();

        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupColModel = [
            {
                title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1017')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '사업자<br>구분', width: 75, dataIndx: 'COMP_CD',  styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: BUSINESS_COMPANY},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: ORDER_COMPANY},
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
            {title: '비고', align: 'left', width: 100, dataIndx: 'NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '주요<br>검사', width: 50, dataIndx: 'MAIN_INSPECTION', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1059')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '긴<br>급', minWidth: 30, dataIndx: 'EMERGENCY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {title: '총<br>장', minWidth: 30, dataType: 'integer', dataIndx: 'TOTAL_SHEET', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {
                title: '관리번호', align: 'left', width: 180, dataIndx: 'CONTROL_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'red'},
                style: {'font-weight': 'bold', 'color': 'black'},
            },
            {title: '파<br>트', minWidth: 30, dataIndx: 'PART_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1033')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '가공<br>납기', width: 70, dataIndx: 'INNER_DUE_DT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'textbox', init: dateEditor}
            },
            {title: 'Part<br>Unit', dataType: 'integer', format: '#,###', dataIndx: 'PART_UNIT_QTY', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {
                title: '외<br>주', minWidth: 30, dataIndx: 'OUTSIDE_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {
                title: '수행<br>공장', dataIndx: 'WORK_FACTORY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1014')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {
                title: '발주정보', align: 'center',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                colModel: [
                    {title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {
                        title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}
                    },
                    {title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                    {title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                    {title: '원', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '대', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {
                        title: '발주납기', width: 70, dataIndx: 'ORDER_DUE_DT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {type: 'textbox', init: dateEditor}
                    },
                    {
                        title: '납품확인', width: 70, datatype: 'date', dataIndx: 'DELIVERY_DT',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {type: 'textbox', init: dateEditor}
                    },
                    {title: '견적단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '공급단가', align: 'right', width: 90, dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '모듈', align: 'left', width: 100, dataIndx: 'MODULE_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '납품처', align: 'left', width: 100, dataIndx: 'DELIVERY_COMP_NM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
                    {
                        title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {
                            type: 'select', valueIndx: 'value', labelIndx: 'text',
                            options: function (ui) {
                                return COMPANY_STAFF.filter(function (value) {
                                    return value.compCd === ui.rowData.ORDER_COMP_CD;
                                });
                            }
                        },
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let index = COMPANY_STAFF.findIndex(function (element) {
                                    return element.text === cellData;
                                });

                                if (index < 0) {
                                    index = COMPANY_STAFF.findIndex(function (element) {
                                        return element.value === Number(cellData);
                                    });
                                }

                                return (index < 0) ? cellData : COMPANY_STAFF[index].text;
                            }
                        }
                    },
                    {title: '설계자', dataIndx: 'DESIGNER_NM', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
                ]
            },
            {title: '규격', width: 110, dataIndx: 'SIZE_TXT',styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}},
            {
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1027')
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '소재<br>형태', dataIndx: 'MATERIAL_KIND', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1029')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBox('1039')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
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
            {
                title: '열처리', width: 70, dataIndx: 'MATERIAL_FINISH_HEAT', styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030')},
                render: function (ui) {
                    let cellData = ui.cellData;

                    if (cellData === '' || cellData === undefined) {
                        return '';
                    } else {
                        let materialFinishHeat = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN030');
                        let index = materialFinishHeat.findIndex(function (element) {
                            return element.text === cellData;
                        });

                        if (index < 0) {
                            index = materialFinishHeat.findIndex(function (element) {
                                return element.value === cellData;
                            });
                        }

                        return (index < 0) ? cellData : materialFinishHeat[index].text;
                    }
                }
            },
            {title: '소재비고', dataIndx: 'MATERIAL_NOTE', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {title: '변경전 도면번호', align: 'left', width: 150, dataIndx: 'PREV_DRAWING_NUM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'}},
            {
                title: '소재마감', align: 'center',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                colModel: [
                    {
                        title: 'TM각비', width: 70, dataIndx: 'MATERIAL_FINISH_TM',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010')},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let materialFinishTm = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN010');
                                let index = materialFinishTm.findIndex(function (element) {
                                    return element.text === cellData;
                                });

                                if (index < 0) {
                                    index = materialFinishTm.findIndex(function (element) {
                                        return element.value === cellData;
                                    });
                                }

                                return (index < 0) ? cellData : materialFinishTm[index].text;
                            }
                        }
                    },
                    {
                        title: '연마', width: 70, dataIndx: 'MATERIAL_FINISH_GRIND',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                        editor: {type: 'select', valueIndx: 'value', labelIndx: 'text', options: fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020')},
                        render: function (ui) {
                            let cellData = ui.cellData;

                            if (cellData === '' || cellData === undefined) {
                                return '';
                            } else {
                                let materialFinishGrind = fnGetCommCodeGridSelectBoxEtc('1058', 'MFN020');
                                let index = materialFinishGrind.findIndex(function (element) {
                                    return element.text === cellData;
                                });

                                if (index < 0) {
                                    index = materialFinishGrind.findIndex(function (element) {
                                        return element.value === cellData;
                                    });
                                }

                                return (index < 0) ? cellData : materialFinishGrind[index].text;
                            }
                        }
                    },

                ]
            },
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
                    type: 'button', label: 'Save', icon: 'ui-icon-disk', style: 'float: right;', listener: {
                        'click': function () {
                            prevErrorList = errorList;
                            errorList = [];
                            let data = $orderRegisterGrid.pqGrid('option', 'dataModel.data');

                            validationCheck(data);
                            changeCellColor(errorList, prevErrorList);
                            if (errorList.length) {
                                fnAlert(null, errorList.length + '건의 데이터가 올바르지 않습니다.');
                                return false;
                            }

                            let parameters = {
                                'url': '/createNewOrder',
                                'data': {data: JSON.stringify(data)}
                            };

                            $(this).startWaitMe();
                            fnPostAjax(function (data) {
                                $(this).stopWaitMe();
                                if (fnIsEmpty(data.list)) {
                                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                                        window.close();
                                        opener.$orderManagementGrid.pqGrid('refreshDataAndView');
                                    });
                                } else {
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
            // trackModel: {on: true},
            numberCell: {title: 'No.'},
            dragColumns: {enabled: false},
            columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center'},
            colModel: popupColModel,
            copyModel: {render: true},
            toolbar: popupToolbar,
            strNoRows: g_noData,
            dataModel: {
                location: 'remote', dataType: 'json', method: 'POST', url: '/paramQueryGridSelect',
                postData: {queryId: 'dataSource.getRownumEmptyData', 'COUNT': 20}, recIndx: 'ROWNUM',
                getData: function (dataJSON) {
                    return {data: dataJSON.data};
                }
            },
            editModel: {clicksToEdit: 1},
            /*cellSave: function (evt, ui) {
                if (ui.oldVal === undefined && ui.newVal === null) {
                    $orderRegisterGrid.pqGrid('updateRow', {rowIndx: ui.rowIndx, row: {[ui.dataIndx]: ui.oldVal}});
                }
            },*/
            change: function (evt, ui) {
                if (ui.source === 'paste') {
                    let rowListConvert = [];

                    for (let i = 0, addListLength = ui.addList.length; i < addListLength; i++) {
                        const newRowData = ui.addList[i].newRow;
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
                        let materialFinishHeat = null;
                        let materialFinishTm = null;
                        let materialFinishGrind = null;

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
                        // 열처리
                        if (newRowData.MATERIAL_FINISH_HEAT !== undefined) {
                            let index = materialFinishHeatList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_HEAT;
                            });

                            if (index >= 0) materialFinishHeat = materialFinishHeatList[index].value;
                        }
                        // TM각비
                        if (newRowData.MATERIAL_FINISH_TM !== undefined) {
                            let index = materialFinishTmList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_TM;
                            });

                            if (index >= 0) materialFinishTm = materialFinishTmList[index].value;
                        }
                        // 연마
                        if (newRowData.MATERIAL_FINISH_GRIND !== undefined) {
                            let index = materialFinishGrindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_GRIND;
                            });

                            if (index >= 0) materialFinishGrind = materialFinishGrindList[index].value;
                        }

                        ui.addList[i].newRow.PRICE_CONFIRM = priceConfirm;
                        ui.addList[i].newRow.COMP_CD = compCd;
                        ui.addList[i].newRow.ORDER_COMP_CD = orderCompCd;
                        ui.addList[i].newRow.ORDER_STAFF_SEQ = orderStaffSeq;
                        ui.addList[i].newRow.MAIN_INSPECTION = mainInspection;
                        ui.addList[i].newRow.WORK_TYPE = workType;
                        ui.addList[i].newRow.WORK_FACTORY = workFactory;
                        ui.addList[i].newRow.MATERIAL_DETAIL = materialDetail;
                        ui.addList[i].newRow.MATERIAL_KIND = materialKind;
                        ui.addList[i].newRow.SURFACE_TREAT = surfaceTreat;
                        ui.addList[i].newRow.MATERIAL_FINISH_HEAT = materialFinishHeat;
                        ui.addList[i].newRow.MATERIAL_FINISH_TM = materialFinishTm;
                        ui.addList[i].newRow.MATERIAL_FINISH_GRIND = materialFinishGrind;
                    }

                    for (let i = 0, updateLength = ui.updateList.length; i < updateLength; i++) {
                        const newRowData = ui.updateList[i].newRow;
                        const rowIndx = ui.updateList[i].rowIndx;
                        let tempNewRow = {};
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
                        let materialFinishHeat = null;
                        let materialFinishTm = null;
                        let materialFinishGrind = null;

                        // 단가확인
                        if (newRowData.PRICE_CONFIRM !== undefined) {
                            let index = priceConfirmList.findIndex(function (element) {
                                return element.text === newRowData.PRICE_CONFIRM;
                            });
                            if (index >= 0) {
                                priceConfirm = priceConfirmList[index].value;
                                tempNewRow.PRICE_CONFIRM = priceConfirm;
                            }
                        }
                        // 사업자
                        if (newRowData.COMP_CD !== undefined) {
                            let index = BUSINESS_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index >= 0) {
                                compCd = BUSINESS_COMPANY[index].value;
                                tempNewRow.COMP_CD = compCd;
                            }
                        }
                        // 발주업체
                        if (newRowData.ORDER_COMP_CD !== undefined) {
                            let index = ORDER_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.ORDER_COMP_CD;
                            });

                            if (index >= 0) {
                                orderCompCd = ORDER_COMPANY[index].value;
                                tempNewRow.ORDER_COMP_CD = orderCompCd;
                            }
                        }
                        // 구매 담당자
                        if (newRowData.ORDER_STAFF_SEQ !== undefined) {
                            let index = COMPANY_STAFF.findIndex(function (element) {
                                return element.text === newRowData.ORDER_STAFF_SEQ;
                            });

                            if (index >= 0) {
                                orderStaffSeq = COMPANY_STAFF[index].value;
                                tempNewRow.ORDER_STAFF_SEQ = orderStaffSeq;
                            }
                        }
                        // 주요검사품
                        if (newRowData.MAIN_INSPECTION !== undefined) {
                            let index = mainInspectionList.findIndex(function (element) {
                                return element.text === newRowData.MAIN_INSPECTION;
                            });

                            if (index >= 0) {
                                mainInspection = mainInspectionList[index].value;
                                tempNewRow.MAIN_INSPECTION = mainInspection;
                            }
                        }
                        // 작업형태
                        if (newRowData.WORK_TYPE !== undefined) {
                            let index = workTypeList.findIndex(function (element) {
                                return element.text === newRowData.WORK_TYPE;
                            });

                            if (index >= 0) {
                                workType = workTypeList[index].value;
                                tempNewRow.WORK_TYPE = workType;
                            }
                        }
                        // 수행공장
                        if (newRowData.WORK_FACTORY !== undefined) {
                            let index = workFactoryList.findIndex(function (element) {
                                return element.text === newRowData.WORK_FACTORY;
                            });

                            if (index >= 0) {
                                workFactory = workFactoryList[index].value;
                                tempNewRow.WORK_FACTORY = workFactory;
                            }
                        }
                        //소재 상세
                        if (newRowData.MATERIAL_DETAIL !== undefined) {
                            let index = materialDetailList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_DETAIL;
                            });

                            if (index >= 0) {
                                materialDetail = materialDetailList[index].value;
                                tempNewRow.MATERIAL_DETAIL = materialDetail;
                            }
                        }
                        // 소재형태
                        if (newRowData.MATERIAL_KIND !== undefined) {
                            let index = materialKindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_KIND;
                            });

                            if (index >= 0) {
                                materialKind = materialKindList[index].value;
                                tempNewRow.MATERIAL_KIND = materialKind;
                            }
                        }
                        // 표면처리
                        if (newRowData.SURFACE_TREAT !== undefined) {
                            let index = surfaceTreatList.findIndex(function (element) {
                                return element.text === newRowData.SURFACE_TREAT;
                            });

                            if (index >= 0) {
                                surfaceTreat = surfaceTreatList[index].value;
                                tempNewRow.SURFACE_TREAT = surfaceTreat;
                            }
                        }
                        // 열처리
                        if (newRowData.MATERIAL_FINISH_HEAT !== undefined) {
                            let index = materialFinishHeatList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_HEAT;
                            });

                            if (index >= 0) {
                                materialFinishHeat = materialFinishHeatList[index].value;
                                tempNewRow.MATERIAL_FINISH_HEAT = materialFinishHeat;
                            }
                        }
                        // TM각비
                        if (newRowData.MATERIAL_FINISH_TM !== undefined) {
                            let index = materialFinishTmList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_TM;
                            });

                            if (index >= 0) {
                                materialFinishTm = materialFinishTmList[index].value;
                                tempNewRow.MATERIAL_FINISH_TM = materialFinishTm;
                            }
                        }
                        // 연마
                        if (newRowData.MATERIAL_FINISH_GRIND !== undefined) {
                            let index = materialFinishGrindList.findIndex(function (element) {
                                return element.text === newRowData.MATERIAL_FINISH_GRIND;
                            });

                            if (index >= 0) {
                                materialFinishGrind = materialFinishGrindList[index].value;
                                tempNewRow.MATERIAL_FINISH_GRIND = materialFinishGrind;
                            }
                        }

                        let tempObject = {
                            rowIndx: rowIndx,
                            newRow: tempNewRow
                        };
                        rowListConvert.push(tempObject);
                    }

                    $orderRegisterGrid.pqGrid('updateRow', {rowList: rowListConvert});
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
                        if (dt == 'integer' || dt == 'float') {
                            row[j] = row[j].replace(/[^(\d|\.)]/g, '');
                        }
                    }
                }
            }
        };

        $orderRegisterGrid = $('#' + popupGridId).pqGrid(popupObj);

        const validationCheck = function (dataList) {
            sameControlNumCheck(dataList);

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                let rowData = dataList[i];

                if (Object.keys(rowData).length > 10) {
                    requiredCheck(rowData);
                    badCodeCheck(rowData);
                    inputErrorCheck(rowData);
                }
            }
        };

        // 같은 관리번호 체크
        const sameControlNumCheck = function (dataList) {
            let array = [];
            let duplicateArray = [];

            for (let i = 0; i < dataList.length; i++) {
                let controlNum = dataList[i].CONTROL_NUM || '';
                let partNum = dataList[i].PART_NUM || '';
                let workType = dataList[i].WORK_TYPE || '';
                let orderNum = dataList[i].ORDER_NUM || '';
                let concatString = controlNum + partNum + workType + orderNum;
                array[i] = concatString;
            }

            let obj = fnCountInstance(array);

            for (let property in obj) {
                if (!fnIsEmpty(property)) {
                    if (obj[property] > 1) {
                        duplicateArray.push(property);
                    }
                }
            }

            for (let i = 0; i < dataList.length; i++) {
                for (let j = 0; j < duplicateArray.length; j++) {
                    let controlNum = dataList[i].CONTROL_NUM || '';
                    let partNum = dataList[i].PART_NUM || '';
                    let workType = dataList[i].WORK_TYPE || '';
                    let orderNum = dataList[i].ORDER_NUM || '';
                    let concatString = controlNum + partNum + workType + orderNum;

                    if (duplicateArray[j] === concatString) {
                        addErrorList(dataList[i].pq_ri, 'CONTROL_NUM');
                    }
                }
            }
        };

        // required 체크
        const requiredCheck = function (rowData) {
            let list;
            const commonRequiredList = ['COMP_CD', 'ORDER_COMP_CD', 'CONTROL_NUM', 'DRAWING_NUM', 'ITEM_NM', 'INNER_DUE_DT', 'SIZE_TXT'];
            const singleList = ['MATERIAL_KIND', 'SURFACE_TREAT', 'ORDER_QTY']; // 단품
            const assemblyList = ['ORDER_QTY']; // 조립
            const modifiedList = ['MATERIAL_KIND', 'SURFACE_TREAT', 'ORDER_QTY']; // 수정
            const stockList = ['MATERIAL_KIND', 'ORDER_QTY']; // 재고
            const partList = ['MATERIAL_KIND', 'SURFACE_TREAT', 'PART_UNIT_QTY']; // 파트

            switch (rowData.WORK_TYPE) {
                case 'WTP010':
                    // list = $.extend(true, commonRequiredList, singleList);
                    list = commonRequiredList.concat(singleList);
                    break;
                case 'WTP020':
                    list = commonRequiredList.concat(assemblyList);
                    break;
                case 'WTP030':
                    list = commonRequiredList.concat(modifiedList);
                    break;
                case 'WTP040':
                    list = commonRequiredList.concat(stockList);
                    break;
                case 'WTP050':
                    list = commonRequiredList.concat(partList);
                    break;
                default:
                    list = commonRequiredList.concat(['WORK_TYPE']);
            }

            for (let i in list) {
                if (rowData[list[i]] === undefined || rowData[list[i]] == null || rowData[list[i]] === '' || (rowData[list[i]] != null && typeof rowData[list[i]] == 'object' && !Object.keys(rowData[list[i]]).length)) {
                    addErrorList(rowData.pq_ri, list[i]);
                }
            }
        };

        // 잘못된 데이터(코드) 체크
        const badCodeCheck = function (rowData) {
            let rowIndex = rowData.pq_ri;

            // 단가확인
            if (rowData.PRICE_CONFIRM !== undefined && rowData.PRICE_CONFIRM !== null && rowData.PRICE_CONFIRM !== '') {
                let index = priceConfirmList.findIndex(function (element) {
                    return element.value === rowData.PRICE_CONFIRM;
                });
                if (index < 0) addErrorList(rowIndex, 'PRICE_CONFIRM');
            }
            // 사업자
            if (rowData.COMP_CD !== undefined && rowData.COMP_CD !== null && rowData.COMP_CD !== '') {
                let index = BUSINESS_COMPANY.findIndex(function (element) {
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
            // 구매 담당자
            if (rowData.ORDER_STAFF_SEQ !== undefined && rowData.ORDER_STAFF_SEQ !== null && rowData.ORDER_STAFF_SEQ !== '') {
                let index = COMPANY_STAFF.findIndex(function (element) {
                    return element.value === Number(rowData.ORDER_STAFF_SEQ);
                });

                if (index < 0) addErrorList(rowIndex, 'ORDER_STAFF_SEQ');
            }
            // 주요검사품
            if (rowData.MAIN_INSPECTION !== undefined && rowData.MAIN_INSPECTION !== null && rowData.MAIN_INSPECTION !== '') {
                let index = mainInspectionList.findIndex(function (element) {
                    return element.value === rowData.MAIN_INSPECTION;
                });

                if (index < 0) addErrorList(rowIndex, 'MAIN_INSPECTION');
            }
            // 작업형태
            if (rowData.WORK_TYPE !== undefined && rowData.WORK_TYPE !== null && rowData.WORK_TYPE !== '') {
                let index = workTypeList.findIndex(function (element) {
                    return element.value === rowData.WORK_TYPE;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_TYPE');
            }
            // 수행공장
            if (rowData.WORK_FACTORY !== undefined && rowData.WORK_FACTORY !== null && rowData.WORK_FACTORY !== '') {
                let index = workFactoryList.findIndex(function (element) {
                    return element.value === rowData.WORK_FACTORY;
                });

                if (index < 0) addErrorList(rowIndex, 'WORK_FACTORY');
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
            // 열처리
            if (rowData.MATERIAL_FINISH_HEAT !== undefined && rowData.MATERIAL_FINISH_HEAT !== null && rowData.MATERIAL_FINISH_HEAT !== '') {
                let index = materialFinishHeatList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_HEAT;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_HEAT');
            }
            // TM각비
            if (rowData.MATERIAL_FINISH_TM !== undefined && rowData.MATERIAL_FINISH_TM !== null && rowData.MATERIAL_FINISH_TM !== '') {
                let index = materialFinishTmList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_TM;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_TM');
            }
            // 연마
            if (rowData.MATERIAL_FINISH_GRIND !== undefined && rowData.MATERIAL_FINISH_GRIND !== null && rowData.MATERIAL_FINISH_GRIND !== '') {
                let index = materialFinishGrindList.findIndex(function (element) {
                    return element.value === rowData.MATERIAL_FINISH_GRIND;
                });

                if (index < 0) addErrorList(rowIndex, 'MATERIAL_FINISH_GRIND');
            }
        };

        // 잘못 입력된 데이터 체크
        const inputErrorCheck = function (rowData) {
            let list = [];
            const singleList = ['PART_UNIT_QTY']; // 단품
            const assemblyList = ['MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY']; // 조립
            const modifiedList = ['PART_UNIT_QTY']; // 수정
            const stockList = ['PART_UNIT_QTY', 'ORDER_NUM', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT']; // 재고
            const partList = ['ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT']; // 파트

            switch (rowData.WORK_TYPE) {
                case 'WTP010':
                    list = singleList;
                    break;
                case 'WTP020':
                    list = assemblyList;
                    break;
                case 'WTP030':
                    list = modifiedList;
                    break;
                case 'WTP040':
                    list = stockList;
                    break;
                case 'WTP050':
                    list = partList;
                    break;
            }

            for (let i in list) {
                if (list.hasOwnProperty(i)) {
                    if (rowData[list[i]] !== undefined && rowData[list[i]] != null && rowData[list[i]] !== '') {
                        addErrorList(rowData.pq_ri, list[i]);
                    }
                }
            }
        };

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
                    $orderRegisterGrid.pqGrid('removeClass', {rowIndx: prevList[i].rowIndx, dataIndx: prevList[i].dataIndx, cls: 'bg-lightcoral'} );
                }
            }

            if (list.length > 0) {
                for(let i in list) {
                    if (list.hasOwnProperty(i)) {
                        $orderRegisterGrid.pqGrid('addClass', {rowIndx: list[i].rowIndx, dataIndx: list[i].dataIndx, cls: 'bg-lightcoral'} );
                    }
                }
            }
        };

        function dateEditor (ui) {
            let $inp = ui.$cell.find("input");
            $inp.datepicker({
                changeMonth: true, changeYear: true, showAnim: '', dateFormat: 'yymmdd',
                onSelect: function () { this.firstOpen = true; },
                beforeShow: function () {return !this.firstOpen; },
                onClose: function () { this.focus(); }
            });
        }
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
<jsp:include page="/WEB-INF/views/attr/tabs/bottom.jsp"/>
