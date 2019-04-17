package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Accessories;

@Repository
public class AccessoriesDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Accessories> getList(){
		return jdbcTemplate.query("SELECT * FROM accessories", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public int addItem(Accessories objItem) {
		return jdbcTemplate.update("INSERT INTO accessories(name, price, picture, preview, cat, id_product) VALUES(?, ?, ?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getPrice(), objItem.getPicture(), objItem.getPreview(), objItem.getCat(), objItem.getId_product()});
	}
	
	public Accessories getItem(int id_accessories){
		return jdbcTemplate.queryForObject("SELECT * FROM accessories WHERE id_accessories = ?", new Object[]{id_accessories}, new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public int editItem(Accessories objItem) {
		return jdbcTemplate.update("UPDATE accessories SET name = ?, price = ?, picture = ?, preview = ?, cat = ? WHERE id_accessories = ?", new Object[]{objItem.getName(), objItem.getPrice(), objItem.getPicture(), objItem.getPreview(), objItem.getCat(), objItem.getId_accessories()});
	}
	
	public int delItem(int id_accessories){
		return jdbcTemplate.update("DELETE FROM accessories WHERE id_accessories = ?", new Object[]{id_accessories});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM accessories", Integer.class);
	}
	
	public List<Accessories> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM accessories LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Accessories> getListSearch(String search){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE name LIKE '%"+ search +"%' OR price LIKE '%"+ search +"%' OR id_product LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Accessories> getListHeadphone(){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE cat = 'Headphone'", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Accessories> getListMouse(){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE cat = 'Mouse'", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
	
	public List<Accessories> getListKeyboard(){
		return jdbcTemplate.query("SELECT * FROM accessories WHERE cat = 'Keyboard'", new BeanPropertyRowMapper<Accessories>(Accessories.class));
	}
}
