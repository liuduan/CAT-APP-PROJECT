package com.catapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;
import com.catapp.entity.ChemFile;
import com.catapp.entity.User;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ToDatabseServlet
 */
@WebServlet("/ToDatabseServlet")
public class ToDatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private final String UPLOAD_DIRECTORY = "C:/Users/CATAPP/serverfiles";

	public static final Logger logger = Logger.getLogger(SaveFileFormServlet.class.toString());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDatabaseServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		// doGet(request, response);
		System.out.println("SaveFileFormServlet A \n");
		logger.info("File Save Started");
		

		String original_name = "";
		String lFileExtension = "";
		String lFileName  = "";
		String lUploadPath = "C:/Users/CATAPP/serverfiles/CM/1/a";
		Connection lConn  = null;

		
		try{
			
			System.out.println("SaveFileFormServlet B \n");
			
			lConn = new DBConnection().getConnection();
			if(ServletFileUpload.isMultipartContent(request)){		
				
				System.out.println("SaveFileFormServlet C \n");
				List<FileItem> multiparts = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
					logger.info("Inside For Loop");

					
					
					//====================================================
					
					if(!item.isFormField()){
						
						
						original_name = new File(item.getName()).getName();		// file name
						if(original_name!=null){
							if(original_name.indexOf(".")!=-1){
								lFileExtension =original_name.split("\\.")[1];			// file extension
							}
						}
						
						lUploadPath = "C:\\Users\\CATAPP\\serverfiles\\CM\\1\\CM";	
						
						System.out.println("SaveFileFormServlet C2 lUploadPath: " + lUploadPath + ", " + original_name);

						lFileName = original_name;
						
						// write file here.
						item.write( new File(lUploadPath + File.separator + lFileName));
						File lFile1 = new File(lUploadPath + File.separator + original_name);

						System.out.println("SaveFileFormServlet replaced name: " + lFileName);

						// rename is here.
						lFile1.renameTo(new File(lUploadPath + File.separator + lFileName+"."+lFileExtension));
						System.out.println("SaveFileFormServlet C4");
	
					}
				}
				
			}		
			
		///// *************************** save file info ************************************/////
			// Save_file_info2DB(String pFileName,Connection pConnection);
	
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Upload?success=1");
		    rd.forward(request, response);
			
			
			///// ************************* Excel Save in DB *************************************//////
			
		   ///// ************************* Excel Save in DB *************************************//////
		    
			///// *************************** Data save ended ************************************ ////
		}catch(Exception e){
			System.out.println("SaveFileFormServlet Zz" + " \n");
			  PrintWriter out = response.getWriter();
			  out.println("Sorry, errors occured while uploading the file.");	// print directly to the web page.
			logger.log(Level.INFO,"Error Occured while uploading the file.",e);
			
		}
		
		finally{
			try{
				System.out.println("SaveFileFormServlet before close" + " \n");
				lConn.close();
			}catch (Exception e1){
				System.out.println("SaveFileFormServlet after close" + " \n");
				logger.log(Level.INFO,"Error Occured while closing the connection.",e1);
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
