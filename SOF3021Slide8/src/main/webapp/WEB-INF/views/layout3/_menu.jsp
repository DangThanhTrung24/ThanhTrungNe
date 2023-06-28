<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<nav class="row">
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">
	      	<img src="/assets/images/fpt-logo.png" style="width:30px"/>
	      </a>
	    </div>
	    <ul class="nav navbar-nav">
	      <!-- 
	      <li><a href="/home/index">Trang chủ</a></li>
	      <li><a href="/home/about">Giới thiệu</a></li>
	      <li><a href="/home/contact">Liên hệ</a></li>
	      <li><a href="/home/feedback">Góp ý</a></li>
	      <li><a href="/home/faq">Hỏi đáp</a></li>
	       -->
	      <li><a href="/home/index"><s:message code="lo.mn.home"/></a></li>
	      <li><a href="/home/about"><s:message code="lo.mn.about"/></a></li>
	      <li><a href="/home/contact"><s:message code="lo.mn.contact"/></a></li>
	      <li><a href="/home/feedback"><s:message code="lo.mn.feedback"/></a></li>
	      <li><a href="/home/faq"><s:message code="lo.mn.account"/></a></li>
	      
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="?lang=vi">Tiếng Việt</a></li>
	      <li><a href="?lang=en">English</a></li>
	    </ul>
	  </div>
	</nav>
</nav>

