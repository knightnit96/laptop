package controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class AdminController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
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
		modelMap.addAttribute("title", "AdminCP");
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
	@RequestMapping("/admincp")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("OrderNewest", publicDAO.getOrderNewest());
		modelMap.addAttribute("CommentNewest", publicDAO.getCommentNewest());
		modelMap.addAttribute("ContactNewest", publicDAO.getContactNewest());
		modelMap.addAttribute("LaptopNewest", publicDAO.getLaptopNewest());
		modelMap.addAttribute("laptopDell", publicDAO.getSumDell());
		modelMap.addAttribute("laptopAsus", publicDAO.getSumAsus());
		modelMap.addAttribute("laptopHp", publicDAO.getSumHp());
		modelMap.addAttribute("laptopAcer", publicDAO.getSumAcer());
		modelMap.addAttribute("laptopLenovo", publicDAO.getSumLenovo());
		modelMap.addAttribute("laptopMsi", publicDAO.getSumMsi());
		modelMap.addAttribute("laptopOthers", publicDAO.getSumLaptop()-publicDAO.getSumDell()-publicDAO.getSumAsus()-publicDAO.getSumHp()-publicDAO.getSumAcer()-publicDAO.getSumLenovo()-publicDAO.getSumMsi());
		modelMap.addAttribute("accessoriesMouse", publicDAO.getSumMouse());
		modelMap.addAttribute("accessoriesKeyboard", publicDAO.getSumKeyboard());
		modelMap.addAttribute("accessoriesHeadphone", publicDAO.getSumHeadphone());
		modelMap.addAttribute("accessoriesOthers", publicDAO.getSumAccessories()-publicDAO.getSumMouse()-publicDAO.getSumKeyboard()-publicDAO.getSumHeadphone());
		return "admin.admin.index";
	}
	@RequestMapping("/admincp/profile")
	public String profile(Principal principal){
		if (principal != null) {
		return "admin.admin.profile";
		}
		return "auth.err404";
	}
	@ResponseBody
	@RequestMapping(value="/admincp/edit-profile",method=RequestMethod.POST)
	public String edit_profile(Principal principal, HttpServletRequest request){
		String cmt = "";
		if (principal != null) {
			User objUser = publicDAO.getUserLogin(principal.getName());
			cmt = " <table class=\"table\">"
		         +"  <tr>"
		         +"     <th>Username:</th>"
		         +"     <td><input type=\"text\" value=\""+ objUser.getUsername() +"\" disabled style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Fullname:</th>"
		         +"     <td><input type=\"text\" required=\"required\" id=\"fullname\" name=\"fullname\" value=\""+ objUser.getFullname() +"\" placeholder=\"Enter fullname\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Email:</th>"
		         +"     <td><input type=\"email\" required=\"required\" id=\"email\" name=\"email\" value=\""+ objUser.getEmail() +"\" placeholder=\"Enter email\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Phone:</th>"
		         +"     <td><input type=\"number\" required=\"required\" id=\"phone\" name=\"phone\" value=\""+ objUser.getPhone() +"\" placeholder=\"Enter phone\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Facebook:</th>"
		         +"     <td><input type=\"url\" required=\"required\" id=\"linkface\" name=\"linkface\" value=\""+ objUser.getLinkface() +"\" placeholder=\"Enter facebook\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Password:</th>"
		         +"     <td><input type=\"password\" required=\"required\" id=\"password\" name=\"password\" value=\"\" placeholder=\"Enter password\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Confirm Password:</th>"
		         +"     <td><input type=\"password\" id=\"confirm_password\" name=\"confirm_password\" value=\"\" placeholder=\"Enter confirm password\" style=\"width: 350px\"/></td>"
		         +"   </tr>"
		         +"   <tr>"
		         +"     <th>Avatar:</th>"
		         +"     <td><input type=\"file\" id=\"hinhanh\" name=\"hinhanh\" placeholder=\"Enter avatar\" style=\"width: 300px\" /></td>"
		         +"   </tr>"
		         +"   <div id=\"image-holder\"></div><br />"
		         +" </table>";
		}
		return cmt;
	}
	@RequestMapping(value="/admincp/edit/profile",method=RequestMethod.POST)
	public String edit(@ModelAttribute("objItem") User objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, Principal principal){
		// xử lí upload ảnh
		if (principal != null) {
			User objUserOld = publicDAO.getUserLogin(principal.getName());
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
			objItem.setId(objUserOld.getId());
			if (!objItem.getPassword().isEmpty()){
				objItem.setPassword(stringUtils.md5(objItem.getPassword()));
			} else {
				objItem.setPassword(objUserOld.getPassword());
			}
			if (publicDAO.editItem(objItem) > 0){
				ra.addFlashAttribute("msg", "Successfully! Personal information was changed!");
			} else {
				ra.addFlashAttribute("msg1", "Failed to edit!");
			}
		}
		return "redirect:/admincp/profile";
	}
}
