package com.istarindia.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.istarindia.apps.dao.DBUTILS;

public class MasterTrainerService {

	DBUTILS db = new DBUTILS();

	public List<HashMap<String, Object>> getAllTrainerDetails() {

		String tariner_details_sql = "SELECT DISTINCT 	student. ID AS sid, 	student.email AS semail, 	student. NAME AS sname, string_agg(DISTINCT assessment.assessmenttitle, ', ') as assessment_list FROM 	student, 	student_assessment, 	assessment WHERE 	student. ID = student_assessment.student_id AND student_assessment.assessment_id = assessment. ID AND assessment. ID IN ( 	10574, 	10578, 	10568, 	10565, 	10572, 	10566, 	10567, 	10577, 	10569, 	10571, 	10573, 	10570 ) GROUP BY sid,semail,sname ORDER BY 	sid;";
		List<HashMap<String, Object>> data = db.executeQuery(tariner_details_sql);

		return data;

	}

	public StringBuffer getAllCourse(int trainerID) {
		
		//SELECT cmsession.id,cmsession.title FROM module,cmsession WHERE module.id = cmsession.module_id and course_id = 67
		 String trainer_skills_sql = "SELECT course_skill FROM trainer_skill WHERE trainer_id = "+trainerID;
     	ArrayList<String> arrayList = new ArrayList();
     	List<HashMap<String, Object>> data8 = db.executeQuery(trainer_skills_sql);
     	
     	  if (data8.size() > 0) {
     		  for (HashMap<String, Object> row8 : data8) {
     		  arrayList.add(row8.get("course_skill").toString());
     		  }
     	 }
		
		
		
		
		
		
		String course_sql = "SELECT id,course_name FROM course;";

		List<HashMap<String, Object>> data = db.executeQuery(course_sql);
		StringBuffer out = new StringBuffer();
		out.append("<option value=''>Select Course...</option>");
		for (HashMap<String, Object> item : data) {
			String selected ="";
    		if(arrayList.contains(item.get("id").toString())) {
    			selected = "selected";
    		}
			out.append("<option "+selected+" value='" + item.get("id") + "'>" + item.get("course_name") + "</option>");
		}
		out.append("");
		return out;
	}

	public List<HashMap<String, Object>> getAllAssessmentPerTrainer(int trainerID) {

		String assessment_sql = "SELECT DISTINCT assessment_id,assessmenttitle FROM student_assessment,assessment WHERE student_assessment.assessment_id = assessment.id AND student_id = "
				+ trainerID + "";

		List<HashMap<String, Object>> data = db.executeQuery(assessment_sql);

		return data;

	}
	
	public List<HashMap<String, Object>> getAllAssessmentTrainer(int trainerID) {

		String assessment_sql = "SELECT DISTINCT assessment_id,assessmenttitle FROM student_assessment,assessment WHERE student_assessment.assessment_id = assessment.id AND student_id = "
				+ trainerID + "";

		List<HashMap<String, Object>> data = db.executeQuery(assessment_sql);

		return data;

	}

	public List<HashMap<String, Object>> getCommentsAndOtherDetailsPerTrainer(int trainerID) {

		String trainer_comments_sql = "SELECT DISTINCT 	master_trainer_feedback.COMMENT, 	master_trainer_feedback.is_selected,master_trainer_feedback.interview_status FROM 	master_trainer_feedback WHERE  master_trainer_feedback.trainer_id = "
				+ trainerID;

		List<HashMap<String, Object>> data = db.executeQuery(trainer_comments_sql);

		return data;

	}

