package ptithcm.interceptor;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.entity.Category;
import ptithcm.entity.Customer;
import ptithcm.entity.Product;

@Transactional
public class GlobalInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	SessionFactory factory;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//  Categories
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		request.setAttribute("cates", list);
		
		// Cart Info
		HashMap<String, Product> cart = (HashMap<String, Product>) request.getSession().getAttribute("cart");
		Customer user = (Customer) request.getSession().getAttribute("user");
		int num  = 0; float cost = 0;
		if(cart != null && user != null){
			Collection<Product> products = cart.values();
			List<Product> cartList;
			if(products instanceof List){
				cartList = (List<Product>) products;
			}
			else{
				cartList = new ArrayList<>(products);
			}
			for (Product product : cartList) {
				num += product.getQuantity();
				cost += product.getQuantity() * product.getUnitPrice() * (1-product.getDiscount());
			}
			request.setAttribute("num_items", num);
			request.setAttribute("cost", cost);
		}
		
		// User Info
		if(user != null){
			String name = user.getName();
//			System.out.println("Name of log in user: " + name);
			request.setAttribute("nameUser", name);
		}
	}
}