<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Search Laptop</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Brand
										</a>
									</h4>
								</div>
								<div id="sportswear" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<c:forEach items="${listBrand }" var="objItem">
												<li>
													<input type="radio" name="brand" value="${objItem.id_brand }" onclick="searchproduct()"/>
													<a>${objItem.name }</a>
												</li>
	                                  		</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Price
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li>
												<input type="radio" name="price1" value="5" onclick="searchproduct()"/>
												<a>5 - 10 triệu </a>
											</li>
											<li>
												<input type="radio" name="price1" value="10" onclick="searchproduct()"/>
												<a>10 - 15 triệu</a>
											</li>
											<li>
												<input type="radio" name="price1" value="15" onclick="searchproduct()"/>
												<a>15 - 20 triệu</a>
											</li>
											<li>
												<input type="radio" name="price1" value="20" onclick="searchproduct()"/>
												<a>20 - 25 triệu</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Ram
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li>
												<input type="radio" name="ram1" value="4GB" onclick="searchproduct()"/>
												<a href="#">4GB</a>
											</li>
											<li>
												<input type="radio" name="ram1" value="8GB" onclick="searchproduct()"/>
												<a href="#">8GB</a>
											</li>
											<li>
												<input type="radio" name="ram1" value="16GB" onclick="searchproduct()"/>
												<a href="#">16GB</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens1">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											CPU
										</a>
									</h4>
								</div>
								<div id="womens1" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li>
												<input type="radio" name="cpu1" value="Core i3" onclick="searchproduct()"/>
												<a>Core i3</a>
											</li>
											<li>
												<input type="radio" name="cpu1" value="Core i5" onclick="searchproduct()"/>
												<a>Core i5</a>
											</li>
											<li>
												<input type="radio" name="cpu1" value="Core i7" onclick="searchproduct()"/>
												<a>Core i7</a>
											</li>
											<li>
												<input type="radio" name="cpu1" value="Core i9" onclick="searchproduct()"/>
												<a>Core i9</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens2">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											HDD
										</a>
									</h4>
								</div>
								<div id="womens2" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li>
												<input type="radio" name="hdd1" value="250GB" onclick="searchproduct()"/>
												<a>250GB</a>
											</li>
											<li>
												<input type="radio" name="hdd1" value="500GB" onclick="searchproduct()"/>
												<a>500GB</a>
											</li>
											<li>
												<input type="radio" name="hdd1" value="1TB" onclick="searchproduct()"/>
												<a>1TB</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Laptop</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<c:forEach items="${listBrand }" var="objItem">
										<li><a href="${pageContext.request.contextPath }/laptop/${slugUtils.makeSlug(objItem.name)}-${objItem.id_brand }"> <span class="pull-right">(${objItem.total })</span>${objItem.name }</a></li>
	                                </c:forEach>
								</ul>
							</div>
						</div><!--/brands_products-->
						<div class="brands_products"><!--brands_products-->
							<h2>Accessories</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="${pageContext.request.contextPath }/phu-kien/headphone"> <span class="pull-right">(${totalHeadphone})</span>Headphone</a></li>
									<li><a href="${pageContext.request.contextPath }/phu-kien/mouse"> <span class="pull-right">(${totalMouse})</span>Mouse</a></li>
									<li><a href="${pageContext.request.contextPath }/phu-kien/keyboard"> <span class="pull-right">(${totalKeyboard})</span>Keyboard</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
						<!-- 
						<div class="price-range">price-range
							<h2>Range of prices</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="6" data-slider-max="25" data-slider-step="1" data-slider-value="[12,20]" id="sl2" ><br />
								 <b class="pull-left">6 triệu</b> <b class="pull-right">25 triệu</b>
							</div>
						</div>/price-range -->
					</div>
				</div>
<script>
	function searchproduct() {
		var id = 0;
		var price = 0;
		var ram = '';
		var cpu = '';
		var hdd = '';
		if ($("input[name='brand']:checked").val() != null) {
			id = $("input[name='brand']:checked").val();
		}
		if ($("input[name='price1']:checked").val() != null) {
			price = $("input[name='price1']:checked").val();
		}	
		if ($("input[name='ram1']:checked").val() != null) {
			ram = $("input[name='ram1']:checked").val();
		}	
		if ($("input[name='cpu1']:checked").val() != null) {
			cpu = $("input[name='cpu1']:checked").val();
		}	
		if ($("input[name='hdd1']:checked").val() != null) {
			hdd = $("input[name='hdd1']:checked").val();
		}	
		$.ajax({
			url: '${pageContext.request.contextPath }/search-product',
			type: 'POST',
			cache: false,
			data: {
				aid : id,
				aprice : price,
				aram : ram,
				acpu : cpu,
				ahdd : hdd,
			},
			success: function(data){
				$('#search-product').html(data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	};
</script>