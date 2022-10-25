$(function () {

    const clubNum = $('.boardNum').val()
    // $(".updateClub").on("click",function(){
    //     location.href="/club/updateClub/"+$(".boardNum").val()
    // })
    $(".deleteClub").on("click", function () {
        let check = confirm("진짜 삭제?");
        if (check === true) {
            location.href = "/club/deleteClub/" + $(".boardNum").val()
        }
    })

    //모임 탈퇴
    $(".deleteCluberView").on("click", function () {
        if ($('.cluberStatus').val() === '6') {
            alert('모임장은 탈퇴할 수 없습니다')
        }
    })


    // $(".deleteCluber").on("click", function () {
    //     $("#deleteCluberForm").attr("action", "/club/deleteCluber").attr("method", "post").submit();
    // })
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
    const clubTag = document.querySelector("#clubTag")
    const tagify = new Tagify(clubTag, {
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
        const updateForm = $("#updateClubForm");
        $.each(JSON.parse($("#clubTag").val()), function (index, item) {
            updateForm.append('<input type="hidden" name="clubTags" value="' + item.value + '">')
        })
        updateForm.attr("method", "post").attr("action", "/club/updateClub").submit();
    })
    $('input[name="file"]').on("change", function () {
        $('input[name="deleteFileName"]').attr("disabled", false)
    })

    $("#cluberApplyForm #cluberText").on('keyup', function () {
        if ($(this).val().length > 200) {
            alert('최대 200자 제한!')
            $(this).val($(this).val().substring(0, 200));
        }
    })

    // 확인용
    $(".listClubMasterBoard").on("click", function () {
        location.href = "/club/listClubMasterBoard/" + $(".boardNum").val()
    })

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

//모임원 목록 조회
    $('#listCluber').on('show.bs.modal', function () {
        $.ajax({
            url: "/club/listCluber/" + clubNum,
            success: function (re) {
                //모달 내용 채우기
                $('#listCluber .modal-content').html(re)

                setListCluber()
            }
        })
    })


//모임 탈퇴창
    $('.deleteCluberView').on('click', function () {
        $.ajax({
            url: '/club/deleteCluber/F',
            data: {
                clubUserNum: $('.clubUserNum').val()
            },
            success: function (re) {
                $('#deleteCluber .modal-content').html(re)
                //모임 탈퇴하기
                $('#deleteCluber .deleteCluber').on('click', function () {
                    $("#deleteCluberForm").attr("action", "/club/deleteCluber").attr("method", "post").submit();
                })
            }
        })
    })
})

function setListCluber() {

    const clubNum = $("#clubNum").val()

    //모임원 상세 조회
    $(".listCluberModal .cardBox").off('click').on('click', function () {
        const clubUserNum = $(this).children(".clubUserNum").val();
        // getCluberModal.show()
        // location.href = "/club/getCluber/"+clubUserNum
        $.ajax({
            url: "/club/getCluber/" + clubUserNum,
            success: function (re) {
                $('#getCluber .modal-content').html(re)

                setGetCluber()
            }
        })
    })

    //모임 가입 신청 조회
    $(".listCluberModal .listCluberApply").off('click').on("click", function () {
        // location.href = "/club/listCluberApply/"+clubNum
        $.ajax({
            url: "/club/listCluberApply/" + clubNum,
            success: function (re) {
                $('#listCluberApply .modal-content').html(re)

                //승인 및 거절 처리
                $("#listCluberApply input[type='button']").on("click", function () {
                    // alert($(this).attr("class"))
                    const result = $(this).attr("name");
                    // alert($(this).parents(".cluber").children("[name='clubUserNum']").val())
                    const clubUserNum = $(this).parents(".cardBox").children("[name='clubUserNum']").val();
                    const clubNum = $(this).parents(".cardBox").children("[name='clubNum']").val();
                    const userId = $(this).parents(".cardBox").children("[name='userId']").val();
                    const div = $(this).parents(".cardBox");
                    $.ajax({
                        url: "/club/json/processCluberApply",
                        method: "POST",
                        data: JSON.stringify({
                            "result": result,
                            "clubUserNum": clubUserNum,
                            "clubNum": clubNum,
                            "userId": userId
                        }),
                        dataType: "JSON",
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json; charset=UTF-8"
                        },
                        success: function () {
                            // alert("ajax")
                            if (result === 'accept') {
                                alert('승인되었습니다!')
                            } else {
                                alert('거절되었습니다!')
                            }

                            div.remove()

                            if ($("#listCluberApply .cardBox").length === 0) {
                                $('#listCluberApply .cluberList').html('<div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">가입 신청자가 없습니다!</div>')
                            }
                        },
                        error: function () {
                            alert('다시 시도해 주세요')
                        }
                    })
                })
            }
        })
    })

    //블랙리스트 등록창
    $(".listCluberModal .addClubBlacklist").off('click').on("click", function () {
        // location.href = "/club/addClubBlacklist/"+clubNum
        $.ajax({
            url: "/club/addClubBlacklist/" + clubNum,
            success: function (re) {
                $('#addClubBlacklist .modal-content').html(re)
                //블랙리스트 등록
                $("#addClubBlacklist .addClubBlacklist").on("click", function () {
                    // $("#addClubBlacklistForm").attr("action","/club/addClubBlacklist").attr("method","post").submit();
                    const data = $('#addClubBlacklistForm').serialize()
                    $.ajax({
                        url: "/club/addClubBlacklist",
                        'data': data,
                        method: 'post',
                        success: function (re) {
                            $('#listClubBlacklist .modal-content').html(re)
                        }
                    })
                })
            }
        })
    })

    //블랙리스트 조회
    $(".listCluberModal .listClubBlacklist").off('click').on('click', function () {
        // location.href = "/club/listClubBlacklist/"+clubNum
        $.ajax({
            url: "/club/listClubBlacklist/" + clubNum,
            success: function (re) {
                $('#listClubBlacklist .modal-content').html(re)
            }
        })
    })

    //페이징
    $(".listCluberModal .paging").off('click').on("click", function () {
        // $("form").attr("action","/club/listCluberOut/"+clubNum).attr("method","post").submit()

        const data = $('#listCluberOutForm').serialize()

        $.ajax({
            url: "/club/listCluberOut/" + clubNum,
            method: 'post',
            'data': data,
            success: function (re) {
                $('#listCluberOut .modal-content').html(re)
                setListCluber()
            }
        })
    })

    //탈퇴 모임원 조회
    $("#listCluberOut").off('show.bs.modal').on("show.bs.modal", function () {
        // location.href = "/club/listCluberOut/"+clubNum
        $.ajax({
            url: "/club/listCluberOut/" + clubNum,
            success: function (re) {
                $('#listCluberOut .modal-content').html(re)
                setListCluber()
            }
        })
    })

    //현재 모임원 목록 조회
    $(".listCluberModal .listCluber").off('click').on("click", function () {
        // location.href = "/club/listCluber/"+clubNum
        $.ajax({
            url: "/club/listCluber/" + clubNum,
            success: function (re) {
                $('#listCluber .modal-content').html(re)
                setListCluber()
            }
        })
    })
}

