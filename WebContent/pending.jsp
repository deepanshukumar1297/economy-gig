<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@page import="pojo.Employer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DJobApplied"%>
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
<title>pending jobs</title>
<link rel="stylesheet" href="css/constant.css">
</head>
<body onload="preDefine()">
	<%
	int candidate_id = (Integer) session.getAttribute("candidate_id");

	DJobApplied djob = new DJobApplied();
	ArrayList<Employer> pending = new ArrayList<Employer>();

	pending = djob.pending(candidate_id, false);
	if (djob.exception == true)
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
						<a href="candidateProfile.jsp"
							class="btn btn-block btn-outline-light ">Profile</a> <a
							href="candidateSkill.jsp"
							class="btn btn-block btn-outline-light ">Add Skills</a> <a
							href="applyCandidate.jsp"
							class="btn btn-block btn-outline-light ">Apply for Jobs</a> <a
							href="approvedJobs.jsp" class="btn btn-block btn-outline-light ">Approved
							Jobs</a>
					</div>

					<div class="col-12 d-grid mb-2 gap-2">
						<input class="btn btn-success" type="button" onclick="applied()"
							id="deleted">
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
									<pre>Pending Jobs</pre>
								</h3>
							</div>
						</div>




						<div class="row">
							<form action="DeletePendingJob" method="post" id="form"
								class="col table-responsive" style="height: 70vh;">
								<table class="table table-light ">
									<tbody>

										<%
										int count = 0;

										for (Employer emp : pending) {
										%>
										<tr>
											<td>job id = <input type="text"
												value="<%=emp.getJob_id()%>" name="job_id">
											</td>
											<td><input type="checkbox" name="delete"
												onchange="increaseOrDecrease()"> <label for="delete">
													delete</label></td>
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
										count++;
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



<div id="pending">no records to show</div>



</body>
<script>
	var nodelist = document.getElementsByName("delete");
	var butt = document.getElementById("deleted");
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
			alert("please select jobs to delete");
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
		butt.value = "delete " + count + " jobs";
	}
	function preDefine() {
		var pending = document.getElementById("pending");
		var count =
<%=count%>
	;
		if (count == 0) {
			pending.style.display = "block";
			document.getElementById("form").style.display = "none";
			document.getElementById("deleted").style.display = "none";
		} else {
			butt.value = "select the jobs to delete";
			pending.style.display = "none";
			document.getElementById("form").style.display = "block";
			document.getElementById("deleted").style.display = "block";
		}

	}
</script>
</html>