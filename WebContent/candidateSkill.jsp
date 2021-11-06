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
	
	set your skill
	<form action="SetCandidateSkill" method="post" onsubmit="getSkills()">
	
	
	
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