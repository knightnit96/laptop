<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#editSlide" ).validate( {
			rules: {
				name: "required",
				preview: "required",
				id_laptop: {
					required: true,
					number : true,
				},
			},
			messages: {
				name: "Please enter slide name",
				preview: "Please enter preview",
				id_laptop: {
					required: "Please enter id_laptop",
					number : "Please enter the number",
				},
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
        Slide Management > Edit
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/slide"><i class="fa fa-desktop"></i> Slide Management</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/slide"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Slide Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="editSlide" action="${pageContext.request.contextPath }/admincp/slide/edit/${objItem.id}" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	
              	<div class="form-group col-sm-6">
	              <label class="control-label">Name</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="name" name="name" placeholder="Enter slide name" value="${objItem.name}">
	              </div>
	            </div>
                
                <div class="form-group col-sm-6">
                  <label class="control-label">Mã laptop</label>
                  <div class="col-xl-6">
                  	<input type="text" class="form-control" id="id_laptop" name="id_laptop" placeholder="Enter id laptop" value="${objItem.id_laptop}">
               	  </div>
                </div>
                
                <div class="form-group col-sm-6">
                  <label class="control-label">Preview</label>
                  <div class="col-xl-6">
                  	<textarea rows="3" name="preview" id="preview" class="form-control" placeholder="Enter preview">${objItem.preview }</textarea>
               	  </div>
                </div>
                
                <div class="form-group col-sm-6">
                  <label class="control-label">Hình ảnh</label>
                  <div class="col-xl-6">
               	 	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
               	  </div>
               	  <div id="image-holder"> </div>
               	  <label class="control-label">Ảnh cũ</label>
               	  <div class="col-xl-6">
               	 	<img src="${pageContext.request.contextPath }/files/${objItem.picture}" width="200px" alt="" />
               	  </div>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Edit slide</button>
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
    
	 