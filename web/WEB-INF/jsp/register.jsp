<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<t:MasterLayout>
    <jsp:body>

        <!-- Main Container Starts -->
        <div id="main-container" class="container">
            <!-- Breadcrumb Starts -->
            <ol class="breadcrumb">
                <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                <li class="active">Register</li>
            </ol>
            <!-- Breadcrumb Ends -->
            <!-- Main Heading Starts -->
            <h2 class="main-heading" >
                Register <br />
                <span>Create New Account</span>
            </h2>
            <!-- Main Heading Ends -->
            <!-- Registration Section Starts -->
            <section class="registration-area">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Registration Block Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">Personal Information</h3>
                            </div>
                            <div class="panel-body">                                
                                <!-- Registration Form Starts -->
                                <c:url var="actionUrl" value="/user/register.htm" />
                                <form:form modelAttribute="user" id="registrationForm" class="form-horizontal" role="form" action="${actionUrl}" method="POST" data-parsley-validate="true">
                                    <!-- Personal Information Starts -->
                                    <div class="form-group">
                                        <label for="firstName" class="col-sm-3 control-label">First Name :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="First Name" data-parsley-required="true" data-parsley-length="[4, 20]"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName" class="col-sm-3 control-label">Last Name :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Last Name" data-parsley-required="true" data-parsley-length="[4, 20]"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob" class="col-sm-3 control-label">Date Of Birth :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="dob" id="dob" placeholder="MM-DD-YYYY" parsley-type="dateIso" data-parsley-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-3 control-label">Email :</label>
                                        <div class="col-sm-9">
                                            <form:input type="email" class="form-control" path="account.login" id="email" placeholder="Email" data-parsley-trigger="change" data-parsley-required="true"/>
                                            <c:choose>
                                                <c:when test="${param.userExist == true}">  
                                                    <p class="label label-danger">This email is already exist!</p>
                                                </c:when>                                        
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="role" class="col-sm-3 control-label">Account type :</label>
                                        <div class="col-sm-9">
                                            <form:select class="form-control" path="role" id="role">
                                                <option>Buyer</option>
                                                <option>Seller</option>                                                
                                            </form:select>
                                        </div>
                                    </div>

                                    <!-- Personal Information Ends -->
                                    <h3 class="panel-heading inner">
                                        Delivery Information
                                    </h3>
                                    <!-- Delivery Information Starts -->                                    
                                    <div class="form-group">
                                        <label for="inputAddress" class="col-sm-3 control-label">Street :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="addressInfo.street" id="inputAddress" placeholder="Street" data-parsley-required="true"/>
                                        </div>
                                    </div> 

                                    <div class="form-group">
                                        <label for="inputCity" class="col-sm-3 control-label">City :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="addressInfo.city" id="inputCity" placeholder="City" data-parsley-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPostCode" class="col-sm-3 control-label">Postal Code :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="addressInfo.zip" id="inputPostCode" placeholder="Postal Code" data-parsley-required="true"  data-parsley-pattern="/(^\d{5}$)|(^\d{5}-\d{4}$)/"/>
                                        </div>
                                    </div>
                                    <div class="form-group">   
                                        <label for="inputCountry" class="col-sm-3 control-label">Country :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="addressInfo.country" id="inputCountry" placeholder="Country" data-parsley-required="true"/>
                                        </div>  
                                    </div>                                  
                                    <!-- Delivery Information Ends -->
                                    <h3 class="panel-heading inner">
                                        Password
                                    </h3>
                                    <!-- Password Area Starts -->
                                    <div class="form-group">
                                        <label for="inputPassword" class="col-sm-3 control-label">Password :</label>
                                        <div class="col-sm-9">
                                            <form:password class="form-control" path="account.password" id="inputPassword" placeholder="Password" data-parsley-required="true" data-parsley-minlength="5"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputRePassword" class="col-sm-3 control-label">Re-Password :</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control"  id="inputRePassword" placeholder="Re-Password" data-parsley-required="true" data-parsley-minlength="5" data-parsley-equalto="#inputPassword"/>
                                        </div>
                                    </div> 

                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-9">
                                            <form:button class="btn btn-black" >
                                                Register
                                            </form:button>
                                        </div>
                                    </div>
                                    <!-- Password Area Ends -->
                                </form:form>

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

        $('#registrationForm .btn').on('click', function () {
            $('#registrationForm').parsley().validate();
            return validateFront();
        });

        var validateFront = function () {
            if (true === $('#registrationForm').parsley().isValid()) {
                return true;
            } else {
                return false;
            }
        };
    });
</script>    