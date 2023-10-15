package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DBConnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	public deleteServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Integer noteid = Integer.parseInt(request.getParameter("note_id").trim());
		PostDAO dao = new PostDAO(DBConnect.getConn());
		boolean f = dao.DeleteNotes(noteid);

		HttpSession session = null;

		if (f) {
			session = request.getSession();
			session.setAttribute("updateMsg", "Data Deleted Succssfully.");
			response.sendRedirect("showNotes.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("DeleteMsgError", "Something wrong on server...");
			response.sendRedirect("showNotes.jsp");
		}

	}
}