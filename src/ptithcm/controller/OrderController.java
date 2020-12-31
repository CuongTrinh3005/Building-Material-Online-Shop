package ptithcm.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.org.apache.xpath.internal.operations.Or;

import ptithcm.entity.Customer;
import ptithcm.entity.CustomerOrder;
import ptithcm.entity.OrderDetail;
import ptithcm.entity.OrderDetail.OrderDetailID;
import ptithcm.entity.Product;
import ptithcm.service.Mailer;

@Transactional
@Controller
@RequestMapping(value="/order/")
public class OrderController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	Mailer mailer;
	
	@RequestMapping(value="checkout", method=RequestMethod.GET)
	public String checkout(ModelMap model, HttpSession httpSession){
		// Order details
		try{
			HashMap<String, Product> cartItems = (HashMap<String, Product>) httpSession.getAttribute("cart");
			Collection<Product> products = cartItems.values();
			List<Product> carList;
			if(products instanceof List){
				carList = (List<Product>) products;
			}
			else{
				carList = new ArrayList<>(products);
			}
			float totalPrice = getTotalCartPrice(carList);
			model.addAttribute("list", carList);
			model.addAttribute("total", totalPrice);
		}catch(NullPointerException np){
			model.addAttribute("message", "Empty cart");
			System.out.println("Empty cart");
		}
		
		// Order 
		CustomerOrder order = new CustomerOrder();
		Customer customer = (Customer) httpSession.getAttribute("user");
		order.setCustomer(customer);
		order.setOrderDate(new Date());
		model.addAttribute("order", order);
		return "order/checkout";
	}
	
	@RequestMapping(value="checkout", method=RequestMethod.POST)
	public String purchase(ModelMap model, HttpSession httpSession
			, @Validated @ModelAttribute("order") CustomerOrder order, BindingResult errors){
		HashMap<String, Product> cartItemsTemp = (HashMap<String, Product>) httpSession.getAttribute("cart");
		if(cartItemsTemp.size() == 0){
			model.addAttribute("message", "No products to checkout!");
			return "order/checkout";
		}
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "order/checkout";
		}
		Customer customer = (Customer) httpSession.getAttribute("user");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.save(order);
			transaction.commit();
			model.addAttribute("message", "Save order successfully!");
		}catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Save order failed!");
			System.out.println(ex.toString());
		}
		try{
			HashMap<String, Product> cartItems = (HashMap<String, Product>) httpSession.getAttribute("cart");
			Collection<Product> products = cartItems.values();
			List<Product> cartList;
			if(products instanceof List){
				cartList = (List<Product>) products;
			}
			else{
				cartList = new ArrayList<>(products);
			}
			List<OrderDetail> details = new ArrayList<>();
			System.out.println("Order Details Info:\n");
			for (Product product : cartList) {
				OrderDetail detail = new OrderDetail();
				OrderDetail.OrderDetailID key  = new OrderDetail.OrderDetailID();
				session.refresh(order);
				key.setOrderId(order.getOrderId());
				key.setProductId(product.getProductId());
				
				detail.setOrderDetailID(key);
				detail.setQuantityOrder(product.getQuantity());
				detail.setUnitPrice(product.getUnitPrice());
				detail.setDiscount(product.getDiscount());
				
				System.out.println(detail.getOrderDetailID().getOrderId());
				System.out.println(detail.getOrderDetailID().getProductId());
				System.out.println(detail.getQuantityOrder());
				System.out.println(detail.getUnitPrice());
				System.out.println(detail.getDiscount());
				details.add(detail);
			}
			
			savePurchaseRecord(details);
			try{
				String subject="Xác nhận đơn hàng";
				String body = prepareContent(details, new Date(), getTotalCartPrice(cartList));
				mailer.send("n17dccn017@student.ptithcm.edu.vn", customer.getEmail(), subject, body);
			}
			catch(Exception ex){
				System.out.println("Send mail failed, " + ex.toString());
			}
			cartItems.clear();
		}catch(NullPointerException np){
			model.addAttribute("message", "Empty cart");
			System.out.println("Empty cart");
		}
		
		return "redirect:/order/list.htm";
	}
	
	private void savePurchaseRecord(List<OrderDetail> details) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			for (OrderDetail detail : details) {
				session.save(detail);
			}
			transaction.commit();
		}catch(Exception ex){
			transaction.rollback();
			System.out.println(ex.toString());
		}
		finally {
			session.close();
		}
	}

	public float getTotalCartPrice(List<Product> products){
		float price = 0;
		for (Product product : products) {
			price += product.getQuantity() * product.getUnitPrice() * (1 - product.getDiscount());
		}
		return price;
	}
	
	@RequestMapping(value="list")
	public String list(ModelMap model, HttpSession httpSession){
		Customer customer = (Customer) httpSession.getAttribute("user");
		if(customer != null){
			String cusId = customer.getCustomerId();
			Session session = factory.getCurrentSession();
			String hql = "FROM CustomerOrder co where co.customer.customerId = :id ORDER BY orderDate DESC";
			Query query = session.createQuery(hql);
			query.setParameter("id", cusId);
			List<CustomerOrder> orders = query.list();
			
			model.addAttribute("customer", customer);
			model.addAttribute("orders", orders);
		}
		return "order/list";
	}
	
	@RequestMapping(value="detail/{id}")
	public String detail(ModelMap model, @PathVariable("id") Long orderId){
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail od where od.orderDetailID.orderId = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", orderId);
		List<OrderDetail> list = query.list();
		
		float totalOrder = 0;
		for (OrderDetail orderDetail : list) {
			float itemPrice = orderDetail.getQuantityOrder() * orderDetail.getUnitPrice() * (1-orderDetail.getDiscount());
			totalOrder += itemPrice;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("total", totalOrder);
		return "order/detail";
	}
	
	public String prepareContent(List<OrderDetail> details, Date date, float totalCost){
		String body = "You have an order on " + date.toString() + " with details: <br>";
		body += "<br>";
		body += "Mã đơn đặt hàng: " + details.get(0).getOrderDetailID().getOrderId() + "<br>";
		body += "<br>";
		for (OrderDetail detail : details) {
			body += "Tên sản phẩm: " + detail.getOrderDetailID().getProductId() + "<br>";
			body += "<br>";
			body += "Số lượng: " + detail.getQuantityOrder() + "<br>";
			body += "<br>";
			body += "Đơn giá: " + detail.getUnitPrice() + " VNĐ <br>";
			body += "<br>";
			if(detail.getDiscount() > 0){
				body += "Tên sản phẩm: " + detail.getDiscount() + "<br>";
				body += "<br>";
			}
			body += "----------------------------------------------------------- <br>";
			body += "<br>";
		}
		body += "Tổng thành tiền: " + totalCost + " VNĐ <br>";
		body += "<br>";
		body += "Hân hạnh phục vụ quý khách !";
		return body;
	}
	
	
	@RequestMapping(value="items")
	public String findBoughtItems(ModelMap model, HttpSession httpSession){
		Customer customer = (Customer) httpSession.getAttribute("user");
		if(customer != null){
			Session session = factory.getCurrentSession();
			String hql = "SELECT DISTINCT d.product from OrderDetail d " + 
			" where d.customOrder.customer.customerId = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id", customer.getCustomerId());
			List<Product> list = query.list();
			model.addAttribute("items", list);
		}
		return "order/items";
	}
}
