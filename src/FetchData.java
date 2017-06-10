

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


public class FetchData {

   
    public static ArrayList<Request> getAllREQUESTs(String from, String to) {
     
        ArrayList<Request> RequestList = new ArrayList<Request>();
        try {
            Statement statement = DbConnection.c.createStatement();
            String fromDates[] = from.split("/");
      
        String toDates[] = to.split("/");
      
        String fromDate = fromDates[2]+"-"+fromDates[0]+"-"+fromDates[1];
        String toDate = toDates[2]+"-"+toDates[0]+"-"+toDates[1];
 
        String sql =  "select * from Request where start_dt >=Datetime('"
           + fromDate+ "') and end_dt <= ('"
           +toDate+ "') limit 10";
       
           ResultSet rs = statement.executeQuery(sql);
         
          System.out.println("sql: "+sql);
       
            while(rs.next()) { 
             Request req = new Request(rs.getInt(1), rs.getInt(2),rs.getString(3) ,rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(6),rs.getString(8), rs.getInt(9),rs.getString(10) );
             
             RequestList.add(req);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return RequestList;
    }
}