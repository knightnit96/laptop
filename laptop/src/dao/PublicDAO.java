package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Accessories;
import entities.Comment;
import entities.Contact;
import entities.Laptop;
import entities.Order;
import entities.Product;
import entities.User;
import entities.Video;

@Repository
public class PublicDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Video> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM video LIMIT ?,?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Video>(Video.class));
	}
	
	public List<Laptop> getListLaptopNews(){
		return jdbcTemplate.query("SELECT * FROM laptop ORDER BY id_laptop DESC LIMIT 4", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Laptop> getListLaptopCheap(){
		return jdbcTemplate.query("SELECT * FROM laptop ORDER BY price ASC LIMIT 4", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Accessories> getListAccessoriesNews(){
		return jdbcTemplate.query("SELECT * FROM accessories ORDER BY id_accessories DESC LIMIT 4", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Laptop> getListLaptopIndex(){
		return jdbcTemplate.query("SELECT * FROM laptop ORDER BY id_product DESC LIMIT 6", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Accessories> getListAccessoriesIndex(){
		return jdbcTemplate.query("SELECT * FROM accessories ORDER BY id_product DESC LIMIT 3", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public int getSumAllBrand(int id_brand){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = ?", new Object[]{id_brand}, Integer.class);
	}
	
	public List<Laptop> getListBrand(int id_brand, int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM laptop WHERE id_brand = ? LIMIT ?, ?", new Object[]{id_brand, offset, row_count}, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public int getSumAllAccessories(String name){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories WHERE cat = ?", new Object[]{name}, Integer.class);
	}
	
	public List<Accessories> getListAccessories(String name, int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE cat = ? LIMIT ?, ?", new Object[]{name, offset, row_count}, new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public User getUserLogin(String username){
		return jdbcTemplate.queryForObject("SELECT * FROM user WHERE username = ?", new Object[]{username}, new BeanPropertyRowMapper<User>(User.class));
	}
	
	public Laptop getItemLaptop(int id_product){
		return jdbcTemplate.queryForObject("SELECT * FROM laptop WHERE id_product = ?", new Object[]{id_product}, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public Accessories getItemAccessories(int id_product){
		return jdbcTemplate.queryForObject("SELECT * FROM accessories WHERE id_product = ?", new Object[]{id_product}, new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Laptop> getItemLaptopLQ(int id_product, int id_brand){
		return jdbcTemplate.query("SELECT * FROM laptop WHERE id_product != ? && id_brand = ? ORDER BY id_product DESC LIMIT 4", new Object[]{id_product, id_brand}, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Accessories> getItemAccessoriesLQ(int id_product, String cat){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE id_product != ? && cat = ? ORDER BY id_product DESC LIMIT 4", new Object[]{id_product, cat}, new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Laptop> getListLaptopSearch(String search){
		return jdbcTemplate.query("SELECT * FROM laptop WHERE name LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Accessories> getListAccessoriesSearch(String search){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE name LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Laptop> getListLaptopProduct(int id_brand, int price, String ram, String cpu, String hdd){
		String a = "",b = "",c = "",d = "",e = "";
		if (id_brand != 0) {
			a = ""+id_brand;
		}
		if (price != 0) {
			b = "price >= "+ (price*1000000) +" AND price <= "+ (price+5)*1000000 +" AND ";
		}
		if (ram != "") {
			c =  ram;
		}
		if (cpu != "") {
			d = cpu;
		}
		if (hdd != "") {
			e = hdd;
		}
		return jdbcTemplate.query("SELECT * FROM laptop WHERE "
				
				+ "id_brand LIKE '%"+ a +"%' AND "
				+ b
				+ "ram LIKE '%"+ c +"%' AND "
				+ "cpu LIKE '%"+ d +"%' AND "
				+ "hdd LIKE '%"+ e +"%'"
				, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Order> getListHistory(String email){
		return jdbcTemplate.query("SELECT * FROM order1 WHERE email = ? ", new Object[]{email}, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public int addItem(User objItem) {
		return jdbcTemplate.update("INSERT INTO user(username, password, fullname, email, avatar, linkface, phone) VALUES(?, ?, ?, ?, ?, ?, ?)", new Object[]{objItem.getUsername(), objItem.getPassword(), objItem.getFullname(), objItem.getEmail(), objItem.getAvatar(), objItem.getLinkface(), objItem.getPhone()});
	}
	
	public int editItem(User objItem) {
		return jdbcTemplate.update("UPDATE user SET password = ?, fullname = ?, email = ?, avatar = ?, linkface = ?, phone = ? WHERE id = ?", new Object[]{objItem.getPassword(), objItem.getFullname(), objItem.getEmail(), objItem.getAvatar(), objItem.getLinkface(), objItem.getPhone(), objItem.getId()});
	}

	public Order getItemOrder(int id_order) {
		return jdbcTemplate.queryForObject("SELECT * FROM order1 WHERE id_order = ?", new Object[]{id_order}, new BeanPropertyRowMapper<Order>(Order.class));
	}

	public List<Product> getListOrder(int id_order){
		return jdbcTemplate.query("SELECT * FROM order2 WHERE id_order = ?", new Object[]{id_order}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public Order getOrderNewest() {
		return jdbcTemplate.queryForObject("SELECT * FROM order1 ORDER BY id_order DESC LIMIT 1", new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public Comment getCommentNewest() {
		return jdbcTemplate.queryForObject("SELECT * FROM comment ORDER BY id_comment DESC LIMIT 1", new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public Contact getContactNewest() {
		return jdbcTemplate.queryForObject("SELECT * FROM contact ORDER BY id DESC LIMIT 1", new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public Laptop getLaptopNewest() {
		return jdbcTemplate.queryForObject("SELECT * FROM laptop ORDER BY id_laptop DESC LIMIT 1", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}

	public int getSumDell(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 1", Integer.class);
	}
	
	public int getSumAsus(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 2", Integer.class);
	}
	
	public int getSumHp(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 3", Integer.class);
	}
	
	public int getSumAcer(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 4", Integer.class);
	}
	
	public int getSumLenovo(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 5", Integer.class);
	}
	
	public int getSumMsi(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop WHERE id_brand = 6", Integer.class);
	}
	
	public int getSumLaptop(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop", Integer.class);
	}
	
	public int getSumMouse(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories WHERE cat = 'Mouse'", Integer.class);
	}
	
	public int getSumKeyboard(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories WHERE cat = 'Keyboard'", Integer.class);
	}
	
	public int getSumHeadphone(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories WHERE cat = 'Headphone'", Integer.class);
	}
	
	public int getSumAccessories(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories", Integer.class);
	}
	
	public List<Comment> getListNewsCommentHeader(int comment){
		return jdbcTemplate.query("SELECT * FROM comment ORDER BY id_comment DESC LIMIT ?", new Object[]{comment}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public List<Contact> getListNewsContactHeader(int contact){
		return jdbcTemplate.query("SELECT * FROM contact ORDER BY id DESC LIMIT ?", new Object[]{contact}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public List<Order> getListNewsOrderHeader(int order){
		return jdbcTemplate.query("SELECT * FROM order1 ORDER BY id_order DESC LIMIT ?", new Object[]{order}, new BeanPropertyRowMapper<Order>(Order.class));
	}
}
