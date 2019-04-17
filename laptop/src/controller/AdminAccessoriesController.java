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
import dao.AccessoriesDAO;
import dao.BrandsDAO;
import dao.PublicDAO;
import entities.Accessories;

@Controller
public class AdminAccessoriesController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private AccessoriesDAO accessoriesDAO;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Accessories");
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
	@RequestMapping("/admincp/accessories/{name}")
	public String index(@RequestParam(value="page", defaultValue="1") int page, @PathVariable("name") String name, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		int totalPageAll = (int) Math.ceil((float)accessoriesDAO.getSumAll()/row_count);
		modelMap.addAttribute("totalPageAll", totalPageAll);
		modelMap.addAttribute("listItemAll", accessoriesDAO.getList(offset, row_count));
		modelMap.addAttribute("listItemHeadphone", accessoriesDAO.getListHeadphone());
		modelMap.addAttribute("listItemMouse", accessoriesDAO.getListMouse());
		modelMap.addAttribute("listItemKeyboard", accessoriesDAO.getListKeyboard());
		modelMap.addAttribute("tag", name);
		modelMap.addAttribute("page", page);
		return "admin.accessories.index";
	}
	@RequestMapping("/admincp/accessories/add")
	public String add(){
		return "admin.accessories.add";
	}
	@RequestMapping(value="/admincp/accessories/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Accessories objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
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
		String productID = "200"+objItem.getId_product();
		int id_product = Integer.parseInt(productID);
		objItem.setId_product(id_product);
		if (accessoriesDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Add Accessories Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/accessories/all";
	}
	@RequestMapping("/admincp/accessories/edit/{id_accessories}")
	public String edit(@PathVariable("id_accessories") int id_accessories, ModelMap modelMap){
		modelMap.addAttribute("objItem", accessoriesDAO.getItem(id_accessories));
		return "admin.accessories.edit";
	}
	@RequestMapping(value="/admincp/accessories/edit/{id_accessories}",method=RequestMethod.POST)
	public String edit(@PathVariable("id_accessories") int id_accessories, @ModelAttribute("objItem") Accessories objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		Accessories objAccessoriesOld = accessoriesDAO.getItem(id_accessories);
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
			String old_pic = objAccessoriesOld.getPicture();
			//xóa ảnh cũ nếu có
			if (!old_pic.isEmpty()) {
				String filePath_Old = dirPath + File.separator + old_pic;
				File fileDel = new File(filePath_Old);
				fileDel.delete();
			}
		} else {
			fileName = objAccessoriesOld.getPicture();
		}
		//thêm slide vào database
		objItem.setPicture(fileName);
		objItem.setId_accessories(id_accessories);
		if (accessoriesDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Accessories Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/accessories/all";
	}
	@RequestMapping("/admincp/accessories/del/{id_accessories}")
	public String del(@PathVariable("id_accessories") int id_accessories, HttpServletRequest request, RedirectAttributes ra){
		Accessories objAccessories = accessoriesDAO.getItem(id_accessories);
		if (accessoriesDAO.delItem(id_accessories) > 0){
			if (!objAccessories.getPicture().isEmpty()) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + objAccessories.getPicture();
				File fileDel = new File(filePath);
				fileDel.delete();
			}
			ra.addFlashAttribute("msg", "Delete Accessories Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/accessories/all";
	}
	@RequestMapping("/admincp/accessories/search")
	public String search(@RequestParam("q1") String search, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", accessoriesDAO.getListSearch(search));
		return "admin.accessories.search";
	}
}
