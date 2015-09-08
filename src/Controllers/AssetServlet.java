package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AssetDAO;
import DAO.QualificationDAO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class AssetServlet
 */
public class AssetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssetServlet() {
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
		
		AssetDAO data = new AssetDAO();
		int result = 0;
		ResultSet allData;
		ArrayList list = new ArrayList();
		
		String save = "";
		save = request.getParameter("group");
		
		if(save==null){
			save="";
		}
		if(save.equalsIgnoreCase("group")){
			
			String action1 = "";
			action1 = request.getParameter("action");
			
			if(action1==null){
				action1="";
			}
			System.out.println("Action1: "+action1);
			if(action1.equalsIgnoreCase("")){
				String groupquery = "select groupname, groupid from GroupMaster where active=1 order by groupname ASC";
				allData = data.getData1(groupquery);
				ArrayList list1 = new ArrayList();
				try {
					while (allData.next()){
						JsonObject json = new JsonObject();
						json.addProperty("groupname", allData.getString("groupname"));
						json.addProperty("groupid", allData.getString("groupid"));
						list1.add(json);
					}
					response.setContentType("application/json");
					response.getWriter().write(list1.toString());;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
				}
			}else{
				
				String cityquery = "select companyName,companyid from companyMaster where "/*groupid = (select groupid from GroupMaster where groupname='"+action1+"') and*/ +"active=1 order by companyName ASC";
				System.out.println(cityquery);
				ResultSet allData1 = data.getData1(cityquery);
				ArrayList list1 = new ArrayList();
				try {
					while (allData1.next()){
						JsonObject json1 = new JsonObject();
						json1.addProperty("companyName", allData1.getString("companyName"));
						json1.addProperty("companyid", allData1.getString("companyid"));
						list1.add(json1);
					}
					response.setContentType("application/json");
					response.getWriter().write(list1.toString());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
			}
			}
		}
		else{
			try {
				allData = data.getData();
				while (allData.next()){
					JsonObject json = new JsonObject();
					json.addProperty("groupname", allData.getString("groupname"));
					json.addProperty("companyname", allData.getString("companyName"));
					json.addProperty("assetid", allData.getString("assetid"));
					json.addProperty("assetdes", allData.getString("assetdes"));
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
				System.out.println();
			}else{
				action = request.getParameter("action");
			}
			System.out.println("Action : "+action);
			if (!action.equalsIgnoreCase("")){
				if(action.equals("delete")){
					id = Integer.parseInt(request.getParameter("id"));
					System.out.println(id);
					AssetDAO dao = new AssetDAO();
					result = dao.deleteZone(id);
					System.out.println(result);
				}
			}
			if(result != 0){
				response.sendRedirect("/AssetMaster.jsp");
				//getServletContext().getRequestDispatcher("citystate.jsp").forward(request, response); 
				/*response.sendRedirect("eSO/citystate.jsp");*/
			}
			
		}
		
	}

}
