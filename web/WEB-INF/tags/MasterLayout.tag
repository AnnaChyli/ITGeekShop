<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@tag description="Common layout" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce Application</title>

        <!-- Bootstrap Core CSS -->
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

        <!-- Google Web Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,300,700" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400" rel="stylesheet" type="text/css">

        <!-- CSS Files -->
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">

        <!--[if lt IE 9]>
                <script src="/resources/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/resources/images/fav-144.png" />">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/resources/images/fav-114.png" />">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/resources/images/fav-72.png" />">
        <link rel="apple-touch-icon-precomposed" href="<c:url value="/resources/images/fav-57.png" />">
        <link rel="shortcut icon" href="<c:url value="/resources/images/fav.png" />">
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/parsley.min.js"/>" ></script>
    </head>
    <body>
        <!-- Header Section Starts -->
        <header id="header-area">
            <!-- Header Top Starts -->
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <!-- Header Links Starts -->
                        <div class="col-sm-8 col-xs-12">
                            <div class="header-links">
                                <ul class="nav navbar-nav pull-left">
                                    <li>
                                        <a href="<c:url value="/index.htm"/>" >
                                            <i class="fa fa-home hidden-lg hidden-md" title="Home"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Home
                                            </span>
                                        </a>
                                    </li>                                                                                              
                                    <li>
                                        <a href="<c:url value="/user/register.htm" />">
                                            <i class="fa fa-unlock hidden-lg hidden-md" title="Register"></i>
                                            <span class="hidden-sm hidden-xs">
                                                Register
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <sec:authorize access="isAuthenticated() == false">
                                            <a href="<c:url value="/user/login.htm" />" >
                                                <i class="fa fa-lock hidden-lg hidden-md" title="Login"></i>
                                                <span class="hidden-sm hidden-xs">
                                                    Login
                                                </span>
                                            </a>
                                        </sec:authorize>
                                        <sec:authorize access="isAuthenticated()">
                                            <a href="<c:url value="/user/logout.htm" />" >
                                                <i class="fa fa-lock hidden-lg hidden-md" title="Logout"></i>
                                                <span class="hidden-sm hidden-xs">
                                                    Logout
                                                </span>
                                            </a>
                                        </sec:authorize>    
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Header Links Ends -->
                    </div>
                </div>
            </div>
            <!-- Header Top Ends -->
            <!-- Main Header Starts -->
            <div class="main-header">
                <div class="container">
                    <div class="row">
                        <!-- Search Starts -->
                        <div class="col-md-3">
                            <div id="search" hidden="">
                                <div class="input-group">
                                    <input type="text" class="form-control input-lg" placeholder="Search" >
                                    <span class="input-group-btn">
                                        <button class="btn btn-lg" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>	  
                        </div>                        
                        <!-- Search Ends -->
                        <!-- Logo Starts -->
                        <div class="col-md-6">
                            <div id="logo">
                                <a href="<c:url value="/index.htm"/>" ><img src="<c:url value="/resources/images/logo.jpg" />" title="ITGeekShop" alt="ITGeekShop" class="img-responsive" /></a>
                            </div>
                        </div>
                        <!-- Logo Starts -->				
                        <!-- Shopping Cart Starts -->
                        <div class="col-md-3">
                            <div id="cart" class="btn-group btn-block">
                                <button type="button" data-toggle="tag" class="btn btn-block btn-lg ">
                                    <a href="<c:url value="/shoppingCart/cart.htm"/>" style="text-decoration: none"
                                       <i class="fa fa-shopping-cart">
                                            <span class="hidden-md"></span>                                            
                                            <span id="cart-total">${shoppingCart.count()} item(s) -
                                                <fmt:formatNumber value="${shoppingCart.total()}" type="currency"/></span>
                                        </i>
                                    </a>
                                </button>                           
                            </div>
                        </div>

                        <!-- Shopping Cart Ends -->
                    </div>
                </div>
            </div>
            <!-- Main Header Ends -->
            <!-- Main Menu Starts -->
            <nav id="main-menu" class="navbar" role="navigation">
                <div class="container">
                    <!-- Nav Header Starts -->
                    <div class="navbar-header">
                        <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-cat-collapse">
                            <span class="sr-only">Toggle Navigation</span>
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>
                    <!-- Nav Header Ends -->
                    <!-- Navbar Cat collapse Starts -->
                    <div class="collapse navbar-collapse navbar-cat-collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=CSharp"/>">C# </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Cpp"/>">C++ </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=C"/>">C </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Java"/>">Java </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Rubi"/>">Rubi </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Python"/>">Python </a></li>
                            <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=JavaScript"/>">JavaScript </a></li>                            
                        </ul>
                    </div>
                    <!-- Navbar Cat collapse Ends -->
                </div>
            </nav>
            <!-- Main Menu Ends -->
        </header>
        <!-- Header Section Ends -->
        <div id="body" >
            <jsp:doBody/>
        </div>
        <!-- Footer Section Starts -->
        <footer id="footer-area">
            <!-- Footer Links Starts -->
            <div class="footer-links">
                <!-- Container Starts -->
                <div class="container">
                    <!-- Information Links Starts -->
                    <div class="col-md-2 col-sm-6">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="#">Delivery Information</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms &amp; Conditions</a></li>
                        </ul>
                    </div>
                    <!-- Information Links Ends -->
                    <!-- My Account Links Starts -->
                    <div class="col-md-2 col-sm-6">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="#">My orders</a></li>
                            <li><a href="#">My merchandise returns</a></li>
                            <li><a href="#">My credit slips</a></li>
                            <li><a href="#">My addresses</a></li>
                            <li><a href="#">My personal info</a></li>
                        </ul>
                    </div>
                    <!-- My Account Links Ends -->					
                    <!-- Customer Service Links Starts -->
                    <div class="col-md-2 col-sm-6">
                        <h5>Service</h5>
                        <ul>
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="#">Returns</a></li>
                            <li><a href="#">Site Map</a></li>
                            <li><a href="#">Affiliates</a></li>
                            <li><a href="#">Specials</a></li>
                        </ul>
                    </div>
                    <!-- Customer Service Links Ends -->
                    <!-- Follow Us Links Starts -->
                    <div class="col-md-2 col-sm-6">
                        <h5>Follow Us</h5>
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">RSS</a></li>
                            <li><a href="#">YouTube</a></li>
                        </ul>
                    </div>
                    <!-- Follow Us Links Ends -->
                    <!-- Contact Us Starts -->
                    <div class="col-md-4 col-sm-12 last">
                        <h5>Contact Us</h5>
                        <ul>
                            <li>IT Geek Shop</li>
                            <li>
                                777 Glades Road, Boca Raton, FL 33431
                            </li>
                            <li>
                                Emails: <a href="#">mguerri8@fau.edu | gchylikina2013@fau.edu</a>
                            </li>
                            <li>
                                Tel: 1(561) 297-3000
                            </li>
                        </ul>
                    </div>
                    <!-- Contact Us Ends -->
                </div>
                <!-- Container Ends -->
            </div>
            <!-- Footer Links Ends -->
            <!-- Copyright Area Starts -->
            <div class="copyright">
                <!-- Container Starts -->
                <div class="container">
                    <!-- Starts -->
                    <p class="pull-left">
                        &copy; 2015 IT Geek Shop. Designed By <a href="http://forbes.com">gchyli &AMP; myg-fly</a>
                    </p>
                    <!-- Ends -->
                    <!-- Payment Gateway Links Starts -->
                    <ul class="pull-right list-inline">
                        <li>
                            <img src="<c:url value="/resources/images/payment-icon/cirrus.png"/>" alt="PaymentGateway" />
                        </li>
                        <li>
                            <img src="<c:url value="/resources/images/payment-icon/paypal.png"/>" alt="PaymentGateway" />
                        </li>
                        <li>
                            <img src="<c:url value="/resources/images/payment-icon/visa.png" />" alt="PaymentGateway" />
                        </li>
                        <li>
                            <img src="<c:url value="/resources/images/payment-icon/mastercard.png"/>" alt="PaymentGateway" />
                        </li>
                        <li>
                            <img src="<c:url value="/resources/images/payment-icon/americanexpress.png"/>" alt="PaymentGateway" />
                        </li>
                    </ul>
                    <!-- Payment Gateway Links Ends -->
                </div>
                <!-- Container Ends -->
            </div>
            <!-- Copyright Area Ends -->
        </footer>
    </body>
</html>
