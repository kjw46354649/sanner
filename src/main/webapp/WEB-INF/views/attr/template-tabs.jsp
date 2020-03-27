<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body-default-script"/>
</head>
<body cz-shortcut-listen="true" class="header_is_fixed" >
    <section class="vbox">
        <header class="bg-white header header-md navbar navbar-fixed-top-xs box-shadow">
            <tiles:insertAttribute name="body-top"/>
        </header>
        <section>
            <div class="hbox stretch">
                <tiles:insertAttribute name="body-menu"/>
                <section id="content">
                    <div class="royal_tab" data-position="top" data-alignment="left" data-animation="slide">
                        <div class="tabs">
                            <ul id="royal_tab_more" class="fixedleft"></ul>
                        </div>
                        <div class="views"></div>
                    </div>
                </section>
            </div>
        </section>
    </section>
    <tiles:insertAttribute name="bottom"/>
</body>
</html>