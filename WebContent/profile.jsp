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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/constant.css">

<title>Profile</title>
</head>
<body>

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
	int candidate_id;
	if (dcandidate.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_2");
	else {
		if (candidate_status == true) {
			candidate_list = dcandidate.fetch(email);
			if (dcandidate.exception == true)response.sendRedirect("exception.jsp?error=j_pr_3");
			candidate_id=dcandidate.candidateId(email);
			session.setAttribute("candidate_id", candidate_id);
			if(dcandidate.exception==true)response.sendRedirect("exception.jsp?error=j_pr_6");
		}
	}
	

	//if user is employer
	boolean employer_status = demployer.ping(email);
	if (demployer.exception == true)
		response.sendRedirect("exception.jsp?error=j_pr_4");
	%>

	<div class="container-fluid vh-100">

		<header class="row align-content-around">
			<div class="col text-center">
				<h3>GIG ECONOMY</h3>
			</div>
		</header>





		<main class="row " style="height: 84%;" id="initial_button">
			<div
				class="row d-flex justify-content-center align-items-center bg-secondary">
				<div class="col-4  d-grid">
					<button onclick="employeeOrCandidate()"
						class="btn btn-outline-light" type="button">
						<h4>welcome click me</h4>
					</button>
				</div>
			</div>

		</main>








		<main class="row " style="height: 84%;" id="choose">
			<div class="row d-flex justify-content-center align-items-center bg-secondary">
				<div class="col-5 border rounded">
					<div class="row" style="background-color: rgb(78, 85, 92);">
						<div class="col text-monospace">
							<h3 class="text-center my-2">You Want To Be Employer Or
								Candidate</h3>
						</div>
					</div>

					<div class="row  my-4">
						<div class="col d-grid">
							<a href="employer.jsp" class="btn btn-block btn-outline-light ">EMPLOYER</a>
							<a href="candidate.jsp" class="btn btn-block btn-outline-light ">CANDIDATE</a>
						</div>
					</div>

					<div style="display: none" id="main_content">

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
					</div>


				</div>
			</div>

		</main>




		<!-- 

		<div id="choose">
		<h3>you want to be employer or candidate</h3>
			<a href="employer.jsp"> employer</a> <br> <a
				href="candidate.jsp"> candidate</a>
		</div>
 -->
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


			<a href="applyCandidate.jsp">apply for jobs</a><br> <a
				href="candidateSkill.jsp">add skills</a><br> <a
				href="pending.jsp">pending jobs</a><br> <a
				href="approvedJobs.jsp">approved jobs</a><br>

		</div>


		<!-- employer info -->

		<div id="employer">

			<a href="employer.jsp">create jobs</a>
			<br> <a href="approve.jsp">approvejobs</a><br> 
			<a href="allJobs.jsp">all jobs</a><br> <a
				href="allCandidate.jsp">all candidates</a>

		</div>

		<a href="#">profile</a> <a href="#">signout</a>

		<form action="DeleteAccount" method="get">
			delete bnana bacha h dont click it <input type="submit"
				value="delete your account">
		</form>
	</div>
	<footer class="row align-content-around">
		<div class="col text-center">
			<h4>contact us</h4>
		</div>
	</footer>
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