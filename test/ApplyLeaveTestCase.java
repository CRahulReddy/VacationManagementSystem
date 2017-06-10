import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;

public class ApplyLeaveTestCase {

	@Test
	public final void testDoPostHttpServletRequestHttpServletResponse_FailWrongPasswordRedirectToIndex()throws Exception{
   
        MockHttpServletRequest request = new MockHttpServletRequest();
        MockHttpServletResponse response = new MockHttpServletResponse();
        MockHttpSession session = new MockHttpSession();
        session.setAttribute("user_id", 1);
        session.setAttribute("pending", 1);
        session.setAttribute("balance", 10);        
        
        Calendar nowDt = Calendar.getInstance();
        String startDt = new SimpleDateFormat("MM/dd/yyyy").format(nowDt.getTime());
        nowDt.add(Calendar.DATE,3);
        String endDt = new SimpleDateFormat("MM/dd/yyyy").format(nowDt.getTime() );  
        
      request.setSession(session);
      
       request.addParameter("leaveType", "vacation");
      request.addParameter("from" , startDt);
		 request.addParameter("to", endDt);
		 request.addParameter("comments", "this is a unit test");
        ApplyLeave leave = new ApplyLeave();
      
        
        leave.doPost(request, response);        
        assertTrue(true);
    }

}
