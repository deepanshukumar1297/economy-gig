<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="pojo.Info"%>
<%@page import="dao.DInfo"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title></title>

</head>
<body >


	<%
        DInfo dinfo = new DInfo();  
		Info info = new Info();
		String email=(String)session.getAttribute("email");
		
		
		
	%>
	
	  <h2>  welcome <%= dinfo.fetch(email).getName() %>  </h2>
	  
	  <table>
	  	<tbody>
	  		<tr>
	  			<td>NAME</td>
	  			<td><%= info.getName().toUpperCase() %></td>
	  		</tr>
	  		<tr>
	  			<td>AADHAR CARD</td>
	  			<td><%= info.getAadhar_card() %></td>
	  		</tr>
	  		<tr>
	  			<td>CONTACT NUMBER</td>
	  			<td><%= info.getContact_number() %></td>
	  		</tr>
	  		<tr>
	  			<td>EMAIL ID</td>
	  			<td><%= info.getEmail_id().toLowerCase() %></td>
	  		</tr>
	  	</tbody>
	  </table>
	  
	 <form action="DeleteAccount" method="get">
	 delete  bnana bacha h dont click it
	  <input type="submit" value="delete your account">
	 </form>
	 
	 you want to be employer or candidate
	 
	 location ka baad m dekhenge doing it simple for now
	 
	 <form action="">
	 	 <input type="text">
	 	 <input type="text">
	 	
	 </form>
	 

</body>
</html>