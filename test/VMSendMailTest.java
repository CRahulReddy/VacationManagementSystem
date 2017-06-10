import static org.junit.Assert.*;
import org.junit.Test;


public class VMSendMailTest {



	@Test
	public void testSendMail() throws Exception{
		VMSendMail mail = new VMSendMail();
	boolean sntMail=	mail.sendMail();
		assertTrue(sntMail);
	}

}
