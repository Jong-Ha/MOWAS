$(function () {
    // $(".updateClub").on("click",function(){
    //     location.href="/club/updateClub/"+$(".boardNum").val()
    // })
    $(".deleteClub").on("click", function () {
        var check = confirm("진짜 삭제?");
        if (check === true) {
            location.href = "/club/deleteClub/" + $(".boardNum").val()
        }
    })
    $(".listCluber").on("click", function () {
        var nWidth = "500";
        var nHeight = "600";

// 듀얼 모니터 고려한 윈도우 띄우기
        var curX = window.screenLeft;
        var curY = window.screenTop;
        var curWidth = document.body.clientWidth;
        var curHeight = document.body.clientHeight;

        var nLeft = curX + (curWidth / 2) - (nWidth / 2);
        var nTop = curY + (curHeight / 2) - (nHeight);

        var strOption = "";
        strOption += "left=" + nLeft + "px,";
        strOption += "top=" + nTop + "px,";
        strOption += "width=" + nWidth + "px,";
        strOption += "height=" + nHeight + "px,";
        strOption += "toolbar=no,menubar=no,location=no,";
        strOption += "resizable=yes,status=yes";

        window.open("/club/listCluber/" + $(".boardNum").val(), "popWin", strOption)
    })
    $(".deleteCluber").on("click", function () {
        if ($('.cluberStatus').val() === '6') {
            alert('모임장은 탈퇴할 수 없습니다')
        } else {
            location.href = "/club/deleteCluber/F?clubNum=" + $(".boardNum").val()
        }
    })
    $(".addCluberApplyView").on("click", function () {
        if ($(".userId").val() === '') {
            alert("로그인이 필요합니다")
        }
    })
    $(".addCluberApply").on("click", function () {
        $("#cluberApplyForm").attr("action", "/club/addCluberApply").attr("method", "post").submit();
    })
    $(".updateCluberApply").on("click", function () {
        $("#cluberApplyForm").attr("action", "/club/updateCluberApply").attr("method", "post").submit();
    })
    $(".deleteCluberApply").on("click", function () {
        $("#cluberApplyForm").attr("action", "/club/deleteCluberApply").attr("method", "post").submit();
    })
    $(".addClubMasterBoard").on("click", function () {
        location.href = "/club/addClubMasterBoard/" + $(".boardNum").val()
    })
    $(".listVote").on("click", function () {
        location.href = "/club/listVote/" + $(".boardNum").val()
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

    $.each($(".tagList"), function (index, item) {
        // alert($(item).val())
        items.push($(item).val())
    })
    tagify.addTags(items)

    //업데이트
    $(".updateClub").on("click", function () {
        let updateForm = $("#updateClubForm");
        $.each(JSON.parse($("#clubTag").val()), function (index, item) {
            updateForm.append('<input type="hidden" name="clubTags" value="' + item.value + '">')
        })
        updateForm.attr("method", "post").attr("action", "/club/updateClub").submit();
    })
    $('input[name="file"]').on("change", function () {
        $('input[name="deleteFileName"]').attr("disabled", false)
    })

    // 확인용
    $(".listClubMasterBoard").on("click", function () {
        location.href = "/club/listClubMasterBoard/" + $(".boardNum").val()
    })

    $(".addCalender").on("click", () => {
        alert($('.boardNum').val());

        window.open(
            "/clubCal/addCalender?clubNum=" + $(".boardNum").val(), "리뷰페이지",
            "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

    });

    // 일정 참여 신청 관련
    $(".addClubCalendarApply").on("click", function () {
        $.ajax({
            url: "/club/json/addClubCalendarApply",
            method: "POST",
            data: JSON.stringify({
                "clubCalendarNum": 10003,
                "userId": $(".userId").val(),
                "userImage": $(".userImage").val(),
                //1이면 확인 2면 자동
                "applyAutoCheck": "1"
            }),
            dataType: "JSON",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=UTF-8"
            },
            success: function () {
                $(".addClubCalendarApply").toggle()
                $(".deleteClubCalendarApply").toggle()
            }
        })
    })

    //참여 신청 취소
    $(".deleteClubCalendarApply").on("click", function () {
        $.ajax({
            url: "/club/json/deleteClubCalendarApply",
            method: "POST",
            data: JSON.stringify({
                "clubCalendarNum": 10003,
                "userId": $(".userId").val()
            }),
            dataType: "JSON",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=UTF-8"
            },
            success: function () {
                $(".addClubCalendarApply").toggle()
                $(".deleteClubCalendarApply").toggle()
            }
        })
    })

})

$(function () {
    $("#cluberText").on('keyup', function () {
        if ($(this).val().length > 200) {
            alert('최대 200자 제한!')
            $(this).val($(this).val().substring(0, 200));
        }
    })
})