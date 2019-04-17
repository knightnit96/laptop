<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Profile Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-user"></i> &nbsp;&nbsp;Profile Management</li>
      </ol>
    </section>
    <section class="content-header">
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
      <div class="clearfix no-border">
		  <div class="form-group col-sm-8">
		   <a href="${pageContext.request.contextPath }/admincp"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Home</button></a>
	      </div>
      </div>
      
       <div class="box-body">
          <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-user"></i> Profile
          <small class="pull-right">UserID: ${objUserLogin.id }</small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    
	<form action="${pageContext.request.contextPath }/admincp/edit/profile" method="POST" enctype="multipart/form-data">
    <div class="row">
      <!-- accepted payments column -->
      <!-- /.col -->
      <div class="col-xs-1">
      </div>
      <div class="col-xs-3">
      	 <c:choose>
			<c:when test="${not empty objUserLogin.avatar }">
				<img src="${pageContext.request.contextPath }/files/${objUserLogin.avatar}" alt="" width="220px" height="220px"/>
			</c:when>
			<c:otherwise>
				<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="220px" height="220px"/>
			</c:otherwise>
		</c:choose>
      </div>
      <div class="col-xs-7">

        <div class="table-responsive" id="edit-profile">
          <table class="table">
            <tr>
              <th>Username:</th>
              <td>${objUserLogin.username }</td>
            </tr>
            <tr>
              <th>Fullname:</th>
              <td>${objUserLogin.fullname }</td>
            </tr>
            <tr>
              <th>Email:</th>
              <td>${objUserLogin.email }</td>
            </tr>
            <tr>
              <th>Phone:</th>
              <td>${objUserLogin.phone }</td>
            </tr>
            <tr>
              <th>Facebook:</th>
              <td>${objUserLogin.linkface }</td>
            </tr>
            <tr>
              <th>Role:</th>
              <td>${objUserLogin.role }</td>
            </tr>
          </table>
        </div>
      </div>
      <div class="col-xs-1">
      </div>
      <!-- /.col -->
      <div class="col-xs-12">
          <a type="button" href="javascript:void(0)" onclick="edit_profile()" class="btn btn-info pull-right" id="button-edit"><i class="fa fa-edit"></i> Edit</a>
          <button type="submit" class="btn btn-info pull-right" id="button-save" style="display: none;"><i class="fa fa-save"></i> Save</button>
          <a type="button" href="${pageContext.request.contextPath }/admincp/profile" class="btn btn-info pull-right" id="button-cancel" style="display: none; margin-right: 20px">Cancel</a>
        </div>
    </div>
    </form>
    <!-- /.row -->
  </section>
		</div>
    </section>
<script>
	function edit_profile(){
		$.ajaxSetup({
			    headers: {
			      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			    }
			  });
		$.ajax({
			url: '${pageContext.request.contextPath }/admincp/edit-profile',
			type: 'POST',
			cache: false,
			data: {
					},
			success: function(data){
				$('#edit-profile').html(data);
				$('#button-edit').hide();
				$('#button-save').show();
				$('#button-cancel').show();
				//confirm_password
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
				//show picture 
				$("#hinhanh").on('change', function () {
					
				    if (typeof (FileReader) != "undefined") {
				
				        var image_holder = $("#image-holder");
				        image_holder.empty();
				
				        var reader = new FileReader();
				        reader.onload = function (e) {
				            $("<img />", {
				                "src": e.target.result,
				                "class": "thumb-image",
				                "width":"220px",
				                "height":"220px",
				                "margin-right" : "100px",
				            }).appendTo(image_holder);
				
				        }
				        image_holder.show();
				        reader.readAsDataURL($(this)[0].files[0]);
				    } else {
				        alert("Error showing preview image!");
				    }
				});	
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>    
<script>
	window.setTimeout(function() {
	    $(".alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 4000);
</script>    