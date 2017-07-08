<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h2 class="main-heading text-center">
                Login or create new account
            </h2>
            <!-- Main Heading Ends -->
            <!-- Login Form Section Starts -->
            <section class="login-area">
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Login Panel Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">Login</h3>
                            </div>
                            <div class="panel-body">
                                <p>
                                    Please, login using your existing account
                                </p>
                                <!-- Login Form Starts -->
                                <c:url var="actionUrl" value="/login" />
                                <form:form modelAttribute="account" id="loginForm" class="form-horizontal" role="form" path="login" action="${actionUrl}" method="POST" data-parsley-validate="true">
                                    <div class="form-group">
                                        <label for="inputEmail2" class="col-sm-3 control-label">Email:</label>
                                        <div class="col-sm-9">
                                           <form:input type="email" class="form-control" path="login" id="inputEmail2" placeholder="Email" data-parsley-trigger="change" data-parsley-required="true"/> 
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword2" class="col-sm-3 control-label">Password:</label>
                                        <div class="col-sm-9">
                                           <form:input type="password" class="form-control" path="password" id="inputPassword2" placeholder="Password" data-parsley-required="true" data-parsley-minlength="5"/>
                                        </div>
                                    </div>                                                                             
                                    <button type="submit" class="btn btn-black">
                                        Login
                                    </button>
                                </form:form>
                                <!-- Login Form Ends -->
                            </div>
                        </div>
                        <!-- Login Panel Ends -->
                    </div>
                    <div class="col-sm-6">
                        <!-- Account Panel Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Create new account
                                </h3>
                            </div>
                            <div class="panel-body">
                                <p>
                                    Please, create an account to take advantage of Buyer/Seller opportunities
                                </p>
                                <a href="<c:url value="/user/register.htm" />" class="btn btn-black">
                                    Register
                                </a>
                            </div>
                        </div>
                        <!-- Account Panel Ends -->                        
                    </div>
                </div>
            </section>
            <!-- Login Form Section Ends -->
        </div>
        <!-- Main Container Ends -->
    </jsp:body>
</t:MasterLayout>
<script type="text/javascript">
    $(document).ready(function () {
        $.listen('parsley:field:validate', function () {
            validateFront();
        });

        $('#loginForm .btn').on('click', function () {
            $('#loginForm').parsley().validate();
            return validateFront();
        });

        var validateFront = function () {
            if (true === $('#loginForm').parsley().isValid()) {
                return true;
            } else {
                return false;
            }
        };
    });
</script>  