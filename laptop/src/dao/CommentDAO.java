package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Comment;

@Repository
public class CommentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Comment> getList(){
		return jdbcTemplate.query("SELECT * FROM comment", new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public int addItem(Comment objItem) {
		return jdbcTemplate.update("INSERT INTO comment(name, email, message, id_product, role) VALUES(?, ?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getEmail(), objItem.getMessage(), objItem.getId_product(), objItem.getRole()});
	}
	
	public int addItemReply(Comment objItem) {
		return jdbcTemplate.update("INSERT INTO comment(name, email, message, id_product, role, id_parent) VALUES(?, ?, ?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getEmail(), objItem.getMessage(), objItem.getId_product(), objItem.getRole(), objItem.getId_parent()});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM comment", Integer.class);
	}
	
	public List<Comment> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM comment LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}

	public List<Comment> getList(int id_product){
		return jdbcTemplate.query("SELECT * FROM comment WHERE id_product = ?", new Object[]{id_product}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public List<Comment> getListReply(int id_comment){
		return jdbcTemplate.query("SELECT * FROM comment WHERE id_parent = ?", new Object[]{id_comment}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public int getSumDetail(int id_product){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM comment WHERE id_product = ? AND id_parent = 0", new Object[]{id_product}, Integer.class);
	}

	public int delItem(int id_comment){
		return jdbcTemplate.update("DELETE FROM comment WHERE id_comment = ?", new Object[]{id_comment});
	}
	
	public Comment getItem(int id_comment){
		return jdbcTemplate.queryForObject("SELECT * FROM comment WHERE id_comment = ?", new Object[]{id_comment}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	
	public int editItem(int id_comment, String message) {
		return jdbcTemplate.update("UPDATE comment SET message = ? WHERE id_comment = ?", new Object[]{message, id_comment});
	}
	
	public List<Comment> getListSearch(String search){
		return jdbcTemplate.query("SELECT * FROM comment WHERE name LIKE '%"+ search +"%' OR email LIKE '%"+ search +"%' OR message LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Comment>(Comment.class));
	}
}
