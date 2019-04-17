package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Video;

@Repository
public class VideoDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Video> getList(){
		return jdbcTemplate.query("SELECT * FROM video", new BeanPropertyRowMapper<Video>(Video.class));
	}
	
	public int addItem(Video objItem) {
		return jdbcTemplate.update("INSERT INTO video(name, link, picture) VALUES(?, ?, ?)", new Object[]{objItem.getName(), objItem.getLink(), objItem.getPicture()});
	}
	
	public Video getItem(int id){
		return jdbcTemplate.queryForObject("SELECT * FROM video WHERE id = ?", new Object[]{id}, new BeanPropertyRowMapper<Video>(Video.class));
	}
	
	public int editItem(Video objItem) {
		return jdbcTemplate.update("UPDATE video SET name = ?, link = ?, picture = ? WHERE id = ?", new Object[]{objItem.getName(), objItem.getLink(), objItem.getPicture(), objItem.getId()});
	}
	
	public int delItem(int id){
		return jdbcTemplate.update("DELETE FROM video WHERE id = ?", new Object[]{id});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM video", Integer.class);
	}
	
	public List<Video> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM video LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Video>(Video.class));
	}
}
