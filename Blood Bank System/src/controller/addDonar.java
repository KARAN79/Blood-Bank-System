package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addDonar
 */
@WebServlet("/addDonar")
public class addDonar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDonar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int i=0;
		String dname=(String)request.getParameter("dname");
		String hosp=(String)request.getParameter("hosp");
		String addr=(String)request.getParameter("addr");
		String email=(String)request.getParameter("email");
		String bgroup=(String)request.getParameter("bgroup");
		
		java.sql.Connection con=model.DBConnection.getConnection();
		try{
			java.sql.PreparedStatement ps=con.prepareStatement("insert into ADDDONAR (DONAR,HOSPITAL,ADDRESS,EMAIL,BLOODGROUP) values(?,?,?,?,?)");
			ps.setString(1, dname);
			ps.setString(2, hosp);
			ps.setString(3, addr);
			ps.setString(4, email);
			ps.setString(5, bgroup);
			i=ps.executeUpdate();
			if(i==1){
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("adddonar", "one donar added");
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("errordonar", "donar not added");
				rd.forward(request, response);
			}
		}
		catch(Exception e){
			System.out.println(e);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			request.setAttribute("errordonar", "error occure  "+e);
			rd.forward(request, response);
		}
		System.out.println("con "+con);
		System.out.println("i="+i);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
