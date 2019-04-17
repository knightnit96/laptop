<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>${title }</title>
    <link href="${defines.URL_PUBLIC}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/price-range.css" rel="stylesheet">
    <link href="${defines.URL_PUBLIC}/css/animate.css" rel="stylesheet">
	<link href="${defines.URL_PUBLIC}/css/main.css" rel="stylesheet">
	<link href="${defines.URL_PUBLIC}/css/responsive.css" rel="stylesheet">
	<link href="${defines.URL_PUBLIC}/css/style.css" rel="stylesheet">
	<script src="${defines.URL_PUBLIC}/js/jquery.js"></script>
	<script src="${defines.URL_PUBLIC}/js/jquery.elevatezoom.js"></script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${defines.URL_PUBLIC}/images/laptop.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="${pageContext.request.contextPath }/lien-he"><i class="fa fa-phone"></i> +84 986 021 416</a></li>
								<li><a href="${pageContext.request.contextPath }/lien-he"><i class="fa fa-envelope"></i> knightnit96@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="https://www.facebook.com/thuanha302934"><i class="fa fa-facebook" title="Facebook"></i></a></li>
								<li><a href="https://twitter.com"><i class="fa fa-twitter" title="Twitter"></i></a></li>
								<li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin" title="Linkedin"></i></a></li>
								<li><a href="https://dribbble.com/"><i class="fa fa-dribbble" title="Dribbble"></i></a></li>
								<li><a href="https://plus.google.com"><i class="fa fa-google-plus" title="Google+"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="${pageContext.request.contextPath }"><img src="${defines.URL_PUBLIC}/images/home/logo1.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
							 	<c:if test="${pageContext.request.userPrincipal.name != null}">
							 		<li><a href="${pageContext.request.contextPath }/profile" <c:if test="${title == 'Profile | KnightSHOP' }">class='active'</c:if>>Hi, ${objUserLogin.fullname}</a></li>
							 		<c:if test="${objUserLogin.role == 'ADMIN' || objUserLogin.role == 'MOD'}"><li><a href="${pageContext.request.contextPath }/admincp">AdminCP</a></li></c:if>
							  	</c:if>
								<li><a href="${pageContext.request.contextPath }/wishlist" <c:if test="${title == 'Wishlist | KnightSHOP' }">class='active'</c:if> id="wishlist"><i class="fa fa-star"></i> Wishlist (${listWishlist})</a></li>
								<li><a href="${pageContext.request.contextPath }/cart" <c:if test="${title == 'Cart | KnightSHOP' }">class='active'</c:if> id="cart"><i class="fa fa-shopping-cart"></i> Cart (${listProduct})</a></li>
								<c:if test="${pageContext.request.userPrincipal.name == null}">
									<li><a href="${pageContext.request.contextPath }/register" <c:if test="${title == 'Register | KnightSHOP' }">class='active'</c:if>><i class="fa fa-user"></i> Register</a></li>
									<li><a href="${pageContext.request.contextPath }/login" <c:if test="${title == 'Login | KnightSHOP' }">class='active'</c:if>><i class="fa fa-lock"></i> Login</a></li>
								</c:if>
								<c:if test="${pageContext.request.userPrincipal.name != null}">
							 		<li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
							  	</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="${pageContext.request.contextPath }" <c:if test="${title == 'Home | KnightSHOP' }">class='active'</c:if>>Home</a></li>
								<li class="dropdown"><a href="${pageContext.request.contextPath }/laptop" <c:if test="${title == 'Laptop | KnightSHOP' }">class='active'</c:if>>Laptop<i class="fa fa-angle-down"></i></a>							
									<ul role="menu" class="sub-menu">
										<c:forEach items="${listBrand }" var="objItem">
                                        <li><a href="${pageContext.request.contextPath }/laptop/${slugUtils.makeSlug(objItem.name)}-${objItem.id_brand }" <c:if test="${tag == objItem.id_brand }">class='active'</c:if>>${objItem.name }</a></li>
                                  		</c:forEach>
                                    </ul>
                                </li>	
								<li class="dropdown"><a href="${pageContext.request.contextPath }/phu-kien" <c:if test="${title == 'Accessories | KnightSHOP' }">class='active'</c:if>>Accessories<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="${pageContext.request.contextPath }/phu-kien/headphone" <c:if test="${tag1 == 'headphone' }">class='active'</c:if>>Headphone</a></li>
										<li><a href="${pageContext.request.contextPath }/phu-kien/mouse" <c:if test="${tag1 == 'mouse' }">class='active'</c:if>>Mouse</a></li>
										<li><a href="${pageContext.request.contextPath }/phu-kien/keyboard" <c:if test="${tag1 == 'keyboard' }">class='active'</c:if>>Keyboard</a></li>
                                    </ul>
                                </li> 
								<li><a href="${pageContext.request.contextPath }/lien-he" <c:if test="${title == 'Contact | KnightSHOP' }">class='active'</c:if>>Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						 <form action="${pageContext.request.contextPath }/search" method="get">
                        	<div class="search_box pull-right">
								<input type="text" id="q" name="q" placeholder="Search product..."/>
							</div>
                        </form>
						
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
