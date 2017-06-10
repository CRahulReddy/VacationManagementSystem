import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.Test;

public class FetchDataTest {

	@Test
	public void testGetAllREQUESTs() {
		Calendar nowDt = Calendar.getInstance();
		String startDt = new SimpleDateFormat("MM/dd/yyyy").format(nowDt.getTime());
		nowDt.add(Calendar.DATE, 3);
		String endDt = new SimpleDateFormat("MM/dd/yyyy").format(nowDt.getTime());
		FetchData fetch = new FetchData();
		fetch.getAllREQUESTs(startDt, endDt);
	}

}
