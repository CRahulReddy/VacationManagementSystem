import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LeaveRequest  extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("inside LeaveRequest");
    	HttpSession session;
    	try
    	{
    		session = request.getSession();
    		int user_id = (Integer) request.getSession().getAttribute("user_id");
    		String leaveType = request.getParameter("leaveType");
    		String from = request.getParameter("from1");
    		String to = request.getParameter("to1");
    		String comments = request.getParameter("comments");
    		String action = request.getParameter("action");
    		if(action.trim().equals("Approve"))
    			action = "approved";
    		else
    			action = "rejected";
    		int request_id = Integer.parseInt(request.getParameter("request_id"));
    		System.out.println("user_id: "+user_id+" leaveType: "+leaveType+" from: "+from+" to: "+to+" comments: "+comments+" action: "+action+" request_id: "+request_id);
    		
 
    		
    		//String fromDates[] = from.split("/");
    		
    		//String toDates[] = to.split("/");
    		

    		//Date d = new Date();
    		//System.out.println(d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
    		//String fromDate = fromDates[2]+"-"+fromDates[0]+"-"+fromDates[1]+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
    		//String toDate = toDates[2]+"-"+toDates[0]+"-"+toDates[1]+" "+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
    		
    		System.out.println("fromDate: "+from+" toDate: "+to);
    		Statement st = DbConnection.c.createStatement();
        	ResultSet resultset;
        	ResultSet resultset1 = null;
			ResultSet resultset2 = null;
			
    		String sql = "Update REQUEST set request_status  = '"+ (action)+"' , updated_by = '"+user_id+"' WHERE request_id='"
                					+ request_id + "'";
    		System.out.println("sql: "+sql);
    		st = DbConnection.c.createStatement();
    		int flag = st.executeUpdate(sql);
    		System.out.println("flag: "+flag);
            st.close();
            st = DbConnection.c.createStatement();
            resultset = st
        			.executeQuery("SELECT count(request_id) FROM REQUEST");
            
            request_id = resultset.getInt(1);
            		
            		System.out.println(request_id);
            		
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
    					System.out.println("dddddd"+resultset2.getString(1));
    					if(resultset2.getString(1).equals("0"))
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
    				
    				st.close();
    				resultset.close();
    				resultset1.close();
    				resultset2.close();
    			   session.setAttribute("pending", (pending));
    				
                   session.setAttribute("approved", (approved));
                   
                   session.setAttribute("rejected", (rejected));
            		response.sendRedirect("indexManager.jsp");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }

}

