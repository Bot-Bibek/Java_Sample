<%@page import="com.controller.databaseConnection.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="style.css" rel="stylesheet">

</head>
<body>	
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="index.jsp" class="brand">The Mesh</a>
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
			<h1 class="title">Add Products</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Products</a></li>
				<li class="divider">/</li>
				<li><a href="#" class="active">Add Products</a></li>
			</ul>
			
			<div class="info-data">
			<div class="card">
			     <div class="container">
			      <h1 class="headAdd">Add Products</h1>
			      
			      
			      <form action="${pageContext.request.contextPath}/AdminAddProducts" method="post" enctype="multipart/form-data">
			      
			        <label for="product-name" class="labelAdd">Product Name:</label>
			        <input type="text" id="product-name" name="product-name" />
			
			        <label for="product-price" class="labelAdd">Product Price:</label>
			        <input type="text" id="product-price" name="product-price" />
					
					
					
					<label for="product-category" class="labelAdd">Product Category:</label>
			        <select id="product-category" name="product-category">
			        <option selected disabled>Select Category</option>
			        <%
			        Class.forName("com.mysql.cj.jdbc.Driver");
		            db_connection db= new db_connection();
		            Connection con = db.getConnect();
		            
		            String query1 = "Select cat_name from categories";
		            PreparedStatement ps1 = con.prepareStatement(query1);
		            ResultSet rs1 = ps1.executeQuery();
		            
		            while(rs1.next()){
			        
			        %>
			        <option><%=rs1.getString("cat_name")%></option>
			        
			        <% }%>
			        
			        </select>
			        
			        
			        
			        <label for="product-brand" class="labelAdd">Product Brand:</label>
			        <select id="product-brand" name="product-brand">
			        <option selected disabled>Select Brand</option>
			        <%
		            
		            String query2 = "Select brand_name from brand";
		            PreparedStatement ps2 = con.prepareStatement(query2);
		            ResultSet rs2= ps2.executeQuery();
		            
		            while(rs2.next()){
			        
			        %>
			        <option><%=rs2.getString("brand_name")%></option>
			        
			        <% }%>
			        </select>
			        
			        
			        
			        
			        <label for="product-gender" class="labelAdd">For Gender:</label>
			        <select id="product-gender" name="product-gender">
			        <option selected disabled>Select Gender</option>
			        <%
		            
		            String query3 = "Select gender_name from gender";
		            PreparedStatement ps3 = con.prepareStatement(query3);
		            ResultSet rs3 = ps3.executeQuery();
		            
		            while(rs3.next()){
			        
			        %>
			        <option><%=rs3.getString("gender_name")%></option>
			        
			        <% }%>
			        </select>
			        
			        
			        <label for="product-stock" class="labelAdd">Available Stock:</label>
			        <input type="text" id="product-stock" name="product-stock" />
			        
			        <label for="product-description" class="labelAdd">Product Description:</label>
			        <textarea
			          id="product-description"
			          name="product-description"
			        ></textarea>
			
			        <label for="product-image1" class="labelAdd" style="margin-bottom: 40px;">Product Image 1:</label>
			        <input type="file" id="product-image1" name="product-image1" />
			        
			        <label for="product-image2" class="labelAdd" style="margin-bottom: 40px;">Product Image 2:</label>
			        <input type="file" id="product-image2" name="product-image2" />
					
					<label for="product-image3" class="labelAdd" style="margin-bottom: 40px;">Product Image 3:</label>
			        <input type="file" id="product-image3" name="product-image3" />
			
			
			        <button type="submit" class="btnAdd">Add Product</button>
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
