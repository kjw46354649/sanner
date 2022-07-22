<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES STOP ALARM DASHBOARD</title>
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
    <!-- print -->
    <%--    <link rel="stylesheet" type="text/css" href="/resource/asset/css/webFont.css" />--%>
    <%--    <link rel="stylesheet" type="text/css" href="/resource/asset/css/reset.css" />--%>
    <%--    <link rel="stylesheet" type="text/css" href="/resource/asset/css/common.css" />--%>
    <%--    <link rel="stylesheet" type="text/css" href="/resource/asset/css/layout.css" />--%>
    <%--    <link rel="stylesheet" type="text/css" href="/resource/asset/css/style.css" />--%>
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/themes/bootstrap/pqgrid.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqgrid.min.css" />
    <link rel="stylesheet" type="text/css" href="/resource/plugins/paramquery/pqSelect/pqselect.min.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src='/resource/main/js/bootstrap.js'></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resource/asset/js/front.js"></script>
    <!--jQuery dependencies-->
    <script type="text/javascript" src="/resource/plugins/jquery-ui-1.11.4/jquery-ui.min.js"></script>

    <script type="text/javascript" src="/resource/plugins/dhtmlx/suite.min.js"></script>
    <!-- barcode -->
<%--    <script type="text/javascript" src="/resource/plugins/scanner/onscan.js" ></script>--%>

    <!-- alertify -->
    <script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>


    <script type="text/javascript" src="/resource/plugins/paramquery/pqgrid.min.js" ></script>
    <script type="text/javascript" src="/resource/plugins/paramquery/localize/pq-localize-en.js"></script>
    <script type="text/javascript" src="/resource/plugins/paramquery/jsZip-2.5.0/jszip.min.js" ></script>
    <script type="text/javascript" src="/resource/plugins/paramquery/resize/jquery.resize.js" ></script
    <script type="text/javascript" src="/resource/plugins/paramquery/pqTouch/pqtouch.min.js" ></script>
    <script type="text/javascript" src="/resource/plugins/paramquery/pqSelect/pqselect.min.js" ></script>

    <!-- socket -->
    <script type="text/javascript" src='/resource/plugins/socket/sockjs.min.js'></script>
    <script type="text/javascript" src='/resource/plugins/stomp/stomp.min.js'></script>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <style>
        #app {
            background-color: azure;
        }

        div.pq-grid * {font-size: 2.2rem;}

        .v-application .alarm-board {
            border: 1rem solid lightgreen; background-color: yellow; min-height: 400px
        }

        @media(min-width: 3440px) {
            .v-application .alarm-board {
                border: 1rem solid lightgreen; background-color: yellow; min-height: 850px
            }

            .v-application .d-xl-none {
                display:none!important
            }

            .v-application .d-xl-inline {
                display: inline!important
            }

            .v-application .d-xl-inline-block {
                display: inline-block!important
            }

            .v-application .d-xl-block {
                display: block!important
            }

            .v-application .d-xl-table {
                display: table!important
            }

            .v-application .d-xl-table-row {
                display: table-row!important
            }

            .v-application .d-xl-table-cell {
                display: table-cell!important
            }

            .v-application .d-xl-flex {
                display: flex!important
            }

            .v-application .d-xl-inline-flex {
                display: inline-flex!important
            }

            .v-application .float-xl-none {
                float: none!important
            }

            .v-application .float-xl-left {
                float: left!important
            }

            .v-application .float-xl-right {
                float: right!important
            }

            .v-application--is-rtl .float-xl-end {
                float: left!important
            }

            .v-application--is-ltr .float-xl-end,.v-application--is-rtl .float-xl-start {
                float: right!important
            }

            .v-application--is-ltr .float-xl-start {
                float: left!important
            }

            .v-application .flex-xl-fill {
                flex: 1 1 auto!important
            }

            .v-application .flex-xl-row {
                flex-direction: row!important
            }

            .v-application .flex-xl-column {
                flex-direction: column!important
            }

            .v-application .flex-xl-row-reverse {
                flex-direction: row-reverse!important
            }

            .v-application .flex-xl-column-reverse {
                flex-direction: column-reverse!important
            }

            .v-application .flex-xl-grow-0 {
                flex-grow: 0!important
            }

            .v-application .flex-xl-grow-1 {
                flex-grow: 1!important
            }

            .v-application .flex-xl-shrink-0 {
                flex-shrink: 0!important
            }

            .v-application .flex-xl-shrink-1 {
                flex-shrink: 1!important
            }

            .v-application .flex-xl-wrap {
                flex-wrap: wrap!important
            }

            .v-application .flex-xl-nowrap {
                flex-wrap: nowrap!important
            }

            .v-application .flex-xl-wrap-reverse {
                flex-wrap: wrap-reverse!important
            }

            .v-application .justify-xl-start {
                justify-content: flex-start!important
            }

            .v-application .justify-xl-end {
                justify-content: flex-end!important
            }

            .v-application .justify-xl-center {
                justify-content: center!important
            }

            .v-application .justify-xl-space-between {
                justify-content: space-between!important
            }

            .v-application .justify-xl-space-around {
                justify-content: space-around!important
            }

            .v-application .align-xl-start {
                align-items: flex-start!important
            }

            .v-application .align-xl-end {
                align-items: flex-end!important
            }

            .v-application .align-xl-center {
                align-items: center!important
            }

            .v-application .align-xl-baseline {
                align-items: baseline!important
            }

            .v-application .align-xl-stretch {
                align-items: stretch!important
            }

            .v-application .align-content-xl-start {
                align-content: flex-start!important
            }

            .v-application .align-content-xl-end {
                align-content: flex-end!important
            }

            .v-application .align-content-xl-center {
                align-content: center!important
            }

            .v-application .align-content-xl-space-between {
                align-content: space-between!important
            }

            .v-application .align-content-xl-space-around {
                align-content: space-around!important
            }

            .v-application .align-content-xl-stretch {
                align-content: stretch!important
            }

            .v-application .align-self-xl-auto {
                align-self: auto!important
            }

            .v-application .align-self-xl-start {
                align-self: flex-start!important
            }

            .v-application .align-self-xl-end {
                align-self: flex-end!important
            }

            .v-application .align-self-xl-center {
                align-self: center!important
            }

            .v-application .align-self-xl-baseline {
                align-self: baseline!important
            }

            .v-application .align-self-xl-stretch {
                align-self: stretch!important
            }

            .v-application .order-xl-first {
                order: -1!important
            }

            .v-application .order-xl-0 {
                order: 0!important
            }

            .v-application .order-xl-1 {
                order: 1!important
            }

            .v-application .order-xl-2 {
                order: 2!important
            }

            .v-application .order-xl-3 {
                order: 3!important
            }

            .v-application .order-xl-4 {
                order: 4!important
            }

            .v-application .order-xl-5 {
                order: 5!important
            }

            .v-application .order-xl-6 {
                order: 6!important
            }

            .v-application .order-xl-7 {
                order: 7!important
            }

            .v-application .order-xl-8 {
                order: 8!important
            }

            .v-application .order-xl-9 {
                order: 9!important
            }

            .v-application .order-xl-10 {
                order: 10!important
            }

            .v-application .order-xl-11 {
                order: 11!important
            }

            .v-application .order-xl-12 {
                order: 12!important
            }

            .v-application .order-xl-last {
                order: 13!important
            }

            .v-application .ma-xl-3 {
                margin: 24px!important
            }

            .v-application .ma-xl-4 {
                margin: 32px!important
            }

            .v-application .mx-xl-1 {
                margin-right: 8px!important;
                margin-left: 8px!important
            }

            .v-application .mx-xl-3 {
                margin-right: 24px!important;
                margin-left: 24px!important
            }

            .v-application .mx-xl-4 {
                margin-right: 30px!important;
                margin-left: 30px!important
            }

            .v-application .mt-xl-6 {
                margin-top: 48px!important
            }

            .v-application .mb-xl-6 {
                margin-bottom: 48px!important
            }

            .v-application .pa-xl-3 {
                padding: 36px!important
            }

            .v-application .pa-xl-6 {
                padding: 48px!important
            }

            .v-application .py-xl-4 {
                padding-top: 32px!important;
                padding-bottom: 32px!important
            }

            .v-application .py-xl-6 {
                padding-top: 32px!important;
                padding-bottom: 32px!important
            }

            .v-application .pt-xl-6 {
                padding-top: 32px!important
            }

            .v-application .text-xl-h1 {
                font-size: 13rem!important;
                line-height: 13rem;
                letter-spacing: -.015625em!important
            }

            .v-application .text-xl-h1,.v-application .text-xl-h2 {
                font-weight: 300;
                font-family: Roboto,sans-serif!important
            }

            .v-application .text-xl-h3 {
                font-size: 6rem!important;
                line-height: 7rem;
                letter-spacing: normal!important
            }

            .v-application .text-xl-h3,.v-application .text-xl-h4 {
                font-weight: 400;
                font-family: Roboto,sans-serif!important
            }

            .v-application .text-xl-h4 {
                font-size: 5rem!important;
                line-height: 6rem;
                letter-spacing: .0073529412em!important
            }
        }
        @media(min-width: 3440px) {
            div.pq-grid * {
                font-size: 4.4rem;
            }
        }
        @media(min-width: 3440px) {
            .container {
                max-width: 3720px
            }
        }
    </style>
