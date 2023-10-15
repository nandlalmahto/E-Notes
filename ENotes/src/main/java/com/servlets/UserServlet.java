package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name= request.getParameter("username");
		String email= request.getParameter("useremail");
		String password= request.getParameter("userpassword");
		
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		boolean f = dao.addUser(us);
		HttpSession session;
		
		if(f) {
			session = request.getSession();
			session.setAttribute("reg-success", "Registration Successful");
			response.sendRedirect("register.jsp");
		}
		else {
			session = request.getSession();
			session.setAttribute("reg-error", "Something wrong on server..");
			response.sendRedirect("register.jsp");
		}
	}

}
