$(function () {
    $(".back-btn").html(' ')

    const clubNum = $("#clubNum").val()

    $(".listCluberApply").on("click", function () {
        location.href = "/club/listCluberApply/"+clubNum
    })
    $(".addClubBlacklist").on("click", function () {
        location.href = "/club/addClubBlacklist/"+clubNum
    })
    $(".listClubBlacklist").on("click", function () {
        location.href = "/club/listClubBlacklist/"+clubNum
    })
    $(".listCluberOut").on("click", function () {
        location.href = "/club/listCluberOut/"+clubNum
    })
    $(".listCluber").on("click", function () {
        location.href = "/club/listCluber/"+clubNum
    })
    $(".paging").on("click", function(){
        $("form").attr("action","/club/listCluberOut/"+clubNum).attr("method","post").submit()
    })
    $(".cardBox").on('click',function(){
        var clubUserNum = $(this).children(".clubUserNum").val();
        location.href = "/club/getCluber/"+clubUserNum
    })
})