<%@page import="java.util.ArrayList"%>
<%@page import="dao.DJobApplied"%>
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
<title>approve jobs</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body onload="preDefine()">
	<%
	String email = (String) session.getAttribute("email");

	DJobApplied djob = new DJobApplied();

	ArrayList<ArrayList<String>> lists = new ArrayList<ArrayList<String>>();

	lists = djob.jobsToApprove(email);
	if (djob.exception == true)
		response.sendRedirect("exception.jsp");
	%>

	<div id="pending">no records to show</div>



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
							class="btn btn-block btn-outline-light ">Profile </a> <a
							href="employer.jsp" class="btn btn-block btn-outline-light ">Create
							Jobs</a> <a href="allJobs.jsp"
							class="btn btn-block btn-outline-light ">All Jobs</a> <a
							href="allCandidate.jsp" class="btn btn-block btn-outline-light ">All
							Candidates</a>
					</div>

					<div class="col-12 d-grid mb-2 gap-2">
						<input class="btn btn-success" type="button" onclick="applied()"
							id="approved">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>

			<form action="ApproveJob" method="post" id="form" class="col-10 "
				style="background-color: rgb(146, 160, 175);">


				<div class="row d-flex justify-content-center align-items-center"
					style="height: 100%;">
					<div class="col-9">
						<div class="row bg-secondary">
							<div class="col text-center">
								<h4 class="text-light">Jobs Approval</h4>
							</div>
						</div>


						<div class="row">
							<div class="col table-responsive" style="height: 70vh;">
								<table class="table table-bordered table-light">

									<thead class="table-dark " style="position: sticky; top: 0">
										<tr>
											<th>Job Id</th>
											<th>approve</th>
											<th>Jobs</th>
										</tr>
									</thead>
									<tbody>

										<%
										int count;
										if (lists.size() == 0)
											count = 0;
										else
											count = 1;

										for (ArrayList<String> entries : lists) {
										%>
										<tr>
											<td><input type="text" value="<%=entries.get(1)%>"
												name="job_id" readonly></td>
											<td><input type="checkbox" name="approve"
												onchange="increaseOrDecrease()" class="form-check-input">
											</td>
											<td>
												<table
													class="table table-sm table-bordered table-hover table-dark p-2">
													<tr>
														<td>Job Description</td>
														<td><%=entries.get(2)%></td>
													</tr>
													<tr>
														<td>Candidate Id</td>
														<td><input type="text" value="<%=entries.get(0)%>"
															name="candidate_id" readonly></td>
													</tr>
													<tr>
														<td>Candidate Description</td>
														<td><%=entries.get(3)%></td>
													</tr>
													<tr>
														<td>Required Skills</td>
														<td><%=entries.get(4)%></td>
													</tr>
													<tr>
														<td>Candidate Skills</td>
														<td><%=entries.get(5)%></td>
													</tr>


												</table>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>

						<input type="hidden" id="number" name="number">
					</div>
				</div>
			</form>

		</main>

		<footer class="row align-content-around">
			<div class="col text-center">
				<h4>contact us</h4>
			</div>
		</footer>
	</div>

</body>
<script>
	var nodelist = document.getElementsByName("approve");
	var butt = document.getElementById("approved");
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
			alert("please select jobs to approve");
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
		butt.value = "approve " + count + " jobs";
	}
	function preDefine() {
		var pending = document.getElementById("pending");
		var count =
<%=count%>
	;
		if (count == 0) {
			pending.style.display = "block";
			document.getElementById("form").style.display = "none";
			document.getElementById("approved").style.display = "none";
		} else {
			butt.value = "select the jobs to approve";
			pending.style.display = "none";
			document.getElementById("form").style.display = "block";
			document.getElementById("approved").style.display = "block";
		}

	}
</script>
</html>