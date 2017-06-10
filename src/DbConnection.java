import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class DbConnection {
	
	static Connection c = null;
	
	static
	{
	    if(c==null)
	    {
		try {
		 Class.forName("org.sqlite.JDBC");
	        c = DriverManager.getConnection("jdbc:sqlite:vms.db");
	        System.out.println("skb - Opened database successfully");
		} catch ( Exception e ) {
	        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	        System.exit(0);
	      }
	    }
	}
	
	
	public static void main(String[] a)
	{

		Statement stmt = null;
    try {
        
        stmt = c.createStatement();
        ResultSet rs = stmt.executeQuery( "SELECT name FROM sqlite_master WHERE type='table'" );
        while ( rs.next() ) {
          System.out.println(rs.getString(1));
        }
        
        rs = stmt.executeQuery( "SELECT password FROM UserCredentials WHERE username='shyam'" );
        while ( rs.next() ) {
          System.out.println(rs.getString(1));
        }
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
        rs = stmt.executeQuery( "SELECT date(start_dt) FROM REQUEST WHERE request_status ='pending'" );
        while ( rs.next() ) {
        	String date = rs.getString(1);
          System.out.println(date);
          String dates[] = date.split("-");
          System.out.println(dates[1]);
          System.out.println(month.get(dates[1]));
        }
        int user_id = 1;
        rs = stmt
    			.executeQuery("SELECT date(start_dt) FROM REQUEST WHERE user_id='"
    					+ user_id + "' and  start_dt <= (datetime('now', 'localtime')) and request_status = 'approved' ");
        
        
        
        String sql = "insert into REQUEST (request_id, user_id, comments, request_dt, request_status) values (?, ?, ?, ?,?)";
        PreparedStatement pst = c.prepareStatement(sql);
        pst.setInt(1, 5);
        pst.setInt(2, 1);
        pst.setString(3, "comments");
        java.util.Date d = new java.util.Date();
        pst.setString(4, (d).toGMTString().toString());
        pst.execute();
        
        
        rs.close();
        stmt.close();
        c.close();
      } catch ( Exception e ) {
        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        e.printStackTrace();
        System.exit(0);
      }
      System.out.println("Opened database successfully");
      
    
	
	
	}
	Map m = new HashMap();
}
