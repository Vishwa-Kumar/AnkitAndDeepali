package com.example.observer;

import com.example.demo.FrontController;
import com.example.model.EventFormModel;


public class GuestObserver implements Observer{

	private String name;
	private String email;
	private boolean isSubscribed=true;
	private Subject s;
	private EventFormModel eventDetails;
	
	
	FrontController fc=new FrontController();
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isSubscribed() {
		return isSubscribed;
	}

	public void setSubscribed(boolean isSubscribed) {
		this.isSubscribed = isSubscribed;
	}

	public Subject getS() {
		return s;
	}

	public void setS(Subject s) {
		this.s = s;
	}

	public EventFormModel getEventDetails() {
		return eventDetails;
	}

	public void setEventDetails(EventFormModel eventDetails) {
		this.eventDetails = eventDetails;
	}

	
	public GuestObserver()
	{
		
	}

	public GuestObserver(Subject sub,String name,String email)
	{
		this.name=name;
		this.email=email;
		this.s=sub;
		s.registerObserver(this);
	}
	
	@Override
	public void update(EventFormModel event) {
		System.out.println("update observer"+this.email+ " "+event);
		this.eventDetails=event;
		// send mail
		try {
			fc.sendMail(this.email,"vishwadeepaK71@gmail.com", this.eventDetails.getEventName(), this.eventDetails.getMessage());
			//emailService.sendMail(this.email, this.eventDetails.getEventName(), this.eventDetails.getMessage());
		}
			catch (Exception e1) {
				e1.printStackTrace();
				System.out.println("not able to save to db" + e1.getLocalizedMessage());
			}
		}

	@Override
	public String toString() {
		return "GuestObserver [name=" + name + ", email=" + email + ", isSubscribed=" + isSubscribed + ", s=" + s
				+ ", eventDetails=" + eventDetails +  "]";
	}
		
	

}
