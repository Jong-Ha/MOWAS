<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>


	<!-- include libraries(jQuery, bootstrap) -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder: 'Hello Bootstrap 5',
				tabsize: 2,
				height: 100
			});
		});

		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			
			 $(".submit").on("click", function() {
				alert("일정 등록 완료");
				$("form").attr("method", "post").attr("action", "/review/addReview").submit();
			});
			 
			 $(".close").on("click", function() {
				window.close();
			});
		});
		
	</script>
	 
</head>

<body>

<form>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">모임 일정 작성</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
			<div class="col-xs-8 col-xs-4">
				<input type="text" name="reviewName" value="">
			</div>
		</div>
			
		<hr/>
	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-xs-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-xs-4">${purchase.buyer.userId }</div>
			<input type="hidden" name="userIdd" value="${purchase.buyer.userId}">
		</div>
		
		<hr/>
		
	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-xs-2 "><strong>위치</strong></div>
			<div class="col-xs-8 col-xs-4">${product.prodName}</div>
			<input type="hidden" name="prodNoo" value="${product.prodNo}">
		</div>
		
		<hr/>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-xs-2"><strong>일정 내용</strong></div>
			<div class="col-xs-8 col-xs-4">
				<textarea id="summernote"></textarea>
		</div>			


		<div class="row">
	  		<div class="col-xs-12 text-center ">
	  			<button type="button" class="btn btn-primary submit">확인</button>
	  			<button type="button" class="btn btn-primary close">닫기</button>
	  		</div>	  	
		</div>

		<br/>
		
 	</div>
	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
</form>

</body>

</html>