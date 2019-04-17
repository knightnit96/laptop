<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function () {
		$( "#addLaptop").validate( {
			rules: {
				name: "required",
				id_product: {
					required: true,
					number : true,
				},
				id_brand : "required",
				cpu: "required",
				ram: "required",
				display: "required",
				hdd: "required",
				graphic: "required",
				os: "required",
				battery: {
					required: true,
					number : true,
				},
				weight: {
					required: true,
					number : true,
				},
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
				id_brand: "Please enter id_brand",
				cpu: "Please enter cpu",
				ram: "Please enter ram",
				display: "Please enter display",
				hdd: "Please enter hdd",
				graphic: "Please enter graphic",
				os: "Please enter os",
				battery: {
					required: "Please enter battery",
					number : "Please enter the number",
				},
				weight: {
					required: "Please enter weight",
					number : "Please enter the number",
				},
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
        Laptop Management > Add
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/admincp/laptop/all"><i class="fa fa-laptop"></i> Laptop Management</a></li>
        <li class="active">Add</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
      <a href="${pageContext.request.contextPath }/admincp/laptop/all"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Laptop Management</button></a>
      </div>
      
       <div class="box-body">
       	  <div class="box box-primary">
       	  	<!-- <div class="callout callout-danger">
	         <h4>Lỗi 123</h4>
	       </div> -->
            <!-- form start -->
            <form id="addLaptop" action="${pageContext.request.contextPath }/admincp/laptop/add" method="post" enctype="multipart/form-data">
              <div class="box-body">
              	
              	<div class="form-group col-sm-6">
	              <label class="control-label" for="name">Laptop Name</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="name" name="name" placeholder="Enter Laptop Name">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="id_product">ProductID</label>
	              <div class="col-xl-6 input-group">
	                <span class="input-group-addon">100</span>
	             	<input type="text" class="form-control" id="id_product" name="id_product" placeholder="Enter mã sản phẩm">
	              </div>
	            </div>
                
                <div class="form-group col-sm-6">
	              <label class="control-label" for="id_brand">Brand</label>
	              <div class="col-xl-6">
	             	<select name="id_brand" id="id_brand" class="form-control border-input">
                    	<c:forEach items="${listBrand }" var="objItem">
                    		<option value="${objItem.id_brand }">${objItem.name }</option>
                    	</c:forEach>
                    </select>
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="cpu">CPU</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="cpu" name="cpu" placeholder="Enter CPU">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="ram">Ram</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="ram" name="ram" placeholder="Enter Ram">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="display">Display</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="display" name="display" placeholder="Enter Display">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="hdd">HDD</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="hdd" name="hdd" placeholder="Enter HDD">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="graphic">Graphic</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="graphic" name="graphic" placeholder="Enter Graphic">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="os">Os</label>
	              <div class="col-xl-6">
	             	<input type="text" class="form-control" id="os" name="os" placeholder="Enter OS">
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="battery">Battery</label>
	              <div class="col-xl-6 input-group">
	             	<input type="text" class="form-control" id="battery" name="battery" placeholder="Enter Battery">
	              	<span class="input-group-addon">Cell</span>
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="weight">Weight</label>
	              <div class="col-xl-6 input-group">
	             	<input type="text" class="form-control" id="weight" name="weight" placeholder="Enter Weight">
	             	<span class="input-group-addon">Kg</span>
	              </div>
	            </div>
	            <div class="form-group col-sm-6">
	              <label class="control-label" for="price">Price</label>
	              <div class="col-xl-6 input-group">
	             	<input type="text" class="form-control" id="price" name="price" placeholder="Enter Price">
	             	<span class="input-group-addon">VNĐ</span>
	              </div>
	            </div>
                <div class="form-group col-sm-6">
                  <label class="control-label">Picture</label>
                  <div class="col-xl-6">
               	 	<input type="file" name="hinhanh" id="hinhanh" class="form-control" placeholder="Chọn ảnh" />
               	  </div>
               	  
                </div>
                <div class="form-group col-sm-6">
                  <div id="image-holder"> </div>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Add laptop</button>
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