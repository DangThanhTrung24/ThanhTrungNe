<!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
   
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
     

     
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item ">
        <a class="nav-link font-weight-bold text-danger" href="/home/index">
          <i class="far fa-bell"></i>
          SixteenClothing
        </a>
        
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
     
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/admin/index" class="brand-link">
      <img src="<c:url value='/template/admin/dist/img/AdminLTELogo.png'/>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light font-weight-bold">Admin Shop</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/images/${photo}" class="img-circle elevation-2" alt="">
        </div>
        <div class="info">
          <a href="#" class="d-block">${fullname}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          
          
           <li class="nav-item menu-open">
            <a href="admin/video?action=view" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Controller
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/account" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Account Controller</p>
                </a>
              </li>
             
              <li class="nav-item">
                <a href="/admin/category" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category Controller</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="/admin/order" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Order Controller</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="/admin/products" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Product Controller</p>
                </a>
              </li>
              
            </ul>
          </li>
          
          
          <li class="nav-item menu-open">
            <a href="admin/video?action=view" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Statictis
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/bestsaler" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Best Saler</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/admin/reportorderbydate" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Report Order By Date</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="/admin/topcustomer" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Customer</p>
                </a>
              </li>
              
            </ul>
          </li>
          
          
          
        
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

 