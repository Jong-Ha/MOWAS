
/////////////////////////////// 함수 설정 ///////////////////////////////
//이미지 미리보기
function readURL(inputSelector, outputSelector) {
    const input = $(inputSelector)[0]
    const output = $(outputSelector)[0]
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            output.src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        output.src = "/resources/images/clubImage.png";
    }
}

//listCluber 모달창 로드 시 이벤트 걸어주기
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
                            setListCluberBlacklist();
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

                setListCluberBlacklist()
            }
        })
    })

    // paging
    $("#listCluberOutForm .paging").off('click').on("click", function () {
        $("#listCluberOutForm #currentPage").val($(this).text())

        const data = $('#listCluberOutForm').serialize()

        $.ajax({
            url : "/club/listCluberOut/" + clubNum,
            method : 'post',
            'data' : data,
            success : function(re){
                $('#listCluberOut .modal-content').html(re)
                setListCluber()
            }
        })
    })
    $("#listCluberOutForm .pageUnit").off('click').on("click", function () {
        if($(this).hasClass('disabled')){
            return false
        }

        $("#listCluberOutForm #currentPage").val($(this).val())

        const data = $('#listCluberOutForm').serialize()

        $.ajax({
            url : "/club/listCluberOut/" + clubNum,
            method : 'post',
            'data' : data,
            success : function(re){
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

//getCluber 모달창 로드 시 이벤트 걸어주기
function setGetCluber() {

    const clubUserNum = $("#clubUserNum").val()

    //자기소개 수정
    $("#getCluber .updateCluber").off('click').on("click", function () {
        // location.href = "/club/updateCluber/" + clubUserNum
        $.ajax({
            url: "/club/updateCluber/" + clubUserNum,
            success: function (re) {
                $('#updateCluber .modal-content').html(re)

                $('#updateCluber .updateCluber').on('click', function () {
                    const data = $('#updateCluberForm').serialize()

                    $.ajax({
                        url: "/club/updateCluber",
                        method: 'post',
                        'data': data,
                        success: function () {
                            $('#listCluber .clubUserNum[value="' + clubUserNum + '"]').click()
                        }
                    })
                })
            }
        })
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

//listCluberBlacklist 모달창 로드 시 이벤트 걸어주기
function setListCluberBlacklist() {

    let cardCheck = true;
    const clubNum = $("#clubNum").val()
    //상태 변경
    $("#listClubBlacklist .updateClubBlacklist").off('click').on("click", function () {
        let process = "F"
        if ($(this).val() === '재등록') {
            process = "T";
        }
        let check = false;
        $.each($("#listClubBlacklist .clubUserNum"), function (index, item) {
            if ($(item).prop('checked')) {
                check = true
            }
        })
        if (check) {

            const data = $("#listClubBlacklistForm").serialize()

            $.ajax({
                url: "/club/updateClubBlacklist/" + process,
                method: 'post',
                'data': data,
                success: function (re) {
                    $('#listClubBlacklist .modal-content').html(re)

                    setListCluberBlacklist()
                }
            })
        }
    })

    //카드 선택
    $('#listClubBlacklist .cardBox').off('click').on('click', function () {
        console.log(cardCheck)
        if (cardCheck) {
            // console.log(1)
            $(this).find(".clubUserNum").prop('checked', !$(this).find(".clubUserNum").prop('checked'))
            // console.log(2)
            if ($(this).find(".clubUserNum").prop('checked')) {
                // console.log('t')
                $(this).css('background-color', '#00ffff')
            } else {
                // console.log('f')
                $(this).css('background-color', '')
            }
        }
    })

    //상세보기
    $("#listClubBlacklist .getClubBlacklist").off('click').on("click", function () {
        cardCheck = false
        if ($(this).html() === "간략히") {
            // console.log('??')
            $(this).html("자세히")
            $(this).parent().find('.blacklistText').css('white-space', 'nowrap')
        } else {
            // console.log('!!')
            $(this).html("간략히")
            $(this).parent().find('.blacklistText').css('white-space', 'normal')
        }
        setTimeout(function () {
            cardCheck = true
        }, 100)
    })

    //검색 조건
    $("#listClubBlacklist #searchCondition").off('change').on("change", function () {
        fncListClubBlacklist(1)
    })

    //페이징
    $("#listClubBlacklist .paging").off('click').on("click", function () {
        fncListClubBlacklist($(this).text())
    })

    $("#listClubMasterBoardForm .pageUnit").off('click').on("click", function () {
        if($(this).hasClass('disabled')){
            return false
        }
        fncListClubBlacklist($(this).val())
    })

    //리스트 조회 function
    function fncListClubBlacklist(currentPage) {
        if (currentPage === 0) {
            currentPage = 1
        }

        $("#listClubBlacklistForm #currentPage").val(currentPage)

        const data = $('#listClubBlacklistForm').serialize()

        $.ajax({
            url: "/club/listClubBlacklist/" + clubNum,
            method: 'post',
            'data': data,
            success: function (re) {
                $('#listClubBlacklist .modal-content').html(re)

                setListCluberBlacklist()
            }
        })

    }
}

//getClubCalendar 모달창 로드 시 이벤트 걸어주기
function setGetClubCalendar() {
    ////////////일정 참여 버튼////////////
    // 일정 참여 신청 관련
    $("#exampleModal2 .addClubCalendarApply").off('click').on("click", function () {
        $.ajax({
            url: "/club/json/addClubCalendarApply",
            method: "POST",
            data: JSON.stringify({
                "clubCalendarNum": parseInt($('#exampleModal2 .clubCalnderNum').val()),
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
                alert('참여 신청 되었습니다.')
                $("#exampleModal2 .addClubCalendarApply").toggle()
                $("#exampleModal2 .deleteClubCalendarApply").toggle()
            }
        })
    })

    //참여 신청 취소
    $("#exampleModal2 .deleteClubCalendarApply").off('click').on("click", function () {
        $.ajax({
            url: "/club/json/deleteClubCalendarApply",
            method: "POST",
            data: JSON.stringify({
                "clubCalendarNum": parseInt($('#exampleModal2 .clubCalnderNum').val()),
                "userId": $(".userId").val()
            }),
            dataType: "JSON",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=UTF-8"
            },
            success: function () {
                alert('참여 신청이 취소되었습니다.')
                $("#exampleModal2 .addClubCalendarApply").toggle()
                $("#exampleModal2 .deleteClubCalendarApply").toggle()
            }
        })
    })
    ////////////일정 참여 버튼 끝////////////

    //모임 참가자 조회
    $('#exampleModal2 .listCalendarCluberView').off('click').on('click', function () {
        $.ajax({
            url: '/club/listCalendarCluber/' + $('#exampleModal2 .clubCalnderNum').val(),
            success: function (re) {
                $('#listCalendarCluber .modal-content').html(re)

                $("#listCalendarCluber .listClubCalendarApply").off('click').on("click", function () {
                    // location.href="/club/listClubCalendarApply/${clubCalendarNum}"
                    //모임 일정 참가 신청자 조회
                    $.ajax({
                        url: "/club/listClubCalendarApply/" + $('#exampleModal2 .clubCalnderNum').val(),
                        success: function (re) {
                            $('#listClubCalendarApply .modal-content').html(re)

                            //뒤로가기 이벤트 걸기 $('#exampleModal2 .listCalendarCluberView')
                            $('#listClubCalendarApply .back-btn').off('click').on('click', function () {
                                $('#exampleModal2 .listCalendarCluberView').click()
                            })

                            //승인 거절
                            $("#listClubCalendarApply input[type='button']").off('click').on("click", function () {
                                const result = $(this).attr("name");
                                const div = $(this).parents('.cardBox');
                                const clubCalendarApplyNum = div.children("[name='clubCalendarApplyNum']").val();
                                $.ajax({
                                    url: "/club/json/updateClubCalendarApply",
                                    method: "POST",
                                    data: JSON.stringify({
                                        "result": result,
                                        "clubCalendarApplyNum": clubCalendarApplyNum
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

                                        if ($("#listClubCalendarApply .cardBox").length === 0) {
                                            $('#listClubCalendarApply .clubCalendarApplyList').html('<div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">참여 신청자가 없습니다!</div>')
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
            }
        })
    })

}

let loadCheck = false

//레이아웃 사이즈 조절
function clubLayout(){
    $('[alt="모임 대표 이미지"]').parent().height($('[alt="모임 대표 이미지"]').parent().width() *0.55)
    if(loadCheck){
        // console.log(1)
        if($('.selectedTab').hasClass('calendarView')){
            setTimeout(()=>{
                $('.clubBoarder').height($('#ClubBoard > div').height())
            },200)
        }else {
            $('.clubBoarder').height($('#ClubBoard > div').height()+50)
        }
    }else {
        // console.log(2)
        setTimeout(()=>{
            $('.clubBoarder').height($('#ClubBoard > div').height())
        },100)
    }
}


/////////////////////////////// 로드시 실행 ///////////////////////////////
$(function () {

    $('.modal').off('show.bs.modal').on('show.bs.modal',function(){
        $('body').addClass('stop-scrolling')
        $('#preview').height(466*0.55)
    })
    $('.modal').off('hide.bs.modal').on('hide.bs.modal',function(){
        $('body').removeClass('stop-scrolling')
    })

    clubLayout()
    function resize(){
        $(window).off('resize').on('resize', function(){
            clubLayout()
            resize()
        })
    }
    resize()

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
            $('#loginModal').modal('show')
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

    $('.tagify__input').on('keyup',function(e){
        // alert(e.keyCode===32)
        if(e.keyCode===32){
            // console.log($(this).parents('form').attr('id')==='addClubForm')
            let tag = $(this).html()
            if(tag.indexOf('#')!==-1){
                tag = tag.split('#')[1]
            }
            tagify.addTags([tag])
            $(this).html('')
        }
    })

    $('#updateClub #clubName').off('keyup').on('keyup',function(){
        if($(this).val().length>13){
            alert('모임명은 최대 13글자입니다')
            $(this).val($(this).val().substring(0, 13));
        }
    })

    $('#updateClubForm #clubImage').off('change').on('change',function(){
        readURL('#updateClubForm #clubImage','#updateClubForm #preview')
        $('#updateClubForm input[name="deleteFileName"]').attr("disabled", false)
    })

    //업데이트
    $(".updateClub").on("click", function () {
        const updateForm = $("#updateClubForm");

        updateForm.find('#clubName').prop('disabled',false)

        updateForm.find('#clubText').prop('disabled',false)

        updateForm.find('#interList').prop('disabled',false)

        updateForm.find('#villCode').prop('disabled',false)

        updateForm.find('#file').prop('disabled',false)

        $.each(JSON.parse($("#clubTag").val()), function (index, item) {
            updateForm.append('<input type="hidden" name="clubTags" value="' + item.value + '">')
        })
        updateForm.attr("method", "post").attr("action", "/club/updateClub").submit();
    })

    $("#cluberApplyForm #cluberText").on('keyup', function () {
        if ($(this).val().length > 100) {
            alert('최대 100자 제한!')
            $(this).val($(this).val().substring(0, 100));
        }
    })

    // 확인용
    $(".listClubMasterBoard").on("click", function () {
        location.href = "/club/listClubMasterBoard/" + $(".boardNum").val()
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

    $('#addClubReport').off('show.bs.modal').on('show.bs.modal',function(){
        if($('.userId').val()===''){
            alert('로그인 후 이용해주세요')
            $('#loginModal').modal('show')
            return false
        }
    })

    //모임 신고창
    $('.addClubReportView').on('click', function () {
        $('#addClubReport .modal-content').load('/view/club/addClubReport.jsp', {
            clubNum: $('.boardNum').val(),
            reportId: $('.userId').val()
        }, function () {
            //모임 신고하기
            $('#addClubReport .addCr').on('click', function () {
                const data = new FormData($('#addCrForm')[0])

                $.ajax({
                    url: "/site/addClubReport",
                    method: 'post',
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false,
                    'data': data,
                    success: function () {
                        alert('신고가 접수되었습니다!')
                    }
                })
            })
        })
    })

    //모임 수정시 지도 부르기
    $("#updateClubMap").on("click", function () {
        $('#searchLocation .back-btn').css('display', 'block').off('click').on('click', function () {
            $('.updateClubView').click()
        })
        $('#searchLocation .getLocation').off('click').on('click', function () {
            let villCode = $("#searchLocation .villCode")

            $('#updateClubForm #villCode').val(villCode.val())
            $('.updateClubView').click()
        })
    })

    //지도 조회시 레이아웃 조정
    $("#searchLocation").on("shown.bs.modal", function () {
        relayout()
    })

//////////////////////////////// 모임 툴바 ////////////////////////////////
    const clubBoard = $("#ClubBoard")
    const clubBoardRest = $("#ClubBoardRest")

    function beforeToolbar(tab) {
        if (clubBoardRest.css('display') === 'block' && loadCheck) {
            return true
        }
        clubBoard.css('display', 'none')
        clubBoard.html('')
        clubBoardRest.css('display', '')
        $('.clubTab *').removeClass('selectedTab')
        tab.addClass('selectedTab')
        return false
    }

    function afterToolbar() {
        clubBoardRest.slideUp(50,()=>{
            if($('.selectedTab').hasClass('calendarView')){
                setTimeout(()=>{
                    clubBoardRest.height($('#ClubBoard > div').height())
                },100)
            }else {
                clubBoardRest.height($('#ClubBoard > div').height()+50)
            }
        });
        clubBoard.slideDown(50,()=>{
            if($('.selectedTab').hasClass('calendarView')){
                setTimeout(()=>{
                    clubBoard.height($('#ClubBoard > div').height())
                },100)
            }else {
                clubBoard.height($('#ClubBoard > div').height()+50)
            }
            if(loadCheck){
                $('.clubTab')[0].scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"})
            }
            loadCheck = true
        });
    }

    //모임 공지사항
    $('.listClubMasterBoardView').on('click', function () {
        if (beforeToolbar($(this))) {
            return false
        }
        clubBoard.load('/club/listClubMasterBoard/'+clubNum,afterToolbar)
    })

    //모임 일정
    $('.calendarView').on('click', function () {
        if (beforeToolbar($(this))) {
            return false
        }
        clubBoard.load('/view/community/calender.jsp', {
            clubNum: $('.boardNum').val(),
            cluberStatus: $('.cluberStatus').val()
        }, function () {
            setGetClubCalendar()
            setTimeout(upSize, 100)
            setTimeout(upSize, 500)
            afterToolbar()
        })
    })

    //모임 일정 후기
    $('.listClubCalendarReviewView').on('click', function () {
        if(!($('.cluberStatus').val()==='4'||$('.cluberStatus').val()==='5'||$('.cluberStatus').val()==='6')){
            alert('모임원만 조회가 가능합니다')
            return false
        }

        if (beforeToolbar($(this))) {
            return false
        }
        clubBoard.load('/club/listClubCalendarReview/'+clubNum+'/1',afterToolbar)
    })

    //모임 일정 쇼츠
    $('.listClubCalendarShortView').on('click', function () {
        if(!($('.cluberStatus').val()==='4'||$('.cluberStatus').val()==='5'||$('.cluberStatus').val()==='6')){
            alert('모임원만 조회가 가능합니다')
            return false
        }

        if (beforeToolbar($(this))) {
            return false
        }
        clubBoard.load('/club/listClubCalendarReview/'+clubNum+'/2',afterToolbar)
    })

    $('.calendarView').click()

    $('.clubInfo')[0].scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})

})//$(function(){}) 종료 지점