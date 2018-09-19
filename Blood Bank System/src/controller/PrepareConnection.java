package controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.sun.corba.se.pept.transport.Connection;

/**
 * Application Lifecycle Listener implementation class PrepareConnection
 *
 */
@WebListener
public class PrepareConnection implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public PrepareConnection() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	try{
    		ServletContext sc=arg0.getServletContext();
    		Connection con=(Connection)model.DBConnection.getConnection();
    		System.out.println(con);
    		sc.setAttribute("con", con);
    		
    	}
    	catch(Exception e){
    		System.out.println(e);
    	}
    }
	
}
