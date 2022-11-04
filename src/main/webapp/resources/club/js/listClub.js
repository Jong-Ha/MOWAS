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

function setListClub(){

    //각 모임으로 이동
    $(".clubBox").off('click').on('click', function (e) {
        if (check) {
            location.href = "/club/getClub/" + $(this).find('[name="clubNum"]').val()
        }
    })

    //리스트 조회
    $(".searchListClub").off('click').on("click", function () {
        $("#listForm").attr("action", "/club/listClub").attr("method", "post").submit()
    })

    //좋아요 기능
    $(".likeToggle").off('click').on("click", function () {
        if($('.userId').val()===''){
            alert('로그인이 필요합니다')
            return false
        }
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
                if (button.children('svg').hasClass('bi-heart')) {
                    // alert("누름")
                    button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ff0000" class="bi bi-heart-fill likeCheck" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>');
                } else {
                    // alert("뺌")
                    button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart likeCheck" viewBox="0 0 16 16"> <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>');
                }
                check = true;
            }
        })
    })
}

function checkBox() {
    var result = true;
    $.each($('[name="searchInterList"]'), function (index, item) {
        if (!$(item).prop('checked')) {
            result = false
            return false
        }
    })
    $('.totalInterList').prop('checked', result)
}

let check = true;

$(function () {

    setListClub()

    $('.modal').on('show.bs.modal', function () {
        $('body').addClass('stop-scrolling')
        $('#preview').height(466*0.55)
    })
    $('.modal').on('hide.bs.modal', function () {
        $('body').removeClass('stop-scrolling')
    })

    //이미지 미리보기
    $('#addClub #file').on('change',function(){
        readURL('#addClub #file','#addClub #preview')
    })

    //모임 만들기
    $("#addClub").on("show.bs.modal", function () {
        // location.href = "/club/addClub"
        // window.open("/club/addClub", "모임 만들기",
        //     "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
        if ($('.userId').val() === '') {
            alert('로그인이 필요합니다')
            $('#loginModal').modal('show')
            return false
        }
    })
    //위치 검색
    $(".searchLocation").on("click", function () {
        $('#searchLocation .getLocation').off('click').on('click', function () {
            let villCode = $("#searchLocation .villCode")

            $('.searchLocation').html(villCode.val())
            $('[name="searchLocation"]').val(villCode.val())
            $('#searchLocation .btn-close').click()
        })
    })

    //모임 생성시 지도 부르기
    $("#addClubMap").on("click", function () {
        $('#searchLocation .back-btn').css('display', 'block').off('click').on('click', function () {
            $('.addClub').click()
        })
        $('#searchLocation .getLocation').off('click').on('click', function () {
            let villCode = $("#searchLocation .villCode")

            $('#addClubForm #villCode').val(villCode.val())
            $('.addClub').click()
        })
    })

    //위치 검색
    $('.searchLocation').on('click', function () {
        $('#searchLocation .back-btn').css('display', 'none')
    })

    //지도 조회시 레이아웃 조정
    $("#searchLocation").on("shown.bs.modal", function () {
        relayout()
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
    let searchTagify = new Tagify(input, {
        dropdown: {
            position: "input",
            enabled: 0 // always opens dropdown when input gets focus
        }
    })

    let items = []

    $.each($(".searchTag"), function (index, item) {
        // alert($(item).val())
        items.push($(item).val())
    })
    searchTagify.addTags(items)

    $('.modal.fade .modal-footer button').on("click", function () {
        // alert($(".tagify__tag").attr('value'))
        $(".tagForm").html('')
        $.each($(".tagify__tag"), function (index, item) {
            $(".tagForm").append('<input type="hidden" name="searchTag" class="searchTag" value="' + $(item).attr('value') + '">')
        })
    })

    $('#addClub #clubName').on('keyup',function(){
        if($(this).val().length>13){
            alert('모임명은 최대 13글자입니다')
            $(this).val($(this).val().substring(0, 13));
        }
    })

    var clubTag = document.querySelector("#clubTag")
    var clubTagify = new Tagify(clubTag, {
        dropdown: {
            position: "input",
            enabled: 0 // always opens dropdown when input gets focus
        }
    })

    $('.tagify__input').on('keyup',function(e){
        // alert(e.keyCode===32)
        if(e.keyCode===32){
            // console.log($(this).parents('form').attr('id')==='addClubForm')
            let tagify = searchTagify
            if($(this).parents('form').attr('id')==='addClubForm'){
                tagify = clubTagify
            }
            let tag = $(this).html()
            if(tag.indexOf('#')!==-1){
                tag = tag.split('#')[1]
            }
            tagify.addTags([tag])
            $(this).html('')
        }
    })

    $("#addClub").find(".newClub").on('click', function () {
        if ($("#addClub #clubName").val() === '') {
            alert("모임명은 필수입니다")
            return;
        }
        if ($("#addClub #clubText").val() === '') {
            alert("모임소개는 필수입니다")
            return;
        }
        if ($("#addClub #interList").val() === '00') {
            alert("관심목록은 필수입니다")
            return;
        }
        if ($("#addClub #villCode").val() === '') {
            alert("주요활동위치는 필수입니다")
            return;
        }
        if ($("#addClub #file")[0].files.length==0) {
            alert("모임이미지는 필수입니다")
            return;
        }
        if ($("#addClub #clubTag").val() === '') {
            alert("하나 이상의 태그를 입력해주세요")
            return;
        }
        // alert(JSON.parse($("#clubTag").val()))
        let addForm = $("#addClub #addClubForm");
        $.each(JSON.parse($("#addClub #clubTag").val()), function (index, item) {
            addForm.append('<input type="hidden" name="clubTags" value="' + item.value + '">')
        })

        addForm.attr("action", "/club/addClub").attr("method", "post").submit()
    })

})

$(function () {
    checkBox()
    $('[name="searchInterList"]').on('click', function () {
        checkBox()
    })
    $('.totalInterList').on('click', function () {
        $.each($('[name="searchInterList"]'), function (index, item) {
            $(item).prop('checked', $('.totalInterList').prop('checked'))
        })
    })
})

//무한스크롤
$(function () {

    function getFormJson(selector) {
        // Select Form
        let selForm = document.querySelector(selector);

        // Getting an FormData
        let data = new FormData(selForm);

        // Getting a Serialize Data from FormData
        let serializedFormData = serialize(selector, data);

        // Log
        console.log(JSON.stringify(serializedFormData));

        return JSON.stringify(serializedFormData)
    }

    function serialize (selector, rawData) {

        let rtnData = {};
        for (let [key, value] of rawData) {
            let sel = document.querySelectorAll(selector+" [name=" + key + "]");

            // Array Values
            if (sel.length > 1) {
                if (rtnData[key] === undefined) {
                    rtnData[key] = [];
                }
                rtnData[key].push(value);
            }
            // Other
            else {
                rtnData[key] = value;
            }
        }

        return rtnData;
    }

    let loadCheck = false
    $(window).on('scroll', function () {
        console.log($(window).scrollTop())
        // console.log($(window).height())
        // console.log($(document).height())
        console.log($(document).height() - $(window).height())
        if ($(document).height() - $(window).height() - $(window).scrollTop() < 1300) {
            if (loadCheck) {
                return
            }
            loadCheck = true
            console.log('ajax!')

            // const data = $('#listForm').serializeArray()
            // console.log(data)

            const json = getFormJson('#listForm')
// alert(json)
            $.ajax({
                url: '/club/json/listClub',
                method: 'post',
                'data': json,
                contentType: 'application/json; charset=utf-8',
                success: function (re) {
                    $.each(re.list,function(index,item){
                        // console.log(index)
                        // console.log(item)
                        let html = '<div class="row row-cols-1 row-cols-md-3 g-4 cardbox">' +
                            '                <div class="col clubBox" style="cursor: pointer">' +
                            '                    <input type="hidden" name="clubNum" value="'+item.clubNum+'">' +
                            '                    <div class="card h-100 shadow-lg">' +
                            '                        <div class="card-img-top">' +
                            '                            <img src="/resources/'+item.clubImage+'" alt="모임이미지">' +
                            '                        </div>' +
                            '                        <div class="card-body carditem">' +
                            '                            <h3 class="card-title">'+item.clubName+'</h3>' +
                            '                            <div class="row g-3">' +
                            '                                <div class="col-6">' +
                            '                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">' +
                            '                                            '+(item.gatherCheck===1?'모집중':'모집완료')+
                            '                                    </div>' +
                            '                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">' +
                            '                                            '+item.villCode+
                            '                                    </div>' +
                            '                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">' +
                            '                                            ' +item.interList+
                            '                                    </div>' +
                            '                                </div>' +
                            '                                <div class="col-6">' +
                            '                                    <span class="likeToggle">'
                        if(item.likeCheck==='y'){
                            html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"' +
                                '                                             fill="currentColor" class="bi bi-heart-fill likeCheck" viewBox="0 0 16 16"> <path' +
                                '                                                fill-rule="evenodd"' +
                                '                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>'
                        }else {
                            html +='                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"' +
                                '                                                 fill="currentColor" class="bi bi-heart likeCheck" viewBox="0 0 16 16"> <path' +
                                '                                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>'
                        }

                        html+='                                </span>' +
                            '                                </div>' +
                            '                            </div>' +
                            '                            <button type="button" class="btn btn-outline-primary clubTag">'+item.tag+'</button>' +
                            '                        </div>' +
                            '                    </div>' +
                            '                </div>' +
                            '            </div>'

                        $('.listClub').append($(html))
                    })
                    $('#listForm .currentPage').val(parseInt($('#listForm .currentPage').val()) + 1)
                    setListClub()
                    if(re.list.length>0){
                        loadCheck = false
                    }else {
                        $(window).off('scroll')
                    }
                }
            })

        }
    })
})