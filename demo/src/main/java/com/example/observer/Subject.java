package com.example.observer;

import org.springframework.stereotype.Component;

@Component
public interface Subject {
	
	public void registerObserver(Observer o);
	public void removeObserver(Observer o);
	public void notifyObserver();

}
