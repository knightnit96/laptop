<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<section id="do_action">
		<div class="container col-sm-2">
			<div class="row">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<c:choose>
						<c:when test="${not empty objUserLogin.avatar }">
							<img style="margin-top: 63px" src="${pageContext.request.contextPath }/files/${objUserLogin.avatar}" alt="" width="200px"/>
						</c:when>
						<c:otherwise>
							<img style="margin-top: 63px" src="${defines.URL_PUBLIC}/images/no-avatar.png" alt="" width="200px"/>
						</c:otherwise>
					</c:choose>
			  	</c:if>
			  	<c:if test="${pageContext.request.userPrincipal.name == null}">
			  	</c:if>
			</div>
		</div>
		<div class="container col-sm-5">
			<div class="heading">
				<h2>Profile</h2>
			</div>
			<div class="row">
				<div class="col-sm-12">
						<div class="signup-form"><!--sign up form-->
						
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<form action="${pageContext.request.contextPath }/user/edit-user" method="POST" id="edit-User" enctype="multipart/form-data">
							 		<input type="text" value="Username: ${objUserLogin.username }" disabled/>
									<input type="text" value="Fullname: ${objUserLogin.fullname }" disabled/>
									<input type="text" value="Email: ${objUserLogin.email }" disabled/>
									<input type="text" value="Phone: ${objUserLogin.phone }" disabled/>
									<input type="text" value="Facebook: ${objUserLogin.linkface }" disabled/>
									<input type="text" value="Role: ${objUserLogin.role }" disabled/>
									<a href="javascript:void(0)" onclick="editUser()"><button type="button"  class="btn btn-default" style="display: inline-block;">Edit</button></a>
							  		<a href="${pageContext.request.contextPath }"><button type="button"  class="btn btn-default" style="display: inline-block;">Back to Home</button></a>
							  	</form>
						  	</c:if>
						  	<c:if test="${pageContext.request.userPrincipal.name == null}">
						 		Bạn chưa đăng nhập , vui lòng đăng nhập <a href="${pageContext.request.contextPath }/login">tại đây</a>
						  	</c:if>
							<c:if test="${not empty msg}">
							<!-- Modal -->
							  <div class="modal fade in" id="myModal" role="dialog" style="display: block; padding-left: 17px;">
							    <div class="modal-dialog">
							    
							      <!-- Modal content-->
							      <div class="modal-content">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal" onclick = "$('.modal').hide()">&times;</button>
							          <h4 class="modal-title">Thank you!</h4>
							        </div>
							        <div class="modal-body">
							          <p>Đơn hàng đã được gửi đi, chúng tôi sẽ giao hàng trong thời gian sớm nhất!</p>
							          <p>Cảm ơn bạn đã ủng hộ KightSHOP!</p>
							          <p>KnightSHOP - Uy tín - Chất lượng</p>
							          <p>Phone: 0986021416 - Tel: (0236) 3.888.888</p>
							          <p>Email: knightnit96@gmail.com</p>
							        </div>
							        <div class="modal-footer">
							           <a href="${pageContext.request.contextPath }"><button type="button" class="btn btn-default" >Back to Home</button></a>
							           <button type="button" class="btn btn-default" data-dismiss="modal" onclick = "$('.modal').hide()">Close</button>
							        </div>
							      </div>
							      
							    </div>
							  </div>
							</c:if>
							<c:if test="${not empty msg5}">
								<!-- Modal -->
							  <div class="modal fade in" id="myModal" role="dialog" style="display: block; padding-left: 17px;">
							    <div class="modal-dialog">
							    
							      <!-- Modal content-->
							      <div class="modal-content">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal" onclick = "$('.modal').hide()">&times;</button>
							          <h4 class="modal-title">Thank you!</h4>
							        </div>
							        <div class="modal-body">
							          <p>Đang chờ xác nhận thanh toán, chúng tôi sẽ liên hệ trong thời gian sớm nhất!</p>
							          <p>Cảm ơn bạn đã ủng hộ KightSHOP!</p>
							          <p>KnightSHOP - Uy tín - Chất lượng</p>
							          <p>Phone: 0986021416 - Tel: (0236) 3.888.888</p>
							          <p>Email: knightnit96@gmail.com</p>
							        </div>
							        <div class="modal-footer">
							           <button type="button" class="btn btn-default" data-dismiss="modal" onclick = "$('.modal').hide()">Close</button>
							        </div>
							      </div>
							      
							    </div>
							  </div>
							</c:if>
							<c:if test="${not empty msg1}">
								<c:if test="${msg1 == 'Successfully! Personal information was changed!'}">
								<div class="alert alert-success" role="alert" id="message-success">
								  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
								  ${msg1 }
								</div>
								</c:if>
								<c:if test="${msg1 == 'Failed to edit!'}">
								<div class="alert alert-success" role="alert" id="message-danger">
								  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
								  ${msg1 }
								</div>
								</c:if>
							</c:if>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
		
	<section id="cart_items">
		<div class="container col-sm-5">
			<div class="heading">
				<h2 style="margin-top: -31px">Your order history</h2>
			</div>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="price">#</td>
								<td class="price">Date</td>
								<td class="quantity">Status</td>
								<td class="total">Total</td>
								<td class="total">Detail</td>
							</tr>
						</thead>
						<tbody>
							
							<c:set var="i" value="1"></c:set>
							<c:forEach items="${listHistory}" var="objItem">
								<fmt:formatDate value="${objItem.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
								<tr>	
									<td>${i}</td>
									<td>${fmtDate}</td>
									<td>${objItem.status }</td>
									<td>${objItem.price } VNĐ</td>
									<td>
										<a class="btn btn-default add-to-cart" href="javascript:void(0)" onclick="window.open('${pageContext.request.contextPath }/order/detail/${objItem.id_order }')">View</a>
									</td>
								</tr>
								<c:set var="i" value="${i+1}"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
		  	</c:if>
		  	<c:if test="${pageContext.request.userPrincipal.name == null}">
		 		
		  	</c:if>
			
		</div>
		
	</section> <!--/#cart_items-->
	
<script>
	function editUser(){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/edit-user',
			type: 'POST',
			cache: false,
			data: {
					},
			success: function(data){
				$('#edit-User').html(data);
				//confirm_password
				var password = document.getElementById("password");
				var confirm_password = document.getElementById("confirm_password");
				
				function validatePassword(){
				if(password.value != confirm_password.value) {
				  confirm_password.setCustomValidity("Passwords Don't Match");
				} else {
				  confirm_password.setCustomValidity('');
				}
				}
				password.onchange = validatePassword;
				confirm_password.onkeyup = validatePassword;
				//show picture 
				$("#hinhanh").on('change', function () {
					
				    if (typeof (FileReader) != "undefined") {
				
				        var image_holder = $("#image-holder");
				        image_holder.empty();
				
				        var reader = new FileReader();
				        reader.onload = function (e) {
				            $("<img />", {
				                "src": e.target.result,
				                "class": "thumb-image",
				                "width":"200",
				                "height":"200"
				            }).appendTo(image_holder);
				
				        }
				        image_holder.show();
				        reader.readAsDataURL($(this)[0].files[0]);
				    } else {
				        alert("Error showing preview image!");
				    }
				});	
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>	
<script>
	function cancel_edit(){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/cancel-edit',
			type: 'POST',
			cache: false,
			data: {
					},
			success: function(data){
				$('#edit-User').html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>	
<script>
	window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 4000);
</script>