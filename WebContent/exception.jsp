<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page isErrorPage="true" %> 
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.css">  
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">  
	<title>exception</title>
	


  </head>
    <body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;">
        
        <!---------------    header     -------------->
        
        <div  class="container-fluid bg-info ">
            <div class="row align-content-around" style="height: 3rem;">
                <header class="col text-monospace lead font-weight-bold text-center text-light ">
                    GIG_ECONOMY
                </header>
            </div>
        </div>

        <!---------------    main     -------------->

        <main class="container">
            <div class="row">
                <div class="col d-flex align-items-center justify-content-center">
                    <span >
                        <h3 class="text-muted">Exception Occured Contact Admin . . .</h3>
                        <h5 id="write"></h5>
                    </span>
                </div>
            </div>
        </main>

        <!---------------    footer     -------------->

    <footer  class="container-fluid bg-info">
      <div class="row align-content-center justify-content-around text-monospace font-weight-bold text-dark" style="height: 3rem;">
          <div class="col-5">
              <a href="https://www.medicaps.ac.in"  class="text-reset">MEDICAPS-UNIVERSITY</a>
          </div>
          <div class="col-5">
              <span>
                  BY: 
              </span>
              <span>
                  <a href="#" target="_blank" class="text-reset"></a> |
                  <a href="#" target="_blank" class="text-reset"></a> |
                  <a href="#" target="_blank" class="text-reset"></a> |
                  <a href="#" target="_blank" class="text-reset"></a> |
                  <a href="#" target="_blank" class="text-reset"></a>
              </span>
          </div>
      </div>
  </footer>
    
  </body>
  <script>
    document.getElementById("write").innerHTML=new URLSearchParams(window.location.search).get("error");
    console.log(new URLSearchParams(window.location.search).get("error"));
    console.log("hello");
</script>
</html>