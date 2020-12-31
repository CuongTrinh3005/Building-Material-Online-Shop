package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping(value="/home/")
public class HomeController {
	@RequestMapping(value="index")
	public String index(ModelMap model){
		return "home/index";
	}
	
	@RequestMapping(value="about")
	public String about(ModelMap model){
		return "home/about";
	}
	
	@RequestMapping(value="contact")
	public String contact(ModelMap model){
		return "home/contact";
	}
	
	@RequestMapping(value="product")
	public String product(ModelMap model){
		return "home/product";
	}
	
	@RequestMapping(value="faq")
	public String faq(ModelMap model){
		return "home/faq";
	}
	
	@RequestMapping(value="feedback")
	public String feedback(ModelMap model){
		return "home/feedback";
	}
	
	@RequestMapping(value="service")
	public String service(ModelMap model){
		return "home/service";
	}
}
