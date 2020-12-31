package ptithcm.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ptithcm.entity.Customer;
import ptithcm.entity.CustomerOrder;
import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping(value="/cart/")
public class CartController {
//	@Autowired
//	CartService cart;
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="add/{id}", method=RequestMethod.GET)
	public String add(@PathVariable("id") String id, HttpSession httpSession){
		HashMap<String, Product> cartItems = (HashMap<String, Product>) httpSession.getAttribute("cart");
		if(cartItems == null){
			cartItems = new HashMap<>();
		}
		
		if(cartItems.containsKey(id)){
			Product p = cartItems.get(id);
			p.setQuantity(p.getQuantity()+1);
			cartItems.put(id, p);
		}
		else{
			Session session = factory.getCurrentSession();
			Product product = (Product) session.get(Product.class, id);
			product.setQuantity(1);
			cartItems.put(id, product);
		}
		httpSession.setAttribute("cart", cartItems);
		
		return "redirect:/cart/index.htm";
	}
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String index(ModelMap model, HttpSession httpSession){
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
			for (Product product : carList) {
				System.out.println("Cart Product: " + product.getName());
			}
			float totalPrice = getTotalCartPrice(carList);
			model.addAttribute("list", carList);
			model.addAttribute("total", totalPrice);
		}catch(NullPointerException np){
			model.addAttribute("message", "Empty cart");
			System.out.println("Empty cart");
		}
		
		return "cart/index";
	}
	
	public float getTotalCartPrice(List<Product> products){
		float price = 0;
		for (Product product : products) {
			price += product.getQuantity() * product.getUnitPrice() * (1 - product.getDiscount());
		}
		return price;
	}
	
	@RequestMapping(value="update/{id}")
	public String  updateItem(ModelMap model, @PathVariable("id") String id
			, HttpServletRequest request, HttpSession httpSession){

		System.out.println("Id: " + id);
		String attr = "quantity_"+id;
		String quantity_str = request.getParameter(attr);
		int quantity = Integer.valueOf(quantity_str);
		
		System.out.println("Quantity: " + quantity);
//		System.out.println("RunGET");
		HashMap<String, Product> carList = (HashMap<String, Product>) httpSession.getAttribute("cart");
		if(carList != null){
			Product product = carList.get(id);
			if(quantity > 0){
				product.setQuantity(quantity);
//				carList.put(id, product);
				model.addAttribute("message", "Cleared an item in cart successfully!");
			}
			else{
				model.addAttribute("message", "Quantity must be greater than 0!!");
			}
		}
		return "redirect:/cart/index.htm";
	}
	
	@RequestMapping(value="delete/{id}", method=RequestMethod.POST)
	public String  deleteItem(ModelMap model,  @PathVariable("id") String id, HttpSession httpSession){
		HashMap<String, Product> carList = (HashMap<String, Product>) httpSession.getAttribute("cart");
		if(carList != null){
			carList.remove(id);
			model.addAttribute("message", "Cleared an item in cart successfully!");
		}
		return "redirect:/cart/index.htm";
	}
	
	@RequestMapping(value="clear-all", method=RequestMethod.GET)
	public String clearAll(ModelMap model, HttpSession httpSession){
		HashMap<String, Product> carList = (HashMap<String, Product>) httpSession.getAttribute("cart");
		if(carList != null){
			carList.clear();
			model.addAttribute("message", "Cleared all items in cart successfully!");
		}
		return "redirect:/cart/index.htm";
	}
}
