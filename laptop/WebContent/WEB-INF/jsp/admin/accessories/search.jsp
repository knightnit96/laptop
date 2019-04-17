<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Accessories Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-windows"></i> &nbsp;&nbsp;Accessories Management</li>
      </ol>
    </section>
    <section class="content-header">
      <div class="clearfix no-border">
	  <div class="form-group col-sm-8">
   	 	<a href="${pageContext.request.contextPath }/admincp/accessories/add"><button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Add new accessories</button></a>
      </div>
      <div class="form-group col-sm-4">
		  <form action="${pageContext.request.contextPath }/admincp/accessories/search" method="get" class="sidebar-form">
	        <div class="input-group">
	          <input type="text" name="q1" class="form-control" placeholder="Search...">
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
                  <th width="150px">Picture</th>
                  <th>Preview</th>
                  <th>ProductID</th>
                  <th width="150px">Price</th>
                  <th width="100px">Category</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${getListSearch }" var="objItem2">
                <c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/accessories/edit/${objItem2.id_accessories }"></c:set>
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/accessories/del/${objItem2.id_accessories }"></c:set>
                <tr>
                  <td>${objItem2.id_accessories}</td>
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
	              <td>${objItem2.preview}</td>
                  <td>${objItem2.id_product}</td>
                  <td>${objItem2.price} VND</td>
                  <td>${objItem2.cat }</td>
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="${urlEdit}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> Edit</a>
		               <a style="font-size: 9px" href="${urlDel}" class="btn btn-danger btn-xs" onclick="return confirm('Do you want to delete this item?');"><i class="fa fa-trash-o"></i> Del</a>		
		             </div>
                  </td>
                </tr>
               
                </c:forEach>
                </tbody>
              </table>
		</div>
    </section>
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