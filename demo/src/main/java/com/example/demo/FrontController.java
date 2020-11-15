package com.example.demo;

import java.io.BufferedReader;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.ClientDetails;
import com.example.model.EventFormModel;
import com.example.model.Result;
import com.example.model.RsvpFormModel;
import com.example.observer.EventBroadCaster;
import com.example.observer.GuestObserver;
import com.example.service.CommonService;
import com.example.service.EmailService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FrontController {

	@Autowired
	private EmailService emailService;
	
	String uname = "";
	String password = "";
	BufferedReader reader;

	CommonService commonService=new CommonService();

	private EventBroadCaster s = new EventBroadCaster();

	@RequestMapping("/")
	String login(Model model) {
		System.out.println("loginPage method emailService"+emailService);
		return "index";
	}

	@RequestMapping("/sample")
	String sample(Model model) {
		System.out.println("loginPage method");
		return "index-5";
	}

	@RequestMapping("/broadCastEvent")
	String about(Model model) {
		System.out.println("broadCastEvent method"+emailService);
		return "broadCastEvent";
	}

	@RequestMapping("/services")
	String services(Model model) {
		System.out.println("services method");
		return "services";
	}

	

	@RequestMapping(value = "/notifyGuest", method = RequestMethod.POST)
	String notifyGuest(@ModelAttribute("event-form") EventFormModel eventFormModel) {
		System.out.println("notifyGuest method eventFormModel " + eventFormModel+"   "+emailService);
		//s.setEvent(eventFormModel);
		//loadObserver(eventFormModel);
		fetchObserver(eventFormModel);
		
		return "true";
	}

	@RequestMapping(value = "/subscribe", method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	String subscribe(@ModelAttribute("rsvp-form") RsvpFormModel rsvpFormModel,HttpServletResponse httpServletResponse ) {
		System.out.println("subscribe method rsvpFormModel " + rsvpFormModel);
		Result result=null;
		String json = null;
		emailService.sendMail("vishwadeepak71@gmail.com", "subscriber for ankit marriage",rsvpFormModel.getEmail()+" "+rsvpFormModel.getName() );
		emailService.sendMail(rsvpFormModel.getEmail(),"Ankit wed Deepali wedding events Subscribed successfully" ,"You have been subscribed successfully to ankit and deepali wedding events");
		result=commonService.addSubscriber(rsvpFormModel.getName(), rsvpFormModel.getEmail(), true);
		System.out.println("result "+result.toString());
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			json = objectMapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json;
	}

	@RequestMapping(value = "/sendmail", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Result sendmail(@RequestBody ClientDetails clientDetails,
			HttpServletResponse httpServletResponse) {

		ObjectMapper Obj = new ObjectMapper();
		//VisitorService visitorService = new VisitorService();
		Result res = null;
		String json = null;
		ObjectMapper objectMapper = new ObjectMapper();
		System.out.println("send mail called " + clientDetails.toString());
		try {

			//res = visitorService.saveVisitorDetails(clientDetails);
			//json = objectMapper.writeValueAsString(res);
			
			emailService.sendMail("viskumdee@gmail.com", "someone is visiting ankitanddeepali.com ",
					Obj.writeValueAsString(clientDetails));
			emailService.sendMail("deepalidas93@gmail.com", "someone is visiting ankitanddeepali.com ",
					Obj.writeValueAsString(clientDetails));
			
			emailService.sendMail("aagarwal.kiit@gmail.com", "someone is visiting your website",
					Obj.writeValueAsString(clientDetails));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			System.out.println("not able to save visitor details to db" + e.getLocalizedMessage());

		} catch (Exception e) {
			System.out.println("sendMail failed" + e.getLocalizedMessage());

		}

		return res;
	}
	
	public void fetchObserver(EventFormModel eventFormModel)
	{
		List<GuestObserver> obsList=commonService.fetchSubscriber();
		
		for(GuestObserver o:obsList)
		{
			String msg=" "+eventFormModel.getEventName()+"\n"+eventFormModel.getMessage()+"\n date : "+eventFormModel.getDay()+"\n start time: "+eventFormModel.getStartTime()+"\n end time: "+eventFormModel.getEndTime()
			+"\n\n -Regards \n"+" Ankit & Deepali";
			emailService.sendMail(o.getEmail(), eventFormModel.getEventName(),msg );
		}
		
	}
	
	
	/*
	 * public void loadObserver(EventFormModel eventFormModel) { try { String file =
	 * "src/main/resources/guest.txt";
	 * 
	 * reader = new BufferedReader(new FileReader(file)); String currentLine =
	 * reader.readLine(); while (currentLine != null) {
	 * System.out.println("currentLine::: " + currentLine); String name =
	 * currentLine.split(":")[0]; System.out.println("currentLine name::: " + name);
	 * String email = currentLine.split(":")[1];
	 * System.out.println("currentLine email::: " + email); Observer o = new
	 * GuestObserver(s, name, email); s.registerObserver(o); currentLine =
	 * reader.readLine(); String
	 * msg=" "+eventFormModel.getEventName()+"\n"+eventFormModel.getMessage()
	 * +"\n date : "+eventFormModel.getDay()+"\n start time: "+eventFormModel.
	 * getStartTime()+"\n end time: "+eventFormModel.getEndTime()
	 * +"\n\n -Regards \n"+" Ankit & Deepali"; emailService.sendMail(email,
	 * eventFormModel.getEventName(),msg ); } reader.close();
	 * 
	 * } catch (Exception e) { } finally {
	 * 
	 * }
	 * 
	 * }
	 */
}
