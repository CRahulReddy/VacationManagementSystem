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

public class EditRequest  extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     System.out.println("inside EditRequest");
     HttpSession session;
     try
     {
      session = request.getSession();
      int user_id = (Integer) request.getSession().getAttribute("user_id");
      String leaveType = request.getParameter("leaveType");
      String from = request.getParameter("from");
      String to = request.getParameter("to");
      String comments = request.getParameter("comments");
      System.out.println("request.getParameter(cancelbutton): "+request.getParameter("cancelbutton"));
      boolean cancel =  Boolean.parseBoolean(request.getParameter("cancelbutton"));

      int request_id = Integer.parseInt(request.getParameter("request_id"));
      System.out.println("user_id: "+user_id+" leaveType: "+leaveType+" from: "+from+" to: "+to+" comments: "+comments+" cancel: "+cancel+" request_id: "+request_id);
     
     
      System.out.println("fromDate: "+from+" toDate: "+to);
      Statement st = DbConnection.c.createStatement();
         ResultSet resultset;
         ResultSet resultset1 = null;
   ResultSet resultset2 = null;
   String sql="";
   if(cancel)
   {
    sql = "Update REQUEST set request_status  = 'cancelled' , updated_by = '"+user_id+"' WHERE request_id='"
               + request_id + "'";
   }
   else
   {
    sql = "Update REQUEST set leave_type  = '"+ (leaveType)+"',start_dt  = '"+ (from)+"' , end_dt = '"+to+"',comments  = '"+ (comments)+"' WHERE request_id='"
               + request_id + "'";
   }

      System.out.println("sql: "+sql);
      st = DbConnection.c.createStatement();
      int flag = st.executeUpdate(sql);
      System.out.println("flag: "+flag);
            st.close();

             
              System.out.println(request_id);
             
              request.getSession().setAttribute("leaveUpdated", true);
              response.sendRedirect("editRequest.jsp?request_id="+request_id);
     }
     catch(Exception e)
     {
      e.printStackTrace();
     }
    }

}
