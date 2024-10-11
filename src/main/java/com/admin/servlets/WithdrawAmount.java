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
 * Servlet implementation class WithdrawAmount
 */
public class WithdrawAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawAmount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int accno=Integer.parseInt(request.getParameter("accno"));
		float amount=Float.parseFloat(request.getParameter("amount"));
		
		Connection con;
		PreparedStatement pst;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bwo3i3mcawqzqgcic8me-mysql.services.clever-cloud.com:3306/bwo3i3mcawqzqgcic8me?user=usd0e32pvbyxjjyk&password=vQ1rZ5D4xiF5qRYSWM7t");
            pst=con.prepareStatement("update accounts set balance=balance-? where accno=?");
            
            pst.setFloat(1, amount);
            pst.setInt(2, accno);
            
           int cnt= pst.executeUpdate();
           
           if(cnt==1)
           {
        	   response.sendRedirect("TransactionSuccess.jsp");
           }
           else
           {
        	   response.sendRedirect("TransactionFailed.jsp");
           }
           con.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
