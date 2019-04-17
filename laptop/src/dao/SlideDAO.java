package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Slide;

@Repository
public class SlideDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Slide> getList(){
		return jdbcTemplate.query("SELECT * FROM slide", new BeanPropertyRowMapper<Slide>(Slide.class));
	}
	
	public int addItem(Slide objItem) {
		return jdbcTemplate.update("INSERT INTO slide(name, preview, picture, id_laptop) VALUES(?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getPreview(), objItem.getPicture(), objItem.getId_laptop()});
	}
	
	public Slide getItem(int id){
		return jdbcTemplate.queryForObject("SELECT * FROM slide WHERE id = ?", new Object[]{id}, new BeanPropertyRowMapper<Slide>(Slide.class));
	}
	
	public int editItem(Slide objItem) {
		return jdbcTemplate.update("UPDATE slide SET name = ?, preview = ?, picture = ?, id_laptop = ? WHERE id = ?", new Object[]{objItem.getName(), objItem.getPreview(), objItem.getPicture(), objItem.getId_laptop(), objItem.getId()});
	}
	
	public int delItem(int id){
		return jdbcTemplate.update("DELETE FROM slide WHERE id = ?", new Object[]{id});
	}
}
