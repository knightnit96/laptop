<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="header"></tiles:insertAttribute>	
<tiles:insertAttribute name="slide"></tiles:insertAttribute>	
	<section>
		<div class="container">
			<div class="row">
				<tiles:insertAttribute name="left_bar"></tiles:insertAttribute>
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
		</div>
	</section>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>  