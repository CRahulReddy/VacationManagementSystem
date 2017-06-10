<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
      <!-- Meta, title, CSS, favicons, etc. -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Vacation Manager</title>
      <script language="javascript" type="text/javascript" src="js/actb.js"></script><!-- External script -->
      <script language="javascript" type="text/javascript" src="js/tablefilter.js"></script>
      <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
      <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
      <link rel="stylesheet"
         href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
      </style>
      <script type="text/javascript"
         src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript"
         src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
      <link href="css/custom.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <script>
         $(document).ready(function(){
             $('#myTable').dataTable();
         });
         
         
      </script>
      <style>
         #text
         {
         float:left;
         width:100px;
         }
         /*CSS for dropdown box*/
         select
         {
         width: 200px;
         height: 29px;
         border-radius: 3px;
         border: 1px solid #CCC;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         select: hover
         {
         width: 200px;
         height: 29px;
         border-radius: 3px;
         border: 1px solid #CCC;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         /*CSS for input textbox and password*/
         input[type='text'], input[type='password']
         {
         width: 200px;
         height: 29px;
         border-radius: 3px;
         border: 1px solid #CCC;
         padding: 8px;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         input[type='text']:hover, input[type='password']:hover
         {
         width: 200px;
         height: 29px;
         border-radius: 3px;
         border: 1px solid #aaa;
         padding: 8px;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         /*CSS for textarea*/
         textarea
         {
         width: 200px;
         height: 90px;
         border-radius: 3px;
         border: 1px solid #CCC;
         padding: 8px;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         textarea:hover
         {
         width: 200px;
         height: 90px;
         border-radius: 3px;
         border: 1px solid #aaa;
         padding: 8px;
         font-weight: 200;
         font-size: 15px;
         font-family: Verdana;
         box-shadow: 1px 1px 5px #CCC;
         }
         /*input type for submit button*/
         input[type='submit']
         {
         width: 150px;
         height: 34px;
         border: 2px solid white;
         background-color:#CCC;
         }
         input[type='submit']:hover
         {
         width: 150px;
         height: 34px;
         border: 2px solid white;
         background-color:#000000;
         color:#fff;
         }
         .leave
         {
         -webkit-background-clip: border-box;
         -webkit-background-origin: padding-box;
         -webkit-background-size: auto;
         background-attachment: scroll;
         background-clip: border-box;
         background-color: rgb(204, 204, 204);
         background-image: none;
         background-origin: padding-box;
         background-size: auto;
         border-bottom-left-radius: 10px;
         border-bottom-right-radius: 10px;
         border-top-left-radius: 10px;
         border-top-right-radius: 10px;
         box-sizing: border-box;
         color: rgb(255, 255, 255);
         display: block;
         float: left;
         font-family: 'Helvetica Neue', Roboto, Arial, 'Droid Sans', sans-serif;
         font-size: 13px;
         font-weight: normal;
         height: 22px;
         line-height: 19px;
         margin-right: 10px;
         outline-color: rgb(90, 115, 142);
         outline-style: none;
         outline-width: 0px;
         padding-bottom: 5px;
         padding-left: 5px;
         padding-right: 5px;
         padding-top: 1px;
         text-decoration: none;
         width: 70px;
         zoom: 1;
         }
      </style>
      <script type="text/javascript">
         $(document).ready(function() {
          $("#tablediv").hide();
              $("#to").change(function(event){
               var from = $('#from').val(); var to = $('#to').val(),
                  url = "PopulateTable"
                      + "?from=" + from
                      + "&to=" + to;
                    $.get(url,function(responseJson) {
                     if(responseJson!=null){
                         $("#requestTable").find("tr:gt(0)").remove();
                         var table1 = $("#requestTable");
                         table1.find("tr").remove();
                         var rowNew = $("<tr style='height: 28px;'  class='media event'><th scope='col' style='padding-left: 15px;'>Request_ID</th> <th scope='col' style='padding-left: 15px;'>Leave Type</th> <th scope='col' style='padding-left: 15px;'>From</th> <th scope='col' style='padding-left: 15px;'>To</th> <th scope='col' style='padding-left: 15px;'>Status</th>     </tr>");
                         rowNew.appendTo(table1);
                         $.each(responseJson, function(key,value) {
                              var rowNew = $("<tr style='height: 26px;'  class='media event'><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td></tr>");
                                 rowNew.children().eq(0).text(value['request_id']);
                                 rowNew.children().eq(1).text("Sick Leave");
                                 rowNew.children().eq(2).text(value['start_dt']);
                                 rowNew.children().eq(3).text(value['end_dt']);
                                 rowNew.children().eq(4).text(value['request_status']);
                                 rowNew.appendTo(table1);
                         });
                         }
                     });
                     $("#tablediv").show();    
           });
         });
         
         
         $(document).ready(function() {
          $("#tablediv").hide();
              $("#from").change(function(event){
               var from = $('#from').val(); var to = $('#to').val(),
                  url = "PopulateTable"
                      + "?from=" + from
                      + "&to=" + to;
               if(to !=null && to!=''&&  to!="")
                {
            
            
                    $.get(url,function(responseJson) {
                     if(responseJson!=null){
                         $("#requestTable").find("tr:gt(0)").remove();
                         var table1 = $("#requestTable");
                         table1.find("tr").remove();
                         var rowNew = $("<tr style='height: 28px;'  class='media event'><th scope='col' style='padding-left: 15px;'>Request_ID</th> <th scope='col' style='padding-left: 15px;'>Leave Type</th> <th scope='col' style='padding-left: 15px;'>From</th> <th scope='col' style='padding-left: 15px;'>To</th> <th scope='col' style='padding-left: 15px;'>Status</th>     </tr>");
                         rowNew.appendTo(table1);
                         $.each(responseJson, function(key,value) {
                              var rowNew = $("<tr style='height: 26px;'  class='media event'><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td><td style='padding-left: 15px;'></td></tr>");
                                 rowNew.children().eq(0).text(value['request_id']);
                                 rowNew.children().eq(1).text("Sick Leave");
                                 rowNew.children().eq(2).text(value['start_dt']);
                                 rowNew.children().eq(3).text(value['end_dt']);
                                 rowNew.children().eq(4).text(value['request_status']);
                                 rowNew.appendTo(table1);
                         });
                         }
                     });
                     $("#tablediv").show();
                }
           });
         });
      </script>
      <script type="text/javascript">
         function posturl (value)  {
             var myForm = document.createElement("form");
            myForm.action="editRequest.jsp?request_id="+value;// the href of the link
             myForm.method="POST";
             myForm.submit();
             return false; // cancel the actual link
           }
         
         $.fn.dataTable.ext.search.push(
               function( settings, data, dataIndex ) {
                   var min =  Date.parse($('#min').val(), "yyyy-MM-dd HH:mm:ss");
                   var max = Date.parse($('#max').val(), "yyyy-MM-dd HH:mm:ss");
                   //alert(data[1]);
                   var age = Date.parse(data[1], "yyyy-MM-dd HH:mm:ss"); // use data for the age column
           //alert(age+" "+min+" "+max);
                   if ( ( isNaN( min ) && isNaN( max ) ) ||
                           ( isNaN( min ) && age <= max ) ||
                           ( min <= age   && isNaN( max ) ) ||
                           ( min <= age   && age <= max ) )
                   {
                       return true;
                   }
                   return false;
               }
           );
          
           $(document).ready(function() {
               var table = $('#myTable').DataTable();
              
               // Event listener to the two range filtering inputs to redraw on input
               $('#min, #max').change( function() {
                   table.draw();
               } );
              
               $("#quater1").click(function(){
                   table.draw();
               });
              
               $("#quater2").click(function(){
                   table.draw();
               });
              
               $("#quater3").click(function(){
                   table.draw();
               });
              
               $("#quater4").click(function(){
                   table.draw();
               });
           } );
         
      </script>
   </head>
   <body class="nav-md">
      <div class="container body">
         <div class="main_container">
            <div class="col-md-3 left_col">
               <div class="left_col scroll-view">
                  <div class="navbar nav_title" style="border: 0;">
                     <a href="index.jsp" class="site_title">
                     <img src="images//V_logo.png" style="width:30px;height:30px;margin-top:5px;"/>
                     <span> Vacation Manager</span>
                     </a>
                  </div>
                  <div class="clearfix"></div>
                  <!-- menu profile quick info -->
                  <div class="profile" style="height:30px;">
                     <div style="width:230px;float:right;padding:0px 0px 10px 0px" class="profile_info">
                        <center>
                           <span>Welcome,</span>
                           <h2><%= (session.getAttribute("name"))%></h2>
                           <%= (session.getAttribute("userType"))%>
                        </center>
                     </div>
                  </div>
                  <!-- /menu profile quick info -->
                  <br /><br />
                  <!-- sidebar menu -->
                  <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                     <div class="menu_section">
                        <ul class="nav side-menu">
                           <li><a href="indexManager.jsp"><i class="fa fa-home"></i> Home </a></li>
                           <li><a href="leaveHistory.jsp"><i class="fa fa-desktop"></i> Leave History</a></li>
                           <li><a href="profile.jsp"><i class="fa fa-edit"></i> Profile </a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <!-- top navigation -->
            <div class="top_nav">
               <div class="nav_menu">
                  <nav>
                     <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                     </div>
                     <ul class="nav navbar-nav navbar-right">
                        <li class="">
                           <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                           <%= (session.getAttribute("name"))%>
                           <span class=" fa fa-angle-down"></span>
                           </a>
                           <ul class="dropdown-menu dropdown-usermenu pull-right">
                              <li><a href="Login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                           </ul>
                        </li>
                     </ul>
                  </nav>
               </div>
            </div>
            <!-- page content -->
            <div class="right_col" role="main" style="min-height:562px;">
               <div class="">
				<div class="row top_tiles">
				  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="tile-stats">
					  <div class="icon"><i class="fa fa-hourglass"></i></div>
					  <div class="count"><%= ((Integer)(session.getAttribute("beginBalance"))) * 9%></div>
					  <h3>FY Begin balance</h3>
					</div>
				  </div>
				  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="tile-stats">
					  <div class="icon"><i class="fa fa-sort-amount-desc"></i></div>
					  <div class="count"><%= ((Integer)(session.getAttribute("hoursTaken"))) * 9 %></div>
					  <h3>FY Hours Taken</h3>
					</div>
				  </div>
				  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="tile-stats">
					  <div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
					  <div class="count"><%= ((Integer)(session.getAttribute("balance"))) * 9%></div>
					  <h3>Current Balance</h3>
					</div>
				  </div>
				</div>
                  <div class="page-title">
                     <div class="title_left">
                        <h3>Pending Requests</h3>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="x_panel">
                           <div class="x_content" 
                              style="padding-left: 0px;"
                              >
                              <div class="col-md-9 col-sm-12 col-xs-12">
                                 <div >
                                    <div style="dispay:none;visibility:hidden;">
                                       <input style="
                                          padding-top: 0px;
                                          border-top-width: 0px;
                                          padding-bottom: 0px;
                                          border-bottom-width: 0px;
                                          height: 1px;
                                          " type="text" id="min" name="min">
                                       <input style="
                                          padding-top: 0px;
                                          border-top-width: 0px;
                                          padding-bottom: 0px;
                                          border-bottom-width: 0px;
                                          height: 1px;
                                          " type="text" id="max" name="max">
                                    </div>
                                    <%
                                       int user_id = (Integer)session.getAttribute("user_id") ;
                                       Map<Integer,String> month = (Map<Integer,String>)(session.getAttribute("month"));
                                       Connection c1 = (Connection)request.getSession().getAttribute("connection");
                                       Statement st = c1.createStatement();
                                       ResultSet resultset;
                                       
                                       try
                                       {
                                       
                                       resultset = st
                                       .executeQuery("SELECT r.request_id,r.start_dt ,r.end_dt, r.comments "
                                       + "FROM  REQUEST r "
                                       + "WHERE r.user_id ='"
                                            + user_id + "' and r.request_status = 'pending'");
                                       
                                       String name="";
                                       
                                       if(resultset.next())
                                       {
                                       
                                       %>
                                    <iframe id="txtArea1" style="display:none"></iframe>
                                    <table id="myTable" class="table table-striped" >
                                       <thead>
                                          <tr style="height: 23px;"  class="media event">
                                             <th style="vertical-align: top;" ><span>Request_ID</span></th>
                                             <th style="vertical-align: top;">From Date</th>
                                             <th style="vertical-align: top;">To Date</th>
                                             <th style="vertical-align: top;">Comments</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr style="height: 23px;"  class="media event">
                                             <td style="vertical-align: top;"><a target="_self" id ="employeeLink" href="javascript:void(0);" onclick="posturl(<%= resultset.getInt(1) %>);">
                                                <font color="blue"><u><%= resultset.getInt(1) %></u></a>
                                             </td>
                                             <td style="vertical-align: top;"><%= resultset.getString(2)%></td>
                                             <td style="vertical-align: top;"><%= resultset.getString(3)%></td>
                                             <td style="vertical-align: top;"><%= resultset.getString(4)%></td>
                                          </tr>
                                          <%}
                                             else
                                             {%>
                                          <span style="color: red"><font size="3"><b> No Requests.</b></font> </span>
                                          <%}
                                             while (resultset.next()) {
                                                          
                                             
                                             
                                                             %>
                                          <tr style="
                                             height: 23px;"  class="media event">
                                             <td style="vertical-align: top;"><a target="_self" id ="employeeLink" href="javascript:void(0);" onclick="posturl(<%= resultset.getInt(1) %>);">
                                                <font color="blue"><u><%= resultset.getInt(1) %></u></a>
                                             </td>
                                             <td style="vertical-align: top;"><%= resultset.getString(2)%></td>
                                             <td style="vertical-align: top;"><%= resultset.getString(3)%></td>
                                             <td style="vertical-align: top;"><%= resultset.getString(4)%></td>
                                          </tr>
                                          <% }
                                             }
                                             catch(Exception e)
                                             {
                                             e.printStackTrace();
                                             }%>
                                       </tbody>
                                    </table>
                                    <script language="javascript" type="text/javascript">
                                       //<![CDATA[
                                        var myTable_Props =  {
                                              col_0: "none",
                                              on_change: true,
                                              col_5: "none",
                                              display_all_text: " [ Show all ] ",
                                              sort_select: true
                                             };
                                        setFilterGrid( "myTable",myTable_Props );
                                       //]]>
                                    </script>
                                    <div>
                                       </br>
                                       <table border="0" cellspacing="5" cellpadding="5" style="dispay:none;">
                                          <tbody>
                                             <tr>
                                                <td style="
                                                   padding-right: 10px;">Filter by Year</td>
                                                <td><input type="text" id="year" name="year"></td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                    </br>
                                    
                                 </div>
                              </div>
                              <!--   acordion end -->
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row" >
                     <div class="col-md-12">
                     </div>
                  </div>
               </div>
            </div>
            <!-- /page content -->
            <!-- footer content -->
            <footer>
               <div class="pull-right">
               </div>
               <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
         </div>
      </div>
      <!-- jQuery -->
      <!--  <script src="js/jquery-1.9.1.min.js"></script> -->
      <!-- Bootstrap -->
      <!--  <script src="js/bootstrap.min.js"></script> -->
      <!-- Custom Theme Scripts -->
      <script src="js/custom.min.js"></script>
      <script>
         $(document).ready(function(){
          var date_input=$('input[name="to"]'); //our date input has the name "date"
          var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
          date_input.datepicker({
           format: 'mm/dd/yyyy',
           container: container,
           todayHighlight: true,
           autoclose: true,
          })
         })
         
         $(document).ready(function(){
          var date_input=$('input[name="from"]'); //our date input has the name "date"
          var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
          date_input.datepicker({
           format: 'mm/dd/yyyy',
           container: container,
           todayHighlight: true,
           autoclose: true,
          })
         })
      </script>
   </body>
</html>