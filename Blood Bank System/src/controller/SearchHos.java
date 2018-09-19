package controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchHos
 */
@WebServlet("/SearchHos")
public class SearchHos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i=0;
		String loc=(String)request.getParameter("loc");
		String Blood=(String)request.getParameter("Blood");
		System.out.println("in search loc= "+loc);
		System.out.println("in search Blood= "+Blood);
		
		java.sql.Connection con=model.DBConnection.getConnection();
		try{
			RequestDispatcher rd=request.getRequestDispatcher("BloodBankSearch.jsp");
			System.out.println("in search loc= "+loc);
			System.out.println("in search Blood= "+Blood);
			
			request.setAttribute("loc", loc);
			request.setAttribute("Blood", Blood);
			rd.forward(request, response);
		}
		catch(Exception e){
			System.out.println(e);
			RequestDispatcher rd=request.getRequestDispatcher("bb.jsp");
			request.setAttribute("error", "Error:"+e);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
