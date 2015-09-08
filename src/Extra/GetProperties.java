package Extra;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class GetProperties {

	public static Properties getPropertiesValues(String fileName){
		Properties properties = null;
		try {
			FileInputStream fileInput = new FileInputStream(new File(fileName));
			properties = new Properties();
			properties.load(fileInput);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return properties;
	}
}
