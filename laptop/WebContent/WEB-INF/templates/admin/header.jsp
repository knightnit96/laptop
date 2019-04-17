<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${title }</title>
  <link rel="shortcut icon" href="${defines.URL_PUBLIC}/images/laptop.png">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- tự thiết kế -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/style1.css">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/dist/css/AdminLTE.min1.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/dist/css/skins/_all-skins.min1.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/morris/morris.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/daterangepicker/daterangepicker-bs3.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- jQuery 2.2.0 -->
<script src="${defines.URL_ADMIN}/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<script src="${defines.URL_ADMIN}/jquery.validate.min.js"></script>  
<script src="${pageContext.request.contextPath }/libraries/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/libraries/ckfinder/ckfinder.js" type="text/javascript"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath }/admincp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>K</b>S</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Knight</b>SHOP</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
           <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="javascript:void(0)" onclick="contact_header()" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <c:if test="${objUserLogin.new_contact != 0}">
              <span class="label label-success">${objUserLogin.new_contact}</span>
              </c:if>
            </a>
            <ul class="dropdown-menu">
            	<c:if test="${objUserLogin.new_contact != 0}">
              	<li class="header">You have ${objUserLogin.new_contact} new contact</li>
              	</c:if>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                	<c:forEach items="${listNewsContactHeader }" var="objItem">
                  <li>
                    <a href="${pageContext.request.contextPath }/admincp/contact">
                      <i class="fa fa-user text-aqua"></i> ${objItem.name } has contacted recently
                    </a>
                  </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="${pageContext.request.contextPath }/admincp/contact">See All Message</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="javascript:void(0)" onclick="comment_header()" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-comments"></i>
              <c:if test="${objUserLogin.new_comment != 0}">
              <span class="label label-warning">${objUserLogin.new_comment}</span>
              </c:if>
            </a>
            <ul class="dropdown-menu">
            	<c:if test="${objUserLogin.new_comment != 0}">
              	<li class="header">You have ${objUserLogin.new_comment} new comment</li>
              	</c:if>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                	<c:forEach items="${listNewsCommentHeader }" var="objItem">
                  <li>
                    <a href="${pageContext.request.contextPath }/admincp/comment">
                      <i class="fa fa-user text-aqua"></i> ${objItem.name } has cmted recently
                    </a>
                  </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="${pageContext.request.contextPath }/admincp/comment">See All Message</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="javascript:void(0)" onclick="order_header()" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-file-text-o"></i>
              <c:if test="${objUserLogin.new_order != 0}">
              <span class="label label-danger">${objUserLogin.new_order}</span>
              </c:if>
            </a>
            <ul class="dropdown-menu">
            	<c:if test="${objUserLogin.new_order != 0}">
              	<li class="header">You have ${objUserLogin.new_order} new order</li>
              	</c:if>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                	<c:forEach items="${listNewsOrderHeader }" var="objItem">
                  <li>
                    <a href="${pageContext.request.contextPath }/admincp/order">
                      <i class="fa fa-user text-aqua"></i> ${objItem.name } has ordered recently
                    </a>
                  </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="${pageContext.request.contextPath }/admincp/order">View all</a></li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${pageContext.request.contextPath }/files/${objUserLogin.avatar}" class="user-image" alt="User Image">
              <span class="hidden-xs">${objUserLogin.fullname}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath }/files/${objUserLogin.avatar}" class="img-circle" alt="User Image">

                <p>
                  ${objUserLogin.fullname}
                  <small>${objUserLogin.email}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-2 text-center">
                  </div>
                  <div class="col-xs-8 text-center">
                    <span>Level: ${objUserLogin.role}</span>
                  </div>
                  <div class="col-xs-2 text-center">
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${pageContext.request.contextPath }/admincp/profile" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="${pageContext.request.contextPath }/logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
<script>
	function comment_header(id_product, quantity, name){
		$.ajax({
			url: '${pageContext.request.contextPath }/comment-header',
			type: 'POST',
			cache: false,
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function contact_header(id_product, quantity, name){
		$.ajax({
			url: '${pageContext.request.contextPath }/contact-header',
			type: 'POST',
			cache: false,
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function order_header(id_product, quantity, name){
		$.ajax({
			url: '${pageContext.request.contextPath }/order-header',
			type: 'POST',
			cache: false,
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
