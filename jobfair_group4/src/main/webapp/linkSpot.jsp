<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp">
	<jsp:param value="Link plaats aan bedrijf" name="title"/>
	<jsp:param value="Link een vrije plaats aan een bedrijf" name="h2"/>
</jsp:include>

<div class="container">
	
<div class="row">

<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">

<form method="POST" action="Controller?action=" role="form">
	<legend class="sr-only">Sign up</legend>
	<div class="form-group">
		<label for="freeSpot">Lege spot: </label>
		<select class="form-control" name="freeSpot" id="freeSpot">
			<c:forEach var="freeSpot" items="${freeSpots}">
				<option value="<c:out value="${freeSpot.spotID}"/>"><c:out value="${freeSpot.spotID}"/></option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="freeUser">Bedrijven die niet gekozen hebben: </label>
		<select class="form-control" name="freeUser" id="freeUser">
			<c:forEach var="freeUser" items="${freeUsers}">
				<option value="<c:out value="${freeUser}"/>"><c:out value="${freeUser}"/></option>
			</c:forEach>
		</select>
	</div>
	<button type="submit" class="btn btn-primary" id="submit" value="Link plaats"> Link plaats </button>
</form>
</div></div></div>
</body>
</html>