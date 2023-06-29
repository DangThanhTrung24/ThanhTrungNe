<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>Sixteen Clothing Products</title>

<%@ include file="/common/head.jsp"%>

</head>

<body>

	<%@ include file="/common/header.jsp"%>


	<div class="products">
		<div class="container">

			<div class="col-md-12">
				<div class="filters">
					<ul>
						<li class="active" data-filter="*">All Products</li>
						<li data-filter=".des">Featured</li>
						<li data-filter=".dev">Flash Deals</li>
						<li data-filter=".gra">Last Minute</li>
					</ul>
				</div>
			</div>



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
					<div class="filters-content">
					<div class="mb-3">
					<div class="row">
						<div class="col-lg-7 col-md-7">
							
						</div>
						<div class="col-lg-5 col-md-5 text-right">
							<p>Show ${page.number*6 + 1 } - ${page.number*6 + page.numberOfElements } Of ${page.totalElements } Product</p>
						</div>
					</div>
				</div>
						<div class="row grid">

							<c:forEach var="item" items="${page.content}">
								<div class="col-lg-4 col-md-4 all des">
									<div class="product-item">
										<a href="product/detail/${item.id}"><img src="/assets/img/${item.image}"
											alt="" height="150px"></a>
										<div class="down-content p-3">
											<a href="#"><h4>${item.name}</h4></a>
											<p class="font-weight-bold">$${item.price}</p>

											<ul class="stars">
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i></li>
												<li><span>Reviews (36)</span></li>
											</ul>
											<hr>
											<ul class="text-center mt-3 ">
												<li class="w-icon active"><a
													href="/home/cart/add/${item.id }"><i
														class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
												<li class="quick-view "><a class=""
													href="product/detail/${item.id}">+ Quick View</a></li>
											</ul>
										</div>
									</div>
								</div>

							</c:forEach>




						</div>
					</div>
				</div>
				<div class="col-md-12">
					<ul class="pages">
						<li><a href="/home/products?p=0"><i class="fa fa-step-backward"></i></a></li>
						<li class=""><a href="/home/products?p=${page.number-1}"><i class="fa fa-angle-double-left"></i></a></li>
						
						<li class="active"><a>${page.number+1}</a></li>
						
						<li><a href="/home/products?p=${page.number+1}"><i class="fa fa-angle-double-right"></i></a></li>
						<li><a href="/home/products?p=${page.totalPages-1}"><i class="fa fa-step-forward"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/common/footer.jsp"%>


</body>

</html>
