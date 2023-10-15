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

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("useremail");
		String password = request.getParameter("userpassword");
		
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		UserDetails user = dao.loginUser(us);
		HttpSession session;
		
		if(user != null) {
			session = request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("home.jsp");
		}
		else {
			session = request.getSession();
			session.setAttribute("login-error", "Invalid username or password..");
			response.sendRedirect("login.jsp");
		}
	}

}
