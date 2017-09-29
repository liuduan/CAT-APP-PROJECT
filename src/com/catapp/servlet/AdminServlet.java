package com.catapp.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.catapp.connection.DBConnection;
import com.catapp.entity.User;;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

	
	private static final Logger LOGGER = Logger.getLogger(LoginServlet.class);
	public User fetchUserDetails(String pEmail, Connection pConnection){
		System.out.println("Hello World.. 1 ");
		
		PreparedStatement lPstmnt = null;
		ResultSet lRst			  = null;
		User lUser 				  = new User();
		
		try{
			
			String query_string = "select * from users where a.email=?";												 
			lPstmnt.setString(1, pEmail);						 
			lPstmnt = pConnection.prepareStatement(query_string);
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


	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
		/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
<<<<<<< HEAD
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Hello World.. 5");
		
		Connection lConn = new DBConnection().getConnection();
		
      	
      	
      	

    	// shellCommands.main("copy C:\\2-Installers\\Clock\\Clock-image.ico C:\\2-Installers\\Clock\\Clock-image2.ico ");
    	System.out.println("ping");
    	
      	// back to normal
    	HttpSession session = request.getSession(false);
    	
    	
		if(session != null){
			String email="";
			try{
				if((User)request == null){
					System.out.println("null (User)request");}	
			}catch(Exception e){
				LOGGER.error("Error Occured while fetching user details", e);
			}

			if(((User)request.getSession().getAttribute("user")).getEmail() != null){
				email=((User)request.getSession().getAttribute("user")).getEmail().toString();
			}
			else{getServletContext().getRequestDispatcher("/home").forward(request, response);
			}
			//"test_user1@tamu.edu";  
	
				User lUser =new User();
    
				lUser =fetchUserDetails(email, lConn);
			System.out.println("ping 2"); 
			getServletContext().getRequestDispatcher("/WEB-INF/Admin.jsp").forward(request, response);
		}
		else{
			System.out.println("ping 3");
			request.setAttribute("error","Current session is lost. Please log in");
			request.getRequestDispatcher("/LogoutServlet").include(request, response);  
			}

		
		
		
		
		// This line is go to "/WEB-INF/Adminpage.jsp" with all the parameters.

	}

	
	
	
	
	private void shellCommands(String string) {
		// TODO Auto-generated method stub
		
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
=======
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Connection lConn = new DBConnection().getConnection();
    	HttpSession session = request.getSession(false);
    	
    	
		if(session != null){
			String email="";
			if(((User)request.getSession().getAttribute("user")).getEmail() != null){
				email=((User)request.getSession().getAttribute("user")).getEmail().toString();
			}
			else{getServletContext().getRequestDispatcher("/home").forward(request, response);
			}
			//"test_user1@tamu.edu";  
	
				User lUser =new User();
    
				lUser =fetchUserDetails(email, lConn);
			System.out.println("ping 2"); 
			getServletContext().getRequestDispatcher("/WEB-INF/Admin.jsp").forward(request, response);
		}
		else{
			System.out.println("ping 3");
			request.setAttribute("error","Current session is lost. Please log in");
			request.getRequestDispatcher("/LogoutServlet").include(request, response);  
			}

		
>>>>>>> SS-Master/master
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}