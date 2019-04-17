package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Laptop;

@Repository
public class LaptopDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Laptop> getList(){
		return jdbcTemplate.query("SELECT * FROM laptop", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public int addItem(Laptop objItem) {
		return jdbcTemplate.update("INSERT INTO laptop(name, id_brand, cpu, ram, display, hdd, graphic, os, battery, weight, picture, price, id_product) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", new Object[]{objItem.getName(), objItem.getId_brand(), objItem.getCpu(), objItem.getRam(), objItem.getDisplay(), objItem.getHdd(), objItem.getGraphic(), objItem.getOs(), objItem.getBattery(), objItem.getWeight(), objItem.getPicture(), objItem.getPrice(), objItem.getId_product()});
	}
	
	public Laptop getItem(int id_laptop){
		return jdbcTemplate.queryForObject("SELECT * FROM laptop WHERE id_laptop = ?", new Object[]{id_laptop}, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public int editItem(Laptop objItem) {
		return jdbcTemplate.update("UPDATE laptop SET name = ?, id_brand = ?, cpu = ?, ram = ?, display = ?, hdd = ?, graphic = ?, os = ?, battery = ?, weight = ?, picture = ?, price = ? WHERE id_laptop = ?", new Object[]{objItem.getName(), objItem.getId_brand(), objItem.getCpu(), objItem.getRam(), objItem.getDisplay(), objItem.getHdd(), objItem.getGraphic(), objItem.getOs(), objItem.getBattery(), objItem.getWeight(), objItem.getPicture(), objItem.getPrice(), objItem.getId_laptop()});
	}
	
	public int delItem(int id_laptop){
		return jdbcTemplate.update("DELETE FROM laptop WHERE id_laptop = ?", new Object[]{id_laptop});
	}
	
	public int getSumAll(){
		return jdbcTemplate.queryForObject("SELECT COUNT(*) AS total FROM laptop", Integer.class);
	}
	
	public List<Laptop> getList(int offset, int row_count){
		return jdbcTemplate.query("SELECT * FROM laptop LIMIT ?, ?", new Object[]{offset, row_count}, new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
	
	public List<Laptop> getListSearch(String search){
		return jdbcTemplate.query("SELECT * FROM laptop WHERE name LIKE '%"+ search +"%' OR cpu LIKE '%"+ search +"%' OR ram LIKE '%"+ search +"%' OR display LIKE '%"+ search +"%' OR hdd LIKE '%"+ search +"%' OR graphic LIKE '%"+ search +"%' OR os LIKE '%"+ search +"%' OR battery LIKE '%"+ search +"%' OR weight LIKE '%"+ search +"%' OR price LIKE '%"+ search +"%' OR id_product LIKE '%"+ search +"%'", new BeanPropertyRowMapper<Laptop>(Laptop.class));
	}
}
