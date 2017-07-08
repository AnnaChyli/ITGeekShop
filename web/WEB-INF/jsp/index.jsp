<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:MasterLayout>
    <jsp:body>
        <sec:authorize access="hasRole('Seller')">
            <c:redirect url="/inventory/inventory.htm" />
        </sec:authorize>
        <!-- Main Container Starts -->
        <div id="main-container-home" class="container">
            <div class="row">
                <!-- Sidebar Starts -->
                <div class="col-md-3">
                    <!-- Categories Links Starts -->
                    <h3 class="side-heading">Categories</h3>
                    <div class="list-group categories">
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=CSharp"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            C#
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Cpp"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            C++
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=C"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            C
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Java"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            Java
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Rubi"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            Rubi
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=Python"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            Python
                        </a>
                        <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=JavaScript"/>" class="list-group-item">
                            <i class="fa fa-chevron-right"></i>
                            JavaScript
                        </a>
                    </div>
                    <!-- Categories Links Ends -->

                    <!-- Banner #1 Starts -->
                    <img src="<c:url value="/resources/images/banners/side-banner1.jpg" />" alt="Side Banner" class="img-responsive" height="75" width="263"  />
                    <br>
                    <!-- Banner #1 Ends -->
                </div>
                <!-- Sidebar Ends -->		
                <!-- Primary Content Starts -->
                <div class="col-md-9">
                    <!-- Slider Section Starts -->
                    <div class="slider">
                        <div id="main-carousel" class="carousel slide" data-ride="carousel">
                            <!-- Wrapper For Slides Starts -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="<c:url value="/resources/images/slider-imgs/slide1-img.jpg" />" alt="Slider" class="img-responsive" />
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/images/slider-imgs/slide2-img.png" />" alt="Slider" class="img-responsive" />
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/images/slider-imgs/slide3-img.jpg" />" alt="Slider" class="img-responsive" />
                                </div>
                                
                            </div>
                            <!-- Wrapper For Slides Ends -->
                            <!-- Controls Starts -->
                            <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                            <!-- Controls Ends -->
                        </div>	
                    </div>
                    <!-- Slider Section Ends -->
                </div>
                <!-- Primary Content Ends -->
            </div>
        </div>
        <!-- Main Container Ends -->	
        <!-- JavaScript Files -->
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/jquery-migrate-1.2.1.min.js"/>" ></script>	
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/bootstrap-hover-dropdown.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/owl.carousel.min.js"/>" ></script>
        <script src="<c:url value="/resources/js/custom.js"/>" ></script>
    </jsp:body>
</t:MasterLayout>