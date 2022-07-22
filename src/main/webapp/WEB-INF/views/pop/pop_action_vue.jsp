<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES POP</title>
    <!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
   	<link rel="shortcut icon" href="/favicon.ico">
   	<!-- Chrome, Safari, IE -->
   	<link rel="icon" href="/favicon.ico">
    <!--jQueryUI version >= 1.11.4 only -->
    <link rel="stylesheet" href="/resource/plugins/jquery-ui-1.11.4/themes/smoothness/jquery-ui.min.css" />
    <!--Bootstrap dependencies-->
    <link rel="stylesheet" href="/resource/main/css/bootstrap.css" />
    <!--add pqgrid.bootstrap.css for bootstrap related classes-->
    <link rel="stylesheet" href="/resource/plugins/dhtmlx/suite.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <!--jQuery dependencies-->
    <script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>

    <!-- alertify -->
    <script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>

    <script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>
    <!-- barcode -->
    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>

    <!-- socket -->
    <script type="text/javascript" src='/resource/plugins/socket/sockjs.min.js'></script>
    <script type="text/javascript" src='/resource/plugins/stomp/stomp.min.js'></script>

    <script src="https://unpkg.com/vue@2.7.2/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <style type="text/css">

        .success-icon-class .dhx_message__icon{
            color:#ffffff !important;
        }
        .success-font-class .dhx_message__text{
            color: #ffffff !important;
        }
        .success-msg-class{
            width: 100%;
            background-color: #0469fd !important;
        }

        .fail-icon-class .dhx_message__icon{
            color:#ffffff !important;
        }
        .fail-font-class .dhx_message__text{
            color: #ffffff !important;
        }
        .fail-msg-class{
            width: 100%;
            background-color: #fd1015 !important;
        }

        .dhx_message-container--top-right {
            top: 300px;
            right: 380px;
            text-align: center;
        }
        @media(min-width: 960px) {
            .container {
                max-width:1040px
            }
        }

        @media(min-width: 1264px) {
            .container {
                max-width:1185px
            }
        }

        @media(min-width: 1904px) {
            .container {
                max-width:1785px
            }
        }

        .img_note {
            position: absolute;
            top: 85%;
            left:52%;
            border: 1px solid #333333 !important;
        }

        .staff_img {
            position: absolute;
            top: 80%;
            left: 1%;
        }

        .selectedItem {
            background-color: #cbe5ff !important;
            border-color: blue !important;
            border: 2px solid blue !important;
        }

        .v-application .v-card .grey.lighten-4 {
            border: 1px solid #333333 !important;
            box-shadow: none;
        }
        .v-select__selection--comma {
            font-size: 1.2rem;
        }
        .v-select-list .v-list-item__title {
            font-size: 1.2rem;
        }

        .v-data-table>.v-data-table__wrapper>table>tbody>tr>th,.v-data-table>.v-data-table__wrapper>table>tfoot>tr>th,.v-data-table>.v-data-table__wrapper>table>thead>tr>th {
            font-size: 1rem !important;
        }

        .v-data-table>.v-data-table__wrapper>table>tbody>tr>td,.v-data-table>.v-data-table__wrapper>table>tfoot>tr>td,.v-data-table>.v-data-table__wrapper>table>thead>tr>td {
            font-size: 1rem !important;
        }
        .v-image__image {
            image-rendering: pixelated;
            backface-visibility: hidden;
            transform: translateZ(0);
        }
    </style>
</head>
<%--<body>--%>
<body onresize="parent.resizeTo(1620,1080)" onload="parent.resizeTo(1620,1080)">
    <div id="app">
        <v-app id="inspire">
            <v-main>
                <v-container max-width="1050" md="auto">
                    <v-overlay :value="overlay">
                        <v-progress-circular
                                indeterminate
                                size="64"
                        ></v-progress-circular>
                    </v-overlay>
                    <v-row class="align-center mt-5">
                        <v-col>
                            <v-select
                                    v-model="popLocation"
                                    :items="popList"
                                    item-text="CODE_NM"
                                    item-value="CODE_CD"
                                    @change="changePop"
                                    ref="selPop"
                                    outlined
                            ></v-select>
                        </v-col>
