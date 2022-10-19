<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
          rel="stylesheet">
    <link href="/resources/css/comment.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


    <script type="text/javascript">
        /*댓글 list 전역 함수로 등록*/
        $(function () {
            var boardNum = $(".boardNum").val();
            var boardCategory = $(".boardCategory").val();
            var userId = $(".userId").val()

            $.getListComment = function () {


                $.ajax({
                    url: "/commu/json/getListComment",
                    method: "post",
                    data: JSON.stringify({
                        "boardNum": boardNum,
                        "boardCategory": boardCategory
                    }),
                    contentType: "application/json; charset= utf-8",
                    dataType: "json",

                    success: function (JSONData, result) {

                        var str = "";

                        $.each(JSONData.list, function (index, item) {

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
                                    "<div class='input-group flex-nowrap commentText shadow-lg' style='width: 710px;'>" +
                                    "<input hidden class='commentNum' value='" + item.commentNum + "'>" +
                                    "<input hidden class='commentUser' value='" + item.userId + "'>" +

                                    "<span class='input-group-text' id='addon-wrapping' style='width:100px;font-size:0.5em;font-weight: bolder; border-radius: 10px 0 0 10px;'>" +
                                    "<img src='/resources/images/pngwing.png' style='width: 20px; margin-right: 10px;' alt=''>" + item.userId +
                                    "</span>" +

                                    "<div class='commentTexts' style=' 510px;'>" + item.commentText +
                                    "</div>" +


                                    "<div class='commentitembox'>" +
                                    "<div class='commentitem'>" +
                                    "<button type='button' class='btn btn-primary position-relative itembutton buttonMargin CommentlikeButton'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='6' height='16'fill='currentColor' class='bi bi-hand-thumbs-up itmesize' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-primary itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize addchat' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-danger itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-down-fill itmesize' viewBox='0 0 16 16'>" +
                                    " <path  d='M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z'/>" +
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
                                    "</div>" +


                                    "<div class='recommentplz'>" +
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
                                    "<button type='button' class='btn btn-primary position-relative itembutton buttonMargin CommentlikeButton'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='6' height='16'fill='currentColor' class='bi bi-hand-thumbs-up itmesize' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-primary itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize addchat' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-danger itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-down-fill itmesize' viewBox='0 0 16 16'>" +
                                    " <path  d='M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z'/>" +
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
                                    "</div>" +


                                    "<div class='recommentplz'>" +
                                    "</div>"
                            }


                            $.each(item.recommentList, function (index2, item) {
                                console.log(item.recommentNum);

                                str +=
                                    '<div class="arrow " style="display: flex; position: absolute; font-size: 3rem;  margin-left: 100px; flex-direction: column;">'+
                                    '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">'+
                                        '<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>'+
                                    '</svg>'+
                                    '</div>'+
                                    "<div class='RecommentList' style='display: flex; flex-direction: column;'>" +
                                    "<div class='input-group flex-nowrap RecommentText shadow-lg' style='width: 510px; margin-left: 210px; background: #ebcdcdb8;'>"+
                                    "<input hidden class='recommentNum' value='" + item.recommentNum + "'>" +
                                    "<input hidden class='recommentUser' value='" + item.userId + "'>" +
                                    "<input hidden class='commentNumfor' value='" + item.commentNum + "'>" +
                                    "<span class='input-group-text' style='width:100px;font-size:0.5em;font-weight: bolder; border-radius: 10px 0 0 10px;'>" +
                                    "<img src='/resources/images/pngwing.png' style='width: 20px; margin-right: 10px;' alt=''>" +
                                    item.userId + "</span>" +
                                    "<div class='RecommentTexts' style='width: 375px;'>" +
                                    item.recommentText +
                                    "</div>" +
                                    "<div class='Recommentitembox'>" +
                                    "<div class='Recommentitem'>" +
                                    "<button type='button' class='btn btn-primary position-relative itembutton buttonMargin RecommentlikeButton'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up itmesize' viewBox='0 0 16 16'>" +
                                    "<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
                                    "</svg>" +
                                    "<span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger RelikeText' style='z-index: 1; font-size: 0.5em;'>" + item.likeCount + "</span>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-primary itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chat-left-quote itmesize addchat' viewBox='0 0 16 16'>" +
                                    "<path d='M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>" +
                                    "<path d='M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z'/>" +
                                    "</svg>" +
                                    "</button>" +

                                    "<button type='button' class='btn btn-outline-danger itembutton buttonMargin'>" +
                                    "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-down-fill itmesize' viewBox='0 0 16 16'>" +
                                    "<path d='M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z'/> " +
                                    "</svg>" +
                                    "</button>" +
                                    "</div>" +

                                    "<div class='bntbox'>" +
                                    "<div class='addbox'>" +
                                    "<button class='btn btn-outline-primary showRecomment2' type='button'>대댓글</button>" +
                                    "</div>" +

                                    "<div class='d-grid gap-2 updatebox' style='gap: 0.1rem !important; margin-top:-5px;'>" +
                                    "<button class='btn btn-primary updateRecomment' type='button'>수정</button>" +
                                    "<button class='btn btn-primary deleteRecomment' type='button'>삭제</button>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +


                                    "<div class='updateRecomments' style='margin-top: 100px;margin-bottom: 30px; align-content: center; margin-left: -600px; flex-direction: column; display: none;'>" +
                                    "<textarea name='updateRecomment' class='form-control updateRecommentText' placeholder='updataeRecomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addUpdateRecomment' type='button'>대댓글수정하기</button>" +
                                    "</div>" +

                                    "<div class='reComent2' style='margin-top: 10px; margin-bottom: 30px; text-align: -webkit-center; display: none;'>" +
                                    "<textarea name='recommentText' class='form-control addReommentText' placeholder='Recomment' style='height: 70px; width: 500px; margin-bottom: 10px;'></textarea>" +
                                    "<button class='btn btn-primary addRecomment' type='button'>대댓글 작성</button>" +
                                    "</div>" +
                                    "</div>"


                            })
                            $(".commentplz").html("");

                            $(".commentplz").append(str);


                        })

                        var commentUser = $(".commentUser").val()


                        $(".updateComment").on("click", function () {

                            if (userId === commentUser) {

                                $(this).parents(".commentList").find(".updateComments").slideToggle();

                            } else if (userId !== commentUser) {

                                alert("작성자가 아니면 이용 할수 없습니다");
                            }

                        })


                        $(".addUpdateComment").on("click", function () {

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
                                    $.getListComment();
                                }

                            })
                        })

                        $(".deleteComment").on("click", function () {

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

                                        $.getListComment();
                                    }

                                })
                            } else if (userId !== commentUser) {
                                alert("작성자가 아니면 이용 할수 없습니다")
                            }

                        })

                        $(".showRecomment").on("click", function () {

                            if (userId !== '') {

                                $(this).parents(".commentList").find(".reComent").slideToggle();

                            } else if (userId === '' || userId === null) {

                                alert("로그인후 이용 해주세요");
                            }


                        })

                        $(".showRecomment2").on("click", function () {

                            if (userId !== '') {

                                $(this).parents(".RecommentList").find(".reComent2").slideToggle();

                            } else if (userId === '' || userId === null) {

                                alert("로그인후 이용 해주세요");
                            }


                        })

                        var recommentUser = $(".recommentUser").val()


                        /*대댓*/
                        $(".addRecomment").on("click", function () {

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
                                    $.getListComment();

                                }
                            })
                        })

                        $(".updateRecomment").on("click", function () {
                            if (userId !== recommentUser) {

                                alert("작성자가 아니면 수정 할수 없습니다")

                            } else if (userId === recommentUser) {

                                $(this).parents(".RecommentList").find(".updateRecomments").slideToggle();
                            }
                        })

                        $(".addUpdateRecomment").on("click", function () {
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
                                    $.getListComment();
                                }
                            })
                        })

                        $(".deleteRecomment").on("click", function () {
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
                                        $.getListComment();
                                    }
                                })
                            } else if (recommentuser !== userId) {
                                alert("작성자가 아니면 삭제 할수 없습니다")
                            }
                        })


                        $(".CommentlikeButton").on("click", function () {


                            if (userId === '' || userId === null) {

                                alert("로그인후 이용 가능합니다")

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
                                        "boardCategory": boardCategory
                                    }),
                                    dataType: "JSON",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {


                                        likeCount.html(JSONData);
                                    }
                                })
                            }

                        })

                        $(".RecommentlikeButton").on("click", function () {

                            var likeCount = $(this).parents(".RecommentList").find(".RelikeText");
                            var boardNum = $(this).parents(".RecommentList").find(".recommentNum").val();

                            var boardCategory = "11";

                            if (userId === '' || userId === null) {

                                alert("로그인후 이용 가능합니다")
                            } else if (userId !== '') {

                                $.ajax({
                                    url: "/commu/json/addLike",
                                    type: "POST",
                                    data: JSON.stringify({
                                        "likeCount": likeCount.html(),
                                        "boardNum": boardNum,
                                        "boardCategory": boardCategory
                                    }),
                                    dataType: "JSON",
                                    contentType: 'application/json; charset=UTF-8',
                                    success: function (JSONData, result) {


                                        likeCount.html(JSONData);
                                    }
                                })
                            }

                        })

                        $(".addchat").on("click", function () {

                        });

                    }
                })
            }



        })


        /*조회수*/

        $(function () {


            $(document).ready(function () {

                $.getListComment();

                var viewCount = $(".viewText").html();
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()

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

            });

            /*좋아요 버튼*/
            $(".likeButton").on("click", function () {

                var likeCount = $(".likeText").html();
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()

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


                        $(".likeText").html(JSONData);
                    }
                })

            })
        })


        $(function () {

            $(".delete").on("click", function () {
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()
                alert(boardNum);
                boardNum *= 1;

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
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val()


                window.open(
                    "/commu/updateVillBoard?boardNum=" + boardNum + "&boardCategory=" + boardCategory, "우리 동네 게시글 수정",
                    "left=300, top=200, width=800px, height=800px, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"
                )
            });


            /*댓글*/
            $(".addcomment").on("click", function () {
                var commentText = $(".addCommentText").val();
                var boardNum = $(".boardNum").val();
                var boardCategory = $(".boardCategory").val();

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

                        $.getListComment();

                    }

                })
            })


        })


    </script>


