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
            $(".updateVote").on("click",function(){
                $(".endDate input").attr("name","endDate")
                $("form").attr("action","/club/updateVote").attr("method","post").submit();
            })


            $(".endDate input").datetimepicker()
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
        <input type="hidden" name="roomId" value="${vote.roomId}">
        <input type="hidden" name="voteNum" value="${vote.voteNum}">
        voteTitle : <input type="text" name="voteTitle" value="${vote.voteTitle}"><br>
        voteText : <input type="text" name="voteText" value="${vote.voteText}"><br>
        multiVoteCheck : <input type="checkbox" ${vote.multiVoteCheck=='1'?'checked':''} name="multiVoteCheck" value="1"><br>
        hideVoteCheck : <input type="checkbox" ${vote.hideVoteCheck=='1'?'checked':''} name="hideVoteCheck" value="1"><br>
        endDateCheck : <input type="checkbox" ${vote.endDateCheck=='1'?'checked':''} name="endDateCheck" value="1"><br>

        <span class="endDate"><c:if test="${!empty vote.endDate}"><input type='text'value="${vote.endDate}"><br>
        </c:if></span>
        voteItem1 : <input type="text" ${empty vote.voteItem1?'':'name="voteItem1"'} class="voteItem" id="voteItem1" value="${vote.voteItem1}"><br>
        voteItem2 : <input type="text" ${empty vote.voteItem2?'':'name="voteItem2"'} class="voteItem" id="voteItem2" value="${vote.voteItem2}"><br>
        voteItem3 : <input type="text" ${empty vote.voteItem3?'':'name="voteItem3"'} class="voteItem" id="voteItem3" value="${vote.voteItem3}"><br>
        voteItem4 : <input type="text" ${empty vote.voteItem4?'':'name="voteItem4"'} class="voteItem" id="voteItem4" value="${vote.voteItem4}"><br>
        voteItem5 : <input type="text" ${empty vote.voteItem5?'':'name="voteItem5"'} class="voteItem" id="voteItem5" value="${vote.voteItem5}"><br>
        <input type="button" class="updateVote" value="투표 수정">
    </label>
</form>
</body>
</html>
