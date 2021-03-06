<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp">
	<jsp:param value="Jobbeurs - Plaats ${spotnr}" name="title"/>
</jsp:include>
	
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">

		<h3>Opties voor plaats ${spotnr}: </h3>
		<form method="POST" action="Controller?action=spotoptionsadmin" novalidate="novalidate" role="form">
			<div class="form-group">
				<label for="userID">Bedrijven die niet gekozen hebben: </label>
				<select class="form-control" name="userID" id="userId">
					<c:forEach var="freeUser" items="${freeUsers}">
						<option value="<c:out value="${freeUser}"/>"><c:out value="${freeUser}"/></option>
					</c:forEach>
				</select>
			</div>
			<fieldset>
			<legend>Aantal stoelen: </legend>

				<div class="radio">
				  <label>
				    <input type="radio" name="chairs" id="chairs0" value="0" >
				   0
				  </label>
				</div>

				<div class="radio">
				  <label>
				    <input type="radio" name="chairs" id="chairs1" value="1" >
				   1
				  </label>
				</div>

				<div class="radio">
				  <label>
				    <input type="radio" name="chairs" id="chairs2" value="2" checked >
				   2
				  </label>
				</div>
			</fieldset>

			<fieldset>
			<legend>Aantal tafels: </legend>

				<div class="radio">
				  <label>
				    <input type="radio" name="tables" id="table0" value="0" >
				   0
				  </label>
				</div>

				<div class="radio">
				  <label>
				    <input type="radio" name="tables" id="table1" value="1" checked>
				   1
				  </label>
				</div>

			</fieldset>

			<fieldset>
			<legend class="sr-only">Elektriciteit</legend>
				<div class="checkbox">
				  <label>
				    <input type="checkbox" name="electricity" value="Elektriciteit" checked>
				    Elektriciteit
				  </label>
				</div>
			</fieldset>

			
			<div class="form-group">	
			<label for="extra">Extra opmerkingen: </label>
			<textarea name="extra" class="form-control" rows="3"></textarea>
			</div>
			<input type="hidden" id="id" name="id" value="<c:out value="${spotnr}"/>"> 
			<button type="submit" class="btn btn-primary" value="Submit">reserveer plaats</button>
		</form>
	</div>
</div>

<jsp:include page="footer.jsp"/>