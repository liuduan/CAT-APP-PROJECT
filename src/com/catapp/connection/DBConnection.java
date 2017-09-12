package com.catapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.catapp.entity.User;

public class DBConnection{
<<<<<<< HEAD

	private static String url = "jdbc:mysql://localhost:3306/catapp";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String password = "vibscatapp";
=======
	private static String url = "jdbc:mysql://localhost:3306/CATAPP?autoReconnect=true&useSSL=false";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
   private static String password = "ashima";
>>>>>>> 180f8eca364d8ed4b57417a630d104ad2dc6cd2d
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
<<<<<<< HEAD

               con = DriverManager.getConnection(url, username, password);
            	//con=DriverManager.getConnection(url);
               if(!con.isClosed() || con!=null){
            	   System.out.println("------Successful database connection.------------------------\n\n");}


=======
                con = DriverManager.getConnection(url, username, password);
            	//con=DriverManager.getConnection(url);
            	
            	
>>>>>>> 180f8eca364d8ed4b57417a630d104ad2dc6cd2d
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
         /*catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }*/
    	return con;
    }

}




/*package com.catapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class DBConnection{
	private static String url = "jdbc:mysql://localhost:3306/CATAPP?autoReconnect=true&useSSL=false";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String password = "vibscatapp";
    private static Connection con;
	public static final Logger logger = Logger.getLogger(DBConnection.class.toString());
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
               logger.error("Connection Successful");
            	
            } catch (SQLException ex) {
                // log an exception. fro example:
            	logger.error("Error Occured While creating connection---->", ex);
            }
         catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
    	return con;
    }
    public static void main(String[] args){
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
//}

