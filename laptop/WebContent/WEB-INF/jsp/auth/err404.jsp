<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>403 Error </title>
    <link href="${defines.URL_PUBLIC}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/price-range.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/animate.css" rel="stylesheet">
	<link href="${defines.URL_PUBLIC}/css/main.css" rel="stylesheet">
	<link href="${defines.URL_PUBLIC}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${defines.URL_PUBLIC}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<div class="container text-center">
		<div class="logo-404">
			<a href="${pageContext.request.contextPath }"><img src="${defines.URL_PUBLIC}/images/home/logo1.png" alt="" /></a>
		</div>
		<div class="content-404">
			<img src="${defines.URL_PUBLIC}/images/404/404.png" class="img-responsive" alt="" />
			<h1><b>OPPS!</b> We Couldn’t Find this Page</h1>
			<p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished.</p>
			<h2><a href="${pageContext.request.contextPath }">Bring me back Home</a></h2>
		</div>
	</div>

  
    <script src="${defines.URL_PUBLIC}/js/jquery.js"></script>
	<script src="${defines.URL_PUBLIC}/js/price-range.js"></script>
    <script src="${defines.URL_PUBLIC}/js/jquery.scrollUp.min.js"></script>
	<script src="${defines.URL_PUBLIC}/js/bootstrap.min.js"></script>
    <script src="${defines.URL_PUBLIC}/js/jquery.prettyPhoto.js"></script>
    <script src="${defines.URL_PUBLIC}/js/main.js"></script>
</body>
</html>