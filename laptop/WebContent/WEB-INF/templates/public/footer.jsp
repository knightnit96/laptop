<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<footer id="footer"><!--Footer-->
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Knight-SHOP</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="https://www.facebook.com/">Facebook</a></li>
								<li><a href="https://twitter.com">Twitter</a></li>
								<li><a href="https://plus.google.com">Google+</a></li>
								<li><a href="${pageContext.request.contextPath }/lien-he">Contact Us</a></li>
								<li><a href="http://vinaenter.edu.vn">FAQ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Điện thoại</a></li>
								<li><a href="#">Thời trang</a></li>
								<li><a href="#">Thức ăn</a></li>
								<li><a href="#">Máy ảnh</a></li>
								<li><a href="#">Điện tử</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Tags</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="${pageContext.request.contextPath }/laptop/dell-1">Dell</a></li>
								<li><a href="${pageContext.request.contextPath }/laptop/asus-2">Asus</a></li>
								<li><a href="${pageContext.request.contextPath }/laptop/hp-3">HP</a></li>
								<li><a href="${pageContext.request.contextPath }/laptop/acer-4">Acer</a></li>
								<li><a href="${pageContext.request.contextPath }/laptop/lenovo-5">Lenovo</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Tags</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="${pageContext.request.contextPath }/laptop/msi-6">MSI</a></li>
								<li><a href="${pageContext.request.contextPath }/laptop">Laptop</a></li>
								<li><a href="${pageContext.request.contextPath }/phu-kien/headphone">Headphone</a></li>
								<li><a href="${pageContext.request.contextPath }/phu-kien/mouse">Mouse</a></li>
								<li><a href="${pageContext.request.contextPath }/phu-kien/keyboard	">Keyboard</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>NEWSLETTER</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Đăng kí nhận thông báo từ trang web của chúng tôi</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2017 Knight-SHOP Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="https://www.facebook.com/thuanha302934">Nguyễn Hoàng Thuận</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	<script src="${defines.URL_PUBLIC}/js/bootstrap.min.js"></script>
	<script src="${defines.URL_PUBLIC}/js/bootstrap-notify.js"></script>
	<script src="${defines.URL_PUBLIC}/js/price-range.js"></script>
	<script src="${defines.URL_PUBLIC}/js/jquery.scrollUp.min.js"></script>
    <script src="${defines.URL_PUBLIC}/js/jquery.prettyPhoto.js"></script>
    <script src="${defines.URL_PUBLIC}/js/main.js"></script>
	<script src="${defines.URL_PUBLIC}/js/demo1.js"></script>
</body>
</html>