<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
          rel="stylesheet">
    <link href="/resources/css/comment.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <title>MOWAS</title>

    <script type="text/javascript">
        function setToolTip(){
            $('.report').attr('data-bs-title','신고하기')
            $.each($('.report'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.reportComment').attr('data-bs-title','신고하기')
            $.each($('.reportComment'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.reportRecomment').attr('data-bs-title','신고하기')
            $.each($('.reportRecomment'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.boardLikeButton').attr('data-bs-title','좋아요')
            $.each($('.boardLikeButton'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.CommentlikeButton').attr('data-bs-title','좋아요')
            $.each($('.CommentlikeButton'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.RecommentlikeButton').attr('data-bs-title','좋아요')
            $.each($('.RecommentlikeButton'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.chating').attr('data-bs-title','채팅하기')
            $.each($('.chating'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.chatComment').attr('data-bs-title','채팅하기')
            $.each($('.chatComment'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.chatRecomment').attr('data-bs-title','채팅하기')
            $.each($('.chatRecomment'),function(i,e){
                new bootstrap.Tooltip(e)
            })
            $('.viewBox').attr('data-bs-title','조회수')
            $.each($('.viewBox'),function(i,e){
                new bootstrap.Tooltip(e)
            })
        }

        /*댓글 list 전역 함수로 등록*/


        $(function () {
            setToolTip()
            var boardNum = $(".boardNum").val();
            var boardCategory = $(".boardCategory").val();
            var userId = '${user.userId}'
            var currentPage = $(".currentPage").val()


            $.getListComment = function (currentPage) {

                $.ajax({
                    url: "/commu/json/getListComment",
                    method: "post",
                    data: JSON.stringify({
                        "boardNum": boardNum,
                        "boardCategory": boardCategory,
                        "currentPage": currentPage
                    }),
                    contentType: "application/json; charset= utf-8",
                    dataType: "json",

                    success: function (JSONData, result) {

                        var str = "";

                        $.each(JSONData.list, function (index, item) {

                            console.log(item.userImg);

                            /*css append*/
                            var stylesheet = $("<link>", {
                                rel: "stylesheet",
                                type: "text/css",
                                href: "/resources/css/comment.css"
                            });
                            stylesheet.appendTo("head");


                            if (item.commentCheck === 'n') {
                                str +=
                                    "<div class='commentList'>" +
                                    "<div class='allComment'>" +
                                    "<div class='input-group flex-nowrap commentText shadow-lg'>" +
                                    "<input hidden class='commentNum' value='" + item.commentNum + "'>" +
                                    "<input hidden class='commentUser' value='" + item.userId + "'>" +
                                    "<span class='input-group-text' id='addon-wrapping' style='width:100px;font-size:0.5em;font-weight: bolder; border-radius: 10px 0 0 10px;'>" +
                                    "<img class='commentUserImg' src='/resources/" + item.userImg + "'  alt=''>" +
                                    "</span>" +
                                    "<div class='commentContent' style='display: flex;justify-content: center;align-items: center;flex-direction: column;padding: 10px;'>" +
                                    "<div style='margin-top: -16px; margin-bottom: 13px; display: flex; width: 100%; font-size: 1.1em;margin-left: 27px;'>" + item.userId + "</div>" +
                                    "<div class='commentTexts' style=''>" + item.commentText + "</div>" +


                                    "<div class='commentitem' style='text-align: left;display: flex;'>" +
                                    "<div class=' position-relative CommentlikeButton' style='cursor: pointer''>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='6' height='16' fill='currentColor' class='bi bi-hand-thumbs-up' style='font-size: 2em' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</div>" +

                                    "<div style='padding: 10px; cursor: pointer'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize chatComment'  style='font-size: 2.5em;' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</div>" +

                                    "<div style='padding: 5px; margin-top: 3px; margin-left:-7px; cursor: pointer'>" +


                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-exclamation-lg itmesize reportComment' style='font-size: 2.5em' viewBox='0 0 16 16'>" +
                                    '<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>'+
                                    "</svg>" +
                                    "</div>" +


                                    "</div>" +
                                    "</div>" +

                                    "<div class='addbox'>" +
                                    "<div class='showRecomment' type='button'>Repley</div>" +
                                    "</div>" +


                                    "<div class='commentitembox' style='display: flex;flex-direction: row-reverse;'>" +

                                    "<div class='bntbox'>" +

                                    "<div class='d-grid gap-2 updatebox'>" +
                                    "<button class='btn btn-primary updateComment' type='button'>수정</button>" +
                                    "<button class='btn btn-primary deleteComment' type='button'>삭제</button>" +

                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +


                                    "<div class='reComent' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='recommentText' class='form-control addReommentText' placeholder='Recomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addRecomment' type='button'>대댓글 작성</button>" +
                                    "</div>" +

                                    "<div class='updateComments' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='updateComment' class='form-control updateCommentText' placeholder='updataeComment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addUpdateComment' type='button'>댓글수정하기</button>" +
                                    "</div>" +
                                    "<div class='hideRecomment'>댓글 보기</div>" +

                                    "</div>" +
                                    "</div>"


                            }


                            if (item.commentCheck === 'y') {
                                str +=

                                    "<div class='commentList'>" +
                                    "<div class='allComment'>" +
                                    "<div class='input-group flex-nowrap commentText shadow-lg' style='width: 710px;'>" +
                                    "<input hidden class='commentNum' value='" + item.commentNum + "'>" +
                                    "<input hidden class='commentUser' value='" + item.userId + "'>" +

                                    "<span class='input-group-text' id='addon-wrapping' style='width:100px;font-size:0.5em;font-weight: bolder; border-radius: 10px 0 0 10px;'>" +
                                    "</span>" +


                                    "<div class='commentTexts'  style=' 500px;'>" +
                                    "<h2>삭제된 댓글 입니다</h2>" +
                                    "</div>" +


                                    "<div class='commentitembox' style='display: none'>" +
                                    "<div class='commentitem'>" +
                                    "<button type='button' class='btn btn-primary position-relative itembutton buttonMargin CommentlikeButton chatComment'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='6' height='16'fill='currentColor' class='bi bi-hand-thumbs-up itmesize' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-primary itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize ' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-danger itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-down-fill itmesize reportComment' viewBox='0 0 16 16'>" +
                                    '<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>' +
                                    "</svg>" +
                                    "</button>" +
                                    "</div>" +

                                    "<div class='bntbox'>" +
                                    "<div class='addbox'>" +
                                    "<button class='btn btn-outline-primary showRecomment' type='button'>대댓글</button>" +
                                    "</div>" +
                                    "<div class='d-grid gap-2 updatebox' style='gap: 0.1rem !important; margin-top: -5px; float: right;'>" +
                                    "<button class='btn btn-primary updateComment' type='button'>수정</button>" +
                                    "<button class='btn btn-primary deleteComment' type='button'>삭제</button>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +


                                    "<div class='reComent' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='recommentText' class='form-control addReommentText' placeholder='Recomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addRecomment' type='button'>대댓글 작성</button>" +
                                    "</div>" +

                                    "<div class='updateComments' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='updateComment' class='form-control updateCommentText' placeholder='updataeComment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addUpdateComment' type='button'>댓글수정하기</button>" +

                                    "</div>" +

                                    "</div>" +
                                    "</div>"


                            }


                            $.each(item.recommentList, function (index2, item) {

                                str +=
                                    "<div class='allRecomment' style='display: none;'>" +
                                    "<div class='recommentplz'  style='margin-left: 265px;'>" +
                                    '<div class="arrow">' +
                                    '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">' +
                                    '<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>' +
                                    '</svg>' +
                                    '</div>' +
                                    "<div class='RecommentList' style='display: flex; flex-direction: column;'>" +
                                    "<div class='input-group flex-nowrap RecommentText shadow-lg'>" +
                                    "<input hidden class='recommentNum' value='" + item.recommentNum + "'>" +
                                    "<input hidden class='recommentUser' value='" + item.userId + "'>" +
                                    "<input hidden class='commentNumfor' value='" + item.commentNum + "'>" +


                                    "<span class='input-group-text' style='border-radius: 10px 0 0 10px'>" +
                                    "<img class='recommentUserImg' src='/resources/" + item.userImg + "'  alt=''>" +
                                    "</span>" +

                                    "<div class='commentContent' style='display: flex;justify-content: center;align-items: center;flex-direction: column;padding: 10px;'>" +
                                    "<div style='margin-top: -16px; margin-bottom: 13px; display: flex; width: 100%; font-size: 1.1em; margin-left: 5px;'>" + item.userId + "</div>" +
                                    "<div class='RecommentTexts' style=' 510px; text-align: left'>" + item.recommentText + "</div>" +


                                    "<div class='commentitem'>" +
                                    "<div class=' position-relative RecommentlikeButton' style='cursor: pointer''>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='6' height='16' fill='currentColor' class='bi bi-hand-thumbs-up' style='font-size: 2em' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger RelikeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</div>" +

                                    "<div style='padding: 10px; cursor: pointer'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize chatRecomment'  style='font-size: 2.5em;' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</div>" +




                                    "<div style='padding: 5px; margin-top: -3px; margin-left: -10px; cursor: pointer'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-exclamation-lg reportRecomment' style='font-size: 2em;' viewBox='0 0 16 16'>" +
                                        '<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>'+
                                    "</svg>" +
                                    "</div>" +


                                    "</div>" +
                                    "</div>" +

                                    "<div class='addbox'>" +
                                    "<div class='showRecomment2' type='button'>Repley</div>" +
                                    "</div>" +


                                    "<div class='commentitembox' style='display: flex;flex-direction: row-reverse;'>" +

                                    "<div class='bntbox'>" +

                                    "<div class='d-grid gap-2 updatebox'>" +
                                    "<button class='btn btn-primary updateRecomment' type='button'>수정</button>" +
                                    "<button class='btn btn-primary deleteRecomment' type='button'>삭제</button>" +

                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +

                                    "<div class='updateRecomments' style='margin-bottom: 30px; align-content: center; flex-direction: column; display: none;'>" +
                                    "<textarea name='updateRecomment' class='form-control updateRecommentText' placeholder='updataeRecomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addUpdateRecomment' type='button'>대댓글수정하기</button>" +
                                    "</div>" +

                                    "<div class='reComent2' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='recommentText' class='form-control addReommentText' placeholder='Recomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addRecomment' type='button'>대댓글 작성</button>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>"



                            })
                            $(".commentplz").html("");


                            $(".commentplz").append(str);
                            setToolTip()

                        })


                        $(".updateComment").off("click").on("click", function () {

                            var commentUser = $(this).parents(".commentList").find(".commentUser").val()

                            if (userId === commentUser) {

                                $(this).parents(".commentList").find(".updateComments").slideToggle();

                            } else if (userId !== commentUser) {

                                Swal.fire({
                                    icon: 'error',
                                    title: '작성자만 수정 할수 있습니다',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                })
                            }

                        })


                        $(".addUpdateComment").off("click").on("click", function () {

                            var commentText = $(this).parents(".commentList").find(".updateCommentText").val();
                            var commentNum = $(this).parents(".commentList").find(".commentNum").val()

                            console.log(commentText);

                            $.ajax({
                                url: "/commu/json/updateComment",
                                type: "POST",
                                data: JSON.stringify({
                                    "commentText": commentText,
                                    "commentNum": commentNum
                                }),
                                dataType: "json",
                                contentType: 'application/json; charset=UTF-8',
                                success: function (JSONData, result) {
                                    console.log(result);

                                    $(".allComment").remove();
                                    $.getListComment(currentPage);
                                }

                            })
                        })

                        $(".deleteComment").off("click").on("click", function () {

                            var commentUser = $(this).parents(".commentList").find(".commentUser").val()

                            var commentNum = $(this).parents(".commentText").find(".commentNum").val()

                            console.log(commentNum);

                            if (userId === commentUser) {

                                $.ajax({
                                    url: "/commu/json/deleteComment",
                                    type: "POST",
                                    data: JSON.stringify({"commentNum": commentNum}),
                                    dataType: "json",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {
                                        console.log(result);

                                        $(".allComment").remove();

                                        $.getListComment(currentPage);
                                    }

                                })
                            } else if (userId !== commentUser) {
                                Swal.fire({
                                    icon: 'error',
                                    title: '작성자만 삭제 할수 있습니다',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                })
                            }

                        })

                        $(".showRecomment").off("click").on("click", function () {

                            if (userId !== '') {

                                $(this).parents(".commentList").find(".reComent").slideToggle();

                            } else if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            }


                        })

                        $(".showRecomment2").off("click").on("click", function () {

                            if (userId !== '') {

                                $(this).parents(".RecommentList").find(".reComent2").slideToggle();

                            } else if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )
                            }




                        })


                        /*대댓*/
                        $(".addRecomment").off("click").on("click", function () {

                            var recommentText = $(this).parents(".commentList").find(".addReommentText").val();
                            var commentNum = $(this).parents(".commentList").find(".commentNum").val()

                            console.log(commentNum);
                            console.log(recommentText);

                            $.ajax({
                                url: "/commu/json/addRecomment",
                                type: "POST",
                                data: JSON.stringify({
                                    "recommentText": recommentText,
                                    "commentNum": commentNum
                                }),
                                dataType: "json",
                                contentType: 'application/json; charset=UTF-8',
                                success: function (JSONData, result) {
                                    console.log(JSONData);

                                    $(".allComment").remove();
                                    $.getListComment(currentPage);

                                }
                            })
                        })

                        $(".updateRecomment").off("click").on("click", function () {

                            var recommentUser = $(this).parents(".RecommentList").find(".recommentUser").val()

                            if (userId !== recommentUser) {

                                Swal.fire({
                                    icon: 'error',
                                    title: '작성자만 수정 할수 있습니다',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                })

                            } else if (userId === recommentUser) {

                                $(this).parents(".RecommentList").find(".updateRecomments").slideToggle();
                            }
                        })

                        $(".addUpdateRecomment").off("click").on("click", function () {
                            var recommentNum = $(this).parents(".RecommentList").find(".recommentNum").val()
                            var recommentText = $(this).parents(".RecommentList").find(".updateRecommentText").val();


                            $.ajax({
                                url: "/commu/json/updateRecomment",
                                type: "POST",
                                data: JSON.stringify({
                                    "recommentNum": recommentNum,
                                    "recommentText": recommentText
                                }),
                                dataType: "json",
                                contentType: 'application/json; charset=UTF-8',
                                success: function (JSONData, result) {
                                    console.log(result);

                                    $(".allComment").remove();
                                    $.getListComment(currentPage);
                                }
                            })
                        })

                        $(".deleteRecomment").off("click").on("click", function () {

                            var recommentUser = $(this).parents(".RecommentList").find(".recommentUser").val()



                            if (userId === recommentUser) {

                                var recommentNum = $(this).parents(".RecommentList").find(".recommentNum").val()

                                console.log(recommentNum);

                                $.ajax({
                                    url: "/commu/json/deleteRecomment",
                                    type: "POST",
                                    data: JSON.stringify({"recommentNum": recommentNum}),
                                    dataType: "json",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {
                                        console.log(JSONData);

                                        $(".allComment").remove();
                                        $.getListComment(currentPage);
                                    }
                                })
                            } else if (recommentUser !== userId) {
                                Swal.fire({
                                    icon: 'error',
                                    title: '작성자가 아니면 삭제 할수 없습니다',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                })
                            }
                        })


                        $(".CommentlikeButton").off("click").on("click", function () {

                            if (userId === '' || userId === null) {

                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            } else if (userId !== '') {

                                var likeCount = $(this).parents(".commentList").find(".likeText");
                                var boardNum = $(this).parents(".commentList").find(".commentNum").val();
                                var boardCategory = "10";


                                $.ajax({
                                    url: "/commu/json/addLike",
                                    type: "POST",
                                    data: JSON.stringify({
                                        "likeCount": likeCount.html(),
                                        "boardNum": boardNum,
                                        "boardCategory": boardCategory,
                                    }),
                                    dataType: "JSON",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {


                                        likeCount.html(JSONData);
                                    }
                                })
                            }

                        })

                        $(".RecommentlikeButton").off("click").on("click", function () {

                            var likeCount = $(this).parents(".RecommentList").find(".RelikeText");
                            var boardNum = $(this).parents(".RecommentList").find(".recommentNum").val();

                            var boardCategory = "11";

                            if (userId === '' || userId === null) {

                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            } else if (userId !== '') {

                                $.ajax({
                                    url: "/commu/json/addLike",
                                    type: "POST",
                                    data: JSON.stringify({
                                        "likeCount": likeCount.html(),
                                        "boardNum": boardNum,
                                        "boardCategory": boardCategory,
                                    }),
                                    dataType: "JSON",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {


                                        likeCount.html(JSONData);
                                    }
                                })
                            }

                        })

                        $(".chatComment").on("click", function () {
                            var commentUser = $(this).parents(".commentList").find(".commentUser").val();

                            if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            } else {


                                if (userId === commentUser) {

                                    return false;

                                } else if (userId !== commentUser) {

                                    const swalWithBootstrapButtons = Swal.mixin({
                                        customClass: {
                                            confirmButton: 'btn btn-success',
                                            cancelButton: 'btn btn-danger'
                                        },
                                        buttonsStyling: false
                                    })

                                    swalWithBootstrapButtons.fire({
                                        title: '해당 유저와 채팅을 하기겠습니까?',
                                        text: "",
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonText: '초대',
                                        cancelButtonText: '취소',
                                        reverseButtons: true
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            swalWithBootstrapButtons.fire(
                                                commentUser + ' 님이 초대 되었습니다',
                                                'success',
                                            ).then(()=>{
                                                var openWin = window.open("/chat/chatList?chatCategory=onebyone", 'chatList')
                                                $.ajax({
                                                    url: "/chat/addOneChat",
                                                    data: {
                                                        'userId': commentUser,
                                                        'chatNameSpace': 'onebyone',
                                                        'roomName': commentUser
                                                    },
                                                    success: function (re) {
                                                        // console.log(re)
                                                        let loadCheck = true
                                                        setInterval(function () {
                                                            if (loadCheck) {
                                                                if ($(openWin.document).find('.chatRoom').html() !== undefined) {
                                                                    $(openWin.document).find('.chatRoom').html(re)
                                                                    loadCheck = false
                                                                }
                                                            }
                                                        }, 1000)
                                                    }
                                                })
                                            })
                                        } else if (
                                            /* Read more about handling dismissals below */
                                            result.dismiss === Swal.DismissReason.cancel
                                        ) {
                                            swalWithBootstrapButtons.fire(
                                                '초대 취소',
                                                'error'
                                            )
                                        }
                                    })
                                }
                            }

                        })

                        $(".chatRecomment").off("click").on("click", function () {

                            var recommentUser = $(this).parents(".RecommentList").find(".recommentUser").val();


                            if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )


                            } else if (userId !== recommentUser) {

                                const swalWithBootstrapButtons = Swal.mixin({
                                    customClass: {
                                        confirmButton: 'btn btn-success',
                                        cancelButton: 'btn btn-danger'
                                    },
                                    buttonsStyling: false
                                })

                                swalWithBootstrapButtons.fire({
                                    title: '해당 유저와 채팅을 하기겠습니까?',
                                    text: "",
                                    icon: 'warning',
                                    showCancelButton: true,
                                    confirmButtonText: '초대',
                                    cancelButtonText: '취소',
                                    reverseButtons: true
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        swalWithBootstrapButtons.fire(
                                            commentUser + ' 님이 초대 되었습니다',
                                            'success',
                                        )
                                        setTimeout(() => (
                                            window.open("/chat/addOneChat/" + commentUser, "채팅방",
                                                "left=500, top=100, width=500px, height=500px, marginwidth=0, marginheight=0,")

                                        ), 2500)
                                    } else if (
                                        /* Read more about handling dismissals below */
                                        result.dismiss === Swal.DismissReason.cancel
                                    ) {
                                        swalWithBootstrapButtons.fire(
                                            '초대 취소',
                                            'error'
                                        )
                                    }
                                })
                            }


                        })


                        $(".hideRecomment").off("click").on("click", function () {

                            $(this).parents(".commentList").nextUntil(".commentList").slideToggle();

                        })


                        $(".reportComment").on("click", function () {

                            if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            } else if (userId !== '') {

                                var boardNum = $(this).parents(".commentList").find(".commentNum").val()
                                var boardCategory = "10";
                                var reportedId = $(this).parents(".commentList").find(".commentUser").val();


                                $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp",
                                    {boardNum: boardNum, boardCategory: boardCategory, reportedId: reportedId},
                                    function (re) {

                                        // console.log(re);
                                        $("#commuReport .modal-content").html(re);

                                        $("#commuReport").modal("show");
                                    })
                            }
                        })


                        $(".reportRecomment").off("click").on("click", function () {

                            if (userId === '' || userId === null) {


                                Swal.fire({
                                    icon: 'error',
                                    title: '사용할수 없는 기능 입니다',
                                    text: '로그인후 사용해 주세요',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                }).then(()=>{
                                        $("#loginModal").modal("show")
                                    }
                                )

                            } else if (userId !== '') {

                                var boardNum = $(this).parents(".RecommentList").find(".recommentNum").val();
                                var boardCategory = "11";
                                var reportedId = $(this).parents(".RecommentList").find(".recommentUser").val();


                                $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp",
                                    {boardNum: boardNum, boardCategory: boardCategory, reportedId: reportedId},
                                    function (re) {

                                        // console.log(re);
                                        $("#commuReport .modal-content").html(re);

                                        $("#commuReport").modal("show");
                                    })
                            }
                        })
                        setToolTip()
                    }
                })
            }
        })


        $(function () {

            var userId = '${user.userId}'

            var boardNum = $(".boardNum").val();
            var boardCategory = $(".boardCategory").val()
            var currentPage = $(".currentPage").val()


            /*조회수*/

            $(".delete").on("click", function () {


                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: '정말 삭제 하시겠습니까?',
                    text: "삭제하면 해당 게시글을 볼수 없습니다",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/commu/deleteBoard?boardNum=" + boardNum + "&boardCategory=" + boardCategory
                        swalWithBootstrapButtons.fire(
                            '삭제 성공!',
                            'success'
                        )
                    } else if (
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel
                    ) {
                        swalWithBootstrapButtons.fire(
                            '삭제 취소',
                            'error'
                        )
                    }
                })
            });

            $(".update").on("click", function () {


                console.log(boardNum);
                console.log(boardCategory);

                $.ajax({
                    url: "/clubCal/json/getClubCalenderReview",
                    method: "post",
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    data: JSON.stringify({
                        "clubCalenderReviewNum": boardNum,
                        "boardCategory": boardCategory
                    }),
                    success: function (JSONData, result) {

                        var clubCalender = JSONData.clubCalender;
                        $(".reviewTitle").val(clubCalender.reviewTitle);
                        $(".reviewText").val(clubCalender.reviewText);
                        $(".reviewRange").val(clubCalender.reviewRange);
                        $(".clubDate").val(clubCalender.clubDate);
                        $(".clubCalenderReviewNum").val(clubCalender.clubCalenderReviewNum);
                        $(".file").val(clubCalender.file.fileName)


                    }

                })

            });

            $(".submit").on("click", function () {
                var reviewTitle = $(".reviewTitle").val();
                var reviewText = $(".reviewText").val();
                var reviewRange = $(".reviewRange").val();
                var location = $(".location").val()


                $.ajax({
                    url: "/clubCal/json/updateClubCalenderReview",
                    method: "post",
                    data: JSON.stringify({
                        "clubCalenderReviewNum": boardNum,
                        "boardCategory": boardCategory,
                        "reviewTitle": reviewTitle,
                        "reviewText": reviewText,
                        "reviewRange": reviewRange,
                        "location": location
                    }),
                    dataType: "json",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {

                        console.log(JSONData);

                        var boardNum = $(".clubCalenderReviewNum").val();

                        var file = $("#updateForm #file").length;

                        if (file > 0) {


                            //form 테그를 불러와서 form변수에 등록
                            var form = document.querySelector("form");
                            //formData 변수에 html에서 form과 같은 역활을 하는 javaScript의 FormData에 form을 넣는다
                            var formData = new FormData(form);
                            //파일 사이즈만큼 formData을 돌리기 위해 fileSize를 알아내는 변수
                            var fileSize = $("#updateForm #file")[0].files;

                            //formData에 해당 게시글 번호, 게시글 category append
                            formData.append("boardNum", boardNum);
                            formData.append("boardCategoru", boardCategory);

                            console.log(formData);

                            //file길이 만큼 for문으로 formData에 append함
                            for (var i = 0; i < fileSize.length; i++) {
                                formData.append("form", fileSize[i]);
                                //파일이 잘 들어 갔는지 확인
                                console.log(fileSize[i]);
                            }
                            //formData에 들어 있는 boardNum과 file의 정보를 비동기식으로 보냄
                            //파일은 json형식으로 보낼수 없기 떄문에 contentType, processData, dataType을 false로 지정
                            $.ajax({
                                url: "/clubCal/json/fileUpdate",
                                type: "post",
                                processData: false,
                                contentType: false,
                                cache: false,
                                timeout: 600000,
                                data: formData,
                                headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                                enctype: "multipart/form-data",
                                success: function (result) {

                                    console.log(result);

                                }

                            })
                        }
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            window.location.reload()
                        }, 2000);
                        //error 발생시 그냥 창을 닫음
                    }, error: function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        setTimeout(function () {
                            window.location.reload()
                        }, 2000);

                    }
                });

            });


            $(document).ready(function () {

                var viewCount = $(".viewText").html();
                var currentPage = $(".currentPage").val()


                $.ajax({
                    url: "/commu/json/viewCount",
                    type: "POST",
                    data: JSON.stringify({
                        "viewCount": viewCount,
                        "boardNum": boardNum,
                        "boardCategory": boardCategory
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',
                    success: function (JSONData, result) {

                        $(".viewText").html(JSONData);
                    }
                })

                /*좋아요 버튼*/
                $(".boardLikeButton").on("click", function () {


                    if (userId === '' || userId === null) {

                        Swal.fire({
                            icon: 'error',
                            title: '사용할수 없는 기능 입니다',
                            text: '로그인후 사용해 주세요',
                            footer: '<a href="">Why do I have this issue?</a>'
                        }).then(()=>{
                                $("#loginModal").modal("show")
                            }
                        )

                    } else if (userId !== '') {
                        var likeCount = $(".boardLikeText").html();
                        var boardNum = $(".boardNum").val();
                        var boardCategory = $(".boardCategory").val()

                        console.log(boardNum);

                        $.ajax({
                            url: "/commu/json/addLike",
                            type: "POST",
                            data: JSON.stringify({
                                "likeCount": likeCount,
                                "boardNum": boardNum,
                                "boardCategory": boardCategory
                            }),
                            dataType: "JSON",
                            contentType: 'application/json; charset=UTF-8',
                            success: function (JSONData, result) {


                                $(".boardLikeText").html(JSONData);
                            }
                        })

                    }
                })


                $(".addcomment").on("click", function () {

                    if (userId === '' || userId === null) {


                        Swal.fire({
                            icon: 'error',
                            title: '사용할수 없는 기능 입니다',
                            text: '로그인후 사용해 주세요',
                            footer: '<a href="">Why do I have this issue?</a>'
                        }).then(()=>{
                                $("#loginModal").modal("show")
                            }
                        )

                    } else {

                        var commentText = $(".addCommentText").val();

                        boardCategory.trim();

                        console.log(commentText);

                        $.ajax({
                            url: "/commu/json/addComment",
                            type: "POST",
                            data: JSON.stringify({
                                "commentText": commentText,
                                "boardNum": boardNum,
                                "boardCategory": boardCategory
                            }),
                            dataType: "json",
                            contentType: 'application/json; charset=UTF-8',
                            success: function (JSONData, result) {
                                /*append 초기화*/
                                /*getListComment 호출*/

                                $(".addCommentText").html(" ");

                                $.getListComment(currentPage);
                            },

                        })
                    }
                })
            })


            $(".chating").on("click", function () {
                var boardUserId = $(".boardUserId").val();

                if (userId === '') {

                    Swal.fire({
                        icon: 'error',
                        title: '사용할수 없는 기능 입니다',
                        text: '로그인후 사용해 주세요',
                        footer: '<a href="">Why do I have this issue?</a>'
                    }).then(()=>{
                            $("#loginModal").modal("show")
                        }
                    )

                } else {

                    if (userId === boardUserId) {

                        return null;

                    } else if (userId !== boardUserId) {

                        const swalWithBootstrapButtons = Swal.mixin({
                            customClass: {
                                confirmButton: 'btn btn-success',
                                cancelButton: 'btn btn-danger'
                            },
                            buttonsStyling: false
                        })

                        swalWithBootstrapButtons.fire({
                            title: '해당 유저와 채팅을 하기겠습니까?',
                            text: "",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: '초대',
                            cancelButtonText: '취소',
                            reverseButtons: true
                        }).then((result) => {
                            if (result.isConfirmed) {
                                swalWithBootstrapButtons.fire(
                                    boardUserId + ' 님이 초대 되었습니다',
                                    'success',
                                ).then(() => {
                                    var openWin = window.open("/chat/chatList?chatCategory=onebyone", 'chatList')
                                    $.ajax({
                                        url: "/chat/addOneChat",
                                        data: {
                                            'userId': boardUserId,
                                            'chatNameSpace': 'onebyone',
                                            'roomName': boardUserId
                                        },
                                        success: function (re) {
                                            // console.log(re)
                                            let loadCheck = true
                                            setInterval(function () {
                                                if (loadCheck) {
                                                    if ($(openWin.document).find('.chatRoom').html() !== undefined) {
                                                        $(openWin.document).find('.chatRoom').html(re)
                                                        loadCheck = false
                                                    }
                                                }
                                            }, 1000)
                                        }
                                    })
                                })
                            } else if (
                                /* Read more about handling dismissals below */
                                result.dismiss === Swal.DismissReason.cancel
                            ) {
                                swalWithBootstrapButtons.fire(
                                    '초대 취소',
                                    'error'
                                )
                            }
                        })
                    }
                }

            })


            $(".report").on("click", function () {

                if (userId === '' || userId === null) {

                    Swal.fire({
                        icon: 'error',
                        title: '사용할수 없는 기능 입니다',
                        text: '로그인후 사용해 주세요',
                        footer: '<a href="">Why do I have this issue?</a>'
                    }).then(()=>{
                            $("#loginModal").modal("show")
                        }
                    )

                } else if (userId !== '') {

                    var boardNum = $(".boardNum").val();
                    var boardCategory = $(".boardCategory").val()
                    var reportedId = $(".boardUserId").val();


                    $("#commuReport .modal-content").load("/view/site/addCommunityReport.jsp",
                        {boardNum: boardNum, boardCategory: boardCategory, reportedId: reportedId},
                        function (re) {

                            // console.log(re);
                            $("#commuReport .modal-content").html(re);

                            $("#commuReport").modal("show");
                        })
                }
            })

            /*댓글 무한 스크롤*/
            let loadCheck = false
            $(window).on("scroll", function () {
                if (($(document).height() - $(window).height()) - ($(window).scrollTop()) < 200) {
                    if (loadCheck) {
                        return
                    }
                    loadCheck = true
                    console.log("성공");

                    $(".currentPage").val(parseInt($(".currentPage").val()) + 1)

                    var currentPage = $(".currentPage").val();


                    $.getListComment(currentPage);


                }
            })

            $(".user_manu").on("click", function () {
                $(".user_hidden_manu").slideToggle();
            })


            $(".getClub").on("click", function () {

                var clubNum = $(".clubNum").val();

                Swal.fire({
                    title: '해당 모임 페이지로 이동하시겠습니까??',
                    text: "해당 페이지로 이동합니다",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: "취소",
                    confirmButtonText: '페이지이동'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            '페이지를 이동 합니다',
                            'success'
                        )

                        setTimeout(() => {
                            location.href = "/club/getClub/" + clubNum
                        }, 1500)
                    }
                })


            })

        })

    </script>

