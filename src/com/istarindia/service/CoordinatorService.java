package com.istarindia.service;

import java.util.HashMap;
import java.util.List;

import com.istarindia.apps.dao.DBUTILS;

public class CoordinatorService {
	
	DBUTILS db = new DBUTILS();
	
	public  List<HashMap<String, Object>> getAllTrainerStatusDetails(){
		
	String sql = "SELECT 	T1.s_id, 	T1.s_email, 	T1.s_name, 	COALESCE (T1.s_comment, '') AS s_comment, 	CAST(COUNT (*) FILTER (  		WHERE 			T1.s_status = 'SIGNED_UP' 	) AS INTEGER )AS SIGNED_UP, 	CAST(COUNT (*) FILTER (  		WHERE 			T1.s_status = 'ASSESSMENT_COMPLETED' 	) AS INTEGER ) AS ASSESSMENT_COMPLETED, 	CAST(COUNT (*) FILTER (  		WHERE 			T1.s_status = 'INTERVIEW_COMPLETED' 	) AS INTEGER ) AS INTERVIEW_COMPLETED, 	CAST(COUNT (*) FILTER (  		WHERE 			T1.s_status = 'DEMO_COMPLETED' 	) AS INTEGER ) AS DEMO_COMPLETED FROM 	( 		SELECT DISTINCT 			student. ID AS s_id, 			student.email AS s_email, 			student. NAME AS s_name, 			master_trainer_feedback. COMMENT AS s_comment, 			student.signup_status AS s_status 		FROM 			student 		LEFT JOIN student_assessment ON ( 			student. ID = student_assessment.student_id 		) 		LEFT JOIN master_trainer_feedback ON ( 			master_trainer_feedback.trainer_id = student. ID 		) 		LEFT JOIN trainer_assessment ON ( 			trainer_assessment.trainer_id = student. ID 		) 		LEFT JOIN assessment ON ( 			assessment. ID = trainer_assessment.assessment_id 		) 		WHERE 			assessment. ID IN ( 				10574, 				10578, 				10568, 				10565, 				10572, 				10566, 				10567, 				10577, 				10569, 				10571, 				10573, 				10570 			) 	) T1 GROUP BY 	T1.s_id, 	T1.s_email, 	T1.s_name, 	T1.s_comment";
	
	List<HashMap<String, Object>> data = db.executeQuery(sql);
	
	
	return data;
	}
	
	public  List<HashMap<String, Object>> getAllTrainerBycourseDetails(){
	String sql ="SELECT DISTINCT 	pre_l1_info.session_id, 	pre_l1_info.city,   cmsession.title,   pre_l1_info.pre_l1_data, COUNT (*) FILTER (  		WHERE 			student.signup_status = 'SIGNED_UP' 	) AS SIGNED_UP, 	COUNT (*) FILTER (  		WHERE 			student.signup_status = 'ASSESSMENT_COMPLETED' 	) AS ASSESSMENT_COMPLETED, 	COUNT (*) FILTER (  		WHERE 			student.signup_status = 'INTERVIEW_COMPLETED' 	) AS INTERVIEW_COMPLETED, 	COUNT (*) FILTER (  		WHERE 			student.signup_status = 'DEMO_COMPLETED' 	) AS DEMO_COMPLETED FROM  pre_l1_info,  cmsession,   pincode  LEFT JOIN address on ( pincode.id = address.pincode_id)  LEFT JOIN student on ( student.address_id = address.id)  WHERE 	pre_l1_info.city = pincode.city AND cmsession. ID = pre_l1_info.session_id GROUP BY pre_l1_info.session_id, 	pre_l1_info.city,   cmsession.title,pre_l1_info.pre_l1_data";

	List<HashMap<String, Object>> data = db.executeQuery(sql);
	
	
	return data;
	}
	
	
	public  List<HashMap<String, Object>> getAllTrainerPreL1Details(int sessionID, String city){
		String sql ="SELECT cast(pre_l1_data as varchar) as pre_l1_data  FROM pre_l1_info WHERE city ='"+city.toLowerCase()+"'  AND session_id ="+sessionID;

		List<HashMap<String, Object>> data = db.executeQuery(sql);
		
		
		return data;
		}
}
