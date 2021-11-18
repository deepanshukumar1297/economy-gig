
<%@ page import="java.util.ArrayList"%>
<%@page import="dao.DSkill"%>
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

<title>Create Jobs</title>
</head>
<body>

	<%
	DSkill dskill = new DSkill();
	ArrayList<String> skills = dskill.fetch();
	if (dskill.exception == true)
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
						<a href="employerProfile.jsp" class="btn btn-block btn-outline-light ">Profile</a> <a
							href="approve.jsp" class="btn btn-block btn-outline-light ">Approve Candidates </a> <a
							href="allJobs.jsp" class="btn btn-block btn-outline-light ">All Jobs</a> <a
							href="allCandidate.jsp" class="btn btn-block btn-outline-light ">All Candidates</a> 
					</div>

					<div class="col-12 d-grid mb-2">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>
			<form class="col-10" action="GetEmployee" method="get"
				onsubmit="getSkills()" id="form" style="background-color: rgb(146, 160, 175);">
				<div class="row justify-content-around  mt-4" style="height: 100%; ">
				
					<div class="col-5">
						<div class="row" style="background-color: rgb(78, 85, 92);">
							<div class="col text-monospace">
								<h4 class="text-center my-2 text-light">Job Information</h4>
							</div>
						</div>

						<div class="row  my-2">
							<div class="col">
								<label for="job_title" class="text-reset">Job Title</label> <input
									type="text" name="job_title" placeholder="enter job_title"
									id="job_title" class="form-control" required>
							</div>
						</div>


						<div class="row  my-2">
							<div class="col">
								<label for="job_disc" class="text-reset">Job Discription</label>
								<textarea rows="4" cols="50" name="job_discription"
									placeholder="enter job_discription" class="form-control"
									id="job_disc" required></textarea>
							</div>
						</div>


						<div class="row  my-2 form-group form-inline">
							<div class="col">
								<label for="daily_wages" class="text-reset">Daily Wages</label>
								<input type="number" name="wages_daily"
									placeholder="Daily wages" id="daily_wages" class="form-control"
									required>
							</div>
							<div class="col">
								<label for="monthly_wages" class="text-reset">Monthly
									Wages</label> <input type="number" name="wages_monthly"
									id="monthly_wages" placeholder="Monthly wages"
									class="form-control" required>
							</div>
						</div>


						<div class="row  my-3 form-group form-inline">
							<div class="col">
								<label for="from" class="text-reset">Job Starts From</label> <input
									type="date" name="date_from" placeholder="Job Starts from"
									id="from" class="form-control" required>
							</div>
							<div class="col">
								<label for="end" class="text-reset">Job End At</label> <input
									type="date" name="date_to" placeholder="job end at" id="end"
									required class="form-control">
							</div>
						</div>


						<div class="row  my-3">
							<div class="col">
								<label for="payment" class="text-reset">Payment Method</label> <select
									name="payment_method" class="custom-select" id="payment"
									required>
									<option hidden selected disabled>choose payment method</option>
									<option>cash</option>
									<option>upi</option>
								</select>
							</div>
						</div>
					</div>

					<div class="col-5 ">

						<div class="row" style="background-color: rgb(78, 85, 92);">
							<div class="col text-monospace">
								<h4 class="text-center text-light my-2">Choose Skills Required For The Job</h4>
							</div>
						</div>

						<div class="col table-responsive" style="height: 55vh;">
							<table class="table table-light table-borderless table-hover">
								<thead class="table-light " style="position: sticky;top: 0">
									<tr>
										<th>skills</th>
										<th>tick to add</th>
									</tr>
								</thead>

								<tbody>
									<%
										for (String s : skills) {
										%>
									<tr>
										<td><input type="text" value="<%=s.toUpperCase()%>"
											name="skills" class="form-control" readonly></td>
										<td><input type="checkbox" name="skill_status"
											class="form-check-input" id="skill"></td>
									</tr>
									<%
										}
										%>
								</tbody>

							</table>
						</div>
						<input type="hidden" id="number" name="number">
						<div class="row  my-4">
							<div class="col">
								<input type="submit" id="submit"
									class="btn btn-block btn-outline-light">
							</div>
						</div>
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
	document.getElementById("form").onsubmit = function() {
		document.getElementById("submit").disabled = true;
		var nodelist = document.getElementsByName("skill_status");
		document.getElementById("number").value = nodelist.length;
		for (let index = 0; index < nodelist.length; index++) {
			if (nodelist[index].checked == true)
				nodelist[index].value = "y";
			else {
				nodelist[index].checked = true;
				nodelist[index].value = "n";
			}
		}
	};
</script>
</html>