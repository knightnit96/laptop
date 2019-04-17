package entities;

public class Wishlist {
	private int id_product;
	private int price;
	private String name;
	private String picture;
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Wishlist(int id_product, int price, String name, String picture) {
		super();
		this.id_product = id_product;
		this.price = price;
		this.name = name;
		this.picture = picture;
	}
	public Wishlist() {
		super();
	}
}
