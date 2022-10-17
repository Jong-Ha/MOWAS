<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addCluberApply</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/jquery.datetimepicker.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/resources/OpenSource/js/jquery.datetimepicker.full.min.js"></script>
    <script>
        $(function(){
            $(".voteItem").on("change",function(){
                // alert($(this).val()==="")
                // var id = $(this).attr("id")
                if($(this).val()===""){
                    $(this).attr("name","")
                }else {
                    $(this).attr("name",$(this).attr("id"))
                }
                // alert($(this).attr("name"))
            })
            $(".addVote").on("click",function(){
                $(".endDate input").attr("name","endDate")
                $("form").attr("action","/club/addVote").attr("method","post").submit();
            })


            $('input[name="endDateCheck"]').on("click", function(){
                // console.log($(this).prop('checked'))
                if($(this).prop('checked')){
                    var picker = $("<input type='text'>")
                    picker.datetimepicker()
                    $(".endDate").html(picker).append("<br>")
                }else{
                    $(".endDate").html("")
                }
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="roomId" value="${roomId}">
        <input type="hidden" name="voteMasterId" value="${user.userId}">
        voteTitle : <input type="text" name="voteTitle" value=""><br>
        voteText : <input type="text" name="voteText" value=""><br>
        multiVoteCheck : <input type="checkbox" name="multiVoteCheck" value="1"><br>
        hideVoteCheck : <input type="checkbox" name="hideVoteCheck" value="1"><br>
        endDateCheck : <input type="checkbox" name="endDateCheck" value="1"><br>
        <span class="endDate"></span>
        voteItem1 : <input type="text" class="voteItem" id="voteItem1" value=""><br>
        voteItem2 : <input type="text" class="voteItem" id="voteItem2" value=""><br>
        voteItem3 : <input type="text" class="voteItem" id="voteItem3" value=""><br>
        voteItem4 : <input type="text" class="voteItem" id="voteItem4" value=""><br>
        voteItem5 : <input type="text" class="voteItem" id="voteItem5" value=""><br>
        <input type="button" class="addVote" value="투표 등록">
    </label>
</form>
</body>
</html>
