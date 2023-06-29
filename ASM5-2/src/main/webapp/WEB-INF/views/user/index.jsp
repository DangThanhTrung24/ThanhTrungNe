<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Sixteen Clothing</title>

   <%@ include file="/common/head.jsp" %>  

  </head>

  <body>

    <%@ include file="/common/header.jsp" %>  


<!-- Category -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="/assets/images/banner-1.jpg" alt="" width="10px">
                        <div class="inner-text">
                            <h4>Men</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="/assets/images/banner-2.jpg" alt="" width="10px">
                        <div class="inner-text">
                            <h4>Women</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="/assets/images/banner-3.jpg" alt="" width="10px">
                        <div class="inner-text">
                            <h4>Kid</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Category -->


    <div class="latest-products">
      <div class="container">
      
      
      
      
      
      
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Top 10 Products</h2>
              <a href="products">view all products <i class="fa fa-angle-right"></i></a>
            </div>
          </div>
          
          
          <div class="product-slider owl-carousel">
                    <c:forEach var="item" items="${topList.content}">
                       	<div class="product-item">
										<a href="#"><img src="/assets/img/${item.product.image}"
											alt="" height="250px"></a>
										<div class="down-content p-3">
											<a href="product/detail/${item.product.id}"><h4>${item.product.name}</h4></a>
											<p class="font-weight-bold">$${item.product.price}</p>

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
													href="/home/cart/add/${item.product.id }"><i
														class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
												<li class="quick-view "><a class=""
													href="product/detail/${item.product.id}">+ Quick View</a></li>
											</ul>
										</div>
									</div>
                    </c:forEach>
                    </div>
          
          
        </div>
      </div>
    </div>

    <div class="best-features">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>About Sixteen Clothing</h2>
            </div>
          </div>
          <div class="col-md-6">
            <div class="left-content">
              <h4>Looking for the best products?</h4>
              <p><a rel="nofollow" href="https://templatemo.com/tm-546-sixteen-clothing" target="_parent"></a> The online shopping routine is different for everyone. Lots of people shop online everyday. Some others shop online once a week and some people only do it once a month. People can directly contact shops to order or they can purchase things through e-commerce websites. <a rel="nofollow" href="/home/contact">Contact us</a> for more info.</p>
              <ul class="featured-list">
                <li><a href="#">Let me show you some of what we have.</a></li>
                <li><a href="#">Would you like to try it on?</a></li>
                <li><a href="#">I think this one will suit you.</a></li>
                <li><a href="#">This is our newest design.</a></li>
                <li><a href="#">Deal.</a></li>
              </ul>
              <a href="about.html" class="filled-button">Read More</a>
            </div>
          </div>
          <div class="col-md-6">
            <div class="right-image">
              <img src="/assets/images/feature-image.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
              <div class="row">
                <div class="col-md-8">
                  <h4>Creative &amp; Unique <em>Sixteen</em> Products</h4>
                  <p>What are you looking for?</p>
                </div>
                <div class="col-md-4">
                  <a href="#" class="filled-button">Purchase Now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


		<div class="benefit-items">
                <div class="col-9 m-auto">
                <div class="row">
                
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/assets/images/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Free Shipping</h6>
                                <p>For all order over 99$</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/assets/images/icon-2.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Delivery On Time</h6>
                                <p>If good have prolems</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/assets/images/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>Secure Payment</h6>
                                <p>100% secure payment</p>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
    
   <%@ include file="/common/footer.jsp" %>  


  </body>

</html>
