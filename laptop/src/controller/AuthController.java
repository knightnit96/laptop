package controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import utils.SlugUtils;
import utils.StringUtils;
import constant.Defines;
import dao.BrandsDAO;
import dao.PublicDAO;
import dao.UserDAO;
import entities.Brands;
import entities.Product;
import entities.Wishlist;

@Controller
public class AuthController {
	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private StringUtils stringUtils;
	@Autowired
	private SlugUtils slugUtils;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal, HttpServletRequest request){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("listBrand", brandsDAO.getList());
		if (principal != null) {
			modelMap.addAttribute("objUserLogin", publicDAO.getUserLogin(principal.getName()));
		}
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		if (listProduct == null) {
			listProduct = new ArrayList<>();
		} 
		modelMap.addAttribute("listProduct", listProduct.size());
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
		if (listWishlist == null) {
			listWishlist = new ArrayList<>();
		} 
		modelMap.addAttribute("listWishlist", listWishlist.size());
	}
	@RequestMapping("/login")
	public String login(ModelMap modelMap, HttpServletRequest request){
		modelMap.addAttribute("title", "Login | KnightSHOP");
		Cookie[] cookies = request.getCookies();     
		for(int i = 0; i < cookies.length; i++)
		{ 
			Cookie c = cookies[i];
			if (c.getName().equals("username")){
				modelMap.addAttribute("usernamecookie", c.getValue());
			}
			if (c.getName().equals("password")){
				modelMap.addAttribute("passwordcookie", c.getValue());
			}
			if (c.getName().equals("check")){
				modelMap.addAttribute("checkremember", "checked");
			}
		}  
		return "auth.login";
	}
	@RequestMapping(value="/check-remember",method=RequestMethod.POST)
	public void login(HttpServletRequest request, HttpServletResponse response){
		String check = request.getParameter("acheck");
		if (check.equals("on")) {
			Cookie username = new Cookie("username", request.getParameter("ausername"));
			Cookie password = new Cookie("password", request.getParameter("apassword"));
			Cookie checkremember = new Cookie("check", "checked");
			username.setMaxAge(24*60*60);
			password.setMaxAge(24*60*60);
			checkremember.setMaxAge(24*60*60);
		    response.addCookie(username); 
			response.addCookie(password); 
			response.addCookie(checkremember);
		} else if (check.equals("off")) {
			Cookie username = new Cookie("username", request.getParameter("ausername"));
			Cookie password = new Cookie("password", request.getParameter("apassword"));
			Cookie checkremember = new Cookie("check", "checked");
			username.setMaxAge(0);
			password.setMaxAge(0);
			checkremember.setMaxAge(0);
		    response.addCookie(username); 
			response.addCookie(password); 
			response.addCookie(checkremember);
		}
	}
	@RequestMapping("/404")
	public String err404(ModelMap modelMap){
		modelMap.addAttribute("title", "404 Error");
		return "auth.err404";
	}
	@RequestMapping("/403")
	public String err403(ModelMap modelMap){
		modelMap.addAttribute("title", "403 Error");
		return "auth.err403";
	}
	@RequestMapping("/register")
	public String register(ModelMap modelMap){
		modelMap.addAttribute("title", "Register | KnightSHOP");
		return "auth.register";
	}
}
