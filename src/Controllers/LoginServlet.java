package Controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDAO;
import VO.LoginVO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginVO loginVo = new LoginVO();
		loginVo.setUserName(request.getParameter("username"));
		loginVo.setPassword(request.getParameter("passwd"));
		
		Statement stat = null;
		int result = 0;
		int result1=0;
		String query="insert into Emp_Login_History (UserName,Emp_Id,Logout_flag) values ('"+loginVo.getUserName()+"',(select Emp_Id from Emp_Login_Master where UserName='"+loginVo.getUserName()+"'),0)";
		System.out.println(query);
		LoginDAO ld = new LoginDAO();
		RequestDispatcher rd;
		
		String action="";
		String username ="";
		if (request.getParameter("action")==null ){
		}else{
			action = request.getParameter("action");
			if(request.getParameter("username")!=null){
				username = request.getParameter("username");
			}
		}
		
		if(action.equalsIgnoreCase("logout")){
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");
			Date dateobj = new Date();
			
			String time = df.format(dateobj);
			
			String logoutquery = "WITH q AS (select top 1 * from Emp_Login_History where UserName='"+username+"' order by Login_Time DESC)update q set Logout_flag=1, Logout_Time='"+time+"'";
			System.out.println(logoutquery);
			try {
				stat = ld.makeConnection().createStatement();
				result1 = stat.executeUpdate(logoutquery);
				if(result1!=0){
					HttpSession session = request.getSession(true);
	    			session.removeAttribute("name");   
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
		
		int errorCode = ld.checkUserDetails(loginVo);
		System.out.println(errorCode);
		if(errorCode!=0)
	       {
			String msg = "";
	    	   if(errorCode==1){
	    			String name="";
	    			HttpSession session = request.getSession(true);
	    			name = (String)session.getAttribute("name");
	    			if(name ==null){
	    				session.setAttribute("name", loginVo.getUserName());  
	    				System.out.println((String)session.getAttribute("name"));
	    			try {
	    				stat = ld.makeConnection().createStatement();
	    			} catch (SQLException e) {
	    				// TODO Auto-generated catch block
	    				e.printStackTrace();
	    			}
	    			
	    			try {
	    				String query1 = "select top 1 * from Emp_Login_History where UserName='"+loginVo.getUserName()+"' order by Logout_Time DESC";
	    				System.out.println(query1);
	    				ResultSet rs = stat.executeQuery(query1);
	    				String time= "";
	    				while(rs.next()){
	    					time = rs.getString("logout_time");
	    				}
	    				if(!time.equalsIgnoreCase("")){
	    					request.setAttribute("time", time);
	    					String sessiontime = (String) session.getAttribute("time");
		    				if(sessiontime == null){
		    					session.setAttribute("time", "Last Login At "+time);
		    					System.out.println("Time : "+(String)session.getAttribute("time"));
		    				}
	    				}
	    				result = stat.executeUpdate(query);
	    				System.out.println(result);
	    				
	    			} catch (SQLException e) {
	    				// TODO Auto-generated catch block
	    				e.printStackTrace();
	    			}
	    			if(result !=0){
	    				request.setAttribute("user", loginVo.getUserName());
	    			}else{
	    				request.setAttribute("userName", "Login");
	    			}
	    			}
	    			 rd=request.getRequestDispatcher("/MainMaster.jsp");
		    			rd.forward(request, response);
	    	   }
	    	   else if(errorCode==2){
	    		   msg = "Invalid User Name or Password";
	    		   request.setAttribute("error", msg);
	    	   }
	    	   else if(errorCode==5) {
	    		   msg = "There is something wrong with the application. Please contact Administrator";
	    		   request.setAttribute("error", msg);
	    	   }
	       }
		rd=request.getRequestDispatcher("/login.jsp");
		rd.include(request, response);
		
		}
		
		
	}

}
