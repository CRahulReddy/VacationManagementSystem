<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<script>

function ValidateEmail(inputText)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(inputText.match(mailformat))  
{  
/* document.form1.text1.focus();  */ 
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
/* document.form1.text1.focus();  */ 
return false;  
}  
} 

	function validate () {

		if ( document.getElementById( "screenName" ).value == "" || document.getElementById( "screenName" ).value == null ) {
			alert( "Please enter Email address" );
			return false;
		} else if (  !document.getElementById( "screenName" ).value== "admin" && !ValidateEmail(document.getElementById( "screenName" ).value))
			{
			return false;
			}
		
		else if ( document.getElementById( "password" ).value == "" || document.getElementById( "password" ).value == null ) {
			alert( "Please enter Password" );
			return false;
		} 
		else {
			document.forms[ 'authenticationEntryForm' ].submit();
			return true;
		}
	}
</script>

<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>Welcome to Vacation Management</title>

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<link href="css/styles-index.css" rel="stylesheet" type="text/css">
</head>
<body>

	<form name="clickLostPasswordForm" action="reterievePassword.jsp"
		method="post">
		<input type="hidden" name="clickLostPasswordEvent" value="1">
	</form>
	
	

<!-- 	<img id="ed-indexHeader" src="images/logo.gif" width="688" height="219"
		onclick="" title="Grade-Made Easy, Student Grading System"
		alt="Login Framework" style="width: 550px;
    padding-left: 50px;"> -->
    		<div style="
    margin-top: 100px;">
			<span style="color: red">Login Failed either ScreenName or
				Password is wrong</span>
		</div>
	<form id="authenticationEntryForm" name="authenticationEntryForm"
		action="login" method="post" >

		<div id="ed-indexContainer">

			<img src="images//accountIcon.gif" width="322" height="62"
				title="Are you Registered? Sign in to your account below."
				alt="Are you a Registered? Sign in to your account below.">
				<br/><br/><br/>
			<div class="ed-inputGroup screenname">
				<label for="screenName">UserName</label>
				<div class="ed-inputWrapper">
					<input type="text" id="screenName" name="screenName" tabindex="1">
				</div>
			</div>

			<div class="ed-inputGroup password">
				<label for="password">Password</label>
				<div class="ed-inputWrapper">
					<input type="password" id="password" name="password"
						maxlength="104" tabindex="2">
				</div>
				<a href="javascript:document.clickLostPasswordForm.submit()"
					class="forgot"><img src="images/greenArrow.gif" width="11"
					height="11" border="0" alt=""> Forgot password? </a>
			</div>

			<div class="ed-clearfix"></div>
			
					
            <div class="ed-clearfix"></div>
			<div role="button" aria-label="Sign In" id="btnSignIn"
				class="ed-signIn" tabindex="3">

				<table cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td></td>

							<td><a tabindex="-1" role="button" href="#"
								onclick="return validate()" id="signIn">Sign In</a></td>
							<td>
								<div class="ed-icon"></div>
							</td>
						</tr>
					</tbody>
				</table>
				</span>
			</div>

			<div id="ed-activateAccount">
			
				<img src="images/mouseIcon.gif" width="58" height="58" align="left"
					alt="">
				<h1>Sign Up</h1>
				<p>
					If you are not Registered, <a href="createAccount.jsp">Create
						account</a> here.
				</p>
			</div>
		</div>

		<div id="footer">
			<%@ include file="footer.jsp"%>
		</div>
	</form>

</body>
</html>