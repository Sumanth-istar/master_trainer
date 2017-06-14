package com.istarindia.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istarindia.apps.dao.DBUTILS;
import com.istarindia.apps.services.controllers.IStarBaseServelet;

/**
 * Servlet implementation class CoordinatorController
 */
@WebServlet("/coordinator")
public class CoordinatorController extends IStarBaseServelet {
	private static final long serialVersionUID = 1L;
       
   
    public CoordinatorController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		printParams(request);
		
		
		/*Param -> key : Value ->pre_l1
		Param -> inputData : Value ->7
		Param -> session_id : Value ->1792
		Param -> pincode_id : Value ->155298*/
		
		DBUTILS db = new DBUTILS();
		
		if(request.getParameter("key").equalsIgnoreCase("pre_l1")){
			
			System.out.println(">>>>>>>>>>>>222222>>>>>>>>>>>>>>>>>>>");
		    int inputData = request.getParameter("inputData")!=""?Integer.parseInt(request.getParameter("inputData")):0;
		    int session_id = request.getParameter("session_id")!=""?Integer.parseInt(request.getParameter("session_id")):0;
		    String city = request.getParameter("city")!=""?request.getParameter("city"):"";
		    city  = city.substring(0, 1).toUpperCase() + city.substring(1);
		    
		    
		   
		    	
		    	String ssql = "DELETE FROM pre_l1_info WHERE city ='"+city+"' AND session_id ="+session_id;
		    	System.out.println(ssql);
		    	db.executeUpdate(ssql);
		    	
		    	String sql ="INSERT INTO pre_l1_info (id, city, session_id,pre_l1_data) VALUES ((SELECT COALESCE(max(id)+1,1) FROM pre_l1_info), '"+city+"', "+session_id+","+inputData+");";
		    	System.out.println(sql);
		    	db.executeUpdate(sql);
		   
			
			
		}
if(request.getParameter("key").equalsIgnoreCase("addPreData")){
			
			System.out.println(">>>>>>>>>>>>>>>>11111>>>>>>>>>>>>>>>");
		    int calls_made = request.getParameter("calls_made")!=""?Integer.parseInt(request.getParameter("calls_made")):0;
		    int session_id = request.getParameter("session_id")!=""?Integer.parseInt(request.getParameter("session_id")):0;
		    String place_holder = request.getParameter("place_holder")!=""?request.getParameter("place_holder"):"";
		     place_holder  = place_holder.substring(0, 1).toUpperCase() + place_holder.substring(1);
		    
		    
		    
		   
		    	
		    	String ssql = "DELETE FROM pre_l1_info WHERE city ='"+place_holder+"' AND session_id ="+session_id;
		    	System.out.println(ssql);
		    	db.executeUpdate(ssql);
		    	
		    	String sql ="INSERT INTO pre_l1_info (id, city, session_id,pre_l1_data) VALUES ((SELECT COALESCE(max(id)+1,1) FROM pre_l1_info), '"+place_holder+"', "+session_id+","+calls_made+");";
		    	System.out.println(sql);
		    	db.executeUpdate(sql);
		   
			
			
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
