<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:MasterSellerLayout>
    <jsp:body>
        <c:url var="actionUrl" value="/inventory/inventory.htm" />
        <c:url var="ajaxUrl" value="/inventory/inventory.htm" />
        <script type="text/javascript">

            function updateQuantity(obj) {
                var productId = obj.name;
                var inputId = 'q' + productId;
                var value = document.getElementById(inputId).value;
                $.ajax({
                    url: "${ajaxUrl}",
                    type: "POST",
                    data: JSON.stringify({
                        "id": productId,
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
        <!-- Main Container Starts -->
        <div id="main-container" class="container">          
            <!-- Main Heading Starts -->
            <h2 class="main-heading text-center">
                Current Inventory
            </h2>
            <!-- Main Heading Ends -->
            <!-- Compare Table Starts -->
            <div class="table-responsive compare-table">

                <form:form modelAttribute="products">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td>S.NO</td>
                                <td>Image</td>
                                <td>Name</td>
                                <td>Invoice Price</td>
                                <td>Sell Price</td>
                                <td>Quantity</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach varStatus="vs" var="product" items="${products}">
                                <tr>
                                    <td>${vs.index+1}</td>
                                    <td>
                                        <img width="120px" src="<c:url value="/inventory/download.htm?fileName=${product.id}.jpeg"/>" alt="image" title="image" class="img-thumbnail" />
                                    </td>
                                    <td class="name">
                                        ${product.name}
                                    </td>							
                                    <td>
                                        $${product.invoicePrice}
                                    </td>
                                    <td>
                                        $${product.sellPrice}
                                    </td>
                                    <td>
                                        <form id="f${product.id}" class="form-inline" role="form">
                                            <label class="sr-only" for="quantity">${product.quantity}</label>
                                            <input id="q${product.id}" type="text" class="form-inline" value="${product.quantity}"/>                                             
                                            <button name="${product.id}" onclick="javascript:updateQuantity(this);
                                                    return false;" 
                                                    class="btn btn-black">Update
                                            </button>
                                        </form>                                                                                            
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- Compare Table Ends -->
            </div>
            <!-- Main Container Ends -->
        </form:form>
    </jsp:body> 
</t:MasterSellerLayout>
