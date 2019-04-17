package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
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

import constant.Defines;
import dao.BrandsDAO;
import dao.OrderDAO;
import dao.PaymentDAO;
import dao.PublicDAO;
import dao.UserDAO;
import entities.Order;
import entities.Payment;
import entities.Product;

@Controller
public class AdminOrderController {
	private static HSSFCellStyle createStyleForTitle(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setFontHeightInPoints((short) 18);
        font.setBold(true);
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        return style;
    }
	@Autowired
	private Defines defines;
	@Autowired
	private BrandsDAO brandsDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private PublicDAO publicDAO;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("defines", defines);
		modelMap.addAttribute("title", "AdminCP | Order");
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
	@RequestMapping("/admincp/order")
	public String index(@RequestParam(value="page", defaultValue="1") int page, ModelMap modelMap, Principal principal){
		int row_count = defines.getROW_COUNT_ADMIN();
		int totalPage = (int) Math.ceil((float)orderDAO.getSumAll()/row_count);
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("listItem", orderDAO.getList(offset, row_count));
		modelMap.addAttribute("listPayment", paymentDAO.getList());
		userDAO.editOrder(0, publicDAO.getUserLogin(principal.getName()).getId());
		return "admin.order.index";
	}
	@RequestMapping(value="/order/add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objItem") Order objItem, HttpServletRequest request, RedirectAttributes ra, Principal principal){
		HttpSession session = request.getSession();
		session.setAttribute("getOrder", objItem);
		return "redirect:/order/pay";
	}
	@RequestMapping(value="/order/pay/add",method=RequestMethod.POST)
	public String pay(@ModelAttribute("objItem") Order objItem, HttpServletRequest request, RedirectAttributes ra, Principal principal){
		HttpSession session = request.getSession();
		Order objOrder = (Order) session.getAttribute("getOrder");
		ArrayList<Product> listProduct = (ArrayList<Product>)session.getAttribute("listProduct");
		objOrder.setId_payment(objItem.getId_payment());
		String message = "";
		if (objItem.getId_payment() == 1) {
			for (Product objProduct : listProduct) {
				message += ""+objProduct.getQuantity()+"x"+objProduct.getName()+"%2C+";
			}
			String message1 = message.replaceAll("\\s", "+");
			return "redirect:https://www.baokim.vn/payment/product/version11?business=knightnit96%40gmail.com&order_description="+ message1 +"&product_name=Laptop+Accessories+Knightshop&product_price="+ objOrder.getPrice() +"&product_quantity=1&total_amount="+ objOrder.getPrice() +"&url_cancel=http%3A%2F%2Flocalhost%3A8080%2Flaptop%2Forder%2Fpay&url_detail=http%3A%2F%2Flocalhost%3A8080%2Flaptop%2Fcart&url_success=http%3A%2F%2Flocalhost%3A8080%2Flaptop%2Forder%2Fpay%2Fsuccess&Checksum=8945f2d9df5d044b7f6a687ddeda9c81";
		} 
		orderDAO.addItem(objOrder);
		for (Product objProduct : listProduct) {
			objProduct.setId_order(orderDAO.getItem().getId_order());
			orderDAO.addOrder2(objProduct);
		}
		session.invalidate();
		userDAO.editOrder();
		ra.addFlashAttribute("msg", "Thank you");
		if (principal != null) {
			return "redirect:/profile";
		}
		return "redirect:/";
	}
	@ResponseBody 
	@RequestMapping(value="/admincp/order/edit",method=RequestMethod.POST)
	public String edit(HttpServletRequest request){
		int id_order = Integer.parseInt(request.getParameter("aid_order"));
		String status = request.getParameter("astatus");
		int id_payment = Integer.parseInt(request.getParameter("aid_payment"));
		String cmt = "";
		if (orderDAO.editItem(id_order, status, id_payment) > 0){
			cmt = "Edit Order Successfully!";
		} else {
			cmt = "Failed to edit!";
		}
		return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/admincp/order/del/{id_order}",method=RequestMethod.POST)
	public String del(@PathVariable("id_order") int id_order){
		String cmt = "";
		orderDAO.delItem(id_order);
		return cmt;
	}
	@RequestMapping("/admincp/order/search")
	public String search(@RequestParam("from_date") String from_date, @RequestParam("to_date") String to_date, ModelMap modelMap){
		modelMap.addAttribute("getListSearch", orderDAO.getListSearch(from_date, to_date));
		modelMap.addAttribute("listPayment", paymentDAO.getList());
		return "admin.order.search";
	}
	@ResponseBody 
	@RequestMapping(value="/admincp/order/export",method=RequestMethod.POST)
	public String export(HttpServletRequest request) throws FileNotFoundException{
		String from_date = request.getParameter("afrom_date");
		String to_date = request.getParameter("ato_date");
		HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Orders info");
        List<Order> listOrders;
        if (from_date.equals("") && to_date.equals("")) {
        	 listOrders = orderDAO.getList();
		} else {
			if (from_date.equals("")) {
				listOrders = orderDAO.getListSearchTo(to_date);
			} else {
				if (to_date.equals("")) {
					listOrders = orderDAO.getListSearchFrom(from_date);
				} else {
					listOrders = orderDAO.getListSearch(from_date, to_date);
				}
			}
		}
        int rownum = 0;
        Cell cell;
        Row row;
        HSSFCellStyle style = createStyleForTitle(workbook);
        row = sheet.createRow(rownum);
        //KngihtSHOP
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("KngihtSHOP");
        cell.setCellStyle(style);
        //Order Statistics
        cell = row.createCell(1, CellType.STRING);
        cell.setCellValue("Order Statistics");
        cell.setCellStyle(style);
		
        rownum = 1;
        row = sheet.createRow(rownum);
        //From date
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("From date:");
        cell.setCellStyle(style);
        //Date
        if (!from_date.equals("")) {
        	cell = row.createCell(1, CellType.STRING);
            cell.setCellValue(""+from_date);
            cell.setCellStyle(style);
		}
        
        rownum = 2;
        row = sheet.createRow(rownum);
        //To date
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("To date:");
        cell.setCellStyle(style);
        //Date
        if (!from_date.equals("")) {
        	cell = row.createCell(1, CellType.STRING);
            cell.setCellValue(""+to_date);
            cell.setCellStyle(style);
		}
        
        rownum = 3;
        row = sheet.createRow(rownum);
        //OrderID
        cell = row.createCell(0, CellType.STRING);
        cell.setCellValue("OrderID");
        cell.setCellStyle(style);
        //Name
        cell = row.createCell(1, CellType.STRING);
        cell.setCellValue("Name");
        cell.setCellStyle(style);
        //Email
        cell = row.createCell(2, CellType.STRING);
        cell.setCellValue("Email");
        cell.setCellStyle(style);
        //Phone
        cell = row.createCell(3, CellType.STRING);
        cell.setCellValue("Phone");
        cell.setCellStyle(style);
        //Address
        cell = row.createCell(4, CellType.STRING);
        cell.setCellValue("Address");
        cell.setCellStyle(style);
        //ID_payment
        cell = row.createCell(5, CellType.STRING);
        cell.setCellValue("Payment");
        cell.setCellStyle(style);
        //Price
        cell = row.createCell(6, CellType.STRING);
        cell.setCellValue("Price");
        cell.setCellStyle(style);
        //Date
        cell = row.createCell(7, CellType.STRING);
        cell.setCellValue("Date");
        cell.setCellStyle(style);
        //Status
        cell = row.createCell(8, CellType.STRING);
        cell.setCellValue("Status");
        cell.setCellStyle(style);
        //Message
        cell = row.createCell(9, CellType.STRING);
        cell.setCellValue("Message");
        cell.setCellStyle(style);
        
        // Data
        int total = 0;
        for (Order objOrder : listOrders) {
        	total += objOrder.getPrice();
            rownum++;
            row = sheet.createRow(rownum);
            
            //OrderID
            cell = row.createCell(0, CellType.NUMERIC);
            cell.setCellValue(objOrder.getId_order());
            System.out.println(objOrder.getId_order());
            //Name
            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue(objOrder.getName());
            //Email
            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue(objOrder.getEmail());
            //Phone
            cell = row.createCell(3, CellType.NUMERIC);
            cell.setCellValue(objOrder.getPhone());
            //Address
            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue(objOrder.getAddress());
            //ID_payment
            for (Payment objPayment : paymentDAO.getList()) {
            	if (objPayment.getId_payment() == objOrder.getId_payment()) {
            		cell = row.createCell(5, CellType.STRING);
    	            cell.setCellValue(objPayment.getName());
				}
            }
            //Price
            cell = row.createCell(6, CellType.STRING);
            cell.setCellValue(""+ objOrder.getPrice() +" VNĐ");
            //Date
            cell = row.createCell(7, CellType.STRING);
            cell.setCellValue(""+objOrder.getDate());
            //Status
            cell = row.createCell(8, CellType.STRING);
            cell.setCellValue(objOrder.getStatus());
            //Message
            cell = row.createCell(9, CellType.STRING);
            cell.setCellValue(objOrder.getMessage());
        }
        rownum++;
        row = sheet.createRow(rownum);
        //Total
        cell = row.createCell(5, CellType.STRING);
        cell.setCellValue("TOTAL:");
        cell = row.createCell(6, CellType.STRING);
        cell.setCellValue(""+total+" VNĐ");
        
        File file = new File("C:/Users/PHI LONG/Desktop/KnightSHOP-Data-"+ from_date +"-"+ to_date +".xls");
        file.getParentFile().mkdirs();
        
        FileOutputStream outFile;
		try {
			outFile = new FileOutputStream(file);
			workbook.write(outFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
        System.out.println("Created file: " + file.getAbsolutePath());
        String cmt = "";
        cmt = "Created file: "+ file.getAbsolutePath();
        return cmt;
	}
	@ResponseBody 
	@RequestMapping(value="/admincp/order/delete-all",method=RequestMethod.POST)
	public String delete(HttpServletRequest request){
		String[] mang = request.getParameterValues("amang[]");
		String cmt = "";
		if (mang == null) {
			cmt = "Edit Order Fail!";
		} else {
			for (int i = 0; i < mang.length; i++) {
				int id_order = Integer.parseInt(mang[i]);
				orderDAO.delItem(id_order);
			}
			cmt = "Edit Order Successfully!";
		}
		return cmt;
	}
}
