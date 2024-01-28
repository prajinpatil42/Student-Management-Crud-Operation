package com.coder.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coder.connection.DBConnect;
import com.coder.dao.StudentDAO;



@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		 
		StudentDAO dao = new StudentDAO(DBConnect.getConn()); 
		
		boolean f=dao.deleteStudent(id);
		
		
	HttpSession session=req.getSession();
		
		
		 
			if(f) {
				session.setAttribute("succMsg", "Student Details Delete successfully...!!");
				resp.sendRedirect("index.jsp");
				//System.out.println("Student Details submit successfully...!!");
			}else {
				
				session.setAttribute("errorMsg","something wrong on server");
				resp.sendRedirect("index.jsp");
				//System.out.println("something wrong on server");
			}
		 
		
	}

	
	
	
}
