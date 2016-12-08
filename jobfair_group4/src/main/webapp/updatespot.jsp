<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp">
	<jsp:param value="Wijzig Plaats ${spotnr}" name="title"/>
</jsp:include>

<main>



<div class="container">
	<h3>Opties voor plaats ${spotnr}: </h3>
<div class="row">
	
<div class="col-xs-12 col-sm-12 col-md-8 col-lg-6">
	<form method="POST" action="Controller?action=confirmupdate&id=${spotnr}" novalidate="novalidate" role="form">
	<fieldset>
		<legend>Aantal stoelen: </legend>

			<div class="radio">
			  <label>
			    <input type="radio" name="chairs" id="chairs0" value="0" ${ch0}>
			   0
			  </label>
			</div>

			<div class="radio">
			  <label>
			    <input type="radio" name="chairs" id="chairs1" value="1" ${ch1}>
			   1
			  </label>
			</div>

			<div class="radio">
			  <label>
			    <input type="radio" name="chairs" id="chairs2" value="2" ${ch2}>
			   2
			  </label>
			</div>
		</fieldset>

		<fieldset>
		<legend>Aantal tafels: </legend>

			<div class="radio">
			  <label>
			    <input type="radio" name="tables" id="table0" value="0" ${tb0}>
			   0
			  </label>
			</div>

			<div class="radio">
			  <label>
			    <input type="radio" name="tables" id="table1" value="1" ${tb0}>
			   1
			  </label>
			</div>

		</fieldset>

		<fieldset>
		<legend class="sr-only">Elektriciteit</legend>
			<div class="checkbox">
			  <label>
			    <input type="checkbox" name="electricity" value="Elektriciteit" ${el}>
			    Elektriciteit
			  </label>
			</div>
		</fieldset>

		<div class="form-group">	
		<label for="extra">Extra opmerkingen: </label>
		<textarea name="extra" class="form-control" rows="3">${extra}</textarea>
		<input type="hidden" name="spotnr" value="${spotnr}">
		</div>
		<button type="submit" class="btn btn-primary" value="Toepassen">Toepassen</button>

	</form>	</div></div></div>
</main>

</body>
</html>