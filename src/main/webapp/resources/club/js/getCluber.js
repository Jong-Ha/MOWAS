$(function () {
    const clubUserNum = $("#clubUserNum").val()

    const clubNum = $("#clubNum").val()
    const cluberStatus = $("#cluberStatus").val()
    if(cluberStatus==='7'||cluberStatus==='8'){
        $(".back-btn").off('click').on('click',function(){
            location.href = "/club/listCluberOut/"+clubNum
        })
    }

    $(".updateCluber").on("click",function(){
        location.href="/club/updateCluber/"+clubUserNum
    })
    $(".updateClubMaster").on("click",function(){
        location.href="/club/updateClubMaster/"+clubUserNum
    })
    $(".addClubManager").on("click",function(){
        location.href="/club/addClubManager/"+clubUserNum
    })
    $(".deleteClubManager").on("click",function(){
        location.href="/club/deleteClubManager/"+clubUserNum
    })
    $(".deleteCluber").on("click",function(){
        location.href="/club/deleteCluber/T?clubUserNum="+clubUserNum
    })
})