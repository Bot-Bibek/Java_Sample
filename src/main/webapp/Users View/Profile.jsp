<%@page import="com.model.Users"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

Users user = (Users)session.getAttribute("users"); // to get the value from the session using users module




	if (user == null){
		response.sendRedirect("Login.jsp");
	}else{
		System.out.println("The user session is used by : " + user);
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="styles.css">
   <style>
   
    /* Navbar from session  */
    @import url('https://fonts.googleapis.com/css2 family=Montserrat:wght@500&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');


    *{
        box-sizing: border-box;
        margin: 0;
        padding:0;
        
    }

    .hamrologo{
        font-family: 'Permanent Marker', cursive;
        color:#edf0f1;
        font-size: 25px;
    }

    li, a, button{
        font-family: "Monsserrat", sans-serif;
        font: weight 500px;
        font-size: 1rem;
        color:#edf0f1;
        text-decoration: none;
    }

    .hamroHeader{
        display:flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 3%;
        background-color: #24242A;

    }


    .nav-linkshamro{
        list-style: none;
        
    }

    .nav-linkshamro li{
        display:inline-block;
        padding:0 20px;
    }

    .nav-linkshamro li a {
        transition: all 0.3s ease 0s;
    }

    .nav-linkshamro li a:hover{
        color:#35b4ae

    }



    /* Search bar */

    .search-box {
    width: 500px;
    position: relative;
    display: flex;
    bottom: 0;
    left: 0;
    right: 0;
    margin: 20px auto;
    }

    .search-input {
    width: 100%;
    font-family: 'Montserrat', sans-serif;
    font-size: 16px;
    padding: 15px 45px 15px 15px;
    background-color: #eaeaeb;
    color: #6c6c6c;
    border-radius: 6px;
    border:none;
    outline-style: none;
    
    transition: all .4s;
    }



    .search-btn {
    background-color: transparent;
    font-size: 18px;
    padding: 6px 9px;
    margin-left:-45px;
    border:none;
    color: #6c6c6c;
    transition: all .4s;
    z-index: 10;
    }

    .search-btn:hover {
    transform: scale(1.2);
    cursor: pointer;
    color: black;
    }

    /* Profile button   */
    .profile_button{
        padding:10px 40px 10px 20px;
        font-size : 0.9rem;
        background-color:rgb(196, 220, 229);
        border:none;
        border-radius:25px;
        cursor:pointer;
        color:black;
        font-weight:500;
        margin-left:10px;
        
    }
    .Logout_button{
        padding:10px 15px;
        font-size : 0.9rem;
        background-color:rgb(196, 220, 229);
        border:none;
        border-radius:25px;
        cursor:pointer;
        color:black;
        font-weight: 500;
        margin-left:10px;

    }
    .profile_image{
        border-radius: 50%;
        display:block;
        width:175px;
        height:175px;
        margin:5px auto;
        
    }

    /* session image div */
    .session{
    width:200px;
    position: relative;
    padding-left:50px;
    }
    .session_image{
    height:30px;
    width:30px;
    border-radius: 50%;
    cursor:pointer;


    }
    .session_imagediv{
    height:30px;
    width:30px;
    position:absolute;
    top:20px;
    right:55px;

    }
    
/* Main */
.main {
    margin-top: 2%;
    margin-left: 29.5%;
    font-size: 28px;
    padding: 0 10px;
    width: 58%;
}

.main h2 {
    color: #222c2f;
    font-family: 'Open Sans', sans-serif;
    font-size: 32px;
    margin-bottom: 10px;
}

.main .card {
    background-color: #ECF2FF;
    border-radius: 18px;
    box-shadow: 1px 1px 8px 0 grey;
    height:auto;
    margin-bottom: 20px;
    width:70%;
    padding: 20px 0 20px 50px;
}

.main .card table {
    border: none;
    font-size: 16px;
    height: 270px;
    width: 80%;
}

.profile_main_image{
  border-radius:50%;
  height:250px;
  width:250px;
  margin:10px 105px 0px 140px;
}
.Edit{
  width:90%;
  font-size:1.4rem;
  background-color:#21bac5;
  color:white;
  padding:10px 0px;
  border-radius:10px;
  margin-top:15px;
  cursor: pointer;
  border: none;
  border: #03585e;
  
}



   </style>
</head>
<body>
    <div class="nav">
        <header class="hamroHeader">
            
            <h3 class="hamrologo">The Mesh </h3>
            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/ViewProducts?allProducts=display">Products</a></li>
                    <li><a href="Carts.jsp">Carts</a></li>
					<li><a href="Orders.jsp">Orders</a></li>
                    <li><a href="Profile.jsp">Profile</a></li>

                </ul>
            </div>
            <div class="nav-linkshamro">
                <button class = "Logout_button"><a style="text-decoration:none; color:black;" href="${pageContext.request.contextPath}/UserLogout">Log Out</a> </button>
            
                <div class = "session_imagediv">
                    <img  class = "session_image" src ="../image_users/<%=user.getImage_user() %>" alt = "user Profile pic">
                </div> 
                <button class = "profile_button"><%= user.getUser_name() %></button>
            
            </div>
            
    
        </header>

    </div>
    


    <!-- now the Profile page begins    -->
    <!-- Main -->
    <div class="main">
        <h2>Your Profile</h2>
        <div class="card">
                <img src = "../image_users/<%=user.getImage_user() %>" alt = "profileimage" class = "profile_main_image">

            <div class="card-body">
                
                <table>
                    <tbody>
                    	 <h2 style = "margin-left:160px;"><%= user.getUser_name() %></h2>
                        <tr>
                            <td><b>Name</b></td>
                            <td>: </td>
                            <td><%= user.getUser_name() %></td>
                        </tr>
                        <tr>
                            <td><b>Email</b></td>
                            <td>: </td>
                            <td><%= user.getEmail()%></td>
                        </tr>
                        <tr>
                            <td><b>Address</b></td>
                            <td>: </td>
                            <td><%= user.getUser_address()%></td>
                        </tr>
                        <tr>
                            <td><b>Phone</b></td>
                            <td>: </td>
                            <td><%= user.getUser_phone()%></td>
                        </tr>
                        <tr>
                            <td><b>Gender</b></td>
                            <td>: </td>
                            <td> <%= user.getGender()%></td>
                        </tr>
                       
                    </tbody>
                </table>
              <button id = "openModal2" class = "Edit">Edit Profile</button>
            </div>
        </div>

    </div>
    
    
     <!-- Updating the details form -->
	
	<!-- Modal 2 Content/Box -->
	<div id="myModal2" class="modal">
	  	<div class="modal-content">
	
		    <div class="form_modal" style = "margin-top:50px;">
		      <form action="${pageContext.request.contextPath}/UpdateUserDetails" method = "post" enctype="multipart/form-data">
		        <h1 style="color:black;" >Update Profile</h1>
		        <label for="user_name">User Name : </label>
		        <input type="text" class="textfield" name ="user_name" value ="<%= user.getUser_name()%>">
		        <br>
		  
		        <label for="gender">Gender : </label>
		        <input type="text" class="textfield" name = "gender" value ="<%= user.getGender()%>">
		        <br>
		  
		        <label for="address">Address : </label>
		        <input type="text" class="textfield" name = "address" value ="<%= user.getUser_address()%>">
		        <br>
		  
		        <label for="phoneno">Phone No : </label>
		        <input type="text" class="textfield" name = "phone_no" value ="<%= user.getUser_phone()%>">
		        <br>
		  
		        <label for="password">Password : </label>
		        <input type="password" class="textfield" name = "password" value ="<%= user.getPassword()%>">
		        <br>
		  
		        <label for="image">Profile Image:</label>
		        <input type="file" style="margin:10px;" name = "user_image" >
		        <br>
		  
		        
		        <input type="submit" class = "green_but" value = "Save Changes">
		      </form>
		    </div>
    <br>
    <button id="closeModal2" class = "red_but">Close</button>
  		</div>
  
  
	</div>





    <!-- the profile end here -->
    <footer class="footer">
        <div class="footer-part">
            <div class="all-footer">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">our services</a></li>
                        <li><a href="#">privacy policy</a></li>
                        <li><a href="#">affiliate program</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">shipping</a></li>
                        <li><a href="#">returns</a></li>
                        <li><a href="#">order status</a></li>
                        <li><a href="#">payment options</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>online shop</h4>
                    <ul>
                        <li><a href="#">watch</a></li>
                        <li><a href="#">bag</a></li>
                        <li><a href="#">shoes</a></li>
                        <li><a href="#">dress</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
   </footer>

    
    <!-- for the modal -->
   
	
			

	
	
	
	<script>
	  // Get the modal
	var modal = document.getElementById("profile-modal");
	
	// Get the button that opens the modal
	var btn = document.querySelector("button");
	
	// Get the <span> element that closes the modal
	var span = document.querySelector(".close");
	
	// When the user clicks the button, open the modal 
	function openModal() {
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	function closeModal() {
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	var btn = document.getElementById("openModal2");

	// Get the second modal
	var modal2 = document.getElementById("myModal2");

	// When the user clicks the button, open the second modal
	btn.onclick = function() {
	  modal2.style.display = "block";
	}

	// Get the close button for the second modal
	var closeBtn = document.getElementById("closeModal2");

	// When the user clicks the close button, hide the second modal
	closeBtn.onclick = function() {
	  modal2.style.display = "none";
	} 
	
	</script>
    
</body>
</html>