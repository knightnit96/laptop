<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#addPayment" ).validate( {
			rules: {
				name: "required",
				info: "required"
			},
			messages: {
				name: "Please enter payment name",
				info: "Please enter payment info"
			},
			errorPlacement: function ( error, element ) {
				// Add the `help-block` class to the error element
				error.addClass( "help-block" );

				// Add `has-feedback` class to the parent div.form-group
				// in order to add icons to inputs
				element.parents( ".col-xl-12" ).addClass( "has-feedback" );

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
				$( element ).parents( ".col-xl-12" ).addClass( "has-error" ).removeClass( "has-success" );
				$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
			},
			unhighlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-xl-12" ).addClass( "has-success" ).removeClass( "has-error" );
				$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
			}
		} );
	} );
</script>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Payment Management > Add
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/payment"><i class="fa fa-credit-card"></i> Payment Management</a></li>
        <li class="active">Add</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/payment"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Payment Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="addPayment" action="${pageContext.request.contextPath }/admincp/payment/add" method="post" >
              <div class="box-body">
              	
              	<div class="form-group">
	              <label class="control-label" for="name">Payment Name</label>
	              <div class="col-xl-12">
	             	<input type="text" class="form-control" id="name" name="name" placeholder="Enter payment name">
	              </div>
	            </div>
                
                <div class="form-group">
                  <label class="control-label" for="info">Payment Info</label>
                  <div class="col-xl-12">
                  	<textarea rows="3" name="info" id="info" class="form-control" placeholder="Enter payment info"></textarea>
               	  </div>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Add Payment</button>
              </div>
            </form>
          </div>
       </div>	
    </section>
    
    
	 