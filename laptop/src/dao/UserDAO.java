package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.User;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<User> getList(){
		return jdbcTemplate.query("SELECT * FROM user", new BeanPropertyRowMapper<User>(User.class));
	}
	
	public int addItem(User objItem) {
		return jdbcTemplate.update("INSERT INTO user(username, password, fullname, email, role, avatar, linkface, phone) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", new Object[]{objItem.getUsername(), objItem.getPassword(), objItem.getFullname(), objItem.getEmail(), objItem.getRole(), objItem.getAvatar(), objItem.getLinkface(), objItem.getPhone()});
	}
	
	public User getItem(int id){
		return jdbcTemplate.queryForObject("SELECT * FROM user WHERE id = ?", new Object[]{id}, new BeanPropertyRowMapper<User>(User.class));
	}
	
	public int editItem(User objItem) {
		return jdbcTemplate.update("UPDATE user SET password = ?, fullname = ?, email = ?, role = ?, avatar = ?, linkface = ?, phone = ? WHERE id = ?", new Object[]{objItem.getPassword(), objItem.getFullname(), objItem.getEmail(), objItem.getRole(), objItem.getAvatar(), objItem.getLinkface(), objItem.getPhone(), objItem.getId()});
	}
	
	public int delItem(int id){
		return jdbcTemplate.update("DELETE FROM user WHERE id = ?", new Object[]{id});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM user", Integer.class);
	}
	
	public List<User> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM user LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<User>(User.class));
	}
	
	@SuppressWarnings("unused")
	public boolean checkUser(String username) {
		try {
			User obj = jdbcTemplate.queryForObject("SELECT * FROM user WHERE username = ?", new Object[]{username}, new BeanPropertyRowMapper<User>(User.class));
		return false;
		}
		catch (EmptyResultDataAccessException e) {
			return true;
		}
	}
	
	public int changeActive(int active, int id) {
		return jdbcTemplate.update("UPDATE user SET active = ? WHERE id = ?", new Object[]{active,id});
		
	}
	
	public List<User> getListSearch(String search){
		return jdbcTemplate.query("SELECT * FROM user WHERE username LIKE '%"+ search +"%' OR fullname LIKE '%"+ search +"%' OR email LIKE '%"+ search +"%' OR phone LIKE '%"+ search +"%'", new BeanPropertyRowMapper<User>(User.class));
	}
	
	@SuppressWarnings("unused")
	public boolean checkEmail(String email) {
		try {
			User obj = jdbcTemplate.queryForObject("SELECT * FROM user WHERE email = ?", new Object[]{email}, new BeanPropertyRowMapper<User>(User.class));
		return false;
		}
		catch (EmptyResultDataAccessException e) {
			return true;
		}
	}

	public int editOrder(int new_order, int id) {
		return jdbcTemplate.update("UPDATE user SET new_order = ? WHERE id = ?", new Object[]{new_order, id});
	}
	
	public int editComment(int new_comment, int id) {
		return jdbcTemplate.update("UPDATE user SET new_comment = ? WHERE id = ?", new Object[]{new_comment, id});
	}
	
	public int editContact(int new_contact, int id) {
		return jdbcTemplate.update("UPDATE user SET new_contact = ? WHERE id = ?", new Object[]{new_contact, id});
	}
	
	public int editOrder() {
		return jdbcTemplate.update("UPDATE user SET new_order = new_order+1 WHERE role = 'ADMIN'");
	}
	
	public int editComment() {
		return jdbcTemplate.update("UPDATE user SET new_comment = new_comment+1 WHERE role = 'ADMIN' OR role = 'MOD'");
	}
	
	public int editContact() {
		return jdbcTemplate.update("UPDATE user SET new_contact = new_contact+1 WHERE role = 'ADMIN' OR role = 'MOD'");
	}
}		
