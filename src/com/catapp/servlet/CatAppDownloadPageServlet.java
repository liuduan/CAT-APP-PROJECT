package com.catapp.servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
	  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

@WebServlet(value="/CatAppDownloadPageServlet")
public class CatAppDownloadPageServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("DogName_Servlet.java: Hello Java!");
		
		// session.setAttribute("user", lUser);
		String received_value = request.getParameter("Email");	// receiving the post value
		request.setAttribute("Email", received_value);			// submit vlue to following page:
		
		getServletContext().getRequestDispatcher("/WEB-INF/catAppDownloadPage.jsp").forward(request, response);
	}
	/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		response.setContentType("text/html");  
        //PrintWriter out=response.getWriter();
	      request.getServletContext().getRequestDispatcher("/WEB-INF/catAppDownloadPage.jsp").forward(request, response);}
		
}
