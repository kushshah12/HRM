package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DepartmentMainDAO;
import DAO.DesignationMainDAO;
import VO.DepartmentVO;

/**
 * Servlet implementation class AddDepartmentServlet
 */
public class AddDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDepartmentServlet() {
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
		
		DepartmentMainDAO data=new DepartmentMainDAO();
		
		DepartmentVO vo=new DepartmentVO();
		vo.setGroupid(Integer.parseInt(request.getParameter("groupname")));
		vo.setCompanyid(Integer.parseInt(request.getParameter("companyname")));
		vo.setDepartmentname(request.getParameter("deptname"));
		
		if(request.getParameter("saveaction").equals("add"))
		{
			
			boolean res=data.insertDepartment(vo);
			System.out.println(res);
		}
		else if(request.getParameter("saveaction").equals("edit"))
		{
			vo.setDepartmentid(Integer.parseInt(request.getParameter("deptid")));
			boolean res=data.updateDepartment(vo);
			System.out.println(res);
		}
		
		
	}

}
