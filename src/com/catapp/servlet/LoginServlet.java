package com.catapp.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.catapp.action.Login;
import com.catapp.connection.DBConnection;
import com.catapp.entity.User;  

@WebServlet(value="/LoginServlet")
public class LoginServlet extends HttpServlet {  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(LoginServlet.class);
	//private static final long serialVersionUID = 1L;
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
	                    throws ServletException, IOException {    
		String email=request.getParameter("email").toString();  
	    String password=request.getParameter("password");  
	    Connection lConn = new DBConnection().getConnection();
	    
	    // BasicConfigurator.configure();
	    
	        
	    try{
	     	User lUser =new User();
        
	      	lUser =fetchUserDetails(email, lConn);
	      	System.out.println(email + ", email. \n\n");
	      	
	       	boolean lFlag =validateUsers(password, lUser.getPassword());
	        	
	       	if(lFlag){
	       		System.out.println("lFlag is true.");
	       		if(lUser.getApproved()!=null && lUser.getApproved().equals("Y")){
	        			

	       			System.out.println("It is approved.");

	        	
	        				
	        		HttpSession session=request.getSession();  
	        		session.setAttribute("email",email);
	        		session.setAttribute("user", lUser);
	        		System.out.println("After Session set..");
	        				/*User lUserToSave = new User();
	        				lUserToSave.setEntityId(lUser.getEntityId());
	        				lUserToSave.find(lConn, lUserToSave);
	        				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	        				lUserToSave.setLast_login_time(timestamp);
	        				lUserToSave.save(lConn, lUserToSave);*/
	        		request.getRequestDispatcher("/WEB-INF/welcomeUserHome.jsp").include(request, response);
	        				
	        		}else{
	        				
	        			System.out.println("not approved yet.");
		       			request.setAttribute("error","Your request is not approved yet.");
	    	        	request.getRequestDispatcher("/WEB-INF/credentialMismatch.jsp").include(request, response);          			
	        			}		// end of if-else if(lUser.getApproved()...){}
	        }else{
	        	System.out.println("Invalid Username or Password");
	        	request.setAttribute("error","Invalid Username or Password");
		       	request.getRequestDispatcher("/WEB-INF/credentialMismatch.jsp").include(request, response);  
	        	}
	        
	        	
	    }catch(Exception e){
	    	System.out.println("Invalid Username or Password 2");
	        request.setAttribute("error","Invalid Username or Password");
	        request.getRequestDispatcher("/WEB-INF/credentialMismatch.jsp").include(request, response);  
	        LOGGER.error("Error Occured while validating user",e);
	    }finally{
	       	try{
	    		if(lConn!=null){
	       			lConn.close();
	        		}
	       	}catch(Exception e1){
	       		LOGGER.error("Error Occured while closing connection",e1);
	        	}
	        }
	        
	    }  
	public Boolean validateUsers(String lTypedPassword, String lStoredPassword ){
			
		boolean lFlag=false;
		String lHashedPwd=Login.generateHash("PWD"+lTypedPassword);
			
			
        System.out.println("Password comparison: \n");
        System.out.println("Typed in: " + lTypedPassword);
        System.out.println("Typed in and hashed: " + lHashedPwd);
        System.out.println("\nFrom database: " + lStoredPassword  );
			
			
		if(lStoredPassword.equals(lHashedPwd)){
			System.out.println("They matche." + "\n\n");
			lFlag=true;
		}else{
			lFlag=false;
			}
		return lFlag;
	}
	
	public User fetchUserDetails(String pEmail,Connection pConnection){
			
		PreparedStatement lPstmnt = null;
		ResultSet lRst			  = null;
		User lUser 				  = new User();
		System.out.println("in fetchUser...");
		try{

			StringBuilder lBuilder = new StringBuilder("select entity_id, email, first_name, last_name, password, approved, is_admin, supervisor_name, institution, last_login_time from catapp.users where email=? ");
			lBuilder.append(" and is_active='Y' and rowstate!=-1");
				
			lPstmnt = pConnection.prepareStatement(lBuilder.toString());
			lPstmnt.setString(1, pEmail);
			lRst=lPstmnt.executeQuery();
				
			while(lRst.next()){
				lUser.setEntityId(lRst.getLong(1));
				lUser.setEmail(lRst.getString(2));
				lUser.setFirst_name(lRst.getString(3));
				lUser.setLast_name(lRst.getString(4));
				lUser.setPassword(lRst.getString(5));
				lUser.setApproved(lRst.getString(6));
				lUser.setIs_admin(lRst.getString(7));
				lUser.setSupervisorname(lRst.getString(8));
				lUser.setInstitution(lRst.getString(9));
				lUser.setLoggedBy(lRst.getLong(1));
				if(lRst.getTimestamp(10)!=null){
				lUser.setLast_login_time(lRst.getTimestamp(10));
				}
					
			}
				
				
		}catch(Exception e){
			LOGGER.error("Error Occured while fetching user details", e);
			}
		return lUser;
		}
} 