package Extra;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

public class CreateCityCode {

	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub
		
		String line = null;
		LinkedList<String> records = new LinkedList<String>();
		LinkedList<String> records2 = new LinkedList<String>();
		LinkedList<String> records3 = new LinkedList<String>();
		LinkedList<String> records1 = new LinkedList<String>();
		String csvsplit = ",";
		
		String filepath = new CreateCityCode().getClass().getClassLoader().getResource("resources/citystate.csv").getPath();
		
		BufferedReader bfr = new BufferedReader(new FileReader(filepath));
		
		try {
			while ((line = bfr.readLine()) != null)
			{
				String[] splitter = line.split(csvsplit); 
			    records.add(splitter[0]);
			    	records2.add(splitter[1]);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    // close the BufferedReader when we're done
		try {
			bfr.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for(int i=0;i<records.size(); i++){
			
			String cityname = records.get(i).toString().replaceAll("\\s+", "").replaceAll("\"", "").replaceAll("[-+.^:,']", "");
			String statename= records2.get(i).toString().replaceAll("\\s+", "").replaceAll("\"", "").replaceAll("[-+.^:,']", "");
			String ab = "";
			String st = "";
			try{
				ab = cityname.substring(0, 3);
				st = statename.substring(0, 6);
			}catch(Exception e){
				
			}
			//System.out.println("id = "+i+"  CityName : "+cityname + "   Code : "+ab+"  StateName : "+statename + "   Code : "+st);
			if(!records1.contains(ab)){
				records1.add(ab);
			}else{
				records1.add(ab+i);
			}
				records3.add(st);
		}
		
		String state="";
		String city = "";
	    File f = new File("./cityname.txt");

        BufferedWriter bfr1 = null;
		try {
			bfr1 = new BufferedWriter(new FileWriter(f,true));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		for(int i=0;i<records1.size(); i++){
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");
			Date dateobj = new Date();
			
			String time = df.format(dateobj);
			
			city = records2.get(i);
			try{
				if(!state.contains(records3.get(i)))
					state = records3.get(i);
			}catch(Exception e){
				
			}
			String finalstring = "('"+records1.get(i).toUpperCase()+"','"+records.get(i)+"','"+state.toUpperCase()+"','"+records2.get(i)+"','"+time+"'),\n"; 
	         System.out.println(finalstring); 

	              try {
					bfr1.append(finalstring);
					bfr1.flush();

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	              
		}
		try {
			bfr1.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
