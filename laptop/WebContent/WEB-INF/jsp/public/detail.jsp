<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-9 padding-right" id="search-product">
					<div class="alert alert-success" role="alert" id="message-success" style="display:none">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					  <div id="message-content-success"></div>
					</div>
					<div class="alert alert-success" role="alert" id="message-danger" style="display:none">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					  <div id="message-content-danger"></div>
					</div>
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<c:choose>
									<c:when test="${not empty objItem.picture }">
										<img id="img_detail" src="${pageContext.request.contextPath }/files/${objItem.picture}" data-zoom-image="${pageContext.request.contextPath }/files/${objItem.picture}" width="329px" height="329px"/>
									</c:when>
									<c:otherwise>
										<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="329px" height="329px"/>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<c:if test="${not empty newproduct}"><img src="${defines.URL_PUBLIC}/images/product-details/new.jpg" class="newarrival" alt="" /></c:if>
								<h2>${objItem.name }</h2>
								<p>ProductID: ${objItem.id_product}</p>
								<span>
									<span>${objItem.price } VNĐ</span>
								</span>
								<span>
									<label>Quantity:</label>
									<input type="text" value="1" name="quantity" id="quantity"/>
									<a href="javascript:void(0)" onclick="buy_product(${objItem.id_product}, '${objItem.name }')" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</a>
									<a href="javascript:void(0)" onclick="add_wishlist(${objItem.id_product}, '${objItem.name }', '${objItem.picture }', ${objItem.price })" class="btn btn-fefault cart">
										<i class="fa fa-plus-square"></i>
										Wishlist
									</a>
								</span>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a href="#details" data-toggle="tab">Detail Product</a></li>
								<li><a href="#tag" data-toggle="tab">Product Related</a></li>
								<li class="active"><a href="#reviews" data-toggle="tab" id="totalReview">Reviews (${totalReview})</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade" id="details" >
								<c:choose>
									<c:when test="${typeproduct == 'laptop'}">
										<h4>CPU: ${objItem.cpu }</h4>
										<h4>Ram: ${objItem.ram }</h4>
										<h4>Display: ${objItem.display }</h4>
										<h4>HDD: ${objItem.hdd }</h4>
										<h4>Graphic: ${objItem.graphic }</h4>
										<h4>Os: ${objItem.os }</h4>
										<h4>Battery: ${objItem.battery } Cell</h4>
										<h4>Weight: ${objItem.weight } Kg</h4>
									</c:when>
									<c:otherwise>
										<h4>Preview: ${objItem.preview }</h4>
									</c:otherwise>
								</c:choose>			
												
							</div>
							<div class="tab-pane fade" id="tag" >
								<c:forEach items="${listItemLQ }" var="objItem">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<c:choose>
													<c:when test="${not empty objItem.picture }">
														<img src="${pageContext.request.contextPath }/files/${objItem.picture}" alt="" width="177px" height="177px"/>
													</c:when>
													<c:otherwise>
														<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="177px" height="177px"/>
													</c:otherwise>
												</c:choose>
												<h2>${objItem.price } VNĐ</h2>
												<p>${objItem.name }</p>
												<a href="${pageContext.request.contextPath }/${slugUtils.makeSlug(objItem.name)}-${objItem.id_product }.html" class="btn btn-default add-to-cart"><i class="fa fa-info-circle"></i>Chi tiết</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							
							<div class="tab-pane fade active in" id="reviews" >
								<%
									if(request.getAttribute("listCmt") != null){
										ArrayList<Comment> listCmt = (ArrayList<Comment>) request.getAttribute("listCmt");
										SimpleDateFormat date1 = new SimpleDateFormat("dd/MM/yyyy");
										SimpleDateFormat time1 = new SimpleDateFormat("hh:mm:ss");
										for (Comment objCmt : listCmt){
											if (objCmt.getId_parent() == 0){
												String date = date1.format(objCmt.getDate());
												String time = time1.format(objCmt.getDate());
								%>
								<div class="col-sm-12" style="margin-top: 15px;" id="comment-<%=objCmt.getId_comment()%>">
									<div>
										<ul style="margin-bottom: -2px">
											<li style="float: left;"><a><i class="fa fa-user"></i><% if(objCmt.getRole().equals("ADMIN") || objCmt.getRole().equals("MOD")){ %>[<%=objCmt.getRole()%>]<%} %> <%=objCmt.getName() %></a></li>
												<li style="float: left;"><a><i class="fa fa-clock-o"></i><%=time %></a></li>
												<li style="float: left;"><a><i class="fa fa-calendar-o"></i><%=date %></a></li>
												<%
													if (objCmt.getEmail().equals(request.getAttribute("emailUserLogin"))){
												%>
												<li style="float: right;"><a onclick="delete_comment(<%=objCmt.getId_comment()%>)"><i class="fa fa-trash-o"></i>Delete</a></li>
												<li style="float: right;"><a onclick="edit_comment(<%=objCmt.getId_comment()%>)"><i class="fa fa-edit"></i>Edit</a></li>
												<%} else {%>
												<%
													if ("ADMIN".equals(request.getAttribute("roleUserLogin")) || "MOD".equals(request.getAttribute("roleUserLogin"))){
												%>
												<li style="float: right;"><a onclick="delete_comment(<%=objCmt.getId_comment()%>)"><i class="fa fa-trash-o"></i>Delete</a></li>
												<%}}%>
										</ul>
										<div class="clearfix"> </div>
										<div id="form-edit-save-<%=objCmt.getId_comment()%>">
											<p><%=objCmt.getMessage() %></p><br />
										</div>
									</div>
									<div id="reply-comment-<%=objCmt.getId_comment()%>">
									<%
										for (Comment objCmt1 : listCmt){
											if (objCmt1.getId_parent() == objCmt.getId_comment()){
												String date2 = date1.format(objCmt1.getDate());
												String time2 = time1.format(objCmt1.getDate());
									%>
										<div style="padding-left: 100px;" id="comment-<%=objCmt1.getId_comment()%>">
											<ul style="margin-bottom: -2px">
												<li style="float: left;"><a><i class="fa fa-user"></i><% if(objCmt1.getRole().equals("ADMIN") || objCmt1.getRole().equals("MOD")){ %>[<%=objCmt1.getRole()%>]<%} %> <%=objCmt1.getName() %></a></li>
												<li style="float: left;"><a><i class="fa fa-clock-o"></i><%=time %></a></li>
												<li style="float: left;"><a><i class="fa fa-calendar-o"></i><%=date %></a></li>
												<%
													if (objCmt1.getEmail().equals(request.getAttribute("emailUserLogin"))){
												%>
												<li style="float: right;"><a onclick="delete_comment(<%=objCmt1.getId_comment()%>)"><i class="fa fa-trash-o"></i>Delete</a></li>
												<li style="float: right;"><a onclick="edit_comment(<%=objCmt1.getId_comment()%>)"><i class="fa fa-edit"></i>Edit</a></li>
												<%} else{%>
												<%
													if ("ADMIN".equals(request.getAttribute("roleUserLogin")) || "MOD".equals(request.getAttribute("roleUserLogin"))){
												%>
												<li style="float: right;"><a onclick="delete_comment(<%=objCmt1.getId_comment()%>)"><i class="fa fa-trash-o"></i>Delete</a></li>
												<%}}%>
											</ul>
											<div class="clearfix"> </div>
											<div id="form-edit-save-<%=objCmt1.getId_comment()%>">
												<p><%=objCmt1.getMessage() %></p><br />
											</div>
										</div>
									<%}} %>
									</div>
									<form style="padding-left: 100px; margin-top: -40px">
										<span>
											<c:choose>
												<c:when test="${pageContext.request.userPrincipal.name != null}">
													<textarea name="message" id="message_reply_<%=objCmt.getId_comment()%>" rows="3" placeholder="Write Your Reply"></textarea>
													<a href="javascript:void(0)" onclick="reply(<%=objCmt.getId_comment()%>, <%=objCmt.getId_product()%>)"><button type="button" class="btn btn-default pull-right" style="margin-top: -20px; margin-right:4px; margin-bottom: 6px;">Reply</button></a>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</span>
									</form>
								</div>
								<%}}} %>
								<form>
									<span>
										<c:choose>
											<c:when test="${pageContext.request.userPrincipal.name != null}">
												<input type="hidden" id="id_product" name="id_product" value="${objItem.id_product}">
												<textarea name="message" id="message" rows="3" placeholder="Write Your Review"></textarea>
												<a href="javascript:void(0)" onclick="comment()"><button type="button" class="btn btn-default pull-right" style="margin-top: -20px; margin-right:4px">
													Comment
												</button></a>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</span>
								</form>
							</div>
							
						</div>
					</div><!--/category-tab-->
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">Advertisement</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<c:forEach items="${listVideo1 }" var="objItem">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<c:choose>
														<c:when test="${not empty objItem.picture }">
															<a href="${objItem.link }" target="_blank"><img src="${pageContext.request.contextPath }/files/${objItem.picture}" alt="${objItem.name }"/></a>
														</c:when>
														<c:otherwise>
															<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt=""/>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>	
								</div>
								<div class="item">
									<c:forEach items="${listVideo2 }" var="objItem">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<c:choose>
														<c:when test="${not empty objItem.picture }">
															<a href="${objItem.link}" target="_blank"><img src="${pageContext.request.contextPath }/files/${objItem.picture}" alt="${objItem.name }"/></a>
														</c:when>
														<c:otherwise>
															<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt=""/>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>	
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
				</div>
