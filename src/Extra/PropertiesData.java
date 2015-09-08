package Extra;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesData {

	public static String getPropertiesValue(String fileName, String propertyName) throws IOException, FileNotFoundException{ 
		Properties prop = new Properties();

		InputStream inputStream = new Object() { }.getClass().getClassLoader().getResourceAsStream(fileName);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + fileName + "' not found in the classpath");
		}
	 
		String propertyValue = prop.getProperty(propertyName);
	return propertyValue;
}
}