<%--                        <v-col cols="3">--%>
<%--                            <v-select--%>
<%--                                    :items="statusList"--%>
<%--                                    item-text="name"--%>
<%--                                    item-value="value"--%>
<%--                            ></v-select>--%>
<%--                        </v-col>--%>
                        <v-spacer></v-spacer>
                        <v-spacer></v-spacer>
                        <v-col>
                            <v-row no-gutters>
                                <v-col cols="auto" class="mr-auto">
                                    <v-card-title class="pa-1 text-h5 text-right">
                                        Total
                                    </v-card-title>
                                </v-col>
                                <v-col cols="auto">
                                    <v-card-title class="pa-1 text-h5 blue--text text--darken-4 text-right">
                                        {{items.length}} ({{sum}}ea)
                                    </v-card-title>
                                </v-col>
                            </v-row>
                        </v-col>
                    </v-row>
                    <v-item-group>
                        <v-row class="align-center mb-5">
                            <template v-for="(item, index) in items">
                                <v-col
                                        :key="item.TEMP_KEY"
                                        class="d-flex child-flex pa-2 pt-3 pb-3"
                                        cols="3"
                                        v-if="index < perPage * page && index >= (perPage * (page -1))"
                                >
                                    <v-item v-slot="{ active, toggle }">
                                        <v-card
                                                class="mx-auto"
                                                :class="{selectedItem:(selectedItem.TEMP_KEY == item.TEMP_KEY)}"
                                                :style="{ border: (item.IS_TODAY == 'Y')?'1px solid blue':'1px solid #636363'}"

                                                @click="clickImage(item)"
                                        >
                                            <v-row no-gutters>
                                                    <span class="text-sm-body-2 font-weight-medium pl-2 text-truncate">{{item.CONTROL_NUM}}</span>
                                                    <span class="text-subtitle-2 font-weight-light blue--text text--darken-4 text-truncate pr-2 ml-auto">{{item.SIZE_TXT}}</span>
                                            </v-row>
                                            <v-card-actions class="pt-1 pb-1" style="min-height:140px;">
                                                <v-img
                                                        :src="item.QS_IMG_URL"
