package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Brands;

@Repository
public class BrandsDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Brands> getList(){
		return jdbcTemplate.query("SELECT * FROM brand", new BeanPropertyRowMapper<Brands>(Brands.class));
	}
	
	public int addItem(Brands objItem) {
		return jdbcTemplate.update("INSERT INTO brand(name, link) VALUES(?, ?)", new Object[]{objItem.getName(), objItem.getLink()});
	}
	
	public Brands getItem(int id_brand){
		return jdbcTemplate.queryForObject("SELECT * FROM brand WHERE id_brand = ?", new Object[]{id_brand}, new BeanPropertyRowMapper<Brands>(Brands.class));
	}
	
	public int editItem(Brands objItem) {
		return jdbcTemplate.update("UPDATE brand SET name = ?, link = ? WHERE id_brand = ?", new Object[]{objItem.getName(), objItem.getLink(), objItem.getId_brand()});
	}
	
	public int delItem(int id_brand){
		return jdbcTemplate.update("DELETE FROM brand WHERE id_brand = ?", new Object[]{id_brand});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM brand", Integer.class);
	}
	
	public List<Brands> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM brand LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Brands>(Brands.class));
	}

	public int updateTotal(int id_brand) {
		return jdbcTemplate.update("UPDATE brand SET total = total+1 WHERE id_brand = ?", new Object[]{id_brand});
	}
}
