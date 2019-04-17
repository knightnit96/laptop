<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>KnightSHOP</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${defines.URL_ADMIN}/dist/css/AdminLTE.min.css">
</head>
<body onload="window.print();">
<div class="wrapper">
  <!-- Main content -->
  <c:choose>
	<c:when test="${pageContext.request.userPrincipal.name != null}">
				  <div class="col-xs-12">
				  <section class="invoice">
				    <!-- title row -->
				    <div class="row">
				      <div class="col-xs-12">
				        <h2 class="page-header">
				          <i class="fa fa-globe"></i> Receipt
				          <fmt:formatDate value="${objItem.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
				          <small class="pull-right">Date: ${fmtDate}</small>
				        </h2>
				      </div>
				      <!-- /.col -->
				    </div>
				    <!-- info row -->
				    <div class="row invoice-info">
				      <div class="col-sm-4 invoice-col">
				        From
				        <address>
				          <strong>KnightSHOP</strong><br>
				          72 Nguyễn Lương Bằng, q.Liên Chiểu<br>
				          Đà Nẵng, Việt Nam<br>
				          Phone: (84) 986 021 416<br>
				          Email: knightnit96@gmail.com
				        </address>
				      </div>
				      <!-- /.col -->
				      <div class="col-sm-4 invoice-col">
				        To
				        <address>
				          <strong>${objItem.name }</strong><br>
				          Address: ${objItem.address }<br>
				          Phone: ${objItem.phone }<br>
				          Email: ${objItem.email }
				        </address>
				      </div>
				      <!-- /.col -->
				      <div class="col-sm-4 invoice-col">
				        <b>Order ID #${objItem.id_order }</b><br>
				        <br>
				        <b>Status:</b> ${objItem.status }<br>
				        <b>Payment:</b> ${objPayment.name }<br>
				      </div>
				      <!-- /.col -->
				    </div>
				    <!-- /.row -->
				
				    <!-- Table row -->
				    <div class="row">
				      <div class="col-xs-12 table-responsive">
				        <table class="table table-striped">
				          <thead>
				          <tr>
				          	<th>ProductID</th>
				            <th>Product</th>
				            <th>Price</th>
				            <th>Quantity</th>
				            <th>Subtotal</th>
				          </tr>
				          </thead>
				          <tbody>
				          <c:forEach items="${listOrder }" var="objItem1">
				          <tr>
				            <td>${objItem1.id_product}</td>
				            <td>${objItem1.name}</td>
				            <td>${objItem1.price} VNĐ</td>
				            <td>${objItem1.quantity}</td>
				            <td>${objItem1.price*objItem1.quantity} VNĐ</td>
				          </tr>
				          </c:forEach>
				          </tbody>
				        </table>
				      </div>
				      <!-- /.col -->
				    </div>
				    <!-- /.row -->
				
				    <div class="row">
				      <!-- accepted payments column -->
				      <div class="col-xs-6">
				        <p class="lead">Message:</p>
				        <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
				          ${objItem.message }
				        </p>
				      </div>
				      <!-- /.col -->
				      <div class="col-xs-6">
				        <div class="table-responsive">
				          <table class="table">
				            <tr>
				              <th style="width:50%">Subtotal:</th>
				              <td>${objItem.price }</td>
				            </tr>
				            <tr>
				              <th>Tax</th>
				              <td>0 VNĐ</td>
				            </tr>
				            <tr>
				              <th>Total:</th>
				              <td>${objItem.price }</td>
				            </tr>
				          </table>
				        </div>
				      </div>
				      <!-- /.col -->
				    </div>
				    <!-- /.row -->
				  </section>
				  </div>
	</c:when>
	<c:otherwise>
		<section id="cart_items">
			<div class="container">
				<h2>Bạn chưa đăng nhập , vui lòng đăng nhập <a href="${pageContext.request.contextPath }/login">tại đây</a></h2>
			</div>
		</section>
	</c:otherwise>
</c:choose>
  
  
  
  <!-- /.content -->
</div>
<!-- ./wrapper -->
</body>
</html>
