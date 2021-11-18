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
<title>new account</title>
<link rel="stylesheet" href="css/constant.css">


</head>
<body >
        
      <div class="container-fluid vh-100">
        
          <header class="row align-content-around" >
            <div class="col text-center">
                <h3>GIG ECONOMY</h3>
            </div>
          </header>

          <main  class="row " style="height: 84%;">
            <form action="Accounts" method="get" onsubmit="return onlyOne();" class="row d-flex justify-content-center align-items-center bg-secondary">
                <div class="col-5 border rounded ">
    
                    <div class="row" style="background-color: rgb(78, 85, 92);">
                        <div class="col text-monospace">
                            <h3 class="text-center my-2">General Information</h3>
                        </div>
                    </div>
                    
                    <div class="row  my-4">
                        <div class="col">
                            <div class="form-group text-light">
                                <label for="name" class="text-reset">Name</label>
                                <input type="text"
                                	   id="name" 
                                	   name="name"
                                	   placeholder="Enter your Name" 
                                	   class="form-control" 
                                	   required>
                            </div>
                        </div>	
                    </div>
            		
            		<div class="row  my-4">
                        <div class="col">
                            <div class="form-group text-light">
                                <label for="aadhar" class="text-reset">Aadhar Card</label>
                                <input type="number" 
                                	   id="aadhar" 
                                	   name="aadhar_card"
                                	   placeholder="Aadhar card" 
                                	   class="form-control" 
                                	   required>
                            </div>
                        </div>	
                    </div>
            
            		<div class="row  my-4">
                        <div class="col">
                            <div class="form-group text-light">
                                <label for="email" class="text-reset">Contact Number</label>
                                <input type="tel" 
                                	   id="email" 
                                	   name="contact_number"
                                	   placeholder="+91 987654321" 
                                	   class="form-control" 
                                	   required>
                            </div>
                        </div>	
                    </div>

					<div class="row my-4 p-2">
						<div class="col form-check">
							<input class="form-check-input " type="checkbox" id="employer"
								onchange="check()"> <label
								class="form-check-label text-light" for="employer">
								Employer </label>
						</div>
					</div>
					
					<div class="row my-4 p-2">
						<div class="col form-check">
							<input class="form-check-input " type="checkbox" id="candidate"
								onchange="check()"> <label
								class="form-check-label text-light" for="candidate">
								Candidate </label>
						</div>
					</div>

					<input type="hidden" id="choose"  name="choose">
					

					<div class="row my-4">
                        <div class="col d-grid">
                            <input type="submit" value="submit" id="submit"
                            class="btn btn-block btn-outline-light">
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
<script type="text/javascript">
		function check(){
			var candidate=document.getElementById("candidate");
			var employer=document.getElementById("employer");
			var choose=document.getElementById("choose");
			
			if(candidate.checked==true && employer.checked==true){
				alert("you can only choose one");
				candidate.checked=false;
				employer.checked=false;
			}
			if(candidate.checked==true){
				choose.value="candidate";
			}
			if(employer.checked==true){
				choose.value="employer";
			}
		}
		function onlyOne(){
			var candidate=document.getElementById("candidate");
			var employer=document.getElementById("employer");
			if(candidate.checked==false && employer.checked==false){
				alert("you have to choose between employer and candidate");
				return false;
			}
			else {
				document.getElementById("submit").disabled=true;
				return true;
			}
		}

</script>
</html>