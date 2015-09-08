package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.HomeGroupMasterDAO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class HomeGroupMasterServlet
 */
public class HomeGroupMasterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeGroupMasterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HomeGroupMasterDAO data = new HomeGroupMasterDAO();
		ResultSet allData = data.getGroups();
		ArrayList list = new ArrayList();
		try {
			while (allData.next()){
				JsonObject json = new JsonObject();
				json.addProperty("groupid", allData.getString("groupid"));
				json.addProperty("groupName", allData.getString("groupName"));
				ArrayList list1 = new ArrayList();
				ResultSet allData1 = data.getCompanies(allData.getString("groupid"));
				while (allData1.next()){
					JsonObject json1 = new JsonObject();
					json1.addProperty("companyid", allData1.getString("companyid"));
					json1.addProperty("companyName", allData1.getString("companyName"));
					ArrayList list2 = new ArrayList();
					ResultSet allData2 = data.getProjects(allData.getString("groupid"), allData1.getString("companyid"));
					while (allData2.next()){
						JsonObject json2 = new JsonObject();
						json2.addProperty("projectid", allData2.getString("projectid"));
						json2.addProperty("projectName", allData2.getString("projectName"));
						list2.add(json2);
					}
					json1.addProperty("projects", list2.toString());
					list1.add(json1.toString().replace("\\", ""));
				}
				json.addProperty("companies", list1.toString());
				list.add(json.toString().replace("\\", ""));
			}
			
			System.out.println(list.toString().length());
			System.out.println(list.get(0).toString().replace("\"[", "[").replace("]\"", "]"));
			//System.out.println(list.get(0).toString());
			
			response.setContentType("application/json");
			//response.getWriter().write(list.toString());
			response.getWriter().write(list.toString().replace("\"[", "[").replace("]\"", "]"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
