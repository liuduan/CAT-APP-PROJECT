package com.catapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;

/**
 * Servlet implementation class DownloadAnalyticalServlet
 */
@WebServlet("/downloadAnalytical")
public class DownloadAnalyticalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadAnalyticalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost( request,  response) ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);
		Connection lConn   = null;
		try{
			if(session!=null){
				lConn=new DBConnection().getConnection();
<<<<<<< HEAD

				HashMap<String,String> casNumberMap=new ChemData().getCasNames(lConn, 3L);
=======
				
				HashMap<String,String> casNumberMap=new ChemData().getCasNames(lConn, 3L);
				HashMap<String,String> molecularMap=new ChemData().getMolecularClasses(lConn);
>>>>>>> SS-Master/master

				request.setAttribute("casnumber", casNumberMap);
				request.setAttribute("molecular", molecularMap);
				System.out.println("casNumberMap::"+casNumberMap.size()+"molecularMap::"+
						molecularMap.size());
				request.getServletContext().getRequestDispatcher("/WEB-INF/downloadAnalytical.jsp").forward(request, response);
			}
		
		else{
			request.setAttribute("error","Current session is lost. Please log in");
			request.getRequestDispatcher("/LoadDataForHome").include(request, response);  
			}
		}catch(Exception e){
			
		}
		finally{
			try{
				if(lConn!=null){
					lConn.close();
				}
			}catch(Exception e){
				
			}
		}
	}
	
	

}