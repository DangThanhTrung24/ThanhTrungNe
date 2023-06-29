





 <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
<div class="header-top">
		<div class="container">
			<div class="ht-left">
				<div class="mail-service">
					<i class=" fa fa-envelope"></i>dangthanhtrung57@gmail.com
				</div>
				<div class="phone-service">
					<i class=" fa fa-phone"></i> +84 889.641.810
				</div>
			</div>
			<div class="ht-right">
				<!-- <a href="/home/login" class="login-panel"><i class="fa fa-user"></i>Login</a> -->

				<c:if test="${!isLogin}">
					<a href="/home/login" class="login-panel"><i class="fa fa-user"></i>Login</a>
					<div class="top-social">
						<a href="/home/register"><i class="fa fa-plus pr-1"></i>Register</a>
					</div>
				</c:if>
				<c:if test="${isLogin}">
					<c:if test="${admin}">
						<a href="/admin/index" class="login-panel"><i
							class="fa fa-user"></i>Administration</a>
					</c:if>
					<div class="top-social">
						<a href="myprofile" class="text-primary"
							style="font-weight: bolder;">${fullname}</a> <a
							class="text-danger" id="btnLogOff" href="/logout" title="">[Logout]</a>
					</div>
				</c:if>

			</div>
		</div>
	</div>
    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="/home/index"><h2>Sixteen <em>Clothing</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
          
          
          
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="/home/index">Home
                   <span class="sr-only">(current)</span> 
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="/home/products">Our Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/home/about">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/home/contact">Contact Us</a>
              </li>
              <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Account
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <c:if test="${!isLogin}">
          <a class="dropdown-item" href="/home/login">Login</a>
          <a class="dropdown-item" href="/home/register">Register</a>
          </c:if>
          <c:if test="${isLogin}">
           <a class="dropdown-item" href="/home/change-password">Change Password</a>
          <a class="dropdown-item" href="/home/myprofile">My Profile</a>
          </c:if>
        </div>
      </li>
        <li class="nav-item">
        		<a class="nav-link" href="/home/cart"><i class="fa fa-cart-arrow-down"></i> My Cart </a>
              </li>
            </ul>
           
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <!-- Page Content -->
    <div class="page-heading products-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="text-content">
              <h4>new arrivals</h4>
              <h2>sixteen clothing</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->