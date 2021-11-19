<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="contents">
    <div class="logWrap">
        <form action="/main" id="login-form" name="login-form" class="login-form" method="POST">
            <ul>
                <li><label for="userID" class="${LocalInfo}"><srping:message key="index.frm.login.idText"/></label>
                    <input type="text" name="userId" id="userId" placeholder="Enter UserID" data-validation-engine="validate[required]"
                           data-errormessage-value-missing="사용자 아이디는 필수 입력 입니다." >
                </li>
                <li><label for="userPassword" class="${LocalInfo}"><srping:message key="index.frm.login.pwdText"/></label>
                    <input type="password" name="userPassword" id="userPassword" placeholder="Enter Password" data-validation-engine="validate[required]"
                        data-errormessage-value-missing="패스워드는 필수 입력 입니다." >
                </li>
                <li>
                    <label for="locale" class="${LocalInfo}"><srping:message key="index.locale.language"/></label>
                    <select id="locale" name="locale">
                        <c:forEach var="vlocale" items="${HighCode.H_1082}">
                            <option value="${vlocale.CODE_CD}" <c:if test="${LocalInfo eq vlocale.CODE_CD}"> selected="selected"</c:if>>${vlocale.CODE_NM_KR}</option>
                        </c:forEach>
                    </select>
                </li>
                <li><span class="chk_box"><input id="idsave" type="checkbox"><label for="idsave"><srping:message key="index.frm.login.rememberMe"/></label></span></li>
            </ul>
        </form>
        <div class="btn">
            <button type="text" id="login_chekc_btn" class="defaultBtn radius" >LOGIN</button>
        </div>
        <form action="/change-locale" id="locale-form" name="locale-form" method="get">
            <input type="hidden" name="lang" id="lang" value="">
        </form>
    </div>
</section>
<script type="text/javascript">

    var waitMeContainer;
    var $loginChekcBtn = $("#login_chekc_btn");

    $(document).ready(function(){
        $("#login-form").validationEngine();

        function getByteLength(s) {

            if (s == null || s.length == 0) {
                return 0;
            }
            var size = 0;

            for ( var i = 0; i < s.length; i++) {
                size += charByteSize(s.charAt(i));
            }

            return size;
        };

        function charByteSize(ch) {

            if (ch == null || ch.length == 0) {
                return 0;
            }

            var charCode = ch.charCodeAt(0);

            if (charCode <= 0x00007F) {
                return 1;
            } else if (charCode <= 0x0007FF) {
                return 2;
            } else if (charCode <= 0x00FFFF) {
                return 3;
            } else {
                return 4;
            }
        }

        $loginChekcBtn.click(function(e){
            e.preventDefault();
            if($("#login-form").validationEngine('validate') == false){
               return false;
            }
            saveStorage();
            $.ajax({
                type: "POST", dataType: "json", url: "/userLogin", data: $('#login-form').serialize(),
                success: function(data){
                    try{
                        // console.log(data);
                        if(data.result == "error"){
                            fnAlert(null, data.message);
                            $('#userPassword').val("");
                            return false;
                        }else{
                            let date = new Date();
                            var dateStr = date.getFullYear() + '-' + ('00'+(date.getMonth()+1)).substr(-2) + '-' + ('00'+date.getDate()).substr(-2) + ' ' + ('00'+date.getHours()).substr(-2) + ':' + ('00'+date.getMinutes()).substr(-2)  + ':' +('00'+date.getSeconds()).substr(-2) + '.' + date.getMilliseconds();
                            let logParam = {
                                'crtfcKey':'$5$API$X1KoDEUj3kPHqU9JwaEEFE0u.GjI/1uSvIR2A304FbC',
                                'logDt':dateStr,
                                'useSe':'접속',
                                'sysUser':$("#userId").val(),
                                'conectIp':data.ipAddress,
                                'dataUsgqty':getByteLength($('#login-form').serialize())
                            }
                            console.log(logParam)
                            $.ajax({
                                type: "POST", dataType: "json", url: "https://log.smart-factory.kr/apisvc/sendLogData.json", data: logParam,
                                success: function(data){
                                    console.log(data);
                                },
                                error: function(xhr, status, error){
                                    alert(error);
                                    return false;
                                }
                            });
                            document.getElementById('login-form').submit();
                        }
                    }catch(exception){
                        alert(exception.message);
                        return false;
                    }
                },
                error: function(xhr, status, error){
                    alert(error);
                    return false;
                }
            });
        });

        $('#userPassword').keydown(function(event) {
            if(event.keyCode == '13') {
                // $("#login-form").validationEngine();
                $loginChekcBtn.trigger("click");
            }
        });
    });

    $('#locale').change(function(){
        $("#locale-form").find("#lang").val($(this).val());
        document.getElementById('locale-form').submit();
    });

    function saveStorage() {
        // 태그에서 id를 가진 객체 찾아오기
        var saveId = $("input:checkbox[id='idsave']").is(":checked");
        var userId = $("#userId").val();

        // saveId에 체크 되어 있으면
        if (saveId) {
            // 로컬 스토리지에 저장
            window.localStorage.setItem("saveId", "Y");
            window.localStorage.setItem("userId", userId);
        } else {
            // 로컬 스토리지에서 삭제
            window.localStorage.removeItem("saveId");
            window.localStorage.removeItem("userId");
        }
    }

    function loadStorage() {
        var saveId = window.localStorage.getItem("saveId");
        var userId = window.localStorage.getItem("userId");

        if (saveId == "Y") {
            $("input:checkbox[id='idsave']").prop("checked", true);
            $("#userId").val(userId);
        }
    }

/**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button or closes the dialog.
     *
     * fnAlert(null,"<h1>안녕하세요</h1>", function () {alert('확인 클릭')});
     *
     */
    const fnAlert = function (title, message, onok) {
        alertify.alert()
            .setting({
                'title': title,
                'message': message,
                'onok': onok,
                'movable': false,
                'transitionOff': true
            }).show();
    };

    /**
     * @title {String or DOMElement} The dialog title.
     * @message {String or DOMElement} The dialog contents.
     * @onok {Function} Invoked when the user clicks OK button.
     * @oncancel {Function} Invoked when the user clicks Cancel button or closes the dialog.
     * @autoOk {number} Automatically confirms the dialog after n seconds.
     *
     * fnConfirm(null, 'message', function() {alert('확인 클릭')}, function() {alert('취소 클릭')}, 5);
     *
     */
    const fnConfirm = function (title, message, onok, oncancel, autoOk) {
        if (autoOk == undefined || autoOk == null) {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show();
        } else {
            alertify.confirm()
                .setting({
                    'title': title,
                    'message': message,
                    'onok': onok,
                    'oncancel': oncancel,
                    'movable': false,
                    'transitionOff': true
                }).show().autoOk(autoOk);
        }
    };

    loadStorage();

</script>