	public StringBuffer getTrainerBriefDetails(int trainerID, int assessmentID) {

		String totalans_sql = "SELECT 	student.NAME, 	CAST ( 		COUNT (*) FILTER (  			WHERE 				student_assessment.correct = 't' 		) AS VARCHAR 	) AS totalcorrectquestion, 	CAST (COUNT(*) AS VARCHAR) AS totalquestion FROM 	student_assessment, 	student WHERE 	student_assessment.student_id = student. ID AND student_assessment.assessment_id = "
				+ assessmentID + " AND student. ID = " + trainerID + " GROUP BY student.NAME";

		List<HashMap<String, Object>> data = db.executeQuery(totalans_sql);

		StringBuffer out = new StringBuffer();

		for (HashMap<String, Object> row : data) {
			String user_name = (String) row.get("name");
			String total_question = (String) row.get("totalquestion");
			String total_correctquestion = (String) row.get("totalcorrectquestion");

			out.append(" <h3 class='list-group-item-heading'>" + user_name + " Has Scored " + total_correctquestion
					+ "  Out Of " + total_question + " Question</h3>");

		}
		out.append("");
		return out;

	}
	public StringBuffer getTrainerNotAttendedDetails(int trainerID) {

		String totalans_sql = "SELECT string_agg(assessmenttitle, ', ') as assessment_list, student.name FROM 	trainer_assessment, assessment, student WHERE 	assessment_id NOT IN ( 		SELECT 			assessment_id 		FROM 			student_assessment 		WHERE 			student_id = "+trainerID+" 	) AND trainer_assessment.assessment_id = assessment.id AND student.id = trainer_assessment.trainer_id AND trainer_assessment.trainer_id = "+trainerID+" GROUP BY student.name";

		List<HashMap<String, Object>> data = db.executeQuery(totalans_sql);

		StringBuffer out = new StringBuffer();
       
		for (HashMap<String, Object> row : data) {
			String user_name = (String) row.get("name");
			String assessment_list = (String) row.get("assessment_list");
			

			out.append(" <h3 class='list-group-item-heading'>" + user_name + " Has Not Attended:  " + assessment_list + "</h3>");

		}
		
		out.append("");
		return out;

	}

	public  StringBuffer getTrainerQuestionDetailsPerTrainer(int trainerID,int assessmentID) {

		int userselectedoption = 0;
		
		StringBuffer out = new StringBuffer();
		String question_sql = "SELECT question.id, question.question_text FROM assessment_question,question WHERE assessment_question.questionid = question.id AND assessment_question.assessmentid ="+assessmentID;
		List<HashMap<String, Object>> data = db.executeQuery(question_sql);
		 if (data.size() > 0) {
			 int i=1;
		
		
		for (HashMap<String, Object> row : data) {
			
			String question_text = (String)row.get("question_text");
			int question_id = (int)row.get("id");
			out.append("<div class='m-t-sm m-l-sm'><span class='badge badge-info'>"+i+++"</span></div>");
			out.append("<h3 style='margin: 10px;'><strong class='m-l-sm' id="+question_id+"><p>"+question_text.replaceAll("style=\"width:100%\"", "style=\"width:30%\"")+"</p> </strong></h3>");
			
			
			String student_sql ="SELECT correct,option1,option2,option3,option4,option5 FROM student_assessment WHERE student_assessment.assessment_id = "+assessmentID+" AND student_assessment.question_id = "+question_id+" AND student_assessment.student_id="+trainerID;
			
			List<HashMap<String, Object>> data2 = db.executeQuery(student_sql); 
			
			if (data2.size() > 0) {
				
				
				
				if (!data2.get(0).get("correct").toString().equalsIgnoreCase("true")){
					
					userselectedoption = -1;
					
					for (HashMap<String, Object> row2 : data2) {
						
		if (row2.get("option1").toString().equalsIgnoreCase("true")){
			userselectedoption = 1;		
		}
		if (row2.get("option2").toString().equalsIgnoreCase("true")){
			userselectedoption = 2;	
		}
		if (row2.get("option3").toString().equalsIgnoreCase("true")){
			userselectedoption = 3;	
		}
		if (row2.get("option4").toString().equalsIgnoreCase("true")){
			userselectedoption = 4;	
		}

					
					}
					
				}
				
			}
			
			String options_sql = "SELECT assessment_option.id,assessment_option.text,assessment_option.marking_scheme FROM assessment_option WHERE assessment_option.question_id ="+question_id+"ORDER BY assessment_option.id";
			
			List<HashMap<String, Object>> data1 = db.executeQuery(options_sql);
			if (data1.size() > 0) {
				 int j=0;
				
				 out.append("<div class='m-t-sm m-l-sm'>");
			
					for (HashMap<String, Object> row1 : data1) {
						
						String options_text = (String)row1.get("text");
						int marking_scheme = (int)row1.get("marking_scheme");
						
						String addclass = marking_scheme==0?"alert custom_bg":"alert alert-success";

						out.append("<div class="+addclass+"><b><p>"+options_text+"</p></b></div>");

				  
					
					}if(userselectedoption != 0){
						
						if(userselectedoption != -1){
							
							
							out.append("<div class='alert alert-danger'><b>Answered By User:"+(data1.get(userselectedoption-1).get("text")).toString().replaceAll("<p>", "").replaceAll("</p>", "")+"</b></div>");	
							 	
							
							
							
						}else{
							
							
							
							out.append("<div class='alert alert-warning'><b><p>User Skipped This Question</p></b></div>");
							 
							
							
						}
						
					}
					

					out.append("</div>");
			
			 }
			out.append("</div>");
			
			
		}
		
		
		
		 }
		
          out.append("");
	          return out;

		}

}