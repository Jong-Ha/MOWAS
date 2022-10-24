$(function(){
    $(".addClubBlacklist").on("click",function(){
        $("form").attr("action","/club/addClubBlacklist").attr("method","post").submit();
    })
})