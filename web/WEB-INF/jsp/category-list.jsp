<%@page import="org.springframework.util.StringUtils"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:MasterLayout>
    <jsp:body>
        <!-- Main Container Starts -->
        <div id="main-container" class="container">
            <div class="row">
                <!-- Sidebar Starts -->
                <div class="col-md-3" >
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
                    <!-- To keep list in a place
                    <div class="list-group" hidden="true">
                        <div class="list-group-item">
                            <button type="button" class="btn btn-main">Filter</button>
                        </div>
                    </div>
                    -->
                </div>
                <!-- Sidebar Ends -->
                <!-- Primary Content Starts -->
                <div class="col-md-9">
                    <!-- Breadcrumb Starts -->
                    <ol class="breadcrumb">
                        <li><a href="<c:url value="/index.htm"/>">Home</a></li>
                        <li class="active">${category}</li>
                    </ol>
                    <!-- Breadcrumb Ends -->
                    <!-- Main Heading Starts -->
                    <div class="row cat-intro">
                        <div class="col-sm-3">                             
                            <img src="<c:url value="/resources/images/quote.jpg" />" alt="Image" class="img-responsive img-thumbnail" />
                        </div>
                        <div class="col-sm-9">
                            <p>
                                “Just remember: You are not a ‘dummy,’ no matter what those computer books claim.  
                                The real dummies are the people who – though technically expert – could not design hardware 
                                and software that is usable by normal consumers if their lives depended upon it.”
                            </p>
                            <p>
                                (Walter Mossberg)
                            </p>
                        </div>
                    </div>						
                    <!-- Category Intro Content Ends -->
                    <!-- Product Filter Starts -->
                    <div class="product-filter">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="display">
                                    <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=3&mode=list&category=${category}" />" class="active">
                                        <i class="fa fa-th-list" title="List View"></i>
                                    </a>
                                    <a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=6&mode=grid&category=${category}" />">
                                        <i class="fa fa-th" title="Grid View"></i>
                                    </a>
                                </div>
                            </div>
                            <!--        <div class="col-md-2 text-right">
                                        <label class="control-label">Sort</label>
                                    </div>
                                    <div class="col-md-3 text-right">
                                        <select class="form-control">
                                            <option value="default" selected="selected">Default</option>
                                            <option value="NAZ">Name (A - Z)</option>
                                            <option value="NZA">Name (Z - A)</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1 text-right">
                                        <label class="control-label">Show</label>
                                    </div>-->

                        </div>						 
                    </div>
                    <!-- Product Filter Ends -->
                    <!-- Product List Display Starts -->
                    <!-- Product #1 Ends -->
                    <c:forEach varStatus="vs" var="product" items="${pagedList.getList()}">
                        <div class="row">
                        <c:url var="actionUrl" value="/shoppingCart/cart.htm" />
                        <form:form modelAttribute="cartItem" role="form" class="form-horizontal" action="${actionUrl}" method="POST">
                            <form:input type="hidden" value="${product.id}" path="productId" id="productId" />
                            <form:input type="hidden" value="${product.name}" path="name" id="name" />
                            <form:input type="hidden" value="${product.sellPrice}" path="price" id="price" />
                            <form:input type="hidden" value="1" path="quantity" id="quantity" />
                        
                            <div class="col-xs-12">
                                <div class="product-col list clearfix">
                                    <div class="image">
                                        <img width="240px" src="<c:url value="/inventory/download.htm?fileName=${product.id}.jpeg"/>" alt="product" class="img-responsive" />
                                    </div>
                                    <div class="caption">
                                        <h4><a href="<c:url value="/product/product.htm?productId=${product.id}&category=${product.category}" />">${product.name}</a></h4>
                                        <div class="description">
                                            ${product.author} 
                                        </div>
                                        <div class="price">                                        
                                            <span class="price-new">$${product.sellPrice}</span> 
                                        </div>
                                        <div class="cart-button button-group">                                        
                                            <form:button class="btn btn-cart">
                                                Add to cart
                                                <i class="fa fa-shopping-cart"></i> 
                                            </form:button>									
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        </form:form>
                        </div>
                    </c:forEach>

                    <!-- Product List Display Ends -->
                    <!-- Pagination & Results Starts -->
                    <div class="row">
                        <!-- Pagination Starts -->
                        <div class="col-sm-6 pagination-block">
                            <ul class="pagination">
                                <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">&laquo;</a></li>
                                    <c:choose>
                                        <c:when test="${pagedList.getPageNum()-1 == 0}">                               
                                        <li><a href="<c:url value="/product/category-list.htm?pageNum=1&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">
                                                &lt;</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="<c:url value="/product/category-list.htm?pageNum=${pagedList.getPageNum()-1}&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">
                                                &lt;</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach begin="1" end="${pagedList.getTotalPages()}" step="1" var="i">
                                    <c:choose>
                                        <c:when test="${pagedList.getPageNum() == i}">
                                            <li class="active">
                                                <a href="<c:url value="/product/category-list.htm?pageNum=${i}&pageSize=${pagedList.getPageSize()}&mode=${mode}&category=${category}" />">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="<c:url value="/product/category-list.htm?pageNum=${i}&pageSize=${pagedList.getPageSize()}&mode=${mode}&category=${category}" />">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose> 
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${pagedList.getPageNum()+1 > pagedList.getTotalPages()}">                               
                                        <li><a href="<c:url value="/product/category-list.htm?pageNum=${pagedList.getTotalPages()}&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">
                                                &gt;</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="<c:url value="/product/category-list.htm?pageNum=${pagedList.getPageNum()+1}&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">
                                                &gt;</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>                                                                                   
                                <li><a href="<c:url value="/product/category-list.htm?pageNum=${pagedList.getTotalPages()}&pageSize=${pagedList.getPageSize()}&mode=list&category=${category}" />">&raquo;</a></li>
                            </ul>
                        </div>
                        <!-- Pagination Ends -->
                        <!-- Results Starts -->
                        <div class="col-sm-6 results">
                            Showing ${pagedList.getPageSize() * pagedList.getPageNum() - pagedList.getPageSize() + 1} to ${pagedList.getPageSize()*pagedList.getPageNum()} of ${pagedList.getTotal()} (${pagedList.getTotalPages()} Pages)
                        </div>
                        <!-- Results Ends -->
                    </div>
                    <!-- Pagination & Results Ends -->
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