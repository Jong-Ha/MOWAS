<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/listCluber.js"></script>
    <link href="/resources/club/css/listCluber.css" rel="stylesheet" type="text/css"/>
</head>
<body class="p-3 m-0 border-0" style="text-align: -webkit-center">

<input type="hidden" id="clubNum" value="${clubNum}">


<!-- Example Code -->
<div class="container content-box">


    <div class="card-list" style="margin-top: 30px">
        <div class="card shadow-lg cardBox">
            <input type="hidden" class="clubUserNum" name="clubUserNum" value="">
            <div class="photoBox">
                <img class="bd-placeholder-img img-fluid rounded-start photo"
                     src="/resources/" alt="any">
            </div>
            <div>
                <div class="card-body">
                    <div>
                        <h4 class="card-title"></h4>
                        <div class="badge bg-primary text-wrap"></div>
                    </div>
                    <div>
                        <small class="text-muted"></small>
                        <div class="badge bg-primary text-wrap">접속중미구현</div>
                    </div>
                </div>
            </div>
        </div>
</div>


</div>

</body>
</html>