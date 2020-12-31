package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ptithcm.entity.Customer;
public class AdminSecurityInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session  = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if((user == null) || (!user.getAdmin())){
//			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect(request.getContextPath()+"/account/login.htm");
			return false;
		}
		return true;
	}
}
