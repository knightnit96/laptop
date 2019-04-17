package entities;

public class User {
	private int id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private int active;
	private String role;
	private String avatar;
	private String linkface;
	private String phone;
	private int new_order;
	private int new_comment;
	private int new_contact;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getLinkface() {
		return linkface;
	}
	public void setLinkface(String linkface) {
		this.linkface = linkface;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getNew_order() {
		return new_order;
	}
	public void setNew_order(int new_order) {
		this.new_order = new_order;
	}
	public int getNew_comment() {
		return new_comment;
	}
	public void setNew_comment(int new_comment) {
		this.new_comment = new_comment;
	}
	public int getNew_contact() {
		return new_contact;
	}
	public void setNew_contact(int new_contact) {
		this.new_contact = new_contact;
	}
}
