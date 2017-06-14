package com.istarindia.controllers;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import com.istarindia.apps.dao.DBUTILS;
import com.istarindia.apps.services.controllers.IStarBaseServelet;


@WebServlet("/signup_form")
public class TrainerSignUpFormController extends IStarBaseServelet {
	private static final long serialVersionUID = 1L;
	
    public TrainerSignUpFormController() {
        super();
       
    }

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		printParams(request);
		DBUTILS db = new DBUTILS();
		DateFormat dateformatto = new SimpleDateFormat("yyyy-MM-dd");
	   DateFormat dateformatfrom = new SimpleDateFormat("dd/MM/yyyy");
		 String f_name = "";
		 String l_name = "";
		 String email = "";
		 String password = "";
		 String mobile = "";
		 String ug_degree = "";
		 String pg_degree = "";
		 String gender = "";
		 String dob = "";
		 String session_id = "";
		 String avaiable_time ="";
		 String experince_years="";
		 String experince_months="";
		 String teaching_address="";
		 String address_line1 = "";
		 String address_line2 = "";
		 int pincode =0;
		 boolean has_ug_degree = false;
		 boolean has_pg_degree = false;
		 
		
		 f_name = request.getParameter("f_name")!=null?request.getParameter("f_name"):"";
		 l_name = request.getParameter("l_name")!=null?request.getParameter("l_name"):"";
		 email = request.getParameter("email")!=null?request.getParameter("email"):"";
		 password = request.getParameter("password")!=null?request.getParameter("password"):"";
		 ug_degree = request.getParameter("ug_degree")!=null?request.getParameter("ug_degree"):null;
		 pg_degree = request.getParameter("pg_degree")!=null?request.getParameter("pg_degree"):null;
		 gender = request.getParameter("gender")!=null?request.getParameter("gender"):"";
		 dob = request.getParameter("dob")!=null?request.getParameter("dob"):"";
		 session_id = request.getParameter("session_id")!=null?request.getParameter("session_id"):"";
		 mobile = request.getParameter("mobile")!=null?request.getParameter("mobile"):"0";
		 avaiable_time = request.getParameter("avaiable_time")!=null?request.getParameter("avaiable_time"):"";
		 teaching_address = request.getParameter("teaching_address")!=null?request.getParameter("teaching_address"):"";
		 address_line1 = request.getParameter("address_line1")!=null?request.getParameter("address_line1"):"";
		 address_line2 = request.getParameter("address_line2")!=null?request.getParameter("address_line2"):"";
		 pincode = request.getParameter("pincode")!=null?Integer.parseInt(request.getParameter("pincode")):0;
		 experince_months =  request.getParameter("experince_months")!=null?request.getParameter("experince_months"):"";
		 experince_years = request.getParameter("experince_years")!=null?request.getParameter("experince_years"):"";
		 String presentor[] = email.split("@");
		 String part1 = presentor[0];
		 String part2 = presentor[1];
		 String presentor_email = part1+"_presenter@"+part2;
		
		 JSONParser parser = new JSONParser();
		 JSONObject obj;
		
