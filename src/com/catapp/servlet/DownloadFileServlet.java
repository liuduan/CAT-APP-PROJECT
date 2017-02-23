package com.catapp.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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
		String [] lFiles					= request.getParameterValues("optradio");
		PreparedStatement lPstmt 			= null;
		ResultSet lRst					    = null;
		Connection lConn 					= null;
		File lLocalFile 					= new File("C:\\Users\\ssingh\\serverfiles\\");
		String lFolderLoc 					= null;
		if(lLocalFile.exists()){
			lFolderLoc ="C:\\Users\\ssingh\\serverfiles\\";
		}else{
			// Write code as per the server //
		}
		try{
			if(lFiles.length>0){
				
				ArrayList<Long>lParameter = new ArrayList<Long>() ;
				for(int i=0;i<lFiles.length;i++){
						lParameter.add(Long.parseLong(lFiles[i]));
					
				}
				
				
				lConn=new DBConnection().getConnection();
				StringBuilder lBuild = new StringBuilder("select * From file_info where rowstate!=-1 and entity_id in (");
									   lBuild.append(new ChemData().generateQForparameter(lParameter.size()));
									   lBuild.append(")");
									   
				lPstmt = lConn.prepareStatement(lBuild.toString());
				
				for(int i=0;i<lParameter.size();i++){
					
					lPstmt.setLong(i+1, lParameter.get(i));
					
				}
				
				lRst=lPstmt.executeQuery();
				ArrayList<String>lFileFromServer = new ArrayList<String>();
				String lFileName ="";
				String lFileType ="";
				while(lRst.next()){
					 lFileName = lRst.getString("file_name");
					//lFileName ="test";
					lFileType = lRst.getString("file_type");
					String lCellLine = new ChemData().getTagNames(lRst.getLong("cell_line_id"));
					String lPlate =lRst.getString("plate_id");
					lFileFromServer.add(lFolderLoc+lCellLine+"\\"+lPlate+"\\"+lFileName+"."+lFileType);
				}
				
				if(lFileFromServer.size()>0 && lFileFromServer.size()==1){
					
					 response.setHeader("Content-disposition","attachment; filename="+ lFileName+"."+lFileType);
					 response.setContentType(lFileType);
				    
				         OutputStream out = response.getOutputStream();
				         File lMyFile = new File(lFileFromServer.get(0));
				        // FileReader lReader = new FileReader(lMyFile);
				         FileInputStream in = new FileInputStream(lMyFile);
				         byte[] buffer = new byte[4096];
				         int length;
				         while ((length = in.read(buffer)) > 0){
				            out.write(buffer, 0, length);
				         }
				         in.close();
				         out.flush();
					 
					
				}else{
					 ArrayList<File>files = new ArrayList<File>();
					for(int i=0;i<lFileFromServer.size();i++){
						File lTemp = new File(lFileFromServer.get(i));
						
						files.add(lTemp);
					}
					response.setContentType("Content-type: text/zip");
					response.setHeader("Content-Disposition",
							"attachment; filename=mytest.zip");

					

					OutputStream out = response.getOutputStream();
					ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(out));

					for (File file : files) {
						FileInputStream fis = null;
						try {
							fis = new FileInputStream(file);

						} catch (FileNotFoundException fnfe) {
							zos.write(("ERRORld not find file " + file.getName())
									.getBytes());
							zos.closeEntry();
							System.out.println("Couldfind file "
									+ file.getAbsolutePath());
							continue;
						}

						BufferedInputStream fif = new BufferedInputStream(fis);
						zos.putNextEntry(new ZipEntry(file.getName()));

						int data = 0;
						while ((data = fif.read()) != -1) {
							zos.write(data);
						}
						fif.close();

						zos.closeEntry();
						System.out.println("Finishedng file " + file.getName());
					}
					zos.close();
				}
		
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
