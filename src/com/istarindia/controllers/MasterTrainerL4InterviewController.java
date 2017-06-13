package com.istarindia.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istarindia.apps.services.controllers.IStarBaseServelet;


@WebServlet("/master_mrainerl4_interview")
public class MasterTrainerL4InterviewController extends IStarBaseServelet {
	private static final long serialVersionUID = 1L;
       
   
    public MasterTrainerL4InterviewController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		printParams(request);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
