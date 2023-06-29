<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
<%@ include file="/common/header.jsp"%>

	
	
<!-- Contact Section Begin -->
<section class="contact-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 ">
				<div class="contact-title mt-5 text-center text-danger">
					<h4>Your Profile</h4>
				</div>
				<div class="contact-widget">
					<div class="offset-3 col-6 py-3 text-center">
						<img src="/images/${photo}" alt="" class=" img-thumbnail" />
					</div>

					<div class="cw-item">
						<div class="ci-icon">
							<i class="ti-user"></i>
						</div>
						<div class="ci-text">
							<span>Username:</span>
							<p>${username}</p>
						</div>
					</div>
					<div class="cw-item">
						<div class="ci-icon">
							<i class="ti-face-smile"></i>
						</div>
						<div class="ci-text">
							<span>Fullname:</span>
							<p>${fullname}</p>
						</div>
					</div>
					<div class="cw-item">
						<div class="ci-icon">
							<i class="ti-email"></i>
						</div>
						<div class="ci-text">
							<span>Email:</span>
							<p>${email}</p>
						</div>
					</div>
					<div class="cw-item">
						<div class="ci-text col p-0 m-0 pr-4">
							<form action="/home/myorder" method="post">
								<input type="hidden" name="username" value="${username}"
									onblur="this.form.submit()">
								<button class="btn  text-light col" style="font-size:20px; font-weight:bolder; background: rgb(255, 0, 0);">My Order</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact Section End -->
    
	
	
	
	
<%@ include file="/common/footer.jsp"%>
</body>
</html>