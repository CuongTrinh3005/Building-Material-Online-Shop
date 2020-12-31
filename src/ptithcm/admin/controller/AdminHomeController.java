package ptithcm.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.Customer;

@Controller
@RequestMapping(value="/admin/home/")
public class AdminHomeController {
	HttpSession httpSession;
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession){
		Customer admin = (Customer) httpSession.getAttribute("user");
		if(admin != null){
			model.addAttribute("AdminId", admin.getCustomerId());
			model.addAttribute("AdminName", admin.getName());
		}
		return "admin/home/index";
	}
}
