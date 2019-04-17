package controller;

import java.security.Principal;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.BrandsDAO;
import dao.ContactDAO;
import dao.PublicDAO;
import dao.UserDAO;
import entities.Contact;

@Controller
public class AdminContactController {
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PublicDAO publicDAO;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Brands");
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
	@RequestMapping("/admincp/contact")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap, Principal principal){
		int row_count = defines.getROW_COUNT_ADMIN();
		int totalPage = (int) Math.ceil((float)contactDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", contactDAO.getList(offset, row_count));
		userDAO.editContact(0, publicDAO.getUserLogin(principal.getName()).getId());
		return "admin.contact.index";
	}
	@RequestMapping(value="/contact/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Contact objItem, RedirectAttributes ra){
		if (contactDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Thank you for your suggestions!");
			userDAO.editContact();
		} else {
			ra.addFlashAttribute("msg1", "Suggestions failed!");
		}
		return "redirect:/lien-he";
	}
	@RequestMapping("/admincp/contact/del/{id}")
	public String del(@PathVariable("id") int id, RedirectAttributes ra){
		if (contactDAO.delItem(id) > 0){
			ra.addFlashAttribute("msg", "Delete Contact Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/contact";
	}
	@RequestMapping(value="/admincp/contact/send",method=RequestMethod.POST)
	public String send(@ModelAttribute("objItem") Contact objItem, RedirectAttributes ra){
		Email email = new SimpleEmail();
		// Cấu hình thông tin Email Server
        email.setHostName("smtp.googlemail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator("knightnit96@gmail.com","thuan3762576"));
        
        email.setSSLOnConnect(true);
        try {
        	// Người gửi
			email.setFrom("knightnit96@gmail.com");
			// Tiêu đề
	        email.setSubject(objItem.getSubject());
	        // Nội dung email
	        email.setMsg(objItem.getMessage());
	        // Người nhận
	        email.addTo(objItem.getEmail());            
	        email.send();
	        ra.addFlashAttribute("msg", "Mailing Successfully!");
	        if (contactDAO.getItem(objItem.getEmail()).getReply() == 0){
				contactDAO.setReply(1, objItem.getEmail());
			}
		} catch (EmailException e) {
			e.printStackTrace();
			ra.addFlashAttribute("msg1", "Mailing Failed!");
		}
		return "redirect:/admincp/contact";
	}
	@RequestMapping("/admincp/contact/search")
	public String search(@RequestParam("q") String search, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", contactDAO.getListSearch(search));
		return "admin.contact.search";
	}
}
