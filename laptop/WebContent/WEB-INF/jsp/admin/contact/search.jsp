<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Contact Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-envelope"></i> &nbsp;&nbsp;Contact Management</li>
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
      <div class="form-group col-sm-4">
		  <form action="${pageContext.request.contextPath }/admincp/contact/search" method="get" class="sidebar-form">
	        <div class="input-group">
	          <input type="text" name="q" class="form-control" placeholder="Search...">
	          <span class="input-group-btn">
	            <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	            </button>
	          </span>
	        </div>
	      </form>	
      </div>
      <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="200px">Contact Title</th>
                  <th>Contact Name</th>
                  <th>Contact Email</th>
                  <th>Date</th>
                  <th width="200px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${getListSearch }" var="objItem">
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/contact/del/${objItem.id }"></c:set>
                <fmt:formatDate value="${objItem.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
                <tr>
                  <td>${objItem.id}</td>
                  <td>${objItem.subject}</td>
                  <td>${objItem.name}</td>
                  <td>${objItem.email}</td>
                  <td>${fmtDate}</td>
                  <td>
                  	 <div class="tools">
                  	   <c:if test="${objItem.reply == 0}">
                  	   	<button style="font-size: 9px" class="btn btn-info btn-xs" data-toggle="modal" data-target="#modal-reply-${objItem.id}"><i class="glyphicon glyphicon-pencil"></i> Reply</button>
                  	   </c:if> 
                  	   <c:if test="${objItem.reply == 1}">
                  	   	<button style="font-size: 9px" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modal-reply-${objItem.id}"><i class="glyphicon glyphicon-pencil"></i> Replied</button>
                  	   </c:if>
                  	   <button style="font-size: 9px" class="btn btn-success btn-xs" data-toggle="modal" data-target="#modal-detail-${objItem.id}"><i class="glyphicon glyphicon-edit"></i> View Detail</button>
		               <a style="font-size: 9px" href="${urlDel}" class="btn btn-danger btn-xs" onclick="return confirm('Do you want to delete this item?');"><i class="fa fa-trash-o"></i></i> Del</a>		
		             </div>
                  </td>
                </tr>
                <!-- Modal Detail-->
				  <div class="modal fade" id="modal-detail-${objItem.id}" role="dialog">
				    <div class="modal-dialog">
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title" style="display: inline-block; float: left;">${objItem.name}</h4>
				          <p style="display: inline-block; float: right;">Date: ${fmtDate} &nbsp;&nbsp;</p>
				        </div>
				        <div class="modal-body">
				          <input type="text" class="form-control" value="Email: ${objItem.email }" readonly style="margin-bottom: 10px"/>
				          <input type="text" class="form-control" value="Subject: ${objItem.subject }" readonly style="margin-bottom: 10px"/>
				          <textarea style="max-width: 570px; max-height: 200px" rows="7" class="form-control" readonly>Message: ${objItem.message }</textarea>
				        </div>
				        <div class="modal-footer">
				           <button type="button" class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#modal-reply-${objItem.id}">Reply</button>
				           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
				  <!-- Modal Reply-->
				  <div class="modal fade" id="modal-reply-${objItem.id}" role="dialog">
				    <div class="modal-dialog">
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title" style="text-align: center;">Reply</h4>
				        </div>
				         <form action="${pageContext.request.contextPath }/admincp/contact/send" method="post">
				        <div class="modal-body">
				          Name: <input type="text" class="form-control" name="name" id="name" value="${objItem.name }" readonly/>
				          Email: <input type="text" class="form-control" name="email" id="email" value="${objItem.email }" readonly/>
				          Subject: <input type="text" class="form-control" name="subject" id="subject" value="(${objUserLogin.role }) Re: ${objItem.subject }" placeholder="Reply Subject"/>
				          Message: <textarea style="max-width: 570px; max-height: 200px" rows="7" name="message" id="message" class="form-control" placeholder="Reply Message"></textarea>
				        </div>
				        <div class="modal-footer">
				           <button type="submit" class="btn btn-default">Send Reply</button>
				           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      </div>
				    </div>
				  </div>
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