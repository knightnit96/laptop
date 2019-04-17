<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Comment Management
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/admincp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-comments"></i> &nbsp;&nbsp;Comment Management</li>
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
		  <form action="${pageContext.request.contextPath }/admincp/comment/search" method="get" class="sidebar-form">
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
                  <th width="200px">Name</th>
                  <th>Email</th>
                  <th>ProductID</th>
                  <th>Date</th>
                  <th width="150px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listItem }" var="objItem">
                <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/comment/del/${objItem.id_comment }"></c:set>
                <c:set var="urlGoes" value="${pageContext.request.contextPath }/admincp/comment/detail/${objItem.id_product}"></c:set>
                <fmt:formatDate value="${objItem.date }" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
                <tr>
                  <td>${objItem.id_comment}</td>
                  <td>${objItem.name}</td>
                  <td>${objItem.email}</td>
                  <td>${objItem.id_product}</td>
                  <td>${fmtDate}</td>
                  <td>
                  	 <div class="tools">
                  	   <a style="font-size: 9px" href="${urlGoes}" class="btn btn-info btn-xs"><i class="glyphicon glyphicon-edit"></i> Reply</a>
                  	   <button style="font-size: 9px" class="btn btn-success btn-xs" data-toggle="modal" data-target="#modal-detail-${objItem.id_comment}"><i class="glyphicon glyphicon-edit"></i> View Detail</button>
		               <a style="font-size: 9px" href="${urlDel}" class="btn btn-danger btn-xs" onclick="return confirm('Do you want to delete this item?');"><i class="fa fa-trash-o"></i></i> Del</a>		
		             </div>
                  </td>
                </tr>
                <!-- Modal Detail-->
				  <div class="modal fade" id="modal-detail-${objItem.id_comment}" role="dialog">
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
				          <input type="text" class="form-control" value="ProductID: ${objItem.id_product }" readonly style="margin-bottom: 10px"/>
				          <textarea style="max-width: 570px; max-height: 200px" rows="7" class="form-control" readonly>Message: ${objItem.message }</textarea>
				        </div>
				        <div class="modal-footer">
				           <a href="${urlGoes}" class="btn btn-default">Reply</a>
				           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
                </c:forEach>
                </tbody>
              </table>
              <div class="text-center">
			      <ul class="pagination">
			         <c:choose>
						<c:when test="${totalPage <= 3 }">
							<c:forEach var="i" begin="1" end="${totalPage }">
					    		<li <c:if test="${page == i }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/comment?page=${i}" title="">${i }</a></li> 
					    	</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${page != 1 }">
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/comment?page=1" aria-label="Previous">
									<span aria-hidden="true">First</span>
								  </a>
								</li>
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/comment?page=${page-1}" aria-label="Previous">
									<span aria-hidden="true">«</span>
								  </a>
								</li>
								<li><a href="${pageContext.request.contextPath }/admincp/comment?page=${page-1}" title="">${page-1}</a></li> 
							</c:if>
							<li class='active'><a href="${pageContext.request.contextPath }/admincp/comment?page=${page}" title="">${page }</a></li> 
							<c:if test="${page != totalPage }">
								<li><a href="${pageContext.request.contextPath }/admincp/comment?page=${page+1}" title="">${page+1}</a></li> 
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/comment?page=${page+1}" aria-label="Next">
									<span aria-hidden="true">»</span>
								  </a>
								</li>
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/comment?page=${totalPage}" aria-label="Previous">
									<span aria-hidden="true">Last</span>
								  </a>
								</li>
							</c:if>
						</c:otherwise>
					</c:choose>
			    </ul>
			</div>
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