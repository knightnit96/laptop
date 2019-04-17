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
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">LAPTOP</h2>
						<c:if test="${empty listItem }">-- NO PRODUCT --</c:if>
						<c:forEach items="${listItem }" var="objItem">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<c:choose>
												<c:when test="${not empty objItem.picture }">
													<a href=""><img src="${pageContext.request.contextPath }/files/${objItem.picture}" alt="" width="258px" height="258px"/></a>
												</c:when>
												<c:otherwise>
													<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="258px" height="258px"/>
												</c:otherwise>
											</c:choose>
											<h2>${objItem.price } VNĐ</h2>
											<p>${objItem.name }</p>
											<a href="javascript:void(0)" onclick="buy_product(${objItem.id_product},1, '${objItem.name }')" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<p>CPU: ${objItem.cpu }</p>
												<p>Ram: ${objItem.ram }</p>
												<p>Display: ${objItem.display }</p>
												<p>HDD: ${objItem.hdd }</p>
												<p>Graphic: ${objItem.graphic }</p>
												<p>Os: ${objItem.os }</p>
												<p>Battery: ${objItem.battery } Cell</p>
												<p>Weight: ${objItem.weight } Kg</p>
												<h2>${objItem.price } VNĐ</h2>
												<a href="${pageContext.request.contextPath }/${slugUtils.makeSlug(objItem.name)}-${objItem.id_product }.html"><p>${objItem.name }</p></a>
												<a href="javascript:void(0)" onclick="buy_product(${objItem.id_product},1, '${objItem.name }')" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="javascript:void(0)" onclick="add_wishlist(${objItem.id_product}, '${objItem.name }', '${objItem.picture }', ${objItem.price })"><i class="fa fa-plus-square"></i>Wishlist</a></li>
										<li><a href="${pageContext.request.contextPath }/${slugUtils.makeSlug(objItem.name)}-${objItem.id_product }.html"><i class="fa fa-info-circle"></i>Chi tiết</a></li>
									</ul>
								</div>
							</div>
						</div>
						</c:forEach>
					</div><!--features_items-->
					<div class="text-center">
					      <ul class="pagination">
					         <c:choose>
					         	<c:when test="${totalPage == 1 }">
								</c:when>
								<c:when test="${totalPage <= 3 }">
									<c:forEach var="i" begin="1" end="${totalPage }">
							    		<li <c:if test="${page == i }">class='active'</c:if>><a href="${pageContext.request.contextPath }/laptop?page=${i}" title="">${i }</a></li> 
							    	</c:forEach>
								</c:when>
								<c:otherwise>
									<c:if test="${page != 1 }">
										<li>
										  <a href="${pageContext.request.contextPath }/laptop?page=1" aria-label="Previous">
											<span aria-hidden="true">First</span>
										  </a>
										</li>
										<li>
										  <a href="${pageContext.request.contextPath }/laptop?page=${page-1}" aria-label="Previous">
											<span aria-hidden="true">«</span>
										  </a>
										</li>
										<li><a href="${pageContext.request.contextPath }/laptop?page=${page-1}" title="">${page-1}</a></li> 
									</c:if>
									<li class='active'><a href="${pageContext.request.contextPath }/laptop?page=${page}" title="">${page }</a></li> 
									<c:if test="${page != totalPage }">
										<li><a href="${pageContext.request.contextPath }/laptop?page=${page+1}" title="">${page+1}</a></li> 
										<li>
										  <a href="${pageContext.request.contextPath }/laptop?page=${page+1}" aria-label="Next">
											<span aria-hidden="true">»</span>
										  </a>
										</li>
										<li>
										  <a href="${pageContext.request.contextPath }/laptop?page=${totalPage }" aria-label="Previous">
											<span aria-hidden="true">Last</span>
										  </a>
										</li>
									</c:if>
								</c:otherwise>
							</c:choose>
					    </ul>
					    
		            </div>
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
