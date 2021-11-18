<%@page import="dao.DCandidate"%>
<%@page import="pojo.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>candidate profile</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body>

	<%
	DInfo d=new DInfo();
	String email = (String) session.getAttribute("email");
	ArrayList<Info> info_list = d.fetch(email);
	if(d.exception==true)response.sendRedirect("exception.jsp");
    
	DCandidate dcandidate = new DCandidate();
	int candidate_id=dcandidate.candidateId(email);
	session.setAttribute("candidate_id", candidate_id);
	if(dcandidate.exception==true)response.sendRedirect("exception.jsp?error=j_pr_6");
    %>




	<div class="container-fluid vh-100">

		<header class="row align-content-around">
			<div class="col text-center">
				<h3>GIG ECONOMY</h3>
			</div>
		</header>

		<main class="row " style="height: 84%;">

			<div class="col-2 bg-secondary">

				<div class="row align-content-between" style="height: 100%;">

					<div class="col-12 d-grid gap-2 mt-2">
						<a href="applyCandidate.jsp" class="btn btn-block btn-outline-light ">Apply for Jobs</a> <a
							href="candidateSkill.jsp" class="btn btn-block btn-outline-light ">Add Skills</a> <a
							href="pending.jsp" class="btn btn-block btn-outline-light ">Pending Jobs</a> <a
							href="approvedJobs.jsp" class="btn btn-block btn-outline-light ">Approved Jobs</a>
					</div>

					<div class="col-12 d-grid mb-2">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>

			<div class="col-10 " style="background-color: rgb(146, 160, 175);">

				<%
							for (Info i : info_list) {
						%>
				<div class="row d-flex justify-content-center align-items-center" style="height:100%;">
					<div class="col-6">
						<div class="row">
							<div class="col text-center">
								<h4>
									<pre>welcome  <%=i.getName().toLowerCase()%></pre>
								</h4>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<table class="table">
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
							</div>
						</div>
					</div>

					<%
							}
						%>

				</div>

			</div>

		</main>

		<footer class="row align-content-around">
			<div class="col text-center">
				<h4>contact us</h4>
			</div>
		</footer>
	</div>

</body>
</html>