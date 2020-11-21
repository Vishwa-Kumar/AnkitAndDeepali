package com.example.service;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.example.dao.MySQLDao;
import com.example.model.Result;
import com.example.observer.GuestObserver;

public class CommonService {
	
	
	
	MySQLDao mySQLDao= new MySQLDao();
	
	public  String capitalize(String str) {
	    if(str == null || str.isEmpty()) {
	        return str;
	    }
	    return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	public Result addSubscriber(String name, String email, boolean isSub)
	{
		
		Result result=mySQLDao.addSubscriberToDB(name, email);
		return result;
	}
	public List<GuestObserver> fetchSubscriber()
	{
		
		List<GuestObserver> obsList=mySQLDao.fetchSubscriberToDB();
		return obsList;
	}
	
	public int DateAsint()
	{
		  Date date = new Date();
	      // display time and date
	      String str = String.format("Current Date/Time : %ts", date );
	      System.out.println(str+"   jjj");
	      str=(String)str;
	      long l=Long.parseUnsignedLong("1604696291")      ;
	      System.out.println(l);
	      return 0;
		
	}
	
	public boolean writeToAFile(String filename, String content) throws IOException
	{
		//String filename = "src/main/resources/guest.txt";
		FileWriter fw = null ;
		try {
			fw = new FileWriter(filename, true); // the true will append the new data
			fw.write(content);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fw.close();
		}// appends the string to the file
		finally
		{
			fw.close();
		}
		
		
		return true;
	}

}
