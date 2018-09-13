<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container justify-content-center">
    <form action="${request.contextPath}/set-password" method="post" class="px-4 py-3">
        <h3 class="text-center">Set Your Password</h3>
        <div class="form-group">
            <label for="password">New Password</label>
            <input id="password" class="form-control" type="password" name="password" placeholder="New Password">
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input id="confirmPassword" class="form-control" type="password" placeholder="Confirm New Password">
        </div>
        <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-outline-warning px-4">Save</button>
        </div>
    </form>
</div>