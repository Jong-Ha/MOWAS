<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR" %>


<!DOCTYPE html>

<html lang="ko">

<head>
  <meta charset="EUC-KR">

  <!-- 참조 : http://getbootstrap.com/css/   참조 -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

  <!-- include libraries(jQuery, bootstrap) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


  <!--  ///////////////////////// CSS ////////////////////////// -->
  <style type="text/css">
    /*body {*/
    /*  padding-top: 50px;*/
    /*}*/

    /*.wap {*/
    /*  width: 700px;*/
    /*  font-size: 0.9em;*/
    /*}*/
    /*.check{*/
    /*  height: 20px;*/
    /*  width: 35px;*/
    /*}*/

                            /* 창 여분 없애기 */
                          body{
                            margin : 0;
                          }
    /* 전체 배경화면 색상 */
    .wrapper_div{
      background-color: #f5f5f5;
      height: 100%;
    }
    /* 팝업창 제목 */
    .subject_div{
      width: 100%;
      background-color: #7b8ed1;
      color: white;
      padding: 10px;
      font-weight: bold;
    }

    /* 컨텐츠, 버튼 영역 padding */
    .input_wrap{
      padding: 30px;
    }
    .btn_wrap{
      padding: 5px 30px 30px 30px;
      text-align: center;
    }

    /* 버튼 영역 */
    .cancel_btn{
      margin-right:5px;
      display: inline-block;
      width: 130px;
      background-color: #5e6b9f;
      padding-top: 10px;
      height: 27px;
      color: #fff;
      font-size: 14px;
      line-height: 18px;
    }
    .enroll_btn{
      display: inline-block;
      width: 130px;
      background-color: #7b8ed1;
      padding-top: 10px;
      height: 27px;
      color: #fff;
      font-size: 14px;
      line-height: 18px;
    }

    /* 책제목 영역 */
    .bookName_div h2{
      margin : 0;
    }
    /* 평점 영역 */
    .rating_div{
      padding-top: 10px;
    }
    .rating_div h4{
      margin : 0;
    }
    select{
      margin: 15px;
      width: 100px;
      height: 40px;
      text-align: center;
      font-size: 16px;
      font-weight: 600;
    }
    /* 리뷰 작성 영역 */
    .content_div{
      padding-top: 10px;
    }
    .content_div h4{
      margin : 0;
    }
    textarea{
      width: 100%;
      height: 100px;
      border: 1px solid #dadada;
      padding: 12px 8px 12px 8px;
      font-size: 15px;
      color: #a9a9a9;
      resize: none;
      margin-top: 10px;
    }


  </style>

  <!--  ///////////////////////// JavaScript ////////////////////////// -->
  <script type="text/javascript">
$(function (){
  $(".submit").on("click",function (){
    var rating=$(".rating").val()
    var content=$(".content").val();
    var dealBoardNum=$(".dealBoardNum").val();

    $.ajax({
      url:"/deal/json/addReview",
      method:"post",
      data:JSON.stringify({
        "reviewPt": rating,
        "review": content,
        "dealBoardNum":dealBoardNum
      }),
      dataType:"json",
      headers:{
        "Accept":"application/json",
        "Content-Type":"application/json; charset=UTF-8"
      },
      success : function (JSONData, result) {
        console.log(JSONData);
alert(result);
alert(JSONData);
alert(rating)
        alert(content)

        // 성공시 해당 창을 닫고 부모창을 reload
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: 'Your work has been saved',
          showConfirmButton: false,
          timer: 1500
        });

        setTimeout(function () {
          opener.location.reload();
          window.close();
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
          window.close();
        }, 2000);
      }
    })
  })
})

    // //============= 회원정보수정 Event  처리 =============
    // $(function () {
    //
    //   $(".submit").on("click", function () {
    //
    //     Swal.fire({
    //       position: 'top-end',
    //       icon: 'success',
    //       title: 'Your work has been saved',
    //       showConfirmButton: false,
    //       timer: 1500,
    //     });
    //
    //
    //     $("form").attr("method", "post").attr("action", "/commu/addVillBoard").attr("enctype", "multipart/form-data").submit();
    //
    //   });
    //
    //   $(".close").on("click", function () {
    //     window.close();
    //   });
    // });

</script>
</head>

<body>
<form>
<div class="wrapper_div">
  <div class="subject_div">
    리뷰 등록
  </div>
  <div class="bookName_div">
    <h2>${deal.productName}</h2>
  </div>
  <div class="rating_div">
    <h4>평점</h4>

    <select name="rating" class="rating">
      <c:forEach var="i" begin="0" end="100">
<option value="${i}">${i}</option>
      </c:forEach>
    </select>

  </div>
  <div class="content_div">
    <h4>리뷰</h4>
    <textarea name="content" class="content" value=""></textarea>
  </div>
</div>
  <div class="row">
    <div class="col-xs-12 text-center ">
      <button type="button" class="btn btn-primary btn-lg submit">확인</button>
      <button type="button" class="btn btn-secondary btn-lg close">닫기</button>
    </div>
  </div>
</div>
  <input type="hidden"  value="${deal}">
<input type="hidden" class="dealBoardNum" value="${deal.dealBoardNum}">
</form>
<script>

  /* 취소 버튼 */
  $(function() {
    $(".close").on("click", function () {
      window.close();
    });
    /* 등록 버튼 */
    // $(".enroll_btn").on("click", function () {
    //   $("form").attr("method", "post").attr("action", "/deal/review").submit();
    //   Window.close();
    // });
  })
</script>
</body>
</html>