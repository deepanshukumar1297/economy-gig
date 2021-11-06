<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- if want to see full error remove this error page directive -->



<%@page import="pojo.Employer"%>
<%@page import="pojo.Candidate"%>
<%@page import="pojo.Info"%>
<%@page import="dao.DInfo"%>
<%@page import="dao.DCandidate"%>
<%@page import="dao.DEmployer"%>
<%@ page import="java.util.ArrayList"%>

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
	DCandidate dcandidate = new DCandidate();
	DEmployer demployer = new DEmployer();

	ArrayList<Candidate> candidate_list = new ArrayList<Candidate>();
	ArrayList<Employer> employer_list = new ArrayList<Employer>();

	String email = (String) session.getAttribute("email");

	ArrayList<Info> info_list = dinfo.fetch(email);
	if (dinfo.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_1");

	//if user is candidate
	boolean candidate_status = dcandidate.ping(email);
	if (dcandidate.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_2");
	else {
		if (candidate_status == true) {
			candidate_list = dcandidate.fetch(email);
			if (dcandidate.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_3");
		}
	}

	//if user is employer
	boolean employer_status = demployer.ping(email);
	if (demployer.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_4");
	else {
		if (employer_status == true) {
			employer_list = demployer.fetch(email);
			if (demployer.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_5");
		}
	}
	%>
	<button onclick="employeeOrCandidate()" id="initial_button">
		click me
	</button>

	<div style="display:none" id="main_content">

		<%
		for (Info i : info_list) {
		%>

		<h2>
			welcome
			<%=i.getName().toUpperCase()%>
		</h2>

		<table>
			<tbody>
				<tr>
					<td>NAME</td>
					<td><%=i.getName().toUpperCase()%></td>
				</tr>
				<tr>
					<td>AADHAR CARD</td>
					<td><%=i.getAadhar_card()%></td>
				</tr>
				<tr>
					<td>CONTACT NUMBER</td>
					<td><%=i.getContact_number()%></td>
				</tr>
				<tr>
					<td>EMAIL ID</td>
					<td><%=email.toLowerCase()%></td>
				</tr>
			</tbody>
		</table>

		<%
			}
		%>


		

		<div id="choose">
		<h3>you want to be employer or candidate</h3>
			<a href="employer.jsp"> employer</a> <br> <a
				href="candidate.jsp"> candidate</a>
		</div>

		<!-- candidate info -->
		
		<div id="candidate">

			<%
			for (Candidate c : candidate_list) {
				
			%>

			<table>
				<tr>
					<td>CANDIDATE ID</td>
					<td><%=c.getCandidate_id()%></td>
				</tr>
				<tr>
					<td>SELF DISCRIPTION</td>
					<td><%=c.getSelf_discription().toLowerCase()%></td>
				</tr>
				<tr>
					<td>UPI ID</td>
					<td><%=c.getUpi_id()%></td>
				</tr>
			</table>

			<%
			}
			%>
		</div>


		<!-- employer info -->

		<div id="employer">

			<%
			for (Employer e : employer_list) {
			%>


			<table>
				<tr>
					<td>JOB ID</td>
					<td><%=e.getJob_id()%></td>
				</tr>
				<tr>
					<td>JOB TITLE</td>
					<td><%=e.getJob_title().toUpperCase()%></td>
				</tr>
				<tr>
					<td>JOB DISCRIPTION</td>
					<td><%=e.getJob_discription()%></td>
				</tr>
				<tr>
					<td>DATE FROM</td>
					<td><%=e.getDate_from()%></td>
				</tr>
				<tr>
					<td>DATE TO</td>
					<td><%=e.getDate_to()%></td>
				</tr>
				<tr>
					<td>WAGES DAILY</td>
					<td><%=e.getWages_daily()%></td>
				</tr>
				<tr>
					<td>WAGES MONTHLY</td>
					<td><%=e.getWages_monthly()%></td>
				</tr>
				<tr>
					<td>PAYMENT METHOD</td>
					<td><%=e.getPayment_method()%></td>
				</tr>

			</table>
			<%
			}
			%>

		</div>



		<form action="DeleteAccount" method="get">
			delete bnana bacha h dont click it <input type="submit"
				value="delete your account">
		</form>
	</div>
</body>
<script>
	function employeeOrCandidate() {
		document.getElementById("main_content").style.display="block";
		document.getElementById("initial_button").style.display="none";
		
		var candidate=document.getElementById("candidate");
		var employer=document.getElementById("employer");
		var choose=document.getElementById("choose");
		
		if (<%=candidate_status%>== false && <%=employer_status%>== false) {
			employer.style.display = "none";
			candidate.style.display = "none";
			choose.style.display = "block";
			//alert("fa fa");
		}
		if (<%=candidate_status%>== true && <%=employer_status%>== false) {
			choose.style.display = "none";
			employer.style.display = "none";
			candidate.style.display="block";
			//alert("tr fa");
		}
		if (<%=candidate_status%>== false && <%=employer_status%> == true) {
			choose.style.display = "none";
			candidate.style.display = "none";
			employer.style.display = "block";
			//alert("fa tr");
		}
	}
</script>
</html>