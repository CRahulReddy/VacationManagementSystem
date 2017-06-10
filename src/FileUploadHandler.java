
 import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadHandler extends HttpServlet {
   // private final String UPLOAD_DIRECTORY = "";
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
             
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                       
                        System.out.println(new File("hey").getAbsolutePath());
                        String adress = new File("").getAbsolutePath();
                        Statement st = DbConnection.c.createStatement();
        	        	ResultSet resultset;
        	        	
        	        	int user_id = (Integer)request.getSession().getAttribute("user_id");
        	    		String sql = "Update EMPLOYEE set pic  = '"+ (adress+File.separator+name)+"' WHERE user_id='"
            					+ user_id + "'";
        	    		System.out.println("sql: "+sql);
        	    		int flag = st.executeUpdate(sql);
                        System.out.println("flag: "+flag);
                        item.write( new File(name));
                    }
                }
         
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }        
       
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
   
        request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
   
    }
 
}