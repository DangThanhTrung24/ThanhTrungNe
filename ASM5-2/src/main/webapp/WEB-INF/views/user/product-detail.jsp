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

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col-md-3  produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">Categories</h4>
						<ul class="filter-catagories">
							<li><a href="/home/brand?field1=1111">Men</a></li>
							<li><a href="/home/brand?field1=0000">Women</a></li>
							<li><a href="/home/brand?field1=2222">Kids</a></li>
						</ul>
					</div>
					<div class="filter-widget">
						<h4 class="fw-title">Price</h4>
						<form action="/home/price" method="post">
							<div class="filter-range-wrap">
								<div class="range-slider">
									<div class="price-input">

										<input type="text" id="minamount" name="min"> <input
											type="text" id="maxamount" name="max">
									</div>
								</div>
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="0" data-max="200">
									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
							</div>
							<button class="filter-btn" style="border: none">Filter</button>
						</form>
					</div>

					<div class="filter-widget">
						<h4 class="fw-title">Color</h4>
						<div class="fw-color-choose">
							<div class="cs-item">
								<input type="radio" id="cs-black"> <label
									class="cs-black" for="cs-black">Black</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-violet"> <label
									class="cs-violet" for="cs-violet">Violet</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-blue"> <label class="cs-blue"
									for="cs-blue">Blue</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-yellow"> <label
									class="cs-yellow" for="cs-yellow">Yellow</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-red"> <label class="cs-red"
									for="cs-red">Red</label>
							</div>
							<div class="cs-item">
								<input type="radio" id="cs-green"> <label
									class="cs-green" for="cs-green">Green</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					
					<div class="row">
						<div class="offset-lg-1 col-lg-5">
							<div >
								<img class="product-big-img img-fluid"
									src="/assets/img/${pr.image }" alt="">
							</div>
						</div>


						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<h3>${pr.name}</h3>
								</div>
								<div class="pd-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="pd-desc">
									<h4>
										Price: $${pr.price}
									</h4>
								</div>
								<div class="pd-color">
									<h6>Color</h6>
									<div class="pd-color-choose">
										<div class="cc-item">
											<input type="radio" id="cc-black"> <label
												for="cc-black"></label>
										</div>
										<div class="cc-item">
											<input type="radio" id="cc-yellow"> <label
												for="cc-yellow" class="cc-yellow"></label>
										</div>
										<div class="cc-item">
											<input type="radio" id="cc-violet"> <label
												for="cc-violet" class="cc-violet"></label>
										</div>
									</div>
								</div>
								<div class="pd-size-choose">
									<div class="sc-item">
										<input type="radio" id="sm-size"> <label for="sm-size">s</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="md-size"> <label for="md-size">m</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="lg-size"> <label for="lg-size">l</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="xl-size"> <label for="xl-size">xs</label>
									</div>
								</div>
								<div class="quantity">
									<a href="/home/cart/add/${pr.id }" class="primary-btn1 pd-cart">Add To Cart</a>
								</div>

								<div class="pd-share">
									<div class="p-code">SKU: ${pr.id}</div>
									<div class="pd-social">
										<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
											class="fa fa-instagram"></i></a> <a href="#"><i
											class="fa fa-twitter"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>





		</div>
	</div>





	<%@ include file="/common/footer.jsp"%>
</body>
</html>