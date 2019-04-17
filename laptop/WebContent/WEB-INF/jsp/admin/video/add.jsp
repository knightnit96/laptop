<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#addVideo" ).validate( {
			rules: {
				name: "required",
				link: "required",
				hinhanh: "required",
			},
			messages: {
				name: "Please enter video name",
				link: "Please enter link video",
				hinhanh: "Please enter picture",
			},
			errorPlacement: function ( error, element ) {
				// Add the `help-block` class to the error element
				error.addClass( "help-block" );

				// Add `has-feedback` class to the parent div.form-group
				// in order to add icons to inputs
				element.parents( ".col-xl-6" ).addClass( "has-feedback" );

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
				$( element ).parents( ".col-xl-6" ).addClass( "has-error" ).removeClass( "has-success" );
				$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
			},
			unhighlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-xl-6" ).addClass( "has-success" ).removeClass( "has-error" );
				$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
			}
		} );
	} );
</script>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Video Management > Add
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/slide"><i class="fa fa-youtube-play"></i> Video Management</a></li>
        <li class="active">Add</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/video"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Video Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="addVideo" action="${pageContext.request.contextPath }/admincp/video/add" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	
              	<div class="form-group col-sm-8">
	              <label class="control-label" for="name">Video name</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="name" name="name" placeholder="Enter video name">
	              </div>
	            </div>
                
                <div class="form-group col-sm-8">
                  <label class="control-label" for="link">Link</label>
                  <div class="col-xl-6">
                  	<input type="text" class="form-control" id="link" name="link" placeholder="Enter link">
               	  </div>
                </div>
                
                <div class="form-group col-sm-8">
                  <label class="control-label" for="hinhanh">Hình ảnh</label>
                  <div class="col-xl-6">
               	 	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
               	  </div>
               	  <div id="image-holder"> </div>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Add video</button>
              </div>
            </form>
          </div>
       </div>	
    </section>
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
    
	 