</head>
<body>
<div id="app">
    <v-app>
        <v-main fluid fill-height>
            <v-container fill-height>
                <v-row align="end">
                    <v-col class="ma-xl-3 mt-xl-6 pt-xl-6 text-xl-h4 font-weight-bold red--text">
                        Stop Alarm Board
                    </v-col>
                    <v-col class="ma-xl-3 mt-xl-6 pt-xl-6 text-xl-h3 font-weight-bold text-right">
                        <c:forEach var="code" items="${HighCode.H_1108}">
                            <c:if test="${ARM_CD eq code.CODE_CD}">${code.CODE_NM_KR}</c:if>
                        </c:forEach>
                    </v-col>
                </v-row>
                <v-row>
                    <v-col class="ma-xl-4">
                        <v-row>
                            <v-col class="pa-xl-6 mb-xl-6 font-weight-bold alarm-board">
                                <v-row class="pa-xl-3">
                                    <v-col class="text-xl-h3 font-weight-bold text-center red--text text--darken-4">
                                        {{cur_stop.EVENT_TIME_FORMAT}}
                                    </v-col>
                                </v-row >
                                <v-row class="pa-xl-3">
                                    <v-col class="text-xl-h1 font-weight-bold text-center">
                                        {{cur_stop.EQUIP_NM}}
                                    </v-col>
                                </v-row>
                                <v-row class="pa-xl-3">
                                    <v-col class="text-xl-h3 font-weight-bold text-center">
                                        <span class="mx-xl-1 red--text text--darken-4">{{cur_stop.CYCLE_FINISH_YN}}</span>
                                        <span class="mx-xl-1">{{cur_stop.WORK_USER_ID}}</span>
                                    </v-col>
                                </v-row>
                            </v-col>
                        </v-row>
                        <v-row class="mx-xl-3 text-xl-h4 font-weight-bold">
                            <v-col>NC STOP Alarm List</v-col>
                            <v-col class="text-right"><span id="ALARM_STOP_RECORDS"></span> Rows</v-col>
                        </v-row>
                        <v-row>
                            <v-col>
                                <div id="ncStopAlarmListGrid">
                                </div>
                            </v-col>
                        </v-row>
                    </v-col>
                    <v-col class="ma-xl-4 pa-xl-6 board" style="border: thick solid green; background-color: #d2f1ff;">
                        <v-row>
                            <v-col class="ma-xl-3 mb-xl-6 py-xl-6 text-xl-h3 text-center font-weight-bold">
                                현재 시간:
                                <span class="blue--text text--accent-4" id="curTime">
                                    </span>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col class="mx-xl-6 text-xl-h4 font-weight-bold blue--text text--accent-4">
                                가동현황
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col class="mx-xl-4">
                                <v-simple-table>
                                    <template v-slot:default>
                                        <thead>
                                        <tr class="indigo darken-4">
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                            </th>
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                                가동률
                                            </th>
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                                공정완료 수
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="blue--text text--accent-4" id="curOperatingRate">
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[0].TITLE }}</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[0].RATE }}</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[0].COMPLETE_CNT }} 품 {{ op_status[0].COMPLETE_QTY }} 건</td>
                                        </tr>
                                        <tr>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[1].TITLE }}</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[1].RATE }}</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ op_status[1].COMPLETE_CNT }} 품 {{ op_status[1].COMPLETE_QTY }} 건</td>
                                        </tr>
                                        </tbody>
                                    </template>
                                </v-simple-table>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col class="mx-xl-4"></v-col>
                        </v-row>
                        <v-row>
                            <v-col class="mx-xl-4 mt-xl-6 text-xl-h4 font-weight-bold red--text text--accent-3">
                                불량현황
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col class="mx-xl-4">
                                <v-simple-table>
                                    <template v-slot:default>
                                        <thead>
                                        <tr class="indigo darken-4">
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                            </th>
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                                부적합률
                                            </th>
                                            <th class="py-xl-6 text-xl-h4 font-weight-bold text-center white--text">
                                                부적합 수량
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="red--text text--accent-3" id="curDefectiveRate">
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[0].TITLE }} 월</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[0].DEFECT_RATE }} %</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[0].DEFECT_CNT }} 품 {{ def_status[0].DEFECT_QTY }} EA</td>
                                        </tr>
                                        <tr>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[1].TITLE }} 월</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[1].DEFECT_RATE }} %</td>
                                            <td class="py-xl-4 text-xl-h4 font-weight-bold text-center">{{ def_status[1].DEFECT_CNT }} 품 {{ def_status[1].DEFECT_QTY }} EA</td>
                                        </tr>
                                        </tbody>
                                    </template>
                                </v-simple-table>
                            </v-col>
                        </v-row>
                        </v-card>
                    </v-col>
                </v-row>
            </v-container>
        </v-main>
    </v-app>
