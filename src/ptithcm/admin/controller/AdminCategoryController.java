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

import ptithcm.entity.Category;
import ptithcm.entity.Customer;

@Transactional
@Controller
@RequestMapping(value="admin/category")
public class AdminCategoryController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> category = query.list();
		model.addAttribute("cates", category);
		return "admin/category/index";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(ModelMap model){
		model.addAttribute("category", new Category());
		return "admin/category/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, @Validated @ModelAttribute("category")Category category, 
			BindingResult errors){
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/category/insert";
		}
		else{
			Session session = factory.getCurrentSession();
			Category foundCategory  = (Category) session.get(Category.class, category.getCategoryId());
			if(foundCategory != null){
				model.addAttribute("message", "Category is already existed!");
				return "admin/category/insert";
			}
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.save(category);
			transaction.commit();
			model.addAttribute("message", "Add new category successfully!");
		}
		catch(ConstraintViolationException cve){
			model.addAttribute("message", "Category is already existed!!!");
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Add new category failed!");
		}
		finally {
			session.close();
		}
		
		return "admin/category/insert";
	}
	
	@RequestMapping(value="update/{id}", method=RequestMethod.GET)
	public String updateView(ModelMap model, @PathVariable("id")String id){
		Session session = factory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);
		model.addAttribute("category", category);
		return "admin/category/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("category")Category category, 
			BindingResult errors){
		if(errors.hasErrors()){
			model.addAttribute("message", "Please fix below errors!");
			return "admin/category/update";
		}
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try{
			session.evict(category);
			session.update(category);
			transaction.commit();
			model.addAttribute("message", "Update category successfully!");
		}
		catch(Exception ex){
			transaction.rollback();
			System.err.println(ex.toString());
			model.addAttribute("message", "Update category failed!");
		}
		finally {
			session.close();
		}
		
		return "admin/category/update";
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("id")String id){
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		String hql = "delete from Category where categoryId= :key";
		Query query = session.createQuery(hql);
		query.setString("key", id);
			
		try{
			int rows = query.executeUpdate();
			transaction.commit();
			if(rows != 0)
				model.addAttribute("message", "Delete category successfully!");
		}
		catch(ConstraintViolationException constraint){
			System.err.println("Category has  products is not allowed to delete");
			model.addAttribute("message", "Category has  products is not allowed to delete");
			return "admin/category/index";
		}
		catch(Exception ex){
			transaction.rollback();
			model.addAttribute("message", "Delete category failed!");
			System.err.println(ex.toString());
		}
		finally {
			session.close();
		}
		return "redirect:/admin/category/index.htm";
	}
}