
<%@page import="com.model.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  List<Brand> brandList = (List<Brand>) request.getAttribute("brands");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Brands</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="Admin View/style.css" rel="stylesheet">
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
					<li><a href="Admin View/addCategory.jsp">Add Product Category</a></li>
				</ul>
			</li>
			
		</ul>

	</section>
	
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu toggle-sidebar' ></i>
			<form action="${pageContext.request.contextPath}/AdminBrands">
				<div class="form-group">
					<input type="text" placeholder="Search Brand Name" name="search">
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
			<h1 class="title">Edit Brands</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Brands</a></li>
				<li class="divider">/</li>
				<li><a href="#" class="active">Edit Brands</a></li>
			</ul>
			
			<div class="info-data">
				<div class="listing-section">
				
			<% for (Brand brand: brandList){
			%>
					<div class="product">
					  <div class="image-box">
						<div class="images" id="image-1"style="
						background-image: url(image_products/<%=brand.getBrand_image() %>)">
						</div>
					  </div>
					  <div class="text-box">
						<h4 class="item">Brand Name: <%=brand.getBrand_name() %></h4>
					</div>
						<!-- <input type="text" name="item-1-quantity" id="item-1-quantity" value="1"> -->
						<!-- <button type="button" name="item-1-button" id="item-1-button">Add to Cart</button> -->
						
						<!-- Modals for editing and deleting products -->
						
						<%-- <form action="${pageContext.request.contextPath}/AdminUpdateBrands?updateBtn=<%=brand.getBrand_id()%>" method="post" style="padding: 2%;border: none; border-radius: 2%;">
							<button type="submit" name="buttons" id="updateBtn" style="background-color:#23C552;border-radius: 8px;color:white">Edit Product</button>
						</form>
						 --%>
						<form action="${pageContext.request.contextPath}/AdminDeleteBrands?deleteBtn=<%=brand.getBrand_id()%>" method="post" style="padding: 2%;border: none; border-radius: 2%;">
							<button type="submit" name="buttons" id="updateBtn" style="background-color:#F84F31;border-radius: 8px;color:white">Delete Product</button>
						</form>
					 </div>
				<%
	            }
				%>
				</div>
			</div>  
		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->
	
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="Admin View/script.js"></script>
</body>
</html>