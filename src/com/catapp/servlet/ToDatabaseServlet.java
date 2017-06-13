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
import com.catapp.action.shellCommands;
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
		System.out.println("ToDatabaseServlet A \n");
		logger.info("File Save Started");
		

		String original_name = "";
		String lFileExtension = "";
		String lFileName  = "";
		String lUploadPath = "";
		Connection lConn  = null;

		
		try{
			
			System.out.println("ToDatabaseServlet B \n");
			
			lConn = new DBConnection().getConnection();
			if(ServletFileUpload.isMultipartContent(request)){		
				
				System.out.println("ToDatabaseServlet C \n");
				List<FileItem> multiparts = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
					logger.info("Inside For Loop");
					
					if(!item.isFormField()){

						original_name = new File(item.getName()).getName();		// file name
						if(original_name!=null){
							if(original_name.indexOf(".")!=-1){
								lFileExtension =original_name.split("\\.")[1];			// file extension
							}
						}
						
						lUploadPath = "C:\\Users\\CATAPP\\serverfiles\\CM\\1\\CM\\Data-test.csv";	
						
						System.out.println("ToDatabaseServlet C2 lUploadPath: " + lUploadPath);

						lFileName = original_name;
						
						// write file here.
						item.write( new File(lUploadPath));
						// File lFile1 = new File(lUploadPath + File.separator + original_name);

						System.out.println("ToDatabaseServlet replaced name: " + lFileName);

						// rename is here.
						// lFile1.renameTo(new File(lUploadPath + File.separator + lFileName+"."+lFileExtension));
						System.out.println("ToDatabaseServlet C4");
						
					///// ************************* Save in DB *************************************//////
						
						   ///// ************************* Excel Save in DB *************************************//////
						    
							
						
						
						String R_command = "cmd.exe /c C:\\\"Program Files\"\\R\\R-3.3.3\\bin\\Rscript " + 
							"C:\\4_R\\R-from-Fabian\\MySQL-test.R";
							// + "C:\\4_R\\R-from-Fabian\\" + original_name;
						
						
						
						
						
						System.out.println(R_command); 
						
						// R_command = "cmd.exe /c dir";
						// R_command = "cmd.exe /c C:\\\"Program Files\"\\R\\R-3.3.3\\bin\\Rscript ";
						
						shellCommands obj = new shellCommands();
						System.out.println("ToDatabaseServlet C5");
						String output = ""; 
						obj.executeCommand(R_command);
						System.out.println("ToDatabaseServlet C6");
						
						System.out.println("output: " + output); 
						
					///// *************************** Data save ended ************************************ ////

				
	
					}
				}
				
			}		

			
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Upload?success=1");
		    rd.forward(request, response);
			
			

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