<body class="bg-light">

<jsp:include page="/layout/toolbar.jsp"/>

<div class="container" style="text-align: -webkit-center;">
    <input hidden class="boardNum" value="${villBoard.villBoardNum}">
    <input hidden class="boardCategory" value="${villBoard.boardCategory}">
    <input hidden class="userId" value="${user.userId}">

    <jsp:include page="/layout/commubar.jsp"/>

    <div class="wap shadow-lg">




        <div class="usedbox">
            <div class="thumbnailBox">
                <div class="shadow-lg midle"
                     style="margin-bottom: 50px; margin-top: -3px; width: 490px; overflow: hidden; height: 400px;">
                    <div id="carouselExampleDark" class=" shadow-lg carousel carousel-dark slide"
                         data-bs-ride="carousel">
                        <c:set var="i" value="0"/>
                        <c:forEach var="File" items="${villBoard.file}">
                            <c:set var="i" value="${i+1}"/>
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="10000">
                                    <img src="/resources${File.fileName}" width="490px" height="400px">
                                </div>
                            </div>

                        </c:forEach>
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
                </div>

                <div class="likebox shadow-lg">
                    <div class="itembox" style="padding: 20px;">
                        <button type="button"
                                class="btn btn-primary position-relative itembutton likeButton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-hand-thumbs-up itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                            </svg>
                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                    style="z-index: 1; font-size: 0.5em;">${villBoard.likeCount}</span>
                        </button>

                        <button type="button"
                                class="btn btn-secondary position-relative itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-eye itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path
                                        d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                            </svg>

                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                    style="z-index: 1; font-size: 0.5em;">${villBoard.viewCount}</span>
                        </button>

                        <button type="button" class="btn btn-outline-primary itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-chat-left-quote itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path
                                        d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                            </svg>
                        </button>

                        <button type="button" class="btn btn-outline-info itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-cart-plus-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/>
                            </svg>
                        </button>


                        <button type="button" class="btn btn-outline-danger itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor"
                                 class="bi bi-hand-thumbs-down-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                            </svg>
                        </button>
                        <c:if test="${user.userId eq villBoard.userId}">
                            <button type="button" class="btn btn-outline-primary itembutton update">수정</button>
                            <button type="button" class="btn btn-outline-secondary itembutton delete">삭제</button>
                        </c:if>


                    </div>
                </div>
            </div>

            <div class="textbox shadow-lg">
                <div class="container" style="    padding: 5px 5px;">
                    <div class="row textboxrow">
                        <div class="col-2 border-reight">제목</div>
                        <div class="col-10 textfloat">${villBoard.villTitle}</div>
                    </div>
                    <hr>


                    <div class="row textboxrow">
                        <div class="col-2 border-reight">작성자</div>
                        <div class="col-10">${villBoard.userId}</div>
                    </div>

                    <hr>

                    <div class="row textboxrow">
                        <div class="col-2 border-reight">태그</div>
                        <div class="col-10">${villBoard.villTag}</div>
                    </div>

                    <hr>

                    <div class="row textboxrow">
                        <div class="col-2">내용</div>
                        <div class="col-10">
                            <label for="exampleFormControlTextarea1" class="form-label"></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1"
                                      rows="3" style="height: 279px; font-size: 0.4em;"
                                      placeholder="${villBoard.villText}"></textarea>
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


        <jsp:include page="/layout/chatIcon.jsp"/>
    </div>
</div>

</body>
</html>