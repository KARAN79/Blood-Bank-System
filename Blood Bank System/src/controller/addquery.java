package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addquery
 */
@WebServlet("/addquery")
public class addquery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addquery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		String name=(String)request.getParameter("name");
		String query=(String)request.getParameter("query");
		String rating=(String)request.getParameter("rating");
		int i=0;
		java.sql.Connection con=model.DBConnection.getConnection();
		try{
			java.sql.PreparedStatement ps=con.prepareStatement("insert into QUERIES (NAME,QUERY,RATING) values(?,?,?)");
			ps.setString(1, name);
			ps.setString(2, query);
			ps.setString(3, rating);
			i=ps.executeUpdate();
			if(i==1){
				RequestDispatcher rd=request.getRequestDispatcher("query.jsp");
				request.setAttribute("query", "one query added");
				rd.forward(request, response);
			}
		}
		catch(Exception e){
			System.out.println(e);
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
