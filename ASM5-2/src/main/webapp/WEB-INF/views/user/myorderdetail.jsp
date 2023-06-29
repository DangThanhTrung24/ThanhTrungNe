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

	
	<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table table table-hover">
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>Product Image</th>
								<th>Product ID</th>
								<th>Product Name</th>
								<th>Product Price</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="item" items="${page.content}">
								<tr>
									<td class="p-price text-dark">${i=i+1}</td>
									<td><img src="/assets/img/${item.product.image}"
										alt="" width=50% /></td>
									<td>${item.product.id}</td>
									<td class="text-danger">${item.product.name}</td>
									<td>$${item.product.price}</td>
									<td>${item.quantity }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
	
	
	
	
<%@ include file="/common/footer.jsp"%>
</body>
</html>