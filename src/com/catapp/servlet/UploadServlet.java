package com.catapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catapp.action.ChemData;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	

    /**
     * Default constructor. 
     */
    public UploadServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service() throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	/*	PrintWriter out = response.getWriter();
		out.println("View and Download Page<br> From ViewDownloadServlet.java: Hello Java!");
		
		getServletContext().getRequestDispatcher("/WEB-INF/contact.jsp").forward(request, response);
		// This line is go to "/WEB-INF/Adminpage.jsp" with all the parameters.
*/		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	
	    HashMap<Long,String>lPhenoMap =  new ChemData().getPhenoTypes();
	    HashMap<Long,String>lAssayMap =  new ChemData().getAssayNames();
	    HashMap<Long,String>lCellMap  =  new ChemData().getCellLines();
	    HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
	    request.setAttribute("pheno", lPhenoMap);
	    request.setAttribute("assay", lAssayMap);
	    request.setAttribute("cell", lCellMap);
	    request.setAttribute("time", lTimMap);
	  	RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp");
	    rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
