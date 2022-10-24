$(function(){

    // const clubNum = $(".clubNum").val()
    // $(".back-btn").on('click',function(){
    //     location.href = "/club/listCluber/"+clubNum
    // })

    //승인 거절
    $("input[type='button']").on("click",function(){
        // alert($(this).attr("class"))
        var result = $(this).attr("name");
        // alert($(this).parents(".cluber").children("[name='clubUserNum']").val())
        var clubUserNum = $(this).parents(".cardBox").children("[name='clubUserNum']").val();
        var clubNum = $(this).parents(".cardBox").children("[name='clubNum']").val();
        var userId = $(this).parents(".cardBox").children("[name='userId']").val();
        var div = $(this).parents(".cardBox");
        $.ajax({
            url : "/club/json/processCluberApply",
            method : "POST",
            data : JSON.stringify({
                "result" : result,
                "clubUserNum" : clubUserNum,
                "clubNum" : clubNum,
                "userId" : userId
            }),
            dataType : "JSON",
            headers:{
                "Accept":"application/json",
                "Content-Type":"application/json; charset=UTF-8"
            },
            success: function () {
                // alert("ajax")
                if(result==='accept'){
                    alert('승인되었습니다!')
                }else {
                    alert('거절되었습니다!')
                }

                div.remove()

                if($(".cardbox").length===0){
                    $('.cluberList').html('<div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">가입 신청자가 없습니다!</div>')
                }
            },
            error: function(){
                alert('다시 시도해 주세요')
            }
        })
    })

    /*//자기소개 조회
    $(".cluberData").on("click",function(){
        var clubUserNum = $(this).parents(".cardBox").children("[name='clubUserNum']").val();
        var div = $(this).parents(".cardBox").find(".cluberText");
        $.ajax({
            url : "/club/json/getCluberApply",
            method : "POST",
            data : JSON.stringify({
                "clubUserNum" : clubUserNum
            }),
            dataType : "JSON",
            headers:{
                "Accept":"application/json",
                "Content-Type":"application/json; charset=UTF-8"
            },
            success: function (map) {
                // alert(map.cluberText)
                div.html("<h4>"+map.cluberText+"</h4>")
            }
        })
    })*/

})