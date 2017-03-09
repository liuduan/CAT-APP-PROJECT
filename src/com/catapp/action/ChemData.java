package com.catapp.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.log4j.Logger;

public class ChemData {
	
	public static final Logger logger = Logger.getLogger(ChemData.class.toString());
	public HashMap<Long,String> getNamesofInputs(String pTableName,Connection pConnection){
		
		HashMap<Long,String> lPhenotypeMap =new HashMap<Long,String>();
		PreparedStatement lPstmt = null;
		ResultSet lRst 			 = null;
		try{
			
			String lBuilder = "select entity_id,name,dsc from xxx where rowstate!=-1 ";
			lBuilder =lBuilder.replaceAll("xxx", pTableName);
			lPstmt =pConnection.prepareStatement(lBuilder);
			lRst = lPstmt.executeQuery();
			while(lRst.next()){
				if(lRst.getLong(1)>=7){
					lPhenotypeMap.put(lRst.getLong(1), lRst.getString(2)+" "+lRst.getString(3));
				}else{
					lPhenotypeMap.put(lRst.getLong(1), lRst.getString(2));
					
				}
			}
			
		}catch(Exception e){
			logger.error("Error Occured while getting the cellline names",e);
		}
		
		return lPhenotypeMap;
	}
	
	public HashMap<Long,String> getTagNamesofInputs(String pTableName,Connection pConnection){
		
		HashMap<Long,String> lPhenotypeMap =new HashMap<Long,String>();
		PreparedStatement lPstmt = null;
		ResultSet lRst 			 = null;
		try{
			
			String lBuilder = "select entity_id,tag from xxx where rowstate!=-1 ";
			lBuilder =lBuilder.replaceAll("xxx", pTableName);
			lPstmt =pConnection.prepareStatement(lBuilder);
			lRst = lPstmt.executeQuery();
			while(lRst.next()){
				lPhenotypeMap.put(lRst.getLong(1), lRst.getString(2));
			}
			
		}catch(Exception e){
			logger.error("Error Occured while getting the cellline names",e);
		}
		
		return lPhenotypeMap;
	}
	
	public HashMap<Long,String> getAssayNames(){
		HashMap<Long,String> lAssayMap =new HashMap<Long,String>();
		lAssayMap.put(1l, "Ca2+");
		lAssayMap.put(2l, "Hoechst");
		lAssayMap.put(3l, "MitoTracker");
	
		return lAssayMap;
	}
	
	public HashMap<Long,String> getTimePoints(){
		HashMap<Long,String> lTPMap =new HashMap<Long,String>();
		lTPMap.put(1l, "15 min");
		lTPMap.put(2l, "30 min");
		lTPMap.put(3l, "60 min");
		lTPMap.put(4l, "90 min");
	
		return lTPMap;
	}
	
	public HashMap<Long,String> getCellLines(){
		HashMap<Long,String> lTPMap =new HashMap<Long,String>();
		lTPMap.put(1l, "iCell Hepatocytes 2.0");
		lTPMap.put(2l, "iCell Cardiomyocytes");
		lTPMap.put(3l, "iCell endothelial cells");
		lTPMap.put(4l, "iCell neurons");
		lTPMap.put(5l, "iCell macrophages prototype");
	
		return lTPMap;
	}
	public String getTagNames(Long pCellLine){
		String lReturnTag = null;
		HashMap<Long,String>lTMap = new HashMap<Long,String>();
		lTMap.put(2l, "CM");
		lTMap.put(3l, "HP");
		lReturnTag=lTMap.get(pCellLine);
		
	
		return lReturnTag;
	}
	/*public String getFileExtensions(String pType){
		String lReturnExten = null;
		
		switch(pType) {
		
		case "xls":
			lReturnExten =".xls";
		}
		
	
		return lReturnExten;
	}*/

	public String generateQForparameter(int size){
		
		String lReturnString =null;
		for(int i=0;i<size;i++){
			if(i==0){
				lReturnString="?";
			}
			else{
				lReturnString=lReturnString+",?";
			}
		}
		return lReturnString;
	}

}
