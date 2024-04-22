<%@page import="java.util.List"%>
<%@page import="com.model.Products"%>
<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  List<Products> products = (List<Products>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="Admin View/style.css" rel="stylesheet">
<style>
.listing-section, .cart-section {
  width: 100%;
  float: left;
  padding: 1%;
  border-bottom: 0.01em solid #dddbdb;
}

.product {
  float: left;
  width: 23%;
  border-radius: 2%;
  margin-left: 25px;
  margin-bottom: 30px;
}
/* .product:hover {
  box-shadow: 1.5px 1.5px 2.5px 3px grey;
  -webkit-box-shadow: 1px 1px 1.5px 2px grey;  
  -moz-box-shadow:    1.5px 1px 1.5px 2px grey;
}
 */
.image-box {
  width: 100%;
  overflow: hidden;
  border-radius: 2% 2% 0 0;
}

.images {
  height: 28em;
  background-size: cover; 
  background-position: center center; 
  background-repeat: no-repeat;
  border-radius: 2% 2% 0 0;
  transition: all 1s ease;
  -moz-transition: all 1s ease;
  -ms-transition: all 1s ease;
  -webkit-transition: all 1s ease;
  -o-transition: all 1s ease;
}

.images:hover {
  transform: scale(1.2);
  overflow: hidden;
  border-radius: 2%;
}

/* IMAGES */
/* #image-1 {
	background-image: url("https://sc01.alicdn.com/kf/UT8.CaXX2NXXXagOFbXC/fresh-navel-oranges.jpg");
	
	}
 */
.text-box {
  width: 100%;
  float: left;
  border-radius: 0 0 2% 2%;
  padding: 1em;
}

h2, h3 {
  float: left;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 1em;
  text-transform: uppercase;
  margin: 0.2em auto;
}

.quantity{
 text-align: center;
 clear: left;
  width: 100%;
  font-size:12px;
  color: Grey;
  
}
.item, .price{
  clear: left;
  width: 100%;
  text-align: center;
}

.price {
  color: Red;
}

.description, label, button, input {
  float: left;
  clear: left;
  width: 100%;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
  font-size: 1em;
  text-align: center;
  margin: 0.2em auto;
}

input:focus {
  outline-color: #fdf;
}

label {
  width: 60%;
}

.text-box input {
  width: 15%;
  clear: none;
}

.text-box button {
  margin-top: 1em;
}

button {
  padding: 2%;
  background-color: #dfd;
  border: none;
  border-radius: 2%;
}

button:hover {
  bottom: 0.1em;
}

button:focus {
  outline: 0;
}

button:active {
  bottom: 0;
  background-color: #fdf;
}


</style>

</head>
<body>	
	<!-- SIDEBAR -->
		<section id="sidebar">
		<a href="Admin View/index.jsp" class="brand">The Mesh</a>
		<ul class="side-menu">
			<li><a href="Admin View/index.jsp" class="active"><i class='bx bxs-dashboard icon'></i> Dashboard</a></li>
			<li class="divider" data-text="main">Main</li>
			
			<li><a href="${pageContext.request.contextPath}/AdminOrders"><i class='bx bxs-dashboard icon' ></i>Orders</a></li>
			
            <li>
				<a href="#"><i class='bx bxs-inbox icon'></i> Products<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/AdminProducts">All Products</a></li>
					<li><a href="Admin View/addProducts.jsp">Add Products</a></li>
				</ul>
			</li>
			
			 <li>
				<a href="#"><i class='bx bxs-inbox icon'></i>Brands<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/AdminBrands">All Brand</a></li>
					<li><a href="Admin View/addBrands.jsp">Add Product Brand</a></li>
				</ul>
			</li>
			
			<li>
				<a href="#"><i class='bx bxs-inbox icon'></i>Categories<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="addCategory.jsp">Add Product Category</a></li>
				</ul>
			</li>
		</ul>

	</section>
	
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu toggle-sidebar' ></i>
			<form action="${pageContext.request.contextPath}/AdminProducts" method="get">
				<div class="form-group">
					<input type="text" placeholder="Search product name" name="search">
				</div>
			</form>
			<a href="#" class="nav-link">
				<i class='bx bxs-bell icon' ></i>
				<span class="badge">5</span>
			</a>
			<a href="#" class="nav-link">
				<i class='bx bxs-message-square-dots icon' ></i>
				<span class="badge">9</span>
			</a>
			<span class="divider"></span>
			<div class="profile">
				<img src="https://images.unsplash.com/photo-1517841905240-472988babdf9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="">
				<ul class="profile-link">
					<li><a href="#"><i class='bx bxs-user-circle icon' ></i> Profile</a></li>
					<li><a href="#"><i class='bx bxs-log-out-circle' ></i> Logout</a></li>
				</ul>
			</div>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<h1 class="title">All Products</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Products</a></li>
				<li class="divider">/</li>
				<li><a href="#" class="active">All Products</a></li>
			</ul>
			
			<div class="info-data">
				<div class="listing-section">
				<%-- <%
				Class.forName("com.mysql.cj.jdbc.Driver");
	            db_connection db= new db_connection();
	            Connection con = db.getConnect();
	            
	            String query = "Select product_id,product_name, product_price,stock,img_path1 from products";
	            
	            String search=request.getParameter("search");
	            
	            if (search!=null){
	            	query= "SELECT product_id,product_name,product_price,stock,img_path1 FROM products JOIN brand ON products.brand_id = brand.brand_id JOIN categories ON products.cat_id = categories.cat_id WHERE products.product_name Like '%"+search+"%' OR brand.brand_name Like '%"+search+"%'  OR categories.cat_name Like '%"+search+"%'";
	            }
	            PreparedStatement ps = con.prepareStatement(query);
	            ResultSet rs= ps.executeQuery();
	            
	            while(rs.next()){
				%> --%>
				
				<% for (Products product : products) { %>
					<div class="product">
					  <div class="image-box">
						<div class="images" id="image-1"style="
						background-image: url(image_products/<%=product.getImg_path1()%>)">
						</div>
					  </div>
					  <div class="text-box">
						<h2 class="item"><%=product.getProduct_name()%></h2>
						<h3 class="price">Rs <%=product.getProduct_price() %></h3>
						<!-- <p class="description">A bag of delicious oranges!</p> -->
						<p class="quantity">In Stock: <%=product.getStock() %></p>
						
					</div>
				
						<!-- <input type="text" name="item-1-quantity" id="item-1-quantity" value="1"> -->
						<!-- <button type="button" name="item-1-button" id="item-1-button">Add to Cart</button> -->
						
						<!-- Modals for editing and deleting products -->
						<form action="${pageContext.request.contextPath}/AdminUpdateProducts?updateBtn=<%=product.getProduct_id()%>" method="post" style="padding: 2%;border: none; border-radius: 2%;">
							<button type="submit" name="buttons" id="updateBtn" style="background-color:#23C552;border-radius: 8px;color:white">Edit Product</button>
						</form>
						
						<form action="${pageContext.request.contextPath}/AdminDeleteProducts?deleteBtn=<%=product.getProduct_id()%>" method="post" style="padding: 2%;border: none; border-radius: 2%;">
							<button type="submit" name="buttons" id="updateBtn" style="background-color:#F84F31;border-radius: 8px;color:white">Delete Product</button>
						</form>
					 </div>
				<%
	            }
				%>
				</div>
			</div>           
		</main>
		
		<!-- MODAL -->

<!-- 	<div id="update-modal" class="modal">
        <div class="modal-content">
            <div class="modal_content_inner">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2> Your Profile</h2> UserName
                <img class="profile_image" src="" alt="user Profile pic">



                <h2 style=" text-align:center; display:block; margin:10px auto;">
                    ///
                </h2>

                <p><b>Name : </b> </p>
                <p><b> Email : </b> </p>
                <p><b>Phone : </b> </p>
                <p><b>Gender : </b> </p>
                <p><b>Address : </b></p>
                <p><b>Address : </b></p>


                <div class="buttons">
                    <button id="openModal2" class="green_but">Edit</button>
                </div>

            </div>

        </div>
    </div>
    
     -->
		
		
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->

    
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="Admin View/script.js"></script>
</body>
</html>