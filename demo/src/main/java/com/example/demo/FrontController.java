package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	String uname = "";
	String password = "";

	
	@RequestMapping("/")
	String login(Model model) {
		System.out.println("loginPage method");

		return "index";
	}
	@RequestMapping("/sample")
	String sample(Model model) {
		System.out.println("loginPage method");

		return "index-5";
	}

	@RequestMapping("/about")
	String about(Model model) {
		System.out.println("about method");

		return "about";
	}

	@RequestMapping("/gallery")
	String gallery(Model model) {
		System.out.println("gallery method");

		return "gallery";
	}

	@RequestMapping("/services")
	String services(Model model) {
		System.out.println("services method");

		return "services";
	}

	@RequestMapping("/logout")
	String logout() {
		System.out.println("logout called method");
		uname = "";
		password = "";
		return "login";
	}

	/*
	 * @CrossOrigin(origins = "http://localhost:8080/sendBlessing")
	 * 
	 * @RequestMapping(value = "/sendBlessing", method = RequestMethod.POST) public
	 * String method(HttpServletRequest httpServletRequest,HttpServletResponse
	 * httpServletResponse) { System.out.println("send blessing invoked");
	 * System.out.println("checking request name    "+httpServletRequest.
	 * getParameter("name")); String
	 * senderName=httpServletRequest.getParameter("name"); String
	 * senderEmail=httpServletRequest.getParameter("email"); String
	 * messageFor=httpServletRequest.getParameter("guest"); String
	 * isAttending=httpServletRequest.getParameter("events"); String
	 * message=httpServletRequest.getParameter("notes");
	 * 
	 * System.out.println("isAttending"+isAttending);
	 * message=message+"\n\n-from \n "+senderName+" ("+senderEmail+")";
	 * 
	 * 
	 * try { emailService.sendMail("vishwadeepak71@gmail.com",
	 * "Blessing From "+senderName +" ("+senderEmail+")", message); try {
	 * emailService.sendMail("amritanshaandtanmay@gmail.com",
	 * "Blessing From "+senderName, message); } catch(Exception e) {
	 * System.out.println("email sending failed to amritanshaandtanmay@gmail.co "+e.
	 * getMessage()); }
	 * 
	 * System.out.println("email sent successfully"); } catch(Exception e) {
	 * System.out.println("email sending failed to vishwadeepak71@gmail.com  :"+e.
	 * getMessage()); }
	 * 
	 * return "true"; }
	 */
}
