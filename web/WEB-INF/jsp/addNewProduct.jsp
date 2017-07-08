<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:MasterSellerLayout>
    <jsp:body>
        <!-- Main Container Starts -->
        <div id="main-container" class="container">          
            <!-- Main Heading Starts -->
            <h2 class="main-heading">
                Add a New Item
            </h2>
            <!-- Registration Section Starts -->
            <section class="registration-area" >
                <div class="row">
                    <div class="col-sm-6">
                        <!-- Registration Block Starts -->
                        <div class="panel panel-smart">
                            <div class="panel-heading">
                                <h3 class="panel-title">Item Information :</h3>
                            </div>
                            <div class="panel-body">
                                <!-- Registration Form Starts -->
                                <c:url var="actionUrl" value="/inventory/addNewProduct.htm" />
                                <form:form modelAttribute="product" enctype="multipart/form-data" class="form-horizontal" role="form" action="${actionUrl}" method="POST" data-parsley-validate="true">
                                    <!-- Personal Information Starts -->
                                    <div class="form-group">
                                        <label for="name" class="col-sm-3 control-label">Name :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="name" id="name" name="name" placeholder="Name" data-parsley-required="true" data-parsley-length="[3, 20]"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="author" class="col-sm-3 control-label">Author :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="author" id="author" name="author" placeholder="Author" data-parsley-required="true" data-parsley-length="[3, 20]"/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="description">Description :</label>
                                        <div class="col-sm-9">
                                            <form:textarea size="22" rows="5" id="description" name="description" path="description" class="form-control" placeholder="Description" data-parsley-required="true"/>
                                        </div>
                                    </div>   
                                    <div class="form-group">
                                        <label for="invoicePrice" class="col-sm-3 control-label">Invoice Price :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="invoicePrice" id="invoicePrice" name="invoicePrice"  
                                                        data-parsley-type="number" data-parsley-required="true" data-parsley-min="0"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="sellPrice" class="col-sm-3 control-label">Sell Price :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="sellPrice" id="sellPrice"  name="sellPrice" placeholder="sellPrice" 
                                                        data-parsley-type="number" data-parsley-required="true" data-parsley-min="0"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="quantity" class="col-sm-3 control-label">Quantity :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="quantity" id="quantity" name="quantity" value="1" placeholder="quantity" 
                                                        data-parsley-type="digits" data-parsley-required="true" data-parsley-min="1"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="role" class="col-sm-3 control-label">Category :</label>
                                        <div class="col-sm-9">
                                            <form:select class="form-control" path="category" id="category" name="category">
                                                <option value="CSharp">C#</option>
                                                <option value="Cpp">C++</option>
                                                <option>C</option> 
                                                <option>Java</option>
                                                <option>Rubi</option>
                                                <option>Python</option>
                                                <option>JavaScript</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="ISBN" class="col-sm-3 control-label">ISBN :</label>
                                        <div class="col-sm-9">
                                            <form:input type="text" class="form-control" path="ISBN" id="ISBN" name="ISBN" placeholder="ISBN" data-parsley-type="alphanum" data-parsley-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="file" class="col-sm-3 control-label">Cover image :</label>
                                        <div class="col-sm-9">
                                            <input type="file" accept=".jpg, .jpeg, .bmp, .png" class="form-control" name="file" data-parsley-required="true"/>
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-9">
                                            <form:button class="btn btn-black">
                                                Add Item
                                            </form:button>
                                        </div>
                                    </div>
                                    <!-- Registration Form Starts -->
                                </div>							
                            </div>
                            <!-- Registration Block Ends -->
                        </div>
                    </form:form>       
                </div>
            </section>
        </div>
    </jsp:body>      
</t:MasterSellerLayout>