</div>
<script src="https://unpkg.com/vue@2.7.2/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
<script type='text/javascript'>
    let fnPostAjax = function (callFunction, params, callFunctionParam) {
        'use strict';
        let callback = $.Callbacks();
        let param = $.extend({url: null, data: ''}, params || {});

        $.ajax({
            type: 'POST',
            url: param.url,
            dataType: 'json',
            data: param.data,
            success: function (data, textStatus, jqXHR) {
                if (textStatus === 'success') {
                    callback.add(callFunction);
                    callback.fire(data, callFunctionParam);
                } else {
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    };
    let fnFormToJsonArrayData = function (formid) {
        if(formid.indexOf("#") == -1) formid = "#"+formid;
        let elementArray = {};
        let formArr = $(formid).serializeArray();
        for(let i=0; i < formArr.length; i++) {
            let tmp = formArr[i];
            let name = tmp.name;
            let value = "";
            if(name != null){
                let $ctrl = $(formid).find('[name='+name+']');
                if ($ctrl.is('select')){
                    value = $ctrl.val();
                } else if ($ctrl.is('textarea')) {
                    value = $ctrl.val();
                } else {
                    switch($ctrl.attr("type")) {
                        case "text":
                        case "number":
                        case "date":
                        case "password":
                        case "hidden":
                        case "search":
                            value = $ctrl.val();
                            break;
                        case "checkbox":
                            if($ctrl.prop('checked')) value = true;
                            else value = false;
                            break;
                        case 'radio':
                            value = $("input:radio[name=" + name + "]:checked").val();
                            break;
                    }
                }
                elementArray[name] = value;
            }
        }
        return elementArray;
    };
    var g_noData = 'Not Found Data.';

    String.prototype.lpad = function(padLength, padString) {
        var s = this;
        if(s.length < padLength)
            s = padString.repeat(padLength-s.length) + s;
        return s;
    }

    let curOperatingRateRow;
    let curDefectiveRateRow;
    let curTimeSlot;

    let app = new Vue({
        el: '#app',
        vuetify: new Vuetify(),
        data: {
            op_status: [],
            def_status: [],
            cur_stop: {}
        },
        mounted: function(){
            document.querySelector("#rateBoard");
        },
        created() {
            this.op_status = [{
                rate: 84, done_group: 7, done_all: 242
            },{
                rate: 62, done_group: 12, done_all: 634
            }];

            this.def_status = [{
                month: 4, rate: 1.4, def_group: 2, def_cnt: 132
            },{
                month: 5, rate: 2.1, def_group: 3, def_cnt: 257
            }]
        }
    });

    curOperatingRateRow = document.querySelector("#curOperatingRate");
    curDefectiveRateRow = document.querySelector("#curDefectiveRate");
    curTimeSlot = document.querySelector("#curTime");


    function blinking(dom, ...color_options) {
        color_options.forEach((v, idx) => dom.classList.toggle(v));
    }

    function printTime() {
        var today = new Date();
        var year = (today.getFullYear()).toString().substring(2);
        var month = (today.getMonth()+1).toString().lpad(2,'0');
        var day = (today.getDate()).toString().lpad(2, '0');
        var hour = (today.getHours()).toString().lpad(2, '0');
        var min = (today.getMinutes()).toString().lpad(2, '0');
        var sec = (today.getSeconds()).toString().lpad(2, '0');
        var timeInfo = year+'/'+month+'/'+day+' '+hour+':'+min+':'+sec;
        return timeInfo;
    }

    function calculateElapsedTime(start, end) {
        let timeDiff = end - start;
        let h = Math.floor(timeDiff / (60 * 60 * 1000));
        let m = Math.floor((timeDiff % (60 * 60 * 1000)) / (60 * 1000));
        return {hours: h, minutes: m};
    }

    function renderElapsedTime() {
        let elapsed_span_tags = document.querySelectorAll(".elapsed-time");
        let now = new Date().getTime();
        elapsed_span_tags.forEach(ele => {
            let evnt_time = ele.getAttribute("evnt-time");
            let time = calculateElapsedTime(evnt_time, now);
            let time_format = "";
            if (time.hours > 0)
                time_format += time.hours + "h "
            time_format += time.minutes + "m"
            ele.innerHTML = time_format;
        });
    }

    function renderOperatingRate() {
        let parameter = {'url': '/Alarm/paramQueryGridSelect', 'data': {queryId: 'alarmMapper.selectWorkingStatus', ARM_CD: '${ARM_CD}'}};
        fnPostAjax(function (data) {
            app.op_status = data.data;
        }, parameter, '');
    }

    function renderDefectiveRate() {
        let parameter = {'url': '/Alarm/paramQueryGridSelect', 'data': {queryId: 'alarmMapper.selectDefectiveStatus', ARM_CD: '${ARM_CD}'}};
        fnPostAjax(function (data) {
            app.def_status = data.data;
        }, parameter, '');
    }

    let ncStopAlarmListGridID = $("#ncStopAlarmListGrid");
    let ncStopAlarmListModel = [
        {title: '알람번호', dataIndx: 'ALARM_SEQ', hidden: true},
        {title: 'No.', minWidth: 30, width: 30,
            dataType: 'integer', dataIndx: 'ROW_NUM',
            styleHead: {'font-weight': 'bold','background':'#1A237E', 'color': '#FFFFFF'}},
        {title: '장비명', minWidth: 30, width: 120, dataIndx: 'EQUIP_NM',
            styleHead: {'font-weight': 'bold','background':'#1A237E', 'color': '#FFFFFF'}},
        {title: '장비seq', minWidth: 30, width: 120, dataIndx: 'EQUIP_SEQ', hidden: true},
        {title: '작업자', minWidth: 30, width: 200, dataIndx: 'WORK_USER_ID',
            styleHead: {'font-weight': 'bold','background':'#1A237E', 'color': '#FFFFFF'}},
        {title: '경과시간', minWidth: 30, width: 150,
            dataType: 'integer', dataIndx: 'EVENT_TIME',
            styleHead: {'font-weight': 'bold','background':'#1A237E', 'color': '#FFFFFF'},
            render: function (ui) {
                let evnt_time = ui.rowData.EVENT_TIME;
                let now = new Date().getTime();
                let timeDiff = now - evnt_time;
                let h = Math.floor(timeDiff / (60 * 60 * 1000));
                let m = Math.floor((timeDiff % (60 * 60 * 1000)) / (60 * 1000));
                let time = "";
                if (h > 0)
                    time += h + "h "
                time += m + "m"
                return "<span class='elapsed-time' evnt-time='"+evnt_time+"'>"+time+"</span>";

            }
        }
    ];
    let paramQueryGridSize = 350;
    if (matchMedia("screen and (min-width: 3440px)").matches) {
        paramQueryGridSize = 800;
    }
    let ncStopAlarmListObj = {
        height: paramQueryGridSize, collapsible: false, resizable: false, selectionModel: { type: 'row', mode: 'single'} ,
        showTitle: false, rowHtHead: 15, strNoRows: g_noData, numberCell: {show: false}, scrollModel: {autoFit: true}, trackModel: {on: true},
        columnTemplate: {align: 'center', halign: 'center', hvalign: 'center', valign: 'center',  editable: false},
        colModel: ncStopAlarmListModel, toolbar: false,
        dataModel: {
            location: 'remote', dataType: 'json', method: 'POST', url: '/Alarm/paramQueryGridSelect',
            postData: {queryId: 'alarmMapper.selectAlarmList', ARM_CD: '${ARM_CD}'},
            recIndx: 'ROW_NUM',
            getData: function (dataJSON) {
                let data = dataJSON.data;
                if (data.length > 0) {
                    app.cur_stop = data[0];
                } else {
                    app.cur_stop = {};
                }
                $('#ALARM_STOP_RECORDS').html(data.length);
                return {data: data || []};
            }
        },
        //rowInit can be used to conditionally apply HTML attributes, css styles, css classes, etc to rows.
        rowInit: function (ui) {
            if (ui.rowIndx == 0) {
                return {
                    style: { "background": "#FFEE58" } //can also return attr (for attributes) and cls (for css classes) properties.
                };
            }
        }
    };
    function stopAlarm(grid, stopAlarmData) {
        let parameter = {'url': '/Alarm/stopAlarmData', 'data': {data: JSON.stringify(stopAlarmData)}};
        fnPostAjax(function (data) {
            grid.pqGrid('refreshDataAndView');
        }, parameter, '');
    }

    function handleStopAlarm(grid, stopAlarmData) {
        let parameter = {'url': '/Alarm/handleStopAlarm', 'data': {data: JSON.stringify(stopAlarmData)}};
        fnPostAjax(function (data) {
            grid.pqGrid('refreshDataAndView');
            // location.reload();
        }, parameter, '');
    }


    function socketConnect(){
        let socket = new SockJS('/jmes-ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, (frame) => {
            stompClient.subscribe('/topic/notice', function (notificationMessage) { // 장비if
                let messageData = JSON.parse(notificationMessage.body);
                let equipList = [];
                if(messageData.list.length > 0) {
                    $.each(messageData.list, function (idx, Item) {
                        let status = Item.ACTIVE_TYPE; // PGM_STOP, PGM_ACTIVE
                        if (status == "PGM_STOP") { // 한글이 네트워크 탈 때는 변수가 많으니까, 보내지는 데이터 쿼리를 수정해서 active_type 자체를 받아오자
                            // stop 알람 보여주기
                            stopAlarm(ncStopAlarmListGridID, Item);
                        } else if (status == "PGM_ACTIVE") {
                            // stop 알람 리스트에서 해당 알림 제거
                            handleStopAlarm(ncStopAlarmListGridID, Item)
                        }
                        // ???
                        // another 고려사항 -> 작업자가 다시 작업 재개가 아닌, 작업종료 버튼을 눌러도 stop 알람 리스트에서 해당 알림 제거되어야 한다.

                        equipList.push(Item.EQUIP_SEQ);
                    })
                }
            });
        });
    }

    $(function() {
        ncStopAlarmListGridID.pqGrid(ncStopAlarmListObj);
        socketConnect();
        renderDefectiveRate();
        renderOperatingRate();

        setInterval(()=>{curTimeSlot.innerHTML = printTime()}, 1000);
        setInterval(blinking, 800, curOperatingRateRow, 'lime', 'accent-1');
        setInterval(blinking, 800, curDefectiveRateRow, 'lime', 'accent-1');
        setInterval(renderElapsedTime, 1000 * 60);
        setInterval(renderDefectiveRate, 1000 * 60 * 5); // 5분에 1회
        setInterval(renderOperatingRate, 1000 * 60 * 5); // 5분에 1회

    });
</script>
</body>
</html>