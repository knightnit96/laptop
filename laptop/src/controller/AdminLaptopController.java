package controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import utils.LibraryFile;
import constant.Defines;
import dao.BrandsDAO;
import dao.LaptopDAO;
import dao.PublicDAO;
import entities.Brands;
import entities.Laptop;

@Controller
public class AdminLaptopController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private LaptopDAO laptopDAO;
	@Autowired
	private PublicDAO publicDAO;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Laptop");
		modelMap.addAttribute("listBrand", brandsDAO.getList());
		if (principal != null) {
			modelMap.addAttribute("objUserLogin", publicDAO.getUserLogin(principal.getName()));
			int comment = publicDAO.getUserLogin(principal.getName()).getNew_comment();
			int order = publicDAO.getUserLogin(principal.getName()).getNew_order();
			int contact = publicDAO.getUserLogin(principal.getName()).getNew_contact();
			if (comment == 0) {
				modelMap.addAttribute("listNewsCommentHeader", publicDAO.getListNewsCommentHeader(5));
			} else {
				modelMap.addAttribute("listNewsCommentHeader", publicDAO.getListNewsCommentHeader(comment));
			}
			if (order == 0) {
				modelMap.addAttribute("listNewsOrderHeader", publicDAO.getListNewsOrderHeader(5));
			} else {
				modelMap.addAttribute("listNewsOrderHeader", publicDAO.getListNewsOrderHeader(order));
			}
			if (contact == 0) {
				modelMap.addAttribute("listNewsContactHeader", publicDAO.getListNewsContactHeader(5));
			} else {
				modelMap.addAttribute("listNewsContactHeader", publicDAO.getListNewsContactHeader(contact));
			}
		}
	}
	@RequestMapping("/admincp/laptop/{name}")
	public String index(@RequestParam(value="page", defaultValue="1") int page, @PathVariable("name") String name, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		int totalPage = (int) Math.ceil((float)laptopDAO.getSumAll()/row_count);
		modelMap.addAttribute("totalPage1", totalPage);
		modelMap.addAttribute("listItem", laptopDAO.getList(offset, row_count));
		modelMap.addAttribute("tag", name);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("listItem1", laptopDAO.getList());
		return "admin.laptop.index";
	}
	@RequestMapping("/admincp/laptop/add")
	public String add(){
		return "admin.laptop.add";
	}
	@RequestMapping(value="/admincp/laptop/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Laptop objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			fileName = LibraryFile.rename(fileName);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_UPLOAD;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdir();
			}
			String fielPath = dirPath + File.separator + fileName;
			System.out.println(fielPath);
			File fileUpload = new File(fielPath);
			try {
				cmf.transferTo(fileUpload);
			} catch (Exception e) {
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}
		//thêm slide vào database
		objItem.setPicture(fileName);
		String productID = "100"+objItem.getId_product();
		int id_product = Integer.parseInt(productID);
		objItem.setId_product(id_product);
		if (laptopDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Add Laptop Successfully!");
			brandsDAO.updateTotal(objItem.getId_brand());
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/laptop/all";
	}
	@RequestMapping("/admincp/laptop/edit/{id_laptop}")
	public String edit(@PathVariable("id_laptop") int id_laptop, ModelMap modelMap){
		modelMap.addAttribute("objItem", laptopDAO.getItem(id_laptop));
		return "admin.laptop.edit";
	}
	@RequestMapping(value="/admincp/laptop/edit/{id_laptop}",method=RequestMethod.POST)
	public String edit(@PathVariable("id_laptop") int id_laptop, @ModelAttribute("objItem") Laptop objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		Laptop objLaptopOld = laptopDAO.getItem(id_laptop);
		if (!fileName.isEmpty()) {
			fileName = LibraryFile.rename(fileName);
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_UPLOAD;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdir();
			}
			String fielPath = dirPath + File.separator + fileName;
			System.out.println(fielPath);
			File fileUpload = new File(fielPath);
			try {
				cmf.transferTo(fileUpload);
			} catch (Exception e) {
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
			String old_pic = objLaptopOld.getPicture();
			//xóa ảnh cũ nếu có
			if (!old_pic.isEmpty()) {
				String filePath_Old = dirPath + File.separator + old_pic;
				File fileDel = new File(filePath_Old);
				fileDel.delete();
			}
		} else {
			fileName = objLaptopOld.getPicture();
		}
		//thêm slide vào database
		objItem.setPicture(fileName);
		objItem.setId_laptop(id_laptop);
		if (laptopDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Laptop Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/laptop/all";
	}
	@RequestMapping("/admincp/laptop/del/{id_laptop}")
	public String del(@PathVariable("id_laptop") int id_laptop, HttpServletRequest request, RedirectAttributes ra){
		Laptop objLaptop = laptopDAO.getItem(id_laptop);
		if (laptopDAO.delItem(id_laptop) > 0){
			if (!objLaptop.getPicture().isEmpty()) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + objLaptop.getPicture();
				File fileDel = new File(filePath);
				fileDel.delete();
			}
			ra.addFlashAttribute("msg", "Delete Laptop Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/laptop/all";
	}
	@RequestMapping("/admincp/laptop/detail/{id_laptop}")
	public String detail(@PathVariable("id_laptop") int id_laptop, ModelMap modelMap){
		modelMap.addAttribute("objItem", laptopDAO.getItem(id_laptop));
		return "admin.laptop.detail";
	}
	@RequestMapping("/admincp/laptop/search")
	public String search(@RequestParam("q") String search, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", laptopDAO.getListSearch(search));
		return "admin.laptop.search";
	}
}
