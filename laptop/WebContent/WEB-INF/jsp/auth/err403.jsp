<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="content">
      <div class="error-page">
        <h2 class="headline text-yellow"> 403</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> Sorry! Access denied :(</h3>

          <p>
            You don't have permission to open this page! 
            Meanwhile, you may <a href="<c:if test="${objUserLogin.role == 'MOD'}">${pageContext.request.contextPath }/admincp</c:if><c:if test="${objUserLogin.role == 'USER'}">${pageContext.request.contextPath }</c:if>">return to home</a>.
            
          </p>
        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>