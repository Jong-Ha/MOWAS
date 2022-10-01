<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>



<style>
.body {
	text-align: -webkit-center;
}

.wap {
	width: 1000px;
}

.topbar {
	margin-bottom: 70px;
}

.navbar {
	justify-content: center;
}

.btnlf {
	margin-left: 20px;
}

.textint {
	font-size: 0.2em;
	margin-top: -20px;
}

.login {
	float: left;
	margin-right: 20px;
}

.alrim {
	font-size: 0.1rem;
	width: 45px;
}

.loginbox {
	width: 80px;
	font-size: 0.1rem;
}

.clubinfo {
	margin-top: 50px;
	border-radius: 10px;
	border: 1px solid;
	height: 200px;
}

.clubborder {
	height: 500px;
	margin-bottom: 50px;
	background: #e9ecef;
	border-radius: 10px;
}
.font{
	font-size: 0.5em;
}
</style>

<body class="p-3 m-0 border-0 bd-example"
	style="text-align: -webkit-center">

	<!-- Example Code -->
	<div class="wap">

		<div class="topbar">
			<nav class="shadow-lg navbar navbar-expand-lg bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">Navbar scroll</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarScroll"
						aria-controls="navbarScroll" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarScroll">
						<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
							style="-bs-scroll-height: 100px;">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Link </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link disabled">Link</a></li>
						</ul>
						<img src="pngwing.png" style="width: 30px; margin-right: 10px;">
						<div class="login">
							<div class="d-grid gap-2">
								<button type="button"
									class="btn btn-outline-primary btnlf loginbox">로그아웃</button>
								<button class="btn btn-outline-success btnlf loginbox"
									type="submit">마이패이지</button>
							</div>
						</div>
						<button type="button"
							class="btn btn-primary position-relative alrim">
							Inbox <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								99+ </span>

						</button>
					</div>
				</div>
			</nav>
			
			
		<button class="btn btn-danger btnlf" type="submit" style="float: right; margin-bottom: 20px; font-size: 0.5em;">모임 탈퇴</button>
	
		</div>



	
		<div class="shadow-lg midle" style="margin-bottom: 50px;">
			<div id="carouselExampleDark"
				class=" shadow-lg carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="0" class="active" aria-label="Slide 1"
						aria-current="true"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: First slide"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#f5f5f5"></rect>
							<text x="50%" y="50%" fill="#aaa" dy=".3em">First slide</text></svg>

						<div class="carousel-caption d-none d-md-block">
							<h5>First slide label</h5>
							<p>Some representative placeholder content for the first
								slide.</p>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: Second slide"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#eee"></rect>
							<text x="50%" y="50%" fill="#bbb" dy=".3em">Second slide</text></svg>

						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Some representative placeholder content for the second
								slide.</p>
						</div>
					</div>
					<div class=" carousel-item">
						<svg
							class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"
							width="800" height="400" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: Third slide"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#e5e5e5"></rect>
							<text x="50%" y="50%" fill="#999" dy=".3em">Third slide</text></svg>

						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Some representative placeholder content for the third
								slide.</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

		<p>어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
			어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~
			어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
			어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
			어쩌구~~~어쩌구 어쩌구~~~ 어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
			어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
			어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~</p>


		<div class="clubinfo bg-light shadow-lg">
			<div class="container text-center"
				style="margin-top: 10px; margin-left: 10px;">
				<div class="row">모임장: 어쩌구</div>
			</div>

			<div class="container text-center"
				style="margin-top: 10px; margin-left: 10px;">
				<div class="row">Since: 20XX/XX/XX</div>
			</div>


			<div class="container text-center"
				style="margin-top: 10px; margin-left: 10px;">
				<div class="row">
					<div class="col-1">3/25</div>
					<div class="col-2">
						<button type="button" class="btn btn-primary btnlf font">모임원 목록</button>
					</div>
					<div class="col-2">
						<button class="btn btn-success btnlf font" type="submit">모임 모집중</button>
					</div>
				</div>
			</div>
		</div>

		<div class="shadow-lg navbar navbar-expand-lg bg-light"
			style="margin-top: 50px; border-radius: 10px;">
			<div style="background-color: #0000">
				<button type="button" class="btn btn-outline-primary btnlf">모임
					공지사항</button>
				<button class="btn btn-outline-success btnlf" type="submit">모임
					일정</button>
				<button type="button" class="btn btn-outline-danger btnlf">모임
					일정 후기글</button>
				<button type="button" class="btn btn-outline-warning btnlf">모임
					일정 후기 쇼츠</button>
			</div>
		</div>

		<div class="clubborder shadow-lg">
			<p>어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~ 어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~ 어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구 어쩌구~~~어쩌구
				어쩌구~~~어쩌구 어쩌구~~~</p>
		</div>

		<button class="btn btn-success btnlf" type="submit" style="float: right;">모임 탈퇴</button>
</body>
</html>