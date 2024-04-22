
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="style.css" rel="stylesheet">

</head>
<body>	
	<!-- SIDEBAR -->
		<section id="sidebar">
		<a href="Admin View/index.jsp" class="brand">The Mesh</a>
		<ul class="side-menu">
			<li><a href="index.jsp" class="active"><i class='bx bxs-dashboard icon'></i> Dashboard</a></li>
			<li class="divider" data-text="main">Main</li>
			
			<li><a href="${pageContext.request.contextPath}/AdminOrders"><i class='bx bxs-dashboard icon' ></i>Orders</a></li>
			
            <li>
				<a href="#"><i class='bx bxs-inbox icon'></i> Products<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/AdminProducts">All Products</a></li>
					<li><a href="addProducts.jsp">Add Products</a></li>
				</ul>
			</li>
			
			 <li>
				<a href="#"><i class='bx bxs-inbox icon'></i>Brands<i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/AdminBrands">All Brand</a></li>
					<li><a href="addBrands.jsp">Add Product Brand</a></li>
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
			<form action="#">
				<div class="form-group" style="display:none">
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
			<h1 class="title">Add Category</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Categories</a></li>
				<li class="divider">/</li>
				<li><a href="#" class="active">Add Category</a></li>
			</ul>
			
			<div class="info-data">
			<div class="card">
			
			<% String successMessage = (String) request.getAttribute("successMessage"); %>
			<% if (successMessage != null) { %>
 			<div class="success-message">
   					 <%= successMessage %>
  			</div>
			<% } %>
			         
			     <div class="container">
			      <h1 class="headAdd">Add Category</h1>
			      
			      <form action="${pageContext.request.contextPath}/AdminAddCategory" method="post">
			      
			        <label for="cat-name" class="labelAdd">Category Name:</label>
			        <input type="text" id="cat-name" name="cat-name" >
			
			        <button type="submit" class="btnAdd">Add Category</button>
			      </form>
    			</div>
			</div>
			</div> 
			
		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->
	
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="script.js"></script>
</body>
</html>