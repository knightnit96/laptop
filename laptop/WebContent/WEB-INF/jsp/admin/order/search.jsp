<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Order Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-file-text-o"></i> &nbsp;&nbsp;Order Management</li>
      </ol>
    </section>
    <section class="content-header">
    	<div id="message-success">
    	</div>
       <div>
       		<form action="${pageContext.request.contextPath }/admincp/order/search" method="get">
       	 	<div class="form-group col-sm-3">
              	<label class="control-label" for="id_laptop" style="display: inline-block;">From:&nbsp;&nbsp;</label>
             	<div class="col-xl-3" style="display: inline-block;">
             		<input type="date" class="form-control" id="from_date" name="from_date" required>
          	  	</div>
           	</div>
           	<div class="form-group col-sm-3">
              	<label class="control-label" for="id_laptop" style="display: inline-block;">To:&nbsp;&nbsp;</label>
             	<div class="col-xl-3" style="display: inline-block;">
             		<input type="date" class="form-control" id="to_date" name="to_date" required>
          	  	</div>
           	</div>
           	<div class="form-group col-sm-3">
             	<div class="col-xl-3" style="display: inline-block;">
             		 <button type="submit" class="btn btn-primary" style="margin-right: 10px"><i class="fa fa-filter"></i> Filter</button>
             		 <button class="btn btn-success"><i class="glyphicon glyphicon-export"></i> Export to Excel</button>
          	  	</div>
           	</div>
           	</form>
       </div>
       <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th><input type="checkbox" id="checkAll" name="checkAll"></th>
                  <th width="200px">Name</th>
                  <th>Email</th>
                  <th>Status</th>
                  <th>Payment</th>
                  <th>Price</th>
                  <th width="100px">Created Date</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${getListSearch }" var="objItem">
                <fmt:formatDate value="${objItem.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
                <tr id="order-${objItem.id_order }">
                  <td><input type="checkbox" class="checkbox" value="${objItem.id_order }"></td>
                  <td>${objItem.name}</td>
                  <td>${objItem.email}</td>
                  <td>
                  	<select name="status" id="status" class="form-control border-input">
                    	<option value="Pending" <c:if test="${objItem.status == 'Pending'}">selected</c:if>>Pending</option>
                    	<option value="Shipping" <c:if test="${objItem.status == 'Shipping'}">selected</c:if>>Shipping</option>
                    	<option value="Finished" <c:if test="${objItem.status == 'Finished'}">selected</c:if>>Finished</option>
                    	<option value="Rejected" <c:if test="${objItem.status == 'Rejected'}">selected</c:if>>Rejected</option>
                    </select>
                  </td>
                  <td>
                  	<select name="id_payment" id="id_payment" class="form-control border-input">
                    	<c:forEach items="${listPayment }" var="objItem1">
                    		<option value="${objItem1.id_payment }" <c:if test="${objItem.id_payment == objItem1.id_payment}">selected</c:if>>${objItem1.name }</option>
                    	</c:forEach>
                    </select>
                  </td>
                  <td>${objItem.price}</td>
                  <td>${fmtDate}</td>
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="javascript:void(0)" onclick="edit_order(${objItem.id_order})" class="btn btn-info btn-xs"><i class="fa fa-edit"></i>Save</a>
                  	   <a style="font-size: 9px" href="javascript:void(0)" onclick="window.open('${pageContext.request.contextPath }/order/detail/${objItem.id_order }')" class="btn btn-success btn-xs"><i class="fa fa-eye"></i>View</a>
		               <a style="font-size: 9px" href="javascript:void(0)" onclick="del_order(${objItem.id_order})" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></i> Del</a>		
		             </div>
                  </td>
                </tr>
                </c:forEach>
                </tbody>
              </table>
              <div class="">
             	<div class="col-xl-3" style="display: inline-block;">
             		<button class="btn btn-danger btn-sm" onclick="delete_all()"><i class="fa fa-trash-o"></i> Delete</button>
          	  	</div>
           	  </div>
            </div>
    </section>
<script>
	function edit_order(id_order){
		var status = $("#status").val();
		var id_payment = $("#id_payment").val();
		$.ajax({
			url: '${pageContext.request.contextPath }/admincp/order/edit',
			type: 'POST',
			cache: false,
			data: {
				aid_order : id_order,
				astatus : status,
				aid_payment : id_payment,
					},
			success: function(data){
				alert(""+data);
				//thông báo
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>	
<script>
	function del_order(id_order){
		var check =  confirm('Do you want to delete this item?');
		if (check == true) {
			$.ajax({
				url: '${pageContext.request.contextPath }/admincp/order/del/'+id_order,
				type: 'POST',
				cache: false,
				data: {
						},
				success: function(data){
					$("#order"+'-'+id_order).html(data);
				},
				error: function (){
					alert('Có lỗi');
				}
			});
		} 
	}	
</script>	 
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": false,
	  "searching": false,
      "lengthChange": true,
      "searching": false,
      "ordering": true,
      "info": false,
      "autoWidth": true
    });
  });
</script>
<script>
	function export_excel(){
		var from_date = "";
		var to_date = "";
		if ($('#from_date').val() != null) {
			from_date = $('#from_date').val();
			to_date = $('#to_date').val();
		}
		$.ajax({
			url: '${pageContext.request.contextPath }/admincp/order/export',
			type: 'POST',
			cache: false,
			data: {
				afrom_date : from_date,
				ato_date : to_date,
					},
			success: function(data){
				alert(""+data);
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	}	
</script>
<script type="text/javascript">
    $('document').ready(function(){
        //lua chọn hoac bo lua chon cac checkbox class='checkbox'
        $("#checkAll").click(function () {
            $('.checkbox').not(this).prop('checked', this.checked);
        });
    });
</script>	 
<script>
function delete_all(){
	var check =  confirm('Do you want to delete this items?');
	if (check == true) {
		var mang = [];
		$(".checkbox").each(function() {
	        if ($(this).is(":checked")) {
	        	mang.push($(this).val());
	        }
	    });
		$.ajax({
			url: '${pageContext.request.contextPath }/admincp/order/delete-all',
			type: 'POST',
			cache: false,
			data: {
				amang : mang,
			},
			success: function(data){
				alert(data);
				$(".checkbox").each(function() {
			        if ($(this).is(":checked")) {
			        	$('#order-'+$(this).val()).remove();
			        }
			    });
			},
			error: function (){
				alert('Có lỗi');
			}
		});
	} 
}	
</script>	 	 