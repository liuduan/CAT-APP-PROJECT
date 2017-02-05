package com.catapp.action;

import java.util.HashMap;

public class ChemData {
	
	
	public HashMap<Integer,String> getPhenoTypes(){
		HashMap<Integer,String> lPhenotypeMap =new HashMap<Integer,String>();
		lPhenotypeMap.put(1, "PF");
		lPhenotypeMap.put(2, "PW");
		lPhenotypeMap.put(3, "PW10");
		lPhenotypeMap.put(4, "PA");
		lPhenotypeMap.put(5, "PS");
		lPhenotypeMap.put(6, "PRT");
		lPhenotypeMap.put(7, "PDT");
		lPhenotypeMap.put(8, "TC");
		lPhenotypeMap.put(9, "posMT");
		lPhenotypeMap.put(10, "MT_MSA");
		lPhenotypeMap.put(11, "MT_ACMA");
		return lPhenotypeMap;
	}
	
	public HashMap<Integer,String> getAssayNames(){
		HashMap<Integer,String> lAssayMap =new HashMap<Integer,String>();
		lAssayMap.put(1, "Ca2+");
		lAssayMap.put(2, "Hoechst");
		lAssayMap.put(3, "MitoTracker");
	
		return lAssayMap;
	}
	
	public HashMap<Integer,String> getTimePoints(){
		HashMap<Integer,String> lTPMap =new HashMap<Integer,String>();
		lTPMap.put(1, "15 min");
		lTPMap.put(2, "30 min");
		lTPMap.put(3, "60 min");
		lTPMap.put(4, "90 min");
	
		return lTPMap;
	}
	
	public HashMap<Integer,String> getCellLines(){
		HashMap<Integer,String> lTPMap =new HashMap<Integer,String>();
		lTPMap.put(1, "iCell Hepatocytes 2.0");
		lTPMap.put(2, "iCell Cardiomyocytes");
		lTPMap.put(3, "iCell endothelial cells");
		lTPMap.put(4, "iCell neurons");
		lTPMap.put(5, "iCell macrophages prototype");
	
		return lTPMap;
	}
	

}
