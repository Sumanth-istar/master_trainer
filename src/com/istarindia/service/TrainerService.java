package com.istarindia.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.istarindia.apps.dao.DBUTILS;

public class TrainerService {

	DBUTILS db = new DBUTILS();

	public StringBuffer getAllAssessmentForTrainer(String trainerID) {
		
		String  ssqqll = "SELECT 	CAST (COUNT (*) AS INTEGER) as tot_ass, CAST (count(*) filter (where trainer_assessment.status ='ATTENDED') AS INTEGER) as attended_ass FROM 	trainer_assessment WHERE 	trainer_id ="+trainerID;
		List<HashMap<String, Object>> data3 = db.executeQuery(ssqqll);

		if (data3.size() > 0) {

			int tot_ass = (int) data3.get(0).get("tot_ass");
			int attended_ass = (int) data3.get(0).get("attended_ass");
			if (tot_ass == attended_ass) {
				
				String sqqll = "UPDATE student SET  signup_status = 'ASSESSMENT COMPLETED' WHERE 	(ID = "+trainerID+");";
				 System.err.println(sqqll);
	  			 db.executeUpdate(sqqll);
			}
		}
		

		String trainer_skills_sql = "SELECT assessment.id,assessment.assessmentdurationminutes as min,COALESCE(assessment.assessmentdurationhours,0)as hrs,assessment.assessmenttitle FROM trainer_assessment,assessment WHERE assessment.id = trainer_assessment.assessment_id AND trainer_id ="
				+ Integer.parseInt(trainerID);
		StringBuffer out = new StringBuffer();

		List<HashMap<String, Object>> data = db.executeQuery(trainer_skills_sql);

		if (data.size() > 0) {
			for (HashMap<String, Object> row : data) {
				String assessmenttitle = row.get("assessmenttitle").toString();
				int hrs = (int) row.get("hrs");
				int min = (int) row.get("min");
				int assessment_id = (int) row.get("id");
				String adddisableclass = "";
				String scoredetails = "Click to take Assessment.";
				String sqlq = "SELECT cast (count(*) as INTEGER) as count, CAST (count(*) filter (where student_assessment.correct ='t') AS INTEGER) as correct_ans FROM student_assessment WHERE student_id = "
						+ trainerID + " AND assessment_id =" + assessment_id;
				System.err.println(sqlq);
				List<HashMap<String, Object>> data2 = db.executeQuery(sqlq);

				if (data2.size() > 0) {

					int count = (int) data2.get(0).get("count");
					int correct_ans = (int) data2.get(0).get("correct_ans");
					if (count > 0) {
						adddisableclass = "disabled";
						scoredetails = "your score " + correct_ans + " / " + count;
					}
				}

				out.append("<div class='col-md-3'><div class='ibox'><div class='ibox-content product-box'>"
						+ "<div class='product-imitation'>[ Assessment ]</div><div class='product-desc'><a href='#' class='product-name'>"
						+ assessmenttitle + "</a><small class='text-muted'>Assessment Duration: " + hrs + " h :" + min
						+ " m </small><div class='small m-t-xs'>" + scoredetails + "</div>"
						+ "<div class='m-t text-righ'><a href='/master_trainer/trainer/assessment.jsp?assessment_id="
						+ assessment_id + "&trainer_id=" + trainerID + "' class='btn btn-xs btn-outline btn-primary "
						+ adddisableclass
						+ "'>Launch <i class='fa fa-long-arrow-right'></i> </a></div></div></div></div> </div>");

			}
		}

		out.append("");

		return out;
	}

	public StringBuffer getAssessmentForTrainer(int assessment_id) {

		String trainer_skills_sql = "SELECT assessment.number_of_questions,assessment.assessmentdurationminutes as min,COALESCE(assessment.assessmentdurationhours,0)as hrs,assessment.assessmenttitle FROM assessment WHERE id ="
				+ assessment_id;
		StringBuffer out = new StringBuffer();

		List<HashMap<String, Object>> data = db.executeQuery(trainer_skills_sql);

		if (data.size() > 0) {
			for (HashMap<String, Object> row : data) {
				String assessmenttitle = row.get("assessmenttitle").toString();
				int hrs = (int) row.get("hrs");
				int min = (int) row.get("min");
				int number_of_questions = (int) row.get("number_of_questions");

				out.append("<h2 style='margin-left: 31px;'>" + assessmenttitle
						+ "</h2><h4 style='margin-left: 31px;' class='text-muted'>Assessment Duration: " + hrs + " h :"
						+ min + " m And Total no of Questions:" + number_of_questions + "</h4>");

			}
		}

		out.append("");

		return out;
	}

