<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Laptop Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-laptop"></i> &nbsp;&nbsp;Laptop Management</li>
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
   	 	<a href="${pageContext.request.contextPath }/admincp/laptop/add"><button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Add new laptop</button></a>
      </div>
      <div class="form-group col-sm-4">
		  <form action="${pageContext.request.contextPath }/admincp/laptop/search" method="get" class="sidebar-form">
	        <div class="input-group">
	          <input type="text" name="q" class="form-control" placeholder="Search...">
	          <span class="input-group-btn">
	            <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	            </button>
	          </span>
	        </div>
	      </form>	
      </div>
      
      </div>
      
       <div class="box-body">
          <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="200px">Name</th>
                  <th>Picture</th>
                  <th>Mã sản phẩm</th>
                  <th width="100px">Hãng</th>
                  <th width="200px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${getListSearch }" var="objItem2">
                <c:set var="urlDetail" value="${pageContext.request.contextPath }/admincp/laptop/detail/${objItem2.id_laptop }"></c:set>
                <c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/laptop/edit/${objItem2.id_laptop }"></c:set>
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/laptop/del/${objItem2.id_laptop }"></c:set>
                <tr>
                  <td>${objItem2.id_laptop}</td>
                  <td><a href="${urlEdit}">${objItem2.name}</a></td>
                  <td>
                     <c:choose>
						<c:when test="${not empty objItem2.picture }">
							<img src="${pageContext.request.contextPath }/files/${objItem2.picture}" alt="" width="100px" height="100px"/>
						</c:when>
						<c:otherwise>
							<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="100px" height="100px"/>
						</c:otherwise>
					</c:choose>
	              </td>
                  <td>${objItem2.id_product}</td>
                  <td>
					<c:forEach items="${listBrand }" var="objItem3">
						<c:if test="${objItem2.id_brand == objItem3.id_brand }">${objItem3.name}</c:if>
					</c:forEach>
				  </td>
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="${urlDetail}" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-edit"></i> View Detail</a>
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
      "info": false,
      "autoWidth": true
    });
  });
</script>	