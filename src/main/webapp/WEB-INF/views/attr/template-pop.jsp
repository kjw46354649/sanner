<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES - Login and Register HTML5 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <!-- External CSS libraries -->
    <link type="text/css" rel="stylesheet" href="/resource/login/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/resource/login/fonts/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/resource/login/fonts/flaticon/font/flaticon.css">
    <!-- Favicon icon -->
    <link rel="shortcut icon" href="/resource/login/img/favicon.ico" type="image/x-icon" >
    <!-- Google fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPoppins:400,500,700,800,900%7CRoboto:100,300,400,400i,500,700">
    <!-- Custom Stylesheet -->
    <link type="text/css" rel="stylesheet" href="/resource/login/css/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="/resource/login/css/skins/default.css">
</head>
<body id="top">
<!-- Login 10 start -->
<div class="login-10">
    <div class="container-fluid">
        <div class="row">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>
</div>
<!-- Login 10 end -->

<!-- External JS libraries -->
<script src="/resource/login/js/jquery-2.2.0.min.js"></script>
<script src="/resource/login/js/popper.min.js"></script>
<script src="/resource/login/js/bootstrap.min.js"></script>
<!-- Custom JS Script -->

</body>
</html>