<script>
	function buy_product(id_product, name){
		var quantity = $('#quantity').val();
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
				document.getElementById("message-content-success").innerHTML = "<strong>Success!</strong> "+ quantity +" "+ name +" is added into your cart!";
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
<script>
	function add_wishlist(id_product, name, picture, price){
		checkWishlist(id_product, name);
		$.ajax({
			url: '${pageContext.request.contextPath }/add-wishlist',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
				aname : name,
				apicture : picture,
				aprice : price,
					},
			success: function(data){
				$('#wishlist').html(data);
 				//thông báo
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script type="text/javascript">
	function checkWishlist(id_product, name){
		$.ajax({
			url: '${pageContext.request.contextPath }/checkwishlist',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
				aname : name,
					},
			success: function(data){
				if (data == 1) {
					document.getElementById("message-content-success").innerHTML = "<strong>Success!</strong> "+ name +" is added into your wishlist!";
					$('#message-success').show();
					setTimeout(function() {
					    $('#message-success').slideUp(500);
					}, 4000);
				} else {
					document.getElementById("message-content-danger").innerHTML = "<strong>Failure!</strong> This item has already existed in wishlist!";
					$('#message-danger').show();
					setTimeout(function() {
					    $('#message-danger').slideUp(500);
					}, 4000);
				}
			},
			error: function (){
				alert('Có lỗi');
			}
		});
		}
</script>
<script>
	$("#img_detail").elevateZoom();
</script>
<script>
	function comment(){
		var id_product = $('#id_product').val();
		var message = $('#message').val();
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/comment',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
				amessage : message,
					},
			success: function(data){
				$('#reviews').html(data);
				changeTotalReview();
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function changeTotalReview(){
		var id_product = $('#id_product').val();
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/change-total-review',
			type: 'POST',
			cache: false,
			data: {
				aid_product : id_product,
					},
			success: function(data){
				$('#totalReview').html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function delete_comment(id_comment){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/delete-comment',
			type: 'POST',
			cache: false,
			data: {
				aid_comment : id_comment,
					},
			success: function(data){
				$('#comment-'+id_comment).html(data);
				changeTotalReview();
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function edit_comment(id_comment){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/edit-comment',
			type: 'POST',
			cache: false,
			data: {
				aid_comment : id_comment,
					},
			success: function(data){
				$('#form-edit-save-'+id_comment).html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function cancel_comment(id_comment){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/cancel-comment',
			type: 'POST',
			cache: false,
			data: {
				aid_comment : id_comment,
					},
			success: function(data){
				$('#form-edit-save-'+id_comment).html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function comment_save(id_comment){
		var message = $('#message-detail-'+id_comment).val();
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/comment-save',
			type: 'POST',
			cache: false,
			data: {
				aid_comment : id_comment,
				amessage : message,
					},
			success: function(data){
				$('#form-edit-save-'+id_comment).html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script>
	function reply(id_comment, id_product){
		var message = $('#message_reply_'+id_comment).val();
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/reply-comment',
			type: 'POST',
			cache: false,
			data: {
				aid_comment : id_comment,
				amessage : message,
				aid_product : id_product,
					},
			success: function(data){
				$('#reply-comment-'+id_comment).html(data);
				document.getElementById('message_reply_'+id_comment).value = "";
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>