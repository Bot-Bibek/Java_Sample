<!DOCTYPE html>
<%@page import="com.model.Users"%>
<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<html lang="en">

<%
Users user = (Users)session.getAttribute("users");
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="stylehere.css">
   <style>
    #image{
        border-radius: 0px;
        border-style: none;
        width: 100%;
        height: 450px;
    }

    .logo{
        display: flex;
        justify-content: space-between;
        width: 95%;
        margin: 0px auto;

    }
    .logo img{
        width: 150px;
        height: 150px;
    }
      .prada img{
        width: 225px;
      }  
    .dior img{
        width: 198px;
        height: 164px;
    }
    .logo-choose p{
        font-size: 24px;
        padding-left: 20px;
        margin: 20px 0 10px 0;
    }

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
    .nav-linkshamro li:hover .sub-menu{
        display: block;
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
    /* left:50px;
    top:3px;
    cursor: pointer;*/

    }
    .session_imagediv{
    height:30px;
    width:30px;
    position:absolute;
    top:20px;
    right:50px;
    }





	*{
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.header{
    max-height: 100px;
}
body{
  height: 100vh;
  background: #fff;
  background-size: 400%;
}
#error-page{
  top: 10%;
  left: 15%;
  right: 15%;
  bottom: 10%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #fff;
  box-shadow: 0px 5px 10px rgba(0,0,0,0.1);
}
#error-page .content{
  max-width: 600px;
  text-align: center;
}
.content h2.header{
  font-size: 9vw;
  line-height: 1em;
  position: relative;
}
.content h2.header:after{
  position: absolute;
  content: attr(data-text);
  top: 20;
  left: 0;
  right: 0;
  background: -webkit-repeating-linear-gradient(-45deg, #292e32, #23282b, #000000, #3e2e2d, #161218, #525b60, #2a282b);
  background-size: 400%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  text-shadow: 1px 1px 2px rgba(255,255,255,0.25);
  animation: animate 10s ease-in-out infinite;
}
@keyframes animate {
  0%{
	background-position: 0 0;
  }
  25%{
	background-position: 100% 0;
  }
  50%{
	background-position: 100% 100%;
  }
  75%{
	background-position: 0% 100%;
  }
  100%{
	background-position: 0% 0%;
  }
}
.content h4{
  font-size: 3em;
  margin-bottom: 20px;
  text-transform: uppercase;
  color: #000;
  font-size: 2em;
  max-width: 600px;
  position: relative;
}
.content h4:after{
  position: absolute;
  content: attr(data-text);
  top: 0;
  left: 0;
  right: 0;
  text-shadow: 1px 1px 2px rgba(255,255,255,0.4);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.content p{
    margin-bottom: 5px;
  font-size: 1.5em;
  color: #0d0d0d;
}
.content .btns{
  margin: 0 0 25px 0;
  display: inline-flex;
}
.content .btns a{
  display: inline-block;
  margin: 0 10px;
  text-decoration: none;
  border: 2px solid #69a6ce;
  color: #69a6ce;
  font-weight: 500;
  padding: 10px 25px;
  border-radius: 25px;
  text-transform: uppercase;
  transition: all 0.3s ease;
}
.content .btns a:hover{
  background: #69a6ce;
  color: #fff;
   </style>
</head>

<body> 

    <% if (user == null){ %>
   <div class="nav">
        <header class="hamroHeader">
            
            <h3 class="hamrologo">The Mesh </h3>


            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/ViewProducts?allProducts=display">Products</a></li>
                    <li><a href="#">About Us</a></li>

                    
                </ul>
            </div>
            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">

                    <li><a href="Login.jsp">Login</a></li>
                    <li><a href="SignUp.jsp">SignUp</a></li>
                    
                </ul>
            </div>            

        </header>
        <div class="nav-linkshamro" style ="position: absolute; left: 200px; top: 100px;">
        <ul class="main-menu">
            <li><a href="" style="color: black;">Men</a>
                <div class="sub-menu">
                    <h4>Category</h4>
                    <ul>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="" style="color: black;">Women</a>
                <div class="sub-menu">
                    <h4>Category</h4>
                    <ul>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        </div>

        <div class="search-box">
            <input class="search-input" type="text" placeholder="Search for your products">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>

    </div>
    <%}else{ %>
   <div class="nav">
        <header class="hamroHeader">
            
            <h3 class="hamrologo">The Mesh </h3>


            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">
                    <li><a href="#">Home</a></li>
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
	                <button class = "profile_button"onclick="openModal()"><%= user.getUser_name() %></button>
	            
	            </div>

        </header>
        <div class="nav-linkshamro" style ="position: absolute; left: 200px; top: 100px;">
        <ul class="main-menu">
            <li><a href="${pageContext.request.contextPath}/ViewProducts?displayMen=1" style="color: black;">Men</a>
                <div class="sub-menu">
                    <h4>Category</h4>
                    <ul>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="${pageContext.request.contextPath}/ViewProducts?displayWomen=2" style="color: black;">Women</a>
                <div class="sub-menu">
                    <h4>Category</h4>
                    <ul>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                        <li><a href="">link</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        </div>

        <div class="search-box">
            <input class="search-input" type="text" placeholder="Search for your products">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>

    </div>
    <%} %>    

    
<!-- 
    <div class="header">
        <div class="product-type">
            <p>
            <b>New Arrivals</b>
            </p>
        </div>
    
    </div>
    
    <div class="products">
        <div class="product-design">
            <img src="" alt="">
            <h4>Name of Product</h4>
            <p>Category Name</p>
            <h4>$200</h4>
            <button onclick="addCart(1)">Add to cart</button>
        </div>

        <div class="product-design">
            <img src="" alt="">
            <h4>Name of Product</h4>
            <p>Category Name</p>
            <h4>$200</h4>
            <button onclick="addCart(1)">Add to cart</button>
        </div>

         <div class="product-design">
            <img src="" alt="">
            <h4>Name of Product</h4>
            <p>Category Name</p>
            <h4>$200</h4>
            <button onclick="addCart(1)">Add to cart</button>
        </div>
    
    </div> -->
    <div id="error-page">
            <div class="content">
               <h2 class="header" data-text="Oops!">
               </h2>
               <h4 style="margin-top: 210px;">
                   "search" is not available
               </h4>
               <p>
                  Search different products
               </p>
               <p>OR</p>
               <div class="btns">
                  <a href="home.jsp">return home</a>
               </div>
            </div>
         </div>
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
   <script src="./script.js"></script>
   <script src="java/gotop.js"></script>

</body>

</html>