	public StringBuffer getAllQuestionForTrainer(int assessment_id) {

		StringBuffer out = new StringBuffer();
		String sql = "SELECT 	question.id as q_id,   question.question_text as q_text,question.duration_in_sec as q_time FROM 	question, 	assessment_question WHERE 	question.id = assessment_question.questionid AND assessment_question.assessmentid = "
				+ assessment_id + " ORDER BY question.id ASC";

		List<HashMap<String, Object>> data = db.executeQuery(sql);

		if (data.size() > 0) {
			int i = 1;
			String display = "display:block;";
			String animation = "slideInRight";

			for (HashMap<String, Object> row : data) {
				String q_text = row.get("q_text").toString();
				int q_id = (int) row.get("q_id");
				int q_time = (int) row.get("q_time");

				if (i > 1) {
					display = "display:none;";
					animation = "";
				}

				out.append(" <div style ='" + display + "'  id='" + q_id
						+ "_animation_box' class='ibox float-e-margins white-bg animated " + animation + " question_"
						+ i + "'>    "
						+ "                 <div class='ibox-title'><div class='m-t-sm m-l-sm'><span class='badge badge-info'>"
						+ i + "</span></div><div class='m-t-sm m-l-sm'><span class='badge badge-info question_timer_"
						+ i + " pull-right' data-time='" + q_time + "'>Question Time in sec: " + q_time
						+ "</span></div><h2> " + q_text.replaceAll("style=\"width:100%\"", "style=\"width:20%\"")
						+ "</h2></div>           ");

				String ssql = "SELECT 	ID as ans_id, 	TEXT as ans_text, marking_scheme FROM 	assessment_option WHERE 	assessment_option.question_id = "
						+ q_id + " ORDER BY 	ID ASC";

				List<HashMap<String, Object>> data1 = db.executeQuery(ssql);

				if (data1.size() > 0) {
					int j = 1;
					for (HashMap<String, Object> row1 : data1) {
						String ans_text = row1.get("ans_text").toString();
						int ans_id = (int) row1.get("ans_id");
						int marking_scheme = (int) row1.get("marking_scheme");

						out.append(
								"          <div  class='ibox-content text-center css-animation-box' >                                         "
										+ "          <div class='row'>                         "
										+ "    <div class='col-sm-6 text-center'>  <label style='float: left;'> <input style='margin-right: 20px;'type='radio' data-option=option_"
										+ i + "  value='" + marking_scheme + "' id='" + ans_id
										+ "' class='options' name='optionsRadios'>"
										+ ans_text.replaceAll("<p>", "").replaceAll("</p>", "")
										+ "</label>  </div>                                              "
										+ "    </div>                      </div>               ");

						j++;
					}
				}
				out.append("  </div>");

				i++;
			}
		}

		out.append("");

		return out;

	}

	public List<HashMap<String, Object>> getAllTrainerDetails(int trainerID) {

		String sql = "SELECT 	student_profile_data.firstname, 	student_profile_data.lastname, 	student_profile_data.email, 	cast(student_profile_data.dob as varchar), 	cast(student_profile_data.mobileno as varchar), 	student_profile_data.under_graduate_degree_name, 	student_profile_data.pg_degree_name, student_profile_data.gender, address.addressline1, address.addressline2, address.pincode_id FROM 	student, 	student_profile_data,   address WHERE 	student. ID = student_profile_data.student_id AND address.id =student.address_id AND student. ID ="
				+ trainerID;

		System.out.println(sql);
		List<HashMap<String, Object>> data = db.executeQuery(sql);
		
		return data;

	}

	public List<HashMap<String, Object>> getAllTrainerSessions(int trainerID) {

		String sql = "SELECT 	cmsession. ID FROM 	trainer_assessment, 	assessment, 	lesson, 	cmsession WHERE 	assessment. ID = trainer_assessment.assessment_id AND assessment.lesson_id = lesson. ID AND cmsession. ID = lesson.session_id AND trainer_id = "+trainerID;
		List<HashMap<String, Object>> data1 = db.executeQuery(sql);
		return data1;
	}

	public List<HashMap<String, Object>> getAllTrainerAvaTime(int trainerID) {

		String sql = "SELECT 	DAY, 	t8am_9pm, 	t9am_10am, 	t10am_11am, 	t11am_12pm, 	t12pm_1pm, 	t1pm_2pm, 	t2pm_3pm, 	t3pm_4pm, 	t4pm_5pm, 	t5pm_6pm FROM 	trainer_available_time_sloat WHERE 	trainer_id ="
				+ trainerID;
		List<HashMap<String, Object>> data2 = db.executeQuery(sql);
		if (data2.size() > 0) {

			for (HashMap<String, Object> row2 : data2) {

			}

		}

		return data2;
	}

	public List<HashMap<String, Object>> getAllTrainerPrefredLocation(int trainerID) {

		String sql = "SELECT marker_id FROM trainer_prefred_location WHERE trainer_id=" + trainerID;
		List<HashMap<String, Object>> data3 = db.executeQuery(sql);
		return data3;
	}

}
