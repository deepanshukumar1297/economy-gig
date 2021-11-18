<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/constant.css">
	
	<title>Login</title>
  </head>
    <body >
        
      <div class="container-fluid vh-100">
        
          <header class="row align-content-around" >
            <div class="col text-center">
                <h3>GIG ECONOMY</h3>
            </div>
          </header>

          <main class="row " style="height: 84%;">
            <form action="Mails" method="get" id="form" class="row d-flex justify-content-center align-items-center bg-secondary">
                <div class="col-5 border rounded ">
    
                    <div class="row" style="background-color: rgb(78, 85, 92);">
                        <div class="col text-monospace">
                            <h3 class="text-center my-2">LOGIN</h3>
                        </div>
                    </div>
                    
                    <div class="row  my-4">
                        <div class="col">
                            <div class="form-group text-light">
                                <label for="email" class="text-reset">Email</label>
                                <input type="email" id="email" name="email"
                                placeholder="Enter your Email id" class="form-control" required>
                            </div>
                        </div>	
                    </div>
            
                    <div class="row mb-4 mt-5">
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
</html>