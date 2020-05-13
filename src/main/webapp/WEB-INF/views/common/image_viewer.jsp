<%--
  Created by IntelliJ IDEA.
  User: hyoun
  Date: 2020-04-08
  Time: 오후 8:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <title>J-MES IMAGE VIEWER</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <!-- External CSS libraries -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="/resource/plugins/viewerjs/dist/viewer.css">
    <!-- Custom Stylesheet -->
    <link type="text/css" rel="stylesheet" href="/resource/login/css/style.css">
    <link type="text/css" rel="stylesheet" href="/resource/login/css/skins/default.css">
</head>
<body class="home" style="background-color: #797979">
<div class="demo-gallery">
    <input type="hidden" id="image_seq" name="image_seq" value="">
    <input type="button" id="dynamic" name="dynamic" style="display: none">
</div>
<!-- External JS libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- A jQuery plugin that adds cross-browser mouse wheel support. (Optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>

<!-- lightgallery js -->
<script src="/resource/plugins/viewerjs/dist/viewer.js"></script>
<script type="text/javascript">

    // window.addEventListener('DOMContentLoaded', function () {
    //     $('#dynamic').on('click', function(e) {
    //         let image = new Image();
    //         image.src = "/image/" + $("#image_seq").val();
    //         let viewer = new Viewer(image, {
    //             hidden: function () {
    //                 viewer.destroy();
    //             },
    //         });
    //         viewer.show();
    //     });
    // });

    let $viewer;

    $(document).ready(function() {
        $('#dynamic').on('click', function(e) {
            let image = new Image();
            image.src = "/image/" + $("#image_seq").val();
            $viewer = new Viewer(image, {
                backdrop: false,
                navbar: false,
                viewed: function () {
                    this.viewer.zoomTo(0.39).rotateTo(-90);
                },
                toolbar: {
                    zoomIn: 4,
                    zoomOut: 4,
                    oneToOne: 4,
                    reset: 4,
                    prev: false,
                    play: {
                        show: false,
                    },
                    next: false,
                    rotateLeft: 4,
                    rotateRight: 4,
                    flipHorizontal: 4,
                    flipVertical: 4,
                },
                hidden: function () {
                    $viewer.destroy();
                },
            });
            $viewer.show();
        });
    });

    function onImageViewStart(){
        if($viewer) $viewer.destroy();
        $('#dynamic').trigger("click");
    };

</script>
</body>
</html>