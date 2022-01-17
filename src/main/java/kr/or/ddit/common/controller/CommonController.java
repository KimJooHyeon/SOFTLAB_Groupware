package kr.or.ddit.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.login.interceptor.Auth;

@Controller
public class CommonController {
	@Auth
	@GetMapping("/common/feather")
	public String feather() throws Exception {
		
		return "common/feather";
	}
	@Auth
	@GetMapping("/common/colors")
	public String colors() throws Exception {
		
		return "common/colors";
	}
	@Auth
	@GetMapping("/common/blogView")
	public String blogView() throws Exception {
		
		return "common/blogView";
	}
	@Auth
	@GetMapping("/common/formInput")
	public String formInput() throws Exception {
		
		return "common/formInput";
	}
	@Auth
	@GetMapping("/common/formSelect")
	public String formSelect() throws Exception {
		
		return "common/formSelect";
	}
	@Auth
	@GetMapping("/common/buttons")
	public String buttons() throws Exception {
		
		return "common/buttons";
	}
	@Auth
	@GetMapping("/common/mainPageCal")
	public String mainPageCal() throws Exception {
		
		return "common/mainPageCal";
	}
	@Auth
	@GetMapping("/common/calendar")
	public String calendar() throws Exception {
		
		return "common/calendar";
	}
	@Auth
	@GetMapping("/common/table")
	public String table() throws Exception {
		
		return "common/table";
	}
	@Auth
	@GetMapping("/common/empAddForm")
	public String empAddForm() throws Exception {
		
		return "common/empAddForm";
	}
	@Auth
	@GetMapping("/common/alerts")
	public String alerts() throws Exception {
		
		return "common/alerts";
	}
	@Auth
	@GetMapping("/common/modals")
	public String modals() throws Exception {
		
		return "common/modals";
	}
	@Auth
	@GetMapping("/common/error")
	public String error() throws Exception {
		
		return "common/error";
	}
	@Auth
	@GetMapping("/common/tabs")
	public String tabs() throws Exception {
		
		return "common/tabs";
	}
	@Auth
	@GetMapping("/common/empList2")
	public String empList2() throws Exception {
		
		return "common/empList2";
	}
	@Auth
	@GetMapping("/common/checkbox")
	public String checkbox() throws Exception {
		
		return "common/checkbox";
	}
}
