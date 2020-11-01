package com.example.model;

import org.springframework.stereotype.Component;

@Component
public class EventFormModel {
	
	private String eventName;
	private String date;
	private String startTime;
	private String endTime;
	private String message;
	
	public EventFormModel(String eventName, String date, String startTime, String endTime, String message) {
		this.eventName = eventName;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.message = message;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getDay() {
		return date;
	}

	public void setDay(String day) {
		this.date = day;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "EventFormModel [eventName=" + eventName + ", day=" + date + ", startTime=" + startTime + ", endTime="
				+ endTime + ", message=" + message + "]";
	}
	
	
	
	

}
