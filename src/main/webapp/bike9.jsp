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

    <link rel="stylesheet" href="bike1.css">
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

            <h2>Himalayan 450</h2>

            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consectetur sint quia saepe. Quos quam laboriosam ea perferendis iure fuga suscipit magni nesciunt velit, maiores vel?</p>

            <h3>Choose your colour</h3>

            <div class="colour-select">

                <div id="white"></div>

                <div id="brown"></div>

                <div id="darkblue"></div>

            </div>

        </div>

    </div>

    <script>

        let redBtn = document.getElementById("white");

        let blueBtn = document.getElementById("brown");

        let blackBtn = document.getElementById("darkblue");

        let bike = document.getElementById("bike");



        redBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Himalyan450/himalayan450kametwhite.png)";

        }

        blueBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Himalyan450/himalayan450kazabrown.png)";

        }

        blackBtn.onclick = function(){

            bike.style.backgroundImage = "url(project-images/Himalyan450/himalayan450slatepoppyblue.png)";

        }
        
    </script>
	<%@ include file="includes/footer.jsp"%>

</body>

</html>