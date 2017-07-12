package com.catapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dowload_Internal_B
 */
@WebServlet("/Download_Internal_B")
public class Download_Internal_B extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download_Internal_B() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("\n  Download_Internal_B servlet: ");
		
		// assays with only 1 phenotype: 
		ArrayList<String> assay_1_pheno = new ArrayList<>(Arrays.asList(				
				"A375_CMFDA", 	"A375_ROS", 	"A375_CASP", 	"A375_PROT", 	"A375_ATP",  
				"A549_CMFDA", 	"A549_ROS", 	"A549_CASP", 	"A549_PROT", 	"A549_ATP",  
				"HepG2_CMFDA", 	"HepG2_ROS", 	"HepG2_CASP", 	"HepG2_PROT", 	"HepG2_ATP",  
				"HepaRG_CMFDA", "HepaRG_ROS", 	"HepaRG_CASP", 	"HepaRG_PROT", 	"HepaRG_ATP",  
				"MCF7_CMFDA", 	"MCF7_ROS", 	"MCF7_CASP", 	"MCF7_PROT", 	"MCF7_ATP",  
				"HT29_CMFDA", 	"HT29_ROS", 	"HT29_CASP", 	"HT29_PROT", 	"HT29_ATP",  
				"LN229_CMFDA", 	"LN229_ROS", 	"LN229_CASP", 	"LN229_PROT", 	"LN229_ATP",  
				"HEK10205f_CMFDA", "HEK10205f_ROS", "HEK10205f_CASP", "HEK10205f_PROT", "HEK10205f_ATP",  
				"HLMVEC_CMFDA", "HLMVEC_ROS", 	"HLMVEC_CASP", 	"HLMVEC_PROT", 	"HLMVEC_ATP",  
				"HMePC_CMFDA", 	"HMePC_ROS", 	"HMePC_CASP", 	"HMePC_PROT", 	"HMePC_ATP",  
				"SH-SY5Y_CMFDA", "SH-SY5Y_ROS", "SH-SY5Y_CASP", "SH-SY5Y_PROT", "SH-SY5Y_ATP",
		
				"HEP_CalceinAM", "HEP_LipidTOX", "ENDO_CalceinAM", "HUV_CalceinAM", "Neur_CalceinAM", 
				"Macro_CalceinAM", "Macro_Mito" ));

		ArrayList<String> selected_assay_1_pheno = new ArrayList<String>();
		for(int x = 0; x < 62; x = x + 1) {
	         // System.out.println("cell lines: "+ cell_lines.get(x));
	         String received_value = request.getParameter(assay_1_pheno.get(x));	// receiving the post value
	         if (received_value != null){
	        	 System.out.println("selected_assay_1_pheno: "+ received_value);
	        	 selected_assay_1_pheno.add(received_value);
	         }
	      }
		
		// System.out.println("selected_assay_1_pheno: "+ request.getParameter(selected_assay_1_pheno.get(1)));
		
		request.setAttribute("selected_assay_1_pheno", selected_assay_1_pheno);	// submit value to jsp page:
		
		
// =================== assays with multiple phenotypes: 
		ArrayList<String> multi_ph_assays = new ArrayList<>(Arrays.asList("CM_Ca2", "CM_Hoechst", "CM_Mito", 
				"HEP_Hoechst", "HEP_Mito", "ENDO_Hoechst", "ENDO_Mito", "ENDO_TubForm", "HUV_Hoechst", 
				"HUV_Mito", "HUV_TubForm", "Neur_Hoechst", "Neur_Mito", "Neur_NeurOut", "Macro_Hoechst", 
				"Macro_Phag", "Macro_Cyto", "Macro_MacroOut"));
		
		ArrayList<String> selected_multi_ph_assays = new ArrayList<String>();
		
		for(int x = 0; x < 18; x = x + 1) {
	         // System.out.println("cell lines: "+ cell_lines.get(x));
	         String received_value = request.getParameter(multi_ph_assays.get(x));	// receiving the post value
	         if (received_value != null){
	        	 System.out.println("selected_multi_ph_assays: "+ received_value);
	        	 selected_multi_ph_assays.add(received_value);
	         }
	      }

		
		request.setAttribute("selected_multi_ph_assays", selected_multi_ph_assays);	// submit value to jsp page:		

		getServletContext().getRequestDispatcher("/WEB-INF/Download_Internal_B.jsp").forward(request, response);

		
	}

}
