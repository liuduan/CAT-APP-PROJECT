package com.catapp.action;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
<<<<<<< HEAD
import java.sql.Timestamp;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.util.CellReference;
import org.apache.poi.ss.usermodel.Cell;
=======
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.HashMap;

import org.apache.log4j.Logger;
>>>>>>> SS-Master/master
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

<<<<<<< HEAD
import com.catapp.entity.ChemFile;

=======
>>>>>>> SS-Master/master

public class SaveExceltoDB {
	public static final Logger logger = Logger.getLogger(SaveExceltoDB.class.toString());
	
<<<<<<< HEAD
	public String saveExcelDataToDb (ChemFile pFile,Connection pConnection){
=======
	public String saveExcelDataToDb (String pCellLine, String pAssay, String pTimePoint,File pFile,Connection pConnection){
>>>>>>> SS-Master/master
		String lReturnResponse	     =       "failure";
		String lInsertQuery		     =       null;
		PreparedStatement lPstmt     =       null;
		try{
<<<<<<< HEAD
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
=======
	
			FileInputStream fis = new FileInputStream(pFile);
			XSSFWorkbook myWorkBook = new XSSFWorkbook (fis);
			XSSFSheet mySheet = myWorkBook.getSheet("Data");
			
			/*HashMap <String,Long> lChemicalNames = new HashMap <String,Long>();
			
			String lChemQuery= "select cat_app_id,name from chemical_cas_concawe_mapping";
			lPstmt =pConnection.prepareStatement(lChemQuery);
			ResultSet lChemSet =lPstmt.executeQuery();
			
			while(lChemSet.next()){
				lChemicalNames.put(lChemSet.getString(2).trim().replaceAll("/ ","/"), lChemSet.getLong(1));
			}
			lPstmt.clearParameters();*/
			/*********************************************** Start of header save ***************************************/
			Long lheaderID=null;
			lInsertQuery= "INSERT INTO processed_readings_header (cellline, assay,"
					+ " timepoint,logged_date,logged_by,last_updated_date,"
					+ " last_updated_by,is_active,rowstate) "
		            + " VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement lPstmttoClose=pConnection.prepareStatement(lInsertQuery,Statement.RETURN_GENERATED_KEYS);
			lPstmttoClose.setString(1, pCellLine);
			lPstmttoClose.setString(2, pAssay);
			lPstmttoClose.setString(3, pTimePoint);
			lPstmttoClose.setTimestamp(4,new Timestamp(System.currentTimeMillis()));
			lPstmttoClose.setLong(5, 1l);
			lPstmttoClose.setNull(6, java.sql.Types.TIMESTAMP);
			lPstmttoClose.setNull(7, java.sql.Types.BIGINT);
			lPstmttoClose.setString(8, "Y");
			lPstmttoClose.setInt(9, 1);
			lPstmttoClose.executeUpdate();
			ResultSet lRs = lPstmttoClose.getGeneratedKeys();
			if(lRs.next()){
				lheaderID=lRs.getLong(1);
			}
			/*********************************************** End of header save ***************************************/
			
			/*********************************************** Start of detail save ***************************************/
			
			String lDetailQuery= "INSERT INTO processed_readings_details (header_id,chemical_id,"
					+ " onex,tenx,hunderedx,thousandx,point_of_departure,logged_date,logged_by,last_updated_date,"
					+ " last_updated_by,is_active,rowstate) "
		            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement lPstmtForDetail=pConnection.prepareStatement(lDetailQuery);
			for(int i=1;i<=mySheet.getLastRowNum();i++){
				Row row =mySheet.getRow(i);
				lPstmtForDetail.setLong(1, lheaderID);
				lPstmtForDetail.setString(2, row.getCell(0).getStringCellValue());
				lPstmtForDetail.setDouble(3, row.getCell(4).getNumericCellValue());
				lPstmtForDetail.setDouble(4, row.getCell(3).getNumericCellValue());
				lPstmtForDetail.setDouble(5, row.getCell(2).getNumericCellValue());
				lPstmtForDetail.setDouble(6, row.getCell(1).getNumericCellValue());
				lPstmtForDetail.setNull(7, java.sql.Types.NULL);
				lPstmtForDetail.setTimestamp(8,new Timestamp(System.currentTimeMillis()));
				lPstmtForDetail.setLong(9, 1l);
				lPstmtForDetail.setNull(10, java.sql.Types.TIMESTAMP);
				lPstmtForDetail.setNull(11, java.sql.Types.BIGINT);
				lPstmtForDetail.setString(12, "Y");
				lPstmtForDetail.setInt(13, 1);
				lPstmtForDetail.addBatch();
					
				
			}
			int[] count = lPstmtForDetail.executeBatch();
			
			lPstmtForDetail.close();
			/*********************************************** End of detail save ***************************************/
			
			
			
			/*********************************************** Start of control save ***************************************/
			
			XSSFSheet lControlSheet = myWorkBook.getSheet("Control");
			
			String lControlQuery = "INSERT INTO control_readings (header_id,control_tag,"
					+ " pointone,pointfive,one,ten,fifty,logged_date,logged_by,last_updated_date,"
					+ " last_updated_by,is_active,rowstate) "
		            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			lPstmt=pConnection.prepareStatement(lControlQuery);
			
			for(int i=1;i<=lControlSheet.getLastRowNum();i++){
				Row row =lControlSheet.getRow(i);
						lPstmt.setLong(1, lheaderID);
						lPstmt.setString(2, row.getCell(0).getStringCellValue());
						lPstmt.setDouble(3, row.getCell(1).getNumericCellValue());
						lPstmt.setDouble(4, row.getCell(2).getNumericCellValue());
						lPstmt.setDouble(5, row.getCell(3).getNumericCellValue());
						lPstmt.setDouble(6, row.getCell(4).getNumericCellValue());
						lPstmt.setDouble(7, row.getCell(5).getNumericCellValue());
						lPstmt.setTimestamp(8,new Timestamp(System.currentTimeMillis()));
						lPstmt.setLong(9, 1l);
						lPstmt.setNull(10, java.sql.Types.TIMESTAMP);
						lPstmt.setNull(11, java.sql.Types.BIGINT);
						lPstmt.setString(12, "Y");
						lPstmt.setInt(13, 1);
						lPstmt.addBatch();
					
				
			}
			int[] count1 = lPstmt.executeBatch();
			
			
			/*********************************************** End of control save ***************************************/
			
			myWorkBook.close();
			
			
			if(count.length>0){
				lReturnResponse="success";
			}else{
				lReturnResponse="failure";
>>>>>>> SS-Master/master
			}
			
		}catch(Exception e){
			logger.error("Error Occured while saving excel file to database.",e);
		}
		finally{
			try{
<<<<<<< HEAD
			
=======
				lPstmt.close();
				pFile.delete();
>>>>>>> SS-Master/master
			}catch(Exception e1){
				logger.error("Error Occured while closing connection",e1);
			}
		}
		
		return lReturnResponse;
		
	}

}
