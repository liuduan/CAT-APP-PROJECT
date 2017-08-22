package com.catapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.catapp.action.Login;
<<<<<<< HEAD
import com.catapp.action.SendEmail;
=======
>>>>>>> SS-Master/master
import com.catapp.connection.DBConnection;
import com.catapp.entity.User;  
@WebServlet(value="/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {  
<<<<<<< HEAD
	private static final Logger LOGGER = Logger.getLogger(RequestAccessServlet.class);
=======
	private static final Logger LOGGER = Logger.getLogger(ForgotPasswordServlet.class);
>>>>>>> SS-Master/master
        /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
			
<<<<<<< HEAD
			System.out.println("ForgotPasswordServlet A： "  + "forgotEmail");
			SendEmail.sendEmail("old");
		    request.getRequestDispatcher("/WEB-INF/requestSubmitted.jsp").include(request, response);
			
		    /*
=======
>>>>>>> SS-Master/master
			Connection lConn 				= null;
			String lAns1					= null;
			String lAns2					= null;
			String lAns3					= null;
<<<<<<< HEAD
			

=======
			PreparedStatement lPstmt        = null;
			ResultSet lRst					= null;
			
>>>>>>> SS-Master/master
			try{
				User lUser = (User) request.getSession().getAttribute("user");
				lConn = new DBConnection().getConnection();
				String lSQ = request.getParameter("pwd");
<<<<<<< HEAD
				if(lSQ.equals("Validate")){
					
					System.out.println("ForgotPasswordServlet B");
					
=======
				LOGGER.debug("lSQ::"+lSQ);
				if(lSQ.equals("Validate")){
					
>>>>>>> SS-Master/master
					if(request.getParameter("ans1")!=null){
						lAns1 = request.getParameter("ans1");
					}
					
					if(request.getParameter("ans2")!=null){
						lAns2 = request.getParameter("ans2");
					}
					if(request.getParameter("ans3")!=null){
						lAns3 = request.getParameter("ans3");
					}
					HashMap<Long,String>lAnswerMap =new HashMap<Long,String>();
					lAnswerMap.put(1L, lAns1);
					lAnswerMap.put(2L, lAns2);
					lAnswerMap.put(3L, lAns3);
<<<<<<< HEAD
					boolean lFlag =pAuthenticateAnswers(lAnswerMap, lUser.getEntityId(), lConn);
					if(lFlag){
						request.getRequestDispatcher("/WEB-INF/ForPassPage.jsp?page=2").include(request, response);
					}else{
						response.setContentType("text/html");  
						PrintWriter out=response.getWriter(); 
						response.sendError(1, "One or more answers didn't match the desired answers.");
						out.close();  
					}
				}else{
=======
					boolean lFlag =pAuthenticateAnswers(lAnswerMap, lUser.getEntityId(),
							lConn);
					LOGGER.debug("lFlag::"+lFlag);
					if(lFlag){
						request.getRequestDispatcher("/WEB-INF/ForPassPage.jsp?page=2").include(request, response);
					}else{
						LOGGER.info("One or more answers didn't match the desired answers.");

						PrintWriter out=response.getWriter(); 
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('One or more answers didn't match the desired answers.');");  
						out.println("</script>");
						request.getRequestDispatcher("/WEB-INF/index.jsp").include(request, response);
						return;
						/*out.close(); */ 
					}
				}else{
					LOGGER.info("generating hash");

>>>>>>> SS-Master/master
					String lPassword = request.getParameter("password");
					User lUsertosave = new User();
					lUsertosave.setEntityId(lUser.getEntityId());
					lUsertosave.find(lConn, lUser);
					lUsertosave.setPassword(Login.generateHash("PWD"+lPassword));
<<<<<<< HEAD
					lUsertosave.save(lConn, lUsertosave);
				}
				
				
				
			}catch(Exception e){
				
=======
					
					 String lQuery = "update users set Password=? where entity_id=?";
					 lPstmt=lConn.prepareStatement(lQuery);
					 lPstmt.setString(1, lUsertosave.getPassword());
					 lPstmt.setLong(2, lUsertosave.getEntityId());
					 lPstmt.executeUpdate();
					     PrintWriter out = response.getWriter();  
						response.setContentType("text/html");  
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Password Changed Successfully.');");  
						out.println("</script>");
					//lUsertosave.save(lConn, lUsertosave);
						request.getRequestDispatcher("/WEB-INF/index.jsp").include(request, response);

				}
				
				
			}catch(Exception e)
			{
				LOGGER.error("Exception occurred::",e);

				e.printStackTrace();
>>>>>>> SS-Master/master
			}finally{
				try{
					if(lConn!=null){
						lConn.close();
					}
				}catch(Exception c){
<<<<<<< HEAD
					
				}
			}
			
            /*response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
            
            request.getRequestDispatcher("/WEB-INF/ForPassPage.jsp").include(request, response);  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
              
            //out.print("You are successfully logged out!");  
              
            out.close();  */
