<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
	<jsp:param value="admin" name="type" />
	<jsp:param value="Jobbeurs - Voeg Admin Toe" name="title" />
	<jsp:param value="Beheerder toevoegen" name="h2" />
</jsp:include>

	
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">
		<form method="POST" action="Controller?action=addAdmin">
			<legend>Nieuwe beheerder toevoegen</legend>
			<div class="form-group">
				<label for="userID">Gebruikersnaam: </label>
				<input type="text" class="form-control" id="userID" name="userID" value='<c:out value="${prevID}"></c:out>'>
			</div>
			<div class="form-group">
				<label for="contactName">Naam: </label>
				<input type="text" class="form-control" id="contactName" name="contactName" value='<c:out value="${prevContactName}"></c:out>'>
			</div>
			<div class="form-group">
				<label for="email">Email: </label>
				<input type="text" class="form-control" id="email" name="email" value='<c:out value="${prevEmail}"></c:out>'>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Beheerder toevoegen">
			</div>
		</form>
	</div>
</div>

<jsp:include page="footer.jsp"/>