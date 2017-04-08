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
			File lFile =new File(pFile.getFile_path()+File.separator+
					pFile.getPlate_id()+File.separator+pFile.getFile_name()+"."+pFile.getFile_type());
			
			FileInputStream fis = new FileInputStream(lFile);
			XSSFWorkbook myWorkBook = new XSSFWorkbook (fis);
			XSSFSheet mySheet = myWorkBook.getSheetAt(0);
			lInsertQuery= "INSERT INTO file_data_mapping (file_record_id, rowno,"
					+ " columnno,value,logged_date,logged_by,last_updated_date,"
					+ " last_updated_by,is_active,rowstate) "
		            + " VALUES(?,?,?,?,?,?,?,?,?)";
			int lLastRowNo=mySheet.getLastRowNum();
			for(int i=4;i<=lLastRowNo;i++){
				Row row =mySheet.getRow(i);
				for (int j=1;j<row.getLastCellNum();j++){
					Cell cell = row.getCell(j);
					if(cell!=null){
						lPstmt=pConnection.prepareStatement(lInsertQuery);
						lPstmt.setLong(1, pFile.getEntityId());
						lPstmt.setInt(2, row.getRowNum());
						int lColumnIndex= cell.getColumnIndex();
						lPstmt.setString(3, CellReference.convertNumToColString(lColumnIndex));
						lPstmt.setDouble(4, cell.getNumericCellValue());
						lPstmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
						lPstmt.setNull(6, java.sql.Types.TIMESTAMP);
						lPstmt.setNull(7, java.sql.Types.BIGINT);
						lPstmt.setString(8, "Y");
						lPstmt.setInt(9, 1);
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
				if(pConnection!=null){
					pConnection.close();
				}
			}catch(Exception e1){
				logger.error("Error Occured while closing connection",e1);
			}
		}
		
		return lReturnResponse;
		
	}

}
