<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




	<form method="get" id="form-id">

		<div >Enter the 6 digit verification code</div>
		<input type="text" id="code" required /> 
		<input type="submit"/>

	</form>
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