function setGetCluber() {

    const clubUserNum = $("#clubUserNum").val()

    //자기소개 수정
    $("#getCluber .updateCluber").off('click').on("click", function () {
        location.href = "/club/updateCluber/" + clubUserNum
    })

    //모임장 위임
    $("#getCluber .updateClubMaster").off('click').on("click", function () {
        // location.href="/club/updateClubMaster/"+clubUserNum
        $.ajax({
            url: "/club/updateClubMaster/" + clubUserNum,
            success: function (re) {
                $('#getCluber .modal-content').html(re)
                setGetCluber()
            }
        })
    })

    //매니저 임명
    $("#getCluber .addClubManager").off('click').on("click", function () {
        // location.href="/club/addClubManager/"+clubUserNum
        $.ajax({
            url: "/club/addClubManager/" + clubUserNum,
            success: function (re) {
                $('#getCluber .modal-content').html(re)
                setGetCluber()
            }
        })
    })

    //매니저 박탈
    $("#getCluber .deleteClubManager").off('click').on("click", function () {
        // location.href="/club/deleteClubManager/"+clubUserNum
        $.ajax({
            url: "/club/deleteClubManager/" + clubUserNum,
            success: function (re) {
                $('#getCluber .modal-content').html(re)
                setGetCluber()
            }
        })
    })

    //강퇴 서식 불러오기
    $("#getCluber .deleteCluber").off('click').on("click", function () {
        // location.href="/club/deleteCluber/T?clubUserNum="+clubUserNum
        $.ajax({
            url: "/club/deleteCluber/T?clubUserNum=" + clubUserNum,
            success: function (re) {
                $('#deleteCluber .modal-content').html(re)
                //강퇴하기
                $('#deleteCluber .deleteCluber').on('click', function () {
                    const data = $('#deleteCluberForm').serialize()
                    // alert(data)
                    $.ajax({
                        url: "/club/deleteCluber",
                        method: 'post',
                        'data': data,
                        success: function () {
                            let check = confirm('블랙리스트로 등록하시겠습니까?')
                            if (check) {
                                //블랙리스트 등록 창
                                $('#listCluber .addClubBlacklist').click()
                                $('#addClubBlacklist').on('shown.bs.modal', function () {
                                    $('#addClubBlacklistForm #userId').val($('#deleteCluberForm #userId').val())
                                    $('#addClubBlacklistForm #blacklistText').val($('#deleteCluberForm #clubOutText').val())
                                    $('#addClubBlacklist').off('shown.bs.modal')
                                })
                            } else {
                                //탈퇴 유저 정보창
                                $('#listCluber .clubUserNum[value="' + clubUserNum + '"]').click()
                            }
                        }
                    })
                    // $('.listCluberModal .listCluberOut').click()
                    // $('.listCluberModal .listClubBlacklist').click()
                    // $('#listCluber .clubUserNum[value="'+clubUserNum+'"]').click()
                })
            }
        })
    })
}

