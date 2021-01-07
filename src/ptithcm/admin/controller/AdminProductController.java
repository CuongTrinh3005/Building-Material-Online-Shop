package ptithcm.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
//import javax.validation.ConstraintViolationException;
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

import ptithcm.entity.Category;
import ptithcm.entity.Customer;
import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping(value="/admin/product/")
public class AdminProductController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> products = query.list();
		model.addAttribute("products", products);
		return "admin/product/index";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(ModelMap model){
		Product product = new Product();
		product.setDateIn(new Date());
		model.addAttribute("product", product);
		return "admin/product/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert1(ModelMap model, @Validated @ModelAttribute("product")Product product, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/product/insert";
		}
		else{
			Session session = factory.getCurrentSession();
			Product foundProduct = (Product) session.get(Product.class, product.getProductId());
			if(foundProduct != null){
				model.addAttribute("message", "Product is already existed!");
				return "admin/product/insert";
			}
		}
		
		if(photo.isEmpty()){
			product.setPhoto("product.png");
		}
		else{
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "admin/product/insert";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "admin/product/insert";
			}
			
			String dir = context.getRealPath("/images/product/");
			System.out.println("Dir path: " + dir);
			File f = new File(dir, photo.getOriginalFilename());
			photo.transferTo(f);
			product.setPhoto(f.getName());
			f.renameTo(new File(dir+product.getPhoto()));
			
//			String photoPath = context.getRealPath("/images/customer/" + photo.getOriginalFilename());
//			photo.transferTo(new File(photoPath));
			
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			if(product.getDiscount() == null){
				product.setDiscount((float) 0.0);
			}
			if(product.getViewCount()==null){
				product.setViewCount(0);
			}
			if(product.getQuantity()==null){
				product.setQuantity(1);
			}
			
			session.save(product);
			transaction.commit();
			model.addAttribute("message", "Add new product successfully!");
		}
		catch(ConstraintViolationException cve){
			model.addAttribute("message", "Product is already existed!!!");
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Add new product failed!");
		}
		finally {
			session.close();
		}
		return "admin/product/insert";
	}
	
	@RequestMapping(value="update/{id}", method=RequestMethod.GET)
	public String updateView(ModelMap model, @PathVariable("id")String id){
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		return "admin/product/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("product")Product product, 
			BindingResult errors,
			@RequestParam("photo_file")MultipartFile photo) throws IllegalStateException, IOException{
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/product/update";
		}
		
		if(!photo.isEmpty()){
			if(!photo.getContentType().equalsIgnoreCase("image/jpeg") && !photo.getContentType().equalsIgnoreCase("image/png")
					&& !photo.getContentType().equalsIgnoreCase("image/jpg")){
				model.addAttribute("message_img", "File image must be jpg, jpeg, png file!");
				return "admin/product/update";
			}
			if(photo.getSize() > 20971520){
				model.addAttribute("message_img", "File image is too big!");
				return "admin/product/update";
			}
			
			String dir = context.getRealPath("/images/product/");
			System.out.println("Dir path: " + dir);
			File f = new File(dir, photo.getOriginalFilename());
			photo.transferTo(f);
			product.setPhoto(f.getName());
			f.renameTo(new File(dir+product.getPhoto()));
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.evict(product);
			if(product.getDiscount() == null){
				product.setDiscount((float) 0.0);
			}
			if(product.getViewCount()==null){
				product.setViewCount(0);
			}
			if(product.getQuantity()==null){
				product.setQuantity(1);
			}
			session.update(product);
			transaction.commit();
			model.addAttribute("message", "Update product successfully!");
		}
		catch(ConstraintViolationException c){
			transaction.rollback();
			System.err.println(c.toString());
			model.addAttribute("message", "Update product failed, date must be past or today and not null!");
		}
		catch(Exception ex){
			transaction.rollback();
			System.err.println(ex.toString());
			model.addAttribute("message", "Update product failed!");
		}
		finally {
			session.close();
		}
		
		return "admin/product/update";
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("id")String id){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		String hql = "delete from Product where productId= :key";
		Query query = session.createQuery(hql);
		query.setString("key", id);
			
		try{
			int rows = query.executeUpdate();
			transaction.commit();
			if(rows != 0)
				model.addAttribute("message", "Delete product successfully!");
		}
		catch(ConstraintViolationException constraint){
			model.addAttribute("message", "Product has  orders is not allowed to delete");
			return "admin/product/index";
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Delete product failed!");
			System.err.println(ex.toString());
		}
		finally {
			session.close();
		}
		return "redirect:/admin/product/index.htm";
	}
}
