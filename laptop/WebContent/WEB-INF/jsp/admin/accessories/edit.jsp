<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#editAccessories" ).validate( {
			rules: {
				name: "required",
				id_product: {
					required: true,
					number : true,
				},
				cat : "required",
				preview: "required",
				price: {
					required: true,
					number : true,
				},
			},
			messages: {
				name: "Please enter laptop name",
				id_product: {
					required: "Please enter id_product",
					number : "Please enter the number",
				},
				cat: "Please enter category",
				preview: "Please enter preview",
				price: {
					required: "Please enter price",
					number : "Please enter the number",
				},
			},
		} );
	} );
</script>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Accessories Management > Edit
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/accessories/all"><i class="fa fa-windows"></i> Accessories Management</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/accessories/all"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Accessories Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="editAccessories" action="${pageContext.request.contextPath }/admincp/accessories/edit/${objItem.id_accessories}" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	
              	<div class="form-group col-sm-8">
	              <label class="control-label" for="name">Accessories name</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="name" name="name" placeholder="Enter Accessories Name" value="${objItem.name }">
	              </div>
	            </div>
	            <div class="form-group col-sm-8">
	              <label class="control-label" for="id_product">ProductID</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="id_product" name="id_product" placeholder="Enter mã sản phẩm" value="${objItem.id_product }" readonly>
	              </div>
	            </div>
                
                <div class="form-group col-sm-8">
	              <label class="control-label" for="cat">Category</label>
	              <div class="col-xl-6">
	             	<select name="cat" id="cat" class="form-control border-input">
                    	<option <c:if test="${objItem.cat == 'Headphone' }">selected</c:if> value="Headphone">Headphone</option>
                    	<option <c:if test="${objItem.cat == 'Mouse' }">selected</c:if> value="Mouse">Mouse</option>
                    	<option <c:if test="${objItem.cat == 'Keyboard' }">selected</c:if> value="Keyboard">Keyboard</option>
                    </select>
	              </div>
	            </div>
	            <div class="form-group col-sm-8">
	              <label class="control-label" for="preview">Preview</label>
	              <div class="col-xl-6">
	             	<textarea rows="3" name="preview" id="preview" class="form-control" placeholder="Enter Preview">${objItem.preview }</textarea>
	              	<script type="text/javascript">
						var ckeditor = CKEDITOR.replace('preview');
						CKFinder.setupCKEditor(ckeditor, '${pageContext.request.contextPath }/libraries/ckfinder/');
					</script>
	              </div>
	            </div>
	            <div class="form-group col-sm-8">
	              <label class="control-label" for="price">Price</label>
	              <div class="col-xl-6 input-group">
	             	<input type="text" class="form-control" id="price" name="price" placeholder="Enter Price" value="${objItem.price }">
	             	<span class="input-group-addon">VNĐ</span>
	              </div>
	            </div>
                <div class="form-group col-sm-8">
                  <label class="control-label" for="hinhanh">Picture</label>
                  <div class="col-xl-6">
               	 	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
               	  </div>
               	  <div id="image-holder"> </div>
               	  <label class="control-label" for="hinhanh">Ảnh cũ</label>
                  <div class="col-xl-6">
               	 	<img src="${pageContext.request.contextPath }/files/${objItem.picture}" width="200px" alt="" />
               	  </div>
                </div>
               
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Edit accessories</button>
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