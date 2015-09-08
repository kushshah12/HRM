package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmployeeTypeDAO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class GroupMasterServlet
 */
public class EmployeeTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeTypeServlet() {
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
		
		EmployeeTypeDAO data = new EmployeeTypeDAO();
		int result = 0;
		ResultSet allData = data.getData();
		ArrayList list = new ArrayList();
		
		try {
			while (allData.next()){
				JsonObject json = new JsonObject();
				json.addProperty("EmpTypeId", allData.getInt("Emp_Type_id"));
				json.addProperty("EmpTypeDes", allData.getString("Emp_Type_Des"));
				list.add(json);
			}
			response.setContentType("application/json");
			response.getWriter().write(list.toString());;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		String action = "";
		int id = 0;
		if (request.getParameter("action")==null){
			action="";
			System.out.println();
		}else{
			action = request.getParameter("action");
		}
		System.out.println("Action : "+action);
		if (!action.equalsIgnoreCase("")){
			if(action.equals("delete")){
				id = Integer.parseInt(request.getParameter("id"));
				System.out.println(id);
				EmployeeTypeDAO dao = new EmployeeTypeDAO();
				result = dao.deleteZone(id);
				System.out.println(result);
			}
		}
		if(result != 0){
			response.sendRedirect("/demo.jsp");
			//getServletContext().getRequestDispatcher("citystate.jsp").forward(request, response); 
			/*response.sendRedirect("eSO/citystate.jsp");*/
		}
		
	}
		
	}

