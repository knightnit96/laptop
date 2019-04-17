<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<c:set var="a" value="1"></c:set>
							<c:forEach items="${listSlide }" var="objItem">
							<div class="item <c:if test="${a==1 }">active</c:if>">
								<div class="col-sm-6">
									<h1><span>Knight</span>-SHOP</h1>
									<h2>${objItem.name}</h2>
									<p>${objItem.preview}</p>
									<button type="button" class="btn btn-default get"><a href="${pageContext.request.contextPath }/${slugUtils.makeSlug(objItem.pname)}-${objItem.id_product }.html">Get it now</a></button>
								</div>
								<div class="col-sm-6">
									<c:choose>
										<c:when test="${not empty objItem.picture }">
											<img src="${pageContext.request.contextPath }/files/${objItem.picture}" class="girl img-responsive" alt="" />
										</c:when>
									</c:choose>
								</div>
							</div>
							<c:set var="a" value="2"></c:set>
							</c:forEach>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->