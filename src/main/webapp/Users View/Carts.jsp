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

ArrayList<Carts> cartListSession = (ArrayList<Carts>) session.getAttribute("addcarts"); // to use the values form the session
ArrayList<Carts> cartProducts = null;

if (cartListSession != null){
	DisplayCartItems cd = new DisplayCartItems();
	
	cartProducts = cd.getCartProducts(cartListSession); //to view all the products in the cart
	double cartTotal = cd.cartTotalPrice(cartListSession); // to view the total price of the products in the cart
	
	request.setAttribute("addcarts", cartListSession); 
	session.setAttribute("cartTotal", cartTotal);   //Storing the value of total price of the products of the cart in the session
	
}else{
	
	System.out.println("Your cart is empty");
}



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Carts</title>
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

    /* for the Carts css */
    .small-container {
        margin: 80px auto;
        width: 77%;
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
        width: 80px;
        height: 80px;
        margin-right: 10px;
       }
       th{
        text-align: left;
        padding: 5px;
        color: #fff;
         background: #ff523b;
         font-weight: normal;
         font-size: 20px;
       }
       td{
        padding: 10px 5px;
       }
       td input{
        text-align: center;
        width: 40px;
        height: 30px;
        padding: 5px;

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
       
    .plus-minus {
        background: #ff523b;
        background-image: -webkit-linear-gradient(top, #ff523b, #ff523b);
        background-image: -moz-linear-gradient(top, #ff523b, #ff523b);
        background-image: -ms-linear-gradient(top, #ff523b, #ff523b);
        background-image: -o-linear-gradient(top, #ff523b, #ff523b);
        background-image: linear-gradient(to bottom, #ff523b, #ff523b);
        -webkit-border-radius: 2;
        -moz-border-radius: 2;
        border-radius: 2px;
        font-family: Arial;
        color: #000000;
        font-size: 20px;
        padding:10px 12px;
        padding-bottom: 30px;
        text-decoration: none;
        border-style: none;
        margin-top: 10px;
    }

.plus-minus:hover {
  background: #e65643;
  background-image: -webkit-linear-gradient(top, #e65643, #e65643);
  background-image: -moz-linear-gradient(top, #e65643, #e65643);
  background-image: -ms-linear-gradient(top, #e65643, #e65643);
  background-image: -o-linear-gradient(top, #e65643, #e65643);
  background-image: linear-gradient(to bottom, #e65643, #e65643);
  text-decoration: none;
}
.remove-button{
    background-color: #ff1e00;
    border-style: none;
    padding: 8px 15px;
    border-radius: 2px;
    color: #fff;

}
.remove-button:hover{
    background-color: #ff1e00;
    color: #fff;
    cursor: pointer;
}
.cart-product{
    max-width: 200px;
}
.cart-product p{
    font-size: 19px;
    width: 100%;
    margin-top: 14px;
}
.quantity{
 
    display: flex;
    height: 44px;
}
.quantity p{
    padding: 0 10px;
    margin-top: 15px;
}
.p-in-cart p{
    margin-top: 0;
}
.remove-table{
    margin-bottom: 19px;
}
.BuyNow{
	  width:100%;
	  font-size:1.4rem;
	  background-color: #42f168;
	  color:white;
	  padding:10px 0px;
	  border-radius:10px;
	  margin-top:5px;
	  cursor: pointer;
	  border:1px solid rgb(143, 236, 4);
  
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
                    <li><a href="`Profile.jsp">Profile</a></li>

                    
                </ul>
            </div>
            <div class="nav-linkshamro">
                <button class = "Logout_button"><a style="text-decoration:none; color:black;" href="${pageContext.request.contextPath}/UserLogout">Log Out</a> </button>
            
                <div class = "session_imagediv">
                    <img  class = "session_image" src ="../image_users/<%=user.getImage_user()%>" alt = "user Profile pic">
                </div> 
                <button class = "profile_button"onclick="openModal()"><%= user.getUser_name() %></button>
            
            </div>
            
    
        </header>

    </div>
    


    <!-- now the Carts page begins    -->
    <div class="small-container">
        <h3 style="font-size:30px;">My Carts</h3>
        <table>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th></th>
                <th style="padding-right: 20px;" colspan="2">Subtotal</th>
            </tr>
                    <%
		        if ((cartProducts != null)){
		        	for(Carts p:cartProducts){
		        		
        	
        	%>
            <!-- repeating element starts here -->
            <tr>
                <td class="p-in-cart">
                    <div class="cart-info">
                        <img src="../image_products/<%= p.getImg_path1() %>" alt="">
                        <%System.out.println(p.getImg_path1()); %>
                        <div class="cart-product">
                            <p style="margin-top: 18px;"><%= p.getProduct_name() %></p>
                            
                        </div>

                    </div>
                </td>
                <td class="p-in-cart">
                    <p>Rs.<%= p.getProduct_price() %> </p> 
                </td>

                <td class="quantity" >
                    <a href = "${pageContext.request.contextPath}/QuantityIncDec?action=dec&id=<%=p.getProduct_id() %>" style = "text-decoration: none; color:white;"><button  class="plus-minus">-</button></a>
                    <p><%= p.getQuantity()%></p>
                    <a href = "${pageContext.request.contextPath}/QuantityIncDec?action=inc&id=<%=p.getProduct_id() %>" style = "text-decoration: none; color:white;"><button  class="plus-minus">+</button></a>
                </td>
                <td style="text-align: center;">
                    <div class="remove-table">
                        <a href="${pageContext.request.contextPath}/RemoveCartItems?product_id=<%= p.getProduct_id() %>"><button class="remove-button">remove</button></a>
                    </div>
                </td>
                <td class="p-in-cart" style="padding-right: 30px;">
                    
                    <p><%= p.getQuantity() * p.getProduct_price() %></p>
                 </td>


               

            </tr>
            <!-- repeating element ends heere -->
            <% }%>



        </table>
        <div class="total-price">
            <table>
            <tr style="font-weight: bold;">
                    <td>Total</td>
                    <td style="padding-right: 30px;">Rs.${dcf.format(cartTotal)}</td>
                </tr>
             <tr>
                	<td colspan = "2"><a href ="${pageContext.request.contextPath}/createOrder"><button class = "BuyNow">BuyNow</button></td></a>
              </tr>
            </table>
        </div>

				
        
       
   
    </div>
    
    
        				
				<% }else{%>
				<p>Your Cart is Empty</p>
				
				
					
					
					
				<% }%>
       
   


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

    

    
</body>
</html>