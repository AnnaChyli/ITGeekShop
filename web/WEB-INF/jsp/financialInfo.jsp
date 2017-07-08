<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:MasterSellerLayout>
    <jsp:body>
        <!-- Main Container Starts -->
        <div id="main-container" class="container">          
            <!-- Main Heading Starts -->
            <h2 class="main-heading">
                Finance Information
            </h2>
            <!-- Registration Section Starts -->
            <section class="registration-area" >
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Registration Block Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">Inventory Finance Overview :</h3>
                            </div>
                            <div class="panel-body">
                                <!-- Registration Form Starts -->
                                <c:url var="actionUrl" value="/inventory/financeInfo.htm" />
                                <form:form modelAttribute="financeInfo">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <td>Revenue</td>
                                                <td>Cost</td>
                                                <td>Profit</td>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td>${financeInfo.calculateRevenue()}</td>
                                                <td>${financeInfo.calculateCost()}</td>
                                                <td>${financeInfo.calculateProfit()}</td>                      
                                            </tr>

                                        </tbody>

                                    </table>


                                    <!-- Registration Form Starts -->
                                </div>       
                            </div>
                            <!-- Registration Block Ends -->
                        </div>
                        <div class="panel panel-smart">

                            <div class="panel-body" align = "middle" >
                                <img src="<c:url value="/resources/images/misc/finance.jpg" />" alt="Finance" class="img-responsive" height="50" width="300"  />
                            </div>
                        </div>
                    </form:form>
                </div>
            </section>
        </div>                                       
    </jsp:body>
</t:MasterSellerLayout>