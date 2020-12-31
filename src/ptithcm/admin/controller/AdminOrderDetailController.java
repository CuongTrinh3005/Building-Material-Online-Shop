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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.OrderDetail;

@Transactional
@Controller
@RequestMapping(value="/admin/order/detail/")
public class AdminOrderDetailController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail";
		Query query = session.createQuery(hql);
		List<OrderDetail> list = query.list();
		
		model.addAttribute("orders_dt", list);
		return "admin/order-detail/index";
	}
	
	@RequestMapping(value="delete/{oid}/{pid}", method=RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("oid")Long orderId, @PathVariable("pid")String proId){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		String hql = "delete from OrderDetail where orderId= :key1 AND productId= :key2";
		Query query = session.createQuery(hql);
		query.setLong("key1", orderId);
		query.setString("key2", proId);
			
		try{
			int rows = query.executeUpdate();
			transaction.commit();
			if(rows != 0)
				model.addAttribute("message", "Delete order detail successfully!");
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Delete order detail failed!");
			System.err.println(ex.toString());
		}
		finally {
			session.close();
		}
		return "redirect:/admin/order/detail/index.htm";
	}
}
