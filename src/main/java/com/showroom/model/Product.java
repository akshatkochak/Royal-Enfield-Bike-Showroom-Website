package com.showroom.model;

public class Product 
{ 
	public int id;
	private String colors;
	private Double price;
	private String image;
	private String bike;
	
	public Product () 
	{
		
	}
	
	public Product(int id,  String colors, Double price, String image,String bike)
	{
		this.id = id;
		this.colors = colors;
		this.price = price;
		this.image = image;
		this.bike = bike;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	public String getBike() {
		return bike;
	}

	public void setBike(String bike) {
		this.bike = bike;
	}


	@Override
	public String toString() {
		return "Product [id=" + id + ", colors=" + colors + ", price=" + price + ", image=" + image +",bike=" + bike
				+ "]";
	}
	
}
