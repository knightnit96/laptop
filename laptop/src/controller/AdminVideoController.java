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
import dao.VideoDAO;
import entities.Video;

@Controller
public class AdminVideoController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private VideoDAO videoDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private LibraryFile libraryFile;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Video");
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
	@RequestMapping("/admincp/video")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		modelMap.addAttribute("listItem", videoDAO.getList());
		return "admin.video.index";
	}
	@RequestMapping("/admincp/video/add")
	public String add(){
		return "admin.video.add";
	}
	@RequestMapping(value="/admincp/video/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Video objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
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
		//thêm video vào database
		objItem.setPicture(fileName);
		if (videoDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Add Video Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/video";
	}
	@RequestMapping("/admincp/video/edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap){
		modelMap.addAttribute("objItem", videoDAO.getItem(id));
		return "admin.video.edit";
	}
	@RequestMapping(value="/admincp/video/edit/{id}",method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objItem") Video objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		Video objVideoOld = videoDAO.getItem(id);
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
			String old_pic = objVideoOld.getPicture();
			//xóa ảnh cũ nếu có
			if (!old_pic.isEmpty()) {
				String filePath_Old = dirPath + File.separator + old_pic;
				File fileDel = new File(filePath_Old);
				fileDel.delete();
			}
		} else {
			fileName = objVideoOld.getPicture();
		}
		//thêm video vào database
		objItem.setPicture(fileName);
		objItem.setId(id);
		if (videoDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Video Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/video";
	}
	@RequestMapping("/admincp/video/del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, RedirectAttributes ra){
		Video objVideo = videoDAO.getItem(id);
		if (videoDAO.delItem(id) > 0){
			if (!objVideo.getPicture().isEmpty()) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + objVideo.getPicture();
				File fileDel = new File(filePath);
				fileDel.delete();
			}
			ra.addFlashAttribute("msg", "Delete Video Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/video";
	}
}
