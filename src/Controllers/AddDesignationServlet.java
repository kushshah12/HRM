package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DesignationMainDAO;

/**
 * Servlet implementation class AddDesignationServlet
 */
public class AddDesignationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDesignationServlet() {
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
		
		DesignationMainDAO data=new DesignationMainDAO();
		
		if(request.getParameter("saveaction").equals("add"))
		{
			boolean res=data.insertDesignation(Integer.parseInt(request.getParameter("groupname")), Integer.parseInt(request.getParameter("companyname")), request.getParameter("designationname"), request.getParameter("rolesresp"));
			System.out.println(res);
		}
		else if(request.getParameter("saveaction").equals("edit"))
		{
			boolean res=data.updateDesignation(Integer.parseInt(request.getParameter("desgnid")),Integer.parseInt(request.getParameter("groupname")), Integer.parseInt(request.getParameter("companyname")), request.getParameter("designationname"), request.getParameter("rolesresp"));
			System.out.println(res);
		}
		
		
		
	}

}
