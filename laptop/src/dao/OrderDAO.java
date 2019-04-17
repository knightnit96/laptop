package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Order;
import entities.Product;

@Repository
public class OrderDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Order> getList(){
		return jdbcTemplate.query("SELECT * FROM order1", new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public int addItem(Order objItem) {
		return jdbcTemplate.update("INSERT INTO order1(name, phone, email, address, id_payment, price, message) VALUES(?, ?, ?, ?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getPhone(), objItem.getEmail(), objItem.getAddress(), objItem.getId_payment(), objItem.getPrice(), objItem.getMessage()});
	}
	
	public Order getItem(){
		return jdbcTemplate.queryForObject("SELECT * FROM order1 ORDER BY id_order DESC LIMIT 1", new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public int editItem(int id_order, String status, int id_payment) {
		return jdbcTemplate.update("UPDATE order1 SET status = ?, id_payment = ? WHERE id_order = ?", new Object[]{status, id_payment, id_order});
	}
	
	public int delItem(int id_order){
		return jdbcTemplate.update("DELETE FROM order1 WHERE id_order = ?", new Object[]{id_order});
	}
	
	public int getSumAll(){	
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM order1", Integer.class);
	}
	
	public List<Order> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM order1 LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public int addOrder2(Product objItem) {
		return jdbcTemplate.update("INSERT INTO order2(id_order, id_product, quantity) VALUES(?, ?, ?)", new Object[]{objItem.getId_order(), objItem.getId_product(), objItem.getQuantity()});
	}

	public List<Order> getListSearch(String from_date, String to_date){
		return jdbcTemplate.query("SELECT * FROM order1 WHERE date > '"+ from_date +"' AND date < '"+ to_date +"'", new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getListSearchTo(String to_date){
		return jdbcTemplate.query("SELECT * FROM order1 WHERE date < '"+ to_date +"'", new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getListSearchFrom(String from_date){
		return jdbcTemplate.query("SELECT * FROM order1 WHERE date > '"+ from_date +"'", new BeanPropertyRowMapper<Order>(Order.class));
	}
}
