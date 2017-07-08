<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:MasterLayout>
    <jsp:body>

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
                    <!-- Breadcrumb Starts -->
                    <ol class="breadcrumb">
                        <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=${product.category}"/>" >Category</a></li>
                        <li class="active">Product</li>
                    </ol>
                    <!-- Breadcrumb Ends -->
                    <!-- Product Info Starts -->
                    <div class="row product-info">
                        <!-- Left Starts -->
                        <div class="col-sm-5 images-block">                           
                            <img  src="<c:url value="/inventory/download.htm?fileName=${product.id}.jpeg"/>" alt="image" title="image" class="img-responsive thumbnail" />
                        </div>
                        <!-- Left Ends -->
                        <!-- Right Starts -->
                        <div class="col-sm-7 product-details">
                            <!-- Product Name Starts -->
                            <h2>${product.name}</h2>
                            <!-- Product Name Ends -->
                            <hr />
                            <!-- Manufacturer Starts -->
                            <ul class="list-unstyled manufacturer">
                                <li>
                                    <span>Author :</span>${product.author}
                                </li>
                                <li><span>ISBN :</span>${product.ISBN}</li>
                                <li>
                                    <c:choose>
                                        <c:when test="${product.getQuantity() == 0}">                               
                                            <span>Availability:</span> <strong class="label label-danger">Out of Stock</strong>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Availability:</span> <strong class="label label-success">${product.quantity} In Stock</strong>
                                            <!-- Manufacturer Ends -->
                                            <hr />
                                            <!-- Price Starts -->
                                            <div class="price">
                                                <span class="price-head">Price:</span>
                                                <span class="price-new">$${product.sellPrice}</span> 
                                            </div>
                                            <!-- Price Ends -->
                                            <hr />
                                            <!-- Available Options Starts -->
                                            <div class="options">
                                                <c:url var="actionUrl" value="/shoppingCart/cart.htm" />
                                                <form:form modelAttribute="cartItem" role="form" class="form-horizontal" action="${actionUrl}" method="POST" data-parsley-validate="true">
                                                    <div class="form-group">
                                                        <div class="col-sm-9">
                                                        <label class="control-label text-uppercase" for="quantity">Qty:</label>
                                                        <form:input type="text" path="quantity" id="quantity" class="form-control" value="1" 
                                                                    data-parsley-type="digits" data-parsley-required="true" data-parsley-min="1"/>
                                                        <form:input type="hidden" value="${product.id}" path="productId" id="productId" />
                                                        <form:input type="hidden" value="${product.sellPrice}" path="price" id="price" />
                                                        <form:input type="hidden" value="${product.name}" path="name" id="name" />
                                                        </div>
                                                    </div>
                                                    <div class="cart-button button-group">
                                                        <form:button class="btn btn-cart">
                                                            Add to cart
                                                            <i class="fa fa-shopping-cart"></i> 
                                                        </form:button>									
                                                    </div>
                                                </form:form>
                                            </div>
                                            <!-- Available Options Ends -->
                                            <hr />
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </div>
                        <!-- Right Ends -->
                    </div>
                    <!-- product Info Ends -->
                    <!-- Product Description Starts -->
                    <div class="product-info-box">
                        <h4 class="heading">Description</h4>
                        <div class="content panel-smart">
                            <p>
                                ${product.description}
                            </p>                           
                        </div>
                    </div>
                    <!-- Product Description Ends -->
                </div>
                <!-- Primary Content Ends -->
            </div>
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