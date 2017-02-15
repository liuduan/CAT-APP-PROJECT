package com.catapp.servlet;
import java.io.IOException;  
import java.io.PrintWriter;  
	  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession; 
@WebServlet(value="/BackToHomeServlet")
public class BackToHomeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		response.setContentType("text/html");  
        //PrintWriter out=response.getWriter();
	      request.getServletContext().getRequestDispatcher("/WEB-INF/welcomeUserHome.jsp").forward(request, response);}
		
}