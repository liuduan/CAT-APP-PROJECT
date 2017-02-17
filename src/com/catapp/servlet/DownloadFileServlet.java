package com.catapp.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;

/**
 * Servlet implementation class DownloadFileServlet
 */
@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String [] lFiles=request.getParameter("lSelectedBox").split(",");
		PreparedStatement lPstmt = null;
		ResultSet lRst = null;
		Connection lConn = null;
		
		try{
			if(lFiles.length>0){
				String lParameter = null;
				for(int i=0;i<lFiles.length;i++){
					if(lParameter==null){
						lParameter = Long.parseLong(lFiles[i])+"";
					}else{
						lParameter =lParameter+","+Long.parseLong(lFiles[i]);
					}
				}
				
				
				lConn=new DBConnection().getConnection();
				StringBuilder lBuild = new StringBuilder("select * From file_info where rowstate!=-1 and entity_id in (?) ");
				lPstmt = lConn.prepareStatement(lBuild.toString());
				lPstmt.setString(1, lParameter);
				
				lRst=lPstmt.executeQuery();
				String lFilePath = null;
				String lFileType = null;
				String lFileName = null;
				while(lRst.next()){
					lFilePath = "localhost:8080"+File.separator+"static"+
								File.separator+new ChemData().getTagNames(lRst.getLong("cell_line_id"))
								+File.separator+"1"+File.separator+lRst.getString("file_name");
					lFileType=lRst.getString("file_type");
				}
				
				 response.setContentType(lFileType);

		        
		         response.setHeader("Content-disposition","attachment; filename=yourcustomfilename.pdf");


		         File my_file = new File(lFilePath);
		         File my_file1 = new File("C://Users//ssingh//serverfiles//CM//1//2_CM_Ca2+_15 min_PF");
		         //my_file.exists()
		         my_file1.exists();
		   

		         // This should send the file to browser
		         OutputStream out = response.getOutputStream();
		         
		         FileInputStream in = new FileInputStream(my_file);
		         byte[] buffer = new byte[4096];
		         int length;
		         while ((length = in.read(buffer)) > 0){
		            out.write(buffer, 0, length);
		         }
		         in.close();
		         out.flush();
			}
					
		}
		catch(Exception e){	
			
		}finally{
			if(lConn!=null){
				try{
					lConn.close();
				}catch(Exception e){
					
				}
			}
			if(lPstmt!=null){
				try{
					lPstmt.close();
				}catch(Exception e){
					
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
