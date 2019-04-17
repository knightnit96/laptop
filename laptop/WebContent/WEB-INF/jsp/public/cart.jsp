<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty cartempty}">
		<section id="cart_items">
			<div class="container">
				<div class="breadcrumbs">
					<ol class="breadcrumb">
					  <li><a href="${pageContext.request.contextPath }">Home</a></li>
					  <li class="active">Shopping Cart</li>
					</ol>
				</div>
				<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Item</td>
								<td class="description"></td>
								<td class="price">Price</td>
								<td class="quantity">Quantity</td>
								<td class="total">Total</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
								for(Product item : listProduct){
							%>	
							<tr id="delete-<%=item.getId_product() %>">
								<td class="cart_product">
									<img src="${pageContext.request.contextPath }/files/<%=item.getPicture()%>" alt="" width="35px" height="35px">
								</td>
								<td class="cart_description">
									<h4><%=item.getName() %></h4>
									<p>ProductID: <%=item.getId_product() %></p>
								</td>
								<td class="cart_price">
									<p><%=item.getPrice()%> VNĐ</p>
								</td>
								<td class="cart_quantity">
									<div class="cart_quantity_button">
										<input class="cart_quantity_input" type="text" name="quantity" id="quantity-<%=item.getId_product() %>" value="<%=item.getQuantity() %>" autocomplete="off" size="2" onchange="setQuantity(<%=item.getId_product() %>)">
									</div>
								</td>
								<td class="cart_total" id="set-quantity-<%=item.getId_product() %>">
									<p class="cart_total_price"><%=item.getPrice()*item.getQuantity() %> VNĐ</p>
								</td>
								<td class="cart_delete">
									<a class="cart_quantity_delete" href="javascript:void(0)" onclick="deleteProduct(<%=item.getId_product() %>)"><i class="fa fa-times"></i></a>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
					<a class="btn btn-default btn-lg check_out pull-right" href="${pageContext.request.contextPath }" >Back to Home</a>
					<a class="btn btn-default btn-lg check_out pull-right" href="${pageContext.request.contextPath }/order" >Proceed To Order</a>
				</div>
			</div>
			
		</section> <!--/#cart_items-->
	</c:when>
	<c:otherwise>
		<section id="cart_items">
			<div class="container">
				<h2>Your cart is empty</h2>
			</div>
		</section>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	function setQuantity(id_product){
		var quantity = document.getElementById("quantity"+'-'+id_product).value;
		if (quantity <= 0) {
			alert('Có lỗi');
			location.reload();
		} else {
			$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
			$.ajax({
				url: '${pageContext.request.contextPath }/set-quantity',
				type: 'POST',
				cache: false,
				data: {
					aid_product : id_product,
					aquantity : quantity,
						},
				success: function(data){
					$("#set-quantity"+'-'+id_product).html(data);
				},
				error: function (){
					alert('Có lỗi');
					location.reload();
				}
			});
		}
	}
</script>
<script type="text/javascript">
	function deleteProduct(id_product){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/delete',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
					},
			success: function(data){
				$("#delete"+'-'+id_product).html(data);
				deleteCart(id_product);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
		}
</script>
<script type="text/javascript">
	function deleteCart(id_product){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/deletecart',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
					},
			success: function(data){
				$("#cart").html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
		}
</script>