<body class="bg-light p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<jsp:include page="/layout/toolbar.jsp"/>


<div class="container" style=" display: flex; align-items: center;  justify-content: center;  flex-direction: column;">
    <input type="hidden" class="userId" value="${user.userId}">
    <input hidden class="boardNum" value="${calenderReview.clubCalenderReviewNum}">
    <input hidden class="boardCategory" value="${calenderReview.boardCategory}">
    <input hidden class="boardUserId" value="${calenderReview.userId}">
    <input hidden class="clubNum" value="${calenderReview.clubNum}"/>
    <input hidden class="currentPage" name="currentPage" value="1">

    <jsp:include page="/layout/commubar.jsp"/>

    <div class="container">


        <div class="usedbox">

            <div class="thumbnailBox ">

                <div class="shadow-lg  midle">
                    <div class="ReviewTop" style="display: flex;justify-content: space-between">
                        <div style="display: flex; align-items: center;width: 100%">

                            <div class="userImg">
                                <img src="/resources/${calenderReview.userImg}" alt=""
                                     style="border-radius: 10px; aspect-ratio: 1; height: 100%;object-fit: cover;">
                            </div>
                            <div class="userInfo" style="width: 20%;">
                                <div>
                                    ${calenderReview.userId}
                                </div>
                                <div style="font-size: 0.7em; margin-top: 5px;  text-align: left;">
                                    ${calenderReview.location}
                                </div>
                            </div>
                            <div class="reviewTitle2">
                                ${calenderReview.reviewTitle}
                            </div>
                        </div>
                        <div>

                            <div>

                                <div class="user_manu">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-three-dots" viewBox="0 0 16 16">
                                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                                    </svg>
                                </div>

                                <div class="user_hidden_manu" style="display: none">
                                    <ul class=" shadow-lg">
                                        <li class="getClub">
                                            모임 방문하기
                                        </li>

                                        <c:if test="${user.userId eq calenderReview.userId}">
                                            <li data-bs-toggle="modal" data-bs-target="#exampleModal" class="update">
                                                수정
                                            </li>
                                            <li class="delete">
                                                삭제
                                            </li>
                                        </c:if>

                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="carouselExampleDark" class=" carousel carousel-dark slide"
                         data-bs-ride="carousel">
                        <div class="carousel-inner" style="height: 529px;">
                            <c:set var="i" value="0"/>
                            <c:forEach var="File" items="${calenderReview.file}">
                                <c:set var="i" value="${i+1}"/>
                                <div class="carousel-item active" data-bs-interval="3000"
                                     style=" background-color: #FFFFFF;">
                                    <img class="potos" style="object-fit: contain" src="/resources${File.fileName}">
                                </div>
                            </c:forEach>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"
                                  style="z-index: 3; position: absolute;"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"
                                  style="z-index: 3; position: absolute;"></span>
                            <span class="visually-hidden">Next</span>
                        </button>

                    </div>
                    <div class="likebox " style=" height: 250px;">

                        <div class="row textboxrow">
                            <div class="col-10">
                                <label for="exampleFormControlTextarea1" class="form-label"></label>
                                <textarea class="form-control" id="exampleFormControlTextarea1"
                                          rows="3"
                                          style="  margin-left: 10px; width: 1080px; height: 100px; margin-top: -20px;"
                                          readonly
                                          placeholder="${calenderReview.reviewText}"></textarea>
                            </div>
                        </div>

                        <div class="itembox" style="padding: 20px; margin-top: 10px;">

                            <div class="clickBox">

                                <div class="btn btn-primary position-relative  buttonBox  boardLikeButton">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                         fill="currentColor"
                                         class="bi bi-hand-thumbs-up" viewBox="0 0 16 16" style="font-size: 1.7em;">
                                        <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                    </svg>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger boardLikeText"
                                          style=" z-index: 1; font-size: 0.5em;">${calenderReview.likeConunt}</span>
                                </div>

                                <div class="btn btn-secondary position-relative position-relative buttonBox viewBox">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                         fill="currentColor"
                                         class="bi bi-eye" viewBox="0 0 16 16" style="font-size: 1.7em">
                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                    </svg>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText" style="z-index: 1; font-size: 0.5em;">${calenderReview.viewCount}</span>
                                </div>

                                <div type="button" class="btn btn-success chating" style=" font-size: 1.9em;height: 42px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-chat-left-quote "
                                         viewBox="0 0 16 16" style="margin-top: -22px;">
                                        <path
                                                d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                        <path
                                                d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                                    </svg>
                                </div>


                                <div class="btn btn-danger buttonBox report">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-lg" style="font-size: 1.7em" viewBox="0 0 16 16">
                                        <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/><path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                                    </svg>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


                <%--댓글 등록--%>
                <div class="commentContiner">
                    <div class="commentbox shadow-lg">
                        <div class="commentadd">
                            <div class="form-floating">
                             <textarea name="commentText" class="form-control addCommentText"
                                       placeholder="Leave a comment here"
                                       id="floatingTextarea2" style="height: 100px"></textarea>
                                <label for="floatingTextarea2">Comments</label>
                                <a class="button addcomment">등록</a>
                            </div>
                        </div>
                        <div class="commentplz">


                        </div>
                    </div>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <input name="clubCalenderReviewNum" class="clubCalenderReviewNum" hidden value="">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel"> 모임 일정 후기글 수정 </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <form id="updateForm">

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control reviewTitle" id="recipient-name"
                                               value=""
                                               placeholder="asdasd">
                                        <label for="recipient-name">제 목</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <textarea type="text" class="form-control reviewText" id="message-text"
                                               value=""
                                                  placeholder="asdasd"/></textarea>
                                        <label for="message-text">내용</label>
                                    </div>

                                    <div class="form-floating mb-3">

                                        <select class="form-select reviewRange" name="reviewRange"
                                                id="floatingSelect">
                                            <option selected>공개 여부를 선택 하세요</option>
                                            <option value="1">전체 공개</option>
                                            <option value="2">모임 공개</option>
                                        </select>

                                        <label for="floatingSelect">공개 여부</label>


                                    </div>

                                    <div class="input-group mb-3">
                                        <input type="file" id="file" class="form-control file" multiple
                                               value="파일 첨부">
                                    </div>


                                </form>

                            </div>

                            <div class="modal-footer">

                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary submit">수정</button>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <jsp:include page="/layout/chatIcon.jsp"/>

        </div>
    </div>

    <div class="modal fade" id="commuReport" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">


            </div>
        </div>
    </div>

</body>
</html>