=======
					c.printStackTrace();

				}
			}
			
           
>>>>>>> SS-Master/master
    }  
		/*@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(req, resp);
		}*/
		public static boolean pAuthenticateEmail(String pEmail,Connection pConn){
			
			PreparedStatement lPstmnt = null;
			ResultSet		  lRst	  = null;
			boolean lFlag			  =false;
			try{
				StringBuilder lBuilder = new StringBuilder("select entity_id from users where email=? and rowstate!=-1 and is_active='Y'");
				lPstmnt =pConn.prepareStatement(lBuilder.toString());
				lPstmnt.setString(1, pEmail);
				lRst=lPstmnt.executeQuery();
				while(lRst.next()){
					lFlag=true;
				}
			}catch (Exception e){
				LOGGER.error("Error Occured while authenticating email",e);
			}finally{
				try{
					if(lPstmnt!=null){
						lPstmnt.close();
					}
				}catch(Exception p){
					LOGGER.error("Error Occured while closing pstmnt",p);
				}
			}
			return lFlag;
		}
		public static boolean pAuthenticateAnswers(HashMap<Long,String> pAnswers,Long pUserId,Connection pConn){
			
<<<<<<< HEAD
=======
			LOGGER.debug("Start of pAuthenticateAnswers::"+ pUserId);
>>>>>>> SS-Master/master
			PreparedStatement lPstmnt = null;
			ResultSet		  lRst	  = null;
			boolean lFlag			  = false;
			try{
				StringBuilder lBuilder = new StringBuilder("select question_id,answer from security_questions_answers where user_id=? and rowstate!=-1 and is_active='Y'");
				lPstmnt =pConn.prepareStatement(lBuilder.toString());
				lPstmnt.setLong(1, pUserId);
				lRst=lPstmnt.executeQuery();
				int lAnsCount=0;
				while(lRst.next()){
					lFlag=true;
<<<<<<< HEAD
					if(pAnswers.get(lRst.getLong(1)).equals(lRst.getString(2))){
=======
					LOGGER.debug(" answer from user::"+pAnswers.get(lRst.getLong(1))+"ans in db::"+lRst.getString(2));
					if(pAnswers.get(lRst.getLong(1)).equals(lRst.getString(2))){
						LOGGER.info("match");
>>>>>>> SS-Master/master
						lAnsCount++;
					}
				}
				if(lAnsCount==3){
					lFlag=true;
				}else{
					lFlag=false;
				}
			}catch (Exception e){
				LOGGER.error("Error Occured while authenticating email",e);
			}finally{
				try{
					if(lPstmnt!=null){
						lPstmnt.close();
					}
				}catch(Exception p){
					LOGGER.error("Error Occured while closing pstmnt",p);
				}
			}
<<<<<<< HEAD
=======
			LOGGER.info("End of method pAuthenticateAnswers:: iFlag::"+lFlag);

>>>>>>> SS-Master/master
			return lFlag;
		}
}  