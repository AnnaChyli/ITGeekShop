<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:MasterLayout>
    <jsp:body>
        <div id="main-container" class="container" align="center">
            <h2 class="main-heading" >
                Your Order has been placed! <br />
            </h2>   
            <img src="<c:url value="/resources/images/confirmation.gif" />" class="img-responsive" />
        </div>

    </jsp:body>
</t:MasterLayout>