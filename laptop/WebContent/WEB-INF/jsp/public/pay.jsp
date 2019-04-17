<%@page import="entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty cartempty}">
		<c:choose>
			<c:when test="${empty orderempty}">
				<section id="do_action">
				<div class="container col-sm-6">
					<div class="heading">
						<h3>Pay</h3>
					</div>
					<div class="row">
						<div class="col-sm-12">
								<!--sign up form-->
								<form action="${pageContext.request.contextPath }/order/pay/add" method="POST" id="shipping-address">
									<c:forEach items="${listPayment}" var="objItem">
										<input type="radio" required="required" name="id_payment" value="${objItem.id_payment }"/>&nbsp;&nbsp;&nbsp;&nbsp;<h3 style="display: inline-block;">${objItem.name }</h3><br />
									</c:forEach>
									<div class="signup-form">
									<a><button type="submit" class="btn btn-default" style="display: inline-block;">Continue</button></a>
									<a href="${pageContext.request.contextPath }/order"><button type="button"  class="btn btn-default" style="display: inline-block;">Back to Order</button></a>
									</div><!--/sign up form-->
								</form>
							
						</div>
					</div>
				</div>
			</section><!--/#do_action-->
				<section id="cart_items">
					<div class="container col-sm-6">
						
						<div class="table-responsive cart_info">
							<table class="table table-condensed">
								<thead>
									<tr class="cart_menu">
										<td class="image">Item</td>
										<td class="price">Price</td>
										<td class="quantity">Quantity</td>
										<td class="total">Total</td>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
										for(Product item : listProduct){
									%>	
									<tr id="delete-<%=item.getId_product() %>">
										<td class="cart_description">
											<h4><%=item.getName() %></h4>
											<p>ProductID: <%=item.getId_product() %></p>
										</td>
										<td class="cart_price">
											<p><%=item.getPrice()%> VNĐ</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<input class="cart_quantity_input" type="text" name="quantity" id="quantity-<%=item.getId_product() %>" value="<%=item.getQuantity() %>" autocomplete="off" size="2" disabled>
											</div>
										</td>
										<td class="cart_total" id="set-quantity-<%=item.getId_product() %>">
											<p class="cart_total_price"><%=item.getPrice()*item.getQuantity() %> VNĐ</p>
										</td>
									</tr>
									<%} %>
									<tr>
										<td></td>
										<td></td>
										<td><h3>Total:</h3></td>
										<td><h3>${totalPrice } VNĐ</h3></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
				</section> <!--/#cart_items-->
			</c:when>
			<c:otherwise>
				<section id="cart_items">
					<div class="container">
						<h2>Please enter your order information <a href="${pageContext.request.contextPath }/order">here</a></h2>
					</div>
				</section>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<section id="cart_items">
			<div class="container">
				<h2>Your cart is empty</h2>
			</div>
		</section>
	</c:otherwise>
</c:choose>
