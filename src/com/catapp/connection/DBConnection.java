package com.catapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.catapp.entity.User;

public class DBConnection{
	private static String url = "jdbc:mysql://localhost:3306/catapp";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String password = "vibscatapp";
    private static Connection con;
   // private static String urlstring;

    public  Connection getConnection() {
    	
           try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
            
            try {
               con = DriverManager.getConnection(url, username, password);
            	//con=DriverManager.getConnection(url);
            	
            	
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
        /* catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }*/
    	return con;
    }
    /*public static void main(String[] args){
    	try {
          //  Class.forName(driverName);
            
            try {
               // con = DriverManager.getConnection(urlstring, username, password);
            	new DBConnection().getConnection();
            	
            } catch (Exception ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
    }
*/
}
