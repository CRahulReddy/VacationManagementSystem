import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest; 
import org.springframework.mock.web.MockHttpServletResponse; 
import org.springframework.mock.web.MockHttpSession; 


public class LoginTest {

	
	
	@Test
	public final void testDoPostHttpServletRequestHttpServletResponse_PassRedirectToIndex()throws Exception{
   
        MockHttpServletRequest request = new MockHttpServletRequest();
        MockHttpServletResponse response = new MockHttpServletResponse();
        request.addParameter("screenName", "shyam");
        request.addParameter("password", "shyam");
        Login login = new Login();
      
        login.doPost(request, response);
        System.out.println( "Redirect "+response.getRedirectedUrl());
        assertTrue(response.getRedirectedUrl().equals("index.jsp"));
    }
	
	@Test
	public final void testDoPostHttpServletRequestHttpServletResponse_FailWrongPasswordRedirectToIndex()throws Exception{
   
        MockHttpServletRequest request = new MockHttpServletRequest();
        MockHttpServletResponse response = new MockHttpServletResponse();
        request.addParameter("screenName", "shyam");
        request.addParameter("password", "wrongPassword");
        Login login = new Login();
      
        login.doPost(request, response);        
        assertTrue(response.getRedirectedUrl().equals("LoginFailed.jsp"));
    }

}
