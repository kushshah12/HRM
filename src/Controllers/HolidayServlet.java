package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.HolidayDAO;
import Extra.ChangeDateFormat;
import VO.HolidayVO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class HolidayServlet
 */
public class HolidayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HolidayServlet() {
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
		HolidayDAO hdao = new HolidayDAO();
		ResultSet rs = null;
		String action = request.getParameter("action");
		String action1 = request.getParameter("action1");
		System.out.println("action"+action);
		System.out.println("action1"+action1);
		if(action1!=null){
			if(action1 != null && action1.equals("editsave")){
				System.out.println("editsave");
				System.out.println("Financial Year:"+request.getParameter("fyear"));
				HolidayVO hvo = new HolidayVO();
				try{
					hvo.setId(Integer.parseInt(request.getParameter("id")));
					ChangeDateFormat cdf = new ChangeDateFormat();
					String date = cdf.changeDateFormat1(request.getParameter("date"));
					hvo.setDate(date);
					System.out.println(hvo.getDate());
					hvo.setLeaveCastegory(request.getParameter("leavecat"));
					hvo.setLeaveName(request.getParameter("leavename"));
					hvo.setRemark(request.getParameter("remarks"));
					hvo.setFyear(request.getParameter("fyear"));
					int i = hdao.editHolidayDetails(hvo);
					if(i==1){
						System.out.println("Data edited");
					}else{
						System.out.println("Data not edited");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			else if(action1!=null && action1.equals("save")){
				System.out.println("save");
				HolidayVO hvo = new HolidayVO();
				try{
					ChangeDateFormat cdf = new ChangeDateFormat();
					String date = cdf.changeDateFormat1(request.getParameter("date"));
					System.out.println(date);
					hvo.setDate(date);
					hvo.setLeaveCastegory(request.getParameter("leavecat"));
					hvo.setLeaveName(request.getParameter("leavename"));
					hvo.setRemark(request.getParameter("remarks"));
					hvo.setFyear(request.getParameter("fyear"));
					int res=hdao.addHoliday(hvo);
					if(res==1)
					{
						//request.setAttribute("msg", "Data added successfully.");
						PrintWriter writer=response.getWriter();
						writer.println("Data Added Successfully");
						request.getRequestDispatcher("LeaveMaster.jsp").include(request, response);
						
						
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		}
		if(action!=null){
			if(action!=null && action.equals("onload") ){
				System.out.println("onload");
				rs = hdao.getHolidays();
				ArrayList list = new ArrayList();
				
				try {
					while (rs.next()){
						JsonObject json = new JsonObject();
						json.addProperty("id", rs.getString("id"));
						json.addProperty("date1", rs.getString("H_Date"));
						json.addProperty("leaveCategory", rs.getString("leaveCategory"));
						json.addProperty("leaveName", rs.getString("leaveName"));
						json.addProperty("remark", rs.getString("remark"));
						json.addProperty("fname", rs.getString("FYEAR"));
						list.add(json);
					}			
					System.out.println(list.toString());
					response.setContentType("application/json");
					response.getWriter().write(list.toString());
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			else if(action!=null && action.equals("delete")){
				System.out.println("delete");
				int i = hdao.deleteHoliday(Integer.parseInt(request.getParameter("id")));
				if(i==1){
					System.out.println("Data deleted.");
				}else{
					System.out.println("Data not deleted");
				}
			}
			else if(action!=null && action.equals("edit")){
				System.out.println("edit");
				ResultSet rs1 = null;
				rs1 = hdao.editFetchData(Integer.parseInt(request.getParameter("id")));
				ArrayList list1 = new ArrayList();
				try {
					while (rs1.next()){
						JsonObject json1 = new JsonObject();
						json1.addProperty("id", rs1.getString("id"));
						json1.addProperty("date1", rs1.getString("H_Date"));
						json1.addProperty("leaveCategory", rs1.getString("leaveCategory"));
						json1.addProperty("leaveName", rs1.getString("leaveName"));
						json1.addProperty("remark", rs1.getString("remark"));
						json1.addProperty("fname", rs1.getString("FYEAR"));
						list1.add(json1);
					}			
					System.out.println(list1.toString());
					response.setContentType("application/json");
					response.getWriter().write(list1.toString());
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			else{
				System.out.println("non of the action is coming as defined");
			}
		}
		else{
			System.out.println("action is coming null");
		}
	}

}
