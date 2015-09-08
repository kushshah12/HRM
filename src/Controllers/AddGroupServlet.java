package Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GroupDAO;
import VO.GroupVO;

/**
 * Servlet implementation class AddGroupServlet
 */
public class AddGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGroupServlet() {
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
		
		String save = "";
		int ids = 0;
		GroupDAO data = new GroupDAO();
		GroupVO vo = new GroupVO();
		vo.setGroupname(request.getParameter("groupName"));
		vo.setCreatedBy("kush");
		vo.setUpdatedBy("kush");
		int result1= 0;
		
		System.out.println();
		try{
			save = request.getParameter("save");
			System.out.println(save);
		}catch(Exception e){
			save = "";
		}
		
		try{
			ids = Integer.parseInt(request.getParameter("id"));
		}catch(Exception e){
			ids = 0;
		}
		
		if (save != null && save.equals("add")){
			System.out.println(save);
			result1 = data.addZoneData(vo);	
		}
		
		else if(save != null && save.equals("edit")){
			if(ids!=0){
				vo.setGroupid(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession(true);
    			String name = (String)session.getAttribute("name");
				vo.setUpdatedBy(name);
			}
			result1 = data.editZone(vo);
			
		}
		 PrintWriter out = response.getWriter();
		if(result1!=0){
			out.println("<script type=\"text/javascript\">$(function () { $(document).ready(function(){alert('Data Saved Succesfully')});});</script>");
			response.sendRedirect("/HumanResource/GroupMaster.jsp");
			 
		}
		else{
			out.println("<script type=\"text/javascript\">$(function () { $(document).ready(function(){alert('Data was not Saved Succesfully')});});</script>");
			response.sendRedirect("/HumanResource/GroupMaster.jsp");
		}
	}
		
	}

