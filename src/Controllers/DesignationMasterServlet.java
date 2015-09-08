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
import DAO.DesignationMainDAO;

/**
 * Servlet implementation class DesignationMasterServlet
 */
public class DesignationMasterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DesignationMasterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		DesignationMainDAO data = new DesignationMainDAO();

		System.out.println("DesignationMasterServlet.."+request.getParameter("action"));
		
		if (request.getParameter("action") == null) {
			ResultSet allData = data.getDesignationdata();
			ArrayList list = new ArrayList();
			try {
				while (allData.next()) {
					JsonObject json = new JsonObject();
					json.addProperty("designationid",
							allData.getString("designationid"));
					json.addProperty("groupname",
							allData.getString("groupname"));
					json.addProperty("companyName",
							allData.getString("companyname"));
					json.addProperty("designationName",
							allData.getString("designationname"));
					json.addProperty("role", allData.getString("roles"));

					list.add(json);
				}

				response.setContentType("application/json");
				// response.getWriter().write(list.toString());
				response.getWriter().write(list.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			if (request.getParameter("action").equals("getdata")) {
				ResultSet allData = data.getDesignationinfo(Integer.parseInt(request.getParameter("id")));
				ArrayList list = new ArrayList();
				try {
					while (allData.next()) {
						JsonObject json = new JsonObject();
						json.addProperty("groupname",
								allData.getString("groupid"));
						json.addProperty("companyname",
								allData.getString("companyid"));
						json.addProperty("designationname",
								allData.getString("designationname"));
						json.addProperty("role", allData.getString("roles"));

						list.add(json);
					}

					response.setContentType("application/json");
					// response.getWriter().write(list.toString());
					response.getWriter().write(list.toString());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (request.getParameter("action").equals("delete")) {
				boolean alldata = data.deleteDesignation(Integer
						.parseInt(request.getParameter("id")));
				response.getWriter().print(alldata);

			}
		}

	}

}
