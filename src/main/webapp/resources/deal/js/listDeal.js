$(function () {
    let check = true;
    //각 모임으로 이동
    $(".dealBox").on('click', function (e) {
        if (check) {
            location.href = "/deal/getDeal/" + $(this).find('[name="dealBoardNum"]').val()
        }
    })


//판매

    $(".deal").on("click", function () {

        location.href = "/deal/getListDeal?boardCategory="+$(".deal").val();
        //$(this).attr("action","/deal/getListDeal/08").attr("method","post")--%>
    });
//판매요청
    $(".dealRequest").on("click", function () {
        alert($(".dealRequest").val());
        location.href = "/deal/getListDeal?boardCategory="+$(".dealRequest").val();

        // $(this).attr("action","/deal/getListDeal/09").attr("method","post")--%>
    })
    //getdeal
      $(".dealBox").on('click', function (e) {
          alert("hi")
          var dealBoardNum = $(this).find(".dealBoardNum").val()
          alert(dealBoardNum);
          location.href = "/deal/getDeal/" + dealBoardNum;
      });
    //모임 만들기
    // $(".addClub").on("click", function () {
    //     // location.href = "/club/addClub"
    //     // window.open("/club/addClub", "모임 만들기",
    //     //     "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
    // })
    //로그인 나중에 없앨거
    $(".clubLogin").on("click", function () {
        location.href = "/deal/login?userId=" + $("input[name='userId']").val()
    })
        //위치 검색
        // $(".searchLocation").on("click", function () {
        //     popWin = window.open("/view/site/clubMap.jsp", "popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
        // })
        // // //관심목록 다이얼로그 변환
        // // const interDialog = $(".searchInterListDialog");
        // // interDialog.dialog({
        // //     autoOpen:false
        // // })
        // //기존 관심목록 불러오기
        // // console.log($('[name="searchedInterList"]'))
        // $.each($('[name="searchedInterList"]'), function (index, item) {
        //     let inter = $(item).val()
        //     // if (inter < 10) {
        //     //     inter = "0" + inter
        //     // } else {
        //     //     inter = "" + inter
        //     // }
        //     // alert(inter)
        //     // alert($('input[name="searchInterList"][value='+inter+']').val())
        //     $('input[name="searchInterList"][value=' + inter + ']').prop("checked", true)
        // })
        // //관심목록 검색
        // $(".searchInterList").on("click", function () {
        //     interDialog.dialog('open')
        // })
        // //태그 다이얼로그 변환
        // const tagDialog = $(".searchTagDialog");
        // tagDialog.dialog({
        //     autoOpen:false
        // })
        // //태그 검색
        // $(".searchTag").on("click", function () {
        //     tagDialog.dialog('open')
        // })
        //태그
        var input = document.querySelector("[name='searchTagInput']")

        // init Tagify script on the above inputs
        var tagify = new Tagify(input, {
            dropdown: {
                position: "input",
                enabled: 0 // always opens dropdown when input gets focus
            }
        })

        let items = []

        $.each($(".searchTag"), function(index, item){
            // alert($(item).val())
            items.push($(item).val())
        })
        tagify.addTags(items)

        $('.modal.fade .modal-footer button').on("click", function () {
            // alert($(".tagify__tag").attr('value'))
            $(".tagForm").html('')
            $.each($(".tagify__tag"), function (index, item) {
                $(".tagForm").append('<input type="hidden" name="searchTag" class="searchTag" value="' + $(item).attr('value') + '">')
            })
        })


        //리스트 조회
        $(".searchListDeal").on("click", function () {
            $("#listForm").attr("action", "/deal/getListDeal").attr("method", "pt").submit()
        })
        //좋아요 기능
        // $(".likeToggle").on("click", function () {
        //     check = false;
        //     var clubNum = $(this).parents('.clubBox').find('[name="clubNum"]').val()
        //     var button = $(this);
        //     $.ajax({
        //         url: "/club/json/clubLike",
        //         method: "POST",
        //         data: JSON.stringify({
        //             "boardNum": clubNum,
        //             "boardCategory": "12"
        //         }),
        //         headers: {
        //             "Accept": "application/json",
        //             "Content-Type": "application/json; charset=UTF-8"
        //         },
        //         dataType: "JSON",
        //         success: function () {
        //             // alert("ajax")
        //             // alert(button.children('svg').attr("class"))
        //             if (button.children('svg').attr("class") === 'bi bi-heart') {
        //                 // alert("누름")
        //                 button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>');
        //             } else {
        //                 // alert("뺌")
        //                 button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>');
        //             }
        //             check = true;
        //         }
        //     })
        // })
    })

    $(function(){
        var dealTag = document.querySelector("#dealTag")
        var tagify = new Tagify(dealTag, {
            dropdown: {
                position: "input",
                enabled: 0 // always opens dropdown when input gets focus
            }
        })

        $("#addDeal").find(".newDeal").on('click',function(){
            if($("#dealTitle").val()===''){
                alert("제목은 필수입니다")
                return;
            }
            if($("#price").val()===''){
                alert("가격은 필수입니다")
                return;
            }
            if($("#dealProduct").val()===''){
                alert("제품명은 필수입니다")
                return;
            }

            // if($("#clubTag").val()===''){
            //     return;
            // }
            // alert(JSON.parse($("#clubTag").val()))
            let addForm = $("#addDealForm");
            $.each(JSON.parse($("#dealTag").val()),function(index,item){
                addForm.append('<input type="hidden" name="dealTags" value="'+item.value+'">')
            })

            addForm.attr("action","/deal/addDeal").attr("method","post").submit()
        })
    })