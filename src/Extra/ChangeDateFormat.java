package Extra;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChangeDateFormat {
	public String changeDateFormat1(String date){
		Date date2 = null;
		String newDateString = null;
		try{
			SimpleDateFormat df = new SimpleDateFormat("dd-mm-yyyy");
			Date date1 = df.parse(date);
			df.applyPattern("yyyy-mm-dd");
			newDateString = df.format(date1);
//			SimpleDateFormat df1 = new SimpleDateFormat("dd/mm/yyyy");
//			date2 = df.parse(newDateString);
		}catch(Exception e){
			e.printStackTrace();
		}
		return newDateString;
	}
}
