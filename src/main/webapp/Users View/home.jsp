<!DOCTYPE html>
<%@page import="com.model.Users"%>
<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%

// to get the value from the session using users module
Users user = (Users)session.getAttribute("users");

//if session is null then send to login 

%>

<html lang="en">

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
        width: 90%;
        height: 550px;
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
            <li><a href="${pageContext.request.contextPath}/ViewProducts?displayMen=1" style="color: black;" class="menuu-link">Men</a>
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
            <li><a href="${pageContext.request.contextPath}/ViewProducts?displayWomen=1" style="color: black;">Women</a>
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
        	<form action="${pageContext.request.contextPath}/ViewProducts" method="get" style=" width: 500px;position: relative;display: flex;bottom: 0;left: 0;right: 0;margin: 20px auto;">
	            <input class="search-input" type="text" placeholder="Search for your products" name="productName">
	            <button class="search-btn"><i class="fas fa-search"></i></button>
			</form>
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
        	<form action="${pageContext.request.contextPath}/ViewProducts" method="get" style=" width: 500px;position: relative;display: flex;bottom: 0;left: 0;right: 0;margin: 20px auto;">
	            <input class="search-input" type="text" placeholder="Search for your products" name="productName">
	            <button class="search-btn"><i class="fas fa-search"></i></button>
			</form>
        </div>

    </div>
    <%} %>    
        
    <div class="new-product">
        <div id="slider" style="text-align: center;">
            <image id="image">
        </div>
        
    </div> 

    <div class="header">
        <div class="product-type">
            <p>
            <b>New Arrivals</b>
            </p>
        </div>
    
    </div>
    <div class="products">
        <div class="product-design">
            <img src="https://media.istockphoto.com/id/499691844/photo/gray-sweatpants-isolated.jpg?s=612x612&w=0&k=20&c=Uw_BoK3YAujo0g2seid2fb1jHSG3Fy0yKSn2ufwN7L8=" alt="">
            <h3>Drop Crotch Joggers</h3>
            <p>Joggers</p>
            <h4>Rs. 1200</h4>
        </div>

        <div class="product-design">
            <img src="https://t3.ftcdn.net/jpg/03/29/42/80/360_F_329428044_moJE1F5e98gv4iOGQOnRb9LhwMIf9PWl.jpg" alt="">
            <h3>Denim Jackets</h3>
            <p>Jackets</p>
            <h4>Rs. 5500</h4>
        </div>

         <div class="product-design">
            <img src="https://media.istockphoto.com/id/1365757342/photo/black-cargo-pants-isolated-on-white-background.jpg?b=1&s=170667a&w=0&k=20&c=DnubMu4Fhmw58c37bhE4llDx0hV1QRrPbk0YuJRdkhw=" alt="">
            <h3>Cargo Pants </h3>
            <p>Pants</p>
            <h4>Rs. 3200</h4>
            
        </div>
    
    </div>
    <div class="header">
        <div class="product-type"><p>
            <b>Nike Essentials</b></p>
        </div>
    </div>

     <div class="products">
        <div class="product-design">
            <a href="${pageContext.request.contextPath}/ViewProducts?displayMen=1"><img src="https://s3.amazonaws.com/media-ima002.globaltalentsystems.com/2595/800/2595_640142-444-8-25-2022-1648857706727.jpg" alt="Men" style="height:500px"></a>
            <h4>Male</h4>
        </div>

        <div class="product-design">
        <a href="${pageContext.request.contextPath}/ViewProducts?displayWomen=2">
            <img src="https://media.shilpaahuja.com/wp-content/uploads/2020/09/famous-fashion-model-karlie-kloss-project-runway.jpg" alt="Women" style="height:500px"> </a>  
            <h4>Female</h4>  
        </div>

        <div class="product-design">
            <img src="https://images.squarespace-cdn.com/content/v1/57bafe29ff7c50e4a7ffbf67/1562840538122-JKAEZNDGU40561WZLHUX/IMG_0268_web.jpg" alt="kids" style="height:500px">
            <h4>Kids</h4>
        </div>
    </div> 
    <br>
    <br>
    
    
    <div>
        <div class="logo-choose">
            <p style="margin-left:15px;">
            <b>Shop from Brands</b>
            </p>
        </div>
    
        <div class="logo">

            <div class="dior">
                <a href="${pageContext.request.contextPath}/ViewProducts?displayMen=1"><img src="https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F67979fc2-9bc6-4ef1-a91a-9f8129c57645_1500x1500.jpeg" alt=""></a>
                
            </div>
            <div class="dior">
                <a href=""><img src="https://static.vecteezy.com/system/resources/previews/010/994/431/original/puma-logo-black-symbol-with-name-clothes-design-icon-abstract-football-illustration-with-white-background-free-vector.jpg" alt=""></a>
                
            </div>
            <div class="dior">
                <a href=""><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Louis_Vuitton_logo_and_wordmark.svg/800px-Louis_Vuitton_logo_and_wordmark.svg.png" alt=""></a>
            </div>
            <div class="dior">
                <a href=""><img src="https://logowik.com/content/uploads/images/adidas-new-20225326.jpg" alt=""></a>
            </div>
            <div class="dior">
                <a href=""><img src="https://www.pngmart.com/files/17/Vector-Gucci-Logo-Transparent-PNG.png" alt=""></a>
            </div>
    </div>
    <br>
    <br>
   

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
<script>var i=0;
var x = ["../image_products/slider1.png","../image_products/slider2.png","../image_products/slider3.png"];

function slider(){
	var y = document.getElementById("image");
	y.src = x[i]; 
	if(i < 2){
		i++;
	}
	else{
		i = 0;
	}
	setTimeout("slider()", 5000);
}
window.onload = function(){slider()};
</script>
</body>

</html>