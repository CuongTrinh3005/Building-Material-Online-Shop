package ptithcm.admin.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
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

import ptithcm.entity.CustomerOrder;
import ptithcm.entity.OrderDetail;

@Transactional
@Controller
@RequestMapping(value="/admin/order/")
public class AdminOrderController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerOrder";
		Query query = session.createQuery(hql);
		List<CustomerOrder> orders = query.list();
		
		model.addAttribute("orders", orders);
		return "admin/order/index";
	}
	
	@RequestMapping(value="update/{id}", method=RequestMethod.GET)
	public String updateView(ModelMap model, @PathVariable("id")Long id){
		Session session = factory.getCurrentSession();
		CustomerOrder order = (CustomerOrder) session.get(CustomerOrder.class, id);
		model.addAttribute("order", order);

		return "admin/order/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("order")CustomerOrder order, 
			BindingResult errors){
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/order/update";
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.evict(order);
			session.update(order);
			transaction.commit();
			model.addAttribute("message", "Update order successfully!");
		}
		catch(Exception ex){
			transaction.rollback();
			System.err.println(ex.toString());
			model.addAttribute("message", "Update order failed!");
		}
		finally {
			session.close();
		}
		
		return "admin/order/update";
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("id")Long id){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		String hql = "delete from CustomerOrder where orderId= :key";
		Query query = session.createQuery(hql);
		query.setLong("key", id);
			
		try{
			int rows = query.executeUpdate();
			transaction.commit();
			if(rows != 0)
				model.addAttribute("message", "Delete order successfully!");
		}
		catch(ConstraintViolationException constraint){
			System.err.println("Orders has  order detail is not allowed to delete");
			model.addAttribute("message", "Orders has  order detail is not allowed to delete");
			return "admin/order/index";
		}
		catch(Exception ex){
			transaction.rollback();
			System.err.println(ex.toString());
		}
		finally {
			session.close();
		}
		return "redirect:/admin/order/index.htm";
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
		return "admin/order/detail";
	}
}
