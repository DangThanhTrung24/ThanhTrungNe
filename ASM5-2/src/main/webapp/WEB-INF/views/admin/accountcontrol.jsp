<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
			<div class="col-8 m-auto offset-3">
				<form:form name="qryform" id="qryform" action="/admin/account"
					class="px-3" modelAttribute="item">
					<div class="card">
						<div class="card-header">
							<h3 class="alert alert-info">
								Account Control <a href="/admin/account"
									class="btn btn-success float-right">Account List</a>
							</h3>
							<div class="bg-success text-light px-3">${message }</div>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-6">
									<div class="form-group">
										<form:input type="text" class="form-control" id="username"
											path="username" aria-describedby="usHid"
											placeholder="Username" />
										<small id="usHid" class="form-text text-muted">Username
											ID is invalid</small>
									</div>
									<div class="form-group">
										<form:input type="password" class="form-control" id="password"
											path="password" aria-describedby="passHid"
											placeholder="Password" />
										<small id="passHid" class="form-text text-muted">Password
											is invalid</small>
									</div>
									<div class="form-group">
										<form:input type="file" class="form-control" id="photo"
											path="photo" aria-describedby="photoHid" placeholder="photo" />
										<small id="photoHid" class="form-text text-muted">photo
											is invalid</small>
									</div>
									<div class="form-group">
										Activity:
										<form:radiobuttons class="mx-2" path="activated"
											items="${activateds }" delimiter="" />
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<form:input type="text" class="form-control" id="fullname"
											path="fullname" aria-describedby="fullnameHid"
											placeholder="fullname" />
										<small id="fullnameHid" class="form-text text-muted">Fullname
											is invalid</small>
									</div>
									<div class="form-group">
										<form:input type="email" class="form-control" id="email"
											path="email" aria-describedby="emailHid" placeholder="email" />
										<small id="emailHid" class="form-text text-muted">Email
											is invalid</small>
									</div>
									<div class="form-group">
										Role:
										<form:radiobuttons class="mx-2" path="admin"
											items="${admins }" delimiter="" />
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer text-muted">
							<button type="submit" class="btn btn-primary "
								formaction="/admin/account/create">Insert</button>
							<button type="submit" class="btn btn-warning"
								formaction="/admin/account/update">Update</button>
							<button type="submit" class="btn btn-danger"
								formaction="/admin/account/delete/${item.username}">Delete</button>
							<button type="submit" class="btn btn-success"
								formaction="/admin/accountcontrol">Reset</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		
		
		
		
		
		
		
		</div>
	</div>

	<%@ include file="/layoutForAdmin/footeradmin.jsp"%>
</body>

</html>