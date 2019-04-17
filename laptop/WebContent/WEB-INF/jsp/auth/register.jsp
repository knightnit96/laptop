<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<c:if test="${not empty msg2 }">
			   	  	<div class="alert alert-success" role="alert" id="message-danger">
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					  ${msg2 }
					</div>
			      </c:if>
				<div class="col-sm-6">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="${pageContext.request.contextPath }/add-user" method="POST" enctype="multipart/form-data">
							<input type="text" required id="username" name="username" placeholder="Username"/>
							<input type="text" required id="fullname" name="fullname" placeholder="Fullname"/>
							<input type="password" required id="password" name="password" placeholder="Password"/>
							<input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password"/>
							<input type="email" required id="email" name="email" placeholder="Email"/>
							<input type="number" required id="phone" name="phone" placeholder="Phone"/>
							<input type="url" required id="linkface" name="linkface" placeholder="Facebook"/>
							<div class="input-group">
								<span class="input-group-addon">Avatar</span>
				             	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
				            </div><br />
				            <div id="image-holder"> </div><br />
							<button type="submit" class="btn btn-default">Signup</button>
							<br /><a href="${pageContext.request.contextPath }/login">I already have a membership</a>
						</form>
					</div><!--/sign up form-->
				</div>
				<div class="col-sm-6">
	    			<div class="contact-info">
	    				<h2 class="title text-center">Contact Info</h2>
	    				<address>
	    					<p>KnightSHOP</p>
							<p>72 Nguyễn Lương Bằng q.Liên Chiểu</p>
							<p>Đà Nẵng - Việt Nam</p>
							<p>Mobile: +84 986 021 416</p>
							<p>Tel: (0236) 3.888.888</p>
							<p>Email: knightnit96@gmail.com</p>
	    				</address>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Social Networking</h2>
							<ul>
								<li>
									<a href="https://www.facebook.com/thuanha302934"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="https://plus.google.com/110832971767088514199"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="https://www.youtube.com/channel/UC-nmTenwjOxDV9sa3PkTuAw"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div> 
			</div>
		</div>
	</section><!--/form-->
<script>
	window.setTimeout(function() {
	    $(".alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 4000);
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
</script>
<script>
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
</script>