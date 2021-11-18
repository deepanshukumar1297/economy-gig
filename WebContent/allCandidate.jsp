<%@page import="java.util.Map.Entry"%>
<%@page import="dao.DJobApplied"%>
<%@page import="java.util.Map"%>
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
<title>all candidates</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body>
	<%
	String email = (String) session.getAttribute("email");
	DEmployer demp = new DEmployer();
	ArrayList<Employer> list = demp.allJobs(email);
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
							class="btn btn-block btn-outline-light ">Profile </a> <a
							href="employer.jsp" class="btn btn-block btn-outline-light ">Create
							Jobs</a> <a href="allJobs.jsp"
							class="btn btn-block btn-outline-light ">All Jobs</a> <a
							href="approve.jsp" class="btn btn-block btn-outline-light ">Approve Candidates</a>
					</div>

					<div class="col-12 d-grid mb-2 gap-2">
						<button class="btn btn-danger" type="button">Button</button>
					</div>

				</div>

			</div>

			<div class="col-10 " style="background-color: rgb(146, 160, 175);">


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
								<table>
									<tbody>

										<%
            for(Employer emp:list){
                
        %>

										<tr>
											<td>
												<h2>JOB DETAILS</h2>

												<ul>
													<li>job id = <input type="text"
														value="<%= emp.getJob_id() %>" name="job_id">
													</li>

													<li><span>job name </span>= <span><%= emp.getJob_title() %></span>
													</li>
													<li><span>job discription</span> =<span><%= emp.getJob_discription() %></span>
													</li>
												</ul>
											</td>
										</tr>

										<tr>
											<td>
												<div>
													<%
                        ArrayList<Map<String, String>> lists = new DJobApplied().allCandidate(emp.getJob_id());
                         for(Map<String, String> hashMap:lists )
                            for (Entry<String, String> me : hashMap.entrySet()) {
                    %>
                    									<div>
													<span> <%=me.getKey() %></span>=<span><%= me.getValue() %></span>
													</div>
													<%
                            }
                    %>
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
</html>