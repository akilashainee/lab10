package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/itemsAPI")
public class itemsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       Item itemObj = new Item();
   
       
    public itemsAPI() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = itemObj.insertItem(request.getParameter("itemCode"), 
				request.getParameter("itemName"), 
				request.getParameter("itemPrice"), 
				request.getParameter("itemDesc"));
		
				response.getWriter().write(output); 
	}

	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
	}


	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
}
