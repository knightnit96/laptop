<%@page import="entities.Wishlist"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty wishlistempty}">
		<section id="cart_items">
			<div class="container">
				<div class="breadcrumbs">
					<ol class="breadcrumb">
					  <li><a href="${pageContext.request.contextPath }">Home</a></li>
					  <li class="active">Wishlist</li>
					</ol>
				</div>
				<div class="alert alert-success" role="alert" id="message-success" style="display:none">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
				  <div id="message-content-success"></div>
				</div>
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Item</td>
								<td class="description"></td>
								<td class="price">Price</td>
								<td width="150px"></td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
								for(Wishlist item : listWishlist){
							%>	
							<tr id="deleteWishlist-<%=item.getId_product() %>">
								<td class="cart_product">
									<img src="${pageContext.request.contextPath }/files/<%=item.getPicture()%>" alt="" width="100px" height="100px">
								</td>
								<td class="cart_description">
									<h4><%=item.getName() %></h4>
									<p>ProductID: <%=item.getId_product() %></p>
								</td>
								<td class="cart_price">
									<p><%=item.getPrice()%> VNĐ</p>
								</td>
								<td class="cart_delete">
									<a class="btn btn-default add-to-cart" href="javascript:void(0)" onclick="buy_product(<%=item.getId_product() %>,1, '<%=item.getName() %>')" >Add to cart</a>
									<a class="btn btn-default add-to-cart" href="javascript:void(0)" onclick="deleteProductWishlist(<%=item.getId_product() %>)"><i class="fa fa-times"></i></a>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
					
				</div>
				<a class="btn btn-default btn-lg check_out" href="${pageContext.request.contextPath }" >Back to Home</a>
				<a class="btn btn-default btn-lg check_out" href="${pageContext.request.contextPath }/cart" >Go to Cart</a>
			</div>
			
		</section> <!--/#cart_items-->
	</c:when>
	<c:otherwise>
		<section id="cart_items">
			<div class="container">
				<h2>Your wishlist is empty</h2>
			</div>
		</section>
	</c:otherwise>
</c:choose>
<script>
	function buy_product(id_product, quantity, name){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/buy-product',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
				aquantity : quantity,
					},
			success: function(data){
				$('#cart').html(data);
				document.getElementById("message-content-success").innerHTML = "<strong>Success!</strong> 1 "+ name +" is added into your cart!";
				$('#message-success').show();
				setTimeout(function() {
				    $('#message-success').slideUp(500);
				}, 4000);
				//thông báo
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script type="text/javascript">
	function deleteProductWishlist(id_product){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/delete-wishlist-product',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
					},
			success: function(data){
				$("#deleteWishlist"+'-'+id_product).html(data);
				deleteWishlist(id_product);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
		}
</script>
<script type="text/javascript">
	function deleteWishlist(id_product){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/deletewishlist',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
					},
			success: function(data){
				$("#wishlist").html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
		}
</script>