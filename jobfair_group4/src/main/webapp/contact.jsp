<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp">
	<jsp:param value="Jobbeurs - contact" name="title"/>
</jsp:include>


<main>


<div class="container">
	
<div class="row">

<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">

	<h3>Contact</h3>
	<form method="" action="" novalidate="novalidate">
		<fieldset><legend>Beheerders</legend>
			<div class="form-group">
				<ul>
					<c:forEach var="admin" items="${admins}">
						<li>
							${admin.contactName}<br>
							Email: ${admin.email}
						</li>
					</c:forEach>
				</ul>
			</div>
		</fieldset>
	</form>
	
	<form method="POST" action="Controller?action=questionmail" novalidate="novalidate">
		<fieldset><legend>Vragen / Opmerkingen</legend>
			<div class="form-group">
				<label for="adminID">Selecteer een beheerder * </label>
				<select class="form-control" name="admin" id="admin">
					<c:forEach var="admin" items="${admins}">
						<option value="<c:out value="${admin.contactName}"/>"><c:out value="${admin.contactName}"/></option>
					</c:forEach>
				</select>
				<label for="subject">Onderwerp * </label>
				<input class="form-control" type="text" name="subject" placeholder="Onderwerp" value="${subject}">
				<label for="name">Naam * </label>
				<input class="form-control" type="text" name="name" placeholder="Naam" value="${from}">
				<label for="message">Je bericht * </label>
				<textarea class="form-control" name="message" class="form-control" rows="3" placeholder="Vragen / Opmerkingen" value="${msg}"></textarea>
				<div class="g-recaptcha" data-sitekey="6LftmQ4UAAAAAH1SFuSsQkbU9BYViukh6HjUvcqr"></div>
				<p> * Deze velden zijn verplicht.</p>
				<input type="submit" class="btn btn-primary" value="Verzenden">
			</div>
		</fieldset>
	</form>
	
			
	</div></div></div>
</main>

</body>
</html>