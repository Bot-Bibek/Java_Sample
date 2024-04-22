<%@page import="com.model.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	    
<%
	Users user = (Users) session.getAttribute("users");
  List<Products> products = (List<Products>) request.getAttribute("products");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link rel="stylesheet" href="Users View/stylehere.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

<style>

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

.listing-section, .cart-section {
	width: 100%;
	float: left;
	padding: 1%;
	border-bottom: 0.01em solid #dddbdb;
}
 
.product3 {
	float: left;
	height:fit-content;
	width: 23%;
	border-radius: 2%;
	margin: 1%;
	overflow-x: hidden;
}
.image-box3 {
	width: 493px;
	overflow: hidden;
	border-radius: 2% 2% 0 0;
	height:470px;
}

.images3 {
	height: 29em;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	border-radius: 2% 2% 0 0;
	transition: all 1s ease;
	-moz-transition: all 1s ease;
	-ms-transition: all 1s ease;
	-webkit-transition: all 1s ease;
	-o-transition: all 1s ease;
	margin-top:10px;
}

.images3:hover {
	transform: scale(1.1);
	overflow: hidden;
	border-radius: 2%;
}

/* IMAGES */
/* #image-1 {
	background-image: url("https://sc01.alicdn.com/kf/UT8.CaXX2NXXXagOFbXC/fresh-navel-oranges.jpg");
	
	}
 */
.text-box3 {
	width: 100%;
	float: left;
	border-radius: 0 0 2% 2%;
	padding: 1em;
}

.cat3 {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 1em;
	text-transform: uppercase;
	margin: 0.2em auto;
}

.quantity3 {
	clear: left;
	width: 100%;
	font-size: 12px;
	color: Grey;
}

.item3, .price3 {
	clear: left;
	width: 100%;
	text-align: center;
}

.price3 {
	color: Red;
}

.description3{
	float: left;
	clear: left;
	width: 100%;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	font-size: 1em;
	text-align: center;
	margin: 0.2em auto;
}

.text-box input {
	width: 15%;
	clear: none;
}

.text-box button {
	margin-top: 1em;
}

.button3 {
	padding: 2%;
	background-color: orange;
	border: none;
	border-radius: 2%;
}

.button3:hover {
	bottom: 1.3em;
}

.button3:focus {
	outline: 0;
}

.button3:active {
	bottom: 0;
	background-color: #fdf;
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
                    <li><a href="Users View/home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/ViewProducts?allProducts=display">Products</a></li>
                    <li><a href="#">About Us</a></li>

                    
                </ul>
            </div>
            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">

                    <li><a href="Users View/Login.jsp">Login</a></li>
                    <li><a href="Users View/SignUp.jsp">SignUp</a></li>
                    
                </ul>
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
    <%}else{ %>
   <div class="nav">
        <header class="hamroHeader">
            
            <h3 class="hamrologo">The Mesh </h3>


            
            <div class = "nav-linkshamro">
                
        
                <ul class="nav-linkshamro">
                    <li><a href="Users View/home.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/ViewProducts?allProducts=display">Products</a></li>
                    <li><a href="Users View/Carts.jsp">Carts</a></li>
                    <li><a href="Users View/Orders.jsp">Orders</a></li>
                    <li><a href="Users View/Profile.jsp">Profile</a></li>
                    
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
    
	<h1 style="color:black">Products</h1>
	
	<div class="products">
		<div class="info-data">
			<div class="listing-section" style="width: 100%; float: left; padding: 1%; border-bottom: 0.01em solid #dddbdb;">
				<% 
				List<Products> sortObjects= new  ArrayList<>();
				int index= 0;
				for (Products product : products) { %>
				
				<div class="product3" style="float: left;height:fit-content;width: 23%;border-radius: 2%;margin: 1%;overflow-x: hidden;">
					<a href="${pageContext.request.contextPath}/ProductDescription?product_id=<%=product.getProduct_id()%>">
						<div class="image-box3" style="width: 370px;overflow: hidden;height:470px;">
							<div class="images3" id="image-1"
								style=
								"background-image: url(image_products/<%=product.getImg_path1()%>)">
							</div>
						</div>
						<div class="text-box3">
							<h2 class="item cat3" style="color:black"><%=product.getProduct_name()%></h2>
							<h3 class="price cat3" style="color:black">
								Rs
								<%=product.getProduct_price()%></h3>
							<!-- <p class="description">A bag of delicious oranges!</p> -->
							<p class="quantity3">
								In Stock:
								<%=product.getStock()%></p>

						</div>
					</a>
					<a href="${pageContext.request.contextPath}/AddCartItems?product_id=<%=product.getProduct_id()%>"><button type="button3" name="item-1-button" id="item-1-button" style="padding: 2%;background-color: orange;border:none;width: 350px; height: 50px; border-radius: 10px;cursor:pointer">Add to Cart</button></a>
					<!-- Modals for editing and deleting products -->
					<!-- <button type="button" name="buttons" id="updateBtn" style="background-color:#23C552;border-radius: 8px;color:white" >Edit Product</button>
						<button type="button" name="buttons" id="deleteBtn" style="background-color:#F84F31;border-radius: 8px;color:white">Delete Product</button> -->
				</div>	
	<%
		sortObjects.add(index,product);
		index++;
		}
				if (index==0){
					response.sendRedirect("Users View/noProducts.jsp");
				}
	%>
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
	
	<script src="../script.js"></script>
	<script>
	function filterProducts() {
  document.getElementById("filterForm").submit();
}
</script>
</body>

</html>