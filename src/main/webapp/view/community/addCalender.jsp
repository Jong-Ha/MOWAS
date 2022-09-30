<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			
			 $(".submit").on("click", function() {
				alert("���� ��� �Ϸ�");
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
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">���� ���� �ۼ�</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-xs-2"><strong>�� ��</strong></div>
			<div class="col-xs-8 col-xs-4">
				<input type="text" name="reviewName" value="">
			</div>
		</div>
			
		<hr/>
	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-xs-2"><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-xs-4">${purchase.buyer.userId }</div>
			<input type="hidden" name="userIdd" value="${purchase.buyer.userId}">
		</div>
		
		<hr/>
		
	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-xs-2 "><strong>��ġ</strong></div>
			<div class="col-xs-8 col-xs-4">${product.prodName}</div>
			<input type="hidden" name="prodNoo" value="${product.prodNo}">
		</div>
		
		<hr/>
		
		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-xs-2"><strong>���� ����</strong></div>
			<div class="col-xs-8 col-xs-4">
				<textarea id="summernote"></textarea>
		</div>			


		<div class="row">
	  		<div class="col-xs-12 text-center ">
	  			<button type="button" class="btn btn-primary submit">Ȯ��</button>
	  			<button type="button" class="btn btn-primary close">�ݱ�</button>
	  		</div>	  	
		</div>

		<br/>
		
 	</div>
	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
</form>

</body>

</html>