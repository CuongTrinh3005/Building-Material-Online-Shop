package ptithcm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorityIntercetor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session  = request.getSession();
		if(session.getAttribute("user") == null){
//			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect(request.getContextPath()+"/account/login.htm");
			return false;
		}
		return true;
	}
	
}
