package com.istarindia.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istarindia.apps.dao.DBUTILS;
import com.istarindia.apps.services.controllers.IStarBaseServelet;


@WebServlet("/trainer")
public class TrainerController extends IStarBaseServelet {
	private static final long serialVersionUID = 1L;
       
    
    public TrainerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		printParams(request);
		

		DBUTILS db = new DBUTILS();
		
		if(request.getParameter("add_assessment")!=null){
			System.err.println("dsdvcsdvcsdvdsvc");
			String session_id ="";
			int trainer_id = Integer.parseInt(request.getParameter("trainer_id"));
			session_id = request.getParameter("session_id");
            if(!session_id.equalsIgnoreCase("")){
    			 
    			 
    			 
    			 String[] session_ids =session_id.split(",");
    			
    			for(String sId:session_ids){  
    				
    				String ssqql = "SELECT 	assessment. ID as assessment_id, assessment.assessmentdurationminutes as assessment_min FROM 	cmsession, 	lesson, 	assessment WHERE 	lesson.session_id = cmsession. ID AND assessment.lesson_id = lesson. ID AND lesson.dtype = 'ASSESSMENT' AND cmsession. ID ="+sId;
    				System.err.println(ssqql);
    				List<HashMap<String, Object>> data = db.executeQuery(ssqql);
    				 if (data.size() > 0) {
    		     		  for (HashMap<String, Object> row : data) {
    		     			  
    		     			int assessment_id = (int) row.get("assessment_id");
    		     			int assessment_min = (int) row.get("assessment_min");
    		     			
    		     			String sss = "SELECT CAST(count(*) as INTEGER)  FROM student_assessment WHERE student_id = "+trainer_id+" AND assessment_id ="+assessment_id;
    		     			 System.err.println(sss);
    		     			List<HashMap<String, Object>> data1 = db.executeQuery(sss);
    	    				 if (data1.size() > 0) {
    	    					 
    	    					 if((int)data1.get(0).get("count") == 0){
    	    	    					
    	    						 String sqqql ="INSERT INTO trainer_assessment ( 	ID, 	trainer_id, 	created_at, 	eventminute, 	eventhour, 	status, 	assessment_id ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM trainer_assessment), 		"+trainer_id+", 		now(), 		"+assessment_min+", 		0, 		'SCHEDULED', 		"+assessment_id+" 	);";


        		        			 System.err.println(sqqql);
        		    	    		 db.executeUpdate(sqqql);
    	    	    				}
    		     			  
    		    				
    	    				 }
    		     		  }
    		     	 }
    			
    			
    			}  
    			 
    		 }
			
		}
		
		else	if(request.getParameter("assessment_status")!=null){
			
			int assessment_id = Integer.parseInt(request.getParameter("assessment_id")) ;
			int trainer_id = Integer.parseInt( request.getParameter("trainer_id"));
			
			
			String sql ="UPDATE PUBLIC .trainer_assessment SET status = 'ATTENDED' WHERE 	trainer_id = "+trainer_id+" AND assessment_id ="+assessment_id;
			 System.err.println(sql);
  			 db.executeUpdate(sql);
			
		}else{
			
			String selected_ans =request.getParameter("selected_ans");
			String option_num =request.getParameter("option_num");
			int assessment_id = Integer.parseInt(request.getParameter("assessment_id")) ;
			int question_id = Integer.parseInt(request.getParameter("question_id")) ;
			int trainer_id = Integer.parseInt( request.getParameter("trainer_id"));
			
			boolean correct = false;
			boolean option1= false;
			boolean option2= false;
			boolean option3= false;
			boolean option4= false;
			boolean option5= false;
			
			if(selected_ans.equalsIgnoreCase("1")){
				
				correct = true;
			}
			
			if(option_num.equalsIgnoreCase("option_1")){
				option1= true;
			}else if(option_num.equalsIgnoreCase("option_2")){
				option2= true;
			}else if(option_num.equalsIgnoreCase("option_3")){
				option3= true;
			}else if(option_num.equalsIgnoreCase("option_4")){
				option4= true;
			}else if(option_num.equalsIgnoreCase("option_5")){
				option5= true;
			}
			
			
			String ssql = "SELECT CAST (count(*) as INTEGER) FROM student_assessment WHERE student_id ="+trainer_id+" AND assessment_id ="+assessment_id+" AND question_id = "+question_id;
			List<HashMap<String, Object>> data2 = db.executeQuery(ssql);
			 if (data2.size() > 0) {
		      		
		      		int count =  (int)data2.get(0).get("count");
		      		if(count==0){
		      			 // "INSERT INTO master_trainer_assessment ( 	ID, 	correct, 	option1, 	option2, 	option3, 	option4, 	option5, 	trainer_id, 	assessment_id, 	question_id ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM master_trainer_assessment), 		'"+correct+"', 		'"+option1+"', 		'"+option2+"', 		'"+option3+"', 		'"+option4+"', 		'"+option5+"', 		"+trainer_id+", 		"+assessment_id+", 		"+question_id+" 	);";
		      			String sql ="INSERT INTO student_assessment ( 	ID, 	correct, 	option1, 	option2, 	option3, 	option4, 	option5, 	student_id, 	assessment_id, 	question_id, 	country_id, 	organization_id, 	batch_group_id, 	time_taken ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM student_assessment), 		'"+correct+"', 		'"+option1+"', 		'"+option2+"', 		'"+option3+"', 		'"+option4+"', 		'"+option5+"', 		"+trainer_id+", 		"+assessment_id+", 		"+question_id+", 		NULL, 		NULL, 		NULL, 		'60' 	); ";
		      			 System.err.println(sql);
		      			 db.executeUpdate(sql);
		      		
		      		}
		      	  }
		}
		
		
		
		
		 
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
