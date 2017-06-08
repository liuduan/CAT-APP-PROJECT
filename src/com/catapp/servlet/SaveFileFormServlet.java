package com.catapp.servlet;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.catapp.action.ChemData;
import com.catapp.connection.DBConnection;
import com.catapp.entity.ChemFile;
import com.catapp.entity.User;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class SaveFileFormServlet
 */
@WebServlet("/SaveFileFormServlet")
public class SaveFileFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private final String UPLOAD_DIRECTORY = "C:/Users/CATAPP/serverfiles";

	public static final Logger logger = Logger.getLogger(SaveFileFormServlet.class.toString());

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveFileFormServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		System.out.println("SaveFileFormServlet A \n");
		
		logger.info("File Save Started");
		
		String lCellLine  = request.getParameter("cellline");		// not getting data.
		String lAssay = request.getParameter("assay");
		String lPhenoType = request.getParameter("phenotype");
		String lTimePoint = request.getParameter("timepoint");
		String lDilution  = request.getParameter("dilution");
		String lDescription = null;
		String original_name = "";
		String lFileExtension = null;
		String lFileName  = null;
		String lUploadPath = "C:/Users/CATAPP/serverfiles/CM/1";
		Connection lConn  = null;
		User lUser =(User)request.getSession().getAttribute("user");
		//String lDilutionInfo = request.getParameter("form-Plate1");
		try{
			
			System.out.println("SaveFileFormServlet B \n");
			
			lConn = new DBConnection().getConnection();
			if(ServletFileUpload.isMultipartContent(request)){		
				
				System.out.println("SaveFileFormServlet C \n");
				List<FileItem> multiparts = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
					logger.info("Inside For Loop");
					if(item.isFormField()){
						if(item.getFieldName().equals("cellline")){
							lCellLine=item.getString();
							System.out.println("Cell Line 3: " + lCellLine);
						}else if(item.getFieldName().equals("assay")){
							lAssay=item.getString();
							System.out.println("assay: " + lAssay);
						}else if(item.getFieldName().equals("phenotype")){
							lPhenoType=item.getString();
							System.out.println("PhenoType: " + lPhenoType);
						}else if(item.getFieldName().equals("timepoint")){
							lTimePoint=item.getString();
							System.out.println("TimePoint: " + lTimePoint);
						}else if(item.getFieldName().equals("dilution")){
							lDilution=item.getString();
							System.out.println("Dilution: " + lDilution);
						}else if(item.getFieldName().equals("desc")){
							lDescription=item.getString();
							System.out.println("Description: " + lDescription);
						}
						
					}
					
					
					//====================================================
					
					if(!item.isFormField()){
						/*
						lFileName = new ChemData().getTagNamesofInputs("celllines",lConn).get(Long.valueOf(lCellLine))+"_"+
								new ChemData().getTagNamesofInputs("assaynames",lConn).get(Long.valueOf(lAssay))+"_"+
								new ChemData().getTimePoints().get(Long.valueOf(lTimePoint))+"_"+
								new ChemData().getTagNamesofInputs("phenotypes",lConn).get(Long.valueOf(lPhenoType));
						
						boolean lExists =cmsCheckFileInDB(lFileName, lConn);
						if(lExists){
							System.out.println("SaveFileFormServlet C \n");
							//RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?failure=2");
						    //rd.forward(request, response);
						}
						
						
						//
						// String name = "";
						
						String lUploadPath = UPLOAD_DIRECTORY+File.separator+
								new ChemData().getTagNames(Long.valueOf(lCellLine))+File.separator+lDilution;
						File lFile = new File(lUploadPath);
						
						// if(!lFile.exists()){
						// 	lFile.mkdirs();
						// }
						*/
						
						original_name = new File(item.getName()).getName();		// file name
						if(original_name!=null){
							if(original_name.indexOf(".")!=-1){
								lFileExtension =original_name.split("\\.")[1];			// file extension
							}
						}
						
						
						lUploadPath = "C:/Users/CATAPP/serverfiles/" + lCellLine + "/1";	
							// works only for CM, cardiomyocyte (2017-6-8) 
						
						
						System.out.println("SaveFileFormServlet C2 lUploadPath: " + lUploadPath + ", " + original_name);
						System.out.println("SaveFileFormServlet C2 name: " + original_name);
						System.out.println("SaveFileFormServlet C2 extension: " + lFileExtension);
						System.out.println("File.separator: " + File.separator);
						
						
						lFileName = lCellLine + "_" + lAssay + "_" + lPhenoType + "_" + 
								lTimePoint + "_" + lDilution + "." + lFileExtension;
						
						// write file here.
						item.write( new File(lUploadPath + File.separator + lFileName));
						File lFile1 = new File(lUploadPath + File.separator + original_name);
						
						System.out.println("SaveFileFormServlet C3");
						System.out.println("SaveFileFormServlet replaced name: " + lFileName+"."+lFileExtension);

						// rename is here.
						lFile1.renameTo(new File(lUploadPath + File.separator + lFileName+"."+lFileExtension));
						System.out.println("SaveFileFormServlet C4");
						
						
						
						
					}
				}
				
				
			}		
			
		///// *************************** save file info ************************************/////
			// Save_file_info2DB(String pFileName,Connection pConnection);
			String insert_record_str = "INSERT INTO file_info (cell_line_id, assay_type, phenotype_id, " +
					"timepoint, Dilution, description, Original_name, file_name, file_type, file_path) " + 
					"VALUES ('" + lCellLine + "', '" + lAssay + "', '" + lPhenoType + "', '" + 
					lTimePoint + "', '" + lDilution + "', '" + lDescription  + "', '" + original_name + 
					"', '" + lFileName + "', '" + lFileExtension + "', '" + lUploadPath + "')";
			Save_file_info2DB(insert_record_str, lConn);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Upload?success=1");
		    rd.forward(request, response);
			
			///// *************************** Data save started ************************************/////
		    /*
			System.out.println("SaveFileFormServlet D \n");
			
			ChemFile lFile = new ChemFile();
			lFile.setCell_line_id(Long.valueOf(lCellLine));
			lFile.setPhenotype_id(Long.valueOf(lPhenoType));
			lFile.setAssay_type(Long.valueOf(lAssay));
			lFile.setPlate_id(Long.valueOf(lDilution));
			System.out.println("SaveFileFormServlet D2 Time Point: " + lTimePoint);
			lFile.setTimepoint(Integer.valueOf(lTimePoint));
			lFile.setFile_name(lFileName);
			lFile.setFile_path(UPLOAD_DIRECTORY);
			if(lDescription!=null){
				lFile.setDescription(lDescription);
			}
			if(lFileExtension!=null){
				lFile.setFile_type(lFileExtension);
			}
			//User lUser =new User();
			//lUser.setEntityId(1l);
			lFile.save(lConn, lUser);


			System.out.println("SaveFileFormServlet E \n");
			*/
			///// ************************* Excel Save in DB *************************************//////
			
			/*String lReturnResponse=new SaveExceltoDB().saveExcelDataToDb(lFile, lConn);
			if(lReturnResponse=="success"){
				
			}else{

				lConn.rollback();
			}*/

			
		   ///// ************************* Excel Save in DB *************************************//////
		    /*
			System.out.println("SaveFileFormServlet X" + " \n");
			

			if(lFile.getEntityId()!=null){
				HashMap<Long,String>lPhenoMap =  new ChemData().getNamesofInputs("phenotype",lConn);
				HashMap<Long,String>lAssayMap =  new ChemData().getNamesofInputs("assaynames",lConn);
				HashMap<Long,String>lCellMap  =  new ChemData().getNamesofInputs("celllines",lConn);
				HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			    request.setAttribute("pheno", lPhenoMap);
			    request.setAttribute("assay", lAssayMap);
			    request.setAttribute("cell", lCellMap);
			    request.setAttribute("time", lTimMap);
			    
			    System.out.println("SaveFileFormServlet Y \n");
			    
			    // getServletContext().getRequestDispatcher("/WEB-INF/Admin.jsp").forward(request, response);
			 	rd = getServletContext().getRequestDispatcher("/Upload?success=1");
			    rd.forward(request, response);
			    // return;
			}else{
				HashMap<Long,String>lPhenoMap =  new ChemData().getNamesofInputs("phenotypes",lConn);
				HashMap<Long,String>lAssayMap =  new ChemData().getNamesofInputs("assaynames",lConn);
				HashMap<Long,String>lCellMap  =  new ChemData().getNamesofInputs("celllines",lConn);
				HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			    request.setAttribute("pheno", lPhenoMap);
			    request.setAttribute("assay", lAssayMap);
			    request.setAttribute("cell", lCellMap);
			    request.setAttribute("time", lTimMap);
			    
			    System.out.println("SaveFileFormServlet Z" + " \n");
			    
				rd = getServletContext().getRequestDispatcher("/Upload?success=2");
				// RequestDispatcher rd = getServletContext().getRequestDispatcher("/Upload");
			    rd.forward(request, response);
			}
			*/
			///// *************************** Data save ended ************************************ ////
		}catch(Exception e){
			System.out.println("SaveFileFormServlet Zz" + " \n");
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

	public boolean cmsCheckFileInDB(String pFileName,Connection pConnection){
		boolean lExistsFlag      = false;
		PreparedStatement lPstmt = null;
		ResultSet lRst 			 = null;
		try{
			String lQuery= "select * From file_info where file_name=? and rowstate!=-1";
			
			lPstmt=pConnection.prepareStatement(lQuery);
			lPstmt.setString(1, pFileName);
			
			lRst= lPstmt.executeQuery();
			while(lRst.next()){
				lExistsFlag=true;
			}
			
		}catch(Exception e){
			logger.log(Level.INFO, "validation error", e);
		}
		
		return lExistsFlag;
	}
	
	public boolean Save_file_info2DB(String insert_record_str, Connection pConnection){
		boolean lExistsFlag      = false;
		ResultSet lRst 			 = null;
		
		System.out.println("SaveFileFormServlet before D");
		try{
						
			java.sql.Statement statement = pConnection.createStatement();
			statement.executeUpdate(insert_record_str);
	
		}catch(Exception e){
			logger.log(Level.INFO, "validation error", e);
		}
		
		return lExistsFlag;
	}
}

