package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Contact;

@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Contact> getList(){
		return jdbcTemplate.query("SELECT * FROM contact", new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public int addItem(Contact objItem) {
		return jdbcTemplate.update("INSERT INTO contact(name, email, subject, message) VALUES(?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getEmail(), objItem.getSubject(), objItem.getMessage()});
	}
	
	public Contact getItem(int id){
		return jdbcTemplate.queryForObject("SELECT * FROM contact WHERE id = ?", new Object[]{id}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public int delItem(int id){
		return jdbcTemplate.update("DELETE FROM contact WHERE id = ?", new Object[]{id});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM contact", Integer.class);
	}
	
	public List<Contact> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM contact LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public Contact getItem(String email){
		return jdbcTemplate.queryForObject("SELECT * FROM contact WHERE email = ?", new Object[]{email}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	public int setReply(int reply, String email){
		return jdbcTemplate.update("UPDATE contact SET reply = ? WHERE email = ?", new Object[]{reply, email});
	}
	
	public List<Contact> getListSearch(String search){
		return jdbcTemplate.query("SELECT * FROM contact WHERE name LIKE '%"+ search +"%' OR email LIKE '%"+ search +"%' OR subject LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Contact>(Contact.class));
	}
}
