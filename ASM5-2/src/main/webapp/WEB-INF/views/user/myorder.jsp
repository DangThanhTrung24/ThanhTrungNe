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

	
	<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
	<div class="container">
		<div class="col">
			<div class="alert alert-primary" role="alert">
				<h3>Thanks a lot for your choosing my product!</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table table table-hover ">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>Order ID</th>
								<th>Create Date</th>
								<th>Address</th>
								<th>Order Details</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="item" items="${items}">
								<tr>
									<td class="p-price text-dark">${i=i+1}</td>
									<td class="p-price first-row">
										<h5>${item.id }</h5>
									</td>
									<td class="p-price text-dark first-row">${item.createDate }</td>
									<td class="cart-title first-row text-dark text-center">${item.address }</td>
									<td class="total-price first-row">
										<a href="/home/myorderdetail?id=${item.id }"
											style="font-size: 14px">Order Detail</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shopping Cart Section End -->

	
	
	
	
<%@ include file="/common/footer.jsp"%>
</body>
</html>