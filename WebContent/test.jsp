<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<body onload="preDefine()">
    <input type="checkbox" name="apply" onchange="increaseOrDecrease()">
    <input type="checkbox" name="apply" onchange="increaseOrDecrease()">
    <input type="checkbox" name="apply" onchange="increaseOrDecrease()">
    <input type="checkbox" name="apply" onchange="increaseOrDecrease()">

    <input type="button" onclick="applied()" id="applied">



</body>

<script>
    var nodelist = document.getElementsByName("apply");
    var butt=document.getElementById("applied");
    function applied() {
        var count = 0;
        for (let index = 0; index < nodelist.length; index++) {
            var flag = nodelist[index].checked;
            if (flag == true)
                count++;
        }
        if(count==0){
            butt.disabled=true;
            alert("please select jobs");
        }
    }
    function increaseOrDecrease() {
        butt.disabled=false;
        var count = 0;
        for (let index = 0; index < nodelist.length; index++) {
            var flag = nodelist[index].checked;
            if (flag == true)
                count++;
        }
        butt.value = "you have applied for "+count+" jobs";
    }
    function preDefine(){
        butt.value = "select the jobs you are interested in";
    }
</script>


</html>