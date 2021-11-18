<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/constant.css">
	
	<title>Verification</title>
  </head>
    <body >
        
      <div class="container-fluid vh-100">
        
          <header class="row align-content-around" >
            <div class="col text-center">
                <h3>GIG ECONOMY</h3>
            </div>
          </header>

          <main class="row " style="height: 84%;">
            <form method="get" id="form-id" class="row d-flex justify-content-center align-items-center bg-secondary">
                <div class="col-5 border rounded ">
    
                    <div class="row" style="background-color: rgb(78, 85, 92);;">
                        <div class="col text-monospace">
                            <h3 class="text-center my-2">Verification</h3>
                        </div>
                    </div>
                    
                    <div class="row  my-4">
                        <div class="col">
                            <div class="form-group text-light">
                                <label for="code" class="text-reset">6 Digit Verification Code</label>
                                <input type="number" id="code" 
                                placeholder="Verification Code" class="form-control" required>
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
 <script>
        document.getElementById("form-id").addEventListener("submit",fire);
        function fire(e) {
        e.preventDefault();
        
        //creating url pattern
        var code=document.getElementById("code").value;  
        var url="Verification?code="+code;
       
        //create xhr object
        var xhr = new XMLHttpRequest();
        //console.log(xhr);
        
        xhr.open('GET',url,true);
    
        xhr.onload = function () {
            if (this.status == 200) {
                var res= this.responseText;
                if(res=="0")alert("your verification code is wrong... pls try again");
                else{
                	//document.getElementById("submit").disabled=true;
					var opened = window.open("");
					opened.document.write(res);              
				}
            }
            else if (this.status == 404) 
            {
                alert("something went wrong");		
            } 
        }
    
        xhr.send();
    }
    </script>
</html>