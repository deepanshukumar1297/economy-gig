<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dao.DSkill"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title></title>

</head>
<body>
	
	<%
        DSkill dskill = new DSkill(); 
		ArrayList<String> skills= dskill.fetch();

	%>
	<h3>welcome admin</h3>
	
	skills defined are:
	
	<table>
		<thead>
		<tr>
			<td>SKILL TYPES</td>
		</tr>
			
		</thead>
	  	<tbody>
	  							<% 
                                    for(String s:skills)
                                    {
                                %>
	  		<tr>
	  			<td><%= s.toUpperCase() %></td>
	  		</tr>
	  							<% 
                                    }
                                %>
	  	</tbody>
	  </table>
	  
	  add skill ka bnana bacha h
	  <form action="Admin">
	  	<input type="text" requierd name="skills" placeholder="Enter The Skills">
	  	<input type="submit">
	  </form>
	
</body>
</html>