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

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
font-family: Calibri;
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
font-family: Calibri;
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
font-family: Calibri;
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
font-family: Calibri;
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
font-family: Calibri;
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
font-family: Calibri;
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
font-family: Calibri;
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
                <h2><%= (session.getAttribute("name"))%></h2><%= (session.getAttribute("userType"))%>
    </center>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br /><br />
            <!-- sidebar menu -->
            <%
            int user_id = (Integer)session.getAttribute("user_id") ;
            Map<Integer,String> month = (Map<Integer,String>)(session.getAttribute("month"));
            Connection c1 = (Connection)request.getSession().getAttribute("connection");
            Statement st = c1.createStatement();
    ResultSet resultset;
    String address ="";
    int mobileNo = 000000000;
    String email="";
            try
            {
	    		resultset = st.executeQuery("SELECT address,cell_phone,email FROM EMPLOYEE WHERE user_id='" + user_id + "'");
				resultset.next() ;
		        address= resultset.getString(1);
		        mobileNo = resultset.getInt(2);
		        email= resultset.getString(3);
		        System.out.println("no: "+mobileNo);
            }
            catch(Exception e)
            {
            e.printStackTrace();
            }
            %>
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
           
                <ul class="nav side-menu">
                  <li><a href="index.jsp"><i class="fa fa-home"></i> Home </a></li>
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
        <div class="right_col" role="main">
          <div class="">
         
         
            <div class="clearfix"></div>
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
                <h3>My Profile</h3>
              </div>

           
            </div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="margin-bottom: 40px;">
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <ul class="list-unstyled user_data">
						<li><img alt="Image" src="/VM6363/file" width="200" height="300"  class="img-thumbnail"></li>
                      </ul>
					  <br />
                      <a href="editProfile.jsp" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i> Edit Profile</a>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                    	 <h3><%= (session.getAttribute("name"))%></h3>
	                     <ul class="list-unstyled user_data">
	                        <li><i class="fa fa-map-marker user-profile-icon"></i> <%= address %></li>
	                        <li><i class="fa fa-briefcase user-profile-icon"></i> <%= (session.getAttribute("userType"))%></li>
	                        <li><i class="fa fa-phone-square user-profile-icon"></i> <%= mobileNo %></li>
	                        <li class="m-top-xs"><i class="fa fa-external-link user-profile-icon"></i><%= email %></li>
	                     </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        </div>
        <!-- /page content -->
      </div>
    </div>
    <!-- jQuery -->
    <script src="js/jquery-1.9.1.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>

  </body>
</html>