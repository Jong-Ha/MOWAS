<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>getCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            //투표하기
            /*$(".addVoter").on("click",function(){
                var voterItems = [];
                $.each($('[name="voteItem"]'),function(index, item){
                    if($(item).prop('checked')===true){
                        voterItems.push($(item).val())
                    }
                })
                console.log(voterItems)
                var userId = '${user.userId}'
                var voteNum = ${vote.voteNum}
                var data = JSON.stringify({
                    voterItems : voterItems,
                    userId : userId,
                    voteNum : voteNum
                })
                console.log(data)
                $.ajax({
                    url : "/club/json/addVoter",
                    method : "POST",
                    data : data,
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function () {
                        alert("ajax")
                    }
                })
            })*/

            //누가 투표를 했는지 보자고
            $(".listVoter").on("mouseover",function(){
                // alert($(this).attr("id"))
                var voteItem = $(this).attr("id")
                var voteNum = ${vote.voteNum}
                $.ajax({
                    url : "/club/json/listVoter",
                    method : "POST",
                    data : JSON.stringify({
                        voteItem: voteItem,
                        voteNum: voteNum
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function (json) {
                        console.log(json)
                    }
                })
            })

            // $(".addVoter").on("click",function(){
            //     $("form").attr("action","/club/addVoter").attr("method","post").submit()
            // })
            $(".updateVoter").on("click",function(){
                $("form").attr("action","/club/updateVoter").attr("method","post").submit()
            })
            $(".updateVoterCheck").on("click",function(){
                $('[name="voteItem"]').prop("disabled",false)
            })
            $(".endVote").on("click",function(){
                location.href="/club/endVote/${voteNum}"
            })


            $(".updateVote").on("click",function(){
                location.href="/club/updateVote/${voteNum}"
            })
            $(".deleteVote").on("click",function(){
                location.href="/club/deleteVote/${vote.roomId}/${voteNum}"
            })
            $(".listVote").on("click",function(){
                <%--location.href="/club/listVote/${roomId}"--%>
                location.href="/club/listVote/${vote.roomId}"
            })
        })
    </script>
</head>
<body>
${vote}<br><br>
<form>
    <input type="hidden" name="voteNum" value="${vote.voteNum}">
    <c:if test="${!empty vote.voteItem1}">
        <label>
            <input type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}" name="voteItem" ${vote.myVoter1==1?'checked':''} value="${vote.voteItem1}">
        </label>${vote.voteItem1} : <span class="listVoter" id="${vote.voteItem1}">${vote.voter1}</span><br>
    </c:if>
    <c:if test="${!empty vote.voteItem2}">
        <label>
            <input type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}" name="voteItem" ${vote.myVoter2==1?'checked':''} value="${vote.voteItem2}">
        </label>${vote.voteItem2} : <span class="listVoter" id="${vote.voteItem2}">${vote.voter2}</span><br>
    </c:if>
    <c:if test="${!empty vote.voteItem3}">
        <label>
            <input type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}" name="voteItem" ${vote.myVoter3==1?'checked':''} value="${vote.voteItem3}">
        </label>${vote.voteItem3} : <span class="listVoter" id="${vote.voteItem3}">${vote.voter3}</span><br>
    </c:if>
    <c:if test="${!empty vote.voteItem4}">
        <label>
            <input type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}" name="voteItem" ${vote.myVoter4==1?'checked':''} value="${vote.voteItem4}">
        </label>${vote.voteItem4} : <span class="listVoter" id="${vote.voteItem4}">${vote.voter4}</span><br>
    </c:if>
    <c:if test="${!empty vote.voteItem5}">
        <label>
            <input type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}" name="voteItem" ${vote.myVoter5==1?'checked':''} value="${vote.voteItem5}">
        </label>${vote.voteItem5} : <span class="listVoter" id="${vote.voteItem5}">${vote.voter5}</span><br>
    </c:if>
</form>
${vote.endDate}<br><br>
<input type="button" class="updateVoter" value="투표 하기">
<input type="button" class="updateVoterCheck" value="다시 투표 하기">
<input type="button" class="updateVote" value="투표 수정">
<input type="button" class="endVote" value="투표 마감">
<input type="button" class="deleteVote" value="투표 삭제">
<input type="button" class="listVote" value="투표 목록">
<script>
    $(function(){
        $('[name="voteItem"]').prop("disabled",${vote.voterCheck==1?'true':'false'})
        if(${vote.endCheck==1}){
            $('[name="voteItem"]').parent().remove("*");
        }
    })
</script>
</body>
</html>
