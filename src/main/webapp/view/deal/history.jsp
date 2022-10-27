<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-26
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>이건바뀌나욜 ?></title>
</head>
<script type="text/javascript">
    console.log(document.cookie);
    // $("li").each(function (){
    //     $(this).bind("click",function (){
    //         document,location
    //                 })
    // })
</script>
<style>
    #rightSide{position: absolute;top: 547px;left: 50%;margin: 0 0 0 510px;	}
    #rightSide #right_zzim {

        position: fixed;
        top: 400px;
        left: 63%;
        margin-left: 550px;
        border: 1px solid #B0B5BD;
        width: 114px;
        height: 543px;
    }

    #rightSide #right_zzim div {text-align:center;}
    #rightSide #right_zzim div.recTit{line-height:1.5em;padding:5px;color:black;background-color:#f8cd07b3;}
    #right_zzim #recentCnt {color:yellow;}
    #rightSide #right_zzim ul {min-height:495px;}
    #rightSide #right_zzim li{text-align:center;padding:5px;position:relative;}
    #rightSide #right_zzim ul li img {border:1px solid #ccc}
    #right_zzim .detail {
        display: none;position:
            absolute;top: 3px;right: 20px;xheight: 40px;
        xpadding: 15px 11px 0;
        xbackground: #404a59;color: #fff;
        xtext-align: left;white-space: nowrap;}
    #right_zzim li:hover .detail {
        display:block}
    /*#right_zzim li .btn_delete {*/
    /*    position: absolute;top: 3px;*/
    /*    right: -1px;width: 11px;height: 11px;*/
    /*    background: url(/img/sp.png) no-repeat -193px -111px;text-indent: -9000px;*/
    /*}*/
    /*#right_zzim #currentPage {*/
    /*    olor:#505A69;font-weight:bold*/
    /*}*/
    /*#right_zzim #totalPageCount {*/
    /*    color:#CBC8D2;font-weight:bold}*/
    /*.noData {*/
    /*    color:#ccc;text-align:center;margin-top:223px;*/
    /*}*/

    /*#paging {*/
    /*    display:;position:relative;line-height:1em;*/
    /*}*/
    /*#paging .btn_prev {*/
    /*    position: absolute;top: 526px;left: 4px;width: 13px;height: 11px;background: url(/images/ico_arrow.png)*/
    /*no-repeat ;text-indent: -9000px;border:1px solid #CCC;display:inline-block;*/
    /*}*/
    /*#paging .btn_next {*/
    /*    position: absolute;top: 526px;right: 4px;width: 13px;height: 11px;background: url(/images/ico_arrow.png) -11px 0px;text-indent: -9000px;border:1px solid #CCC;display:inline-block;*/
    /*}*/
</style>
<body>

<div id="rightSide">
    <div id="right_zzim">

        <div class="recTit">최근본상품 <span id=recentCnt></span></div>
        <ul>
            <c:forEach items="${listcook}" var="a">
                <c:if test="${listcook==null}">
                    최근본 상품이 없습니다.
                </c:if>
        <li>${a}</li>

            </c:forEach>
        </ul> <!-- 본 상품이 뿌려질 부분-->
<%--        <div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a><span id="currentPage"></span>--%>
<%--            <span id="totalPageCount"></span>--%>
<%--            <a class="btn_next" style="cursor:pointer" >다음</a>--%>
        </div>
    </div>
</div>


</body>
</html>
