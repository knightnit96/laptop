package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Payment;

@Repository
public class PaymentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Payment> getList(){
		return jdbcTemplate.query("SELECT * FROM payment", new BeanPropertyRowMapper<Payment>(Payment.class));
	}
	
	public int addItem(Payment objItem) {
		return jdbcTemplate.update("INSERT INTO payment(name, info) VALUES(?, ?)", new Object[]{objItem.getName(), objItem.getInfo()});
	}
	
	public Payment getItem(int id_payment){
		return jdbcTemplate.queryForObject("SELECT * FROM payment WHERE id_payment = ?", new Object[]{id_payment}, new BeanPropertyRowMapper<Payment>(Payment.class));
	}
	
	public int editItem(Payment objItem) {
		return jdbcTemplate.update("UPDATE payment SET name = ?, info = ? WHERE id_payment = ?", new Object[]{objItem.getName(), objItem.getInfo(), objItem.getId_payment()});
	}
	
	public int delItem(int id_payment){
		return jdbcTemplate.update("DELETE FROM payment WHERE id_payment = ?", new Object[]{id_payment});
	}
}
