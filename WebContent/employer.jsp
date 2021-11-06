<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.ArrayList"%>
<%@page import="dao.DSkill"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
        DSkill dskill = new DSkill(); 
		ArrayList<String> skills= dskill.fetch();
		if(dskill.exception==true)response.sendRedirect("exception.jsp");

	%>
	
	<form action="GetEmployee" method="get" onsubmit="getSkills()">
	
		<input type="text" name="job_title" placeholder="enter job_title" required><br><br>
		<input type="text" name="job_discription" placeholder="enter job_discription" required><br><br>
		
		<input type="number" name="wages_daily" placeholder="Daily wages" required><br><br>
		<input type="number" name="wages_monthly" placeholder="Monthly wages" required><br><br>
		
		<input type="date" name="date_from" placeholder="Job Starts from" required><br><br>
		<input type="date" name="date_to" placeholder="job end at" required><br><br>
		
		<select name="payment_method" required><br><br>
		
		
		
			<option  hidden selected disabled >choose payment method</option>
			<option>cash </option>
			<option>upi </option>				
		</select><br><br>
		
		<div>
			choose required skill for the job
			<table>
   
                     <thead>
                        <tr>
                           <th>skills </th>
                           <th>tick to add</th>
                        </tr>
                     </thead>
   
                     <tbody>
                        <%
                        for(String s:skills)
                        {
                        %>
                        <tr>
							<td><input type="text" value="<%=s.toUpperCase()%>"  name="skills"></td>
                           <td><input type="checkbox"  name="skill_status"></td>
                        </tr>
                        <%
                           }
                        %>
                     </tbody>
   
                  </table>
                   <input type="hidden"  id="number" name="number">
                   
                   <input type="submit">
		
		</div>
	
	</form>
	
</body>
<script>
	function getSkills(){
	  var nodelist = document.getElementsByName("skill_status");
	  document.getElementById("number").value =nodelist.length;
      for (let index = 0; index < nodelist.length; index++) {
          if (nodelist[index].checked == true)
             nodelist[index].value = "y";
          else {
             nodelist[index].checked = true;
             nodelist[index].value = "n";
          }
       }
	}
</script>
</html>