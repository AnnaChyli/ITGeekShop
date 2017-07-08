<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:MasterLayout>
    <jsp:body>
        <c:url var="actionUrl" value="/shoppingCart/updateItem.htm" />
        <c:url var="ajaxUrl" value="/shoppingCart/updateItem.htm" />
        <script type="text/javascript">

            function updateQuantity(obj) {
                var productId = obj.name;
                var inputId = 'q' + productId;
                var value = document.getElementById(inputId).value;

                $.ajax({
                    url: "${ajaxUrl}",
                    type: "POST",
                    data: JSON.stringify({
                        "productId": productId,
                        "quantity": parseInt(value)
                    }),
                    dataType: "json",
                    contentType: "application/json",
                    success: function ()
                    {
                        console.log("Success");
                        window.location.reload();
                    }});
            }
        </script>   

        <div id="main-container" class="container">
            <!-- Breadcrumb Starts -->
            <ol class="breadcrumb">
                <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
            <!-- Breadcrumb Ends -->
            <!-- Main Heading Starts -->
            <h2 class="main-heading text-center">
                Shopping Cart
            </h2>
            <!-- Main Heading Ends -->
            <!-- Shopping Cart Table Starts -->
            <div class="table-responsive shopping-cart-table">         
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td class="text-center">
                                Image
                            </td>
                            <td class="text-center">
                                Product Details
                            </td>							
                            <td class="text-center">
                                Quantity
                            </td>
                            <td class="text-center">
                                Price
                            </td>
                            <td class="text-center">
                                Total
                            </td>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach varStatus="vs" var="item" items="${shoppingCart.getItems()}">
                            <tr>
                                <td class="text-center">
                                    <a href="<c:url value="/product/product.htm?productId=${item.productId}&category=${product.category}" />" >
                                        <img src="<c:url value="/resources/images/product-images/cart-thumb-img1.jpg"/>" alt="Product Name" title="Product Name" class="img-thumbnail" />
                                    </a>
                                </td>
                                <td >
                                    <a href="<c:url value="/product/product.htm?productId=${item.productId}&category=${product.category}" />" >${item.getName()}</a>
                                </td>	

                                <td class="text-center">
                                    <form id="f${item.productId}" class="form-inline" role="form" >
                                        <label class="sr-only" for="quantity">${item.quantity}</label>
                                        <input id="q${item.productId}" type="text" class="form-inline" value="${item.quantity}"/> 
                                        <!--    <div class="input-group btn-block">
                                                <input type="text" name="quantity" value="{item.quantity}" size="1" class="form-control" />
                                            </div> -->
                                        <button title="Update" name="${item.productId}" onclick="javascript:updateQuantity(this); return false;" 
                                                class="btn btn-default tool-tip">                                                                  
                                            <i class="fa fa-refresh"></i>
                                        </button>

                                        <a href="<c:url value="/shoppingCart/removeItem.htm?itemId=${item.productId}" />" title="Remove" class="btn btn-default tool-tip">
                                            <i class="fa fa-times-circle"></i>
                                        </a>
                                        <c:choose>
                                            <c:when test="${item.isAvailableToSell() == false}">  
                                                </br><strong class="label label-danger"> This amount is not available to buy!</strong>
                                            </c:when>                                        
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${item.getQuantity() <= 0}">  
                                                </br><strong class="label label-danger">Invalid format!</strong>
                                            </c:when>                                        
                                        </c:choose>
                                    </form>
                                </td>
                                <td class="text-center">
                                    ${item.price}
                                </td>
                                <td class="text-center">
                                    ${item.price*item.quantity}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" class="text-right">
                                <strong>Total :</strong>
                            </td>
                            <td colspan="2" class="text-left">
                                <fmt:formatNumber value="${shoppingCart.total()}" type="currency"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="text-right">
                                <strong>Taxes 6% :</strong>
                            </td>
                            <td colspan="2" class="text-left">
                                <fmt:formatNumber value="${shoppingCart.total()*0.06}" type="currency"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="text-right">
                                <strong>Total to Pay:</strong>
                            </td>
                            <td colspan="2" class="text-left">
                                <fmt:formatNumber value="${shoppingCart.total()*1.06}" type="currency"/>
                            </td>
                        </tr>
                    </tfoot>     
                </table>                    
            </div>
            <div align="center" class="registration-area">                       
                <a href="<c:url value="/index.htm"/>" >
                    <i class="btn btn-black">Continue Shopping</i>
                </a>
                <a href="<c:url value="/shoppingCart/checkout.htm"/>" >
                    <i class="btn btn-black">Proceed To Checkout</i>
                </a>                                     
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