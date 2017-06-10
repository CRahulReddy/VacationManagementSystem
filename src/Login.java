import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {
/**
 * Initializing static Logger
 */
	 static Logger logger = Logger.getLogger(Login.class.getName());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
    	System.out.println("At Login Page of site");
    	System.out.println(new File("").getAbsolutePath());
    	// create secret key and return
    	HttpSession session;
    	String screenName = request.getParameter("screenName");
    	String password = request.getParameter("password");
    	logger.debug("Login Attempt: "+screenName +" , "+password);
    	System.out.println("Login Attempt: "+screenName +" , "+password);
    	
    	try
    	{
        	Statement st = DbConnection.c.createStatement();
        	ResultSet resultset;
        	resultset = st
        			.executeQuery("SELECT password,user_ID FROM UserCredentials WHERE username='"
        					+ screenName + "'");
        	
        	if (resultset.next()) {
        		logger.debug("Login Success: "+screenName +" , "+password);
        		System.out.println("enetered resultset");
        		String pass = resultset.getString(1);
        		System.out.println("password "+pass);
        		if (password.equals(resultset.getString(1))) {
        			session = request.getSession();
        			int user_id = resultset.getInt(2);
        			session.setAttribute("screenname", screenName);
        			session.setAttribute("user_id", (user_id));
        			
        			//checking user Type
        			resultset = st
                			.executeQuery("SELECT name FROM EMPLOYEE_CATEGORY WHERE user_id='"
                					+ user_id + "'");
        			String userType= resultset.getString(1);
        			session.setAttribute("userType", (userType));
        			System.out.println("userType: "+userType);
        			if(userType.equals("employee"))
        			{
        				System.out.println();
        				resultset = st
                    			.executeQuery("SELECT first_nm, middle_nm, last_nm FROM EMPLOYEE WHERE user_id='"
                    					+ user_id + "'");
        				String name="";
        				if(resultset.getString(2)!=null && !resultset.getString(2).equals(" "))
        					name = resultset.getString(1)+" "+resultset.getString(2)+" "+resultset.getString(3);
        				else
        					name = resultset.getString(1)+" "+resultset.getString(3);
        				session.setAttribute("name", (name));
        				
        				resultset = st
                    			.executeQuery("SELECT available FROM BALANCE WHERE user_id='"
                    					+ user_id + "'");
        				
        				int balance = resultset.getInt(1);
        				session.setAttribute("balance", (balance));
        				
        				resultset = st
                    			.executeQuery("SELECT begin_balance FROM BALANCE WHERE user_id='"
                    					+ user_id + "'");
        				
        				int beginBalance = resultset.getInt(1);
        				session.setAttribute("beginBalance", (beginBalance));
        				
        				resultset = st
                    			.executeQuery("SELECT taken_for_year FROM BALANCE WHERE user_id='"
                    					+ user_id + "'");
        				
        				int hoursTaken = resultset.getInt(1);
        				session.setAttribute("hoursTaken", (hoursTaken));
        				
        				
        				
        				resultset = st
                    			.executeQuery("SELECT count(user_id) FROM REQUEST WHERE user_id='"
                    					+ user_id + "' and request_status='pending'");
        				
        				int pending= resultset.getInt(1);
        				session.setAttribute("pending", (pending));
        				
        				resultset = st
                    			.executeQuery("SELECT count(user_id) FROM REQUEST WHERE user_id='"
                    					+ user_id + "' and request_status='approved'");
        				
        				int approved= resultset.getInt(1);
        				session.setAttribute("approved", (approved));
        				
        			    Map<String,String> month = new HashMap<String,String>();
        				month.put("1","Jan");
        				month.put("2","Feb");
        				month.put("3","Mar");
        				month.put("4","Apr");
        				month.put("5","May'");
        				month.put("6","Jun");
        				month.put("7","Jul'");
        				month.put("8","Aug");
        				month.put("9","Sep");
        				month.put("10","Oct");
        				month.put("11","Nov");
        				month.put("12","Dec");
        				session.setAttribute("month", (month));
        				session.setAttribute("applyLeave", false);
        				session.setAttribute("connection", DbConnection.c);
        				response.sendRedirect("index.jsp");
        			}
        			else if(userType.equals("manager"))
        			{
        				
        				ResultSet resultset1 = null;
        				ResultSet resultset2 = null;
        				resultset1 = st
                    			.executeQuery("SELECT first_nm, middle_nm, last_nm FROM EMPLOYEE WHERE user_id='"
                    					+ user_id + "'");
        				String name="";
        				if(resultset1.getString(2)!=null && !resultset1.getString(2).equals(" "))
        					name = resultset1.getString(1)+" "+resultset1.getString(2)+" "+resultset1.getString(3);
        				else
        					name = resultset1.getString(1)+" "+resultset1.getString(3);
        				session.setAttribute("name", (name));
        				System.out.println("user_id: "+user_id);
        				
        				resultset2 = st
                    			.executeQuery("SELECT first_nm, middle_nm, last_nm, user_id FROM EMPLOYEE WHERE manager_id='"
                    					+ user_id + "'");
        				int pending= 0;
        				int approved = 0;
        				int rejected = 0;
        				
        			/*	resultset1 = st
                    			.executeQuery("SELECT first_nm, middle_nm, last_nm, user_id FROM EMPLOYEE");
        				
        				while(resultset1.next())
        				{
        					System.out.println(resultset1.getString(1)+" "+resultset1.getString(2)+" "+resultset1.getString(3)+" "+resultset1.getInt(4));
        				}
        				
        				*/while(resultset2.next())
        				{
        					try
        					{
        					System.out.println("dddddd"+resultset1.getString(1));
        					if(resultset1.getString(1).equals("0"))
        						break;
        					System.out.println(" "+resultset2.getString(2)+" "+resultset2.getString(3)+" "+resultset2.getInt(4));
        					}
        					catch(java.sql.SQLException e)
        					{
        						break;
        					}
        					catch(Exception e)
        					{
        						e.printStackTrace();
        					}
        					System.out.println("inside resultset2 next");
        					int id = resultset2.getInt(4);
        					resultset1 = st
                        			.executeQuery("SELECT count(user_id) FROM REQUEST WHERE user_id='"
                        					+ id + "' and request_status='pending'");
        					
        					pending= pending + resultset1.getInt(1);
        					
        					resultset1 = st
                        			.executeQuery("SELECT count(user_id) FROM REQUEST WHERE user_id='"
                        					+ id + "' and request_status='approved'");
            				
            				approved= approved+ resultset1.getInt(1);
            				
            				resultset1 = st
                        			.executeQuery("SELECT count(user_id) FROM REQUEST WHERE user_id='"
                        					+ id + "' and request_status='rejected'");
            				
            				rejected= rejected+ resultset1.getInt(1);
        				}
        				
        				resultset2 = st
                    			.executeQuery("SELECT e.first_nm, e.middle_nm, e.last_nm, r.user_id, r.start_dt ,r.end_dt "
                    					+ "FROM EMPLOYEE e, REQUEST r "
                    					+ "WHERE e.manager_id=='"
                    					+ user_id + "' and e.user_id = r.user_id "
                    					+ "and r.request_status = 'pending'");
        				
        			   session.setAttribute("pending", (pending));
        				
                       session.setAttribute("approved", (approved));
                       
                       session.setAttribute("rejected", (rejected));
        				
        			    Map<String,String> month = new HashMap<String,String>();
        				month.put("0","Januar");
        				month.put("1","Febuary");
        				month.put("2","March");
        				month.put("3","April");
        				month.put("4","May'");
        				month.put("5","June");
        				month.put("6","July'");
        				month.put("7","August");
        				month.put("8","September");
        				month.put("9","October'");
        				month.put("10","November");
        				month.put("11","December");
        				session.setAttribute("month", (month));
        				session.setAttribute("applyLeave", false);
        				session.setAttribute("connection", DbConnection.c);
        				response.sendRedirect("indexManager.jsp");
        			}
        			
        		} else {
        			logger.debug("Loging Failed: "+screenName +" , "+password);
        			response.sendRedirect("LoginFailed.jsp");
        		}
        	} else {
        		
        		response.sendRedirect("LoginFailed.jsp");
        	}
    	
    	}
    	catch(Exception e)
    	{
    		logger.error(e.getMessage());
    		e.printStackTrace();
    	}
    	
    
    	
    }
  
}