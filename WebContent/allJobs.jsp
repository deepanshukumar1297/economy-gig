<%@page import="pojo.JobSkill"%>
<%@page import="dao.DJobSkill"%>
<%@page import="pojo.Employer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DEmployer"%>
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
<link rel="stylesheet" href="css/constant.css">

<title>All Jobs</title>
</head>
<body>

	<%
	String email = (String) session.getAttribute("email");
	DEmployer demp = new DEmployer();
	DJobSkill djobskill = new DJobSkill();
	ArrayList<Employer> employer_list = demp.allJobs(email);
	if (demp.exception == true)
		response.sendRedirect("exception.jsp");
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
						<a href="employerProfile.jsp"
							class="btn btn-block btn-outline-light ">Profile</a> <a
							href="employer.jsp" class="btn btn-block btn-outline-light ">Create
							Jobs</a> <a href="approve.jsp"
							class="btn btn-block btn-outline-light ">Approve Candidates </a>
						<a href="allCandidate.jsp"
							class="btn btn-block btn-outline-light ">All Candidates</a>
					</div>

					<div class="col-12 d-grid mb-2">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>

			<div class="col-10 " style="background-color: rgb(146, 160, 175);">

				<div class="row d-flex justify-content-center align-items-center"
					style="height: 100%;">
					<div class="col-8">
						<div class="row">
							<div class="col text-center">
								<h4>
									<pre>All Jobs</pre>
								</h4>
							</div>
						</div>

						<div class="row">
							<div class="col table-responsive" style="height: 70vh;">
								<table class="table table-borderless table-light">
									<tbody>

										<%
										for (Employer emp : employer_list) {
										%>

										<tr>
											<td>
												<table
													class="table table-sm table-borderless table-hover table-dark m-2">
													<tbody>
														<tr>
															<td>Job Id</td>
															<td><input type="text" value="<%=emp.getJob_id()%>"
																name="job_id" disabled></td>
														</tr>
														<tr>
															<td>Job Name</td>
															<td><%=emp.getJob_title()%></td>
														</tr>
														<tr>
															<td>Description</td>
															<td><%=emp.getJob_discription()%></td>
														</tr>
														<tr>
															<td>Starts from</td>
															<td><%=emp.getDate_from()%></td>
														</tr>
														<tr>
															<td>Ends on</td>
															<td><%=emp.getDate_to()%></td>
														</tr>
														<tr>
															<td>Daily Wage</td>
															<td><%=emp.getWages_daily()%></td>
														</tr>
														<tr>
															<td>Monthly Wage</td>
															<td><%=emp.getWages_monthly()%></td>
														</tr>
														<tr>
															<td>Payment Method</td>
															<td><%=emp.getPayment_method()%></td>
														</tr>
														<tr>
															<td>Email Id</td>
															<td><%=emp.getEmail()%></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<ul class="list-group list-group-horizontal">
													<li class="list-group-item list-group-item-warning">Job
														Skills Required Are...</li>
													<%
													DJobSkill d = new DJobSkill();
													JobSkill f = d.fetchSkill(emp.getJob_id());
													for (String s : f.getSkills()) {
													%>
													<li class="list-group-item"><%=s%></li>
													<%
													}
													%>
												</ul>
											</td>
										</tr>
										<tr>
											<td>
												<div class="d-grid">
													<a href="" class="btn btn-block btn-outline-danger ">Delete</a>
												</div>
											</td>
										</tr>

										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
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