package controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.BrandsDAO;
import dao.PaymentDAO;
import dao.PublicDAO;
import entities.Payment;

@Controller
public class AdminPaymentController {
	@Autowired
	private Defines defines;
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Payment");
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
	@RequestMapping("/admincp/payment")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listItem", paymentDAO.getList());
		return "admin.payment.index";
	}
	@RequestMapping("/admincp/payment/add")
	public String add(){
		return "admin.payment.add";
	}
	@RequestMapping(value="/admincp/payment/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Payment objItem, RedirectAttributes ra){
		if (paymentDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Payment "+ objItem.getName() +" is created!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/payment";
	}
	@RequestMapping("/admincp/payment/edit/{id_payment}")
	public String edit(@PathVariable("id_payment") int id_payment, ModelMap modelMap){
		modelMap.addAttribute("objItem", paymentDAO.getItem(id_payment));
		return "admin.payment.edit";
	}
	@RequestMapping(value="/admincp/payment/edit/{id_payment}",method=RequestMethod.POST)
	public String edit(@PathVariable("id_payment") int id_payment, @ModelAttribute("objItem") Payment objItem, RedirectAttributes ra){
		objItem.setId_payment(id_payment);
		if (paymentDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Payment Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/payment";
	}
	@RequestMapping("/admincp/payment/del/{id_payment}")
	public String del(@PathVariable("id_payment") int id_payment, RedirectAttributes ra){
		if (paymentDAO.delItem(id_payment) > 0){
			ra.addFlashAttribute("msg", "Delete Payment Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/payment";
	}
}
