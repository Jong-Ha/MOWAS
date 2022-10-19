$(function(){
    // $(".updateClub").on("click",function(){
    //     location.href="/club/updateClub/"+$(".boardNum").val()
    // })
    $(".deleteClub").on("click",function(){
        var check = confirm("진짜 삭제?");
        if(check===true){
            location.href="/club/deleteClub/"+$(".boardNum").val()
        }
    })
    $(".listCluber").on("click",function(){
        window.open("/club/listCluber/"+$(".boardNum").val(), "popWin", "left=300,top=200,width=800,height=500")
    })
    $(".deleteCluber").on("click",function(){
        location.href="/club/deleteCluber/F?clubNum="+$(".boardNum").val()
    })
    $(".addCluberApply").on("click",function(){
        location.href="/club/addCluberApply/"+$(".boardNum").val()
    })
    $(".updateCluberApply").on("click",function(){
        location.href="/club/updateCluberApply/"+$(".boardNum").val()
    })
    $(".addClubMasterBoard").on("click",function(){
        location.href="/club/addClubMasterBoard/"+$(".boardNum").val()
    })
    $(".listVote").on("click",function(){
        location.href="/club/listVote/"+$(".boardNum").val()
    })

    //업데이트 tagify
    var clubTag = document.querySelector("#clubTag")
    var tagify = new Tagify(clubTag, {
        dropdown: {
            position: "input",
            enabled: 0 // always opens dropdown when input gets focus
        }
    })

    let items = []

    $.each($(".tagList"), function(index, item){
        // alert($(item).val())
        items.push($(item).val())
    })
    tagify.addTags(items)

    //업데이트
    $(".updateClub").on("click",function(){
        let updateForm = $("#updateClubForm");
        $.each(JSON.parse($("#clubTag").val()),function(index,item){
            updateForm.append('<input type="hidden" name="clubTags" value="'+item.value+'">')
        })
        updateForm.attr("method","post").attr("action","/club/updateClub").submit();
    })
    $('input[name="file"]').on("change",function(){
        $('input[name="deleteFileName"]').attr("disabled",false)
    })

    // 확인용
    $(".listClubMasterBoard").on("click",function(){
        location.href="/club/listClubMasterBoard/"+$(".boardNum").val()
    })

    $(".addCalender").on("click", ()=>{
        alert($('.boardNum').val());

        window.open(
            "/clubCal/addCalender?clubNum="+$(".boardNum").val(), "리뷰페이지",
            "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

    });

    // 일정 참여 신청 관련
    $(".addClubCalendarApply").on("click",function(){
        $.ajax({
            url : "/club/json/addClubCalendarApply",
            method : "POST",
            data : JSON.stringify({
                "clubCalendarNum" : 10003,
                "userId" : $(".userId").val(),
                "userImage" : $(".userImage").val(),
                //1이면 확인 2면 자동
                "applyAutoCheck" : "1"
            }),
            dataType : "JSON",
            headers:{
                "Accept":"application/json",
                "Content-Type":"application/json; charset=UTF-8"
            },
            success: function () {
                $(".addClubCalendarApply").toggle()
                $(".deleteClubCalendarApply").toggle()
            }
        })
    })

    //참여 신청 취소
    $(".deleteClubCalendarApply").on("click",function(){
        $.ajax({
            url : "/club/json/deleteClubCalendarApply",
            method : "POST",
            data : JSON.stringify({
                "clubCalendarNum" : 10003,
                "userId" : $(".userId").val()
            }),
            dataType : "JSON",
            headers:{
                "Accept":"application/json",
                "Content-Type":"application/json; charset=UTF-8"
            },
            success: function () {
                $(".addClubCalendarApply").toggle()
                $(".deleteClubCalendarApply").toggle()
            }
        })
    })

})