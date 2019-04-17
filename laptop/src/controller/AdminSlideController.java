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
import dao.PublicDAO;
import dao.SlideDAO;
import entities.Slide;

@Controller
public class AdminSlideController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private SlideDAO slideDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private LibraryFile libraryFile;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Slide");
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
	@RequestMapping("/admincp/slide")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listItem", slideDAO.getList());
		return "admin.slide.index";
	}
	@RequestMapping("/admincp/slide/add")
	public String add(){
		return "admin.slide.add";
	}
	@RequestMapping(value="/admincp/slide/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Slide objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
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
		if (slideDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Add Slide Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/slide";
	}
	@RequestMapping("/admincp/slide/edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap){
		modelMap.addAttribute("objItem", slideDAO.getItem(id));
		return "admin.slide.edit";
	}
	@RequestMapping(value="/admincp/slide/edit/{id}",method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objItem") Slide objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		Slide objSlideOld = slideDAO.getItem(id);
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
			String old_pic = objSlideOld.getPicture();
			//xóa ảnh cũ nếu có
			if (!old_pic.isEmpty()) {
				String filePath_Old = dirPath + File.separator + old_pic;
				File fileDel = new File(filePath_Old);
				fileDel.delete();
			}
		} else {
			fileName = objSlideOld.getPicture();
		}
		//thêm slide vào database
		objItem.setPicture(fileName);
		objItem.setId(id);
		if (slideDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Slide Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/slide";
	}
	@RequestMapping("/admincp/slide/del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, RedirectAttributes ra){
		Slide objSlide = slideDAO.getItem(id);
		if (slideDAO.delItem(id) > 0){
			if (!objSlide.getPicture().isEmpty()) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + objSlide.getPicture();
				File fileDel = new File(filePath);
				fileDel.delete();
			}
			ra.addFlashAttribute("msg", "Delete Slide Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/slide";
	}
}
