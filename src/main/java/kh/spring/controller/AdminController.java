package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	
	  @RequestMapping("dashboard") 
	  public String dashboard() { 
		  return "admin/dashboard"; 
	  }
	  
	  @RequestMapping("member") 
	  public String member() { 
		  return "admin/member"; 
	  }
	  
	  @RequestMapping("board")
	  public String board() {
		  return "admin/board";
	  }
	  
	 
}