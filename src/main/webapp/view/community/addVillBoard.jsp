<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<html>
<head>
<title>상품등록</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
	<title>Bootstrap Example</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.slim.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>

<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body{
			text-align: -webkit-center;
		}
		.wap{
			width: 800px;
		}
		.file{
			margin-top: 10px;
		}
	</style>

<body class="bg-light">

<jsp:include page="/layout/toolbar.jsp"/>

<div class="container" style="text-align: -webkit-center;">
	<div class="wap">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
				<h2>Checkout form</h2>
				<p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
			</div>



			<div class="col-md-7 col-lg-8">
				<form class="needs-validation" novalidate>

					<div class="row g-3">
						<div class="col-sm">
							<label for="firstName" class="form-label">제목</label>
							<input type="text" class="form-control" id="firstName" placeholder="" value="" required>
							<div class="invalid-feedback">
								Valid first name is required.
							</div>
						</div>
					</div>


					<div class="input-group mb-3 file">
						<input type="file" class="form-control" id="inputGroupFile02">
						<label class="input-group-text" for="inputGroupFile02">Upload</label>
					</div>


					<div class="row g-3">
						<div class="col-sm">
							<label for="firstName" class="form-label"> 내용 </label>
							<textarea id="summernote" placeholder="내용을 입력해 주세요"></textarea>
						</div>
					</div>

					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
				</form>
			</div>
		</main>
	</div>
</div>
</body>
</html>

<footer class="my-5 pt-5 text-muted text-center text-small">
	<p class="mb-1">&copy; 2017-2022 Company Name</p>
	<ul class="list-inline">
		<li class="list-inline-item"><a href="#">Privacy</a></li>
		<li class="list-inline-item"><a href="#">Terms</a></li>
		<li class="list-inline-item"><a href="#">Support</a></li>
	</ul>
</footer>
</div>
