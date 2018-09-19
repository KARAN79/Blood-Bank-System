package model;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logic {
	
	public static boolean forward(String targetPage,HttpServletRequest request, HttpServletResponse response){
		try{
			request.setAttribute("errormsg", "invalied user name and password");
			RequestDispatcher rd=request.getRequestDispatcher("targetPage");
			rd.forward(request, response);
			return true;
		}
		catch(Exception e){
			return false;
		}
	}
	public static boolean check(String username, String psw) {
		// TODO Auto-generated method stub
		if(username.equals("Karan")&&psw.equals("12345")){
		return true;
	}
		return false;
	}
	
}
