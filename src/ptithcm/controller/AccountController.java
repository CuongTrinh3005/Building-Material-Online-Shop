package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Customer;
import ptithcm.service.CookieService;
import ptithcm.service.Mailer;

@Transactional
@Controller
@RequestMapping(value="/account/")
public class AccountController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	CookieService cookie;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	Mailer mailer;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(ModelMap model, HttpServletRequest request, HttpServletResponse response){
		Cookie userIdCookie = cookie.read("userId", request);
		if(userIdCookie != null){
			String userId = userIdCookie.getValue();
			Cookie passwordUser = cookie.read("password", request);
			String password = passwordUser.getValue();
			model.addAttribute("userId", userId);
			model.addAttribute("password", password);
		}
		return "account/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("id") String id, @RequestParam("pw") String password,
			@RequestParam(value="save", defaultValue="false") boolean saveCookie, HttpServletRequest request,
			HttpServletResponse response){
		if(id.trim().length() == 0 || password.trim().length() == 0){
			if(id.trim().length() == 0){
				model.put("message_err_usn", "Please enter username !");
			}
			if(password.trim().length() == 0){
				model.put("message_err_pw", "Please enter password !");
			}
			return "account/login";
		}
		
		Session session = factory.getCurrentSession();
		Customer customer  = (Customer) session.get(Customer.class, id);
//		System.out.println("Logged Customer ID: " + customer.getCustomerId());
		if(customer == null){
			model.addAttribute("message", "Invalid username!");
			System.out.println("Customer null");
		}
		else if(!customer.getPassword().equals(password)){
			model.addAttribute("message", "Invalid password!");
			System.out.println("Pass wrong");
		}
		else {
			model.addAttribute("message", "Log In successfully!");
			System.out.println("OK");
			httpSession.setAttribute("user", customer);
			// Save password 
			if(saveCookie){
				cookie.create("userId", customer.getCustomerId(), 30, response);
				cookie.create("password", customer.getPassword(), 30, response);
			}
			else{
				cookie.delete("userId", request, response);
				cookie.delete("password", request, response);
			}
		}
//		System.out.println("Customer Id: " + id + "pass: " + password);
		return "account/login";
	}
	
	@RequestMapping(value="logout")
	public String logOut(ModelMap model){
		httpSession.removeAttribute("user");
		return "redirect:/home/index.htm";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(ModelMap model){
		model.addAttribute("customer", new Customer());
		return "account/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(ModelMap model, @Validated @ModelAttribute("customer") Customer customer, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "account/register";
		}
		else{
			Session session = factory.getCurrentSession();
			Customer foundCustomer  = (Customer) session.get(Customer.class, customer.getCustomerId());
			if(foundCustomer != null){
				model.addAttribute("message", "Username is already existed!");
				return "account/register";
			}
		}
		
		if(photo.isEmpty()){
			customer.setPhoto("user.jpg");
		}
		else{
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "account/register";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "account/register";
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
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		try{
			customer.setAdmin(false);
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
		
		return "account/register";
	}
	
	@RequestMapping(value="change-password", method=RequestMethod.GET)
	public String changePassword(ModelMap model){
		return "account/change-password";
	}
	
	public void updateCustomer(Customer customer){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.update(customer);
			transaction.commit();
		}
		catch(Exception ex){
			transaction.rollback();
		}
		finally {
			session.close();
		}
	}
	
	@RequestMapping(value="change-password", method=RequestMethod.POST)
	public String changePassword(ModelMap model, @RequestParam("id") String id, 
			@RequestParam("pw") String password, @RequestParam("pw1") String password1, @RequestParam("pw2") String password2){
		if(id.trim().length() == 0 || password.trim().length() == 0 || password1.trim().length() == 0 || password2.trim().length() == 0){
			if(id.trim().length() == 0){
				model.put("message_err_usn", "Please enter username !");
			}
			if(password.trim().length() == 0){
				model.put("message_err_pw", "Please enter password !");
			}
			if(password1.trim().length() == 0){
				model.put("message_err_pw1", "Please enter new password !");
			}
			if(password2.trim().length() == 0){
				model.put("message_err_pw2", "Please enter confirm password !");
			}
			return "account/change-password";
		}
		
		Session session = factory.getCurrentSession();
		Customer customer  = (Customer) session.get(Customer.class, id);

		if(customer == null){
			model.addAttribute("message", "Invalid username!");
			System.out.println("Customer null");
		}
		else if(!customer.getPassword().equals(password)){
			model.addAttribute("message", "Invalid password!");
			System.out.println("Pass wrong");
		}
		else if(!password1.equals(password2)){
			model.addAttribute("message", "New passwords not match!");
			System.out.println("New passwords not match!");
		}
		else{
//			session.close();
			customer.setPassword(password2);
			updateCustomer(customer);
			model.addAttribute("message", "Change password successfully!");
		}
		return "account/change-password";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(ModelMap model){
		Customer customer = (Customer) httpSession.getAttribute("user");
		model.addAttribute("customer", customer);
		return "account/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("customer") Customer customer, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "account/update";
		}
		
		if(!photo.isEmpty()){
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "account/update";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "account/register";
			}
			
			String dir = context.getRealPath("/images/customer/");
			System.out.println("Dir path: " + dir);
			File f = new File(dir, photo.getOriginalFilename());
			photo.transferTo(f);
			customer.setPhoto(f.getName());
			f.renameTo(new File(dir+customer.getPhoto()));
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		try{
			session.update(customer);
			transaction.commit();
			model.addAttribute("message", "Update customer successfully!");
			httpSession.setAttribute("user", customer);
		}
		catch(ConstraintViolationException cve){
			model.addAttribute("message", "UserName is already existed!!!");
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Add new customer failed!");
		}
		
		return "account/update";
	}
	
	@RequestMapping(value="forgot-password", method=RequestMethod.GET)
	public String forgotPassword(ModelMap model){
		return "account/forgot-password";
	}
	
	@RequestMapping(value="forgot-password", method=RequestMethod.POST)
	public String forgotPassword(ModelMap model, @RequestParam("id") String id){
		if(id.trim().length() == 0){
			model.addAttribute("message_err", "Please enter username !");
			return "account/forgot-password";
		}
		
		Session session = factory.getCurrentSession();
		Customer customer  = (Customer) session.get(Customer.class, id);
		if(customer == null){
			model.addAttribute("message", "Invalid username!");
			System.out.println("Customer null");
		}
		else{
			try{
				String body = "Your password on building material website: " + customer.getPassword();
				mailer.send("n17dccn017@student.ptithcm.edu.vn", customer.getEmail(), "Forgot Password", body);
				model.addAttribute("message", "We send you email successfully! Please check it to get password!");
			}catch(Exception ex){
				model.addAttribute("message", "Send  mail failed");
			}
		}
		return "account/forgot-password";
	}
}
