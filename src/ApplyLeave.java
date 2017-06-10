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

import org.apache.log4j.Logger;



public class ApplyLeave  extends HttpServlet {
	/**
	 * Initializing static Logger
	 */
		 static Logger logger = Logger.getLogger(ApplyLeave.class.getName());
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session;
    	try
    	{
    		session = request.getSession();
    		int user_id = (Integer) request.getSession().getAttribute("user_id");
    		String leaveType = request.getParameter("leaveType");
    		String from = request.getParameter("from");
    		String to = request.getParameter("to");
    		String comments = request.getParameter("comments");
    		
    		logger.debug("user_id: "+user_id+" leaveType: "+leaveType+" from: "+from+" to: "+to+" comments: "+comments);
    		
 
    		
    		String fromDates[] = from.split("/");
    		
    		String toDates[] = to.split("/");
    		

    		Date d = new Date();
    		System.out.println(d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
    		String fromDate = fromDates[2]+"-"+fromDates[0]+"-"+fromDates[1]+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
    		String toDate = toDates[2]+"-"+toDates[0]+"-"+toDates[1]+" "+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
    		
    		Statement st = DbConnection.c.createStatement();
        	ResultSet resultset;
        	resultset = st
        			.executeQuery("SELECT count(request_id) FROM REQUEST");
    		
    		int request_id = resultset.getInt(1) +1;
    		logger.debug("request_id:  "+request_id +" user_id: "+
    		user_id+"fromDate: "+fromDate+" toDate: "+toDate);
    		
    		String sql = "insert into REQUEST (request_id, user_id, comments, start_dt,end_dt, request_status) values (?, ?,?, ?, ?,?)";
            PreparedStatement pst = DbConnection.c.prepareStatement(sql);
            pst.setInt(1, request_id);
            pst.setInt(2, user_id);
            pst.setString(3, comments);
            pst.setString(4, fromDate);
            pst.setString(5, toDate);
            pst.setString(6, "pending");
            pst.execute();
            
            resultset = st
        			.executeQuery("SELECT count(request_id) FROM REQUEST");
            
            request_id = resultset.getInt(1);
            		
            		System.out.println(request_id);
            		
            		int pending = (Integer)session.getAttribute("pending");
            		session.setAttribute("pending", (pending +1));
            		
            		int balance = (Integer)session.getAttribute("balance");
            		session.setAttribute("balance", (balance -1));
            		
            		int flag = st.executeUpdate("update BALANCE set available = '"+ (balance -1)+"' WHERE user_id='"
                					+ user_id + "'");
            		
            		System.out.println("flag: "+flag);
            		//for testing until table is populated
            		VMSendMail.main(null);
            		session.setAttribute("applyLeave", true);
            		response.sendRedirect("index.jsp");
    	}
    	catch(Exception e)
    	{
    		logger.error(e.getMessage());
    		e.printStackTrace();
    	}
    }

}
