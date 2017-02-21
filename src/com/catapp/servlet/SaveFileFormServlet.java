package com.catapp.servlet;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

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

/**
 * Servlet implementation class SaveFileFormServlet
 */
@WebServlet("/SaveFileFormServlet")
public class SaveFileFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:\\7-5-Database_project-data\\Semi-Temp-Storage-2017";
       
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String lCellLine  = request.getParameter("celllines");
		String lPhenoType = request.getParameter("phenotypes");
		String lAssayData = request.getParameter("assaydata");
		String lTimePoint = request.getParameter("timepoint");
		String lPlate 	  = request.getParameter("form-Plate");
		Connection lConn  = null;
		String lFileName  = null;
		String lFileExtension = null;
		User lUser =(User)request.getSession().getAttribute("user");
		//String lPlateInfo = request.getParameter("form-Plate1");
		try{
			
			if(ServletFileUpload.isMultipartContent(request)){
				
				List<FileItem> multiparts = new ServletFileUpload( new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts){
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
						}
						
					}
					if(!item.isFormField()){
						
						lFileName = Long.valueOf(lCellLine)+"_"+new ChemData().getTagNames(Long.valueOf(lCellLine))+"_"+
								new ChemData().getAssayNames().get(Long.valueOf(lAssayData))+"_"+
								new ChemData().getTimePoints().get(Long.valueOf(lTimePoint))+"_"+
								new ChemData().getPhenoTypes().get(Long.valueOf(lPhenoType));
						//File lUploadedFile =new File(item.getName()); 
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
			ChemFile lFile = new ChemFile();
			lFile.setCell_line_id(Long.valueOf(lCellLine));
			lFile.setPhenotype_id(Long.valueOf(lPhenoType));
			lFile.setAssay_type(Long.valueOf(lAssayData));
			lFile.setFile_name(lFileName);
			lFile.setFile_path(UPLOAD_DIRECTORY);
			if(lFileExtension!=null){
				lFile.setFile_type(lFileExtension);
			}
			//User lUser =new User();
			//lUser.setEntityId(1l);
			lConn = new DBConnection().getConnection();
			lFile.save(lConn, lUser);
			if(lFile.getEntityId()!=null){
				HashMap<Long,String>lPhenoMap =  new ChemData().getPhenoTypes();
			    HashMap<Long,String>lAssayMap =  new ChemData().getAssayNames();
			    HashMap<Long,String>lCellMap  =  new ChemData().getCellLines();
			    HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			    request.setAttribute("pheno", lPhenoMap);
			    request.setAttribute("assay", lAssayMap);
			    request.setAttribute("cell", lCellMap);
			    request.setAttribute("time", lTimMap);
			 	RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?success=1");
			    rd.forward(request, response);
			}else{
				HashMap<Long,String>lPhenoMap =  new ChemData().getPhenoTypes();
			    HashMap<Long,String>lAssayMap =  new ChemData().getAssayNames();
			    HashMap<Long,String>lCellMap  =  new ChemData().getCellLines();
			    HashMap<Long,String>lTimMap   =  new ChemData().getTimePoints();
			    request.setAttribute("pheno", lPhenoMap);
			    request.setAttribute("assay", lAssayMap);
			    request.setAttribute("cell", lCellMap);
			    request.setAttribute("time", lTimMap);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Upload.jsp?success=2");
			    rd.forward(request, response);
			}
			///// *************************** Data save ended ************************************////
		}catch(Exception e){
			
		}
		
		finally{
			try{
				
				lConn.close();
			}catch (Exception e){
				
			}
		}
		
		/*PrintWriter out = response.getWriter();
		out.println(lCellLine+","+lPhenoType+","+lAssayData+","+lTimePoint+","+lPlateInfo);*/
	}

}
