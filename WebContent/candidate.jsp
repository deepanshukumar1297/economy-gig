<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<form enctype="multipart/form-data" action="GetCandidate" method="post" >

		<input type="file" alt="profile_image" name="image" accept="image/*">
		<br>
		<textarea rows="4" cols="50" name="self_discription" ></textarea>
		<br>
		<!-- address -->

		<input type="hidden" name="country" id="countryId" value="IN" /> <select
			name="state" class="states order-alpha" id="stateId" required >
			<option value="">Select State</option>
		</select> <select name="city" class="cities order-alpha" id="cityId" required>
			<option value="">Select City</option>
		</select> 
		<br>
		<input type="text" name="village" placeholder="enter you village">
		<br>
		<!-- end address -->
		
		 
		<input type="submit">
		
	</form>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src="//geodata.solutions/includes/statecity.js"></script>

</html>