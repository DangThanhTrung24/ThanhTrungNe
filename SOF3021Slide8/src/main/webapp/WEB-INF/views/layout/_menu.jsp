<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!-- 
<nav>
	<hr>
	<a href="/home/index">Trang chủ</a> :: 
	<a href="/home/about">Giới thiệu</a> ||||
	<a href="?lang=vi">Tiếng việt</a> ::
	<a href="?lang=en">English</a>
	<hr>
</nav>
 -->
 
<nav>
	<hr>
	<a href="/home/index"><s:message code="lo.mn.home"/></a> |
	<a href="/home/about"><s:message code="lo.mn.about"/></a> |
	<a href="/home/contact"><s:message code="lo.mn.contact"/></a> |
	<a href="/home/feedback"><s:message code="lo.mn.feedback"/></a> |
	<a href="/home/account"><s:message code="lo.mn.account"/></a> :: 
	<a href="?lang=vi">Tiếng việt</a> - 
	<a href="?lang=en">English</a>
	<hr>
</nav>
