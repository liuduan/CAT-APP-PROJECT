package com.catapp.servlet;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

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
	private final String UPLOAD_DIRECTORY = "C:/Users/ssingh/serverfiles";
       
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
		String lCellLine = 	request.getParameter("celllines");
		String lPhenoType = request.getParameter("phenotypes");
		String lAssayData = request.getParameter("assaydata");
		String lTimePoint = request.getParameter("timepoint");
		Connection lConn  = null;
		String lFileName  = null;
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
						}
						
					}
					if(!item.isFormField()){
						lFileName = Long.valueOf(lCellLine)+"_CM_"+
								new ChemData().getAssayNames().get(Long.valueOf(lAssayData))+"_"+
								new ChemData().getTimePoints().get(Long.valueOf(lTimePoint))+"_"+
								new ChemData().getPhenoTypes().get(Long.valueOf(lPhenoType));
						//File lUploadedFile =new File(item.getName()); 
						String name = new File(item.getName()).getName();

						item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
					}
				}
				
				
			}		
			
			ChemFile lFile = new ChemFile();
			lFile.setCell_line_id(Long.valueOf(lCellLine));
			lFile.setPhenotype_id(Long.valueOf(lPhenoType));
			lFile.setAssay_type(Long.valueOf(lAssayData));
			lFile.setFile_name(lFileName);
			lFile.setFile_path(UPLOAD_DIRECTORY);
			lFile.setFile_type("xls");
			User lUser =new User();
			lUser.setEntityId(1l);
			lConn = new DBConnection().getConnection();
			lFile.save(lConn, lUser);
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
