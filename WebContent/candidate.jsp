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
<title>candidate</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body>

	<div class="container-fluid vh-100">

		<header class="row align-content-around">
			<div class="col text-center">
				<h3>GIG ECONOMY</h3>
			</div>
		</header>

		<main class="row " style="height: 84%;">
			<form enctype="multipart/form-data" action="GetCandidate"
				method="post" id="form"
				class="row d-flex justify-content-center align-items-center bg-secondary">

				<div class="col-5 border rounded ">

					<div class="row" style="background-color: rgb(78, 85, 92);">
						<div class="col text-monospace">
							<h3 class="text-center my-2">Personal Information</h3>
						</div>
					</div>

					<div class="row  my-3">
						<div class="col">
							<label for="emage" class="text-reset">Profile Image</label> <input
								type="file" alt="profile_image" name="image" accept="image/*"
								id="image" class="form-control" required>
						</div>
					</div>


					<div class="row  my-3">
						<div class="col">
							<label for="self" class="text-reset">Self Discription</label>
							<textarea rows="4" cols="50" name="self_discription" id="self"
								class="form-control" required></textarea>
						</div>
					</div>


					<input type="hidden" name="country" id="countryId" value="IN" />

					<div class="row  my-3">
						<div class="col">
							<label for="stateId" class="text-reset">State</label> <select
								name="state" class="states order-alpha" id="stateId"
								class="custom-select" required>
								<option value="">Select State</option>
							</select>
						</div>
					</div>



					<div class="row  my-3">
						<div class="col">
							<label for="cityId" class="text-reset">City</label> <select
								name="city" class="cities order-alpha" id="cityId"
								class="custom-select" required>
								<option value="">Select City</option>
							</select>
						</div>
					</div>



					<div class="row  my-3">
						<div class="col">
							<label for="village" class="text-reset">Village</label> <input
								type="text" name="village" placeholder="enter you village"
								id="village" class="form-control" required>
						</div>
					</div>

					<div class="row my-3">
						<div class="col d-grid">
							<input type="submit" id="submit"
								class="btn btn-block btn-outline-light">
						</div>
					</div>


				</div>
			</form>
		</main>
		<div id="test"></div>
		<footer class="row align-content-around">
			<div class="col text-center">
				<h4>contact us</h4>
			</div>
		</footer>
	</div>

</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//geodata.solutions/includes/statecity.js"></script>

</html>