<%--                                                        aspect-ratio="1.8"--%>
                                                        style="border: 1px solid gray;"
                                                        class="pa-1"
                                                        max-height="170"
                                                >
                                                    <v-list-item class="grow d-flex pa-3 pt-0 pl-0 align-start" style="min-height: 125px;">
                                                        <v-card v-show="item.EQUIP_NM != null && item.EQUIP_NM != ''"
                                                                class="pa-1 text-center light-green accent-3 rounded-sm"
                                                                min-width="100" max-width="105" style="border: 1px solid #333333 !important; box-shadow: none;"
                                                        >가공중 {{item.EQUIP_NM}}</v-card>
                                                        <v-list-item-avatar v-if="item.USER_IMG_URL" color="grey darken-3" class="staff_img">
                                                            <v-img
                                                                    class="elevation-6"
                                                                    :src="item.USER_IMG_URL"
                                                            ></v-img>
                                                        </v-list-item-avatar>
                                                        <v-card min-width="120" max-width="200" class="text-center rounded-sm grey lighten-4 img_note"
                                                                :style="{ backgroundColor: (item.IS_TODAY == 'Y')?'#c6e5ff !important':''}">
                                                            {{item.MATERIAL_TYPE_NM}} {{item.ORDER_QTY}} ea <br>
                                                            {{item.POP_DT}}
                                                        </v-card>
                                                    </v-list-item>
                                                </v-img>
                                            </v-card-actions>
                                        </v-card>
                                    </v-item>
                                </v-col>
                            </template>
                        </v-row>
                    </v-item-group>
                    <template>
                        <div class="text-center">
                            <v-pagination
                                    v-model="page"
                                    :length="Math.round(items.length / perPage)"
                                    :total-visible="7"
                                    @input="handlePageChange"
                            ></v-pagination>
                        </div>
                    </template>
                    <v-row class="mt-8">
                        <v-col :cols="3">
                            <template>
                                <v-simple-table class="text-subtitle-2 text-center" style="border: 1px solid gray;">
                                    <template>
                                        <thead>
                                            <tr>
                                                <th colspan="2" class="blue lighten-4 text-center">
                                                    작업번호
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">{{ selectedItem.CONTROL_NUM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">가공납기</td>
                                                <td>{{ selectedItem.INNER_DUE_DT }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">규격</td>
                                                <td>{{ selectedItem.SIZE_TXT }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">발주처</td>
                                                <td>{{ selectedItem.ORDER_COMP_NM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">수량</td>
                                                <td v-if="selectedItem.ORDER_QTY != null">{{selectedItem.WORK_TYPE_NM}} {{ selectedItem.ORDER_QTY }} ea</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">소재</td>
                                                <td>{{ selectedItem.MATERIAL_DETAIL_NM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">재고번호</td>
                                                <td>{{ selectedItem.INSIDE_STOCK_NM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">외주업체</td>
                                                <td>{{ selectedItem.OUTSIDE_COMP_NM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">진행상태</td>
                                                <td>{{ selectedItem.PART_STATUS_NM }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">현재위치</td>
                                                <td>{{ selectedItem.POP_POSITION }}</td>
                                            </tr>
                                            <tr>
                                                <td class="blue lighten-4 col-5">위치일시</td>
                                                <td>{{ selectedItem.POP_DT }}</td>
                                            </tr>
                                        </tbody>
                                    </template>
                                </v-simple-table>
                            </template>
                        </v-col>
                        <v-col :cols="9" class="pl-0 pr-0" style="border: 1px solid gray;">
                            <v-img
                                    :src="selectedItem.Q_IMG_URL"
                                    :lazy-src="selectedItem.Q_IMG_URL"
                                    class="grey lighten-2"
                            >
                            </v-img>
                        </v-col>
                    </v-row>
                </v-container>
            </v-main>
        </v-app>
    </div>
    <script type='text/javascript'>
        let pLocation = '${popLocation}';
        if(pLocation === undefined || pLocation == null || pLocation == '') {
            pLocation = 'POP010';
        }
        let fnFetchPost = function (url, data, callFunction, callFunctionParam) {
            let callback = $.Callbacks();

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
                },
                body: new URLSearchParams(data)
            }).then(function(response) {
                return response.json();
            }).then(function(data) {
                // app.items = data.data;
                callback.add(callFunction);
                callback.fire(data, callFunctionParam)
            });
        }

        let app = new Vue({
            el: '#app',
            vuetify: new Vuetify(),
            data: {
                page:1,
                perPage:20,
                overlay:false,
                items : [],
                popList : [],
                popLocation:pLocation,
                selectedItem:{},
                statusList : [
                    {name:'가공완료', value:'PRO009'},
                    {name:'표면처리출고', value:'PRO014'},
                    {name:'후가공출고', value:'PRO015'}
                ]
            },
            methods: {
                handlePageChange(value) {
                    this.selectedItem = {};
                    this.page = value;
                },
                clickImage(value) {
                    this.selectedItem = value;
                },
                changePop(value) {
                    this.selectedItem = {};
                    this.popLocation = value;
                    this.page = 1;
                    let parameter = {
                        queryId: 'popMapper.selectPopList',
                        popLocation: this.popLocation
                    }
                    this.overlay = true;
                    fnFetchPost('/popParamQueryGridSelect', parameter, function (data) {
                        app.items = data.data;
                        app.overlay = false;
                        if(data.data.length > 0) {
                            app.selectedItem = app.items[0];
                        }
                    })
                    this.$refs.selPop.blur();
                }
            },
            computed: {
                sum: function() {
                    let sum = 0;
                    for(let i = 0; i < this.items.length; i++){
                        sum += (parseInt(this.items[i].ORDER_QTY));
                    }

                    return sum;
                }
            },
            created() {
                let parameter = {
                    queryId: 'popMapper.selectPopList',
                    popLocation: this.popLocation
                }
                fnFetchPost('/popParamQueryGridSelect', parameter, function (data) {
                    app.items = data.data;
                    if(data.data.length > 0) {
                        app.selectedItem = app.items[0];
                    }
                })

                parameter.queryId = 'common.selectCodeList'
                parameter.HIGH_CD = '1009'

                fnFetchPost('/popParamQueryGridSelect', parameter, function (data) {
                    app.popList = data.data;
                })

            }
        })

        function refreshListData() {
            app.changePop(app.popLocation);
        }

        $(function () {
            'use strict';
            onScan.attachTo(document, {
                onScan: function(barcode, iQty) {
                    let barcodeNum = fnBarcodeKo2En(barcode);
                    sendDrawingNum(barcodeNum);
                }
            });

            var sendDrawingNum = function(barcodeNum){
                'use strict';
                var message = "";
                $.ajax({
                    type: 'POST', url: "/popScanningBarcodePop", dataType: 'json',
                    data: { 'popLocation': app.popLocation, 'popBarcode': barcodeNum},
                    success: function (data, textStatus, jqXHR) {
                        // $(this).stopWaitMe();
                        var returnCode = data.returnCode;
                        if (textStatus === 'success') {
                            if(returnCode == "RET00") {
                                message = data.controlInfo + '\n' + data.locationInfo;
                                showSuccessMessage(message);
                            }else if(returnCode == "RET01"){
                                message = data.message;
                                showSuccessMessage(message);
                            }else{
                                message = data.message;
                                showFailMessage(message);
                            }
                        }else{
                            message = "시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.";
                            showFailMessage(message);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        // if (!($waitMeMainContainer === undefined)) $(this).stopWaitMe();
                        message = "시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.";
                        showFailMessage(message);
                        refreshListData();
                    }
                });
            };

            $("#popRefresh").on('click', function(){
                refreshListData();
            });

            var showSuccessMessage = function(message){
                dhx.message({
                    text: message, icon: "dxi-close", "expire": 2000, "position": "top-right", css:"success-icon-class success-font-class success-msg-class"
                });
            }

            var showFailMessage = function(message){
                dhx.message({
                    text: message, icon: "dxi-close", "expire": 10000, "position": "top-right", css:"fail-icon-class fail-font-class fail-msg-class"
                });
            }

            let iConnectCount = 0;
            function jmesConnect() {
                let socket = new SockJS('/jmes-ws');
                let stompClient = Stomp.over(socket);
                stompClient.connect({}, (frame) => {
                    stompClient.subscribe('/topic/pop', function (notificationMessage) {
                        let messageData = JSON.parse(notificationMessage.body);
                        console.log('/topic/pop',messageData)

                        if(messageData.popPosition == app.popLocation) {
                            let parameter = {
                                queryId: 'popMapper.selectPopList',
                                popLocation: app.popLocation,
                                CONTROL_SEQ : messageData.controlSeq,
                                CONTROL_DETAIL_SEQ: messageData.controlDetailSeq
                            }

                            fnFetchPost('/popParamQueryGridSelect', parameter, function (data) {
                                if(data.data.length > 0) {
                                    app.items = data.data.concat(app.items);
                                    app.selectedItem = app.items[0];
                                }
                            })
                        }else if(messageData.prePopPosition == app.popLocation) {
                            let delIdx;
                            $.each(app.items, function (idx,Item) {
                                if(Item.CONTROL_SEQ == messageData.controlSeq && Item.CONTROL_DETAIL_SEQ == messageData.controlDetailSeq) {
                                    delIdx = idx;
                                }
                            })
                            app.items.splice(delIdx,1);
                            if(app.selectedItem.CONTROL_SEQ == messageData.controlSeq && app.selectedItem.CONTROL_DETAIL_SEQ == messageData.controlDetailSeq) {
                                app.selectedItem = {};
                            }
                        }
                    });
                }, () => {
                    setTimeout(() => {
                        if(iConnectCount == 6) {
                            // showFailMessage("시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
                            // setTimeout(function () {
                            //     location.reload();
                            // },1000 * 60 * 1)
                            return;
                        }else if(iConnectCount <= 5){
                            jmesConnect();
                        }
                        iConnectCount++
                    }, 5000);
                });
            }

            jmesConnect();

            /** 30분 마다 refresh **/
            setInterval(function() {
                refreshListData();
            }, 1000 * 60 * 30);

        });

        /**
         * @description 바코드 첫글자 영문 변환
         * @param {string} text
         * @returns {string} text
         */
        const fnBarcodeKo2En = function (text) {
            let char = text.substring(0, 1);

            switch (char) {
                case 'ㅊ':
                    char = 'C';
                    break;
                case 'ㅣ':
                    char = 'L';
                    break;
            }

            return (char + text.substring(1)).toUpperCase();
        };
    </script>
</body>
</html>