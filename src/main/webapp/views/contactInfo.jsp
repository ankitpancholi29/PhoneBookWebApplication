<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PhoneBookContact</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js">
</script>
<script>
function validateForm() {
  var x = document.forms["contact"]["contactName"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
  var y = document.forms["contact"]["contactEmail"].value;
  if (y == "") {
    alert("Email must be filled out");
    return false;
  }
  var z = document.forms["contact"]["contactNumber"].value;
  if (z == "") {
    alert("Number must be filled out");
    return false;
  }
  /* var phone = document.forms["myForm"]["phone"].value;
  var phoneNum = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/; 
      if(phone.value.match(phoneNum)) {
          return true;
      }
      else {
          document.getElementById("phone").className = document.getElementById("phone").className + " error";
          return false;
      } */
      /* var contactNumber = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
      if((inputtxt.value.match(contactNumber))
            {
          return true;
            }
          else
            {
            alert("message");
            return false;
            } */
}
</script>
</head>
<body>
	<h2>Contact Save</h2>
	<p>
		<font color='green'>${succMsg}</font>
	</p>
	<p>
		<font color='red'>${errMsg}</font>
	</p>
	<form:form action="saveContact" modelAttribute="contact" method="POST"
		onsubmit="return validateForm()">
		<table>
			<tr>
				<form:hidden path="contactId" />

				<td>Contact Name:</td>
				<td><form:input path="contactName" /></td>
			</tr>
			<tr>
				<td>Contact Email :</td>
				<td><form:input path="contactEmail" /></td>
			</tr>
			<tr>
				<td>Contact Number :</td>
				<td><form:input path="contactNumber" /></td>
			</tr>
			<tr>
				<td><input type="reset" value="Reset" /></td>
				<td><input type="submit" value="Save" /></td>
			</tr>

		</table>

	</form:form>
	<a href="viewContact"> View All Contacts</a>
</body>
</html>