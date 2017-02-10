package com.catapp.action;

import java.util.HashMap;

public class ChemData {
	
	
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
	

}
