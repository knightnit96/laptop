package controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import utils.SlugUtils;
import utils.StringUtils;
import constant.Defines;
import dao.AccessoriesDAO;
import dao.BrandsDAO;
import dao.CommentDAO;
import dao.LaptopDAO;
import dao.OrderDAO;
import dao.PaymentDAO;
import dao.PublicDAO;
import dao.SlideDAO;
import dao.UserDAO;
import dao.VideoDAO;
import entities.Accessories;
import entities.Laptop;
import entities.Order;
import entities.Product;
import entities.Slide;
import entities.User;
import entities.Wishlist;

@Controller
public class PublicController {
	private final String DIR_UPLOAD = "files";
	@Autowired
	private Defines defines;
	@Autowired
	private SlideDAO slideDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private VideoDAO videoDAO;
	@Autowired
	private LaptopDAO laptopDAO;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private AccessoriesDAO accessoriesDAO;
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private LibraryFile libraryFile;
	@Autowired
	private StringUtils stringUtils;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal, HttpServletRequest request){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("slugUtils", slugUtils);
		List<Slide> listSlide = slideDAO.getList();
		for (Slide objSlide : listSlide) {
			objSlide.setPname(laptopDAO.getItem(objSlide.getId_laptop()).getName());
			objSlide.setId_product(laptopDAO.getItem(objSlide.getId_laptop()).getId_product());
		}
		modelMap.addAttribute("listSlide", listSlide);
		modelMap.addAttribute("listBrand", brandsDAO.getList());
		modelMap.addAttribute("totalHeadphone", publicDAO.getSumAllAccessories("headphone"));
		modelMap.addAttribute("totalMouse", publicDAO.getSumAllAccessories("mouse"));
		modelMap.addAttribute("totalKeyboard", publicDAO.getSumAllAccessories("keyboard"));
		if (principal != null) {
			modelMap.addAttribute("objUserLogin", publicDAO.getUserLogin(principal.getName()));
		}
		int row_count_1 = 3;
		int total = (int) Math.ceil((float)videoDAO.getSumAll()/row_count_1);
		for (int i = 1; i <= total; i++) {
			int offset = (i - 1)*row_count_1;
			modelMap.addAttribute("listVideo"+i, publicDAO.getList(offset, row_count_1));
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
	@RequestMapping("")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("listLaptopNews", publicDAO.getListLaptopNews());
		modelMap.addAttribute("listLaptopCheap", publicDAO.getListLaptopCheap());
		modelMap.addAttribute("listAccessoriesNews", publicDAO.getListAccessoriesNews());
		modelMap.addAttribute("listLaptopIndex", publicDAO.getListLaptopIndex());
		modelMap.addAttribute("listAccessoriesIndex", publicDAO.getListAccessoriesIndex());
		modelMap.addAttribute("title", "Home | KnightSHOP");
		return "public.public.index";
	}
	@RequestMapping("/laptop")
	public String laptop(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_PUBLIC();
		int totalPage = (int) Math.ceil((float)laptopDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", laptopDAO.getList(offset, row_count));
		modelMap.addAttribute("title", "Laptop | KnightSHOP");
		return "public.public.laptop";
	}
	@RequestMapping("/laptop/{slug}-{id_brand}")
	public String laptop1(@PathVariable("slug") String slug, @PathVariable("id_brand") int id_brand, @RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_PUBLIC();
		int totalPage = (int) Math.ceil((float)publicDAO.getSumAllBrand(id_brand)/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", publicDAO.getListBrand(id_brand, offset, row_count));
		modelMap.addAttribute("title", "Laptop | KnightSHOP");
		modelMap.addAttribute("tag", id_brand);
		modelMap.addAttribute("slug", slug);
		return "public.public.laptopDetail";
	}
	@RequestMapping("/phu-kien")
	public String accessories(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_PUBLIC();
		int totalPage = (int) Math.ceil((float)accessoriesDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", accessoriesDAO.getList(offset, row_count));
		modelMap.addAttribute("title", "Accessories | KnightSHOP");
		return "public.public.accessories";
	}
	@RequestMapping("/phu-kien/{name}")
	public String accessories1(@PathVariable("name") String name, @RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap){
		int row_count = defines.getROW_COUNT_PUBLIC();
		int totalPage = (int) Math.ceil((float)publicDAO.getSumAllAccessories(name)/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", publicDAO.getListAccessories(name, offset, row_count));
		modelMap.addAttribute("title", "Accessories | KnightSHOP");
		modelMap.addAttribute("tag1", ""+name);
		return "public.public.accessoriesDetail";
	}
	@RequestMapping("/lien-he")
	public String contact(ModelMap modelMap){
		modelMap.addAttribute("title", "Contact | KnightSHOP");
		return "public.public.contact";
	}
	@RequestMapping("/{slug}-{id_product}.html")
	public String detail(@PathVariable("id_product") String id_product1, ModelMap modelMap, HttpServletRequest request, Principal principal){
		int id_product = Integer.parseInt(id_product1);
		if (id_product1.charAt(0) == '1') {
			modelMap.addAttribute("objItem", publicDAO.getItemLaptop(id_product));
			modelMap.addAttribute("title", publicDAO.getItemLaptop(id_product).getName()+" | KnightSHOP");
			modelMap.addAttribute("typeproduct", "laptop");
			modelMap.addAttribute("listItemLQ", publicDAO.getItemLaptopLQ(id_product,  publicDAO.getItemLaptop(id_product).getId_brand()));
		} else if (id_product1.charAt(0) == '2'){
			modelMap.addAttribute("objItem", publicDAO.getItemAccessories(id_product));
			modelMap.addAttribute("title", publicDAO.getItemAccessories(id_product).getName()+" | KnightSHOP");
			modelMap.addAttribute("typeproduct", "accessories");
			modelMap.addAttribute("listItemLQ", publicDAO.getItemAccessoriesLQ(id_product,  publicDAO.getItemAccessories(id_product).getCat()));
		}
		modelMap.addAttribute("newproduct", "");
		for (Laptop objItem : publicDAO.getListLaptopIndex()) {
			if (id_product == objItem.getId_product()) {
				modelMap.addAttribute("newproduct", "new");
			}
		}
		for (Accessories objItem : publicDAO.getListAccessoriesNews()) {
			if (id_product == objItem.getId_product()) {
				modelMap.addAttribute("newproduct", "new");
			}
		}
		if (principal != null) {
			request.setAttribute("emailUserLogin", publicDAO.getUserLogin(principal.getName()).getEmail());
			request.setAttribute("roleUserLogin", publicDAO.getUserLogin(principal.getName()).getRole());
		}
		request.setAttribute("listCmt", commentDAO.getList(id_product));
		modelMap.addAttribute("totalReview", commentDAO.getSumDetail(id_product));
		return "public.public.detail";
	}
	@ResponseBody 
	@RequestMapping(value="/buy-product",method=RequestMethod.POST)
	public String buy_product(HttpServletRequest request, ModelMap modelMap){
		String id_product1 = request.getParameter("aid_product");
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		int quantity = Integer.parseInt(request.getParameter("aquantity"));
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		if (listProduct == null) {
			listProduct = new ArrayList<>();
		}
		String name = "";
		String picture = "";
		int price = 0;
		if (id_product1.charAt(0) == '1') {
			name = publicDAO.getItemLaptop(id_product).getName();
			picture = publicDAO.getItemLaptop(id_product).getPicture();
			price = publicDAO.getItemLaptop(id_product).getPrice();
		} else if (id_product1.charAt(0) == '2'){
			name = publicDAO.getItemAccessories(id_product).getName();
			picture = publicDAO.getItemAccessories(id_product).getPicture();
			price = publicDAO.getItemAccessories(id_product).getPrice();
		}
		Product objProduct = new Product(0, 0, id_product, quantity, name, picture, price);
		boolean check = true ;
		for(Product item : listProduct)
		{
			if(item.getId_product() == id_product){	
				check = true;
				item.setQuantity(quantity+item.getQuantity());
				break;
			} else {
			 	check = false;
			}
		}
		if(listProduct.size()==0 || check == false){
			listProduct.add(objProduct);
		}
		session.setAttribute("listProduct", listProduct);
		cmt = "<i class=\"fa fa-shopping-cart\"></i> Cart ("+ listProduct.size() +")</a>";
		return cmt;
	}
	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, ModelMap modelMap){
		HttpSession session = request.getSession();
		modelMap.addAttribute("title", "Cart | KnightSHOP");
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		if (listProduct == null) {
			modelMap.addAttribute("cartempty", "cartempty");
		} 
		modelMap.addAttribute("listCart", listProduct);
		return "public.public.cart";
	}
	@ResponseBody 
	@RequestMapping(value="/set-quantity",method=RequestMethod.POST)
	public String set_quantity(HttpServletRequest request, ModelMap modelMap){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		int quantity = Integer.parseInt(request.getParameter("aquantity"));
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		for(Product item : listProduct){
			if(item.getId_product() == id_product){	
				item.setQuantity(quantity);
				cmt = "<p class=\"cart_total_price\">"+ item.getPrice()*quantity +" VND</p>";
				break;
			} 
		}
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest request, ModelMap modelMap){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		for (int i = 0; i < listProduct.size(); i++) {
			if(listProduct.get(i).getId_product() == id_product){	
				listProduct.remove(i);
				cmt = "";
				break;
			} 
		}
		session.setAttribute("listProduct", listProduct);
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/deletecart",method=RequestMethod.POST)
	public String deleteCart(HttpServletRequest request, ModelMap modelMap){
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		cmt = "<i class=\"fa fa-shopping-cart\"></i> Cart ("+ listProduct.size() +")</a>";
		return cmt;
	}
	@RequestMapping("/order")
	public String order(ModelMap modelMap, HttpServletRequest request){
		HttpSession session = request.getSession();
		modelMap.addAttribute("title", "Order | KnightSHOP");
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		Order objOrder = (Order) session.getAttribute("getOrder");
		int total = 0;
		if (listProduct == null) {
			modelMap.addAttribute("cartempty", "cartempty");
		} else {
			for(Product item : listProduct)
			{
				total += item.getPrice()*item.getQuantity();
			}
			modelMap.addAttribute("totalPrice", total);
		}
		modelMap.addAttribute("listCart", listProduct);
		modelMap.addAttribute("objOrder", objOrder);
		return "public.public.order";
	}
	@RequestMapping("/order/pay")
	public String pay(ModelMap modelMap, HttpServletRequest request){
		modelMap.addAttribute("listPayment", paymentDAO.getList());
		HttpSession session = request.getSession();
		modelMap.addAttribute("title", "Order | KnightSHOP");
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		Order objOrder = (Order) session.getAttribute("getOrder");
		int total = 0;
		if (listProduct == null) {
			modelMap.addAttribute("cartempty", "cartempty");
		} else {
			if (objOrder == null) {
				modelMap.addAttribute("orderempty", "orderempty");
			} else {
				for(Product item : listProduct)
				{
					total += item.getPrice()*item.getQuantity();
				}
				modelMap.addAttribute("totalPrice", total);
			}
		}
		modelMap.addAttribute("listCart", listProduct);
		return "public.public.pay";
	}
	@RequestMapping("/order/pay/success")
	public String pay_success(RedirectAttributes ra, HttpServletRequest request, Principal principal){
		String checksum = request.getParameter("Checksum");
		HttpSession session = request.getSession();
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		Order objOrder = (Order) session.getAttribute("getOrder");
		if (listProduct == null) {
			return "redirect:/";
		} else {
			if (objOrder == null) {
				return "redirect:/";
			} else {
				if (checksum != "8945f2d9df5d044b7f6a687ddeda9c81") {
					return "redirect:/";
				} else {
					orderDAO.addItem(objOrder);
					for (Product objProduct : listProduct) {
						objProduct.setId_order(orderDAO.getItem().getId_order());
						orderDAO.addOrder2(objProduct);
					}
					session.invalidate();
					userDAO.editOrder();
					ra.addFlashAttribute("msg5", "Thank you");
					if (principal != null) {
						return "redirect:/profile";
					}
					return "redirect:/";
				}
			}
		}
	}
	@ResponseBody 
	@RequestMapping(value="/add-wishlist",method=RequestMethod.POST)
	public String add_wishlist(HttpServletRequest request, ModelMap modelMap){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		int price = Integer.parseInt(request.getParameter("aprice"));
		String name = request.getParameter("aname");
		String picture = request.getParameter("apicture");
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
		if (listWishlist == null) {
			listWishlist = new ArrayList<>();
		}
		Wishlist objWishlist = new Wishlist(id_product, price, name, picture);
		boolean check = true ;
		for(Wishlist item : listWishlist)
		{
			if(item.getId_product() == id_product){	
				check = true;
				break;
			} else {
			 	check = false;
			}
		}
		if(listWishlist.size()==0 || check == false){
			listWishlist.add(objWishlist);
		}
		session.setAttribute("listWishlist", listWishlist);
		cmt = "<i class=\"fa fa-star\"></i> Wishlist ("+ listWishlist.size() +")</a>";
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/checkwishlist",method=RequestMethod.POST)
	public int checkWishlist(HttpServletRequest request, ModelMap modelMap){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		String name = request.getParameter("aname");
		int cmt = 1;
		HttpSession session = request.getSession();
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
		if (listWishlist != null) {
			for(Wishlist item : listWishlist)
			{
				if(item.getId_product() == id_product){	
					cmt = 2;
					break;
				}
			}
		}
		return cmt;
	}
	@RequestMapping("/wishlist")
	public String wishlist(HttpServletRequest request, ModelMap modelMap){
		HttpSession session = request.getSession();
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
		if (listWishlist == null) {
			modelMap.addAttribute("wishlistempty", "wishlistempty");
		} 
		modelMap.addAttribute("title", "Wishlist | KnightSHOP");
		return "public.public.wishlist";
	}
	@RequestMapping("/search")
	public String search(@RequestParam(value="page", defaultValue="1") int page, @RequestParam("q") String search, ModelMap modelMap){
		modelMap.addAttribute("listLaptopSearch", publicDAO.getListLaptopSearch(search));
		modelMap.addAttribute("listAccessoriesSearch", publicDAO.getListAccessoriesSearch(search));
		modelMap.addAttribute("title", "Search | KnightSHOP");
		return "public.public.search";
	}
	@ResponseBody 
	@RequestMapping(value="/search-product",method=RequestMethod.POST)
	public String search_product(HttpServletRequest request, ModelMap modelMap){
		int id_brand = Integer.parseInt(request.getParameter("aid"));
		int price = Integer.parseInt(request.getParameter("aprice"));
		String ram = request.getParameter("aram");
		String cpu = request.getParameter("acpu");
		String hdd = request.getParameter("ahdd");
		String cmt = "";
		for (Laptop objLaptop : publicDAO.getListLaptopProduct(id_brand, price, ram, cpu, hdd)) {
			
			cmt += "<div class=\"col-sm-4\">"
						+"	<div class=\"product-image-wrapper\">"
						+"		<div class=\"single-products\">"
						+"				<div class=\"productinfo text-center\">"
						+"					<img src=\""+ request.getContextPath() +"/files/"+ objLaptop.getPicture() +"\" alt=\"\" width=\"258px\" height=\"258px\"/>"
						+"					<h2>"+ objLaptop.getPrice() +" VND</h2>"
						+"					<p>"+ objLaptop.getName() +"</p>"
						+"					<a href=\"javascript:void(0)\" onclick=\"buy_product("+ objLaptop.getId_product() +",1, '"+ objLaptop.getName() +"')\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
						+"				</div>"
						+"				<div class=\"product-overlay\">"
						+"					<div class=\"overlay-content\">"
						+"						<p>CPU: "+ objLaptop.getCpu() +"</p>"
						+"						<p>Ram: "+ objLaptop.getRam() +"</p>"
						+"						<p>Display: "+ objLaptop.getDisplay() +"</p>"
						+"						<p>HDD: "+ objLaptop.getHdd() +"</p>"
						+"						<p>Graphic: "+ objLaptop.getGraphic() +"</p>"
						+"						<p>Os: "+ objLaptop.getOs() +"</p>"
						+"						<p>Battery: "+ objLaptop.getBattery() +" Cell</p>"
						+"						<p>Weight: "+ objLaptop.getWeight() +" Kg</p>"
						+"						<h2>"+ objLaptop.getPrice() +" VND</h2>"
						+"						<a href=\""+ request.getContextPath() +"/"+ slugUtils.makeSlug(objLaptop.getName()) +"-"+ objLaptop.getId_product() +".html\"><p>"+ objLaptop.getName() +"</p></a>"
						+"						<a href=\"javascript:void(0)\" onclick=\"buy_product("+ objLaptop.getId_product() +",1, '"+ objLaptop.getName() +"')\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
						+"					</div>"
						+"				</div>"
						+"		</div>"
						+"		<div class=\"choose\">"
						+"			<ul class=\"nav nav-pills nav-justified\">"
						+"				<li><a href=\"javascript:void(0)\" onclick=\"add_wishlist("+ objLaptop.getId_product() +", '"+ objLaptop.getName() +"', '"+ objLaptop.getPicture() +"', "+ objLaptop.getPrice() +")\"><i class=\"fa fa-plus-square\"></i>Wishlist</a></li>"
						+"				<li><a href=\""+ request.getContextPath() +"/"+ slugUtils.makeSlug(objLaptop.getName()) +"-"+ objLaptop.getId_product() +".html\"><i class=\"fa fa-info-circle\"></i>Chi tiết</a></li>"
						+"			</ul>"
						+"		</div>"
						+"	</div>"
						+"	</div>";
		}
		
		cmt = "<div class=\"features_items\"><!--features_items-->"
						+"<h2 class=\"title text-center\">Results</h2>"
						+cmt
						+"</div><!--features_items-->";
		return cmt;
	}
	@RequestMapping("/profile")
	public String profile(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("title", "Profile | KnightSHOP");
		if (principal != null) {
			modelMap.addAttribute("listHistory", publicDAO.getListHistory(publicDAO.getUserLogin(principal.getName()).getEmail()));
		}
		return "public.public.profile";
	}
	@ResponseBody 
	@RequestMapping(value="/delete-wishlist-product",method=RequestMethod.POST)
	public String delete_wishlist_product(HttpServletRequest request, ModelMap modelMap){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
		for (int i = 0; i < listWishlist.size(); i++) {
			if(listWishlist.get(i).getId_product() == id_product){	
				listWishlist.remove(i);
				cmt = "";
				break;
			} 
		}
		session.setAttribute("listWishlist", listWishlist);
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/deletewishlist",method=RequestMethod.POST)
	public String deleteWishlist(HttpServletRequest request, ModelMap modelMap){
		String cmt = "";
		HttpSession session = request.getSession();
		ArrayList<Wishlist> listWishlist = (ArrayList<Wishlist>)session.getAttribute("listWishlist");
 		cmt = "<i class=\"fa fa-star\"></i> Wishlist ("+ listWishlist.size() +")</a>";
		return cmt;
	}
	@RequestMapping(value="/add-user",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") User objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, ModelMap modelMap){
		modelMap.addAttribute("title", "Register | KnightSHOP");
		if (!userDAO.checkUser(objItem.getUsername())) {
			modelMap.addAttribute("msg2", "Username available! Please enter again with a different username!");
			return "auth.register";
		}
		if (!userDAO.checkEmail(objItem.getEmail())) {
			modelMap.addAttribute("msg2", "Email available! Please enter again with a different email!");
			return "auth.register";
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
		if (publicDAO.addItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Created Successfully!");
		} else {
			ra.addFlashAttribute("msg1", "Failed to create!");
		}
		return "redirect:/login";
	}
	@ResponseBody 
	@RequestMapping(value="/edit-user",method=RequestMethod.POST)
	public String edit_user(HttpServletRequest request, ModelMap modelMap, Principal principal){
		String cmt = "";
		if (principal != null) {
			User objUser = publicDAO.getUserLogin(principal.getName());
			cmt =  "<input type=\"text\" value=\""+ objUser.getUsername() +"\" disabled/>"
				  +"<input type=\"text\" required=\"required\" id=\"fullname\" name=\"fullname\" value=\""+ objUser.getFullname() +"\" placeholder=\"Enter fullname\"/>"
				  +"<input type=\"password\" required=\"required\" id=\"password\" name=\"password\" value=\"\" placeholder=\"Enter password\"/>"
				  +"<input type=\"password\" id=\"confirm_password\" name=\"confirm_password\" value=\"\" placeholder=\"Enter confirm password\"/>"
				  +"<input type=\"email\" required=\"required\" id=\"email\" name=\"email\" value=\""+ objUser.getEmail() +"\" placeholder=\"Enter email\"/>"
				  +"<input type=\"number\" required=\"required\" id=\"phone\" name=\"phone\" value=\""+ objUser.getPhone() +"\" placeholder=\"Enter phone\"/>"
				  +"<input type=\"url\" required=\"required\" id=\"linkface\" name=\"linkface\" value=\""+ objUser.getLinkface() +"\" placeholder=\"Enter facebook\"/>"
				  +"<input type=\"text\" value=\"Role: "+ objUser.getRole() +"\" disabled/>"
				  +"<input type=\"file\" id=\"hinhanh\" name=\"hinhanh\" placeholder=\"Enter avatar\" style=\"margin-top : 10px\"/>"
				  +"<div id=\"image-holder\"></div><br />"
				  +"<a><button type=\"submit\"  class=\"btn btn-default\" style=\"display: inline-block;\">Save</button></a>"
				  +"<a href=\"javascript:void(0)\" onclick=\"cancel_edit()\"><button type=\"button\"  class=\"btn btn-default\" style=\"display: inline-block;\">Cancel</button></a>";
		}
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/cancel-edit",method=RequestMethod.POST)
	public String cancel_edit(HttpServletRequest request, ModelMap modelMap, Principal principal){
		String cmt = "";
		if (principal != null) {
			User objUser = publicDAO.getUserLogin(principal.getName());
			cmt =  "<input type=\"text\" value=\"Username: "+ objUser.getUsername() +"\" disabled/>"
				  +"<input type=\"text\" value=\"Fullname: "+ objUser.getFullname() +"\" disabled/>"
				  +"<input type=\"text\" value=\"Email:: "+ objUser.getEmail() +"\" disabled/>"
				  +"<input type=\"text\" value=\"Phone:: "+ objUser.getPhone() +"\" disabled/>"
				  +"<input type=\"text\" value=\"Facebook:: "+ objUser.getLinkface() +"\" disabled/>"
				  +"<input type=\"text\" value=\"Role: "+ objUser.getRole() +"\" disabled/>"
				  +"<a href=\"javascript:void(0)\" onclick=\"editUser()\"><button type=\"button\"  class=\"btn btn-default\" style=\"display: inline-block;\">Edit</button></a>"
				  +"<a href=\""+ request.getContextPath() +"\"><button type=\"button\"  class=\"btn btn-default\" style=\"display: inline-block;\">Back to Home</button></a>";
		}
		return cmt;
	}
	@RequestMapping(value="/user/edit-user",method=RequestMethod.POST)
	public String editUser(@ModelAttribute("objItem") User objItem, @RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra, Principal principal){
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
				ra.addFlashAttribute("msg1", "Successfully! Personal information was changed!");
			} else {
				ra.addFlashAttribute("msg1", "Failed to edit!");
			}
		}
		return "redirect:/profile";
	}
	@RequestMapping("order/detail/{id_order}")
	public String detail(@PathVariable("id_order") int id_order, ModelMap modelMap, RedirectAttributes ra, Principal principal){
		if (principal != null) {
			if (publicDAO.getItemOrder(id_order) == null) {
				return "redirect:/profile";
			}
			if (publicDAO.getUserLogin(principal.getName()).getRole().equals("ADMIN")) {
				modelMap.addAttribute("objItem", publicDAO.getItemOrder(id_order));
				modelMap.addAttribute("objPayment", paymentDAO.getItem(publicDAO.getItemOrder(id_order).getId_payment()));
				List<Product> lisProduct = (List<Product>) publicDAO.getListOrder(id_order);
				for (Product objProduct : lisProduct) {
					String id_product = Integer.toString(objProduct.getId_product());
					if (id_product.charAt(0) == '1') {
						Laptop objLaptop = publicDAO.getItemLaptop(objProduct.getId_product());
						objProduct.setName(objLaptop.getName());
						objProduct.setPrice(objLaptop.getPrice());
					} else if (id_product.charAt(0) == '2'){
						Accessories objAccessories = publicDAO.getItemAccessories(objProduct.getId_product());
						objProduct.setName(objAccessories.getName());
						objProduct.setPrice(objAccessories.getPrice());
					}
				}
				modelMap.addAttribute("listOrder", lisProduct);
			} else {
				if (publicDAO.getUserLogin(principal.getName()).getEmail().equals(publicDAO.getItemOrder(id_order).getEmail())) {
					modelMap.addAttribute("objItem", publicDAO.getItemOrder(id_order));
					modelMap.addAttribute("objPayment", paymentDAO.getItem(publicDAO.getItemOrder(id_order).getId_payment()));
					List<Product> lisProduct = (List<Product>) publicDAO.getListOrder(id_order);
					for (Product objProduct : lisProduct) {
						String id_product = Integer.toString(objProduct.getId_product());
						if (id_product.charAt(0) == '1') {
							Laptop objLaptop = publicDAO.getItemLaptop(objProduct.getId_product());
							objProduct.setName(objLaptop.getName());
							objProduct.setPrice(objLaptop.getPrice());
						} else if (id_product.charAt(0) == '2'){
							Accessories objAccessories = publicDAO.getItemAccessories(objProduct.getId_product());
							objProduct.setName(objAccessories.getName());
							objProduct.setPrice(objAccessories.getPrice());
						}
					}
					modelMap.addAttribute("listOrder", lisProduct);
				} else {
					return "redirect:/profile";
				}
			}
		}
		return "public.order.detail";
	}
	@RequestMapping("order/detail/{id_order}/print")
	public String detailPrint(@PathVariable("id_order") int id_order, ModelMap modelMap, RedirectAttributes ra, Principal principal){
		if (principal != null) {
			if (publicDAO.getItemOrder(id_order) == null) {
				return "redirect:/profile";
			}
			if (publicDAO.getUserLogin(principal.getName()).getRole().equals("ADMIN")) {
				modelMap.addAttribute("objItem", publicDAO.getItemOrder(id_order));
				modelMap.addAttribute("objPayment", paymentDAO.getItem(publicDAO.getItemOrder(id_order).getId_payment()));
				List<Product> lisProduct = (List<Product>) publicDAO.getListOrder(id_order);
				for (Product objProduct : lisProduct) {
					String id_product = Integer.toString(objProduct.getId_product());
					if (id_product.charAt(0) == '1') {
						Laptop objLaptop = publicDAO.getItemLaptop(objProduct.getId_product());
						objProduct.setName(objLaptop.getName());
						objProduct.setPrice(objLaptop.getPrice());
					} else if (id_product.charAt(0) == '2'){
						Accessories objAccessories = publicDAO.getItemAccessories(objProduct.getId_product());
						objProduct.setName(objAccessories.getName());
						objProduct.setPrice(objAccessories.getPrice());
					}
				}
				modelMap.addAttribute("listOrder", lisProduct);
			} else {
				if (publicDAO.getUserLogin(principal.getName()).getEmail().equals(publicDAO.getItemOrder(id_order).getEmail())) {
					modelMap.addAttribute("objItem", publicDAO.getItemOrder(id_order));
					modelMap.addAttribute("objPayment", paymentDAO.getItem(publicDAO.getItemOrder(id_order).getId_payment()));
					List<Product> lisProduct = (List<Product>) publicDAO.getListOrder(id_order);
					for (Product objProduct : lisProduct) {
						String id_product = Integer.toString(objProduct.getId_product());
						if (id_product.charAt(0) == '1') {
							Laptop objLaptop = publicDAO.getItemLaptop(objProduct.getId_product());
							objProduct.setName(objLaptop.getName());
							objProduct.setPrice(objLaptop.getPrice());
						} else if (id_product.charAt(0) == '2'){
							Accessories objAccessories = publicDAO.getItemAccessories(objProduct.getId_product());
							objProduct.setName(objAccessories.getName());
							objProduct.setPrice(objAccessories.getPrice());
						}
					}
					modelMap.addAttribute("listOrder", lisProduct);
				} else {
					return "redirect:/profile";
				}
			}
		}
		return "public.order.detailPrint";
	}
	@ResponseBody 
	@RequestMapping(value="/comment-header",method=RequestMethod.POST)
	public void comment_header(Principal principal){
		if (principal != null) {
			userDAO.editComment(0, publicDAO.getUserLogin(principal.getName()).getId());
		}
	}
	@ResponseBody 
	@RequestMapping(value="/contact-header",method=RequestMethod.POST)
	public void contact_header(Principal principal){
		if (principal != null) {
			userDAO.editContact(0, publicDAO.getUserLogin(principal.getName()).getId());
		}
	}
	@ResponseBody 
	@RequestMapping(value="/order-header",method=RequestMethod.POST)
	public void order_header(Principal principal){
		if (principal != null) {
			userDAO.editOrder(0, publicDAO.getUserLogin(principal.getName()).getId());
		}
	}
}
