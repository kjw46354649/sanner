<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<section class="contents">
    <div class="logWrap">
        <form action="/main" method="POST">
<%--        <form action="/jmes" method="POST">--%>
            <ul>
                <li><label for="userID">Username</label><input type="text" name="userId" id="userId" placeholder="Enter Username" title="Enter Username">
                </li>
                <li><label for="userPassword">Password</label><input type="password" name="userPassword" id="userPassword" placeholder="Enter Password" title="Enter Password"></li>
                <li><label for="languageSltd">Language</label>
                    <select id="languageSltd" name="languageSltd" title="언어선택">
                        <option value="" selected="selected">언어선택</option>
                        <option value="1">한국어</option>
                        <option value="2">영어</option>
                    </select>
                </li>
                <li><span class="chk_box"><input id="idsave" type="checkbox"><label for="idsave">Remember Me</label></span></li>
            </ul>
            <div class="btn"><button type="submit">login</button></div>
        </form>
    </div>
</section>