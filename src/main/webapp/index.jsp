<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <noscript>
        <link rel="stylesheet" href="resources/css/noscript.css"/>
    </noscript>
    <script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>


    <script type="text/javascript">
        $(function () {
            $(".commu").on("click",
                function () {
                    location.href = "/clubCal/listCalenderReview?boardCategory=" + 1 + "&reviewRange=" + 1
                });

            $(".clubToolBar").on("click",
                function () {
                    location.href = '/club/listClub'
                });
        });

        $(function () {
            $(".site").on("click", function () {
                $(self.location).attr("href", "site/listMasterBoard");
            })
        })

    </script>

    <style>
        video {
            width: 100%;
        }

        .jb-box {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin-top: -85px;
            position: absolute;
            opacity : 0.3;
        }
        li{
            cursor: pointer;
        }
    </style>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper" style="position: absolute;">

    <div class="jb-box">

       <video muted autoplay loop>
               <source src="/resources/images/main_video.mp4" type="video/mp4">
       </video>

    </div>

    <!-- Header -->
    <header id="header">
        <div class="logo">
                 <img src="/resources/images/MOWAS_main_2.png" style="width: 100%;">

        </div>
        <div class="content">
            <div class="inner">

                <h1>MOWAS</h1>
                <p>????????? ?????? ?????? ?????? ??????</p>
            </div>
        </div>
        <nav>
            <ul>
                <li><a class="clubToolBar">?????? ?????????</a></li>
                <li><a class="commu">????????????</a></li>
                <li><a href="/deal/getListDeal?boardCategory=99">????????????</a></li>
                <li><a class="site">????????????</a></li>
                <!--<li><a href="#elements">Elements</a></li>-->
            </ul>
        </nav>
    </header>


    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">&copy; Untitled. Made in : <a href="https://www.bitcamp.co.kr/">BITCAMP</a>.</p>
    </footer>


</div>

<!-- Scripts -->
<script src="resources/OpenSource/js/jquery.min.js"></script>
<script src="resources/OpenSource/js/browser.min.js"></script>
<script src="resources/OpenSource/js/breakpoints.min.js"></script>
<script src="resources/OpenSource/js/util.js"></script>
<script src="resources/OpenSource/js/main.js"></script>

</body>
</html>
