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
    <link type="text/css" rel="stylesheet" href="/resource/login/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/resource/login/fonts/font-awesome/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="/resource/login/fonts/flaticon/font/flaticon.css">
    <!-- Favicon icon -->
    <link rel="shortcut icon" href="/resource/login/img/favicon.ico" type="image/x-icon" >
    <!-- Google fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPoppins:400,500,700,800,900%7CRoboto:100,300,400,400i,500,700">

    <!-- light gallery css -->
    <link type="text/css" rel="stylesheet" href="/resource/plugins/light_gallery/css/lightgallery.css" />
    <!-- Custom Stylesheet -->
    <link type="text/css" rel="stylesheet" href="/resource/login/css/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="/resource/login/css/skins/default.css">
</head>
<body class="home">
<div class="demo-gallery">
    <input type="hidden" id="image_seq" name="image_seq" value="https://sachinchoolur.github.io/lightGallery/static/img/1.jpg">
    <input type="button" id="dynamic" name="dynamic" style="display: none">
</div>
<!-- External JS libraries -->
<script src="/resource/login/js/jquery-2.2.0.min.js"></script>
<script src="/resource/login/js/popper.min.js"></script>
<script src="/resource/login/js/bootstrap.min.js"></script>
<!-- A jQuery plugin that adds cross-browser mouse wheel support. (Optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>

<!-- lightgallery js -->
<script src="/resource/plugins/light_gallery/js/lightgallery.min.js"></script>

<!-- lightgallery plugins -->
<script src="/resource/plugins/light_gallery/modules/lg-thumbnail.min.js"></script>
<script src="/resource/plugins/light_gallery/modules/lg-fullscreen.min.js"></script>
<!-- Custom JS Script -->
<script type="text/javascript">

    let $lg;

    $(document).ready(function() {
        $('#dynamic').on('click', function(e) {
            $lg = $(this).lightGallery({
                thumbnail: false,
                dynamic: true,
                escKey : false,
                closable : false,
                counter : false,
                dynamicEl: [{
                    src: "/image/" + $("#image_seq").val()
                }]
            });
            $lg.on('onCloseAfter.lg',function(el){
                console.log("onCloseAfter");
                window.close();
            });
        });

        /*$lg = $('#lightgallery').lightGallery(
            {
                mode      : 'slide',  // Type of transition between images. Either 'slide' or 'fade'.
                useCSS    : true,     // Whether to always use jQuery animation for transitions or as a fallback.
                cssEasing : 'ease',   // Value for CSS "transition-timing-function".
                easing    : 'linear', //'for jquery animation',//
                speed     : 600,      // Transition duration (in ms).
                addClass  : '',       // Add custom class for gallery.

                preload         : 1,    //number of preload slides. will exicute only after the current slide is fully loaded. ex:// you clicked on 4th image and if preload = 1 then 3rd slide and 5th slide will be loaded in the background after the 4th slide is fully loaded.. if preload is 2 then 2nd 3rd 5th 6th slides will be preloaded.. ... ...
                showAfterLoad   : true,  // Show Content once it is fully loaded.
                selector        : null,  // Custom selector property insted of just child.
                index           : false, // Allows to set which image/video should load when using dynamicEl.

                dynamic   : false, // Set to true to build a gallery based on the data from "dynamicEl" opt.
                dynamicEl : [],    // Array of objects (src, thumb, caption, desc, mobileSrc) for gallery els.

                thumbnail            : false,     // Whether to display a button to show thumbnails.
                showThumbByDefault   : false,    // Whether to display thumbnails by default..
                exThumbImage         : false,    // Name of a "data-" attribute containing the paths to thumbnails.
                animateThumb         : false,     // Enable thumbnail animation.
                currentPagerPosition : 'middle', // Position of selected thumbnail.
                thumbWidth           : 100,      // Width of each thumbnails
                thumbMargin          : 5,        // Spacing between each thumbnails

                controls         : true,  // Whether to display prev/next buttons.
                hideControlOnEnd : true, // If true, prev/next button will be hidden on first/last image.
                loop             : false, // Allows to go to the other end of the gallery at first/last img.
                auto             : false, // Enables slideshow mode.
                pause            : 4000,  // Delay (in ms) between transitions in slideshow mode.
                escKey           : true,  // Whether lightGallery should be closed when user presses "Esc".
                closable         : true,  //allows clicks on dimmer to close gallery

                counter      : false, // Shows total number of images and index number of current image.
                lang         : { allPhotos: 'All photos' }, // Text of labels.

                mobileSrc         : false, // If "data-responsive-src" attr. should be used for mobiles.
                mobileSrcMaxWidth : 640,   // Max screen resolution for alternative images to be loaded for.
                swipeThreshold    : 50,    // How far user must swipe for the next/prev image (in px).
                enableTouch       : true,  // Enables touch support
                enableDrag        : true,  // Enables desktop mouse drag support

                vimeoColor    : 'CCCCCC', // Vimeo video player theme color (hex color code).
                youtubePlayerParams: false, // See: https://developers.google.com/youtube/player_parameters
                videoAutoplay : true,     // Set to false to disable video autoplay option.
                videoMaxWidth : '855px',  // Limits video maximal width (in px).

                // Callbacks el = current plugin object
                onOpen        : function(el) {}, // Executes immediately after the gallery is loaded.
                onSlideBefore : function(el) {}, // Executes immediately before each transition.
                onSlideAfter  : function(el) {}, // Executes immediately after each transition.
                onSlideNext   : function(el) {}, // Executes immediately before each "Next" transition.
                onSlidePrev   : function(el) {}, // Executes immediately before each "Prev" transition.
                onBeforeClose : function(el) {}, // Executes immediately before the start of the close process.
                onCloseAfter  : function(el) {}, // Executes immediately once lightGallery is closed.

            }
        );*/
    });

    function onImageViewStart(){
        $('#dynamic').trigger("click");
    }

</script>
</body>
</html>