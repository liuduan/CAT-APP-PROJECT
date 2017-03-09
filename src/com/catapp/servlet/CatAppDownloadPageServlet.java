package com.catapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;  

@WebServlet(value="/CatAppDownloadPageServlet")
public class CatAppDownloadPageServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// PrintWriter out = response.getWriter();
		// out.println("DogName_Servlet.java: Hello Java!");
		
		// session.setAttribute("user", lUser);
		String received_value = request.getParameter("Email");	// receiving the post value
		request.setAttribute("Email", received_value);			// submit vlue to following page:
		
		getServletContext().getRequestDispatcher("/WEB-INF/catAppDownloadPage.jsp").forward(request, response);
	}
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
		
		Connection lConn= null; 
		try{
			
			lConn= new DBConnection().getConnection();
			HashMap<Long,String>lPhenoMap =  new ChemData().getNamesofInputs("phenotypes",lConn);
			HashMap<Long,String>lAssayMap =  new ChemData().getNamesofInputs("assaynames",lConn);
			HashMap<Long,String>lCellMap  =  new ChemData().getNamesofInputs("celllines",lConn);
			HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			request.setAttribute("pheno", lPhenoMap);
			request.setAttribute("assay", lAssayMap);
			request.setAttribute("cell", lCellMap);
			request.setAttribute("time", lTimMap);
			request.getServletContext().getRequestDispatcher("/WEB-INF/catAppDownloadPage.jsp").forward(request, response);
		} catch(Exception e){
			
		}finally{
			try{
				lConn.close();
			}catch(Exception e1){
				
			}
		}
		
	      }
		
}
