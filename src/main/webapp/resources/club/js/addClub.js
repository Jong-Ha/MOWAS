$(function(){
    $(".addClub").on("click",function(){
        $("form").attr("method","post").attr("action","/club/addClub").submit();
    })
})