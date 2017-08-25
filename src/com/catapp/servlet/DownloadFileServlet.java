package com.catapp.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;

import java.io.ByteArrayOutputStream;

import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.Iterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;


/**
 * Servlet implementation class DownloadFileServlet
 */
@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {

	public static final Logger logger = Logger.getLogger(DownloadFileServlet.class.toString());

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
		

		System.out.println("DownloadFileServlet A, lFiles: " + lFiles[0]);
		
		String lButtonClick					= null;
		if(request.getParameterValues("download")!=null){
			lButtonClick="Download";
		}else{
			lButtonClick="JSON";
		}
		
		PreparedStatement lPstmt 			= null;
		ResultSet lRst					    = null;
		Connection lConn 					= null;
		File lLocalFile 					= new File("C:\\Users\\CATAPP\\serverfiles\\CM\\1");
		String lFolderLoc 					= null;
		String file_name 					= "";
		if(lLocalFile.exists()){
			lFolderLoc ="C:\\Users\\CATAPP\\serverfiles\\CM\\1";

		}else{
			// Write code as per the server //
		}
		try{
			if(lFiles.length>0){
				

				System.out.println("DownloadFileServlet B, how many files: " + lFiles.length);
				
				ArrayList<Long>lParameter = new ArrayList<Long>() ;
				for(int i=0;i<lFiles.length;i++){
					lParameter.add(Long.parseLong(lFiles[i]));
					System.out.println("DownloadFileServlet C, entity_id: " + lFiles[i]);
				}
				
				
				lConn=new DBConnection().getConnection();
				String to_be_file_id = new ChemData().generateQForparameter(lParameter.size());
				StringBuilder lBuild = new StringBuilder("select * From file_info where entity_id in (");
									   lBuild.append(to_be_file_id);
									   lBuild.append(")");
									   
				System.out.println("DownloadFileServlet D, in the query, to_be_file_id: " + to_be_file_id);
									   

				lPstmt = lConn.prepareStatement(lBuild.toString());
				
				for(int i=0;i<lParameter.size();i++){
					
					lPstmt.setLong(i+1, lParameter.get(i));
					

					System.out.println("DownloadFileServlet E, entity_id: " + lParameter.get(i));
					

				}
				
				lRst=lPstmt.executeQuery();
				ArrayList<String>lFileFromServer = new ArrayList<String>();
				String lFileName ="";
				String lFileType ="";
				while(lRst.next()){

					lFileName = lRst.getString("file_name");
					System.out.println("DownloadFileServlet F, File Name: " + lFileName);
					//lFileName ="test";
					lFileType = lRst.getString("file_type");
					
					System.out.println("DownloadFileServlet G, File type: " + lFileType);
					
					// String lCellLine = new ChemData().getTagNames(lRst.getLong("cell_line_id"));
					String lCellLine = lRst.getString("cell_line_id");
					// String lPlate =lRst.getString("plate_id");
					// String lPlate = "";
					
					String[] parts = lFileName.split("\\.");
					file_name  = parts[0]; // 004
					
					System.out.println("DownloadFileServlet G2, file_name: " + file_name);

					lFileFromServer.add(lFolderLoc + "\\" + lCellLine + "\\" + file_name + "." +lFileType);
					
					System.out.println("DownloadFileServlet H, File: " + 
							lFolderLoc + "\\" + lCellLine + "\\" + file_name + "." +lFileType);

				}
				
				if(lFileFromServer.size()>0 && lFileFromServer.size()==1){
					
					if(lButtonClick!=null && lButtonClick=="Download"){

						response.setHeader("Content-disposition","attachment; filename="+ file_name+"."+lFileType);
						response.setContentType(lFileType);
						
						OutputStream out = response.getOutputStream();			// This line send file.

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
						

					}else{				// clicked Json
						if(lFileType.equals("xls") ||  lFileType.equals("xlsx")){
							
							System.out.println("Json A, file type: " + lFileType);
							
							// File lMyFile2 = new File(lFileFromServer.get(0));						// added
							// FileInputStream in = new FileInputStream(lMyFile2);						// added
							
							FileInputStream inp = new FileInputStream( lFileFromServer.get(0) );	// previous
							// inp = new FileInputStream(lMyFile2);										// added

							Workbook workbook =WorkbookFactory.create(inp);

							// Get the first Sheet.
							Sheet sheet = workbook.getSheetAt( 0 );

							JSONObject json = new JSONObject();

						    // Iterate through the rows.
						    JSONArray rows = new JSONArray();
						    for ( Iterator<Row> rowsIT = sheet.rowIterator(); rowsIT.hasNext(); )
						    {
						        Row row = rowsIT.next();
						        JSONObject jRow = new JSONObject();

						        // Iterate through the cells.
						        JSONArray cells = new JSONArray();
						        for ( Iterator<Cell> cellsIT = row.cellIterator(); cellsIT.hasNext(); )
						        {
						            Cell cell = cellsIT.next();
						            cells.add( cell.getStringCellValue() );
						        }
						        jRow.put( "cell", cells );
						        rows.add( jRow );
						    }

						    // Create the JSON.
						    json.put( "rows", rows );
							    workbook.close();

							// Get the JSON text.
							    
							    response.setHeader("Content-disposition","attachment; filename="+ lFileName+".json");
								response.setContentType(lFileType);

								File lJsonFile =new File ("C:/Users/CATAPP/serverfiles/CM/1/NewJson.txt");
								lJsonFile.createNewFile();
								FileWriter lWriter = new FileWriter("C:/Users/CATAPP/serverfiles/CM/1/NewJson.txt");
								lWriter.write(json.toJSONString());
								lWriter.close();
								
								OutputStream out = response.getOutputStream();
								
								System.out.println("Json B,");
								
								FileInputStream in = new FileInputStream("C:/Users/CATAPP/serverfiles/CM/1/NewJson.txt");
								int i=in.read();  
								System.out.println("Json C, read lenth: " + i);
					            System.out.println("Json D: first char: " + (char)i);    
																
								byte[] buffer = new byte[4096];
								int length;
								while ((length = in.read(buffer)) > 0){
									System.out.println("Json E, file length: " + length);

									out.write(buffer, 0, length);
								}
								in.close();
								out.flush();

								
								File lToDelete = new File("C:/Users/CATAPP/serverfiles/CM/1/NewJson.txt");

								lToDelete.delete();
								
						}
					}
					 
					
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

			logger.error("Error Occured While downloading existing file------>downloadfileforservlet.",e);

			
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

