package entities;

public class Product {
	private int id;
	private int id_order;
	private int id_product;
	private int quantity;
	private String name;
	private String picture;
	private int price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Product(int id, int id_order, int id_product, int quantity,
			String name, String picture, int price) {
		super();
		this.id = id;
		this.id_order = id_order;
		this.id_product = id_product;
		this.quantity = quantity;
		this.name = name;
		this.picture = picture;
		this.price = price;
	}
	public Product() {
		super();
	}
	
}
