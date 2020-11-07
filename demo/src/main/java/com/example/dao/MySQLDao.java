package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Result;
import com.example.observer.EventBroadCaster;
import com.example.observer.GuestObserver;

public class MySQLDao {
	
	public Result addSubscriberToDB(String name, String email)
	{
		Connection conn= DBConnection.getInstance();
		Result result=new Result();
		
		System.out.println("calling db");
		String sqlSelectAllPersons = "INSERT INTO `vishwaWebsite`.`maduWeddingSubscriber`  VALUES (?, ?, ?)";
		
		 
		try {
			System.out.println("conn  "+conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
			ps.setString(1, name+email);
			ps.setString(2, name);
			ps.setString(3, email);
			
	        int rs = ps.executeUpdate();
	        if(rs==1)
	        {
	        	result.setErrorCode(0);
	        	result.setRes(true);
	        	result.setErrorMsg("success");;
	        }
	        System.out.println("rs "+rs);
		      
		}catch(SQLIntegrityConstraintViolationException sicv)
		{
				sicv.printStackTrace();
	        	result.setErrorCode(sicv.getErrorCode());
	        	result.setRes(false);
	        	result.setErrorMsg(sicv.getLocalizedMessage());
	        
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			result.setErrorCode(e.getErrorCode());
        	result.setRes(false);
        	result.setErrorMsg(e.getLocalizedMessage());;
			
		}
		return result;
	}
	
	public List<GuestObserver> fetchSubscriberToDB()
	{
		Connection conn= DBConnection.getInstance();
		 List<GuestObserver> obsList=null;
		
		System.out.println("calling db");
		String sqlSelectAllPersons = "Select * from `vishwaWebsite`.`maduWeddingSubscriber`";
		EventBroadCaster s = new EventBroadCaster();
		 
		try {
			System.out.println("conn  "+conn);
			PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
			 ResultSet rs = ps.executeQuery();
			 obsList=new ArrayList<GuestObserver>();
				 
			        while (rs.next()) {
			            String id = rs.getString("subscriberId");
			            String name = rs.getString("name");
			            String email = rs.getString("email");
			            obsList.add( new GuestObserver(s, name, email));
			           
			 System.out.println("name "+ name+" email "+email);
			            // do something with the extracted data...
			        }
		      
		}
		
		catch (SQLException e) {
			e.printStackTrace();
			
		}
		return obsList;
	}

}
