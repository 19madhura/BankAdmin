package com.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class OpenAccount
 */
public class OpenAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int accno=Integer.parseInt(request.getParameter("accno"));
		String accnm=request.getParameter("accnm");
		String acctype=request.getParameter("acctype");
		int balance=Integer.parseInt(request.getParameter("balance"));
		
		Connection con;
		PreparedStatement pst;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bwo3i3mcawqzqgcic8me-mysql.services.clever-cloud.com:3306/bwo3i3mcawqzqgcic8me?user=usd0e32pvbyxjjyk&password=vQ1rZ5D4xiF5qRYSWM7t");
			pst=con.prepareStatement("insert into accounts values(?,?,?,?)");
		
		   pst.setInt(1,accno);
		   pst.setString(2, accnm);
		   pst.setString(3,acctype);
		   pst.setInt(4, balance);
		   
		   pst.executeUpdate();
		   con.close();
		   System.out.println("New Account Created Successfully");
		   response.sendRedirect("AccOpenSuccess.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("AccOpenFail.jsp");
		}
		
		
		
	}

}
