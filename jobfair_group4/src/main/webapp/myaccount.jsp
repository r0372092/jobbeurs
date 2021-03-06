<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
	<jsp:param value="Jobbeurs - ${sessionScope.user.contactName}" name="title"/>
	<jsp:param value="Jobbeurs - ${sessionScope.user.companyName}" name="h2"/>
</jsp:include>


	
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">

		<c:if test="${sessionScope.user!=null}">
			<h3>Instellingen voor ${sessionScope.user.userID}</h3>
				<fieldset>
				<h4 class="bordboth4">Gebruikersnaam</h4>
					<div class="form-group">
					  <p>${sessionScope.user.userID}</p>
					</div>
				</fieldset>
				
				<fieldset>
				<h4 class="bordboth4">Bedrijfsnaam</h4>
					<div class="form-group">
					  <p>${sessionScope.user.companyName}</p>
					</div>
				</fieldset>
				
			<form method="POST" action="Controller?action=updateaccount" novalidate="novalidate" role="form">
				<fieldset>
				<legend>Contactpersoon</legend>
					<div class="form-group">
						<label for="contactname">Naam</label>
						<input type="text" id="contactname" class="form-control" name="contactname" value="${sessionScope.user.contactName}">
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" id="email" name="email"  class="form-control" value="${sessionScope.user.email}">
					</div>
					<div class="form-group">
						<label for="password">Wachtwoord ter bevestiging</label>
						<input type="password" id="password" name="password" class="form-control" value="">
					</div>
				
					<input type="submit" class="btn btn-primary" name="submit" value="Wijzigingen opslaan">
				</fieldset>
			</form>
			<form method="POST" action="Controller?action=updatepassword" novalidate="novalidate" role="form">
				<fieldset>
					<legend>Wachtwoord wijzigen</legend>
					<div class="form-group">
						<label for="currpass">Huidige wachtwoord</label>
						<input type="password"  class="form-control" name="currpass" value="">
					</div>
					<div class="form-group">
						<label for="newpass">Nieuw wachtwoord</label>
						<input type="password" class="form-control" name="newpass" value="">
					</div>
					<div class="form-group">
						<label for="reppass">Herhaal nieuwe wachtwoord</label>
						<input type="password" class="form-control" name="reppass" value="">
					</div>
				
					<input type="submit" class="btn btn-primary" name="submit" value="Wijziging wachtwoord">
				</fieldset>
			</form>
		</c:if>

		
	</div></div>
<jsp:include page="footer.jsp"/>