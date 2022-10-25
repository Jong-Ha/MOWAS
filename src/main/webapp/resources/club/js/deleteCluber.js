$(function(){
    $(".deleteCluber").on("click",function(){
        $("form").attr("action","/club/deleteCluber").attr("method","post").submit();
    })
})