	  try {
			dob =dateformatto.format(dateformatfrom.parse(dob));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 if(ug_degree!=null){
			  has_ug_degree = true;
			
		 }if(pg_degree!=null){
			 
			  has_pg_degree = true;
		 }
		 
		 
		
           
            
           String sql = "INSERT INTO address ( 	ID, 	addressline1, 	addressline2, 	pincode_id, 	address_geo_longitude, 	address_geo_latitude ) VALUES 	( 		(SELECT max(id)+1 FROM address), 		'"+address_line1+"', 		'"+address_line2+"', 		 "+pincode+", 		 NULL, 		 NULL 	)RETURNING ID;";
            
            System.err.println(sql);
            int address_id = db.executeUpdateReturn(sql);
            
             
            sql = "INSERT INTO student ( 	ID, 	email, 	gender, 	is_verified, 	istar_authorization_token, 	mobile, 	NAME, 	PASSWORD, 	token_expired, 	token_verified, 	user_type, 	father_name, 	mother_name, 	address_id, 	organization_id, 	phone, 	image_url, 	created_at, 	is_master,   signup_status ) VALUES 	( 		(SELECT max(id)+1 FROM student), 		'"+email+"', 		'"+gender+"', 		't', 		NULL, 		'"+mobile+"', 		'"+f_name+"', 		'"+password+"', 		NULL, 		NULL, 		'STUDENT', 		'Not Provided', 		'Not Provided', 		"+address_id+", 		'2', 		'7597049836', 		'/video/android_images/"+f_name.toUpperCase().charAt(0)+".png', 		NULL, 		'f',    'SIGNED_UP' 	)RETURNING ID;";
	
            System.err.println(sql);
            int trainer_id = db.executeUpdateReturn(sql);
            
            
         
            
             sql = "INSERT INTO student_profile_data (student_id, firstname, lastname, dob, mobileno, gender, pincode, aadharno, email, yop_10, marks_10, yop_12, marks_12, has_under_graduation, under_graduation_specialization_name, under_gradution_marks, has_post_graduation, post_graduation_specialization_name, post_gradution_marks, is_studying_further_after_degree, job_sector, preferred_location, company_name, position, duration, description, interested_in_type_of_course, area_of_interest, image_url_10, image_url_12, profile_image, id, under_graduate_degree_name, pg_degree_name, resume_url, user_category,work_exp_year,work_exp_month) "
    				+ "VALUES ('"+trainer_id+"', '"+f_name+" ', '"+l_name+"', '"+dob+"', '"+mobile+"', '"+gender+"', NULL, '0', '"+email+"', NULL, NULL, NULL, NULL, '"+has_ug_degree+"', 'NOT PROVIDED', NULL, '"+has_pg_degree+"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/video/android_images/"+f_name.toUpperCase().charAt(0)+".png', (Select max(id)+1 from student_profile_data), '"+ug_degree+"', '"+pg_degree+"', NULL, NULL,'"+experince_years+"','"+experince_months+"');";
    		
             System.err.println(sql);
             db.executeUpdate(sql);
    		 
    		
    		 
    		 
    		 if(!session_id.equalsIgnoreCase("")){
    			 
    			 String sqqql ="INSERT INTO trainer_assessment ( 	ID, 	trainer_id, 	created_at, 	eventminute, 	eventhour, 	status, 	assessment_id ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM trainer_assessment), 		"+trainer_id+", 		now(), 		'10', 		0, 		'SCHEDULED', 		'10578' 	);";


    			 System.err.println(sqqql);
	    		 db.executeUpdate(sqqql);
    			 
    			 String[] session_ids =session_id.split(",");
    			
    			for(String sId:session_ids){  
    				
    				String ssqql = "SELECT 	assessment. ID as assessment_id, assessment.assessmentdurationminutes as assessment_min FROM 	cmsession, 	lesson, 	assessment WHERE 	lesson.session_id = cmsession. ID AND assessment.lesson_id = lesson. ID AND lesson.dtype = 'ASSESSMENT' AND cmsession. ID ="+sId;
    				List<HashMap<String, Object>> data = db.executeQuery(ssqql);
    				 if (data.size() > 0) {
    		     		  for (HashMap<String, Object> row : data) {
    		     			  
    		     			int assessment_id = (int) row.get("assessment_id");
    		     			int assessment_min = (int) row.get("assessment_min");
    		     			  
    		    				 sqqql ="INSERT INTO trainer_assessment ( 	ID, 	trainer_id, 	created_at, 	eventminute, 	eventhour, 	status, 	assessment_id ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM trainer_assessment), 		"+trainer_id+", 		now(), 		"+assessment_min+", 		0, 		'SCHEDULED', 		"+assessment_id+" 	);";


    		        			 System.err.println(sqqql);
    		    	    		 db.executeUpdate(sqqql);
    		     		  
    		     		  }
    		     	 }
    			
    			
    			}  
    			 
    		 }else{
    			 
    			 
    			 String sqqql ="INSERT INTO trainer_assessment ( 	ID, 	trainer_id, 	created_at, 	eventminute, 	eventhour, 	status, 	assessment_id ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM trainer_assessment), 		"+trainer_id+", 		now(), 		'10', 		0, 		'SCHEDULED', 		'10578' 	);";


    			 System.err.println(sqqql);
	    		 db.executeUpdate(sqqql);
    			 
    			 
    		 }
    		 
            if(!teaching_address.equalsIgnoreCase("")){
            try {
    				obj = (JSONObject) parser.parse(teaching_address);
    				
    				for(Object obja:obj.keySet()){
    					System.out.println(obja+"--->"+obj.get(obja).toString());
    					
    					String ssql = "INSERT INTO trainer_prefred_location ( 	ID, 	trainer_id, 	marker_id, 	prefred_location ) VALUES 	((SELECT COALESCE(max(id)+1,1) FROM trainer_prefred_location), "+trainer_id+", '"+obja.toString()+"', '"+obj.get(obja).toString()+"');";
    					
    					System.err.println(ssql);
    		    		 db.executeUpdate(ssql);
    				}
    				 
    				 
    			} catch (Exception e1) {
    				
    				e1.printStackTrace();
    			}
    		 
            
            }
            
            if(!avaiable_time.equalsIgnoreCase("")){
            	
            	
				
           	 try {
    				obj = (JSONObject) parser.parse(avaiable_time);
    				
    				for(Object obja:obj.keySet()){
    					System.out.println(obja+"--->"+obj.get(obja).toString());
    					boolean t8am_9am = false;
    					boolean t9am_10am= false;
    					boolean t10am_11am= false;
    					boolean t11am_12pm= false;
    					boolean t12pm_1pm= false;
    					boolean t1pm_2pm= false;
    					boolean t2pm_3pm= false;
    					boolean t4pm_5pm= false;
    					boolean t3pm_4pm= false;
    					boolean t5pm_6pm= false;
    					
    					String day = obja.toString();
    					
    					String[] times =obj.get(obja).toString().split("##");
    					
    					for(String time:times){  
    						
    					 System.err.println("day>>>> "+day+" time>>>>> "+time);
    				    
    					 if(time.equalsIgnoreCase("8:00 AM-9:00 AM")){
							t8am_9am = true;
						}
						if(time.equalsIgnoreCase("9:00 AM-10:00 AM")){
							t9am_10am= true;
						}
						if(time.equalsIgnoreCase("10:00 AM-11:00 AM")){
							t10am_11am= true;
						}
						if(time.equalsIgnoreCase("11:00 AM-12:00 PM")){
							t11am_12pm= true;
						}
						if(time.equalsIgnoreCase("12:00 PM-1:00 PM")){
							t12pm_1pm= true;
						}
						if(time.equalsIgnoreCase("1:00 PM-2:00 PM")){
							t1pm_2pm= true;
						}
						if(time.equalsIgnoreCase("2:00 PM-3:00 PM")){
							t2pm_3pm= true;
						}
						if(time.equalsIgnoreCase("3:00 PM-4:00 PM")){
							t3pm_4pm= true;
						}
						if(time.equalsIgnoreCase("4:00 PM-5:00 PM")){
							t4pm_5pm= true;
						}
						if(time.equalsIgnoreCase("5:00 PM-6:00 PM")){
							t5pm_6pm= true;
						}
						
    					 
    					} 
						
    					String ssql = "INSERT INTO trainer_available_time_sloat ( 	ID, 	trainer_id, 	DAY, 	t8am_9am, 	t9am_10am, 	t10am_11am, 	t11am_12pm, 	t12pm_1pm, 	t1pm_2pm, 	t2pm_3pm, 	t3pm_4pm, 	t4pm_5pm, 	t5pm_6pm ) VALUES 	( 		(SELECT COALESCE(max(id)+1,1) FROM trainer_available_time_sloat), 	  "+trainer_id+", 		'"+day+"', 		'"+t8am_9am+"', 		'"+t9am_10am+"', 		'"+t10am_11am+"', 		'"+t11am_12pm+"', 		'"+t12pm_1pm+"', 		'"+t1pm_2pm+"', 		'"+t2pm_3pm+"', 		'"+t3pm_4pm+"', 		'"+t4pm_5pm+"', 		'"+t5pm_6pm+"' 	);";

    					
    					System.err.println(ssql);
    		    		 db.executeUpdate(ssql);
    				}
    				 
    				 
    			} catch (Exception e1) {
    				
    				e1.printStackTrace();
    				response.sendRedirect("../master_trainer/index.jsp");
    			}
           	
			 
		 }
		 
		 response.sendRedirect("../master_trainer/index.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
