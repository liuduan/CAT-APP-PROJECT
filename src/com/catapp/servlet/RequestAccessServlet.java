package com.catapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.catapp.connection.DBConnection;
import com.catapp.entity.User;  
@WebServlet(value="/RequestAccessServlet")
public class RequestAccessServlet extends HttpServlet {  
	private static final Logger LOGGER = Logger.getLogger(RequestAccessServlet.class);
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)  
	                    throws ServletException, IOException {  
			Connection lConn=null;
			
			System.out.println("RequestAccessServlet A \n");
			
	        try{
	        	String forgotEmail=request.getParameter("forgotEmail").toString();   
	        	
	        	System.out.println("RequestAccessServlet B: " + forgotEmail);
	        	

	        	HttpSession session=request.getSession();  
	        	session.setAttribute("forgotEmail",forgotEmail);
	        	 lConn = new DBConnection().getConnection();
	        	boolean lVailidityflag=ForgotPasswordServlet.pAuthenticateEmail(forgotEmail, lConn);
	        	if(lVailidityflag){
	        		HashMap<Long,String>pSQMap = new LoadDataForHome().getSecurityQuestions();
	        		request.setAttribute("secqu", pSQMap);
	        		User lUser =new LoginServlet().fetchUserDetails(forgotEmail, lConn);
	        		request.getSession().setAttribute("user", lUser);

	        		System.out.println("RequestAccessServlet C: " + forgotEmail);
	        		
	        		request.setAttribute("forgotEmail", forgotEmail);	// submit value to the jsp page:
	        		
	        		request.getRequestDispatcher("/WEB-INF/ForPassPage.jsp?page=1").include(request, response);
	        		
	        	}else{
	        		
	        		System.out.println("RequestAccessServlet C2 " + forgotEmail);
	        		request.getRequestDispatcher("/WEB-INF/ForPassPage.jsp?page=3").include(request, response);
	        		

	        	}
	        	
	        }catch(Exception e){
	        	LOGGER.error("Error Occured while redirecting the request",e);
	        }finally{
	        	try{
	        		if(lConn!=null){
	        			lConn.close();
	        		}
	        	}catch(Exception e1){
	        		LOGGER.error("Error Occured while closing the connection",e1);
	        	}
	        }
	       
	        
	    }  
	}  


