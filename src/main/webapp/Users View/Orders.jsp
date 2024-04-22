<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="com.controller.user.DisplayCartItems"%>
<%@page import="com.model.*"%>
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
Orders order = (Orders)session.getAttribute("orders");



if (user == null){
	response.sendRedirect("Login.jsp");
}else{
	System.out.println("The user session is used by : " + user);
}


// for decimal format in total price

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

%>
<%

/* ArrayList<Carts> cartListSession = (ArrayList<Carts>) session.getAttribute("addcarts"); // to use the values form the session
ArrayList<Carts> orderProducts = null;

if (cartListSession != null){
	DisplayCartItems cd = new DisplayCartItems() ;
	
	orderProducts = cd.getCartProducts(cartListSession); //to view all the products in the cart
	
	session.getAttribute("cartTotal");
	request.setAttribute("addcarts", cartListSession); 
	
}else{
	
	System.out.println("Your cart is empty");
}  */



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="styles.css">
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

    /* for the Orders css */
    .small-container {
		width: 90%;
		border-radius: 2px;
		box-shadow: 0px 5px 10px 0px rgba(67, 67, 67, 0.5);
       }
       table{
        width: 100%;
        border-collapse: collapse;
       }

       .cart-info{
        display: flex;
        flex-wrap: wrap;
       }
       td img{
        width: 120px;
        height: 120px;
        margin-right: 10px;
       }
	 
	   
	   .status h3{
		margin: 20px 20px 20px 13px;
		font-size: 30px;
	   }
       th{
		font-size: 17px;
        text-align: left;
        padding: 5px;
        color: #0a0a0a;
         background: #ffffff;
         font-weight: normal;
       }
       td{
        padding: 10px 5px;
       }
       td input{
        width: 40px;
        height: 30px;
        padding: 5px;

       }
       td a{
        color: #ff523b;
        font-size: 12px;
        text-decoration: none;
       }
       .total-price{
        display: flex;
        justify-content: flex-end;
       }
       .total-price table{
        border-top: 3px solid #ff523b;
        max-width: 400px;
       }
       td:last-child{
        text-align: right;

       }
       th:last-child{
        text-align: right;
       }
	   th{
		color: #ffffff;
		background: #ff523b;
		   }
		.orders{
			display: flex;
		}
		.orders p{
			margin-right: 30px;
			color: #6e6e6e;
		}
		
	
		.for-user ul{
			margin-top: 85px;
			margin-left:20px;
			list-style: none;
			padding: 1px 1px 19px 6px;
    		text-align: left;	
			border-radius: 2px;
			box-shadow: 0px 5px 10px 0px rgba(67, 67, 67, 0.5);
		}	
		.for-user ul h4{
			padding-left: 10px;
		}
		
		.for-user ul li {
			margin-top: 15px;
			
			
		}
		.for-user ul li a{
			padding-left: 15px;
			text-decoration: none;
    		color: black;
		}
		.big-container{
			width: 100%;
			display: flex;
			flex-direction: column;
			margin-left: 50px;
			
		}
		.styling{
			width: 100%;
			margin-bottom: 30px;
			margin-left: 13px;
		}
		.order-main{
			display: flex;
			margin-bottom: 30px;
		}
		.profile-manage{
			display: flex;
		}
		.profile-manage i{
			margin-top: 19px;
			padding-left: 20px;
		}
		
		/* for the modal*/
/* The Modal (background) */
  .modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    /* background-color: rgba(0,0,0,0.4); Black w/ opacity */
    backdrop-filter: blur(2px);
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
    


    <!-- now the Orders page begins    -->

	<div class="big-container">
		<div class="status">
			<h3>My orders</h3>
			
		</div>
		
		<div class="styling">
			<div class="small-container cart-page]">
				<table>
					<div class="prd-det">
						<tr>
							<th>Product</th>
							<th>Product Name</th>
							<th>Date</th>
							<th>Quantity</th>
							<th style="padding-right: 20px;" colspan="2">Subtotal</th>
						</tr>
					</div>
					<!-- repeated column from here -->
					<%
					try{
						Class.forName("com.mysql.cj.jdbc.Driver");
						db_connection dc = new db_connection();
						Connection con = dc.getConnect();
						
						String query = "Select * from orders where user_id = ? ";
						PreparedStatement ps = con.prepareStatement(query);
						ps.setInt(1,user.getUser_id());
						ResultSet rs = ps.executeQuery();	
						
						while(rs.next()){
							int order_id = rs.getInt("order_id");
							
							String viewQuery = "Select * from order_items where order_id = ?";
							PreparedStatement pst = con.prepareStatement(viewQuery);
							pst.setInt(1,order_id);
							ResultSet res = pst.executeQuery();
							
							while(res.next()){ 
								int product_id = res.getInt("product_id");
								
								String productQuery = "Select * from products where product_id = ?";
								PreparedStatement pstr = con.prepareStatement(productQuery);
								pstr.setInt(1,product_id);
								ResultSet rest = pstr.executeQuery(); 
								
								
								
								while(rest.next()){
					%>
								<tr>
									<td>
										<div class="cart-info">
											<img src="../image_products/<%=rest.getString("img_path1") %>" alt="product_image">
											
					
										</div>
									</td>
									<td style="width: 30%;">
										<div>
											<p><%=rest.getString("product_name") %></p>
											
											<br>
											
										</div>
									</td>
									<td><%=rs.getDate("order_date")  %></td>
									<td><%=res.getInt("quantity") %></td>
									<td style="padding-right:20px ;">Rs.<%= res.getDouble("price") %></td>
								
								</tr>
					
					<%
					} %>
				
							<%  }
			
			} %>
						</table>
			
			
			
       <% }catch(Exception e){
        	e.printStackTrace();
        }
		

        		
        	
        	%>
		    </div>
        </div>
	</div>

    <!-- the orders end here -->
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