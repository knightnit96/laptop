package entities;

import java.sql.Timestamp;

public class Comment {
	private int id_comment;
	private String name;
	private String email;
	private String message;
	private int id_product;
	private Timestamp date;
	private String role;
	private int id_parent;
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getId_parent() {
		return id_parent;
	}
	public void setId_parent(int id_parent) {
		this.id_parent = id_parent;
	}
	public Comment(int id_comment, String name, String email, String message,
			int id_product, Timestamp date, String role, int id_parent) {
		super();
		this.id_comment = id_comment;
		this.name = name;
		this.email = email;
		this.message = message;
		this.id_product = id_product;
		this.date = date;
		this.role = role;
		this.id_parent = id_parent;
	}
	public Comment() {
		super();
	}
}
