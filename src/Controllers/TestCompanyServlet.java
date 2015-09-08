package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import DAO.TestCompanyDAO;

/**
 * Servlet implementation class TestCompanyServlet
 */
public class TestCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestCompanyServlet() {
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
		
		TestCompanyDAO data=new TestCompanyDAO();
		
		ResultSet allData = data.getCompanydata(Integer.parseInt(request.getParameter("groupid")));
		   ArrayList list = new ArrayList();
		   try {
		    while (allData.next()) {
		     JsonObject json = new JsonObject();
		     json.addProperty("companyid",
		       allData.getString("companyid"));
		     json.addProperty("companyname",
		       allData.getString("companyName"));

		     list.add(json);
		    }

		    response.setContentType("application/json");
		    // response.getWriter().write(list.toString());
		    response.getWriter().write(list.toString());
		   } catch (SQLException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		
	}

}
