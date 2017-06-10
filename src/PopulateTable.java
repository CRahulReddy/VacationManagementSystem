

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


@WebServlet("/PopulateTable")
public class PopulateTable extends HttpServlet {
 private static final long serialVersionUID = 1L;

    public PopulateTable() {
       
    }
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
  ArrayList<Request> RequestList = new ArrayList<Request>();
  String to = request.getParameter("to");
  String from = request.getParameter("from");
  System.out.println(from+" : "+to);
  RequestList=FetchData.getAllREQUESTs(from,to);
  Gson gson = new Gson();
  JsonElement element = gson.toJsonTree(RequestList, new TypeToken<List<Request>>() {}.getType());

  JsonArray jsonArray = element.getAsJsonArray();
  response.setContentType("application/json");
  response.getWriter().print(jsonArray);
  
 }

 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
 }

}
