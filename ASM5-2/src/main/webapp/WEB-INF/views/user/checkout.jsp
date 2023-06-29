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
<section class="checkout-section spad">
	<div class="container">
		<form action="order-detail" method="post" class="checkout-form">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<h4>Your Information</h4>
					<div class="row">
						<div class="col">
							<label for="fir">Address<span>*</span></label> <input type="text"
								id="fir" name="address">
						</div>
					</div>
					<div class="place-order">
						<h4>Your Order</h4>
						<div class="order-total">
							<ul class="order-table">
								<li>Product <span>Total</span></li>
								<c:forEach var="item" items="${cart.items}">
									<li class="fw-normal">${item.name }x${item.qty } <span>$${item.price
											* item.qty}</span></li>
								</c:forEach>
								<li class="total-price">Total <span>$${cart.total }</span></li>
							</ul>

							<div class="order-btn">
								<button type="submit" class="site-btn place-btn">Place
									Order</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<!-- Shopping Cart Section End -->





	<%@ include file="/common/footer.jsp"%>
</body>
</html>