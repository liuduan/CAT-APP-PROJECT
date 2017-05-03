package com.catapp.action;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.util.CellReference;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.catapp.entity.ChemFile;


public class SaveExceltoDB {
	public static final Logger logger = Logger.getLogger(SaveExceltoDB.class.toString());
	
	public String saveExcelDataToDb (ChemFile pFile,Connection pConnection){
		String lReturnResponse	     =       "failure";
		String lInsertQuery		     =       null;
		PreparedStatement lPstmt     =       null;
		try{
			File lFile =new File(pFile.getFile_path()+File.separator+"CM"+File.separator+
					pFile.getPlate_id()+File.separator+pFile.getFile_name()+"."+pFile.getFile_type());
			
			FileInputStream fis = new FileInputStream(lFile);
			XSSFWorkbook myWorkBook = new XSSFWorkbook (fis);
			XSSFSheet mySheet = myWorkBook.getSheetAt(0);
			lInsertQuery= "INSERT INTO plate_chemical_denormalized_value_mapping (cellline_id, assay,"
					+ " timepoint,phenotype,plateconc,rowno,columnno,value,logged_date,logged_by,last_updated_date,"
					+ " last_updated_by,is_active,rowstate) "
		            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			lPstmt=pConnection.prepareStatement(lInsertQuery);
			int lLastRowNo=mySheet.getLastRowNum();
			for(int i=3;i<=lLastRowNo;i++){
				Row row =mySheet.getRow(i);
				for (int j=2;j<row.getLastCellNum();j++){
					Cell cell = row.getCell(j);
					if(cell!=null){
						lPstmt.setLong(1, pFile.getCell_line_id());
						lPstmt.setLong(2, pFile.getAssay_type());
						lPstmt.setLong(3, pFile.getTimepoint());
						lPstmt.setLong(4, pFile.getPhenotype_id());
						lPstmt.setLong(5, pFile.getPlate_id());
						lPstmt.setInt(6, i+1);
						int lColumnIndex= cell.getColumnIndex();
						lPstmt.setString(7, CellReference.convertNumToColString(lColumnIndex));
						lPstmt.setDouble(8, cell.getNumericCellValue());
						lPstmt.setTimestamp(9,new Timestamp(System.currentTimeMillis()));
						lPstmt.setLong(10, pFile.getLoggedBy());
						lPstmt.setNull(11, java.sql.Types.TIMESTAMP);
						lPstmt.setNull(12, java.sql.Types.BIGINT);
						lPstmt.setString(13, "Y");
						lPstmt.setInt(14, 1);
						lPstmt.addBatch();
					}
				}
			}
			int[] count = lPstmt.executeBatch();
			myWorkBook.close();
			
			if(count.length>0){
				lReturnResponse="success";
			}
			
		}catch(Exception e){
			logger.error("Error Occured while saving excel file to database.",e);
		}
		finally{
			try{
			
			}catch(Exception e1){
				logger.error("Error Occured while closing connection",e1);
			}
		}
		
		return lReturnResponse;
		
	}

}
