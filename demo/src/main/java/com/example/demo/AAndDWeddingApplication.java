package com.example.demo;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({ "com.example.demo", "com.example.service","com.example.observer","com.example.service" })
public class AAndDWeddingApplication extends SpringBootServletInitializer {
	
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(AAndDWeddingApplication.class);
	}
	
	public static void main(String[] args) throws IOException {
		SpringApplication.run(AAndDWeddingApplication.class, args);
		AAndDWeddingApplication app=new AAndDWeddingApplication();
		try {
			String file = "src/main/resources/guest.txt";
			/*
			 * reader = new BufferedReader(new FileReader(file)); String currentLine =
			 * reader.readLine(); while(currentLine!=null) {
			 * System.out.println("currentLine::: " + currentLine); String
			 * name=currentLine.split(":")[0]; System.out.println("currentLine name::: " +
			 * name); String email=currentLine.split(":")[1];
			 * System.out.println("currentLine email::: " + email); Observer o=new
			 * GuestObserver(s,name,email); currentLine = reader.readLine(); }
			 * reader.close();
			 */
			
			
		} catch (Exception e) {
		}
		finally
		{
		//	reader.close();
		}

	}
	

}
