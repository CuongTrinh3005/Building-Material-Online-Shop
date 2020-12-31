package ptithcm.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Customer;
import ptithcm.entity.Product;
import ptithcm.service.CookieService;

@Transactional
@Controller
@RequestMapping(value="/admin/account/")
public class AdminAccountController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	CookieService cookie;
	
	@Autowired
	ServletContext context;

	@RequestMapping(value="index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Customer";
		Query query = session.createQuery(hql);
		List<Customer> customers = query.list();
		model.addAttribute("customers", customers);
		
		return "admin/account/index";
	}
	
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(ModelMap model){
		model.addAttribute("customer", new Customer());
		return "admin/account/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String register(ModelMap model, @Validated @ModelAttribute("customer") Customer customer, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/account/insert";
		}
		else{
			Session session = factory.getCurrentSession();
			Customer foundCustomer  = (Customer) session.get(Customer.class, customer.getCustomerId());
			if(foundCustomer != null){
				model.addAttribute("message", "Username is already existed!");
				return "admin/account/insert";
			}
		}
		
		if(photo.isEmpty()){
			customer.setPhoto("user.jpg");
		}
		else{
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "admin/account/insert";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "admin/account/insert";
			}
			
			String dir = context.getRealPath("/images/customer/");
			System.out.println("Dir path: " + dir);
			File f = new File(dir, photo.getOriginalFilename());
			photo.transferTo(f);
			customer.setPhoto(f.getName());
			f.renameTo(new File(dir+customer.getPhoto()));
			
//			String photoPath = context.getRealPath("/images/customer/" + photo.getOriginalFilename());
//			photo.transferTo(new File(photoPath));
			
		}
		
		if(customer.getAdmin() == null){
			model.put("message_err_ad", "Please choose role for user !");
			return "admin/account/insert";
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		try{
			session.save(customer);
			transaction.commit();
			model.addAttribute("message", "Add new customer successfully!");
		}
		catch(ConstraintViolationException cve){
			model.addAttribute("message", "UserName is already existed!!!");
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Add new customer failed!");
		}
		
		return "admin/account/insert";
	}
	
	@RequestMapping(value="update/{id}", method=RequestMethod.GET)
	public String updateView(ModelMap model, @PathVariable("id")String id){
		Session session = factory.getCurrentSession();
		Customer customer = (Customer) session.get(Customer.class, id);
		model.addAttribute("customer", customer);
		return "admin/account/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("customer")Customer customer, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/account/update";
		}
		
		if(!photo.isEmpty()){
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "admin/account/update";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "admin/account/update";
			}
			
			String dir = context.getRealPath("/images/customer/");
			System.out.println("Dir path: " + dir);
			File f = new File(dir, photo.getOriginalFilename());
			photo.transferTo(f);
			customer.setPhoto(f.getName());
			f.renameTo(new File(dir+customer.getPhoto()));
		}
		
		if(customer.getAdmin() == null){
			model.put("message_err_ad", "Please choose role for user !");
			return "admin/account/update";
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.evict(customer);
			session.update(customer);
			transaction.commit();
			model.addAttribute("message", "Update account successfully!");
		}
		catch(Exception ex){
			transaction.rollback();
			System.err.println(ex.toString());
			model.addAttribute("message", "Update account failed!");
		}
		finally {
			session.close();
		}
		
		return "admin/account/update";
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("id")String id){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		String hql = "delete from Customer where customerId= :key";
		Query query = session.createQuery(hql);
		query.setString("key", id);
			
		try{
			int rows = query.executeUpdate();
			transaction.commit();
			if(rows != 0)
				model.addAttribute("message", "Delete account successfully!");
		}
		catch(ConstraintViolationException constraint){
			model.addAttribute("message", "Account has  orders is not allowed to delete");
			return "admin/account/index";
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Delete account falied!");
			System.err.println(ex.toString());
		}
		finally {
			session.close();
		}
		return "redirect:/admin/account/index.htm";
	}
}
