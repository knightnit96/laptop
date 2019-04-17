<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#addUser" ).validate( {
			rules: {
				username: "required",
				fullname: "required",
				password: {
					required: true,
					minlength: 6,
				},
				confirm_password: {
					required: true,
					minlength: 6,
					equalTo: "#password",
				},
				email: {
					required: true,
					email: true,
				},
				phone: {
					required: true,
					number : true,
				},
				linkface: {
					required: true,
					url: true,
				}
			},
			messages: {
				username: "Please enter username",
				fullname: "Please enter fullname",
				password: {
					required: "Please enter password",
					minlength: "Please enter more than 6 characterss",
				},
				confirm_password: {
					required: "Please enter confirm password",
					minlength: "Please enter more than 6 characterss",
					equalTo: "Please enter the same password as above",
				},
				email: {
					required: "Please enter email",
					email: "Please enter a valid email address",
				},
				phone: {
					required: "Please enter phone",
					number : "Please enter the number",
				},
				linkface: {
					required: "Please enter link facebook",
					url: "Please enter a valid url address",
				}
			},
			errorPlacement: function ( error, element ) {
				// Add the `help-block` class to the error element
				error.addClass( "help-block" );

				// Add `has-feedback` class to the parent div.form-group
				// in order to add icons to inputs
				element.parents( ".col-xl-5" ).addClass( "has-feedback" );

				if ( element.prop( "type" ) === "checkbox" ) {
					error.insertAfter( element.parent( "label" ) );
				} else {
					error.insertAfter( element );
				}

				// Add the span element, if doesn't exists, and apply the icon classes to it.
				if ( !element.next( "span" )[ 0 ] ) {
					$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
				}
			},
			success: function ( label, element ) {
				// Add the span element, if doesn't exists, and apply the icon classes to it.
				if ( !$( element ).next( "span" )[ 0 ] ) {
					$( "<span class='glyphicon glyphicon-ok form-control-feedback'></span>" ).insertAfter( $( element ) );
				}
			},
			highlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-xl-5" ).addClass( "has-error" ).removeClass( "has-success" );
				$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
			},
			unhighlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-xl-5" ).addClass( "has-success" ).removeClass( "has-error" );
				$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
			}
		} );
	} );
</script>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Management > Add
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/user"><i class="fa fa-user"></i> User Management</a></li>
        <li class="active">Add</li>
      </ol>
    </section>
    <section class="content-header">
      <c:if test="${not empty msg1 }">
   	  	<div class="alert alert-success" role="alert" id="message-danger-admin">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
		  ${msg1}
		</div>
      </c:if>
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/user"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to User Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="addUser" action="${pageContext.request.contextPath }/admincp/user/add" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	
              	<div class="form-group col-sm-5">
	              <label class="control-label" for="username">Username</label>
	              <div class="col-xl-5">
	             	<input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
	              </div>
	            </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="fullname">Fullname</label>
                  <div class="col-xl-5">
                  	<input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter fullname">
               	  </div>
                </div>
                <div class="form-group col-sm-2">
                  <label class="control-label" for="role">Level</label>
                  <div class="col-xl-2">
                  	<select name="role" id="role" class="form-control border-input">
                    	<option value="ADMIN">ADMIN</option>                                           	
                    	<option value="MOD">MOD</option>
                    	<option value="USER" selected>USER</option>                                            	
                    </select>
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="password">Password</label>
                  <div class="col-xl-5">
                  	<input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="confirm_password">Confirm Password</label>
                  <div class="col-xl-5">
                  	<input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Enter confirm password">
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="email">Email</label>
                  <div class="col-xl-5">
                  	<input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="phone">Phone</label>
                  <div class="col-xl-5">
                  	<input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone">
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="linkface">Facebook</label>
                  <div class="col-xl-5">
                  	<input type="text" class="form-control" id="linkface" name="linkface" placeholder="Enter facebook" value="https://www.facebook.com/">
               	  </div>
                </div>
                <div class="form-group col-sm-5">
                  <label class="control-label" for="hinhanh">Avatar</label>
                  <div class="col-xl-5">
               	 	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
               	  </div>
               	  <div id="image-holder"> </div>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Add user</button>
              </div>
            </form>
          </div>
       </div>	
    </section>
<script>
	window.setTimeout(function() {
	    $(".alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 4000);
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