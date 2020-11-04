package com.example.demo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.EventFormModel;
import com.example.model.RsvpFormModel;
import com.example.observer.EventBroadCaster;
import com.example.observer.GuestObserver;
import com.example.observer.Observer;
import com.example.service.EmailService;

@Controller
public class FrontController {

	@Autowired
	private EmailService emailService;
	
	String uname = "";
	String password = "";
	BufferedReader reader;

	

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

	@RequestMapping("/logout")
	String logout() {
		System.out.println("logout called method");
		uname = "";
		password = "";
		return "login";
	}

	@RequestMapping(value = "/notifyGuest", method = RequestMethod.POST)
	String notifyGuest(@ModelAttribute("event-form") EventFormModel eventFormModel) {
		System.out.println("notifyGuest method eventFormModel " + eventFormModel+"   "+emailService);
		s.setEvent(eventFormModel);
		loadObserver(eventFormModel);
		
		return "true";
	}

	@RequestMapping(value = "/subscribe", method = RequestMethod.POST)
	String subscribe(@ModelAttribute("rsvp-form") RsvpFormModel rsvpFormModel) {
		System.out.println("subscribe method rsvpFormModel " + rsvpFormModel);
		try {
			String filename = "src/main/resources/guest.txt";
			FileWriter fw = new FileWriter(filename, true); // the true will append the new data
			fw.write(rsvpFormModel.getName().trim().toLowerCase() + ":" + rsvpFormModel.getEmail().trim().toLowerCase()
					+ "\n");// appends the string to the file
			fw.close();
			emailService.sendMail("vishwadeepak71@gmail.com", "subscriber for ankit marriage",rsvpFormModel.getEmail()+" "+rsvpFormModel.getName() );
		} catch (IOException ioe) {
			System.err.println("IOException: " + ioe.getMessage());
		}

		return "true";
	}

	public void sendMail(String to, String from, String subject, String body) {
		
		System.out.println("in FC::sendMail::emailService::"+emailService);
		emailService.sendMail(to, subject, body);

	}
	
	public void loadObserver(EventFormModel eventFormModel)
	{
		try {
			String file = "src/main/resources/guest.txt";

			reader = new BufferedReader(new FileReader(file));
			String currentLine = reader.readLine();
			while (currentLine != null) {
				System.out.println("currentLine::: " + currentLine);
				String name = currentLine.split(":")[0];
				System.out.println("currentLine name::: " + name);
				String email = currentLine.split(":")[1];
				System.out.println("currentLine email::: " + email);
				Observer o = new GuestObserver(s, name, email);
				s.registerObserver(o);
				currentLine = reader.readLine();
				String msg=" "+eventFormModel.getEventName()+"\n"+eventFormModel.getMessage()+"\n date : "+eventFormModel.getDay()+"\n start time: "+eventFormModel.getStartTime()+"\n end time: "+eventFormModel.getEndTime()
				+"\n\n -Regards \n"+" Ankit & Deepali";
				emailService.sendMail(email, eventFormModel.getEventName(),msg );
			}
			reader.close();

		} catch (Exception e) {
		} finally {

		}

	}
}
