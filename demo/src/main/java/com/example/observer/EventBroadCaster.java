package com.example.observer;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;

import com.example.model.EventFormModel;

@Controller
public class EventBroadCaster implements Subject {

	public ArrayList<Observer> observers;
	//private String event = null;
	private EventFormModel event;

	public EventBroadCaster() {
		observers = new ArrayList<Observer>();
	}

	@Override
	public void registerObserver(Observer o) {
		// TODO Auto-generated method stub
		observers.add(o);

	}

	@Override
	public void removeObserver(Observer o) {
		// TODO Auto-generated method stub
		observers.remove(o);
	}

	@Override
	public void notifyObserver() {
		System.out.println("notifyObserver calling loop "+observers.size());
		for (Observer o : observers) {
			System.out.println("o "+o.toString());
			o.update(this.event);
		}

	}

	public void setEvent(EventFormModel event) {
		System.out.println("Event is set in subject"+event);
		this.event = event;
		notifyObserver();
	}

}
