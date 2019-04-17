<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Payment Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-credit-card"></i> &nbsp;&nbsp;Payment Management</li>
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
      <a href="${pageContext.request.contextPath }/admincp/payment/add"><button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Add new payment</button></a>
      </div>	
       <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="300px">Payment Name</th>
                  <th>Payment Info</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listItem }" var="objItem">
                <c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/payment/edit/${objItem.id_payment }"></c:set>
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/payment/del/${objItem.id_payment }"></c:set>
                <tr>
                  <td>${objItem.id_payment}</td>
                  <td><a href="${urlEdit}">${objItem.name}</a></td>
                  <td>${objItem.info}</td>
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="${urlEdit}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> Edit</a>
		               <a style="font-size: 9px" href="${urlDel}" class="btn btn-danger btn-xs" onclick="return confirm('Do you want to delete this item?');"><i class="fa fa-trash-o"></i></i> Del</a>		
		             </div>
                  </td>
                </tr>
                </c:forEach>
                </tbody>
              </table>
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
  $(function () {
    $('#example2').DataTable({
      "paging": false,
	  "searching": false,
      "lengthChange": true,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": true
    });
  });
</script>	 