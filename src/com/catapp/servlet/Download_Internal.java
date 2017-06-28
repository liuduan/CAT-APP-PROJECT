package com.catapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Download_Internal2
 */
@WebServlet("/Download_Internal")
public class Download_Internal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download_Internal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Download_Internal, Servlet" );
		ArrayList<String> places = new ArrayList<>(Arrays.asList("Buenos Aires", "Córdoba", "La Plata"));
		System.out.println("First element of the ArrayList: "+places.get(0));
		
		String received_value = request.getParameter("CM");	// receiving the post value
		request.setAttribute("CM", received_value);			// submit vlue to following page:
		
		System.out.println("Download_Internal, Servlet: " + received_value);
		
		
		received_value = request.getParameter("HT29");	// receiving the post value
		request.setAttribute("HT29", received_value);			// submit vlue to following page:
		
		System.out.println("Download_Internal, Servlet: " + received_value);
		
		
		
		getServletContext().getRequestDispatcher("/WEB-INF/Download_Internal.jsp").forward(request, response);
	}

}
