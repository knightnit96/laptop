<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="header"></tiles:insertAttribute>	
  <aside class="main-sidebar">
    <tiles:insertAttribute name="left_bar"></tiles:insertAttribute>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <tiles:insertAttribute name="content"></tiles:insertAttribute>
  </div>
  <!-- /.content-wrapper -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>  