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
        let workTypeListForOrder = []
        const workTypeList = fnGetCommCodeGridSelectBox('1033');
        const workFactoryList = fnGetCommCodeGridSelectBox('1014');
        const materialDetailList = fnGetCommCodeGridSelectBox('1027');
        const materialKindList = fnGetCommCodeGridSelectBox('1029');
        const surfaceTreatList = fnGetCommCodeGridSelectBox('1039');
        const specialTreatList = [
            {'value':'MATERIAL_FINISH_GRIND_YN', 'text':'연마'},
            {'value':'MATERIAL_FINISH_HEAT_YN', 'text':'열처리'}
        ];
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
            fnPostAjaxAsync(function (data) {
                for (let i = 0, LENGTH = data.list.length; i < LENGTH; i++) {
                    let obj = data.list[i];
                    list.push({'value': obj.CODE_CD, 'text': obj.CODE_NM, 'compCd': obj.COMP_CD});
                }
            }, parameters, '');
            return list;
        })();


        $.each(workTypeList, function (idx,Item) {
            if(Item.value != 'WTP040' && Item.value != 'WTP050') {
                workTypeListForOrder.push(Item);
            }
        })

        let $orderRegisterGrid;
        const popupGridId = 'ORDER_REGISTER_GRID';
        const popupColModel = [
            {
                title: '단가확인', width: 70, dataIndx: 'PRICE_CONFIRM', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: priceConfirmList,
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
                        let priceConfirm = priceConfirmList;
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
                title: '발주업체', width: 100, dataIndx: 'ORDER_COMP_CD', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
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
            {
                title: '비고', align: 'left', width: 100, dataIndx: 'NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '접수번호', align: 'left', width: 180, dataIndx: 'REGIST_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'red'},
                style: {'font-weight': 'bold', 'color': 'black'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '도면번호', align: 'left', width: 150, dataIndx: 'DRAWING_NUM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '품명', align: 'left', width: 150, dataIndx: 'ITEM_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '발주번호', align: 'left', width: 100, dataIndx: 'ORDER_NUM',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '수량', dataType: 'integer', format: '#,###', dataIndx: 'ORDER_QTY',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '대칭', align: 'center',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                colModel: [
                    {
                        title: '원칭', dataType: 'integer', format: '#,###', dataIndx: 'ORIGINAL_SIDE_QTY',
                        styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                        editor: {
                            getData: function (ui) {
                                let val = ui.$cell.find('.pq-cell-editor').val();
                                return fnIsEmpty(val) ? undefined : val;
                            }
                        }
                    },
                    {
                        title: '대칭', dataType: 'integer', format: '#,###', dataIndx: 'OTHER_SIDE_QTY',
                        styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'}, editor: {
                            getData: function (ui) {
                                let val = ui.$cell.find('.pq-cell-editor').val();
                                return fnIsEmpty(val) ? undefined : val;
                            }
                        }
                    },
                ]
            },
            {
                title: '발주납기', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'ORDER_DUE_DT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'textbox', init: fnDateEditor,
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '작업<br>형태', dataIndx: 'WORK_TYPE',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: workTypeListForOrder,
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
                        let workType = workTypeListForOrder;
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
                title: '소재<br>사급', dataIndx: 'MATERIAL_SUPPLY_YN', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '주요<br>검사', width: 50, dataIndx: 'MAIN_INSPECTION',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: mainInspectionList,
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
                        let mainInspection = mainInspectionList;
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
                title: '대칭', minWidth: 30, dataIndx: 'SAME_SIDE_YN',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: fnGetCommCodeGridSelectBox('1042'),
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                },
                render: function (ui) {
                    let cellData = ui.cellData;

                    return cellData === 'Y' ? cellData : '';
                }
            },
            {
                title: '규격', width: 110, dataIndx: 'SIZE_TXT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '소재종류', width: 80, dataIndx: 'MATERIAL_DETAIL', styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: materialDetailList,
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
                        let materialDetail = materialDetailList;
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
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: materialKindList,
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
                        let materialKind = materialKindList;

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
                title: '표면<br>처리', width: 80, dataIndx: 'SURFACE_TREAT',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: surfaceTreatList,
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
                        let surfaceTreat = surfaceTreatList;
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
                title: '소재<br>비고', width: 80, dataIndx: 'MATERIAL_NOTE',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
            },
            {
                title: '특수처리', align: 'center', dataIndx: 'SPECIAL_TREATMENT',
                styleHead: {'font-weight': 'bold', 'background': '#A9D3F5', 'color': '#000000'},
                editor: {
                    type: 'select',
                    valueIndx: 'value',
                    labelIndx: 'text',
                    options: [
                        {'value':'MATERIAL_FINISH_GRIND_YN', 'text':'연마'},
                        {'value':'MATERIAL_FINISH_HEAT_YN', 'text':'열처리'}
                    ]
                },
                render: function (ui) {
                    let cellData = ui.cellData || ' ';
                    if(cellData == 'MATERIAL_FINISH_GRIND_YN') {
                        return {text: '연마'};
                    }else if(cellData == 'MATERIAL_FINISH_HEAT_YN') {
                        return {text: '열처리'};
                    }
                }
            },
            {
                title: '납품확인', width: 70, dataType: 'date', format: 'yy/mm/dd', dataIndx: 'DELIVERY_DT',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'textbox', init: fnDateEditor,
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '견적단가', align: 'right', width: 90,
                dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_EST_AMT',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '공급단가', align: 'right', width: 90,
                dataType: 'integer', format: '#,###', dataIndx: 'UNIT_FINAL_AMT',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '변경전 도면번호', align: 'left', width: 150, dataIndx: 'PREV_DRAWING_NUM',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '프로젝트', align: 'left', width: 200, dataIndx: 'PROJECT_NM',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '모듈', align: 'left', width: 100, dataIndx: 'MODULE_NM',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '납품처', align: 'left', width: 100, dataIndx: 'DELIVERY_COMP_NM',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '비고(라벨)', align: 'left', width: 100, dataIndx: 'LABEL_NOTE',
                styleHead: {'font-weight': 'bold','background':'#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            },
            {
                title: '구매담당', dataIndx: 'ORDER_STAFF_SEQ',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': 'black'},
                editor: {
                    type: 'select', valueIndx: 'value', labelIndx: 'text',
                    options: function (ui) {
                        return COMPANY_STAFF.filter(function (value) {
                            return value.compCd === ui.rowData.ORDER_COMP_CD;
                        });
                    },
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
            {
                title: '설계자', dataIndx: 'DESIGNER_NM',
                styleHead: {'font-weight': 'bold', 'background': '#a9d3f5', 'color': '#2777ef'},
                editor: {
                    getData: function (ui) {
                        let val = ui.$cell.find('.pq-cell-editor').val();
                        return fnIsEmpty(val) ? undefined : val;
                    }
                }
            }
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
                                if(!fnIsEmpty(data.registList) && data.registList.length > 0) {
                                    let registNumStr = '';

                                    for (let i = 0, LENGTH = data.registList.length; i < LENGTH; i++) {
                                        registNumStr += data.registList[i].REGIST_NUM;

                                        if (i < LENGTH - 1) {
                                            registNumStr += ', ';
                                        }
                                    }
                                    fnAlert(null, registNumStr + '<br>이미 등록된 접수 번호입니다.');
                                }else if(fnIsEmpty(data.list)) {
                                    fnAlert(null, '<spring:message code="com.alert.default.save.success"/>', function () {
                                        window.close();
                                        opener.$orderManagementGrid.pqGrid('refreshDataAndView');
                                    });
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
                        let specialTreat = null;

                        // 단가확인
                        if (newRowData.PRICE_CONFIRM !== undefined) {
                            let index = priceConfirmList.findIndex(function (element) {
                                return element.text === newRowData.PRICE_CONFIRM;
                            });
                            if (index >= 0) priceConfirm = priceConfirmList[index].value;
                        }
                        // 사업자
                        if (newRowData.COMP_CD !== undefined) {
                            let index = FAMILY_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index >= 0) compCd = FAMILY_COMPANY[index].value;
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

                        // 특수처리 (연마, 열처리)
                        if (newRowData.SPECIAL_TREATMENT !== undefined) {

                            let index = specialTreatList.findIndex(function (element) {
                                return element.text === newRowData.SPECIAL_TREATMENT;
                            });

                            if (index >= 0) specialTreat = specialTreatList[index].value;
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
                        ui.addList[i].newRow.SPECIAL_TREATMENT = specialTreat;
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
                        let specialTreat = null;

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
                            let index = FAMILY_COMPANY.findIndex(function (element) {
                                return element.text === newRowData.COMP_CD;
                            });

                            if (index >= 0) {
                                compCd = FAMILY_COMPANY[index].value;
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

                        // 특수처리 (연마, 열처리)
                        if (newRowData.SPECIAL_TREATMENT !== undefined) {
                            let index = specialTreatList.findIndex(function (element) {
                                return element.text === newRowData.SPECIAL_TREATMENT;
                            });

                            if (index >= 0) {
                                specialTreat = specialTreatList[index].value;
                                tempNewRow.SPECIAL_TREATMENT = specialTreat;
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
            registNumCheck(dataList)
            sameSideCheck(dataList);

            for (let i = 0, LENGTH = dataList.length; i < LENGTH; i++) {
                const rowData = dataList[i];
                let ObjectWithData = {};

                for (const key in rowData) {
                    if (rowData.hasOwnProperty(key)) {
                        const value = rowData[key];
                        if (key !== 'pq_cellcls' && value !== undefined) {
                            ObjectWithData[key] = value;
                        }
                    }
                }

                if (Object.keys(ObjectWithData).length > 2) {
                    requiredCheck(ObjectWithData);
                    badCodeCheck(ObjectWithData);
                }
            }
        };

        const controlNumCheck = function (dataList) {
            $.each(dataList, function (idx,Item) {
                var regexpSpec = /[^A-Za-z0-9\-]/gi;
                if(regexpSpec.test(Item.CONTROL_NUM)) {
                    addErrorList(Item.pq_ri, 'CONTROL_NUM');
                }
            })
        }
        const registNumCheck = function (dataList) {
            const groupedRegistNum = fnGroupBy(dataList, 'REGIST_NUM');
            $.each(groupedRegistNum, function (idx,Item) {
                if(idx !== 'undefined' && idx != 'null' && idx != '') {
                    $.each(Item, function (idx2,Item2) {
                        if(Item.length > 1) {
                            addErrorList(Item2.pq_ri, 'REGIST_NUM');
                        }else {
                            var regexpSpec = /[^A-Za-z0-9\-\_]/gi;
                            if(regexpSpec.test(Item2.REGIST_NUM)) {
                                addErrorList(Item2.pq_ri, 'REGIST_NUM');
                            }
                        }
                    })
                }
            })
        }
        const dateCheck = function (dataList) {
            $.each(dataList, function (idx, Item) {
                var dt = new Date(Item.ORDER_DUE_DT);
                var today = new Date();

                if(dt < today) {
                    addErrorList(Item.pq_ri, 'ORDER_DUE_DT');
                }
            })
        }

        const sameSideCheck = function (dataList) {
            $.each(dataList, function (idx,Item) {
                if(Item.SAME_SIDE_YN == 'Y'){
                    let tmpOther = (fnIsEmpty(Item.OTHER_SIDE_QTY))?0:Item.OTHER_SIDE_QTY;
                    let tmpOrg = (fnIsEmpty(Item.ORIGINAL_SIDE_QTY))?0:Item.ORIGINAL_SIDE_QTY;
                    let tmpOrd = (fnIsEmpty(Item.ORDER_QTY))?0:Item.ORDER_QTY;
                    if(fnIsEmpty(Item.ORIGINAL_SIDE_QTY) && fnIsEmpty(Item.OTHER_SIDE_QTY)) {
                        addErrorList(Item.pq_ri, 'ORIGINAL_SIDE_QTY');
                        addErrorList(Item.pq_ri, 'OTHER_SIDE_QTY');
                    }else if(Number(tmpOrd) !== (Number(tmpOrg) + Number(tmpOther))) {
                        addErrorList(Item.pq_ri, 'ORIGINAL_SIDE_QTY');
                        addErrorList(Item.pq_ri, 'OTHER_SIDE_QTY');
                    }
                }else {
                    if(!fnIsEmpty(Item.ORIGINAL_SIDE_QTY) || !fnIsEmpty(Item.OTHER_SIDE_QTY)) {
                        addErrorList(Item.pq_ri, 'ORIGINAL_SIDE_QTY');
                        addErrorList(Item.pq_ri, 'OTHER_SIDE_QTY');
                    }
                }
            });
        }

        const workTypeCheck = function (dataList) {
            let groupedControlNum = fnGroupBy(dataList, 'CONTROL_NUM');

            for (let controlNum in groupedControlNum) {
                if (groupedControlNum.hasOwnProperty(controlNum)) {
                    let groupedWorkType = fnGroupBy(groupedControlNum[controlNum], 'WORK_TYPE');

                    if (groupedWorkType.hasOwnProperty('WTP020')) {
                        if (groupedWorkType.hasOwnProperty('WTP010') || groupedWorkType.hasOwnProperty('WTP040')) {
                            for (let i = 0; i < groupedControlNum[controlNum].length; i++) {
                                addErrorList(groupedControlNum[controlNum][i].pq_ri, 'WORK_TYPE');
                            }
                        }
                    }
                }
            }
        };

        // required 체크
        const requiredCheck = function (rowData) {
            let list;
            // 21.09.07 개선 버전에서는 신규주문에 작업형태 - 단품, 조립, 수정만 생성가능함
            const commonRequiredList = ['COMP_CD', 'ORDER_COMP_CD', 'REGIST_NUM', 'DRAWING_NUM', 'ORDER_DUE_DT', 'SIZE_TXT', 'ORDER_QTY', 'WORK_TYPE', 'MATERIAL_KIND'];
            const modifiedList = ['MATERIAL_SUPPLY_YN']; // 수정

            if(rowData.WORK_TYPE == 'WTP030') {
                list = commonRequiredList.concat(modifiedList);
            }else {
                list = commonRequiredList;
            }

            for (let i in list) {
                var tempArr = [];
                for(let i2 in rowData) {
                    if(i2 != 'ROWNUM' && i2 != 'pq_ri' && !fnIsEmpty(rowData[i2])) {
                        tempArr.push(i2);
                    }
                }
                if(tempArr.length > 0) {
                    if (fnIsEmpty(rowData[list[i]]) || (rowData[list[i]] != null && typeof rowData[list[i]] == 'object' && !Object.keys(rowData[list[i]]).length)) {
                        addErrorList(rowData.pq_ri, list[i]);
                    }
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
        };
        // 잘못 입력된 데이터 체크
        const inputErrorCheck = function (rowData) {
            let list = [];
            const singleList = ['PART_UNIT_QTY']; // 단품
            const assemblyList = ['MATERIAL_DETAIL', 'MATERIAL_KIND', 'SURFACE_TREAT', 'MATERIAL_NOTE', 'PART_UNIT_QTY']; // 조립
            const modifiedList = ['PART_UNIT_QTY']; // 수정
            const stockList = ['PART_UNIT_QTY', 'ORDER_NUM', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT','REGIST_NUM']; // 재고
            const partList = ['ORDER_NUM', 'ORDER_QTY', 'ORDER_DUE_DT', 'DELIVERY_DT', 'UNIT_FINAL_EST_AMT', 'UNIT_FINAL_AMT','REGIST_NUM']; // 파트

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
