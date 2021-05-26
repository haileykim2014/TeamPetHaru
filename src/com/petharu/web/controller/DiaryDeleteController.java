package com.petharu.web.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petharu.web.service.JDBCMyhomeService;
import com.petharu.web.service.MyhomeService;


@WebServlet("/diary/del")
public class DiaryDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		MyhomeService service = new JDBCMyhomeService();
		
		try {
			service.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		resp.sendRedirect("/myhome/list.html");
	}
}
