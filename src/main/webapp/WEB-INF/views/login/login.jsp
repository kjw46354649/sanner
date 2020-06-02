<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<section class="contents">
    <div class="logWrap">
        <form action="/main" id="login-form" name="login-form" class="login-form" method="POST">
<%--        <form action="/jmes" method="POST">--%>
            <ul>
                <li><label for="userID">Username</label>
                    <input type="text" name="userId" id="userId" placeholder="Enter UserID" data-validation-engine="validate[required]"
                           data-errormessage-value-missing="사용자 아이디는 필수 입력 입니다." >
                </li>
                <li><label for="userPassword">Password</label>
                    <input type="password" name="userPassword" id="userPassword" placeholder="Enter Password" data-validation-engine="validate[required]"
                        data-errormessage-value-missing="패스워드는 필수 입력 입니다." ></li>
                <li><label for="languageSltd">Language</label>
                    <select id="languageSltd" name="languageSltd" title="언어선택">
                        <option value="" selected="selected">언어선택</option>
                        <option value="1">한국어</option>
                        <option value="2">영어</option>
                    </select>
                </li>
                <li><span class="chk_box"><input id="idsave" type="checkbox"><label for="idsave">Remember Me</label></span></li>
            </ul>
            <div class="btn">
                <button type="text" id="login_chekc_btn" class="defaultBtn radius" >LOGIN</button>
            </div>
        </form>
    </div>
</section>
<script type="text/javascript">

    var waitMeContainer;
    var $loginChekcBtn = $("#login_chekc_btn");

    $(document).ready(function(){
        $("#login-form").validationEngine();
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
                        console.log(data);
                        if(data.result == "error"){
                            alert(data.message);
                            $('#userPassword').val("");
                            return false;
                        }else{
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
                $("#login-form").validationEngine();
            }
        });
    });

    function saveStorage() {
        // 태그에서 id를 가진 객체 찾아오기
        var saveId = $("input:checkbox[id='idsave']").is(":checked");
        var userId = $("#userId").val();

        console.log(saveId);
        console.log(userId);

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

    loadStorage();

</script>