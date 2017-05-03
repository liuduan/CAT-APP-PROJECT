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
import com.catapp.action.SaveExceltoDB;
import com.catapp.connection.DBConnection;
import com.catapp.entity.ChemFile;
import com.catapp.entity.User;

/**
 * Servlet implementation class SaveFileFormServlet
 */
@WebServlet("/SaveFileFormServlet")
public class SaveFileFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD


	private final String UPLOAD_DIRECTORY = "C:/Users/CATAPP/serverfiles";


=======
	private final String UPLOAD_DIRECTORY = "C:/Users/ssingh/serverfiles";
>>>>>>> SS-Master/master
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
		String lCellLine  = request.getParameter("celllines");
		String lPhenoType = request.getParameter("phenotypes");
		String lAssayData = request.getParameter("assaydata");
		String lTimePoint = request.getParameter("timepoint");
		String lPlate 	  = request.getParameter("form-Plate");
		Connection lConn  = null;
		String lFileName  = null;
		String lFileExtension = null;
		String lDescription = null;
		User lUser =(User)request.getSession().getAttribute("user");
		//String lPlateInfo = request.getParameter("form-Plate1");
		try{
			
			System.out.println("SaveFileFormServlet B \n");
			lConn = new DBConnection().getConnection();
			if(ServletFileUpload.isMultipartContent(request)){
				
				System.out.println("SaveFileFormServlet C \n");
				List<FileItem> multiparts = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
					logger.info("Inside For Loop");
					if(item.isFormField()){
						if(item.getFieldName().equals("celllines")){
							lCellLine=item.getString();
						}else if(item.getFieldName().equals("phenotypes")){
							lPhenoType=item.getString();
						}else if(item.getFieldName().equals("phenotypes")){
							lPhenoType=item.getString();
						}else if(item.getFieldName().equals("assaydata")){
							lAssayData=item.getString();
						}else if(item.getFieldName().equals("timepoint")){
							lTimePoint=item.getString();
						}else if(item.getFieldName().equals("form-Plate")){
							lPlate=item.getString();
						}else if(item.getFieldName().equals("desc")){
							lDescription=item.getString();
						}
						
					}
					if(!item.isFormField()){
						
						lFileName = new ChemData().getTagNamesofInputs("celllines",lConn).get(Long.valueOf(lCellLine))+"_"+
								new ChemData().getTagNamesofInputs("assaynames",lConn).get(Long.valueOf(lAssayData))+"_"+
								new ChemData().getTimePoints().get(Long.valueOf(lTimePoint))+"_"+
								new ChemData().getTagNamesofInputs("phenotypes",lConn).get(Long.valueOf(lPhenoType));
						
						boolean lExists =cmsCheckFileInDB(lFileName, lConn);
						if(lExists){
							RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?failure=2");
						    rd.forward(request, response);
						}
						String name = new File(item.getName()).getName();
						if(name!=null){
							if(name.indexOf(".")!=-1){
								lFileExtension =name.split("\\.")[1];
							}
						}
						String lUploadPath = UPLOAD_DIRECTORY+File.separator+
								new ChemData().getTagNames(Long.valueOf(lCellLine))+File.separator+lPlate;
						File lFile = new File(lUploadPath);
						if(!lFile.exists()){
							lFile.mkdirs();
						}
						
						item.write( new File(lUploadPath + File.separator + name));
						File lFile1 = new File(lUploadPath + File.separator + name);
						lFile1.renameTo(new File(lUploadPath + File.separator + lFileName+"."+lFileExtension));
					}
				}
				
				
			}		
			///// *************************** Data save started ************************************/////
			System.out.println("SaveFileFormServlet D \n");
			
			ChemFile lFile = new ChemFile();
			lFile.setCell_line_id(Long.valueOf(lCellLine));
			lFile.setPhenotype_id(Long.valueOf(lPhenoType));
			lFile.setAssay_type(Long.valueOf(lAssayData));
			lFile.setPlate_id(Long.valueOf(lPlate));
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
<<<<<<< HEAD

			System.out.println("SaveFileFormServlet E \n");
=======
			//lFile.getF
			
>>>>>>> SS-Master/master
			///// ************************* Excel Save in DB *************************************//////
			
			/*String lReturnResponse=new SaveExceltoDB().saveExcelDataToDb(lFile, lConn);
			if(lReturnResponse=="success"){
				
			}else{
<<<<<<< HEAD
				lConn.rollback();
			}*/
=======
				
			}
>>>>>>> SS-Master/master
			
		   ///// ************************* Excel Save in DB *************************************//////
			System.out.println("SaveFileFormServlet X" + " \n");
			

			if(lFile.getEntityId()!=null){
				HashMap<Long,String>lPhenoMap =  new ChemData().getNamesofInputs("phenotypes",lConn);
				HashMap<Long,String>lAssayMap =  new ChemData().getNamesofInputs("assaynames",lConn);
				HashMap<Long,String>lCellMap  =  new ChemData().getNamesofInputs("celllines",lConn);
				HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			    request.setAttribute("pheno", lPhenoMap);
			    request.setAttribute("assay", lAssayMap);
			    request.setAttribute("cell", lCellMap);
			    request.setAttribute("time", lTimMap);
			    
			    System.out.println("SaveFileFormServlet Y \n");
			    
			 	RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?success=1");
			    rd.forward(request, response);
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
			    
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?success=2");
			    rd.forward(request, response);
			}
			///// *************************** Data save ended ************************************////
		}catch(Exception e){
			logger.log(Level.INFO,"Error Occured while uploading the file.",e);
		}
		
		finally{
			try{
				
				lConn.close();
			}catch (Exception e1){
				logger.log(Level.INFO,"Error Occured while closing the connection.",e1);
			}
		}
		
	}

<<<<<<< HEAD
}
=======
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
}
>>>>>>> SS-Master/master
