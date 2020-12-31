package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Category;
import ptithcm.entity.Customer;
import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping("/product/")
public class ProductController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="index")
	public String index(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);
		System.out.println("Run");
		return "product/index";
	}
	
	@RequestMapping(value="list-by-category/{id}", method = RequestMethod.GET)
	public String listByCategory(ModelMap model, @PathVariable("id") String cateId){
		System.out.println(cateId);
//		Session session = factory.getCurrentSession();
//		Category category = (Category) session.get(Category.class, cateId);
//		
//		System.out.println("Info of category: ");
//		System.out.println(category.getName());
//		model.addAttribute("category", category);
		
//		List<Product> products = (List<Product>) category.getProducts();
//		System.out.println("Length of list: " + products.size());
//		model.addAttribute("products", products);
		
		Session session = factory.getCurrentSession();
		String hql = "FROM Product where category = :id";
		Query query = session.createQuery(hql);
		query.setString("id", cateId);
		List<Product> products = query.list();
		for (Product product : products) {
			System.out.println("Product ID: " + product.getProductId());
		}
		model.addAttribute("products", products);
		
		return "product/list-by-category";
	}
	
	@RequestMapping(value="search")
	public String search(ModelMap model, @RequestParam("keywords") String keyword){
		System.out.println("Keyword: " + keyword);
		keyword = keyword.trim();
		if("".equals(keyword)){
			model.addAttribute("message1", "Không để rỗng chuỗi");
		}
		else{
			Session session = factory.getCurrentSession();
			String hql = "FROM Product p where p.name LIKE :key or p.category.name LIKE :key";
			Query query = session.createQuery(hql);
			query.setString("key", "%" + keyword + "%");
			List<Product> products = query.list();
			
			model.addAttribute("products", products);
			model.addAttribute("num_result", products.size());
		}
		
		return "product/search";
	}
	
//	public String normalizeSpecification(String str){
//		String temp = "";
//		String[] arr = str.split("-");
//		for(int i=0; i<arr.length;i++){
//			if(i != (arr.length-1) && i != 0){
//				temp += "- " + arr[i] + "\n"; 
//			}
//		}
//		return temp;
//	}
	
	@RequestMapping(value="detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap model, @PathVariable("id") String prodId){
		Session session = factory.getCurrentSession();
		Product prod = (Product) session.get(Product.class, prodId);
		System.out.println("Detail Product ID: " + prod.getProductId());
//		String spec = normalizeSpecification(prod.getSpecification());
//		prod.setSpecification(spec);
//		System.out.println("Prod Spec:" + prod.getSpecification());
		model.addAttribute("product", prod);
		
//		session.close();
		Session session1 = factory.openSession();
		Transaction transaction = session1.beginTransaction();
		try{
			if(prod.getViewCount() == null){
				prod.setViewCount(0);
			}
			prod.setViewCount(prod.getViewCount()+1);
			session1.update(prod);
			transaction.commit();
		}
		catch(Exception ex){
			transaction.rollback();
//			System.out.println(ex.toString());
		}
		finally {
			session1.close();
		}
		return "product/detail";
	}
	
	@RequestMapping(value="top-view", method = RequestMethod.GET)
	public String seeTopView(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.viewCount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(5);
		List<Product> products = query.list();
		
		model.addAttribute("products", products);
		return "product/top-view";
	}
	
	@RequestMapping(value="top-discount", method = RequestMethod.GET)
	public String seeTopDiscount(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.discount DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(5);
		List<Product> products = query.list();
		
		model.addAttribute("products", products);
		return "product/top-discount";
	}
	
	@RequestMapping(value="top-order", method = RequestMethod.GET)
	public String seeTopOrder(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY size(p.orderDetail) DESC";					
		Query query = session.createQuery(hql);
		query.setMaxResults(10);
		List<Product> products = query.list();
		
		model.addAttribute("products", products);
		return "product/top-order";
	}
	
	@RequestMapping(value="top-newest", method = RequestMethod.GET)
	public String seeTopNewest(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.dateIn DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(5);
		List<Product> products = query.list();
		
		model.addAttribute("products", products);
		return "product/top-newest";
	}
}
