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
@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {
    public NoteEditServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer noteid = Integer.parseInt(request.getParameter("noteid"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean f = dao.PostUpdate(noteid, title, content);
            if (f) {
                HttpSession session = request.getSession();
                session.setAttribute("updateMsg", "Data Updated Successfully");
                response.sendRedirect("showNotes.jsp");
            } else {
                System.out.println("Error");
            }
        } catch (Exception var9) {
            var9.printStackTrace();
        }

    }
}
