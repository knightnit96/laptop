<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath }/files/${objUserLogin.avatar}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${objUserLogin.fullname}</p>
          <p>UserID: ${objUserLogin.id}</p>
        </div>
      </div>
      <!-- search form -->
      <form method="get" class="sidebar-form">
        <div class="input-group">
           <a class="btn btn-block btn-social btn-bitbucket" href="${pageContext.request.contextPath }">
             <i class="fa fa-reply"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Visit FrontEnd &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </a>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <c:if test="${objUserLogin.role == 'ADMIN' || objUserLogin.role == 'MOD'}">
      <ul class="sidebar-menu">
        <li <c:if test="${title == 'AdminCP' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp">
            <i class="fa fa-dashboard text-aqua"></i> <span>Dashboard</span></i>
          </a>
        </li>
        <li <c:if test="${title == 'AdminCP | User' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/user"><i class="fa fa-user text-aqua"></i> <span>User</span></a></li>
        <li <c:if test="${title == 'AdminCP | Order' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp/order">
            <i class="fa fa-file-text-o text-aqua"></i> <span>Order</span><c:if test="${objUserLogin.new_order != 0}"><span class="label label-primary pull-right">${objUserLogin.new_order }</span></c:if>
          </a>
        </li>
        <li <c:if test="${title == 'AdminCP | Brands' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp/brands">
            <i class="fa fa-th text-aqua"></i> <span>Brands</span>
          </a>
        </li>
        <li class="treeview <c:if test="${title == 'AdminCP | Accessories' }">active</c:if>">
          <a href="">
            <i class="fa fa-windows text-aqua"></i>
            <span>Accessories</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
          	<li <c:if test="${tag == 'all' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/accessories/all"><i class="fa fa-circle-o text-red"></i>All</a></li>
            <li <c:if test="${tag == 'headphone' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/accessories/headphone"><i class="fa fa-circle-o text-red"></i> Headphone</a></li>
            <li <c:if test="${tag == 'mouse' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/accessories/mouse"><i class="fa fa-circle-o text-red"></i> Mouse</a></li>
            <li <c:if test="${tag == 'keyboard' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/accessories/keyboard"><i class="fa fa-circle-o text-red"></i> Keyboard</a></li>
          </ul>
        </li>
        <li class="treeview <c:if test="${title == 'AdminCP | Laptop' }">active</c:if>">
          <a href="">
            <i class="fa fa-laptop text-aqua"></i>
            <span>Laptop</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
          	<li <c:if test="${tag == 'all' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/laptop/all"><i class="fa fa-circle-o text-red"></i>All</a></li>
            <c:forEach items="${listBrand }" var="objItem">
            <li <c:if test="${tag == objItem.name }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/laptop/${objItem.name}"><i class="fa fa-circle-o text-red"></i> ${objItem.name }</a></li>
            </c:forEach>
          </ul>
        </li>
        <li <c:if test="${title == 'AdminCP | Payment' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp/payment">
            <i class="fa fa-credit-card text-aqua"></i> <span>Payments</span>
          </a>
        </li>
        <li class="treeview <c:if test="${title == 'AdminCP | Slide' || title == 'AdminCP | Video' }">active</c:if>">
          <a href="">
            <i class="fa fa-desktop text-aqua"></i>
            <span>Slide - Video</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li <c:if test="${title == 'AdminCP | Slide' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/slide"><i class="fa fa-circle-o text-red"></i> Slide</a></li>
            <li <c:if test="${title == 'AdminCP | Video' }">class='active'</c:if>><a href="${pageContext.request.contextPath }/admincp/video"><i class="fa fa-circle-o text-red"></i> Video</a></li>
          </ul>
        </li>
        <li class="header">Reply</li>
        <li <c:if test="${title == 'AdminCP | Comments' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp/comment">
            <i class="fa fa-comments text-aqua"></i> <span>Comments</span>
             <c:if test="${objUserLogin.new_comment != 0}"><small class="label pull-right bg-red">${objUserLogin.new_comment}</small></c:if>
          </a>
        </li>
       	<li <c:if test="${title == 'AdminCP | Contact' }">class='active'</c:if>>
          <a href="${pageContext.request.contextPath }/admincp/contact">
            <i class="fa fa-envelope text-aqua"></i> <span>Contact</span>
            <c:if test="${objUserLogin.new_contact != 0}"><small class="label pull-right bg-yellow">${objUserLogin.new_contact}</small></c:if>
          </a>
        </li>
      </ul>
      </c:if>
    </section>
    <!-- /.sidebar -->