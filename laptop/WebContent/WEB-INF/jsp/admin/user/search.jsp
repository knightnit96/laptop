<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-user"></i> &nbsp;&nbsp;User Management</li>
      </ol>
    </section>
    <section class="content-header">
   	  <c:if test="${not empty msg }">
   	  	<div class="callout callout-success">
         <h4>${msg }</h4>
	  	</div>
      </c:if>
   	  <c:if test="${not empty msg1 }">
   	  	<div class="callout callout-danger">
         <h4>${msg }</h4>
	  	</div>
      </c:if>
      <div class="clearfix no-border">
      <div class="form-group col-sm-8">
   	 	<a href="${pageContext.request.contextPath }/admincp/user/add"><button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Add new user</button></a>
      </div>
      <div class="form-group col-sm-4">
		  <form action="${pageContext.request.contextPath }/admincp/user/search" method="get" class="sidebar-form">
	        <div class="input-group">
	          <input type="text" name="q" class="form-control" placeholder="Search...">
	          <span class="input-group-btn">
	            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
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
                  <th width="120px">Username</th>
                  <th width="150px">Fullname</th>
                  <th>Email</th>
                  <th width="120px">Phone</th>
                  <th width="150px">Avatar</th>
                  <th width="80px">Role</th>
                  <th width="50px">Active</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${getListSearch }" var="objItem">
                <c:if test="${objItem.username == 'admin' }">
                <c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/user/edit/${objItem.id }"></c:set>
                <tr>
                  <td>${objItem.id}</td>
                  <td><a href="${objItem.linkface}">${objItem.username}</a></td>
                  <td>${objItem.fullname}</td>
                  <td>${objItem.email}</td>
                  <td>${objItem.phone}</td>
                  <td>
                     <c:choose>
						<c:when test="${not empty objItem.avatar }">
							<img src="${pageContext.request.contextPath }/files/${objItem.avatar}" alt="" width="100px" height="100px"/>
						</c:when>
						<c:otherwise>
							<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="100px" height="100px"/>
						</c:otherwise>
					</c:choose>
	              </td>
                  <td>${objItem.role}</td>
                  <td>
	                  <img alt="Active" src="${defines.URL_ADMIN}/dist/img/active.png" width="20px"/>
	              </td> 
                  <td>
                  	 <div class="tools">
		               <a style="font-size: 9px" href="${urlEdit}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> Edit</a>
		             </div>
                  </td>
                </tr>
                </c:if>
                <c:if test="${objItem.username != 'admin' }">
                <c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/user/edit/${objItem.id }"></c:set>
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/user/del/${objItem.id }"></c:set>
                <tr>
                  <td>${objItem.id}</td>
                  <td><a href="${objItem.linkface}">${objItem.username}</a></td>
                  <td>${objItem.fullname}</td>
                  <td>${objItem.email}</td>
                  <td>${objItem.phone}</td>
                  <td>
                     <c:choose>
						<c:when test="${not empty objItem.avatar }">
							<img src="${pageContext.request.contextPath }/files/${objItem.avatar}" alt="" width="100px" height="100px"/>
						</c:when>
						<c:otherwise>
							<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="100px" height="100px"/>
						</c:otherwise>
					</c:choose>
	              </td>
                  <td>${objItem.role}</td>
                  <td id="changeActive-${objItem.id }">
	                  <a href="javascript:void(0)" onclick="changeActive(${objItem.id},${objItem.active })">
                        <c:choose>
							<c:when test="${objItem.active == 1}">
								<img alt="Active" src="${defines.URL_ADMIN}/dist/img/active.png" width="20px"/>
							</c:when>
							<c:otherwise>
								<img alt="Disactive" src="${defines.URL_ADMIN}/dist/img/disactive.png" width="20px"/>
							</c:otherwise>
						</c:choose>
	                  </a>
	              </td> 
	              <script type="text/javascript">
					  function changeActive(id, active){
					    $.ajaxSetup({
					    headers: {
					      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					    }
					  });
					    $.ajax({
					      url: "${pageContext.request.contextPath }/admincp/user/change-active",
					      type: 'POST',
					      cache: false,
					      data: {
					        aactive : active,
					        aid: id
					      },
					      success: function(data){
					        $("#changeActive"+'-'+id).html(data); 
					      },
					      error: function (){
					        alert('Có lỗi');
					      }
					    }); 
					  }
					</script>   
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="${urlEdit}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> Edit</a>
		               <a style="font-size: 9px" href="${urlDel}" class="btn btn-danger btn-xs" onclick="return confirm('Do you want to delete this user?');"><i class="fa fa-trash-o"></i></i> Del</a>		
		             </div>
                  </td>
                </tr>
                </c:if>
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