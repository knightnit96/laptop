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
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li <c:if test="${tag == 'all' }">class='active'</c:if>><a href="#tab_all" data-toggle="tab">Tất cả</a></li>
              <li <c:if test="${tag == 'headphone' }">class='active'</c:if>><a href="#tab_headphone" data-toggle="tab">Headphone</a></li>
              <li <c:if test="${tag == 'mouse' }">class='active'</c:if>><a href="#tab_mouse" data-toggle="tab">Mouse</a></li>
              <li <c:if test="${tag == 'keyboard' }">class='active'</c:if>><a href="#tab_keyboard" data-toggle="tab">Keyboard</a></li>
            </ul>
            <div class="tab-content">
              <!-- /.tab-pane -->
              <div class="tab-pane <c:if test="${tag == 'all' }">active</c:if>" id="tab_all">
                 <table class="table table-bordered table-hover example2">
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
                <c:forEach items="${listItemAll }" var="objItem2">
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
              <div class="text-center">
			      <ul class="pagination">
			         <c:choose>
						<c:when test="${totalPageAll <= 3 }">
							<c:forEach var="i" begin="1" end="${totalPageAll }">
					    		<li <c:if test="${page == i }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${i}" title="">${i }</a></li> 
					    	</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${page != 1 }">
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/accessories/all?page=1" aria-label="Previous">
									<span aria-hidden="true">First</span>
								  </a>
								</li>
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${page-1}" aria-label="Previous">
									<span aria-hidden="true">«</span>
								  </a>
								</li>
								<li><a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${page-1}" title="">${page-1}</a></li> 
							</c:if>
							<li class='active'><a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${page}" title="">${page }</a></li> 
							<c:if test="${page != totalPageAll }">
								<li><a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${page+1}" title="">${page+1}</a></li> 
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${page+1}" aria-label="Next">
									<span aria-hidden="true">»</span>
								  </a>
								</li>
								<li>
								  <a href="${pageContext.request.contextPath }/admincp/accessories/all?page=${totalPageAll }" aria-label="Previous">
									<span aria-hidden="true">Last</span>
								  </a>
								</li>
							</c:if>
						</c:otherwise>
					</c:choose>
			    </ul>
			    
            </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane <c:if test="${tag == 'headphone' }">active</c:if>" id="tab_headphone">
                <table class="table table-bordered table-hover example2">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="200px">Name</th>
                  <th>Picture</th>
                  <th>Preview</th>
                  <th>ProductID</th>
                  <th width="150px">Price</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listItemHeadphone }" var="objItem2">
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
                  <td>${objItem2.price} VNĐ</td>
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
              <!-- /.tab-pane -->
              <div class="tab-pane <c:if test="${tag == 'mouse' }">active</c:if>" id="tab_mouse">
                <table class="table table-bordered table-hover example2">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="200px">Name</th>
                  <th>Picture</th>
                  <th>Preview</th>
                  <th>ProductID</th>
                  <th width="150px">Price</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listItemMouse }" var="objItem2">
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
                  <td>${objItem2.price} VNĐ</td>
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
              <!-- /.tab-pane -->
              <div class="tab-pane <c:if test="${tag == 'keyboard' }">active</c:if>" id="tab_keyboard">
                <table class="table table-bordered table-hover example2">
                <thead>
                <tr>
                  <th width="50px">ID</th>
                  <th width="200px">Name</th>
                  <th>Picture</th>
                  <th>Preview</th>
                  <th>ProductID</th>
                  <th width="150px">Price</th>
                  <th width="100px">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listItemKeyboard }" var="objItem2">
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
                  <td>${objItem2.price} VNĐ</td>
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
             </div>
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
    $('.example2').DataTable({
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