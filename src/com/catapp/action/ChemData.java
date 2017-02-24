package com.catapp.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import org.apache.log4j.Logger;

public class ChemData {
	
	public static final Logger logger = Logger.getLogger(ChemData.class.toString());
	public HashMap<Long,String> getPhenoTypes(){
		HashMap<Long,String> lPhenotypeMap =new HashMap<Long,String>();
		lPhenotypeMap.put(1l, "PF");
		lPhenotypeMap.put(2l, "PW");
		lPhenotypeMap.put(3l, "PW10");
		lPhenotypeMap.put(4l, "PA");
		lPhenotypeMap.put(5l, "PS");
		lPhenotypeMap.put(6l, "PRT");
		lPhenotypeMap.put(7l, "PDT");
		lPhenotypeMap.put(8l, "TC");
		lPhenotypeMap.put(9l, "posMT");
		lPhenotypeMap.put(10l, "MT_MSA");
		lPhenotypeMap.put(11l, "MT_ACMA");
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