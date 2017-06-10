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

public class EditProfile extends HttpServlet{
	
	  @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	System.out.println("inside EditProfile");
	    	HttpSession session;
	    	try
	    	{
	    		session = request.getSession();
	    		int user_id = (Integer) request.getSession().getAttribute("user_id");
	    		String address = request.getParameter("address");
	    		String mobileNo = request.getParameter("mobileNo");
	    		String email = request.getParameter("email");
	    		
	    		System.out.println("user_id: "+user_id+" address: "+address+" mobileNo: "+mobileNo+" email: "+email);

	    		
	    		Statement st = DbConnection.c.createStatement();
	        	ResultSet resultset;
	        	
	        	
	    		String sql = "Update EMPLOYEE set address  = '"+ (address)+"' , cell_phone = '"+mobileNo+"' , email = '"+email+"' WHERE user_id='"
    					+ user_id + "'";
	    		System.out.println("sql: "+sql);
	    		int flag = st.executeUpdate(sql);
	    		System.out.println("flag: "+flag);
	            st.close();
	            response.sendRedirect("profile.jsp");
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}
	    }

}
