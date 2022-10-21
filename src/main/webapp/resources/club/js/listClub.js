$(function () {
    let check = true;
    //각 모임으로 이동
    $(".clubBox").on('click', function (e) {
        if (check) {
            location.href = "/club/getClub/" + $(this).find('[name="clubNum"]').val()
        }
    })
    //모임 만들기
    $(".addClub").on("click", function () {
        // location.href = "/club/addClub"
        // window.open("/club/addClub", "모임 만들기",
        //     "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
        if($('.userId').val()===''){
            alert('로그인이 필요합니다')
        }
    })
    //로그인 나중에 없앨거
    $(".clubLogin").on("click", function () {
        location.href = "/club/login?userId=" + $("input[name='userId']").val()
    })
    //위치 검색
    $(".searchLocation").on("click", function () {
        popWin = window.open("/view/site/clubMap.jsp", "popWin", "left=300,top=200,width=800,height=500,marginwidth=0,marginheight=0,scrollbars=no,scrolling=no,menubar=no,resizable=no");
    })
    // //관심목록 다이얼로그 변환
    // const interDialog = $(".searchInterListDialog");
    // interDialog.dialog({
    //     autoOpen:false
    // })
    //기존 관심목록 불러오기
    // console.log($('[name="searchedInterList"]'))
    $.each($('[name="searchedInterList"]'), function (index, item) {
        let inter = $(item).val()
        // if (inter < 10) {
        //     inter = "0" + inter
        // } else {
        //     inter = "" + inter
        // }
        // alert(inter)
        // alert($('input[name="searchInterList"][value='+inter+']').val())
        $('input[name="searchInterList"][value=' + inter + ']').prop("checked", true)
    })
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
    $(".searchListClub").on("click", function () {
        $("#listForm").attr("action", "/club/listClub").attr("method", "post").submit()
    })
    //좋아요 기능
    $(".likeToggle").on("click", function () {
        check = false;
        var clubNum = $(this).parents('.clubBox').find('[name="clubNum"]').val()
        var button = $(this);
        $.ajax({
            url: "/club/json/clubLike",
            method: "POST",
            data: JSON.stringify({
                "boardNum": clubNum,
                "boardCategory": "12"
            }),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json; charset=UTF-8"
            },
            dataType: "JSON",
            success: function () {
                // alert("ajax")
                // alert(button.children('svg').attr("class"))
                if (button.children('svg').attr("class") === 'bi bi-heart') {
                    // alert("누름")
                    button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>');
                } else {
                    // alert("뺌")
                    button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>');
                }
                check = true;
            }
        })
    })
})

$(function(){
    var clubTag = document.querySelector("#clubTag")
    var tagify = new Tagify(clubTag, {
        dropdown: {
            position: "input",
            enabled: 0 // always opens dropdown when input gets focus
        }
    })

    $("#addClub").find(".newClub").on('click',function(){
        if($("#clubName").val()===''){
            alert("모임명은 필수입니다")
            return;
        }
        if($("#clubText").val()===''){
            alert("모임소개는 필수입니다")
            return;
        }
        if($("#interList").val()==='00'){
            alert("관심목록은 필수입니다")
            return;
        }
        if($("#villCode").val()===''){
            alert("주요활동위치는 필수입니다")
            return;
        }
        // if($("#clubTag").val()===''){
        //     return;
        // }
        // alert(JSON.parse($("#clubTag").val()))
        let addForm = $("#addClubForm");
        $.each(JSON.parse($("#clubTag").val()),function(index,item){
            addForm.append('<input type="hidden" name="clubTags" value="'+item.value+'">')
        })

        addForm.attr("action","/club/addClub").attr("method","post").submit()
    })

})

$(function (){
    checkBox()
    $('[name="searchInterList"]').on('click',function(){
        checkBox()
    })
    $('.totalInterList').on('click',function(){
        $.each($('[name="searchInterList"]'),function(index,item){
            $(item).prop('checked',$('.totalInterList').prop('checked'))
        })
    })
})

function checkBox(){
    var result = true;
    $.each($('[name="searchInterList"]'),function(index,item){
        if(!$(item).prop('checked')){
            result = false
            return false
        }
    })
    $('.totalInterList').prop('checked',result)
}