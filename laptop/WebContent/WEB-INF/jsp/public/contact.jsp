<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Contact Us</h2>
	    				<c:if test="${not empty msg }">
					   	  	<div class="alert alert-success" role="alert" id="message-success-admin">
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
							  ${msg}
							</div>
					      </c:if>
					   	  <c:if test="${not empty msg1 }">
					   	  	<div class="alert alert-success" role="alert" id="message-danger-admin">
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
							  ${msg1}
							</div>
					      </c:if>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" method="post" action="${pageContext.request.contextPath }/contact/add">
				            <c:choose>
								<c:when test="${pageContext.request.userPrincipal.name != null}">
									<div class="form-group col-md-6">
						                <input type="text" name="name" class="form-control" required="required" value="${objUserLogin.fullname}">
						            </div>
						            <div class="form-group col-md-6">
						                <input type="email" name="email" class="form-control" required="required" value="${objUserLogin.email}">
						            </div>
								</c:when>
								<c:otherwise>
									<div class="form-group col-md-6">
						                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
						            </div>
						            <div class="form-group col-md-6">
						                <input type="email" name="email" class="form-control" required="required" placeholder="Email">
						            </div>
								</c:otherwise>
							</c:choose>
				            <div class="form-group col-md-12">
				                <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				                <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		<div class="col-sm-4">
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
<script>
	window.setTimeout(function() {
	    $(".alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 4000);
</script>