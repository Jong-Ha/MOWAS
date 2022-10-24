$(function () {

    let cardCheck = true;
    const clubNum = $("#clubNum").val()
    //상태 변경
    $(".updateClubBlacklist").on("click", function () {
        var process = "F"
        if ($(this).val() == '등록') {
            process = "T";
        }
        let check = false;
        $.each($(".clubUserNum"), function(index, item){
            if($(item).prop('checked')){
                check = true
            }
        })
        if(check){
            $("form").attr("method", "post").attr("action", "/club/updateClubBlacklist/" + process).submit()
        }
    })

    //카드 선택
    $('.cardBox').on('click',function(){
        console.log(cardCheck)
        if(cardCheck){
            // console.log(1)
            $(this).find(".clubUserNum").prop('checked',!$(this).find(".clubUserNum").prop('checked'))
            // console.log(2)
            if($(this).find(".clubUserNum").prop('checked')){
                // console.log('t')
                $(this).css('background-color','#00ffff')
            }else {
                // console.log('f')
                $(this).css('background-color','')
            }
        }
    })

    //상세 조회
    // $(".getClubBlacklist").on("click", function () {
    //     cardCheck=false
    //     console.log(cardCheck)
    //     var clubUserNum = $(this).parents(".each").find("[name='clubUserNum']").val()
    //     var div = $(this).parents(".each").find(".blacklistText")
    //     var me = $(this)
    //     $.ajax({
    //         url: "/club/json/getClubBlacklist",
    //         method: "POST",
    //         data: JSON.stringify({
    //             "clubUserNum": clubUserNum
    //         }),
    //         dataType: "JSON",
    //         headers: {
    //             "Accept": "application/json",
    //             "Content-Type": "application/json; charset=UTF-8"
    //         },
    //         success: function (map) {
    //             // alert(map.blacklistText)
    //             div.html("<h4>" + map.blacklistText + "</h4>")
    //             me.html("간략히")
    //             me.off("click")
    //             me.on("click", function () {
    //                 cardCheck=false
    //                 if (me.html() === "간략히") {
    //                     me.html("자세히")
    //                 } else {
    //                     me.html("간략히")
    //                 }
    //                 div.toggle()
    //                 setTimeout(function(){
    //                     cardCheck = true
    //                 },100)
    //             })
    //         }
    //     })
    //     setTimeout(function(){
    //         cardCheck = true
    //     },100)
    // })


    $(".getClubBlacklist").on("click", function () {
        cardCheck=false
        if ($(this).html() === "간략히") {
            // console.log('??')
            $(this).html("자세히")
            $(this).parent().find('.blacklistText').css('white-space','nowrap')
        } else {
            // console.log('!!')
            $(this).html("간략히")
            $(this).parent().find('.blacklistText').css('white-space','normal')
        }
        setTimeout(function(){
            cardCheck = true
        },100)
    })

    //검색 조건
    $("#searchCondition").on("change", function () {
        fncListClubBlacklist(1)
    })

    //페이징
    $(".paging").on("click", function () {
        fncListClubBlacklist($(this).text())
    })

    //리스트 조회 function
    function fncListClubBlacklist(currentPage) {
        if (currentPage === 0) {
            currentPage = 1
        }
        $("#currentPage").val(currentPage)
        $("form").attr("action", "/club/listClubBlacklist/"+clubNum).attr("method", "post").submit()
    }
})