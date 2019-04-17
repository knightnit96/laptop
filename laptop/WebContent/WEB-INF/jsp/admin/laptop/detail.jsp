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
      <div class="clearfix no-border">
	  <div class="form-group col-sm-8">
	   <a href="${pageContext.request.contextPath }/admincp/laptop/all"><button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i> Back to Laptop Management</button></a>
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
          <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-laptop"></i> ${objItem.name }
          <small class="pull-right">#${objItem.id_product }</small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    

    <div class="row">
      <!-- accepted payments column -->
      <!-- /.col -->
      <div class="col-xs-6">

        <div class="table-responsive">
          <table class="table">
            <tr>
              <th>Brand:</th>
              <td>
              	<c:forEach items="${listBrand }" var="objItem3">
					<c:if test="${objItem.id_brand == objItem3.id_brand }">${objItem3.name}</c:if>
				</c:forEach>
              </td>
            </tr>
            <tr>
              <th>CPU:</th>
              <td>${objItem.cpu }</td>
            </tr>
            <tr>
              <th>Ram:</th>
              <td>${objItem.ram }</td>
            </tr>
            <tr>
              <th>Display:</th>
              <td>${objItem.display }</td>
            </tr>
            <tr>
              <th>HDD:</th>
              <td>${objItem.hdd }</td>
            </tr>
            <tr>
              <th>Graphic:</th>
              <td>${objItem.graphic }</td>
            </tr>
            <tr>
              <th>Os:</th>
              <td>${objItem.os }</td>
            </tr>
            <tr>
              <th>Battery:</th>
              <td>${objItem.battery } Cell</td>
            </tr>
            <tr>
              <th>Weight:</th>
              <td>${objItem.weight } Kg</td>
            </tr>
            <tr>
              <th>Price:</th>
              <td>${objItem.price } VNĐ</td>
            </tr>
          </table>
        </div>
      </div>
      <div class="col-xs-6">
      	 <c:choose>
			<c:when test="${not empty objItem.picture }">
				<img src="${pageContext.request.contextPath }/files/${objItem.picture}" alt="" width="380px" height="380px"/>
			</c:when>
			<c:otherwise>
				<img src="${defines.URL_PUBLIC}/images/nopicture.jpg" alt="" width="380px" height="380px"/>
			</c:otherwise>
		</c:choose>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
     <div class="row no-print">
     	<c:set var="urlEdit" value="${pageContext.request.contextPath }/admincp/laptop/edit/${objItem.id_laptop }"></c:set>
        <c:set var="urlDel" value="${pageContext.request.contextPath }/admincp/laptop/del/${objItem.id_laptop }"></c:set>
        <div class="col-xs-12">
          <a type="button" href="${urlDel }" class="btn btn-danger pull-right" style="margin-right: 5px;" onclick="return confirm('Do you want to delete this item?');">
            <i class="fa fa-trash-o"></i> Del
          </a>
          <a type="button" href="${urlEdit }" class="btn btn-info pull-right"><i class="fa fa-edit"></i> Edit
          </a>
        </div>
      </div>
  </section>
		</div>
    </section>
    
    
    
    
    
    
    
    
    
    
    
