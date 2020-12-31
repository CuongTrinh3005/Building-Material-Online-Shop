package ptithcm.service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	public Cookie create(String name, String value, int days, HttpServletResponse response){
		String encodeVal = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodeVal);
		cookie.setMaxAge(days * 24 * 60 * 60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}
	
	public Cookie read(String name, HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)){
					String decodedVal = new String(Base64.getDecoder().decode(cookie.getValue()));
					cookie.setValue(decodedVal);
					return cookie;
				}
			}
		}
		return null;
	}
	
	public void delete(String name, HttpServletRequest request, HttpServletResponse response){
		Cookie cookie = this.read(name, request);
		if(cookie!=null){
			this.create(name, "", 0, response);
		}
	}
}
