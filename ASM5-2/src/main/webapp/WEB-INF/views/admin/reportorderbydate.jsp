<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/forAdmin/assets/images/favicon.png">
<title>Account Controller</title>
<%@ include file="/layoutForAdmin/head.jsp"%>

</head>

<body>
	<!-- Main wrapper - style you can find in pages.scss -->
	<div id="main-wrapper">
		<%@ include file="/layoutForAdmin/headeradmin.jsp"%>

	</div>
	<!-- End Wrapper -->
	<div class="row mt-3">
		<div class="col-2"></div>
		<div class="col-9 m-auto" style="height: 100%">
		
		
		
		<!-- Sales Cards  -->
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<h3 class="alert " style="background: #FF0066"> Report Order By Date</h3>
				<div class="row px-3 py-1">
					<div class="col-3 alert " style="background: #FFCCCC">
						<form action="/admin/reportorderbydate" method="post">
							<div class="form-group">
								Form Date:<input type="text" class="form-control" name="firstDate" id="firstDate" aria-describedby="firstDateHid" placeholder="MM-dd-yyyy" />
							</div>
							<div class="form-group">
								To Date: <input type="text" class="form-control" name="lastDate" id="lastDate" aria-describedby="lastDateHid" placeholder="MM-dd-yyyy" />
							</div>
							<button type="submit" class="btn  " style="background: #FF6699;">Search</button>
						</form>
					</div>
					<div class="col-3 alert  offset-6" style="background: #99FFCC">
						<h3 class="text-center">Order</h3>
						<h5>From: <fmt:formatDate pattern = "MM-dd-yyyy" value = "${firstDate }" /></h5>
						<h5>To: <fmt:formatDate pattern = "MM-dd-yyyy" value = "${lastDate }" /></h5>
						<h5>Total: ${page.totalElements }</h5>
					</div>
				</div>

				<table class="table text-center table-hover">
					<thead>
						<tr>
							<th style="font-weight: bolder; font-size: 18px">No.</th>
							<th style="font-weight: bolder; font-size: 18px">Order ID</th>
							<th style="font-weight: bolder; font-size: 18px">Address</th>
							<th style="font-weight: bolder; font-size: 18px">Create Date</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td>${i =i+1}</td>
								<td>${item.id }</td>
								<td>${item.address }</td>
								<td>${item.createDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		
		
		
		
		
		</div>
	</div>

	<%@ include file="/layoutForAdmin/footeradmin.jsp"%>
</body>

</html>