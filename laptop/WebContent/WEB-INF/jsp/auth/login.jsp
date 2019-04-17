<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				  
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						  <c:if test="${not empty msg }">
					   	  	<div class="alert alert-success" role="alert" id="message-success">
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
							  ${msg }
							</div>
					      </c:if>
					   	  <c:if test="${not empty msg1 }">
					   	  	<div class="alert alert-success" role="alert" id="message-danger">
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
							  ${msg1 }
							</div>
					      </c:if>
						<form action="${pageContext.request.contextPath }/login" method="POST">
							<input type="text" required id="username" name="username" placeholder="Username" value="${usernamecookie}" onchange="change()"/>
							<input type="password" required id="password" name="password" placeholder="Password" value="${passwordcookie}" onchange="change()"/>
							<span>
								<input type="checkbox" class="checkbox" id="remember" name="remember" <c:if test="${not empty checkremember}">${checkremember}</c:if>> 
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
							<br /><a href="${pageContext.request.contextPath }/register">Register a new membership</a>
						</form>
					</div><!--/login form-->
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
</script>
<script type="text/javascript">
	$(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
            	var check = 'on';
            	var username = $('#username').val();
            	var password = $('#password').val();
            	$.ajax({
        			url: '${pageContext.request.contextPath }/check-remember',
        			type: 'POST',
        			cache: false,
        			data: {
        				ausername : username,
        				apassword : password,
        				acheck : check,
        					},
        			success: function(data){
        				//thông báo
        			},
        			error: function (){
        				alert('Có lỗi');
        			}
        		});
            }
            else if($(this).prop("checked") == false){
            	var check = 'off';
            	var username = $('#username').val();
            	var password = $('#password').val();
            	$.ajax({
        			url: '${pageContext.request.contextPath }/check-remember',
        			type: 'POST',
        			cache: false,
        			data: {
        				ausername : username,
        				apassword : password,
        				acheck : check,
        					},
        			success: function(data){
        				//thông báo
        			},
        			error: function (){
        				alert('Có lỗi');
        			}
        		});
            }
        });
    });
</script>
<script type="text/javascript">
	function change(){
		var username = $('#username').val();
		var password = $('#password').val();
		$('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
            	var check = 'on';
            	$.ajax({
        			url: '${pageContext.request.contextPath }/check-remember',
        			type: 'POST',
        			cache: false,
        			data: {
        				ausername : username,
        				apassword : password,
        				acheck : check,
        					},
        			success: function(data){
        				//thông báo
        			},
        			error: function (){
        				alert('Có lỗi');
        			}
        		});
            }
            else if($(this).prop("checked") == false){
            	var check = 'off';
            	$.ajax({
        			url: '${pageContext.request.contextPath }/check-remember',
        			type: 'POST',
        			cache: false,
        			data: {
        				ausername : username,
        				apassword : password,
        				acheck : check,
        					},
        			success: function(data){
        				//thông báo
        			},
        			error: function (){
        				alert('Có lỗi');
        			}
        		});
            }
        });
		if($('input[type="checkbox"]').prop("checked") == true){
        	var check = 'on';
        	$.ajax({
    			url: '${pageContext.request.contextPath }/check-remember',
    			type: 'POST',
    			cache: false,
    			data: {
    				ausername : username,
    				apassword : password,
    				acheck : check,
    					},
    			success: function(data){
    				//thông báo
    			},
    			error: function (){
    				alert('Có lỗi');
    			}
    		});
        }
	}
</script>
	