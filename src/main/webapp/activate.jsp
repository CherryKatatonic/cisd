<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container justify-content-center">
    <div class="card text-center">
        <div class="card-header">
            <h3>Error :(</h3>
        </div>
        <div class="card-body">
            ${error}
            <c:remove var="error" scope="session"/>
        </div>
    </div>
</div>