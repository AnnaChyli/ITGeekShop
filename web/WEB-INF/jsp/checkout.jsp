<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:MasterLayout>
    <jsp:body>
        <!-- Main Container Starts -->
        <div id="main-container" class="container">
            <!-- Breadcrumb Starts -->
            <ol class="breadcrumb">
                <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                <li class="active">Checkout</li>
            </ol>
            <!-- Breadcrumb Ends -->
            <!-- Main Heading Starts -->
            <h2 class="main-heading" >
                Checkout <br />
                <span>Enter In Payment Information</span>
            </h2>
            <!-- Main Heading Ends -->
            <!-- Registration Section Starts -->

            <section class="registration-area">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Registration Block Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">Payment Information</h3>
                            </div>
                            <div class="panel-body">
                                <!-- Registration Form Starts -->
                                <form class="form-horizontal" role="form" id="checkoutForm" data-parsley-validate="true">
                                    <!-- Personal Information Starts -->
                                    <div class="form-group">
                                        <label for="inputCardName" class="col-sm-3 control-label">Name on Card :</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" path="cardName" id="inputCardName" placeholder="Card Holder/Name" data-parsley-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputCardNum" class="col-sm-3 control-label">Card Number :</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" path="cardNumber" id="inputCardNum" placeholder="Card Number (16 digits)" 
                                                   data-parsley-type="digits" data-parsley-required="true" data-parsley-pattern="/(^\d{16}$)|(^\d{16}-\d{15}$)/"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputExpDate" class="col-sm-3 control-label">Expiration Date :</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" path="expDate" id="inputExpDate" 
                                                   placeholder="MM-DD-YYYY" parsley-type="dateIso" data-parsley-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputCvc" class="col-sm-3 control-label">Card CVC :</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" path="cvc" id="inputCvc" placeholder="Secuirty Code" 
                                                   data-parsley-type="digits" data-parsley-required="true" data-parsley-length="[3, 3]"/>
                                        </div>
                                    </div>

                                    <div class="form-group" align="middle">
                                        <div align="center" class="form-group">                                            
                                            <a href="<c:url value="/order/placeOrder.htm"/>" >
                                                <i class="btn btn-black">Place Order</i>
                                            </a>                                             
                                        </div>
                                    </div>
                                    <!-- Personal Information Ends -->
                                </form>
                                <div class="form-group" align="middle">                                  
                                    <a href="<c:url value="/shoppingCart/cart.htm"/>" >
                                        <i class="btn btn-black">Edit Shopping Cart</i>
                                    </a>                                    
                                </div>
                                <!-- Registration Form Starts -->
                            </div>							
                        </div>
                        <!-- Registration Block Ends -->
                    </div>
                </div>
            </section>
            <!-- Registration Section Ends -->
        </div>
        <!-- Main Container Ends -->
    </jsp:body>
</t:MasterLayout>
<script type="text/javascript">
    $(document).ready(function () {
        $.listen('parsley:field:validate', function () {
            validateFront();
        });

        $('#checkoutForm .btn').on('click', function () {
            $('#checkoutForm').parsley().validate();
            return validateFront();
        });

        var validateFront = function () {
            if (true === $('#checkoutForm').parsley().isValid()) {
                return true;
            } else {
                return false;
            }
        };
    });
</script>    