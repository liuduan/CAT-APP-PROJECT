package com.catapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageActionServlet
 */
@WebServlet("/ManageActionServlet")
public class ManageActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String received_value = request.getParameter("User_ID");	// receiving the post value
		String received_Authorization = request.getParameter("Authorization");		// receiving the post value
		String received_Change_password = request.getParameter("Change_password");	// receiving the post value
		String received_Password_2 = request.getParameter("Password_2");			// receiving the post value
		
		PrintWriter out = response.getWriter();
		out.println("DogName_Servlet.java: Hello Java!");
		out.println(received_Authorization);
		
		request.setAttribute("User_ID", received_value);			// submit vlue to following page:
		request.setAttribute("Authorization", received_Authorization);			// submit vlue to following page:
		request.setAttribute("Change_password", received_Change_password);		// submit vlue to following page:
		request.setAttribute("Password_2", received_Password_2);				// submit vlue to following page:

		
		
		getServletContext().getRequestDispatcher("/WEB-INF/ManageAction.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
