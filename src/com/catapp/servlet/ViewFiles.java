package com.catapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.catapp.connection.DBConnection;

/**
 * Servlet implementation class ViewFiles
 */
@WebServlet(name = "ViewFilesServlet", urlPatterns = { "/ViewFilesServlet" })
public class ViewFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(ViewFiles.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFiles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String [] lSelectedCM 	= 	null;
		String lQueryfilter     =   null;
		Connection lConn 		=   null;
		PreparedStatement lPst	=	null;
		ResultSet lRst			=   null;
		ArrayList<HashMap<String,String>> pFileListXls = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> pFileListImg = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> pFileListFlat = new ArrayList<HashMap<String,String>>();
		
		try{
			lConn = new DBConnection().getConnection();
			if(request.getParameter("lCM")!=null){
				lSelectedCM= request.getParameter("lCM").toString().split(",");
				lQueryfilter = " and cell_line_id in (?) ";
			}
			
			String [] lAssayName  	= 	null;
			if(request.getParameter("lAN")!=null){
				lAssayName =	request.getParameter("lAN").toString().split(",");
				if(lQueryfilter.trim().length()>0) {
					lQueryfilter =lQueryfilter + " and assay_type in (?)";
				}else{
					lQueryfilter = " and assay_type in (?)";
				}
				
			}
			
			String [] lPhenoType    =   null;
			if(request.getParameter("lPT")!=null){
				lPhenoType =request.getParameter("lPT").toString().split(",");
				if(lQueryfilter.trim().length()>0) {
					lQueryfilter =lQueryfilter + " and phenotype_id in (?)";
				}else{
					lQueryfilter = " and phenotype_id in (?)";
				}
			}
			
			String [] lPlateDesign	=	null;
			if(request.getParameter("lPD")!=null){
				lPlateDesign= request.getParameter("lPD").toString().split(",");
				if(lQueryfilter.trim().length()>0) {
					lQueryfilter =lQueryfilter + " and plate_id in (?)";
				}else{
					lQueryfilter = " and plate_id in (?)";
				}
				
			}
			
			String lValueCM ="";
			String lValuePT	="";
			String lValueAs	="";
			String lValuePl	="";
			int lCount =0;
			if(lQueryfilter.indexOf("cell_line_id")!=-1){
				for(int i=0;i<lSelectedCM.length;i++){
					lValueCM=lValueCM+","+lSelectedCM[i];
				}
				lCount++;
			}
			if(lQueryfilter.indexOf("assay_type")!=-1){
				for(int i=0;i<lAssayName.length;i++){
					lValueAs=lValueAs+","+lAssayName[i];
				}
				lCount++;
			}
			if(lQueryfilter.indexOf("phenotype_id")!=-1){
				for(int i=0;i<lPhenoType.length;i++){
					lValuePT=lValuePT+","+lPhenoType[i];
				}
				lCount++;
			}
			
			if(lQueryfilter.indexOf("plate_id")!=-1){
				for(int i=0;i<lPlateDesign.length;i++){
					lValuePl=lValuePl+","+lPlateDesign[i];
				}
				lCount++;
			}
			StringBuilder lBuilder = new StringBuilder ("select * From file_info where rowstate!=-1 ");
				lPst = lConn.prepareStatement(lBuilder.toString()+lQueryfilter);
				for(int i=1; i<lCount;i++){
					if(i==1){
						lPst.setString(1, lValueCM);
					}else if (i==2){
						lPst.setString(2, lValueAs);
					}else if (i==3){
						lPst.setString(3, lValuePT);
					}else if (i==4){
						lPst.setString(4, lValuePl);
					}
				}
				
			lRst = lPst.executeQuery();
		
			
			while(lRst.next()){
				HashMap<String,String>lMap = new HashMap<String,String>();
				lMap.put(lRst.getString("file_name"), lRst.getString("file_path"));
				if(lRst.getString("file_type")!=null 
						&& lRst.getString("file_type").equals("xls") ){
					pFileListXls.add(lMap);
					
				}else if (lRst.getString("file_type")!=null 
						&& lRst.getString("file_type").equals("img")){
					pFileListImg.add(lMap);
				}else{
					pFileListFlat.add(lMap);
				}
			}
			request.setAttribute("xls", pFileListXls);
			request.setAttribute("img", pFileListImg);
			request.setAttribute("flat", pFileListFlat);
			
		} catch(Exception e){
			LOGGER.error("Error Occured while searching for files", e);
		}
	
		request.getRequestDispatcher("/WEB-INF/catAppDownloadPage.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
