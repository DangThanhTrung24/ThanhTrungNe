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
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th>Image</th>
									<th class="p-name">Product Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cart.items}">
									<form action="/home/cart/update" method="post">
										<input type="hidden" name="id" value="${item.id}">
										<tr>
											<td class="cart-pic first-row"><img
												src="/assets/img/${item.image }" alt="" width=50%></td>
											<td class="cart-title first-row">
												<h5>${item.name }</h5>
											</td>
											<td class="p-price first-row">${item.price }</td>
											<td>
												<div class="pt-4">
													<a class='btn btn-danger text-light btn-xs'
														style="width: 38px;" href="/home/cart/sub/${item.id}">
														- </a> <input name="qty" value="${item.qty}" min="0"
														onblur="this.form.submit()"
														class="text-center text-danger"
														style="width: 50px; height: 30px; font-size: 18px; font-weight: bolder; border: none">
													<a class='btn btn-danger btn-xs text-light'
														style="width: 38px;" href="/home/cart/add/${item.id}">+</a>
												</div>
											</td>
											<td class="total-price first-row">${item.price * item.qty}</td>
											<td class="close-td first-row"><a
												class='btn btn-xs text-danger' style="font-weight: bolder"
												href="/home/cart/remove/${item.id}"><span
													class="glyphicon glyphicon-trash"></span> <i class="fa fa-trash"></i></a></td>
										</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">
								<a href="/home/products" class="primary-btn continue-shop">Continue
									shopping</a> <a href="/home/cart/clear" class="primary-btn up-cart">Clear
									cart</a>
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="cart-total">Total <span>${cart.total }</span></li>
								</ul>
								<c:if test="${!isLogin}">
									<a href="/home/login" class="proceed-btn">PROCEED TO CHECK
										OUT</a>
								</c:if>
								<c:if test="${isLogin}">
									<a href="/home/checkout" class="proceed-btn">PROCEED TO
										CHECK OUT</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->





	<%@ include file="/common/footer.jsp"%>
</body>
</html>