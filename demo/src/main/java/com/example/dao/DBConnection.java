package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static Connection single_Db_instance = null;
	public static int dbConnectionObjectCount = 0;

	// private constructor restricted to this class itself
	private DBConnection() {

	}

	// static method to create instance of Singleton class
	public static Connection getInstance() {
		String connectionUrl = "jdbc:mysql://vishwawebsitedb.ci2imxqem4ip.us-east-2.rds.amazonaws.com:3306/vishwaWebsite";
		try
		{
			if (single_Db_instance == null) {
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					single_Db_instance = DriverManager.getConnection(connectionUrl, "vishwa", "vishwakumardeepak");
					dbConnectionObjectCount++;
					System.out.println("getInstance::connectin object count::" + dbConnectionObjectCount + " conn  "
							+ single_Db_instance.toString());
				}

			} else {
				if (single_Db_instance.isValid(5)) {
					return single_Db_instance;
				} else {
					single_Db_instance.close();
					single_Db_instance = null;
					Class.forName("com.mysql.cj.jdbc.Driver");
					single_Db_instance = DriverManager.getConnection(connectionUrl, "vishwa", "vishwakumardeepak");
					dbConnectionObjectCount++;
					System.out.println("getInstance::connectin object count isvalid section::" + dbConnectionObjectCount
							+ " conn  " + single_Db_instance.toString());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return single_Db_instance;

	}

}
