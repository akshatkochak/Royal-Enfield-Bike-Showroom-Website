<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.showroom.model.*"%>
    
    <%User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    	request.setAttribute("auth", auth);
    } %>

<!DOCTYPE html>


<html lang="en">

<head>

    <meta charset="UTF-8">

    <link rel="stylesheet" href="bike3.css">
    <%@ include file="includes/head.jsp"%>
    
</head>

<body>
	<%@ include file="includes/navbar.jsp"%>

    <div class="container1" id="bike">

        <nav class="nav1">

            <img src="project-images/three/royal.png" class="logo">

            <div class="btn-1" style="display: flex ; flex-direction:column;">
		            <a href="register.jsp" class="btn" style="margin-bottom:10px;border-radius:0px;" >Test Drive</a>
		            <a href="bikeEmi.jsp" class="btn" style="margin-bottom:10px;border-radius:0px;" >Finance</a>
		            
            </div>
        </nav>

        <div class="content">

            <h2>Hunter350</h2>

            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consectetur sint quia saepe. Quos quam laboriosam ea perferendis iure fuga suscipit magni nesciunt velit, maiores vel?</p>

            <h3>Choose your colour</h3>

            <div class="colour-select">

                <div id="red"></div>

                <div id="silver"></div>

                <div id="royalblue"></div>

            </div>

        </div>

    </div>

    <script>

        let redBtn = document.getElementById("red");

        let blueBtn = document.getElementById("silver");

        let blackBtn = document.getElementById("royalblue");

        let bike = document.getElementById("bike");



        redBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Hunter350/hunter350rebelred.jpeg)";

        }

        blueBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Hunter350/hunter350factorysilver.jpeg)";

        }

        blackBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Hunter350/hunter350rebelblue.jpeg)";

        }

    </script>
	<%@ include file="includes/footer.jsp"%>

</body>

</html>