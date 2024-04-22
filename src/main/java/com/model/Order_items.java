package com.model;

public class Order_items {
	   private int order_item_id;
	   private Orders order;
	   private Products product;
	   private int quantity;
	   private double price;

	   // constructors, getters, and setters

	   // constructor without id (for inserting new records)
	   public Order_items(Orders order, Products product, int quantity, double price) {
	      this.order = order;
	      this.product = product;
	      this.quantity = quantity;
	      this.price = price;
	   }

	   // getters and setters for order and product
	   public Orders getOrder() {
	      return order;
	   }

	   public void setOrder(Orders order) {
	      this.order = order;
	   }

	   public Products getProduct() {
	      return product;
	   }

	   public void setProduct(Products product) {
	      this.product = product;
	   }

		public int getOrder_item_id() {
			return order_item_id;
		}
	
		public void setOrder_item_id(int order_item_id) {
			this.order_item_id = order_item_id;
		}
	
		public int getQuantity() {
			return quantity;
		}
	
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
	
		public double getPrice() {
			return price;
		}
	
		public void setPrice(double price) {
			this.price = price;
		}
	   
	   
	   

	}

