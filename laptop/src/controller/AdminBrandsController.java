package controller;

import java.security.Principal;

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
import dao.PublicDAO;
import entities.Brands;

@Controller
public class AdminBrandsController {
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
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
	@RequestMapping("/admincp/brands")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_ADMIN();
		int totalPage = (int) Math.ceil((float)brandsDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", brandsDAO.getList(offset, row_count));
		return "admin.brands.index";
	}
	@RequestMapping("/admincp/brands/add")
	public String add(){
		return "admin.brands.add";
	}
	@RequestMapping(value="/admincp/brands/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Brands objItem, RedirectAttributes ra){
		if (brandsDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Brand "+ objItem.getName() +" is created!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/admincp/brands";
	}
	@RequestMapping("/admincp/brands/edit/{id_brand}&page={page}")
	public String edit(@PathVariable("page") int page, @PathVariable("id_brand") int id_brand, ModelMap modelMap){
		modelMap.addAttribute("objItem", brandsDAO.getItem(id_brand));
		modelMap.addAttribute("page", page);
		return "admin.brands.edit";
	}
	@RequestMapping(value="/admincp/brands/edit/{id_brand}&page={page}",method=RequestMethod.POST)
	public String edit(@PathVariable("page") int page, @PathVariable("id_brand") int id_brand, @ModelAttribute("objItem") Brands objItem, RedirectAttributes ra){
		objItem.setId_brand(id_brand);
		if (brandsDAO.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Edit Brand Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to edit!");
		}
		return "redirect:/admincp/brands?page="+page;
	}
	@RequestMapping("/admincp/brands/del/{id_brand}&page={page}")
	public String del(@PathVariable("page") int page, @PathVariable("id_brand") int id_brand, RedirectAttributes ra){
		if (brandsDAO.delItem(id_brand) > 0){
			ra.addFlashAttribute("msg", "Delete Brand Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to delete!");
		}
		return "redirect:/admincp/brands?page="+page;
	}
}
