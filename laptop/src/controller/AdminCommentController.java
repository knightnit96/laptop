package controller;

import java.security.Principal;
import java.text.SimpleDateFormat;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import utils.SlugUtils;
import constant.Defines;
import dao.BrandsDAO;
import dao.CommentDAO;
import dao.PublicDAO;
import dao.UserDAO;
import entities.Comment;

@Controller
public class AdminCommentController {
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private PublicDAO publicDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private SlugUtils slugUtils;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Comments");
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
	@ResponseBody 
	@RequestMapping(value="/comment",method=RequestMethod.POST)
	public String add(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		String message = request.getParameter("amessage");
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		Comment objComment = new Comment();
		String cmt = "";
		if (principal != null) {
			objComment.setEmail(publicDAO.getUserLogin(principal.getName()).getEmail());
			objComment.setName(publicDAO.getUserLogin(principal.getName()).getFullname());
			objComment.setRole(publicDAO.getUserLogin(principal.getName()).getRole());
			objComment.setMessage(message);
			objComment.setId_product(id_product);
			commentDAO.addItem(objComment);
			userDAO.editComment();
			SimpleDateFormat date1 = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat time1 = new SimpleDateFormat("hh:mm:ss");
			for (Comment comment : commentDAO.getList(id_product)) {
				if (comment.getId_parent() == 0) {
					String date = date1.format(comment.getDate());
					String time = time1.format(comment.getDate());
					String role = "";
					if (comment.getRole().equals("ADMIN") || comment.getRole().equals("MOD")) {
						role = "["+ comment.getRole() +"]";
					}
					if (comment.getEmail().equals(publicDAO.getUserLogin(principal.getName()).getEmail())) {
						cmt += "<div class=\"col-sm-12\" style=\"margin-top: 15px;\" id=\"comment-"+ comment.getId_comment() +"\">"
							 +"	<div>"
							 +"		<ul style=\"margin-bottom: -2px\">"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role +" "+ comment.getName() +"</a></li>"
							 +"				<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
							 +"				<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
							 +"				<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
							 +"				<li style=\"float: right;\"><a onclick=\"edit_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-edit\"></i>Edit</a></li>"
							 +"		</ul>"
							 +"		<div class=\"clearfix\"> </div>"
							 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
							 +"		<p>"+ comment.getMessage() +"</p><br />"
							 +"		</div>"
							 +"	</div>"
							 +"	<div id=\"reply-comment-"+ comment.getId_comment() +"\">";
					} else {
						if (publicDAO.getUserLogin(principal.getName()).getRole().equals("ADMIN") ||  publicDAO.getUserLogin(principal.getName()).getRole().equals("MOD")) {
							cmt += "<div class=\"col-sm-12\" style=\"margin-top: 15px;\" id=\"comment-"+ comment.getId_comment() +"\">"
								 +"	<div>"
								 +"		<ul style=\"margin-bottom: -2px\">"
								 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role +" "+ comment.getName() +"</a></li>"
								 +"				<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
								 +"				<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
								 +"				<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
								 +"		</ul>"
								 +"		<div class=\"clearfix\"> </div>"
								 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
								 +"		<p>"+ comment.getMessage() +"</p><br />"
								 +"		</div>"
								 +"	</div>"
								 +"	<div id=\"reply-comment-"+ comment.getId_comment() +"\">";
						} else {
							cmt += "<div class=\"col-sm-12\" style=\"margin-top: 15px;\" id=\"comment-"+ comment.getId_comment() +"\">"
								 +"	<div>"
								 +"		<ul style=\"margin-bottom: -2px\">"
								 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role +" "+ comment.getName() +"</a></li>"
								 +"				<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
								 +"				<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
								 +"		</ul>"
								 +"		<div class=\"clearfix\"> </div>"
								 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
								 +"		<p>"+ comment.getMessage() +"</p><br />"
								 +"		</div>"
								 +"	</div>"
								 +"	<div id=\"reply-comment-"+ comment.getId_comment() +"\">";
						}
					}
					for (Comment comment1 : commentDAO.getList(id_product)) {
						if (comment1.getId_parent() == comment.getId_comment()) {
							String date2 = date1.format(comment1.getDate());
							String time2 = time1.format(comment1.getDate());
							String role1 = "";
							if (comment1.getRole().equals("ADMIN") || comment1.getRole().equals("MOD")) {
								role1 = "["+ comment1.getRole() +"]";
							}
							if (comment1.getEmail().equals(publicDAO.getUserLogin(principal.getName()).getEmail())) {
								cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment1.getId_comment() +"\">"
									 +"		<ul style=\"margin-bottom: -2px\">"
									 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment1.getName() +"</a></li>"
									 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time2 +"</a></li>"
									 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date2 +"</a></li>"
									 +"			<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment1.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
									 +"			<li style=\"float: right;\"><a onclick=\"edit_comment("+ comment1.getId_comment() +")\"><i class=\"fa fa-edit\"></i>Edit</a></li>"
									 +"		</ul>"
									 +"		<div class=\"clearfix\"> </div>"
									 +"		<div id=\"form-edit-save-"+ comment1.getId_comment() +"\">"
									 +"		<p>"+ comment1.getMessage() +"</p><br />"
									 +"		</div>"
									 +"	</div>";
							} else {
								if (publicDAO.getUserLogin(principal.getName()).getRole().equals("ADMIN") ||  publicDAO.getUserLogin(principal.getName()).getRole().equals("MOD")) {
									cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment1.getId_comment() +"\">"
										 +"		<ul style=\"margin-bottom: -2px\">"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment1.getName() +"</a></li>"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time2 +"</a></li>"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date2 +"</a></li>"
										 +"		<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment1.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
										 +"		</ul>"
										 +"		<div class=\"clearfix\"> </div>"
										 +"		<div id=\"form-edit-save-"+ comment1.getId_comment() +"\">"
										 +"		<p>"+ comment1.getMessage() +"</p><br />"
										 +"		</div>"
										 +"	</div>";
								} else {
									cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment1.getId_comment() +"\">"
										 +"		<ul style=\"margin-bottom: -2px\">"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment1.getName() +"</a></li>"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time2 +"</a></li>"
										 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date2 +"</a></li>"
										 +"		</ul>"
										 +"		<div class=\"clearfix\"> </div>"
										 +"		<div id=\"form-edit-save-"+ comment1.getId_comment() +"\">"
										 +"		<p>"+ comment1.getMessage() +"</p><br />"
										 +"		</div>"
										 +"	</div>";
								}
							}
						}
					}
					cmt += "</div>"
						+"		<form style=\"padding-left: 100px; margin-top: -40px\">"
						+"			<span>"
						+"				<textarea name=\"message\" id=\"message_reply_"+ comment.getId_comment() +"\" rows=\"3\" placeholder=\"Write Your Reply\"></textarea>"
						+"				<a href=\"javascript:void(0)\" onclick=\"reply("+ comment.getId_comment() +", "+ comment.getId_product() +")\"><button type=\"button\" class=\"btn btn-default pull-right\" style=\"margin-top: -20px; margin-right:4px; margin-bottom: 6px;\">Reply</button></a>"
						+"			</span>"
						+"		</form>"
						+"	</div>";
				} 
			}
			cmt += "<form>"
				+"		<span>"
				+"			<input type=\"hidden\" id=\"id_product\" name=\"id_product\" value=\""+ id_product +"\">"
				+"			<textarea name=\"message\" id=\"message\" rows=\"3\" placeholder=\"Write Your Review\"></textarea>"
				+"			<a href=\"javascript:void(0)\" onclick=\"comment()\"><button type=\"button\" class=\"btn btn-default pull-right\" style=\"margin-top: -20px; margin-right:4px\">"
				+"				Comment"
				+"			</button></a>"
				+"		</span>"
				+"	</form>";
		}
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/change-total-review",method=RequestMethod.POST)
	public String change_total(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		String cmt = "";
		int total = commentDAO.getSumDetail(id_product);
		cmt = "Review ("+ total +")";
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/delete-comment",method=RequestMethod.POST)
	public String delete(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_comment = Integer.parseInt(request.getParameter("aid_comment"));
		String cmt = "";
		for (Comment objCmt : commentDAO.getList()) {
			if (objCmt.getId_parent() == id_comment) {
				commentDAO.delItem(objCmt.getId_comment());
			}
		}
		commentDAO.delItem(id_comment);
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/edit-comment",method=RequestMethod.POST)
	public String edit(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_comment = Integer.parseInt(request.getParameter("aid_comment"));
		Comment objCmt = commentDAO.getItem(id_comment);
		String cmt = "";
		cmt += "<form>"
			+"		<span>"
			+"			<textarea name=\"message-detail\" id=\"message-detail-"+ objCmt.getId_comment() +"\" rows=\"3\" placeholder=\"Write Your Review\">"+ objCmt.getMessage() +"</textarea>"
			+"			<a href=\"javascript:void(0)\" onclick=\"cancel_comment("+ objCmt.getId_comment() +")\"><button type=\"button\" class=\"btn btn-default pull-right\" style=\"margin-top: -20px; margin-right:4px\">"
			+"				Cancel"
			+"			</button></a>"
			+"			<a href=\"javascript:void(0)\" onclick=\"comment_save("+ objCmt.getId_comment() +")\"><button type=\"button\" class=\"btn btn-default pull-right\" style=\"margin-top: -20px; margin-right:4px\">"
			+"				Save"
			+"			</button></a>"
			+"		</span>"
			+"	</form>";
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/cancel-comment",method=RequestMethod.POST)
	public String cancel(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_comment = Integer.parseInt(request.getParameter("aid_comment"));
		Comment objCmt = commentDAO.getItem(id_comment);
		String cmt = "";
		cmt += "<p>"+ objCmt.getMessage() +"</p><br />";
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/comment-save",method=RequestMethod.POST)
	public String save(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_comment = Integer.parseInt(request.getParameter("aid_comment"));
		String message = request.getParameter("amessage");
		commentDAO.editItem(id_comment, message);
		String cmt = "";
		cmt += "<p>"+ message +"</p><br />";
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/reply-comment",method=RequestMethod.POST)
	public String reply(HttpServletRequest request, RedirectAttributes ra, Principal principal){
		int id_comment = Integer.parseInt(request.getParameter("aid_comment"));
		int id_product = Integer.parseInt(request.getParameter("aid_product"));
		String message = request.getParameter("amessage");
		String cmt = "";
		if (principal != null) {
			String email = publicDAO.getUserLogin(principal.getName()).getEmail();
			String name = publicDAO.getUserLogin(principal.getName()).getFullname();
			String role = publicDAO.getUserLogin(principal.getName()).getRole();
			Comment objComment = new Comment(0, name, email, message, id_product, null, role, id_comment);
			commentDAO.addItemReply(objComment);
			userDAO.editComment();
			SimpleDateFormat date1 = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat time1 = new SimpleDateFormat("hh:mm:ss");
			for (Comment comment : commentDAO.getListReply(id_comment)) {
				String date = date1.format(comment.getDate());
				String time = time1.format(comment.getDate());
				String role1 = "";
				if (comment.getRole().equals("ADMIN") || comment.getRole().equals("MOD")) {
					role1 = "["+ comment.getRole() +"]";
				}
				if (comment.getEmail().equals(email)) {
					cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment.getId_comment() +"\">"
						 +"		<ul style=\"margin-bottom: -2px\">"
						 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment.getName() +"</a></li>"
						 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
						 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
						 +"			<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
						 +"			<li style=\"float: right;\"><a onclick=\"edit_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-edit\"></i>Edit</a></li>"
						 +"		</ul>"
						 +"		<div class=\"clearfix\"> </div>"
						 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
						 +"		<p>"+ comment.getMessage() +"</p><br />"
						 +"		</div>"
						 +"	</div>";
				} else {
					if (role.equals("ADMIN") || role.equals("MOD")) {
						cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment.getId_comment() +"\">"
							 +"		<ul style=\"margin-bottom: -2px\">"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment.getName() +"</a></li>"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
							 +"		<li style=\"float: right;\"><a onclick=\"delete_comment("+ comment.getId_comment() +")\"><i class=\"fa fa-trash-o\"></i>Delete</a></li>"
							 +"		</ul>"
							 +"		<div class=\"clearfix\"> </div>"
							 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
							 +"		<p>"+ comment.getMessage() +"</p><br />"
							 +"		</div>"
							 +"	</div>";
					} else {
						cmt +="	<div style=\"padding-left: 100px;\" id=\"comment-"+ comment.getId_comment() +"\">"
							 +"		<ul style=\"margin-bottom: -2px\">"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-user\"></i>"+ role1 +" "+ comment.getName() +"</a></li>"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-clock-o\"></i>"+ time +"</a></li>"
							 +"			<li style=\"float: left;\"><a><i class=\"fa fa-calendar-o\"></i>"+ date +"</a></li>"
							 +"		</ul>"
							 +"		<div class=\"clearfix\"> </div>"
							 +"		<div id=\"form-edit-save-"+ comment.getId_comment() +"\">"
							 +"		<p>"+ comment.getMessage() +"</p><br />"
							 +"		</div>"
							 +"	</div>";
					}
				}
			}
		}
		return cmt;
	}
	@RequestMapping("/admincp/comment")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap, Principal principal){
		int row_count = defines.getROW_COUNT_ADMIN();
		int totalPage = (int) Math.ceil((float)commentDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", commentDAO.getList(offset, row_count));
		userDAO.editComment(0, publicDAO.getUserLogin(principal.getName()).getId());
		return "admin.comment.index";
	}
	@RequestMapping("/admincp/comment/detail/{id_product}")
	public String detail(@PathVariable("id_product") int id_product, Principal principal, ModelMap modelMap){
		modelMap.addAttribute("title", null);
		String product = String.valueOf(id_product);
		String name = "";
		if (product.charAt(0) == '1') {
			name = publicDAO.getItemLaptop(id_product).getName(); 
		} else if (product.charAt(0) == '2'){
			name = publicDAO.getItemAccessories(id_product).getName();
		}
		return "redirect:/"+ slugUtils.makeSlug(name) +"-"+ id_product +".html";
	}
	@RequestMapping("/admincp/comment/search")
	public String search(@RequestParam("q") String search, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", commentDAO.getListSearch(search));
		return "admin.comment.search";
	}
}
