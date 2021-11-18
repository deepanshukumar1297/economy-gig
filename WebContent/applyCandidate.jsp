<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="dao.DEmployer"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="pojo.Employer"%>
<%@page import="pojo.CandidateSkill"%>
<%@page import="dao.DCandidateSkill"%>

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
<title>job apply</title>
<link rel="stylesheet" href="css/constant.css">

</head>
<body onload="preDefine()">

	<%
	int candidate_id = (Integer) session.getAttribute("candidate_id");
	ArrayList<Employer> applied = new ArrayList<Employer>();

	//if candidate have not chose their skills then there should be choice to choose 
	DCandidateSkill dCandidateSkill = new DCandidateSkill();
	ArrayList<CandidateSkill> fetch = dCandidateSkill.fetch(candidate_id);
	if (dCandidateSkill.exception == true)
		response.sendRedirect("exception.jsp");
	else {
		if (fetch.get(0).getSkills().length == 0) {
			getServletContext().getRequestDispatcher("/candidateSkill.jsp").forward(request, response);
		} else {
			DEmployer demployer = new DEmployer();
			applied = demployer.apply(candidate_id);
			if (demployer.exception == true)
		response.sendRedirect("exception.jsp");
		}
	}

	int count = 0;
	for (Employer e : applied) {
		count++;
	}
	if (count == 0)
		out.println("no records to show");
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
						<a href="candidateProfile.jsp"
							class="btn btn-block btn-outline-light ">Profile</a> <a
							href="candidateSkill.jsp"
							class="btn btn-block btn-outline-light ">Add Skills</a> <a
							href="pending.jsp" class="btn btn-block btn-outline-light ">Pending
							Jobs</a> <a href="approvedJobs.jsp"
							class="btn btn-block btn-outline-light ">Approved Jobs</a>
					</div>

					<div class="col-12 d-grid mb-2 gap-2">
						<input class="btn btn-success" type="button" onclick="applied()" id="applied">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>

			<div class="col-10 " style="background-color: rgb(146, 160, 175);">

				<div class="row d-flex justify-content-center align-items-center"
					style="height: 100%;">
					<div class="col-9">
						<div class="row">
							<div class="col text-center">
								<h3 class="text-light">
									<pre>Apply For Jobs</pre>
								</h3>
							</div>
						</div>




						<div class="row">
							<form action="ApplyCandidate" method="post" id="form"
								class="col table-responsive" style="height: 70vh;">
								<table class="table table-light ">
									<tbody>

										<%
										for (Employer emp : applied) {
										%>
										<tr>
											<td>job id = <input type="text"
												value="<%=emp.getJob_id()%>" name="job_id">
											</td>
											<td><input type="checkbox" name="apply"
												onchange="increaseOrDecrease()" class="form-check-input"></td>
											<td>
												<table
													class="table table-sm table-borderless table-hover table-dark p-2">
													<tr>
														<td>Job Name</td>
														<td><%=emp.getJob_title()%></td>
													</tr>
													<tr>
														<td>Job Description</td>
														<td><%=emp.getJob_discription()%></td>
													</tr>
													<tr>
														<td>Starts From</td>
														<td><%=emp.getDate_from()%></td>
													</tr>
													<tr>
														<td>Job ends on</td>
														<td><%=emp.getDate_to()%></td>
													</tr>
													<tr>
														<td>Wages daily</td>
														<td><%=emp.getWages_daily()%></td>
													</tr>
													<tr>
														<td>Wages Monthly</td>
														<td><%=emp.getWages_monthly()%></td>
													</tr>
													<tr>
														<td>Employer Email Id</td>
														<td><%=emp.getEmail()%></td>
													</tr>
													<tr>
														<td>Payment Method</td>
														<td><%=emp.getPayment_method()%></td>
													</tr>

												</table>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

								<input type="hidden" id="number" name="number">

							</form>


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
<script>
	var nodelist = document.getElementsByName("apply");
	var butt = document.getElementById("applied");
	function applied() {
		var count = 0;
		for (let index = 0; index < nodelist.length; index++) {
			var flag = nodelist[index].checked;
			if (flag == true) {
				count++;
				nodelist[index].value = "y";
			} else {
				flag = true;
				nodelist[index].value = "n";
			}
		}
		if (count == 0) {
			butt.disabled = true;
			alert("please select jobs");
		} else {
			document.getElementById("number").value = nodelist.length;
			document.getElementById("form").submit();
		}
	}
	function increaseOrDecrease() {
		butt.disabled = false;
		var count = 0;
		for (let index = 0; index < nodelist.length; index++) {
			var flag = nodelist[index].checked;
			if (flag == true)
				count++;
		}
		butt.value = "apply for " + count + " jobs";
	}
	function preDefine() {
		butt.value = "select the jobs ";
	}
</script>


</html>