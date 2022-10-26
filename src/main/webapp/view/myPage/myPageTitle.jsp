<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-11
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    ul li{
        list-style:none;
    }
    .wap {
        display: flex;
        flex-direction: column;
        margin-top: 70px;
    }
    .wrapper{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .aaa{
        transition: 0.2s;
    }

    #userImage1{
        transition: all 0.2s linear;
    }

    #userImage1:hover {
        transform: scale(5);
    }
    .navbar {
        justify-content: center;
    }
    .navCenter {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 1200px;
        margin: auto;
        color: #fff;
    }

    .myPageBox {
        margin-bottom: 50px;
        justify-content: center;
    }
    .underline {
        line-height: 1.2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 1.5em;
        font-weight: 700;
        background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
        background-repeat: no-repeat;
        background-size: 0% 100%;
        transition: background-size 0.2s;
        color: #000;
        cursor: pointer;
        margin-right: 25px;
    }
    @media (min-width: 1000px) {
        .underline {
            font-size: 1.5em;
        }
    }

    .underline.yellow {
        background-image: linear-gradient(transparent 60%, #F8CD07 40%);
    }
    .underline:hover {
        background-size: 100% 100%;
    }
</style>

<head>

    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<body>

<header class="tool-bar con-min-width">
    <div class="con">
        <nav class="top-bar__menu-box-1">

        </nav>
    </div>
</header>
<button type="button" class="mainPage" id="mainPage">메인페이지</button>
<br>


<div class="wrapper">
    <div class="typing">
        <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            마이페이지</h4>
    </div>

    <nav class="navbar navbar-expand-lg myPageBox">




        <div>
            <div class="underline yellow calender">작성 게시글</div>
            <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
                <ul>
                    <li>내가 작성한 글</li>
                    <li>내가 작성한 댓글</li>
                    <li>좋아요한 게시글</li>
                    <li>좋아요한 댓글</li>

                </ul>
            </div>
        </div>

        <div>
            <div class="underline yellow clubCalenderReview">모임</div>
            <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>

                </ul>
            </div>
        </div>

        <div>
            <div class="underline yellow  clubCalenderReviewShort">거래</div>
            <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>

                </ul>
            </div>
        </div>

        <div>
            <div class="underline yellow villBoard">벌점/신고 </div>
            <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>

                </ul>
            </div>
        </div>



    </nav>
    <hr>
</div>

</body>
</html>
