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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import utils.LibraryFile;
import utils.StringUtils;
import constant.Defines;
import dao.BrandsDAO;
import dao.PublicDAO;
import dao.UserDAO;
import entities.User;

@Controller
public class AdminUserController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private LibraryFile libraryFile;
	@Autowired
	private StringUtils stringUtils;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | User");
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
	@RequestMapping("/admincp/user")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_ADMIN();
		int totalPage = (int) Math.ceil((float)userDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", userDAO.getList(offset, row_count));
		return "admin.user.index";
	}
	@RequestMapping("/admincp/user/add")
	public String add(){
		return "admin.user.add";
	}
	@RequestMapping(value="/admincp/user/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") User objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		if (!userDAO.checkUser(objItem.getUsername())) {
			ra.addFlashAttribute("msg1", "Username đã tồn tại!");
			return "redirect:/admincp/user/add";
		}
		if (!userDAO.checkEmail(objItem.getEmail())) {
			ra.addFlashAttribute("msg1", "Email đã tồn tại!");
			return "redirect:/admincp/user/add";
		} 
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
		objItem.setAvatar(fileName);
		objItem.setPassword(stringUtils.md5(objItem.getPassword()));
		if (userDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Add User Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/user";
	}
	@RequestMapping("/admincp/user/edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap){
		modelMap.addAttribute("objItem", userDAO.getItem(id));
		return "admin.user.edit";
	}
	@RequestMapping(value="/admincp/user/edit/{id}",method=RequestMethod.POST)
	public String edit(@PathVariable("id") int id, @ModelAttribute("objItem") User objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		// xử lí upload ảnh
		String fileName = cmf.getOriginalFilename();
		User objUserOld = userDAO.getItem(id);
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
			String old_pic = objUserOld.getAvatar();
			//xóa ảnh cũ nếu có
			if (!old_pic.isEmpty()) {
				String filePath_Old = dirPath + File.separator + old_pic;
				File fileDel = new File(filePath_Old);
				fileDel.delete();
			}
		} else {
			fileName = objUserOld.getAvatar();
		}
		objItem.setAvatar(fileName);
		objItem.setId(id);
		if (!objItem.getPassword().isEmpty()){
			objItem.setPassword(stringUtils.md5(objItem.getPassword()));
		} else {
			objItem.setPassword(objUserOld.getPassword());
		}
		if (userDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit User Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/user";
	}
	@RequestMapping("/admincp/user/del/{id}")
	public String del(@PathVariable("id") int id, HttpServletRequest request, RedirectAttributes ra){
		User objUser = userDAO.getItem(id);
		if(!"admin".equals(userDAO.getItem(id).getUsername())){
			if (userDAO.delItem(id) > 0){
				if (!objUser.getAvatar().isEmpty()) {
					String filePath = request.getServletContext().getRealPath("files") + File.separator + objUser.getAvatar();
					File fileDel = new File(filePath);
					fileDel.delete();
				}
				ra.addFlashAttribute("msg", "Del User Successfully!");
			} else {
				ra.addFlashAttribute("msg1", "Failed to del!");
			}
		} else {
			ra.addFlashAttribute("msg1", "Bạn không có quyền xóa!");
		}
		return "redirect:/admincp/user";
	}
	@ResponseBody 
	@RequestMapping(value="/admincp/user/change-active",method=RequestMethod.POST)
	public String changeActive(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("aid"));
		int active = Integer.parseInt(request.getParameter("aactive"));
		String cmt = "";
		if (active == 1) {
				cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeActive("
						+ id + "," + 0 +")\">"
						+"<img src=\""+ request.getContextPath() +"/templates/admin/dist/img/disactive.png\" alt=\"Disactive\" width=\"20px\"></a>";
				userDAO.changeActive(0, id);	

		} else if (active == 0) {
				cmt = 	"<a href=\"javascript:void(0)\" onclick=\"changeActive("
						+ id + "," + 1 +")\">"
						+"<img src=\""+ request.getContextPath() +"/templates/admin/dist/img/active.png\" alt=\"Active\" width=\"20px\"></a>";
				userDAO.changeActive(1, id);
		}
		return cmt;
	}
	@RequestMapping("/admincp/user/search")
	public String search(@RequestParam("q") String search, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", userDAO.getListSearch(search));
		return "admin.user.search";
	}
}
