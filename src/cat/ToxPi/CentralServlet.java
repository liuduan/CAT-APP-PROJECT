package cat.ToxPi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.catapp.action.shellCommands;
import com.mysql.jdbc.PreparedStatement;
import com.catapp.connection.DBConnection;

/**
 * Servlet implementation class CentralServlet
 */
@WebServlet("/CentralServlet")
public class CentralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CentralServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ToxPi/CentralServlet A"); 
		 
		response.setContentType("text/plain");
		
		Enumeration<String> parameterNames = request.getParameterNames();
		
		ArrayList<String> All_Phenotypes = new ArrayList<String>(Arrays.asList("Cardio_peak_freq_90min", 
				"Cardio_peak_freq_24hr", "Cardio_Total_Cell_24h", "HUVEC_total_cell", "HUVEC_tube_area", 
				"HUVEC_Mito_24h"));
		ArrayList<String> Selected_Phenotypes = new ArrayList<String>();
		
		String chemical = "";

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();

			System.out.println("\nToxPi/CentralServlet  paramName: " + paramName); 
			
			String[] paramValues = request.getParameterValues(paramName);
		 	
		 	if (All_Phenotypes.contains(paramValues[0])) {
		 		Selected_Phenotypes.add(paramValues[0]);
		 		} 
		 	
		 	if (paramName.indexOf("chm_")>= 0) {
		 		chemical = paramValues[0];  
		 		chemical = chemical.substring(4);
		 		// System.out.println("ToxPi/CentralServlet chemical: " + chemical);  
		 		} 

		 	System.out.println("ToxPi/CentralServlet paramValue: " + paramValues[0]);  
		 	
		 	}		// end of while
		
		

		for (int i = 0; i < Selected_Phenotypes.size(); i++) {  
            System.out.println("Selected phenotypes: " + Selected_Phenotypes.get(i));
        }
		
		System.out.println("\nToxPi/CentralServlet C paramValue: " + All_Phenotypes.get(3));  
		
		ArrayList<String> selected_cell_lines = new ArrayList<String>();
		selected_cell_lines.add("received_value");
		
		System.out.println("ToxPi/CentralServlet C"); 
		
		///////////////// Access database ///////////////////////////////////////////////////////
		java.sql.PreparedStatement lPstmt = null;
		ResultSet lRst = null;
		Connection lConn  = null;
		lConn = new DBConnection().getConnection();
		
		String lQuery= "select pod_sd1 from response.assay_data where catapp_id = '55'";
		try {
			lPstmt=lConn.prepareStatement(lQuery);
			lRst= lPstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pod_sd1 = "";
		 try {
			while(lRst.next()){
				//Retrieve by column name
			    pod_sd1 = lRst.getString("pod_sd1");
			    System.out.println("ToxPi/CentralServlet point of departure: " + pod_sd1); 

			    //Display values

			    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 try {
			lConn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		///////////////////////// Run R command ///////////////////////////////
		
		String R_command = "cmd.exe /c C:\\\"Program Files\"\\R\\R-3.3.3\\bin\\Rscript C:\\4_R\\ToxPi\\ToxPi.R";
	
		System.out.println(R_command); 
		
		shellCommands obj = new shellCommands();
		String output = obj.executeCommand(R_command);

		System.out.println(output);
		
		getServletContext().getRequestDispatcher("/WEB-INF/ToxPi/Central.jsp").forward(request, response);
	}

}
