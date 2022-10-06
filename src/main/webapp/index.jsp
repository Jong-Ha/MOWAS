<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="resources/css/main.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <noscript><link rel="stylesheet" href="resources/css/noscript.css"/></noscript>


    <script type="text/javascript">
        $(function (){
            $(".commu").on("click",
                function (){
                location.href="/commu/"
            });

        });

    </script>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="logo">
            <span class="icon fa-gem"></span>
        </div>
        <div class="content">
            <div class="inner">

                <h1>MO 이러 WAS</h1>
                <p>모이고 싶고 거래 하고 싶다</p>
            </div>
        </div>
        <nav>
            <ul>
                <li><a href="">로그인</a></li>
                <li><a href="">모임 관리</a></li>
                <li><a class="commu">커뮤니티</a></li>
                <li><a href="/deal/getListDeal">중고 거래</a></li>
                <li><a href="">공지 사항</a></li>
                <!--<li><a href="#elements">Elements</a></li>-->
            </ul>
        </nav>
    </header>


    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
    </footer>

</div>

<!-- BG -->
<div id="bg">


</div>

<!-- Scripts -->
<script src="resources/OpenSource/js/jquery.min.js"></script>
<script src="resources/OpenSource/js/browser.min.js"></script>
<script src="resources/OpenSource/js/breakpoints.min.js"></script>
<script src="resources/OpenSource/js/util.js"></script>
<script src="resources/OpenSource/js/main.js"></script>

</body>
</html>
