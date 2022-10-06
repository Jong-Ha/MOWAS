<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">

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
	<style>
		body {
			padding-top: 50px;
		}

		.wap {
			width: 700px;
			font-size: 0.9em;
		}
		.check{
			height: 20px;
			width: 35px;
		}
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= 회원정보수정 Event  처리 =============
		$(function () {

			$(".submit").on("click", function () {

				Swal.fire({
					position: 'top-end',
					icon: 'success',
					title: 'Your work has been saved',
					showConfirmButton: false,
					timer: 1500,
				});


				$("form").attr("method", "post").attr("action", "/commu/addVillBoard").attr("enctype", "multipart/form-data").submit();

			});

			$(".close").on("click", function () {
				window.close();
			});
		});


	</script>

</head>

<body>

<form>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="wap">
		<div class="container">

			<div class="page-header">
				<h3 class=" text-info">우리 동네 게시글 작성</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
				<div class="col-xs-8 col-xs-4">
					<input type="text" class="form-control" name="villTitle" value=""/>
				</div>
			</div>


			<hr/>

			<div class="row">
				<div class="col-xs-4 col-xs-2"><strong>내용</strong></div>
				<div class="col-xs-8 col-xs-4">
					<textarea class="form-control" name="villText" style=" height: 200px;  width: 500px;  margin-bottom: 20px;"></textarea>
				</div>
			</div>

			<hr/>

			<div class="row">
				<div class="col-xs-4 col-xs-2 ">
					<strong>태그
						<input type="text" name="villTag" placeholder="태그를 입력 해주세요">
					</strong>
				</div>
			</div>

			<hr/>


			<div class="row">
				<div class="col-xs-4 col-xs-2 ">
					<strong>파일
						<input type="file" value="파일 첨부">
					</strong>
				</div>
			</div>

			<hr/>


			<div class="row">
				<div class="col-xs-12 text-center ">
					<button type="button" class="btn btn-primary btn-lg submit">확인</button>
					<button type="button" class="btn btn-secondary btn-lg close">닫기</button>
				</div>
			</div>

			<br/>

		</div>
	</div>
</form>

</body>

</html>