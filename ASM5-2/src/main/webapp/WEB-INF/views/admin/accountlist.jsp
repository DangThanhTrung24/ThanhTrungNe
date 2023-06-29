<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		
		
		
		<!-- Container fluid  -->
	<div class="container-fluid">
		<!-- Sales Cards  -->
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<h3 class="alert alert-info">Account List
					<a href="accountcontrol" class="btn btn-success float-right">Add New Account</a>
				</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th class ="p-0 m-0"   width="10%" style="font-weight: bolder; font-size: 18px">Photo</th>
							<th style="font-weight: bolder; font-size: 18px">Username</th>
							<th style="font-weight: bolder; font-size: 18px">Password</th>
							<th style="font-weight: bolder; font-size: 18px">Fullname</th>
							<th style="font-weight: bolder; font-size: 18px">Email</th>
							<th style="font-weight: bolder; font-size: 18px">Activated</th>
							<th style="font-weight: bolder; font-size: 18px">Admin</th>
							<th style="font-weight: bolder; font-size: 18px">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${page.content}">
							<tr>
								<td class ="px-0 m-0"  width="10%">
									<img src="/images/${item.photo}" alt="" width="50%" class="img-fluid">
								</td>
								<td>${item.username}</td>
								<td>${item.password}</td>
								<td>${item.fullname}</td>
								<td>${item.email}</td>
								
								<td>${item.activated}</td>
								<td>${item.admin}</td>
								<td> 
									<a class='btn btn-warning btn-xs' style="font-size: 14px" href="account/edit/${item.username}"> 
									<span class="glyphicon glyphicon-edit"></span> Edit	</a> 
									<a href="account/delete/${item.username}" style="font-size: 14px" class="btn btn-danger btn-xs"> 
									<span class="glyphicon glyphicon-remove"></span> Delete
								</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr />
				<div class="text-center">
					<a href="/admin/account?p=0" class="btn btn-primary">First</a> 
					<a	href="/admin/account?p=${page.number-1}" class="btn btn-primary">Previous</a>
					<a href="/admin/account?p=${page.number+1}" class="btn btn-primary">Next</a>
					<a href="/admin/account?p=${page.totalPages-1}"	class="btn btn-primary">Last</a>
				</div>
				<hr />
			</div>
		</div>
	</div>
	<!-- End Container fluid  -->
		
		
		
		
		
		
		
		</div>
	</div>

	<%@ include file="/layoutForAdmin/footeradmin.jsp"%>
</body>

</html>