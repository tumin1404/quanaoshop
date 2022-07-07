<!DOCTYPE html>
<html lang="en" ng-app="myapp" ng-controller="mycontroller">

<head>
    <meta charset="utf-8">
    <title>Min Fashion-Giỏ hàng</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/frontend/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/frontend/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <?php
        include_once('includes/topbar.blade.php')
    ?>
    <!-- Topbar End -->

    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">DANH MỤC</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <?php
                        include_once('includes/category.blade.php')
                    ?>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="/" class="nav-item nav-link active">Trang chủ</a>
                            <a href="/frontend/shop" class="nav-item nav-link">Sản phẩm</a>
                            <a href="/frontend/contact" class="nav-item nav-link">Liên hệ</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">GIỎ HÀNG</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="/">Trang chủ</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Giỏ hàng</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Xoá</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle" ng-repeat="c in cart track by $index">
                        <tr>
                            <td class="align-middle"><img src="/upload/sanpham/@{{c.image}}" alt="" style="width: 150px;height:200px"></td>
                            <td class="align-middle"><a href="/frontend/detail/?id=@{{c.id}}">@{{c.name}}</a></td>
                            <td class="align-middle" id="inputProductPrice">@{{c.gia_km | currency :'' :0}}@{{c.don_vi_tinh}}</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" ng-click="Giam(c)">
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="@{{c.quantity}}">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus" ng-click="Tang(c)">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">@{{c.quantity * c.gia_km | currency :'' :0}}@{{c.don_vi_tinh}}</td>
                            <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times" ng-click="Xoa(c)"></i></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Thông tin đơn hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tạm tính</h6>
                            <h6 class="font-weight-medium">@{{total | currency :'' :0}} VND</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí giao hàng</h6>
                            <h6 class="font-weight-medium">FREE SHIP</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng đơn hàng</h5>
                            <h5 class="font-weight-bold"><span id="totalPrice">@{{total | currency :'' :0}} VND</span></h5>
                        </div>
                        <a href="/frontend/checkout"><button class="btn btn-block btn-primary my-3 py-3">Xác nhận giỏ hàng</button></a>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


    <!-- Footer Start -->
    <?php
        include_once('includes/footer.blade.php')
    ?>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="/frontend/lib/easing/easing.min.js"></script>
    <script src="/frontend/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="/frontend/mail/jqBootstrapValidation.min.js"></script>
    <script src="/frontend/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="/frontend/js/main.js"></script>
    <script src="/js/angular.min.js"></script>
    <script src="/js/cart.js"></script>
</body>

</html>