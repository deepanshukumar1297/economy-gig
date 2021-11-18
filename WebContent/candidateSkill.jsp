<%@page import="pojo.CandidateSkill"%>
<%@page import="dao.DCandidateSkill"%>

<%@ page import="java.util.ArrayList"%>
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
<title>candidate skill</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body>
	<%
	int candidate_id = (Integer) session.getAttribute("candidate_id");
	DCandidateSkill dcandskill = new DCandidateSkill();
	ArrayList<CandidateSkill> canskill = dcandskill.fetch(candidate_id);
	ArrayList<String> skills = dcandskill.show(candidate_id);
	if (dcandskill.exception == true)
		response.sendRedirect("exception.jsp");
	%>

	<div class="container-fluid vh-100">

		<header class="row align-content-around">
			<div class="col text-center">
				<h3>GIG ECONOMY</h3>
			</div>
		</header>

		<main class="row bg-secondary" style="height: 84%;">

			<div class="col-2 bg-secondary">

				<div class="row align-content-between" style="height: 100%;">

					<div class="col-12 d-grid gap-2 mt-2">
						<a href="candidateProfile.jsp"
							class="btn btn-block btn-outline-light ">Profile</a> <a
							href="applyCandidate.jsp"
							class="btn btn-block btn-outline-light ">Apply for Jobs</a> <a
							href="pending.jsp" class="btn btn-block btn-outline-light ">Pending
							Jobs</a> <a href="approvedJobs.jsp"
							class="btn btn-block btn-outline-light ">Approved Jobs</a>
					</div>

					<div class="col-12 d-grid mb-2">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>
			<div class="col-10">
				<div class="row justify-content-around align-content-center"
					style="height: 100%; background-color: rgb(146, 160, 175);">

					<div class="col-5">

						<div class="row" style="background-color: rgb(78, 85, 92);">
							<div class="col text-monospace">
								<h4 class="text-center text-light my-2">Choose Skills
									Required For The Job</h4>
							</div>
						</div>
						<form action="SetCandidateSkill" method="post"
							onsubmit="getSkills()" class="row ">
							<div class="col table-responsive" style="height: 55vh;">
								<table class="table table-light table-borderless table-hover">
									<thead class="table-light " style="position: sticky; top: 0">
										<tr>
											<th>skills</th>
											<th>tick to add</th>
										</tr>
									</thead>

									<tbody>
										<% for (String s : skills) { %>
										<tr>
											<td><input type="text" value="<%=s.toUpperCase()%>"
												name="skills" class="form-control" readonly></td>
											<td><input type="checkbox" name="skill_status"
												class="form-check-input" id="skill"></td>
										</tr>
										<% } %>
									</tbody>

								</table>
								<input type="hidden" id="number" name="number">
							</div>
							<input type="submit" class="btn btn-success">
						</form>

					</div>


					<div class="col-5 ">

						<div class="row" style="background-color: rgb(78, 85, 92);">
							<div class="col text-monospace">
								<h4 class="text-center text-light my-2">Choose Skills
									Required For The Job</h4>
							</div>
						</div>

						<div class="col table-responsive" style="height: 55vh;">
							<table class="table table-light table-borderless table-hover">
								<thead class="table-light " style="position: sticky; top: 0">
									<tr>
										<th>already added skills</th>
										<th>delete</th>
									</tr>
								</thead>

								<tbody>
									<% for (int i=0; i < canskill.get(0).getSkills().length; i++) { %>
									<tr>
										<td><input type="text"
											value="<%=canskill.get(0).getSkills()[i]%>" name="skills"
											class="form-control" readonly></td>
										<td><button>delete</button></td>
									</tr>
									<% } %>
								</tbody>

							</table>
						</div>
						<input type="hidden" id="number" name="number">
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
	function getSkills() {
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
	}
</script>
</html>